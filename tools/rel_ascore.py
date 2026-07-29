#!/usr/bin/env python3
"""rel_ascore.py -- ALIGNED diff for one or more REL functions in a built .plf.

Why this exists (run 8 found it four separate ways):

  A RAW diff count -- comparing word i of got against word i of expected -- is
  meaningless once an instruction is inserted or deleted, because the whole
  tail shifts.  A 3-instruction miss can read as 197.  Worse, `rel_sweep
  --sweep` RANKS variants by the raw count, so a large sweep can hand you the
  wrong "best" variant, or hide a byte-exact match entirely:

    mini_fight lbl_0000EA10  the MATCHING variant scored raw 116 while a
                             non-match scored 63 -- ranked 53 places worse.
                             Recovered only by re-ranking on aligned diffs.
    mini_golf  lbl_000240C0  winning variant raw 319, aligned 0.
    test_mode  lbl_0000F7BC  best variant raw 75 (bottom of every sweep),
                             aligned 5 with the correct frame.

  So: never judge a near-miss, and never rank a sweep, on a raw count.

This also supersedes the ported mini_billiards `adiff.py` AS A SCORER: that one
reads n+12 words past the function end, so it always reports ~10-14 phantom
"extra" units and under-reported two of test_mode's residuals (7 read as 5, 50
as 49).  `adiff.py` is still useful for seeing WHICH instructions differ; it
should not be used for the number.

Reading the output -- run 8's grind-vs-retire rule, and its three caveats:

  1-3 edit regions        a localised allocator/scheduler tie.  Worth grinding;
                          this is where the 16-diff -> 3-diff collapses live.
  regions ~= count        a whole-function register-allocation mismatch.
                          Retire it (mini_golf lbl_000109CC: 14 in 14).
  many regions, high count still a TRANSLATION problem -- rewrite the body
                          rather than permuting spellings.

  CAVEAT 1 (mini_fight): regions can be concentrated.  8 regions all inside the
    first 27 of 139 instructions reads "retire" but is localised.  Check SPAN.
  CAVEAT 2 (mini_fight): N regions can be ONE substitution repeated per unrolled
    iteration.  Only compare region counts across similar loop structures.
  CAVEAT 3 (mini_race): regions can be CAUSAL -- an `extsh` CSE in region 1
    decided the register assignment in regions 2 and 3, 7 and 12 instructions
    later.  Three regions, one defect.
  And the converse (mini_pilot lbl_000097C8): 3 in 3 looks like "retire", but
    all three were one `lis` displaced by 14 slots -- the most localised
    residual in that module.

  Which is why SPAN is printed alongside the count.  Judge on span and
  causality, not on the bare number.

usage:
  python tools/rel_ascore.py <module|stem> <plf> <label> [label...]

  e.g. python tools/rel_ascore.py mini_race mkbe.rel_mini_race.plf lbl_0000D8EC

Run from the repo root (or any tree -- it resolves relative to this file).
Takes the .plf, not the .rel, like rel_fdiff.
"""
import difflib
import os
import sys

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# Same three-name table as rel_merge_back.py: warm dir -> (stem, target).
# Accepting either the module name or the raw stem is deliberate -- sel_ngc's
# dir, stem and target all differ, and that has cost agents time every run.
MODULES = {
    'mini_bowling':   'mini_bowling',
    'mini_race':      'mini_race',
    'mini_fight':     'mini_fight',
    'mini_pilot':     'mini_pilot',
    'mini_golf':      'mini_golf',
    'mini_billiards': 'mini_billiards',
    'sel_ngc':        'sel_ngc_rel',
    'option':         'option',
    'test_mode':      'test_mode',
}


def main():
    if len(sys.argv) < 4:
        sys.exit(__doc__.strip().split('usage:')[-1].strip())

    stem = MODULES.get(sys.argv[1], sys.argv[1])
    plf = sys.argv[2]
    labels = sys.argv[3:]

    os.environ['FDIFF_MODULE'] = stem
    os.chdir(REPO)

    # rel_fdiff is a script, not a module: strip its main() call and exec it so
    # we can reuse load_text/load_map/load_asm without duplicating them here.
    fdiff_path = os.path.join(REPO, 'tools', 'rel_fdiff.py')
    src = open(fdiff_path).read().replace('\nmain()', '')
    rf = type(sys)('rf')
    rf.__dict__['__file__'] = fdiff_path
    exec(compile(src, 'rel_fdiff', 'exec'), rf.__dict__)

    if not os.path.exists(plf):
        sys.exit('%s does not exist -- build the module first, and pass the '
                 '.plf (not the .rel)' % plf)

    text = rf.load_text(plf)
    addrs = rf.load_map(os.path.splitext(plf)[0] + '.map')

    # A label that is still an asm stub is assembled verbatim into the .plf, so
    # it matches ITSELF and always scores 0.  That is the same lie rel_sweep's
    # trap 5 told (a wrong --file reporting a clean MATCH against an untouched
    # stub elsewhere), and it would be worse here because this tool is what run
    # 9 will use to decide what is close.  So find out first.
    import glob
    import re
    stubbed = set()
    for p in glob.glob(os.path.join(REPO, 'src', '%s*.c' % stem)):
        txt = open(p, errors='ignore').read()
        for m in re.finditer(
                r'#include "\.\./asm/nonmatchings/%s/([A-Za-z0-9_]+)\.s"'
                % re.escape(stem), txt):
            stubbed.add(m.group(1))

    # Normalise the branch-displacement fields of b/bl (opcodes 16, 18) so a
    # uniform code shift does not read as a difference in every branch.
    def nz(w):
        return (w & 0xFC000003) if (w >> 26) in (16, 18) else w

    for lbl in labels:
        if lbl not in addrs:
            print('%-16s NOT IN MAP -- is it still an asm stub, or in another '
                  'module?' % lbl)
            continue
        rows = rf.load_asm(lbl)
        n = len(rows)
        base = addrs[lbl]
        exp = [r[1] for r in rows]
        got = [int.from_bytes(text[base + 4 * i:base + 4 * i + 4], 'big')
               for i in range(n)]

        # Normalise branches in BOTH columns.  The linker relocates b/bl
        # displacements, so a naive word-compare reports 8-24 differences on a
        # byte-perfect function -- which would make this RAW column mean
        # something different from the raw counts in rel_sweep and in every
        # run-7/run-8 report.  The ONLY difference between the two columns
        # below must be positional alignment.
        e_n = [nz(x) for x in exp]
        g_n = [nz(x) for x in got]
        raw = sum(1 for a, b in zip(e_n, g_n) if a != b)
        sm = difflib.SequenceMatcher(None, e_n, g_n, autojunk=False)
        ops = [o for o in sm.get_opcodes() if o[0] != 'equal']
        tot = sum(max(i2 - i1, j2 - j1) for _, i1, i2, j1, j2 in ops)

        if ops:
            lo = min(o[1] for o in ops)
            hi = max(o[2] for o in ops)
            span = '  span %d-%d of %d (%d%%)' % (lo, hi, n,
                                                  round(100.0 * (hi - lo) / n))
        else:
            span = ''
        print('%-16s %4d insn   RAW %4d   ALIGNED %4d   (%d edit region%s)%s'
              % (lbl, n, raw, tot, len(ops),
                 '' if len(ops) == 1 else 's', span))
        if lbl in stubbed:
            print('%-16s !! STILL AN ASM STUB in this tree -- it is assembled '
                  'verbatim, so it matches ITSELF. This score is meaningless. '
                  '(rel_sweep trap 5, same shape.)' % '')
        elif tot == 0:
            print('%-16s MATCH -- but a per-function 0 is NECESSARY, NOT '
                  'SUFFICIENT. Gate it: python tools/rel_sweep.py <mod> --gate'
                  % '')


main()
