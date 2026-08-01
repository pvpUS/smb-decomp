#!/usr/bin/env python3
"""Grep original asm for a regex and report whether each hit's function is
already converted to C (and in which src file).

usage: python findconv.py '<regex>' [max]
Run from the module tree root.
"""
import glob
import os
import re
import sys

TREE = os.getcwd()


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
    pat = re.compile(sys.argv[1])
    lim = int(sys.argv[2]) if len(sys.argv) > 2 else 200
    conv = converted_labels()
    n = 0
    for path in sorted(glob.glob(os.path.join(TREE, 'asm', 'nonmatchings',
                                              '**', '*.s'), recursive=True)):
        lines = open(path, encoding='utf-8', errors='replace').read().splitlines()
        for i, l in enumerate(lines):
            if pat.search(l):
                lbl = os.path.basename(path)[:-2]
                c = conv.get(lbl, '')
                print('%-16s %-46s line %-5d %s' % (
                    lbl, os.path.relpath(path, TREE), i, c or 'ASM'))
                n += 1
                if n >= lim:
                    return


if __name__ == '__main__':
    main()
