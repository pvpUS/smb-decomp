#!/usr/bin/env python3
"""Census the mwcc prologue WINDOW over every function in a GOLDEN linked object.

Promoted from `_scratch_mini_pilot/run36/gapcensus.py` -- nominated for
promotion in three consecutive runs (`_harvest_run39/NOMINATED__mini_pilot_
run36__gapcensus.py`).

Window definition (mwcc 1.1 non-leaf frame setup):
    mflr r0
    <gap1>            instructions between `mflr r0` and `stw r0,4(r1)`
    stw  r0, 4(r1)
    <gap2>            instructions between `stw r0,4(r1)` and `stwu r1,-N(r1)`
    stwu r1, -N(r1)

Reports, per function: len(gap1), len(gap2), how many `lis` in each, and whether
the `lis`es in the whole window target DISTINCT scratch registers (PARALLEL) or
reuse one (SERIAL).

WHAT CHANGED ON PROMOTION -- THE `--label` FILTER (brief item 6)
---------------------------------------------------------------
The run-36 script printed a PER-FUNCTION row in exactly one place: the trailing
"functions whose gap1 has NO lis" list.  Every other function existed only
inside an aggregate count, so **two named functions could not be asked for** --
if your row had one `lis` in gap1 it was in the `gap1 contains EXACTLY ONE lis`
tally and nowhere else, and the only way to see its numbers was to edit the
script.  `--label` prints the full row for any function by name, whichever
bucket it lands in.

⚠ AND IT DISTINGUISHES THE TWO WAYS A NAME CAN FAIL.  `NOT IN THE OBJECT` is an
ERROR (rc=2); `present but with no full mflr/stw/stwu window` is a RESULT
(rc=0).  Collapsing them would make a typo read as a finding.

The aggregate output is BYTE-IDENTICAL to the run-36 script's -- gated -- so
every figure already quoted from it still holds.

usage:
  python tools/rel_gapcensus.py <object> [--label L [--label L ...]]

    <object>       any ELF objdump reads: a module `.plf`, `.o` files, or
                   `supermonkeyball.elf`
    --label L      print this function's row (repeatable; also accepts a
                   comma-separated list).  Suppresses the aggregate unless
                   --all is also given.
    --all          print the aggregate census as well as any --label rows
    --no-lis-list  suppress the trailing "gap1 has NO lis" list
    --selftest     parser self-test, no object needed

EXIT CODES:  0 ran   2 bad arguments, objdump failed, or a --label was NOT FOUND
"""
import collections
import os
import re
import subprocess
import sys

OBJDUMP = os.environ.get(
    "GAPCENSUS_OBJDUMP",
    r"C:/devkitPro/devkitPPC/bin/powerpc-eabi-objdump.exe")

MFLR = re.compile(r'^mflr\s+r0$')
STW4 = re.compile(r'^stw\s+r0,4\(r1\)$')
STWU = re.compile(r'^stwu\s+r1,-\d+\(r1\)$')
LIS = re.compile(r'^lis\s+r(\d+),')
FUNC = re.compile(r'^([0-9a-f]{8}) <([^>]+)>:')
BODY = re.compile(r'^\s+([0-9a-f]+):\t(?:[0-9a-f]{2} ){4}\t(.*)$')


def die(msg):
    print(msg, file=sys.stderr)
    raise SystemExit(2)


def disassemble(path):
    r = subprocess.run([OBJDUMP, '-d', path], capture_output=True, text=True)
    if r.returncode != 0 and not r.stdout:
        die('objdump failed on %s:\n%s' % (path, r.stderr.strip()))
    funcs, cur = collections.OrderedDict(), None
    for ln in r.stdout.splitlines():
        m = FUNC.match(ln)
        if m:
            cur = m.group(2)
            funcs[cur] = []
            continue
        if cur is None:
            continue
        m = BODY.match(ln)
        if m:
            funcs[cur].append(m.group(2).strip())
    return funcs


def row(name, ins):
    """-> (name, n_gap1, n_gap2, lis_g1, lis_g2, shape) or None.

    The run-36 rule is kept exactly: `mflr r0` first, `stw r0,4(r1)` within the
    first 12, `stwu r1,-N(r1)` within the first 16, and `0 < i_stw < i_stwu`.
    """
    if len(ins) < 4 or not MFLR.match(ins[0]):
        return None
    try:
        i_stw = next(i for i, s in enumerate(ins[:12]) if STW4.match(s))
        i_stwu = next(i for i, s in enumerate(ins[:16]) if STWU.match(s))
    except StopIteration:
        return None
    if not (0 < i_stw < i_stwu):
        return None
    gap1 = ins[1:i_stw]
    gap2 = ins[i_stw + 1:i_stwu]
    l1 = [LIS.match(s).group(1) for s in gap1 if LIS.match(s)]
    l2 = [LIS.match(s).group(1) for s in gap2 if LIS.match(s)]
    regs = l1 + l2
    return (name, len(gap1), len(gap2), len(l1), len(l2),
            'PARALLEL' if len(set(regs)) > 1 else
            ('SERIAL' if regs else 'NONE'))


def selftest():
    def f(*lines):
        return list(lines)
    # a PARALLEL window: two lis, distinct registers, one in each gap
    r = row('a', f('mflr r0', 'lis r3,0', 'stw r0,4(r1)', 'lis r4,0',
                   'stwu r1,-32(r1)', 'blr'))
    assert r == ('a', 1, 1, 1, 1, 'PARALLEL'), r
    # SERIAL: both lis target the same register
    r = row('b', f('mflr r0', 'lis r3,0', 'stw r0,4(r1)', 'lis r3,0',
                   'stwu r1,-32(r1)', 'blr'))
    assert r == ('b', 1, 1, 1, 1, 'SERIAL'), r
    # NONE: a full window with no lis at all
    r = row('c', f('mflr r0', 'nop', 'stw r0,4(r1)', 'stwu r1,-32(r1)', 'blr'))
    assert r == ('c', 1, 0, 0, 0, 'NONE'), r
    # gap1 EMPTY is a LEGAL window and must not be confused with "no window".
    # (The run-36 rule is `0 < i_stw < i_stwu`; with `stw r0,4(r1)` immediately
    # after `mflr r0`, i_stw == 1, so the row EXISTS with n_gap1 == 0.  An
    # earlier draft of this selftest asserted None here and was simply wrong --
    # the aggregate has always had a `gap1 EMPTY` bucket, which could not be
    # non-zero if such rows were dropped.)
    r = row('d', f('mflr r0', 'stw r0,4(r1)', 'stwu r1,-32(r1)', 'blr'))
    assert r == ('d', 0, 0, 0, 0, 'NONE'), r
    # things that are NOT a window
    assert row('e', f('li r3,0', 'blr')) is None
    assert row('f', f('mflr r0', 'stw r0,4(r1)')) is None          # too short
    assert row('g', f('mflr r0', 'nop', 'stw r0,4(r1)', 'blr', 'nop')) is None
    # the objdump line parsers
    assert FUNC.match('8005f520 <lbl_8005F520>:').group(2) == 'lbl_8005F520'
    m = BODY.match('    8005f520:\t7c 08 02 a6 \tmflr    r0')
    assert m and m.group(2).strip() == 'mflr    r0', m
    assert not BODY.match('8005f520 <lbl_8005F520>:')
    # ...and the regexes must not accept a near-miss
    assert not STW4.match('stw r0,8(r1)')
    assert not STWU.match('stwu r1,32(r1)')
    assert LIS.match('lis r31,0').group(1) == '31'
    # vacuity: the good case still parses after all the rejections
    assert row('h', f('mflr r0', 'lis r3,0', 'stw r0,4(r1)',
                      'stwu r1,-32(r1)', 'blr'))[5] == 'SERIAL'
    print('rel_gapcensus selftest: 5 groups OK')


def main():
    argv = sys.argv[1:]
    if '--selftest' in argv:
        selftest()
        return 0
    labels, paths = [], []
    show_all = False
    no_lis_list = False
    i = 0
    while i < len(argv):
        a = argv[i]
        if a == '--label':
            if i + 1 >= len(argv):
                die('--label needs a value')
            labels += [x for x in argv[i + 1].split(',') if x]
            i += 2
        elif a.startswith('--label='):
            labels += [x for x in a.split('=', 1)[1].split(',') if x]
            i += 1
        elif a == '--all':
            show_all = True
            i += 1
        elif a == '--no-lis-list':
            no_lis_list = True
            i += 1
        elif a.startswith('-'):
            die('rel_gapcensus: unknown option %r' % a)
        else:
            paths.append(a)
            i += 1
    if not paths:
        die(__doc__.strip().splitlines()[0] + '\n\nusage: python '
            'tools/rel_gapcensus.py <object> [--label L ...]')
    missing = [p for p in paths if not os.path.exists(p)]
    if missing:
        die('no such object: %s' % ', '.join(missing))

    rows, byname, allnames = [], {}, set()
    for p in paths:
        for name, ins in disassemble(p).items():
            allnames.add(name)
            r = row(name, ins)
            if r:
                rows.append(r)
                byname[name] = r

    rc = 0
    if labels:
        print('=== --label rows ===')
        print('%-38s %5s %5s %7s %7s  %s'
              % ('function', 'gap1', 'gap2', 'lis(g1)', 'lis(g2)', 'shape'))
        for lb in labels:
            if lb in byname:
                r = byname[lb]
                print('%-38s %5d %5d %7d %7d  %s'
                      % (r[0], r[1], r[2], r[3], r[4], r[5]))
            elif lb in allnames:
                print('%-38s NO FULL mflr/stw r0,4(r1)/stwu WINDOW '
                      '(leaf, or a different frame form)' % lb)
            else:
                print('%-38s ** NOT IN THE OBJECT **' % lb, file=sys.stderr)
                rc = 2
        print()
        if not show_all:
            return rc

    print('functions with a full mflr/stw/stwu frame setup: %d' % len(rows))
    print('gap1 EMPTY (no instruction at all)      : %d'
          % sum(1 for r in rows if r[1] == 0))
    print('gap1 contains ZERO `lis`                : %d'
          % sum(1 for r in rows if r[3] == 0))
    print('gap1 contains EXACTLY ONE `lis`         : %d'
          % sum(1 for r in rows if r[3] == 1))
    print('gap1 contains TWO OR MORE `lis`         : %d'
          % sum(1 for r in rows if r[3] >= 2))
    print()
    print('gap2 EMPTY                              : %d'
          % sum(1 for r in rows if r[2] == 0))
    print('gap2 contains >=1 `lis`                 : %d'
          % sum(1 for r in rows if r[4] >= 1))
    print()
    for k, v in collections.Counter(r[5] for r in rows).most_common():
        print('window scratch shape %-9s : %d' % (k, v))
    print()
    print('gap1 lis-count distribution: %s'
          % dict(collections.Counter(r[3] for r in rows)))
    print('gap2 lis-count distribution: %s'
          % dict(collections.Counter(r[4] for r in rows)))
    if not no_lis_list:
        print()
        print('functions whose gap1 has NO lis (the shape `scheduling off` '
              'produces):')
        for r in rows:
            if r[3] == 0:
                print('   %-24s gap1=%d gap2=%d lis(g1)=%d lis(g2)=%d %s' % r)
    return rc


if __name__ == '__main__':
    sys.exit(main())
