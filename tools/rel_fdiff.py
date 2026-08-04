#!/usr/bin/env python3
"""Per-function diff of a built REL .plf against asm/nonmatchings/<mod>/*.s.

Usage: FDIFF_MODULE=<stem> python tools/rel_fdiff.py mkbe.rel_<mod>.plf lbl_X ...

FDIFF_MODULE is the src/asm STEM, not the module name -- they differ for
sel_ngc, whose stem is `sel_ngc_rel`.  There is NO default: run 10 removed the
`mini_race` one because an unset variable silently diffed the module you named
against mini_race's asm, and an unset variable now raises.

RUN 16 -- these two lines used to read "set FDIFF_MODULE to the module name;
defaults to mini_race", i.e. the docstring documented the exact defect the code
was fixed for, and sel_ngc filed it as a live bug.  That is the THIRD
false-or-half-false tool report in three runs caused by stale prose (rel_pdiff
in runs 15 and 16).  Standing rule: fix the prose in the same commit as the
behaviour, and never quote the old expression verbatim -- a grep for it hits
live-looking code.  (The error message below was already correct.)

Function addresses inside the .plf are taken from the link map (they shift as
soon as any converted function's size differs), so this stays valid even when
several functions in the batch are still wrong.
Unresolved cross-object branch placeholders (0x48000000/0x48000001) are ignored.
"""
import re
import struct
import sys
import os

# FDIFF_REPO exists because load_asm() below resolves asm/nonmatchings from THIS
# FILE's location, while the .plf argument is resolved from the cwd.  Run the
# main repo's copy against a warm tree (`rel_sweep --tree`) and you diff that
# tree's binary against the MAIN repo's asm -- which is silently wrong the
# moment a warm copy has re-split .s files.  Callers that cross trees set this.
REPO = os.environ.get('FDIFF_REPO') or os.path.dirname(
    os.path.dirname(os.path.abspath(__file__)))

# RUN 10 (test_mode): this used to DEFAULT to 'mini_race'.  Invoked directly
# without FDIFF_MODULE set -- which is exactly how someone reaches for it when
# debugging -- it silently diffed the module you named against MINI_RACE's asm,
# reporting a confident number about the wrong function, or crashing on a label
# mini_race does not have.  It reads as "hard-coded to mini_race".  Its callers
# (rel_ascore, rel_sweep, rel_regions) all set the variable; nothing else did.
# No default: an unset module is a mistake, not a mini_race request.
MOD = os.environ.get('FDIFF_MODULE')
if not MOD:
    raise SystemExit(
        'FDIFF_MODULE is not set. rel_fdiff resolves asm/nonmatchings/<MOD>/,\n'
        'and it used to default to mini_race -- so this ran green against the\n'
        'wrong module\'s asm.  Set it to the src/asm STEM (note sel_ngc\'s stem\n'
        'is sel_ngc_rel), e.g.:\n'
        '  FDIFF_MODULE=test_mode python tools/rel_fdiff.py mkbe.test_mode.plf lbl_X\n'
        'Or use tools/rel_ascore.py, which takes the module as an argument and\n'
        'scores an ALIGNED diff rather than a raw one.')


def load_text(plf):
    with open(plf, 'rb') as f:
        data = f.read()
    e_shoff, = struct.unpack('>I', data[0x20:0x24])
    e_shentsize, = struct.unpack('>H', data[0x2E:0x30])
    e_shnum, = struct.unpack('>H', data[0x30:0x32])
    e_shstrndx, = struct.unpack('>H', data[0x32:0x34])
    secs = []
    for i in range(e_shnum):
        off = e_shoff + i * e_shentsize
        secs.append(struct.unpack('>IIIIII', data[off:off + 24]))
    strtab = secs[e_shstrndx][4]
    for name, typ, flags, addr, offset, size in secs:
        end = data.index(b'\0', strtab + name)
        if data[strtab + name:end].decode() == '.text':
            return data[offset:offset + size]
    raise SystemExit('no .text')


def load_map(mapfile):
    out, inlayout = {}, False
    for line in open(mapfile, errors='ignore'):
        if line.startswith('.text section layout'):
            inlayout = True
            continue
        if inlayout and 'section layout' in line:
            break
        m = re.match(r'\s*([0-9a-f]{8}) ([0-9a-f]{6}) [0-9a-f]{8}\s+\d+ '
                     r'(lbl_[0-9A-Fa-f]+|_prolog|_epilog|_unresolved)\s', line)
        if inlayout and m:
            out[m.group(3)] = int(m.group(1), 16)
    return out


def load_asm(lbl):
    p = os.path.join(REPO, 'asm', 'nonmatchings', MOD, lbl + '.s')
    rows = []
    for line in open(p):
        m = re.match(r'/\* ([0-9A-F]{8}) ([0-9A-F]{8}) \*/(.*)', line.strip())
        if m:
            rows.append((int(m.group(1), 16), int(m.group(2), 16), m.group(3).strip()))
    return rows


def main():
    plf = sys.argv[1]
    text = load_text(plf)
    addrs = load_map(os.path.splitext(plf)[0] + '.map')
    for lbl in sys.argv[2:]:
        rows = load_asm(lbl)
        base = addrs.get(lbl)
        print('==== %s (%d insn)' % (lbl, len(rows)))
        if base is None:
            print('  -> NOT IN MAP')
            continue
        start = rows[0][0]
        bad = 0
        for addr, word, txt in rows:
            o = base + (addr - start)
            got = int.from_bytes(text[o:o + 4], 'big')
            if got != word and not (got in (0x48000000, 0x48000001)
                                    and (word >> 26) == 18):
                bad += 1
                print('  %08X exp %08X  %-42s got %08X' % (addr, word, txt, got))
        print('  -> %s (%d diffs)' % ('MATCH' if bad == 0 else 'DIFF', bad))


main()
