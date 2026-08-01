#!/usr/bin/env python3
"""Side-by-side aligned diff of ONE probe against the original .s.

Same normalisation as pcmp.py (imported from it, so they can never drift).
Prints each edit region with N instructions of context, expected on the left,
got on the right, with the ORIGINAL (unmasked) text alongside so you can read
which symbol each masked 0 stands for.

usage: python pdiff.py <label> <probe.c> [funcname] [context]
Run from the module tree root.
"""
import difflib
import os
import re
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import rel_pcmp as pcmp  # noqa: E402

TREE = os.getcwd()


def raw_s(path):
    out = []
    for line in open(path, encoding='utf-8', errors='replace'):
        m = re.match(r'/\* [0-9A-F]{8} ([0-9A-F]{8}) \*/\s+(.*)', line)
        if m:
            out.append(' '.join(m.group(2).split()))
    return out


def raw_obj(text):
    out = []
    started = False
    for line in text.splitlines():
        if line.startswith('===='):
            started = True
            continue
        m = re.match(r'\s*([0-9a-f]+):\t(.*)', line)
        if started and m:
            out.append(' '.join(m.group(2).split()))
    return out


def main():
    label = sys.argv[1]
    probe = sys.argv[2]
    fn = sys.argv[3] if len(sys.argv) > 3 else 'pf'
    ctx = int(sys.argv[4]) if len(sys.argv) > 4 else 3
    # Was `os.environ.get('PCMP_MODULE', 'mini_bowling')` -- a hardcoded default
    # that read mini_bowling's asm from inside every other module's tree, so it
    # died with a misleading FileNotFoundError (or, worse, silently diffed
    # against the wrong module's function of the same label).  FOUR separate
    # modules reported this in run 14.  Defer to rel_pcmp, which infers it.
    mod = pcmp.probe_module()
    spath = os.path.join(TREE, 'asm', 'nonmatchings', pcmp.asm_stem(mod),
                         label + '.s')
    exp = pcmp.parse_s(spath)
    expraw = raw_s(spath)
    r = subprocess.run(
        [sys.executable, os.path.join(TREE, 'tools', 'rel_probe.py'),
         mod, '--func', fn, probe],
        capture_output=True, text=True, cwd=TREE)
    text = r.stdout + r.stderr
    got = pcmp.parse_obj(text, fn)
    gotraw = raw_obj(text)
    if not got:
        print(text.strip()[-2000:])
        return
    a = pcmp.to_words(exp)
    b = pcmp.to_words(got)
    sm = difflib.SequenceMatcher(None, a, b, autojunk=False)
    ops = sm.get_opcodes()
    total = sum(max(i2 - i1, j2 - j1)
                for t, i1, i2, j1, j2 in ops if t != 'equal')
    nreg = sum(1 for t, *_ in ops if t != 'equal')
    print('%s  %s  aligned %d in %d regions   exp %d insn / got %d insn'
          % (label, os.path.basename(probe), total, nreg, len(exp), len(got)))
    for k, (t, i1, i2, j1, j2) in enumerate(ops):
        if t == 'equal':
            continue
        lo = max(0, i1 - ctx)
        print('--- region %d: exp[%d:%d] vs got[%d:%d] ---' % (k, i1, i2, j1, j2))
        for x in range(lo, i1):
            print('  %4d  %-42s | %s' % (x, expraw[x], gotraw[x - i1 + j1]
                                         if 0 <= x - i1 + j1 < len(gotraw) else ''))
        n = max(i2 - i1, j2 - j1)
        for x in range(n):
            le = expraw[i1 + x] if i1 + x < i2 and i1 + x < len(expraw) else ''
            ri = gotraw[j1 + x] if j1 + x < j2 and j1 + x < len(gotraw) else ''
            print('* %4d  %-42s | %s' % (i1 + x, le, ri))
        for x in range(i2, min(len(expraw), i2 + ctx)):
            y = j2 + (x - i2)
            print('  %4d  %-42s | %s' % (x, expraw[x],
                                         gotraw[y] if y < len(gotraw) else ''))
        print()


if __name__ == '__main__':
    main()
