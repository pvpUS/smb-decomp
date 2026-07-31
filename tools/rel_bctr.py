#!/usr/bin/env python3
"""rel_bctr.py -- enumerate what the census's `bctr` conservatism is hiding.

`rel_census.py` classifies per FUNCTION, but inside a row that contains a `bctr`
it REFUSES TO SPLIT at a decoded `_prolog +` target (`split_functions`: "genuinely
ambiguous: assume an arm").  Everything downstream of the first such label
therefore merges into one enormous pseudo-function, that pseudo-function contains
the `bctr`, and the whole row lands in `d-JUMPTBL` -- i.e. written off as
structurally unreachable.

The conservatism is not wrong, it is UNSETTLED, and it is expensive:

  * mini_fight, run 11.  The census charged 3 rows / 6,214 insn to d-JUMPTBL.
    Split per function, only **4 functions / 2,396 insn actually contain a
    `bctr`** -- reproducing run 10's independent hand count exactly -- and those
    rows hide **31 reachable functions / 2,733 insn**.  Corrected reachability
    78 fns / 8,894 (37%), not 47 / 6,161 (26%).

So this does NOT change the census's default (which is validated against seven
modules' hand-derived tables).  It reports the sub-functions the default hides,
marks which ones sit at a decoded arm address, and leaves the call to you.

READ THEM.  Both answers have been right:
  * test_mode's two `leaf?` candidates inside `bctr` rows were REAL FUNCTIONS,
    sitting after the jump-table function's final `blr`.
  * mini_bowling's six were genuine arms, at 8-byte spacing.
An `ARM?` row is a coin-flip that only reading settles; a plain row is a
function the census simply lost.

`tools/rel_leafsplit.py` is what acts on the answer -- it is the only splitter
that will touch a `bctr` row at all.

usage:
  python tools/rel_bctr.py <module> [more...]      # every bctr row
  python tools/rel_bctr.py --all
  python tools/rel_bctr.py <module> --tree DIR
"""
import argparse
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import rel_census as rc


def analyse(tree, mod):
    stem = rc.MODULES[mod]
    blob = rc.data_text(tree, stem)
    bias, hits, ntgt, _runner = rc.prolog_bias(blob, rc.defined_labels(tree, stem))
    arms = set()
    if bias is not None:
        arms = {t + bias for t in
                (int(h, 16) for h in
                 re.findall(r'\.4byte\s+_prolog\s*\+\s*(0x[0-9A-Fa-f]+)', blob))}
    own = rc.still_asm(tree, stem)

    tot = {'bctr': [0, 0], 'blocked': [0, 0], 'reach': [0, 0]}
    nrow = 0
    for row in sorted(own):
        path = os.path.join(tree, 'asm', 'nonmatchings', stem, row + '.s')
        if not os.path.exists(path):
            continue
        insns = rc.parse_row(path)
        if not any(x[2] == 'bctr' for x in insns):
            continue
        nrow += 1

        # The boundary rule, WITHOUT the arm veto: a label directly after a
        # `blr`.  mwcc emits nothing between functions, so this is exactly where
        # one ends.  (Bare, this rule over-splits catastrophically -- test_mode
        # turned one row into eighteen 2-instruction "functions" with it.  It is
        # safe here only because a `bctr` row is already written off, so the
        # question is not "is this a function" but "what is this row hiding".)
        cuts, prev_blr = [0], False
        for i, (_a, _w, op, _args, lab) in enumerate(insns):
            if i and lab and prev_blr:
                cuts.append(i)
            prev_blr = (op == 'blr')
        cuts.append(len(insns))

        print('=== %s  %d insn on disk -> %d sub-function(s)   [%s]'
              % (row, len(insns), len(cuts) - 1, own[row]))
        for k in range(len(cuts) - 1):
            s, e = cuts[k], cuts[k + 1]
            body = insns[s:e]
            if not body:
                continue
            ops = {x[2] for x in body}
            addr = body[0][0]
            name = body[0][4] or ('lbl_%08X' % addr)
            if 'bctr' in ops:
                cat, key = 'd-JUMPTBL', 'bctr'
            # The magic-double test used to join x[3] (the ARGS field) and then
            # search it for r'\blis\s+r\d+,...' -- but the OPCODE lives in x[2],
            # so the pattern could never match and a-BLOCKED was DEAD CODE.  It
            # made the tool report two a-BLOCKED mini_fight functions (lbl_13D50
            # 160, lbl_1415C 145) as REACHABLE, which is exactly the amount by
            # which its 23/2,054 over-reported the hand count of 21/1,749.
            # (mini_fight, run 12, with the fix.)
            elif any(x[2] == 'lis' and '0x4330' in x[3] for x in body):
                cat, key = 'a-BLOCKED', 'blocked'
            else:
                cat, key = 'REACHABLE', 'reach'
            tot[key][0] += 1
            tot[key][1] += len(body)
            print('    %-18s %5d  %-10s %s'
                  % (name, len(body), cat, 'ARM? -- READ IT' if addr in arms else ''))

    if not nrow:
        print('%s: no `bctr` rows still in asm -- nothing hidden' % mod)
        return None
    print()
    print('%s: across %d bctr row(s), per SUB-FUNCTION:' % (mod, nrow))
    for k, lbl in (('bctr', 'd-JUMPTBL'), ('blocked', 'a-BLOCKED'),
                   ('reach', 'REACHABLE')):
        print('    %-10s %3d fns / %6d insn' % (lbl, tot[k][0], tot[k][1]))
    print('    ^ the census charges ALL of the above to d-JUMPTBL.')
    if bias is not None and ntgt and hits < ntgt:
        print('    !! bias hit rate %d/%d -- the ARM? column is unreliable here'
              % (hits, ntgt))
    return tot


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('modules', nargs='*')
    ap.add_argument('--all', action='store_true')
    ap.add_argument('--tree', help='defaults to this repo')
    a = ap.parse_args()
    mods = sorted(rc.MODULES) if a.all or not a.modules else a.modules
    bad = [m for m in mods if m not in rc.MODULES]
    if bad:
        sys.exit('unknown module(s): %s' % ', '.join(bad))
    root = a.tree or os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    for m in mods:
        analyse(root, m)
        print()
    return 0


if __name__ == '__main__':
    sys.exit(main())
