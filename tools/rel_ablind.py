#!/usr/bin/env python3
"""Register-blind ALIGNED score over the REAL LINKED BUILD -- any module.

Promoted from mini_race's run-17 `ablind.py`, which found 213 instructions of
`0 in 0` that three runs had missed, in ~90 seconds of builds.

WHY THIS AND NOT A BIT-FIELD BLIND.  mini_golf proved the old harvested
`regblind.py` never masks frC (bits 6-10 of A-form FP), so every `fmuls`/
`fmadds` leaks a register and a genuine 0-in-0 reads as structural.  Masking
those bits correctly needs a full A-form/X-form opcode table (opcode 63 carries
a 10-bit sub-opcode in exactly that field), and getting it wrong manufactures a
FALSE match -- the expensive direction.

So instead this takes the EXACT words `rel_ascore.py` compares, runs BOTH sides
through the SAME disassembler, and applies `rel_pcmp`'s TEXT blind by importing
it.  That blind is the validated one, and since run 17 it also protects the
literal-zero RA/base field of a D-form (`r0` there is not GPR0), so this tool
inherits that fix for free.

Two things it gives you that `rel_pcmp` cannot:
  * no probe preamble is needed -- it reads the linked .plf, so a module that
    never built one can still get both blinds;
  * the score is over a REAL LINK, not a compile-only micro-probe.

usage:
  python tools/rel_ablind.py <label> [label ...]      # from the module tree
  python tools/rel_ablind.py --module option <label>  # or name it explicitly
env:
  PCMP_REGBLIND= / g / f / gf / G / F / GF   passed straight through
  ABLIND_SHOW=1   print the aligned residual, not just the count

The module is inferred from the tree directory name (the warm copies are named
after their module); --module overrides.  Build the .plf first -- and build it
as the .plf TARGET, never `make src/x.c.o`, or REL_FLAGS do not apply.

THERE IS NO --tree.  Run it FROM the tree (`cd C:/tmp/smbm/<mod>`).  Until run
19 both `--tree X` and a late `--module X` were silently consumed as LABELS and
printed `NOT IN MAP`, i.e. the tool scored nothing and said so quietly; three
modules hit that in run 18.  Both are now hard errors.

TWO LIMITS ON ITS NUMBERS -- run 18 measured both, and neither is a bug:

  * ACCURACY FALLS WITH RELOCATION DENSITY.  It compares objdump TEXT, and the
    .plf side still has unrelocated `bl` targets and @ha/@l halves, which read
    as diffs.  mini_fight saw exact agreement with rel_pcmp on three functions;
    mini_billiards a consistent +2 against rel_ascore; mini_golf got 38 in 30
    against a TRUE 3 in 3 on a function with 15 `bl`s and 14 @ha/@l pairs, and
    exact agreement on a one-`bl` function.  Trust it on relocation-light
    functions; cross-check anything call-heavy against rel_ascore.
  * IT READS EXACTLY `n` WORDS at the label, so its score is MEANINGLESS on a
    draft whose instruction count is wrong (mini_fight: 42 in 40 here against a
    true 2 in 1).  Use rel_pcmp until the count is exact, then this.
"""
import difflib
import os
import re
import subprocess
import sys
import tempfile

TREE = os.getcwd()
sys.path.insert(0, os.path.join(TREE, 'tools'))

# warm dir -> (asm/src stem, built artifact stem).  sel_ngc differs on all
# three counts; option/test_mode drop the "rel_" infix the minigames carry.
MODULES = {
    'mini_bowling':   ('mini_bowling',   'mkbe.rel_mini_bowling'),
    'mini_race':      ('mini_race',      'mkbe.rel_mini_race'),
    'mini_fight':     ('mini_fight',     'mkbe.rel_mini_fight'),
    'mini_pilot':     ('mini_pilot',     'mkbe.rel_mini_pilot'),
    'mini_golf':      ('mini_golf',      'mkbe.rel_mini_golf'),
    'mini_billiards': ('mini_billiards', 'mkbe.rel_mini_billiards'),
    'sel_ngc':        ('sel_ngc_rel',    'mkbe.sel_ngc'),
    'option':         ('option',         'mkbe.option'),
    'test_mode':      ('test_mode',      'mkbe.test_mode'),
}

argv = sys.argv[1:]
mod = None
# --module used to be recognised ONLY as argv[0], and --tree not at all, so
# either one written later fell through to the label loop and printed
# `NOT IN MAP` -- a silent no-score. Accept --module anywhere; reject --tree
# and any other stray option loudly, because a label never starts with '-'.
rest = []
i = 0
while i < len(argv):
    a = argv[i]
    if a == '--module' or a.startswith('--module='):
        if a.startswith('--module='):
            mod = a.split('=', 1)[1]
        elif i + 1 < len(argv):
            i += 1
            mod = argv[i]
        else:
            sys.exit('--module needs a value')
        if not mod:
            sys.exit('--module needs a value')
    elif a == '--tree' or a.startswith('--tree='):
        sys.exit('rel_ablind: there is no --tree. Run it FROM the module tree:\n'
                 '  cd C:/tmp/smbm/<module> && python tools/rel_ablind.py <label>\n'
                 '(it reads the .plf in the current directory).')
    elif a.startswith('-'):
        sys.exit('rel_ablind: unknown option %r. Labels do not start with "-".\n'
                 'usage: python tools/rel_ablind.py [--module M] <label> [label ...]' % a)
    else:
        rest.append(a)
    i += 1
argv = rest
if mod is None:
    mod = os.environ.get('ABLIND_MODULE') or os.path.basename(TREE)
if mod not in MODULES:
    sys.exit('rel_ablind: %r is not a module.\n  tree dir is %r -- pass '
             '--module <name>.\n  known: %s'
             % (mod, os.path.basename(TREE), ', '.join(sorted(MODULES))))
if not argv:
    sys.exit(__doc__.strip().splitlines()[0] + '\n\n' +
             'usage: python tools/rel_ablind.py [--module M] <label> [label ...]')

STEM, ART = MODULES[mod]
PLF = ART + '.plf'
os.environ['FDIFF_MODULE'] = STEM
os.environ.setdefault('PCMP_MODULE', mod)

import rel_pcmp as P   # noqa: E402  (must see PCMP_REGBLIND already in env)

# rel_fdiff.py runs main() at import; load it as a module without that.
fdiff_path = os.path.join(TREE, 'tools', 'rel_fdiff.py')
_src = open(fdiff_path).read().replace('\nmain()', '')
rf = type(sys)('rf')
rf.__dict__['__file__'] = fdiff_path
exec(compile(_src, 'rel_fdiff', 'exec'), rf.__dict__)

OBJDUMP = os.environ.get(
    'OBJDUMP', 'C:/devkitPro/devkitPPC/bin/powerpc-eabi-objdump.exe')


def nz_at(w, i, n):
    """rel_ascore's branch masking, verbatim: an in-range relative branch keeps
    its displacement, anything else is reduced to opcode+flag bits."""
    op = w >> 26
    if op == 16:
        d = w & 0x0000FFFC
        if d & 0x8000:
            d -= 0x10000
    elif op == 18:
        d = w & 0x03FFFFFC
        if d & 0x02000000:
            d -= 0x04000000
    else:
        return w
    if w & 2:
        return w & 0xFC000003
    tgt = i + d // 4
    if 0 <= tgt < n and not (w & 1):
        return w
    return w & 0xFC000003


def disasm(words):
    """words -> ['mn ops', ...] through objdump, canonicalised by rel_pcmp."""
    fd, path = tempfile.mkstemp(suffix='.bin')
    try:
        with os.fdopen(fd, 'wb') as f:
            for w in words:
                f.write((w & 0xFFFFFFFF).to_bytes(4, 'big'))
        r = subprocess.run([OBJDUMP, '-D', '-b', 'binary', '-m', 'powerpc',
                            '-EB', '--no-show-raw-insn', path],
                           capture_output=True, text=True)
    finally:
        os.unlink(path)
    out = []
    for line in r.stdout.splitlines():
        m = re.match(r'\s*([0-9a-f]+):\s+(\S+)\s*(.*)', line)
        if not m:
            continue
        mn, ops = m.group(2), m.group(3).strip()
        ops = re.sub(r'\s*<[^>]*>', '', ops)
        if mn.startswith('b'):
            ops = re.sub(r'\b[0-9a-f]+\b(?!\()', 'L', ops)
        mn, _, ops = P.canon(mn, ops).partition(' ')
        out.append('%s %s' % (mn, ops.replace(' ', '')))
    if len(out) != len(words):
        sys.exit('objdump returned %d rows for %d words' % (len(out), len(words)))
    return out


def main():
    if not os.path.exists(PLF):
        sys.exit('%s missing -- build it first:\n'
                 '  make ... %s' % (PLF, ART + '.plf'))
    text = rf.load_text(PLF)
    addrs = rf.load_map(os.path.splitext(PLF)[0] + '.map')
    show = os.environ.get('ABLIND_SHOW')
    blind = os.environ.get('PCMP_REGBLIND', '') or '(none)'

    for lbl in argv:
        if lbl not in addrs:
            print('%-16s NOT IN MAP' % lbl)
            continue
        rows = rf.load_asm(lbl)
        n = len(rows)
        base = addrs[lbl]
        exp = [nz_at(r[1], i, n) for i, r in enumerate(rows)]
        got = [nz_at(int.from_bytes(text[base + 4 * i:base + 4 * i + 4], 'big'),
                     i, n) for i in range(n)]
        pe, pg = disasm(exp), disasm(got)
        e, g = P.to_words(pe), P.to_words(pg)
        sm = difflib.SequenceMatcher(None, e, g, autojunk=False)
        ops = [o for o in sm.get_opcodes() if o[0] != 'equal']
        tot = sum(max(i2 - i1, j2 - j1) for _, i1, i2, j1, j2 in ops)
        lo = min([o[1] for o in ops], default=0)
        hi = max([o[2] for o in ops], default=0)
        print('%-16s blind=%-5s %3d in %-3d span %d-%d of %d'
              % (lbl, blind, tot, len(ops), lo, hi, n))
        if show and ops:
            for tag, i1, i2, j1, j2 in ops:
                print('   --- %s exp[%d:%d] got[%d:%d]' % (tag, i1, i2, j1, j2))
                for k in range(max(i2 - i1, j2 - j1)):
                    a = pe[i1 + k] if i1 + k < i2 else ''
                    b = pg[j1 + k] if j1 + k < j2 else ''
                    print('   %-38s | %s' % (a, b))


main()
