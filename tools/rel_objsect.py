#!/usr/bin/env python3
"""Owner-object SECTION report -- the detector for a draft whose DATA LAYOUT is
wrong while every score says it is right.  Any module.

Promoted from mini_golf's run-23 `probe51.py`, generalised over all nine
modules and split from the install/build step (`rel_vsplice.py` already does
install -> build -> score -> restore, and doing it twice is how a pristine
snapshot gets poisoned).  This tool only ever READS.

WHY THIS EXISTS -- the third way a build is wrong while every check says it is
right, found in run 23:

  mini_golf's `lbl_000109CC` was carried across two runs as `14 in 14`.  That
  build makes `src/mini_golf_51.c.o` emit **0x14 bytes of .rodata** -- byte for
  byte the pool it should have been READING -- because the draft spelled the
  constants as literals.  The REL hashed `f1ce4f17...`, not golden.

  **A per-function `rel_ascore` structurally CANNOT see this: every reference
  is a relocation, so the instruction words are identical either way.**  Only
  the owner OBJECT shows it.  The fix cost nothing and deleted the precondition
  -- reading the pool through a pointer local is still exactly 14 in 14, and
  the object then has no `.rodata` at all, so that function needed no carve.

So: before you quote a near-miss, look at what the owner object EMITS.  A
carve is only needed when the object has data it must not have, and a draft
that grows the object's `.rodata` is a draft that cannot match, whatever it
scores.

usage:
  python tools/rel_objsect.py <src-relpath> [<src-relpath> ...]  [--tree DIR]
  python tools/rel_objsect.py --record FILE <src-relpath> ...    [--tree DIR]
  python tools/rel_objsect.py --compare <a.txt> <b.txt>
  ... [--module M]         when the tree is not named after its module
  ... [--all-sections]     keep .line/.debug/.comment (dropped by default:
                           they move on every edit, so a compare that keeps
                           them reports a difference for every experiment)

  <src-relpath> is the SOURCE path (`src/mini_golf_51.c`); the object built
  beside it (`src/mini_golf_51.c.o`) is what gets read.  Passing the `.o`
  directly also works.

The record/compare pair is the before/after for one experiment, and `--compare`
exits 1 on any change, so it drops straight into a script:

  python tools/rel_objsect.py --record before.txt src/mini_golf_51.c
  ...install a draft, rebuild...
  python tools/rel_objsect.py --record after.txt  src/mini_golf_51.c
  python tools/rel_objsect.py --compare before.txt after.txt || echo LAYOUT MOVED

BUILD IT FIRST, and build the `.plf`/`.rel` TARGET -- never `make src/x.c.o`,
or REL_FLAGS do not apply and the object you read is not the object that links
(the same trap `rel_ablind.py` documents).  This tool refuses to read an object
older than its source and says so rather than reporting a stale layout.

The artifact sha1 is checked against `supermonkeyball.sha1` when the module can
be identified, because a section report from a NON-GOLDEN build is exactly what
run 23 was misled by; `NOT-GOLDEN` in the header is the point of the tool, not
a failure of it.
"""
import hashlib
import os
import re
import subprocess
import sys

MAIN = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OD = os.environ.get('OBJDUMP',
                    'C:/devkitPro/devkitPPC/bin/powerpc-eabi-objdump.exe')

# Three names per module and they diverge; the artifact basename follows the
# build TARGET, not the warm-dir name or the asm stem.
ART = {
    'mini_bowling':   'mkbe.rel_mini_bowling',
    'mini_race':      'mkbe.rel_mini_race',
    'mini_fight':     'mkbe.rel_mini_fight',
    'mini_pilot':     'mkbe.rel_mini_pilot',
    'mini_golf':      'mkbe.rel_mini_golf',
    'mini_billiards': 'mkbe.rel_mini_billiards',
    'sel_ngc':        'mkbe.sel_ngc',
    'option':         'mkbe.option',
    'test_mode':      'mkbe.test_mode',
}

# Sections whose CONTENT is dumped, not just sized.  .text is deliberately not
# here -- rel_ascore/rel_pcmp/rel_ablind own that, and this tool exists for the
# thing they cannot see.
CONTENT = ('.rodata', '.data', '.sdata', '.sdata2', '.rodata1', '.data1')

# Debug sections carry line numbers, so ANY edit moves them and a --compare
# that includes them reports a difference for every experiment -- which is the
# same as reporting none.  --all-sections puts them back.
NOISE = ('.line', '.debug', '.comment')


def sh(*cmd):
    r = subprocess.run(list(cmd), capture_output=True, text=True)
    return r.stdout + r.stderr


def obj_for(p):
    """Accept a source path or an object path; return the object path."""
    return p if p.endswith('.o') else p + '.o'


def sections(obj):
    """[(name, size, hexbytes-or-None)] in objdump -h order."""
    out = []
    for line in sh(OD, '-h', obj).splitlines():
        m = re.match(r'\s*\d+\s+(\S+)\s+([0-9a-f]+)\s', line)
        if m and (ALL_SECTIONS or m.group(1) not in NOISE):
            out.append([m.group(1), int(m.group(2), 16), None])
    for row in out:
        if row[0] in CONTENT and row[1]:
            row[2] = content(obj, row[0])
    return [tuple(r) for r in out]


def content(obj, sec):
    """The section's bytes as one lowercase hex string, addresses discarded."""
    hexs = []
    for line in sh(OD, '-s', '-j', sec, obj).splitlines():
        m = re.match(r'\s*[0-9a-f]+\s((?:[0-9a-f]{2,8} ){1,4})', line)
        if m:
            hexs.append(m.group(1).replace(' ', ''))
    return ''.join(hexs)


FORCE_MOD = None            # --module, for a tree not named after its module
ALL_SECTIONS = False        # --all-sections, keep .line/.debug/.comment


def module_of(tree):
    if FORCE_MOD:
        return FORCE_MOD
    n = os.path.basename(os.path.abspath(tree))
    return n if n in ART else None


def artifact_state(tree):
    """('GOLDEN'|'NOT-GOLDEN <sha>'|'no .rel'|'unknown module', name)"""
    mod = module_of(tree)
    if not mod:
        return ('unknown module -- cannot check golden', None)
    rel = os.path.join(tree, ART[mod] + '.rel')
    if not os.path.exists(rel):
        return ('%s.rel not built' % ART[mod], None)
    got = hashlib.sha1(open(rel, 'rb').read()).hexdigest()
    want = None
    sha = os.path.join(tree, 'supermonkeyball.sha1')
    if os.path.exists(sha):
        for line in open(sha):
            p = line.split()
            if len(p) == 2 and p[1] == ART[mod] + '.rel':
                want = p[0]
    if want is None:
        return ('%s (no golden line)' % got, ART[mod])
    return ('GOLDEN' if got == want else 'NOT-GOLDEN %s' % got, ART[mod])


def stale(src, obj):
    """True if the object predates its source -- a stale layout reads as real."""
    if src == obj or not os.path.exists(src) or not os.path.exists(obj):
        return False
    return os.path.getmtime(obj) < os.path.getmtime(src)


def gather(paths, tree):
    rows = []
    for p in paths:
        obj = os.path.join(tree, obj_for(p))
        if not os.path.exists(obj):
            sys.exit('%s does not exist -- build the .plf/.rel TARGET first '
                     '(never `make src/x.c.o`)' % obj)
        if stale(os.path.join(tree, p), obj):
            sys.exit('%s is OLDER than its source -- rebuild, or you are '
                     'reading a layout that no longer exists' % obj)
        rows.append((obj_for(p), sections(obj)))
    return rows


def report(rows, tree):
    state, art = artifact_state(tree)
    print('tree     %s' % os.path.abspath(tree))
    print('artifact %s' % state)
    if state.startswith('NOT-GOLDEN'):
        print('  ^^ every number below is measured on a build that does NOT '
              'match. Run 23 quoted one of these for two runs.')
    for obj, secs in rows:
        print('\n==== %s ====' % obj)
        for name, size, data in secs:
            flag = ''
            if name in CONTENT and size:
                flag = '   <-- object EMITS %s' % name
            print('  %-12s 0x%04x%s' % (name, size, flag))
        for name, size, data in secs:
            if data:
                print('  ---- %s content (%d bytes) ----' % (name, size))
                for i in range(0, len(data), 32):
                    print('    %04x  %s' % (i // 2, ' '.join(
                        data[i + j:i + j + 8] for j in range(0, 32, 8))))


def record(path, rows, tree):
    state, _ = artifact_state(tree)
    with open(path, 'w') as f:
        f.write('# artifact %s\n' % state)
        for obj, secs in rows:
            for name, size, data in secs:
                f.write('%s\t%s\t%d\t%s\n'
                        % (obj, name, size,
                           hashlib.sha1(data.encode()).hexdigest()[:16]
                           if data else '-'))
    print('wrote %s (%d objects, artifact %s)' % (path, len(rows), state))


def read_record(path):
    d, head = {}, ''
    for line in open(path):
        if line.startswith('#'):
            head = line.strip()
            continue
        p = line.rstrip('\n').split('\t')
        if len(p) == 4:
            d[(p[0], p[1])] = (int(p[2]), p[3])
    return head, d


def compare(a, b):
    ha, A = read_record(a)
    hb, B = read_record(b)
    if ha != hb:
        print('artifact state changed:\n  %s\n  %s' % (ha, hb))
    bad = 0
    for k in sorted(set(A) | set(B)):
        x, y = A.get(k), B.get(k)
        if x == y:
            continue
        bad += 1
        print('%-40s %-10s %s -> %s'
              % (k[0], k[1],
                 'absent' if x is None else '0x%x/%s' % x,
                 'absent' if y is None else '0x%x/%s' % y))
    print('%d section(s) differ' % bad)
    return 1 if (bad or ha != hb) else 0


def main():
    global FORCE_MOD, ALL_SECTIONS
    av = sys.argv[1:]
    if '--all-sections' in av:
        ALL_SECTIONS = True
        av.remove('--all-sections')
    if av[:1] == ['--compare']:
        if len(av) != 3:
            sys.exit(__doc__)
        sys.exit(compare(av[1], av[2]))
    tree = MAIN
    if '--tree' in av:
        i = av.index('--tree')
        tree = av[i + 1]
        del av[i:i + 2]
    if '--module' in av:
        i = av.index('--module')
        FORCE_MOD = av[i + 1]
        if FORCE_MOD not in ART:
            sys.exit('--module %s is not one of: %s'
                     % (FORCE_MOD, ' '.join(sorted(ART))))
        del av[i:i + 2]
    out = None
    if '--record' in av:
        i = av.index('--record')
        out = av[i + 1]
        del av[i:i + 2]
    if not av:
        sys.exit(__doc__)
    rows = gather(av, tree)
    if out:
        record(out, rows, tree)
    else:
        report(rows, tree)


if __name__ == '__main__':
    main()
