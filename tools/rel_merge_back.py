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
MODULES = ['mini_bowling', 'mini_race', 'mini_fight',
           'mini_pilot', 'mini_golf', 'mini_billiards']

BUILD = (
    "/c/msys64/usr/bin/bash.exe -lc 'export DEVKITPPC=/c/devkitPro/devkitPPC "
    'PATH="/mingw64/bin:$PATH" TMP=C:/tmp TEMP=C:/tmp; cd /c/smbwork; '
    "make OS=Windows_NT COMPILER_VERSION=1.1 HOSTCC=gcc CC_CHECK=true {target} "
    "2>&1 | tail -6'"
)


def golden(module):
    tgt = 'mkbe.rel_%s.rel' % module
    for line in open(os.path.join(REPO, 'supermonkeyball.sha1')):
        h, _, name = line.strip().partition(' ')
        if name.strip().lstrip('*') == tgt:
            return h, tgt
    sys.exit('no golden sha1 for %s' % tgt)


def sources_block(makefile_text, module):
    """The module's SOURCES entries, in order."""
    L = makefile_text.split('\n')
    h = next(i for i, l in enumerate(L)
             if l.strip() == '# mkbe.rel_%s.rel sources' % module)
    s = h + 1
    e = next(i for i in range(s + 1, len(L)) if not L[i].rstrip().endswith('\\'))
    return [L[i].rstrip().rstrip('\\').strip() for i in range(s + 1, e + 1)]


def replace_sources(module, items):
    mk = os.path.join(REPO, 'Makefile')
    raw = open(mk, newline='').read()
    nl = '\r\n' if '\r\n' in raw else '\n'          # main tree may be CRLF
    L = raw.split(nl)
    h = next(i for i, l in enumerate(L)
             if l.strip() == '# mkbe.rel_%s.rel sources' % module)
    s = h + 1
    e = next(i for i in range(s + 1, len(L)) if not L[i].rstrip().endswith('\\'))
    block = ['SOURCES := \\'] + \
            ['\t%s%s' % (it, ' \\' if i < len(items) - 1 else '')
             for i, it in enumerate(items)]
    L[s:e + 1] = block
    open(mk, 'w', newline='').write(nl.join(L))


def merge(module, dry):
    src_root = os.path.join(WARM, module)
    if not os.path.isdir(src_root):
        print('  !! no warm copy at %s' % src_root)
        return False

    warm_c = sorted(glob.glob(os.path.join(src_root, 'src', '%s*.c' % module)))
    warm_asm = sorted(glob.glob(os.path.join(src_root, 'asm', '%s.s' % module)) +
                      glob.glob(os.path.join(src_root, 'asm', '%s_d*.s' % module)))
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
    for p in glob.glob(os.path.join(REPO, 'src', '%s_*.c' % module)):
        os.remove(p)
    for p in glob.glob(os.path.join(REPO, 'asm', '%s_d*.s' % module)):
        os.remove(p)
    for p in warm_c:
        shutil.copy2(p, os.path.join(REPO, 'src', os.path.basename(p)))
    for p in warm_asm:
        shutil.copy2(p, os.path.join(REPO, 'asm', os.path.basename(p)))
    replace_sources(module, items)
    return True


def verify(module):
    want, tgt = golden(module)
    print('  rebuilding %s in the main tree...' % tgt)
    subprocess.run(BUILD.format(target=tgt), shell=True, cwd=REPO)
    got = subprocess.run(['sha1sum', tgt], cwd=REPO, capture_output=True,
                         text=True).stdout.split()
    got = got[0] if got else '(build produced nothing)'
    ok = got == want
    print('  sha1 %s  %s' % (got, 'GOLDEN' if ok else 'MISMATCH (want %s)' % want))

    # the hash alone is not proof -- an all-asm split hashes golden too
    pure, stubs = 0, 0
    for p in glob.glob(os.path.join(REPO, 'src', '%s*.c' % module)):
        n = open(p, errors='ignore').read().count(
            '#include "../asm/nonmatchings/%s/' % module)
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
    mods = MODULES if (not args or '--all' in sys.argv[1:]) else args

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
