#!/usr/bin/env python3
"""rel_tuprobe.py -- score a candidate body by compiling the REAL owner TU.
NO LINK, NO `make`, NO TREE WRITE.  ~3 seconds per candidate.

WHAT IT IS.  You have a draft body for `lbl_XXXX`.  The normal way to score it
is install-build-score-restore: ~40s, and every silent-revert / poisoned-
baseline / stale-artifact defect this project has had lives on that path.  This
tool instead copies the module's REAL owner file into a scratch directory,
splices your body in place of the existing definition, compiles it with mwcc 1.1
and the Makefile's own flags, and scores the resulting OBJECT positionally
against golden's `.s`.

  * cwd, TMP and the object all live in the scratch dir; the module tree is
    only ever READ.  It cannot revert your work, cannot poison a baseline, and
    the same-second `make`-skip false pass cannot occur because there is no
    `make`.
  * It compiles the ACTUAL owner TU, so the surrounding asm siblings, the
    file's pragmas and its include set are all present -- unlike
    `tools/rel_probe.py`, which compiles a synthetic micro-probe and answers a
    different question ("what does mwcc do with X?" rather than "what does THIS
    FUNCTION come out as?").

>>> WHAT IT DOES NOT DO -- READ THIS BEFORE QUOTING A NUMBER FROM IT <<<

  IT DOES NOT LINK.  It therefore says NOTHING about relocations, `.rodata`
  placement, section sizes, `elf2rel`, the merge/carve budget, or the gate.
  `python tools/rel_sweep.py <mod> --gate` from DELETED objects remains the
  ONLY proof of a match.  What this predicts is INSTRUCTION COUNT, REGISTER
  ASSIGNMENT and SCHEDULE -- which is the entire content of a near-miss
  residual, and is why it is worth 3 seconds instead of 40.

  A 100% positional score here is NECESSARY, NOT SUFFICIENT.  Treat it as
  "worth spending a real link on", never as "matched".

WHY THE SCORE IS TRUSTWORTHY (and how the last two ports got it wrong).

  This compares 32-bit WORDS, not disassembly text, and it normalises them with
  `rel_ablind.nz_at` VERBATIM -- an in-range relative non-call branch keeps its
  displacement, anything else that is opcode 16/18 is reduced to opcode+AA+LK.
  So the number it prints is definitionally the SAME statistic that
  `ABLIND_POS=1 python tools/rel_ablind.py <label>` prints over a real link.

  The two hand-written ports that preceded this one both compared objdump TEXT
  against `.s` TEXT through a regex normaliser, and both had normaliser defects
  that silently ATE matching instructions: one printed local branches as two
  tokens on one side and one on the other; one returned a string with a space
  on the `bl` path while the fallthrough stripped whitespace.  Between them
  that was 22 of 268 words in one module and 12 of 333 in another -- always in
  the direction of under-reporting a good draft.  A word comparison has no
  normaliser to get wrong.  Do not "improve" this back into a text differ.

  An unlinked object is comparable to golden `.s` for a simple reason: mwcc
  leaves ZERO in every relocated field and emits a relocation, and the `.s`
  (dumped from the original REL, whose relocations also live outside the
  instruction stream) has zero in exactly the same fields.  Local branches are
  resolved on both sides and are compared for real.

usage -- RUN IT FROM THE MODULE TREE, like rel_ablind and rel_blindtable:
  cd C:/tmp/smbm/<module>
  python tools/rel_tuprobe.py <label>                  # CONTROL: owner as-is
  python tools/rel_tuprobe.py <label> body.c [more.c]  # splice each body

  --module M    override the module inferred from the tree directory name
  --owner PATH  the owner TU (default: the src/<stem>*.c that DEFINES <label>)
  --work DIR    scratch dir (default C:/tmp/rel_tuprobe_<module>_<pid>);
                it may not be inside the module tree
  --show N      print up to N differing words (default 12; 0 for none)
  --keep        do not delete the spliced .c/.o afterwards (they are kept
                anyway; this flag exists so scripts can say what they mean)
  --selftest    run the internal parser/splicer checks and exit

  THERE IS NO --tree, for the reason rel_ablind has none: four tools in this
  project have shipped a `--tree` that defaulted to the wrong tree and silently
  scored it.  `--tree` is a hard error here.

CONTROL MODE IS THE FIRST THING TO RUN.  With no body files it compiles the
owner exactly as it stands.  On a label that is ALREADY MATCHED C that must
print `positional N of N` -- if it does not, your tree, your flags or your
objdump are wrong and nothing else this tool says means anything.

BODY DIRECTIVES.  A body file may start lines with:
    //@SUB <old>|||<new>     one textual substitution in the owner
    //@PROTO <declaration>   replace `void <name>(void);` with <declaration>
    //@...                   any other //@ line is ignored
An anchor that is not found is a HARD ERROR (exit 2).  The port this was taken
from ignored a missed //@SUB silently, which means scoring a program that is
not the one you thought you wrote.

EXIT CODES ARE A CONTRACT:
  0  every body compiled and was scored
  1  a REAL NEGATIVE ANSWER: a body failed to compile
  2  ERROR: bad usage, unknown module/label/owner, missing golden `.s`, missing
     mwcc or objdump, splice anchor missing, or a body that compiled but
     produced no such function.  A mistyped flag is ALWAYS 2, never 1.
"""
import difflib
import glob
import os
import re
import subprocess
import sys
import time

# warm dir -> (src/asm stem, built artifact stem).  The same three-name table as
# rel_ablind.py and rel_merge_back.py.  sel_ngc differs on all three counts and
# that has cost an agent time in most runs; option/test_mode drop the `rel_`
# infix the six minigames carry.
MODULES = {
    'mini_bowling':   ('mini_bowling',   'mkbe.rel_mini_bowling'),
    'mini_race':      ('mini_race',      'mkbe.rel_mini_race'),
    'mini_fight':     ('mini_fight',     'mkbe.rel_mini_fight'),
    'mini_pilot':     ('mini_pilot',     'mkbe.rel_mini_pilot'),
    'mini_golf':      ('mini_golf',      'mkbe.rel_mini_golf'),
    'mini_billiards': ('mini_billiards', 'mkbe.rel_mini_billiards'),
    'sel_ngc':        ('sel_ngc_rel',    'mkbe.sel_ngc'),
    'option':         ('option',         'mkbe.option'),
    'test_mode':      ('test_mode',      'mkbe.test_mode'),
}

# Makefile:47 MWCC_CFLAGS + Makefile:61 REL_FLAGS.  A REL object must not use
# the small data sections; leaving -sdata/-sdata2 off changes the codegen for
# every module global.
CFLAGS = ['-c', '-sym', 'on', '-O4,p', '-inline', 'auto', '-nodefaults',
          '-proc', 'gekko', '-fp', 'hard', '-Cpp_exceptions', 'off',
          '-enum', 'int', '-warn', 'pragmas', '-pragma', 'cats off',
          '-sdata', '0', '-sdata2', '0', '-g']

OBJDUMP = os.environ.get(
    'OBJDUMP', 'C:/devkitPro/devkitPPC/bin/powerpc-eabi-objdump.exe')


def die(msg):
    sys.stderr.write('rel_tuprobe: %s\n' % msg)
    sys.exit(2)


# --------------------------------------------------------------------------
# scoring


def nz_at(w, i, n):
    """rel_ascore/rel_ablind branch masking, verbatim.  Do not diverge from it:
    the whole value of this tool is that its number is the same statistic the
    real-link scorers print."""
    op = w >> 26
    if op == 16:
        d = w & 0x0000FFFC
        if d & 0x8000:
            d -= 0x10000
    elif op == 18:
        d = w & 0x03FFFFFC
        if d & 0x02000000:
            d -= 0x04000000
    else:
        return w
    if w & 2:                                # AA=1: absolute, never local
        return w & 0xFC000003
    tgt = i + d // 4
    if 0 <= tgt < n and not (w & 1):         # local, and not a call
        return w
    return w & 0xFC000003


def aligned(e, g):
    """rel_ascore.score(): difflib edit cost, capped at the positional cost.

    difflib can latch onto a long matching block OFF the diagonal when the
    words repeat -- and PPC repeats heavily -- and then pays an insert AND a
    delete for everything around it.  On a pure register renaming that reports
    MORE than the positional count (rel_ascore: raw 101 reported as 387).  When
    the two sequences are the same length the identity alignment costs exactly
    `raw` substitutions, so the true edit cost can never exceed raw."""
    sm = difflib.SequenceMatcher(None, e, g, autojunk=False)
    ops = [o for o in sm.get_opcodes() if o[0] != 'equal']
    tot = sum(max(i2 - i1, j2 - j1) for _, i1, i2, j1, j2 in ops)
    if len(e) == len(g):
        raw = sum(1 for a, b in zip(e, g) if a != b)
        if raw < tot:
            pops, i, n = [], 0, len(e)
            while i < n:
                if e[i] != g[i]:
                    j = i
                    while j < n and e[j] != g[j]:
                        j += 1
                    pops.append(('replace', i, j, i, j))
                    i = j
                else:
                    i += 1
            return raw, pops
    return tot, ops


def read_gold(path):
    """golden `.s` -> [(word, text)].  `/* ADDR HEX */ insn`."""
    out = []
    for ln in open(path, errors='ignore'):
        m = re.match(r'^\s*/\*\s*[0-9A-Fa-f]+\s+([0-9A-Fa-f]{8})\s*\*/\s*(\S.*)$',
                     ln)
        if m:
            out.append((int(m.group(1), 16),
                        re.sub(r'\s+', ' ', m.group(2)).strip()))
    return out


def disasm_text(obj):
    """object -> ordered [(symbol, [(word, text), ...])] for .text.

    Reads the OBJECT, never a .plf.  (sel_ngc lost time in run 9 to a .plf
    probe disassembling past a truncated body into the next function; an
    object's .text is exactly what the file emitted.)"""
    r = subprocess.run([OBJDUMP, '-d', '--section=.text', obj],
                       capture_output=True, text=True)
    if r.returncode != 0 and not r.stdout:
        die('objdump failed on %s:\n%s' % (obj, (r.stderr or '').strip()))
    syms, cur = [], None
    for ln in r.stdout.splitlines():
        m = re.match(r'^[0-9a-f]+ <(.+)>:', ln)
        if m:
            cur = (m.group(1), [])
            syms.append(cur)
            continue
        m = re.match(r'^\s*[0-9a-f]+:\s+((?:[0-9a-f]{2} ){4})\s*(.*)$', ln)
        if m and cur is not None:
            cur[1].append((int(m.group(1).replace(' ', ''), 16),
                           re.sub(r'\s+', ' ', m.group(2)).strip()))
    return syms


def score(built, gold, show):
    """built/gold are [(word, text)].  Reads exactly len(gold) words from the
    start of `built`, which is what rel_ablind does on the .plf."""
    n = len(gold)
    ge = [nz_at(w, i, n) for i, (w, _) in enumerate(gold)]
    be = [nz_at(w, i, n) for i, (w, _) in enumerate(built[:n])]
    m = min(n, len(be))
    same = sum(1 for i in range(m) if ge[i] == be[i])
    diffs = [i for i in range(m) if ge[i] != be[i]]
    tot, ops = aligned(ge, be)
    lo = min([o[1] for o in ops], default=0)
    hi = max([o[2] for o in ops], default=0)
    lines = []
    for i in diffs[:show]:
        lines.append('    %5d  gold %08X %-34s | built %08X %s'
                     % (i, gold[i][0], gold[i][1][:34], built[i][0],
                        built[i][1][:36]))
    return same, n, tot, len(ops), lo, hi, diffs, lines


# --------------------------------------------------------------------------
# splicing


def strip_code(src):
    """src with comments and string/char literals blanked (length preserved).

    Brace matching on raw text is wrong: a `{` in a string or a commented-out
    body silently moves the end of the function and you splice over the wrong
    span.  Blanking keeps every offset, so indices computed here are valid in
    the original text."""
    out = list(src)
    i, n = 0, len(src)
    while i < n:
        c = src[i]
        if c == '/' and i + 1 < n and src[i + 1] == '/':
            while i < n and src[i] != '\n':
                out[i] = ' '
                i += 1
        elif c == '/' and i + 1 < n and src[i + 1] == '*':
            out[i] = out[i + 1] = ' '
            i += 2
            while i < n and not (src[i] == '*' and i + 1 < n
                                 and src[i + 1] == '/'):
                if src[i] != '\n':
                    out[i] = ' '
                i += 1
            if i < n:
                out[i] = ' '
                if i + 1 < n:
                    out[i + 1] = ' '
                i += 2
        elif c in '"\'':
            q = c
            out[i] = ' '
            i += 1
            while i < n and src[i] != q:
                if src[i] == '\\' and i + 1 < n:
                    out[i] = ' '
                    i += 1
                if src[i] != '\n':
                    out[i] = ' '
                i += 1
            if i < n:
                out[i] = ' '
                i += 1
        else:
            i += 1
    return ''.join(out)


DEF_RE = (r'(?m)^[A-Za-z_#][^;\n]*?\b%s\s*\([^;{]*\)[^;{]*\{')


def find_def(src, label):
    """-> (start, end) character span of the definition of `label`, or None.

    The span starts at the definition's own first line and ends just past its
    closing brace.  `#pragma` lines immediately ABOVE the definition are NOT
    included, and that is deliberate: run 12 established that a REL owner's
    `#pragma peephole on` is load-bearing when an asm sibling follows, so
    swallowing it would silently change the codegen of every body you splice
    while the output said nothing.  They are left in force and REPORTED; a body
    that wants different pragmas supplies its own (they come after, so they
    win) or removes the owner's with //@SUB."""
    blank = strip_code(src)
    m = re.search(DEF_RE % re.escape(label), blank)
    if not m:
        return None
    start = blank.rfind('\n', 0, m.start()) + 1
    i = blank.index('{', m.start())
    depth = 0
    for j in range(i, len(blank)):
        if blank[j] == '{':
            depth += 1
        elif blank[j] == '}':
            depth -= 1
            if depth == 0:
                return start, j + 1
    return None


def pragmas_above(src, start):
    """The `#pragma` lines immediately preceding the definition at `start`.

    They are still in force for whatever you splice in, so the tool prints
    them.  A body that inherits `#pragma peephole on` without knowing it is a
    body whose score you cannot reproduce from the body alone."""
    out = []
    while start > 0:
        prev = src.rfind('\n', 0, start - 1) + 1
        line = src[prev:start].strip()
        if not line.startswith('#pragma'):
            break
        out.insert(0, line)
        start = prev
    return out


def apply_directives(owner, body, where):
    keep = []
    for ln in body.split('\n'):
        if ln.startswith('//@SUB '):
            arg = ln[len('//@SUB '):]
            if '|||' not in arg:
                die('%s: //@SUB needs `old|||new`' % where)
            old, new = arg.split('|||', 1)
            if old not in owner:
                die('%s: //@SUB ANCHOR MISSING in the owner:\n    %r\n'
                    'A silently-ignored substitution means you score a program '
                    'you did not write.' % (where, old))
            owner = owner.replace(old, new, 1)
        elif ln.startswith('//@PROTO '):
            pr = ln[len('//@PROTO '):].strip()
            m = re.search(r'\b(\w+)\s*\(', pr)
            if not m:
                die('%s: //@PROTO %r has no function name' % (where, pr))
            anchor = 'void %s(void);' % m.group(1)
            if anchor not in owner:
                die('%s: //@PROTO ANCHOR MISSING: %r not in the owner'
                    % (where, anchor))
            owner = owner.replace(anchor, pr, 1)
        elif ln.startswith('//@'):
            continue
        else:
            keep.append(ln)
    return owner, '\n'.join(keep)


# --------------------------------------------------------------------------


def find_owner(tree, stem, label):
    """Every src/<stem>*.c that DEFINES `label` (not merely declares it)."""
    hits = []
    for p in sorted(glob.glob(os.path.join(tree, 'src', stem + '*.c'))):
        src = open(p, errors='ignore').read()
        if find_def(src, label):
            hits.append(p)
    return hits


def compile_one(mwcc, tree, work, cfile, obj):
    env = dict(os.environ, TMP=work, TEMP=work)
    if os.path.exists(obj):
        os.remove(obj)
    inc = ['-i', tree + '/src', '-i', tree + '/data', '-i', tree + '/src/',
           '-I-', '-i', tree + '/include']
    r = subprocess.run([mwcc] + CFLAGS + inc + ['-o', obj, cfile],
                       cwd=work, capture_output=True, text=True, env=env)
    # mwcc prints a banner even when it dies and prints warnings when it
    # succeeds, so the OBJECT'S EXISTENCE is the only honest test.
    if not os.path.exists(obj):
        return None, (r.stdout or '') + (r.stderr or '')
    return obj, ''


def selftest():
    s = 'int f(void)\n{\n  char *p = "}{";  /* } */\n  return 0;\n}\nint g;\n'
    a, b = find_def(s, 'f')
    assert s[a:b].endswith('return 0;\n}'), repr(s[a:b])
    assert find_def(s, 'g') is None
    s2 = ('#pragma opt off\nasm void lbl_1(void)\n{\n nofralloc\n'
          '#include "x.s"\n}\nvoid lbl_2(void);\n')
    a, b = find_def(s2, 'lbl_1')
    # the pragma is NOT swallowed -- it stays in force, and is reported
    assert s2[a:].startswith('asm void lbl_1'), repr(s2[a:b])
    assert s2[b:].startswith('\nvoid lbl_2'), repr(s2[b:])
    assert pragmas_above(s2, a) == ['#pragma opt off']
    # a DECLARATION is not a definition
    assert find_def('void lbl_9(void);\n', 'lbl_9') is None
    # nz_at: a local bc keeps its displacement; a bl is masked
    assert nz_at(0x41820008, 0, 10) == 0x41820008
    assert nz_at(0x48000001, 0, 10) == 0x48000001 & 0xFC000003
    assert nz_at(0x4BFFFFFD, 0, 10) == 0x4BFFFFFD & 0xFC000003   # bl backwards
    assert nz_at(0x60000000, 0, 10) == 0x60000000                # ori: untouched
    # aligned() must never exceed the positional count on equal lengths
    e = [1, 2, 3, 4, 5]
    g = [1, 9, 3, 9, 5]
    assert aligned(e, g)[0] == 2, aligned(e, g)
    # directives
    o, bd = apply_directives('void lbl_3(void);\nint x;\n',
                             '//@PROTO void lbl_3(int a);\nbody\n', 't')
    assert 'void lbl_3(int a);' in o and bd.strip() == 'body'
    print('rel_tuprobe selftest: 8 checks OK')
    print('A SELFTEST IS NOT A GATE.  Validate against a known real-link score '
          '(control mode on an already-matched label is the cheapest one).')


def main():
    argv = sys.argv[1:]
    if '--selftest' in argv:
        selftest()
        return 0
    mod = owner = work = None
    show = 12
    rest = []
    i = 0
    while i < len(argv):
        a = argv[i]
        if a in ('--module', '--owner', '--work', '--show'):
            if i + 1 >= len(argv):
                die('%s needs a value' % a)
            v = argv[i + 1]
            i += 2
            if a == '--module':
                mod = v
            elif a == '--owner':
                owner = v
            elif a == '--work':
                work = v
            else:
                if not v.isdigit():
                    die('--show needs a number, got %r' % v)
                show = int(v)
            continue
        if a.startswith(('--module=', '--owner=', '--work=', '--show=')):
            k, v = a.split('=', 1)
            argv[i:i + 1] = [k, v]
            continue
        if a == '--keep':
            i += 1
            continue
        if a == '--tree' or a.startswith('--tree='):
            die('there is no --tree.  Run it FROM the module tree:\n'
                '  cd C:/tmp/smbm/<module> && python tools/rel_tuprobe.py '
                '<label> [body.c ...]\n'
                'Four tools in this project have shipped a --tree that '
                'defaulted to the wrong tree and scored it silently.')
        if a.startswith('-'):
            die('unknown option %r.  Labels and file names do not start '
                'with "-".' % a)
        rest.append(a)
        i += 1

    if not rest:
        die('usage: cd C:/tmp/smbm/<module> && python tools/rel_tuprobe.py '
            '<label> [body.c ...]')
    label, bodies = rest[0], rest[1:]
    if not re.match(r'^[A-Za-z_]\w*$', label):
        die('%r does not look like a label.  The label comes FIRST:\n'
            '  python tools/rel_tuprobe.py <label> [body.c ...]' % label)

    for b in bodies:
        if not os.path.exists(b):
            die('body file %s does not exist.  (Checked before any compile so '
                'a typo in the 6th of 6 does not cost you five builds.)' % b)

    tree = os.getcwd()
    here = os.path.basename(os.path.abspath(tree))
    if mod is None:
        mod = os.environ.get('TUPROBE_MODULE') or here
    if mod not in MODULES:
        die('%r is not a module (tree dir is %r).  Pass --module <name>.\n'
            '  known: %s' % (mod, here, ', '.join(sorted(MODULES))))
    # THE WRONG-TREE TRAP.  Every warm copy is a FULL repo copy, so
    # `cd C:/tmp/smbm/mini_golf && ... --module option` finds option's src and
    # option's asm right there and scores them happily -- against mini_golf's
    # copy of them, i.e. WITHOUT option's agent's work.  That is the same class
    # of defect as the four `--tree` defaults this project has shipped, and it
    # is silent.  Refuse it: you may only override --module when you are not
    # standing in some OTHER module's warm copy.
    if here in MODULES and here != mod:
        die('you are in the %s tree but asked for --module %s.\n'
            '  Every warm copy is a FULL repo copy, so this would silently '
            'compile %s\'s sources AS THEY EXIST IN %s\'s TREE -- without %s\'s '
            'own work.  cd to C:/tmp/smbm/%s instead.'
            % (here, mod, mod, here, mod, mod))
    stem, _art = MODULES[mod]

    goldp = os.path.join(tree, 'asm', 'nonmatchings', stem, label + '.s')
    if not os.path.exists(goldp):
        die('no golden asm at %s\n  -- wrong module (%s -> stem %s), wrong '
            'label, or you are not in a module tree.' % (goldp, mod, stem))
    gold = read_gold(goldp)
    if not gold:
        die('%s parsed to 0 instructions -- not a `/* ADDR HEX */ insn` file?'
            % goldp)

    if owner is None:
        hits = find_owner(tree, stem, label)
        if not hits:
            die('no src/%s*.c DEFINES %s.  If it is still an asm stub there is '
                'nothing to probe; pass --owner to name the file explicitly.'
                % (stem, label))
        if len(hits) > 1:
            die('%d files define %s -- pass --owner:\n  %s'
                % (len(hits), label, '\n  '.join(hits)))
        owner = hits[0]
    if not os.path.exists(owner):
        die('--owner %s does not exist' % owner)

    mwcc = os.path.join(tree, 'mwcc_compiler', '1.1', 'mwcceppc.exe')
    if not os.path.exists(mwcc):
        die('no mwcc 1.1 at %s (1.0 is NOT the compiler this repo builds with)'
            % mwcc)

    work = work or 'C:/tmp/rel_tuprobe_%s_%d' % (mod, os.getpid())
    work = os.path.abspath(work)
    # ORCHESTRATOR FIX, landed with the tool (run 32): `os.path.commonpath`
    # raises ValueError -- not returns a mismatch -- when the two paths are on
    # DIFFERENT DRIVES.  The default work dir is on C: and the MAIN TREE is on
    # D:, so the tool crashed on its very first run outside a warm copy.  Its
    # author only ever gated it from C:/tmp/smbm/<mod>, where both sides share
    # a drive; the selftest could not reach this at all.
    #
    # A different drive is definitively NOT inside the tree, which is the only
    # thing this guard needs to establish.
    _tree_abs = os.path.abspath(tree)
    try:
        _inside = os.path.commonpath([work, _tree_abs]) == _tree_abs
    except ValueError:
        _inside = False
    if _inside:
        die('--work %s is INSIDE the module tree.  The whole point of this '
            'tool is that it writes nothing there.' % work)
    os.makedirs(work, exist_ok=True)

    base = open(owner, errors='ignore').read().replace('\r\n', '\n')
    span = find_def(base, label)
    if span is None:
        die('%s does not define %s (only declares it?)' % (owner, label))

    # PRINT THE OWNER'S mtime AND SIZE.  This tool scores the owner AS IT IS AT
    # THIS INSTANT.  In a live run the module agent that owns the tree is
    # editing that very file -- MEASURED in run 32: a mini_golf reproduction
    # moved from 189 insn / 3 in 2 / 181-of-189 to 188 / 13 in 9 / 16-of-189
    # because the owner had grown from 29,697 to 75,740 bytes 111 seconds
    # earlier while another function in the same TU was drafted.  Nothing was
    # wrong with the probe; the input had changed.  If you need a stable
    # baseline, pass --owner <your pristine snapshot>.
    st = os.stat(owner)
    print('module %s   owner %s   [%d bytes, mtime %s]   golden %s: %d insn'
          % (mod, os.path.relpath(owner, tree) if owner.startswith(tree)
             else owner, st.st_size,
             time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(st.st_mtime)),
             label, len(gold)))
    print('%-24s work %s' % ('', work))
    prag = pragmas_above(base, span[0])
    if prag:
        print('%-24s IN FORCE from the owner (NOT removed -- your body\'s own '
              'pragmas come after and win): %s' % ('', ' | '.join(prag)))

    # The asm-include marker for THIS label.  If it survives into the compiled
    # source, the "function" in the object IS golden's own assembler output and
    # scores 100% against itself.  rel_sweep trap 5 / rel_ascore's STILL AN ASM
    # STUB, in a new tool: caught by the gate, never by the selftest.
    stub_inc = '../asm/nonmatchings/%s/%s.s' % (stem, label)

    jobs = [(None, 'CONTROL')] if not bodies else \
           [(b, os.path.splitext(os.path.basename(b))[0]) for b in bodies]
    rc = 0
    for bf, tag in jobs:
        src, ow = base, base
        if bf is not None:
            body = open(bf, errors='ignore').read().replace('\r\n', '\n')
            ow, body = apply_directives(base, body, bf)
            sp = find_def(ow, label)
            if sp is None:
                die('after //@SUB///@PROTO, %s no longer defines %s'
                    % (owner, label))
            src = ow[:sp[0]] + body.rstrip('\n') + '\n' + ow[sp[1]:]
        sp2 = find_def(src, label)
        is_stub = sp2 is not None and stub_inc in src[sp2[0]:sp2[1]]
        c = os.path.join(work, tag + '.c')
        o = os.path.join(work, tag + '.o')
        open(c, 'w', newline='\n').write(src)
        ok, log = compile_one(mwcc, tree, work, c, o)
        if not ok:
            tail = '\n'.join(l for l in log.strip().splitlines()
                             if l.strip())[-500:]
            print('%-24s COMPILE FAILED\n%s' % (tag, tail))
            rc = rc or 1
            continue
        syms = dict((k, v) for k, v in disasm_text(o))
        order = [k for k, _ in disasm_text(o)]
        if label not in syms:
            die('%s compiled but its .text has no <%s>.  Symbols: %s'
                % (c, label, ', '.join(order[:12]) or '(none)'))
        # Read forward from the label through the rest of .text, exactly as
        # rel_ablind reads n words at the label's address in the .plf: a `.s`
        # ROW can hold more than one function and golden covers the whole row.
        flat, seen = [], False
        for k in order:
            if k == label:
                seen = True
            if seen:
                flat.extend(syms[k])
        own = len(syms[label])
        same, n, tot, regions, lo, hi, diffs, lines = score(flat, gold, show)
        span_s = '  span %d-%d' % (lo, hi) if regions else ''
        print('%-24s insn %-4d (golden %d, %+d)   ALIGNED %d in %d%s   '
              'positional %d of %d   first-diff %s'
              % (tag, own, n, own - n, tot, regions, span_s, same, n,
                 diffs[0] if diffs else '-'))
        if is_stub:
            print('%-24s !! STILL AN ASM STUB: this body still #includes\n'
                  '%-24s      %s\n'
                  '%-24s    so mwcc assembled GOLDEN ITSELF and the score above '
                  'is golden compared with golden.\n'
                  '%-24s    IT IS NOT A MATCH AND IT IS NOT ABOUT YOUR C.  '
                  '(rel_sweep trap 5 / rel_ascore, same shape.)\n'
                  '%-24s    Legitimate use: as a CANARY that the flags, the '
                  'owner and objdump are all wired up -- anything but 100%% '
                  'here means the harness is broken.'
                  % ('', '', stub_inc, '', '', ''))
        elif own != n:
            print('%-24s ^ WRONG LENGTH (%+d).  A positional score on a draft '
                  'whose instruction count is wrong is MEANINGLESS -- an '
                  'insertion shifts every later word.  Fix the count first.'
                  % ('', own - n))
        elif same == n:
            print('%-24s ^ 100%% positional.  NECESSARY, NOT SUFFICIENT: this '
                  'tool does not link.  Gate it:\n%-24s   python '
                  'tools/rel_sweep.py %s --gate' % ('', '', mod))
        for l in lines:
            print(l)
    return rc


if __name__ == '__main__':
    sys.exit(main())
