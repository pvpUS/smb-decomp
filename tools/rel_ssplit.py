#!/usr/bin/env python3
"""Split ONE monolithic per-row asm body into per-FUNCTION bodies, and patch the
owning .c to include them in the same order.

This is the enabler for the run-9 §4 finding ("a recon row is a FILE, not a
function"): mini_race's lbl_000008B4 row is 15 ordinary functions in one .s, and
you cannot convert one of them to C while the other 14 sit inside the same
`asm void` block.

It is deliberately surgical -- it does NOT re-split the module, does NOT renumber
files, and does NOT touch the Makefile. rel_rematch corrupts mini_race; this
does not go near it.

usage:
  python ssplit.py <tree> <stem> <rowlabel> <owning .c, repo-relative> [--apply]

Without --apply it prints the plan and writes nothing.
"""
import os
import re
import sys

INSN = re.compile(r'^/\* ([0-9A-F]{8}) ([0-9A-F]{8}) \*/\s+(\S+)(?:\s+(.*))?$')
LBL = re.compile(r'^(lbl_[0-9A-F]+):\s*$')


def parse(path):
    lines = open(path).read().splitlines()
    rows = []
    for ln in lines:
        m = LBL.match(ln)
        if m:
            rows.append(('L', m.group(1), ln))
            continue
        m = INSN.match(ln)
        if m:
            rows.append(('I', m.group(1), m.group(3), m.group(4) or '', ln))
        else:
            rows.append(('X', ln))
    return rows


def boundaries(rows):
    targets = set()
    for r in rows:
        if r[0] == 'I' and r[2].startswith('b') and r[2] != 'bl':
            targets.update(re.findall(r'lbl_[0-9A-F]+', r[3]))
    starts = [0]
    for i, r in enumerate(rows):
        if r[0] != 'L' or r[1] in targets:
            continue
        j = i - 1
        while j >= 0 and rows[j][0] != 'I':
            j -= 1
        if j < 0 or rows[j][2] not in ('blr', 'b', 'bctr', 'rfi'):
            continue
        nxt = [rows[k] for k in range(i + 1, min(i + 8, len(rows)))
               if rows[k][0] == 'I']
        if not nxt or ('mflr' not in [x[2] for x in nxt]
                       and 'stwu' not in [x[2] for x in nxt]):
            continue
        starts.append(i)
    return starts


def main():
    args = [a for a in sys.argv[1:] if not a.startswith('--')]
    apply_ = '--apply' in sys.argv
    tree, stem, row, cfile = args
    nm = os.path.join(tree, 'asm', 'nonmatchings', stem)
    path = os.path.join(nm, row + '.s')
    rows = parse(path)
    starts = boundaries(rows)
    if len(starts) < 2:
        sys.exit('%s: only one function -- nothing to split' % row)
    # A `bctr` switch dispatch jumps to labels this scanner cannot see, so every
    # jump-table arm that happens to follow a `b`/`blr` looks like a new
    # function.  That is exactly the phantom-splitting the run-9 brief warns
    # about (it invents 1- and 3-instruction "functions").  Refuse.
    if any(r[0] == 'I' and r[2] == 'bctr' for r in rows):
        sys.exit('%s contains bctr -- jump-table arms are indistinguishable '
                 'from function starts here. Refusing to split.' % row)

    chunks = []
    for k, i in enumerate(starts):
        end = starts[k + 1] if k + 1 < len(starts) else len(rows)
        name = row if k == 0 else rows[i][1]
        body = rows[i:end]
        # drop the leading label line for chunks after the first (it becomes the
        # function's own symbol, and mwcc emits the label itself)
        if k > 0 and body[0][0] == 'L':
            body = body[1:]
        chunks.append((name, body))

    # sanity: every branch target referenced inside a chunk must be defined in
    # that chunk (otherwise splitting breaks the assembly)
    ok = True
    for name, body in chunks:
        defined = {r[1] for r in body if r[0] == 'L'} | {name}
        for r in body:
            if r[0] == 'I' and r[2].startswith('b') and r[2] != 'bl':
                for t in re.findall(r'lbl_[0-9A-F]+', r[3]):
                    if t not in defined:
                        print('  !! %s branches to %s which is not in its chunk'
                              % (name, t))
                        ok = False
    if not ok:
        sys.exit('cross-chunk branch(es) -- refusing to split')

    print('%s -> %d chunk(s)' % (row, len(chunks)))
    for name, body in chunks:
        print('   %-22s %4d insn' % (name, sum(1 for r in body if r[0] == 'I')))
    if not apply_:
        print('(dry run -- pass --apply)')
        return

    for name, body in chunks:
        out = os.path.join(nm, name + '.s')
        with open(out, 'w', newline='\n') as f:
            for r in body:
                f.write((r[-1] if r[0] != 'L' else r[2]) + '\n')

    # patch the .c
    cpath = os.path.join(tree, cfile)
    txt = open(cpath, newline='').read()
    nl = '\r\n' if '\r\n' in txt else '\n'
    inc = '#include "../asm/nonmatchings/%s/%s.s"' % (stem, row)
    # find the whole asm function block
    m = re.search(r'((?:static )?asm void %s\(([^)]*)\)\s*\{\s*\n\s*nofralloc\s*\n'
                  r'\s*%s\s*\n\})' % (re.escape(row), re.escape(inc)),
                  txt.replace('\r\n', '\n'))
    if not m:
        sys.exit('could not find the asm block for %s in %s' % (row, cfile))
    old, sig = m.group(1), m.group(2)
    is_static = old.startswith('static ')
    new = []
    for k, (name, _) in enumerate(chunks):
        pre = 'static ' if (k > 0 or is_static) else ''
        # KEEP the row label's existing parameter list.  Rewriting it to (void)
        # while the file's forward declaration still says (struct Ball *) makes
        # mwcc mis-parse the ASSEMBLY and report "';' expected" / "undefined
        # identifier 'r0'" against the .s -- run 8's §A5 trap, from the other
        # side.  New chunks are fresh symbols, so (void) is fine for them.
        new.append('%sasm void %s(%s)\n{\n    nofralloc\n'
                   '#include "../asm/nonmatchings/%s/%s.s"\n}'
                   % (pre, name, sig if k == 0 else 'void', stem, name))
    txt = txt.replace('\r\n', '\n').replace(old, '\n'.join(new))
    # forward declarations for the new statics, right before the block
    decls = ''.join('static void %s(void);\n' % name
                    for name, _ in chunks[1:])
    anchor = '#pragma force_active on'
    txt = txt.replace(anchor, decls + anchor, 1)
    open(cpath, 'w', newline=nl).write(txt)
    print('patched %s' % cfile)


if __name__ == '__main__':
    main()
