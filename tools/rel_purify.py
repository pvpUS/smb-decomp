#!/usr/bin/env python3
"""rel_purify.py -- split a MIXED group file at every C <-> asm boundary.

**This is not what rel_isolate.py does, and the difference is the whole point.**
`rel_isolate` splits on `asm void` starts, so a C function sitting AFTER an asm
block is bundled into that block's output file: the file count goes up and every
output is STILL A MIXED TU.  The converted functions therefore keep compiling
with the scheduler, the peephole optimizer and the address-fold peephole
disabled -- precisely the condition §2/§3 exists to remove.

Splitting on the C/asm TRANSITION instead keeps `.text` order exactly (SOURCES
order is preserved) while giving every converted function a pure-C TU, and
quarantines the functions that must stay asm (a carve-blocked one, say) so they
stop contaminating their neighbours.

Run 10 built this TWICE, independently -- mini_race's `rel_purify.py` and
mini_fight's `isolate_mixed.py` -- which is exactly the duplicated-workaround
waste run 9 flagged.  This is the merge of the two, with mini_fight's `{` guard
(so a forward declaration is never mistaken for a definition) and mini_race's
prefix handling (types/#includes/decls before the first definition are kept).

WHY IT IS WORTH DOING: a mixed TU costs more than §2/§3 recorded.  mini_race
proved by golden build that it also disables RETURN FOLDING (the original's
`bgelr` / early `blr` becomes a branch to the epilogue) and turns the
optimizer's `addi rD,rS,0` parameter copy into `mr rD,rS`.  Two functions went
1-in-1 -> MATCH and 7-in-5 -> 1 with NO C CHANGE -- only the TU was purified.

Byte-neutral by construction; both authors gated GOLDEN after every use.
Verify with `python tools/rel_sweep.py <module> --gate` anyway.

usage:
  python tools/rel_purify.py <module> src/<file>.c [more.c ...]        # dry run
  python tools/rel_purify.py <module> src/<file>.c --apply
  python tools/rel_purify.py <module> src/<file>.c --apply --tree DIR
"""
import argparse
import os
import re
import sys

MODULES = {
    'mini_bowling': 'mini_bowling', 'mini_race': 'mini_race',
    'mini_fight': 'mini_fight', 'mini_pilot': 'mini_pilot',
    'mini_golf': 'mini_golf', 'mini_billiards': 'mini_billiards',
    'sel_ngc': 'sel_ngc_rel', 'option': 'option', 'test_mode': 'test_mode',
}
SUF = 'bcdefghijklmnopqrstuvwxyz'

# `[static] [asm] <type> lbl_X(` at column 0.  The caller additionally requires
# the NEXT line to be `{` -- without that a forward declaration matches and the
# file is split at the wrong place (mini_fight).
DEFN = re.compile(r'^(static\s+)?(asm\s+)?[A-Za-z_][A-Za-z0-9_ \*]*?\b'
                  r'(lbl_[0-9A-Fa-f]+)\s*\(')


def purify(tree, rel, apply_):
    path = os.path.join(tree, rel)
    if not os.path.exists(path):
        print('  no such file: %s' % path)
        return None
    text = open(path, newline='').read()
    nl = '\r\n' if '\r\n' in text else '\n'
    lines = text.replace('\r\n', '\n').split('\n')
    try:
        on = next(i for i, l in enumerate(lines)
                  if l.startswith('#pragma force_active on'))
        off = next(i for i, l in enumerate(lines)
                   if l.startswith('#pragma force_active reset'))
    except StopIteration:
        print('  %s has no #pragma force_active on/reset pair -- this splits '
              'rel_split-shaped files only' % rel)
        return None
    header, tail, body = lines[:on + 1], lines[off:], lines[on + 1:off]

    starts = []
    for i, l in enumerate(body):
        m = DEFN.match(l)
        if m and i + 1 < len(body) and body[i + 1].strip() == '{':
            starts.append((i, m.group(3), bool(m.group(2))))
    if len(starts) < 2:
        print('  %s: %d definition(s) -- nothing to split' % (rel, len(starts)))
        return None

    prefix = body[:starts[0][0]]
    blocks = []
    for k, (s, lbl, is_asm) in enumerate(starts):
        e = starts[k + 1][0] if k + 1 < len(starts) else len(body)
        blk = body[s:e]
        while blk and blk[-1].strip() == '':
            blk.pop()
        blocks.append((lbl, is_asm, blk))

    # group CONSECUTIVE definitions of the same kind
    groups = []
    for lbl, is_asm, blk in blocks:
        if groups and groups[-1][0] == is_asm:
            groups[-1][1].append((lbl, blk))
        else:
            groups.append((is_asm, [(lbl, blk)]))
    if len(groups) < 2:
        print('  %s: already pure (%s) -- nothing to do'
              % (rel, 'asm' if groups[0][0] else 'C'))
        return None

    # WHICH `static`s must be stripped -- and no more.
    #
    # Run 10's two authors both stripped `static` from EVERY definition they
    # emitted.  That is wrong and it silently loses the golden hash: promoting a
    # file-local symbol to a global one changes the REL's symbol and relocation
    # tables even when `.text` is byte-identical.  Verified here on
    # mini_race_28.c -- `lbl_00004718` was `static`, all three functions still
    # scored ALIGNED 0 individually, and the module gated NOT GOLDEN.
    #
    # `static` only has to go when a function's REFERENCES end up in a different
    # output file than its definition.  Work that out instead of assuming it.
    where = {}
    for k, (_is_asm, g) in enumerate(groups):
        for lbl, _b in g:
            where[lbl] = k
    used_elsewhere = set()
    for k, (_is_asm, g) in enumerate(groups):
        body_txt = '\n'.join(l for _lbl, b in g for l in b)
        for lbl in re.findall(r'(lbl_[0-9A-Fa-f]+)', body_txt):
            if where.get(lbl) not in (None, k):
                used_elsewhere.add(lbl)

    # PICK NAMES THAT DO NOT ALREADY EXIST.
    #
    # Both run-10 authors emitted `<base>b.c`, `<base>c.c`, ... unconditionally.
    # In a tree that has already been split -- which is every tree now -- those
    # names are taken, so the tool OVERWRITES a real converted file and exits 0.
    # Caught here on mini_race_28.c: `src/mini_race_28b.c` already existed and
    # held `lbl_00004910`, so purifying silently deleted 168 instructions, added
    # a duplicate SOURCES line, and built clean but non-golden. That is exactly
    # the run-9 `isolate.py` defect ("names its output <stem>i.c
    # unconditionally, so isolating a second function silently destroys the
    # first, exit 0"), reintroduced.
    base = rel[:-2]
    free = [s for s in SUF
            if not os.path.exists(os.path.join(tree, '%s%s.c' % (base, s)))]
    if len(free) < len(groups) - 1:
        sys.exit('  %s: need %d free suffixes for %s*, only %d available -- '
                 'refusing to overwrite existing files'
                 % (rel, len(groups) - 1, base, len(free)))

    outs = []
    for k, (is_asm, g) in enumerate(groups):
        name = rel if k == 0 else '%s%s.c' % (base, free[k - 1])
        blk = list(prefix)
        for lbl, b in g:
            first = (re.sub(r'^static\s+', '', b[0])
                     if lbl in used_elsewhere else b[0])
            blk += [first] + b[1:] + ['']
        while blk and blk[-1].strip() == '':
            blk.pop()
        # The shared header carries a forward declaration for everything in the
        # original TU.  A `static` one in a file that no longer defines that
        # function is a promise the file cannot keep, so strip exactly those.
        hdr = []
        for h in header:
            m = re.match(r'^static\s+\w[\w \*]*\**\s*(lbl_[0-9A-Fa-f]+)\s*\(', h)
            if m and where.get(m.group(1)) not in (None, k):
                h = re.sub(r'^static\s+', '', h)
            hdr.append(h)
        outs.append((name, is_asm, [l for l, _ in g], hdr + blk + [''] + tail))
        print('    %-30s %-4s %s' % (name, 'ASM' if is_asm else 'C',
                                     ' '.join(l for l, _ in g)))
    if not apply_:
        return [o[0] for o in outs]

    for name, _a, _l, content in outs:
        open(os.path.join(tree, name), 'w', newline='').write(nl.join(content))
        o = os.path.join(tree, name + '.o')
        if os.path.exists(o):
            os.remove(o)
    patch_sources(tree, rel, [o[0] for o in outs])
    return [o[0] for o in outs]


def patch_sources(tree, rel, outs):
    mk = os.path.join(tree, 'Makefile')
    text = open(mk, newline='').read()
    mnl = '\r\n' if '\r\n' in text else '\n'
    lines = text.replace('\r\n', '\n').split('\n')
    want = '\t%s \\' % rel
    idx = [i for i, l in enumerate(lines) if l == want]
    if len(idx) != 1:
        sys.exit('Makefile: %d matches for %r -- refusing to guess' % (len(idx), want))
    lines[idx[0]:idx[0] + 1] = ['\t%s \\' % o for o in outs]
    open(mk, 'w', newline='').write(mnl.join(lines))
    print('    Makefile SOURCES: 1 entry -> %d, in place' % len(outs))


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('module', choices=sorted(MODULES))
    ap.add_argument('files', nargs='+', help='repo-relative, e.g. src/x_12.c')
    ap.add_argument('--tree', help='defaults to C:/tmp/smbm/<module>')
    ap.add_argument('--apply', action='store_true')
    a = ap.parse_args()

    stem = MODULES[a.module]
    tree = a.tree or 'C:/tmp/smbm/%s' % a.module
    if not os.path.exists(os.path.join(tree, 'Makefile')):
        sys.exit('no Makefile in %s -- pass --tree' % tree)
    bad = [f for f in a.files if not os.path.basename(f).startswith(stem)]
    if bad:
        sys.exit('not %s files: %s  (module stem is %r)'
                 % (a.module, ', '.join(bad), stem))

    any_ = False
    for rel in a.files:
        print(rel.replace('\\', '/'))
        if purify(tree, rel.replace('\\', '/'), a.apply):
            any_ = True
    if not a.apply:
        print('\n(dry run -- pass --apply)')
    elif any_:
        print('\nGate it: python tools/rel_sweep.py %s --gate' % a.module)
    return 0


if __name__ == '__main__':
    sys.exit(main())
