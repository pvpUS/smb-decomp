#!/usr/bin/env python3
"""rel_split.py -- split a monolithic REL asm module for per-function byte-matching.

The minigame RELs build from ``src/<module>.c`` + ``asm/<module>.s``.  While the
whole module lives as one monolithic ``.s`` its functions cannot be replaced by
C one at a time.  This script performs a *byte-neutral* structural split:

  * Every ``.text`` FUNCTION BODY is written verbatim (comments are ignored by
    the assembler, so the emitted bytes are preserved exactly) to
    ``asm/nonmatchings/<module>/<startlabel>.s``.
  * ``asm/<module>.s`` is rewritten to drop the ``.text`` section entirely while
    keeping every other section (.ctors/.dtors/.rodata/.data/.bss/...) and all
    header comments byte-for-byte.  The data sections still reference ``.text``
    labels (jump / function-pointer tables); those resolve at link time to the
    C-provided functions.
  * ``src/<module>.c`` is regenerated: the original include block + the
    alignment stub symbol, ``extern`` declarations for every data/rodata/bss
    label the code loads by address, forward declarations for every function,
    then -- inside a ``#pragma force_active on`` region so mwcc does not
    dead-strip statics reached only through data tables -- one ``asm`` /
    ``static asm`` stub per function (in original ``.text`` order), each
    ``#include``-ing its body.

Why the extern decls / forward decls are required: mwcc's inline assembler only
accepts ``sym@ha`` / ``sym@l`` when ``sym`` is a *declared* C symbol (a global,
an extern, or a forward-declared function).  A bare ``lbl_XXXX`` it has never
seen is treated as a local label and rejected ("illegal use of label, can only
use label difference in this context").  GNU ``as`` (which assembled the
monolithic file) had no such requirement.

Function-start detection (over-approximating is byte-neutral) is the union of:
  1. the ``.global`` names (_prolog/_epilog/_unresolved),
  2. every label that is a ``bl <label>`` target,
  3. every ``.text`` label loaded by address (``<label>@ha`` / ``<label>@l``),
  4. every ``.text`` label used as a data table entry (``.4byte`` / ``.long``),
plus an iterative pass that promotes any label a *branch from another function*
targets (so cross-function branches resolve as symbols, not local labels).

Multi-file output (``--isolate`` / ``--chunk-size``)
----------------------------------------------------
The whole module can be split across several ``.c`` files instead of one.  This
is REQUIRED to actually match a schedule-sensitive function: mwcc's inline
assembler turns off the instruction scheduler + peephole optimizer for EVERY C
function that shares a translation unit with an ``asm`` block.  (Verified: a lone
``static asm`` sibling is enough to turn a matching ``extsb.`` into
``extsb``+``cmpwi`` and a ``blr`` early-return into ``b <epilogue>``.)  It is the
*presence* of inline asm in the TU, not the TU's size -- a 4-function chunk
deopts exactly like the 120-function one; a pure-C file of the same function
matches.  So a hand-written C function only reproduces the original schedule when
it lives in a pure-C file with no asm-include siblings.

``--isolate <label>`` places that function in its own single-function ``.c``
file; once you convert its body from the asm-include to C, that file is pure C
and the optimizer stays on.  Cross-file references (a ``bl`` or ``@ha/@l`` from
another file) are handled by promoting the referenced function to a global
symbol (see ``compute_globals``), the same pattern sel_stage_rel uses.  ``.text``
order is preserved because each ``.c`` holds a contiguous offset range and the
Makefile ``SOURCES`` list them in order (append ``asm/<module>.s`` last).  The
converted C bodies are hand-written and applied *after* the split -- re-running
the splitter regenerates the asm-include scaffolding and must have those
conversions re-applied (same as any hand-matched function).

Usage:
    python tools/rel_split.py <module> [--include hdr.h ...] [--extra-start lbl ...]
        [--extern-fn f ...] [--extern-data d ...] [--isolate lbl ...] [--chunk-size N]
"""
import argparse
import os
import re
import sys

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

LABEL_DEF_RE = re.compile(r'^(_prolog|_epilog|_unresolved|lbl_[0-9A-Fa-f]+):\s*$')
GLOBAL_RE = re.compile(r'^\.global\s+(\S+)\s*$')
SECTION_RE = re.compile(r'^\.section\s+(\S+)')
SECNUM_RE = re.compile(r'^#\s*\d+\s*$')
INSN_OFF_RE = re.compile(r'^/\*\s*([0-9A-Fa-f]{8})\b')

BL_RE = re.compile(r'\bbl\s+(lbl_[0-9A-Fa-f]+)\b')
ADDR_RE = re.compile(r'\b(lbl_[0-9A-Fa-f]+)@(?:ha|l|h)\b')
DATAENTRY_RE = re.compile(r'^\s*\.(?:4byte|long)\s+(lbl_[0-9A-Fa-f]+)\s*$')
ANY_LBL_RE = re.compile(r'\blbl_[0-9A-Fa-f]+\b')
BARE_LBL_RE = re.compile(r'\b(lbl_[0-9A-Fa-f]+)\b(?!@)')


def operand(line):
    """The instruction text after the ``... */`` byte-annotation comment."""
    return line.rsplit('*/', 1)[-1] if '*/' in line else line


def clean_body_line(line):
    """Strip trailing ``;`` annotation comments (e.g. ``;# fixed addi``).

    GNU ``as`` treats ``;`` as a statement separator so ``addi r0,r3,-1 ;# note``
    parses fine, but mwcc's inline assembler rejects it ("end of line
    expected").  ``;`` never appears in a real PowerPC operand or in the
    ``/* .. */`` byte comment, so cutting from the first ``;`` is byte-neutral.
    """
    i = line.find(';')
    return line[:i].rstrip() if i != -1 else line


def find_line(lines, pred, start=0):
    for i in range(start, len(lines)):
        if pred(lines[i]):
            return i
    return -1


def split_module(module, extra_includes, extra_starts, extern_fns, extern_data,
                 chunk_size=0, isolate=()):
    asm_path = os.path.join(REPO, 'asm', module + '.s')
    src_path = os.path.join(REPO, 'src', module + '.c')
    with open(asm_path, 'r', newline='\n') as f:
        lines = f.read().split('\n')

    # --- locate the .text section block --------------------------------------
    text_sec = find_line(lines, lambda l: l.strip() == '.section .text')
    if text_sec < 0:
        sys.exit('no .section .text found')
    next_sec = find_line(lines, lambda l: SECTION_RE.match(l.strip()) is not None,
                         text_sec + 1)
    if next_sec < 0:
        sys.exit('no section after .text found')
    head_end = text_sec
    if head_end - 1 >= 0 and SECNUM_RE.match(lines[head_end - 1].strip()):
        head_end -= 1
    tail_start = next_sec
    if SECNUM_RE.match(lines[tail_start - 1].strip()):
        tail_start -= 1

    body = lines[text_sec + 1:tail_start]

    # --- collect .text labels and their offsets ------------------------------
    text_labels = {}          # name -> offset (int)
    pending = []              # labels awaiting the next instruction's offset
    for l in body:
        m = LABEL_DEF_RE.match(l)
        if m:
            pending.append(m.group(1))
            continue
        mo = INSN_OFF_RE.match(l)
        if mo and pending:
            off = int(mo.group(1), 16)
            for name in pending:
                text_labels[name] = off
            pending = []
    globals_set = set()
    for l in lines:
        m = GLOBAL_RE.match(l.strip())
        if m:
            globals_set.add(m.group(1))

    # --- function-start detection -------------------------------------------
    # A boundary is a TRUE function entry: a `.global` name, a `bl` target, or a
    # label loaded by address (`@ha`/`@l`).  Jump-table entries are deliberately
    # NOT boundaries: switch cases must stay interior so the conditional branches
    # into them resolve inline (mwcc emits an unremovable R_PPC_REL14 relocation
    # for a branch to a *global* label, and ELF2REL only auto-resolves REL24, not
    # REL14).  The .s jump tables that pointed at those labels are instead
    # rewritten to reference `_prolog + <text offset>` (see below), exactly the
    # `.text + off` section reference the monolithic build produced.
    starts = set(globals_set)
    for l in lines:
        for m in BL_RE.finditer(l):
            starts.add(m.group(1))
        for m in ADDR_RE.finditer(l):
            starts.add(m.group(1))
    starts |= set(extra_starts)
    starts = {s for s in starts if s in text_labels}

    def func_of(off, start_offs):
        # index of the greatest start offset <= off
        lo, hi, res = 0, len(start_offs) - 1, 0
        while lo <= hi:
            mid = (lo + hi) // 2
            if start_offs[mid] <= off:
                res = mid
                lo = mid + 1
            else:
                hi = mid - 1
        return res

    # branch edges: (src_offset, target_label, is_conditional).  Unconditional
    # forms (b/ba/bl/bla -> REL24) are auto-resolved by ELF2REL even across
    # functions; conditional forms (-> REL14) are NOT, so a boundary must never
    # fall inside a conditional branch's span.
    UNCOND = {'b', 'ba', 'bl', 'bla'}
    edges = []
    for l in body:
        mo = INSN_OFF_RE.match(l)
        if not mo:
            continue  # only real instruction lines carry branch operands
        cur_off = int(mo.group(1), 16)
        op = operand(l)
        toks = op.split()
        mnem = toks[0] if toks else ''
        for m in BARE_LBL_RE.finditer(op):
            tgt = m.group(1)
            if tgt in text_labels:
                edges.append((cur_off, tgt, mnem not in UNCOND))

    # Enforce the conditional-branch constraint: drop any non-entry boundary that
    # falls strictly inside a conditional branch's span, then promote any
    # unconditional cross-function branch target that is still interior (so it
    # links as a symbol) -- but never one that sits inside a conditional span.
    protected = set(globals_set)
    while True:
        forbidden = set()
        for src, tgt, cond in edges:
            if not cond:
                continue
            lo, hi = (src, text_labels[tgt]) if src <= text_labels[tgt] else (text_labels[tgt], src)
            for s in list(starts):
                if lo < text_labels[s] <= hi and s not in protected:
                    forbidden.add(s)
        if forbidden:
            starts -= forbidden
        start_offs = sorted(text_labels[s] for s in starts)
        added = set()
        for src, tgt, cond in edges:
            if cond or tgt in starts:
                continue
            if func_of(src, start_offs) != func_of(text_labels[tgt], start_offs):
                # don't promote a target that lives inside a conditional span
                inside = any((min(s2, text_labels[t2]) < text_labels[tgt]
                              <= max(s2, text_labels[t2]))
                             for s2, t2, c2 in edges if c2)
                if not inside:
                    added.add(tgt)
        if not added and not forbidden:
            break
        starts |= added

    # --- walk the body, cutting at every function-start label ----------------
    funcs = []           # (name, is_global, [body lines]) in offset order
    cur_name = None
    cur_global = False
    cur_lines = None
    for l in body:
        if GLOBAL_RE.match(l.strip()):
            continue      # drop ".global X" declaration lines
        dm = LABEL_DEF_RE.match(l)
        if dm and dm.group(1) in starts:
            if cur_name is not None:
                funcs.append((cur_name, cur_global, cur_lines))
            cur_name = dm.group(1)
            # only the module entry points are global; every other function is
            # static (kept alive by force_active).  Nothing outside the .c needs
            # to link to them by name -- the .s references .text via _prolog.
            cur_global = cur_name in globals_set
            cur_lines = []
            continue
        if cur_name is None:
            if l.strip() == '':
                continue
            sys.exit('content before first function start: %r' % l)
        cur_lines.append(l)
    if cur_name is not None:
        funcs.append((cur_name, cur_global, cur_lines))
    funcs.sort(key=lambda f: text_labels[f[0]])

    # --- data/rodata/bss labels the code loads by address --------------------
    with open(src_path, 'r', newline='\n') as f:
        src = f.read().split('\n')
    # every lbl_XXXX defined anywhere in the file (text + data sections)
    all_defined = set()
    for l in lines:
        m = LABEL_DEF_RE.match(l)
        if m:
            all_defined.add(m.group(1))
    data_defined = all_defined - set(text_labels)  # rodata/data/bss/... labels

    referenced = set()
    for _n, _g, blines in funcs:
        for l in blines:
            for m in ANY_LBL_RE.finditer(operand(l)):
                referenced.add(m.group())
    # Declare only labels DEFINED in this module's own data sections.  Labels the
    # code loads that are NOT defined here (e.g. DOL globals like lbl_802XXXXX)
    # are imports already declared by an included header -- redeclaring them would
    # conflict, so they are excluded.
    data_externs = sorted(l for l in referenced if l in data_defined)

    # --- write per-function bodies -------------------------------------------
    out_dir = os.path.join(REPO, 'asm', 'nonmatchings', module)
    os.makedirs(out_dir, exist_ok=True)
    for fn in os.listdir(out_dir):
        if fn.endswith('.s'):
            os.remove(os.path.join(out_dir, fn))
    for name, _g, blines in funcs:
        blines = [clean_body_line(l) for l in blines]
        while blines and blines[-1].strip() == '':
            blines.pop()
        with open(os.path.join(out_dir, name + '.s'), 'w', newline='\n') as f:
            f.write('\n'.join(blines) + '\n')

    # --- rewrite asm/<module>.s (drop .text) ---------------------------------
    # Export the data/rodata/bss labels the C code loads by address.  They are
    # local in the original monolithic file (resolved intra-object); once .text
    # moves to the .c they must be global so the cross-object reference links.
    # ``.global`` emits no bytes, so the data sections stay byte-for-byte.
    new_head = list(lines[:head_end])
    inc_idx = next((i for i, l in enumerate(new_head)
                    if l.strip() == '.include "macros.inc"'), None)
    if data_externs:
        glob_block = ['# exported so the split-out .text (now in the .c) can link '
                      'against these:'] + ['.global %s' % l for l in data_externs]
        if inc_idx is not None:
            new_head[inc_idx + 1:inc_idx + 1] = glob_block
        else:
            new_head = glob_block + new_head
    tail = lines[tail_start:]
    # Un-`.if 0` the alignment-stub block(s): the monolithic file wrapped the
    # first .rodata word in `.if 0 ... .endif` and had the .c provide it as a
    # `const`.  Keeping that split the rodata across two objects, which (a) let
    # mwcc constant-fold `stub@ha/@l` and (b) shifted the .s rodata by the
    # .c/.s object-boundary alignment.  Emitting the word from the .s instead
    # keeps rodata a single contiguous blob -- byte-identical, and every load of
    # it becomes a normal data relocation.
    tail = [l for l in tail if l.strip() not in ('.if 0', '.endif')]
    # Restore the .rodata section alignment.  In the monolithic build the module
    # .rodata inherited 8-byte alignment from the mwcc-compiled .c contribution
    # (the alignment stub).  Now that .rodata comes entirely from this .s, GNU as
    # would default it to align 1; ELF2REL aligns each .rel section by its
    # sh_addralign, so a wrong alignment shifts every following section.  A
    # `.balign 8` at the section start emits no bytes (offset 0 is already
    # aligned) but records the 8-byte alignment.
    out_tail = []
    for l in tail:
        out_tail.append(l)
        if l.strip() == '.section .rodata':
            out_tail.append('.balign 8')
    tail = out_tail
    # Rewrite jump / function-pointer tables that point into .text.  Their target
    # labels are now interior C labels (not global), so reference them positionally
    # through the always-global entry point `_prolog + <text offset>`.  This is the
    # exact `.text + off` section reference the monolithic build emitted, so the
    # relocation ELF2REL writes is byte-identical.
    anchor = min(globals_set, key=lambda g: text_labels[g])  # _prolog, at .text 0
    anchor_off = text_labels[anchor]
    dref = re.compile(r'^(\s*)\.(4byte|long)\s+(lbl_[0-9A-Fa-f]+)\s*$')

    def rewrite_dataref(l):
        m = dref.match(l)
        if not m or m.group(3) not in text_labels:
            return l
        off = text_labels[m.group(3)] - anchor_off
        ref = anchor if off == 0 else '%s + 0x%X' % (anchor, off)
        return '%s.%s %s' % (m.group(1), m.group(2), ref)

    tail = [rewrite_dataref(l) for l in tail]
    new_lines = new_head + tail
    with open(asm_path, 'w', newline='\n') as f:
        f.write('\n'.join(new_lines))

    # --- regenerate src/<module>.c (possibly split into chunked _N.c files) ---
    includes = [l for l in src
                if l.startswith('#include') and 'nonmatchings' not in l
                and not l.rstrip().endswith('.s"')]
    for hdr in extra_includes:
        inc = '#include "%s"' % hdr
        if inc not in includes:
            includes.append(inc)

    src_files = write_src_files(module, src_path, funcs, includes,
                                data_externs, extern_data, extern_fns,
                                chunk_size, isolate)

    return funcs, starts, text_labels, data_externs, src_files


def partition_funcs(funcs, chunk_size, isolate=()):
    """Partition ``funcs`` (already in .text-offset order) into contiguous
    groups, one per generated ``.c`` file.

    Contiguity is mandatory: the linker groups each object's ``.text`` as one
    block, so the module's original function order is preserved only if every
    ``.c`` holds a contiguous offset range and the ``.c`` files are listed in
    order.

    ``isolate`` names functions that must each land in their *own* single-
    function file.  That is the mechanism for matching: mwcc's inline assembler
    disables the instruction scheduler + peephole optimizer for EVERY C function
    that shares a translation unit with an ``asm`` block (verified: a lone
    ``static asm`` sibling is enough to turn ``extsb.`` into ``extsb``+``cmpwi``).
    So a hand-written C function only reproduces the original schedule when it
    sits alone in a pure-C file, with no asm-include siblings.  Isolating a
    function gives it that file; once its body is converted from the asm-include
    to C, the file is pure C and the optimizer stays on.

    ``chunk_size`` (> 0) caps how many *asm-include* functions share a file --
    purely cosmetic (asm-include functions carry no C to optimize, so grouping
    all of them in one file is byte-identical; the current single-file layout
    proves it).  ``chunk_size <= 0`` groups every contiguous run of non-isolated
    functions into as few files as possible.
    """
    isolate = set(isolate)
    groups = []
    cur = []
    for f in funcs:
        if f[0] in isolate:
            if cur:
                groups.append(cur)
                cur = []
            groups.append([f])       # its own pure file (convert body to C)
            continue
        cur.append(f)
        if chunk_size and chunk_size > 0 and len(cur) >= chunk_size:
            groups.append(cur)
            cur = []
    if cur:
        groups.append(cur)
    return groups or [funcs]


def compute_globals(funcs, chunks):
    """Names that must have external linkage (non-``static``).

    In a single-file split only the module entry points are global; every other
    function is ``static`` (kept alive by ``force_active``).  Once functions are
    spread across several ``.c`` files, any function a *different* chunk reaches
    -- by ``bl`` (REL24) or by address (``@ha/@l``) -- must be global so the
    cross-object reference links, exactly the pattern sel_stage_rel uses.  A
    function referenced only within its own chunk stays ``static``.

    Cross-function conditional branches (REL14) never occur -- the splitter's
    boundary logic guarantees a conditional branch's span never crosses a
    function start -- so globalising a function start cannot introduce the
    unresolvable REL14-to-global relocation ELF2REL rejects.
    """
    fn_names = {f[0] for f in funcs}
    global_names = {name for name, is_global, _b in funcs if is_global}
    if len(chunks) <= 1:
        return global_names
    chunk_of = {}
    for ci, ch in enumerate(chunks):
        for name, _g, _b in ch:
            chunk_of[name] = ci
    for name, _g, blines in funcs:
        ci = chunk_of[name]
        for l in blines:
            for m in ANY_LBL_RE.finditer(operand(l)):
                tgt = m.group()
                if tgt in fn_names and chunk_of.get(tgt) != ci:
                    global_names.add(tgt)
    return global_names


def write_src_files(module, src_path, funcs, includes, data_externs,
                    extern_data, extern_fns, chunk_size, isolate=()):
    """Emit ``src/<module>.c`` (+ ``_2.c``, ``_3.c`` ... when split).

    Returns the ``src/...`` paths written, in link order.  With a single group
    the output is byte-identical to the original single-file layout.
    """
    src_dir = os.path.dirname(src_path)
    base = os.path.splitext(os.path.basename(src_path))[0]  # e.g. mini_bowling
    isolate = set(isolate)

    chunks = partition_funcs(funcs, chunk_size, isolate)
    global_names = compute_globals(funcs, chunks)
    multi = len(chunks) > 1

    # remove stale ``<module>_<N>.c`` from a previous, larger split
    stale_re = re.compile(r'^%s_\d+\.c$' % re.escape(base))
    for fn in os.listdir(src_dir):
        if stale_re.match(fn):
            os.remove(os.path.join(src_dir, fn))

    def qual(name):
        return '' if name in global_names else 'static '

    written = []
    for ci, chunk in enumerate(chunks):
        path = src_path if ci == 0 else os.path.join(src_dir, '%s_%d.c' % (base, ci + 1))
        chunk_names = {name for name, _g, _b in chunk}
        is_isolated = len(chunk) == 1 and chunk[0][0] in isolate
        out = []
        out.append('/*')
        if is_isolated:
            out.append(' * %s.c -- REL module: isolated function %s.' % (base, chunk[0][0]))
            out.append(' * This file holds exactly one function so it can be converted from the')
            out.append(' * asm-include below to matching C WITHOUT any asm sibling in the')
            out.append(' * translation unit.  That matters: mwcc\'s inline assembler turns off the')
            out.append(' * instruction scheduler + peephole optimizer for every C function that')
            out.append(' * shares a TU with an `asm` block, so a schedule-sensitive function only')
            out.append(' * reproduces the original when it sits alone in a pure-C file like this.')
            out.append(' * Keep the Makefile SOURCES order so the .text layout is preserved.')
        elif multi:
            out.append(' * %s.c -- REL module, structurally split for per-function' % base)
            out.append(' * byte-matching (part %d of %d; contiguous .text range).  Each function'
                       % (ci + 1, len(chunks)))
            out.append(' * below is an asm-include of its body in asm/nonmatchings/%s/.' % module)
            out.append(' * To convert one to C, isolate it into its own pure-C file (see the')
            out.append(' * --isolate option of tools/rel_split.py) -- an asm sibling in the same')
            out.append(' * TU disables mwcc\'s optimizer for the C function.  Keep the Makefile')
            out.append(' * SOURCES order so the .text layout is preserved.')
        else:
            out.append(' * %s.c -- REL module, structurally split for per-function' % base)
            out.append(' * byte-matching.  Each function below is an asm-include of its body in')
            out.append(' * asm/nonmatchings/%s/; replace them with matching C one at a time.' % module)
        out.append(' * Generated by tools/rel_split.py -- regenerate rather than hand-editing.')
        out.append(' */')
        out.append('')
        out.extend(includes)
        out.append('')
        if data_externs or extern_data:
            out.append('// Addresses loaded by the code that live in this module\'s data/rodata/bss')
            out.append('// (defined in asm/%s.s) or imported.  Declared so mwcc accepts `@ha/@l`.'
                       % module)
            for l in data_externs:
                out.append('extern u8 %s[];' % l)
            for l in extern_data:
                out.append('extern u8 %s[];' % l)
            out.append('')
        if extern_fns:
            out.append('// Imported functions the code calls that no included header declares.')
            for fn in extern_fns:
                out.append('extern void %s();' % fn)
            out.append('')
        out.append('// Forward declarations so mwcc accepts `<fn>@ha/@l` and cross-function')
        out.append('// branches before each function is defined below.')
        # Every global function is forward-declared in every file (external
        # linkage -- a cross-file reference needs to see it).  A static function
        # is forward-declared only in the file that defines it (its symbol is
        # local; declaring it elsewhere would be a separate, unresolved symbol).
        for name, _g, _b in funcs:
            if name in global_names:
                out.append('void %s(void);' % name)
            elif name in chunk_names:
                out.append('static void %s(void);' % name)
        out.append('')
        out.append('#pragma force_active on')
        for name, _g, _b in chunk:
            out.append('%sasm void %s(void)' % (qual(name), name))
            out.append('{')
            out.append('    nofralloc')
            out.append('#include "../asm/nonmatchings/%s/%s.s"' % (module, name))
            out.append('}')
        out.append('#pragma force_active reset')
        out.append('')
        with open(path, 'w', newline='\n') as f:
            f.write('\n'.join(out))
        written.append(os.path.relpath(path, REPO).replace('\\', '/'))
    return written


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('module')
    ap.add_argument('--include', action='append', default=[],
                    help='extra header to #include (for C symbols the code loads)')
    ap.add_argument('--extra-start', action='append', default=[],
                    help='force an additional function-start label')
    ap.add_argument('--extern-fn', action='append', default=[],
                    help='imported function to extern-declare (no header covers it)')
    ap.add_argument('--extern-data', action='append', default=[],
                    help='imported data symbol to extern-declare (loaded by @ha/@l)')
    ap.add_argument('--chunk-size', type=int, default=0,
                    help='max ASM-INCLUDE functions per generated .c file '
                         '(0 = as few files as possible). Cosmetic only: asm-include '
                         'functions carry no C to optimize, so grouping them is '
                         'byte-identical. Use --isolate to break out functions you '
                         'intend to convert to C.')
    ap.add_argument('--isolate', action='append', default=[],
                    help='function label to place in its OWN single-function .c file '
                         'so it can be converted to matching C with no asm sibling in '
                         'the TU (an asm sibling disables mwcc\'s optimizer for C in '
                         'that TU). Repeatable.')
    args = ap.parse_args()
    funcs, starts, text_labels, data_externs, src_files = split_module(
        args.module, args.include, args.extra_start, args.extern_fn, args.extern_data,
        args.chunk_size, args.isolate)
    # cross-file-referenced functions are promoted to global, so recount from
    # what was actually written
    chunks = partition_funcs(funcs, args.chunk_size, args.isolate)
    global_names = compute_globals(funcs, chunks)
    n_global = len(global_names)
    print('module             : %s' % args.module)
    print('.text labels       : %d' % len(text_labels))
    print('function starts    : %d  (%d global, %d static)'
          % (len(funcs), n_global, len(funcs) - n_global))
    print('data externs       : %d' % len(data_externs))
    print('bodies written to  : asm/nonmatchings/%s/' % args.module)
    print('src files written  : %d' % len(src_files))
    for p in src_files:
        print('    %s' % p)
    if len(src_files) > 1:
        print('Makefile SOURCES (in order):')
        for p in src_files:
            print('    %s \\' % p)
        print('    asm/%s.s' % args.module)


if __name__ == '__main__':
    main()
