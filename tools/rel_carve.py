#!/usr/bin/env python3
"""Carve holes in a REL module's data blob so pure-C objects can supply their own
compiler-generated .rodata -- and the module still hashes to its golden sha1.

The problem
-----------
`rel_split.py` splits a module's .text per function but keeps ALL of its data in
one blob (`asm/<mod>.s`, listed LAST in SOURCES).  When a converted function
makes mwcc emit a constant of its own -- an int->float magic double
(0x4330000080000000), a float/double literal, a switch jump table -- those bytes
land ahead of the whole original blob instead of replacing the original ones.
The data layout shifts and the REL stops matching.  Historically that was worked
around by reading the existing pool instead (`*(f32 *)lbl_0000C3C8`), which the
magic double cannot be dodged with -- so those functions were unreachable.

The fix
-------
Split the data blob into several data-only objects with a HOLE where the
constant used to be, and order the owning .c object between them.  Three facts
make it work (all verified against mkbe.rel_mini_pilot.rel, golden cc2b2ef2...):

  * Data-only .s objects carry no .text, so they may sit anywhere in SOURCES;
    only their relative order matters, and that fixes .rodata order.
  * Labels that were local to the monolithic blob must be promoted to .global
    once they are referenced across the split, or elf2rel fails with
    "could not find symbol".  That -- not any layout rule -- is why splitting
    the blob was previously believed impossible.
  * A constant shared by several functions keeps its symbol as a ZERO-SIZE label
    at the end of the preceding segment.  It resolves to the hole's address, so
    functions still in asm keep linking while the C object supplies the bytes.

ORDERING RULE: objects contribute .rodata in SOURCES order and SOURCES follows
.text order, so a constant must be emitted by the .c file holding its FIRST user
in .text order.  Emitting it from a later file reorders the bytes -- same bytes,
wrong places, no match.  `--into` is checked against that and refuses by default.

Usage
-----
  # what can be carved, and who must own each constant
  python tools/rel_carve.py <module> --list

  # carve one constant, to be emitted by the .c file that owns it
  python tools/rel_carve.py <module> --hole lbl_0000C3C0 --into src/mini_pilot_27.c

  # a partial label (first N bytes of a run)
  python tools/rel_carve.py <module> --hole lbl_0000C3C8:8 --into src/mini_pilot_19.c

  # restore the monolithic blob and the plain SOURCES order
  python tools/rel_carve.py <module> --undo

Each run restores the pristine data blob from git first, so it is idempotent:
pass every hole you want on the one command line.  Run it AFTER rel_rematch.py
(which rewrites SOURCES with `asm/<mod>.s` last).
"""
import argparse
import glob
import os
import re
import subprocess
import sys

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
LABEL = re.compile(r'\blbl_[0-9A-Fa-f]+\b')
DEF = re.compile(r'^(lbl_[0-9A-Fa-f]+):')
GLOBAL = re.compile(r'^\.global (lbl_[0-9A-Fa-f]+)$')
INSN = re.compile(r'/\* [0-9A-Fa-f]{8} ')
SECTION = re.compile(r'\.section (\.\w+)')
ADDR = re.compile(r'^# 0x([0-9A-Fa-f]+)$')


# --------------------------------------------------------------------------- #
# reading the pristine blob                                                     #
# --------------------------------------------------------------------------- #

def pristine(mod, ref):
    """The module's data-only .s as committed (holes not yet applied)."""
    p = 'asm/%s.s' % mod
    try:
        out = subprocess.run(['git', 'show', '%s:%s' % (ref, p)], cwd=REPO,
                             capture_output=True, check=True).stdout
    except (subprocess.CalledProcessError, FileNotFoundError) as e:
        sys.exit('cannot read %s:%s from git (%s)' % (ref, p, e))
    return out.decode('utf-8', 'replace').replace('\r\n', '\n').split('\n')


def split_sections(lines):
    """-> (preamble, {section: [lines]}, section order)."""
    idx = []
    for i, l in enumerate(lines):
        m = SECTION.match(l.strip())
        if m:
            idx.append((i, m.group(1)))
    if not idx:
        sys.exit('no .section directives found in the data blob')
    pre = lines[:idx[0][0]]
    secs, order = {}, []
    for k, (i, name) in enumerate(idx):
        end = idx[k + 1][0] if k + 1 < len(idx) else len(lines)
        secs[name] = lines[i + 1:end]
        order.append(name)
    return pre, secs, order


def parse_rodata(body):
    """-> [(label|None, addr|None, [lines], nbytes)] in order."""
    ents, cur = [], None
    for l in body:
        s = l.strip()
        m = DEF.match(s)
        if m:
            cur = {'label': m.group(1), 'addr': None, 'lines': [l], 'bytes': 0}
            ents.append(cur)
            continue
        if cur is None:
            cur = {'label': None, 'addr': None, 'lines': [], 'bytes': 0}
            ents.append(cur)
        cur['lines'].append(l)
        m = ADDR.match(s)
        if m and cur['addr'] is None:
            cur['addr'] = int(m.group(1), 16)
            continue
        if s.startswith('.4byte'):
            cur['bytes'] += 4
        elif s.startswith('.2byte'):
            cur['bytes'] += 2
        elif s.startswith('.byte'):
            cur['bytes'] += 1
        elif s.startswith('.skip'):
            cur['bytes'] += int(s.split()[1], 0)
    return ents


# --------------------------------------------------------------------------- #
# ownership: which .c file may emit a given constant                            #
# --------------------------------------------------------------------------- #

def first_users(mod):
    """rodata label -> name of the first function (in .text order) that uses it."""
    funcs = []
    for b in glob.glob(os.path.join(REPO, 'asm', 'nonmatchings', mod, '*.s')):
        name = os.path.basename(b)[:-2]
        if name.startswith('lbl_'):
            funcs.append((int(name[4:], 16), name,
                          set(LABEL.findall(open(b, errors='ignore').read()))))
    funcs.sort()
    out = {}
    for _, name, refs in funcs:
        for r in refs:
            out.setdefault(r, name)
    return out


def defining_file(mod, func):
    """The src/<mod>*.c that defines `func` as C (not as an asm include)."""
    for p in sorted(glob.glob(os.path.join(REPO, 'src', '%s*.c' % mod))):
        txt = open(p, errors='ignore').read()
        if 'nonmatchings/%s/%s.s' % (mod, func) in txt:
            continue                                  # still an asm stub here
        # a definition, not a forward declaration: ')' followed by '{'
        if re.search(r'\b%s\s*\([^;()]*\)\s*\{' % re.escape(func), txt):
            return os.path.relpath(p, REPO).replace('\\', '/')
    return None


# --------------------------------------------------------------------------- #
# emitting the segments                                                         #
# --------------------------------------------------------------------------- #

def promote_globals(blocks, declared):
    """Return one .global set per block: symbols defined here, used elsewhere."""
    defs, refs = [], []
    for b in blocks:
        d, r = set(), set()
        for l in b:
            s = l.strip()
            if GLOBAL.match(s):
                continue
            m = DEF.match(s)
            if m:
                d.add(m.group(1))
            else:
                r |= set(LABEL.findall(s))
        defs.append(d)
        refs.append(r)
    out = []
    for i, d in enumerate(defs):
        elsewhere = set().union(*[refs[j] for j in range(len(refs)) if j != i]) \
            if len(refs) > 1 else set()
        out.append(sorted((d & elsewhere) | (d & declared)))
    return out


def write_segments(mod, pre, secs, order, segments, keep_labels):
    """segments = [[rodata lines], ...]; segment 0 gets .ctors/.dtors, last gets .data/.bss."""
    declared = {m.group(1) for l in pre for m in [GLOBAL.match(l.strip())] if m}
    pre_clean = [l for l in pre if not GLOBAL.match(l.strip())]

    bodies = []
    n = len(segments)
    for k, ro in enumerate(segments):
        body = []
        if k == 0:
            for s in order:
                if s in ('.ctors', '.dtors'):
                    body += ['.section %s' % s] + secs[s]
        body += ['', '.section .rodata', '.balign 8'] + ro
        if k == n - 1:
            for s in order:
                if s not in ('.ctors', '.dtors', '.rodata'):
                    body += ['', '.section %s' % s] + secs[s]
        bodies.append(body)

    gl = promote_globals(bodies, declared)
    paths = []
    for k, body in enumerate(bodies):
        if k == 0:
            head = pre_clean[:]
            ins = next((i for i, l in enumerate(head)
                        if l.strip().startswith('.include')), len(head) - 1) + 1
            head = head[:ins] + ['.global %s' % s for s in gl[k]] + head[ins:]
        else:
            head = ['# %s data segment %d -- rodata continuation after a carved hole'
                    % (mod, k), '.include "macros.inc"'] + \
                   ['.global %s' % s for s in gl[k]]
        name = 'asm/%s.s' % mod if k == 0 else 'asm/%s_d%d.s' % (mod, k)
        open(os.path.join(REPO, name), 'w', newline='\n').write(
            '\n'.join(head + body) + '\n')
        paths.append(name)
    if keep_labels:
        print('  kept alive as zero-size labels: %s' % ', '.join(sorted(keep_labels)))
    return paths


# --------------------------------------------------------------------------- #
# Makefile                                                                      #
# --------------------------------------------------------------------------- #

def sources_block(mod):
    mk = os.path.join(REPO, 'Makefile')
    L = open(mk, newline='').read().split('\n')
    h = next(i for i, l in enumerate(L)
             if l.strip() == '# mkbe.rel_%s.rel sources' % mod)
    s = h + 1
    e = next(i for i in range(s + 1, len(L)) if not L[i].rstrip().endswith('\\'))
    items = [L[i].rstrip().rstrip('\\').strip() for i in range(s + 1, e + 1)]
    return mk, L, s, e, items


def write_sources(mod, items):
    mk, L, s, e, _ = sources_block(mod)
    block = ['SOURCES := \\'] + \
            ['\t%s%s' % (it, ' \\' if i < len(items) - 1 else '')
             for i, it in enumerate(items)]
    L[s:e + 1] = block
    open(mk, 'w', newline='\n').write('\n'.join(L))


# --------------------------------------------------------------------------- #

def do_list(mod):
    ents = parse_rodata(split_sections(pristine(mod, 'HEAD'))[1]['.rodata'])
    fu = first_users(mod)
    print('%s: %d rodata entries\n' % (mod, len([e for e in ents if e['label']])))
    print('%-20s %-10s %6s  %-18s %s' % ('label', 'addr', 'bytes', 'first user', 'owning .c (if C)'))
    for e in ents:
        if not e['label']:
            continue
        u = fu.get(e['label'])
        f = defining_file(mod, u) if u else None
        magic = ' MAGIC' if any('0x43300000' in l for l in e['lines'][:3]) else ''
        print('%-20s 0x%-8X %6d  %-18s %s%s'
              % (e['label'], e['addr'] or 0, e['bytes'], u or '-', f or '-', magic))


def main():
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument('module')
    ap.add_argument('--hole', action='append', default=[],
                    metavar='LABEL[:BYTES]',
                    help='rodata to carve out; BYTES trims to a prefix of the label')
    ap.add_argument('--hole-range', action='append', default=[], dest='hole_range',
                    metavar='FIRST:LAST',
                    help='carve a whole TU constant pool (all labels FIRST..LAST) as '
                         'one hole -- the normal case when a complete TU becomes one '
                         '.c file, since mwcc regenerates the pool itself')
    ap.add_argument('--into', action='append', default=[], metavar='SRC',
                    help='the .c file that emits the matching hole; give all --hole '
                         '--into pairs first, then all --hole-range --into pairs')
    ap.add_argument('--undo', action='store_true',
                    help='restore the monolithic blob and plain SOURCES order')
    ap.add_argument('--list', action='store_true',
                    help='show carvable constants and their required owner')
    ap.add_argument('--from', dest='ref', default='HEAD',
                    help='git ref to read the pristine blob from (default HEAD)')
    ap.add_argument('--force', action='store_true',
                    help='carve even if --into is not the first-use owner')
    a = ap.parse_args()
    mod = a.module

    if a.list:
        return do_list(mod)

    lines = pristine(mod, a.ref)
    pre, secs, order = split_sections(lines)

    # drop any previously written segments and normalise SOURCES
    for p in glob.glob(os.path.join(REPO, 'asm', '%s_d*.s' % mod)):
        os.remove(p)
    _, _, _, _, items = sources_block(mod)
    items = [i for i in items if not re.match(r'asm/%s_d\d+\.s$' % mod, i)]
    items = [i for i in items if i != 'asm/%s.s' % mod] + ['asm/%s.s' % mod]

    if a.undo:
        open(os.path.join(REPO, 'asm', '%s.s' % mod), 'w', newline='\n').write(
            '\n'.join(lines))
        write_sources(mod, items)
        print('%s: restored monolithic data blob and plain SOURCES order' % mod)
        return

    if len(a.hole) + len(a.hole_range) != len(a.into):
        sys.exit('each --hole/--hole-range needs exactly one --into')
    if not a.hole and not a.hole_range:
        sys.exit('nothing to do: pass --hole or --hole-range with --into, --list or --undo')

    ents = parse_rodata(secs['.rodata'])
    by_label = {e['label']: i for i, e in enumerate(ents) if e['label']}
    fu = first_users(mod)

    holes = []
    for spec, dest in zip(a.hole, a.into):
        lbl, _, nb = spec.partition(':')
        if lbl not in by_label:
            sys.exit('%s is not a .rodata label of %s' % (lbl, mod))
        i = by_label[lbl]
        want = int(nb) if nb else None
        owner = fu.get(lbl)
        expect = defining_file(mod, owner) if owner else None
        dest = dest.replace('\\', '/')
        if expect and expect != dest and not a.force:
            sys.exit('ordering rule: %s is first used by %s, which is already C in '
                     '%s -- not %s.\n  .rodata follows SOURCES order, so the earlier '
                     'object must emit it. Use --into %s, or --force.'
                     % (lbl, owner, expect, dest, expect))
        if expect is None and owner and defining_file(mod, owner) is None:
            print('  note: %s is first used by %s, which is still asm. Emitting it '
                  'from %s is fine while no earlier object emits .rodata, but '
                  'converting %s later may force a re-carve.'
                  % (lbl, owner, dest, owner))
        holes.append({'idx': i, 'end': i, 'label': lbl, 'bytes': want, 'into': dest})

    # --hole-range FIRST:LAST -- carve a whole TU pool (several labels) as one hole
    for spec, dest in zip(a.hole_range, a.into[len(a.hole):]):
        first, _, last = spec.partition(':')
        for x in (first, last):
            if x not in by_label:
                sys.exit('%s is not a .rodata label of %s' % (x, mod))
        i, j = by_label[first], by_label[last]
        if j < i:
            sys.exit('--hole-range %s: %s comes before %s in .rodata' % (spec, last, first))
        holes.append({'idx': i, 'end': j, 'label': first, 'bytes': None,
                      'into': dest.replace('\\', '/')})

    holes.sort(key=lambda h: h['idx'])
    for x, y in zip(holes, holes[1:]):
        if y['idx'] <= x['end']:
            sys.exit('holes overlap: %s and %s' % (x['label'], y['label']))
    if len({h['into'] for h in holes}) != len(holes):
        sys.exit('two holes owned by the same .c file are only valid if they are '
                 'adjacent in .rodata -- merge them into one --hole with :BYTES')

    # build segments, splitting entries when only a prefix is carved
    segments, keep, cursor = [], set(), 0
    for h in holes:
        i = h['idx']
        seg = []
        for e in ents[cursor:i]:
            seg += e['lines']
        ent = ents[i]
        # capture the labels being carved away BEFORE a prefix-carve rewrites
        # ents[i] into its remainder -- otherwise the original label vanishes
        # and never gets its zero-size alias.
        carved = [e['label'] for e in ents[i:h['end'] + 1] if e['label']]
        if h['bytes'] is not None and h['bytes'] < ent['bytes']:
            # carve a prefix: keep the remainder, re-labelled at the new address
            kept, used = [], 0
            for l in ent['lines']:
                s = l.strip()
                if DEF.match(s) or ADDR.match(s):
                    continue
                w = 4 if s.startswith('.4byte') else 2 if s.startswith('.2byte') \
                    else 1 if s.startswith('.byte') else 0
                if used < h['bytes']:
                    used += w
                    continue
                kept.append(l)
            tail_addr = (ent['addr'] or 0) + h['bytes']
            ents[i] = {'label': 'lbl_%08X' % tail_addr, 'addr': tail_addr,
                       'lines': ['lbl_%08X:' % tail_addr] + kept, 'bytes': 0}
            cursor = i                       # remainder starts the next segment
        else:
            cursor = h['end'] + 1            # whole label(s) carved away
        # any carved-away symbol still referenced by asm that stays as asm?
        asm = '\n'.join(open(b, errors='ignore').read()
                        for b in glob.glob(os.path.join(REPO, 'asm',
                                                        'nonmatchings', mod, '*.s')))
        aliases = [lb for lb in carved if lb in asm]
        if len(aliases) > 1:
            sys.exit('%s..%s: %d carved labels are still referenced by asm (%s).\n'
                     '  Only ONE can be kept as a zero-size alias at the hole start; '
                     'the rest had distinct addresses.\n  Convert those callers to C '
                     'too, or carve a narrower range.'
                     % (ents[i]['label'], ents[h['end']]['label'],
                        len(aliases), ', '.join(aliases)))
        for lb in aliases:
            seg.append('%s:' % lb)                    # zero-size alias at the hole
            keep.add(lb)
        segments.append(seg)
    tail = []
    for e in ents[cursor:]:
        tail += e['lines']
    segments.append(tail)

    # Work out the SOURCES interleave BEFORE writing anything, so a rejected
    # request leaves the tree untouched rather than half-carved.
    paths = ['asm/%s.s' % mod] + \
            ['asm/%s_d%d.s' % (mod, k) for k in range(1, len(segments))]
    src = [i for i in items if not i.startswith('asm/')]
    out, pos = [paths[0]], 0
    for k, h in enumerate(holes):
        if h['into'] not in src:
            sys.exit('%s is not in the %s SOURCES list' % (h['into'], mod))
        j = src.index(h['into'])
        if j < pos:
            sys.exit('holes are not in .text order: %s owns a later .rodata hole '
                     'but sits earlier in SOURCES.\n  .rodata follows SOURCES '
                     'order, so holes must be carved in the same order as their '
                     'owning objects.' % h['into'])
        out += src[pos:j + 1]
        if k + 1 < len(paths) - 1:          # intermediate segment; last one goes at the end
            out.append(paths[k + 1])
        pos = j + 1
    out += src[pos:]
    out.append(paths[-1])                   # final segment carries .data/.bss

    written = write_segments(mod, pre, secs, order, segments, keep)
    assert written == paths, (written, paths)
    write_sources(mod, out)

    print('%s: carved %d hole(s); %d data objects' % (mod, len(holes), len(paths)))
    for k, h in enumerate(holes):
        print('  %s (%s bytes) -> emitted by %s'
              % (h['label'], h['bytes'] if h['bytes'] is not None else 'all', h['into']))
    print('Now make the C in those files use real literals / int->float casts, '
          'rebuild, and gate on the golden sha1.')


if __name__ == '__main__':
    main()
