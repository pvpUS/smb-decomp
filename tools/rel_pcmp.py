#!/usr/bin/env python3
"""Score probe objects against an original asm/nonmatchings/*.s body.

Compiles each probe with tools/rel_probe.py, disassembles the named function,
normalises both sides, and prints an aligned diff count + span, exactly the
way rel_ascore.py judges a real build -- but in ~1s per candidate and with no
link.  Relocated operands (lis rX,0 / addi rX,rX,0 against a @ha/@l pair) are
masked on both sides, as are branch displacements.

usage: python pcmp.py <label> <probedir> [funcname]
Run from the module tree root.
"""
import difflib
import glob
import os
import re
import subprocess
import sys


# ** RUN 39 -- THE `raw` CAP.  rel_ascore's run-10 fix, which never
# propagated. **
#
# A plain difflib cost can EXCEED the positional cost: difflib latches onto a
# long matching block OFF the diagonal when the words repeat -- and PPC repeats
# heavily -- then pays an insert AND a delete for everything around it.  On a
# pure register renaming rel_ascore reported raw 101 as 387.  When the two
# sequences are the SAME LENGTH the identity alignment costs exactly `raw`
# substitutions, so the true edit cost can never exceed raw, and
# rel_tuprobe.aligned() takes the smaller of the two.
#
# MEASURED run 38 on 1,009 real golden functions: the cap bites on 3.9%, worst
# case 163 reported against a true 39 on a 276-instruction function.  MEASURED
# run 39: only 3 of 10 SequenceMatcher sites in tools/ have the cap, and this
# file was not one of them.
#
# IMPORTED, NOT COPIED.  A second hand-written copy of a scorer is a second
# thing to drift, and two hand-written ports in this project both shipped
# normaliser defects that ate matching instructions.
#
# ⚠ The resolver is rel_relscore._tools_dir()'s, in intent and in order, and it
# is not decoration: the first draft of this patch did
# `sys.path.insert(0, dirname(__file__))` and nothing else, which works in
# tools/ and DIES ANYWHERE ELSE -- including in the staging directory it was
# written in.  Its gate passed only because the gate had already put tools/ on
# sys.path itself.  A resolver that can only succeed in one location is a
# resolver whose gate cannot fail.
def _pk39_tools_dir():
    _here = os.path.dirname(os.path.abspath(__file__))
    for _c in (_here, os.environ.get('RELSCORE_TOOLS') or '',
               os.path.join(os.getcwd(), 'tools')):
        if _c and os.path.exists(os.path.join(_c, 'rel_tuprobe.py')):
            return _c
    sys.stderr.write(
        'cannot find rel_tuprobe.py (looked in %s).  This tool imports it so\n'
        'that the difflib cap has ONE definition.  Set RELSCORE_TOOLS.\n'
        % ', '.join(repr(_c) for _c in (_here, os.environ.get(
            'RELSCORE_TOOLS') or '', os.path.join(os.getcwd(), 'tools')) if _c))
    sys.exit(2)


sys.path.insert(0, _pk39_tools_dir())
import rel_tuprobe as _T                                        # noqa: E402

TREE = os.getcwd()

# ------------------------------------------------------------ canonicalisation
#
# The two sides come from DIFFERENT disassemblers: the expected side is the
# project's asm/nonmatchings/*.s, the got side is powerpc-eabi-objdump.  They
# disagree about extended mnemonics, and every disagreement used to be scored
# as a real diff.  Run 14 measured what that cost:
#
#   * mini_billiards: `or. rA,rS,rS` vs `mr. rA,rS` alone -- 112 occurrences
#     project-wide, inflating EVERY module's near-miss scores.
#   * mini_race: on lbl_000021C8, 10 of the 16 reported diffs were phantom and
#     the variant was a byte-exact MATCH.  It only found out by taking the top
#     candidates to `rel_sweep --sweep`.
#
# Every rule below rewrites BOTH sides to the same base form, and each is
# EXACT: same encoding <-> same canonical text.  Nothing here collapses two
# distinct encodings into one, which is the only way a canonicaliser can
# manufacture a false MATCH.
CR_BIT = {'lt': 0, 'gt': 1, 'eq': 2, 'so': 3, 'un': 3}
_CR_LOGICAL = ('crand', 'cror', 'crxor', 'crnand', 'crnor', 'creqv',
               'crandc', 'crorc')
_SPR = {'lr': 8, 'ctr': 9, 'xer': 1}


def _crbit(tok):
    """'eq' -> '2', '4*cr1+eq' -> '6', '6' -> '6'."""
    t = tok.strip()
    m = re.fullmatch(r'4\*cr([0-7])\+(lt|gt|eq|so|un)', t)
    if m:
        return str(int(m.group(1)) * 4 + CR_BIT[m.group(2)])
    if t in CR_BIT:
        return str(CR_BIT[t])
    return t


def _i(tok):
    """int value of an operand token, or None if it is not a plain integer."""
    t = tok.strip()
    try:
        return int(t, 16) if t.lower().startswith(('0x', '-0x')) else int(t)
    except ValueError:
        return None


def canon(mn, ops):
    """Rewrite one instruction to its base-mnemonic form. Returns 'mn ops'."""
    rec = mn.endswith('.')
    base = mn[:-1] if rec else mn
    dot = '.' if rec else ''
    a = [x.strip() for x in ops.split(',')] if ops else []

    def out(m, *parts):
        return '%s%s %s' % (m, dot, ','.join(str(p) for p in parts))

    # --- condition-register bits: symbolic names and the alias forms
    if base in _CR_LOGICAL and a:
        return out(base, *[_crbit(x) for x in a])
    if base in ('crclr', 'crset') and len(a) == 1:
        b = _crbit(a[0])
        return out('crxor' if base == 'crclr' else 'creqv', b, b, b)
    if base in ('crmove', 'crnot') and len(a) == 2:
        d, s = _crbit(a[0]), _crbit(a[1])
        return out('cror' if base == 'crmove' else 'crnor', d, s, s)

    # --- the rlwinm family.  mwcc emits these constantly and the two
    # disassemblers pick different spellings of the same rotate.
    if len(a) >= 3:
        n, b = _i(a[2]), (_i(a[3]) if len(a) > 3 else None)
        if n is not None:
            if base == 'slwi':
                return out('rlwinm', a[0], a[1], n, 0, 31 - n)
            if base == 'srwi':
                return out('rlwinm', a[0], a[1], (32 - n) % 32, n, 31)
            if base == 'clrlwi':
                return out('rlwinm', a[0], a[1], 0, n, 31)
            if base == 'clrrwi':
                return out('rlwinm', a[0], a[1], 0, 0, 31 - n)
            if base == 'rotlwi':
                return out('rlwinm', a[0], a[1], n, 0, 31)
            if base == 'extlwi' and b is not None:
                return out('rlwinm', a[0], a[1], b, 0, n - 1)
            if base == 'extrwi' and b is not None:
                return out('rlwinm', a[0], a[1], (b + n) % 32, 32 - n, 31)

    # --- simple two-operand aliases
    if base == 'mr' and len(a) == 2:
        return out('or', a[0], a[1], a[1])
    if base == 'not' and len(a) == 2:
        return out('nor', a[0], a[1], a[1])
    if base == 'nop' and not a:
        return out('ori', 'r0', 'r0', 0)
    if base == 'li' and len(a) == 2:
        return out('addi', a[0], 'r0', a[1])
    if base == 'lis' and len(a) == 2:
        return out('addis', a[0], 'r0', a[1])
    if base in ('subi', 'subis', 'subic') and len(a) == 3:
        v = _i(a[2])
        if v is not None:
            return out({'subi': 'addi', 'subis': 'addis',
                        'subic': 'addic'}[base], a[0], a[1], -v)

    # --- special-purpose register moves
    m = re.fullmatch(r'm([tf])(lr|ctr|xer)', base)
    if m and len(a) == 1:
        return out('m%sspr' % m.group(1), _SPR[m.group(2)], a[0])

    return '%s %s' % (mn, ops)


def norm_operands(mn, ops):
    # branch displacements carry no information for us
    if mn.startswith('b') and mn not in ('bdnz',):
        pass
    ops = ops.replace(' ', '')
    return ops


def parse_s(path):
    """asm/nonmatchings/... -> list of normalised 'mn ops'."""
    out = []
    for line in open(path, encoding='utf-8', errors='replace'):
        m = re.match(r'/\* [0-9A-F]{8} ([0-9A-F]{8}) \*/\s+(\S+)\s*(.*)', line)
        if not m:
            continue
        mn = m.group(2)
        ops = m.group(3).strip()
        # mask relocations -- ANY symbol, not just lbl_XXXXXXXX.  The object
        # side is unlinked so every @ha/@l operand disassembles as 0.
        #
        # The PARENTHESISED symbol+addend form has to go first: run 13's
        # mini_golf established that `(lbl_X+0xNN)@ha/@l` is accepted by mwcc's
        # inline assembler and is byte-identical, so the asm here really does
        # contain it -- and the bare-symbol regex below cannot match it (the
        # paren and the `+` are not in its character class).  It fell through
        # unmasked, the `lbl_` -> L rule turned it into `(L+0x34)@ha`, and it
        # was scored against the object side's plain 0 as a real diff.  That is
        # the relocation noise mini_golf reported inflating PCMP_REGBLIND.
        ops = re.sub(r'\([A-Za-z_$.][\w$.]*\s*[-+]\s*(?:0x[0-9A-Fa-f]+|\d+)\)'
                     r'@(ha|l|sda2?1?)', '0', ops)
        ops = re.sub(r'[A-Za-z_$.][\w$.]*@(ha|l|sda2?1?)', '0', ops)
        ops = re.sub(r'\blbl_[0-9A-Fa-f]{8}\b', 'L', ops)
        if mn.startswith('b'):
            # a call/branch to a NAMED target is a relocated displacement too;
            # never touch condition-register or GPR operands.
            ops = re.sub(r'\b(?!cr[0-7]\b|r\d+\b|f\d+\b)[A-Za-z_][\w$.]*\b',
                         'L', ops)
        if mn.startswith('b'):
            ops = re.sub(r'\bL\b', 'L', ops)
        mn, _, ops = canon(mn, ops).partition(' ')
        out.append('%s %s' % (mn, norm_operands(mn, ops)))
    return out


DEC = re.compile(r'(-?\d+)')


def parse_obj(text, fn):
    out = []
    started = False
    for line in text.splitlines():
        if line.startswith('===='):
            started = True
            continue
        m = re.match(r'\s*([0-9a-f]+):\t(\S+)\s*(.*)', line)
        if not started or not m:
            continue
        mn = m.group(2)
        ops = m.group(3).strip()
        ops = re.sub(r'\s*<[^>]*>', '', ops)          # <pf+0x40>
        ops = re.sub(r'^([0-9a-f]+)$', 'L', ops)      # branch target
        if mn.startswith('b'):
            # includes bdnz: the .s side masks its target too, so masking here
            # as well is required or every bdnz reads as a diff.
            ops = re.sub(r'\b[0-9a-f]+\b(?!\()', 'L', ops)
        mn, _, ops = canon(mn, ops).partition(' ')
        ops = ops.replace(' ', '')
        out.append('%s %s' % (mn, ops))
    return out


# PCMP_REGBLIND=g   blind the VOLATILE GPR numbers (r0, r3..r12)
# PCMP_REGBLIND=f   blind the VOLATILE FPR numbers (f0..f13)
# PCMP_REGBLIND=gf  both.  Non-volatiles (r14..r31, f14..f31), r1 and r2 are
# always left exact.  Use this to tell a WRONG SCHEDULE from a schedule that is
# already right and only numbered differently -- the aligned score cannot.
#
# PCMP_REGBLIND=G/F/GF  blind ALL of that register file (r0, r3..r31 / f0..f31),
# i.e. the CALLEE-SAVED numbers too.  r1 and r2 are never blinded -- they are
# not allocatable, so blinding them would hide a real frame or SDA difference.
#
# RUN 15 -- the lowercase form is blind to callee-saved renumbering BY
# CONSTRUCTION, and run 14 already knew that abstractly (sel_ngc's f31/f30 swap
# read as "structural").  option then measured what it costs: on its `8C40`,
# `gf` reports 23 in 22 -- "structural, do not sweep" -- while an all-register
# blind reports 4 in 3, the schedule being byte-identical from insn 9 to 391.
# The entire residual was callee-saved rank, which is a SWEEPABLE axis.  Two of
# its five near-misses were mis-triaged that way.  So a `gf` reading is only
# evidence of "structural" once `GF` agrees with it; run BOTH.
BLIND = os.environ.get('PCMP_REGBLIND', '')
# RUN 15 -- any value that is not made of g/f/G/F used to be SILENTLY IGNORED,
# so `PCMP_REGBLIND=all` blinded nothing and read exactly like an unblinded
# score.  mini_bowling was briefly misled by it, and the failure is the
# expensive direction: a blind that quietly does nothing reports a schedule as
# WRONG when it is right, which is the reading that sends the next run down a
# type sweep instead of a rank sweep.  Adding the uppercase form made more
# plausible-looking wrong values available, so it is now checked.
if set(BLIND) - set('gfGF'):
    sys.exit('PCMP_REGBLIND=%r: only g, f, G, F (and combinations) are '
             'understood.\n  lowercase = blind that file\'s VOLATILES '
             '(r0,r3..r12 / f0..f13)\n  UPPERCASE = blind ALL of it '
             '(r0,r3..r31 / f0..f31); r1 and r2 are never blinded.\n'
             '  An unrecognised value used to be ignored silently and score '
             'as if unblinded.' % BLIND)
_GPR = re.compile(r'\br(?:0|[3-9]|1[0-2])\b')
_FPR = re.compile(r'\bf(?:[0-9]|1[0-3])\b')
_GPR_ALL = re.compile(r'\br(?:0|[3-9]|1[0-9]|2[0-9]|3[01])\b')
_FPR_ALL = re.compile(r'\bf(?:[0-9]|1[0-9]|2[0-9]|3[01])\b')

# RUN 17 -- `r0` in the RA/base position of a D-form is the LITERAL ZERO, not
# GPR0.  The blind above is a plain text substitution, and canon() actively
# CREATES those literal-zero r0s (`li rD,v` -> `addi rD,r0,v`, `lis` ->
# `addis rD,r0,v`), so `addi r6,r4,0` (a register move) and `li r6,0` (load
# zero) both blind to `addi rA,rA,0` and compare EQUAL.  The tool then reports
# 0 in 0 on a function that is really several instructions wrong -- the same
# failure mode as run 16's AEDC artefact, but invisible to the documented check
# ("same mnemonic, same non-register operands"), because these ARE the same
# mnemonic and the differing operand IS a register spelling.
#
# Found by sel_ngc in run 17.  Two corrections to how it was reported, both
# measured here (scratch test, 3 wrong -> 0):
#   * `mr rD,rA` vs `li rD,0` is SAFE -- canon rewrites mr to `or`, so the
#     mnemonics already differ.  The live case is a bare `addi rD,rA,0`.
#   * It is NOT uppercase-only.  Lowercase `g` blinds r0 too, so `gf` has it.
# Protecting the field costs nothing on a genuine renumbering: `addi r6,r4,0`
# vs `addi r7,r5,0` still compares equal.
_RA0_ADDI = re.compile(r'^(addis?) ([^,]+),r0,')
_RA0_MEM = re.compile(r'\(r0\)')


def _protect_zero_ra(s):
    """Rename literal-zero RA/base fields so the register blind cannot eat them."""
    s = _RA0_ADDI.sub(r'\1 \2,rZ,', s)
    return _RA0_MEM.sub('(rZ)', s)


# A 16-bit immediate field has ONE encoding but two spellings: the .s side
# writes 0xffff where objdump writes -1.  Fold both to the signed reading.
#
# test_mode found this as `rel_pcmp scores +1 region on any function containing
# addis rX,rX,-1`, and also found the trap in fixing it: sign-extending only
# the hex spelling INVENTS diffs, because objdump prints some immediates as
# bare decimals already.  So this runs inside to_words(), which both sides go
# through, and it is idempotent -- -1 stays -1.
#
# Safe because it is a bijection on a single field: within one mnemonic, 65535
# and -1 ARE the same encoding, so nothing distinct is collapsed.  The lookaround
# keeps it off register numbers (the 12 in r12 is not preceded by a boundary).
_INT = re.compile(r'(?<![\w.])(-?\d+)(?![\w.])')


def _signed16(s):
    def f(m):
        v = int(m.group(1))
        return str(v - 0x10000 if 0x8000 <= v <= 0xFFFF else v)
    return _INT.sub(f, s)


def to_words(seq):
    """Convert decimal operands to hex-agnostic canonical ints."""
    res = []
    for s in seq:
        s = re.sub(r'(-?)0x([0-9a-fA-F]+)',
                   lambda m: str(int(m.group(1) + str(int(m.group(2), 16)))), s)
        s = _signed16(s)
        # Must run BEFORE any register substitution, and only when a GPR blind
        # is actually on -- unblinded output stays verbatim r0 so a printed
        # diff still reads like real disassembly.
        if 'G' in BLIND or 'g' in BLIND:
            s = _protect_zero_ra(s)
        # Uppercase wins: it is the strictly wider blind of the same file.
        if 'G' in BLIND:
            s = _GPR_ALL.sub('rA', s)
        elif 'g' in BLIND:
            s = _GPR.sub('rV', s)
        if 'F' in BLIND:
            s = _FPR_ALL.sub('fA', s)
        elif 'f' in BLIND:
            s = _FPR.sub('fV', s)
        res.append(s)
    return res


def score(exp, got):
    exp = to_words(exp)
    got = to_words(got)
    # RUN 39: capped -- see the import block at the top of this file.
    # rel_tuprobe.aligned() already filters `equal` out of the ops it returns,
    # so `regions` is len(ops) and lo/hi come off the same list this used to
    # build by hand.  Same three numbers, from one definition.
    n, ops = _T.aligned(exp, got)
    regions = len(ops)
    lo = ops[0][1] if ops else None
    hi = ops[-1][2] if ops else None
    return n, regions, lo, hi


# sel_ngc is the module whose two names differ: rel_probe.py accepts the MODULE
# name `sel_ngc` (its argparse choices), while asm/nonmatchings/ is keyed by the
# ASM STEM `sel_ngc_rel`.  The old module() returned one string for both jobs
# and handed the stem to rel_probe, which rejected it -- so in run 14 every
# rel_pcmp probe in sel_ngc reported a silent FAIL and the module scored its
# whole run without the tool.  Keep the two names apart.
STEM = {'sel_ngc': 'sel_ngc_rel'}

_TOOL = "pcmp"


# --------------------------------------------------------------------------- #
# RUN 40 -- THE DIRECTIVE GAP.  `//@SUB` / `//@PROTO` / `//@DROPRE` are
# implemented in `rel_tuprobe.py` ONLY.  This tool has never implemented them
# and never warned: a directive line is spliced/compiled as a C comment, so the
# owner-level retype it asks for silently does not happen and the figure that
# comes back is a score of a DIFFERENT PROGRAM.
#
# It REFUSES rather than implementing them, deliberately.  Implementing a second
# copy of the directive engine is how two tools drift, and this project has the
# scar: rel_tuprobe's own directive handling took three runs and two escaping
# fixes to settle.  One implementation, one place.
#
# ⚠ SCOPE, STATED SO IT CANNOT BE MISREAD AS MORE: this guard detects `//@`
# MARKER LINES and nothing else.  It makes NO claim about a draft whose own
# signature CONTRADICTS a landed declarator -- MEASURED by test_mode in run 40
# on `lbl_0000F6F0`, where the run-24/26/31 body family carries ZERO `//@`
# lines and still fails, with `identifier redeclared / was declared as
# 'void (struct Ape *, int)' / now declared as 'void (long, long)'` cascading
# to "undefined identifier" at DRAFT line numbers.  That is a fourth failure
# mode, no directive is present, and NO directive fix can reach it.  Do not
# read a clean pass here as "the draft's declarators are healthy".
#
# ⚠⚠ AND IT DOES NOT TELL YOU TO "ADD THE THIRD PIPE".  MEASURED by option in
# run 40, n = 14/14 stale directives across 9 owner files: every one was a
# malformed single-pipe `//@SUB` AND every one also had a DEAD OLD ANCHOR, so
# repairing the separator only converts `MALFORMED DIRECTIVE` into `ANCHOR
# MISSING` -- same rc=2, different message, no draft rescued.  The repair that
# works is to NEUTRALISE the line (the owner already carries the declarator the
# directive was asking for).
_DIRECTIVES = ('//@SUB', '//@PROTO', '//@DROPRE', '//@SUBST', '//@DROP')


def _check_directives(paths):
    """Refuse any input file carrying a directive this tool cannot apply."""
    hits = []
    for p in paths:
        try:
            fh = open(p, encoding='utf-8', errors='replace')
        except OSError:
            continue
        with fh:
            for i, line in enumerate(fh, 1):
                s = line.strip()
                for d in _DIRECTIVES:
                    if s.startswith(d):
                        hits.append((p, i, s[:96]))
                        break
    if not hits:
        return
    sys.stderr.write(
        'rel_%s: %d DIRECTIVE LINE(S) THIS TOOL CANNOT APPLY.\n' % (_TOOL, len(hits)))
    for p, i, s in hits:
        sys.stderr.write('    %s:%d  %s\n' % (p, i, s))
    sys.stderr.write(
        '\n`//@SUB` / `//@PROTO` / `//@DROPRE` are implemented in\n'
        'tools/rel_tuprobe.py and NOWHERE ELSE.  Passed through here they are\n'
        'C comments: they do nothing, and the score you would get back is a\n'
        'score of a DIFFERENT PROGRAM than the draft describes.  Refusing\n'
        'instead of reporting that number.\n\n'
        'Do ONE of:\n'
        '  * score it with rel_tuprobe.py, which applies the directives; or\n'
        '  * NEUTRALISE the line and re-run here -- if the owner already\n'
        '    carries the declarator the directive asks for, the directive is\n'
        '    stale and deleting it is the whole fix.\n'
        '⚠ DO NOT "repair" a single-pipe `//@SUB` to three pipes and retry.\n'
        '  MEASURED, option run 40, n=14/14: all fourteen stale directives were\n'
        '  single-pipe AND had a dead old anchor, so fixing the separator only\n'
        '  turns MALFORMED DIRECTIVE into ANCHOR MISSING -- same rc=2, no draft\n'
        '  rescued.\n')
    raise SystemExit(2)



def probe_module():
    """The MODULE name, i.e. what rel_probe.py's `choices` will accept.

    PCMP_MODULE overrides; otherwise infer from the warm-copy directory name
    (C:/tmp/smbm/<MOD>).  asm/nonmatchings/ holds EVERY module in this repo, so
    its contents cannot say which one we are working on -- only confirm a guess.
    """
    m = os.environ.get('PCMP_MODULE')
    if m:
        return m
    d = os.path.join(TREE, 'asm', 'nonmatchings')
    subs = [x for x in os.listdir(d) if os.path.isdir(os.path.join(d, x))]
    base = os.path.basename(os.path.abspath(TREE))
    if base in subs or STEM.get(base) in subs:
        return base
    raise SystemExit('set PCMP_MODULE: tree %r matches none of %r'
                     % (base, subs))


def asm_stem(mod=None):
    """The asm/nonmatchings/<stem>/ and src/<stem>*.c prefix for a module."""
    mod = mod or probe_module()
    return STEM.get(mod, mod)


def module():
    """Deprecated alias -- returns the ASM STEM. Prefer asm_stem()/probe_module()."""
    return asm_stem()


def main():
    # RUN 40 -- ARGUMENT VALIDATION.  Until now `rel_pcmp.py` with no arguments
    # raised `IndexError: list index out of range` from `sys.argv[1]` and exited
    # 1, which is indistinguishable from a real scoring failure.  Pre-existing
    # and verified against HEAD -- not a regression from run 39's landing.
    # Exit 2 for a usage error, as rel_blindtable and rel_ablind do.
    argv = sys.argv[1:]
    if not argv or argv[0] in ('-h', '--help'):
        print(__doc__.strip(), file=sys.stderr)
        raise SystemExit(2)
    if len(argv) < 2:
        print('rel_pcmp: need <label> and <probedir>.\n'
              'usage: python tools/rel_pcmp.py <label> <probedir> [funcname]\n'
              'Run from the module tree root.', file=sys.stderr)
        raise SystemExit(2)
    label = argv[0]
    d = argv[1]
    if not os.path.isdir(d):
        print('rel_pcmp: %r is not a directory.  <probedir> holds the probe\n'
              '.c files to score; pass the DIRECTORY, not a file.' % d,
              file=sys.stderr)
        raise SystemExit(2)
    _check_directives(sorted(glob.glob(os.path.join(d, '*.c'))))
    # RUN 17 -- argv[3] used to default to 'pf' with no fallback, so a draft
    # that defines the REAL label (i.e. a whole-file variant rather than a
    # rel_probe micro-probe) scored FAIL on every row, indistinguishable from a
    # compile error.  THREE modules hit it independently in one run --
    # mini_fight's first draft of the function it went on to convert was
    # already 200-insn-exact and was read as broken -- and _harvest_run16/pd.py
    # defaults to the label instead, so the two tools disagreed.
    # Now: try both names, and say which failure it actually was.
    cands = [argv[2]] if len(argv) > 2 else ['pf', label]
    mod = probe_module()
    spath = os.path.join(TREE, 'asm', 'nonmatchings', asm_stem(mod), label + '.s')
    exp = parse_s(spath)
    rows = []
    for f in sorted(glob.glob(os.path.join(d, '*.c'))):
        got, why = [], 'FAIL'
        for fn in cands:
            r = subprocess.run(
                [sys.executable, os.path.join(TREE, 'tools', 'rel_probe.py'),
                 mod, '--func', fn, f],
                capture_output=True, text=True, cwd=TREE)
            got = parse_obj(r.stdout + r.stderr, fn)
            if got:
                break
            # RUN 19: this used to read `if r.returncode`, and the comment
            # claimed a non-zero exit meant a real compile failure. It did NOT.
            # rel_probe exited 1 both for COMPILE FAILED and for "compiled fine,
            # no .text matching --func", so with --func the FAIL(no func) branch
            # was UNREACHABLE and every sibling file in a probe directory read
            # as broken. Two modules reported it independently this run, and it
            # is the mechanism behind the "this draft does not compile" claim
            # that is 0-for-9. rel_probe now exits 2 for the second case.
            why = ('FAIL(no func %s)' % fn if r.returncode == 2
                   else 'FAIL(compile)')
        name = os.path.basename(f)[:-2]
        if not got:
            rows.append((9999, 0, 0, 0, name, 0, why))
            continue
        n, reg, lo, hi = score(exp, got)
        rows.append((n, reg, lo, hi, name, len(got), None))
    rows.sort()
    print('%-32s %6s %5s %-12s %s' % ('probe', 'score', 'regs', 'span', 'insn'))
    print('exp insn = %d' % len(exp))
    for n, reg, lo, hi, name, ln, why in rows:
        if n == 9999:
            print('%-32s  %s' % (name, why))
            continue
        print('%-32s %6d %5d %-12s %d' % (name, n, reg, '%s-%s' % (lo, hi), ln))


if __name__ == '__main__':
    main()
