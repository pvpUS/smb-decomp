#!/usr/bin/env python3
"""rel_regions.py -- print the CONTENTS of each aligned edit region, exp vs got.

`rel_ascore.py` gives the count and the span.  This gives you the instructions,
which is what you actually need to form a hypothesis.

Why it is promoted (run 9, mini_golf).  The aligned score is NOT proof of
proximity.  On `lbl_0000FBC8` three structurally WRONG variants scored **4**
(they emit an `fmul f0,f0,f0` the original never does) while the variant whose
instructions match the original exactly scored **9**.  Ranking on the number
alone would have thrown the right answer away.  Both of that module's run-9
idioms were found by reading these regions side by side.

  aligned beats raw; it does not replace reading the instructions.

usage:
  python tools/rel_regions.py <module|stem> <plf> <label> [label...]

  e.g. python tools/rel_regions.py mini_golf mkbe.rel_mini_golf.plf lbl_0000FBC8

Run it from the tree the .plf was built in.  Takes the .plf, not the .rel.

Output: one block per edit region.  `exp` carries the original word plus its
mnemonic; `got` carries the word your build emitted.  A blank on either side is
an insertion/deletion -- that is the alignment doing its job, and it is why the
row indices on the two sides are not the same number.
"""
import difflib
import os
import re
import sys

REPO = os.environ.get('FDIFF_REPO') or os.path.dirname(
    os.path.dirname(os.path.abspath(__file__)))

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


def nz_at(w, i, n):
    """Mask ONLY the branch displacements the linker relocates.

    Identical to rel_ascore.nz_at, and it must stay identical -- if this tool
    masked more than the scorer does, a region would be invisible here while
    counting there, which is exactly the failure mode run 9 spent a day on.

    The old scratch version masked EVERY b/bc/bl displacement, so a difference
    in a branch target or in WHICH function is called did not show up at all.
    An intra-function branch is PC-relative and self-consistent: if the code
    matches, its displacement matches, wherever the function lands.  Keep those.

    opcode 16 = bc (BD, 14-bit signed), 18 = b/bl (LI, 24-bit signed);
    bit 30 = AA (absolute), bit 31 = LK (it is a call).
    """
    op = w >> 26
    if op == 16:
        d = w & 0x0000FFFC
        if d & 0x8000:
            d -= 0x10000
    elif op == 18:
        d = w & 0x03FFFFFC
        if d & 0x02000000:
            d -= 0x04000000
    else:
        return w
    if w & 2:                            # AA=1: absolute, never intra-function
        return w & 0xFC000003
    tgt = i + d // 4
    if 0 <= tgt < n and not (w & 1):     # intra-function, and not a call
        return w
    return w & 0xFC000003                # leaves the function: relocated


def main():
    if len(sys.argv) < 4:
        sys.exit(__doc__.strip().split('usage:')[-1].strip())

    stem = MODULES.get(sys.argv[1], sys.argv[1])
    plf = sys.argv[2]
    labels = sys.argv[3:]

    os.environ['FDIFF_MODULE'] = stem
    fdiff_path = os.path.join(REPO, 'tools', 'rel_fdiff.py')
    src = open(fdiff_path).read().replace('\nmain()', '')
    rf = type(sys)('rf')
    rf.__dict__['__file__'] = fdiff_path
    exec(compile(src, 'rel_fdiff', 'exec'), rf.__dict__)

    if not os.path.exists(plf):
        sys.exit('%s does not exist -- build the module first, and pass the '
                 '.plf (not the .rel)' % plf)

    # Same stale-artefact refusal as rel_ascore.  A failed build leaves the
    # PREVIOUS .plf on disk; reading regions out of it describes a binary that
    # no longer corresponds to any source you have.  (run 9, test_mode: three
    # fictional MATCHes came through exactly this door.)
    import glob as _glob
    plf_mt = os.path.getmtime(plf)
    newer = [p for p in (_glob.glob(os.path.join(REPO, 'src', '%s*.c' % stem))
                         + _glob.glob(os.path.join(REPO, 'asm', 'nonmatchings',
                                                   stem, '*.s')))
             if os.path.getmtime(p) > plf_mt]
    if newer:
        newer.sort(key=os.path.getmtime, reverse=True)
        sys.exit('REFUSING: %s is OLDER than %d of its own sources (newest %s) '
                 '-- the last build did not produce it. Rebuild, and `rm -f %s` '
                 'first.' % (plf, len(newer), os.path.relpath(newer[0], REPO),
                             plf))

    text = rf.load_text(plf)
    addrs = rf.load_map(os.path.splitext(plf)[0] + '.map')

    # A label that is still an asm stub is assembled verbatim, so it matches
    # ITSELF and shows zero regions.  Say so rather than printing a clean sheet.
    stubbed = set()
    for p in _glob.glob(os.path.join(REPO, 'src', '%s*.c' % stem)):
        txt = open(p, errors='ignore').read()
        for m in re.finditer(
                r'#include "\.\./asm/nonmatchings/%s/([A-Za-z0-9_]+)\.s"'
                % re.escape(stem), txt):
            stubbed.add(m.group(1))

    rc = 0
    for lbl in labels:
        if lbl not in addrs:
            print('%s NOT IN MAP -- still an asm stub, or in another module?'
                  % lbl)
            rc = 1
            continue
        rows = rf.load_asm(lbl)
        n = len(rows)
        base = addrs[lbl]
        exp = [r[1] for r in rows]
        mn = [r[2] if len(r) > 2 else '' for r in rows]
        got = [int.from_bytes(text[base + 4 * i:base + 4 * i + 4], 'big')
               for i in range(n)]
        e = [nz_at(x, i, n) for i, x in enumerate(exp)]
        g = [nz_at(x, i, n) for i, x in enumerate(got)]
        sm = difflib.SequenceMatcher(None, e, g, autojunk=False)
        ops = [o for o in sm.get_opcodes() if o[0] != 'equal']
        tot = sum(max(i2 - i1, j2 - j1) for _, i1, i2, j1, j2 in ops)
        print('==== %s  %d insn  ALIGNED %d  %d region(s)'
              % (lbl, n, tot, len(ops)))
        if lbl in stubbed:
            print('  !! STILL AN ASM STUB here -- assembled verbatim, so it '
                  'matches itself. This is meaningless.')
            rc = 1
            continue
        for t, i1, i2, j1, j2 in ops:
            print('  --- %s  exp[%d:%d] got[%d:%d]' % (t, i1, i2, j1, j2))
            for d in range(max(i2 - i1, j2 - j1)):
                ei, gj = i1 + d, j1 + d
                es = ('%08X %-34s' % (exp[ei], mn[ei])) if ei < i2 else ' ' * 43
                gs = ('%08X' % got[gj]) if gj < j2 else ''
                print('    %5d  %s | %s' % (ei, es, gs))
        if not ops:
            print('  (no differences -- but a per-function 0 is NECESSARY, NOT '
                  'SUFFICIENT. Gate it.)')
    return rc


if __name__ == '__main__':
    sys.exit(main())
