#!/usr/bin/env python3
"""Windowed two-instruction pattern search across ALL modules' original asm,
reporting whether each hit's function is already converted to C.

This is findfold.py's mechanism with the pattern taken from the command line
instead of hard-coded.  Two regexes are matched against consecutive
INSTRUCTIONS (not lines) within a window; \\1 \\2 ... in the second regex refer
to groups captured by the first.

usage: python findwin.py '<re1>' '<re2>' [window] [max]
example -- a byte load whose sign-extension goes to a DIFFERENT register:
  python findwin.py 'lbz r(\\d+), \\S+' 'extsb r(?!\\1\\b)\\d+, r\\1\\b' 4

Run from the module tree root.
"""
import glob
import os
import re
import sys

TREE = os.getcwd()
INSN = re.compile(r'/\* [0-9A-F]{8} [0-9A-F]{8} \*/\s+(.*)')


def converted_labels():
    defined = {}
    stub = set()
    for f in glob.glob(os.path.join(TREE, 'src', '*.c')):
        txt = open(f, encoding='utf-8', errors='replace').read()
        for m in re.finditer(r'nonmatchings/\w+/(lbl_[0-9A-Fa-f]+)\.s', txt):
            stub.add(m.group(1))
        for m in re.finditer(
                r'^\s*(?!asm\b)[\w \t*]+?\b(lbl_[0-9A-Fa-f]+)\s*\([^;{]*\)\s*\{',
                txt, re.M):
            defined.setdefault(m.group(1), os.path.basename(f))
    for s in stub:
        defined.pop(s, None)
    return defined


def main():
    r1 = re.compile(sys.argv[1])
    r2raw = sys.argv[2]
    W = int(sys.argv[3]) if len(sys.argv) > 3 else 4
    lim = int(sys.argv[4]) if len(sys.argv) > 4 else 400
    conv = converted_labels()
    hits = 0
    conv_hits = 0
    for path in sorted(glob.glob(os.path.join(TREE, 'asm', 'nonmatchings',
                                              '**', '*.s'), recursive=True)):
        txt = open(path, encoding='utf-8', errors='replace').read()
        insns = [m.group(1).strip() for m in
                 (INSN.match(l) for l in txt.splitlines()) if m]
        for i, ins in enumerate(insns):
            m1 = r1.match(ins)
            if not m1:
                continue
            pat2 = r2raw
            for gi, g in enumerate(m1.groups(), 1):
                pat2 = pat2.replace('\\%d' % gi, g or '')
            try:
                r2 = re.compile(pat2)
            except re.error as e:
                raise SystemExit('bad second regex after substitution: %s' % e)
            for j in range(i + 1, min(i + 1 + W, len(insns))):
                if r2.match(insns[j]):
                    lbl = os.path.basename(path)[:-2]
                    c = conv.get(lbl, '')
                    hits += 1
                    if c:
                        conv_hits += 1
                    print('%-16s insn %-5d %-34s | %-30s %s'
                          % (lbl, i, ins, insns[j], c or 'ASM'))
                    if hits >= lim:
                        print('... (limit)')
                        return
                    break
    print('%d hits, %d in converted C' % (hits, conv_hits))


if __name__ == '__main__':
    main()
