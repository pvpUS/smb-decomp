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

MNEMONIC_FIX = {}


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
        ops = re.sub(r'[A-Za-z_$.][\w$.]*@(ha|l|sda2?1?)', '0', ops)
        ops = re.sub(r'\blbl_[0-9A-Fa-f]{8}\b', 'L', ops)
        if mn.startswith('b'):
            # a call/branch to a NAMED target is a relocated displacement too;
            # never touch condition-register or GPR operands.
            ops = re.sub(r'\b(?!cr[0-7]\b|r\d+\b|f\d+\b)[A-Za-z_][\w$.]*\b',
                         'L', ops)
        if mn.startswith('b'):
            ops = re.sub(r'\bL\b', 'L', ops)
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
        ops = ops.replace(' ', '')
        out.append('%s %s' % (mn, ops))
    return out


# PCMP_REGBLIND=g   blind the VOLATILE GPR numbers (r0, r3..r12)
# PCMP_REGBLIND=f   blind the VOLATILE FPR numbers (f0..f13)
# PCMP_REGBLIND=gf  both.  Non-volatiles (r14..r31, f14..f31), r1 and r2 are
# always left exact.  Use this to tell a WRONG SCHEDULE from a schedule that is
# already right and only numbered differently -- the aligned score cannot.
BLIND = os.environ.get('PCMP_REGBLIND', '')
_GPR = re.compile(r'\br(?:0|[3-9]|1[0-2])\b')
_FPR = re.compile(r'\bf(?:[0-9]|1[0-3])\b')


def to_words(seq):
    """Convert decimal operands to hex-agnostic canonical ints."""
    res = []
    for s in seq:
        s = re.sub(r'0x([0-9a-fA-F]+)', lambda m: str(int(m.group(1), 16)), s)
        if 'g' in BLIND:
            s = _GPR.sub('rV', s)
        if 'f' in BLIND:
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


def module():
    """PCMP_MODULE, else the warm-copy directory name (C:/tmp/smbm/<MOD>).

    asm/nonmatchings/ holds EVERY module in this repo, so it cannot be used to
    infer which one we are working on.  Note the asm stem for sel_ngc is
    `sel_ngc_rel` while the tree is `sel_ngc`.
    """
    m = os.environ.get('PCMP_MODULE')
    if m:
        return m
    d = os.path.join(TREE, 'asm', 'nonmatchings')
    subs = [x for x in os.listdir(d) if os.path.isdir(os.path.join(d, x))]
    base = os.path.basename(os.path.abspath(TREE))
    for cand in (base, base + '_rel'):
        if cand in subs:
            return cand
    raise SystemExit('set PCMP_MODULE: tree %r matches none of %r'
                     % (base, subs))


def main():
    label = sys.argv[1]
    d = sys.argv[2]
    fn = sys.argv[3] if len(sys.argv) > 3 else 'pf'
    mod = module()
    spath = os.path.join(TREE, 'asm', 'nonmatchings', mod, label + '.s')
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
