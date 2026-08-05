#!/usr/bin/env python3
"""structcheck.py -- what `--gate` cannot see.

A golden sha1 proves the linked .text is byte-identical. It does NOT prove the
source is well-formed: run 8 shipped a file with a duplicated preamble and a
stray unmatched `#pragma force_active on` that gated GOLDEN and reported MATCH.

Checks, over every src/<stem>*.c and the Makefile:
  1. pure-C files carry zero `#include "../asm/nonmatchings/<stem>/`
  2. `#pragma force_active on` count == `reset` count, per file
  3. no label defined twice anywhere in the module
  4. no duplicated forward declaration inside one file
  5. every file appears exactly once in the module's SOURCES block, and every
     SOURCES entry exists on disk
  6. no label both defined in C and pulled in as an asm stub
"""
import glob
import os
import re
import sys

# warm dir -> (stem, target).  Same three-name table as rel_merge_back.py;
# sel_ngc differs on all three, which has cost agents time every run.
MODULES = {
    'mini_bowling':   ('mini_bowling',   'mkbe.rel_mini_bowling.rel'),
    'mini_race':      ('mini_race',      'mkbe.rel_mini_race.rel'),
    'mini_fight':     ('mini_fight',     'mkbe.rel_mini_fight.rel'),
    'mini_pilot':     ('mini_pilot',     'mkbe.rel_mini_pilot.rel'),
    'mini_golf':      ('mini_golf',      'mkbe.rel_mini_golf.rel'),
    'mini_billiards': ('mini_billiards', 'mkbe.rel_mini_billiards.rel'),
    'sel_ngc':        ('sel_ngc_rel',    'mkbe.sel_ngc.rel'),
    'option':         ('option',         'mkbe.option.rel'),
    'test_mode':      ('test_mode',      'mkbe.test_mode.rel'),
}

# usage: rel_structcheck.py <module> [tree]        (tree defaults to THIS SCRIPT's repo)
#    or: rel_structcheck.py <module> --tree <tree>
#    or: rel_structcheck.py <tree> <stem> <target> (explicit, as in run 8)
#
# RUN 20: `--tree` is now accepted. It used to be rejected, and the default is
# derived from `__file__` -- i.e. the repo the SCRIPT lives in, not the cwd.
# So invoking the MAIN tree's copy while working in a warm copy silently
# reported the main tree's numbers. mini_race lost time to that in run 19: it
# saw its own already-converted functions listed as asm stubs. Every brief has
# told agents this tool "rejects --tree"; now it does not.
_argv = sys.argv[1:]
_tree_opt = None
if '--tree' in _argv:
    _i = _argv.index('--tree')
    if _i + 1 >= len(_argv):
        sys.exit('--tree needs a path')
    _tree_opt = _argv[_i + 1]
    del _argv[_i:_i + 2]

if len(_argv) >= 1 and _argv[0] in MODULES:
    STEM, TARGET = MODULES[_argv[0]]
    TREE = _tree_opt or (_argv[1] if len(_argv) > 1 else os.path.dirname(
        os.path.dirname(os.path.abspath(__file__))))
elif len(_argv) >= 3:
    TREE, STEM, TARGET = _argv[0], _argv[1], _argv[2]
    if _tree_opt:
        TREE = _tree_opt
else:
    sys.exit('usage: rel_structcheck.py <module> [tree]\n'
             '   or: rel_structcheck.py <module> --tree <tree>\n'
             '   or: rel_structcheck.py <tree> <stem> <target>\n'
             'modules: ' + ', '.join(sorted(MODULES)))

if not os.path.isdir(os.path.join(TREE, 'src')):
    sys.exit('no src/ under %r -- wrong --tree?' % TREE)

DEF = re.compile(r'^(?:static\s+)?(?:asm\s+)?[A-Za-z_][\w\s\*]*?\b'
                 r'(lbl_[0-9A-Fa-f]+|_prolog|_epilog|_unresolved)\s*\([^;{]*\)\s*$')
FWD = re.compile(r'^(?:static\s+)?[A-Za-z_][\w\s\*]*\b'
                 r'(lbl_[0-9A-Fa-f]+|_prolog|_epilog|_unresolved)\s*\([^;{]*\)\s*;\s*$')
ASMDEF = re.compile(r'^(?:static\s+)?asm\s')
INC = re.compile(r'#include "\.\./asm/nonmatchings/%s/([A-Za-z0-9_]+)\.s"' % STEM)

bad = []
notes = []
defs = {}
stubs = {}
files = sorted(glob.glob(os.path.join(TREE, 'src', '%s*.c' % STEM)))
for p in files:
    name = os.path.basename(p)
    L = open(p, errors='replace').read().split('\n')
    inc = [m for l in L for m in INC.findall(l)]
    on = sum(1 for l in L if l.startswith('#pragma force_active on'))
    off = sum(1 for l in L if l.startswith('#pragma force_active reset'))
    if on != off:
        bad.append('%s: %d `force_active on` vs %d `reset`' % (name, on, off))
    d = [DEF.match(l).group(1) for l in L
         if DEF.match(l) and not ASMDEF.match(l)]
    for lbl in d:
        defs.setdefault(lbl, []).append(name)
    for lbl in inc:
        stubs.setdefault(lbl, []).append(name)
    # NOT a failure since run 8.  mini_race matched lbl_00004634 and
    # lbl_0000D8EC with asm siblings left in the same TU (mini_race_28.c has
    # five), gated GOLDEN, and verified it by building one both ways for
    # identical bytes.  mwcc really does disable the scheduler and peephole for
    # every C function sharing a TU with an `asm` block -- but a function that
    # does not NEED them matches anyway.  So "own pure-C file" is sufficient,
    # not necessary, and a mixed TU is a legitimate, cheaper state: no isolate
    # script, no rematch, no SOURCES surgery.
    #
    # Reported as a NOTE so nobody "fixes" working code -- but still reported,
    # because if such a function ever fails to match, this is the first thing
    # to try changing.
    if inc and any(l for l in L if DEF.match(l) and DEF.match(l).group(1) not in inc):
        pure = [x for x in d if x not in inc]
        if pure:
            notes.append('%s: mixed TU -- C %s alongside asm stub(s) %s. '
                         'Legitimate (run 8); isolate only if it stops matching.'
                         % (name, ','.join(pure), ','.join(inc)))
    f = {}
    for l in L:
        m = FWD.match(l)
        if m:
            f[m.group(1)] = f.get(m.group(1), 0) + 1
    dupf = [k for k, v in f.items() if v > 1]
    if dupf:
        bad.append('%s: forward decl repeated: %s' % (name, ', '.join(sorted(dupf))))

for lbl, where in defs.items():
    if len(where) > 1:
        bad.append('%s defined in %d files: %s' % (lbl, len(where), ', '.join(where)))
for lbl in set(defs) & set(stubs):
    bad.append('%s is BOTH a C definition (%s) and an asm stub (%s)'
               % (lbl, defs[lbl][0], stubs[lbl][0]))

mk = open(os.path.join(TREE, 'Makefile'), errors='replace').read().split('\n')
h = next(i for i, l in enumerate(mk) if l.strip() == '# %s sources' % TARGET)
e = next(i for i in range(h + 2, len(mk)) if not mk[i].rstrip().endswith('\\'))
items = [mk[i].rstrip().rstrip('\\').strip() for i in range(h + 2, e + 1)]
seen = {}
for it in items:
    seen[it] = seen.get(it, 0) + 1
for it, n in seen.items():
    if n > 1:
        bad.append('Makefile SOURCES lists %s %d times' % (it, n))
for it in items:
    if not os.path.exists(os.path.join(TREE, it)):
        bad.append('Makefile SOURCES entry %s does not exist' % it)
srcset = {'src/' + os.path.basename(p) for p in files}
missing = srcset - set(items)
if missing:
    bad.append('%d C file(s) on disk not in SOURCES: %s'
               % (len(missing), ', '.join(sorted(missing))))

print('files: %d   SOURCES entries: %d   C definitions: %d   asm stubs: %d'
      % (len(files), len(items), len(defs), len(stubs)))
if notes:
    print('\n%d NOTE(S) -- not failures:' % len(notes))
    for n in notes:
        print('  -- ' + n)
if bad:
    print('\n%d PROBLEM(S):' % len(bad))
    for b in bad:
        print('  !! ' + b)
    sys.exit(1)
print('CLEAN -- all structural checks pass')
