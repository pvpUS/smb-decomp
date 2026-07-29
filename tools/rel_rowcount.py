"""How many FUNCTIONS does each recon row (= one .s file) actually contain?

A recon row is one `asm/nonmatchings/<mod>/<label>.s`, and every module's
reachability table treats it as one function.  It is not: several files hold two
(or more) function bodies, because `rel_split.py` emits one file per *exported*
label and a `static` helper that nothing else references stays inside its
neighbour's file.

Detection: a label defined in the file that is NEVER the target of a branch
inside that same file is a separate function ENTRY, not a basic block.

usage: python rowcount.py [module ...]     (default: every module present)
"""
import os, re, glob, sys, collections

ROOT = os.path.join(
    os.path.dirname(os.path.dirname(os.path.abspath(__file__))),
    'asm', 'nonmatchings')

# CAVEAT (mini_pilot, run 8).  The heuristic below -- "a label never branched to
# within its own file is a function entry" -- is the RIGHT one.  The tempting
# cheaper one, "a label immediately after a `blr` is a new function", is USELESS:
# an early return inside one function is followed by an ordinary branch label,
# so on mini_pilot it invents 8 phantom files and up to 20 phantom bodies in a
# single file.  The ground truth, if you need to be certain, is the declaration
# list rel_split.py writes into each generated preamble.
#
# Instruction totals are summed per-instruction and are correct either way; only
# FUNCTION counts are affected.

mods = sys.argv[1:] or sorted(
    os.path.basename(d) for d in glob.glob(os.path.join(ROOT, '*'))
    if os.path.isdir(d))

grand = collections.Counter()
for mod in mods:
    files = sorted(glob.glob(os.path.join(ROOT, mod, '*.s')))
    if not files:
        continue
    extra_rows = 0
    extra_fns = 0
    detail = []
    for f in files:
        txt = open(f, errors='replace').read()
        defined = re.findall(r'^(lbl_[0-9A-Fa-f]+):', txt, re.M)
        targets = set()
        # RUN 9: the optional-operand group used to be `(?:[^,]*,\s*)?`, which is
        # WRONG -- a negated character class matches newlines, so on a branch
        # with no comma operand it ran on through the following LINES until it
        # found a comma, capturing a label from an unrelated instruction while
        # MISSING the real target.  `bne lbl_000007F4` in mini_pilot
        # `lbl_000007B8.s` was invisible, so a 61-instruction single function was
        # counted as five.  Every "row holds N functions" figure before run 9 is
        # an OVER-count for the same reason.  Keep this line-anchored.
        for m in re.finditer(
                r'(?m)^/\* [0-9A-F]{8} [0-9A-F]{8} \*/[ \t]+b[a-z]*[+-]?[ \t]+'
                r'[^\n]*?(lbl_[0-9A-Fa-f]+)', txt):
            targets.add(m.group(1))
        # A label is a FUNCTION ENTRY only if it is unreferenced by any branch in
        # the file AND is preceded by a `blr` (end of the previous body) AND
        # opens with a prologue.  Without those guards a `bctr` switch target
        # (reached only through a .data jump table) is miscounted as a function.
        lines = txt.splitlines()
        entries = []
        for k, ln in enumerate(lines):
            m = re.match(r'^(lbl_[0-9A-Fa-f]+):', ln)
            if not m or m.group(1) in targets:
                continue
            prev = ' '.join(lines[max(0, k - 2):k])
            nxt = ' '.join(lines[k + 1:k + 4])
            if 'blr' in prev and ('mflr' in nxt or 'stwu' in nxt):
                entries.append(m.group(1))
        n = 1 + len(entries)          # the file's own label + real entries
        if n > 1:
            extra_rows += 1
            extra_fns += n - 1
            detail.append('    %-28s %d functions (+%s)'
                          % (os.path.basename(f), n, ', '.join(entries)))
    print('%-16s %4d rows   %3d rows hold >1 function   %3d extra functions'
          % (mod, len(files), extra_rows, extra_fns))
    for d in detail[:200]:
        print(d)
    grand['rows'] += len(files)
    grand['multi'] += extra_rows
    grand['extra'] += extra_fns

print('\nPROJECT TOTAL: %d rows, %d hold more than one function, '
      '%d functions unaccounted for in the reachability tables'
      % (grand['rows'], grand['multi'], grand['extra']))
