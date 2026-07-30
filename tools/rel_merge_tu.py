"""Merge N adjacent .c files of one REL module into the FIRST one, preserving
.text order, and rewrite SOURCES.  Inverse of rel_isolate.py.

usage:
  python tools/rel_merge_tu.py <module> src/a.c src/b.c [src/c.c ...]
  python tools/rel_merge_tu.py <module> --tree C:/tmp/smbm/<module> src/a.c ...

The files must be consecutive in SOURCES (blob .s entries between them are
allowed and are left where they are only if they carry no .rodata; otherwise
they are moved to just after the merged file).

RUN 10 -- this was HARD-CODED to mini_billiards (`os.chdir('C:/tmp/smbm/
mini_billiards')` at import, plus a literal SOURCES header).  Run it from any
other module's tree and it silently rewrote MINI_BILLIARDS' Makefile and
DELETED mini_billiards' src files, while reporting success about the paths you
named.  Same class as run 9's rel_xref_spine.py finding, and worse, because it
writes.  Reported by sel_ngc, which hit the wall and wrote its merge by hand.

Merging is how a function reaches a constant it cannot own: `.rodata` follows
SOURCES order and each magic double is emitted by exactly one object, so a
blocked function becomes reachable by living in the owner's TU.  That requires
.text contiguity with the owner -- which is what this tool arranges.  Note that
every already-C function in the absorbing TU comes under the mixed-TU deopt if
any asm sibling joins it, so gate after every merge.
"""
import argparse
import os
import re
import sys

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


def read(p):
    return open(p, encoding='utf-8', newline='').read().replace('\r\n', '\n')


def write(p, s):
    # Converted files must be written CRLF to match the tree, or an installed
    # winner shows up as a whole-file diff.
    open(p, 'w', encoding='utf-8', newline='\r\n').write(s)


def sources_header(mod):
    """The three spellings a module's SOURCES header can take.

    mini_bowling -> '# mkbe.rel_mini_bowling.rel sources'
    test_mode    -> '# mkbe.test_mode.rel sources'
    sel_ngc_rel  -> '# mkbe.sel_ngc.rel sources'   (the stem drops its _rel)
    """
    out = ['# mkbe.rel_%s.rel sources' % mod, '# mkbe.%s.rel sources' % mod]
    if mod.endswith('_rel'):
        out.append('# mkbe.%s.rel sources' % mod[:-len('_rel')])
    return out


def sources(mod):
    L = read('Makefile').split('\n')
    hdrs = sources_header(mod)
    h = next((i for i, l in enumerate(L) if l.strip() in hdrs), None)
    if h is None:
        sys.exit('no SOURCES header for %r; looked for: %s'
                 % (mod, ', '.join(repr(x) for x in hdrs)))
    s = h + 1
    e = next(i for i in range(s + 1, len(L)) if not L[i].rstrip().endswith('\\'))
    items = [L[i].rstrip().rstrip('\\').strip() for i in range(s + 1, e + 1)]
    return L, s, e, items


def write_sources(mod, items):
    L, s, e, _ = sources(mod)
    block = ['SOURCES := \\'] + \
            ['\t%s%s' % (it, ' \\' if i < len(items) - 1 else '')
             for i, it in enumerate(items)]
    L[s:e + 1] = block
    write('Makefile', '\n'.join(L))


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('module', choices=sorted(MODULES))
    ap.add_argument('files', nargs='+', help='repo-relative, in SOURCES order')
    ap.add_argument('--tree', help='defaults to C:/tmp/smbm/<module>')
    a = ap.parse_args()

    stem = MODULES[a.module]
    tree = a.tree or 'C:/tmp/smbm/%s' % a.module
    if not os.path.exists(os.path.join(tree, 'Makefile')):
        sys.exit('no Makefile in %s -- pass --tree' % tree)
    os.chdir(tree)

    files = [f.replace('\\', '/') for f in a.files]
    # Refuse to touch a file that is not this module's.  The hard-coded version
    # would happily merge whatever you named, in the wrong tree.
    bad = [f for f in files
           if not os.path.basename(f).startswith(stem)]
    if bad:
        sys.exit('not %s files: %s\n  (module stem is %r -- sel_ngc\'s dir, '
                 'stem and target all differ)' % (a.module, ', '.join(bad), stem))
    missing = [f for f in files if not os.path.exists(f)]
    if missing:
        sys.exit('no such file in %s: %s' % (tree, ', '.join(missing)))

    _, _, _, items = sources(stem)
    try:
        idx = [items.index(f) for f in files]
    except ValueError as e:
        sys.exit('not in the %s SOURCES list: %s' % (a.module, e))
    if idx != sorted(idx):
        sys.exit('files are not in SOURCES order: %s\n  .text follows SOURCES, '
                 'so merging out of order would move code.' % idx)

    bodies, preamble = [], None
    for f in files:
        t = read(f)
        if '#include "../asm/nonmatchings/' in t:
            print('note: %s still holds an asm stub -- every already-C function '
                  'in the merged TU comes under the mixed-TU deopt. Gate after '
                  'this.' % f)
        try:
            o = t.index('#pragma force_active on\n')
            r = t.rindex('#pragma force_active reset\n')
        except ValueError:
            sys.exit('%s has no #pragma force_active on/reset pair -- this tool '
                     'merges rel_split-shaped files only.' % f)
        if not bodies:
            preamble = t[:o]
        bodies.append(t[o + len('#pragma force_active on\n'):r])

    write(files[0], preamble + '#pragma force_active on\n' + ''.join(bodies) +
          '#pragma force_active reset\n')
    for f in files[1:]:
        os.remove(f)
        if os.path.exists(f + '.o'):
            os.remove(f + '.o')
    if os.path.exists(files[0] + '.o'):
        os.remove(files[0] + '.o')
    write_sources(stem, [x for x in items if x not in files[1:]])
    print('merged %s -> %s  (in %s)'
          % (', '.join(files[1:]), files[0], tree))
    print('Gate it: python tools/rel_sweep.py %s --gate' % a.module)
    return 0


if __name__ == '__main__':
    sys.exit(main())
