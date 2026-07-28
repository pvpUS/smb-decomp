#!/usr/bin/env python3
"""Build one REL and score one function against its original -- without lying.

Every run of this project so far has produced FICTIONAL match results, and in
run 5 four separate agents hit the same three traps independently, costing
hours each. This exists so nobody writes a fourth broken harness.

The traps, all of which report a confident wrong answer rather than an error:

  1. `subprocess.run(cmd, shell=True)` on Windows goes through cmd.exe, which
     cannot run a command starting with `/c/msys64/...`. It sets a returncode,
     prints nothing, and raises nothing. A harness that checks `if 'Error' in
     stdout` passes on the empty output, so NO BUILD EVER HAPPENS and the diff
     scores the previous .plf. The tell is a sweep where wildly different
     sources all score identically.
  2. A failed compile leaves the previous .o in place. If that .o was the
     asm-include build, the per-function diff reports a perfect match that is
     fiction.
  3. make's timestamp granularity skips recompiles on rapid successive edits,
     which produces the same stale-object lie during a fast sweep.

So this: argv list (never shell=True), delete the .o and the .rel first, and
refuse to report a score unless the build output actually contains the
`Compiling src/<file>` line for the file under test and rel_fdiff actually
emitted a verdict line.

usage:
  python tools/rel_sweep.py <module> --file src/mini_fight_45.c --label lbl_0000F2C8
  python tools/rel_sweep.py <module> --file src/x.c --label lbl_Y --sweep variants/
  python tools/rel_sweep.py <module> --file src/x.c --label lbl_Y --tree C:/tmp/smbm/mini_fight
  python tools/rel_sweep.py <module> --gate

--sweep takes a directory of candidate bodies, tries each in turn as <file>,
restores the original afterwards, and prints a ranked table.

--gate is the ONLY thing that may be used to claim a match. A per-function diff
of 0 is necessary, not sufficient: it is computed from a build that reuses every
sibling object, and run 6 hit a non-golden REL with `git status` completely clean
because one sibling's stale .o survived make's 1-second granularity. --gate
deletes EVERY object of the module plus the .rel and .plf, rebuilds from that,
and compares the sha1 against supermonkeyball.sha1. Nothing else is a gate.

Trap 4, learned in run 6: --sweep's restore used to be shutil.move of a copy2
backup, so the restored .c carried its ORIGINAL mtime -- older than the last
variant's .o -- and every subsequent build silently linked the last variant.
The restore now stamps mtime and drops the object. The general rule: anything
that copies or restores a .c must stamp its mtime, and any golden gate must
delete objects first.
"""
import argparse
import glob
import hashlib
import os
import re
import shutil
import subprocess
import sys

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
BASH = 'C:/msys64/usr/bin/bash.exe'

# warm dir -> (src/asm stem, build target); see rel_merge_back.MODULES
MODULES = {
    'mini_bowling':   ('mini_bowling',   'mkbe.rel_mini_bowling.rel'),
    'mini_race':      ('mini_race',      'mkbe.rel_mini_race.rel'),
    'mini_fight':     ('mini_fight',     'mkbe.rel_mini_fight.rel'),
    'mini_pilot':     ('mini_pilot',     'mkbe.rel_mini_pilot.rel'),
    'mini_golf':      ('mini_golf',      'mkbe.rel_mini_golf.rel'),
    'mini_billiards': ('mini_billiards', 'mkbe.rel_mini_billiards.rel'),
    'sel_ngc':        ('sel_ngc_rel',    'mkbe.sel_ngc.rel'),
    'option':         ('option',         'mkbe.option.rel'),
    'test_mode':      ('test_mode',      'mkbe.test_mode.rel'),
}

SCRIPT = (
    'export DEVKITPPC=/c/devkitPro/devkitPPC PATH="/mingw64/bin:$PATH" '
    'TMP={tmp} TEMP={tmp}; cd "{tree}"; '
    'make OS=Windows_NT COMPILER_VERSION=1.1 HOSTCC=gcc CC_CHECK=true {target}'
)

FAILED = 9999


class BuildError(Exception):
    pass


def plf_of(target):
    """mkbe.rel_mini_golf.rel -> mkbe.rel_mini_golf.plf

    Only the SUFFIX may change. A plain .replace('.rel', '.plf') also rewrites
    the `mkbe.rel_` prefix the minigames carry, yielding mkbe.plf_mini_golf.plf.
    """
    return re.sub(r'\.rel$', '.plf', target)


def msys(path):
    """C:/tmp/x -> /c/tmp/x"""
    p = path.replace('\\', '/')
    if len(p) > 1 and p[1] == ':':
        p = '/' + p[0].lower() + p[2:]
    return p


def assert_c_definition(target_c, stem, label):
    """Refuse to score a label the file under test does not define in C.

    Trap 5, found by mini_fight in run 7: point --file at a file that does not
    contain --label and this prints a clean `MATCH (0 diffs)`. The label's real
    asm stub sits untouched in some other file and trivially matches itself, so
    the verdict is about that stub, not about the file you named. A forward
    declaration does not count -- that is exactly what fooled it.
    """
    try:
        with open(target_c, encoding='utf-8', errors='replace') as f:
            txt = f.read()
    except OSError as e:
        raise BuildError('cannot read %s: %s' % (target_c, e))

    inc = 'nonmatchings/%s/%s.s' % (stem, label)
    if inc in txt:
        raise BuildError(
            '%s still #includes %s, so %s is an ASM STUB here and any MATCH is '
            'trivial.' % (target_c, inc, label))

    m = re.search(r'(\w[\w \t*]*?)\b%s\s*\([^;{]*\)\s*\{' % re.escape(label), txt)
    if not m:
        raise BuildError(
            '%s does not DEFINE %s -- a forward declaration does not count. '
            'Scoring would report on whichever other file holds the stub, and '
            'that reports MATCH (trap 5).' % (target_c, label))
    if re.search(r'\basm\b', m.group(1)):
        raise BuildError('%s defines %s as an `asm` function; a MATCH is trivial.'
                         % (target_c, label))


def module_objects(tree, stem):
    """Every object make could link for this module."""
    return (glob.glob(os.path.join(tree, 'src', '%s*.c.o' % stem)) +
            glob.glob(os.path.join(tree, 'asm', '%s*.s.o' % stem)))


def build(tree, target, tmp, watch_file, stem=None):
    """Build, and prove it actually compiled watch_file. Returns the log.

    With `stem`, drops every object of the module rather than just the one
    under test -- slow, but the only honest basis for a golden-hash claim.
    """
    junk = [os.path.join(tree, target), os.path.join(tree, plf_of(target))]
    junk += (module_objects(tree, stem) if stem
             else [os.path.join(tree, watch_file + '.o')])
    for j in junk:
        try:
            os.remove(j)
        except FileNotFoundError:
            pass

    r = subprocess.run(
        [BASH, '-lc', SCRIPT.format(tmp=tmp, tree=msys(tree), target=target)],
        cwd=tree, capture_output=True, text=True)
    log = (r.stdout or '') + (r.stderr or '')

    if not log.strip():
        raise BuildError(
            'build produced NO OUTPUT (rc %d). This is trap 1: the command '
            'never ran. Never use shell=True on Windows.' % r.returncode)
    if re.search(r'^#\s+Error|Errors caused tool to abort', log, re.M):
        tail = '\n'.join(log.strip().split('\n')[-12:])
        raise BuildError('compile error:\n' + tail)
    if watch_file:
        base = watch_file.replace('\\', '/').split('/')[-1]
        if not re.search(r'Compiling\s+\S*' + re.escape(base), log):
            raise BuildError(
                '%s was never recompiled (trap 2/3: stale object). Any diff now '
                'describes the PREVIOUS build.' % watch_file)
    if not os.path.exists(os.path.join(tree, target)):
        raise BuildError('build finished but %s does not exist' % target)
    return log


def score(tree, stem, target, label):
    """Diff count for one function, or FAILED if rel_fdiff gave no verdict."""
    env = dict(os.environ, FDIFF_MODULE=stem)
    plf = plf_of(target)
    r = subprocess.run([sys.executable, os.path.join(REPO, 'tools', 'rel_fdiff.py'),
                        plf, label],
                       cwd=tree, capture_output=True, text=True, env=env)
    out = (r.stdout or '') + (r.stderr or '')
    if 'MATCH' in out:
        return 0, out
    m = re.search(r'(\d+)\s*diff', out)
    if m:
        return int(m.group(1)), out
    return FAILED, out + '\n(no MATCH/DIFF verdict -- treat as no result)'


OBJDUMP = 'C:/devkitPro/devkitPPC/bin/powerpc-eabi-objdump.exe'


def section_audit(tree, stem):
    """Non-.text sections in each of the module's objects.

    sel_ngc, run 7: rel_fdiff locates a function by symbol, so a per-function
    MATCH survives things that wreck the module layout -- an extra out-of-line
    copy of a helper declared plain `static` instead of `static inline`, or an
    unexpected .rodata. Both pass the per-function gate while the REL hashes
    non-golden, with nothing to point at.

    Run 6's rule makes this readable: a pure-C object that reads pool constants
    EXTERNALLY emits no .rodata at all, so .rodata on a converted object means
    either a real int->float conversion (which needs a carve) or something
    unintended -- `#include <math.h>` alone emits 16 bytes for an inline sqrt's
    0.5 and 3.0, and that cost sel_ngc a golden hash.
    """
    rows = []
    for obj in sorted(module_objects(tree, stem)):
        r = subprocess.run([OBJDUMP, '-h', obj], capture_output=True, text=True)
        secs = []
        for m in re.finditer(r'^\s*\d+\s+(\.\S+)\s+([0-9a-f]+)', r.stdout, re.M):
            name, size = m.group(1), int(m.group(2), 16)
            if size and name not in ('.text', '.comment', '.debug_info'):
                if not name.startswith(('.debug', '.rela', '.line', '.stab')):
                    secs.append('%s 0x%x' % (name, size))
        if secs:
            rows.append((os.path.basename(obj), secs))
    return rows


def golden_sha1(target):
    """The expected hash for one artifact, from the repo's manifest."""
    with open(os.path.join(REPO, 'supermonkeyball.sha1')) as f:
        for line in f:
            parts = line.split()
            if len(parts) == 2 and parts[1] == target:
                return parts[0]
    return None


def gate(tree, stem, target, tmp):
    """Full rebuild from DELETED objects, then compare against the manifest."""
    want = golden_sha1(target)
    if want is None:
        print('no manifest entry for %s -- cannot gate' % target)
        return 2
    n = len(module_objects(tree, stem))
    print('deleting %d module object(s) and rebuilding %s from scratch...'
          % (n, target))
    try:
        build(tree, target, tmp, None, stem=stem)
    except BuildError as e:
        print('NO RESULT -- %s' % e)
        return 2
    with open(os.path.join(tree, target), 'rb') as f:
        got = hashlib.sha1(f.read()).hexdigest()
    if got == want:
        print('GOLDEN  %s  %s' % (got, target))
        return 0
    print('NOT GOLDEN\n  got  %s\n  want %s' % (got, want))
    rows = section_audit(tree, stem)
    if rows:
        print('\nobjects carrying non-.text sections -- a converted pure-C object\n'
              'reading its pool externally should have NONE:')
        for name, secs in rows:
            print('  %-34s %s' % (name, ', '.join(secs)))
        print('Expect only the module stub and any carve-hole owner here. An\n'
              'unexpected .rodata is usually an int->float conversion needing a\n'
              'carve, or an #include that emitted constants (math.h emits 16\n'
              'bytes for an inline sqrt even if unused).')
    return 1


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('module', choices=sorted(MODULES))
    ap.add_argument('--file', help='the .c under test, repo-relative')
    ap.add_argument('--label', help='function to score')
    ap.add_argument('--tree', help='defaults to C:/tmp/smbm/<module>')
    ap.add_argument('--tmp', help='defaults to C:/tmp/tmp_<module>')
    ap.add_argument('--sweep', help='directory of candidate bodies to try')
    ap.add_argument('--install-best', action='store_true',
                    help='leave the best-scoring variant in place afterwards '
                         'instead of restoring the pre-sweep file')
    ap.add_argument('--gate', action='store_true',
                    help='rebuild with ALL module objects deleted and check the '
                         'golden sha1; the only valid proof of a match')
    args = ap.parse_args()

    stem, target = MODULES[args.module]
    tree = args.tree or 'C:/tmp/smbm/%s' % args.module
    tmp = args.tmp or 'C:/tmp/tmp_%s' % args.module

    if args.gate:
        return gate(tree, stem, target, tmp)
    if not (args.file and args.label):
        ap.error('--file and --label are required unless --gate is given')
    target_c = os.path.join(tree, args.file)

    if not args.sweep:
        try:
            assert_c_definition(target_c, stem, args.label)
            build(tree, target, tmp, args.file)
        except BuildError as e:
            print('NO RESULT -- %s' % e)
            return 2
        n, out = score(tree, stem, target, args.label)
        print(out.strip())
        print('\n%s: %s' % (args.label, 'MATCH' if n == 0 else '%d diffs' % n))
        return 0 if n == 0 else 1

    variants = sorted(f for f in os.listdir(args.sweep) if f.endswith('.c'))
    if not variants:
        sys.exit('no .c variants in %s' % args.sweep)
    backup = target_c + '.sweepbak'
    shutil.copy2(target_c, backup)
    results = []
    try:
        for v in variants:
            shutil.copy2(os.path.join(args.sweep, v), target_c)
            try:
                assert_c_definition(target_c, stem, args.label)
                build(tree, target, tmp, args.file)
                n, _ = score(tree, stem, target, args.label)
            except BuildError as e:
                n = FAILED
                print('  %-40s BUILD FAILED: %s' % (v, str(e).split('\n')[0]))
            results.append((n, v))
            if n != FAILED:
                print('  %-40s %s' % (v, 'MATCH' if n == 0 else '%d' % n))
    finally:
        # Trap 4.  shutil.move of a copy2 backup restores the ORIGINAL mtime,
        # which is older than the last variant's .o, so make skips the recompile
        # and every later build links that variant instead of the file on disk.
        best = min(results)[1] if results and min(results)[0] != FAILED else None
        if args.install_best and best:
            shutil.copyfile(os.path.join(args.sweep, best), target_c)
        else:
            shutil.copyfile(backup, target_c)
        os.utime(target_c, None)
        os.remove(backup)
        try:
            os.remove(target_c + '.o')
        except FileNotFoundError:
            pass

    print('\n=== ranked ===')
    for n, v in sorted(results):
        print('  %-6s %s' % ('MATCH' if n == 0 else (n if n != FAILED else 'FAIL'), v))

    # An all-identical column USED to exit 2 as trap 1's signature. It is a false
    # alarm: build() already refuses to score a file it cannot see `Compiling` for,
    # so trap 1 is closed by construction, and canonical variant sets legitimately
    # score alike -- in run 6 this fired 3-6 times per agent, including on a set
    # where all 12 permutations MATCHed. Advisory only now; gate on --gate.
    real = [n for n, _ in results if n != FAILED]
    if len(real) > 1 and len(set(real)) == 1 and real[0] != 0:
        print('\n(note: every variant scored %d. Usually means mwcc canonicalises '
              'these spellings. To prove the builds are real, add a deliberately '
              'wrong control variant and confirm it scores differently.)' % real[0])
    # Trap 6, run 7 (mini_bowling): the sweep RESTORES the pre-sweep content when
    # it finishes, so a winning variant is discarded and the file on disk is the
    # asm stub again. Its first "9 matches" gate ran with one file silently
    # reverted. Never let that be silent.
    if best is None:
        pass
    elif args.install_best:
        print('\ninstalled the best variant: %s -> %s' % (best, args.file))
    else:
        win = os.path.join(args.sweep, best).replace('\\', '/')
        dst = target_c.replace('\\', '/')
        print('\n!! %s HAS BEEN RESTORED to its pre-sweep content -- the winning\n'
              '   variant is NOT installed. Install it before gating:\n'
              "     cp '%s' '%s' && rm -f '%s.o'\n"
              '   or re-run with --install-best.' % (args.file, win, dst, dst))

    if not any(n == 0 for n, _ in results):
        return 1
    print('\na MATCH here is NOT a match. Confirm with: '
          'python tools/rel_sweep.py %s --gate' % args.module)
    return 0


if __name__ == '__main__':
    sys.exit(main())
