#!/usr/bin/env python3
"""Recover a REL module's original translation-unit boundaries, and work out
which .c file is allowed to emit each compiler-generated .rodata constant.

Why this exists
---------------
`rel_split.py` splits a module's .text per function but keeps ALL of its data in
one blob (`asm/<mod>.s`, listed last in SOURCES).  So when a converted function
needs mwcc to emit a constant of its own -- an int->float magic double
(0x4330000080000000), a float/double literal, a switch jump table -- those bytes
land ahead of the whole original blob instead of replacing the original ones,
the data layout shifts, and the REL stops matching.  That is what caps the
current approach.

The fix is to carve a hole in the data blob at the constant's original offset
and let the C object supply those bytes.  Two facts make that work, both
verified against mkbe.rel_mini_pilot.rel (golden cc2b2ef2...):

  * Data-only .s objects carry no .text, so they can sit anywhere in SOURCES.
    Put the rodata HEAD object first and the TAIL object last; a C object
    between them drops its .rodata into the hole.
  * A constant shared by several functions can keep its symbol as a *zero-size*
    label at the end of the head object -- it resolves to the hole's address, so
    functions still in asm keep linking while the C object supplies the bytes.

ORDERING RULE (the part that bites): objects contribute .rodata in SOURCES
order, and SOURCES follows .text order.  So a constant must be emitted by the
C file holding its FIRST user in .text order.  Emitting it from a later file
reorders the bytes -- same bytes, wrong places, no match.  Verified: emitting
mini_pilot's 0xC3C8/0xC3CC pair from the 0x8568 file while the 0xC3C0 magic
double came from the 0xA69C file produced [200.0f][170.0f][magic] where the
original has [magic][200.0f][170.0f], and nothing else moved.

Finding TU boundaries
---------------------
NOT every rodata reference is TU-local: a named `const` table defined in one .c
is legitimately referenced from another via `extern`, so those references cross
TU boundaries freely (mini_billiards has several spanning most of the module).
Only *compiler-generated anonymous* constants are guaranteed TU-local, and the
int->float magic double is the reliable marker -- mwcc emits it once per TU that
converts an integer to a float.  So TUs are recovered by grouping functions
around magic-double anchors, merging anchors whose user ranges overlap (the
signed 0x4330000080000000 and unsigned 0x4330000000000000 forms sit 8 bytes
apart in the same pool).

usage: python tools/rel_tu_map.py <module> [<module> ...]
       python tools/rel_tu_map.py --all [-v]
"""
import glob
import os
import re
import sys

MODULES = ['mini_bowling', 'mini_race', 'mini_fight', 'mini_pilot',
           'mini_golf', 'mini_billiards', 'sel_ngc', 'option', 'test_mode']

# THE MODULE NAME AND THE ASM STEM DIVERGE, AND ONLY FOR sel_ngc.
#
# `rel_sweep`, `rel_census`, `rel_merge_tu` and friends take the MODULE name
# (`sel_ngc`); this tool and `rel_carve` used the argument directly as the asm
# STEM, so `rel_tu_map.py sel_ngc` died with `FileNotFoundError: asm\sel_ngc.s`
# and only `sel_ngc_rel` worked.  That inconsistency is not a papercut: the same
# hazard made `rel_rowcount` silently report ZERO rows for sel_ngc in run 10 --
# a wrong answer, not an error.  Accept either spelling everywhere.
STEM = {'sel_ngc': 'sel_ngc_rel'}


def resolve_stem(name):
    """module name -> asm/src stem.  Accepts a stem unchanged."""
    if name in STEM:
        return STEM[name]
    if name in STEM.values() or name in MODULES:
        return name
    sys.exit('unknown module %r -- expected one of: %s'
             % (name, ', '.join(MODULES)))

INSN = re.compile(r'/\* [0-9A-Fa-f]{8} ')
LABEL = re.compile(r'\blbl_[0-9A-Fa-f]+\b')
MAGIC = '0x43300000'


def rodata_labels(path):
    """label -> (address, is_magic_anchor) for every .rodata label."""
    lines = open(path, errors='ignore').read().split('\n')
    sec = {}
    for i, l in enumerate(lines):
        m = re.match(r'\.section (\.\w+)', l.strip())
        if m:
            sec.setdefault(m.group(1), i)
    if '.rodata' not in sec:
        return {}
    start = sec['.rodata']
    end = min((v for v in sec.values() if v > start), default=len(lines))

    out, cur, addr, first_word = {}, None, None, False
    for l in lines[start:end]:
        s = l.strip()
        m = re.match(r'^(lbl_[0-9A-Fa-f]+):', s)
        if m:
            cur, addr, first_word = m.group(1), None, True
            continue
        m = re.match(r'^# 0x([0-9A-Fa-f]+)$', s)
        if m and cur and addr is None:
            addr = int(m.group(1), 16)
            out[cur] = (addr, False)
            continue
        if s.startswith('.4byte') and cur in out and first_word:
            out[cur] = (out[cur][0], MAGIC in s)
            first_word = False
    return out


def functions(root, mod, ro):
    """[(text_addr, name, insns, {rodata labels referenced})] in .text order."""
    out = []
    for b in glob.glob(os.path.join(root, 'asm', 'nonmatchings', mod, '*.s')):
        name = os.path.basename(b)[:-2]
        if not name.startswith('lbl_'):
            continue
        txt = open(b, errors='ignore').read()
        n = sum(1 for l in txt.split('\n') if INSN.match(l))
        refs = {r for r in set(LABEL.findall(txt)) if r in ro}
        out.append((int(name[4:], 16), name, n, refs))
    out.sort()
    return out


def tu_groups(funcs, ro):
    """Group functions into TUs anchored on magic doubles.

    Each anchor's users span a contiguous .text range; anchors whose ranges
    overlap belong to the same TU (signed/unsigned magic pair).  Functions
    between anchor ranges are attached to the preceding TU.
    """
    anchors = []
    for lbl, (addr, is_magic) in ro.items():
        if not is_magic:
            continue
        users = sorted(f[0] for f in funcs if lbl in f[3])
        if users:
            anchors.append([addr, lbl, users[0], users[-1]])
    anchors.sort(key=lambda a: a[2])

    merged = []
    for a in anchors:
        if merged and a[2] <= merged[-1][3]:      # overlaps previous -> same TU
            merged[-1][1].append(a[1])
            merged[-1][3] = max(merged[-1][3], a[3])
        else:
            merged.append([a[0], [a[1]], a[2], a[3]])

    # cut .text at the start of each merged anchor range
    starts = [m[2] for m in merged]
    tus, cur = [], []
    idx = 0
    for f in funcs:
        while idx < len(starts) and f[0] >= starts[idx]:
            if cur:
                tus.append(cur)
            cur, idx = [], idx + 1
        cur.append(f)
    if cur:
        tus.append(cur)
    return tus, merged


def analyse(root, mod, verbose=False):
    ro = rodata_labels(os.path.join(root, 'asm', f'{mod}.s'))
    funcs = functions(root, mod, ro)
    if not funcs:
        print(f'{mod}: no split asm found')
        return None
    tus, anchors = tu_groups(funcs, ro)

    # first user in .text order owns each constant -- that file must emit it
    first_user = {}
    for addr, name, n, refs in funcs:
        for r in refs:
            first_user.setdefault(r, name)

    total = sum(f[2] for f in funcs)
    sizes = sorted(sum(f[2] for f in t) for t in tus)
    print(f'\n=== {mod} ===')
    print(f'{len(funcs)} functions, {total} insn, {len(ro)} rodata labels, '
          f'{len(anchors)} magic anchors -> {len(tus)} TUs')
    print(f'TU size (insn): min {sizes[0]}  median {sizes[len(sizes)//2]}  max {sizes[-1]}')
    if verbose:
        for k, t in enumerate(tus, 1):
            owned = [r for r in first_user
                     if first_user[r] in {f[1] for f in t} and ro[r][1]]
            print(f'  TU{k:<3} {len(t):>3} fns {sum(f[2] for f in t):>6} insn  '
                  f'text 0x{t[0][0]:X}..0x{t[-1][0]:X}'
                  f'{"  magic: " + ",".join(sorted(owned)) if owned else ""}')
    return dict(mod=mod, funcs=len(funcs), insn=total, tus=len(tus), sizes=sizes)


def main():
    root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    args = [a for a in sys.argv[1:] if a != '-v']
    verbose = '-v' in sys.argv[1:]
    mods = [resolve_stem(a)
            for a in (MODULES if (not args or args == ['--all']) else args)]
    rows = [r for r in (analyse(root, m, verbose or len(mods) == 1) for m in mods) if r]
    if len(rows) > 1:
        print('\n=== summary ===')
        print(f'{"module":<16}{"fns":>5}{"insn":>8}{"TUs":>6}{"median TU":>11}{"max TU":>9}')
        for r in rows:
            print(f'{r["mod"]:<16}{r["funcs"]:>5}{r["insn"]:>8}{r["tus"]:>6}'
                  f'{r["sizes"][len(r["sizes"])//2]:>11}{r["sizes"][-1]:>9}')
        print(f'{"TOTAL":<16}{sum(r["funcs"] for r in rows):>5}'
              f'{sum(r["insn"] for r in rows):>8}{sum(r["tus"] for r in rows):>6}')


if __name__ == '__main__':
    main()
