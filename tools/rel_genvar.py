#!/usr/bin/env python3
"""Generate full .c variant files for `rel_sweep --sweep`.

usage: python genvar.py <base_src.c> <variants.py> <outdir>

variants.py defines VARIANTS = [(name, body_text), ...]; body_text replaces
everything from the first '#pragma force_active on' to EOF of the base file.
This only WRITES FILES -- it never builds.  rel_sweep does the building.

--------------------------------------------------------------------------
RUN-8 FIX (mini_race): a forward-declaration mismatch no longer silently
kills a whole sweep.
--------------------------------------------------------------------------
The head (everything above `#pragma force_active on`) is copied verbatim, and
it contains the generated prototypes, e.g.

    void lbl_0000D41C(void);

If a variant's DEFINITION has a different parameter list -- the normal case,
since you are usually still discovering the signature -- one of two things
happens, and neither looks like what it is:

  * mwcc rejects the pair and `rel_sweep` reports a bare `BUILD FAILED`.  In one
    mini_race sweep 86 of 132 variants died this way, and the sweep looked
    exhausted when it had never actually run.
  * worse, with a `(void)` prototype and a `(s16, f32, f32)` definition mwcc
    compiles and reports `undefined identifier 'x'` for each PARAMETER, which
    reads like a typo in the body rather than a prototype clash.

Fix: for every function DEFINED in a variant body, rewrite that function's
prototype in the head to match the definition's declarator.  Prototypes for
labels the variant does not define are left alone.  Every rewrite is printed
once, so a signature you did not mean to change is visible rather than silent.
"""
import os
import re
import sys

base = sys.argv[1]
varf = sys.argv[2]
outdir = sys.argv[3]

s = open(base, encoding='utf-8', errors='surrogateescape').read()
i = s.index('#pragma force_active on')
head = s[:i]

ns = {}
exec(open(varf, encoding='utf-8').read(), ns)

os.makedirs(outdir, exist_ok=True)
for f in os.listdir(outdir):
    if f.endswith('.c'):
        os.remove(os.path.join(outdir, f))

# A function definition: optional storage class / `asm`, return type, name,
# (params), then '{' on this line or the next.  Captures the whole declarator so
# the rewritten prototype is character-for-character what the definition says.
DEFN = re.compile(
    r'^[ \t]*((?:static[ \t]+)?(?:asm[ \t]+)?[A-Za-z_][A-Za-z0-9_ \t\*]*?'
    r'\b([A-Za-z_][A-Za-z0-9_]*)[ \t]*\(([^;{]*?)\))[ \t]*\r?\n?[ \t]*\{',
    re.M)


def fix_head(head, body):
    """Rewrite head prototypes so they match the definitions in `body`."""
    changed = []
    for m in DEFN.finditer(body):
        declarator, name = m.group(1), m.group(2)
        proto = re.sub(r'\basm[ \t]+', '', declarator).strip()
        pat = re.compile(
            r'^[ \t]*(?:static[ \t]+)?[A-Za-z_][A-Za-z0-9_ \t\*]*?\b'
            + re.escape(name) + r'[ \t]*\([^;]*\)[ \t]*;[ \t]*$', re.M)
        hits = pat.findall(head)
        if not hits:
            continue
        old = hits[0].strip()
        if old.rstrip(';').strip() == proto:
            continue
        head = pat.sub(lambda _m, p=proto: p + ';', head, count=1)
        changed.append((old, proto + ';'))
    return head, changed


reported = set()
for n, (name, body) in enumerate(ns['VARIANTS']):
    h, changed = fix_head(head, body)
    for old, new in changed:
        if (old, new) not in reported:
            reported.add((old, new))
            print('  prototype rewritten: %s  ->  %s' % (old, new))
    p = os.path.join(outdir, '%02d_%s.c' % (n, name))
    open(p, 'w', encoding='utf-8', errors='surrogateescape',
         newline='\n').write(h + body)
print('wrote %d variants to %s' % (len(ns['VARIANTS']), outdir))
