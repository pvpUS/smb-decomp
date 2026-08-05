#!/usr/bin/env python3
"""Grep original asm for a regex and report whether each hit's function is
already converted to C (and in which src file).

usage: python tools/rel_findconv.py '<regex>' [max] [--tree T] [--allow-empty]

This is the idiom-hunting tool: find every asm site that looks like the
construct you are chasing, and see which of them live in a function somebody
has ALREADY matched -- those are the ones whose C source tells you the answer.
`--tree` defaults to THIS CHECKOUT, not to `os.getcwd()`; see below.

------------------------------------------------------------------------------
RUN 21: THREE SILENT-FAILURE DEFECTS FIXED HERE
------------------------------------------------------------------------------
All three were the same shape -- a confident, clean, WRONG-BUT-EMPTY answer --
and all three are the class that cost run 20 real work (`rel_vsplice` silently
ignored every variant not named `*.txt`, exited 0, and mini_pilot lost every
real-link figure of the run to it).

1. **`TREE = os.getcwd()`, with no `--tree`.**  Run it from anywhere but a
   module tree root and it greps nothing, prints nothing, and exits 0.  This is
   the FIFTH tool in this project to carry the tree-defaulting defect the
   standing rules call out -- four earlier ones defaulted to the ORCHESTRATOR's
   tree, so agents following the brief measured somebody else's files.  `--tree`
   now defaults to the checkout this script lives in, which is always the right
   tree for the agent running it, and is overridable.

2. **Zero hits was indistinguishable from "wrong tree" / "tool did not run".**
   A grep legitimately finds nothing, so this cannot just hard-error -- instead
   it now says WHERE it looked and HOW MUCH it read, and exits non-zero unless
   you pass `--allow-empty`.  An empty result you asked for is a result; an
   empty result you did not is a bug report.

3. **No arguments raised a raw `IndexError` traceback** instead of printing the
   usage.  Cosmetic next to the other two, but it is what a first-time user
   hits, and a traceback reads as "this tool is broken" rather than "you did
   not give me a pattern".

Also: the tree is now VALIDATED (it must actually contain `asm/nonmatchings/`),
so a typo'd `--tree` is an error rather than a silent empty scan.
"""
import argparse
import glob
import os
import re
import sys

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


def converted_labels(tree):
    """-> {label: src file} for every label DEFINED in C, minus asm stubs.

    A label with an `#include "../asm/nonmatchings/.../lbl_X.s"` somewhere is
    still asm however its wrapper is spelled, so stubs are subtracted last.
    """
    defined = {}
    stub = set()
    for f in glob.glob(os.path.join(tree, 'src', '*.c')):
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
    ap = argparse.ArgumentParser(
        description='Grep asm for a regex; say which hits are already C.')
    ap.add_argument('regex', nargs='?', help='python regex, matched per line')
    ap.add_argument('max', nargs='?', type=int, default=200,
                    help='stop after this many hits (default 200)')
    ap.add_argument('--tree', default=REPO,
                    help='tree to scan (default: this checkout, NOT $PWD)')
    ap.add_argument('--allow-empty', action='store_true',
                    help='exit 0 when the pattern matches nothing')
    a = ap.parse_args()

    if not a.regex:
        ap.print_help()
        sys.exit('\nerror: no regex given')
    try:
        pat = re.compile(a.regex)
    except re.error as e:
        sys.exit('error: bad regex %r: %s' % (a.regex, e))

    root = os.path.join(a.tree, 'asm', 'nonmatchings')
    if not os.path.isdir(root):
        sys.exit('error: --tree %s has no asm/nonmatchings/ -- not a module '
                 'tree.\n       (default is this checkout: %s)'
                 % (a.tree, REPO))

    conv = converted_labels(a.tree)
    paths = sorted(glob.glob(os.path.join(root, '**', '*.s'), recursive=True))

    n = 0
    for path in paths:
        lines = open(path, encoding='utf-8',
                     errors='replace').read().splitlines()
        for i, l in enumerate(lines):
            if pat.search(l):
                lbl = os.path.basename(path)[:-2]
                c = conv.get(lbl, '')
                print('%-16s %-46s line %-5d %s' % (
                    lbl, os.path.relpath(path, a.tree), i, c or 'ASM'))
                n += 1
                if n >= a.max:
                    print('\n-- stopped at the %d-hit limit; pass a larger '
                          '`max` to see the rest' % a.max)
                    return

    # An empty result must never look like a successful scan.  Say where we
    # looked and how much we read, so "wrong tree" is distinguishable from
    # "this construct genuinely does not occur".
    if n:
        print('\n%d hit(s) in %d .s file(s) under %s' % (n, len(paths), root))
        return
    msg = ('no match for %r in %d .s file(s) under %s'
           % (a.regex, len(paths), root))
    if a.allow_empty:
        print(msg)
        return
    sys.exit('error: ' + msg + '\n       If that is the answer you wanted, '
             'pass --allow-empty. If it is not,\n       check --tree (default '
             'is this checkout, %s).' % REPO)


if __name__ == '__main__':
    main()
