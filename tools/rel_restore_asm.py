#!/usr/bin/env python3
"""restore_asm.py <tree>/src/<stem>_NN.c <lbl_XXXXXXXX> [--static|--no-static]

Rebuild an owner file's asm-include form from its own head, so a crashed or
killed sweep never leaves a converted body behind.

Deliberately does NOT use `git checkout --` or `git show HEAD:...`: the warm
copies are file-synced, not fetched, so HEAD is an old commit and a checkout
silently installs a stale head.  (Brief section 4.)

Run-13 hardening of the run-12 version.  That version was worth promoting but
had four ways to damage a file at exit 0 -- the exact class the brief warns
about:

  1. The asm include path was hard-coded to `asm/nonmatchings/test_mode/`, so
     in any other module it wrote an include of a file that does not exist.
  2. It never checked the .s exists, so a mistyped label produced a
     syntactically valid file that cannot build.
  3. It replaced EVERYTHING from the first `#pragma force_active on` to
     end-of-file with one asm stub.  On a file holding more than one function
     -- which is what every merged TU is, and merging is cheap now -- that
     silently deleted the siblings.  It is safe only on one-function files;
     every test_mode file happens to be one, which is why run 12 never saw it.
  4. `static` had to be passed by hand and was silently dropped otherwise.
     Restoring test_mode_23.c (whose lbl_00002684 IS static) without the flag
     produced a file that differs from the pristine one in two places and
     changes the symbol's linkage.  It cannot be read off the converted file,
     because a draft that dropped `static` has destroyed the evidence -- so
     infer it from the module instead: in these rel_split files a
     cross-referenced function is forward-declared in the OTHER files that
     call it, and a static one appears in its own file only.
"""
import glob
import os
import re
import sys


def die(msg):
    raise SystemExit('restore_asm: ' + msg)


args = [a for a in sys.argv[1:] if not a.startswith('--')]
if len(args) != 2:
    die('usage: restore_asm.py <tree>/src/<stem>_NN.c <lbl_XXXXXXXX>')
path, label = args

if not re.fullmatch(r'lbl_[0-9A-Fa-f]{8}', label):
    die('%r is not a lbl_XXXXXXXX label' % label)
if not os.path.isfile(path):
    die('no such file: %s' % path)

src_dir = os.path.dirname(os.path.abspath(path))
tree = os.path.dirname(src_dir)
if os.path.basename(src_dir) != 'src':
    die('expected a file in <tree>/src/, got %s' % path)
m = re.match(r'(.+?)_\d+[a-z]*\.c$', os.path.basename(path))
if not m:
    die('cannot derive the asm stem from %s' % os.path.basename(path))
stem = m.group(1)

asm_rel = 'asm/nonmatchings/%s/%s.s' % (stem, label)
if not os.path.isfile(os.path.join(tree, asm_rel)):
    die('no asm file %s -- wrong label, or wrong module for this tree' % asm_rel)

with open(path, encoding='utf-8', errors='surrogateescape', newline='') as fh:
    raw = fh.read()
s = raw.replace('\r\n', '\n')

MARK = '#pragma force_active on'
if s.count(MARK) != 1:
    die('%s has %d %r blocks; this tool only handles one -- restore by hand'
        % (path, s.count(MARK), MARK))
head, tailtext = s.split(MARK, 1)
if label not in tailtext:
    die('%s does not define %s below the pragma' % (path, label))

# Refuse on a multi-function file: rewriting the tail would delete the others.
defs = set(re.findall(r'\blbl_[0-9A-Fa-f]{8}\b(?=\s*\([^;]*\)\s*\{)', tailtext))
others = sorted(d for d in defs if d != label)
if others:
    die('%s also defines %s below the pragma; rewriting the tail would DELETE '
        'them. Restore by hand.' % (path, ', '.join(others)))

# --- linkage ------------------------------------------------------------
if '--static' in sys.argv:
    static, why = 'static ', 'forced by --static'
elif '--no-static' in sys.argv:
    static, why = '', 'forced by --no-static'
else:
    me = os.path.abspath(path)
    referenced = False
    for sib in glob.glob(os.path.join(src_dir, '%s_*.c' % stem)):
        if os.path.abspath(sib) == me:
            continue
        with open(sib, encoding='utf-8', errors='surrogateescape') as fh:
            if label in fh.read():
                referenced = True
                break
    static = '' if referenced else 'static '
    why = ('referenced by %s' % os.path.basename(sib)) if referenced \
        else 'no sibling src file mentions it'
print('  linkage: %r (%s)' % (static.strip() or 'extern', why))

# rel_genvar rewrites the head prototype to match whatever signature the
# variant body declared.  Restoring only the body leaves e.g.
# `void lbl_X(s32, s32);` above `asm void lbl_X(void)`; mwcc then reports a
# bare "';' expected", which reads like a typo inside the .s file.
pat = re.compile(r'^[ \t]*(?:static[ \t]+)?[A-Za-z_][A-Za-z0-9_ \t\*]*?\b'
                 + re.escape(label) + r'[ \t]*\([^;]*\)[ \t]*;[ \t]*$', re.M)
if pat.search(head):
    head = pat.sub('%svoid %s(void);' % (static, label), head, count=1)
    print('  prototype reset to %svoid %s(void);' % (static, label))

body = (MARK + '\n'
        '%sasm void %s(void)\n'
        '{\n'
        '    nofralloc\n'
        '#include "../%s"\n'
        '}\n'
        '#pragma force_active reset\n' % (static, label, asm_rel))

with open(path, 'w', encoding='utf-8', errors='surrogateescape',
          newline='\r\n') as fh:
    fh.write(head + body)
os.utime(path, None)          # run-6 restore trap: a stale mtime relinks the
obj = path + '.o'             # last variant's object on the next build
if os.path.exists(obj):
    os.remove(obj)
print('restored %s -> asm include for %s (%s)' % (path, label, asm_rel))
