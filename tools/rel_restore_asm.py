#!/usr/bin/env python3
"""restore_asm.py <tree>/src/<stem>_NN.c <lbl_XXXXXXXX> [--only] [--static|--no-static]

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

RUN 16 -- `--only`, and why the run-13 refusal was not enough
------------------------------------------------------------
Fix 3 above turned a silent deletion into a refusal, which was right at the
time.  But run 14 made merging the cheapest lever in the project (21 files ->
3 objects in one module, 22 -> 1 in another), so by run 15 *most of mini_pilot
was a merged TU* and the refusal meant the tool no longer worked at all where
it was most needed.  That agent restored by hand, which is exactly the
situation this tool exists to prevent -- and the hand path is one keystroke
from `git show HEAD:src/x.c > src/x.c`, which SILENTLY TRUNCATES THE FILE TO
ZERO in a warm copy.

`--only` rewrites ONE function definition in place and leaves every sibling in
the file untouched.  Two things make it non-trivial, and both are silent if you
get them wrong:

  * LINKAGE.  The run-13 inference asks "does another src FILE mention this
    label?".  In a merged TU the caller is now in the SAME file, so that test
    answers "no" and wrongly makes an extern function `static`.  Under `--only`
    the head's own surviving prototype is consulted first -- it is direct
    evidence and it is right there.

  * THE PEEPHOLE DEOPT.  mwcc's inline assembler disables the peephole
    optimiser for every C function AFTER an asm block in the same TU.
    Restoring one function to its asm form INSERTS a new asm block into the
    middle of a TU, so the already-matched C functions below it silently
    deoptimise -- `#pragma peephole on` is worth 8 aligned and its absence has
    broken matched functions before (run 14 found six already broken that way
    in one mini_fight object).  So `--only` checks what follows the stub it
    just wrote and inserts the pragma if the next definition is C and does not
    already carry one.  It says so on stdout either way.
"""
import glob
import os
import re
import sys


def die(msg):
    raise SystemExit('restore_asm: ' + msg)


args = [a for a in sys.argv[1:] if not a.startswith('--')]
if len(args) != 2:
    die('usage: restore_asm.py <tree>/src/<stem>_NN.c <lbl_XXXXXXXX> [--only]')
path, label = args
ONLY = '--only' in sys.argv

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

# Refuse on a multi-function file unless --only was asked for: rewriting the
# whole tail would delete the others.
defs = set(re.findall(r'\blbl_[0-9A-Fa-f]{8}\b(?=\s*\([^;]*\)\s*\{)', tailtext))
others = sorted(d for d in defs if d != label)
if others and not ONLY:
    die('%s also defines %s below the pragma; rewriting the tail would DELETE '
        'them.\n  Pass --only to rewrite just %s and leave the others alone.'
        % (path, ', '.join(others), label))

# --- linkage ------------------------------------------------------------
# The head's own prototype is direct evidence and survives a converted body,
# so under --only it outranks the sibling-file scan -- which cannot work in a
# merged TU, where the caller is in this same file.
HEAD_PROTO = re.compile(r'^[ \t]*(?P<static>static[ \t]+)?[A-Za-z_]'
                        r'[A-Za-z0-9_ \t\*]*?\b' + re.escape(label) +
                        r'[ \t]*\([^;]*\)[ \t]*;[ \t]*$', re.M)
hp = HEAD_PROTO.search(head)

if '--static' in sys.argv:
    static, why = 'static ', 'forced by --static'
elif '--no-static' in sys.argv:
    static, why = '', 'forced by --no-static'
elif ONLY and hp:
    static = 'static ' if hp.group('static') else ''
    why = "this file's own surviving prototype"
else:
    # The run-13 inference asks whether another src FILE mentions the label.
    # In a merged TU the caller is in THIS file, so it answers "no" and makes
    # an extern function static.  --only consults the head prototype above
    # instead; this branch is the pre-merge fallback.
    me = os.path.abspath(path)
    referenced, sib = False, None
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

def reset_head_prototype():
    """rel_genvar rewrites the head prototype to match whatever signature the
    variant body declared.  Restoring only the body leaves e.g.
    `void lbl_X(s32, s32);` above `asm void lbl_X(void)`; mwcc then reports a
    bare "';' expected", which reads like a typo inside the .s file."""
    global head
    if hp:
        head = HEAD_PROTO.sub('%svoid %s(void);' % (static, label), head,
                              count=1)
        print('  prototype reset to %svoid %s(void);' % (static, label))


def stub_for(declarator):
    return (declarator + '\n'
            '{\n'
            '    nofralloc\n'
            '#include "../%s"\n'
            '}\n' % asm_rel)


VOID_STUB = '%sasm void %s(void)' % (static, label)

if not ONLY:
    reset_head_prototype()
    out = head + MARK + '\n' + stub_for(VOID_STUB) + \
        '#pragma force_active reset\n'
else:
    # --- locate exactly one DEFINITION of `label` in the tail --------------
    hits = []
    for mm in re.finditer(r'\b' + re.escape(label) + r'[ \t]*\(', tailtext):
        # walk the parameter list to its matching ')'
        i, depth = mm.end() - 1, 0
        while i < len(tailtext):
            if tailtext[i] == '(':
                depth += 1
            elif tailtext[i] == ')':
                depth -= 1
                if depth == 0:
                    break
            i += 1
        else:
            continue
        j = i + 1
        while j < len(tailtext) and tailtext[j] in ' \t\n':
            j += 1
        if j < len(tailtext) and tailtext[j] == '{':
            hits.append((mm.start(), j))
    if len(hits) != 1:
        die('found %d definitions of %s below the pragma (expected 1) -- '
            'restore by hand' % (len(hits), label))
    name_at, brace_at = hits[0]

    # Start of the declarator: the beginning of its own line.  A declarator
    # split across lines is not handled -- say so rather than guess, because
    # guessing here deletes code.
    line_start = tailtext.rfind('\n', 0, name_at) + 1
    decl = tailtext[line_start:name_at]
    if decl.strip() and not re.fullmatch(r'[A-Za-z_][A-Za-z0-9_ \t\*]*', decl):
        die('cannot read the declarator of %s (line begins %r) -- restore by '
            'hand' % (label, decl.strip()[:40]))
    if not decl.strip():
        die('%s begins a line with no return type -- restore by hand' % label)
    if re.match(r'^\s*asm\b', decl):
        print('%s is already an asm stub in %s -- nothing to do' % (label, path))
        raise SystemExit(0)

    # Brace-match the body.
    i, depth = brace_at, 0
    while i < len(tailtext):
        if tailtext[i] == '{':
            depth += 1
        elif tailtext[i] == '}':
            depth -= 1
            if depth == 0:
                break
        i += 1
    else:
        die('unbalanced braces in %s while reading %s' % (path, label))
    body_end = i + 1
    while body_end < len(tailtext) and tailtext[body_end] == '\n':
        body_end += 1

    # --- which declarator does the stub get? ------------------------------
    # RUN 16, measured against mwcc 1.1 on mini_bowling_42.c (11 functions in
    # one merged TU, ten of them calling the eleventh with five arguments):
    #
    #   head `void lbl(5 args);` + stub `asm void lbl(void)`
    #       -> "function call lbl(...) does not match lbl()"   REJECTED
    #   head `void lbl(5 args);` + body   `asm void lbl(void)` (head untouched)
    #       -> "identifier redeclared ... now declared as void ()"  REJECTED
    #   head `void lbl(5 args);` + stub `asm void lbl(5 args)`
    #       -> COMPILES, and the module gates GOLDEN.
    #
    # So a function whose declarator HAS parameters keeps its declarator
    # verbatim and the head prototype is left alone -- the two already agree,
    # which is why the converted file compiled.  A `(void)` declarator takes
    # the legacy path, which reproduces the pristine spelling exactly.
    params = tailtext[tailtext.index('(', name_at):brace_at].strip()
    bare = re.fullmatch(r'\((?:[ \t]*void[ \t]*)?\)', params)
    if bare:
        reset_head_prototype()
        stub = stub_for(VOID_STUB)
        print('  declarator: %s (pristine form)' % VOID_STUB)
    else:
        declarator = 'asm ' + tailtext[line_start:brace_at].rstrip()
        stub = stub_for(declarator)
        print('  declarator: KEPT VERBATIM -- it has parameters, and callers '
              'in this TU pass them. An `asm void %s(void)` stub here is '
              'rejected by mwcc.' % label)

    n_removed = tailtext.count('\n', line_start, body_end)
    tailtext = tailtext[:line_start] + stub + '\n' + tailtext[body_end:]
    STUB = stub
    print('  replaced %d lines with the asm include' % n_removed)

    # --- the peephole deopt this insertion just created -------------------
    after = tailtext[line_start + len(STUB) + 1:]
    # `[ \t]*\{?[ \t]*$` -- the tree is Allman throughout, but a same-line
    # brace must not read as "no definition follows": that answer silently
    # skips the pragma and deoptimises every C function below.
    nxt = re.search(r'(?m)^(?P<kw>asm[ \t]+)?(?:static[ \t]+)?[A-Za-z_]'
                    r'[A-Za-z0-9_ \t\*]*\b(?P<lbl>lbl_[0-9A-Fa-f]{8})'
                    r'[ \t]*\([^;]*\)[ \t]*\{?[ \t]*$', after)
    if nxt is None:
        # Distinguish "the stub is last" from "I could not parse what follows".
        rest = re.sub(r'#pragma[ \t]+force_active[ \t]+reset', '', after).strip()
        if rest:
            print('  peephole: WARNING -- could not identify the next function '
                  'definition, but %d non-blank characters follow the stub. '
                  'CHECK BY HAND whether a #pragma peephole on is needed; its '
                  'absence is worth 8 aligned and has broken already-matched '
                  'functions.' % len(rest))
        else:
            print('  peephole: nothing follows the stub in this TU -- no '
                  'pragma needed')
    elif nxt.group('kw'):
        print('  peephole: the next definition (%s) is itself asm -- no pragma '
              'needed' % nxt.group('lbl'))
    elif re.search(r'#pragma[ \t]+peephole[ \t]+on', after[:nxt.start()]):
        print('  peephole: %s already carries #pragma peephole on'
              % nxt.group('lbl'))
    else:
        cut = line_start + len(STUB) + 1 + nxt.start()
        tailtext = (tailtext[:cut] + '#pragma peephole on\n' + tailtext[cut:])
        print('  peephole: INSERTED #pragma peephole on before %s -- the new '
              'asm block would otherwise deoptimise it and every C function '
              'below it' % nxt.group('lbl'))

    out = head + MARK + tailtext

with open(path, 'w', encoding='utf-8', errors='surrogateescape',
          newline='\r\n') as fh:
    fh.write(out)
os.utime(path, None)          # run-6 restore trap: a stale mtime relinks the
obj = path + '.o'             # last variant's object on the next build
if os.path.exists(obj):
    # RUN 16 -- THE MAGIC A RESTORE CAN UN-EMIT.
    #
    # Measured on mini_bowling_42.c: restoring lbl_000087CC (the TU's only
    # int->float conversion) removed the 8-byte `.rodata` magic double that
    # `mini_bowling_42.c.o` was emitting.  The pool shrank by 8, every address
    # after it moved, and the module went NOT GOLDEN with 4,496 differing runs
    # -- while every function in the touched TU still scored ALIGNED 0 and
    # `rel_structcheck` reported CLEAN.  Nothing points at the file you edited.
    #
    # Since run 14 the project's main lever is merging a function INTO the
    # object that already owns a magic, so a converted function being its
    # object's magic source is now the normal case, not a corner one.  The
    # object is still on disk at this point, so just look.
    try:
        import subprocess
        od = subprocess.run(['powerpc-eabi-objdump', '-h', obj],
                            capture_output=True, text=True)
        if od.returncode == 0 and '.rodata' in od.stdout:
            print('\n  !! %s CURRENTLY EMITS .rodata.  If %s is what emits it '
                  '(an int->float conversion, or a float literal), this '
                  'restore REMOVES that magic double from the image: the pool '
                  'shrinks, every later address moves, and the module stops '
                  'gating GOLDEN with the failure nowhere near this file. '
                  'Every function can still score ALIGNED 0 and structcheck '
                  'can still report CLEAN.\n'
                  '     GATE THE MODULE NOW, and if it fails, check whether '
                  'another object must take over the magic before you restore '
                  'this one.\n' % (os.path.basename(obj), label))
    except (OSError, ImportError):
        pass
    os.remove(obj)
print('restored %s -> asm include for %s (%s)%s'
      % (path, label, asm_rel, ' [--only]' if ONLY else ''))
