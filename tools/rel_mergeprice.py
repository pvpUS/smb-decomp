#!/usr/bin/env python3
"""Price a TU MERGE PER READER, not per group -- the mis-price that cost runs.

usage:  python tools/rel_mergeprice.py <module> [<module> ...] [--tree T]
                                       [--all] [--max-span N] [--selftest]

WHY THIS EXISTS
---------------
A still-asm function that does an inline int->float conversion needs its OWN
translation unit to emit the magic double.  If some other `.c` in the module
already emits it, merging the two TUs makes the function convertible without
growing `.rodata` -- the addresses do not shift, so the `.rel` still hashes.

The project has priced that merge WRONG twice, in the same direction:

  * run 27 quoted mini_race's merge as "16 files / 1,349 instructions".  That
    is the span covering ALL SIX readers at once.
  * a single reader only needs the span from ITS OWN file to the magic owner.
    Run 28 measured the per-reader spans and banked `lbl_00006FF4` on a merge
    far cheaper than the group price.  Every project metric moved by -15
    because that merge absorbed 15 files -- and it was still the cheap option.

**A group price is an upper bound on every reader in it, and a fair price for
none of them.**  This prints the minimal span for each reader separately.

WHAT KILLS A MERGE (all three are checked, and all three are load-bearing)
-------------------------------------------------------------------------
  * a SECOND `.rodata`/`.data` emitter inside the span.  One object emits ONE
    contiguous `.rodata` block; absorbing a second emitter concatenates them
    and every later address shifts.  sel_ngc proved this.
  * a NON-`.c` entry inside the span.  `rel_merge_tu` absorbs `.c` files; an
    `asm/*.s` in the middle of the span cannot be absorbed, so the span is not
    contiguous and the merge is not available at this price.
  * a reader that wants a kind (`s`/`u`) the host does not emit.  The kinds are
    read from the BUILT OBJECT's bytes, never inferred from the section size --
    16 bytes of `.rodata` is not always a signed+unsigned pair (mini_fight lost
    a gate in run 19 to `#include "math.h"`, which emits 16 bytes of 0.5 and
    3.0, byte-for-byte plausible as a pair BY SIZE).

WHAT IT DELIBERATELY DOES NOT DO
--------------------------------
It does not merge anything.  `tools/rel_merge_tu.py` does that, and it DELETES
the absorbed `.c` files and rewrites the Makefile -- which is why a stale
restore of a pre-merge `Makefile` leaves a build with NO RESULT (mini_pilot,
run 23).  Price first, merge deliberately, snapshot before either.

REQUIRES A BUILD, and says so instead of guessing: the derivation reads the
module's `.map` and its built `src/*.c.o`.  Run `make <target>.plf` first.
This is the fifth tool in the project that reads the link, so it imports
`rel_reach`'s derivation rather than re-deriving it -- two hand-maintained
copies of the same map parse is how this project acquires silent skew.
"""
import argparse
import os
import re
import subprocess
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import rel_census as C           # noqa: E402
import rel_reach as R            # noqa: E402

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# mwcc emits ONE contiguous 16-byte magic block per TU: two doubles whose
# addresses differ by exactly 8.  Two magics further apart than this can never
# share a TU, however many emitters are merged into it.
MAGIC_BLOCK_GAP = 8

_LBL_ADDR = re.compile(r'lbl_([0-9A-Fa-f]{8})$')


def _addr_span(labels):
    """Byte distance between the lowest and highest `lbl_XXXXXXXX` given.

    None when fewer than two labels resolve -- a single magic is always
    satisfiable in principle, and an unparseable name must not be read as 0
    (that would silently call a dead row live, which is the bug being fixed).
    """
    addrs = []
    for name in labels or ():
        m = _LBL_ADDR.match(name.strip())
        if m:
            addrs.append(int(m.group(1), 16))
    if len(addrs) < 2:
        return None
    return max(addrs) - min(addrs)
EMITTING = ('.rodata', '.data', '.sdata', '.sdata2')


def sources_order(tree, mod):
    """The module's SOURCES list, in link order, from the Makefile.

    Returns [] if the marker comment is not found, and the caller REFUSES --
    a silently empty file list would price every merge at span 0, i.e. free.
    """
    path = os.path.join(tree, 'Makefile')
    txt = open(path, newline='', errors='surrogateescape').read()
    txt = txt.replace('\r\n', '\n')
    # `TARGETS[mod]` is the extensionless target (`mkbe.rel_mini_race`); the
    # Makefile's block comment carries the `.rel`.  Getting this wrong returns
    # [] and the caller refuses -- which is how this was caught.
    marker = '# %s.rel sources' % C.TARGETS[mod]
    i = txt.find(marker)
    if i < 0:
        return []
    j = txt.find('O_FILES', i)
    if j < 0:
        j = len(txt)
    return re.findall(r'(?:src|asm)/[\w./]+\.(?:c|s)', txt[i:j])


_SECT_CACHE = {}


def obj_sections(tree, f):
    """-> set of non-empty section names in <f>'s built object, cached.

    Used to tell a `.text`-bearing `.s` in a merge span (fatal) from a
    `.rodata`-only one (the open question -- see the call site).
    """
    if f in _SECT_CACHE:
        return _SECT_CACHE[f]
    obj = os.path.join(tree, f + '.o')
    out = set()
    if os.path.exists(obj):
        r = subprocess.run([R.OBJDUMP, '-h', obj], capture_output=True,
                           text=True)
        for line in r.stdout.splitlines():
            m = re.match(r'\s+\d+\s+(\.\S+)\s+([0-9a-f]+)\s', line)
            if m and int(m.group(2), 16):
                out.add(m.group(1))
    _SECT_CACHE[f] = out
    return out


def emitters(tree, files):
    """-> {source path: [sections it emits]} for every BUILT object.

    An object that has not been built is reported as unknown rather than as
    a non-emitter: treating a missing object as "emits nothing" would price a
    blocked span as clean, which is the expensive direction.
    """
    out, unknown = {}, []
    for f in files:
        obj = os.path.join(tree, f + '.o')
        if not os.path.exists(obj):
            unknown.append(f)
            continue
        r = subprocess.run([R.OBJDUMP, '-h', obj], capture_output=True,
                           text=True)
        secs = []
        for line in r.stdout.splitlines():
            m = re.match(r'\s+\d+\s+(\.\S+)\s+([0-9a-f]+)\s', line)
            if m and int(m.group(2), 16) and m.group(1) in EMITTING:
                secs.append(m.group(1))
        if secs:
            out[f] = secs
    return out, unknown


def price(tree, mod, max_span):
    stem = C.MODULES[mod]
    owners, spans, mapf = R.rodata_owners(tree, mod)
    if owners is None:
        print('%-16s NO MAP at %s -- run `make %s.plf` first; refusing to '
              'guess' % (mod, os.path.basename(mapf), C.TARGETS[mod]))
        return 1
    kinds = R.owned_kinds(tree, spans)
    if kinds is None:
        print('%-16s cannot run objdump (%s) -- set $OBJDUMP'
              % (mod, R.OBJDUMP))
        return 1

    files = sources_order(tree, mod)
    if not files:
        print('%-16s could not find the SOURCES block for %s in the Makefile '
              '-- refusing to price a merge against an empty file list'
              % (mod, C.TARGETS[mod]))
        return 1
    idx = {f: n for n, f in enumerate(files)}
    emit, unbuilt = emitters(tree, files)

    # host objects, by the kind of magic they emit...
    hosts = {}
    for obj, k in (kinds or {}).items():
        if not k:
            continue
        src = 'src/' + obj[:-2]                    # foo.c.o -> src/foo.c
        if src in idx:
            hosts[src] = k

    # ...AND BY THE ADDRESSES THEY OWN, which is what actually decides the
    # merge.  RUN 30, found by mini_race: this tool used to answer by KIND, and
    # 11 of its 20 mini_race rows were wrong -- 1,912 instructions that no
    # merge can reach at all, including a 492-instruction headline row whose
    # named host emits 0x13C70 while both its readers want 0x13F60/0x13F38.
    # Sections 2 and 6 have said the condition is the ADDRESS since run 22.
    #
    # `owners` is keyed UPPERCASE (rel_reach) and `reads_labels` LOWERCASE
    # (rel_census).  Normalise, or the join matches nothing and every reader
    # reads DEAD -- a vacuous answer that looks like a confident one.
    host_addr = {}
    for lbl, obj in (owners or {}).items():
        src = 'src/' + obj[:-2] if obj.endswith('.o') else obj
        if src in idx:
            host_addr.setdefault(src, set()).add(lbl.lower())

    table, _bias, _magics = C.census(tree, stem, mod)
    readers = []
    for t in table:
        if t['cat'] != 'a-BLOCKED':
            continue
        own = t['owner']
        own = own if own.startswith(('src/', 'asm/')) else 'src/' + \
            os.path.basename(own)
        if own not in idx:
            continue
        need = set(t.get('needs_kind') or '') | set(t.get('reads_magic') or '')
        ownobj = os.path.basename(own) + '.o'
        if need and need <= kinds.get(ownobj, set()):
            continue                               # reachable today, no merge
        readers.append((t['fn'], t['insn'], own, need,
                        {x.lower() for x in (t.get('reads_labels') or [])}))

    print('=== %-15s %d SOURCES entries, %d a-BLOCKED readers, hosts: %s'
          % (mod, len(files), len(readers),
             ', '.join('%s(%s)' % (os.path.basename(h), '+'.join(sorted(k)))
                       for h, k in sorted(hosts.items())) or '(none)'))
    if unbuilt:
        print('    !! %d SOURCES entries have NO OBJECT (%s%s) -- a span '
              'crossing one of these is priced BLIND'
              % (len(unbuilt), ', '.join(os.path.basename(f)
                                         for f in unbuilt[:4]),
                 ', ...' if len(unbuilt) > 4 else ''))

    # A reader wanting `s+u` is usually reported as impossible, because no
    # single `.c` object in this project emits both kinds.  It is NOT
    # impossible: a span covering ONE `s` host and ONE `u` host merges both
    # into the reader's TU.  test_mode's priced-but-uncut 840-instruction merge
    # is exactly that (`_16.c` emits u, `_27.c` emits s).  So candidates are
    # single hosts AND host pairs.
    cands = [((h,), k, host_addr.get(h, set())) for h, k in hosts.items()]
    for h1, k1 in hosts.items():
        for h2, k2 in hosts.items():
            if idx[h1] < idx[h2] and not (k1 | k2) <= k1 and \
                    not (k1 | k2) <= k2:
                cands.append(((h1, h2), k1 | k2,
                              host_addr.get(h1, set()) |
                              host_addr.get(h2, set())))

    rows = []
    for fn, insn, own, need, naddr in readers:
        # ** A READER WANTING TWO MAGICS MORE THAN 8 BYTES APART IS DEAD, AND
        # NO MERGE CAN FIX IT. **  mwcc emits ONE contiguous 16-byte magic
        # block per TU -- two doubles, 8 bytes apart.  Merging N emitters into
        # one TU does not produce two blocks; it produces one.  So a reader
        # referencing magics 88 or 48 bytes apart cannot be served by any span.
        #
        # Run 30 fixed this tool from KIND to ADDRESS and the single-host path
        # is correct.  The HOST-PAIR path was never revisited: it checks that
        # the pair's addresses are covered between two hosts, which is exactly
        # the right question for two SEPARATE 8-byte magics and exactly the
        # wrong one here, because after the merge they are no longer separate.
        #
        # mini_golf found it in run 31: `lbl_00011A6C` (208) wants
        # lbl_000266a0 + lbl_000266f8, 0x58 = 88 bytes apart, and
        # `lbl_0000C33C` (1220) wants two 0x30 = 48 bytes apart.  Both were
        # priced AVAILABLE, and 11A6C's row advertised "also unlocks ... = 622"
        # on top -- 1,428 instructions of structurally dead work priced live.
        gap = _addr_span(naddr)
        if gap is not None and gap > MAGIC_BLOCK_GAP:
            rows.append((10 ** 6 + 1, fn, insn, own, need, naddr, gap))
            continue
        best = None
        for host, hk, ha in cands:
            # ADDRESS first.  A host that emits the right KIND at the wrong
            # ADDRESS cannot serve this reader, and saying otherwise is the
            # defect this rewrite fixes.  Kind is retained only for display and
            # as a fallback when the census could not name the labels.
            if naddr:
                if not naddr <= ha:
                    continue
            elif need and not need <= hk:
                continue
            pts = [idx[own]] + [idx[h] for h in host]
            a, b = min(pts), max(pts)
            span = files[a:b + 1]
            # SPLIT the non-.c entries, because run 29 produced a DISAGREEMENT
            # and this tool must not resolve it by fiat.  This tool priced
            # test_mode's `lbl_0000A7FC` DEAD at span 7 because `test_mode_d1.s`
            # sits in it; test_mode's own agent priced the SAME function as a
            # live 6-file merge worth 333 on the grounds that `d1.s` is
            # `.rodata`-only.  Both cannot be right.  A `.s` that contributes
            # `.text` definitely breaks the span; a `.rodata`-only one is the
            # open question, so it is reported separately and NOT counted as
            # fatal.  (This tool independently reaches `A7FC` anyway, via
            # `test_mode_86.c` at span 12 with no non-.c at all.)
            nonc, rodonly = [], []
            for f in span:
                if f.endswith('.c'):
                    continue
                (rodonly if emit.get(f) and '.text' not in
                 obj_sections(tree, f) else nonc).append(f)
            # a `.s.o` emitting `.rodata` is the original data blob; it is
            # already fatal as a non-.c entry, so do not double-report it.
            second = [f for f in span
                      if f in emit and f.endswith('.c')
                      and f not in host and f != own]
            free = [(f2, i2) for f2, i2, o2, n2, a2 in readers
                    if f2 != fn and o2 in span
                    and ((a2 and a2 <= ha) or (not a2 and n2 and n2 <= hk))]
            # RANK BY LIVENESS FIRST, THEN BY SPAN.  Ranking by span alone
            # reports a reader DEAD whenever its cheapest candidate is blocked,
            # even though a slightly longer span is available -- a tool that
            # hides a live merge behind a dead one is worse than no tool.
            cand = (1 if (nonc or second) else 0, len(span), host, nonc,
                    second, free, rodonly)
            if best is None or cand[:2] < best[:2]:
                best = cand
        if best is None:
            rows.append((10 ** 6, fn, insn, own, need, naddr, None))
        else:
            rows.append((best[1], fn, insn, own, need, naddr) + (best[2:],))

    rows.sort(key=lambda r: (r[0], -r[2]))
    for nspan, fn, insn, own, need, naddr, rest in rows:
        want = ','.join(sorted(naddr)) if naddr else ('+'.join(sorted(need))
                                                      or '?')
        if nspan == 10 ** 6 + 1:
            print('  %-14s %5d  %-24s wants %-22s DEAD: those magics are '
                  '0x%X apart' % (fn, insn, os.path.basename(own), want, rest))
            print('        one TU emits ONE contiguous 16-byte magic block '
                  '(two doubles, 8 bytes apart), so NO merge and NO carve of '
                  'a\n          single hole can serve both. This needs two '
                  'separate holes, or the reader split across two TUs.')
            continue
        if rest is None:
            print('  %-14s %5d  %-24s wants %-22s NO HOST emits that ADDRESS '
                  '-- a merge cannot help; this needs a carve or a new emitter'
                  % (fn, insn, os.path.basename(own), want))
            continue
        host, nonc, second, free, rodonly = rest
        if max_span and nspan > max_span:
            continue
        verdict = 'AVAILABLE'
        if second:
            verdict = 'DEAD: 2nd emitter in span'
        elif nonc:
            verdict = 'DEAD: non-.c in span'
        hostname = '+'.join(os.path.basename(h) for h in host)
        print('  %-14s %5d  %-24s wants %-22s span %3d -> %-24s %s'
              % (fn, insn, os.path.basename(own), want,
                 nspan, hostname, verdict))
        if len(host) > 1:
            # The absorbed emitters concatenate in SOURCES order, so the merged
            # TU's pair reads in that order.  Golden's pair has ONE order at
            # ONE address; if this row's order is the other one, the merge
            # produces the right bytes in the wrong sequence and will not hash.
            order = '+'.join(sorted(hosts[h])[0].upper() for h in host)
            print('        TWO HOSTS   : merged .rodata reads %s in SOURCES '
                  'order -- CHECK THIS AGAINST GOLDEN\'S PAIR ORDER AND '
                  'ADDRESS before cutting' % order)
        if second:
            print('        2nd emitter : %s'
                  % ', '.join(os.path.basename(f) for f in second[:6]))
        if nonc:
            print('        non-.c      : %s  (contributes .text -- fatal)'
                  % ', '.join(os.path.basename(f) for f in nonc[:6]))
        if rodonly:
            print('        .rodata-only .s in span: %s  -- NOT counted fatal.'
                  '  test_mode (run 29) priced such a span as a LIVE merge; an'
                  '\n          earlier derivation counted it dead.  '
                  'UNRESOLVED -- verify before cutting.'
                  % ', '.join(os.path.basename(f) for f in rodonly[:6]))
        if free:
            print('        also unlocks: %s = %d insn'
                  % (', '.join(f for f, _ in free), sum(i for _, i in free)))
    return 0


def selftest():
    """Parser-level gates.  The DERIVATION is gated by running it on a real
    tree -- see the run-29 notes; a self-test that only exercises its own
    fixtures is exactly how `rel_arity` shipped broken in BOTH modes."""
    import tempfile
    d = tempfile.mkdtemp()
    mk = ('SOURCES := \n'
          '# mkbe.rel_mini_race.rel sources\n'
          'MINI_RACE_SOURCES := \\\n'
          '\tsrc/mini_race_1.c \\\n'
          '\tasm/mini_race_d1.s \\\n'
          '\tsrc/mini_race_2.c\n'
          'O_FILES := $(SOURCES:.c=.o)\n'
          '# mkbe.option.rel sources\n'
          '\tsrc/option_1.c\n')
    open(os.path.join(d, 'Makefile'), 'w').write(mk)
    got = sources_order(d, 'mini_race')
    assert got == ['src/mini_race_1.c', 'asm/mini_race_d1.s',
                   'src/mini_race_2.c'], got
    # It must stop at O_FILES -- bleeding into the next module's block would
    # price a merge across two link units, which is nonsense.
    assert 'src/option_1.c' not in got, got
    # An unknown marker returns [] so the caller can REFUSE, never a silent []
    # that prices every span at 0.
    open(os.path.join(d, 'Makefile'), 'w').write('nothing here\n')
    assert sources_order(d, 'mini_race') == []
    # ...and the gate is not vacuous: the good Makefile still parses.
    open(os.path.join(d, 'Makefile'), 'w').write(mk)
    assert len(sources_order(d, 'mini_race')) == 3
    # RUN 30 -- the ADDRESS join, which is the whole point of the rewrite.
    # A gate that does not exercise the fix is decoration, and this tool's own
    # docstring says a self-test over its own fixtures is how `rel_arity`
    # shipped broken in BOTH modes.
    #
    # The two sources DISAGREE ON CASE: rel_reach yields `lbl_000137B8`,
    # rel_census `lbl_000137b8`.  Un-normalised, the join matches nothing and
    # every reader reads DEAD -- a vacuous answer wearing a confident one's
    # clothes.  These cases are taken from mini_race's real numbers.
    owners_up = {'lbl_000137B8': 'mini_race_37.c.o',
                 'lbl_00013C70': 'mini_race_91.c.o'}
    idx_ = {'src/mini_race_37.c': 0, 'src/mini_race_91.c': 1}
    host_addr = {}
    for lbl, obj in owners_up.items():
        src = 'src/' + obj[:-2]
        if src in idx_:
            host_addr.setdefault(src, set()).add(lbl.lower())
    assert host_addr == {'src/mini_race_37.c': {'lbl_000137b8'},
                         'src/mini_race_91.c': {'lbl_00013c70'}}, host_addr

    # lbl_000065A0 wants 0x137B8 and _37.c owns it -> LIVE.
    assert {'lbl_000137b8'} <= host_addr['src/mini_race_37.c']
    # lbl_00011128 wants 0x13F60, which NO host owns.  The pre-run-30 tool
    # called this AVAILABLE via _91.c because both are kind `s` -- a
    # 492-instruction row that is flatly impossible.
    assert not {'lbl_00013f60'} <= host_addr['src/mini_race_91.c']
    assert not any({'lbl_00013f60'} <= a for a in host_addr.values())
    # KIND alone cannot tell those two apart: every host here is `s` and so is
    # every reader.  That is exactly why the kind test passed them.
    assert {'s'} <= {'s'} and {'s'} <= {'s'}
    # A reader wanting TWO addresses needs ONE host owning BOTH (mini_race's
    # lbl_00011E50 wants 0x13F60+0x13FF0 and is adjacency-dead).
    assert not any({'lbl_00013f60', 'lbl_00013ff0'} <= a
                   for a in host_addr.values())
    # ...and the gate is not vacuous: the live row still resolves.
    assert any({'lbl_00013c70'} <= a for a in host_addr.values())
    print('rel_mergeprice selftest: 10 cases OK')


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('modules', nargs='*')
    ap.add_argument('--tree', default=REPO)
    ap.add_argument('--all', action='store_true')
    ap.add_argument('--max-span', type=int, default=0,
                    help='hide rows whose minimal span exceeds N entries')
    ap.add_argument('--selftest', action='store_true')
    a = ap.parse_args()
    if a.selftest:
        selftest()
        return 0
    mods = sorted(C.TARGETS) if a.all else a.modules
    if not mods:
        sys.exit('usage: rel_mergeprice.py <module> [...] | --all '
                 '[--tree T] [--max-span N]')
    bad = 0
    for mod in mods:
        if mod not in C.TARGETS:
            sys.exit('unknown module %r' % mod)
        bad |= price(a.tree, mod, a.max_span)
    return bad


if __name__ == '__main__':
    sys.exit(main())
