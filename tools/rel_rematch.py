#!/usr/bin/env python3
"""rel_rematch.py -- re-split a partially-matched REL module and re-apply its
matched C, so new functions can be isolated without hand-rebuilding everything.

A committed minigame REL is a mix of asm-include scaffolding + already-matched C
in pure-C files.  Re-running ``tools/rel_split.py`` regenerates the scaffolding
and CLOBBERS the hand-matched C.  This tool reconstructs the whole split state
from the committed ``src/<module>*.c`` files -- the imported ``extern`` symbols,
the ``--isolate`` / ``--isolate-range`` layout, and the ENTIRE content of every
pure-C file (function bodies AND any struct/typedef/static a match needed) --
restores the monolithic ``asm/<module>.s`` from the draft commit, re-runs the
splitter with the same layout (plus any NEW functions you name with ``--add``),
and swaps each pure-C file's saved content back in over the regenerated stubs.
Result: the same golden split, with your ``--add`` functions freshly carved into
their own pure-C files, ready to convert.

Preamble edits a match makes IN A PURE-C FILE are preserved across a re-split,
even though ``rel_split.py`` regenerates the preamble generically:
  * a hand-typed function forward decl (a cross-file typed call ``lbl_X(i,*p)``
    needs ``void lbl_X(int,int);`` where lbl_X is defined in another file);
  * a hand-typed IMPORTED-FN extern (``extern int func_80042214(u32);`` in place
    of the generic ``extern void func_80042214();`` for a fn used by value);
  * a hand-typed DATA extern (``extern struct S d;`` / ``extern T d[8];`` in
    place of ``extern u8 d[];`` -- so mwcc emits base-in-@ha addressing, which is
    what lets some functions referencing a module ``.bss``/``.data`` table match);
  * any struct/typedef/#define the match added to the preamble that a typed
    extern above depends on.
To convert a function that needs one of these, hand-edit the extern in ITS pure-C
file (define the type there or via a struct tag the body completes) -- it will
survive the next ``rel_rematch``.

Usage:
    python tools/rel_rematch.py <module> [--add <lbl> ...] [--monolith-rev REV]

Then convert the ``--add`` stub files to C and rebuild.  ALWAYS verify: build the
REL, check the golden sha1, AND confirm the pure-C files still contain C
(``grep -c '#include "../asm/nonmatchings' src/<mod>_N.c`` == 0) -- an all-asm
split also hashes golden, so the hash alone is not proof the C survived.
"""
import argparse
import glob
import os
import re
import subprocess
import sys

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
DRAFT_REV = '5138d8f'

FWD = re.compile(r'^(?:static\s+)?[A-Za-z_][\w\s\*]*\b'
                 r'(lbl_[0-9A-Fa-f]+|_prolog|_epilog|_unresolved)\s*\([^;{]*\)\s*;\s*$')
DEFSIG = re.compile(r'^(?:static\s+)?(?:asm\s+)?[A-Za-z_][\w\s\*]*?\b'
                    r'(lbl_[0-9A-Fa-f]+|_prolog|_epilog|_unresolved)\s*\([^;{]*\)\s*$')

EXTERN_RE = re.compile(r'^\s*extern\b')
INLINE_COMMENT = re.compile(r'/\*.*?\*/')


def is_comment_only(line):
    """True only when the line carries NO code.

    The old test was ``^\\s*(/\\*|\\*|//)``, which also matched an
    offset-annotated struct field like ``    /*0x00*/ u8 filler0[0x58];``.
    Those were then treated as regenerable scaffold and dropped, so every
    hand-added struct in a pure-C preamble came back as an empty
    ``struct X { };`` -- silently, and the file no longer compiled.
    """
    s = line.strip()
    if not s:
        return False                       # blank is handled by the caller
    if s.startswith('//'):
        return True
    if s.startswith('*'):                  # ' * body' or ' */' continuation
        return True
    if s.startswith('/*'):
        if '*/' not in s:
            return True                    # opens a multi-line comment
        return INLINE_COMMENT.sub('', s).strip() == ''
    return False


def extern_name(line):
    """The symbol an ``extern`` declaration declares, or None if not an extern.

    Handles the generic split forms and any hand-typed override:
    ``extern void f();`` -> f, ``extern int f(u32);`` -> f,
    ``extern u8 d[];`` -> d, ``extern struct S d;`` -> d, ``extern T d[8];`` -> d.
    The declared name is the last identifier before the first ``( [ ; =``.
    """
    if not EXTERN_RE.match(line):
        return None
    head = re.split(r'[(\[;=]', line, maxsplit=1)[0]
    ids = [i for i in re.findall(r'[A-Za-z_]\w*', head) if i != 'extern']
    return ids[-1] if ids else None


def is_scaffold(line):
    """True for a preamble line rel_split.py itself regenerates (blank, comment,
    #include, an extern, or a function forward-decl) -- i.e. NOT a hand-added
    struct/typedef/#define a match introduced in the preamble."""
    s = line.strip()
    if s == '' or is_comment_only(line) or s.startswith('#include'):
        return True
    if extern_name(line) is not None:
        return True
    return bool(FWD.match(line) and s.endswith(';'))


def src_files(module):
    def key(p):
        m = re.match(r'%s_(\d+)\.c$' % re.escape(module), os.path.basename(p))
        return int(m.group(1)) if m else 0
    return sorted(glob.glob(os.path.join(REPO, 'src', module + '*.c')), key=key)


def content_region(text):
    """(preamble_lines, content_lines): content = everything after the last
    forward-declaration line (so it includes any struct/typedef the match added,
    the #pragma force_active block, and the definitions)."""
    lines = text.split('\n')
    last_fwd = max((i for i, l in enumerate(lines)
                    if FWD.match(l) and l.rstrip().endswith(';')), default=-1)
    return lines[:last_fwd + 1], lines[last_fwd + 1:]


def defined_labels(content_lines):
    return {DEFSIG.match(l).group(1) for l in content_lines
            if DEFSIG.match(l) and not l.rstrip().endswith(';')}


def extern_u8(text):
    return set(re.findall(r'^extern u8 ([A-Za-z0-9_]+)\[\];', text, re.M))


def included_insn(module):
    """{label: instruction count} over the rows some src/*.c actually #includes.

    This is the module's ASM-side contribution to .text, and it is the quantity
    run 9 watched vanish.  Rows that are already pure C are excluded on purpose:
    the total over ALL .s files is invariant under a re-split (a merged row just
    makes its predecessor's .s longer), so only the INCLUDED subset can detect
    a boundary that was lost.
    """
    out = {}
    inc = re.compile(r'#include "\.\./asm/nonmatchings/%s/([A-Za-z0-9_]+)\.s"'
                     % re.escape(module))
    labels = set()
    for f in src_files(module):
        labels.update(inc.findall(open(f, errors='ignore').read()))
    for lbl in labels:
        p = os.path.join(REPO, 'asm', 'nonmatchings', module, lbl + '.s')
        if os.path.exists(p):
            out[lbl] = len(re.findall(r'/\* [0-9A-F]{8} [0-9A-F]{8} \*/',
                                      open(p, errors='replace').read()))
        else:
            out[lbl] = None                   # included but the .s is GONE
    return out


def run_split(module, extern_fns, extern_data, singletons, ranges,
              extra_starts=()):
    cmd = [sys.executable, os.path.join(REPO, 'tools', 'rel_split.py'), module]
    for fn in extern_fns:
        cmd += ['--extern-fn', fn]
    for d in extern_data:
        cmd += ['--extern-data', d]
    for lbl in extra_starts:
        cmd += ['--extra-start', lbl]
    for lbl in singletons:
        cmd += ['--isolate', lbl]
    for a, b in ranges:
        cmd += ['--isolate-range', a, b]
    subprocess.check_call(cmd, cwd=REPO, stdout=subprocess.DEVNULL)


def restore_mono(module, rev):
    mono = subprocess.check_output(
        ['git', 'show', '%s:asm/%s.s' % (rev, module)], cwd=REPO)
    open(os.path.join(REPO, 'asm', module + '.s'), 'wb').write(mono)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('module')
    ap.add_argument('--add', action='append', default=[])
    ap.add_argument('--extra-start', action='append', default=[],
                    help='extra rel_split function-start label to preserve '
                         'across the re-split (repeatable).  Required for a '
                         'module whose handlers are reached only through a '
                         '.data function-pointer table -- see below.')
    ap.add_argument('--extra-start-file',
                    help='file with one --extra-start label per line; blank '
                         'lines and #comments ignored')
    ap.add_argument('--monolith-rev', default=DRAFT_REV)
    args = ap.parse_args()
    mod = args.module
    if args.extra_start_file:
        for line in open(args.extra_start_file):
            line = line.split('#')[0].strip()
            if line:
                args.extra_start.append(line)

    files = src_files(mod)
    if not files:
        sys.exit('no src/%s*.c found' % mod)
    before_insn = included_insn(mod)
    head = open(files[0], errors='ignore').read()
    extern_fns = re.findall(r'^extern void ([A-Za-z0-9_]+)\(\);', head, re.M)
    committed_data = re.findall(r'^extern u8 ([A-Za-z0-9_]+)\[\];', head, re.M)  # ordered

    # reconstruct the isolate layout + save each pure-C file's full content,
    # keyed by the frozenset of functions it DEFINES
    # Detect a still-asm file by the actual asm-include DIRECTIVE, not by a bare
    # 'nonmatchings/<mod>/' substring.  rel_split.py's multi-function file header
    # comment says "... an asm-include of its body in asm/nonmatchings/<mod>/.",
    # so a fully-converted pure-C file that kept that header was mis-detected as
    # a group file and silently dropped -- reverting the match.  (This is the
    # long-standing "rel_rematch loses newly-converted files" bug; it cost
    # mini_race 6 files in run 3 and hit again in run 4 before being fixed.)
    asm_inc = '#include "../asm/nonmatchings/%s/' % mod
    singletons, ranges, saved, saved_fwd = [], [], {}, {}
    saved_ext, saved_extra, saved_inc, pure_labels = {}, {}, {}, set()
    # RUN 9, test_mode: rel_rematch SILENTLY DELETED 48 INSTRUCTIONS.
    #
    # `extra` below was reconstructed from pure-C files only, so a label that is
    # STILL ASM inside a group file was not passed to rel_split as a function
    # start.  rel_split could not auto-detect the boundary, so those
    # instructions merged into the PRECEDING row -- and when that predecessor
    # was already pure C, its .s is not #included by anything, so the code
    # simply vanished from .text.  The build was clean, warning-free and
    # non-golden, and the only symptom was the hash.
    #
    # The fix is to derive the starts from the group files' own asm-include set
    # as well.  Every label some .c actually #includes is, by definition, a
    # boundary that must survive the re-split.
    asm_included = set()
    for f in files:
        for m in re.finditer(re.escape(asm_inc) + r'([A-Za-z0-9_]+)\.s"',
                             open(f, errors='ignore').read()):
            asm_included.add(m.group(1))

    for f in files:
        txt = open(f, errors='ignore').read()
        if asm_inc in txt:
            continue                          # group file: still has asm stubs
        _pre, content = content_region(txt)
        labs = defined_labels(content)
        if not labs:
            continue
        key = frozenset(labs)
        pure_labels |= labs                   # every function carried as pure C
        saved[key] = '\n'.join(content)
        # capture the committed forward declarations verbatim, keyed by label.
        # a match may hand-type a forward decl for a function DEFINED IN ANOTHER
        # file (e.g. a typed call `lbl_X(i, *p)` needs `void lbl_X(int,int);`);
        # the regenerated preamble only carries the generic `void lbl_X(void);`
        # and the sig-rewrite below only covers labels defined in THIS file, so
        # without this those cross-file typed decls would be lost and the file
        # would no longer compile.
        saved_fwd[key] = {
            FWD.match(l).group(1): l.rstrip()
            for l in _pre if FWD.match(l) and l.rstrip().endswith(';')}
        # capture the committed EXTERN declarations verbatim, keyed by symbol.
        # rel_split.py regenerates every import as the generic `extern void f();`
        # / `extern u8 d[];`; a match may hand-type these -- an imported fn used
        # by value (`extern int func_80042214(u32);`) or a module data table typed
        # so mwcc emits base-in-@ha addressing (`extern struct S d;` instead of
        # `extern u8 d[];`). Re-apply the committed form over the generic one.
        saved_ext[key] = {extern_name(l): l.rstrip()
                          for l in _pre if extern_name(l)}
        # capture any hand-added preamble lines that are NOT scaffolding (a
        # struct/typedef/#define a typed extern above needs) so they survive too.
        saved_extra[key] = [l.rstrip() for l in _pre if not is_scaffold(l)]
        # capture the committed #include list.  rel_split.py picks a file's
        # includes from the symbols its asm stubs reference; once the stubs are
        # gone that heuristic can drop a header the hand-written C still needs
        # (mini_race lbl_00010BC8 lost "stcoli.h"/"thread.h" this way and no
        # longer compiled).  Any committed include missing from the regenerated
        # preamble is re-inserted below.
        saved_inc[key] = [l.rstrip() for l in _pre
                          if l.strip().startswith('#include')]
        ordered = [DEFSIG.match(l).group(1) for l in content
                   if DEFSIG.match(l) and not l.rstrip().endswith(';')]
        if len(ordered) == 1:
            singletons.append(ordered[0])
        else:
            ranges.append((ordered[0], ordered[-1]))
    print('reconstructed %s: %d pure-C files, %d singletons, %d ranges, '
          '%d extern-fn' % (mod, len(saved), len(singletons), len(ranges),
                            len(extern_fns)))

    # Every label carried as pure C (plus any --add) must be a rel_split function
    # START.  Some are not auto-detected: a handler reached only through a .data
    # function-pointer table (`blrl`) is not a `bl`/`@ha` target, so without an
    # explicit --extra-start rel_split neither isolates it nor accepts it as a
    # range endpoint ("unknown end label ...").  Force them all.
    # NOTE this used to be `pure_labels | set(args.add)`, which silently threw
    # away any --extra-start set the original split needed.  The failure is a
    # FALSE NEGATIVE, not a crash: the re-split merges the invisible handlers
    # into the preceding function, so a correctly-converted 11-instruction
    # function comes back measured as a 716-instruction one with 700 diffs.
    # On option (47 auto-detected starts vs 71 real) that made per-function
    # feedback meaningless.  Keep the caller's starts.
    extra = sorted(pure_labels | asm_included | set(args.add)
                   | set(args.extra_start))

    # PROBE: split with no extern-data / no isolates to learn the auto data
    # externs; the committed extras are the imports that need --extern-data.
    restore_mono(mod, args.monolith_rev)
    run_split(mod, extern_fns, [], [], [], extra)
    auto = extern_u8(open(os.path.join(REPO, 'src', mod + '.c'),
                          errors='ignore').read())
    imports = [d for d in committed_data if d not in auto]  # committed order
    print('  data imports (--extern-data): %d' % len(imports))

    # REAL split with the reconstructed layout + any new --add isolates
    restore_mono(mod, args.monolith_rev)
    run_split(mod, extern_fns, imports, singletons + args.add, ranges, extra)

    # swap each saved content region back over its regenerated stub file
    files = src_files(mod)
    applied = 0
    for f in files:
        txt = open(f, newline='\n', errors='ignore').read()
        # labels this regenerated file covers (asm-include stub targets)
        labs = frozenset(re.findall(
            r'nonmatchings/%s/(lbl_[0-9A-Fa-f]+|_prolog|_epilog|_unresolved)\.s' % mod, txt))
        if labs in saved:
            pre, _old = content_region(txt)
            content = saved[labs]
            # the match may have changed a function's signature (params/return
            # type); those forward decls live in the regenerated preamble, so
            # rewrite them to keep decl==def.  Precedence per forward-decl line:
            #   1. the committed forward decl verbatim (covers cross-file typed
            #      calls the match hand-typed, defined in some OTHER file);
            #   2. the saved local definition's signature (this file's own defs);
            #   3. the regenerated generic line (untouched).
            cfwd = saved_fwd.get(labs, {})
            cext = saved_ext.get(labs, {})
            cextra = saved_extra.get(labs, [])
            sigs = {DEFSIG.match(l).group(1): l.rstrip()
                    for l in content.split('\n')
                    if DEFSIG.match(l) and not l.rstrip().endswith(';')}

            def fix_decl(l):
                m = FWD.match(l)
                if m:                        # a function forward declaration
                    lab = m.group(1)
                    if lab in cfwd:
                        return cfwd[lab]
                    if lab in sigs:
                        return sigs[lab] + ';'
                    return l
                sym = extern_name(l)         # an extern (imported fn / data)
                if sym is not None and sym in cext:
                    return cext[sym]         # committed (possibly typed) form
                return l
            pre = [fix_decl(l) for l in pre]
            # restore any committed #include the regenerated preamble dropped
            cinc = saved_inc.get(labs, [])
            have = {l.strip() for l in pre if l.strip().startswith('#include')}
            missing = [l for l in cinc if l.strip() not in have]
            if missing:
                last_inc = max(i for i, l in enumerate(pre)
                               if l.strip().startswith('#include'))
                pre = pre[:last_inc + 1] + missing + pre[last_inc + 1:]
                # A restored header may already declare a function that
                # rel_split.py re-emitted as the generic `extern void X();`,
                # which mwcc rejects as a conflicting redeclaration.  For a
                # pure-C file the committed extern set is authoritative (it is
                # what compiled), so drop generic externs it does not carry.
                pre = [l for l in pre
                       if not (re.match(r'^extern void [A-Za-z0-9_]+\(\);\s*$', l)
                               and extern_name(l) not in cext)]
            # inject any committed hand-added preamble lines (struct/typedef a
            # typed extern needs) + any committed extern with no regenerated
            # counterpart, ahead of the extern block so a needed type precedes it.
            declared = {extern_name(l) for l in pre if extern_name(l)}
            inject = cextra + [cext[s] for s in cext if s not in declared]
            if inject:
                ins = next((i for i, l in enumerate(pre)
                            if extern_name(l)
                            or l.startswith('// Addresses loaded')
                            or l.startswith('// Imported functions')), None)
                if ins is None:
                    ins = next((i for i, l in enumerate(pre)
                                if l.startswith('// Forward declarations')),
                               len(pre))
                pre = pre[:ins] + inject + pre[ins:]
            open(f, 'w', newline='\n').write('\n'.join(pre) + '\n' + content)
            applied += 1
    if applied != len(saved):
        sys.exit('re-apply mismatch: applied %d of %d saved pure-C files '
                 '(a saved function set did not match any regenerated file)'
                 % (applied, len(saved)))

    # rewrite the module's Makefile SOURCES block in .text order
    rel = [os.path.relpath(p, REPO).replace('\\', '/') for p in files]
    mk = os.path.join(REPO, 'Makefile')
    L = open(mk).read().split('\n')
    # The REL target name does not always follow `mkbe.rel_<mod>.rel`, and the
    # module stem is not always the target stem.  Three spellings exist:
    #   mini_bowling -> # mkbe.rel_mini_bowling.rel sources
    #   test_mode    -> # mkbe.test_mode.rel sources
    #   sel_ngc_rel  -> # mkbe.sel_ngc.rel sources        (stem drops its _rel)
    # The old single-form lookup raised StopIteration *after* the src files had
    # already been rewritten, leaving the tree half-updated -- the exact failure
    # mode the comment below warns about.
    hdrs = ['# mkbe.rel_%s.rel sources' % mod, '# mkbe.%s.rel sources' % mod]
    if mod.endswith('_rel'):
        hdrs.append('# mkbe.%s.rel sources' % mod[:-len('_rel')])
    h = next((i for i, l in enumerate(L) if l.strip() in hdrs), None)
    if h is None:
        sys.exit('rel_rematch: no Makefile SOURCES header found for %r\n'
                 '  looked for: %s' % (mod, ', '.join(repr(x) for x in hdrs)))
    s = h + 1
    # The block ends at its last continuation line.  Do NOT look for
    # `asm/<mod>.s` as the terminator: rel_carve.py moves that line to the FRONT
    # and appends `asm/<mod>_dN.s` instead, and the old search then raised
    # StopIteration after the src files had already been rewritten, leaving the
    # tree half-updated.
    e = s
    while e < len(L) and L[e].rstrip().endswith('\\'):
        e += 1
    L[s:e + 1] = ['SOURCES := \\'] + ['\t%s \\' % p for p in rel] + ['\tasm/%s.s' % mod]
    open(mk, 'w', newline='\n').write('\n'.join(L))

    # HARD FAIL if the re-split changed how much asm .text is actually built.
    # This is the run-9 test_mode defect (48 instructions deleted by a clean,
    # warning-free, exit-0 run whose only symptom was a non-golden hash).  The
    # --add labels are expected to appear as NEW stubs, so they are excluded.
    after_insn = included_insn(mod)
    added = set(args.add)
    lost, changed = [], []
    for lbl, n in before_insn.items():
        if lbl in added:
            continue
        m = after_insn.get(lbl)
        if m is None:
            lost.append((lbl, n))
        elif n is not None and m != n:
            changed.append((lbl, n, m))
    bt = sum(n for l, n in before_insn.items() if n and l not in added)
    at = sum(n for l, n in after_insn.items() if n and l not in added)
    if lost or changed or bt != at:
        print('\n*** REL_REMATCH ABORTED THE RESULT: the re-split changed the '
              'built asm ***', file=sys.stderr)
        for lbl, n in lost:
            print('  LOST      %s (%s insn) is #included but its .s no longer '
                  'exists -- it merged into the preceding row, and if that row '
                  'is already pure C those instructions are GONE from .text.'
                  % (lbl, n), file=sys.stderr)
        for lbl, n, m in changed:
            print('  RESIZED   %s  %d insn -> %d insn' % (lbl, n, m),
                  file=sys.stderr)
        print('  TOTAL     %d insn -> %d insn  (delta %+d)' % (bt, at, at - bt),
              file=sys.stderr)
        print('\nThe tree HAS ALREADY BEEN REWRITTEN. Restore it from a snapshot'
              ' (NOT\n`git checkout src/` -- HEAD may predate your re-splits), '
              'then re-run passing\nevery still-asm row label via '
              '--extra-start-file.\n', file=sys.stderr)
        return 1

    print('re-applied %d pure-C files; %d src files total; added: %s'
          % (applied, len(files), ', '.join(args.add) or '(none)'))
    print('instruction-count check: %d asm insn included, unchanged.' % at)
    if args.add:
        print('the --add functions are now asm-include stubs in their own files '
              '-- convert to C, rebuild, and check the golden sha1.')


if __name__ == '__main__':
    sys.exit(main() or 0)
