#!/usr/bin/env python3
"""Read a callee's TRUE ARITY off its own `.s`.  Costs no builds.

WHY THIS EXISTS
---------------
A call written with too few arguments does NOT present as a missing argument.
It presents as **pure register numbering** -- identical schedule, identical
instructions, different registers -- which reads like an allocator tie-break
and sends you into a spelling sweep that cannot converge.

Two modules banked on this in two consecutive runs, both after the residual had
been carried for several runs as "register numbering":

  run 26  mini_billiards  lbl_00005DD0  1,020 insn
          `lbl_00018608.s` reads f1-f6 before writing them: SIX arguments,
          where the draft said `(void)`.  Golden must keep six subexpressions
          live across the call and is forced into f7/f0; the `(void)` draft
          recycles f0..f3.  11 diffs, identical schedule, pure FPR numbering.
          Six explicit arguments = MATCH on the first compile.

  run 27  mini_bowling    lbl_00004BD8     78 insn
          The draft called `lbl_000079E8` with ONE argument.  It takes TWO.
          Golden's four call sites are `li r3,0 ; bl` with r4 ALREADY holding
          `ball` -- free, because golden keeps `ball` in r4 throughout.  The
          draft had sat at 14 in 10 for three runs.

THE DIAGNOSTIC, sharpened by run 27
-----------------------------------
**Golden setting FEWER argument registers at a call site than the callee READS
means the extra argument is a value golden already has in that register.**

The callee's body also gives you the TYPES:
  * no entry `frsp` on an FPR argument  => it is an f64 parameter
  * `frsp f1,f1` just before `blr`      => it returns f32

SCOPE -- it is not universal, and it is cheap enough not to matter
-----------------------------------------------------------------
mini_bowling audited every callee of `3A10` and `3574` the same way and found
them **all correct**.  So this is not a lever you can count on; it is a free
audit worth running ONCE per draft, before any sweep.  Run it with `--calls`
over an owner file before drafting anything in it.

usage:
  python tools/rel_arity.py <module> <label> [<label> ...]
  python tools/rel_arity.py <module> --calls <file.c>   audit every lbl_ this
                                                        file calls
  python tools/rel_arity.py --selftest

`<module>` is the MODULE NAME (sel_ngc, not sel_ngc_rel); the asm stem is
resolved for you.
"""
import os
import re
import sys

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# Module name -> asm/nonmatchings/<stem>/ .  sel_ngc is the odd one out, as it
# is in rel_merge_back.py, rel_tu_map.py and rel_carve.py.
STEMS = {
    'mini_bowling': 'mini_bowling', 'mini_race': 'mini_race',
    'mini_fight': 'mini_fight', 'mini_pilot': 'mini_pilot',
    'mini_golf': 'mini_golf', 'mini_billiards': 'mini_billiards',
    'sel_ngc': 'sel_ngc_rel', 'option': 'option', 'test_mode': 'test_mode',
}

ARGS_G = ['r%d' % i for i in range(3, 11)]
ARGS_F = ['f%d' % i for i in range(1, 9)]

# Opcodes whose FIRST register operand is a SOURCE, not a destination.  Getting
# this list wrong in either direction corrupts the answer silently: a missing
# store here would mark the stored register "written" and hide a real argument.
WRITE_NONE = ('stw', 'stwu', 'sth', 'sthu', 'stb', 'stbu', 'stfs', 'stfsu',
              'stfd', 'stfdu', 'stwx', 'sthx', 'stbx', 'stfsx', 'stfdx',
              'stmw', 'stswi',
              'cmpw', 'cmpwi', 'cmplw', 'cmplwi', 'cmpd', 'cmpdi',
              'fcmpo', 'fcmpu',
              'mtctr', 'mtlr', 'mtspr', 'mtcrf', 'mtmsr',
              'bctr', 'bctrl', 'bdnz', 'bdnzf', 'bdnzt')


def _insns(path, limit):
    """Yield (op, operand-text) for the first `limit` real instructions."""
    n = 0
    with open(path) as fh:
        for line in fh:
            m = re.match(r'\s*/\*[^*]*\*/\s+(\S+)\s*(.*)', line)
            if not m:
                continue
            n += 1
            if n > limit:
                return
            yield m.group(1), m.group(2)


def arity_from_text(pairs):
    """-> list of argument registers READ BEFORE WRITTEN, in first-read order."""
    read, written = [], set()
    for op, rest in pairs:
        toks = re.findall(r'\b([rf]\d+)\b', rest)
        if not toks:
            continue
        if op.startswith('b') or op in WRITE_NONE:
            srcs, dst = toks, None
        else:
            dst, srcs = toks[0], toks[1:]
        for t in srcs:
            if (t in ARGS_G or t in ARGS_F) and t not in written and t not in read:
                read.append(t)
        if dst:
            written.add(dst)
    return read


def arity(module, label, tree=None, limit=40):
    stem = STEMS.get(module, module)
    root = tree or REPO
    p = os.path.join(root, 'asm', 'nonmatchings', stem, label + '.s')
    if not os.path.exists(p):
        return None
    return arity_from_text(_insns(p, limit))


def selftest():
    """Both directions: a real argument must be seen, a scratch must not."""
    ok = True

    def run(name, body, want):
        nonlocal ok
        pairs = [(l.split()[0], ' '.join(l.split()[1:])) for l in body]
        got = arity_from_text(pairs)
        if got != want:
            ok = False
            print('SELFTEST FAIL %-28s got %s want %s' % (name, got, want))
        else:
            print('SELFTEST ok   %-28s %s' % (name, got or '(none)'))

    # r3 read before written -> an argument.
    run('one GPR arg', ['lwz r0,0(r3)', 'blr'], ['r3'])
    # r3 WRITTEN first (return value) -> not an argument.
    run('r3 written first', ['li r3,0', 'blr'], [])
    # the mini_billiards case: six FPRs read before write.
    run('six FPR args',
        ['fmuls f0,f1,f2', 'fadds f0,f0,f3', 'fmuls f7,f4,f5',
         'fadds f7,f7,f6', 'blr'],
        ['f1', 'f2', 'f3', 'f4', 'f5', 'f6'])
    # a STORE's first operand is a SOURCE -- if this regressed, r4 would be
    # marked written and the second argument would vanish.  That is exactly
    # mini_bowling's lbl_000079E8.
    run('store operand is a source', ['stw r4,0(r3)', 'blr'], ['r4', 'r3'])
    # stack traffic through r1 must not invent arguments.
    run('r1/r31 are not args',
        ['stwu r1,-16(r1)', 'stw r31,12(r1)', 'blr'], [])
    # a callee-saved read is not an argument.
    run('r14 is not an arg', ['lwz r0,0(r14)', 'blr'], [])
    # cmpwi's register is a source.
    run('cmpwi operand is a source', ['cmpwi r3,0', 'blr'], ['r3'])

    print()
    print('SELFTEST', 'PASS' if ok else 'FAIL')
    return 0 if ok else 1


def main():
    argv = sys.argv[1:]
    if argv and argv[0] == '--selftest':
        return selftest()
    if len(argv) < 2:
        print(__doc__)
        return 2

    module, rest = argv[0], argv[1:]
    if module not in STEMS:
        print('unknown module: %s   (known: %s)'
              % (module, ', '.join(sorted(STEMS))))
        return 2

    if rest and rest[0] == '--calls':
        src = rest[1]
        if not os.path.isabs(src):
            src = os.path.join(REPO, src)
        with open(src, newline='') as fh:
            txt = fh.read()
        labels = sorted(set(re.findall(r'\b(lbl_[0-9A-Fa-f]{8})\s*\(', txt)))
        if not labels:
            print('no lbl_ call sites in %s' % src)
            return 0
    else:
        labels = rest

    for lab in labels:
        a = arity(module, lab)
        if a is None:
            print('%-16s  (no .s -- already converted, or not in this module)'
                  % lab)
        else:
            print('%-16s  reads-before-write: %-32s => %d arg(s)'
                  % (lab, ' '.join(a) or '(none)', len(a)))
    return 0


if __name__ == '__main__':
    sys.exit(main())
