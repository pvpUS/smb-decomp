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

  ** ⚠ A PERFECT SCORE HERE CAN COEXIST WITH EXTRA `.text` FROM A SIBLING. **
  This tool reads ONLY the spliced function.  Anything the TU emits AROUND it
  is outside the window, and that includes the out-of-line copy mwcc keeps of
  an inlined helper.  MEASURED, test_mode, run 34: on the conversion it banked,
  `static` on a helper made mwcc inline it AND emit it out-of-line as well,
  `+0x14` of `.text` -- and this tool scored `0 in 0` in BOTH the `static` and
  the `static inline` build.  Only `--gate` told them apart.  Same family as
  run 32's `rel_objsect` finding, on the `.text` side instead of `.rodata`.
  ** If your draft adds or changes a file-scope helper, a `0 in 0` here is not
  evidence; link it. **

usage -- RUN IT FROM THE MODULE TREE, like rel_ablind and rel_blindtable:
  cd C:/tmp/smbm/<module>
  python tools/rel_tuprobe.py <label>                  # CONTROL: owner as-is
  python tools/rel_tuprobe.py <label> body.c [more.c]  # splice each body

  --module M    override the module inferred from the tree directory name
  --owner PATH  the owner TU (default: the src/<stem>*.c that DEFINES <label>)
  --work DIR    scratch dir (default C:/tmp/rel_tuprobe_<module>_<pid>);
                it may not be inside the module tree
  --show N      print up to N differing words (default 12; 0 for none)
  --peephole X  `auto` (default) prepends `#pragma peephole on` when an asm
                block precedes the splice point, restoring GOLDEN's regime;
                `off` scores in the deoptimised one.  The regime is printed on
                every run either way -- see peephole_regime().  MEASURED run 34
                (mini_bowling): worth +17 and +29 instructions on two labels.
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
    # ** RUN 34: THE TRUNCATION USED TO BE SILENT. **  mini_pilot found the
    # tool showing 12 rows of a 40-row diff with nothing to say the other 28
    # existed, so a reader reasonably concluded the diff WAS 12 rows.  Same
    # family as the 500-character log tail above: hiding evidence is fine,
    # hiding the fact that you are hiding it is not.
    if len(diffs) > show:
        lines.append('    ... %d MORE differing words not shown (%d total). '
                     'Use --show %d for all of them.'
                     % (len(diffs) - show, len(diffs), len(diffs)))
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


# ---------------------------------------------------------------------------
# THE PEEPHOLE REGIME.  Rewritten in run 37; see peephole_regime_ex() for the
# state machine and the four defects it closes.  The old one-regex detector was
# wrong in BOTH directions and its verdict is quoted in every module report.

# Declaration specifiers that may precede the `asm` keyword on an asm FUNCTION
# DEFINITION.
#
# ** RUN 37 DEFECT 2 -- FALSE `on`, THE DANGEROUS DIRECTION. **  The old third
# alternative was anchored `^\s*asm`, so `static asm void lbl_XXXX(void)` was
# NOT MATCHED AT ALL.  Nine owner files open their stub that way and eight of
# them follow it with `#pragma force_active reset` and no `#pragma peephole
# on`.  The detector walked straight past a real asm block, reported `on` for a
# TU whose peephole optimiser is off, and -- unlike a false `off`, which makes
# the tool inject a harmless pragma -- INJECTED NOTHING AND SAID NOTHING.
_SPEC = (r'(?:static|extern|inline|register|volatile|const|__inline|'
         r'__declspec[ \t]*\([^)]*\))')
_ASM_START = re.compile(r'(?m)^[^\n]*?\bINCLUDE_ASM[ \t]*\('
                        r'|^[ \t]*(?:' + _SPEC + r'[ \t]+)*asm\b')
# `on` only -- retained because it is the historical name and reads clearly at
# the call site.  The state machine uses _PEEP_ANY.
_PEEP_ON = re.compile(r'(?m)^[ \t]*#pragma[ \t]+peephole[ \t]+on\b')
_PEEP_ANY = re.compile(r'(?m)^[ \t]*#pragma[ \t]+peephole[ \t]+'
                       r'(on|off|reset)\b')


def asm_blocks(src):
    r"""-> [(start, end)] of every construct that DEOPTIMISES the rest of the
    TU: an asm FUNCTION DEFINITION, or an `INCLUDE_ASM(...)` row.  `end` is
    exclusive.

    ** RUN 37 DEFECT 1 -- FALSE `off`. **  The old regex tried to match a whole
    asm block with `\([^;]*\)\s*\{`.  `[^;]*` excludes `;` but NOT newlines,
    and an asm stub body contains no `;` at all, so the greedy scan ran past
    the stub's `}` to the DECLARATOR OF A LATER C FUNCTION.  `m.end()` landed
    past the `#pragma peephole on` that restores the regime, the pragma search
    started after it, and the answer came out `off` when it was `on`.  The end
    of a block is found here by BRACE MATCHING on comment-blanked text, which
    cannot overrun.

    ** RUN 37 DEFECT 4 -- ALSO FALSE `off`, AND IT SURVIVED INTO THE FIX THAT
    WAS QUEUED TO LAND. **  A STATEMENT-level `asm { }` inside a C function
    body DOES NOT deoptimise the translation unit.  MEASURED, mwcc 1.1, the
    Makefile's own flags, an 80-instruction canary that becomes 85 when the
    peephole optimiser is off (Bscratch/probe_stmt.py):

        asm { nop }                                     80  ON
        asm NEWLINE { nop }                             80  ON
        src/mini_race_52.c's shape (register operands)  80  ON
        src/mini_bowling_40.c's shape (7 ops)           80  ON
        src/camera.c's static-inline shape              80  ON
        asm void f(void){...}      -- a FUNCTION        85  OFF
        static asm void f(void){...}                    85  OFF
        extern asm void f(void){...}                    85  OFF
        an asm stmt AFTER a pragma has restored `on`    80  ON

    The old alternative `\basm\s*\{` matched all five statement shapes (`\s*`
    spans the newline).  Four REL owner files use the statement form:
    src/mini_bowling_40.c:254, src/mini_bowling_87.c:255,
    src/mini_fight_13c.c:374, src/mini_race_52.c:381.

    A PROTOTYPE (`asm void f(void);`) opens no block and is skipped: the scan
    stops at the first `{` or `;` at paren depth 0 and a `;` means there is no
    body.

    SCOPE NOT TESTED: `INCLUDE_ASM` -- there are ZERO occurrences of it in
    src/ or include/ today, so its deopt behaviour is inherited from the old
    tool on faith rather than measured.  If one ever appears, probe it.
    """
    blank = strip_code(src)
    n = len(blank)
    out = []
    for m in _ASM_START.finditer(blank):
        if 'INCLUDE_ASM' in blank[m.start():m.end()]:
            j = blank.find(')', m.end())
            out.append((m.start(), (j + 1) if j >= 0 else n))
            continue
        # What follows the `asm` keyword decides what this is.
        k = m.end()
        while k < n and blank[k] in ' \t\r\n':
            k += 1
        if k < n and blank[k] == '{':
            continue                      # DEFECT 4: a statement, not a deopt
        # A declaration.  Walk to the first `{` or `;` at paren depth 0.
        j, depth = m.end(), 0
        while j < n:
            c = blank[j]
            if c == '(':
                depth += 1
            elif c == ')':
                depth -= 1
            elif depth == 0 and c in '{;':
                break
            j += 1
        if j >= n or blank[j] == ';':
            continue                      # a prototype opens no block
        depth, k = 0, j
        while k < n:
            if blank[k] == '{':
                depth += 1
            elif blank[k] == '}':
                depth -= 1
                if depth == 0:
                    k += 1
                    break
            k += 1
        out.append((m.start(), k))
    return out


def peephole_regime_ex(src, start):
    """Is the PEEPHOLE OPTIMISER on or off at offset `start`?

    -> (regime, why, cause) with regime 'on'/'off' and cause in
       'default' | 'asm' | 'pragma'.  `cause` is what the caller needs to know
       before it INJECTS anything: see RUN 37 DEFECT 3 at the injection site.

    ** RUN 34's finding, unchanged and still the reason this exists. **  mwcc
    1.1 turns the peephole optimiser OFF for the rest of the translation unit
    after an asm FUNCTION, and `#pragma peephole on` turns it back on in place.
    This tool splices a candidate body into the REAL owner TU, and in a merged
    or carved module the splice point lands squarely inside that window, so
    without this the probe silently compiles a DIFFERENTLY-OPTIMISED program
    from the one golden is.  MEASURED run 34 (mini_bowling): `lbl_00003A10` is
    worth +17 instructions between the regimes and `lbl_00003574` +29.

    ** `#pragma peephole reset` IS A STACK POP, not a return to the default. **
    Six occurrences in src/ (all in mini_fight).  Neither the shipped detector
    nor run 35's proposed fix modelled it.  MEASURED with 20 standalone probes,
    twice, in runs 36 and 37 independently (Bscratch/probe_reset.py):

        plain                   ON     asm ; on                ON
        reset only              ON     asm ; reset             ON
        off                     OFF    asm ; on ; reset        OFF
        on                      ON     asm ; on ; on ; reset   ON
        asm                     OFF    asm ; on ; reset;reset  ON
        static asm              OFF    off ; reset             ON
        extern asm              OFF    asm ; asm ; on          ON
        asm PROTOTYPE only      ON     asm ; on ; asm          OFF
        on ; asm                OFF    comment-only asm        ON

    The only model that fits all twenty:

        on / off   ->  push(current); current = that
        reset      ->  current = pop(), or the DEFAULT `on` if the stack is
                       empty
        asm block  ->  current = off, pushing nothing

    SCOPE NOT TESTED: mwcc 1.1 only, the Makefile's own CFLAGS only; `#pragma
    push`/`#pragma pop`, which do not occur in this tree; and whether the deopt
    begins at the asm function's first byte or its `}` -- every splice point is
    outside every block, so no measurement here can distinguish them and this
    uses the `}`.
    """
    blank = strip_code(src)
    events = [(e, 'asm', s) for s, e in asm_blocks(src) if e <= start]
    for m in _PEEP_ANY.finditer(blank[:start]):
        events.append((m.start(), m.group(1).lower(), m.start()))
    events.sort()
    cur, stack = 'on', []
    why = 'no asm block precedes the splice point'
    cause = 'default'
    for _pos, kind, at in events:
        if kind == 'asm':
            cur, cause = 'off', 'asm'
            why = ('an asm function at offset %d precedes the splice point and '
                   'nothing turns the peephole optimiser back on -- mwcc 1.1 '
                   'has it OFF here' % at)
        elif kind in ('on', 'off'):
            stack.append(cur)
            cur, cause = kind, 'pragma'
            why = ('`#pragma peephole %s` at offset %d is the last thing to set '
                   'the regime' % (kind, at))
        else:
            cur = stack.pop() if stack else 'on'
            cause = 'pragma'
            why = ('`#pragma peephole reset` at offset %d pops the regime back '
                   'to %s' % (at, cur))
    return cur, why, cause


def peephole_regime(src, start):
    """(regime, why).  The historical two-value contract, unchanged: external
    scripts import this name.  New code wants peephole_regime_ex()."""
    r, w, _c = peephole_regime_ex(src, start)
    return r, w


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


def _unescape(s):
    r"""Translate `\n`, `\t`, `\r`, `\\` and `\|` in a directive argument.

    RUN 34, found by mini_golf: `//@SUB` had no escape translation at all.  The
    directive is LINE-based and its separator is `|||`, so a substitution
    spanning two lines, or one whose text contains a literal `|`, could not be
    written at all -- and the only workaround is one `//@SUB` per line, which
    is exactly the 12-directive hand-translation run 33 had to do.
    """
    out, i = [], 0
    while i < len(s):
        c = s[i]
        if c == '\\' and i + 1 < len(s):
            nxt = s[i + 1]
            out.append({'n': '\n', 't': '\t', 'r': '\r', '\\': '\\',
                        '|': '|'}.get(nxt, '\\' + nxt))
            i += 2
        else:
            out.append(c)
            i += 1
    return ''.join(out)


KNOWN_DIRECTIVES = ('//@SUB ', '//@PROTO ', '//@DROPRE ')
_KNOWN_TOKENS = ('//@SUB', '//@PROTO', '//@DROPRE')


def _diagnose_directive(ln):
    """-> None if `ln` is a well-formed KNOWN directive, else why it is not.

    ** RUN 37 DEFECT 6 -- THREE OF THIS RUN'S FAKE `COMPILE FAILED`s WERE THE
    DIRECTIVE PARSER REFUSING, AND THE REFUSAL WAS READ AS THE DRAFT'S
    FAILURE. **  `//@DROP` unimplemented (mini_fight), a `//@SUBST` header
    (option, 24 drafts / 410 insn), a body whose function is named `pf`
    (mini_billiards).  MEASURED run 37 over the nine `_scratch_<MOD>` corpora,
    every `//@`-prefixed line in every stored draft:

        //@SUB  MALFORMED, single `|`   19040     <- 13.7x the well-formed count
        //@pre:                          9075
        //@decl:                         3841
        //@PROTO                         2772     implemented
        //@SUB  well-formed `|||`        1394     implemented
        //@SUBST                         1034
        //@ENDSUBST                       534
        //@PRELUDE / //@ENDPRELUDE        495 each
        //@DROP                           383
        //@WRAP                           302
        //@TOP / //@ENDTOP                229 each
        //@DROPRE                         120     implemented

    THREE of fourteen tokens are implemented, and the single-pipe `//@SUB`
    alone outnumbers the correct form 13.7 to 1.  So the message a draft author
    sees is the product this tool ships most often, and `UNKNOWN DIRECTIVE`
    told them nothing they could act on.

    This does NOT start accepting anything new -- a directive that is quietly
    ignored means you score a program you did not write, which is the whole
    reason the catch-all exists.  It refuses exactly as before, and says what
    to type instead.
    """
    tok = ln.split(' ', 1)[0].rstrip()
    if tok in _KNOWN_TOKENS:
        if not ln.startswith(tok + ' '):
            return 'no space after `%s`.' % tok
        if tok != '//@SUB':
            return None
        arg = ln[len(tok) + 1:]
        if '|||' in arg:
            return None
        n = arg.count('|')
        if n == 0:
            return ('`//@SUB` has NO separator.  The form is '
                    '`//@SUB old|||new` -- THREE pipes.')
        parts = arg.split('|')
        fixed = '//@SUB %s|||%s' % (parts[0], '|'.join(parts[1:]))
        return ('`//@SUB`\'s separator is THREE pipes `|||`, not %d.  '
                'Three, so that a `|` may appear in C code.\n'
                '      THIS LINE, CORRECTED:\n      %s' % (n, fixed))
    hint = ''
    for k in _KNOWN_TOKENS:
        if tok.startswith(k) or k.startswith(tok):
            hint = ('  Did you mean `%s`?%s'
                    % (k, '  Its separator is THREE pipes `|||`.'
                       if k == '//@SUB' else ''))
            break
    return 'unknown directive `%s`.%s' % (tok, hint)


def apply_directives(owner, body, where):
    # ** EVERY malformed line, in ONE run. **  This used to die on the first
    # one, so a draft carrying twelve of them cost twelve invocations to
    # discover -- and option's 24 drafts for one label all carried the same
    # bad header.
    bad = []
    for i, ln in enumerate(body.split('\n'), 1):
        if ln.startswith('//@'):
            d = _diagnose_directive(ln)
            if d:
                bad.append((i, ln, d))
    if bad:
        # ** AND A MARKER ON STDOUT. **  die() writes to STDERR, and the
        # harnesses in this project capture STDOUT -- so what a caller saw was
        # the header, no score row, and no explanation.  MEASURED run 37:
        # `rel_relscore` on a body with one bad directive prints a header and
        # nothing else on stdout.  A tool that refuses must say so where the
        # reader is looking.
        print('%s: %d MALFORMED DIRECTIVE LINE(S).  NOTHING WAS SCORED.  '
              'Details on stderr.' % (where, len(bad)))
        msg = ['%s: %d malformed directive line(s) -- ALL of them, so they can '
               'be fixed in one pass:' % (where, len(bad))]
        for i, ln, d in bad:
            msg.append('  line %d: %s' % (i, ln.strip()[:110]))
            msg.append('    %s' % d)
        msg.append('This tool implements %s and nothing else.'
                   % ', '.join(d.strip() for d in KNOWN_DIRECTIVES))
        msg.append('It REFUSES rather than ignoring: a directive that quietly '
                   'does nothing means you score a program you did not write.')
        die('\n'.join(msg))
    keep = []
    for ln in body.split('\n'):
        if ln.startswith('//@SUB '):
            arg = ln[len('//@SUB '):]
            if '|||' not in arg:
                die('%s: //@SUB needs `old|||new`' % where)
            old, new = (_unescape(x) for x in arg.split('|||', 1))
            if old not in owner:
                die('%s: //@SUB ANCHOR MISSING in the owner:\n    %r\n'
                    'A silently-ignored substitution means you score a program '
                    'you did not write.' % (where, old))
            owner = owner.replace(old, new, 1)
        elif ln.startswith('//@DROPRE '):
            # ** RUN 34: THIS DIRECTIVE USED TO FALL THROUGH TO THE `//@`
            # CATCH-ALL BELOW AND BE SILENTLY DISCARDED. **
            #
            # `//@DROPRE <regex>` deletes every OWNER line matching the regex.
            # Stored drafts use it (mini_fight's `lbl_00014BD4`).  Without it
            # the owner's un-prototyped `extern void avdisp_X();` lines survive
            # and collide with the draft's prototyped ones, and this tool
            # reports COMPILE FAILED -- a verdict indistinguishable from a
            # genuinely broken draft, and "this draft does not compile" is now
            # 0-for-166.  Run 33 hand-translated one DROPRE into 12 `//@SUB`
            # deletions and the same draft rebased to a clean 4 in 4.
            pat = ln[len('//@DROPRE '):].strip()
            try:
                rx = re.compile(pat)
            except re.error as e:
                die('%s: //@DROPRE %r is not a valid regex: %s'
                    % (where, pat, e))
            lines = owner.split('\n')
            kept = [l for l in lines if not rx.search(l)]
            if len(kept) == len(lines):
                die('%s: //@DROPRE MATCHED NOTHING in the owner: %r\n'
                    'Same rule as //@SUB\'s missing anchor: a directive that '
                    'quietly does nothing means you score a program you did '
                    'not write.' % (where, pat))
            sys.stderr.write('rel_tuprobe: //@DROPRE %r dropped %d owner '
                             'line(s)\n' % (pat, len(lines) - len(kept)))
            owner = '\n'.join(kept)
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
            # ** AND THE CATCH-ALL NOW REFUSES INSTEAD OF DISCARDING. **
            # Silently dropping an unrecognised directive is how `//@DROPRE`
            # cost two runs: the draft was fine, the harness ignored half of
            # it, and the tool blamed the draft.  Any future directive gets a
            # loud refusal on its first use instead of a fictional verdict.
            die('%s: UNKNOWN DIRECTIVE %r.\n'
                'This tool implements %s.  It used to discard anything else '
                'silently, which is how `//@DROPRE` produced two rounds of '
                '"this draft does not compile" against drafts that were '
                'correct.  Implement it or remove the line -- do not let it '
                'be ignored.' % (where, ln.strip()[:60],
                                 ', '.join(d.strip() for d in
                                           KNOWN_DIRECTIVES)))
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
    # RUN 37: the four peephole defects, as cases.  A SELFTEST IS NOT A
    # GATE -- these exist to fail fast on a typo, and the real proof is the
    # three-sided canary in _corpus_run37/Bscratch/gate37.py.
    _P = [('asm void a(void)\n{\n#include "x.s"\n}\n#pragma peephole on\n'
           'void HERE(int a, int b)\n{\n}\n', 'on'),      # defect 1
          ('static asm void a(void)\n{\n#include "x.s"\n}\n'
           '#pragma force_active reset\nvoid HERE(void)\n{\n}\n', 'off'),
          ('void f(void)\n{\n    asm\n    {\n        nop\n    }\n}\n'
           'void HERE(void)\n{\n}\n', 'on'),              # defect 4
          ('asm void a(void);\nvoid HERE(void)\n{\n}\n', 'on'),
          ('asm void a(void)\n{\n#include "x.s"\n}\n#pragma peephole on\n'
           '#pragma peephole reset\nvoid HERE(void)\n{\n}\n', 'off'),
          ('asm void a(void)\n{\n#include "x.s"\n}\n'
           '#pragma peephole reset\nvoid HERE(void)\n{\n}\n', 'on'),
          ('/* asm void a(void)\n{\n} */\nvoid HERE(void)\n{\n}\n', 'on')]
    for _t, _e in _P:
        _o = _t.index('void HERE')
        _g, _w, _c = peephole_regime_ex(_t, _o)
        assert _g == _e, 'peephole case %r: expected %s got %s (%s)' % (
            _t[:28], _e, _g, _w)
    print('rel_tuprobe selftest: 8 checks + 7 peephole cases OK')
    print('A SELFTEST IS NOT A GATE.  Validate against a known real-link score '
          '(control mode on an already-matched label is the cheapest one).')


def main():
    argv = sys.argv[1:]
    if '--selftest' in argv:
        selftest()
        return 0
    mod = owner = work = None
    show = 12
    peep = 'auto'
    rest = []
    i = 0
    while i < len(argv):
        a = argv[i]
        if a in ('--module', '--owner', '--work', '--show', '--peephole'):
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
            elif a == '--peephole':
                if v not in ('auto', 'off'):
                    die('--peephole takes `auto` (default: restore golden\'s '
                        'regime) or `off` (score in the deoptimised one)')
                peep = v
            else:
                if not v.isdigit():
                    die('--show needs a number, got %r' % v)
                show = int(v)
            continue
        if a.startswith(('--module=', '--owner=', '--work=', '--show=',
                         '--peephole=')):
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
            # ** RUN 38 -- THE SAME MULTI-BODY ABORT THIS FILE GIVES
            # rel_relscore. **  apply_directives() refuses by calling die(),
            # which is sys.exit(2), so ONE bad body in a list of six killed the
            # other five -- silently, because the output of "aborted after body
            # 1" and "was only asked for body 1" are identical.
            # Fixed in BOTH body loops at once, deliberately: making
            # apply_directives raise a custom exception instead would have left
            # rel_relscore -- which imports it -- with an uncaught traceback.
            try:
                ow, body = apply_directives(base, body, bf)
            except SystemExit:
                print('%-24s DIRECTIVE REFUSED -- THIS BODY WAS SKIPPED and '
                      'the run CONTINUES.  Details on stderr.' % tag)
                rc = 2
                continue
            sp = find_def(ow, label)
            if sp is None:
                print('%-24s AFTER //@SUB///@PROTO, %s NO LONGER DEFINES %s '
                      '-- SKIPPED, run continues.' % (tag, owner, label))
                rc = 2
                continue
            src = ow[:sp[0]] + body.rstrip('\n') + '\n' + ow[sp[1]:]
        # ** THE PEEPHOLE REGIME, DECIDED AND PRINTED ON EVERY RUN. **
        # See peephole_regime().  `auto` (the default) restores the regime
        # golden was compiled in, which is also the regime the module has to
        # write into the real TU for the conversion to link GOLDEN.  Scoring in
        # the deoptimised regime is what produced the garbage figures.
        sp3 = find_def(src, label)
        regime, rwhy, rcause = peephole_regime_ex(
            src, sp3[0] if sp3 else len(src))
        injected = refused = deopted = False
        if peep == 'off':
            # ** RUN 37 DEFECT 5 -- `--peephole off` DID NOT DEOPTIMISE
            # ANYTHING.  IT ONLY DECLINED TO INJECT. **
            #
            # `peep` had exactly ONE use in this file:
            #     if regime == 'off' and peep != 'off':
            # so whenever the regime was ALREADY ON -- which is 139 of the 166
            # still-asm rows -- the flag did nothing at all and returned a
            # BYTE-IDENTICAL score, which reads as a confirmation.  The
            # docstring's "`off` scores in the deoptimised one" was false in
            # exactly the case a module reaches for it.  Found independently by
            # mini_billiards (four targets identical with and without the flag)
            # and mini_race in run 37.
            #
            # The flag now means what it says: it FORCES the deoptimised
            # regime, by injecting `#pragma peephole off` when the regime is on
            # and doing nothing when it is already off.  This is the two-arm
            # instrument -- `auto` vs `off` on the same body -- that previously
            # required copying the owner out of the tree and blanking its
            # pragmas by hand.
            if regime == 'on':
                src = src[:sp3[0]] + '#pragma peephole off\n' + src[sp3[0]:]
                deopted = True
        elif regime == 'off':
            # ** RUN 37 DEFECT 3 -- THE INJECTION POINT. **  The pragma goes in
            # at the DEFINITION's first line, which is BELOW any pragma the
            # spliced body carries above that definition.  So a candidate's own
            # `#pragma peephole off` was silently overridden while the run
            # still printed `INJECTED` -- and a peephole canary written that
            # way measures NOTHING.  MEASURED run 37, mini_billiards
            # lbl_00012D4C: 30 instructions with the override, 33 without.
            #
            # The rule: `auto` injects only to undo an ASM-BLOCK deopt, which
            # is the only thing this tool ever claimed to do.  When the `off`
            # was written by a human -- in the owner or in the body -- it is
            # deliberate and is left alone, LOUDLY.
            if rcause == 'pragma':
                refused = True
            else:
                src = src[:sp3[0]] + '#pragma peephole on\n' + src[sp3[0]:]
                injected = True
        print('%-24s PEEPHOLE %s -- %s' % (tag, regime.upper(), rwhy))
        if injected:
            print('%-24s   INJECTED `#pragma peephole on` before the body, so '
                  'this score is in GOLDEN\'S regime.\n'
                  '%-24s   Your real conversion MUST carry that pragma too or '
                  'the link will not match (--peephole off to score without '
                  'it).' % ('', ''))
        elif refused:
            print('%-24s   NOT INJECTING.  That `off` is an explicit '
                  '`#pragma peephole`, not an asm-block deopt, so it was '
                  'written\n'
                  '%-24s   on purpose (by the owner or by your body) and '
                  'overriding it would score a program you did not write.\n'
                  '%-24s   Remove the pragma, or pass --peephole off to say '
                  'you meant it.' % ('', '', ''))
        elif deopted:
            print('%-24s   --peephole off: INJECTED `#pragma peephole off`.  '
                  'This score is in the DEOPTIMISED regime,\n'
                  '%-24s   which is NOT golden\'s.  It is the second arm of a '
                  'two-arm comparison, not a result on its own.'
                  % ('', ''))
        elif peep == 'off':
            print('%-24s   --peephole off: the regime was already OFF here, so '
                  'nothing was injected.\n'
                  '%-24s   This IS the deoptimised regime, and it is NOT '
                  'golden\'s.' % ('', ''))
        sp2 = find_def(src, label)
        is_stub = sp2 is not None and stub_inc in src[sp2[0]:sp2[1]]
        c = os.path.join(work, tag + '.c')
        o = os.path.join(work, tag + '.o')
        open(c, 'w', newline='\n').write(src)
        ok, log = compile_one(mwcc, tree, work, c, o)
        if not ok:
            # ** RUN 34: THIS KEPT THE LAST 500 CHARACTERS, WHICH ON A
            # CASCADING C ERROR IS THE LEAST INFORMATIVE END. **
            #
            # mwcc's FIRST diagnostic is nearly always the real one; everything
            # after it is downstream noise.  mini_fight lost two rounds to this
            # -- the true message was `illegal use of incomplete struct 'struct
            # Stobj'` and what the tool showed was a phantom redeclaration
            # further down the cascade -- and mini_golf lost 25 minutes and
            # published a structural claim it then had to retract.
            #
            # Both ends now, with an explicit elision marker.  A tool that
            # hides evidence must say that it is hiding it.
            lines = [l for l in log.strip().splitlines() if l.strip()]
            txt = '\n'.join(lines)
            if len(txt) <= 1200:
                shown = txt
            else:
                head, tail = txt[:700], txt[-400:]
                shown = ('%s\n   ... [%d characters elided -- full log at %s] '
                         '...\n%s' % (head, len(txt) - 1100,
                                      os.path.join(work, tag + '.log'), tail))
                try:
                    open(os.path.join(work, tag + '.log'), 'w',
                         newline='\n').write(log)
                except OSError:
                    pass
            print('%-24s COMPILE FAILED  (FIRST diagnostic first -- mwcc\'s '
                  'first error is the real one)\n%s' % (tag, shown))
            rc = rc or 1
            continue
        syms = dict((k, v) for k, v in disasm_text(o))
        order = [k for k, _ in disasm_text(o)]
        if label not in syms:
            # ...and the same rule for the symbol list: say what is hidden.
            die('%s compiled but its .text has no <%s>.  Symbols: %s%s'
                % (c, label, ', '.join(order[:12]) or '(none)',
                   '  ... and %d more' % (len(order) - 12)
                   if len(order) > 12 else ''))
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
