#!/usr/bin/env python3
"""Magic-double inventory and PAIR VERDICT, read off the GOLDEN linked REL.

  * 0x43300000_80000000 is the SIGNED int->float magic
  * 0x43300000_00000000 is the UNSIGNED one
  * mwcc emits ONE magic OF EACH KIND per TRANSLATION UNIT, shared by every
    function in it.

RUN 34 -- THIS TOOL'S RULE WAS FALSE IN BOTH HALVES.  THERE IS ONE RULE, AND IT
IS NOT A PROPERTY A TOOL CAN READ OFF ADDRESSES
------------------------------------------------------------------------------
Through run 33 the paragraphs here read:

    "...and where a TU needs BOTH, it emits them as ONE CONTIGUOUS 16-BYTE
     .rodata block, in SOURCE FIRST-USE ORDER.  So a function needing both
     magics is dead if and only if the golden image has no 16 contiguous bytes
     equal to [first-used][second-used]."

`rel_ledger`'s DEAD column and `rel_mergeprice`'s `MAGIC_BLOCK_GAP = 8`
inherited it.  **Both halves are falsified, and the run-34 correction to the
SECOND half had to be made twice, because the first attempt at it -- inside this
very file, earlier the same run -- replaced one false constant with another.**

THE RULE, and it is the only one:

    A TU's `.rodata` is its ENTIRE FP LITERAL POOL, emitted in CODEGEN
    FIRST-USE ORDER.  The magics are ordinary members of it.

Everything else is a corollary, and both of the corollaries this file used to
state as laws are wrong:

  * FALSE -- "one CONTIGUOUS 16-byte block".  Other constants sit between the
    two magics whenever the code uses them between the two conversions.
    MEASURED six ways now: mini_pilot (4 objects), run 33's corpus C (9),
    sel_ngc reproducing golden's 456-byte separation TO THE BYTE with three
    compiles, and corpus B's `probes/probe_mix.c` shape at run 34.  A separation
    is a PRICE -- that many bytes of pool must move into the merged TU -- not a
    death certificate.

  * FALSE -- "signed low, unsigned high, source order inert".  This was asserted
    in run 33 and briefed as SURVIVING into run 34.  It does not survive.  It is
    now falsified by FIVE independent sources, one of which is a real link:
    corpus B (16 fresh objects at these exact REL flags,
    `_corpus_run34/Bscratch/probes/`), run 33's corpus C (7 stored objects),
    mini_billiards (7, with a control), mini_golf (6), and mini_pilot, which
    RE-TESTED ITS OWN RUN-33 CLAIM AND RETRACTED IT.  And test_mode built a
    13-file merge whose linked `.rodata` is UNSIGNED-low then SIGNED-high --
    golden's order -- with `rel_fnhash` 134/134.

    Corpus B's probes, `.rodata` offsets of the two magics:

        q1  signed used first             -> S at +0x0, U at +0x8
        q2  UNSIGNED used first           -> U at +0x0, S at +0x8
        q3  signed used first             -> S low
        q4  UNSIGNED used first           -> U low
        q7  one expression, U leftmost    -> U low
        q8  one expression, S leftmost    -> S low
        q13 unsigned in the first `if` arm-> U low

    ** AND THE CONTROL THAT NAMES THE CONDITIONING VARIABLE: **

        q5   declarations S,U -- USE order U first -> U low
        q6   declarations U,S -- USE order S first -> S low
        q12a decls S,U -- signed used first        -> S low
        q12b decls U,S -- signed used first        -> S low   (UNCHANGED)

    **DECLARATION order is inert.  FIRST-USE order decides.**  That reconciles
    the measurements that were in conflict: run 33's probes permuted an axis
    that does not move the answer.  test_mode's, specifically, permuted
    statement order inside the LAST function of a TU whose FIRST function had
    already used the signed magic -- so the first use was fixed before the
    permuted code ran, and POSITION IN THE TU, not function count, is what
    selects which use is first.

    ⚠ Two refinements that were proposed and are FALSE; do not re-add either:
      -- "ordinary literals precede BOTH magics".  test_mode's `us_gap` object
         has `2.5f` sitting BETWEEN them.
      -- "it only happens with two functions".  See the position point above.

** SO NO TOOL MAY RETURN DEAD ON ORDER GROUNDS. **  A merge can produce EITHER
orientation; which one you get depends on which magic the merged TU's code uses
FIRST, and that is a property of the source you are about to write, not of the
addresses this tool can read.  `orientation()` therefore reports it as an
OBSERVATION with the recipe attached, and never as a verdict.

The one predicate that IS structural: **one TU emits each distinct double
ONCE.**  MEASURED run 34, `q15` (three signed conversions in three functions)
and `q16` (three in one function): exactly ONE signed magic in the `.rodata`,
both times.  So two magics OF THE SAME KIND at two different addresses cannot
both come from one TU -- that, and only that, is `DUP-DEAD`.

`pair_verdict()` below is the single copy.  `rel_ledger` and `rel_mergeprice`
IMPORT it rather than restating it -- three copies of one rule is how all three
tools came to encode the same false premise, and how it survived two runs after
being falsified.

usage: python tools/rel_magicscan.py <module> [<module> ...]
       python tools/rel_magicscan.py --all
       python tools/rel_magicscan.py --selftest
Run from the tree root, AFTER a build (it reads the built .rel).
"""
import os
import sys

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

MODULES = {
    'mini_bowling':   'mkbe.rel_mini_bowling.rel',
    'mini_race':      'mkbe.rel_mini_race.rel',
    'mini_fight':     'mkbe.rel_mini_fight.rel',
    'mini_pilot':     'mkbe.rel_mini_pilot.rel',
    'mini_golf':      'mkbe.rel_mini_golf.rel',
    'mini_billiards': 'mkbe.rel_mini_billiards.rel',
    'sel_ngc':        'mkbe.sel_ngc.rel',
    'option':         'mkbe.option.rel',
    'test_mode':      'mkbe.test_mode.rel',
}

SIGNED = bytes.fromhex('4330000080000000')
UNSIGNED = bytes.fromhex('4330000000000000')
HI = bytes.fromhex('43300000')

# ** THERE IS NO FIXED TU ORDER.  DO NOT PUT ONE BACK. **
#
# A constant named TU_ORDER = ('s', 'u') lived here for part of run 34 and was
# WRONG.  The pool is in codegen FIRST-USE order; either orientation is
# producible.  If a future run is tempted to re-add it, the falsifying probes
# are checked in at `_corpus_run34/Bscratch/probes/q2,q4,q5,q7,q13` and the
# controls that name the conditioning variable are `q5/q6` and `q12a/q12b`.


def orientation(kinds):
    """OBSERVATION, never a verdict: which magic golden put at the low address.

    Returns (tag, recipe).  `tag` is 'S+U' / 'U+S' / '' and `recipe` says what
    the merged TU's SOURCE has to look like to reproduce it.  A tool that reads
    only addresses cannot see codegen first-use order, so this is the most it
    can honestly say -- and it is genuinely actionable, because it turns a row
    that used to read DEAD into an instruction about the code you are writing.
    """
    ks = tuple(kinds)
    if len(ks) != 2 or set(ks) != {'s', 'u'}:
        return '', ''
    first = 'UNSIGNED' if ks[0] == 'u' else 'SIGNED'
    second = 'SIGNED' if ks[0] == 'u' else 'UNSIGNED'
    return ('%s+%s' % (ks[0].upper(), ks[1].upper()),
            'golden has the %s magic at the LOWER address, so the merged TU '
            'must perform its %s conversion FIRST in codegen order (the %s one '
            'after it). MEASURED run 34: first-USE order decides, DECLARATION '
            'order is inert. This is a constraint on the source you write, NOT '
            'a structural block.' % (first, first, second))


def pair_verdict(kinds, gap):
    """Can ONE translation unit emit this set of magics at these addresses?

    kinds -- the magic kinds in ADDRESS order, low to high, e.g. ('s', 'u').
    gap   -- bytes strictly between them: high_addr - low_addr - 8.  None when
             the addresses are unknown.

    -> (verdict, why).  verdict is one of

       SINGLE     one magic.  Always emittable; a plain 8-byte hole.
       ADJACENT   two DIFFERENT kinds, touching.  The cheapest case.
       POOL-GAP   two DIFFERENT kinds, `gap` bytes apart.  ** NOT DEAD. **  The
                  merged TU must emit those `gap` bytes from its own literal
                  pool.  That is a price, and this returns it.
       DUP-DEAD   the SAME kind wanted at two addresses.  ** The only
                  structural block, and the only DEAD this function returns. **
                  MEASURED run 34 (`q15`, `q16`): three signed conversions in
                  one TU emit exactly ONE signed magic.

    ** THERE IS DELIBERATELY NO ORDER VERDICT. **  Orientation is reported by
    `orientation()` as an observation with a recipe.  Encoding "signed low" as
    DEAD would have newly killed 16,191 instructions on a rule that two
    independent controlled probe families falsified in run 34, and it would have
    voided mini_billiards' 2,496 and test_mode's 840 for nothing.

    This function is pure -- no map, no image, no I/O -- so the three tools that
    consume it cannot drift apart on what each happens to have loaded.
    """
    ks = tuple(kinds)
    if len(ks) < 2:
        return 'SINGLE', 'one magic'
    if len(set(ks)) < len(ks):
        return ('DUP-DEAD',
                'wants %s -- the SAME magic at two different addresses. One TU '
                'emits each distinct double ONCE (MEASURED run 34: three '
                'signed conversions in one TU produce one magic), so no merge '
                'and no carve can cover both' % '+'.join(ks))
    if len(ks) > 2:
        return ('DUP-DEAD',
                'wants %d magics and there are only two kinds, so at least one '
                'kind is wanted at two addresses' % len(ks))
    if not gap:
        return 'ADJACENT', 'two kinds, contiguous 16-byte block'
    return ('POOL-GAP',
            'two kinds %d bytes apart -- NOT dead. A TU\'s .rodata is its whole '
            'FP literal pool, so the merged TU must also emit those %d bytes, '
            'in golden\'s order (sel_ngc reproduced a 456-byte separation to '
            'the byte with three compiles; corpus B reproduced a 16-byte one '
            'at run 34)' % (gap, gap))


def find_all(hay, needle):
    out, i = [], hay.find(needle)
    while i >= 0:
        out.append(i)
        i = hay.find(needle, i + 1)
    return out


def scan(mod, verbose=True):
    path = os.path.join(REPO, MODULES[mod])
    if not os.path.exists(path):
        print('%-16s -- %s not built' % (mod, MODULES[mod]))
        return None
    data = open(path, 'rb').read()
    sig, uns = find_all(data, SIGNED), find_all(data, UNSIGNED)
    su = find_all(data, SIGNED + UNSIGNED)
    us = find_all(data, UNSIGNED + SIGNED)
    # closest cross-signedness pair.  RUN 34: this number is a PRICE, not a
    # verdict.  It used to be read as "how dead is this module"; a separation
    # only says how many bytes of literal pool a merged TU has to carry with
    # it, and sel_ngc reproduced 456 of them exactly.
    closest = min((abs(u - s) for s in sig for u in uns), default=None)

    # Every ordered (signed, unsigned) pair in the image, with the verdict.
    # This is the list `rel_ledger` and `rel_mergeprice` reach the same way,
    # by address, and it is here so the three can be compared by eye.
    pairs = []
    for s in sig:
        nxt = [u for u in uns if u > s]
        prv = [u for u in uns if u < s]
        if nxt:
            u = min(nxt)
            pairs.append((s, u, ('s', 'u'), pair_verdict(('s', 'u'),
                                                         u - s - 8)))
        if prv:
            u = max(prv)
            pairs.append((u, s, ('u', 's'), pair_verdict(('u', 's'),
                                                         s - u - 8)))

    if verbose:
        print('\n=== %s (%s, %d bytes) ===' % (mod, MODULES[mod], len(data)))
        print('  0x43300000 high-word occurrences: %d' % len(find_all(data, HI)))
        print('  SIGNED   %d at %s' % (len(sig), ['0x%X' % x for x in sig]))
        print('  UNSIGNED %d at %s' % (len(uns), ['0x%X' % x for x in uns]))
        print('  contiguous [SIGNED][UNSIGNED]: %d %s'
              % (len(su), ['0x%X' % x for x in su]))
        print('  contiguous [UNSIGNED][SIGNED]: %d %s   %s'
              % (len(us), ['0x%X' % x for x in us],
                 '<- producible by one TU that converts UNSIGNED first'
                 if us else ''))
        if closest is not None:
            print('  closest signed/unsigned pair: %d bytes apart  (a PRICE, '
                  'not a verdict -- see pair_verdict)' % closest)
        for lo, hi, kk, (v, why) in sorted(set(pairs)):
            tag, recipe = orientation(kk)
            print('  0x%-8X .. 0x%-8X  %-9s %-4s %s'
                  % (lo, hi, v, tag, why[:88]))
            if recipe:
                print('  %28s%s' % ('', recipe[:110]))
        if not sig and not uns:
            print('  -- no magic in the image: any a-BLOCKED function here '
                  'needs a CARVE, not a merge (test_mode was this case)')
    return dict(mod=mod, signed=len(sig), unsigned=len(uns),
                su=len(su), us=len(us), closest=closest,
                pooolgap=sum(1 for _l, _h, _k, (v, _w) in pairs
                             if v == 'POOL-GAP'),
                us_pairs=sum(1 for _l, _h, k, (v, _w) in pairs
                             if tuple(k) == ('u', 's')))


def selftest():
    """Gate the predicate itself.  Every case below is a REAL row from the tree
    at run 34, named, so a future edit that breaks one breaks a known figure."""
    cases = [
        # kinds low->high, gap, expected verdict, what it is
        (('s',), None, 'SINGLE', 'any single-magic reader'),
        (('s', 'u'), 0, 'ADJACENT',
         'mini_bowling_4bb.c.o owns 10D58(s)+10D60(u) -- the one C object in '
         'the tree that owns two magics'),
        (('s', 'u'), 448, 'POOL-GAP',
         'sel_ngc 11D00(s)..11EC8(u), 2,026 insn: the tool called this DEAD; '
         'sel_ngc reproduced the separation with three compiles'),
        (('s', 'u'), 272, 'POOL-GAP',
         'mini_fight 1C648(s)..1C760(u), the 1,303-insn merge row'),
        (('s', 'u'), 296, 'POOL-GAP',
         'option C380(s)..C4B0(u): 1498+972+622 = 3,092 insn'),
        # ** THE FOUR ROWS THAT MUST NOT BE DEAD. **  Each was priced DEAD or
        # was about to be, on the falsified "signed low" rule.  If a future edit
        # re-adds an order verdict, these four fail and name what it costs.
        (('u', 's'), 0, 'ADJACENT',
         'mini_golf 261E8(u)+261F0(s), 5,182+1,420 insn -- NOT dead: the TU '
         'just has to use its UNSIGNED conversion first'),
        (('u', 's'), 80, 'POOL-GAP',
         'mini_golf 266A0(u)..266F8(s), the 478+144 merge rows'),
        (('u', 's'), 40, 'POOL-GAP', 'mini_golf 26380(u)..263B0(s), 1,220'),
        (('u', 's'), 0, 'ADJACENT',
         'test_mode FEC8(u)+FED0(s), 840 insn -- the retirement this rule '
         'would have voided'),
        (('u', 's'), 0, 'ADJACENT',
         'mini_billiards 20840(u)+20848(s), 2,496 insn -- mini_billiards '
         'stopped itself retiring these mid-run-34'),
        (('s', 's'), 64, 'DUP-DEAD',
         'the ONLY structural block; MEASURED by q15/q16'),
        (('s', 'u', 's'), 64, 'DUP-DEAD', 'three magics, two kinds'),
    ]
    bad = 0
    for kinds, gap, want, what in cases:
        got, why = pair_verdict(kinds, gap)
        ok = got == want
        bad += not ok
        print('  %-4s %-14s gap=%-5s -> %-11s %s'
              % ('OK' if ok else 'FAIL', '+'.join(kinds),
                 '?' if gap is None else gap, got, what[:78]))
    # ** THE GATE THAT MATTERS, AND IT IS DESIGNED TO FAIL A PLAUSIBLE WRONG
    # FIX. **  Two wrong fixes are available and each fails exactly one line:
    #   * deleting only the distance test        -> line 1 fails (POOL-GAP)
    #   * keeping/re-adding a "signed low" test  -> line 2 fails (U+S is live)
    assert pair_verdict(('s', 'u'), 448)[0] == 'POOL-GAP'
    assert pair_verdict(('u', 's'), 0)[0] == 'ADJACENT'
    # ...and orientation must still SAY which way round it is, or the tool has
    # silently dropped the only actionable half of the observation.
    tag, recipe = orientation(('u', 's'))
    assert tag == 'U+S' and 'UNSIGNED conversion FIRST' in recipe, (tag, recipe)
    assert orientation(('s', 'u'))[0] == 'S+U'
    assert orientation(('s', 's')) == ('', '')
    print('  OK   orientation("u","s") -> %s  %s' % (tag, recipe[:60]))
    print('rel_magicscan selftest: %d cases, %d FAIL' % (len(cases), bad))
    return 1 if bad else 0


def main():
    args = [a for a in sys.argv[1:] if not a.startswith('-')]
    if '--selftest' in sys.argv[1:]:
        return selftest()
    mods = list(MODULES) if '--all' in sys.argv[1:] else args
    if not mods:
        sys.exit(__doc__)
    unknown = [m for m in mods if m not in MODULES]
    if unknown:
        sys.exit('unknown module(s): %s\nknown: %s'
                 % (', '.join(unknown), ', '.join(MODULES)))
    rows = [r for r in (scan(m) for m in mods) if r]
    print('\n=== summary ===')
    print('%-16s %7s %9s %8s %8s %9s %9s %10s'
          % ('module', 'signed', 'unsigned', 'S+U', 'U+S', 'closest',
             'POOL-GAP', 'U-low pair'))
    for r in rows:
        print('%-16s %7d %9d %8d %8d %9s %9d %10d'
              % (r['mod'], r['signed'], r['unsigned'], r['su'], r['us'],
                 '-' if r['closest'] is None else r['closest'],
                 r['pooolgap'], r['us_pairs']))
    # RUN 34.  The line that used to be here said:
    #   "S+U / U+S are contiguous 16-byte blocks: a function needing both
    #    magics is reachable only through one of those, in its own source
    #    first-use order."
    # Three claims, and all three were false: U+S is NOT reachable at all from
    # one TU, contiguity is NOT required, and source order is INERT.  It is the
    # sentence `rel_ledger`'s DEAD column and `rel_mergeprice`'s
    # MAGIC_BLOCK_GAP were both written from.
    print('\nONE TU emits ONE FP literal pool, in CODEGEN FIRST-USE order, and '
          'the magics are\nordinary members of it.  So:\n'
          '  * they need NOT be contiguous -- a separation is a PRICE (that '
          'many bytes of pool\n    must move into the merged TU), not a death '
          'certificate.  sel_ngc reproduced a\n    456-byte separation to the '
          'byte with three compiles.\n'
          '  * EITHER orientation is producible.  A U-low pair just means the '
          'merged TU has to\n    perform its UNSIGNED conversion FIRST.  '
          'MEASURED run 34, three independent probe\n    families (16 + 7 + 7 '
          'objects): first-USE order decides, DECLARATION order is\n    inert. '
          'The run-33 claim "signed low, unsigned high, source order inert" is '
          'the\n    declaration half generalised too far, and encoding it as a '
          'verdict would have\n    killed 16,191 instructions.\n'
          '  * the ONE structural block is the SAME kind at two addresses '
          '(DUP-DEAD): one TU\n    emits each distinct double once.\n'
          '\nOrientation above is an OBSERVATION with a recipe, never a '
          'verdict.  --selftest.')


if __name__ == '__main__':
    main()
