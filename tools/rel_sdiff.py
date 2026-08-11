#!/usr/bin/env python3
"""rel_sdiff.py -- ALIGNED edit script, golden `.s` vs the built `.plf`, over
the real 32-bit WORDS.

WHY THIS EXISTS.  Four modules wrote their own version of this in run 25 alone
(sel_ngc's `sd3.py`, option's `go.py`, test_mode's `dis.py`, mini_golf's
tooling), and test_mode's report put it plainly: nothing in `tools/` prints
this.  sel_ngc's copy is what found `lbl_0000B920` (370 insn, RAW 0) after the
residual had been mis-carried for three runs as two separate defects; it showed
they were one.  This is the generalised promotion of it.

WHAT MAKES IT DIFFERENT FROM `rel_ascore` AND FROM A POSITIONAL WINDOW:

  * It diffs the WORDS, not the disassembly TEXT.  A text diff makes every `bl`
    look like a mismatch -- golden prints a symbol name, the `.plf` prints a
    resolved hex address -- so on a call-heavy function a text tool reports
    dozens of diffs that are not diffs.  Only branch displacements are masked,
    which is exactly what `rel_ascore` masks, so the edit script printed here is
    the one the scorer counts.

  * It is ALIGNED (difflib), so it is the only readable view on a draft whose
    LENGTH IS WRONG.  A positional window is useless there: one inserted or
    dropped instruction shifts every word after it and the whole tail reads as a
    diff.  Run 25 killed four inherited "near-miss" figures that were really
    wrong-length drafts, and this is the tool that makes that case legible.

  * `--near` also prints the CONTEXT around each edit region.  A bare edit
    script tells you what changed, not what it changed relative to.

usage:
  python tools/rel_sdiff.py <module> <label> [--tree DIR] [--near N] [--quiet]

  <module>   warm-dir name (mini_race, sel_ngc, ...) -- NOT the asm stem.
             The stem and the link target are derived; see the note in
             rel_census.py about the three names each module has.
  <label>    lbl_XXXXXXXX

Requires a BUILT `.plf`/`.map` for the module in the tree.  Build first --
this reads the link, it does not produce one.
"""
import difflib
import os
import re
import sys

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# Keep these three identical to rel_census.py's.  A module has three names and
# mixing them up is the single most common wrong-tree bug in this toolbox.
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

OBJDUMP = os.environ.get(
    'OBJDUMP', 'C:/devkitPro/devkitPPC/bin/powerpc-eabi-objdump.exe')


def mask(wd):
    """Mask link-time noise, and ONLY link-time noise.

    op 16 = bc, op 18 = b: the displacement is resolved at link time, so golden
    and the build legitimately differ there while the instruction is the same.
    Everything else -- including the register fields this project spends most of
    its time on -- is compared exactly.
    """
    op = wd >> 26
    if op in (16, 18):
        return wd & 0xFC000003
    return wd


def symbol_size(plf, label):
    """Instruction count of `label` in the built `.plf`, from the SYMBOL TABLE.

    This is the authoritative length in BOTH directions.  The `blr` scan that
    used to do this job could only ever be right about a LONG build -- see the
    comment at the trim below, and run 26's mini_fight report, which caught it
    reporting a 1-SHORT draft as +64 LONG.  `objdump -t` prints `F .text <size>`
    for every function, so no heuristic is needed when the symbol is present.
    """
    d = os.popen('"%s" -t "%s"' % (OBJDUMP, plf)).read()
    for ln in d.splitlines():
        f = ln.split()
        if len(f) >= 6 and f[-1] == label and f[-3] == '.text':
            return int(f[-2], 16) // 4
    return None


def load_fdiff(tree, stem):
    """Borrow rel_fdiff's loaders so relocation placeholders are handled the
    way the SCORER handles them, not the way this file would guess."""
    os.environ['FDIFF_MODULE'] = stem
    os.environ['FDIFF_REPO'] = tree
    fp = os.path.join(tree, 'tools', 'rel_fdiff.py')
    if not os.path.exists(fp):
        sys.exit('no %s -- rel_sdiff borrows its loaders' % fp)
    rf = type(sys)('rf')
    rf.__dict__['__file__'] = fp
    src = open(fp).read().replace('\nmain()', '')
    exec(compile(src, 'rel_fdiff', 'exec'), rf.__dict__)
    return rf


def main():
    args = [a for a in sys.argv[1:]]
    tree, near, quiet = REPO, 0, False
    out = []
    i = 0
    while i < len(args):
        if args[i] == '--tree':
            tree = args[i + 1]
            i += 2
        elif args[i] == '--near':
            near = int(args[i + 1])
            i += 2
        elif args[i] == '--quiet':
            quiet = True
            i += 1
        else:
            out.append(args[i])
            i += 1
    if len(out) != 2:
        sys.exit(__doc__)
    mod, label = out
    if mod not in MODULES:
        sys.exit('unknown module %r -- want one of: %s\n'
                 '  (this takes the WARM-DIR name, not the asm stem)'
                 % (mod, ', '.join(sorted(MODULES))))
    stem = MODULES[mod]
    tree = os.path.abspath(tree)

    plf = os.path.join(tree, TARGETS[mod] + '.plf')
    if not os.path.exists(plf):
        sys.exit('no %s -- build the module first; this reads the link'
                 % plf)

    cwd = os.getcwd()
    os.chdir(tree)
    try:
        rf = load_fdiff(tree, stem)
        rows = rf.load_asm(label)
        if not rows:
            sys.exit('no asm rows for %s in module %s' % (label, mod))
        mp = rf.load_map(os.path.splitext(plf)[0] + '.map')
        if label not in mp:
            sys.exit('%s is not in %s.map -- it may already be converted, or '
                     'the link is stale' % (label, TARGETS[mod]))
        base = mp[label]
        nbuilt = symbol_size(plf, label)

        gold = [mask(w) for _, w, _ in rows]
        gtxt = [t for _, _, t in rows]

        # Read a little past the golden length so a LONG build is visible
        # rather than silently truncated at golden's count.
        span = len(rows) * 4 + 256
        d = os.popen('"%s" -d --start-address %s --stop-address %s "%s"'
                     % (OBJDUMP, hex(base), hex(base + span), plf)).read()
        built, btxt = [], []
        for ln in d.splitlines():
            m = re.match(r'^\s*([0-9a-f]+):\s+([0-9a-f ]{11})\s+(.*)$', ln)
            if m:
                built.append(mask(int(m.group(2).replace(' ', ''), 16)))
                btxt.append(m.group(3).strip())
    finally:
        os.chdir(cwd)

    # Trim the read-ahead back to the built function.
    #
    # Prefer the symbol table -- it is exact in both directions.  The fallback
    # `blr` scan below is only reached when the symbol is absent, and it is
    # WRONG FOR A SHORT BUILD by construction: it starts at golden's last index,
    # so a short body's own `blr` sits BEFORE the start, is skipped, and the scan
    # runs on into the NEXT function and stops at that one's `blr`.  Run 26 hit
    # exactly this -- a 1-short draft was reported as `+64 LONG`, inverting the
    # tool's own verdict on the one case §5 promotes it for.  Starting the scan
    # at index 0 is not a fix either: an early return would truncate a long body.
    if nbuilt is not None:
        end = min(nbuilt, len(built))
    else:
        end = len(built)
        for j in range(len(rows) - 1, len(built)):
            if btxt[j].startswith('blr'):
                end = j + 1
                break
    built, btxt = built[:end], btxt[:end]

    delta = len(built) - len(gold)
    print('%s  %s' % (mod, label))
    print('golden %d   built %d   %s'
          % (len(gold), len(built),
             'EXACT' if delta == 0 else
             '%+d -- WRONG LENGTH, this is not a near-miss' % delta))

    sm = difflib.SequenceMatcher(None, gold, built, autojunk=False)
    ops = [o for o in sm.get_opcodes() if o[0] != 'equal']
    aligned = sum(max(o[2] - o[1], o[4] - o[3]) for o in ops)
    print('ALIGNED %d in %d region(s)%s'
          % (aligned, len(ops),
             '   span %d-%d' % (ops[0][1], ops[-1][2]) if ops else ''))
    if quiet or not ops:
        return 0
    print()
    for tag, i1, i2, j1, j2 in ops:
        print('--- %s  gold[%d:%d]  built[%d:%d]' % (tag, i1, i2, j1, j2))
        if near:
            for i in range(max(0, i1 - near), i1):
                print('    ctx %4d  %s' % (i, gtxt[i]))
        for i in range(i1, i2):
            print('    exp %4d  %s' % (i, gtxt[i]))
        for j in range(j1, j2):
            print('    got %4d  %s' % (j, btxt[j]))
        if near:
            for i in range(i2, min(len(gold), i2 + near)):
                print('    ctx %4d  %s' % (i, gtxt[i]))
    return 0


if __name__ == '__main__':
    sys.exit(main())
