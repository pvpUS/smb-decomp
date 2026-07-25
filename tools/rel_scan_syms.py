#!/usr/bin/env python3
"""Print the --extern-fn / --extern-data a rel_split needs, in one shot.

Splitting a fresh REL module means telling rel_split.py about every symbol the
asm references but the included headers do not declare.  The obvious way to find
them is to build and harvest the compiler's `undefined label` / `illegal use of
label` errors -- but mwcc aborts early, so they arrive in WAVES and the loop
takes ~10 build cycles per module.

This does it statically instead: collect every `bl <name>` and `<name>@ha/@l`
target in asm/nonmatchings/<stem>/, subtract the module's own labels, subtract
everything reachable through the headers you plan to --include (transitively),
and print what is left.  test_mode's split used this after two wasted wave
iterations and the next build was clean.

Comments are stripped from the headers before the identifier sweep, and that
matters: variables.h has real symbols COMMENTED OUT (spriteTileOffsets,
lbl_802F2130 during the test_mode split).  A plain grep-for-name would call
those declared and you would chase the resulting link errors by hand.

usage:
  python tools/rel_scan_syms.py <stem> --include a.h --include b.h ...
  python tools/rel_scan_syms.py <stem> --args-file splitargs.txt
  python tools/rel_scan_syms.py <stem> --args-file splitargs.txt --repo C:/tmp/smbm/option

<stem> is the src/asm stem (mini_bowling, test_mode, sel_ngc_rel), not the warm
directory and not the build target.  --args-file reads an existing rel_split
argument list and picks the --include entries out of it, so you can iterate:
scan, append the output to splitargs.txt, scan again.
"""
import argparse
import os
import re
import sys

BL = re.compile(r'\bbl\s+([A-Za-z_][A-Za-z0-9_]*)\b')
ADDR = re.compile(r'\b([A-Za-z_][A-Za-z0-9_]*)@(?:ha|l|h)\b')


def header_path(repo, name):
    for base in ('src', 'include'):
        p = os.path.join(repo, base, name)
        if os.path.exists(p):
            return p
    return None


def slurp(repo, path, seen):
    """A header plus everything it includes, transitively."""
    if path in seen:
        return ''
    seen.add(path)
    try:
        text = open(path, encoding='utf-8', errors='replace').read()
    except OSError:
        return ''
    out = text
    for m in re.finditer(r'#\s*include\s*[<"]([^">]+)[">]', text):
        q = header_path(repo, m.group(1))
        if q:
            out += slurp(repo, q, seen)
    return out


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('stem')
    ap.add_argument('--include', action='append', default=[])
    ap.add_argument('--args-file',
                    help='an existing rel_split argument list; its --include '
                         'entries are used')
    ap.add_argument('--repo', default=os.path.dirname(
        os.path.dirname(os.path.abspath(__file__))))
    args = ap.parse_args()

    repo, stem = args.repo.replace('\\', '/'), args.stem
    asmdir = os.path.join(repo, 'asm', 'nonmatchings', stem)
    if not os.path.isdir(asmdir):
        sys.exit('no %s -- split the module first (even a bare rel_split run '
                 'produces the per-function bodies this reads)' % asmdir)

    includes = list(args.include)
    if args.args_file:
        toks = open(args.args_file).read().split()
        includes += [toks[i + 1] for i, t in enumerate(toks)
                     if t == '--include' and i + 1 < len(toks)]

    # every symbol the module's code refers to
    fns, datas = set(), set()
    for name in os.listdir(asmdir):
        if not name.endswith('.s'):
            continue
        for line in open(os.path.join(asmdir, name),
                         encoding='utf-8', errors='replace'):
            # the `/* addr word */` prefix carries hex that can look like a name
            op = line.rsplit('*/', 1)[-1] if '*/' in line else line
            fns.update(m.group(1) for m in BL.finditer(op))
            datas.update(m.group(1) for m in ADDR.finditer(op))

    # minus the module's own
    local_fn = {n[:-2] for n in os.listdir(asmdir) if n.endswith('.s')}
    local_fn |= {'_prolog', '_epilog', '_unresolved'}
    blob_s = os.path.join(repo, 'asm', '%s.s' % stem)
    local_data = set()
    if os.path.exists(blob_s):
        local_data = set(re.findall(
            r'^(lbl_[0-9A-Fa-f]+):',
            open(blob_s, encoding='utf-8', errors='replace').read(), re.M))
    fns -= local_fn
    datas -= local_data | local_fn

    # minus everything the headers declare
    paths = [p for p in (header_path(repo, h) for h in includes) if p]
    dolphin = header_path(repo, 'dolphin.h')
    if dolphin:
        paths.append(dolphin)
    seen = set()
    blob = ''.join(slurp(repo, p, seen) for p in paths)
    blob = re.sub(r'/\*.*?\*/', '', blob, flags=re.S)
    blob = re.sub(r'//[^\n]*', '', blob)
    declared = set(re.findall(r'\b[A-Za-z_][A-Za-z0-9_]*\b', blob))

    miss_fn = sorted(f for f in fns if f not in declared)
    miss_data = sorted(d for d in datas if d not in declared and d not in fns)

    print('# %s: %d headers scanned, %d referenced fns, %d referenced data'
          % (stem, len(paths), len(fns), len(datas)))
    print('# MISSING FNS (%d)' % len(miss_fn))
    for f in miss_fn:
        print('  --extern-fn %s' % f)
    print('# MISSING DATA (%d)' % len(miss_data))
    for d in miss_data:
        print('  --extern-data %s' % d)


if __name__ == '__main__':
    main()
