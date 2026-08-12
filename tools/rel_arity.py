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

TWO DEFECTS FIXED IN RUN 28 -- both silent, both reported by modules that
correctly did NOT patch the tool
-------------------------------------------------------------------------
mini_fight found `--calls <file>` audited what a file **DECLARES**, not what it
calls: the scan matched `lbl_X(` anywhere, and every split REL owner
forward-declares every label, so it printed an identical ~250-row list for
EVERY file and was useless as the per-file audit the brief prescribes.
mini_bowling independently found the same regex matched inside **comments**.
Call sites are now discriminated from declarations, definitions and comments;
`--decls` shows what was skipped.

mini_fight also found the fixed 40-instruction window **under-reported arity**:
`lbl_00016CC8` reported 0 arguments where the truth is at least 1 (a `stb
r0,0(r3)` in `case 5`, r3 never written on that path).  Because the diagnostic
above is "golden sets FEWER argument registers than the callee reads", an
under-report **inverts the diagnostic silently.**  The whole function is now
scanned by default and every argument carries the instruction index where it
was first read, with anything past the entry window flagged `late`.

  ** THE SCAN IS PATH-SENSITIVE. **  It is a CFG liveness analysis
  (`arity_cfg`): a register counts as an argument when some path reaches a READ
  of it without an intervening write, with `bl` clobbering the volatiles.  A
  linear scan cannot see `lbl_00016CC8`'s `r3` at ANY window size, because the
  entry block branches PAST the `lis r3` to a block that stores through it --
  and the self-test asserts the linear scan still says 0 on that input, so this
  gate cannot go vacuous.

  This paragraph used to read "STILL PATH-INSENSITIVE / the scan is linear",
  describing the pre-run-28 implementation.  mini_bowling found it stale in run
  29 and handed it over rather than patching it.  **A `late` argument is still a
  prompt to read the `.s`, not a verdict.**

usage:
  python tools/rel_arity.py <module> <label> [<label> ...]
  python tools/rel_arity.py <module> --calls <file.c>   audit every lbl_ this
                                                        file actually CALLS
  python tools/rel_arity.py <module> --calls <file.c> --decls   also list the
                                                        declarations skipped
  python tools/rel_arity.py --selftest

options:
  --tree <dir>    read asm/ from another tree (a warm copy) instead of this one
  --limit <n>     scan only the first n instructions (default: the whole body)

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


# How far in an argument may be first read and still be an obvious one.  Past
# this it is reported `late` -- see the docstring: the scan is path-insensitive,
# so a late hit is a prompt to read the .s, not a verdict.  A FIXED window used
# to be the only scan, and it silently under-reported (run 28).
ENTRY_WINDOW = 40


def _insns(path, limit=None):
    """Yield (op, operand-text) per real instruction; ALL of them if limit is None."""
    n = 0
    with open(path) as fh:
        for line in fh:
            m = re.match(r'\s*/\*[^*]*\*/\s+(\S+)\s*(.*)', line)
            if not m:
                continue
            n += 1
            if limit is not None and n > limit:
                return
            yield m.group(1), m.group(2)


def arity_detail(pairs):
    """-> [(register, 1-based instruction index of its first read), ...].

    An argument is a register READ BEFORE it is WRITTEN, in first-read order.
    """
    read, written, out = [], set(), []
    for i, (op, rest) in enumerate(pairs, 1):
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
                out.append((t, i))
        if dst:
            written.add(dst)
    return out


def arity_from_text(pairs):
    """-> list of argument registers READ BEFORE WRITTEN, in first-read order."""
    return [r for r, _ in arity_detail(pairs)]


# Registers a `bl`/`bctrl` destroys.  Without this a read AFTER a call looks
# like a read-before-write and invents an argument.
CALL_CLOBBER = set(['r%d' % i for i in range(3, 13)] +
                   ['f%d' % i for i in range(0, 14)])
CALLS = ('bl', 'bctrl', 'blrl')
RETURNS = ('blr',)
UNCOND = ('b', 'ba')


def _srcs_dst(op, rest):
    """-> (source registers, destination register or None) for one instruction."""
    toks = re.findall(r'\b([rf]\d+)\b', rest)
    if not toks:
        return [], None
    if op.startswith('b') or op in WRITE_NONE:
        return toks, None
    return toks[1:], toks[0]


def _parse_blocks(lines):
    """-> (blocks, label->index, has_indirect).  A block is a list of insns.

    Split at every label and after every control transfer.  A `bl` is NOT a
    control transfer -- it falls through -- but it does clobber the volatiles.
    """
    items = []                       # ('L', name) | ('I', op, rest)
    for line in lines:
        m = re.match(r'\s*/\*[^*]*\*/\s+(\S+)\s*(.*)', line)
        if m:
            items.append(('I', m.group(1), m.group(2).strip()))
            continue
        m = re.match(r'\s*([A-Za-z_.][\w.]*):\s*$', line)
        if m:
            items.append(('L', m.group(1)))
    blocks, labels, cur, has_indirect = [], {}, [], False
    for it in items:
        if it[0] == 'L':
            if cur:
                blocks.append(cur)
            labels[it[1]] = len(blocks)
            cur = []
            continue
        cur.append(it)
        op = it[1]
        if op == 'bctr':
            has_indirect = True
        if (op in RETURNS or op == 'bctr' or op in UNCOND or
                (op.startswith('b') and op not in CALLS)):
            blocks.append(cur)
            cur = []
    if cur:
        blocks.append(cur)
    return blocks, labels, has_indirect


def _succs(blocks, labels, has_indirect, i):
    """Successor block indices of block i."""
    blk = blocks[i]
    nxt = [i + 1] if i + 1 < len(blocks) else []
    if not blk:
        return nxt
    op, rest = blk[-1][1], blk[-1][2]
    tgt = re.match(r'([A-Za-z_.][\w.]*)', rest)
    tgt = labels.get(tgt.group(1)) if tgt else None
    if op in RETURNS:
        return []
    if op == 'bctr':
        # Indirect: targets unknown.  Assume EVERY label -- conservative in the
        # direction that finds MORE arguments, which is the safe direction here.
        return sorted(set(labels.values()))
    if op in UNCOND:
        return [tgt] if tgt is not None else nxt
    if op.startswith('b') and op not in CALLS:
        return ([tgt] if tgt is not None else []) + nxt
    return nxt


def arity_cfg(lines):
    """-> [(register, first-read instruction index), ...] by CFG liveness.

    An argument is a register LIVE ON ENTRY: read on SOME path from the entry
    block before being written on that path.  The old linear scan asked only
    about TEXTUAL order, so a write on one branch masked a read on another --
    mini_fight's `lbl_00016CC8` reported 0 arguments where r3 is genuinely one
    (entry branches straight past the `lis r3` to a block that stores through
    it).  That under-report inverts this tool's headline diagnostic silently.
    """
    blocks, labels, has_indirect = _parse_blocks(lines)
    if not blocks:
        return []
    use, dfn = [], []
    for blk in blocks:
        u, d = [], set()
        for _, op, rest in blk:
            srcs, dst = _srcs_dst(op, rest)
            for t in srcs:
                if (t in ARGS_G or t in ARGS_F) and t not in d and t not in u:
                    u.append(t)
            if op in CALLS:
                d |= CALL_CLOBBER
            elif dst:
                d.add(dst)
        use.append(u)
        dfn.append(d)
    live_in = [set() for _ in blocks]
    changed = True
    while changed:
        changed = False
        for i in range(len(blocks) - 1, -1, -1):
            out = set()
            for s in _succs(blocks, labels, has_indirect, i):
                out |= live_in[s]
            new = set(use[i]) | (out - dfn[i])
            if new != live_in[i]:
                live_in[i] = new
                changed = True
    args = live_in[0] & (set(ARGS_G) | set(ARGS_F))
    # Report each argument at the first instruction that reads it, textually.
    first, n = {}, 0
    for blk in blocks:
        for _, op, rest in blk:
            n += 1
            for t in _srcs_dst(op, rest)[0]:
                if t in args and t not in first:
                    first[t] = n
    return sorted(((r, first.get(r, 0)) for r in args), key=lambda x: (x[1], x[0]))


def arity(module, label, tree=None, limit=None):
    """-> [(register, first-read index), ...], or None if there is no .s.

    Uses CFG liveness by default.  `limit` forces the OLD straight-line scan
    over the first `limit` instructions and is kept only so the run-27
    behaviour can be reproduced for comparison; it under-reports.
    """
    stem = STEMS.get(module, module)
    root = tree or REPO
    p = os.path.join(root, 'asm', 'nonmatchings', stem, label + '.s')
    if not os.path.exists(p):
        return None
    if limit is not None:
        return arity_detail(_insns(p, limit))
    with open(p) as fh:
        return arity_cfg(fh.readlines())


# --- call sites vs declarations ------------------------------------------
# `lbl_X(` matches a forward declaration, a definition and a comment exactly as
# well as it matches a call.  Every split REL owner declares every label, so the
# naive scan returned the same ~250 rows for every file in the module.

# Words that may legitimately precede a CALL.  Anything else word-like before
# `lbl_X(` means a declaration or a definition (`void lbl_X(`, `static s32
# lbl_X(`), and `*` means a pointer return type.
_EXPR_WORDS = {'return', 'else', 'do', 'case', 'goto', 'sizeof'}


def strip_comments(txt):
    """Remove /* */ and // comments and string/char literals, keeping length."""
    out, i, n = [], 0, len(txt)
    while i < n:
        c = txt[i]
        if c == '/' and i + 1 < n and txt[i + 1] == '*':
            j = txt.find('*/', i + 2)
            j = n if j < 0 else j + 2
            out.append(' ' * (j - i))
            i = j
        elif c == '/' and i + 1 < n and txt[i + 1] == '/':
            j = txt.find('\n', i)
            j = n if j < 0 else j
            out.append(' ' * (j - i))
            i = j
        elif c in '"\'':
            j = i + 1
            while j < n and txt[j] != c:
                j += 2 if txt[j] == '\\' else 1
            j = min(j + 1, n)
            out.append(' ' * (j - i))
            i = j
        else:
            out.append(c)
            i += 1
    return ''.join(out)


def _prev_token(txt, pos):
    """The non-whitespace token immediately before `pos`: a word, or one char."""
    j = pos - 1
    while j >= 0 and txt[j].isspace():
        j -= 1
    if j < 0:
        return ''
    if txt[j].isalnum() or txt[j] == '_':
        k = j
        while k >= 0 and (txt[k].isalnum() or txt[k] == '_'):
            k -= 1
        return txt[k + 1:j + 1]
    return txt[j]


def call_sites(txt):
    """-> (called labels sorted, declared-or-defined labels sorted).

    Comments and literals are stripped first, so a label named only in a comment
    counts as neither.
    """
    src = strip_comments(txt)
    called, declared = set(), set()
    for m in re.finditer(r'\b(lbl_[0-9A-Fa-f]{8})\s*\(', src):
        prev = _prev_token(src, m.start())
        is_decl = prev == '*' or (
            (prev[:1].isalpha() or prev[:1] == '_') and prev not in _EXPR_WORDS)
        (declared if is_decl else called).add(m.group(1))
    return sorted(called), sorted(declared)


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

    # --- gates for the two run-28 defects.  The seven cases above ALL PASSED
    # --- while both defects were live; neither mode was reachable from them.

    # DEFECT 2: an argument first read past the old fixed 40-insn window.  This
    # is mini_fight's lbl_00016CC8 in miniature -- r3 untouched for 45
    # instructions, then stored through.  The old default returned [].
    late_src = ['nop'] * 44 + ['stb r0,0(r3)', 'blr']
    run('arg first read at insn 45', late_src, ['r3'])
    late = [(l.split()[0], ' '.join(l.split()[1:])) for l in late_src]
    got = arity_detail(late)
    if got != [('r3', 45)]:
        ok = False
        print('SELFTEST FAIL %-28s got %s want %s'
              % ('late arg carries its index', got, [('r3', 45)]))
    else:
        print('SELFTEST ok   %-28s %s' % ('late arg carries its index', got))

    # DEFECT 1: --calls must separate calls from declarations and comments.
    sample = '''
        void lbl_00001111(int);            /* forward declaration */
        static s32 *lbl_00002222(void);    /* declaration, pointer return */
        // lbl_00003333(x) named only in a comment
        /* lbl_00004444(y) in a block comment */
        void lbl_00005555(void) {          /* a DEFINITION of this label */
            lbl_00001111(3);               /* a real call */
            return lbl_00006666(1);        /* a real call after `return` */
        }
        const char *s = "lbl_00007777(z)"; /* inside a string literal */
    '''
    called, declared = call_sites(sample)
    want_c = ['lbl_00001111', 'lbl_00006666']
    want_d = ['lbl_00001111', 'lbl_00002222', 'lbl_00005555']
    for name, got_, want_ in (('--calls finds only calls', called, want_c),
                              ('--calls marks declarations', declared, want_d)):
        if got_ != want_:
            ok = False
            print('SELFTEST FAIL %-28s got %s want %s' % (name, got_, want_))
        else:
            print('SELFTEST ok   %-28s %s' % (name, got_))

    # DEFECT 3, the one that actually mattered: PATH-INSENSITIVITY.  This is
    # mini_fight's lbl_00016CC8 reduced to nine instructions -- the entry block
    # branches PAST the `lis r3` to a block that stores through r3, so r3 is a
    # real argument on that path.  Any linear scan, at ANY window size, says 0.
    def cfg(name, lines, want):
        nonlocal ok
        got_ = [r for r, _ in arity_cfg(lines)]
        if got_ != want:
            ok = False
            print('SELFTEST FAIL %-28s got %s want %s' % (name, got_, want))
        else:
            print('SELFTEST ok   %-28s %s' % (name, got_ or '(none)'))

    def I(text):
        return '/* 00000000 00000000 */ ' + text + '\n'

    # r4 is an argument too -- `cmpwi r4,0` reads it before any write -- and the
    # linear scan below finds ONLY r4.  r3 is the one that needs the CFG.
    cfg('read on a branch not taken',
        [I('cmpwi r4, 0'), I('beq skip'), I('lis r3, foo@ha'),
         I('stw r3, 0(r4)'), 'skip:\n', I('stb r0, 0(r3)'), I('blr')],
        ['r4', 'r3'])
    # ...and the linear scan must still say 0 on the same input, which is what
    # makes this gate meaningful rather than vacuous.
    lin = arity_from_text([('cmpwi', 'r4, 0'), ('beq', 'skip'),
                           ('lis', 'r3, foo@ha'), ('stw', 'r3, 0(r4)'),
                           ('stb', 'r0, 0(r3)'), ('blr', '')])
    if lin != ['r4']:
        ok = False
        print('SELFTEST FAIL %-28s linear got %s want [r4]'
              % ('linear scan still blind', lin))
    else:
        print('SELFTEST ok   %-28s linear says %s, CFG says r3+r4'
              % ('linear scan still blind', lin))

    # A `bl` destroys the volatiles, so a read AFTER a call is not an argument.
    # Without CALL_CLOBBER this invents one.
    cfg('call clobbers volatiles',
        [I('bl something'), I('stb r0, 0(r3)'), I('blr')], [])
    # A register written on EVERY path before its read is not an argument.
    cfg('write dominates read', [I('li r3, 0'), I('stb r0, 0(r3)'), I('blr')], [])

    # The exact shape that made the old scan useless: an owner that declares
    # every label in the module and calls none of them must yield NO rows.
    only_decls = '\n'.join('void lbl_%08X(void);' % n for n in range(0x100))
    c2, d2 = call_sites(only_decls)
    if c2 or len(d2) != 0x100:
        ok = False
        print('SELFTEST FAIL %-28s %d called / %d declared'
              % ('declare-only owner is empty', len(c2), len(d2)))
    else:
        print('SELFTEST ok   %-28s 0 called / 256 declared'
              % 'declare-only owner is empty')

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

    tree = limit = None
    show_decls = False
    keep = []
    i = 0
    while i < len(rest):
        if rest[i] == '--tree' and i + 1 < len(rest):
            tree = rest[i + 1]
            i += 2
        elif rest[i] == '--limit' and i + 1 < len(rest):
            limit = int(rest[i + 1])
            i += 2
        elif rest[i] == '--decls':
            show_decls = True
            i += 1
        else:
            keep.append(rest[i])
            i += 1
    rest = keep

    if rest and rest[0] == '--calls':
        src = rest[1]
        if not os.path.isabs(src):
            src = os.path.join(tree or REPO, src)
        with open(src, newline='') as fh:
            txt = fh.read()
        labels, declared = call_sites(txt)
        print('%s: %d called, %d declared-only (skipped)'
              % (os.path.basename(src), len(labels),
                 len([d for d in declared if d not in labels])))
        if show_decls:
            for d in declared:
                if d not in labels:
                    print('  decl-only  %s' % d)
        if not labels:
            print('no lbl_ CALL sites in %s'
                  ' -- declarations and comments do not count' % src)
            return 0
    else:
        labels = rest

    for lab in labels:
        a = arity(module, lab, tree=tree, limit=limit)
        if a is None:
            print('%-16s  (no .s -- already converted, or not in this module)'
                  % lab)
            continue
        shown = ' '.join('%s@%d%s' % (r, i, '*' if i > ENTRY_WINDOW else '')
                         for r, i in a)
        late = [r for r, i in a if i > ENTRY_WINDOW]
        print('%-16s  reads-before-write: %-40s => %d arg(s)%s'
              % (lab, shown or '(none)', len(a),
                 '   * = first read past insn %d, path-insensitive:'
                 ' READ THE .s' % ENTRY_WINDOW if late else ''))
    return 0


if __name__ == '__main__':
    sys.exit(main())
