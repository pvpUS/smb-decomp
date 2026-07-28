#!/usr/bin/env python3
"""Find already-matched C that a still-asm function is a copy of.

The cheapest matches this project has ever made came from noticing that an
unconverted REL function is a near-verbatim copy of C that is already matched
somewhere else:

  * run 6, mini_golf lbl_00010304 (237 insn) == handle_ball_linear_kinematics
    in src/ball.c, changing only float literals -> pool reads and one callee.
    2 diffs on the first build.
  * run 7, mini_pilot lbl_00006124 == the same function (2 diffs), and
    lbl_000051A4 == u_ball_ape_thread -- MATCH on the first real build.
  * run 7, mini_golf: all three of its matches came from an already-matched
    IN-MODULE template (lbl_00022524) that this cross-reference surfaced.

Both times it was found by hand, and only after several runs of nobody looking.
This mechanises it: fingerprint each unconverted function by the set of symbols
it `bl`s, and rank every matched C function in the tree by how much of that call
set it covers.

A high cover score means "this C function calls the same things in the same
proportion" -- which is what a copied body looks like. It is a lead, not a
verdict: read both and judge. Low-signal targets (0-2 distinct calls) are
reported but rank poorly by nature.

usage:
  python tools/rel_xref.py mini_golf                  # every unconverted fn
  python tools/rel_xref.py mini_golf lbl_00022D4C     # named ones
  python tools/rel_xref.py mini_pilot --top 10 --min-cover 0.5
  python tools/rel_xref.py mini_golf --tree C:/tmp/smbm/mini_golf
"""
import argparse
import collections
import glob
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from rel_sweep import MODULES                                   # noqa: E402

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

BL = re.compile(r'\bbl\s+([A-Za-z_][A-Za-z0-9_]*)')
INSN = re.compile(r'^/\* [0-9A-Fa-f]{8} [0-9A-Fa-f]{8} \*/')
CALL = re.compile(r'\b([A-Za-z_][A-Za-z0-9_]*)\s*\(')
DEFN = re.compile(r'^[A-Za-z_][^;#\n]*\)\s*\{', re.M)

# C keywords and type names that the crude call regex would otherwise pick up
NOISE = {'if', 'for', 'while', 'switch', 'return', 'sizeof', 'do', 'else',
         'struct', 'union', 'enum', 'void', 'int', 'float', 'double', 'char',
         'u8', 'u16', 'u32', 'u64', 's8', 's16', 's32', 's64', 'f32', 'f64',
         'Vec', 'Vec2d', 'Point3d', 'defined', 'static', 'const', 'unsigned',
         'signed', 'long', 'short', 'register', 'volatile', 'asm', 'inline'}


def asm_calls(path):
    """(ordered bl targets, instruction count) for one nonmatchings body."""
    seq, n = [], 0
    with open(path, errors='replace') as f:
        for line in f:
            if INSN.match(line):
                n += 1
            m = BL.search(line)
            if m:
                seq.append(m.group(1))
    return seq, n


def c_functions(path):
    """-> [(name, callset, nlines)].

    Crude: definitions start at column 0 and end at a column-0 '}'. Good enough
    for house style, and asm stubs fall out on their own because their body is
    just `nofralloc` plus an #include, so their call set is empty.
    """
    try:
        with open(path, encoding='utf-8', errors='replace') as f:
            txt = f.read()
    except OSError:
        return []
    out = []
    for m in DEFN.finditer(txt):
        s = m.start()
        e = txt.find('\n}', s)
        if e < 0:
            e = len(txt)
        body = txt[s:e]
        header = txt[s:txt.find('{', s)]
        names = re.findall(r'([A-Za-z_][A-Za-z0-9_]*)\s*\(', header)
        name = names[0] if names else '?'
        calls = {c for c in CALL.findall(body) if c not in NOISE and c != name}
        out.append((name, calls, body.count('\n')))
    return out


def unconverted(tree, stem):
    """Labels still pulled in via #include "../asm/nonmatchings/<stem>/X.s"."""
    inc = re.compile(r'nonmatchings/%s/([A-Za-z0-9_]+)\.s' % re.escape(stem))
    found = set()
    for p in glob.glob(os.path.join(tree, 'src', '%s*.c' % stem)):
        with open(p, encoding='utf-8', errors='replace') as f:
            for line in f:
                if line.lstrip().startswith('#include'):
                    found.update(inc.findall(line))
    return sorted(found)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('module', choices=sorted(MODULES))
    ap.add_argument('labels', nargs='*', help='default: every unconverted fn')
    ap.add_argument('--tree', help='defaults to this repo')
    ap.add_argument('--top', type=int, default=6, help='candidates per target')
    ap.add_argument('--min-cover', type=float, default=0.0,
                    help='hide candidates below this call-set coverage')
    args = ap.parse_args()

    stem = MODULES[args.module][0]
    tree = args.tree or REPO
    asmdir = os.path.join(tree, 'asm', 'nonmatchings', stem)
    if not os.path.isdir(asmdir):
        sys.exit('no %s' % asmdir)

    corpus = []
    for p in sorted(glob.glob(os.path.join(tree, 'src', '*.c'))):
        for name, calls, n in c_functions(p):
            if calls:
                corpus.append((os.path.basename(p), name, calls, n))
    print('corpus: %d matched C functions from %d files'
          % (len(corpus), len(set(c[0] for c in corpus))))

    labels = args.labels or unconverted(tree, stem)
    if not args.labels:
        print('targets: %d unconverted function(s) in %s' % (len(labels), stem))
    print()

    ranked = []
    for t in labels:
        path = os.path.join(asmdir, t + '.s')
        if not os.path.exists(path):
            print('=== %s -- no such body, skipped\n' % t)
            continue
        seq, nins = asm_calls(path)
        want = set(seq)
        if not want:
            continue                        # leaf function: nothing to match on
        scored = []
        for f, name, calls, n in corpus:
            inter = want & calls
            if not inter:
                continue
            cover = len(inter) / float(len(want))
            jacc = len(inter) / float(len(want | calls))
            if cover >= args.min_cover:
                scored.append((cover, jacc, f, name, n))
        scored.sort(reverse=True)
        if scored:
            ranked.append((scored[0][0], scored[0][1], t, nins, scored[0][3]))
        print('=== %s (%d insn, %d calls)  %s'
              % (t, nins, len(want), ' '.join(dict.fromkeys(seq))))
        for cover, jacc, f, name, n in scored[:args.top]:
            print('   %.2f cover  %.2f jacc  %-28s %s (%d lines)'
                  % (cover, jacc, f, name, n))
        if not scored:
            print('   (no C function shares a call)')
        print()

    if len(labels) > 1 and ranked:
        print('=== best lead per target, ranked ===')
        for cover, jacc, t, nins, name in sorted(ranked, reverse=True):
            print('  %.2f cover  %.2f jacc  %-16s %5d insn  <- %s'
                  % (cover, jacc, t, nins, name))


if __name__ == '__main__':
    main()
