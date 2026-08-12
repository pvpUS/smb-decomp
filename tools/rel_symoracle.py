#!/usr/bin/env python3
"""Cover a still-asm function by the DATA SYMBOLS it touches, not its callees.

`rel_xref` covers the CALL graph.  This covers the DATA graph, and they are
DIFFERENT ORACLES -- run 30 proved it the expensive way:

  mini_billiards lbl_00016D9C (296 insn) shares no callee with any C function
  in a 2,612-function corpus, so `rel_xref` found nothing.  A grep for the
  SYMBOLS it touches found the whole 12-byte bitfield struct -- field names and
  the exact `void lbl_00016D9C(int, int)` prototype -- ALREADY WRITTEN in
  matched src/mini_billiards_5.c.  Run 29 had declined the same function as
  "a ~15-field bitfield reconstruction, too large to finish".  It was 11 links.

The project had only the call-graph oracle for thirty runs.  This is the other
one, generalised from mini_billiards' one-off to all nine modules -- and its
value is in the other eight, because mini_billiards is now exhausted of typed
symbols.

Three sections, cheapest first:

  1. FREE SIGNATURES.  Still-asm functions whose OWN prototype in matched C is
     something other than the boilerplate `void lbl_XXXXXXXX(void);`.  Someone
     already worked out the arity and the parameter types; 72,594 of the tree's
     75,028 prototypes are the default, so anything else was typed by hand.

  2. TYPED DATA COVER.  Still-asm functions that reference a module symbol
     carrying a non-default type in matched C.  `extern u8 lbl_XXXXXXXX[];` is
     the blob default (65,427 of them); a `struct`, a sized array, or any
     scalar type is real information about the record being decoded.

  3. THE TYPED-SYMBOL DICTIONARY, with each `struct` tag resolved to the file
     and line where its definition can be read.

** THE STILL-ASM SET IS DERIVED FROM src/*.c #include LINES, NEVER FROM
asm/nonmatchings/. **  That directory SURVIVES CONVERSION -- a `.s` sitting
there proves nothing about whether the function is still asm, and reading it as
if it did is the exact defect `rel_arity` shipped with in run 29 and that
option re-hit in run 30.

usage:
  python tools/rel_symoracle.py mini_fight
  python tools/rel_symoracle.py sel_ngc --tree C:/tmp/smbm/sel_ngc
  python tools/rel_symoracle.py mini_golf --min-insn 200
  python tools/rel_symoracle.py --all              # every module, summary only
  python tools/rel_symoracle.py --selftest
"""
import argparse
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from rel_sweep import MODULES                                   # noqa: E402

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

SYM = re.compile(r'\b(lbl_[0-9A-F]{8})\b')
INSN = re.compile(r'^/\* [0-9A-Fa-f]{8} [0-9A-Fa-f]{8} \*/')

# `extern <type> lbl_XXXXXXXX;` or `... lbl_XXXXXXXX[...];`
DECL = re.compile(
    r'^[ \t]*extern[ \t]+(?P<type>[A-Za-z_][A-Za-z0-9_ \t*]*?)[ \t*]+'
    r'(?P<sym>lbl_[0-9A-F]{8})[ \t]*(?P<arr>\[[^\]]*\])?[ \t]*;')
# `<type> lbl_XXXXXXXX(<params>);`
PROTO = re.compile(
    r'^[ \t]*(?:extern[ \t]+)?(?P<type>[A-Za-z_][A-Za-z0-9_ \t*]*?)[ \t*]+'
    r'\*?(?P<sym>lbl_[0-9A-F]{8})[ \t]*\((?P<params>[^)]*)\)[ \t]*;')

# The boilerplate forms.  Everything else was typed by a human.
#
# ** `void lbl_XXXXXXXX()` -- EMPTY parens -- IS BOILERPLATE, not a signature. **
# Gating this tool against mini_fight caught it ranking `void lbl_0001B910()` as
# a free signature off SIXTEEN identical sites.  In C an empty parameter list
# declares nothing about arity, so it carries exactly as much information as the
# `(void)` default and belongs in the same bucket.  The selftest could not have
# found this; only a real module could.  (rel_arity shipped broken in both modes
# with a passing selftest one run earlier -- same lesson, same week.)
BLOB_TYPE = 'u8'
DEFAULT_PROTOS = {('void', 'void'), ('void', '')}
MAX_SITES = 3


def stub_includes(text, stem):
    """Labels this .c file still includes as raw asm."""
    pat = re.compile(
        r'#include\s+"\.\./asm/nonmatchings/%s/(lbl_[0-9A-F]{8})\.s"' % re.escape(stem))
    return set(pat.findall(text))


def scan_sources(src_dir, stem):
    """(still-asm labels, typed decls, non-default protos) over a module's C.

    Returns
      stubs  : set of labels still included as asm
      decls  : sym -> [(file, line, rendered type)]     non-blob data decls
      protos : sym -> [(file, line, rendered signature)] non-default prototypes
    """
    stubs, decls, protos = set(), {}, {}
    for name in sorted(os.listdir(src_dir)):
        if not (name.startswith(stem) and name.endswith('.c')):
            continue
        path = os.path.join(src_dir, name)
        with open(path, encoding='utf-8', errors='replace') as f:
            text = f.read()
        stubs |= stub_includes(text, stem)
        for i, line in enumerate(text.split('\n'), 1):
            m = PROTO.match(line)
            if m:
                ty = ' '.join(m.group('type').split())
                params = ' '.join(m.group('params').split())
                if (ty, params) not in DEFAULT_PROTOS:
                    protos.setdefault(m.group('sym'), []).append(
                        (name, i, '%s %s(%s)' % (ty, m.group('sym'), params)))
                continue
            m = DECL.match(line)
            if m:
                ty = ' '.join(m.group('type').split())
                arr = m.group('arr') or ''
                # `extern u8 lbl_X[];` is the blob default; `u8 lbl_X[4]` is not
                if ty == BLOB_TYPE and arr in ('[]', ''):
                    continue
                decls.setdefault(m.group('sym'), []).append(
                    (name, i, '%s %s%s' % (ty, m.group('sym'), arr)))
    return stubs, decls, protos


def struct_defs(src_dir, include_dir):
    """struct tag -> (file, line) for every definition readable in the tree."""
    out = {}
    pat = re.compile(r'^[ \t]*(?:typedef[ \t]+)?struct[ \t]+([A-Za-z_]\w*)[ \t]*\{')
    for d in (src_dir, include_dir):
        if not os.path.isdir(d):
            continue
        for name in sorted(os.listdir(d)):
            if not name.endswith(('.c', '.h')):
                continue
            path = os.path.join(d, name)
            with open(path, encoding='utf-8', errors='replace') as f:
                for i, line in enumerate(f, 1):
                    m = pat.match(line)
                    if m and m.group(1) not in out:
                        out[m.group(1)] = (name, i)
    return out


def asm_body(asm_dir, label):
    """(instruction count, referenced symbols) for one still-asm function."""
    path = os.path.join(asm_dir, label + '.s')
    if not os.path.exists(path):
        return None, set()
    with open(path, encoding='utf-8', errors='replace') as f:
        text = f.read()
    n = sum(1 for l in text.split('\n') if INSN.match(l.strip()))
    return n, set(SYM.findall(text)) - {label}


def report(module, tree, min_insn, quiet):
    stem = MODULES[module][0]
    src_dir = os.path.join(tree, 'src')
    asm_dir = os.path.join(tree, 'asm', 'nonmatchings', stem)
    stubs, decls, protos = scan_sources(src_dir, stem)
    tags = struct_defs(src_dir, os.path.join(tree, 'include'))

    rows = []
    for label in sorted(stubs):
        n, syms = asm_body(asm_dir, label)
        if n is None or n < min_insn:
            continue
        hits = sorted(s for s in syms if s in decls)
        rows.append((len(hits), n, label, hits, protos.get(label, [])))
    rows.sort(reverse=True)

    free = [r for r in rows if r[4]]
    covered = [r for r in rows if r[3]]

    print('=== %s: %d still-asm fns (from src/*.c #include lines, NOT '
          'asm/nonmatchings/)' % (module, len(stubs)))
    print('    %d carry a NON-DEFAULT prototype; %d touch a typed data symbol'
          % (len(free), len(covered)))
    if quiet:
        return len(free), len(covered)

    print('\n--- 1. FREE SIGNATURES (someone already typed the arity)')
    if not free:
        print('    none -- every prototype is the boilerplate void lbl(void)')
    for _, n, label, hits, sig in free:
        print('  %-14s %5d insn' % (label, n))
        for f, ln, s in sig[:MAX_SITES]:
            print('      %s   %s:%d' % (s, f, ln))
        if len(sig) > MAX_SITES:
            print('      ... and %d more site(s) -- a signature repeated across '
                  'many files is a shared header, not %d independent findings'
                  % (len(sig) - MAX_SITES, len(sig)))

    print('\n--- 2. TYPED DATA COVER (the oracle rel_xref cannot see)')
    if not covered:
        print('    none -- this module is exhausted of typed symbols')
    for _, n, label, hits, _sig in covered:
        print('  %-14s %5d insn   %d typed: %s'
              % (label, n, len(hits), ', '.join(hits)))

    print('\n--- 3. TYPED-SYMBOL DICTIONARY')
    used = {s for r in covered for s in r[3]}
    for sym in sorted(decls):
        for f, ln, rendered in decls[sym]:
            mark = '*' if sym in used else ' '
            print('  %s %-52s %s:%d' % (mark, rendered, f, ln))
            m = re.match(r'(?:const\s+)?struct\s+(\w+)', rendered)
            if m and m.group(1) in tags:
                tf, tl = tags[m.group(1)]
                print('        struct %s defined at %s:%d' % (m.group(1), tf, tl))
    print('\n  (* = touched by a still-asm function above)')
    return len(free), len(covered)


# --------------------------------------------------------------------------
# selftest.  Synthetic fixtures only -- a passing selftest is NOT a gate.
# rel_arity shipped broken in BOTH modes with a passing selftest (run 29->30),
# so --selftest is followed by a real run against a real module before this
# tool is believed.
# --------------------------------------------------------------------------
def selftest():
    import shutil
    import tempfile
    ok = fail = 0

    def check(name, got, want):
        nonlocal ok, fail
        if got == want:
            ok += 1
        else:
            fail += 1
            print('  FAIL %s\n    got  %r\n    want %r' % (name, got, want))

    root = tempfile.mkdtemp(prefix='symoracle_')
    try:
        src = os.path.join(root, 'src')
        asm = os.path.join(root, 'asm', 'nonmatchings', 'mini_fight')
        os.makedirs(src)
        os.makedirs(asm)
        with open(os.path.join(src, 'mini_fight_1.c'), 'w') as f:
            f.write(
                'extern u8 lbl_00001000[];\n'                 # blob, ignored
                'extern u8 lbl_00001004[4];\n'                # SIZED -> typed
                'extern struct FightWork lbl_00002000;\n'     # typed
                'extern const struct Foo lbl_00003000[];\n'   # typed
                'void lbl_0000AAAA(void);\n'                  # default, ignored
                'void lbl_0000DDDD();\n'                      # EMPTY parens ->
                                                              # also default
                'void lbl_0000BBBB(int, int);\n'              # non-default
                'struct FightWork {\n  int x;\n};\n'
                '#include "../asm/nonmatchings/mini_fight/lbl_0000BBBB.s"\n'
                '#include "../asm/nonmatchings/mini_fight/lbl_0000AAAA.s"\n')
        # a converted function's .s SURVIVES in asm/nonmatchings -- this one is
        # NOT included by any .c and must not appear anywhere in the output.
        for label, refs in (('lbl_0000BBBB', ['lbl_00002000', 'lbl_00001000']),
                            ('lbl_0000AAAA', ['lbl_00001004']),
                            ('lbl_0000CCCC', ['lbl_00003000'])):
            with open(os.path.join(asm, label + '.s'), 'w') as f:
                f.write('.global %s\n%s:\n' % (label, label))
                for i, r in enumerate(refs):
                    f.write('/* %08X 60000000 */ lis r3, %s@ha\n' % (i * 4, r))

        stubs, decls, protos = scan_sources(src, 'mini_fight')
        check('stubs from #include only', stubs, {'lbl_0000AAAA', 'lbl_0000BBBB'})
        check('converted .s not treated as still-asm', 'lbl_0000CCCC' in stubs, False)
        check('blob u8[] excluded', 'lbl_00001000' in decls, False)
        check('sized u8[4] kept', 'lbl_00001004' in decls, True)
        check('struct kept', 'lbl_00002000' in decls, True)
        check('const struct kept', 'lbl_00003000' in decls, True)
        check('default proto excluded', 'lbl_0000AAAA' in protos, False)
        check('EMPTY-paren proto excluded (found by the mini_fight gate, '
              'not by this selftest)', 'lbl_0000DDDD' in protos, False)
        check('non-default proto kept', 'lbl_0000BBBB' in protos, True)
        check('proto rendered', protos['lbl_0000BBBB'][0][2],
              'void lbl_0000BBBB(int, int)')
        check('decl rendered', decls['lbl_00001004'][0][2], 'u8 lbl_00001004[4]')

        n, syms = asm_body(asm, 'lbl_0000BBBB')
        check('insn count', n, 2)
        check('self excluded from refs', 'lbl_0000BBBB' in syms, False)
        check('refs found', syms, {'lbl_00002000', 'lbl_00001000'})

        tags = struct_defs(src, os.path.join(root, 'include'))
        check('struct tag located', tags.get('FightWork'), ('mini_fight_1.c', 8))

        # a .s that exists for a still-asm label but is empty of insns
        with open(os.path.join(asm, 'lbl_0000AAAA.s'), 'w') as f:
            f.write('.global lbl_0000AAAA\nlbl_0000AAAA:\n')
        n2, _ = asm_body(asm, 'lbl_0000AAAA')
        check('empty body counts 0 not None', n2, 0)
        check('missing body is None', asm_body(asm, 'lbl_0000DEAD')[0], None)
    finally:
        shutil.rmtree(root, ignore_errors=True)

    print('selftest: %d ok, %d failed' % (ok, fail))
    print('A PASSING SELFTEST IS NOT A GATE -- run this against a real module '
          'and read the output before believing it.')
    return 1 if fail else 0


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('module', nargs='?')
    ap.add_argument('--tree', default=REPO)
    ap.add_argument('--min-insn', type=int, default=0)
    ap.add_argument('--all', action='store_true')
    ap.add_argument('--selftest', action='store_true')
    a = ap.parse_args()

    if a.selftest:
        return selftest()
    if a.all:
        print('%-16s %8s %8s' % ('module', 'free-sig', 'typed'))
        for m in sorted(MODULES):
            free, cov = report(m, a.tree, a.min_insn, quiet=True)
        return 0
    if not a.module or a.module not in MODULES:
        ap.error('module must be one of: %s' % ', '.join(sorted(MODULES)))
    report(a.module, a.tree, a.min_insn, quiet=False)
    return 0


if __name__ == '__main__':
    sys.exit(main())
