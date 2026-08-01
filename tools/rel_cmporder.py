#!/usr/bin/env python3
"""Settle COMPARE OPERAND ORDER in mwcc 1.1 with a factorial probe.

For every cell of (operand type) x (context) x (operand kind) x (relation) we
compile TWO spellings that are semantically identical and differ only in the
order the two operands are written:

    a < b     vs   b > a
    a <= b    vs   b >= a
    a == b    vs   b == a
    a != b    vs   b != a

then disassemble both and compare.  IDENTICAL => mwcc canonicalises the compare
and operand order is INERT for that cell.  DIFFERENT => order is LIVE and is a
source-level lever.

No original asm is involved: this measures the compiler, not a match.

usage: python cmporder.py [outdir]
Run from the module tree root.
"""
import os
import re
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
TREE = os.getcwd()
MOD = os.environ.get('PCMP_MODULE', 'mini_bowling')
PRE = open(os.path.join(HERE, 'preamble.h'), encoding='utf-8',
           errors='replace').read()

MIRROR = {'<': '>', '>': '<', '<=': '>=', '>=': '<=', '==': '==', '!=': '!='}

# (tag, C type, a literal of that type used as the constant operand)
TYPES = [
    ('int', 'int', '5'),
    ('s32', 's32', '5'),
    ('u32', 'u32', '5'),
    ('s8', 's8', '5'),
    ('s16', 's16', '5'),
    ('f32', 'f32', '1.0f'),
    ('f64', 'f64', '1.0'),
    ('ptr', 'u8 *', '0'),
]

RELS = ['<', '>', '<=', '>=', '==', '!=']

# context templates.  {T} = type, {C} = the comparison expression
CTX = {
    # compare consumed directly by a conditional branch
    'branch': 'int pf({T} a, {T} b)\n{{\n    if ({C})\n        return 1;\n'
              '    return 2;\n}}\n',
    # compare materialised as a VALUE (0/1) rather than branched on
    'value': 'int pf({T} a, {T} b)\n{{\n    return {C};\n}}\n',
    # compare in a ternary
    'ternary': 'int pf({T} a, {T} b)\n{{\n    return {C} ? 11 : 22;\n}}\n',
    # compare controlling a loop
    'loop': 'int pf({T} a, {T} b)\n{{\n    int n = 0;\n    while ({C})\n'
            '    {{\n        n++;\n        a = ({T})(n);\n    }}\n'
            '    return n;\n}}\n',
    # compare inside a short-circuit &&
    'andand': 'int pf({T} a, {T} b)\n{{\n    if ({C} && b != ({T})7)\n'
              '        return 1;\n    return 2;\n}}\n',
}


def disasm(path):
    r = subprocess.run(
        [sys.executable, os.path.join(TREE, 'tools', 'rel_probe.py'),
         MOD, '--func', 'pf', path],
        capture_output=True, text=True, cwd=TREE)
    text = r.stdout + r.stderr
    out = []
    started = False
    for line in text.splitlines():
        if line.startswith('===='):
            started = True
            continue
        m = re.match(r'\s*([0-9a-f]+):\t(.*)', line)
        if started and m:
            out.append(' '.join(m.group(2).split()))
    if not out:
        return None, text
    return out, text


def main():
    outdir = sys.argv[1] if len(sys.argv) > 1 else \
        os.path.join(TREE, '_cmporder')
    os.makedirs(outdir, exist_ok=True)
    rows = []
    for ttag, ctype, lit in TYPES:
        for ctag, tmpl in CTX.items():
            if ctag == 'loop' and ttag in ('f32', 'f64', 'ptr'):
                continue
            if ctag == 'andand' and ttag == 'ptr':
                continue
            for rel in RELS:
                mrel = MIRROR[rel]
                for kind, ea, eb in (
                        ('reg_reg', 'a %s b' % rel, 'b %s a' % mrel),
                        ('reg_const', 'a %s (%s)%s' % (rel, ctype, lit),
                         '(%s)%s %s a' % (ctype, lit, mrel))):
                    if kind == 'reg_const' and ttag == 'ptr':
                        continue
                    name = '%s_%s_%s_%s' % (ttag, ctag, kind,
                                            rel.replace('<', 'lt')
                                            .replace('>', 'gt')
                                            .replace('=', 'e')
                                            .replace('!', 'n'))
                    pa = os.path.join(outdir, name + '_A.c')
                    pb = os.path.join(outdir, name + '_B.c')
                    for path, expr in ((pa, ea), (pb, eb)):
                        if os.path.exists(path):
                            continue
                        body = tmpl.format(T=ctype, C=expr)
                        open(path, 'w', encoding='utf-8',
                             newline='').write(PRE + '\n' + body)
                    da, ta = disasm(pa)
                    db, tb = disasm(pb)
                    if da is None or db is None:
                        rows.append((name, 'FAIL', ea, eb, 0))
                        continue
                    same = (da == db)
                    ndiff = sum(1 for x, y in zip(da, db) if x != y) \
                        + abs(len(da) - len(db))
                    rows.append((name, 'INERT' if same else 'LIVE',
                                 ea, eb, ndiff))
    live = [r for r in rows if r[1] == 'LIVE']
    fail = [r for r in rows if r[1] == 'FAIL']
    with open(os.path.join(outdir, 'results.csv'), 'w',
              encoding='utf-8', newline='') as f:
        f.write('cell,result,ndiff,A,B\n')
        for name, res, ea, eb, nd in rows:
            f.write('%s,%s,%d,"%s","%s"\n' % (name, res, nd, ea, eb))
    # summary matrix: type x context, per relation
    print('=== operand order: LIVE (order preserved) / inert (canonicalised)'
          ' ===')
    print('%-6s %-9s %-10s %s' % ('type', 'context', 'kind',
                                  '  '.join('%-4s' % r for r in RELS)))
    seen = {}
    for name, res, ea, eb, nd in rows:
        parts = name.split('_')
        rel = parts[-1]
        kind = '_'.join(parts[-3:-1])
        ctag = parts[-4]
        ttag = '_'.join(parts[:-4])
        seen.setdefault((ttag, ctag, kind), {})[rel] = res
    order = []
    for ttag, _c, _l in TYPES:
        for ctag in CTX:
            for kind in ('reg_reg', 'reg_const'):
                if (ttag, ctag, kind) in seen:
                    order.append((ttag, ctag, kind))
    relkeys = [r.replace('<', 'lt').replace('>', 'gt')
               .replace('=', 'e').replace('!', 'n') for r in RELS]
    for key in order:
        d = seen[key]
        cells = []
        for rk in relkeys:
            v = d.get(rk, '-')
            cells.append('%-4s' % ('LIVE' if v == 'LIVE'
                                   else ('.' if v == 'INERT' else v)))
        print('%-6s %-9s %-10s %s' % (key[0], key[1], key[2],
                                      '  '.join(cells)))
    print()
    print('%d cells: %d INERT, %d LIVE, %d FAIL'
          % (len(rows), len(rows) - len(live) - len(fail), len(live),
             len(fail)))


if __name__ == '__main__':
    main()
