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
COMMENT_RE = re.compile(r'^\s*(/\*|\*|//)')


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
    if s == '' or COMMENT_RE.match(line) or s.startswith('#include'):
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
    ap.add_argument('--monolith-rev', default=DRAFT_REV)
    args = ap.parse_args()
    mod = args.module

    files = src_files(mod)
    if not files:
        sys.exit('no src/%s*.c found' % mod)
    head = open(files[0], errors='ignore').read()
    extern_fns = re.findall(r'^extern void ([A-Za-z0-9_]+)\(\);', head, re.M)
    committed_data = re.findall(r'^extern u8 ([A-Za-z0-9_]+)\[\];', head, re.M)  # ordered

    # reconstruct the isolate layout + save each pure-C file's full content,
    # keyed by the frozenset of functions it DEFINES
    asm_inc = 'nonmatchings/%s/' % mod
    singletons, ranges, saved, saved_fwd = [], [], {}, {}
    saved_ext, saved_extra, pure_labels = {}, {}, set()
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
    extra = sorted(pure_labels | set(args.add))

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
    h = next(i for i, l in enumerate(L) if l.strip() == '# mkbe.rel_%s.rel sources' % mod)
    s = h + 1
    e = next(i for i in range(s + 1, len(L)) if L[i].strip() == 'asm/%s.s' % mod)
    L[s:e + 1] = ['SOURCES := \\'] + ['\t%s \\' % p for p in rel] + ['\tasm/%s.s' % mod]
    open(mk, 'w', newline='\n').write('\n'.join(L))

    print('re-applied %d pure-C files; %d src files total; added: %s'
          % (applied, len(files), ', '.join(args.add) or '(none)'))
    if args.add:
        print('the --add functions are now asm-include stubs in their own files '
              '-- convert to C, rebuild, and check the golden sha1.')


if __name__ == '__main__':
    main()
