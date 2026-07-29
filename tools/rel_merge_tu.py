"""Merge N adjacent .c files of mini_billiards into the FIRST one, preserving
.text order, and rewrite SOURCES.  Inverse of isolate.py.

usage: python merge.py src/a.c src/b.c [src/c.c ...]
The files must be consecutive in SOURCES (blob .s entries between them are
allowed and are left where they are only if they carry no .rodata; otherwise
they are moved to just after the merged file).
"""
import os
import re
import sys

REPO = 'C:/tmp/smbm/mini_billiards'
MARK = '# mkbe.rel_mini_billiards.rel sources'
os.chdir(REPO)


def read(p):
    return open(p, encoding='utf-8', newline='').read().replace('\r\n', '\n')


def write(p, s):
    open(p, 'w', encoding='utf-8', newline='\r\n').write(s)


def sources():
    L = read('Makefile').split('\n')
    h = next(i for i, l in enumerate(L) if l.strip() == MARK)
    s = h + 1
    e = next(i for i in range(s + 1, len(L)) if not L[i].rstrip().endswith('\\'))
    items = [L[i].rstrip().rstrip('\\').strip() for i in range(s + 1, e + 1)]
    return L, s, e, items


def write_sources(items):
    L, s, e, _ = sources()
    block = ['SOURCES := \\'] + \
            ['\t%s%s' % (it, ' \\' if i < len(items) - 1 else '')
             for i, it in enumerate(items)]
    L[s:e + 1] = block
    write('Makefile', '\n'.join(L))


files = sys.argv[1:]
_, _, _, items = sources()
idx = [items.index(f) for f in files]
assert idx == sorted(idx), 'files not in SOURCES order'

bodies = []
for f in files:
    t = read(f)
    o = t.index('#pragma force_active on\n')
    r = t.rindex('#pragma force_active reset\n')
    if not bodies:
        preamble = t[:o]
    bodies.append(t[o + len('#pragma force_active on\n'):r])

write(files[0], preamble + '#pragma force_active on\n' + ''.join(bodies) +
      '#pragma force_active reset\n')
for f in files[1:]:
    os.remove(f)
    o = f + '.o'
    if os.path.exists(o):
        os.remove(o)
items = [x for x in items if x not in files[1:]]
write_sources(items)
print('merged %s -> %s' % (', '.join(files[1:]), files[0]))
