#!/usr/bin/env python3
"""rel_census.py -- the per-FUNCTION reachability census. Run this FIRST.

Run 8 falsified the measurements, run 9 falsified the scorer, and run 10
falsified the CENSUS: how many functions a module has, and which of them are
reachable.  Two modules' inherited tables were wrong by 6,170 instructions
between them, and correcting mini_pilot's alone produced 43% of run 10's output.

  mini_pilot  run 9 said "rows == functions, 5 reachable fns / 1,215 insn".
              Truth: 3 rows held 35 extra functions; 36 fns / 3,567 insn.
  mini_fight  run 9 classified all 26 functions in its 3 `bctr` rows as dead
              (6,214 insn).  Per FUNCTION only 4 functions / 2,396 contain
              `bctr`.

usage:
  python tools/rel_census.py [module ...]        (default: every module)
  python tools/rel_census.py mini_pilot --detail
  python tools/rel_census.py mini_golf --json out.json

Accepts either the warm-dir name or the src/asm stem (sel_ngc / sel_ngc_rel).

------------------------------------------------------------------------------
HOW A FUNCTION ENTRY IS IDENTIFIED, and why the obvious rules are all wrong
------------------------------------------------------------------------------

  entry := the row label itself, OR a label that
             (a) has ZERO in-row branch references, AND
             (b) is preceded by a `blr` -- a real return, not `b`/`bctr`, AND
             (c) is NOT a decoded jump-table arm (see the bias section), AND
             (d) is not merely a leaf we cannot settle -- those are REPORTED,
                 never silently counted either way.

Rules that were tried and are WRONG:
  * "a label after `blr` is a new function" alone -- invents 8 phantom files and
    20 phantom bodies in one mini_pilot file (run 8), and turns one test_mode
    row into eighteen 2-instruction "functions" (run 10).
  * "a label never branched to within its own file" alone -- over-splits any row
    holding a jump table, because every arm qualifies.
  * requiring an `mflr`/`stwu` prologue -- MISSES EVERY LEAF FUNCTION.
    test_mode's 84-instruction leaf starts with a bare `lis` and was invisible
    to the recon for two runs.  test_mode read all 7 of its leaf candidates in
    run 10: ALL SEVEN were real functions, and 6 of them matched.

------------------------------------------------------------------------------
THE JUMP-TABLE ARM DECODER, and the trap in it
------------------------------------------------------------------------------

Switch tables live in the module's .data as `.4byte _prolog + 0xNNNN`, so the
exact arm-address set is decodable rather than guessed.  BUT the offset is
relative to `_prolog`, and **the gap between `_prolog` and the label numbering
is MODULE-DEPENDENT**:

    0xD0   mini_bowling, mini_race, mini_pilot, sel_ngc_rel, test_mode
    0xC8   mini_fight, mini_billiards, option
    0x14C  mini_golf

Run 10 found this decoder twice, independently, and BOTH versions were wrong in
a way that matters: mini_race hard-coded 0xD0 (right for itself, wrong for four
of nine modules) and test_mode compared the raw value with no bias at all, which
made its arm filter **nearly inert** -- it hit 12% of targets, so the real work
was being done by the `blr` rule alone.

So this DERIVES the bias per module and refuses to guess: it scans the bias
space and takes the value that lands every target on a defined label.  In every
module that has enough still-asm labels to test, the winner scores 100% and the
runner-up 13-50%, so the answer is never ambiguous.  It is reported in the
output -- if it ever comes back below 100%, do not trust the JUMPTBL column.

------------------------------------------------------------------------------
CLASSIFICATION -- and the one that used to be counted wrong
------------------------------------------------------------------------------

  a-BLOCKED   does an int->float conversion, i.e. contains an inline
              `lis rN,0x4330`.  Needs its own object to emit a magic double.
  b-POOL      no conversion, but reads pooled float/double constants.
  c-FREE      neither.  Convert these first.
  d-JUMPTBL   the FUNCTION contains a `bctr`.

**Reading a magic LABEL does not block a function.**  Run 6 established that a
pure-C object which only reads pool constants externally emits no `.rodata` at
all; only the inline conversion spends the one-magic-per-object budget.  Run 9's
tables counted label-readers as blocked and mini_fight's over-counted by
thousands of instructions as a result.

**Both magic patterns are tested** -- signed `43300000 80000000` AND unsigned
`43300000 00000000`.  Testing only the signed form was the single most repeated
recon error in the project: it hid a third magic in mini_bowling, six-not-three
in mini_billiards, two of four in option, five of sixteen in mini_fight, and
produced a false "sel_ngc is capped at ~32%" verdict.

------------------------------------------------------------------------------
WHERE THE MAGIC TABLE COMES FROM -- read the LINKED IMAGE, not the asm blob
------------------------------------------------------------------------------

`magic_labels()` classifies a label by scanning the asm blob for `lbl_X:`
followed by `.4byte 0x43300000` + `.4byte 0x8000_0000`/`0x0000_0000`.  **That
scan goes blind the moment a magic's bytes stop living in the asm** -- which is
the normal end state, not an edge case.  Two independent mechanisms cause it:

  * a CARVE leaves the label behind as a ZERO-SIZE ALIAS at the end of a
    segment file (`asm/sel_ngc_rel.s` ends with a bare `lbl_00011D00:`), and
  * once the functions that owned a magic are CONVERTED, mwcc emits those bytes
    into the TU's own `.rodata` and no asm file describes them at all.

Either way the label is still REFERENCED by every still-asm function that does
`lfd f2, lbl_00011D00@l(r3)`, so `reads_magic` silently comes back empty and
the classification falls through to the `n_lis > n_sgn` site-count heuristic --
which mwcc's hoisting of the `0x4330` constant defeats.

So the table is now derived from the LINKED IMAGE (`magic_labels_linked()`):
resolve every `lbl_*` in `.rodata` from `objdump -t <target>.plf`, read the
eight bytes at each address, and classify on CONTENT.  The blob scan is kept as
the fallback for a tree with no build, and the two are unioned with the linked
answer authoritative.

MEASURED ACROSS ALL NINE MODULES (run 21).  The linked table is a strict
SUPERSET of the blob scan -- **zero disagreements on any label both can see**,
so the old scan was never wrong about what it saw, only blind:

    mini_bowling    0s + 1u  ->  6s + 1u      mini_pilot     1s+1u -> 4s+1u
    test_mode       1s + 3u  ->  5s + 4u      mini_golf      2s+3u -> 5s+4u
    sel_ngc         1s + 0u  ->  2s + 1u      mini_billiards 3s+3u -> 6s+3u
    mini_fight     11s + 5u  -> 13s + 6u      mini_race      7s+1u -> 8s+1u
    option          1s + 2u  ->  2s + 2u

mini_bowling's corrected `6s + 1u` is exactly the figure run 20 derived by hand
against the linked REL after catching this tool reporting `0 + 1`.

AND IT REPRODUCES THE ONE BUILD-PROVED CORRECTION, MECHANICALLY.  sel_ngc's
`lbl_00011D00` (signed) and `lbl_00011EC8` (unsigned) are both invisible to the
blob scan; with them the census sees that `lbl_0000B1C0` reads only the signed
magic while `lbl_0000C970` / `lbl_00010438` `lfd` from the UNSIGNED one, whose
TU does not emit it.  That is the discriminator run 20's sel_ngc agent found by
hand and PROVED with a build -- `rel_reach` drops 3,070 -> 1,461 and demotes
exactly those two functions (1,609 insn).  **All eight other modules' reach
figures are byte-identical**, which is the control.
"""
import argparse
import glob
import json
import os
import re
import subprocess
import sys

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

MODULES = {
    'mini_bowling': 'mini_bowling', 'mini_race': 'mini_race',
    'mini_fight': 'mini_fight', 'mini_pilot': 'mini_pilot',
    'mini_golf': 'mini_golf', 'mini_billiards': 'mini_billiards',
    'sel_ngc': 'sel_ngc_rel', 'option': 'option', 'test_mode': 'test_mode',
}

# module -> LINK TARGET base (`<base>.plf` / `<base>.map`).  A third name for
# each module, distinct from both the warm-dir name and the src/asm stem.
# rel_reach.TARGET is an alias for this; keep the two identical.
TARGETS = {
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

OBJDUMP = os.environ.get(
    'OBJDUMP', 'C:/devkitPro/devkitPPC/bin/powerpc-eabi-objdump.exe')

INSN = re.compile(r'^/\* ([0-9A-F]{8}) ([0-9A-F]{8}) \*/[ \t]*(\S*)[ \t]*(.*)$')
DEFN = re.compile(r'^(lbl_[0-9A-Fa-f]+):')
# The same pattern for scanning a WHOLE FILE.  Reusing DEFN with finditer and no
# re.M finds at most one label per file -- which silently shrank the
# defined-label set and dropped the bias hit-rate from 100% to 37-74%, i.e. it
# read as "the decoder does not work here" rather than as a bug.
DEFN_M = re.compile(r'(?m)^(lbl_[0-9A-Fa-f]+):')
# A CONVERTED function's definition in src/: `[static] [asm] <type> lbl_X(` at
# column 0.  Deliberately matches the `asm` stubs too -- they are entry points
# just the same, and a stub's label is already in the asm scan anyway.
CDEFN = re.compile(r'(?m)^(?:static\s+)?(?:asm\s+)?[A-Za-z_][A-Za-z0-9_ \*]*?\b'
                   r'(lbl_[0-9A-Fa-f]+)\s*\(')
BRANCH = re.compile(r'(?m)^/\* [0-9A-F]{8} [0-9A-F]{8} \*/[ \t]+b[a-z]*[+-]?[ \t]+'
                    r'[^\n]*?(lbl_[0-9A-Fa-f]+)')
MAGIC_S = ['0x43300000', '0x80000000']
MAGIC_U = ['0x43300000', '0x00000000']


def data_text(tree, stem):
    """The module's whole .data/.rodata blob: the main .s plus carve segments."""
    out = ''
    for p in ([os.path.join(tree, 'asm', stem + '.s')] +
              sorted(glob.glob(os.path.join(tree, 'asm', stem + '_d*.s')))):
        if os.path.exists(p):
            out += open(p, errors='surrogateescape').read()
    return out


def defined_labels(tree, stem):
    """Every function entry point in the module -- STILL-ASM *AND* CONVERTED.

    Both halves are required, and run 11 proved it by regression.  Scanning only
    `asm/nonmatchings/` measures the bias against still-asm labels alone, so
    every `_prolog +` target whose function has since been CONVERTED counts as a
    miss: mini_fight's hit rate decayed 149/149 -> 146/149 across its own run and
    the tool began printing "distrust d-JUMPTBL" at a module that gates GOLDEN.
    The hit rate is supposed to say "the decoder works here", and instead it was
    silently reporting "this module made progress".
    """
    out = set()
    for f in glob.glob(os.path.join(tree, 'asm', 'nonmatchings', stem, '*.s')):
        b = os.path.basename(f)[:-2]
        if re.fullmatch(r'lbl_[0-9A-Fa-f]+', b):
            out.add(int(b[4:], 16))
        for m in DEFN_M.finditer(open(f, errors='surrogateescape').read()):
            out.add(int(m.group(1)[4:], 16))
    for f in glob.glob(os.path.join(tree, 'src', stem + '*.c')):
        for m in CDEFN.finditer(open(f, errors='surrogateescape').read()):
            out.add(int(m.group(1)[4:], 16))
    return out


def prolog_bias(blob, deflabs):
    """Derive the `_prolog + X` -> label-address offset for THIS module.

    Returns (bias, hits, total, runner_up_hits).  Never hard-code the result --
    it is 0xD0 for five modules, 0xC8 for three and 0x14C for mini_golf.
    """
    tgts = {int(h, 16) for h in
            re.findall(r'\.4byte\s+_prolog\s*\+\s*(0x[0-9A-Fa-f]+)', blob)}
    if not tgts or not deflabs:
        return None, 0, len(tgts), 0
    scored = sorted(((sum(1 for t in tgts if t + b in deflabs), b)
                     for b in range(0, 0x400, 4)), reverse=True)
    (h1, b1), (h2, _) = scored[0], scored[1]
    return b1, h1, len(tgts), h2


class MagicTable(dict):
    """A {label: 's'|'u'} table that also says WHERE it came from.

    A plain dict, so every existing caller keeps working; `.src` is `'linked'`
    when the authoritative linked-image derivation ran and `'blob'` when only
    the blind asm scan was available.  A caller that reports reachability MUST
    check it -- a `'blob'` table is an upper bound, not evidence (§ docstring).
    """
    src = 'blob'


# "00000198 g       .rodata	00000000 lbl_00011D00"   (objdump -t on the .plf)
PLF_SYM = re.compile(r'^([0-9a-f]{8})\s+\S+\s+\.rodata\s+[0-9a-f]{8}\s+'
                     r'(lbl_[0-9A-Fa-f]+)\s*$')
MAGIC_S_HEX = '4330000080000000'
MAGIC_U_HEX = '4330000000000000'


def magic_labels_linked(tree, mod):
    """{label: 's'|'u'} read off the LINKED `.plf`, or None if unavailable.

    This is the authoritative source; see the module docstring for why the asm
    blob is not.  Best-effort by design -- a tree with no build, or no objdump,
    gets None and the caller falls back to the blob scan rather than failing.

    RESOLVE FROM `objdump -t`, NEVER from the address in the label's name.  The
    `.plf` does NOT place things at their REL addresses (run 20 hazard): here
    `lbl_00011D00` lives at 0x198, and reading 0x11D00 would silently classify
    whatever happens to sit there.
    """
    if mod not in TARGETS:
        return None
    plf = os.path.join(tree, TARGETS[mod] + '.plf')
    if not os.path.exists(plf):
        return None
    try:
        syms = subprocess.run([OBJDUMP, '-t', plf], capture_output=True,
                              text=True)
        dump = subprocess.run([OBJDUMP, '-s', '-j', '.rodata', plf],
                              capture_output=True, text=True)
    except OSError:
        return None

    words = {}
    for m in re.finditer(r'^\s*([0-9a-f]+)\s+((?:[0-9a-f]{8} ?){1,4})',
                         dump.stdout, re.M):
        base = int(m.group(1), 16)
        for i, w in enumerate(m.group(2).split()):
            words[base + 4 * i] = w

    out = {}
    for ln in syms.stdout.splitlines():
        m = PLF_SYM.match(ln.strip())
        if not m:
            continue
        addr = int(m.group(1), 16)
        hi, lo = words.get(addr), words.get(addr + 4)
        if hi is None or lo is None:
            continue
        if hi + lo == MAGIC_S_HEX:
            out[m.group(2).lower()] = 's'
        elif hi + lo == MAGIC_U_HEX:
            out[m.group(2).lower()] = 'u'
    return out


def magic_labels(blob):
    """{label: 's'|'u'} for every magic double in the blob, BOTH patterns.

    FALLBACK ONLY -- blind to any magic whose bytes are not in the asm, which
    is every carved and every already-converted one.  Prefer
    `magic_labels_linked()`; `census()` unions them with that one winning.
    """
    out, cur, words = {}, None, []

    def flush():
        if cur:
            if words[:2] == MAGIC_S:
                out[cur.lower()] = 's'
            elif words[:2] == MAGIC_U:
                out[cur.lower()] = 'u'

    for ln in blob.splitlines():
        m = DEFN.match(ln)
        if m:
            flush()
            cur, words = m.group(1), []
            continue
        w = re.match(r'\s*\.4byte\s+(0x[0-9A-Fa-f]+)', ln)
        if w and cur:
            words.append(w.group(1).lower())
    flush()
    return out


def still_asm(tree, stem):
    """{row: owning .c} for rows some src/<stem>*.c still #includes."""
    out = {}
    inc = re.compile(r'#include "\.\./asm/nonmatchings/%s/([A-Za-z0-9_]+)\.s"'
                     % re.escape(stem))
    for p in sorted(glob.glob(os.path.join(tree, 'src', '%s*.c' % stem))):
        for lbl in inc.findall(open(p, errors='ignore').read()):
            out[lbl] = os.path.basename(p)
    return out


def parse_row(path):
    rows, pend = [], None
    for ln in open(path, errors='surrogateescape'):
        m = DEFN.match(ln.strip())
        if m:
            pend = m.group(1)
            continue
        m = INSN.match(ln.rstrip())
        if m:
            rows.append((int(m.group(1), 16), m.group(2), m.group(3),
                         m.group(4), pend))
            pend = None
    return rows


def split_functions(insns, txt, arms, external):
    """-> [(name, addr, body, is_leaf, settled)] for one row.

    `external` is the set of labels referenced from OUTSIDE this file (another
    row, or the data blob).  That is a SECOND, independent source of positive
    evidence, and without it the census finds ~one function per row and misses
    every vtable-only entry -- exactly the miscount that made mini_pilot's table
    wrong by 2,352 instructions.  It is the same rule tools/rel_rowcount.py
    uses, and the two must agree.
    """
    branched = set(BRANCH.findall(txt))
    # A `_prolog + X` data target is a CODE POINTER -- but that is not the same
    # thing as a switch arm.  It is equally often a VTABLE ENTRY, i.e. a real
    # function.  mini_race converted 10 such entries in run 10 and every one
    # MATCHED; treating them all as arms throws exactly those away.
    #
    # The discriminator is the row, not the target: a switch arm only exists in
    # a row that actually contains a `bctr`.  In a row with no `bctr`, every
    # code pointer into it is a function pointer.
    row_has_bctr = any(x[2] == 'bctr' for x in insns)
    bounds = [(0, False, True)]
    for i, (a, w, op, args, lab) in enumerate(insns):
        if i == 0 or not lab:
            continue
        if lab in branched:
            continue                       # an ordinary in-row block
        prev_op = insns[i - 1][2]
        nxt = ' '.join(x[2] for x in insns[i + 1:i + 4])
        prologue = ('mflr' in nxt or 'stwu' in nxt)
        if lab in external:
            # Something outside this file calls it or takes its address, so it
            # is an entry whatever its prologue looks like.
            bounds.append((i, True, True))
            continue
        if prev_op != 'blr':
            continue                       # not after a real return
        if row_has_bctr and a in arms:
            continue                       # genuinely ambiguous: assume an arm
        # A prologue confirms it outright; without one it is a LEAF CANDIDATE.
        bounds.append((i, True, prologue))
    bounds.append((len(insns), False, True))
    out = []
    for k in range(len(bounds) - 1):
        s, is_leaf, settled = bounds[k]
        e = bounds[k + 1][0]
        name = insns[s][4] or ('lbl_%08X' % insns[s][0])
        out.append((name, insns[s][0], insns[s:e], is_leaf, settled))
    return out


def census(tree, stem, mod):
    blob = data_text(tree, stem)
    deflabs = defined_labels(tree, stem)
    bias, hits, ntgt, runner = prolog_bias(blob, deflabs)
    arms = set()
    if bias is not None:
        arms = {t + bias for t in
                (int(h, 16) for h in
                 re.findall(r'\.4byte\s+_prolog\s*\+\s*(0x[0-9A-Fa-f]+)', blob))}
    # The asm blob is the FALLBACK; the linked image is authoritative where it
    # is available.  Measured strict superset across all nine modules, zero
    # disagreements -- so this can only ever ADD labels, never reclassify one.
    # The asm blob is the FALLBACK; the linked image is authoritative where it
    # is available.  Measured strict superset across all nine modules, zero
    # disagreements -- so this can only ever ADD labels, never reclassify one.
    magics = MagicTable(magic_labels(blob))
    linked = magic_labels_linked(tree, mod)
    if linked is not None:
        magics.update(linked)
        magics.src = 'linked'
    own = still_asm(tree, stem)

    # Where is each label DEFINED, and which are referenced from ELSEWHERE?
    # (Same construction as rel_rowcount.  The row's own label has no `lbl_X:`
    # line in its own .s -- it names the enclosing `asm void` block -- so seed
    # it from the filename or cross-file references to it are invisible.)
    rowfiles = sorted(glob.glob(os.path.join(tree, 'asm', 'nonmatchings',
                                             stem, '*.s')))
    text = {f: open(f, errors='surrogateescape').read() for f in rowfiles}
    defined_in = {}
    for f in rowfiles:
        b = os.path.basename(f)[:-2]
        if re.fullmatch(r'lbl_[0-9A-Fa-f]+', b):
            defined_in.setdefault(b, f)
        for m in DEFN_M.finditer(text[f]):
            defined_in.setdefault(m.group(1), f)
    external = set()
    for f, t in list(text.items()) + [(None, blob)]:
        for lbl in set(re.findall(r'(lbl_[0-9A-Fa-f]+)', t)):
            owner = defined_in.get(lbl)
            if owner is not None and owner != f:
                external.add(lbl)

    table = []
    for row in sorted(own):
        p = os.path.join(tree, 'asm', 'nonmatchings', stem, row + '.s')
        if not os.path.exists(p):
            continue
        txt = text.get(p) or open(p, errors='surrogateescape').read()
        for name, addr, body, is_leaf, settled in \
                split_functions(parse_row(p), txt, arms, external):
            ops = [b[2] for b in body]
            # MNEMONIC AND OPERANDS together.  Searching the operand string
            # alone for `lis rN,0x4330` can never match -- the mnemonic lives in
            # a different capture group -- so a-BLOCKED came out as 0 for every
            # module and every blocked function was silently filed under b-POOL.
            args = ' '.join('%s %s' % (b[2], b[3]) for b in body)
            has_bctr = 'bctr' in ops
            # ONLY an inline conversion spends the magic budget (run 6).
            inline_magic = bool(re.search(r'lis\s+r\d+,\s*0x4330', args))
            reads = sorted({magics[m] for m in magics
                            if re.search(r'\b%s\b' % m, args, re.I)})
            pool = any(o in ('lfs', 'lfd', 'lfsu', 'lfdu') for o in ops)
            cat = ('d-JUMPTBL' if has_bctr else
                   'a-BLOCKED' if inline_magic else
                   'b-POOL' if pool else 'c-FREE')
            # RUN 20: keep the magic LABELS, not just their S/U kinds.
            # rel_reach.py needs the label to ask "does this function's OWN TU
            # already emit the magic at that address?", which is the question
            # the REACHABLE column below gets wrong in every module.
            reads_labels = sorted({m for m in magics
                                   if re.search(r'\b%s\b' % m, args, re.I)})
            # WHICH magic(s) an inline conversion needs -- a SET, because one
            # function can do both a signed and an unsigned conversion and then
            # needs BOTH, which no single 8-byte .rodata can serve.
            # (mini_billiards' `4634` and `2C80` are exactly this: run 19 found
            # by hand that they want a signed and an unsigned magic 0xB8 apart,
            # so no TU's contiguous 16-byte block can ever cover them. A
            # single-kind test promotes them wrongly.)
            # Each signed conversion site carries `xoris rX,rY,0x8000`; each
            # unsigned one does not. So compare the counts.
            n_lis = len(re.findall(r'lis\s+r\d+,\s*0x4330', args))
            n_sgn = len(re.findall(r'xoris\s+r\d+,\s*r\d+,\s*0x8000', args))
            needs_kind = ''
            if inline_magic:
                needs_kind = ('s' if n_sgn else '') + ('u' if n_lis > n_sgn
                                                       else '')
            table.append(dict(module=mod, row=row, fn=name, addr='%08X' % addr,
                              insn=len(body), cat=cat, owner=own[row],
                              leaf=is_leaf, settled=settled,
                              reads_magic=''.join(reads),
                              reads_labels=reads_labels,
                              needs_kind=needs_kind))
    return table, (bias, hits, ntgt, runner), magics


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('modules', nargs='*')
    ap.add_argument('--tree', help='defaults to this repo')
    ap.add_argument('--detail', action='store_true')
    ap.add_argument('--json')
    a = ap.parse_args()

    tree = a.tree or REPO
    root = os.path.join(tree, 'asm', 'nonmatchings')
    present = sorted(os.path.basename(d)
                     for d in glob.glob(os.path.join(root, '*'))
                     if os.path.isdir(d))
    mods = []
    for m in (a.modules or sorted(MODULES)):
        stem = MODULES.get(m, m)
        if stem in present:
            mods.append((m, stem))
        else:
            sys.exit('no asm/nonmatchings/%s in %s\n  present: %s'
                     % (stem, tree, ', '.join(present)))

    allrows, gtot = [], {}
    for mod, stem in mods:
        table, (bias, hits, ntgt, runner), magics = census(tree, stem, mod)
        allrows += table
        by = {}
        for t in table:
            by.setdefault(t['cat'], []).append(t)
        tot = sum(t['insn'] for t in table)
        reach = [t for t in table if t['cat'] in ('c-FREE', 'b-POOL')]
        unsettled = [t for t in table if not t['settled']]
        ns = sum(1 for v in magics.values() if v == 's')
        nu = sum(1 for v in magics.values() if v == 'u')
        biasnote = ('bias 0x%X (%d/%d, next %d)' % (bias, hits, ntgt, runner)
                    if bias is not None else 'no _prolog+ targets')
        if bias is not None and ntgt and hits < ntgt:
            biasnote += '  !! NOT 100% -- distrust d-JUMPTBL'
        print('=== %-15s %3d fns / %6d insn   magic: %d signed + %d unsigned   %s'
              % (mod, len(table), tot, ns, nu, biasnote))
        if magics.src != 'linked':
            # Run 20 caught this tool reporting `0 signed + 1 unsigned` for
            # mini_bowling when the truth was 6 + 1.  An under-count here reads
            # as authoritative and silently under-reports reads_magic, so never
            # let it print without saying the link was not consulted.
            print('      !! MAGIC COUNT IS FROM THE ASM BLOB -- no %s.plf, or '
                  'objdump missing. It CANNOT see a carved or' % TARGETS[mod])
            print('         already-converted magic and is a LOWER BOUND '
                  '(mini_bowling read 0+1 this way; the truth is 6+1).')
            print('         Build the module first for the real figure.')
        for cat in ('c-FREE', 'b-POOL', 'a-BLOCKED', 'd-JUMPTBL'):
            sel = by.get(cat, [])
            if sel:
                print('      %-11s %3d fns / %6d insn'
                      % (cat, len(sel), sum(s['insn'] for s in sel)))
        print('      %-11s %3d fns / %6d insn  = %d%% of what remains'
              % ('REACHABLE', len(reach), sum(s['insn'] for s in reach),
                 round(100.0 * sum(s['insn'] for s in reach) / tot) if tot else 0))
        if unsettled:
            print('      %-11s %3d fns / %6d insn  -- no prologue and nothing '
                  'settles them. READ THESE;\n%s all 7 of test_mode\'s were real '
                  'functions and 6 matched.'
                  % ('leaf?', len(unsettled), sum(s['insn'] for s in unsettled),
                     ' ' * 18))
        if a.detail:
            for t in sorted(table, key=lambda x: (x['cat'], -x['insn'])):
                print('        %-20s %8s %5d  %-11s %-24s%s%s'
                      % (t['fn'], t['addr'], t['insn'], t['cat'], t['owner'],
                         ' LEAF' if t['leaf'] else '',
                         ' leaf?' if not t['settled'] else ''))
        for k in ('fns', 'insn'):
            gtot[k] = gtot.get(k, 0)
        gtot['fns'] = gtot.get('fns', 0) + len(table)
        gtot['insn'] = gtot.get('insn', 0) + tot
        for cat in ('c-FREE', 'b-POOL', 'a-BLOCKED', 'd-JUMPTBL'):
            gtot[cat] = gtot.get(cat, 0) + sum(s['insn'] for s in by.get(cat, []))

    print('\nPROJECT TOTAL: %d still-asm functions / %d insn' % (gtot['fns'], gtot['insn']))
    for cat in ('c-FREE', 'b-POOL', 'a-BLOCKED', 'd-JUMPTBL'):
        print('  %-11s %6d insn' % (cat, gtot.get(cat, 0)))
    print('  %-11s %6d insn  REACHABLE TODAY, no carve and no merge'
          % ('c+b', gtot.get('c-FREE', 0) + gtot.get('b-POOL', 0)))
    if a.json:
        json.dump(allrows, open(a.json, 'w'), indent=1)
        print('\nwrote %s' % a.json)
    return 0


if __name__ == '__main__':
    sys.exit(main())
