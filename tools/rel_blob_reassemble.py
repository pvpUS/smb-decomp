"""Build a minimal throwaway tree for exercising rel_carve.py, and reassemble a
PRISTINE monolithic data blob for a module that is already carved.

rel_carve.pristine() refuses a carved module -- `asm/<mod>.s` is then only the
head segment and has no .data/.bss -- and its documented escape is "re-run
rel_rematch.py", which is a whole re-split.  For TESTING we can do better: the
segments are concatenated back in SOURCES order, per section.

*** THE RESULT IS NOT BYTE-PRISTINE, AND RUN 23 PROVED IT FOUR TIMES. ***

This file used to claim "the segments are a partition of the original blob, so
concatenating them reproduces the pristine blob exactly".  They are not a
partition: a carved hole's BYTES are gone from the blob entirely -- they now
live in the .rodata/.data of the C object that filled the hole.  Only the old
hand-written hole.py left `.if 0 ... .endif` reference copies, and this tool
strips those.  So every already-carved label comes back ZERO-SIZE.  Symptoms
four modules hit independently:

  mini_fight      blob 24 bytes short; 3 labels reduced to zero-size
  mini_golf       returns the blob MINUS every hole; rebuilt the real pristine
                  blob from git (36fe55d, run 3) and proved it with a
                  per-section difflib compare
  mini_billiards  the 3 carved 8-byte magics return as zero-byte labels
  test_mode       `--hole L:8` then dies with "asks for more bytes than the
                  label's run (0)"

TWO WAYS THROUGH, both verified with a GOLDEN build:

  1. `--hole LABEL:0` re-specifies an already-landed hole.  A bare `--hole`
     works too.  The segment is still cut in the right place and the zero-size
     alias is re-emitted.  (mini_bowling; mini_race used the bare form.)  This
     is the cheap route and it is enough to ADD a hole to a carved module --
     mini_race carved a second hole this way for +885 instructions.
  2. Reinsert each hole's bytes from the owning object's own section --
     `objdump -s -j .rodata src/x.c.o` IS the hole content, by definition.
     mini_fight's `mkpristine.py` does this and round-tripped to a GOLDEN
     build.  Use it when you need the true pristine bytes, not just the cuts.

Also note: running rel_carve inside a tree built by this script OVERWRITES that
tree's `asm/<mod>.s` with the carved head, so a second trial needs the blob
reassembled again (mini_bowling).

Nothing here writes to the real repo.  It only reads it.

  python mktesttree.py <module> <destdir>
"""
import os
import re
import shutil
import sys

# RUN 22: derive the repo from THIS FILE's location.  A hard-coded absolute
# path is the fifth-instance bug this toolbox keeps re-growing -- it returns
# a confident answer from the wrong tree.
MAIN = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SECTION = re.compile(r'\.section (\.\w+)')
GLOBAL = re.compile(r'^\.global (lbl_[0-9A-Fa-f]+)$')


def sources_items(mk, mod):
    L = open(mk, newline='').read().replace('\r\n', '\n').split('\n')
    hdrs = ['# mkbe.rel_%s.rel sources' % mod, '# mkbe.%s.rel sources' % mod]
    if mod.endswith('_rel'):
        hdrs.append('# mkbe.%s.rel sources' % mod[:-len('_rel')])
    h = next(i for i, l in enumerate(L) if l.strip() in hdrs)
    e = next(i for i in range(h + 2, len(L)) if not L[i].rstrip().endswith('\\'))
    return [L[i].rstrip().rstrip('\\').strip() for i in range(h + 2, e + 1)]


def read(p):
    return open(p, errors='replace').read().replace('\r\n', '\n').split('\n')


def split_sections(lines):
    idx = [(i, m.group(1)) for i, l in enumerate(lines)
           for m in [SECTION.match(l.strip())] if m]
    pre = lines[:idx[0][0]] if idx else lines
    secs, order = {}, []
    for k, (i, name) in enumerate(idx):
        end = idx[k + 1][0] if k + 1 < len(idx) else len(lines)
        secs.setdefault(name, [])
        secs[name] += lines[i + 1:end]
        if name not in order:
            order.append(name)
    return pre, secs, order


def reassemble(mod, dest):
    """Concatenate asm/<mod>.s and its _dN.s segments back into one blob."""
    items = sources_items(os.path.join(MAIN, 'Makefile'), mod)
    segs = [i for i in items if re.match(r'asm/%s(_d\w+)?\.s$' % mod, i)]
    if not segs:
        sys.exit('no data segments for %s in SOURCES' % mod)
    merged, order, pre = {}, [], None
    globals_seen = []
    for s in segs:
        lines = read(os.path.join(MAIN, s))
        p, secs, o = split_sections(lines)
        if pre is None:
            pre = [l for l in p if not GLOBAL.match(l.strip())]
        for g in p:
            m = GLOBAL.match(g.strip())
            if m and m.group(1) not in globals_seen:
                globals_seen.append(m.group(1))
        for name in o:
            if name not in order:
                order.append(name)
            merged.setdefault(name, [])
            merged[name] += secs[name]
    # Drop the `.balign 8` rel_carve itself writes at the head of each rodata
    # slice, and the `.if 0` reference copies a hole leaves behind: neither is
    # in the pristine blob.  Everything else is byte-for-byte original.
    #
    # RUN 23: the strip is `.rodata`-ONLY.  It used to run once per merged
    # section, so it also ate `.data`'s leading `.balign 8` -- which rel_split
    # wrote and the pristine blob really has.  mini_race caught it: the
    # reassembled blob silently lost that directive, and re-carving from it
    # would have shifted every .data address.  With this restriction the blob
    # re-carves to content-identical output and gates GOLDEN.
    out = list(pre)
    ins = next((i for i, l in enumerate(out)
                if l.strip().startswith('.include')), len(out) - 1) + 1
    out = out[:ins] + ['.global %s' % g for g in globals_seen] + out[ins:]
    for name in order:
        body, dead = [], 0
        for l in merged[name]:
            s = l.strip()
            if s.startswith('.if'):
                dead += 1
                continue
            if s.startswith('.endif'):
                dead = max(0, dead - 1)
                continue
            if dead:
                continue
            if s == '.balign 8' and not body and name == '.rodata':
                continue
            body.append(l)
        out += ['', '.section %s' % name] + body
    open(os.path.join(dest, 'asm', '%s.s' % mod), 'w', newline='\n').write(
        '\n'.join(out) + '\n')
    return segs


def main():
    mod, dest = sys.argv[1], sys.argv[2]
    mod = {'sel_ngc': 'sel_ngc_rel'}.get(mod, mod)
    if os.path.exists(dest):
        shutil.rmtree(dest)
    os.makedirs(os.path.join(dest, 'asm', 'nonmatchings', mod))
    os.makedirs(os.path.join(dest, 'src'))
    os.makedirs(os.path.join(dest, 'tools'))
    shutil.copy(os.path.join(MAIN, 'Makefile'), os.path.join(dest, 'Makefile'))
    n = 0
    srcdir = os.path.join(MAIN, 'asm', 'nonmatchings', mod)
    for f in os.listdir(srcdir):
        if f.endswith('.s'):
            shutil.copy(os.path.join(srcdir, f),
                        os.path.join(dest, 'asm', 'nonmatchings', mod, f))
            n += 1
    m = 0
    for f in os.listdir(os.path.join(MAIN, 'src')):
        if f.endswith('.c') and f.startswith(mod):
            shutil.copy(os.path.join(MAIN, 'src', f), os.path.join(dest, 'src', f))
            m += 1
    segs = reassemble(mod, dest)
    print('%s: test tree at %s -- %d nonmatchings .s, %d src .c, blob '
          'reassembled from %d segment(s): %s'
          % (mod, dest, n, m, len(segs), ' '.join(segs)))


if __name__ == '__main__':
    main()
