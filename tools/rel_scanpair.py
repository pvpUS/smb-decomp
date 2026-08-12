#!/usr/bin/env python3
"""ZERO-BUILD oracle: does mwcc coalesce `<A> rX,...` into `<B> rY,...,rX,...`?

Ask the IMAGE, not the brief.  When the golden code emits `<A>` writing rX and
then `<B>` reading rX within a window, how often is rX also `<B>`'s destination
(the producer's register REUSED IN PLACE) and how often does `<B>` write a
DIFFERENT register (a SPLIT)?  Report both populations with the enclosing
symbol -- and mark which symbols are STILL-ASM, because **only the matched-C
ones are evidence about what source can reach.**

Promoted from run 29's `mini_pilot__scanpair.py`, which produced the two-word
`lbl_00003BDC` proof that overturned a §8 retirement that had stood for four
runs.  The run-25 harvest README asked for this generalisation after the third
one-off shape scanner; run 29 was the fourth.

  cd C:/tmp/smbm/<mod>
  python tools/rel_scanpair.py <mnemA> <mnemB> [options]

  --module M      warm-dir name or asm stem (else inferred from the tree name)
  --artifact P    scan P instead of the module's own .plf
  --dol           scan supermonkeyball.elf -- the WHOLE DOL, ~8,900 functions,
                  all of it matched C.  The biggest matched-code population in
                  the project and it costs no build.
  --window N      how many instructions after <A> may hold <B> (default 4)
  --sample N      example lines printed per symbol (default 4, 0 for none)
  --selftest      parser/classifier self-test, no tree and no artifact needed

WHY THERE IS NO `--tree`: four separate tools in this project have defaulted
`--tree` to the wrong tree and silently scored someone else's work.  Run this
FROM the module tree, exactly as `rel_ablind` and `rel_blindtable` require.

EXIT CODES ARE A CONTRACT FROM BIRTH (run 21: `rel_findconv` changed its
contract mid-run and could have silently broken an agent's scratch script):
  0  the pair occurs somewhere in the artifact
  1  the pair occurs NOWHERE -- a real answer, not an error.  "No worked
     example exists" is a claim this tool can now make honestly, and run 29
     falsified one such claim (made from a mid-function classifier) with 46
     counter-examples.  A 1 here means *this window, this artifact*.
  2  ERROR: artifact missing, objdump failed, nothing decoded, unknown module.

HOW TO READ IT:
  * **SPLIT rows in MATCHED C are the source-reachable proof.**  If golden
    refuses to coalesce and every SPLIT lives in still-asm code, you have no
    evidence that any source spelling reaches the split form -- which is
    exactly what mini_pilot spent ~50 spellings discovering the hard way.
  * A pair that is 100% IN-PLACE across a large C population is a mwcc
    invariant, not a tie-break.  Stop sweeping spellings and read §6.
  * STILL-ASM symbols are printed but NEVER counted as evidence.  Getting that
    set wrong INVERTS the tool's conclusion, which is why it is derived here
    (from the `#include "../asm/nonmatchings/<stem>/<label>.s"` lines the
    census uses) instead of being typed on the command line as it was in the
    harvested original.
  * The artifact is a BUILD.  If it is older than any `src/<stem>*.c` this tool
    says so loudly: a stale .plf describes a program nobody is looking at.
  * **A RECORD FORM IS A DIFFERENT MNEMONIC.**  `extsb.` is not `extsb`, and
    asking for the wrong one is how you get a confident "no worked example
    exists" out of an artifact that has several.  When the sibling form is
    present in the artifact but was not asked for, this tool SAYS SO -- it hit
    exactly that on its own gate run (mini_pilot `lbl_00004024` sign-extends
    the same byte twice, once as `extsb.` for a zero test and once as `extsb`).
"""
import glob
import os
import re
import subprocess
import sys

MODULES = {
    'mini_bowling': 'mini_bowling', 'mini_race': 'mini_race',
    'mini_fight': 'mini_fight', 'mini_pilot': 'mini_pilot',
    'mini_golf': 'mini_golf', 'mini_billiards': 'mini_billiards',
    'sel_ngc': 'sel_ngc_rel', 'option': 'option', 'test_mode': 'test_mode',
}
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
DOL_ELF = 'supermonkeyball.elf'

OBJDUMP = os.environ.get(
    'OBJDUMP', 'C:/devkitPro/devkitPPC/bin/powerpc-eabi-objdump.exe')

SYM = re.compile(r'^[0-9a-f]+ <(.+)>:')
INSN = re.compile(r'^\s*([0-9a-f]+):\s+(?:[0-9a-f]{2} ){4}\s*(\S+)\s*(.*)$')
# A register TOKEN, never a substring: `r3` must not match inside `r31`, and
# `8(r31)` must yield r31.  A scanner that used `in` here would report a
# coalesce population that does not exist.
REG = re.compile(r'(?<![0-9A-Za-z_])([rf]\d{1,2})(?![0-9A-Za-z_])')


def die(msg):
    """Usage errors exit 2, NEVER 1.  1 is the documented "the pair occurs
    nowhere" ANSWER; a mistyped flag that exits 1 is a wrong answer wearing a
    right one's clothes, which is the run-21 `rel_findconv` failure mode."""
    print(msg, file=sys.stderr)
    raise SystemExit(2)


def regs(operand_text):
    return REG.findall(operand_text)


def decode(text):
    """objdump -d text -> [(symbol, addr, mnemonic, operands)]."""
    out, cur = [], '?'
    for ln in text.splitlines():
        m = SYM.match(ln)
        if m:
            cur = m.group(1)
            continue
        m = INSN.match(ln)
        if m:
            out.append((cur, int(m.group(1), 16), m.group(2),
                        m.group(3).strip()))
    return out


def scan(ins, mnem_a, mnem_b, window):
    """-> (split, inplace); rows are (symbol, addr_of_B, text, src_position).

    `<B>` counts as a READER of rX when rX appears in ANY operand after the
    first -- including inside a displacement like `8(r31)`.  The harvested
    original only ever looked at operand 1, which is right for `extsb rY,rX`
    and wrong for every three-operand and every memory form.
    """
    split, inplace = [], []
    for i, (fn, ad, mn, ops) in enumerate(ins):
        if mn != mnem_a:
            continue
        dst_list = regs(ops.split(',')[0])
        if not dst_list:
            continue                       # `<A>` writes no register here
        dst = dst_list[0]
        for j in range(i + 1, min(i + 1 + window, len(ins))):
            fn2, ad2, mn2, ops2 = ins[j]
            if fn2 != fn:
                break                      # never straddle a symbol boundary
            if mn2 != mnem_b:
                continue
            parts = [p.strip() for p in ops2.split(',')]
            src_pos = None
            for k, p in enumerate(parts[1:], start=1):
                if dst in regs(p):
                    src_pos = k
                    break
            if src_pos is None:
                continue                   # <B> does not read <A>'s result
            row = (fn, ad2, '%s %s / %s %s' % (mnem_a, ops, mnem_b, ops2),
                   src_pos)
            wrote = regs(parts[0])
            (inplace if wrote and wrote[0] == dst else split).append(row)
            break
    return split, inplace


def sibling_forms(ins, mnem):
    """Record-form siblings of `mnem` that are PRESENT in the artifact.

    `extsb.` is a different mnemonic from `extsb`.  Asking for one and being
    silently answered about the other is how a scan produces a confident
    "no worked example exists" -- the precise claim class this tool exists to
    kill.  So say it out loud instead.
    """
    present = {m for _, _, m, _ in ins}
    cand = mnem[:-1] if mnem.endswith('.') else mnem + '.'
    return [cand] if cand in present else []


def still_asm_labels(tree, stem):
    """{label} for rows some src/<stem>*.c still #includes.  Same derivation
    rel_census.still_asm uses; the two must agree."""
    inc = re.compile(r'#include "\.\./asm/nonmatchings/%s/([A-Za-z0-9_]+)\.s"'
                     % re.escape(stem))
    out = set()
    for p in glob.glob(os.path.join(tree, 'src', '%s*.c' % stem)):
        out.update(inc.findall(open(p, errors='ignore').read()))
    return out


def report(name, pop, asm_set, sample):
    print('\n=== %s : %d ===' % (name, len(pop)))
    by_fn = {}
    for fn, ad, txt, pos in pop:
        by_fn.setdefault(fn, []).append((ad, txt, pos))
    n_c = sum(len(v) for k, v in by_fn.items() if k not in asm_set)
    for fn in sorted(by_fn):
        tag = '  [STILL-ASM -- NOT evidence]' if fn in asm_set else '  [C]'
        print('  %-30s %3d%s' % (fn, len(by_fn[fn]), tag))
        for ad, txt, pos in by_fn[fn][:sample]:
            print('        %08x  %s   (reads at operand %d)' % (ad, txt, pos))
    return n_c


def selftest():
    text = (
        '00000100 <lbl_00003BDC>:\n'
        '     100:\t88 7e 00 04 \tlbz     r3,4(r30)\n'
        '     104:\t7c 63 07 74 \textsb   r3,r3\n'
        '00000200 <someMatchedFn>:\n'
        '     200:\t88 7e 00 04 \tlbz     r31,4(r30)\n'
        '     204:\t7c 63 07 74 \textsb   r4,r31\n'
        '00000300 <lbl_00009C18>:\n'
        '     300:\t88 7e 00 04 \tlbz     r3,4(r30)\n'
        '     304:\t7c 63 07 74 \textsb   r5,r3\n'
    )
    ins = decode(text)
    assert len(ins) == 6, ins
    assert ins[0] == ('lbl_00003BDC', 0x100, 'lbz', 'r3,4(r30)'), ins[0]

    split, inplace = scan(ins, 'lbz', 'extsb', 4)
    assert len(inplace) == 1 and inplace[0][0] == 'lbl_00003BDC', inplace
    assert len(split) == 2, split
    assert sorted(r[0] for r in split) == ['lbl_00009C18', 'someMatchedFn']
    assert all(r[3] == 1 for r in split), split

    # r3 must NOT match inside r31, and a displacement must yield its register.
    assert regs('r3,4(r30)') == ['r3', 'r30'], regs('r3,4(r30)')
    assert regs('r31,8(r3)') == ['r31', 'r3']
    assert 'r3' not in regs('r31,r30'), regs('r31,r30')

    # A reader in a LATER operand position must be found -- the harvested
    # original looked only at operand 1 and would have missed this entirely.
    three = decode('00000400 <f>:\n'
                   '     400:\t00 00 00 00 \tlwz     r5,0(r4)\n'
                   '     404:\t00 00 00 00 \tadd     r6,r7,r5\n')
    s3, i3 = scan(three, 'lwz', 'add', 4)
    assert len(s3) == 1 and s3[0][3] == 2, (s3, i3)

    # The window is exclusive of anything past it, and a symbol boundary is
    # never straddled even inside the window.
    far = decode('00000500 <f>:\n'
                 '     500:\t00 00 00 00 \tlbz     r3,0(r4)\n'
                 '     504:\t00 00 00 00 \tnop\n'
                 '     508:\t00 00 00 00 \tnop\n'
                 '     50c:\t00 00 00 00 \textsb   r5,r3\n')
    assert scan(far, 'lbz', 'extsb', 2) == ([], []), scan(far, 'lbz', 'extsb', 2)
    assert len(scan(far, 'lbz', 'extsb', 4)[0]) == 1
    cross = decode('00000600 <f>:\n'
                   '     600:\t00 00 00 00 \tlbz     r3,0(r4)\n'
                   '00000604 <g>:\n'
                   '     604:\t00 00 00 00 \textsb   r5,r3\n')
    assert scan(cross, 'lbz', 'extsb', 4) == ([], []), 'straddled a symbol'

    # Damaged objdump lines must decode to NOTHING rather than to a wrong
    # answer -- the run-28 `rel_fnhash --compare` defect was a gate that
    # accepted a file with no hash lines and reported a confident 0/118.
    for bad in ('     700:\t88 7e 00 \tlbz     r3,4(r30)\n',     # 3 bytes
                '     700  88 7e 00 04 \tlbz     r3,4(r30)\n',   # no colon
                'lbz r3,4(r30)\n'):                              # no address
        assert decode(bad) == [], bad
    # ...and the self-test must not go vacuous: the good text still decodes.
    assert len(decode(text)) == 6

    # A record form is a DIFFERENT mnemonic and must be announced when it is
    # present but unasked-for.  This fired on the tool's own gate run.
    rec = decode('00000800 <f>:\n'
                 '     800:\t00 00 00 00 \tlbz     r3,0(r4)\n'
                 '     804:\t00 00 00 00 \textsb.  r0,r3\n'
                 '     808:\t00 00 00 00 \textsb   r0,r3\n')
    assert sibling_forms(rec, 'extsb') == ['extsb.'], sibling_forms(rec, 'extsb')
    assert sibling_forms(rec, 'extsb.') == ['extsb']
    assert sibling_forms(rec, 'lbz') == []
    assert len(scan(rec, 'lbz', 'extsb', 4)[0]) == 1, 'extsb. must not count'

    # A still-asm symbol contributes rows but ZERO evidence.
    import io
    import contextlib
    with contextlib.redirect_stdout(io.StringIO()):
        n_c = report('selftest', split, {'lbl_00009C18'}, 0)
    assert n_c == 1, n_c
    print('rel_scanpair selftest: 10 cases OK')


def main():
    argv = sys.argv[1:]
    if '--selftest' in argv:
        selftest()
        return 0

    module = artifact = None
    window, sample, dol, pos = 4, 4, False, []
    i = 0
    while i < len(argv):
        a = argv[i]
        if a == '--module':
            module = argv[i + 1] if i + 1 < len(argv) else die(
                '--module needs a value')
            i += 2
        elif a == '--artifact':
            artifact = argv[i + 1] if i + 1 < len(argv) else die(
                '--artifact needs a value')
            i += 2
        elif a == '--window':
            window = int(argv[i + 1]) if i + 1 < len(argv) else die(
                '--window needs a value')
            i += 2
        elif a == '--sample':
            sample = int(argv[i + 1]) if i + 1 < len(argv) else die(
                '--sample needs a value')
            i += 2
        elif a == '--dol':
            dol = True
            i += 1
        elif a == '--tree' or a.startswith('--tree='):
            die('rel_scanpair: there is no --tree, exactly as in\n'
                     'rel_ablind and rel_blindtable.  Run it FROM the module '
                     'tree:\n  cd C:/tmp/smbm/<mod> && python '
                     'tools/rel_scanpair.py <mnemA> <mnemB>')
        elif a.startswith('-'):
            die('rel_scanpair: unknown option %r.  Mnemonics do not start '
                     'with "-".' % a)
        else:
            pos.append(a)
            i += 1

    if len(pos) != 2:
        die(__doc__.strip().splitlines()[0] + '\n\nusage: cd <module tree>'
                 ' && python tools/rel_scanpair.py <mnemA> <mnemB>\n'
                 '  --selftest  to check the scanner itself')
    mnem_a, mnem_b = pos

    tree = os.getcwd()
    if module is None:
        module = os.path.basename(os.path.abspath(tree))
    if module not in MODULES:
        inv = {v: k for k, v in MODULES.items()}
        if module in inv:
            module = inv[module]
        elif not artifact and not dol:
            die('rel_scanpair: cannot infer the module from %r.\n'
                     '  Pass --module <%s>, or --artifact <path>, or --dol.'
                     % (module, '|'.join(sorted(MODULES))))

    if artifact is None:
        artifact = DOL_ELF if dol else TARGETS.get(module, '') + '.plf'
    if not os.path.exists(artifact):
        print('rel_scanpair: no artifact at %s -- build first, or pass '
              '--artifact.' % artifact, file=sys.stderr)
        return 2

    # STALENESS.  A .plf older than a source file describes a program nobody is
    # looking at, and every figure read off it is about the previous draft.
    stem = MODULES.get(module)
    if stem and not dol:
        art_mt = os.path.getmtime(artifact)
        newer = [os.path.basename(p)
                 for p in glob.glob(os.path.join(tree, 'src', '%s*.c' % stem))
                 if os.path.getmtime(p) > art_mt]
        if newer:
            print('*** STALE: %s predates %d source file(s) -- %s%s\n'
                  '*** Every symbol classification below is about the PREVIOUS '
                  'build.  Rebuild.\n'
                  % (artifact, len(newer), ', '.join(sorted(newer)[:4]),
                     ' ...' if len(newer) > 4 else ''), file=sys.stderr)

    r = subprocess.run([OBJDUMP, '-d', artifact], capture_output=True,
                       text=True)
    ins = decode(r.stdout)
    if not ins:
        print('rel_scanpair: nothing decoded from %s.\n  objdump said: %s'
              % (artifact, (r.stderr or '(silence)').strip()[:200]),
              file=sys.stderr)
        return 2

    asm_set = still_asm_labels(tree, stem) if stem and not dol else set()
    split, inplace = scan(ins, mnem_a, mnem_b, window)

    print('%s -> %s   window %d   %s   %d instructions decoded'
          % (mnem_a, mnem_b, window, artifact, len(ins)))
    for asked, sibs in ((mnem_a, sibling_forms(ins, mnem_a)),
                        (mnem_b, sibling_forms(ins, mnem_b))):
        for s in sibs:
            print('NOTE: %r is also present in this artifact and you did not '
                  'ask for it.\n'
                  '      A record form is a DIFFERENT mnemonic. Re-run with it '
                  'before concluding anything\n'
                  '      about what does or does not exist.' % s)
    if asm_set:
        print('%d still-asm labels in this module are excluded from the '
              'evidence counts.' % len(asm_set))
    c_split = report('SPLIT  (<B> writes a DIFFERENT register)', split,
                     asm_set, sample)
    c_inplace = report('IN-PLACE (<B> writes <A>\'s register)', inplace,
                       asm_set, sample)

    print('\n--- EVIDENCE (matched C only; still-asm rows excluded)')
    print('  SPLIT     %4d' % c_split)
    print('  IN-PLACE  %4d' % c_inplace)
    if c_split + c_inplace == 0:
        print('  NO MATCHED-C OCCURRENCE of this pair. You have no evidence\n'
              '  that any source spelling reaches either form. Widen the\n'
              '  window, or scan --dol (~8,900 matched functions).')
    elif c_split == 0:
        print('  100%% IN-PLACE in matched C: this is a mwcc INVARIANT, not an\n'
              '  allocator tie-break. The split form is not source-reachable\n'
              '  here -- stop sweeping spellings for it.')
    elif c_inplace == 0:
        print('  100%% SPLIT in matched C: the coalesced form is the one\n'
              '  without a worked example. Read the SPLIT sources, not the\n'
              '  brief.')
    return 0 if (split or inplace) else 1


sys.exit(main())
