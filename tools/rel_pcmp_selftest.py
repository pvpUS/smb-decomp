#!/usr/bin/env python3
"""Regression test for rel_pcmp's normalisation.

Run 14 found FOUR separate defects in rel_pcmp/rel_pdiff, every one of which
inflated near-miss scores that the next run then acts on.  On five functions
that are byte-exact in the tree today, the pre-fix scorer reported 15 phantom
diffs -- including 10 in 10 on mini_race's lbl_000021C8, which that module had
independently measured as "10 of 16 reported diffs were phantom, and the
variant was a byte-exact MATCH".

A scorer that lies about proximity is worse than no scorer: it sends the next
agent down the wrong axis for a whole run.  So it gets a test.

usage: python tools/rel_pcmp_selftest.py      # from the tree root, after a build
"""
import os
import re
import subprocess
import sys

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(REPO, 'tools'))
os.chdir(REPO)
import rel_pcmp as pcmp  # noqa: E402

OBJDUMP = 'C:/devkitPro/devkitPPC/bin/powerpc-eabi-objdump.exe'

# Pairs the two disassemblers spell differently for ONE encoding.  The asm side
# is asm/nonmatchings/*.s, the got side is powerpc-eabi-objdump.
PAIRS = [
    ('mr. r3,r4',           'or. r3,r4,r4'),      # 112 occurrences project-wide
    ('mr r31,r3',           'or r31,r3,r3'),
    ('not r3,r4',           'nor r3,r4,r4'),
    ('cror eq,lt,eq',       'cror 2,0,2'),
    ('cror 4*cr1+eq,lt,eq', 'cror 6,0,2'),
    ('crclr 4*cr1+eq',      'crxor 6,6,6'),
    ('crset eq',            'creqv 2,2,2'),
    ('crmove eq,lt',        'cror 2,0,0'),
    ('clrrwi r3,r4,2',      'rlwinm r3,r4,0,0,29'),
    ('clrlwi r3,r4,16',     'rlwinm r3,r4,0,16,31'),
    ('slwi r3,r4,3',        'rlwinm r3,r4,3,0,28'),
    ('srwi r3,r4,8',        'rlwinm r3,r4,24,8,31'),
    ('rotlwi r3,r4,7',      'rlwinm r3,r4,7,0,31'),
    ('extlwi r3,r4,8,4',    'rlwinm r3,r4,4,0,7'),
    ('nop',                 'ori r0,r0,0'),
    ('li r3,5',             'addi r3,r0,5'),
    ('lis r3,0',            'addis r3,r0,0'),
    ('subi r3,r4,8',        'addi r3,r4,-8'),
    ('mtctr r12',           'mtspr 9,r12'),
    ('mflr r0',             'mfspr 8,r0'),
    # one encoding, two immediate spellings (test_mode's addis rX,rX,-1)
    ('addis r4,r4,0xffff',  'addis r4,r4,-1'),
    ('addi r3,r3,0x8000',   'addi r3,r3,-32768'),
    ('ori r3,r3,0xffff',    'ori r3,r3,65535'),
]

# A canonicaliser that MERGES distinct encodings is far worse than one that
# misses a pair: it manufactures a false MATCH.  These must stay apart.
DISTINCT = [
    ('mr r3,r4',      'mr r3,r5'),
    ('slwi r3,r4,3',  'slwi r3,r4,4'),
    ('cror 2,0,2',    'cror 2,0,1'),
    ('addi r3,r4,-1', 'addi r3,r4,1'),
    ('or r3,r4,r5',   'or r3,r4,r4'),
]

# Functions converted in run 14, byte-exact in the tree, each module GOLDEN.
CASES = [
    ('mini_race',  'lbl_000021C8', 'src/mini_race_11b.c.o'),
    ('mini_race',  'lbl_0000118C', 'src/mini_race_9g.c.o'),
    ('mini_golf',  'lbl_0000F7E8', 'src/mini_golf_41.c.o'),
    ('test_mode',  'lbl_0000C260', 'src/test_mode_97.c.o'),
    ('mini_pilot', 'lbl_00009FB0', 'src/mini_pilot_32b.c.o'),
]


def canon1(text):
    mn, _, ops = text.partition(' ')
    mn2, _, ops2 = pcmp.canon(mn, ops.strip()).partition(' ')
    return pcmp.to_words(['%s %s' % (mn2, ops2.replace(' ', ''))])[0]


def objdump_fn(objpath, fn):
    r = subprocess.run([OBJDUMP, '-d', '--no-show-raw-insn', objpath],
                       capture_output=True, text=True)
    lines, on = [], False
    for line in r.stdout.splitlines():
        m = re.match(r'^[0-9a-f]+ <(.+)>:', line)
        if m:
            on = (m.group(1) == fn)
            continue
        if on and re.match(r'\s*[0-9a-f]+:', line):
            lines.append(line)
    return '====\n' + '\n'.join(lines)


def main():
    fails = 0
    print('=== spellings that must collapse ===')
    for a, b in PAIRS:
        ok = canon1(a) == canon1(b)
        fails += not ok
        print('  %-24s %-24s %s' % (a, b, 'ok' if ok else 'FAIL'))

    print('=== distinct encodings that must STAY distinct ===')
    for a, b in DISTINCT:
        ok = canon1(a) != canon1(b)
        fails += not ok
        print('  %-24s %-24s %s' % (a, b, 'ok' if ok else 'FAIL (collapsed!)'))

    print('=== byte-exact functions must score 0 in 0 ===')
    for mod, label, obj in CASES:
        spath = os.path.join(REPO, 'asm', 'nonmatchings', pcmp.asm_stem(mod),
                             label + '.s')
        if not (os.path.exists(spath) and os.path.exists(obj)):
            print('  %-11s %-16s SKIP (not built / not present)' % (mod, label))
            continue
        exp = pcmp.parse_s(spath)
        got = pcmp.parse_obj(objdump_fn(obj, label), label)
        if not got:
            print('  %-11s %-16s SKIP (fn not in object)' % (mod, label))
            continue
        n, reg, _, _ = pcmp.score(exp, got)
        ok = (n == 0 and reg == 0 and len(exp) == len(got))
        fails += not ok
        print('  %-11s %-16s %d in %d   exp %d / got %d   %s'
              % (mod, label, n, reg, len(exp), len(got), 'ok' if ok else 'FAIL'))

    fails += check_regblind()

    print('\n%s (%d failure(s))' % ('ALL PASS' if not fails else 'FAILURES',
                                    fails))
    return 1 if fails else 0


# PCMP_REGBLIND is what decides whether a near-miss gets a type/rank sweep or
# is written off as structural, so a wrong blind costs a whole run.  Run 15
# added the uppercase all-register form after option measured `gf` calling one
# of its functions structural (23 in 22) that an all-register blind put at
# 4 in 3 -- pure callee-saved rank, which IS sweepable.
#
# r1 and r2 must survive EVERY mode: they are not allocatable, so blinding them
# would hide a real frame or SDA difference and manufacture a false MATCH.
BLIND_CASES = [
    # mode, instruction, must-blind, must-stay-exact
    ('gf', 'mr r31,r3',        ['r3'],         ['r31']),
    ('gf', 'fmr f31,f1',       ['f1'],         ['f31']),
    ('GF', 'mr r31,r3',        ['r31', 'r3'],  []),
    ('GF', 'fmr f31,f1',       ['f31', 'f1'],  []),
    ('G',  'fmr f31,f1',       [],             ['f31', 'f1']),
    ('F',  'mr r31,r3',        [],             ['r31', 'r3']),
    ('GF', 'stw r0,8(r1)',     ['r0'],         ['r1']),
    ('GF', 'lwz r2,4(r2)',     [],             ['r2']),
    ('GF', 'add r29,r14,r12',  ['r29', 'r14', 'r12'], []),
]


def check_regblind():
    """Re-import rel_pcmp under each mode -- BLIND is read at import time."""
    import importlib
    print('=== PCMP_REGBLIND ===')
    fails = 0
    saved = os.environ.get('PCMP_REGBLIND', '')
    for mode, insn, gone, kept in BLIND_CASES:
        os.environ['PCMP_REGBLIND'] = mode
        importlib.reload(pcmp)
        out = pcmp.to_words([insn])[0]
        bad = [r for r in gone if re.search(r'\b%s\b' % r, out)] + \
              [r for r in kept if not re.search(r'\b%s\b' % r, out)]
        fails += bool(bad)
        print('  %-3s %-20s -> %-22s %s'
              % (mode, insn, out, 'ok' if not bad else 'FAIL %s' % bad))
    os.environ['PCMP_REGBLIND'] = saved
    importlib.reload(pcmp)
    return fails


if __name__ == '__main__':
    sys.exit(main())
