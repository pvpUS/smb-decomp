#!/usr/bin/env python3
"""Per-function content hash of a module's built .plf, and a diff of two such
hashes -- the detector for silently-broken already-matched functions.

WHY THIS EXISTS.  Run 22 found two ways a build can be wrong while every check
this project has says it is right, and neither is visible to a per-function
score:

  * mini_golf's inject.py deleted a function's closing `#pragma opt_propagation
    reset` and leaked the pragma across the rest of the file.  `--gate` returned
    GOLDEN, `rel_structcheck` was CLEAN, and the function being installed scored
    MATCH -- the leak happened to be what THAT function needed.  An unrelated
    stored draft had silently gone 13-in-10 -> 42-in-17.
  * mini_pilot's first attempt at the 31-file TU merge reached RAW 0 on its
    target and broke EIGHT already-matched functions, four of which changed
    size.  `rel_ascore` looks at one function; nothing looked at the others.

Run 22 named this the missing check.  Run 23 used it to bisect that merge --
`118/118 identical` is what made the extension safe to keep -- and to prove that
retyping two `extern` declarations is codegen-neutral in every file that does
not USE the symbol.

Relocated fields are masked to zero by the linker in a .plf, so equal hashes
mean equal code MODULO relocation targets.  That is a real blind spot and it has
bitten this project once: run 22's mini_pilot draft was byte-identical in .text
and still not golden because an `R_PPC_ADDR16_HA lbl_0000BEE0` had become an
anonymous `@212`.  So this tool is a fast pre-filter, not a substitute for
`rel_sweep.py --gate`.

usage:
  python tools/rel_fnhash.py <module> <out.txt>          [--tree DIR]
  python tools/rel_fnhash.py --compare <a.txt> <b.txt>

The compare exits 1 if anything differs, so it drops straight into a script:
  python tools/rel_fnhash.py mini_pilot before.txt
  ...make a change, rebuild...
  python tools/rel_fnhash.py mini_pilot after.txt
  python tools/rel_fnhash.py --compare before.txt after.txt || echo BROKE
"""
import hashlib
import os
import re
import subprocess
import sys

MAIN = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OD = os.environ.get('OBJDUMP',
                    'C:/devkitPro/devkitPPC/bin/powerpc-eabi-objdump.exe')

# Three names per module and they diverge; the .plf basename follows the build
# TARGET, not the warm-dir name or the asm stem.  Getting this wrong hashes
# somebody else's module and reports a confident all-clear.
PLF = {
    'mini_bowling':   'mkbe.rel_mini_bowling.plf',
    'mini_race':      'mkbe.rel_mini_race.plf',
    'mini_fight':     'mkbe.rel_mini_fight.plf',
    'mini_pilot':     'mkbe.rel_mini_pilot.plf',
    'mini_golf':      'mkbe.rel_mini_golf.plf',
    'mini_billiards': 'mkbe.rel_mini_billiards.plf',
    'sel_ngc':        'mkbe.sel_ngc.plf',
    'option':         'mkbe.option.plf',
    'test_mode':      'mkbe.test_mode.plf',
}


def read(path):
    d = {}
    for line in open(path):
        p = line.split()
        if len(p) == 3:
            d[p[1]] = (p[0], int(p[2]))
    return d


def compare(a, b):
    A, B = read(a), read(b)
    gone = sorted(set(A) - set(B))
    new = sorted(set(B) - set(A))
    moved = sorted(n for n in set(A) & set(B) if A[n][0] != B[n][0])
    for n in gone:
        print('GONE     %s' % n)
    for n in new:
        print('NEW      %s' % n)
    for n in moved:
        sa, sb = A[n][1], B[n][1]
        note = '' if sa == sb else '   SIZE %d -> %d' % (sa, sb)
        print('CHANGED  %s%s' % (n, note))
    same = len(set(A) & set(B)) - len(moved)
    print('\n%d/%d identical, %d changed, %d gone, %d new'
          % (same, len(A), len(moved), len(gone), len(new)))
    return 1 if (gone or new or moved) else 0


def emit(mod, out, tree):
    if mod not in PLF:
        sys.exit('unknown module %r -- one of: %s'
                 % (mod, ', '.join(sorted(PLF))))
    plf = os.path.join(tree, PLF[mod])
    if not os.path.exists(plf):
        sys.exit('no %s -- build the module first (make %s)'
                 % (plf, PLF[mod].replace('.plf', '.rel')))

    syms = subprocess.run([OD, '-t', plf], capture_output=True, text=True).stdout
    fns = {}
    for line in syms.splitlines():
        p = line.split()
        if len(p) >= 6 and p[2] == 'F' and p[3] == '.text':
            try:
                fns[p[-1]] = (int(p[0], 16), int(p[-2], 16))
            except ValueError:
                pass
    if not fns:
        sys.exit('no .text function symbols in %s -- wrong file, or objdump '
                 'is not %s' % (plf, OD))

    dis = subprocess.run([OD, '-d', plf], capture_output=True, text=True).stdout
    words = {}
    for line in dis.splitlines():
        m = re.match(r'\s*([0-9a-f]+):\s+([0-9a-f]{2}) ([0-9a-f]{2}) '
                     r'([0-9a-f]{2}) ([0-9a-f]{2})', line)
        if m:
            words[int(m.group(1), 16)] = ''.join(m.group(2, 3, 4, 5))

    with open(out, 'w', newline='\n') as f:
        for name, (addr, size) in sorted(fns.items()):
            h = hashlib.sha1()
            for a in range(addr, addr + size, 4):
                h.update(words.get(a, '????').encode())
            f.write('%s %s %d\n' % (h.hexdigest()[:12], name, size))
    print('%d functions -> %s' % (len(fns), out))


def main():
    av = sys.argv[1:]
    if av[:1] == ['--compare']:
        if len(av) != 3:
            sys.exit(__doc__)
        sys.exit(compare(av[1], av[2]))
    tree = MAIN
    if '--tree' in av:
        i = av.index('--tree')
        tree = av[i + 1]
        del av[i:i + 2]
    if len(av) != 2:
        sys.exit(__doc__)
    emit(av[0], av[1], tree)


if __name__ == '__main__':
    main()
