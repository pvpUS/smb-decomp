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
_GPR = re.compile(r'\br(?:0|[3-9]|1[0-2])\b')
_FPR = re.compile(r'\bf(?:[0-9]|1[0-3])\b')
_GPR_ALL = re.compile(r'\br(?:0|[3-9]|1[0-9]|2[0-9]|3[01])\b')
_FPR_ALL = re.compile(r'\bf(?:[0-9]|1[0-9]|2[0-9]|3[01])\b')


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
    sm = difflib.SequenceMatcher(None, exp, got, autojunk=False)
    n = 0
    regions = 0
    lo = hi = None
    for tag, i1, i2, j1, j2 in sm.get_opcodes():
        if tag == 'equal':
            continue
        regions += 1
        n += max(i2 - i1, j2 - j1)
        if lo is None:
            lo = i1
        hi = i2
    return n, regions, lo, hi


# sel_ngc is the module whose two names differ: rel_probe.py accepts the MODULE
# name `sel_ngc` (its argparse choices), while asm/nonmatchings/ is keyed by the
# ASM STEM `sel_ngc_rel`.  The old module() returned one string for both jobs
# and handed the stem to rel_probe, which rejected it -- so in run 14 every
# rel_pcmp probe in sel_ngc reported a silent FAIL and the module scored its
# whole run without the tool.  Keep the two names apart.
STEM = {'sel_ngc': 'sel_ngc_rel'}


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
    label = sys.argv[1]
    d = sys.argv[2]
    fn = sys.argv[3] if len(sys.argv) > 3 else 'pf'
    mod = probe_module()
    spath = os.path.join(TREE, 'asm', 'nonmatchings', asm_stem(mod), label + '.s')
    exp = parse_s(spath)
    rows = []
    for f in sorted(glob.glob(os.path.join(d, '*.c'))):
        r = subprocess.run(
            [sys.executable, os.path.join(TREE, 'tools', 'rel_probe.py'),
             mod, '--func', fn, f],
            capture_output=True, text=True, cwd=TREE)
        got = parse_obj(r.stdout + r.stderr, fn)
        name = os.path.basename(f)[:-2]
        if not got:
            rows.append((9999, 0, 0, 0, name, 0))
            continue
        n, reg, lo, hi = score(exp, got)
        rows.append((n, reg, lo, hi, name, len(got)))
    rows.sort()
    print('%-32s %6s %5s %-12s %s' % ('probe', 'score', 'regs', 'span', 'insn'))
    print('exp insn = %d' % len(exp))
    for n, reg, lo, hi, name, ln in rows:
        if n == 9999:
            print('%-32s  FAIL' % name)
            continue
        print('%-32s %6d %5d %-12s %d' % (name, n, reg, '%s-%s' % (lo, hi), ln))


if __name__ == '__main__':
    main()
