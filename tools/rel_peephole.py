#!/usr/bin/env python3
"""Insert `#pragma peephole on` after every `asm` block in a rel_split-shaped file.

WHY THIS EXISTS -- run 12's headline finding, confirmed independently by four
modules, each with a golden build:

    The "mixed-TU deopt" is POSITIONAL, and it is ONLY the peephole optimizer.

  | C function alone (pure TU)                        | reference       |
  | `asm` block THEN the C function                   | DIFFERS         |
  | C function THEN the `asm` block                   | BYTE-IDENTICAL  |
  | `asm` block, `#pragma peephole on`, then the C fn | BYTE-IDENTICAL  |

The scheduler is not involved at all -- `#pragma scheduling on`,
`optimization_level` and `global_optimizer` change nothing.  mwcc 1.1's inline
assembler disables the PEEPHOLE for the REMAINDER OF THE TU, so a C function
placed before the asm block was never affected in the first place (mini_race's
one mixed TU has matched since run 8 for exactly that reason).

Consequences: sel_ngc's run-11 deep merge, which came back non-golden with 318
banked instructions broken, gates GOLDEN with this pragma and NO C edit at all.
And `rel_isolate`/`rel_purify` are largely unnecessary -- they exist to achieve
by file surgery what this line achieves in place, and four tools in that family
have silently destroyed a file at exit 0.

Promoted from sel_ngc's `addpeep.py` (run 12), which produced that +719.

usage:
  python tools/rel_peephole.py <file.c> [file.c ...]   # insert (idempotent)
  python tools/rel_peephole.py --list-mixed <module>   # report only, writes nothing

--list-mixed names the files worth running this on: those holding BOTH an `asm`
block and at least one real C function.  It is read-only on purpose -- a file
that is all asm stubs has no C for the peephole to affect, so blanket-applying
the pragma there is churn in a golden file for no gain.
"""
import glob
import io
import os
import re
import sys

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

PRAGMA = '#pragma peephole on\n'

# `asm <ret> name(...)` followed by a brace block closing on a bare `}` line.
ASM_BLOCK = re.compile(
    r'^(?:static[ \t]+)?asm[ \t][^\n]*\n\{\n(?:[^\n]*\n)*?\}\n', re.M)

# A definition that is NOT an asm block: a line starting in column 1 that ends
# in `)` (or `) {`), followed by a brace.  Good enough to tell "this file has
# real C in it" from "this file is nothing but asm stubs".
C_DEF = re.compile(r'^[A-Za-z_][^\n;#]*\)[ \t]*\n?\{', re.M)

MODULES = {
    'mini_bowling': 'mini_bowling', 'mini_race': 'mini_race',
    'mini_fight': 'mini_fight', 'mini_pilot': 'mini_pilot',
    'mini_golf': 'mini_golf', 'mini_billiards': 'mini_billiards',
    'sel_ngc': 'sel_ngc_rel', 'option': 'option', 'test_mode': 'test_mode',
}


def read(path):
    return io.open(path, encoding='utf-8', newline='').read().replace('\r\n', '\n')


def classify(path):
    """-> (n_asm_blocks, has_c) for one file."""
    s = read(path)
    n_asm = len(ASM_BLOCK.findall(s))
    return n_asm, bool(C_DEF.search(ASM_BLOCK.sub('', s)))


def list_mixed(module):
    stem = MODULES[module]
    hits = 0
    for path in sorted(glob.glob(os.path.join(REPO, 'src', stem + '*.c'))):
        n_asm, has_c = classify(path)
        if n_asm and has_c:
            rel = os.path.relpath(path, REPO).replace('\\', '/')
            s = read(path)
            todo = n_asm - s.count(PRAGMA.rstrip('\n'))
            print('  %-40s %2d asm block(s), %d still need the pragma'
                  % (rel, n_asm, max(0, todo)))
            hits += 1
    if not hits:
        print('  %s: no mixed TUs -- nothing for the pragma to do here.' % module)
        print('  (That is a real result: mini_race measured exactly this in run')
        print('   12, which falsified its whole assignment.  Report it.)')
    return hits


def insert(path):
    raw = io.open(path, encoding='utf-8', newline='').read()
    s = raw.replace('\r\n', '\n')
    out, i, n = [], 0, 0
    for m in ASM_BLOCK.finditer(s):
        out.append(s[i:m.end()])
        i = m.end()
        if not s[i:].startswith(PRAGMA):
            out.append(PRAGMA)
            n += 1
    out.append(s[i:])
    # CRLF back out.  (Line endings do NOT affect mwcc's output -- run 12 built
    # all 12 hashes from a tree with 89 bare-LF files -- but matching the tree
    # keeps diffs readable.)
    io.open(path, 'w', encoding='utf-8', newline='\r\n').write(''.join(out))
    print('%s: %d pragma(s) inserted' % (path, n))


def main():
    args = sys.argv[1:]
    if not args:
        sys.exit(__doc__)
    if args[0] == '--list-mixed':
        if len(args) != 2 or args[1] not in MODULES:
            sys.exit('usage: rel_peephole.py --list-mixed <%s>'
                     % '|'.join(sorted(MODULES)))
        return 0 if list_mixed(args[1]) >= 0 else 1
    for path in args:
        if not os.path.exists(path):
            sys.exit('no such file: %s' % path)
    for path in args:
        insert(path)
    return 0


if __name__ == '__main__':
    sys.exit(main())
