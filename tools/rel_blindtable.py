#!/usr/bin/env python3
"""The plain/F/G/GF table section 12 has demanded for FOUR RUNS, in one command.

Every module hand-rolls this loop.  Run 28 alone produced four independent
side-by-side differs and six installers because nobody checked the harvest, and
mini_billiards' `blind.py`, mini_pilot's `blind28.py`, mini_fight's
`blinds28.py` and sel_ngc's `look28.py` are all the same seven subprocess calls
around `tools/rel_ablind.py` with different hard-coded trees.

WHAT IT DELIBERATELY DOES NOT DO: install a draft, build, or restore anything.
Every silent-revert defect this project has had lives in an installer that
seeded its "pristine" copy from the owner's CURRENT bytes -- mini_pilot lost the
same banked conversion twice in run 23, sel_ngc scored six variants against a
poisoned baseline.  Installation is module-specific and hazardous; the TABLE is
neither.  Build and install with your own installer, then run this.

usage:
  cd C:/tmp/smbm/<mod>
  python tools/rel_blindtable.py <label> [label ...]

  --module M     passed through to rel_ablind (else inferred from the tree name)
  --blinds LIST  comma-separated, default `,f,g,gf,F,G,GF`; an empty entry is
                 the unblinded run.  `--blinds ,G,GF` is the section-12 minimum.
  --no-pos       skip the positional row (it costs one extra rel_ablind run)
  --selftest     parser self-test, no tree needed

THERE IS NO --tree, for the same reason rel_ablind has none: until run 19 both
`--tree X` and a late `--module X` were silently consumed as LABELS, so the tool
scored nothing and said so quietly.  Run it FROM the module tree.

EXIT CODES ARE A CONTRACT (run 21: `rel_findconv` changed its exit code
mid-run and could have silently broken an agent's scratch script):
  0  every requested row parsed for every label
  2  at least one row was UNPARSED, or a label was NOT IN MAP, or the .plf is
     missing.  The raw text is always printed -- a row this tool cannot read is
     printed verbatim, never dropped.

READ THE TABLE THE WAY SECTION 12 MEANS IT:
  * `G`/`GF` 0 in 0 means the residual is PURE REGISTER NUMBERING -- an
    allocator tie-break, not a source-shape problem.  Do not start a SPELLING
    sweep on it.  sel_ngc's `10214` went 5 in 4 -> 0 in 0 on ONE pragma and the
    brief's "that half is structural" was simply false.
    ** BUT DO NOT READ THAT AS "WALK AWAY". **  The LOCAL SET is not a
    spelling: how many temps the source DECLARES decides what the allocator
    has to place.  Run 30's largest conversion (mini_golf, 337 insn) came from
    declaring two more `f64` temps on a function whose GF row said tie-break --
    golden lands three products in f3/f2/f1 and one reused temp pins all three.
    This tool's own advice line would have told it to walk away.
  * plain far worse than positional means a LENGTH or INSERTION problem.  Run
    `tools/rel_sdiff.py`; it says "WRONG LENGTH, this is not a near-miss" out
    loud.
  * on a CALL-HEAVY function do not quote a blind at all -- quote the
    positional row.  rel_ablind's accuracy falls with relocation density
    (mini_golf: 38 in 30 against a true 3 in 3 on a body with 15 `bl`s).
"""
import os
import re
import subprocess
import sys

# rel_ablind prints:  '%-16s blind=%-5s %3d in %-3d span %d-%d of %d'
# with blind='(none)' when PCMP_REGBLIND is unset or empty.
ROW = re.compile(
    r'^(\S+)\s+blind=(\S+)\s+(\d+) in (\d+)\s+span (\d+)-(\d+) of (\d+)\s*$')
POS = re.compile(
    r'^\s*positional:\s+(\d+) of (\d+) words byte-identical \((\d+) differ\)')
NOTINMAP = re.compile(r'^(\S+)\s+NOT IN MAP\s*$')
DEFAULT_BLINDS = ['', 'f', 'g', 'gf', 'F', 'G', 'GF']


def still_asm(labels):
    """-> {label: 'src/<owner>.c'} for every label the TREE says is STILL ASM.

    RUN 40 -- THIS TOOL SILENTLY SCORED THE STUB.  With no body installed,
    `rel_ablind` disassembles the `asm` stub and compares it against the very
    `.s` the stub `#include`s, so EVERY blind reads `0 in 0` and the positional
    row reads `N of N words byte-identical`.  Both are true and both are
    vacuous.  The caveat for it existed, but it printed BELOW the table --
    after a reader had already seen a column of zeroes.

    The authority is the tree, not the score: a label is still asm iff some
    `src/*.c` carries `#include "../asm/nonmatchings/<stem>/<label>.s"`.  The
    stem is deliberately not required -- this must work without --module.
    """
    import glob as _glob
    import re as _re
    want = set(labels)
    out = {}
    pat = _re.compile(r'#include\s+"\.\./asm/nonmatchings/[^/"]+/(\w+)\.s"')
    for p in sorted(_glob.glob(os.path.join('src', '*.c'))):
        try:
            fh = open(p, encoding='utf-8', errors='replace')
        except OSError:
            continue
        with fh:
            for line in fh:
                m = pat.search(line)
                if m and m.group(1) in want:
                    out[m.group(1)] = p.replace(os.sep, '/')
    return out


def die(msg):
    """Exit 2, never 1 -- this tool's docstring has always said 0 / 2.

    `sys.exit("message")` returns 1, so until run 32 a mistyped flag was
    indistinguishable from the documented "a row was UNPARSED" answer.  Found
    by corpus B while gating rel_tuprobe; rel_ablind carried the identical
    defect and is fixed the same way.
    """
    print(msg, file=sys.stderr)
    raise SystemExit(2)


def parse_rows(text):
    """-> (rows, notinmap, pos) where rows is [(label, blind, n, regions,
    lo, hi, total)].  Anything else is the caller's to print RAW."""
    rows, missing, pos = [], [], None
    for line in text.splitlines():
        m = ROW.match(line.rstrip())
        if m:
            rows.append((m.group(1), m.group(2), int(m.group(3)),
                         int(m.group(4)), int(m.group(5)), int(m.group(6)),
                         int(m.group(7))))
            continue
        m = NOTINMAP.match(line.rstrip())
        if m:
            missing.append(m.group(1))
            continue
        m = POS.match(line)
        if m:
            pos = (int(m.group(1)), int(m.group(2)), int(m.group(3)))
    return rows, missing, pos


def ablind(labels, blind, module, extra_env=None):
    env = dict(os.environ)
    env['PCMP_REGBLIND'] = blind
    env.pop('ABLIND_SHOW', None)
    env.pop('ABLIND_POS', None)
    if extra_env:
        env.update(extra_env)
    cmd = [sys.executable, os.path.join('tools', 'rel_ablind.py')]
    if module:
        cmd += ['--module', module]
    cmd += list(labels)
    r = subprocess.run(cmd, capture_output=True, text=True, env=env)
    return (r.stdout or '') + (r.stderr or '')


def selftest():
    good = ('lbl_00017A00     blind=(none)  38 in 26  span 12-370 of 386\n'
            'lbl_00017A00     blind=GF       0 in 0   span 0-0 of 386\n')
    rows, missing, pos = parse_rows(good)
    assert len(rows) == 2 and not missing and pos is None, (rows, missing, pos)
    assert rows[0] == ('lbl_00017A00', '(none)', 38, 26, 12, 370, 386), rows[0]
    assert rows[1][2:4] == (0, 0), rows[1]

    rows, missing, _ = parse_rows('lbl_0000E99C     NOT IN MAP\n')
    assert not rows and missing == ['lbl_0000E99C'], (rows, missing)

    _, _, pos = parse_rows(
        '   positional: 348 of 351 words byte-identical (3 differ)\n')
    assert pos == (348, 351, 3), pos

    # A row that is subtly WRONG must NOT parse -- a gate that accepts damaged
    # input is the run-28 `rel_fnhash --compare` defect (it took a file with no
    # hash lines and printed `0/118 identical, 118 gone`).
    for bad in ('lbl_1 blind=G 3 in 2 span 0-4\n',            # no `of N`
                'lbl_1 blind=G 3 in span 0-4 of 9\n',         # no regions
                'lbl_1 blind=G three in 2 span 0-4 of 9\n',   # not a number
                'lbl_1 blind=G 3 in 2 span 0-4 of 9 extra\n'):  # trailing junk
        r, m, p = parse_rows(bad)
        assert not r and not m, (bad, r, m)

    # ...and the self-test must not go vacuous: the good line still parses
    # after all four rejections.
    rows, _, _ = parse_rows(good)
    assert len(rows) == 2

    # A real rel_ablind run interleaves a positional block with the row.
    mixed = ('lbl_000011CC     blind=(none)   2 in 2   span 100-102 of 219\n'
             '   positional: 217 of 219 words byte-identical (2 differ)\n'
             '     100  add r3,r4,r5                           | add r3,r4,r6\n')
    rows, missing, pos = parse_rows(mixed)
    assert len(rows) == 1 and pos == (217, 219, 2), (rows, pos)

    # An empty input is not a pass.
    assert parse_rows('') == ([], [], None)
    print('rel_blindtable selftest: 8 cases OK')


def main():
    argv = sys.argv[1:]
    if '--selftest' in argv:
        selftest()
        return 0
    module, blinds, want_pos, labels = None, list(DEFAULT_BLINDS), True, []
    i = 0
    while i < len(argv):
        a = argv[i]
        if a == '--module':
            if i + 1 >= len(argv):
                die('--module needs a value')
            module = argv[i + 1]
            i += 2
        elif a == '--blinds':
            if i + 1 >= len(argv):
                die('--blinds needs a value')
            blinds = []
            for b in argv[i + 1].split(','):
                if b not in blinds:       # `--blinds ,` is one plain run, not
                    blinds.append(b)      # two; a repeat costs a subprocess and
            i += 2                        # prints every NOT IN MAP twice.
        elif a == '--no-pos':
            want_pos = False
            i += 1
        elif a == '--tree' or a.startswith('--tree='):
            die('rel_blindtable: there is no --tree, exactly as in\n'
                     'rel_ablind.  Run it FROM the module tree:\n'
                     '  cd C:/tmp/smbm/<mod> && python tools/rel_blindtable.py '
                     '<label>')
        elif a.startswith('-'):
            die('rel_blindtable: unknown option %r.  Labels do not start '
                     'with "-".' % a)
        else:
            labels.append(a)
            i += 1
    if not labels:
        die(__doc__.strip().splitlines()[0] + '\n\nusage: cd <module tree>'
                 ' && python tools/rel_blindtable.py <label> [label ...]')

    bad = 0
    # RUN 40 -- THE CAVEAT GOES FIRST, NOT LAST.  See still_asm().
    stubs = still_asm(labels)
    if stubs:
        print('!! %d OF %d REQUESTED LABEL(S) ARE STILL ASM IN THIS TREE.'
              % (len(stubs), len(labels)))
        for lb in labels:
            if lb in stubs:
                print('     %-16s asm stub in %s' % (lb, stubs[lb]))
        print('   NOTHING IS INSTALLED FOR THEM, so rel_ablind will compare the')
        print('   stub against the very .s the stub #includes.  EVERY blind row')
        print('   below will read `0 in 0` and the positional row `N of N`, and')
        print('   BOTH ARE VACUOUS -- they measure the .s against itself, not a')
        print('   draft against golden.  Install a body first, then re-run.')
        print('   (This is the canary use of the tool: on an unmodified tree it')
        print('   is the EXPECTED result, and anything else means the tree is')
        print('   not golden.)')
        print()
    table = {}      # label -> {blind: row}
    order = []
    for bl in blinds:
        out = ablind(labels, bl, module)
        rows, missing, _ = parse_rows(out)
        if not rows and not missing:
            print('blind=%-5s UNPARSED.  RAW rel_ablind output follows:'
                  % (bl or 'plain'))
            for line in out.strip().splitlines():
                print('  | ' + line)
            bad = 2
            continue
        for lbl in missing:
            print('%-16s NOT IN MAP (blind=%s)' % (lbl, bl or 'plain'))
            bad = 2
        for row in rows:
            table.setdefault(row[0], {})[bl] = row
            if row[0] not in order:
                order.append(row[0])

    pos = {}
    if want_pos:
        out = ablind(labels, '', module, {'ABLIND_POS': '1'})
        for chunk in re.split(r'(?=^\S+\s+blind=)', out, flags=re.M):
            rows, _, p = parse_rows(chunk)
            if rows and p:
                pos[rows[0][0]] = p

    for lbl in order:
        n = next(iter(table[lbl].values()))[6]
        print('%s   n=%d instructions' % (lbl, n))
        print('  %-6s %8s %8s   %s' % ('blind', 'aligned', 'regions', 'span'))
        for bl in blinds:
            row = table[lbl].get(bl)
            if row is None:
                print('  %-6s %8s %8s   --   UNPARSED, see RAW above'
                      % (bl or 'plain', '?', '?'))
                bad = 2
                continue
            print('  %-6s %8d %8d   %d-%d'
                  % (bl or 'plain', row[2], row[3], row[4], row[5]))
        if lbl in pos:
            same, tot, diff = pos[lbl]
            print('  positional: %d of %d words byte-identical (%d differ)'
                  % (same, tot, diff))
            plain = table[lbl].get('')
            if plain and plain[2] and (tot - same) > 3 * plain[2]:
                print('  ^ positional is far worse than aligned: suspect a '
                      'LENGTH or INSERTION problem.  Run tools/rel_sdiff.py.')
        plain = table[lbl].get('')
        gf = table[lbl].get('GF')
        if plain and plain[2] == 0 and plain[3] == 0:
            print('  ^ MATCH: byte-identical against the .s under NO blind.  '
                  'On a still-asm label in an unmodified tree this is the\n'
                  '    expected result and this tool is being used as a '
                  'canary; anything else means the tree is not golden.')
        elif gf and gf[2] == 0:
            print('  ^ GF 0 in 0 while plain is not: the residual is PURE '
                  'REGISTER NUMBERING (an allocator tie-break).\n'
                  '    A SPELLING sweep will not reach it -- but the LOCAL '
                  'SET can.  How many temps\n'
                  '    the source DECLARES decides what the allocator has to '
                  'place, and that is not\n'
                  '    a spelling.  mini_golf banked 337 in run 30 by adding '
                  'two f64 temps to a\n'
                  '    function whose GF row said tie-break; this line used to '
                  'say "walk away".')
    return bad


sys.exit(main())
