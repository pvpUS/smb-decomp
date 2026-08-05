#!/usr/bin/env python3
"""REACHABLE TODAY, re-derived from the BUILD instead of from the asm alone.

usage: python tools/rel_reach.py <module> [<module> ...] [--tree T] [--detail]
       python tools/rel_reach.py --all [--detail]

WHY THIS EXISTS
---------------
`rel_census`'s REACHABLE column is wrong in every module, always in the same
direction: it under-reports.  Line 368 of that tool reads

    reach = [t for t in table if t['cat'] in ('c-FREE', 'b-POOL')]

i.e. it calls EVERY a-BLOCKED function unreachable.  But a-BLOCKED only means
"does an inline int->float conversion, so it needs its object to emit a magic
double".  It says nothing about whether that object ALREADY EMITS ONE -- and if
it does, the function costs nothing extra and is convertible today.

Four modules re-derived this by hand in run 19 and every correction went the
same way:

    mini_billiards  +3,985   (true 12 fns / 7,924, not 7 / 3,939)
    option          +2,445   (3,602 = 39% reachable, not 1,157 = 13%)
    mini_race         +699
    mini_bowling      +245
                    -------
                    +7,374 instructions the census was hiding

Three of those four were then PROVED by converting a function the census called
blocked and gating GOLDEN.  This tool automates the derivation so run 20 does
not have to do it a fifth time by hand.

THE DERIVATION
--------------
The module's `.map` has a `.rodata section layout` block listing, at the same
offsets:

  * every `lbl_XXXXXXXX (entry of .rodata)` -- where each magic sits, and
  * every `<mod>_N.c.o` `.rodata` -- 8 bytes for one magic, 16 for a
    contiguous signed+unsigned pair.

A C object's `.rodata` offset COINCIDES with the magic label's entry offset, so
the map states outright which TU owns which magic.  Verified against
mini_billiards' hand-derived table (run 19): `_7.c.o` at 0x918 = lbl_0001CBD0,
`_34.c.o` = lbl_0001CF50, `_50.c.o` = lbl_00020CA0 -- all three agree.

A still-asm function is REACHABLE TODAY when either

  * it needs no magic at all (c-FREE / b-POOL -- run 6 established that reading
    a pool constant externally emits no `.rodata`), or
  * its OWN TU's object already emits a magic OF THE KIND it needs.

and BLOCKED otherwise, with the reason named.

DO NOT match the magic ADDRESS the still-asm function references.  That was the
first cut of this tool and it promoted nothing.  The address in the asm is where
the ORIGINAL binary put the constant -- it lives in the `.s` data blob.  When
the function becomes C, mwcc emits its own magic into the TU's `.rodata`, at a
different address entirely.  What matters is only whether that TU is ALREADY
paying for one, because **mwcc emits one magic per object and shares it across
every function in that object**.  Both run-19 conversions prove it directly:
mini_billiards' `_7.c.o` `.rodata` stayed at 8 bytes with TWO new converting
functions added, and mini_race's `F90C` converted with zero `.rodata` growth.

KIND MATTERS.  The signed magic is `43300000 80000000` and the unsigned is
`43300000 00000000`; a TU needing both emits them as one contiguous 16-byte
block.  So a function needing the UNSIGNED form is NOT served by a TU that
emits only the SIGNED one -- adding it would grow `.rodata` from 8 to 16 and
shift every address after it.  The kind a function needs is read off its own
asm: the signed conversion sequence carries `xoris rX,rY,0x8000`, the unsigned
one does not.

VALIDATION -- 8 of 9 modules reproduce a hand-derivation EXACTLY
---------------------------------------------------------------
Run 19's agents re-derived their own reachability independently, by hand, from
`objdump` and the map.  This tool reproduces eight of those nine figures to the
instruction, and the function counts with them:

    mini_billiards  12 fns / 7,924    option        3,602
    mini_fight       5,670            mini_race     2,574
    mini_bowling     2,439            mini_pilot    1,106
    test_mode        1,383 (+0)       mini_golf       525 (+0)

The two `+0`s are not failures: mini_golf re-derived its whole table by a second
method and found `rel_census` already correct, and test_mode's figure was
likewise already right.  The tool agreeing there is the control.

THE ONE DISAGREEMENT -- sel_ngc, 1,609 instructions, WORTH SETTLING
-------------------------------------------------------------------
This tool says sel_ngc has 7 fns / 3,070 reachable.  Its run-19 agent said 5 fns
/ 1,461, calling `lbl_00010438` (958) and `lbl_0000C970` (651) "DEAD -- needs
both magics".

**Nothing distinguishes those two from `lbl_0000B1C0` (472), which the same
agent calls LIVE.** All three are a-BLOCKED, all three sit in `sel_ngc_rel_29.c`,
all three show a signed-only conversion and reference no magic label, and
`_29.c.o` already emits the signed magic at `lbl_00011D00`.

That agent's report describes its figure as "unchanged in method from runs
14/16/17/18" -- so the DEAD verdict is INHERITED, not re-derived.  In this
project inherited claims are 0-for-9.  It may still be right; this tool may be
over-promoting on a signal it cannot see.

**Do not trust either number for sel_ngc. Settle it by measurement** -- it is
cheap: install a draft of `C970`, build, and check whether `sel_ngc_rel_29.c.o`
`.rodata` stays at 8 bytes. If it does, 1,609 instructions have been written off
for five runs on an assumption nobody tested.

REQUIRES A BUILD.  The `.map` is a build output; run `make <TARGET>.plf` first.
Without it this refuses rather than guessing -- an under-report that looks
authoritative is exactly the failure being fixed here.
"""
import argparse
import glob
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import rel_census as C  # noqa: E402

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# `mini_bowling` -> `mkbe.rel_mini_bowling.rel`, `option` -> `mkbe.option.rel`
TARGET = {
    'mini_bowling':   'mkbe.rel_mini_bowling',
    'mini_race':      'mkbe.rel_mini_race',
    'mini_fight':     'mkbe.rel_mini_fight',
    'mini_pilot':     'mkbe.rel_mini_pilot',
    'mini_golf':      'mkbe.rel_mini_golf',
    'mini_billiards': 'mkbe.rel_mini_billiards',
    'sel_ngc':        'mkbe.sel_ngc',
    'option':         'mkbe.option',
    'test_mode':      'mkbe.test_mode',
}

# "  00000918 000008 00000918  1 .rodata 	mini_billiards_7.c.o"
SEC_RE = re.compile(r'^\s*([0-9a-f]{8})\s+([0-9a-f]{6})\s+[0-9a-f]{8}\s+\d+\s+'
                    r'\.rodata\s+(\S+)\s*$')
# "  00000918 000000 00000918 lbl_0001CBD0 (entry of .rodata) 	mini_...s.o"
ENT_RE = re.compile(r'^\s*([0-9a-f]{8})\s+[0-9a-f]{6}\s+[0-9a-f]{8}\s+'
                    r'(lbl_[0-9A-Fa-f]+)\s+\(entry of \.rodata\)')


def rodata_owners(tree, mod):
    """-> {magic_label: owning_object}, plus the raw per-object spans.

    Only `.c.o` objects can OWN a magic in the sense that matters: a `.s.o`
    carries the original data blob, which is what a still-asm function reads
    today and is exactly what a C conversion has to stop depending on.
    """
    mapf = os.path.join(tree, TARGET[mod] + '.map')
    if not os.path.exists(mapf):
        return None, None, mapf

    lines = open(mapf, errors='surrogateescape').read().splitlines()
    try:
        i = next(n for n, l in enumerate(lines)
                 if l.strip() == '.rodata section layout')
    except StopIteration:
        return None, None, mapf

    entries, spans = {}, []            # offset -> label ; (off, size, obj)
    for l in lines[i + 1:]:
        if l.strip().endswith('section layout'):
            break
        m = ENT_RE.match(l)
        if m:
            entries.setdefault(int(m.group(1), 16), m.group(2))
            continue
        m = SEC_RE.match(l)
        if m:
            off, size, obj = int(m.group(1), 16), int(m.group(2), 16), \
                m.group(3)
            if size and obj.endswith('.c.o'):
                spans.append((off, size, obj))

    owners = {}
    for off, size, obj in spans:
        # 8 bytes = one magic; 16 = the contiguous signed+unsigned pair.
        for k in range(0, size, 8):
            lbl = entries.get(off + k)
            if lbl:
                owners[lbl] = obj
    return owners, spans, mapf


SIGNED = '4330000080000000'
UNSIGNED = '4330000000000000'
OBJDUMP = os.environ.get(
    'OBJDUMP', 'C:/devkitPro/devkitPPC/bin/powerpc-eabi-objdump.exe')


def owned_kinds(tree, spans):
    """-> {object_basename: set of 's'/'u' it already emits}.

    Read from the BUILT OBJECT, not inferred from the size: 16 bytes is not
    always a magic pair (mini_fight lost a gate in run 19 to `#include
    "math.h"`, which emits 16 bytes of 0.5 and 3.0 -- byte-for-byte a plausible
    signed+unsigned pair by size alone). The diagnostic is the CONTENT.
    """
    import subprocess
    kinds = {}
    for _off, _size, obj in spans:
        path = os.path.join(tree, 'src', obj[:-2])          # foo.c.o -> foo.c
        path = os.path.join(tree, 'src', obj)
        if not os.path.exists(path):
            continue
        try:
            r = subprocess.run([OBJDUMP, '-s', '-j', '.rodata', path],
                               capture_output=True, text=True)
        except OSError:
            return None
        hexes = ''.join(re.findall(r'^\s*[0-9a-f]+\s+((?:[0-9a-f]{8} ?){1,4})',
                                   r.stdout, re.M)).replace(' ', '')
        k = set()
        for i in range(0, max(0, len(hexes) - 15), 16):
            w = hexes[i:i + 16]
            if w == SIGNED:
                k.add('s')
            elif w == UNSIGNED:
                k.add('u')
        kinds[obj] = k
    return kinds


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('modules', nargs='*')
    ap.add_argument('--tree', default=REPO)
    ap.add_argument('--all', action='store_true')
    ap.add_argument('--detail', action='store_true')
    a = ap.parse_args()

    mods = sorted(TARGET) if a.all else a.modules
    if not mods:
        sys.exit('usage: rel_reach.py <module> [...] | --all   [--detail]')

    gtot = {'reach': 0, 'blocked': 0}
    for mod in mods:
        if mod not in TARGET:
            sys.exit('unknown module %r' % mod)
        stem = C.MODULES[mod]
        owners, spans, mapf = rodata_owners(a.tree, mod)
        if owners is None:
            print('%-16s NO MAP at %s -- run `make %s.plf` first; refusing to '
                  'guess' % (mod, os.path.basename(mapf), TARGET[mod]))
            continue

        kinds = owned_kinds(a.tree, spans)
        if kinds is None:
            print('%-16s cannot run objdump (%s) -- set $OBJDUMP' % (mod,
                                                                    OBJDUMP))
            continue

        table, _bias, _magics = C.census(a.tree, stem, mod)

        reach, blocked = [], []
        for t in table:
            ownobj = os.path.basename(t['owner'])
            if ownobj.endswith('.c'):
                ownobj += '.o'
            have = kinds.get(ownobj, set())
            # Two independent signals, unioned, and BOTH are needed:
            #   needs_kind  -- counted from the conversion sites themselves
            #                  (xoris => signed, a bare `lis 0x4330` => unsigned)
            #   reads_magic -- the KINDS of the magic labels this function
            #                  actually references via lfd. This is how run 19
            #                  found by hand that mini_billiards' `4634` and
            #                  `2C80` want a signed AND an unsigned magic; the
            #                  site-count alone reports only signed for them.
            # Only for a-BLOCKED rows: run 6 established that merely READING a
            # pool constant externally emits no .rodata, so a b-POOL function
            # referencing a magic label is still free.
            need = set(t.get('needs_kind') or '')
            if t['cat'] == 'a-BLOCKED':
                need |= set(t.get('reads_magic') or '')
            if t['cat'] == 'd-JUMPTBL':
                blocked.append((t, 'jump table'))
            elif t['cat'] != 'a-BLOCKED':
                reach.append((t, 'needs no magic'))
            elif need and need <= have:
                reach.append((t, 'own TU already emits %s'
                              % '+'.join(sorted(need))))
            elif have:
                blocked.append((t, 'wants %s, own TU emits only %s -- adding it '
                                'grows .rodata and shifts every later address'
                                % ('+'.join(sorted(need)),
                                   '+'.join(sorted(have)))))
            else:
                blocked.append((t, 'wants %s, own TU emits no magic'
                                % ('+'.join(sorted(need)) or '?')))

        ri = sum(t['insn'] for t, _ in reach)
        bi = sum(t['insn'] for t, _ in blocked)
        gtot['reach'] += ri
        gtot['blocked'] += bi
        cens = sum(t['insn'] for t in table
                   if t['cat'] in ('c-FREE', 'b-POOL'))
        print('=== %-15s REACHABLE TODAY %2d fns / %6d insn   '
              '(rel_census says %d; delta %+d)'
              % (mod, len(reach), ri, cens, ri - cens))
        print('    magic-owning C objects: %s'
              % (', '.join('%s->%s' % (l, o.split('.c.o')[0].split('_')[-1])
                           for l, o in sorted(owners.items())) or '(none)'))
        if a.detail:
            for t, why in sorted(reach, key=lambda x: -x[0]['insn']):
                print('  R %-14s %5d  %-22s %s'
                      % (t['fn'], t['insn'], os.path.basename(t['owner']), why))
            for t, why in sorted(blocked, key=lambda x: -x[0]['insn']):
                print('  . %-14s %5d  %-22s %s'
                      % (t['fn'], t['insn'], os.path.basename(t['owner']), why))

    if len(mods) > 1:
        print('\n  TOTAL REACHABLE TODAY %d insn   (blocked %d)'
              % (gtot['reach'], gtot['blocked']))


if __name__ == '__main__':
    main()
