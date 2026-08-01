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

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

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


# --- run-12 head union + prototype reconciliation -------------------------
# rel_merge_tu used to keep only files[0]'s head, silently dropping every
# per-file `//@SUB` retype, local struct, `static` forward declaration and
# retyped `extern` the absorbed files carried.  Symptom: `redeclared` plus an
# `undefined identifier` cascade.  See _scratch_sel_ngc/run11/{fixprotos,
# headdiff,patchhead}.py for the hand-rolled versions this replaces.

_DECL_NAME = re.compile(r'\b([A-Za-z_][A-Za-z0-9_]*)\s*[\(\[]')
_IDENT = re.compile(r'\b[A-Za-z_][A-Za-z0-9_]*\b')


def split_items(text):
    """Split a head into top-level items, keeping brace blocks whole."""
    out, cur, depth = [], [], 0
    for ln in text.split('\n'):
        cur.append(ln)
        depth += ln.count('{') - ln.count('}')
        if depth <= 0:
            depth = 0
            out.append('\n'.join(cur))
            cur = []
    if cur:
        out.append('\n'.join(cur))
    return out


def decl_key(item):
    """The identifier a one-statement declaration declares, else None."""
    s = item.strip()
    if (not s or s.startswith('//') or s.startswith('/*') or s.startswith('*')
            or s.startswith('#') or '{' in s or not s.endswith(';')):
        return None
    m = _DECL_NAME.search(s)
    if m:
        return m.group(1)
    ids = _IDENT.findall(s)
    return ids[-1] if ids else None


def specificity(item):
    """How much a declaration says.  Used to break collisions: an absorbed
    head's GENERATED `void lbl_XXXXXXXX(void);` must never overwrite a retyped
    one the base head already carries (which is what happens when the base is
    itself a previously merged file)."""
    s = ' '.join(item.strip().split())
    n = 0
    if not re.match(r'^(extern\s+)?void\b', s):
        n += 2                                   # non-void return type
    m = re.search(r'\(([^)]*)\)', s)
    if m and m.group(1).strip() not in ('', 'void'):
        n += 1                                   # real parameter list
    return n


def merge_heads(heads, files):
    """Union of every file's head: base head first, then whatever the absorbed
    heads add, in source order.  A collision on the declared identifier keeps
    whichever declaration says MORE (see specificity)."""
    base = split_items(heads[0])
    keys = {}
    for i, it in enumerate(base):
        k = decl_key(it)
        if k:
            keys[k] = i
    seen = set(it.strip() for it in base)
    extra, extra_keys, notes = [], {}, []
    for h, f in zip(heads[1:], files[1:]):
        for it in split_items(h):
            s = it.strip()
            if (not s or s.startswith('//') or s.startswith('/*')
                    or s.startswith('*') or s.startswith('#') or s in seen):
                continue
            k = decl_key(it)
            if k is not None and k in extra_keys:
                cur = extra[extra_keys[k]]
                if cur.strip() != s and specificity(it) > specificity(cur):
                    notes.append('%s and an earlier absorbed head declare %r '
                                 'differently -- kept %s\'s' % (f, k, f))
                    extra[extra_keys[k]] = it
                    seen.add(s)
                continue
            if k is not None and k in keys and base[keys[k]] is not None:
                if specificity(it) <= specificity(base[keys[k]]):
                    continue      # base already says at least as much
                notes.append('%r: %s retypes it; dropped the base head\'s '
                             'weaker declaration' % (k, f))
                base[keys[k]] = None
            if k is not None:
                extra_keys[k] = len(extra)
            else:
                notes.append('%s: carried over a definition the base head '
                             'lacked (%s)' % (f, s.split('\n')[0][:60]))
            extra.append(it)
            seen.add(s)
    out = '\n'.join(x for x in base if x is not None)
    if extra:
        out = out.rstrip('\n') + \
            '\n\n// Carried over from the heads of the absorbed files (merged by\n' \
            '// tools/rel_merge_tu.py -- these are what the tool used to drop).\n' + \
            '\n'.join(extra).strip('\n') + '\n\n'
    return out, notes


_DEFN = re.compile(
    r'^[ \t]*((?:static[ \t]+)?(?:asm[ \t]+)?[A-Za-z_][A-Za-z0-9_ \t\*]*?'
    r'\b(lbl_[0-9A-F]{8})[ \t]*\(([^;{]*?)\))[ \t]*\r?\n?[ \t]*\{',
    re.M)


def fix_protos(text):
    """Rewrite each prototype in the head to the definition's own declarator.

    Same rule as tools/rel_genvar.py.  A `static` definition with no prototype
    gets one appended -- the run-11 `static void lbl_0000C518(void);` case."""
    i = text.index('#pragma force_active on')
    head, body, notes = text[:i], text[i:], []
    add = []
    for m in _DEFN.finditer(body):
        decl, name = m.group(1), m.group(2)
        decl = re.sub(r'\basm[ \t]+', '', decl).strip()
        new = decl + ';'
        proto = re.compile(
            r'^[ \t]*(?:static[ \t]+)?[A-Za-z_][A-Za-z0-9_ \t\*]*?\b%s'
            r'[ \t]*\([^;]*\);[ \t]*$' % name, re.M)
        mo = proto.search(head)
        if not mo:
            if decl.startswith('static') and new not in add:
                add.append(new)
                notes.append('added missing prototype %s' % new)
            continue
        if mo.group(0).strip() == new:
            continue
        notes.append('%s -> %s' % (mo.group(0).strip(), new))
        head = head[:mo.start()] + new + head[mo.end():]
    if add:
        head = head.rstrip('\n') + '\n\n' + '\n'.join(add) + '\n\n'
    return head + body, notes


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('module', choices=sorted(MODULES))
    ap.add_argument('files', nargs='+', help='repo-relative, in SOURCES order')
    ap.add_argument('--tree', help='defaults to the tree containing THIS tools/ dir')
    a = ap.parse_args()

    stem = MODULES[a.module]
    # Resolve from THIS FILE, not a hard-coded warm-copy path -- the same defect
    # rel_sweep and rel_probe carried until run 12, where it had agents silently
    # driving another tree.  Every tree carries its own tools/.
    tree = a.tree or REPO
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

    bodies, heads = [], []
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
        heads.append(t[:o])
        bodies.append(t[o + len('#pragma force_active on\n'):r])

    preamble, notes = merge_heads(heads, files)
    for n in notes:
        print('  head: %s' % n)
    merged = preamble + '#pragma force_active on\n' + ''.join(bodies) + \
        '#pragma force_active reset\n'
    merged, pnotes = fix_protos(merged)
    for n in pnotes:
        print('  proto: %s' % n)
    write(files[0], merged)
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
