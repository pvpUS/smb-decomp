#!/usr/bin/env python3
"""Score a directory of variants over a REAL LINK, splitting the residual into
its GPR half and its FPR half.

Four modules independently built this in run 18 and it was decisive in three of
them, so it belongs in tools/ rather than being rewritten a fifth time.

WHY THE SPLIT IS THE POINT
--------------------------
A single aligned count cannot tell you *which* register file is wrong, so a
sweep can spend a whole run pushing on the wrong axis. Running all four blinds
per variant answers that in one pass:

    plain   every difference
    F       GPRs blinded  -> what remains is the FPR/structural residual
    G       FPRs blinded  -> what remains is the GPR/structural residual
    GF      both blinded  -> what remains is genuinely structural

mini_race read "11 diffs, all FPR" and "4 diffs, all GPR" off this table and
stopped sweeping the wrong axis on each; that is what converted lbl_00007800
(64) after four runs stuck at 11. mini_golf used the same split to show
lbl_00023AB4's 13 is 8 FPR + 5 GPR.

  GF 0 in 0 with a large plain score = pure register numbering.
  GF == plain                        = nothing is numbering; it is structural.

usage:
  python tools/rel_gfscan.py <module> <variant-dir> <label> [owner.c]
    <variant-dir>  directory of whole-file .c variants (a sweep dir)
    <owner.c>      tree-relative; defaults to the file that defines <label>

  --blinds g,f,gf   override the blind set (default: plain,F,G,GF)
  --keep-best       leave the best-scoring variant installed instead of
                    restoring (still refuses if it would delete banked work)

The owner is restored byte-for-byte at the end and on Ctrl-C. Run it with
NATIVE Windows python (msys2 has none); it shells out to msys2 only for `make`.

SCORES COME FROM rel_ablind, SO ITS LIMITS APPLY: accuracy falls with
relocation density, and the number is meaningless until the variant's
instruction count is exact. Read that docstring before trusting a call-heavy
function's figure.
"""
import os
import re
import subprocess
import sys

TREE = os.getcwd()

MODULES = {
    'mini_bowling':   ('mini_bowling',   'mkbe.rel_mini_bowling'),
    'mini_race':      ('mini_race',      'mkbe.rel_mini_race'),
    'mini_fight':     ('mini_fight',     'mkbe.rel_mini_fight'),
    'mini_pilot':     ('mini_pilot',     'mkbe.rel_mini_pilot'),
    'mini_golf':      ('mini_golf',      'mkbe.rel_mini_golf'),
    'mini_billiards': ('mini_billiards', 'mkbe.rel_mini_billiards'),
    'sel_ngc':        ('sel_ngc_rel',    'mkbe.sel_ngc'),
    'option':         ('option',         'mkbe.option'),
    'test_mode':      ('test_mode',      'mkbe.test_mode'),
}

MSYS = 'C:/msys64/usr/bin/bash.exe'
SCORE_RX = re.compile(r'blind=\S*\s+(\d+ in \d+)\s+span (\S+)')
DEF_RX = re.compile(r'^(?:static\s+)?(?:asm\s+)?[A-Za-z_][\w\s\*]*?\b'
                    r'(lbl_[0-9A-Fa-f]+|_prolog|_epilog|_unresolved)\s*\([^;{]*\)\s*$')
ASMDEF_RX = re.compile(r'^(?:static\s+)?asm\s')


def c_defs(path):
    """Original-name functions this file defines in pure C (i.e. conversions)."""
    try:
        with open(path, errors='replace') as f:
            text = f.read()
    except OSError:
        return set()
    return {DEF_RX.match(l).group(1) for l in text.split('\n')
            if DEF_RX.match(l) and not ASMDEF_RX.match(l)}


def find_owner(stem, label):
    """The src file that DEFINES `label` -- as C, or as an asm-include stub.

    A bare `label in text` test is useless here: every file in a module carries
    forward declarations for its siblings, so it matches all 157 of them.
    """
    import glob
    inc = '/asm/nonmatchings/%s/%s.s"' % (stem, label)
    hits = []
    for p in sorted(glob.glob(os.path.join(TREE, 'src', '%s*.c' % stem))):
        with open(p, errors='replace') as f:
            lines = f.read().split('\n')
        owns = any(inc in l for l in lines) or any(
            DEF_RX.match(l) and DEF_RX.match(l).group(1) == label
            and not ASMDEF_RX.match(l) for l in lines)
        if owns:
            hits.append(os.path.relpath(p, TREE).replace('\\', '/'))
    if len(hits) != 1:
        shown = ', '.join(hits[:8]) + (' ...' if len(hits) > 8 else '')
        sys.exit('rel_gfscan: cannot pin %s to one owner (%d found)%s\n'
                 'pass it explicitly as the 4th argument.'
                 % (label, len(hits), ': ' + shown if hits else ''))
    return hits[0]


def main():
    argv = [a for a in sys.argv[1:]]
    blinds = ['', 'F', 'G', 'GF']
    keep_best = False
    rest = []
    i = 0
    while i < len(argv):
        a = argv[i]
        if a == '--blinds' and i + 1 < len(argv):
            i += 1
            blinds = ['' if b in ('plain', 'none') else b
                      for b in argv[i].split(',')]
        elif a == '--keep-best':
            keep_best = True
        elif a.startswith('-'):
            sys.exit('rel_gfscan: unknown option %r' % a)
        else:
            rest.append(a)
        i += 1
    if len(rest) < 3:
        sys.exit(__doc__.strip().splitlines()[0] + '\n\nusage: python '
                 'tools/rel_gfscan.py <module> <variant-dir> <label> [owner.c]')

    mod, vdir, label = rest[0], rest[1], rest[2]
    if mod not in MODULES:
        sys.exit('rel_gfscan: %r is not a module.\n  known: %s'
                 % (mod, ', '.join(sorted(MODULES))))
    stem, art = MODULES[mod]
    plf = os.path.join(TREE, art + '.plf')
    owner = rest[3] if len(rest) > 3 else find_owner(stem, label)
    op = os.path.join(TREE, owner)
    if not os.path.isdir(vdir):
        sys.exit('rel_gfscan: no such variant directory: %s' % vdir)
    if not os.path.isfile(op):
        sys.exit('rel_gfscan: no such owner: %s' % op)

    variants = [f for f in sorted(os.listdir(vdir)) if f.endswith('.c')]
    if not variants:
        sys.exit('rel_gfscan: no .c variants in %s' % vdir)

    with open(op, 'rb') as f:
        saved = f.read()
    banked = c_defs(op)

    # A variant generated from an older snapshot can be missing conversions the
    # owner has banked since. The scan restores, so nothing is destroyed -- but
    # the scores would be measured against a tree that silently lost a function.
    for v in variants:
        lost = banked - c_defs(os.path.join(vdir, v))
        if lost:
            print('!! %s is MISSING %d C definition(s) the owner has: %s'
                  % (v, len(lost), ', '.join(sorted(lost))))
            print('   Its scores are measured against a tree with that work '
                  'removed. Regenerate the variants from the CURRENT owner.')
            print()
            break

    make = ('export DEVKITPPC=/c/devkitPro/devkitPPC PATH="/mingw64/bin:$PATH" '
            'TMP=C:/tmp/tmp_%s TEMP=C:/tmp/tmp_%s; cd "%s"; '
            'make OS=Windows_NT COMPILER_VERSION=1.1 HOSTCC=gcc CC_CHECK=true %s'
            % (mod, mod, TREE.replace('\\', '/'), art + '.plf'))

    def score(blind):
        env = dict(os.environ)
        env['PCMP_REGBLIND'] = blind
        r = subprocess.run([sys.executable, 'tools/rel_ablind.py',
                            '--module', mod, label],
                           cwd=TREE, capture_output=True, text=True, env=env)
        m = SCORE_RX.search(r.stdout)
        return (m.group(1), m.group(2)) if m else ('?', '?')

    names = ['plain' if b == '' else b for b in blinds]
    print('%-34s %s  %s' % ('variant',
                            ' '.join('%9s' % n for n in names), 'span(1st)'))
    results = []
    try:
        for v in variants:
            with open(os.path.join(vdir, v), 'rb') as f:
                body = f.read()
            with open(op, 'wb') as f:
                f.write(body)
            for junk in (op + '.o', plf):
                if os.path.exists(junk):
                    os.remove(junk)
            r = subprocess.run([MSYS, '-lc', make], capture_output=True, text=True)
            if not os.path.exists(plf):
                print('%-34s BUILD FAIL' % v)
                tail = (r.stdout or r.stderr or '')[-500:]
                print('    ' + tail.replace('\n', '\n    ').strip())
                continue
            row = [score(b) for b in blinds]
            print('%-34s %s  %s'
                  % (v, ' '.join('%9s' % c for c, _ in row), row[0][1]))
            try:
                results.append((int(row[0][0].split()[0]), v))
            except ValueError:
                pass
    finally:
        best = min(results)[1] if results else None
        if keep_best and best:
            lost = banked - c_defs(os.path.join(vdir, best))
            if lost:
                with open(op, 'wb') as f:
                    f.write(saved)
                print('\n!! --keep-best REFUSED: %s would delete %s. '
                      'Owner restored.' % (best, ', '.join(sorted(lost))))
            else:
                with open(os.path.join(vdir, best), 'rb') as f:
                    keep = f.read()
                with open(op, 'wb') as f:
                    f.write(keep)
                print('\nleft %s installed in %s -- GATE IT.' % (best, owner))
        else:
            with open(op, 'wb') as f:
                f.write(saved)
            print('\nowner restored (%d bytes)%s'
                  % (len(saved),
                     '; best was %s' % best if best else ''))
        if os.path.exists(op + '.o'):
            os.remove(op + '.o')
    return 0


if __name__ == '__main__':
    sys.exit(main())
