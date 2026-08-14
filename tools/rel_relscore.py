#!/usr/bin/env python3
"""rel_relscore.py -- THE SCORER THAT CANNOT BE FOOLED BY AN UNFILLED SYMBOL.

    golden   3BC40000   addi r30, r4, lbl_10001AF0@l
    draft    3BC40000   addi r30, r4, 0
    -------------------------------------------------
    SAME 32-BIT WORD.  NOT THE SAME PROGRAM.

Every word-comparing scorer in `tools/` -- `rel_sdiff`, `rel_ablind`,
`rel_ascore`, `rel_tuprobe` -- calls that a MATCH, because the relocated field
is ZERO in the object and ZERO in the `.s` until the linker fills it.  The
symbol lives in the RELOCATION RECORD, which is outside the instruction stream,
and no scorer in this project has ever read it.  mini_race spent ~62 real links
in run 31 on a "4 in 3" near-miss built on exactly this.

This tool reads the relocation records on BOTH sides and reports a word that is
only equal because its symbol field is unfilled -- or because it points at a
DIFFERENT symbol -- as a DIFF, WITH THE SYMBOL NAMED.

WHAT IT COMPARES, AND WHERE EACH SIDE COMES FROM

  GOLDEN: the operand TEXT of `asm/nonmatchings/<stem>/<label>.s`, which is the
    REL's own relocation table written back into the disassembly:
      `lis r4, sym@ha`            -> HA sym+0
      `addi r30, r4, sym@l`       -> LO sym+0
      `lfd f0, (sym+0x20)@l(r3)`  -> LO sym+0x20      (6 such rows in the corpus)
      `bl callee`                 -> CALL callee      (callee not a label in
                                                       this file)
  BUILT: `objdump -dr` on the OBJECT (or on the `.plf` with --plf):
      R_PPC_ADDR16_HA sym[+a]     -> HA sym+a
      R_PPC_ADDR16_LO sym[+a]     -> LO sym+a
      R_PPC_REL24     sym[+a]     -> CALL sym
      a `bl`/`b` with NO relocation but an objdump `<sym>` annotation
                                  -> CALL sym         (assembler-resolved)

  THREE FICTIONS THIS CLOSES, ALL OF WHICH SCORE AS MATCHES TODAY:
    1. golden has HA/LO, the draft has nothing there (an incomplete draft:
       `addi rD,rA,0` == `addi rD,rA,sym@l`).
    2. golden has HA/LO sym, the draft has HA/LO OTHERSYM (the draft reads the
       WRONG GLOBAL; the words are identical because both fields are zero).
    3. golden `bl A`, the draft `bl B`.  `nz_at` reduces EVERY `bl` on both
       sides to 0x48000001, so a call to the wrong function is currently
       invisible to all four scorers.  11,930 `bl`s in the corpus are scored
       this way.

WHAT IT STILL DOES NOT DO -- READ THIS BEFORE QUOTING A NUMBER FROM IT

  IT DOES NOT LINK (unless you pass --plf, and that only reads a link somebody
  else made).  It says nothing about `.rodata` placement, section sizes,
  `elf2rel`, or the merge/carve budget.
  `python tools/rel_sweep.py <mod> --gate` from DELETED objects remains the
  ONLY proof of a match.  What this adds to `rel_tuprobe` is that its
  "positional N of N" is no longer a claim the linker can refuse.

  A 100% TRUE score here is NECESSARY, NOT SUFFICIENT.  It is, however, the
  first score in this project that is not silently satisfied by a hole.

usage -- RUN IT FROM THE MODULE TREE, like rel_ablind/rel_tuprobe:
  cd C:/tmp/smbm/<module>
  python tools/rel_relscore.py <label>                  # CONTROL: owner as-is
  python tools/rel_relscore.py <label> body.c [more.c]  # splice each body

  --module M     override the module inferred from the tree directory name
                 (required when the tree is not named after a module, e.g. the
                 main repo).  Refused when you are standing in ANOTHER
                 module's warm copy -- same trap rel_tuprobe refuses.
  --owner PATH   the owner TU (default: the src/<stem>*.c that DEFINES <label>)
  --object PATH  score this ALREADY-BUILT object; do not compile anything
  --plf [PATH]   score the module's linked .plf (needs the .map); this is the
                 mode that scores a REAL LINK
  --work DIR     scratch dir (default C:/tmp/rel_relscore_<module>_<pid>)
  --show N       print up to N differing rows (default 12; 0 for none)
  --peephole X   `auto` (default) restores GOLDEN'S regime by prepending
                 `#pragma peephole on` when an asm FUNCTION earlier in the
                 owner has deoptimised the rest of the TU; `off` FORCES the
                 deoptimised regime.  ** RUN 38: this flag did not exist and
                 the regime was not consulted at all, while this tool IMPORTS
                 rel_tuprobe -- which does consult it -- for the splice. **
                 The two tools therefore compiled DIFFERENT PROGRAMS from the
                 same body on 23 of the project's 163 live rows (mini_fight 14,
                 mini_golf 4, mini_race 3, mini_billiards 1, mini_bowling 1),
                 and rel_relscore's was the wrong one.  Semantics are
                 rel_tuprobe's, verbatim, so the two agree row-for-row.
  --quiet        one summary line per body, no rows
  ** RUN 39: build_flat() no longer reads to the END OF THE OBJECT.  It reads
     GOLDEN'S ROW -- the label's symbol plus any following symbol golden's own
     `.s` defines a label for -- so a SHORT draft is no longer scored against
     the next function's prologue and no longer inherits its relocations.
     MEASURED n = 1,160 golden rows: 8 are genuinely multi-function (all in
     mini_fight/mini_pilot/mini_race/test_mode) and the local-label bound
     covers 8/8 of them and over-reads on 0/1,152 of the rest. **
  --allow-stub   score a body that is still an `#include`d asm stub.  OFF by
                 default: a stub is assembled from GOLDEN ITSELF, so it scores
                 100% words AND 100% relocs against itself.  That was one of
                 run 32's four fixed fictions and this tool REFUSES it rather
                 than printing a warning under a green number.
  --selftest     run the internal parser checks and exit

  THERE IS NO --tree, for the reason rel_ablind and rel_tuprobe have none.

EXIT CODES ARE A CONTRACT:
  0  every body compiled and was scored
  1  a REAL NEGATIVE ANSWER: a body failed to compile
  2  ERROR or REFUSAL: bad usage, unknown module/label/owner, missing golden
     `.s`, missing mwcc/objdump, splice anchor missing, a body that produced no
     such function, or a still-asm stub without --allow-stub.  A mistyped flag
     is ALWAYS 2, never 1.
     ** RUN 38: a per-body REFUSAL (a malformed or unanchored directive) no
     longer aborts the run.  The offending body is skipped, EVERY OTHER BODY IS
     STILL SCORED, and the exit code is 2. **  Before this, a well-formed body
     listed AFTER a bad one was never scored and nothing said so.
"""
import difflib
import glob
import os
import re
import subprocess
import sys
import time

sys.dont_write_bytecode = True


def die(msg):
    sys.stderr.write('rel_relscore: %s\n' % msg)
    sys.exit(2)


# --------------------------------------------------------------------------
# rel_tuprobe is imported, not copied.  `nz_at`, the comment-safe splicer and
# the compile flags must stay BIT-IDENTICAL to the tool whose number this one
# extends -- a second copy of nz_at is a second thing to drift.  (Two hand-
# written ports of a scorer in this project both shipped normaliser defects
# that ate matching instructions; the fix was to stop re-deriving.)
def _tools_dir():
    here = os.path.dirname(os.path.abspath(__file__))
    cands = [here, os.environ.get('RELSCORE_TOOLS') or '',
             os.path.join(os.getcwd(), 'tools')]
    for c in cands:
        if c and os.path.exists(os.path.join(c, 'rel_tuprobe.py')):
            return c
    die('cannot find rel_tuprobe.py (looked in %s).  This tool imports it so\n'
        'that nz_at and the splicer have ONE definition.  Set RELSCORE_TOOLS.'
        % ', '.join(repr(c) for c in cands if c))


sys.path.insert(0, _tools_dir())
import rel_tuprobe as T                                          # noqa: E402

MODULES = T.MODULES
OBJDUMP = T.OBJDUMP

# --------------------------------------------------------------------------
# GOLDEN SIDE: relocation records recovered from the `.s` operand text.

# `sym@ha`, `sym@l`, and the parenthesised addend form the corpus uses 6 times
# (mini_golf lbl_0000F7E8: `lis r3, (lbl_000264A8+0x20)@ha`).
_AT_RE = re.compile(
    r'(?:\(\s*([A-Za-z_.$][\w.$]*)\s*([+-])\s*(0x[0-9A-Fa-f]+|\d+)\s*\)'
    r'|([A-Za-z_.$][\w.$]*))@(ha|l|h)\b')
_LOCAL_RE = re.compile(r'^([A-Za-z_.$][\w.$]*):', re.M)
_ROW_RE = re.compile(
    r'^\s*/\*\s*([0-9A-Fa-f]+)\s+([0-9A-Fa-f]{8})\s*\*/\s*(\S+)\s*(.*)$')
_REGWORD_RE = re.compile(r'^(?:r\d+|f\d+|cr\d+|lt|gt|eq|so|un|ne|nl|ng|ns)$')


def gold_rows(path):
    """golden `.s` -> ([(addr, word, mnemonic, operands, text)], set(locals)).

    The local-label set is every `name:` in the FILE, so a branch inside the
    function -- which is resolved on both sides and is not a relocation -- is
    never mistaken for a call.
    """
    txt = open(path, errors='ignore').read()
    locals_ = set(_LOCAL_RE.findall(txt))
    rows = []
    for ln in txt.splitlines():
        m = _ROW_RE.match(ln)
        if m:
            ops = re.sub(r'\s+', ' ', m.group(4)).strip()
            rows.append((int(m.group(1), 16), int(m.group(2), 16),
                         m.group(3), ops,
                         (m.group(3) + ' ' + ops).strip()))
    return rows, locals_


def gold_refs(rows, locals_):
    """-> {index: (kind, symbol, addend)}.  At most one per instruction."""
    out = {}
    for i, (_a, _w, mn, ops, _t) in enumerate(rows):
        m = _AT_RE.search(ops)
        if m:
            if m.group(4):
                sym, add = m.group(4), 0
            else:
                sym = m.group(1)
                add = int(m.group(3), 0) * (-1 if m.group(2) == '-' else 1)
            kind = {'ha': 'HA', 'l': 'LO', 'h': 'HI'}[m.group(5)]
            out[i] = (kind, sym, add)
            continue
        if mn in ('bl', 'b', 'ba', 'bla'):
            tgt = ops.split(',')[-1].strip()
            if (re.fullmatch(r'[A-Za-z_.$][\w.$]*', tgt)
                    and tgt not in locals_
                    and not _REGWORD_RE.match(tgt)):
                out[i] = ('CALL', tgt, 0)
    return out


# --------------------------------------------------------------------------
# BUILT SIDE: relocation records from objdump -dr.

_INSN_RE = re.compile(r'^\s*([0-9a-f]+):\s+((?:[0-9a-f]{2} ){4})\s*(.*)$')
_RELOC_RE = re.compile(r'^\s*([0-9a-f]+):\s+(R_[A-Z0-9_]+)\s+(\S+)\s*$')
_SYMHDR_RE = re.compile(r'^([0-9a-f]+) <(.+)>:')
_ANNOT_RE = re.compile(r'<([A-Za-z_.$][\w.$]*)(?:([+-])0x([0-9a-f]+))?>')

RELMAP = {'R_PPC_ADDR16_HA': 'HA', 'R_PPC_ADDR16_LO': 'LO',
          'R_PPC_ADDR16_HI': 'HI', 'R_PPC_ADDR16': 'LO',
          'R_PPC_REL24': 'CALL', 'R_PPC_REL14': 'CALL',
          'R_PPC_ADDR24': 'CALL', 'R_PPC_EMB_SDA21': 'SDA21'}


def _parse_reloc_sym(s):
    m = re.match(r'^([^+\-]+)(?:([+-])(0x[0-9A-Fa-f]+|\d+))?$', s)
    if not m:
        return s, 0
    add = int(m.group(3), 0) if m.group(3) else 0
    if m.group(2) == '-':
        add = -add
    return m.group(1), add


def disasm_dr(path, extra=()):
    """-> ([(sym, [(word, text, ref_or_None), ...])], nrelocs_seen).

    `ref` is (kind, symbol, addend) or None.  Relocation lines in `objdump -dr`
    carry a BYTE offset (a D-form's ADDR16_LO sits at insn+2), so a reloc is
    attached to the instruction whose word contains it.
    """
    cmd = [OBJDUMP, '-dr'] + list(extra) + [path]
    r = subprocess.run(cmd, capture_output=True, text=True)
    if r.returncode != 0 and not r.stdout:
        die('objdump failed on %s:\n  %s\n  %s'
            % (path, ' '.join(cmd), (r.stderr or '').strip()))
    syms, cur, last = [], None, None
    nrel = 0
    for ln in r.stdout.splitlines():
        m = _SYMHDR_RE.match(ln)
        if m:
            cur = (m.group(2), [])
            syms.append(cur)
            last = None
            continue
        m = _RELOC_RE.match(ln)
        if m and last is not None:
            nrel += 1
            kind = RELMAP.get(m.group(2))
            if kind is None:
                # An unknown relocation type is NOT "no relocation": say so.
                kind = m.group(2)
            sym, add = _parse_reloc_sym(m.group(3))
            lst, idx = last
            w, txt, old = lst[idx]
            lst[idx] = (w, txt, (kind, sym, add) if old is None else old)
            continue
        m = _INSN_RE.match(ln)
        if m and cur is not None:
            w = int(m.group(2).replace(' ', ''), 16)
            txt = re.sub(r'\s+', ' ', m.group(3)).strip()
            cur[1].append((w, txt, None))
            last = (cur[1], len(cur[1]) - 1)
    return syms, nrel


def annot_call(word, txt, i, n):
    """A `bl`/`b` the ASSEMBLER already resolved inside the object: no
    relocation record, but objdump prints `<sym>`.  Without this a same-object
    call would look like "golden calls X, the draft calls nothing".

    ⚠ THE LOCALITY RULE IS `nz_at`'s, NOT objdump's.  A local `b` inside the
    function also prints an annotation -- `b 148 <lbl_00000228+0x148>` -- and
    reading THAT as a call manufactured a fiction on the very first control row
    this tool was run on (`gold [-] | built [CALL lbl_00000228+0x148]`, on a
    function that is byte-identical).  A non-call branch whose target is inside
    golden's window is LOCAL and carries no relocation, which is exactly the
    condition `nz_at` uses to decide whether to keep the displacement, and
    exactly the condition the golden side uses (a label defined in the `.s`).
    """
    if (word >> 26) != 18:
        return None
    if not (word & 1):                       # LK=0: b, not bl
        d = word & 0x03FFFFFC
        if d & 0x02000000:
            d -= 0x04000000
        tgt = i + d // 4
        if 0 <= tgt < n:
            return None                      # local branch: not a call
    m = _ANNOT_RE.search(txt)
    if not m:
        return None
    add = int(m.group(3), 16) if m.group(3) else 0
    if m.group(2) == '-':
        add = -add
    return ('CALL', m.group(1), add)


# --------------------------------------------------------------------------
# scoring


# ⚠ NOT EVERY SYMBOL NAME IS COMPARABLE, AND ASSUMING THEY ALL ARE MANUFACTURES
# 157 FALSE POSITIVES.  MEASURED: the first full-corpus gate of this tool
# reported "reloc mismatch" on 157 of 942 ALREADY-MATCHED functions, all with
# 100% word agreement.  Every one was the same shape:
#     gold  lfd f1, lbl_0001CBD0@l(r3)   [LO lbl_0001CBD0]
#     built lfd f1, 0(r3)                [LO @142]
# `@142` is mwcc's own name for a FLOAT/DOUBLE LITERAL POOL entry -- a local
# symbol numbered per object -- and `lbl_0001CBD0` is the address-derived name
# the `.s` dump gave the same bytes after the link.  The relocation is CORRECT;
# only the NAME is unshareable, and it is unshareable by construction.
# So: an anonymous built symbol is scored on KIND (a missing relocation is still
# a hard DIFF) plus a per-function BIJECTION check (golden's two distinct pool
# entries may not both map onto one of the draft's), and its NAME is reported
# UNCOMPARABLE rather than silently equal or silently different.
# MEASURED, all three forms, by dumping `objdump -t` on the owners the gate
# disagreed on:
#   @117 @138 @163 ...   `l O .rodata` literal-pool objects, numbered per TU
#   ...rodata.0          `l  .rodata` size-0 marker for the TU's OWN section
#                        start -- golden calls the same address lbl_000264A8
#   .rodata / .data      bare section symbols
# Golden expresses every one of them as `<section-start-label> + offset`, so
# the alias map below must carry the ADDEND, not just the name.
_ANON_RE = re.compile(r'^(?:@\d+(?:_\d+)?'
                      r'|\.{2,}\w+(?:\.\d+)?'
                      r'|\.(?:text|rodata|data|sdata\d?|bss|sbss\d?|ctors|'
                      r'dtors)(?:\.\d+)?'
                      r'|L_?\d+|\$\d+)$')


def anon(sym):
    return bool(_ANON_RE.match(sym))


def norm_ref(r):
    """Golden CALL records carry no addend (the `.s` prints `bl foo`, never
    `bl foo+0x8`), so a CALL is compared on the SYMBOL only.  HA/LO compare
    kind, symbol AND addend -- `sym@l` and `(sym+0x20)@l` are different words
    at link time and must be different here.  Normalising once means the
    positional check and the difflib alignment cannot disagree."""
    if r is None:
        return None
    return (r[0], r[1]) if r[0] == 'CALL' else r


def ref_verdict(g, b):
    """-> 'OK' | 'MISSING' | 'EXTRA' | 'KIND' | 'SYMBOL' | 'ADDEND' | 'ANON'

    'ANON' means: the relocation is present and of the right kind on both
    sides, but the built symbol is a compiler-local name that cannot be
    compared with golden's address-derived one.  It is NOT counted as a match
    and NOT counted as a diff -- it is carried to the bijection check.
    """
    if g is None and b is None:
        return 'OK'
    if g is None:
        return 'EXTRA'
    if b is None:
        return 'MISSING'
    if g[0] != b[0]:
        return 'KIND'
    if anon(b[1]) or anon(g[1]):
        return 'ANON'
    if g[1] != b[1]:
        return 'SYMBOL'
    if g[0] != 'CALL' and g[2] != b[2]:
        return 'ADDEND'
    return 'OK'


def refs_equal(a, b):
    return ref_verdict(a, b) in ('OK', 'ANON')


def fmt_ref(r):
    if r is None:
        return '-'
    k, s, a = r
    return '%s %s%s' % (k, s, ('%+#x' % a) if a else '')


def score(built, gold, grefs, show):
    """built: [(word, text, ref)]   gold: [(addr, word, mn, ops, text)]

    Returns a dict.  `words` is EXACTLY rel_tuprobe's positional statistic
    (same nz_at, same truncation to golden's length), so the two tools can be
    read side by side; everything else is new.
    """
    n = len(gold)
    ge = [T.nz_at(g[1], i, n) for i, g in enumerate(gold)]
    be = [T.nz_at(b[0], i, n) for i, b in enumerate(built[:n])]
    m = min(n, len(be))
    brefs = {}
    for i in range(m):
        r = built[i][2] or annot_call(built[i][0], built[i][1], i, n)
        if r is not None:
            brefs[i] = r

    # ---- PASS 1: align on (word, RELOCATION KIND).  Kind-aware, name-blind.
    # This exists only to pair up instructions so the anonymous literal-pool
    # names can be learned; it can never be inflated by a name it cannot read.
    def kind(d, i):
        r = d.get(i)
        return r[0] if r else None
    gk = [(ge[i], kind(grefs, i)) for i in range(m)]
    bk = [(be[i], kind(brefs, i)) for i in range(m)]
    sm = difflib.SequenceMatcher(None, gk, bk, autojunk=False)
    g2b, b2g = {}, {}
    for tag, i1, i2, j1, j2 in sm.get_opcodes():
        if tag != 'equal':
            continue
        for k in range(i2 - i1):
            gr, br = grefs.get(i1 + k), brefs.get(j1 + k)
            if gr and br and gr[0] == br[0] and anon(br[1]):
                # KEYED ON (symbol, addend), NOT on the symbol.  mwcc's `@138`
                # is a whole distinct object; golden calls the SAME address
                # `lbl_000264A8+0x20`, i.e. the section-start label plus an
                # offset.  Keying on the name alone collapses `@138` and
                # `@163` onto one golden name and then reports an ADDEND diff
                # on a byte-identical function -- MEASURED: 1 ADDEND row and 1
                # false bijection violation in mini_golf_41.c.
                g2b.setdefault((gr[1], gr[2]), set()).add((br[1], br[2]))
                b2g.setdefault((br[1], br[2]), set()).add((gr[1], gr[2]))
    # THE BIJECTION CHECK.  Rewriting an anonymous built name to golden's name
    # is only legitimate while the correspondence is ONE-TO-ONE.  If golden
    # reads two distinct constants where the draft reads one (or the reverse),
    # that is a REAL defect that a name comparison alone would have hidden, and
    # it stays unrewritten so it shows up as a SYMBOL diff.
    alias = dict((b, next(iter(gs))) for b, gs in b2g.items()
                 if len(gs) == 1 and len(g2b.get(next(iter(gs)), ())) == 1)
    bij_bad = sorted(set(b[0] for b, gs in b2g.items() if len(gs) > 1)
                     | set(b[0] for b in b2g
                           for g in b2g[b] if len(g2b.get(g, ())) > 1))

    def resolve(r):
        if r and anon(r[1]) and (r[1], r[2]) in alias:
            g = alias[(r[1], r[2])]
            return (r[0], g[0], g[1])
        return r
    brefs = dict((i, resolve(r)) for i, r in brefs.items())

    # ⚠ THE ALIGNED SCORE IS THE ONE THE PROJECT QUOTES, so it gets the
    # relocation too: the element is the (word, relocation) PAIR, not the word.
    # `blind` is bit-identical to what rel_tuprobe/rel_sdiff print.
    # ⚠⚠ difflib's `get_opcodes` is a GREEDY longest-block heuristic, not an
    # optimal edit distance, so `aligned` is NOT guaranteed to be >= `blind`
    # even though its elements carry strictly more information.  MEASURED on
    # mini_race lbl_00006CF0: blind 4 in 3, +relocs 3 in 3, optimal Levenshtein
    # 3 both ways.  Quote the POSITIONAL numbers when the two disagree.
    gpair = [(ge[i], norm_ref(grefs.get(i))) for i in range(m)]
    bpair = [(be[i], None) for i in range(m)]
    blind_tot, blind_ops = T.aligned(ge[:m], be[:m])

    wordsame, fiction, refbad, rows, kinds = 0, [], 0, [], {}
    for i in range(m):
        weq = ge[i] == be[i]
        v = ref_verdict(grefs.get(i), brefs.get(i))
        if v != 'OK':
            kinds[v] = kinds.get(v, 0) + 1
        req = v in ('OK', 'ANON')
        if weq:
            wordsame += 1
        if not req:
            refbad += 1
        if weq and not req:
            fiction.append(i)
        if not weq or not req:
            rows.append((i, weq, v, gold[i], built[i], grefs.get(i),
                         brefs.get(i)))
        bpair[i] = (be[i], norm_ref(brefs.get(i)))
    true_tot, true_ops = T.aligned(gpair, bpair)
    lines = []
    for (i, weq, v, g, b, gr, br) in rows[:show]:
        tag = ('WORD+%s' % v if not weq and v not in ('OK', 'ANON') else
               'WORD' if not weq else 'FICTION-%s' % v)
        lines.append('    %5d %-16s gold %08X %-30s [%s]'
                     % (i, tag, g[1], g[4][:30], fmt_ref(gr)))
        lines.append('    %5s %-16s blt  %08X %-30s [%s]'
                     % ('', '', b[0], b[1][:30], fmt_ref(br)))
    return dict(n=n, m=m, words=wordsame, refs_gold=len(grefs),
                refs_built=len(brefs), refbad=refbad, fiction=fiction,
                nrows=len(rows), lines=lines, kinds=kinds,
                anon=len(alias), bij_bad=bij_bad,
                true=wordsame - len(fiction),
                blind=(blind_tot, len(blind_ops)),
                aligned=(true_tot, len(true_ops)),
                span=(min([o[1] for o in true_ops], default=0),
                      max([o[2] for o in true_ops], default=0)))


# --------------------------------------------------------------------------


def selftest():
    rows, loc = [], set()
    txt = ('/* 00000000 3C800000 */ lis r4, sym@ha\n'
           '/* 00000004 3BC40000 */ addi r30, r4, sym@l\n'
           '/* 00000008 3B630000 */ addi r27, r3, 0\n'
           '/* 0000000C 3C600000 */ lis r3, (other+0x20)@ha\n'
           '/* 00000010 4BFFFE01 */ bl callee\n'
           '/* 00000014 4182000C */ beq here\n'
           'here:\n'
           '/* 00000018 4E800020 */ blr\n')
    p = os.path.join(os.environ.get('TEMP', '.'), '_relscore_selftest.s')
    open(p, 'w', newline='\n').write(txt)
    try:
        rows, loc = gold_rows(p)
    finally:
        os.remove(p)
    assert len(rows) == 7, len(rows)
    assert loc == {'here'}, loc
    g = gold_refs(rows, loc)
    assert g[0] == ('HA', 'sym', 0), g.get(0)
    assert g[1] == ('LO', 'sym', 0), g.get(1)
    assert 2 not in g, 'a literal `addi rD,rA,0` must NOT look like a reloc'
    assert g[3] == ('HA', 'other', 0x20), g.get(3)
    assert g[4] == ('CALL', 'callee', 0), g.get(4)
    assert 5 not in g, 'a branch to a LOCAL label is not a relocation'
    assert 6 not in g
    # the reloc-line parser
    assert _RELOC_RE.match('\t\t\t6: R_PPC_ADDR16_HA\tlbl_10000000')
    assert _parse_reloc_sym('foo+0x20') == ('foo', 0x20)
    assert _parse_reloc_sym('foo') == ('foo', 0)
    # THE WHOLE POINT: identical words, different relocations
    gold = [(0, 0x3BC40000, 'addi', 'r30, r4, sym@l', 'addi r30, r4, sym@l')]
    built = [(0x3BC40000, 'addi r30,r4,0', None)]
    s = score(built, gold, {0: ('LO', 'sym', 0)}, 4)
    assert s['words'] == 1 and len(s['fiction']) == 1 and s['true'] == 0, s
    # and the wrong-symbol case
    built2 = [(0x3BC40000, 'addi r30,r4,0', ('LO', 'elsewhere', 0))]
    s2 = score(built2, gold, {0: ('LO', 'sym', 0)}, 4)
    assert len(s2['fiction']) == 1, s2
    # a CALL compares on the symbol only, and DOES compare
    gold3 = [(0, 0x4BFFFE01, 'bl', 'a', 'bl a')]
    b3 = [(0x48000001, 'bl 0 <x>', ('CALL', 'a', 0))]
    assert len(score(b3, gold3, {0: ('CALL', 'a', 0)}, 0)['fiction']) == 0
    b4 = [(0x48000001, 'bl 0 <x>', ('CALL', 'b', 0))]
    s4 = score(b4, gold3, {0: ('CALL', 'a', 0)}, 0)
    assert s4['words'] == 1 and len(s4['fiction']) == 1, s4
    # a LOCAL `b` must NOT be read as a call just because objdump annotates it
    assert annot_call(0x48000008, 'b 8 <lbl_x+0x8>', 0, 10) is None
    assert annot_call(0x48000008, 'b 8 <lbl_x+0x8>', 0, 1) == \
        ('CALL', 'lbl_x', 8)
    assert annot_call(0x48000009, 'bl 8 <callee>', 0, 10) == \
        ('CALL', 'callee', 0)
    # RUN 38: the regime this tool now consults must be rel_tuprobe's, not a
    # second copy of it.  These are rel_tuprobe's own seven cases, asserted
    # THROUGH THE IMPORT, so a drift in either file fails here.
    _P = [('asm void a(void)\n{\n#include "x.s"\n}\n#pragma peephole on\n'
           'void HERE(int a, int b)\n{\n}\n', 'on', 'pragma'),
          ('static asm void a(void)\n{\n#include "x.s"\n}\n'
           '#pragma force_active reset\nvoid HERE(void)\n{\n}\n',
           'off', 'asm'),
          ('void f(void)\n{\n    asm\n    {\n        nop\n    }\n}\n'
           'void HERE(void)\n{\n}\n', 'on', 'default'),
          ('asm void a(void);\nvoid HERE(void)\n{\n}\n', 'on', 'default'),
          ('asm void a(void)\n{\n#include "x.s"\n}\n#pragma peephole on\n'
           '#pragma peephole reset\nvoid HERE(void)\n{\n}\n',
           'off', 'pragma'),
          ('asm void a(void)\n{\n#include "x.s"\n}\n'
           '#pragma peephole reset\nvoid HERE(void)\n{\n}\n',
           'on', 'pragma'),
          ('/* asm void a(void)\n{\n} */\nvoid HERE(void)\n{\n}\n',
           'on', 'default')]
    for _t, _e, _ec in _P:
        _o = _t.index('void HERE')
        _g, _w, _c = T.peephole_regime_ex(_t, _o)
        assert _g == _e and _c == _ec, (
            'peephole case %r: expected %s/%s got %s/%s (%s)'
            % (_t[:28], _e, _ec, _g, _c, _w))
    # AND THE RULE THIS TOOL ADDS ON TOP: an `off` caused by a HUMAN pragma is
    # never overridden.  (rel_tuprobe RUN 37 DEFECT 3; if this tool overrode it
    # the two would disagree on mini_fight_68.c's two rows.)
    assert T.peephole_regime_ex(_P[4][0], _P[4][0].index('void HERE'))[2] \
        == 'pragma'
    print('rel_relscore selftest: 18 checks + 7 peephole cases OK')
    print('A SELFTEST IS NOT A GATE.  The gate is control rows on ALREADY-'
          'MATCHED\nlabels across all nine modules (they must report 0 '
          'fictions and 0 word diffs),\nplus a refusal on every still-asm '
          'stub.  Run it from two cwds on two drives.')


# --------------------------------------------------------------------------


def stubbed(tree, stem, label):
    """Is `label` still an `#include`d asm stub anywhere in this tree's src?

    ⚠ THIS CHECK BELONGS ON EVERY MODE, NOT JUST THE COMPILE MODE.  MEASURED
    while gating this tool: `--plf --quiet lbl_00006CF0` in mini_race's warm
    copy printed `words 193 of 193, TRUE 193 of 193, MISMATCHED 0` -- a perfect
    score, on a label that is still an asm stub there, so the `.plf` contains
    GOLDEN'S OWN ASSEMBLER OUTPUT and the tool was comparing golden with
    golden.  That is run 32's fixed fiction reappearing in a NEW mode of a NEW
    tool, and the compile-path guard could not see it because the compile path
    was not taken.  Same derivation rel_ablind's `stubbed_labels()` uses.
    """
    pat = re.compile(r'#include "\.\./asm/nonmatchings/%s/%s\.s"'
                     % (re.escape(stem), re.escape(label)))
    for p in glob.glob(os.path.join(tree, 'src', '%s*.c' % stem)):
        try:
            if pat.search(open(p, errors='ignore').read()):
                return p
        except OSError:
            pass
    return None


def refuse_stub(where, label, stem, path, allow):
    if path is None or allow:
        return
    die('%s is STILL AN ASM STUB in %s -- it #includes\n'
        '    ../asm/nonmatchings/%s/%s.s\n'
        'so the %s you are scoring contains GOLDEN\'S OWN ASSEMBLER OUTPUT and '
        'every\nword AND every relocation matches golden against golden: 100%%,'
        ' and meaningless.\nScoring that was one of run 32\'s four fixed '
        'fictions, so this tool REFUSES it\n(exit 2) instead of printing a '
        'warning under a green number.  Pass --allow-stub\nto use it as a '
        'HARNESS CANARY (anything but 100%% then means your flags, your\nowner '
        'or your objdump are broken).' % (label, path, stem, label, where))


def _sections(objpath):
    """-> {name: size} for every section of an object, from `objdump -h`.

    RUN 38.  `.text` is the only thing this tool ever read, and a body can
    change an object without changing its `.text` at all.
    """
    r = subprocess.run([OBJDUMP, '-h', objpath], capture_output=True,
                       text=True)
    out = {}
    for ln in r.stdout.splitlines():
        m = re.match(r'\s*\d+\s+(\S+)\s+([0-9a-f]{8})\s', ln)
        if m:
            out[m.group(1)] = int(m.group(2), 16)
    return out


def _sect_delta(base, now):
    """-> ['.rodata 0 -> 16', ...] for every NON-.text section that moved."""
    out = []
    for k in sorted(set(base) | set(now)):
        if k == '.text':
            continue
        a, b = base.get(k, 0), now.get(k, 0)
        if a != b:
            out.append('%s %d -> %d (%+d)' % (k, a, b, b - a))
    return out


def not_inside(work, tree):
    """`os.path.commonpath` RAISES on two drives -- it does not return a
    mismatch -- and that crashed rel_tuprobe on its first run outside a warm
    copy (default work on C:, main tree on D:).  Compare normalised prefixes
    instead; a different drive simply is not a prefix."""
    a = os.path.normcase(os.path.abspath(work)).rstrip('\\/')
    b = os.path.normcase(os.path.abspath(tree)).rstrip('\\/')
    return not (a == b or a.startswith(b + os.sep) or a.startswith(b + '/'))


def build_flat(objpath, label, extra=(), locals_=None):
    """Object/plf -> the [(word,text,ref)] stream for GOLDEN'S ROW at `label`.

    ** RUN 39 -- THIS USED TO READ TO THE END OF THE OBJECT. **

    It concatenated EVERY symbol from `label` onward and score() then truncated
    to GOLDEN'S length, so a SHORT draft was scored against THE NEXT FUNCTION'S
    PROLOGUE and the next function's relocations were counted as this draft's.
    PROVEN by sel_ngc in run 38, not argued: `lbl_00010438`'s stream[957] is
    the first `lis` of `lbl_00011330`; per row the ref count is 99/99, read
    forward it is 102/104.  THREE published "structural leads" died to it --
    sel_ngc's two and mini_billiards' `23B0` 17-vs-16.

    THE READ-FORWARD IS NOT REMOVED, BECAUSE IT IS LOAD-BEARING -- but on far
    less than it was doing.  MEASURED run 39 over every golden `.s` in all nine
    modules against each module's own `.map` .text layout (n = 1,160 rows):
    EIGHT rows genuinely hold more than one function and golden covers the
    whole row --

        mini_fight lbl_000074DC lbl_00010ADC lbl_00010B98 lbl_00012248
        mini_pilot lbl_00008134
        mini_race  lbl_000044AC lbl_00004634
        test_mode  lbl_000007AC

    -- and mini_billiards, mini_bowling, mini_golf, option and sel_ngc have
    NONE, so for those five the read-forward has never been anything but the
    defect.  (_corpus_run39/Bscratch/census_multifunc.py.)

    ** So it is BOUNDED by GOLDEN'S OWN LOCAL-LABEL SET **, which gold_rows()
    already returns and which is `^name:` DEFINITIONS only, never call targets.
    Read forward across a following symbol only while golden's `.s` DEFINES a
    label of that name; STOP at the first one it does not.  A golden row's
    local labels all sit INSIDE that row and every other function's entry sits
    outside it, so the two populations cannot collide.  MEASURED BOTH WAYS on
    all 1,160 rows: 8/8 multi-function rows fully covered, 1,152/1,152
    single-function rows stopped at the very first following symbol.
    (_corpus_run39/Bscratch/census_localsep.py.)

    ⚠ `m = min(n, own)` with `own = len(syms[label])` -- the fix as it was
    located -- is WRONG on exactly those eight rows: it would truncate
    lbl_00010B98 to 28 of golden's 309 and report a byte-perfect
    three-function conversion as a 281-instruction residual.

    `locals_=None` keeps the label-symbol-only reading for a caller with no
    golden `.s` to hand.

    -> (flat, names, own).  `own` == len(flat) == the ROW's instruction count,
    which is also the number `insn` must print: `len(syms[label])` reported a
    byte-perfect draft of those eight rows as WRONG LENGTH (-281 on
    lbl_00010B98).
    """
    syms, _ = disasm_dr(objpath, extra)
    names = [k for k, _ in syms]
    if label not in names:
        return None, names, 0
    flat, seen = [], False
    for k, v in syms:
        if k == label:
            seen = True
        elif seen and not (locals_ and k in locals_):
            break
        if seen:
            flat.extend(v)
    return flat, names, len(flat)


def main():
    argv = sys.argv[1:]
    if '--selftest' in argv:
        selftest()
        return 0
    mod = owner = work = objarg = plfarg = None
    show, quiet, allow_stub, use_plf = 12, False, False, False
    peep = 'auto'
    rest, i = [], 0
    while i < len(argv):
        a = argv[i]
        if a.startswith(('--module=', '--owner=', '--work=', '--show=',
                         '--object=', '--plf=', '--peephole=')):
            k, v = a.split('=', 1)
            argv[i:i + 1] = [k, v]
            continue
        if a in ('--module', '--owner', '--work', '--show', '--object',
                 '--peephole'):
            if i + 1 >= len(argv):
                die('%s needs a value' % a)
            v = argv[i + 1]
            i += 2
            if a == '--module':
                mod = v
            elif a == '--owner':
                owner = v
            elif a == '--work':
                work = v
            elif a == '--object':
                objarg = v
            elif a == '--peephole':
                # SAME two values rel_tuprobe accepts, and the same refusal.
                if v not in ('auto', 'off'):
                    die('--peephole takes `auto` (default: restore golden\'s '
                        'regime) or `off` (score in the deoptimised one)')
                peep = v
            else:
                if not v.isdigit():
                    die('--show needs a number, got %r' % v)
                show = int(v)
            continue
        if a == '--plf':
            use_plf = True
            if i + 1 < len(argv) and not argv[i + 1].startswith('-') \
                    and argv[i + 1].endswith('.plf'):
                plfarg = argv[i + 1]
                i += 1
            i += 1
            continue
        if a == '--quiet':
            quiet = True
            i += 1
            continue
        if a == '--allow-stub':
            allow_stub = True
            i += 1
            continue
        if a == '--tree' or a.startswith('--tree='):
            die('there is no --tree.  Run it FROM the module tree:\n'
                '  cd C:/tmp/smbm/<module> && python tools/rel_relscore.py '
                '<label> [body.c ...]\n'
                'Four tools in this project have shipped a --tree that '
                'defaulted to the wrong tree and scored it silently.')
        if a.startswith('-'):
            die('unknown option %r.  Labels and file names do not start with '
                '"-".' % a)
        rest.append(a)
        i += 1

    if not rest:
        die('usage: cd C:/tmp/smbm/<module> && python tools/rel_relscore.py '
            '<label> [body.c ...]')
    label, bodies = rest[0], rest[1:]
    if not re.match(r'^[A-Za-z_]\w*$', label):
        die('%r does not look like a label.  The label comes FIRST.' % label)
    if bodies and (objarg or use_plf):
        die('--object/--plf score a BUILT artifact; they cannot also splice a '
            'body.  Drop the body files, or drop the flag.')
    if peep != 'auto' and (objarg or use_plf):
        die('--peephole only means something when this tool COMPILES.  '
            '--object/--plf score an artifact somebody else built, in whatever '
            'regime they built it in.  Silently accepting the flag there would '
            'report a regime this tool did not choose.')
    for b in bodies:
        if not os.path.exists(b):
            die('body file %s does not exist.  (Checked before any compile so '
                'a typo in the 6th of 6 does not cost you five builds.)' % b)

    tree = os.getcwd()
    here = os.path.basename(os.path.abspath(tree))
    if mod is None:
        mod = os.environ.get('RELSCORE_MODULE') or here
    if mod not in MODULES:
        die('%r is not a module (tree dir is %r).  Pass --module <name>.\n'
            '  known: %s' % (mod, here, ', '.join(sorted(MODULES))))
    # rel_tuprobe's wrong-tree trap, verbatim in intent: every warm copy is a
    # FULL repo copy, so `cd .../mini_golf --module option` finds option's src
    # right there and scores it WITHOUT option's agent's work.
    if here in MODULES and here != mod:
        die('you are in the %s tree but asked for --module %s.  Every warm '
            'copy is a FULL repo copy, so this would silently compile %s\'s '
            'sources AS THEY EXIST IN %s\'s TREE.  cd to C:/tmp/smbm/%s.'
            % (here, mod, mod, here, mod))
    stem, art = MODULES[mod]

    goldp = os.path.join(tree, 'asm', 'nonmatchings', stem, label + '.s')
    if not os.path.exists(goldp):
        die('no golden asm at %s\n  -- wrong module (%s -> stem %s), wrong '
            'label, or you are not in a module tree.' % (goldp, mod, stem))
    gold, locals_ = gold_rows(goldp)
    if not gold:
        die('%s parsed to 0 instructions -- not a `/* ADDR HEX */ insn` file?'
            % goldp)
    grefs = gold_refs(gold, locals_)

    # ---------------------------------------------------------------- --plf
    if use_plf:
        plf = plfarg or os.path.join(tree, art + '.plf')
        if not os.path.exists(plf):
            die('no %s -- build it first (as the .plf TARGET, or REL_FLAGS do '
                'not apply).  This mode READS a link, it does not make one.'
                % plf)
        mp = os.path.splitext(plf)[0] + '.map'
        if not os.path.exists(mp):
            die('no %s next to the .plf -- the map is where the address of %s '
                'comes from.' % (mp, label))
        os.environ['FDIFF_MODULE'] = stem
        os.environ['FDIFF_REPO'] = tree
        addrs = _load_map(mp)
        if label not in addrs:
            die('%s is not in %s -- already converted away, or a stale link.'
                % (label, mp))
        refuse_stub('.plf', label, stem, stubbed(tree, stem, label),
                    allow_stub)
        base = addrs[label]
        # The BUILT length is the distance to the next symbol in the map, the
        # same authority rel_ablind uses.  Reporting the read-ahead window
        # length instead prints a confident wrong number (`insn 209` on a
        # 193-instruction function) -- and a wrong length is the one condition
        # under which every other number here is meaningless.
        # ** RUN 39: THE ROW, NOT THE SYMBOL. **  On the eight golden rows
        # that genuinely hold more than one function (see build_flat), the
        # next map symbol is INSIDE this row, so the distance to it reported a
        # byte-perfect LINK as WRONG LENGTH -- e.g. mini_fight lbl_00010B98,
        # 28 against golden's 309.  Walk forward across map symbols that are
        # LOCAL LABELS OF THIS GOLDEN `.s`, exactly as build_flat does on the
        # object side, and stop at the first that is not.
        _later = sorted((a, k) for k, a in addrs.items() if a > base)
        _end = None
        for _a, _k in _later:
            if _k not in locals_:
                _end = _a
                break
        nbuilt = (_end - base) // 4 if _end is not None else None
        span = len(gold) * 4 + 64
        syms, _ = disasm_dr(plf, ['--section=.text',
                                  '--start-address=%s' % hex(base),
                                  '--stop-address=%s' % hex(base + span)])
        flat = []
        for _k, v in syms:
            flat.extend(v)
        print('module %s   PLF %s   golden %s: %d insn (%d reloc refs)'
              % (mod, os.path.basename(plf), label, len(gold), len(grefs)))
        s = score(flat, gold, grefs, 0 if quiet else show)
        _emit('PLF', s, nbuilt, quiet, len(gold))
        return 0

    # -------------------------------------------------------------- --object
    if objarg:
        if not os.path.exists(objarg):
            die('--object %s does not exist' % objarg)
        refuse_stub('object', label, stem, stubbed(tree, stem, label),
                    allow_stub)
        flat, names, own = build_flat(objarg, label, ['--section=.text'],
                                      locals_)
        if flat is None:
            die('%s has no <%s> in .text.  Symbols: %s'
                % (objarg, label, ', '.join(names[:12]) or '(none)'))
        print('module %s   OBJECT %s   golden %s: %d insn (%d reloc refs)'
              % (mod, objarg, label, len(gold), len(grefs)))
        s = score(flat, gold, grefs, 0 if quiet else show)
        # RUN 39: `len(gold)` is passed now, so --object gets the SAME
        # WRONG-LENGTH determination the compile path has always had.  It was
        # the one mode that scored a short artifact and said nothing.
        _emit('OBJECT', s, own, quiet, len(gold))
        return 0

    # ------------------------------------------------------- compile the owner
    if owner is None:
        hits = T.find_owner(tree, stem, label)
        if not hits:
            die('no src/%s*.c DEFINES %s.  IT IS STILL AN ASM STUB (or the '
                'owner is named differently): there is nothing to score, and '
                'scoring golden against itself is the fiction this tool '
                'exists to refuse.  Pass --owner to name a file explicitly.'
                % (stem, label))
        if len(hits) > 1:
            die('%d files define %s -- pass --owner:\n  %s'
                % (len(hits), label, '\n  '.join(hits)))
        owner = hits[0]
    if not os.path.exists(owner):
        die('--owner %s does not exist' % owner)

    mwcc = os.path.join(tree, 'mwcc_compiler', '1.1', 'mwcceppc.exe')
    if not os.path.exists(mwcc):
        die('no mwcc 1.1 at %s (1.0 is NOT the compiler this repo builds with)'
            % mwcc)

    work = os.path.abspath(work or ('C:/tmp/rel_relscore_%s_%d'
                                    % (mod, os.getpid())))
    if not not_inside(work, tree):
        die('--work %s is INSIDE the module tree.  The whole point of this '
            'tool is that it writes nothing there.' % work)
    os.makedirs(work, exist_ok=True)

    base_src = open(owner, errors='ignore').read().replace('\r\n', '\n')
    span = T.find_def(base_src, label)
    if span is None:
        die('%s does not define %s (only declares it?)' % (owner, label))
    st = os.stat(owner)
    print('module %s   owner %s   [%d bytes, mtime %s]   golden %s: %d insn '
          '(%d reloc refs)'
          % (mod, os.path.relpath(owner, tree)
             if os.path.abspath(owner).startswith(os.path.abspath(tree))
             else owner, st.st_size,
             time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(st.st_mtime)),
             label, len(gold), len(grefs)))
    print('%-24s work %s' % ('', work))
    prag = T.pragmas_above(base_src, span[0])
    if prag:
        print('%-24s IN FORCE from the owner (NOT removed): %s'
              % ('', ' | '.join(prag)))

    stub_inc = '../asm/nonmatchings/%s/%s.s' % (stem, label)
    jobs = [(None, 'CONTROL')] if not bodies else \
           [(b, os.path.splitext(os.path.basename(b))[0]) for b in bodies]
    rc = 0
    # RUN 38: the section/symbol baseline is the FIRST object this run builds.
    _base_sect = _base_syms = _base_tag = None
    for bf, tag in jobs:
        src, ow = base_src, base_src
        if bf is not None:
            body = open(bf, errors='ignore').read().replace('\r\n', '\n')
            # ** RUN 38 -- A BAD BODY USED TO KILL THE WHOLE RUN. **
            #
            # T.apply_directives() reports a malformed or unanchored directive
            # by calling rel_tuprobe's die(), i.e. sys.exit(2).  Nothing caught
            # it, so `rel_relscore L a.c b.c` with a bad `a.c` produced NO
            # SCORE FOR b.c AT ALL -- and the damage is invisible, because the
            # output looks exactly like a run that was asked for one body.
            # MEASURED run 38 (Bscratch/gate_abort.py): a body that scores
            # `16 of 16` on its own produces nothing at all when it is listed
            # behind a body with one bad directive.
            #
            # It is caught PER BODY here so the remaining bodies are still
            # scored, and the exit code still reports the refusal.  The
            # message rel_tuprobe already wrote to stderr is left as it is --
            # it names the file and the line -- but it is prefixed
            # `rel_tuprobe:` even though you ran this tool, so say so.
            try:
                ow, body = T.apply_directives(base_src, body, bf)
            except SystemExit:
                print('%-24s DIRECTIVE REFUSED -- THIS BODY WAS SKIPPED and '
                      'the run CONTINUES.\n'
                      '%-24s   Details on stderr (prefixed `rel_tuprobe:` -- '
                      'that is the imported directive parser, not a different '
                      'tool).' % (tag, ''))
                rc = 2
                continue
            sp = T.find_def(ow, label)
            if sp is None:
                # Same rule: one body's failure is not the run's.
                print('%-24s AFTER //@SUB///@PROTO, %s NO LONGER DEFINES %s '
                      '-- SKIPPED, run continues.' % (tag, owner, label))
                rc = 2
                continue
            src = ow[:sp[0]] + body.rstrip('\n') + '\n' + ow[sp[1]:]
        # ** THE PEEPHOLE REGIME, DECIDED AND PRINTED ON EVERY RUN -- RUN 38.
        #
        # THIS TOOL HAD NO REGIME HANDLING AT ALL.  The string `peephole` did
        # not appear in this file, while rel_tuprobe -- IMPORTED, four lines
        # above, for the splice itself -- restores golden's regime before it
        # compiles.  So the two tools compiled different programs from the same
        # body and their numbers could not be read side by side, which is the
        # one thing this tool's own `score()` docstring promises.
        #
        # MEASURED run 38, over EVERY still-asm label in all nine warm copies
        # (n = 163 with a resolvable owner, Bscratch/census_regime.py): the
        # splice point sits in an `off` regime caused by an ASM BLOCK on 23 of
        # them, which is exactly the set where rel_tuprobe injects and this
        # tool did not.  Two further rows (mini_fight lbl_0001415C and
        # lbl_00014478, both in mini_fight_68.c) are `off` by an EXPLICIT
        # `#pragma peephole off`; rel_tuprobe REFUSES to override those, so
        # this must refuse too or the fix trades one disagreement for another.
        #
        # The three rules are rel_tuprobe.py's, verbatim in intent and in
        # order (see its RUN 37 DEFECT 3 and DEFECT 5 comments):
        #   --peephole off  -> FORCE the deoptimised regime (inject `off` when
        #                      the regime is on; do nothing when it is off)
        #   regime off by an ASM BLOCK   -> inject `#pragma peephole on`
        #   regime off by a HUMAN PRAGMA -> REFUSE, loudly, and score as-is
        # ⚠ IF YOU CHANGE EITHER TOOL, RE-RUN
        # _corpus_run38/Bscratch/gate_regime.py: it compiles the same body
        # through BOTH tools on all 23 rows and fails if any row disagrees.
        sp3 = T.find_def(src, label)
        regime, rwhy, rcause = T.peephole_regime_ex(
            src, sp3[0] if sp3 else len(src))
        injected = refused = deopted = False
        if sp3 is not None and peep == 'off':
            if regime == 'on':
                src = src[:sp3[0]] + '#pragma peephole off\n' + src[sp3[0]:]
                deopted = True
        elif sp3 is not None and regime == 'off':
            if rcause == 'pragma':
                refused = True
            else:
                src = src[:sp3[0]] + '#pragma peephole on\n' + src[sp3[0]:]
                injected = True
        print('%-24s PEEPHOLE %s -- %s' % (tag, regime.upper(), rwhy))
        if injected:
            print('%-24s   INJECTED `#pragma peephole on` before the body, so '
                  'this score is in GOLDEN\'S regime.\n'
                  '%-24s   Your real conversion MUST carry that pragma too or '
                  'the link will not match (--peephole off to score without '
                  'it).' % ('', ''))
        elif refused:
            print('%-24s   NOT INJECTING.  That `off` is an explicit '
                  '`#pragma peephole`, not an asm-block deopt, so it was '
                  'written\n'
                  '%-24s   on purpose (by the owner or by your body) and '
                  'overriding it would score a program you did not write.\n'
                  '%-24s   Remove the pragma, or pass --peephole off to say '
                  'you meant it.' % ('', '', ''))
        elif deopted:
            print('%-24s   --peephole off: INJECTED `#pragma peephole off`.  '
                  'This score is in the DEOPTIMISED regime,\n'
                  '%-24s   which is NOT golden\'s.  It is the second arm of a '
                  'two-arm comparison, not a result on its own.'
                  % ('', ''))
        elif peep == 'off':
            print('%-24s   --peephole off: the regime was already OFF here, so '
                  'nothing was injected.\n'
                  '%-24s   This IS the deoptimised regime, and it is NOT '
                  'golden\'s.' % ('', ''))
        sp2 = T.find_def(src, label)
        if sp2 is not None and stub_inc in src[sp2[0]:sp2[1]] \
                and not allow_stub:
            die('%s is STILL AN ASM STUB in %s -- it #includes\n    %s\n'
                'so mwcc would assemble GOLDEN ITSELF and every word AND every '
                'relocation would match golden against golden: 100%%, and '
                'meaningless.  Scoring that was one of run 32\'s four fixed '
                'fictions, so this tool REFUSES it (exit 2) instead of '
                'printing a warning under a green number.\n'
                'Pass --allow-stub only to use it as a HARNESS CANARY '
                '(anything but 100%% then means your flags/objdump are '
                'broken).' % (label, bf or owner, stub_inc))
        c = os.path.join(work, tag + '.c')
        o = os.path.join(work, tag + '.o')
        open(c, 'w', newline='\n').write(src)
        ok, log = T.compile_one(mwcc, tree, work, c, o)
        if not ok:
            tail = '\n'.join(l for l in log.strip().splitlines()
                             if l.strip())[-500:]
            print('%-24s COMPILE FAILED\n%s' % (tag, tail))
            rc = rc or 1
            continue
        flat, names, own = build_flat(o, label, ['--section=.text'], locals_)
        if flat is None:
            die('%s compiled but its .text has no <%s>.  Symbols: %s'
                % (c, label, ', '.join(names[:12]) or '(none)'))
        # ** RUN 38 -- THE NON-.text SIDE EFFECT, WHICH BOTH THIS TOOL AND
        # rel_tuprobe WERE STRUCTURALLY BLIND TO. **
        #
        # Every number these tools print is computed from `.text` alone, so a
        # body that adds `#include <math.h>` (16 bytes of .rodata) or reaches
        # for `fabs` (a library function, i.e. a new .text symbol) scores
        # exactly as before -- `0 in 0`, a perfect row -- and then FAILS THE
        # LINK, because the module's carve/merge budget is a SECTION-SIZE
        # budget.  Two modules hit that identical pair independently and only
        # `--gate` caught either.
        #
        # This cannot decide whether the change is fatal; the ledger owns that.
        # It CAN say the object is no longer shaped like the CONTROL object,
        # which is the one thing you cannot see from a .text score.  The
        # baseline is the CONTROL run of this same invocation, so it costs one
        # extra objdump and needs nothing recorded anywhere.
        _sect = _sections(o)
        if _base_sect is None:
            _base_sect = _sect
            _base_tag = tag
        else:
            _delta = _sect_delta(_base_sect, _sect)
            if _delta:
                print('%-24s !! NON-.text SECTIONS DIFFER from %s: %s'
                      % (tag, _base_tag, ', '.join(_delta)))
                print('%-24s   No score above can see this.  A new or grown '
                      '.rodata/.data spends the module\'s CARVE/MERGE budget '
                      'and\n'
                      '%-24s   is how a `0 in 0` row still fails --gate.  '
                      '(`#include <math.h>` costs 16 bytes; `fabs` costs a '
                      'library .text symbol.)' % ('', ''))
        _newsyms = sorted(set(names) - set(_base_syms or names))
        if _base_syms is None:
            _base_syms = names
        elif _newsyms:
            print('%-24s !! NEW .text SYMBOL(S) vs %s: %s'
                  % (tag, _base_tag, ', '.join(_newsyms[:8])))
        s = score(flat, gold, grefs, 0 if quiet else show)
        # RUN 39: `own` comes back from build_flat, which now knows where
        # golden's ROW ends.  The second `disasm_dr(o)` that used to live here
        # measured `len(syms[label])` -- the label's symbol ALONE -- which is
        # the wrong length on the eight multi-function rows, and it cost a
        # second objdump on every body.
        _emit(tag, s, own, quiet, len(gold))
    return rc


def _emit(tag, s, own, quiet, ngold=None):
    bt, bo = s['blind']
    at, ao = s['aligned']
    # ** RUN 39 -- THE ALIGNED NUMBER IS PRINTED FIRST AND IT IS A COUNT OF
    # DIFFERENCES, AND NOTHING ON THE LINE SAID SO. **
    #
    # mini_billiards `lbl_0000A054` prints `608 in 290` and is TRUE 67 of
    # 2,094.  `608 in 290` reads as a near-miss to anyone who has just read
    # `of 2094` on the next line; it is 608 DIFFERING INSTRUCTIONS in 290
    # REGIONS, i.e. the opposite polarity from every other number this tool
    # prints.  Run 38 measured that trap at 3x-300x the FICTION column and
    # called it the project's biggest.  This is PRINT ONLY: the gate for it
    # (_corpus_run39/Bscratch/gate_print.py) asserts that NOT ONE NUMBER
    # MOVES between the two versions on any row.
    #
    # Golden's length now sits beside the built one, in rel_tuprobe's own
    # `insn N (golden M, +-d)` form, so the two tools' first lines read alike
    # and the length is on the line the reader is already looking at instead
    # of in the header four lines up.
    _gl = ('' if ngold is None or own is None
           else ' (golden %d, %+d)' % (ngold, own - ngold))
    print('%-24s insn %-4s%s   ALIGNED(words only) %d DIFF in %-3d -> '
          'ALIGNED(+relocs) %d DIFF in %-3d  span %d-%d'
          % (tag, own if own is not None else '?', _gl, bt, bo, at, ao,
             s['span'][0], s['span'][1]))
    # ** RUN 38 -- `words` USED TO COME FIRST AND `words` IS WHAT PEOPLE
    # QUOTE. **  mini_bowling's 42A4 printed `words 86 of 91` before
    # `TRUE 85 of 91`, and THE DELTA IS THE WHOLE FINDING: the missing one is a
    # word that is equal only because a relocated field is zero on both sides.
    # A reader who quotes the first number quotes the fiction-carrying one --
    # which is the exact failure this tool was written to end.
    # TRUE now leads.  `words` is still printed, because the DELTA is the
    # finding and you cannot see a delta with one number, but it is labelled
    # as the inflated one whenever the two disagree.
    _fic = s['words'] - s['true']
    # ** RUN 39: AT A WRONG LENGTH, `quote TRUE` IS ITSELF BAD ADVICE. **
    # Every positional number is meaningless when the count is wrong -- TRUE
    # included -- so the line says which number IS meaningful (ALIGNED)
    # instead of promoting one meaningless one over another.
    #
    # ⚠ The brief asked for `words` to be SUPPRESSED at a wrong length.  I
    # RELABEL IT INSTEAD, deliberately: the wrong-length branch RETURNS before
    # the `!! N WORD-EQUAL POSITION(S) ARE FICTIONS` line is reached, so
    # `words` is the ONLY place the fiction count survives on exactly the rows
    # where it would be suppressed.  Suppressing it destroys evidence; saying
    # it is meaningless does not.
    _wl = (ngold is not None and own is not None and own != ngold)
    _pos = (('   [words %d of %d -- INFLATED by %d fiction(s); quote TRUE]'
             % (s['words'], s['n'], _fic)) if _fic else
            ('   (words agree: %d of %d)' % (s['words'], s['n'])))
    if _wl:
        _pos = ('   (words %d of %d, %d fiction(s)) -- BOTH MEANINGLESS AT '
                'THIS LENGTH; quote ALIGNED' % (s['words'], s['n'], _fic))
    print('%-24s positional: TRUE %d of %d%s   '
          'refs built %d / golden %d, MISMATCHED %d %s'
          % ('', s['true'], s['n'], _pos,
             s['refs_built'], s['refs_gold'], s['refbad'],
             '(' + ', '.join('%s %d' % kv for kv in sorted(s['kinds'].items()))
             + ')' if s['kinds'] else ''))
    if s['anon']:
        print('%-24s %d anonymous built symbol(s) -- mwcc literal-pool `@N` -- '
              'resolved 1:1 to\n%-24s   golden\'s address-derived names.  '
              'Their NAMES are uncomparable by\n%-24s   construction and were '
              'scored on KIND + bijection only; a pure SWAP of\n%-24s   two '
              'pool entries is the one defect this cannot see.'
              % ('', s['anon'], '', '', ''))
    if s['bij_bad']:
        print('%-24s !! BIJECTION VIOLATED for %s -- golden reads a different '
              'NUMBER of\n%-24s   distinct constants here than the draft does. '
              'That is a REAL defect,\n%-24s   not a naming artefact.'
              % ('', ', '.join(s['bij_bad'][:8]), '', ''))
    if ngold is not None and own is not None and own != ngold:
        print('%-24s ^^ WRONG LENGTH (%+d).  BOTH numbers above are as '
              'meaningless as\n%-24s   rel_tuprobe\'s are on a wrong-length '
              'draft -- an insertion shifts every\n%-24s   later word AND '
              'every later relocation.  Fix the count first.'
              % ('', own - ngold, '', ''))
        # ** RUN 39 -- THE OVERRUN THIS USED TO WARN ABOUT IS FIXED, SO THE
        # WARNING HAD TO CHANGE OR IT WOULD BE THE FALSE STATEMENT. **
        #
        # Until run 39 build_flat() concatenated EVERY symbol from the label to
        # the end of the object and score() truncated to GOLDEN'S length, so a
        # SHORT draft was scored against the NEXT FUNCTION'S code and that
        # function's relocations were counted as this draft's.  Run 38 reported
        # it here rather than fixing it, on the grounds that the read-forward
        # was load-bearing for a multi-function golden row and could not be
        # separated.  IT CAN: golden's own local-label set separates the two
        # populations exactly, 1,160 of 1,160 rows (see build_flat).
        #
        # So the columns above are now THIS ROW'S, whatever the length.  What a
        # short draft still means is that golden's tail has NO COUNTERPART: the
        # missing instructions are counted as diffs, `refs built` is genuinely
        # smaller than `refs golden`, and the positional score is a score over
        # a PREFIX.  That is a real result and not a borrowed one.
        if own < ngold:
            print('%-24s ^^ The columns above cover the %d instruction(s) this '
                  'draft ACTUALLY EMITTED\n'
                  '%-24s   for this row.  Golden\'s remaining %d have no '
                  'counterpart and are counted\n'
                  '%-24s   as diffs -- a positional score over a PREFIX, not a '
                  'near-miss.\n'
                  '%-24s   RUN 39: before this these %d word(s) were scored '
                  'against WHATEVER\n'
                  '%-24s   FOLLOWS THIS FUNCTION in the object, and that '
                  'function\'s relocations\n'
                  '%-24s   were counted as this draft\'s.  (sel_ngc run 38: '
                  '`lbl_00010438` read\n'
                  '%-24s   102/104 that way and 99/99 per row; two headline '
                  '"extra relocation"\n'
                  '%-24s   anomalies were that, and both vanished.)'
                  % ('', own, '', ngold - own, '', '', ngold - own, '', '',
                     '', ''))
        if not quiet:
            for l in s['lines']:
                print(l)
        return
    if at > bt:
        print('%-24s !! RELOCATION-BLINDNESS WAS HIDING %d INSTRUCTION(S) OF '
              'THIS RESIDUAL.\n%-24s   rel_tuprobe / rel_sdiff / rel_ablind / '
              'rel_ascore would print "%d in %d"\n%-24s   because a relocated '
              'field is ZERO in the object until the linker fills\n%-24s   it, '
              'so `addi rD,rA,0` and `addi rD,rA,sym@l` are the SAME WORD.'
              % ('', at - bt, '', bt, bo, '', ''))
    if s['fiction']:
        print('%-24s !! %d WORD-EQUAL POSITION(S) ARE FICTIONS -- same word, '
              'different symbol.\n%-24s   Positions: %s'
              % ('', len(s['fiction']), '',
                 ', '.join(str(x) for x in s['fiction'][:24])
                 + (' ...' if len(s['fiction']) > 24 else '')))
    if s['words'] == s['n'] and s['refbad'] == 0:
        print('%-24s ^ 100%% words AND 100%% relocations.  NECESSARY, NOT '
              'SUFFICIENT -- this\n%-24s   does not link.  Gate it: python '
              'tools/rel_sweep.py <mod> --gate' % ('', ''))
    if not quiet:
        for l in s['lines']:
            print(l)


def _load_map(mapfile):
    out, inlayout = {}, False
    for line in open(mapfile, errors='ignore'):
        if line.startswith('.text section layout'):
            inlayout = True
            continue
        if inlayout and 'section layout' in line:
            break
        m = re.match(r'\s*([0-9a-f]{8}) ([0-9a-f]{6}) [0-9a-f]{8}\s+\d+ '
                     r'([A-Za-z_.$][\w.$]*)\s', line)
        if inlayout and m:
            out[m.group(3)] = int(m.group(1), 16)
    return out


if __name__ == '__main__':
    sys.exit(main())
