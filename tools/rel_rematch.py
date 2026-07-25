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


def run_split(module, extern_fns, extern_data, singletons, ranges):
    cmd = [sys.executable, os.path.join(REPO, 'tools', 'rel_split.py'), module]
    for fn in extern_fns:
        cmd += ['--extern-fn', fn]
    for d in extern_data:
        cmd += ['--extern-data', d]
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
    for f in files:
        txt = open(f, errors='ignore').read()
        if asm_inc in txt:
            continue                          # group file: still has asm stubs
        _pre, content = content_region(txt)
        labs = defined_labels(content)
        if not labs:
            continue
        saved[frozenset(labs)] = '\n'.join(content)
        # capture the committed forward declarations verbatim, keyed by label.
        # a match may hand-type a forward decl for a function DEFINED IN ANOTHER
        # file (e.g. a typed call `lbl_X(i, *p)` needs `void lbl_X(int,int);`);
        # the regenerated preamble only carries the generic `void lbl_X(void);`
        # and the sig-rewrite below only covers labels defined in THIS file, so
        # without this those cross-file typed decls would be lost and the file
        # would no longer compile.
        saved_fwd[frozenset(labs)] = {
            FWD.match(l).group(1): l.rstrip()
            for l in _pre if FWD.match(l) and l.rstrip().endswith(';')}
        ordered = [DEFSIG.match(l).group(1) for l in content
                   if DEFSIG.match(l) and not l.rstrip().endswith(';')]
        if len(ordered) == 1:
            singletons.append(ordered[0])
        else:
            ranges.append((ordered[0], ordered[-1]))
    print('reconstructed %s: %d pure-C files, %d singletons, %d ranges, '
          '%d extern-fn' % (mod, len(saved), len(singletons), len(ranges),
                            len(extern_fns)))

    # PROBE: split with no extern-data / no isolates to learn the auto data
    # externs; the committed extras are the imports that need --extern-data.
    restore_mono(mod, args.monolith_rev)
    run_split(mod, extern_fns, [], [], [])
    auto = extern_u8(open(os.path.join(REPO, 'src', mod + '.c'),
                          errors='ignore').read())
    imports = [d for d in committed_data if d not in auto]  # committed order
    print('  data imports (--extern-data): %d' % len(imports))

    # REAL split with the reconstructed layout + any new --add isolates
    restore_mono(mod, args.monolith_rev)
    run_split(mod, extern_fns, imports, singletons + args.add, ranges)

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
            sigs = {DEFSIG.match(l).group(1): l.rstrip()
                    for l in content.split('\n')
                    if DEFSIG.match(l) and not l.rstrip().endswith(';')}

            def fix_decl(l):
                m = FWD.match(l)
                if not m:
                    return l
                lab = m.group(1)
                if lab in cfwd:
                    return cfwd[lab]
                if lab in sigs:
                    return sigs[lab] + ';'
                return l
            pre = [fix_decl(l) for l in pre]
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
