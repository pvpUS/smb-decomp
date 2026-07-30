"""How many FUNCTIONS does each recon row (= one .s file) actually contain?

A recon row is one `asm/nonmatchings/<mod>/<label>.s`, and every module's
reachability table treats it as one function.  It is not: several files hold two
or more bodies, because `rel_split.py` emits one file per *exported* label and a
`static` helper that nothing else references stays inside its neighbour's file.

This matters because of `tools/rel_ssplit.py`: once you know a 1,497-instruction
"function" is fifteen, you can convert ONE of them.  mini_race's `lbl_000008B4`
went from the project's largest all-or-nothing bet to one of its safest targets
that way.

usage:
  python tools/rel_rowcount.py [module ...]     (default: every module present)
  python tools/rel_rowcount.py mini_race --detail
  python tools/rel_rowcount.py mini_race --tree C:/tmp/smbm/mini_race

Output has THREE columns, and the third is the point:

  confirmed  a real function entry, on positive evidence (see below)
  leaf?      a CANDIDATE this scanner cannot settle.  Go read it.
  bctr rows  rows holding a jump table.  No scanner can tell a jump-table arm
             from a function start, so every count in such a row is suspect and
             `rel_ssplit.py` refuses them outright.
"""
import argparse
import collections
import glob
import os
import re
import sys

# ---------------------------------------------------------------------------
# HISTORY, because two of these rules were wrong in ways that produced confident
# numbers, and each cost a run.
#
# RUN 8: "a label after `blr` is a new function" is USELESS on its own -- an
#   early return inside one function is followed by an ordinary branch label, so
#   on mini_pilot it invents 8 phantom files and 20 phantom bodies in one file.
#
# RUN 9: the branch-target regex used `(?:[^,]*,\s*)?` for the optional `cr0,`
#   operand.  A negated character class MATCHES NEWLINES, so on a branch with no
#   comma operand it ran through the following LINES to the next comma, captured
#   a label from an unrelated instruction, and MISSED the real target.  A
#   61-instruction single function counted as five.  Project total went from
#   940 rows / 50 multi / 211 unaccounted to 992 / 29 / 159 when this was fixed.
#   Keep the target pattern line-anchored (`[^\n]*?`).
#
# RUN 10: the entry rule required `mflr` or `stwu` in the next few lines, so it
#   MISSED EVERY LEAF FUNCTION -- a leaf needs neither.  test_mode's
#   second-largest run-9 conversion (84 insn) starts with a bare `lis` and was
#   invisible to this tool and to the recon; it was found by reading asm.
#
#   The fix is NOT to drop the prologue guard -- that resurrects the run-8
#   phantoms.  It is a second, independent source of positive evidence: a label
#   REFERENCED FROM ANOTHER FILE in the module is externally visible, so it is a
#   function entry whatever its prologue looks like.  Anything that is neither
#   branched-to locally, nor prologue-confirmed, nor externally referenced is
#   reported as `leaf?` -- an explicit unknown, not a silent zero.
#
# Instruction totals are summed per-instruction and are correct either way; only
# FUNCTION counts are affected by any of this.
# ---------------------------------------------------------------------------

# A branch, with its target as the last label on the SAME line.
BRANCH = re.compile(r'(?m)^/\* [0-9A-F]{8} [0-9A-F]{8} \*/[ \t]+b[a-z]*[+-]?[ \t]+'
                    r'[^\n]*?(lbl_[0-9A-Fa-f]+)')
DEFN = re.compile(r'^(lbl_[0-9A-Fa-f]+):')
LABEL = re.compile(r'(lbl_[0-9A-Fa-f]+)')
INSN = re.compile(r'/\* [0-9A-F]{8} [0-9A-F]{8} \*/')


def module_asm(tree, mod):
    """Every .s that could REFERENCE this module's labels: the split rows plus
    the module's data blobs (a jump table or a vtable in .data is a reference,
    and it is the reason a label can be an entry with no caller at all)."""
    rows = sorted(glob.glob(os.path.join(tree, 'asm', 'nonmatchings', mod, '*.s')))
    data = sorted(glob.glob(os.path.join(tree, 'asm', '%s*.s' % mod)))
    return rows, data


def stubbed_rows(tree, mod):
    """Rows that are STILL ASM -- i.e. some src/<stem>*.c #includes the .s.

    Run 10: without this the tool counts rows that are already pure C.  A .s
    file is not deleted when its row is converted, so `asm/nonmatchings/` is a
    record of what rel_split once emitted, NOT of what is left to do.
    test_mode has 126 rows on disk and 55 asm stubs.  Reading the raw row count
    as remaining work overstates it by more than 2x, and the `leaf?` candidates
    inside a converted row are not work at all -- they are already C.
    """
    out = set()
    inc = re.compile(r'#include "\.\./asm/nonmatchings/%s/([A-Za-z0-9_]+)\.s"'
                     % re.escape(mod))
    old = re.compile(r'INCLUDE_ASM\([^,]+,\s*"?[A-Za-z0-9_/]*%s"?\s*,\s*'
                     r'([A-Za-z0-9_]+)' % re.escape(mod))
    for p in glob.glob(os.path.join(tree, 'src', '%s*.c' % mod)):
        txt = open(p, errors='ignore').read()
        out.update(inc.findall(txt))
        out.update(old.findall(txt))
    return out


def scan(tree, mod, detail=False):
    rows, data = module_asm(tree, mod)
    if not rows:
        return None
    stubs = stubbed_rows(tree, mod)

    text = {}
    for f in rows + data:
        text[f] = open(f, errors='replace').read()

    # Where is each label DEFINED?  (Data blobs define data labels; we only care
    # about the ones defined in the split rows.)
    defined_in = {}
    for f in rows:
        for lbl in DEFN.findall(text[f]):
            defined_in.setdefault(lbl, f)

    # Referenced from a file OTHER than the one defining it => externally
    # visible => a function entry, prologue or no prologue.
    external = set()
    for f in rows + data:
        for lbl in set(LABEL.findall(text[f])):
            owner = defined_in.get(lbl)
            if owner is not None and owner != f:
                external.add(lbl)

    out = []
    for f in rows:
        txt = text[f]
        row = os.path.basename(f)[:-2]
        branched = set(BRANCH.findall(txt))
        n_insn = len(INSN.findall(txt))
        has_bctr = bool(re.search(r'(?m)\*/[ \t]+bctr\b', txt))

        lines = txt.splitlines()
        confirmed, leafish = [], []
        for k, ln in enumerate(lines):
            m = DEFN.match(ln)
            if not m:
                continue
            lbl = m.group(1)
            if lbl == row or lbl in branched:
                continue
            prev = ' '.join(lines[max(0, k - 2):k])
            nxt = ' '.join(lines[k + 1:k + 4])
            after_blr = 'blr' in prev
            prologue = 'mflr' in nxt or 'stwu' in nxt
            if lbl in external or (after_blr and prologue):
                confirmed.append(lbl)
            elif after_blr:
                # No prologue and nobody outside references it: either a leaf
                # helper (real function) or a jump-table arm (not one).  Say so.
                leafish.append(lbl)
        out.append({'row': row, 'insn': n_insn, 'bctr': has_bctr,
                    'confirmed': confirmed, 'leaf': leafish,
                    'stub': row in stubs})
    return out


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('modules', nargs='*')
    ap.add_argument('--tree', help='defaults to this repo')
    ap.add_argument('--detail', action='store_true',
                    help='list every multi-function row')
    ap.add_argument('--all-rows', action='store_true',
                    help='include rows that are already pure C (a .s file is '
                         'not deleted when its row is converted, so by default '
                         'only rows some src/*.c still #includes are counted)')
    a = ap.parse_args()

    tree = a.tree or os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    root = os.path.join(tree, 'asm', 'nonmatchings')
    present = sorted(os.path.basename(d) for d in glob.glob(os.path.join(root, '*'))
                     if os.path.isdir(d))

    # RUN 10 (sel_ngc): `rel_rowcount.py sel_ngc` printed 0 rows / 0 insn with NO
    # ERROR, because the row directory is asm/nonmatchings/sel_ngc_rel/ -- the
    # STEM, not the warm-dir name.  scan() returned None and main() dropped it
    # silently, which reads exactly like "nothing left to do" in the one place a
    # module's whole reachability table starts.  The brief's own §10 step-1
    # command had this bug in it.  Accept either spelling, and hard-fail on a
    # name that matches neither.
    ALIAS = {'sel_ngc': 'sel_ngc_rel'}
    mods = []
    for m in (a.modules or present):
        if m in present:
            mods.append(m)
        elif ALIAS.get(m) in present:
            print('note: %s\'s asm rows live under %r (the stem, not the warm '
                  'dir name) -- using that.' % (m, ALIAS[m]), file=sys.stderr)
            mods.append(ALIAS[m])
        else:
            sys.exit('no asm/nonmatchings/%s in %s.\n  present: %s'
                     % (m, tree, ', '.join(present)))

    grand = collections.Counter()
    for mod in mods:
        allres = scan(tree, mod, a.detail)
        if not allres:
            continue
        res = allres if a.all_rows else [r for r in allres if r['stub']]
        if not res:
            print('%-16s %4d rows on disk, ALL already converted to C'
                  % (mod, len(allres)))
            continue
        multi = [r for r in res if r['confirmed']]
        leafrows = [r for r in res if r['leaf']]
        bctr = [r for r in res if r['bctr']]
        extra = sum(len(r['confirmed']) for r in res)
        leaves = sum(len(r['leaf']) for r in res)
        insn = sum(r['insn'] for r in res)
        print('%-16s %4d rows %s (%6d insn)  %3d rows >1 fn  %3d extra fns '
              'confirmed  %3d leaf? in %d rows  %3d bctr rows'
              % (mod, len(res), 'of %d' % len(allres) if not a.all_rows
                 else 'total', insn, len(multi), extra, leaves, len(leafrows),
                 len(bctr)))
        if a.detail:
            for r in sorted(res, key=lambda r: -r['insn']):
                if not (r['confirmed'] or r['leaf']):
                    continue
                print('    %-20s %5d insn %s%s'
                      % (r['row'], r['insn'],
                         '  bctr!' if r['bctr'] else '',
                         ''))
                if r['confirmed']:
                    print('        +%d confirmed: %s'
                          % (len(r['confirmed']), ', '.join(r['confirmed'])))
                if r['leaf']:
                    print('        +%d leaf? (UNVERIFIED -- read these): %s'
                          % (len(r['leaf']), ', '.join(r['leaf'])))
        grand['rows'] += len(res)
        grand['multi'] += len(multi)
        grand['extra'] += extra
        grand['leaf'] += leaves
        grand['bctr'] += len(bctr)
        grand['insn'] += insn

    print('\nPROJECT TOTAL (%s): %d rows / %d insn, %d hold more than one '
          'function,\n  %d extra functions confirmed, %d further LEAF '
          'CANDIDATES this scanner cannot\n  settle, %d rows contain a bctr.'
          % ('all rows' if a.all_rows else 'STILL-ASM rows only',
             grand['rows'], grand['insn'], grand['multi'], grand['extra'],
             grand['leaf'], grand['bctr']))
    print('\nA `leaf?` is an explicit UNKNOWN: no prologue, nothing outside the '
          'file\nreferences it. It is either a leaf helper (a real, convertible '
          'function --\ntest_mode lost an 84-instruction one to this blind spot '
          'for two runs) or a\njump-table arm (not a function at all). READ IT. '
          'In a `bctr` row, assume the\nlatter until proven otherwise, and note '
          'that rel_ssplit.py refuses those rows.')
    return 0


if __name__ == '__main__':
    sys.exit(main())
