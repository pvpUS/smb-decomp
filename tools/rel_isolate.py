#!/usr/bin/env python3
"""Split an asm-group src file into one file per asm function.

Byte-neutral: same header, same .text order, SOURCES entry replaced in place.
Avoids rel_rematch entirely (it corrupts six modules: letter-suffixed files sort
to the FRONT of SOURCES and it exits 0).

Differences from run 8's isolate.py:
  * suffixes go b..z, so a 15-function file works (run 8's had 11 letters);
  * `static void lbl_X(void);` forward declarations in the shared header are
    rewritten to `void lbl_X(void);`, because each block becomes non-static
    once it is in its own TU and mwcc rejects the static-decl/extern-def pair;
  * --only <label>[,<label>...] isolates just those labels and keeps the rest
    together, so you can test the hypothesis with one build.

usage:
  python tools/rel_isolate.py [--tree C:/tmp/smbm/<mod>] src/<stem>_N.c [--only lbl_XXXXXXXX]
"""
import os
import re
import sys

# TREE defaults to the repo this script lives in; override with --tree <dir>
# so it can be pointed at a warm copy at C:/tmp/smbm/<module>.
TREE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SUF = 'bcdefghijklmnopqrstuvwxyz'


def split_file(rel, only):
    path = os.path.join(TREE, rel)
    text = open(path, newline='').read()
    nl = '\r\n' if '\r\n' in text else '\n'
    lines = text.replace('\r\n', '\n').split('\n')
    on = next(i for i, l in enumerate(lines)
              if l.startswith('#pragma force_active on'))
    off = next(i for i, l in enumerate(lines)
               if l.startswith('#pragma force_active reset'))
    header = lines[:on + 1]
    tail = lines[off:]
    body = lines[on + 1:off]

    # every `static void lbl_X(void);` in the header must lose its `static`
    header = [re.sub(r'^static (void lbl_[0-9A-Fa-f]+\()', r'\1', h)
              for h in header]

    starts = [i for i, l in enumerate(body)
              if re.match(r'(static )?asm void lbl_', l)]
    if len(starts) < 2:
        print('%s: only %d asm fn(s), nothing to do' % (rel, len(starts)))
        return []
    # Anything before the first asm block (already-converted C, struct
    # definitions) belongs to the FIRST output file.  Run 8's isolate.py
    # dropped it, which silently deletes matched C from a mixed TU.
    prefix = body[:starts[0]]
    blocks = []
    for k, s in enumerate(starts):
        e = starts[k + 1] if k + 1 < len(starts) else len(body)
        blk = body[s:e]
        while blk and blk[-1].strip() == '':
            blk.pop()
        blocks.append((re.search(r'lbl_[0-9A-Fa-f]+', blk[0]).group(0), blk))

    # group consecutive blocks: a run of blocks NOT in `only` stays in one file
    groups, cur = [], []
    for lbl, blk in blocks:
        if only is None or lbl in only:
            if cur:
                groups.append(cur)
                cur = []
            groups.append([(lbl, blk)])
        else:
            cur.append((lbl, blk))
    if cur:
        groups.append(cur)

    base = rel[:-2]
    # Pick suffixes that are actually FREE.  Taking SUF[k-1] unconditionally
    # overwrites an existing letter-suffixed sibling in an already-split tree --
    # mini_fight's w4 lost 18bb.c/18bc.c to it in run 12.  This is the FOURTH
    # tool in this project to ship invent-a-filename-and-clobber (after
    # isolate.py in run 9, rel_rematch, and both agents' rel_purify in run 10),
    # and every one of them exited 0 with a clean, non-golden build.
    free = [s for s in SUF
            if not os.path.exists(os.path.join(TREE, '%s%s.c' % (base, s)))]
    if len(free) < len(groups) - 1:
        sys.exit('  %s: need %d free suffixes for %s*, only %d available -- '
                 'refusing to overwrite an existing sibling'
                 % (rel, len(groups) - 1, base, len(free)))

    outs = []
    for k, g in enumerate(groups):
        name = rel if k == 0 else '%s%s.c' % (base, free[k - 1])
        blk = list(prefix) if k == 0 else []
        for lbl, b in g:
            blk += [re.sub(r'^static asm void', 'asm void', b[0])] + b[1:]
        open(os.path.join(TREE, name), 'w', newline='').write(
            nl.join(header + blk + [''] + tail))
        outs.append(name)
        print('  %-28s %s' % (name, ' '.join(l for l, _ in g)))
    return outs


def patch_makefile(rel, outs):
    mk = os.path.join(TREE, 'Makefile')
    text = open(mk, newline='').read()
    nl = '\r\n' if '\r\n' in text else '\n'
    lines = text.replace('\r\n', '\n').split('\n')
    want = '\t%s \\' % rel
    idx = [i for i, l in enumerate(lines) if l == want]
    if len(idx) != 1:
        sys.exit('Makefile: %d matches for %r -- refusing (re-running an '
                 'isolate after a git checkout duplicates the SOURCES line)'
                 % (len(idx), want))
    lines[idx[0]:idx[0] + 1] = ['\t%s \\' % o for o in outs]
    open(mk, 'w', newline='').write(nl.join(lines))


def main():
    global TREE
    args = sys.argv[1:]
    if '--tree' in args:
        i = args.index('--tree')
        TREE = args[i + 1]
        del args[i:i + 2]
    if not args:
        sys.exit(__doc__.strip())
    only = None
    if '--only' in args:
        i = args.index('--only')
        only = set(args[i + 1].split(','))
        del args[i:i + 2]
    for rel in args:
        print(rel)
        outs = split_file(rel, only)
        if outs:
            patch_makefile(rel, outs)
    print('done')


main()
