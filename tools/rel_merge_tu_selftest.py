#!/usr/bin/env python3
"""Regression test for rel_merge_tu's head union.

Merging is the project's primary lever now -- run 14 landed 22-, 21-, 14-, 13-,
9-, 7-, 6- and 3-file merges -- and this tool carried SIX known defects into
run 15, three modules having reported them independently.  Every one of them
corrupts a head silently: the merge reports success, and you find out at the
mwcc error cascade, or worse, at a match you no longer have.

That is the same failure mode as run 14's scorer defects, so it gets the same
treatment: a test that asserts both directions.  Each case below names the
defect it pins.

usage: python tools/rel_merge_tu_selftest.py      # no tree needed
"""
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import rel_merge_tu as M  # noqa: E402

fails = []


def check(name, cond, detail=''):
    if cond:
        print('  ok    %s' % name)
    else:
        print('  FAIL  %s%s' % (name, ('\n        ' + detail) if detail else ''))
        fails.append(name)


def merge(*heads):
    files = ['src/m_%d.c' % i for i in range(len(heads))]
    return M.merge_heads(list(heads), files)


def items_of(text):
    """split_items keeps blank separators as items; count only real ones."""
    return [i for i in M.split_items(text) if M.code_of(i)]


# --- DEFECT 3: a tag declarator and its body must stay ONE item -------------
# The old split_items closed an item at every depth-0 line, so `struct Foo` and
# its `{...};` body became two.  A duplicate tag then dropped the name line and
# carried the BODY, leaving an orphan top-level `{...};`.
TAG = 'struct Foo\n{\n    u8 a;\n    u8 b;\n};'
items = M.split_items(TAG)
check('defect 3: struct declarator + body is one item', len(items) == 1,
      'got %d items: %r' % (len(items), items))

out, notes, conf = merge('#include "x.h"\n' + TAG + '\n', TAG + '\n')
check('defect 3: duplicate tag produces no orphan block',
      out.count('struct Foo') == 1 and '// Carried over' not in out,
      out)

# --- DEFECT 4: a strict SUPERSET tag body must win over the base's ----------
SMALL = 'struct Bar\n{\n    u8 a;\n};'
BIG = 'struct Bar\n{\n    u8 a;\n    u8 b;\n    u8 c;\n};'
out, notes, conf = merge(SMALL + '\n', BIG + '\n')
check('defect 4: superset tag body replaces the base subset',
      'u8 c;' in out and out.count('struct Bar') == 1, out)
out, notes, conf = merge(BIG + '\n', SMALL + '\n')
check('defect 4: subset tag body does NOT replace the base superset',
      'u8 c;' in out and out.count('struct Bar') == 1, out)

# --- DEFECTS 1 + 2: a conflicting DATA extern must be REPORTED --------------
# lbl_80285A80 is the real symbol: `struct PilotTgtRow[]` vs `u8[]`, and it is
# why 1,290 mini_pilot instructions are still parked.
U8 = 'extern u8 lbl_80285A80[];\n'
ST = 'extern struct PilotTgtRow lbl_80285A80[];\n'
out, notes, conf = merge(U8, ST)
check('defect 1: data conflict is reported', 'lbl_80285A80' in conf,
      'conflicts=%r' % conf)
check('defect 1: both forms are named in the report',
      len(conf.get('lbl_80285A80', {})) == 2, 'conflicts=%r' % conf)
check('defect 1: base form is kept, not silently swapped',
      'extern u8 lbl_80285A80[];' in out and 'PilotTgtRow' not in out, out)
# ...and in the other direction: the richer base must not be overwritten either
out, notes, conf = merge(ST, U8)
check('defect 2: richer base data decl survives an absorbed weaker one',
      'PilotTgtRow' in out and 'extern u8 lbl_80285A80[];' not in out, out)
check('defect 2: that direction is reported too', 'lbl_80285A80' in conf,
      'conflicts=%r' % conf)

# A data extern that AGREES must not be reported as a conflict.
out, notes, conf = merge(U8, U8)
check('data: identical decls are not a conflict', not conf, 'conflicts=%r' % conf)

# --- DEFECTS 5 AND 6: both include directions are REPORTED, neither acted on
# These two pull against each other, so the tool must not decide.  Defect 5 is
# a dropped include -- a loud mwcc error.  Defect 6 is an include added back
# over a deliberate absence -- src/mini_bowling_26.c omits sound.h so its own
# SoundIcsReq(u32,int,int) beats the header's (u32,u8,s8) -- and the tempting
# repair for that one silently loses a match.  Reported, never applied.
out, notes, conf = merge('#include "a.h"\nextern void f(void);\n',
                         '#include "b.h"\nextern void g(void);\n')
check('defect 5: an absorbed #include the base lacks is reported',
      any('b.h' in n and 'NOT carried' in n for n in notes), repr(notes))
check('defect 5: and is NOT silently injected', '#include "b.h"' not in out, out)

out, notes, conf = merge('#include "sound.h"\nextern void f(void);\n',
                         'void SoundIcsReq(u32, int, int);\n')
check('defect 6: a base include the absorbed head lacks is warned about',
      any('sound.h' in n and 'does NOT have' in n for n in notes), repr(notes))
check('defect 6: the deliberate absence is not "repaired"',
      out.count('#include "sound.h"') == 1, out)

# A commented-out include must not count as present -- that is one way a head
# records a deliberate absence.
check('includes: a commented-out include does not count',
      M.includes_of('// #include "sound.h"\n#include "a.h"\n') ==
      ['#include "a.h"'],
      repr(M.includes_of('// #include "sound.h"\n#include "a.h"\n')))

# --- DEFECT 7 (found by replaying the fix over the tree): a MULTI-LINE
# prototype was never parsed as one item, so the run-11/12 retype
# reconciliation silently never fired for one.  Real case: mini_bowling_39.c
# carries `void lbl_0000E894(void);` while _39i.c carries the real
# `f32 lbl_0000E894(Vec *, Vec *, Vec *, f32 *, s32 *, f32);` across two lines.
# The old tool kept BOTH -- the weak base decl plus an unkeyed fragment.
ML = ('f32 lbl_0000E894(Vec *pos, Vec *prevPos, Vec *outNormal, f32 *outDepth,\n'
      '                 s32 *outType, f32 radius);\n')
check('defect 7: a multi-line prototype is one item',
      len(items_of(ML)) == 1, repr(items_of(ML)))
check('defect 7: and it keys on its symbol',
      M.decl_key(ML) == 'lbl_0000E894', 'key=%r' % M.decl_key(ML))
out, notes, conf = merge('void lbl_0000E894(void);\n', ML)
check('defect 7: it retypes the base\'s weak generated prototype',
      'f32 lbl_0000E894(Vec' in out and 'void lbl_0000E894(void);' not in out,
      out)

# --- a multi-line MACRO must not be shredded into orphan fragments ----------
# The old splitter emitted each continuation line as its own top-level item and
# carried the fragments into the merged head.  Real case: test_mode_41.c.
MAC = ('#define REP_OR_TRIG(btn)                                          \\\n'
       '    ((rep & (btn)) || (analogInputs[0].repeat & (btn)))           \\\n'
       ' || ((controllerInfo[0].held.button & (btn)))\n')
check('macro: a continued #define is one item',
      len(items_of(MAC)) == 1, repr(items_of(MAC)))
out, notes, conf = merge('extern void f(void);\n', MAC)
check('macro: it is not shredded into the merged head',
      'analogInputs' not in out, out)
check('macro: and the base being without it is reported',
      any('preprocessor line the base lacks' in n for n in notes), repr(notes))

# --- parsing: a trailing comment must not break classification -------------
# This is how the project annotates a retyped extern, and the old code tested
# raw text for a terminating `;`.
ann = 'extern u8 lbl_802F1FF4[];  // retyped by _10d\n'
check('parse: trailing-comment data decl is classified as data',
      M.kind(ann) == 'data', 'kind=%r' % M.kind(ann))
check('parse: trailing-comment data decl keys on its symbol',
      M.decl_key(ann) == 'lbl_802F1FF4', 'key=%r' % M.decl_key(ann))
out, notes, conf = merge('extern u8 lbl_802F1FF4[];\n', ann)
check('parse: it dedupes against the uncommented form',
      out.count('lbl_802F1FF4') == 1, out)

check('parse: a tag keys in its own namespace',
      M.decl_key('struct Foo\n{\n u8 a;\n};') == 'struct Foo',
      'key=%r' % M.decl_key('struct Foo\n{\n u8 a;\n};'))
check('parse: a function decl is classified as func',
      M.kind('void lbl_00001234(struct Sprite *s);') == 'func')
check('parse: plain one-line decls still split one per item',
      len(M.split_items('extern int a;\nextern int b;\n')) == 3)

# --- REGRESSION: the run-11/12 prototype rule must still hold ---------------
# An absorbed head's GENERATED `void lbl_X(void);` must never overwrite a
# retyped one the base already carries.
RICH = 'void lbl_00001234(struct Sprite *sprite);\n'
POOR = 'void lbl_00001234(void);\n'
out, notes, conf = merge(RICH, POOR)
check('regression: generated void proto does not overwrite a retyped one',
      'struct Sprite *sprite' in out, out)
out, notes, conf = merge(POOR, RICH)
check('regression: a retyped absorbed proto DOES replace the base void one',
      'struct Sprite *sprite' in out and out.count('lbl_00001234') == 1, out)
check('regression: and that replacement is reported',
      any('retypes it' in n for n in notes), repr(notes))

# --- REGRESSION: a func/data name collision must not cross kinds -----------
out, notes, conf = merge('extern u8 Foo[];\n', 'struct Foo\n{\n u8 a;\n};\n')
check('regression: object Foo and tag Foo do not collide',
      'extern u8 Foo[];' in out and 'struct Foo' in out and not conf, out)

print()
if fails:
    print('%d FAILED: %s' % (len(fails), ', '.join(fails)))
    sys.exit(1)
print('all rel_merge_tu head-union checks passed')
