#!/usr/bin/env python3
"""rel_leafsplit.py -- split a TRAILING LEAF function out of a still-asm row.

`rel_ssplit.py` cannot do these two things, and between them they cover every
function the census reports as `leaf?`:

  * it REFUSES any row containing `bctr`, and run 10 proved that real ordinary
    functions live in those rows -- they sit AFTER the jump-table function's
    final `blr`, so no scanner can tell them from an arm, but READING them
    settles it.  test_mode read all seven of its `leaf?` candidates: all seven
    were real functions and six of them matched.  (mini_bowling read its six
    and they genuinely were arms, at 8-byte spacing.  Read them; the brief's
    "assume an arm until proven otherwise" was wrong in both directions.)
  * its entry rule requires an `mflr`/`stwu` prologue, so it misses leaves
    outright -- test_mode's 84-instruction leaf starts with a bare `lis`.

Byte-neutral by construction:

  asm/nonmatchings/<stem>/<row>.s    truncated at the leaf label
  asm/nonmatchings/<stem>/<leaf>.s   NEW, holds the removed tail
  src/<owner><suffix>.c              NEW, a clone of the owner whose asm block
                                     is re-pointed at <leaf>.s
  Makefile SOURCES                   <owner> then the clone, preserving .text

ALL validation happens before ANY write.  Two silent-deletion defects are
designed out here, both of which have already cost this project real work:

  * the harvested version cut the `.s` and THEN failed the clone rewrite (the
    stubs are `static asm void`, not `asm void`), orphaning four leaves'
    instructions -- the same class as `rel_rematch.py`'s.
  * it also named the clone `<owner>b.c` and asserted rather than choosing, so
    in an already-split tree it simply refused.  `isolate.py` (run 9) and both
    run-10 purify tools named their output unconditionally and DESTROYED an
    existing file at exit 0 -- three tools, one bug.  This one picks a free
    suffix, exactly like `rel_purify.py`.

It also refuses a GROUP owner file: the clone would duplicate every other
definition in it.  Isolate or purify first.

Gate with `python tools/rel_sweep.py <module> --gate` BEFORE converting
anything -- the split must be byte-neutral on its own.

usage:
  python tools/rel_leafsplit.py <module> <row_label> <leaf_label>        # dry run
  python tools/rel_leafsplit.py <module> <row_label> <leaf_label> --apply
  python tools/rel_leafsplit.py <module> <row> <leaf> --apply --tree DIR
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

INSN = re.compile(r'^/\* [0-9A-F]{8} [0-9A-F]{8} \*/')
# same shape as rel_purify.DEFN; the caller also requires the next line to be
# `{` so a forward declaration is never counted as a definition.
DEFN = re.compile(r'^(static\s+)?(asm\s+)?[A-Za-z_][A-Za-z0-9_ \*]*?\b'
                  r'(lbl_[0-9A-Fa-f]+)\s*\(')


def read(path):
    text = open(path, newline='', encoding='utf-8', errors='surrogateescape').read()
    return text.replace('\r\n', '\n'), ('\r\n' if '\r\n' in text else '\n')


def write(path, text, nl):
    open(path, 'w', newline='', encoding='utf-8',
         errors='surrogateescape').write(text.replace('\n', nl))


def die(msg):
    sys.exit('REFUSED: ' + msg)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('module', choices=sorted(MODULES))
    ap.add_argument('row', help='the row label whose .s holds the leaf')
    ap.add_argument('leaf', help='the leaf label to split out of its tail')
    ap.add_argument('--tree', help='defaults to C:/tmp/smbm/<module>')
    ap.add_argument('--apply', action='store_true')
    a = ap.parse_args()

    stem = MODULES[a.module]
    tree = a.tree or 'C:/tmp/smbm/%s' % a.module
    if not os.path.exists(os.path.join(tree, 'Makefile')):
        die('no Makefile in %s -- pass --tree' % tree)
    ad = os.path.join(tree, 'asm', 'nonmatchings', stem)
    rowp, leafp = os.path.join(ad, a.row + '.s'), os.path.join(ad, a.leaf + '.s')

    # ---- validate: the row .s ----------------------------------------------
    if not os.path.exists(rowp):
        die('no such row asm: %s' % rowp)
    if os.path.exists(leafp):
        die('%s already exists' % leafp)
    stext, snl = read(rowp)
    lines = stext.splitlines(True)
    idx = [k for k, l in enumerate(lines) if l.strip().startswith(a.leaf + ':')]
    if len(idx) != 1:
        die('leaf label %s is defined %d times in %s.s' % (a.leaf, len(idx), a.row))
    head, tail = lines[:idx[0]], lines[idx[0]:]
    nh = sum(1 for l in head if INSN.match(l.strip()))
    nt = sum(1 for l in tail if INSN.match(l.strip()))
    if not nh:
        die('the head would be empty -- %s is the row label itself?' % a.leaf)
    if not nt:
        die('the tail holds no instructions')
    if any(a.leaf in l for l in head):
        die('the head still references %s (a branch INTO the leaf means it is '
            'not a separate function -- read it)' % a.leaf)

    # ---- validate: the owner .c --------------------------------------------
    inc = 'asm/nonmatchings/%s/%s.s' % (stem, a.row)
    owners = []
    for f in sorted(os.listdir(os.path.join(tree, 'src'))):
        if not (f.startswith(stem) and f.endswith('.c')):
            continue
        p = os.path.join(tree, 'src', f)
        if inc in read(p)[0]:
            owners.append(f)
    if len(owners) != 1:
        die('%d src files include %s -- %s' % (len(owners), inc, owners or 'none'))
    ob = owners[0][:-2]
    ctext, cnl = read(os.path.join(tree, 'src', owners[0]))

    body = ctext.split('\n')
    ndef = sum(1 for i, l in enumerate(body)
               if DEFN.match(l) and i + 1 < len(body) and body[i + 1].strip() == '{')
    if ndef != 1:
        die('%s holds %d definitions -- the clone would duplicate the others. '
            'Run rel_isolate.py / rel_purify.py first.' % (owners[0], ndef))

    BLK = re.compile(r'(#pragma force_active on\s*\n(?:static\s+)?asm void )'
                     + a.row + r'(\(void\)\s*\n\{[^}]*?)' + a.row + r'(\.s"\s*\n\})')
    if len(BLK.findall(ctext)) != 1:
        die('%d rewritable asm blocks for %s in %s' %
            (len(BLK.findall(ctext)), a.row, owners[0]))

    # ---- validate: a free clone name ---------------------------------------
    free = [s for s in SUF
            if not os.path.exists(os.path.join(tree, 'src', '%s%s.c' % (ob, s)))]
    if not free:
        die('no free suffix left for src/%s*.c' % ob)
    newb = ob + free[0]

    # ---- validate: the Makefile anchor -------------------------------------
    mk = os.path.join(tree, 'Makefile')
    mtext, mnl = read(mk)
    anchor = '\tsrc/%s.c \\' % ob
    if mtext.split('\n').count(anchor) != 1:
        die('SOURCES anchor %r appears %d times'
            % (anchor, mtext.split('\n').count(anchor)))

    print('%s.s  %d insn -> %s.s %d + %s.s %d   (owner src/%s.c)'
          % (a.row, nh + nt, a.row, nh, a.leaf, nt, ob))
    print('  new file   src/%s.c   (clone of src/%s.c, asm block -> %s.s)'
          % (newb, ob, a.leaf))
    print('  SOURCES    src/%s.c then src/%s.c' % (ob, newb))
    if not a.apply:
        print('\n(dry run -- pass --apply)')
        return 0

    # ==== everything validated -- now write =================================
    write(rowp, ''.join(head), snl)
    write(leafp, ''.join(tail), snl)

    n = ctext.replace('isolated function ' + a.row, 'isolated function ' + a.leaf)
    n = BLK.sub(lambda g: g.group(1) + a.leaf + g.group(2) + a.leaf + g.group(3), n)
    write(os.path.join(tree, 'src', newb + '.c'), n, cnl)

    ml = mtext.split('\n')
    ml.insert(ml.index(anchor) + 1, '\tsrc/%s.c \\' % newb)
    write(mk, '\n'.join(ml), mnl)
    for o in (ob, newb):
        p = os.path.join(tree, 'src', o + '.c.o')
        if os.path.exists(p):
            os.remove(p)

    print('\nGate it BEFORE converting: python tools/rel_sweep.py %s --gate' % a.module)
    return 0


if __name__ == '__main__':
    sys.exit(main())
