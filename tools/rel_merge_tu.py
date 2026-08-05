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

RUN 15 -- the six defects three modules reported in run 14 are fixed here, and
a seventh turned up while proving it.  Four of them had ONE root cause:
`split_items` closed an item at every line where the brace depth was zero, so a
`struct Foo` declarator, its `{...};` body, and a two-line prototype were each
shredded into pieces that no longer keyed on anything.

  1,2 a conflicting DATA extern was dropped with no diagnostic -> now REPORTED,
      base form kept (`specificity` deliberately does not rank data).
  3   a duplicated tag kept the absorbed BODY and lost the `struct X` line,
      leaving an orphan top-level `{...};` -> declarator and body are one item.
  4   where two heads defined a tag differently the base won even when it was a
      strict SUBSET -> ranked by member count.
  5,6 `#include`s: dropped in one direction, and un-expressible as a deliberate
      ABSENCE in the other.  These PULL AGAINST EACH OTHER, so the tool now
      touches the include block in NEITHER direction and reports both.  32
      adjacent mini_bowling groups in this tree would have had sound.h injected
      by an auto-carry, and three of that module's files omit it on purpose.
  7   a MULTI-LINE prototype was never one item, so the run-11/12 retype
      reconciliation silently never fired for one.  Real case: _39.c's
      `void lbl_0000E894(void);` vs _39i.c's two-line `f32 lbl_0000E894(...)`.

Proof, not assertion: `tools/rel_merge_tu_selftest.py` (31 checks, both
directions); a replay of old-vs-new over all 1555 adjacent file groups in the
tree, every difference audited; and a real merge of the conflicting-tag pair
src/mini_bowling_67.c + _68.c, which the OLD tool turns into
`struct/union/enum/class tag 'BowlPin' redefined` and this one builds GOLDEN
(29ded64794215790b8bfd6fc6c2517ca835b6b1a).

`merge_heads` now returns (text, notes, conflicts) -- it was a 2-tuple.
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
    # Preserve the file's OWN line ending. This used to force CRLF
    # unconditionally "to match the tree" -- but the tree is NOT uniform:
    # src/*.c measures 819 pure-CRLF, 87 pure-LF, 0 mixed, and every one of the
    # 87 belongs to a REL module that gets merged (62 of them mini_fight's, 11
    # mini_race's). Forcing CRLF on those rewrote every line and produced
    # exactly the whole-file diff this function exists to avoid.
    # (HANDOFF sections 0.23/0.24 assert the opposite -- that this wrote LF into
    # a CRLF tree. That was backwards; measured in run 19.)
    try:
        with open(p, 'rb') as fh:
            nl = '\r\n' if b'\r\n' in fh.read() else '\n'
    except FileNotFoundError:
        nl = '\r\n'                      # new file: follow the tree majority
    open(p, 'w', encoding='utf-8', newline=nl).write(s)


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
_LINE_COMMENT = re.compile(r'//[^\n]*')
_BLOCK_COMMENT = re.compile(r'/\*.*?\*/', re.S)
_TAG = re.compile(r'^(?:typedef\s+)?(struct|union|enum)\s+'
                  r'([A-Za-z_][A-Za-z0-9_]*)\s*\{')
_INCLUDE = re.compile(r'^[ \t]*#[ \t]*include\b[^\n]*$', re.M)


def decomment(s):
    """`s` with comments removed, line structure preserved."""
    return _LINE_COMMENT.sub('', _BLOCK_COMMENT.sub('', s))


def code_of(s):
    """What the compiler actually sees, stripped.

    Every structural test below runs on this.  The old code tested raw text,
    so `extern u8 lbl_802F1FF4[];  // retyped by _10d` did not end in `;` and
    was misclassified -- and a trailing comment is exactly how this project
    annotates a retyped extern.
    """
    return decomment(s).strip()


def _complete(s):
    """Is `s` a whole top-level item?  Only meaningful at brace depth 0."""
    code = code_of(s)
    if not code:
        return True                      # blank, or a closed pure comment
    if code.endswith('\\'):
        return False                     # continued preprocessor line
    if code.startswith('#'):
        return True
    return code.endswith(';') or code.endswith('}')


def split_items(text):
    """Split a head into top-level items, keeping a declarator and the brace
    block it introduces TOGETHER.

    RUN 14 DEFECT 3.  The old version closed an item at EVERY line where the
    brace depth was zero, so `struct Foo` and its `{ ... };` body became two
    separate items.  When two heads defined the same tag, the `struct Foo`
    line was skipped as a duplicate while the BODY was carried over on its
    own -- leaving an orphan top-level `{...};` that mwcc rejects.  The tool's
    own `carried over a definition the base head lacked ({)` note WAS the bug
    report.
    """
    out, cur, depth = [], [], 0
    for ln in text.split('\n'):
        cur.append(ln)
        depth += ln.count('{') - ln.count('}')
        if depth > 0:
            continue
        depth = 0
        if _complete('\n'.join(cur)):
            out.append('\n'.join(cur))
            cur = []
    if cur:
        out.append('\n'.join(cur))
    return out


def kind(item):
    """'tag' | 'func' | 'data' | None -- the three things a head declares.

    They are ranked only against their own kind: comparing a struct body with
    a data extern is meaningless, and two items of different kinds never share
    a key.
    """
    s = ' '.join(code_of(item).split())
    if not s or s.startswith('#'):
        return None
    if _TAG.match(s):
        return 'tag'
    if '{' in s or not s.endswith(';'):
        return None
    return 'func' if re.search(r'\b[A-Za-z_][A-Za-z0-9_]*\s*\(', s) else 'data'


def decl_key(item):
    """The identifier a top-level item declares, else None.

    A tag is keyed in its OWN namespace (`struct Foo`), so a `struct Foo` body
    and an object named `Foo` can never collide.
    """
    k = kind(item)
    if k is None:
        return None
    s = ' '.join(code_of(item).split())
    if k == 'tag':
        m = _TAG.match(s)
        return '%s %s' % (m.group(1), m.group(2))
    m = _DECL_NAME.search(s)
    if m:
        return m.group(1)
    ids = _IDENT.findall(s)
    return ids[-1] if ids else None


def specificity(item):
    """How much a declaration says, WITHIN ITS KIND.

    func -- an absorbed head's GENERATED `void lbl_XXXXXXXX(void);` must never
    overwrite a retyped one the base head already carries (which is what
    happens when the base is itself a previously merged file).

    tag  -- RUN 14 DEFECT 4: where two files defined a tag differently the
    base won even when it was a strict SUBSET.  More members says more.

    data -- NOT RANKED, deliberately.  RUN 14 DEFECTS 1 and 2: `extern u8
    sym[];` and `extern struct PilotTgtRow sym[];` both scored 2 here, so the
    absorbed richer form was dropped with no diagnostic at all, and that one
    symbol (`lbl_80285A80`) is why 1,290 mini_pilot instructions are still
    parked.  There is no universally right pick -- mini_pilot resolved three
    such conflicts by taking the WEAKER form, because it was provably
    codegen-neutral for every function in those files, and could not resolve
    the fourth at any price.  So the tool REPORTS data conflicts and keeps the
    base's form.  It does not decide.  See merge_heads.
    """
    k = kind(item)
    s = ' '.join(code_of(item).split())
    if k == 'tag':
        return s.count(';')                      # member count
    if k != 'func':
        return 0                                 # data: never ranked
    n = 0
    if not re.match(r'^(extern\s+)?void\b', s):
        n += 2                                   # non-void return type
    m = re.search(r'\(([^)]*)\)', s)
    if m and m.group(1).strip() not in ('', 'void'):
        n += 1                                   # real parameter list
    return n


def includes_of(text):
    """The `#include` lines a head really has, normalised.  Commented-out ones
    do not count -- a head can disable an include on purpose."""
    return [' '.join(m.group(0).split())
            for m in _INCLUDE.finditer(decomment(text))]


def merge_heads(heads, files):
    """Union of every file's head: base head first, then whatever the absorbed
    heads add, in source order.

    A collision on the declared identifier keeps whichever declaration says
    MORE (see specificity) -- EXCEPT for data, where it keeps the base's and
    reports, because for a data symbol either form can be the one that
    already-matched code depends on.

    Returns (text, notes, conflicts).  `conflicts` maps a key to
    {form: [files declaring it that way]} and is the table run 14's mini_pilot
    agent had to build by hand before it could see why its 18-file merge would
    not compile.
    """
    base = split_items(heads[0])
    keys = {}
    for i, it in enumerate(base):
        k = decl_key(it)
        if k:
            keys[k] = i
    seen = set(code_of(it) for it in base if code_of(it))
    extra, extra_keys, notes = [], {}, []
    conflicts = {}

    def clash(k, item, f, other, other_f):
        c = conflicts.setdefault(k, {})
        c.setdefault(' '.join(code_of(other).split()), []).append(other_f)
        c.setdefault(' '.join(code_of(item).split()), []).append(f)

    # RUN 14 DEFECTS 5 AND 6, and they pull in OPPOSITE directions.
    #
    #   5 (mini_fight): absorbed `#include`s are dropped, because the item loop
    #     skips everything starting with `#`.  Result: undefined identifiers.
    #   6 (mini_bowling): a head can omit a header ON PURPOSE so its own extern
    #     beats the header's prototype -- src/mini_bowling_26.c omits sound.h
    #     so its `SoundIcsReq(u32,int,int)` beats the header's `(u32,u8,s8)`.
    #     Adding it back makes mwcc reject the TU, and the tempting repair --
    #     dropping the custom extern -- compiles and SILENTLY LOSES THE MATCH.
    #
    # So the tool does not touch the include block in either direction.  It
    # reports both, and the agent decides.  Auto-carrying looks like the fix
    # for 5 until you notice it walks straight into 6: 32 of the adjacent
    # mini_bowling groups in this tree would have had sound.h injected, and
    # three of that module's files omit it deliberately.  A dropped include is
    # a loud mwcc error; a wrongly added one can cost a match.
    base_inc = includes_of(heads[0])
    base_pp = set(code_of(it) for it in base if code_of(it).startswith('#'))
    for h, f in zip(heads[1:], files[1:]):
        for it in split_items(h):
            s = code_of(it)
            if not s.startswith('#') or s in base_pp:
                continue
            notes.append('%s has a preprocessor line the base lacks -- NOT '
                         'carried; add it yourself if the merged TU needs it: '
                         '%s' % (f, s.split('\n')[0][:70]))
        for inc in base_inc:
            if inc not in includes_of(h):
                notes.append('%s does NOT have %s but the base does -- if that '
                             'absence is deliberate (its own extern beats the '
                             'header), the merged TU will not compile, and '
                             'dropping that extern silently loses the match'
                             % (f, inc))

    for h, f in zip(heads[1:], files[1:]):
        for it in split_items(h):
            s = code_of(it)
            if not s or s.startswith('#') or s in seen:
                continue
            k = decl_key(it)
            if k is not None and k in extra_keys:
                cur = extra[extra_keys[k]]
                if code_of(cur) == s:
                    continue
                if kind(it) == 'data':
                    clash(k, it, f, cur, 'an earlier absorbed head')
                elif specificity(it) > specificity(cur):
                    notes.append('%s and an earlier absorbed head declare %r '
                                 'differently -- kept %s\'s' % (f, k, f))
                    extra[extra_keys[k]] = it
                    seen.add(s)
                continue
            if k is not None and k in keys and base[keys[k]] is not None:
                b = base[keys[k]]
                if code_of(b) == s:
                    continue
                if kind(it) == 'data':
                    clash(k, it, f, b, files[0])
                    continue                  # keep the base's; do not decide
                if specificity(it) <= specificity(b):
                    continue      # base already says at least as much
                notes.append('%r: %s retypes it; dropped the base head\'s '
                             'weaker declaration' % (k, f))
                base[keys[k]] = None
            if k is not None:
                extra_keys[k] = len(extra)
            else:
                notes.append('%s: carried over an item with no declared name '
                             '(%s)' % (f, s.split('\n')[0][:60]))
            extra.append(it)
            seen.add(s)
    out = '\n'.join(x for x in base if x is not None)
    if extra:
        out = out.rstrip('\n') + \
            '\n\n// Carried over from the heads of the absorbed files (merged by\n' \
            '// tools/rel_merge_tu.py -- these are what the tool used to drop).\n' + \
            '\n'.join(extra).strip('\n') + '\n\n'
    return out, notes, conflicts


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

    preamble, notes, conflicts = merge_heads(heads, files)
    for n in notes:
        print('  head: %s' % n)
    merged = preamble + '#pragma force_active on\n' + ''.join(bodies) + \
        '#pragma force_active reset\n'
    merged, pnotes = fix_protos(merged)
    for n in pnotes:
        print('  proto: %s' % n)
    write(files[0], merged)
    if conflicts:
        # The merged file KEEPS THE FIRST FORM of each of these.  Until run 15
        # the tool picked one silently, which is how mini_pilot's 18-file merge
        # produced a file that would not compile (`not an lvalue`, `illegal
        # operand`, `cannot convert 'unsigned char *' to 'short'`) with nothing
        # in the output pointing at the cause.
        print('\n*** %d DATA DECLARATION CONFLICT(S) -- the merged file keeps '
              'the FIRST form of each. Resolve before you gate. ***'
              % len(conflicts))
        for k in sorted(conflicts):
            print('  %s' % k)
            for form, who in conflicts[k].items():
                print('      %-52s  %s' % (form, ', '.join(sorted(set(who)))))
        print('  A conflict is only free if the files holding the minority '
              'form have no use that needs it (mini_pilot proved three of four '
              'codegen-neutral that way, and the fourth blocked 1,290 insn).')
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
