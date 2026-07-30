#!/usr/bin/env python3
"""Opcode-spine cross-reference: find an already-matched TEMPLATE for a target.

The highest-yield lever in this project is not writing C from asm -- it is
noticing that the function you are about to write from scratch is a near-copy
of one somebody already matched, in the DOL or in another REL module.

Fingerprint = the MNEMONIC sequence only.  Register numbers, displacements and
symbol names are dropped, so a DOL->REL port (float literals become pool reads,
registers renumbered, calls relocated) still lines up.

Indexes:
  (a) every named .text function in supermonkeyball.elf (the DOL side), and
  (b) every REL asm row in every module,
then reports, for each still-asm target in YOUR module, the best matches --
marking with `*` the ones that are REAL C in the tree, i.e. usable templates.

usage:
  python tools/rel_xref_spine.py <module> [--thresh 0.72] [--tree DIR]
                                 [--targets lbl_X,lbl_Y] [--json out.json]

Run it from the tree you are working in, or pass --tree.

WHAT IT CANNOT DO (run 9): the ranking SATURATES.  19 of mini_race's 82 targets
tied at 1.00 against `nlSprPut`, because a family of sprite-draw wrappers really
does share one opcode spine.  A 1.00 means "same shape", not "same function" --
read the top few, do not take the first.  And it is PROVEN EXHAUSTED in
mini_bowling, mini_fight and sel_ngc: do not re-run it there.
"""
import argparse
import difflib
import glob
import json
import os
import re
import subprocess
import sys

OBJDUMP = 'C:/devkitPro/devkitPPC/bin/powerpc-eabi-objdump.exe'

# warm dir -> src/asm stem.  sel_ngc's dir, stem and target all differ, and
# that has cost an agent time every single run.
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

EXHAUSTED = {'mini_bowling', 'mini_fight', 'sel_ngc'}


def dol_functions(tree, cache):
    """{name: [mnemonics]} for every named DOL .text function."""
    if os.path.exists(cache):
        dis = open(cache, errors='replace').read()
    else:
        elf = None
        for cand in ('supermonkeyball.elf', 'baserom.elf'):
            p = os.path.join(tree, cand)
            if os.path.exists(p):
                elf = p
                break
        if elf is None:
            print('no supermonkeyball.elf/baserom.elf in %s -- DOL side '
                  'skipped (REL-to-REL matching still works)' % tree,
                  file=sys.stderr)
            return {}
        r = subprocess.run([OBJDUMP, '-d', '--section=.text', elf],
                           capture_output=True, text=True)
        dis = r.stdout
        try:
            open(cache, 'w').write(dis)
        except OSError:
            pass

    out, cur = {}, None
    for ln in dis.splitlines():
        m = re.match(r'^[0-9a-f]{8} <(.+)>:', ln)
        if m:
            cur = m.group(1)
            out[cur] = []
            continue
        m = re.match(r'^\s*[0-9a-f]+:\s+(?:[0-9a-f]{2} ){4}\s*(\S+)', ln)
        if m and cur is not None:
            out[cur].append(m.group(1))
    return {k: v for k, v in out.items() if v}


def rel_functions(tree):
    """{'<mod>/<label>': [mnemonics]} across EVERY module -- the point is that
    a template may live in a module you are not working on."""
    out = {}
    for d in sorted(glob.glob(os.path.join(tree, 'asm', 'nonmatchings', '*'))):
        if not os.path.isdir(d):
            continue
        mod = os.path.basename(d)
        for f in sorted(glob.glob(os.path.join(d, '*.s'))):
            ops = re.findall(r'/\* [0-9A-F]{8} [0-9A-F]{8} \*/\s+(\S+)',
                             open(f, errors='replace').read())
            if ops:
                out['%s/%s' % (mod, os.path.basename(f)[:-2])] = ops
    return out


def still_asm(tree, stem):
    """Rows some src/<stem>*.c still #includes -- i.e. the work that is left."""
    out = set()
    inc = re.compile(r'#include "\.\./asm/nonmatchings/%s/([A-Za-z0-9_]+)\.s"'
                     % re.escape(stem))
    for p in glob.glob(os.path.join(tree, 'src', '%s*.c' % stem)):
        out.update(inc.findall(open(p, errors='ignore').read()))
    return out


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('module', choices=sorted(MODULES))
    ap.add_argument('--tree', help='defaults to C:/tmp/smbm/<module>')
    ap.add_argument('--thresh', type=float, default=0.72)
    ap.add_argument('--targets', help='comma-separated labels; default is every '
                                      'still-asm row in the module')
    ap.add_argument('--json', help='write the full ranking here')
    ap.add_argument('--force', action='store_true',
                    help='run even in a module already proven exhausted')
    a = ap.parse_args()

    stem = MODULES[a.module]
    tree = a.tree or 'C:/tmp/smbm/%s' % a.module
    if a.module in EXHAUSTED and not a.force:
        sys.exit('%s was proven EXHAUSTED for spine cross-reference in run 9 -- '
                 'every target was checked and nothing usable came back. Pass '
                 '--force if you have a reason.' % a.module)

    rel = rel_functions(tree)
    cache = os.path.join(tree, 'dol_text.dis')
    dol = dol_functions(tree, cache)
    print('DOL functions: %d   REL asm rows: %d' % (len(dol), len(rel)),
          file=sys.stderr)

    # A candidate is a usable TEMPLATE only if it is real C in the tree.  A
    # still-asm row that happens to look similar teaches you nothing.
    asm_stub = set()
    for f in glob.glob(os.path.join(tree, 'src', '*.c')):
        t = open(f, errors='replace').read()
        asm_stub.update(re.findall(
            r'#include "\.\./asm/nonmatchings/[A-Za-z0-9_]+/([A-Za-z0-9_]+)\.s"', t))
        asm_stub.update(re.findall(
            r'INCLUDE_ASM\([^,]+,\s*"?[A-Za-z0-9_/]+"?\s*,\s*([A-Za-z0-9_]+)', t))

    if a.targets:
        targets = [t.strip() for t in a.targets.split(',') if t.strip()]
    else:
        targets = sorted(still_asm(tree, stem))
    if not targets:
        sys.exit('no still-asm rows in %s -- nothing to cross-reference' % stem)

    cand = ([('DOL:' + k, v) for k, v in dol.items()] +
            [('REL:' + k, v) for k, v in rel.items()])

    out = []
    for lbl in targets:
        ops = rel.get('%s/%s' % (stem, lbl))
        if not ops:
            print('%-16s (no asm row)' % lbl)
            continue
        best = []
        for name, cops in cand:
            if name == 'REL:%s/%s' % (stem, lbl):
                continue
            if not (0.70 * len(ops) <= len(cops) <= 1.42 * len(ops)):
                continue
            sm = difflib.SequenceMatcher(None, ops, cops, autojunk=False)
            if sm.real_quick_ratio() < a.thresh or sm.quick_ratio() < a.thresh:
                continue
            r = sm.ratio()
            if r >= a.thresh:
                best.append((r, name, len(cops)))
        best.sort(reverse=True)
        out.append((lbl, len(ops), best[:8]))
        if best:
            def tag(nm):
                return '' if nm.split('/')[-1] in asm_stub else '*'
            print('%-16s %5d  ' % (lbl, len(ops)) +
                  '  '.join('%.3f %s%s(%d)' % (r, nm, tag(nm), ln)
                            for r, nm, ln in best[:5]))
        else:
            print('%-16s %5d  -' % (lbl, len(ops)))
        sys.stdout.flush()

    if a.json:
        json.dump(out, open(a.json, 'w'), indent=1)
    print('\n"*" = the candidate is real C in the tree, i.e. a usable template.\n'
          'The ranking SATURATES -- a 1.00 means "same opcode shape", not "same\n'
          'function". Read the top few, never just the first.')
    return 0


if __name__ == '__main__':
    sys.exit(main())
