#!/usr/bin/env python3
"""rel_ascore.py -- ALIGNED diff for one or more REL functions in a built .plf.

Why this exists (run 8 found it four separate ways):

  A RAW diff count -- comparing word i of got against word i of expected -- is
  meaningless once an instruction is inserted or deleted, because the whole
  tail shifts.  A 3-instruction miss can read as 197.  Worse, `rel_sweep
  --sweep` RANKS variants by the raw count, so a large sweep can hand you the
  wrong "best" variant, or hide a byte-exact match entirely:

    mini_fight lbl_0000EA10  the MATCHING variant scored raw 116 while a
                             non-match scored 63 -- ranked 53 places worse.
                             Recovered only by re-ranking on aligned diffs.
    mini_golf  lbl_000240C0  winning variant raw 319, aligned 0.
    test_mode  lbl_0000F7BC  best variant raw 75 (bottom of every sweep),
                             aligned 5 with the correct frame.

  So: never judge a near-miss, and never rank a sweep, on a raw count.

This also supersedes the ported mini_billiards `adiff.py` AS A SCORER: that one
reads n+12 words past the function end, so it always reports ~10-14 phantom
"extra" units and under-reported two of test_mode's residuals (7 read as 5, 50
as 49).  `adiff.py` is still useful for seeing WHICH instructions differ; it
should not be used for the number.

Reading the output -- run 8's grind-vs-retire rule, and its three caveats:

  1-3 edit regions        a localised allocator/scheduler tie.  Worth grinding;
                          this is where the 16-diff -> 3-diff collapses live.
  regions ~= count        a whole-function register-allocation mismatch.
                          Retire it (mini_golf lbl_000109CC: 14 in 14).
  many regions, high count still a TRANSLATION problem -- rewrite the body
                          rather than permuting spellings.

  CAVEAT 1 (mini_fight): regions can be concentrated.  8 regions all inside the
    first 27 of 139 instructions reads "retire" but is localised.  Check SPAN.
  CAVEAT 2 (mini_fight): N regions can be ONE substitution repeated per unrolled
    iteration.  Only compare region counts across similar loop structures.
  CAVEAT 3 (mini_race): regions can be CAUSAL -- an `extsh` CSE in region 1
    decided the register assignment in regions 2 and 3, 7 and 12 instructions
    later.  Three regions, one defect.
  And the converse (mini_pilot lbl_000097C8): 3 in 3 looks like "retire", but
    all three were one `lis` displaced by 14 slots -- the most localised
    residual in that module.

  Which is why SPAN is printed alongside the count.  Judge on span and
  causality, not on the bare number.

usage:
  python tools/rel_ascore.py <module|stem> <plf> <label> [label...]

  e.g. python tools/rel_ascore.py mini_race mkbe.rel_mini_race.plf lbl_0000D8EC

Run from the repo root (or any tree -- it resolves relative to this file).
Takes the .plf, not the .rel, like rel_fdiff.
"""
import difflib
import re
import os
import sys

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# Same three-name table as rel_merge_back.py: warm dir -> (stem, target).
# Accepting either the module name or the raw stem is deliberate -- sel_ngc's
# dir, stem and target all differ, and that has cost agents time every run.
MODULES = {
    'mini_bowling':   'mini_bowling',
    'mini_race':      'mini_race',
    'mini_fight':     'mini_fight',
    'mini_pilot':     'mini_pilot',
    'mini_golf':      'mini_golf',
    'mini_billiards': 'mini_billiards',
    'sel_ngc':        'sel_ngc_rel',
    'option':         'option',
    'test_mode':      'test_mode',
}


def main():
    if len(sys.argv) < 4:
        sys.exit(__doc__.strip().split('usage:')[-1].strip())

    stem = MODULES.get(sys.argv[1], sys.argv[1])
    plf = sys.argv[2]
    labels = sys.argv[3:]

    os.environ['FDIFF_MODULE'] = stem
    os.chdir(REPO)

    # rel_fdiff is a script, not a module: strip its main() call and exec it so
    # we can reuse load_text/load_map/load_asm without duplicating them here.
    fdiff_path = os.path.join(REPO, 'tools', 'rel_fdiff.py')
    src = open(fdiff_path).read().replace('\nmain()', '')
    rf = type(sys)('rf')
    rf.__dict__['__file__'] = fdiff_path
    exec(compile(src, 'rel_fdiff', 'exec'), rf.__dict__)

    if not os.path.exists(plf):
        sys.exit('%s does not exist -- build the module first, and pass the '
                 '.plf (not the .rel)' % plf)

    # RUN 9, test_mode: a failed build leaves the PREVIOUS .plf on disk.  The
    # "still an asm stub" guard below reads the CURRENT src/ tree, so a label
    # that is C in source but asm in the stale binary sails past it and scores
    # ALIGNED 0 -- a confident, fictional MATCH.  It produced three of them in
    # one session.  This is the same stale-artefact family as rel_sweep's traps
    # 1/4, except it reaches the SCORER, so nothing downstream can catch it.
    import glob as _glob
    plf_mt = os.path.getmtime(plf)
    newer = [p for p in (_glob.glob(os.path.join(REPO, 'src', '%s*.c' % stem))
                         + _glob.glob(os.path.join(REPO, 'asm', 'nonmatchings',
                                                   stem, '*.s')))
             if os.path.getmtime(p) > plf_mt]
    if newer:
        newer.sort(key=os.path.getmtime, reverse=True)
        sys.exit(
            'REFUSING TO SCORE: %s is OLDER than %d of its own source file(s) '
            '-- the last build did not produce it.\n'
            '  newest: %s\n'
            'Scoring a stale .plf reports ALIGNED 0 for a label that is still '
            'asm in the binary (run 9, test_mode: three fictional matches).\n'
            'Rebuild, and `rm -f %s` first so a failed build cannot leave one '
            'behind.'
            % (plf, len(newer), os.path.relpath(newer[0], REPO), plf))

    text = rf.load_text(plf)
    mappath = os.path.splitext(plf)[0] + '.map'
    addrs = rf.load_map(mappath)

    # Per-symbol (address, size) out of the map, for the per-function breakdown
    # below.  Sizes matter: once one body in a row is real C its length can
    # differ from the asm's, and a fixed offset into the built image then slides
    # every LATER function's slice, reporting a good body as a total mismatch.
    sizes = {}
    for line in open(mappath, errors='ignore'):
        m = re.match(r'\s*([0-9a-f]{8}) ([0-9a-f]{6}) ([0-9a-f]{8})\s+\d+ (\S+)\s',
                     line)
        if m:
            sizes.setdefault(m.group(4), (int(m.group(1), 16),
                                          int(m.group(2), 16)))

    def entries_in(lbl, n):
        """Function ENTRY labels inside one row, as [(name, start_index)].

        The MAP is ground truth and is tried first: the linker emits an address
        and a size for every real function symbol, so it settles the boundaries
        without heuristics.  That matters -- on test_mode `lbl_000007AC` the
        "a label never branched to is an entry" rule (tools/rel_rowcount.py)
        over-splits a 22-instruction function into 18 + 4, because `lbl_000007F4`
        is reached in a way this regex cannot see.  The map says 0x58, i.e. 22,
        and the map is right.

        The heuristic is kept only as a fallback for a row whose inner labels
        are not symbols.  Do NOT swap in the cheap "label after blr" rule: it
        invents 8 phantom files and 20 phantom bodies in one file on mini_pilot,
        because an early return is followed by an ordinary branch label.
        """
        path = os.path.join(REPO, 'asm', 'nonmatchings', stem, lbl + '.s')
        if not os.path.exists(path):
            return [(lbl, 0)]
        txt = open(path, errors='replace').read()
        defined = set(re.findall(r'^(lbl_[0-9A-Fa-f]+):', txt, re.M)) | {lbl}

        if lbl in addrs:
            lo = addrs[lbl]
            hit = [(sizes[d][0], d) for d in defined
                   if d in sizes and lo <= sizes[d][0] < lo + 4 * n]
            if len(hit) > 1:
                hit.sort()
                # Start index in the EXPECTED words comes from the label name,
                # which is the original .text offset -- not from the map, whose
                # addresses describe the CURRENT build.
                try:
                    org = int(lbl[4:], 16)
                    out = [(d, (int(d[4:], 16) - org) // 4) for _, d in hit]
                    if all(0 <= s < n for _, s in out) and \
                       out == sorted(out, key=lambda t: t[1]):
                        return out
                except ValueError:
                    pass
                return [(d, (a - lo) // 4) for a, d in hit]

        # NOTE the `[^\n]*?`.  The obvious `(?:[^,]*,\s*)?` for an optional `cr0,`
        # operand is WRONG: a negated class matches newlines, so on a branch with
        # no comma it runs on through following LINES to the next comma and
        # captures a label from an unrelated instruction -- while missing the
        # real target.  That made `bne lbl_000007F4` invisible in mini_pilot
        # `lbl_000007B8.s`, so a 61-instruction function read as five.
        branched = set(re.findall(
            r'(?m)^/\* [0-9A-F]{8} [0-9A-F]{8} \*/[ \t]+b[a-z]*[+-]?[ \t]+'
            r'[^\n]*?(lbl_[0-9A-Fa-f]+)', txt))
        out, idx = [(lbl, 0)], 0
        for line in txt.splitlines():
            m = re.match(r'^(lbl_[0-9A-Fa-f]+):', line)
            if m:
                if m.group(1) not in branched and m.group(1) != lbl:
                    out.append((m.group(1), idx))
                continue
            if re.match(r'/\* [0-9A-F]{8} [0-9A-F]{8} \*/', line):
                idx += 1
        return out

    def score(e, g):
        sm = difflib.SequenceMatcher(None, e, g, autojunk=False)
        ops = [o for o in sm.get_opcodes() if o[0] != 'equal']
        tot = sum(max(i2 - i1, j2 - j1) for _, i1, i2, j1, j2 in ops)
        return tot, ops

    # A label that is still an asm stub is assembled verbatim into the .plf, so
    # it matches ITSELF and always scores 0.  That is the same lie rel_sweep's
    # trap 5 told (a wrong --file reporting a clean MATCH against an untouched
    # stub elsewhere), and it would be worse here because this tool is what run
    # 9 will use to decide what is close.  So find out first.
    stubbed = set()
    for p in _glob.glob(os.path.join(REPO, 'src', '%s*.c' % stem)):
        txt = open(p, errors='ignore').read()
        for m in re.finditer(
                r'#include "\.\./asm/nonmatchings/%s/([A-Za-z0-9_]+)\.s"'
                % re.escape(stem), txt):
            stubbed.add(m.group(1))

    # Normalise branch displacements -- but ONLY the ones we have to.
    #
    # RUN 9, mini_golf: the old rule masked the displacement of EVERY b/bc/bl,
    # which meant a sweep control that only changed a branch target, or which
    # function is called, was COMPLETELY INVISIBLE -- it scored identical to
    # baseline.  Four agents' controls failed that way in one run, and every
    # "this axis is dead" verdict validated by such a control is unproven.
    #
    # The masking exists because the LINKER relocates calls to other objects, so
    # comparing those displacements would report 8-24 differences on a
    # byte-perfect function.  But that argument only covers branches that LEAVE
    # the function.  An intra-function branch is PC-relative and self-consistent:
    # if the code matches, its displacement matches, wherever the function
    # lands.  So keep those and compare them.
    #
    # opcode 16 = bc  (BD, 14-bit signed, AA=bit30, LK=bit31)
    # opcode 18 = b/bl (LI, 24-bit signed, same AA/LK)
    def nz_at(w, i, n):
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
        if w & 2:                      # AA=1: absolute, never intra-function
            return w & 0xFC000003
        tgt = i + d // 4
        if 0 <= tgt < n and not (w & 1):   # intra-function, and not a call
            return w                       # keep the displacement -- compare it
        return w & 0xFC000003              # leaves the function: relocated

    for lbl in labels:
        if lbl not in addrs:
            print('%-16s NOT IN MAP -- is it still an asm stub, or in another '
                  'module?' % lbl)
            continue
        rows = rf.load_asm(lbl)
        n = len(rows)
        base = addrs[lbl]
        exp = [r[1] for r in rows]
        got = [int.from_bytes(text[base + 4 * i:base + 4 * i + 4], 'big')
               for i in range(n)]

        # Normalise branches in BOTH columns.  The linker relocates b/bl
        # displacements, so a naive word-compare reports 8-24 differences on a
        # byte-perfect function -- which would make this RAW column mean
        # something different from the raw counts in rel_sweep and in every
        # run-7/run-8 report.  The ONLY difference between the two columns
        # below must be positional alignment.
        e_n = [nz_at(x, i, n) for i, x in enumerate(exp)]
        g_n = [nz_at(x, i, n) for i, x in enumerate(got)]
        raw = sum(1 for a, b in zip(e_n, g_n) if a != b)
        tot, ops = score(e_n, g_n)

        if ops:
            lo = min(o[1] for o in ops)
            hi = max(o[2] for o in ops)
            span = '  span %d-%d of %d (%d%%)' % (lo, hi, n,
                                                  round(100.0 * (hi - lo) / n))
        else:
            span = ''
        print('%-16s %4d insn   RAW %4d   ALIGNED %4d   (%d edit region%s)%s'
              % (lbl, n, raw, tot, len(ops),
                 '' if len(ops) == 1 else 's', span))
        # RUN 9 (mini_race, mini_fight and test_mode, independently): a row is a
        # FILE, not a function.  17 of mini_fight's 154 rows hold more than one
        # body, so the single number above can be a 309-instruction "function"
        # that is really four -- and one bad body hides three good ones.  All
        # three agents built their own slicer; this is that, in the one scorer.
        subs = entries_in(lbl, n)
        if len(subs) > 1:
            # EXPECTED boundaries come from the label names, which encode the
            # original .text offset -- exact, and independent of any heuristic.
            # GOT boundaries come from CONSECUTIVE map addresses, so a body whose
            # length changed shifts the ones after it automatically.  (Trusting
            # the map's per-symbol size field instead reported 63 phantom
            # mismatches across nine modules on rows that are byte-perfect.)
            bounds = [s[1] for s in subs] + [n]
            gaddr = [sizes[s[0]][0] if s[0] in sizes else None for s in subs]
            print('%-16s   ^ this row holds %d FUNCTIONS -- per function:'
                  % ('', len(subs)))
            for k, (sub, st) in enumerate(subs):
                en = bounds[k + 1]
                se = [nz_at(x, i, en - st) for i, x in enumerate(exp[st:en])]
                if gaddr[k] is not None:
                    off = base + (gaddr[k] - addrs[lbl])
                    if k + 1 < len(subs) and gaddr[k + 1] is not None:
                        cnt = (gaddr[k + 1] - gaddr[k]) // 4
                    elif sub in sizes:
                        cnt = sizes[sub][1] // 4
                    else:
                        cnt = en - st
                    raws = [int.from_bytes(text[off + 4 * i:off + 4 * i + 4],
                                           'big') for i in range(cnt)]
                else:
                    raws = got[st:en]
                sg = [nz_at(x, i, len(raws)) for i, x in enumerate(raws)]
                stot, sops = score(se, sg)
                if sops:
                    slo = min(o[1] for o in sops)
                    shi = max(o[2] for o in sops)
                    sspan = '  span %d-%d of %d' % (slo, shi, en - st)
                else:
                    sspan = ''
                print('%-16s   %-16s %4d insn  %d in %d%s'
                      % ('', sub, en - st, stot, len(sops), sspan))

        if lbl in stubbed:
            print('%-16s !! STILL AN ASM STUB in this tree -- it is assembled '
                  'verbatim, so it matches ITSELF. This score is meaningless. '
                  '(rel_sweep trap 5, same shape.)' % '')
        elif tot == 0:
            print('%-16s MATCH -- but a per-function 0 is NECESSARY, NOT '
                  'SUFFICIENT. Gate it: python tools/rel_sweep.py <mod> --gate'
                  % '')


main()
