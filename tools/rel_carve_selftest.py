"""Self-test for rel_carve.parse_entries' byte accounting on REAL data.

The only reason `.data` byte counts matter is that a --data-hole whose start is
not 8-aligned has to be extended BACKWARDS through the previous entry, and that
split is done at a byte offset.  Get the counting wrong and the carve silently
eats or keeps the wrong bytes -- run 9's failure mode, which exited 0.

The check is exact and needs no build: every labelled entry carries its own
`# 0xADDR` comment, so for consecutive labelled entries

    addr(e) + bytes(e) == addr(next e)

must hold for every entry of every section of every data blob in the tree.
Anything else means a directive is being mis-counted.
"""
import glob
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import rel_carve                                          # noqa: E402

REPO = sys.argv[1] if len(sys.argv) > 1 else \
    r'd:/Nonschool Projects/smb-updated-decomp/smb-decomp'

bad = tot = files = 0
for p in sorted(glob.glob(os.path.join(REPO, 'asm', '*.s'))):
    if os.sep + 'nonmatchings' + os.sep in p:
        continue
    lines = open(p, errors='replace').read().replace('\r\n', '\n').split('\n')
    try:
        _, secs, order = rel_carve.split_sections(lines)
    except SystemExit:
        continue
    files += 1
    for sec in order:
        if sec in ('.bss', '.sbss'):
            continue                       # .skip-only; no literals to mis-count
        ents = [e for e in rel_carve.parse_entries(secs[sec]) if e['label']]
        for a, b in zip(ents, ents[1:]):
            if a['addr'] is None or b['addr'] is None:
                continue
            tot += 1
            if a['addr'] + a['bytes'] != b['addr']:
                bad += 1
                if bad <= 12:
                    print('%-30s %-9s %s 0x%X + %d = 0x%X, but next is 0x%X'
                          % (os.path.basename(p), sec, a['label'], a['addr'],
                             a['bytes'], a['addr'] + a['bytes'], b['addr']))

print('\n%d files, %d consecutive-entry checks, %d MISMATCHES' % (files, tot, bad))
sys.exit(1 if bad else 0)
