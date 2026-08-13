#!/usr/bin/env python3
"""rel_ledger.py -- REACHABILITY BY ADDRESS.  Shipped in tools/ since run 32.

    python tools/rel_ledger.py --all [--tree T] [--detail] [--json out.json]
    python tools/rel_ledger.py mini_golf mini_bowling

(The line above read "Candidate for tools/." until run 34, two runs after it
landed.  Harmless in itself; it was the tell that nobody had re-read the file
since -- which is also how the DEAD column below kept a falsified premise for
two runs.  The run-29 `rel_arity` defect, repeating.)

** THERE IS NO `--module`.  Modules are POSITIONAL. **  The run-33/34 briefs and
this tool's own prose documented `--module M`, which argparse rejects; found by
mini_bowling in run 34.  Fixed in the prose, not in the interface -- `--module`
would be a fourth spelling of an argument three tools already take positionally.

WHY THIS EXISTS
---------------
Three tools answer "can I convert this function today" and all three answer a
DIFFERENT question:

  rel_census   REACHABLE = `cat in ('c-FREE','b-POOL')`.  That is a property of
               the ASM ALONE: "does this function contain an inline `lis
               rN,0x4330` or a `bctr`".  It never opens the `.map`, so it cannot
               know whether the magic the function needs is ALREADY PAID FOR.
               MEASURED run 32, main tree @ b833b4f: it under-reports the nine
               modules by 19,629 instructions, 32,680 against its 13,051 --
               mini_golf alone by 14,239.
  rel_reach    adds the `.map` and asks "does the owner TU already emit a magic
               OF THE KIND this function needs".  Right answer, wrong test:
               KIND is not the match condition (RUN32_BRIEF section 2).
  this file    asks the real question: "for EVERY magic ADDRESS this function
               references, is the function's own TU the object that owns that
               address in golden's .rodata layout".

MEASURED, run 32, all nine modules, main tree at b833b4f, all twelve RELs
hashing golden, no staleness banner: KIND and ADDRESS agree on all 192 still-asm
functions.  The address test is currently REDUNDANT -- every one of the 17 rows
where the addresses differ (11,346 insn) is also a KIND mismatch.  That is a
property of the current tree, NOT a law: it holds because no TU today owns a
magic of the same kind as, but a different address from, one its own still-asm
functions reference.  **A TU MERGE can create exactly that case**, and merging
is run 32's headline lever, so the address test is the one to ship.

WHAT ELSE THIS ADDS -- the blocker taxonomy, which decides what to DO
--------------------------------------------------------------------
`rel_reach` prints "blocked" and stops.  Blocked how is the whole question, and
there are five different answers with five different prices:

  CARVE         the address is unowned -> one hole, serving exactly ONE TU.
  CARVE-EXTEND  the TU already owns one of the two contiguous addresses it
                needs -> widen the existing hole to 16 bytes.  No new hole.
  MERGE         the address is owned by ANOTHER C object -> merge every
                .text-bearing object between them into one TU.  Priced here.
  SPLIT+CARVE   the TU owns a magic at an unrelated address, so it can never
                also emit at the one this function needs.  A MERGE MAKES THIS
                WORSE.  Only a file split helps.
  DEAD          the pair is UNPRODUCIBLE BY ONE TU -- see below.

** RUN 34: THE DEAD COLUMN ENCODED A FALSIFIED RULE, IN BOTH HALVES **
----------------------------------------------------------------------
This banner used to read:

    "a merged TU emits ONE contiguous 16-byte block, so a merge span containing
     two magic owners more than 8 bytes apart is DEAD.  MEASURED: that kills
     2,503 of the 7,951 instructions the naive merge reading offers."

The premise is false.  A TU's `.rodata` is its ENTIRE FP LITERAL POOL in codegen
FIRST-USE order; the magics are ordinary members and other constants sit between
them.  MEASURED by mini_pilot (4 probe objects), run 33's corpus C (9), and
sel_ngc, which reproduced golden's 456-byte signed..unsigned separation TO THE
BYTE with three compiles.

** AND THE "ORDER HALF" IS FALSIFIED TOO -- DO NOT PUT IT BACK. **  Run 34 was
briefed that "within one TU, signed low / unsigned high, source order inert"
SURVIVED, and this file carried an `ORDER-DEAD` verdict for part of the run on
that basis.  It is wrong, and it is now wrong by FIVE independent measurements
including a real link: corpus B (16 fresh objects at exact REL flags), corpus C
(7 stored), mini_billiards (7, with a control), mini_golf (6), and mini_pilot,
which re-tested its own run-33 claim and RETRACTED it; and test_mode built a
13-file merge whose linked `.rodata` is UNSIGNED-low then SIGNED-high, which is
golden's order, with `rel_fnhash` 134/134.

** DECLARATION order is inert; FIRST-USE order decides; POSITION IN THE TU picks
which use is first. **  That is what reconciles the measurements that were in
conflict -- run 33's probes permuted an axis that does not move the answer.

So the predicate is `rel_magicscan.pair_verdict`, IMPORTED, not restated, and it
returns exactly ONE kind of DEAD:

    same kind at two addresses -> DUP-DEAD.  One TU emits each distinct double
                                  ONCE (MEASURED run 34, q15/q16).
    two kinds, gap 0           -> ADJACENT, either orientation
    two kinds, gap N           -> POOL-GAP: the merged TU must also emit those
                                  N bytes.  Priced, not killed.

ORIENTATION is printed as an OBSERVATION with the recipe attached
(`rel_magicscan.orientation`) and is NEVER a verdict.  A U-low pair means the
merged TU has to perform its UNSIGNED conversion first -- a sentence about the
code you are about to write, not a wall.

MEASURED, run 34, main tree at 2836258, all nine modules, diffed row by row
against the shipped tool: dropping the distance test re-opens **9,923
instructions across 16 functions** (DEAD -> CARVE-EXTEND 4,794, DEAD -> MERGE
3,680, DEAD -> CARVE 1,449) and **nothing anywhere becomes DEAD**.  Encoding an
order test instead would have newly killed **16,191** -- including mini_golf's
5,182+1,420 at 0x261E8, mini_billiards' 2,496 (which that module stopped itself
retiring mid-run), and test_mode's 840.

** A LIVE FALSIFIER, and it is now a gate row. **  mini_pilot banked
`lbl_00009C18` (205 insn) in run 34 with a 496-byte carve and gated GOLDEN,
while this tool went on calling it DEAD -- the tool contradicting a
byte-identical build in the current tree.  It now reads CARVE-EXTEND.

After the fix the DEAD column is 0 in every module: no still-asm function
anywhere wants the same magic kind at two addresses.  The REACHABLE-TODAY set is
byte-identical before and after (70 functions / 29,237 instructions), because
none of this changes whether a TU already owns what it needs -- only what it
would COST to change that.

Two rules kill merge rows that look free, and both are applied here:
  * a hole serves ONE TU (run 24), so an address another `.c.o` already fills is
    not a carve at all; and
  * `pair_verdict` above.

CAVEATS, STATED
---------------
  * Requires a golden build: reads `<target>.map` for `.rodata`/`.data`/`.text`
    layout and `<target>.plf` for the magic table (via rel_census).
  * d-JUMPTBL is decided the same way, on the `.data` layout: MEASURED, all 19
    d-JUMPTBL functions in all nine modules reference a real `_prolog +` arm
    table and NONE is owned by its own TU, so 24,121 instructions are genuinely
    blocked.  There are no indirect-tail-call false positives.
  * A MERGEABLE row is a CANDIDATE, not a proof.  It does not check that the
    merged TU's `.rodata` lands at golden's address (sel_ngc's run-20 lesson),
    nor tag conflicts, nor `#pragma peephole on` after asm blocks.
"""
import argparse
import collections
import glob
import json
import os
import re
import sys

# ONE copy of the magic-pair rule, imported, not restated.  All three of
# rel_ledger / rel_mergeprice / rel_magicscan kept their own copy of the
# contiguity premise and all three were still wrong two runs after it was
# falsified; that is what a restated rule costs.  rel_magicscan imports nothing
# from this file, so there is no cycle.
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import rel_magicscan as MS       # noqa: E402

LBL = re.compile(r'lbl_[0-9A-Fa-f]+')
D_ENT = re.compile(r'^\s*([0-9a-f]{8})\s+[0-9a-f]{6}\s+[0-9a-f]{8}\s+'
                   r'(lbl_[0-9A-Fa-f]+)\s+\(entry of \.data\)')


def _sec(tree, target, sect):
    """-> (entries {label: off}, spans [(off,size,obj)]) for one section."""
    mapf = os.path.join(tree, target + '.map')
    if not os.path.exists(mapf):
        return None, None
    lines = open(mapf, errors='surrogateescape').read().splitlines()
    try:
        i = next(n for n, l in enumerate(lines)
                 if l.strip() == '%s section layout' % sect)
    except StopIteration:
        return {}, []
    ent, spans = {}, []
    erx = re.compile(r'^\s*([0-9a-f]{8})\s+[0-9a-f]{6}\s+[0-9a-f]{8}\s+'
                     r'(lbl_[0-9A-Fa-f]+)\s+\(entry of %s\)' % re.escape(sect))
    srx = re.compile(r'^\s*([0-9a-f]{8})\s+([0-9a-f]{6})\s+[0-9a-f]{8}\s+\d+\s+'
                     r'%s\s+(\S+)\s*$' % re.escape(sect))
    for l in lines[i + 1:]:
        if l.strip().endswith('section layout'):
            break
        m = erx.match(l)
        if m:
            ent.setdefault(m.group(2).lower(), int(m.group(1), 16))
            continue
        m = srx.match(l)
        if m:
            spans.append((int(m.group(1), 16), int(m.group(2), 16), m.group(3)))
    return ent, spans


def text_order(tree, target):
    """-> [obj] in link order, .text-BEARING objects only.

    Objects with 0 bytes of .text (every `_dN.s.o` carve segment) appear in the
    map's .text layout and are NOT merge obstacles.  Counting them made a
    28-object merge look like it crossed an asm segment; MEASURED, all nine
    such 'stoppers' contribute exactly 0 bytes.
    """
    _e, spans = _sec(tree, target, '.text')
    size, order = collections.Counter(), []
    for _o, sz, obj in spans or []:
        size[obj] += sz
        if obj not in order:
            order.append(obj)
    return [o for o in order if size[o] > 0]


def fn_body(tree, stem, row, fn_addr, insn):
    p = os.path.join(tree, 'asm', 'nonmatchings', stem, row + '.s')
    if not os.path.exists(p):
        return ''
    out, on, seen = [], False, 0
    for ln in open(p, errors='surrogateescape'):
        m = re.match(r'^/\* ([0-9A-F]{8}) ', ln)
        if not m:
            if on:
                out.append(ln)
            continue
        if int(m.group(1), 16) == fn_addr:
            on = True
        if on:
            out.append(ln)
            seen += 1
            if seen >= insn:
                break
    return ''.join(out)


def jumptable_labels(tree, stem):
    """{label: n_arms} for every .data label whose body is `.4byte _prolog +`."""
    out, cur, n = {}, None, 0
    for p in ([os.path.join(tree, 'asm', stem + '.s')] +
              sorted(glob.glob(os.path.join(tree, 'asm', stem + '_d*.s')))):
        if not os.path.exists(p):
            continue
        for ln in open(p, errors='surrogateescape'):
            m = re.match(r'^(lbl_[0-9A-Fa-f]+):', ln.strip())
            if m:
                if cur and n:
                    out[cur.lower()] = n
                cur, n = m.group(1), 0
            elif cur and re.match(r'\s*\.4byte\s+_prolog\s*\+', ln):
                n += 1
        if cur and n:
            out[cur.lower()] = n
        cur, n = None, 0
    return out


def ledger(tree, mod, C, R):
    """-> list of per-function dicts for one module."""
    stem = C.MODULES[mod]
    owners, rspans, _f = R.rodata_owners(tree, mod)
    if owners is None:
        return None
    owners = {k.lower(): v for k, v in owners.items()}
    dent, dspans = _sec(tree, C.TARGETS[mod], '.data')
    order = text_order(tree, C.TARGETS[mod])
    pos = {o: n for n, o in enumerate(order)}
    jts = jumptable_labels(tree, stem)
    table, _bias, magics = C.census(tree, stem, mod)
    magics = {k.lower(): v for k, v in magics.items()}
    obj_owns = collections.defaultdict(set)
    for lbl, obj in owners.items():
        obj_owns[obj].add(lbl)

    rows = []
    for t in table:
        own = os.path.basename(t['owner'])
        own += '.o' if own.endswith('.c') else ''
        body = fn_body(tree, stem, t['row'], int(t['addr'], 16), t['insn'])
        refs = sorted({l.lower() for l in LBL.findall(body) if l.lower() in magics})
        mine = obj_owns.get(own, set())
        r = dict(module=mod, fn=t['fn'], addr=t['addr'], insn=t['insn'],
                 cat=t['cat'], owner=own, refs=refs, owns=sorted(mine),
                 tables=sorted({l.lower() for l in LBL.findall(body)} & set(jts)))

        if 'JUMPTBL' in t['stops']:
            tabown = set()
            for l in r['tables']:
                off = dent.get(l)
                tabown |= {o for (s, sz, o) in dspans if off is not None
                           and s <= off < s + sz}
            r.update(cls='JUMPTBL', reachable=(tabown == {own} and bool(tabown)),
                     why='switch table(s) %s owned by %s'
                         % (','.join(x[4:] for x in r['tables']) or '?',
                            ','.join(sorted(tabown)) or '?'))
        elif t['cat'] != 'a-BLOCKED':
            r.update(cls='FREE', reachable=True, why='needs no magic')
        elif set(refs) <= mine and refs:
            r.update(cls='REACHABLE', reachable=True,
                     why='own TU owns %s' % '+'.join(x[4:] for x in refs))
        else:
            # Sorted by ADDRESS, which is what pair_verdict wants.  (`refs`
            # is sorted by label NAME, and the name is the address in fixed-
            # width hex, so the two agree -- but sorting the integers makes
            # that independent of the label format.)
            addrs = sorted(int(x[4:], 16) for x in refs)
            kinds = [magics['lbl_%08x' % x] for x in addrs]
            gap = (addrs[-1] - addrs[0] - 8) if len(addrs) > 1 else None
            verdict, vwhy = MS.pair_verdict(kinds, gap)
            otag, orecipe = MS.orientation(kinds)
            need = ('8B @0x%X(%s)' % (addrs[0], kinds[0]) if len(addrs) == 1
                    else '16B @0x%X(%s)' % (addrs[0], ''.join(kinds))
                    if verdict == 'ADJACENT'
                    else '%dB @0x%X(%s), pool gap %d'
                    % (addrs[-1] - addrs[0] + 8, addrs[0], ''.join(kinds), gap)
                    if verdict == 'POOL-GAP'
                    else 'magics 0x%X apart (%s)' % (addrs[-1] - addrs[0],
                                                     ''.join(kinds)))
            taken = {owners[l] for l in refs
                     if l in owners and owners[l] != own}
            if not refs:
                cls, why = 'UNRESOLVED', 'inline conversion, no magic label ref'
            elif verdict == 'DUP-DEAD':
                cls, why = 'DEAD', '%s -- %s' % (need, vwhy)
            elif taken:
                cls, why = 'MERGE', 'needs %s, owned by %s' % (need,
                                                              ','.join(sorted(taken)))
            elif mine & set(refs):
                cls, why = 'CARVE-EXTEND', 'widen own hole to ' + need
            elif mine:
                cls, why = 'SPLIT+CARVE', ('own TU owns %s; needs %s'
                                           % ('+'.join(x[4:] for x in mine), need))
            else:
                cls, why = 'CARVE', 'new hole ' + need
            # ORIENTATION rides along as an OBSERVATION on every two-magic row.
            # It is the actionable half -- "your merged TU must convert
            # UNSIGNED first" -- and it is deliberately NOT part of `cls`.
            if otag == 'U+S' and cls != 'DEAD':
                why += '  [U-low: the TU must do its UNSIGNED conversion first]'
            r.update(cls=cls, reachable=False, why=why, need=need,
                     orient=otag, recipe=orecipe, verdict=verdict, gap=gap,
                     taken_by=sorted(taken))
        r['pos'] = pos.get(own, -1)
        rows.append(r)
    return rows


def merge_price(tree, mod, rows, C, R, magics):
    """-> merge groups with `rel_magicscan.pair_verdict` applied.

    RUN 34: was "with the contiguous-16-byte rule applied", and that rule was
    false in one direction and absent in the other -- see the module banner.
    The span's magics are collected exactly as before; only the verdict on them
    changed.
    """
    order = text_order(tree, C.TARGETS[mod])
    pos = {o: n for n, o in enumerate(order)}
    owners, _s, _f = R.rodata_owners(tree, mod)
    owners = {k.lower(): v for k, v in (owners or {}).items()}
    obj_owns = collections.defaultdict(set)
    for l, o in owners.items():
        obj_owns[o].add(int(l[4:], 16))
    grp = collections.defaultdict(list)
    for r in rows:
        if r['cls'] != 'MERGE':
            continue
        for l in r['refs']:
            if l in owners and owners[l] != r['owner']:
                grp[(owners[l], l)].append(r)
    out = []
    for (own, lbl), rs in grp.items():
        ps = [pos[r['owner']] for r in rs if r['owner'] in pos] + [pos.get(own, -1)]
        lo, hi = min(ps), max(ps)
        span = order[lo:hi + 1]
        allm = set()
        for r in rs:
            allm |= {int(x[4:], 16) for x in r['refs']}
        for o in span:
            allm |= obj_owns.get(o, set())
        a = sorted(allm)
        kinds = [magics.get('lbl_%08x' % x, '?') for x in a]
        gap = (a[-1] - a[0] - 8) if len(a) > 1 else None
        # A magic whose kind the census could not name shows as '?'.  It is
        # neither 's' nor 'u', so a ('?','?') span reads DUP-DEAD rather than
        # as a live merge -- the safe direction -- and the row prints '?' so
        # the gap in the input is visible rather than inferred away.
        verdict, vwhy = MS.pair_verdict(kinds, gap)
        otag, orecipe = MS.orientation(kinds)
        out.append(dict(module=mod, magic=lbl, into=own, nobj=len(span),
                        first=order[lo], last=order[hi],
                        insn=sum(r['insn'] for r in rs),
                        fns=[(r['fn'], r['insn'], r['owner']) for r in rs],
                        alive=verdict != 'DUP-DEAD',
                        verdict=verdict, vwhy=vwhy, gap=gap,
                        orient=otag, recipe=orecipe, kinds=''.join(kinds),
                        spread=a[-1] - a[0],
                        magics=['%X' % x for x in a]))
    return out


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('modules', nargs='*')
    ap.add_argument('--tree')
    ap.add_argument('--all', action='store_true')
    ap.add_argument('--detail', action='store_true')
    ap.add_argument('--json')
    a = ap.parse_args()
    tree = a.tree or os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    sys.path.insert(0, os.path.join(tree, 'tools'))
    import rel_census as C
    import rel_reach as R

    mods = sorted(C.TARGETS) if a.all else a.modules
    if not mods:
        sys.exit(__doc__)

    allrows, allmerge = [], []
    for mod in mods:
        for line in R.stale_warning(tree, mod, C.MODULES[mod]):
            print(line)
        rows = ledger(tree, mod, C, R)
        if rows is None:
            print('%-16s NO MAP -- run `make %s.plf` first' % (mod, C.TARGETS[mod]))
            continue
        _t, _b, magics = C.census(tree, C.MODULES[mod], mod)
        allrows += rows
        allmerge += merge_price(tree, mod, rows, C, R, magics)

    print('%-15s %8s %8s %8s %8s %8s %8s %8s %8s'
          % ('module', 'total', 'REACH', 'carve', 'merge', 'split', 'jumptbl',
             'dead', 'census'))
    order = ['REACHABLE-TODAY', 'CARVE', 'MERGE', 'SPLIT+CARVE', 'JUMPTBL',
             'DEAD']
    # A function is dead-by-span only when EVERY priced span that could serve
    # it is dead.  The old expression used ANY, so one blocked group killed a
    # function another group still reached.  MEASURED run 34: no function is in
    # two groups today, so this changes nothing in the current tree -- it is
    # here because an under-report that grows as a rule bites harder is the
    # exact shape of the `rel_census:576` defect this run also fixed.
    in_grp, dead_grp = collections.Counter(), collections.Counter()
    for m in allmerge:
        for f in m['fns']:
            in_grp[(m['module'], f[0])] += 1
            dead_grp[(m['module'], f[0])] += 0 if m['alive'] else 1
    dead_merge = {k for k, c in in_grp.items() if dead_grp[k] == c}
    agg = collections.defaultdict(collections.Counter)
    for r in allrows:
        k = ('REACHABLE-TODAY' if r['reachable'] else
             'JUMPTBL' if r['cls'] == 'JUMPTBL' else
             'CARVE' if r['cls'] in ('CARVE', 'CARVE-EXTEND') else
             'DEAD' if r['cls'] == 'DEAD' or
             (r['module'], r['fn']) in dead_merge else r['cls'])
        agg[r['module']][k] += r['insn']
        agg[r['module']]['total'] += r['insn']
        agg[r['module']]['census'] += r['insn'] if r['cat'] in ('c-FREE',
                                                               'b-POOL') else 0
        agg['ALL'][k] += r['insn']
        agg['ALL']['total'] += r['insn']
        agg['ALL']['census'] += r['insn'] if r['cat'] in ('c-FREE',
                                                          'b-POOL') else 0
    for m in [x for x in sorted(agg) if x != 'ALL'] + (['ALL'] if len(agg) > 2
                                                       else []):
        c = agg[m]
        print('%-15s %8d %8d %8d %8d %8d %8d %8d %8d'
              % (m, c['total'], c['REACHABLE-TODAY'], c['CARVE'], c['MERGE'],
                 c['SPLIT+CARVE'], c['JUMPTBL'], c['DEAD'], c['census']))

    if allmerge:
        print('\n=== MERGE-TO-OWNER, priced (a merged TU emits ONE FP '
              'LITERAL POOL, in codegen first-use order) ===')
        for m in sorted(allmerge, key=lambda x: -x['insn']):
            if m['verdict'] in ('ADJACENT', 'SINGLE'):
                tag = 'MERGEABLE'
            elif m['verdict'] == 'POOL-GAP':
                tag = ('MERGEABLE at a POOL PRICE: %d bytes of .rodata between '
                       '%s and %s\n%23smust move into the merged TU, in '
                       'golden\'s order. NOT DEAD -- sel_ngc reproduced this '
                       'exact separation with 3 compiles.'
                       % (m['gap'], m['magics'][0], m['magics'][-1], ''))
            else:
                tag = ('DEAD (%s): THIS SPAN holds %s at %s, 0x%X apart\n%23s%s'
                       '\n%23sThis kills the SPAN, not necessarily the reader: '
                       'a reader wanting only ONE of\n%23sthose magics may have '
                       'a narrower span that does not absorb the other. '
                       '`rel_mergeprice`\n%23sprices per reader; this row is a '
                       'group price.'
                       % (m['verdict'], m['kinds'].upper(), m['magics'],
                          m['spread'], '', m['vwhy'], '', '', ''))
            if m['orient'] == 'U+S':
                tag += ('\n%23sORIENTATION (observation, not a verdict): %s'
                        % ('', m['recipe']))
            print('%-15s %6d insn / %d fn   merge %d objects %s .. %s   %s'
                  % (m['module'], m['insn'], len(m['fns']), m['nobj'],
                     m['first'], m['last'], tag))
            if a.detail:
                for fn, i, ow in sorted(m['fns'], key=lambda x: -x[1]):
                    print('%20s %-14s %5d  %s' % ('', fn, i, ow))

    if a.detail:
        print('\n=== per function ===')
        for r in sorted(allrows, key=lambda x: (x['module'], -x['insn'])):
            print('%-15s %-14s %6d %-12s %-13s %-22s %s'
                  % (r['module'], r['fn'], r['insn'], r['cat'], r['cls'],
                     r['owner'], r['why']))
    if a.json:
        json.dump(dict(rows=allrows, merges=allmerge), open(a.json, 'w'),
                  indent=1)
        print('\nwrote %s' % a.json)


if __name__ == '__main__':
    main()
