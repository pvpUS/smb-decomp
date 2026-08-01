#!/usr/bin/env python3
"""Magic-double inventory and adjacency test, read off the GOLDEN linked REL.

Run 14 settled the int->float magic economy, and this is the tool that decides
the one question the census cannot:

  * 0x43300000_80000000 is the SIGNED int->float magic
  * 0x43300000_00000000 is the UNSIGNED one
  * mwcc emits ONE magic per TRANSLATION UNIT, shared by every function in it
  * and where a TU needs BOTH, it emits them as ONE CONTIGUOUS 16-BYTE .rodata
    block, in SOURCE FIRST-USE ORDER.

So a function needing both magics is dead if and only if the golden image has
no 16 contiguous bytes equal to [first-used][second-used].  Note what that
means: it is a property of the LINKED IMAGE, not of how the asm happens to be
split today, so this scan is unaffected by the current carve state and cannot
be invalidated by a later re-split.

Run 13 retired 2,303 sel_ngc instructions on the WRONG argument ("no single
object can own both").  mini_billiards falsified that with two compiled probes
in run 14; re-deriving sel_ngc against the linked image with this scan
CONFIRMED the retirement anyway -- both orders absent, closest signed/unsigned
pair 456 bytes apart.  A retirement that survives a corrected premise is worth
more than one that was never checked, and this is how to check it.

usage: python tools/rel_magicscan.py <module> [<module> ...]
       python tools/rel_magicscan.py --all
Run from the tree root, AFTER a build (it reads the built .rel).
"""
import os
import sys

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

MODULES = {
    'mini_bowling':   'mkbe.rel_mini_bowling.rel',
    'mini_race':      'mkbe.rel_mini_race.rel',
    'mini_fight':     'mkbe.rel_mini_fight.rel',
    'mini_pilot':     'mkbe.rel_mini_pilot.rel',
    'mini_golf':      'mkbe.rel_mini_golf.rel',
    'mini_billiards': 'mkbe.rel_mini_billiards.rel',
    'sel_ngc':        'mkbe.sel_ngc.rel',
    'option':         'mkbe.option.rel',
    'test_mode':      'mkbe.test_mode.rel',
}

SIGNED = bytes.fromhex('4330000080000000')
UNSIGNED = bytes.fromhex('4330000000000000')
HI = bytes.fromhex('43300000')


def find_all(hay, needle):
    out, i = [], hay.find(needle)
    while i >= 0:
        out.append(i)
        i = hay.find(needle, i + 1)
    return out


def scan(mod, verbose=True):
    path = os.path.join(REPO, MODULES[mod])
    if not os.path.exists(path):
        print('%-16s -- %s not built' % (mod, MODULES[mod]))
        return None
    data = open(path, 'rb').read()
    sig, uns = find_all(data, SIGNED), find_all(data, UNSIGNED)
    su = find_all(data, SIGNED + UNSIGNED)
    us = find_all(data, UNSIGNED + SIGNED)
    # closest cross-signedness pair -- the number that decides a two-magic
    # function's fate when neither adjacency order is present
    closest = min((abs(u - s) for s in sig for u in uns), default=None)

    if verbose:
        print('\n=== %s (%s, %d bytes) ===' % (mod, MODULES[mod], len(data)))
        print('  0x43300000 high-word occurrences: %d' % len(find_all(data, HI)))
        print('  SIGNED   %d at %s' % (len(sig), ['0x%X' % x for x in sig]))
        print('  UNSIGNED %d at %s' % (len(uns), ['0x%X' % x for x in uns]))
        print('  contiguous [SIGNED][UNSIGNED]: %d %s'
              % (len(su), ['0x%X' % x for x in su]))
        print('  contiguous [UNSIGNED][SIGNED]: %d %s'
              % (len(us), ['0x%X' % x for x in us]))
        if closest is not None:
            print('  closest signed/unsigned pair: %d bytes apart' % closest)
        if not sig and not uns:
            print('  -- no magic in the image: any a-BLOCKED function here '
                  'needs a CARVE, not a merge (test_mode was this case)')
        elif not su and not us:
            print('  -- neither order present: a function needing BOTH magics '
                  'is DEAD unless a carve creates the block')
    return dict(mod=mod, signed=len(sig), unsigned=len(uns),
                su=len(su), us=len(us), closest=closest)


def main():
    args = [a for a in sys.argv[1:] if not a.startswith('-')]
    mods = list(MODULES) if '--all' in sys.argv[1:] else args
    if not mods:
        sys.exit(__doc__)
    unknown = [m for m in mods if m not in MODULES]
    if unknown:
        sys.exit('unknown module(s): %s\nknown: %s'
                 % (', '.join(unknown), ', '.join(MODULES)))
    rows = [r for r in (scan(m) for m in mods) if r]
    print('\n=== summary ===')
    print('%-16s %7s %9s %8s %8s %9s' % ('module', 'signed', 'unsigned',
                                         'S+U', 'U+S', 'closest'))
    for r in rows:
        print('%-16s %7d %9d %8d %8d %9s'
              % (r['mod'], r['signed'], r['unsigned'], r['su'], r['us'],
                 '-' if r['closest'] is None else r['closest']))
    print('\nS+U / U+S are contiguous 16-byte blocks: a function needing both '
          'magics\nis reachable only through one of those, in its own '
          'source first-use order.')


if __name__ == '__main__':
    main()
