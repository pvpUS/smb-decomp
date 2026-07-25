#!/usr/bin/env python3
"""Merge a module's work from its warm copy back into the main tree, then prove it.

Parallel REL work happens in isolated warm copies under C:/tmp/smbm/<module>
(builds collide in a shared tree). This brings one back and verifies it, in the
only way that counts: rebuild in the MAIN tree and gate on the golden sha1.

What moves
----------
  src/<mod>*.c          the converted C (stale files are deleted first, so
                        renumbered splits do not leave orphans behind)
  asm/<mod>.s           the data blob -- CHANGED when tools/rel_carve.py has
                        carved constant holes for pure-C objects
  asm/<mod>_d*.s        data continuation segments, created by rel_carve.py.
                        Run 2's merge-back predates carving and does not know
                        about these; forgetting them silently breaks the build.
  Makefile SOURCES      the module's block, in .text order, including the
                        interleaved data objects that carving introduces

asm/nonmatchings/<mod>/ is deterministic from the split and is NOT copied.
Never copy *.rel/.plf/.elf/.map/.o -- those are build outputs (and gitignored
game binaries).

Verification (both are required)
--------------------------------
  1. Rebuild the REL in the main tree and compare to the golden sha1.
  2. Confirm the pure-C files really contain C. An all-asm split ALSO hashes
     golden, so the hash alone does NOT prove the conversions survived.

usage: python tools/rel_merge_back.py <module> [<module> ...] [--dry-run]
       python tools/rel_merge_back.py --all
"""
import glob
import os
import re
import shutil
import subprocess
import sys

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
WARM = 'C:/tmp/smbm'

# Three names per module, and they are NOT always the same:
#   warm dir   the C:/tmp/smbm/<dir> the agent worked in
#   stem       the src/<stem>*.c / asm/<stem>.s / asm/nonmatchings/<stem>/ prefix
#   target     the built artifact, which is also the Makefile SOURCES block header
# sel_ngc is the odd one out on all three counts; option/test_mode drop the
# "rel_" infix the minigames carry.
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

# The native CW tools need a real TMP, and make/gcc live in msys2, so the build
# has to go through `bash -lc`.  Pass it as an ARGV LIST, never shell=True:
# on Windows shell=True means cmd.exe, which does not understand the single
# quotes around the script and hands bash a mangled argv.  That failed silently
# with rc 255 and no output, so verify() would go on to hash whatever .rel was
# already on disk -- reporting GOLDEN without having built anything.  The whole
# point of this tool is to catch that class of lie, so it must not commit it.
BASH = 'C:/msys64/usr/bin/bash.exe'
BUILD_SCRIPT = (
    'export DEVKITPPC=/c/devkitPro/devkitPPC PATH="/mingw64/bin:$PATH" '
    'TMP=C:/tmp TEMP=C:/tmp; cd /c/smbwork; '
    'make OS=Windows_NT COMPILER_VERSION=1.1 HOSTCC=gcc CC_CHECK=true {target}'
)


def golden(module):
    tgt = MODULES[module][1]
    for line in open(os.path.join(REPO, 'supermonkeyball.sha1')):
        h, _, name = line.strip().partition(' ')
        if name.strip().lstrip('*') == tgt:
            return h, tgt
    sys.exit('no golden sha1 for %s' % tgt)


def sources_block(makefile_text, module):
    """The module's SOURCES entries, in order."""
    L = makefile_text.split('\n')
    h = next(i for i, l in enumerate(L)
             if l.strip() == '# %s sources' % MODULES[module][1])
    s = h + 1
    e = next(i for i in range(s + 1, len(L)) if not L[i].rstrip().endswith('\\'))
    return [L[i].rstrip().rstrip('\\').strip() for i in range(s + 1, e + 1)]


def replace_sources(module, items):
    mk = os.path.join(REPO, 'Makefile')
    raw = open(mk, newline='').read()
    nl = '\r\n' if '\r\n' in raw else '\n'          # main tree may be CRLF
    L = raw.split(nl)
    h = next(i for i, l in enumerate(L)
             if l.strip() == '# %s sources' % MODULES[module][1])
    s = h + 1
    e = next(i for i in range(s + 1, len(L)) if not L[i].rstrip().endswith('\\'))
    block = ['SOURCES := \\'] + \
            ['\t%s%s' % (it, ' \\' if i < len(items) - 1 else '')
             for i, it in enumerate(items)]
    L[s:e + 1] = block
    open(mk, 'w', newline='').write(nl.join(L))


def merge(module, dry):
    stem = MODULES[module][0]
    src_root = os.path.join(WARM, module)
    if not os.path.isdir(src_root):
        print('  !! no warm copy at %s' % src_root)
        return False

    warm_c = sorted(glob.glob(os.path.join(src_root, 'src', '%s*.c' % stem)))
    warm_asm = sorted(glob.glob(os.path.join(src_root, 'asm', '%s.s' % stem)) +
                      glob.glob(os.path.join(src_root, 'asm', '%s_d*.s' % stem)))
    items = sources_block(open(os.path.join(src_root, 'Makefile'),
                               newline='').read().replace('\r\n', '\n'), module)
    print('  %d C files, %d asm data file(s), %d SOURCES entries'
          % (len(warm_c), len(warm_asm), len(items)))
    carved = [os.path.basename(p) for p in warm_asm if '_d' in os.path.basename(p)]
    if carved:
        print('  carved data segments: %s' % ', '.join(carved))

    if dry:
        return True

    # stale C and stale data segments first, so renumbered splits leave nothing
    for p in glob.glob(os.path.join(REPO, 'src', '%s_*.c' % stem)):
        os.remove(p)
    for p in glob.glob(os.path.join(REPO, 'asm', '%s_d*.s' % stem)):
        os.remove(p)
    for p in warm_c:
        shutil.copy2(p, os.path.join(REPO, 'src', os.path.basename(p)))
    for p in warm_asm:
        shutil.copy2(p, os.path.join(REPO, 'asm', os.path.basename(p)))

    # Per-function bodies.  Usually deterministic and identical, but NOT always:
    #   - the first split of a module creates all of them, and without them
    #     every asm-include stub fails with "cannot be opened";
    #   - rel_rematch can re-split a fn-ptr-table handler out of the neighbour
    #     it had been merged into, which CHANGES that neighbour's body.
    # So sync by content, not by existence.  A copy-if-missing pass would leave
    # the shrunken neighbour stale in main while also adding the new handler --
    # the same instructions twice.  Compare with line endings normalised so the
    # warm copy's LF does not rewrite the whole tree as churn.
    warm_nm = os.path.join(src_root, 'asm', 'nonmatchings', stem)
    main_nm = os.path.join(REPO, 'asm', 'nonmatchings', stem)
    if os.path.isdir(warm_nm):
        os.makedirs(main_nm, exist_ok=True)
        added = changed = 0
        for name in os.listdir(warm_nm):
            src_p = os.path.join(warm_nm, name)
            dst_p = os.path.join(main_nm, name)
            if not os.path.exists(dst_p):
                shutil.copy2(src_p, dst_p)
                added += 1
                continue
            a = open(src_p, 'rb').read().replace(b'\r\n', b'\n')
            b = open(dst_p, 'rb').read().replace(b'\r\n', b'\n')
            if a != b:
                shutil.copy2(src_p, dst_p)
                changed += 1
        stale = sorted(set(os.listdir(main_nm)) - set(os.listdir(warm_nm)))
        if added:
            print('  copied %d new per-function asm bodies' % added)
        if changed:
            print('  updated %d per-function asm bodies whose content changed '
                  '(a re-split moved functions between them)' % changed)
        if stale:
            print('  !! %d body file(s) exist in main but not in the warm copy: '
                  '%s' % (len(stale), ', '.join(stale[:6])))

    replace_sources(module, items)
    return True


def verify(module):
    stem = MODULES[module][0]
    want, tgt = golden(module)
    print('  rebuilding %s in the main tree...' % tgt)
    # a failed compile leaves the previous .rel, and a stale all-asm .rel hashes
    # GOLDEN -- delete it so the hash below can only come from THIS build
    try:
        os.remove(os.path.join(REPO, tgt))
    except FileNotFoundError:
        pass
    r = subprocess.run([BASH, '-lc', BUILD_SCRIPT.format(target=tgt)],
                       cwd=REPO, capture_output=True, text=True)
    log = (r.stdout or '') + (r.stderr or '')
    if r.returncode != 0 or re.search(r'^#\s+Error|Errors caused tool to abort',
                                      log, re.M):
        print('  BUILD FAILED (rc %d):' % r.returncode)
        print('\n'.join('    ' + l for l in log.strip().split('\n')[-15:]))
        return False

    got = subprocess.run(['sha1sum', tgt], cwd=REPO, capture_output=True,
                         text=True).stdout.split()
    got = got[0] if got else '(build produced nothing)'
    ok = got == want
    print('  sha1 %s  %s' % (got, 'GOLDEN' if ok else 'MISMATCH (want %s)' % want))

    # the hash alone is not proof -- an all-asm split hashes golden too
    pure, stubs = 0, 0
    for p in glob.glob(os.path.join(REPO, 'src', '%s*.c' % stem)):
        n = open(p, errors='ignore').read().count(
            '#include "../asm/nonmatchings/%s/' % stem)
        pure += (n == 0)
        stubs += n
    print('  %d pure-C file(s), %d asm-include stub(s) remaining' % (pure, stubs))
    if ok and pure == 0:
        print('  !! golden but NO pure-C files -- the conversions did not survive')
        return False
    return ok


def main():
    args = sys.argv[1:]
    dry = '--dry-run' in args
    args = [a for a in args if not a.startswith('--')]
    mods = list(MODULES) if (not args or '--all' in sys.argv[1:]) else args
    unknown = [m for m in mods if m not in MODULES]
    if unknown:
        sys.exit('unknown module(s): %s\nknown: %s'
                 % (', '.join(unknown), ', '.join(MODULES)))

    results = {}
    for m in mods:
        print('\n=== %s ===' % m)
        if not merge(m, dry):
            results[m] = False
            continue
        results[m] = True if dry else verify(m)

    print('\n=== summary ===')
    for m, ok in results.items():
        print('  %-16s %s' % (m, 'OK' if ok else 'FAILED'))
    if not dry and all(results.values()):
        print('\nAll merged modules golden. Now run the full check:')
        print('  sha1sum -c supermonkeyball.sha1')
    if not all(results.values()):
        sys.exit(1)


if __name__ == '__main__':
    main()
