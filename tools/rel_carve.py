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

.data (RUN 22)
--------------
Until run 22 this tool split `.rodata` ONLY and dumped `.data`/`.bss` wholesale
into the last segment.  That was a limitation of THIS FILE, not of the build --
and run 8 read it as proof that sel_ngc's six `.section .data` switch jump
tables were "not source-reachable", retiring 8,824 instructions on it.  Run 21
disproved that with a hand-built carve that gated GOLDEN.  Three facts, each
build-verified there:

  * mwcc emits a C `switch` jump table into .data, after that TU's own
    initialised file-scope globals.  A jump table IS source-expressible.
  * A data-only segment (zero .text, and in that case zero .rodata too)
    relocates freely, exactly like a rodata-only one.
  * ** A mwcc object's .data has alignment 2**3, so a .data hole must start
    8-ALIGNED. **  sel_ngc's table at .data 0x469C (4 mod 8) built NOT GOLDEN;
    moving the boundary 4 bytes earlier to 0x4698 -- the preceding "%3s\0"
    literal becoming `char lbl_00016818[] = "%3s";` in the C file -- built
    GOLDEN.  `--data-hole` REFUSES a misaligned start and prints that remedy.

Usage
-----
  # what can be carved, and who must own each constant
  python tools/rel_carve.py <module> --list

  # carve one constant, to be emitted by the .c file that owns it
  python tools/rel_carve.py <module> --hole lbl_0000C3C0 --into src/mini_pilot_27.c

  # a partial label (first N bytes of a run)
  python tools/rel_carve.py <module> --hole lbl_0000C3C8:8 --into src/mini_pilot_19.c

  # a .data hole -- a switch jump table the owning C file will re-emit
  python tools/rel_carve.py <module> --data-hole lbl_0001681C --into src/sel_ngc_rel_29.c

  # restore the monolithic blob and the plain SOURCES order
  python tools/rel_carve.py <module> --undo

--into is positional against the hole flags, in this order: every --hole, then
every --hole-range, then every --data-hole, then every --data-range.  The
resolved pairing is PRINTED before anything is written -- read it.

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
    """The module's data-only .s as committed (holes not yet applied).

    ``--from worktree`` reads the CURRENT ``asm/<mod>.s`` instead of git.  Needed
    once a module has been committed in its carved state: then HEAD's
    ``asm/<mod>.s`` is itself the truncated head segment (the rest lives in
    ``asm/<mod>_dN.s``), and re-carving it silently drops .data/.bss.  After
    ``rel_rematch.py`` re-splits, the working tree holds a complete, freshly
    generated blob -- carve that.
    """
    p = 'asm/%s.s' % mod
    if ref.lower() == 'worktree':
        with open(os.path.join(REPO, p), errors='replace') as f:
            lines = f.read().replace('\r\n', '\n').split('\n')
    else:
        try:
            out = subprocess.run(['git', 'show', '%s:%s' % (ref, p)], cwd=REPO,
                                 capture_output=True, check=True).stdout
        except (subprocess.CalledProcessError, FileNotFoundError) as e:
            sys.exit('cannot read %s:%s from git (%s)' % (ref, p, e))
        lines = out.decode('utf-8', 'replace').replace('\r\n', '\n').split('\n')
    have = {l.strip().split()[1] for l in lines
            if l.strip().startswith('.section ') and len(l.strip().split()) > 1}
    if '.data' not in have or '.bss' not in have:
        sys.exit('%s blob for %s is missing %s -- it is already carved.  Re-run '
                 'tools/rel_rematch.py to regenerate a complete blob and carve '
                 'it with --from worktree.'
                 % (ref, mod, ' and '.join(sorted({'.data', '.bss'} - have))))
    return lines


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


def entry_width(s, addr, used):
    """Bytes one directive line emits, `used` bytes into an entry at `addr`.

    ONE implementation, used both to size an entry and to split one -- a second
    copy is how a prefix carve starts disagreeing with the address arithmetic.
    Verified exactly: over all 46 data blobs in the tree, addr(e) + width(e)
    == addr(next e) for all 2,199 consecutive labelled entries.
    """
    if not s:
        return 0
    d = s.split()[0]
    # These take an OPERAND LIST -- `.byte 0x03, 0x00, 0x00` is three bytes, not
    # one.  Counting it as one put option_d2.s's .data out by 2 from
    # lbl_0000C6A5 onwards; it was the single mismatch in the 2,199 checks.
    w = {'.4byte': 4, '.2byte': 2, '.byte': 1}.get(d)
    if w:
        rest = s.split(None, 1)
        return w * (rest[1].count(',') + 1 if len(rest) > 1 else 1)
    if d == '.skip':
        return int(s.split()[1], 0)
    if d == '.asciz':
        # .data carries strings; .rodata in this tree essentially does not.
        # Count the NUL, and count a backslash escape as one byte.
        lit = s[len('.asciz'):].strip()
        if len(lit) >= 2 and lit[0] == '"' and lit[-1] == '"':
            inner, n, i = lit[1:-1], 1, 0
            while i < len(inner):
                n += 1
                i += 2 if inner[i] == '\\' else 1
            return n
        return 0
    if d == '.balign':
        k = int(s.split()[1], 0)
        # only meaningful once we know where we are
        return -(addr + used) % k if (addr is not None and k) else 0
    return 0


def parse_entries(body):
    """-> [{label|None, addr|None, lines, bytes}] in order.

    Section-agnostic: run 22 uses it for `.data` as well as `.rodata`.
    """
    ents, cur, dead = [], None, 0
    for l in body:
        s = l.strip()
        # `.if 0 ... .endif` wraps a label a carve has already emptied (the
        # zero-size alias case, and hole.py's "kept for reference").  Its bytes
        # are NOT in the image, so counting them puts every later address out --
        # and a label inside it must not start an entry of its own.
        if s.startswith('.if'):
            dead += 1
            if cur is not None:
                cur['lines'].append(l)
            continue
        if s.startswith('.endif'):
            dead = max(0, dead - 1)
            if cur is not None:
                cur['lines'].append(l)
            continue
        if dead:
            if cur is not None:
                cur['lines'].append(l)
            continue
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
        cur['bytes'] += entry_width(s, cur['addr'], cur['bytes'])
    return ents


parse_rodata = parse_entries          # pre-run-22 name, kept for callers


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
    """segments = [{section: [lines]}, ...], one dict per output object.

    Segment 0 additionally gets .ctors/.dtors; the LAST segment gets every
    section that was not carved at all (.data and .bss when there is no
    --data-hole, .sdata, ...).

    A section that IS carved appears only in the segments its own slices were
    assigned to, so an object may legitimately carry .data and no .rodata --
    that is exactly the shape sel_ngc's verified .data carve produced.

    `.rodata` is emitted unconditionally, even when its slice is empty, so that
    a carve with no --data-hole is byte-identical to what every landed carve in
    the tree was generated with.  Other sections are skipped when empty.
    """
    declared = {m.group(1) for l in pre for m in [GLOBAL.match(l.strip())] if m}
    pre_clean = [l for l in pre if not GLOBAL.match(l.strip())]

    # `.rodata` is ALWAYS sliced, even when nothing carved it, because the head
    # segment is FIRST in SOURCES and that is what keeps every converted C
    # object's own .rodata behind the original blob's.  Letting it fall through
    # to the "uncarved sections go last" rule below would put the whole blob's
    # .rodata AFTER every C object -- a silent, total layout inversion.  Every
    # other section keeps its pre-run-22 home in the last segment unless a
    # --data-hole explicitly slices it.
    carved = sorted({s for seg in segments for s in seg} | {'.rodata'})
    bodies = []
    n = len(segments)
    for k, seg in enumerate(segments):
        body = []
        if k == 0:
            for s in order:
                if s in ('.ctors', '.dtors'):
                    body += ['.section %s' % s] + secs[s]
        for s in order:
            if s not in carved:
                continue
            lines = seg.get(s, [])
            if s == '.rodata':
                body += ['', '.section .rodata', '.balign 8'] + lines
            elif lines:
                body += ['', '.section %s' % s] + lines
        if k == n - 1:
            for s in order:
                if s not in ('.ctors', '.dtors') and s not in carved:
                    body += ['', '.section %s' % s] + secs[s]
        if not [l for l in body if l.strip()]:
            sys.exit('segment %d would be an EMPTY object -- two holes are '
                     'adjacent with nothing between them.  Merge them into one '
                     'hole.' % k)
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
            what = ', '.join(s for s in order
                             if s in segments[k] and segments[k][s]) or 'rodata'
            head = ['# %s data segment %d -- %s continuation after a carved hole'
                    % (mod, k, what.replace('.', '')), '.include "macros.inc"'] + \
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
    # Three Makefile spellings exist (rel_rematch.py carries the same list):
    #   mini_bowling -> # mkbe.rel_mini_bowling.rel sources
    #   test_mode    -> # mkbe.test_mode.rel sources
    #   sel_ngc_rel  -> # mkbe.sel_ngc.rel sources   (stem drops its _rel)
    hdrs = ['# mkbe.rel_%s.rel sources' % mod, '# mkbe.%s.rel sources' % mod]
    if mod.endswith('_rel'):
        hdrs.append('# mkbe.%s.rel sources' % mod[:-len('_rel')])
    h = next((i for i, l in enumerate(L) if l.strip() in hdrs), None)
    if h is None:
        sys.exit('rel_carve: no Makefile SOURCES header found for %r\n'
                 '  looked for: %s' % (mod, ', '.join(repr(x) for x in hdrs)))
    s = h + 1
    e = next(i for i in range(s + 1, len(L)) if not L[i].rstrip().endswith('\\'))
    items = [L[i].rstrip().rstrip('\\').strip() for i in range(s + 1, e + 1)]
    return mk, L, s, e, items


def write_sources(mod, items):
    mk, L, s, e, _ = sources_block(mod)
    # RUN 17 -- the tree's Makefile is natively CRLF, and sources_block() reads
    # it with newline='' so every element of L keeps its trailing '\r'.  The
    # rebuilt block below is built from STRIPPED items, so without this it goes
    # back as bare LF and the module's whole block changes line ending: test_mode
    # measured 1435 CRLF -> 1303 CRLF + 132 LF on an 8-byte carve, and had to
    # normalise it by hand before the merge.  Content was identical either way,
    # which is exactly why it is easy to ship.
    cr = '\r' if any(l.endswith('\r') for l in L) else ''
    block = ['SOURCES := \\' + cr] + \
            ['\t%s%s%s' % (it, ' \\' if i < len(items) - 1 else '', cr)
             for i, it in enumerate(items)]
    L[s:e + 1] = block
    open(mk, 'w', newline='\n').write('\n'.join(L))


# --------------------------------------------------------------------------- #

def do_list(mod, ref='HEAD'):
    secs = split_sections(pristine(mod, ref))[1]
    fu = first_users(mod)
    for sec in ('.rodata', '.data'):
        if sec not in secs:
            continue
        ents = parse_entries(secs[sec])
        print('\n%s: %d %s entries\n'
              % (mod, len([e for e in ents if e['label']]), sec.lstrip('.')))
        print('%-20s %-10s %6s  %-18s %s'
              % ('label', 'addr', 'bytes', 'first user', 'owning .c (if C)'))
        for e in ents:
            if not e['label']:
                continue
            u = fu.get(e['label'])
            f = defining_file(mod, u) if u else None
            note = ''
            if sec == '.rodata' and any('0x43300000' in l for l in e['lines'][:3]):
                note = ' MAGIC'
            if sec == '.data':
                # A jump table is a run of `.4byte _prolog + 0x...` relocations.
                if sum(1 for l in e['lines'] if '_prolog +' in l) >= 3:
                    note += ' JUMPTBL'
                # The 8-alignment rule is the whole difference between GOLDEN and
                # not, so surface it here rather than only at carve time.
                if e['addr'] is not None and e['addr'] % 8:
                    note += ' NOT-8-ALIGNED'
            print('%-20s 0x%-8X %6d  %-18s %s%s'
                  % (e['label'], e['addr'] or 0, e['bytes'], u or '-', f or '-', note))


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
    ap.add_argument('--data-hole', action='append', default=[], dest='data_hole',
                    metavar='LABEL[:BYTES]',
                    help='.data to carve out -- normally a switch jump table the '
                         'owning C file re-emits. The hole START must be 8-ALIGNED '
                         '(a mwcc object .data has alignment 2**3); a misaligned '
                         'start is extended BACKWARDS and the absorbed bytes are '
                         'printed for you to write into the .c file')
    ap.add_argument('--data-range', action='append', default=[], dest='data_range',
                    metavar='FIRST:LAST',
                    help='carve a run of .data labels as one hole')
    ap.add_argument('--into', action='append', default=[], metavar='SRC',
                    help='the .c file that emits the matching hole; --into is '
                         'positional against the hole flags, in the order --hole, '
                         '--hole-range, --data-hole, --data-range. The resolved '
                         'pairing is printed before anything is written')
    ap.add_argument('--undo', action='store_true',
                    help='restore the monolithic blob and plain SOURCES order')
    ap.add_argument('--list', action='store_true',
                    help='show carvable constants and their required owner')
    ap.add_argument('--from', dest='ref', default='HEAD',
                    help="git ref to read the pristine blob from (default HEAD); "
                         "'worktree' reads the current asm/<mod>.s -- use that after "
                         "rel_rematch.py when HEAD is already committed carved")
    ap.add_argument('--force', action='store_true',
                    help='carve even if --into is not the first-use owner')
    a = ap.parse_args()
    # Accept the MODULE name as well as the asm STEM.  Every other tool
    # (rel_sweep, rel_census, rel_merge_tu, rel_structcheck) takes `sel_ngc`,
    # and this one silently required `sel_ngc_rel` -- the same module-vs-stem
    # hazard that made rel_rowcount report ZERO rows in run 10.
    mod = {'sel_ngc': 'sel_ngc_rel'}.get(a.module, a.module)

    if a.list:
        return do_list(mod, a.ref)

    lines = pristine(mod, a.ref)
    pre, secs, order = split_sections(lines)

    # RUN 10: this used to delete the existing segment files HERE, before any
    # argument validation.  So a carve that was going to be REFUSED (a bad
    # label, a mismatched --into, the long-run guard below) still silently
    # UN-CARVED a landed, golden carve on its way out -- the tree looked clean
    # apart from three deleted asm/<mod>_dN.s files, and the next build was
    # non-golden for a reason unrelated to anything the agent had edited.
    # mini_golf and sel_ngc both carry landed carves, so this was live.
    # The deletion now happens in commit_segments(), after every check passes.
    stale_segments = glob.glob(os.path.join(REPO, 'asm', '%s_d*.s' % mod))

    def commit_segments():
        for p in stale_segments:
            os.remove(p)

    _, _, _, _, items = sources_block(mod)
    items = [i for i in items if not re.match(r'asm/%s_d\d+\.s$' % mod, i)]
    items = [i for i in items if i != 'asm/%s.s' % mod] + ['asm/%s.s' % mod]

    if a.undo:
        commit_segments()                     # --undo genuinely means drop them
        open(os.path.join(REPO, 'asm', '%s.s' % mod), 'w', newline='\n').write(
            '\n'.join(lines))
        write_sources(mod, items)
        print('%s: restored monolithic data blob and plain SOURCES order' % mod)
        return

    nspec = len(a.hole) + len(a.hole_range) + len(a.data_hole) + len(a.data_range)
    if nspec != len(a.into):
        sys.exit('each --hole/--hole-range/--data-hole/--data-range needs exactly '
                 'one --into (%d hole specs, %d --into)' % (nspec, len(a.into)))
    if not nspec:
        sys.exit('nothing to do: pass a hole flag with --into, or --list or --undo')
    if (a.data_hole or a.data_range) and '.data' not in secs:
        sys.exit('%s has no .section .data to carve' % mod)

    # Sections are carved independently: each contributes its own bytes at its
    # own object's SOURCES position, so `.rodata` and `.data` holes interleave
    # without interacting.  Only sections that actually get a hole are sliced;
    # everything else still goes wholesale into the last segment.
    ENT = {'.rodata': parse_entries(secs['.rodata'])}
    if a.data_hole or a.data_range:
        ENT['.data'] = parse_entries(secs['.data'])
    BY = {s: {e['label']: i for i, e in enumerate(v) if e['label']}
          for s, v in ENT.items()}
    ents, by_label = ENT['.rodata'], BY['.rodata']
    fu = first_users(mod)

    holes = []
    for spec, dest in zip(a.hole, a.into):
        lbl, _, nb = spec.partition(':')
        if lbl not in by_label:
            sys.exit('%s is not a .rodata label of %s' % (lbl, mod))
        i = by_label[lbl]
        want = int(nb) if nb else None
        # RUN 9 (mini_bowling): `--hole LABEL` means ALL BYTES OF THAT LABEL'S
        # RUN, not "the 8-byte constant at that label".  Carving a long-run
        # label without `:8` deleted real data and EXITED 0 -- the module still
        # built, and the loss only showed up as a non-golden hash with nothing
        # to point at.  A magic double is 8 bytes; anything longer is either a
        # whole pool (say so with --hole-range) or a mistake.
        run = ents[i]['bytes']
        if want is None and run > 8:
            sys.exit(
                '%s covers %d bytes, and a bare --hole carves ALL of them.\n'
                '  That silently deletes real data and still exits 0 (run 9, '
                'mini_bowling).\n'
                '  If you want the magic double, say --hole %s:8.\n'
                '  If you really mean the whole %d-byte run, say --hole %s:%d, '
                'or use\n  --hole-range FIRST:LAST for a complete TU pool.'
                % (lbl, run, lbl, run, lbl, run))
        if want is not None and want > run:
            sys.exit('--hole %s:%d asks for more bytes than the label\'s run '
                     '(%d) -- that would eat the NEXT label\'s data.'
                     % (lbl, want, run))
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
        holes.append({'sec': '.rodata', 'idx': i, 'end': i, 'label': lbl,
                      'bytes': want, 'back': 0, 'into': dest})

    # --hole-range FIRST:LAST -- carve a whole TU pool (several labels) as one hole
    for spec, dest in zip(a.hole_range, a.into[len(a.hole):]):
        first, _, last = spec.partition(':')
        for x in (first, last):
            if x not in by_label:
                sys.exit('%s is not a .rodata label of %s' % (x, mod))
        i, j = by_label[first], by_label[last]
        if j < i:
            sys.exit('--hole-range %s: %s comes before %s in .rodata' % (spec, last, first))
        holes.append({'sec': '.rodata', 'idx': i, 'end': j, 'label': first,
                      'bytes': None, 'back': 0, 'into': dest.replace('\\', '/')})

    # ----- .data (run 22) ---------------------------------------------------
    #
    # Same machinery, one extra rule: a mwcc object's .data has alignment 2**3,
    # so the hole must START 8-aligned.  sel_ngc's table at .data 0x469C (4 mod
    # 8) built NOT GOLDEN and the same table at 0x4698 built GOLDEN.  Rather
    # than refuse, extend the hole BACKWARDS to the aligned address and print
    # exactly which bytes the .c file now has to emit ahead of its table --
    # that is the step a human had to work out by hand in run 21.
    dbase = len(a.hole) + len(a.hole_range)
    for k, (spec, dest) in enumerate(zip(a.data_hole + a.data_range,
                                         a.into[dbase:])):
        is_range = k >= len(a.data_hole)
        d_by = BY['.data']
        d_ent = ENT['.data']
        if is_range:
            first, _, last = spec.partition(':')
            for x in (first, last):
                if x not in d_by:
                    sys.exit('%s is not a .data label of %s' % (x, mod))
            i, j, want = d_by[first], d_by[last], None
            if j < i:
                sys.exit('--data-range %s: %s comes before %s in .data'
                         % (spec, last, first))
        else:
            lbl, _, nb = spec.partition(':')
            if lbl not in d_by:
                sys.exit('%s is not a .data label of %s' % (lbl, mod))
            i = j = d_by[lbl]
            want = int(nb) if nb else None
            if want is not None and want > d_ent[i]['bytes']:
                sys.exit('--data-hole %s:%d asks for more bytes than the label\'s '
                         'run (%d) -- that would eat the NEXT label\'s data.'
                         % (lbl, want, d_ent[i]['bytes']))
        start = d_ent[i]['addr']
        if start is None:
            sys.exit('%s has no `# 0xADDR` comment, so its alignment cannot be '
                     'checked -- refusing rather than guessing.' % d_ent[i]['label'])
        back = start % 8
        if back:
            if i == 0:
                sys.exit('%s is at .data 0x%X (%d mod 8) and is the FIRST entry, '
                         'so the hole cannot be extended backwards.\n'
                         '  A mwcc object\'s .data has alignment 2**3; a '
                         'misaligned hole builds NOT GOLDEN.' % (
                             d_ent[i]['label'], start, back))
            prev = d_ent[i - 1]
            if prev['bytes'] < back:
                sys.exit('%s is at .data 0x%X (%d mod 8) and the preceding entry '
                         '%s is only %d bytes, so the hole cannot be 8-aligned '
                         'without swallowing a third entry.'
                         % (d_ent[i]['label'], start, back, prev['label'],
                            prev['bytes']))
        holes.append({'sec': '.data', 'idx': i, 'end': j, 'label': d_ent[i]['label'],
                      'bytes': want, 'back': back, 'addr': start,
                      'into': dest.replace('\\', '/')})

    # Order globally by the owning .c file's SOURCES position: that -- not the
    # position within a section -- is what decides which object emits first.
    _src_index = {}
    for h in holes:
        if h['into'] not in items:
            sys.exit('%s is not in the %s SOURCES list' % (h['into'], mod))
        _src_index[h['into']] = items.index(h['into'])
    holes.sort(key=lambda h: (_src_index[h['into']], h['sec'], h['idx']))

    for sec in ENT:
        hs = [h for h in holes if h['sec'] == sec]
        for x, y in zip(hs, hs[1:]):
            if y['idx'] <= x['end']:
                sys.exit('%s holes overlap or are out of SOURCES order: %s and %s'
                         % (sec, x['label'], y['label']))
    # Two holes may share an owner ONLY if they are in different sections -- one
    # segment then carries a slice of each, which is exactly a TU that emits
    # both a magic and a jump table.
    for dest in {h['into'] for h in holes}:
        share = [h for h in holes if h['into'] == dest]
        if len({h['sec'] for h in share}) != len(share):
            sys.exit('two %s holes owned by the same .c file (%s) are only valid '
                     'if they are adjacent -- merge them into one hole with '
                     ':BYTES' % (share[0]['sec'], dest))

    print('resolved pairing (read this -- --into is positional):')
    for h in holes:
        print('  %-8s %-20s %s%s' % (h['sec'], h['label'], h['into'],
                                     '  [+%d bytes backwards for 8-alignment]'
                                     % h['back'] if h['back'] else ''))

    # any carved-away symbol still referenced by asm that stays as asm?
    asm = '\n'.join(open(b, errors='ignore').read()
                    for b in glob.glob(os.path.join(REPO, 'asm',
                                                    'nonmatchings', mod, '*.s')))

    # Build segments, splitting entries when only a prefix is carved.  One
    # segment per hole (holding the bytes that precede it), plus a tail.  Each
    # segment is a {section: lines} dict: a section with no hole at this cut
    # contributes NOTHING here and waits for its own cut, which is what lets
    # .rodata and .data be carved at different SOURCES positions.
    segments, keep = [], set()
    cursor = {s: 0 for s in ENT}
    for h in holes:
        sec = h['sec']
        ents, i = ENT[sec], h['idx']
        seg = {s: [] for s in ENT}
        for e in ents[cursor[sec]:i]:
            seg[sec] += e['lines']
        ent = ents[i]
        if h['back']:
            # 8-alignment: move the last `back` bytes of the PRECEDING entry
            # into the hole, and tell the author what to write in the .c file.
            prev = ents[i - 1]
            head, tail_lines, used = [], [], 0
            for l in prev['lines']:
                s = l.strip()
                if DEF.match(s) or ADDR.match(s):
                    head.append(l)
                    continue
                w = entry_width(s, prev['addr'], used)
                if used + w <= prev['bytes'] - h['back']:
                    used += w
                    head.append(l)
                else:
                    tail_lines.append(l)
            got = prev['bytes'] - used
            if got != h['back']:
                sys.exit('cannot split %s on a %d-byte boundary: the nearest '
                         'directive boundary leaves %d bytes.\n  Carve by hand, '
                         'or pick a different table.'
                         % (prev['label'], h['back'], got))
            # the kept head replaces the previous entry in this same segment
            if seg[sec][-len(prev['lines']):] == prev['lines']:
                seg[sec][-len(prev['lines']):] = head
            else:
                sys.exit('internal: previous entry was not the tail of the segment')
            print('\n  ** 8-ALIGNMENT: the hole starts at .data 0x%X (%d mod 8), so '
                  'it has been\n     extended back to 0x%X.  %s must emit these '
                  '%d byte(s) itself,\n     immediately before its jump table:\n'
                  % (h['addr'], h['back'], h['addr'] - h['back'], h['into'],
                     h['back']))
            for l in tail_lines:
                print('       %s' % l.strip())
            print()
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
                if used < h['bytes']:
                    used += entry_width(s, ent['addr'], used)
                    continue
                kept.append(l)
            tail_addr = (ent['addr'] or 0) + h['bytes']
            ents[i] = {'label': 'lbl_%08X' % tail_addr, 'addr': tail_addr,
                       'lines': ['lbl_%08X:' % tail_addr] + kept, 'bytes': 0}
            cursor[sec] = i                  # remainder starts the next segment
        else:
            cursor[sec] = h['end'] + 1       # whole label(s) carved away
        aliases = [lb for lb in carved if lb in asm]
        if len(aliases) > 1:
            sys.exit('%s..%s: %d carved labels are still referenced by asm (%s).\n'
                     '  Only ONE can be kept as a zero-size alias at the hole start; '
                     'the rest had distinct addresses.\n  Convert those callers to C '
                     'too, or carve a narrower range.'
                     % (ents[i]['label'], ents[h['end']]['label'],
                        len(aliases), ', '.join(aliases)))
        for lb in aliases:
            seg[sec].append('%s:' % lb)               # zero-size alias at the hole
            keep.add(lb)
        if sec == '.data':
            # Only the hole START has an alignment rule -- it is the C object's
            # own .data start, and a mwcc object's .data is 2**3-aligned.  The
            # RESUMPTION point has none: the following asm segment's .data
            # packs straight after whatever the C object emitted.
            #
            # RUN 22 measured this.  An earlier version of this tool warned when
            # the carved size was not a multiple of 8; sel_ngc's conversion then
            # built GOLDEN having emitted exactly 36 bytes (0x24) at 0xB8, with
            # the next segment resuming at 0xDC -- 4 mod 8.  The warning was
            # wrong and is gone.  What actually matters is the byte COUNT.
            gone = h['back'] + sum(e['bytes'] for e in ents[i:h['end'] + 1])
            print('  %s must emit EXACTLY %d bytes of .data at this point '
                  '(0x%X..0x%X).\n    Check it with `objdump -h` on the built '
                  'object before you gate.'
                  % (h['into'], gone, (h.get('addr') or 0) - h['back'],
                     (h.get('addr') or 0) - h['back'] + gone))
        segments.append(seg)
    tail = {s: [] for s in ENT}
    for s in ENT:
        for e in ENT[s][cursor[s]:]:
            tail[s] += e['lines']
    segments.append(tail)

    # A section with NO hole of its own has exactly one slice, and the loop
    # above leaves it in the tail -- which is last in SOURCES.  For `.rodata`
    # that inverts the whole layout: every converted C object's own .rodata
    # would then come BEFORE the original blob's instead of after it.  The
    # pre-run-22 tool always put .rodata in segment 0 (the head, first in
    # SOURCES) and that is what must be preserved when only .data is carved.
    if not any(h['sec'] == '.rodata' for h in holes) and len(segments) > 1:
        segments[0]['.rodata'] = segments[-1]['.rodata']
        segments[-1]['.rodata'] = []

    # Work out the SOURCES interleave BEFORE writing anything, so a rejected
    # request leaves the tree untouched rather than half-carved.
    paths = ['asm/%s.s' % mod] + \
            ['asm/%s_d%d.s' % (mod, k) for k in range(1, len(segments))]
    src = [i for i in items if not i.startswith('asm/')]
    for h in holes:
        if h['into'] not in src:
            sys.exit('%s is not in the %s SOURCES list' % (h['into'], mod))

    # RUN 23: the interleave is a PER-SECTION constraint, not one global
    # "every hole must be in SOURCES order" rule.  The old loop placed segment
    # k+1 immediately after hole k's owner and bailed out whenever two
    # CONSECUTIVE holes shared an owner -- which is exactly the case the
    # docstring above advertises as supported, "one TU can own both a magic
    # hole and a jump-table hole".  mini_billiards' src/mini_billiards_34.c
    # owns the .rodata magic at lbl_0001CF50 AND lbl_0000D330's .data jump
    # table at lbl_00021080, and the tool exited with
    #   holes are not in .text order: src/mini_billiards_34.c owns a later
    #   .rodata hole but sits earlier in SOURCES
    # having already printed a valid resolved pairing.  Nothing was written
    # (the checks run before commit_segments), so it was a refusal, not damage.
    #
    # What each section actually requires is only that ITS OWN emitters appear
    # in address order:  slice0, owner(that section's hole0), slice1,
    # owner(hole1), ..., tail.  A segment carrying no bytes of a section is
    # unconstrained by that section -- which is what lets a .data-only segment
    # sit anywhere ahead of the .c file that fills its hole.
    nseg = len(segments)
    lo = [-1] * nseg                        # must sit AFTER this src index
    hi = [len(src)] * nseg                  # must sit BEFORE this src index
    for sec in ENT:
        hs = [k for k, h in enumerate(holes) if h['sec'] == sec]
        if not hs:
            continue
        for m, segi in enumerate(hs + [nseg - 1]):
            if not segments[segi].get(sec):
                continue                    # empty slice -- makes no claim
            if m:
                lo[segi] = max(lo[segi], src.index(holes[hs[m - 1]]['into']))
            if m < len(hs):
                hi[segi] = min(hi[segi], src.index(holes[hs[m]]['into']))
    for k in range(nseg):
        if lo[k] >= hi[k]:
            sys.exit('holes are not in .text order: no SOURCES position exists '
                     'for data segment %d -- it has to follow %s and precede '
                     '%s.\n  A section follows SOURCES order, so the holes '
                     'WITHIN ONE SECTION must be carved in the same order as '
                     'their owning objects.'
                     % (k, src[lo[k]],
                        src[hi[k]] if hi[k] < len(src) else 'the end'))

    # Segment 0 is always first and the tail always last.  Every intermediate
    # segment goes as EARLY as its bounds allow, which reproduces the old
    # placement byte-for-byte whenever there is at most one hole per owner --
    # that is what keeps rel_carve_regress.py's 19 landed .rodata carves
    # identical.
    at = {}
    for k in range(1, nseg - 1):
        at.setdefault(lo[k] + 1, []).append(k)
    out = [paths[0]]
    for j in range(len(src) + 1):
        for k in at.get(j, []):
            out.append(paths[k])
        if j < len(src):
            out.append(src[j])
    out.append(paths[-1])                   # final segment carries the uncarved sections

    # Every check has passed; only now is it safe to drop the previous carve.
    commit_segments()
    written = write_segments(mod, pre, secs, order, segments, keep)
    assert written == paths, (written, paths)
    write_sources(mod, out)

    print('%s: carved %d hole(s); %d data objects' % (mod, len(holes), len(paths)))
    for k, h in enumerate(holes):
        print('  %-8s %s (%s bytes%s) -> emitted by %s'
              % (h['sec'], h['label'],
                 h['bytes'] if h['bytes'] is not None else 'all',
                 ' + %d absorbed for 8-alignment' % h['back'] if h['back'] else '',
                 h['into']))
    print('Now make the C in those files use real literals / int->float casts, '
          'rebuild, and gate on the golden sha1.')


if __name__ == '__main__':
    main()
