#!/usr/bin/env python3
"""rel_dirsweep.py -- the DIRECTIVE SWEEP, owner-side and draft-side in one.

Merges three run-40 module scripts whose populations are DISJOINT:
    option/subaudit.py        OWNER-SIDE  -- directives living in banked src/
    mini_race/anchoraudit40.py  DRAFT-SIDE -- per-owner anchor resolution
    mini_fight/anchorsweep40.py DRAFT-SIDE -- //@SUB and //@PROTO, owner kind

  --tree T      the tree to resolve OWNERS in (required; there is no default,
                for the reason rel_tuprobe has no --tree: four tools in this
                project shipped one that defaulted to the wrong tree and
                silently scored it)
  --drafts D    a directory of stored drafts to sweep (repeatable).  Omit for
                an OWNER-SIDE-ONLY sweep.
  --module M    restrict to one module
  --show N      list at most N rows per class (default 20; 0 for none)

=========================================================================
WHAT THIS TOOL DOES **NOT** SEE.  READ THIS BEFORE QUOTING A CLEAN RESULT.
=========================================================================
A directive sweep can only see directives.  It is STRUCTURALLY BLIND to:

  MODE 3  THE DECLARATOR CONTRADICTION -- the owner declares a signature that
          contradicts golden's own bytes.  No directive is involved, so
          nothing here fires.  `rel_argscan` is the instrument for that, and
          run 41 measured it wrong in THREE directions at once (false
          positives from non-owner text, a false negative on
          `mini_fight lbl_00016CC8`, and blindness to a wrong-WIDTH parameter
          such as `mini_race F3D4`'s `int idx` where golden says `s16`).
  MODE 4  THE MISSING DIRECTIVE -- the draft needed one and nobody wrote it.
          An absent line cannot be swept for.

**A clean run of this tool means "no directive is stale". It does NOT mean
"the drafts are fine".**  Run 40's compile-status column was falsified by
three modules precisely because stripping directives reaches only two of the
four mechanisms that make a draft fail.

=========================================================================
THREE RULES THIS TOOL ENCODES, EACH MEASURED BY A MODULE THAT GOT IT WRONG
=========================================================================
1. **PER-OWNER RESOLUTION.**  The naive whole-tree form ("does the anchor text
   appear ANYWHERE in src/*.c") is 0-for-3 project-wide: the old
   `void X(void);` boilerplate SURVIVES IN NON-OWNER SPLIT FILES, so a
   whole-tree grep finds every anchor and reports zero stale ones.  Run 41 saw
   the same failure a third time, inverted -- a LEAD list quoted the `(void)`
   text of non-owner split files while citing the OWNER files' line numbers.
   Owners are resolved HERE from the tree's own definitions.

2. **THE SUBSTITUTION TARGET IS THE ROW'S OWNER, NOT THE SYMBOL'S.**
   MEASURED by mini_bowling with a build, after its first sweep flagged 181
   stale anchors and the flagged draft built exactly to its recorded figure:
   *a `//@PROTO` naming symbol X, in a draft for row Y, substitutes in Y's
   owner -- not X's.  There are three candidate owners and only one is right.*

3. **THE `//@PROTO` ANCHOR IS SYNTHESISED, NOT PARSED -- AND THAT IS THE
   CONTRACT.**  `rel_tuprobe` builds the anchor as `void <name>(void);` FROM
   THE FUNCTION NAME (:737-746); the directive supplies the REPLACEMENT and
   the tool derives the TARGET.  Sweeping owners for the directive's own text
   therefore finds 0 BY CONSTRUCTION.  Three modules wrote sweeps against the
   wrong assumption before this was written down.

=========================================================================
⚠⚠ IF YOU RE-IMPLEMENT THIS AS A SHELL SWEEP, READ THIS FIRST
=========================================================================
MEASURED run 41, n=9 argument forms: MSYS2/Git-Bash COLLAPSES A LEADING `//`
TO `/` when passing an argument to a NATIVE WINDOWS binary, and it does so
THROUGH a leading regex anchor.  `rg "^//@SUB "` searches for `^/@SUB ` and
returns ZERO MATCHES WITH EXIT 0.  GNU grep/sed are MSYS2 binaries and are
exempt, which is why this has never been caught.
    BROKEN : rg -l "^//@(SUB|PROTO) "        -> 0 files
    CORRECT: rg -l "^[/][/]@(SUB|PROTO) "    -> 563 files (grep agrees)
A character class is not mangled.  This tool matches in Python and is immune.

EXIT CODES ARE A CONTRACT:
  0  the sweep ran and resolved at least one owner
  1  STALE directives were found
  2  ERROR -- bad usage, or A SWEEP THAT RESOLVED ZERO OWNERS.  ** A sweep
     that resolves zero owners is BROKEN, NOT CLEAN. **  One module's
     tree-wide sweep reported 747 problem rows by reading another module's
     src copies out of its own scratch dir and running finditer without re.M;
     the failure mode is silent and looks like a pass.
"""
import glob
import os
import re
import sys

MODULES = {
    'mini_bowling': 'mini_bowling', 'mini_race': 'mini_race',
    'mini_fight': 'mini_fight', 'mini_pilot': 'mini_pilot',
    'mini_golf': 'mini_golf', 'mini_billiards': 'mini_billiards',
    'sel_ngc': 'sel_ngc_rel', 'option': 'option', 'test_mode': 'test_mode',
}

# An asm stub in an owner: `[static] asm <type> lbl_XXXXXXXX(<args>)` with the
# `{` ON THE NEXT LINE.  A same-line-`{` regex returns 0 of 159 -- another
# sweep that looks clean because it is broken.
ASM_DEF = re.compile(
    r'^[ \t]*(?:static[ \t]+)?asm[ \t]+\w[\w \t\*]*?\b(lbl_[0-9A-Fa-f]{8})'
    r'[ \t]*\([^)]*\)[ \t]*\r?\n?[ \t]*\{', re.M)
C_DEF = re.compile(
    r'^[A-Za-z_][\w \t\*]*?\b(lbl_[0-9A-Fa-f]{8})[ \t]*\([^;\n]*\)[ \t]*'
    r'\r?\n?[ \t]*\{', re.M)
LABEL = re.compile(r'\blbl_[0-9A-Fa-f]{8}\b')


def die(msg):
    sys.stderr.write('rel_dirsweep: %s\n' % msg)
    sys.exit(2)


def unescape(s):
    """rel_tuprobe's own _unescape -- the sweep must see the text the TOOL
    sees, not the text on the line."""
    out, i = [], 0
    while i < len(s):
        c = s[i]
        if c == '\\' and i + 1 < len(s):
            n = s[i + 1]
            out.append({'n': '\n', 't': '\t', 'r': '\r', '\\': '\\',
                        '|': '|'}.get(n, '\\' + n))
            i += 2
        else:
            out.append(c)
            i += 1
    return ''.join(out)


def rd(p):
    return open(p, 'r', encoding='utf-8', errors='replace').read()


def build_owners(tree, only=None):
    """(label -> owner path, label -> 'asm'|'C') from the TREE'S OWN BYTES."""
    owner, kind = {}, {}
    for mod, stem in MODULES.items():
        if only and mod != only:
            continue
        for p in sorted(glob.glob(os.path.join(tree, 'src', stem + '*.c'))):
            t = rd(p)
            for m in ASM_DEF.finditer(t):
                seg = t[m.end():m.end() + 400]
                if '#include' in seg and 'asm/' in seg:
                    owner[(mod, m.group(1))] = p
                    kind[(mod, m.group(1))] = 'asm'
            for m in C_DEF.finditer(t):
                k = (mod, m.group(1))
                if k not in owner:
                    owner[k], kind[k] = p, 'C'
    return owner, kind


def parse_directives(text):
    """-> [(lineno, raw, tok, old, new)].  `new` is '' for //@PROTO."""
    out = []
    for i, ln in enumerate(text.split('\n'), 1):
        ln = ln.rstrip('\r')
        if ln.startswith('//@SUB'):
            arg = ln[7:] if ln.startswith('//@SUB ') else ln[6:]
            if '|||' in arg:
                o, n = arg.split('|||', 1)
                out.append((i, ln, '//@SUB', unescape(o), unescape(n)))
            else:
                # THE MALFORMED SINGLE-PIPE FORM.  rel_tuprobe rejects it with
                # rc=2 BEFORE it ever looks for the anchor, so repairing the
                # pipes alone only converts MALFORMED into ANCHOR MISSING --
                # option measured 14 lines where the two modes were STACKED.
                out.append((i, ln, '//@SUB-MALFORMED', arg, ''))
        elif ln.startswith('//@PROTO '):
            out.append((i, ln, '//@PROTO', ln[len('//@PROTO '):].strip(), ''))
    return out


def classify(tok, old, new, owner_text):
    if tok == '//@SUB-MALFORMED':
        return 'MALFORMED'
    if tok == '//@SUB':
        if old in owner_text:
            return 'LIVE'
        if new and new in owner_text:
            return 'SATISFIED'
        return 'STALE'
    m = re.search(r'\b(\w+)\s*\(', old)
    if not m:
        return 'MALFORMED'
    anchor = 'void %s(void);' % m.group(1)     # SYNTHESISED -- see header
    if anchor in owner_text:
        return 'LIVE'
    if old in owner_text:
        return 'SATISFIED'
    return 'STALE'


def main(argv):
    tree = only = None
    drafts, show = [], 20
    i = 0
    while i < len(argv):
        a = argv[i]
        if a == '--tree' and i + 1 < len(argv):
            tree = argv[i + 1]; i += 2
        elif a == '--drafts' and i + 1 < len(argv):
            drafts.append(argv[i + 1]); i += 2
        elif a == '--module' and i + 1 < len(argv):
            only = argv[i + 1]; i += 2
        elif a == '--show' and i + 1 < len(argv):
            show = int(argv[i + 1]); i += 2
        else:
            die('unknown argument %r\n%s' % (a, __doc__.split('\n')[0]))
    if not tree:
        die('--tree is REQUIRED and has no default')
    if not os.path.isdir(os.path.join(tree, 'src')):
        die('no src/ under %r' % tree)
    if only and only not in MODULES:
        die('unknown module %r' % only)

    owner, kind = build_owners(tree, only)
    print('rel_dirsweep: tree %s' % tree)
    print('  owners resolved from the tree\'s own definitions: %d labels '
          '(%d asm, %d C)'
          % (len(owner), sum(1 for v in kind.values() if v == 'asm'),
             sum(1 for v in kind.values() if v == 'C')))

    # ** THE NON-NEGOTIABLE ARM. **
    if not owner:
        die('THE SWEEP RESOLVED ZERO OWNERS.\n'
            'A sweep that resolves zero owners is BROKEN, NOT CLEAN.  Check '
            '--tree points at a tree whose src/ holds the module sources, '
            'and that --module is spelled as one of: %s'
            % ', '.join(sorted(MODULES)))

    otext = {}
    rows = []

    # ---- OWNER SIDE: directives living in the banked sources themselves ----
    for mod, stem in MODULES.items():
        if only and mod != only:
            continue
        for p in sorted(glob.glob(os.path.join(tree, 'src', stem + '*.c'))):
            t = otext.setdefault(p, rd(p))
            ds = parse_directives(t)
            if not ds:
                continue
            for (lno, raw, tok, old, new) in ds:
                # the anchor must be sought in the REST of the file, never in
                # the directive line itself
                rest = '\n'.join(l for j, l in enumerate(t.split('\n'), 1)
                                 if j != lno)
                rows.append(('owner', mod, os.path.basename(p), lno,
                             classify(tok, old, new, rest), tok, raw))

    # ---- DRAFT SIDE --------------------------------------------------------
    nscan = 0
    for d in drafts:
        for dp, dns, fns in os.walk(d):
            dns[:] = [x for x in dns if x not in ('.git', '__pycache__')]
            for fn in fns:
                p = os.path.join(dp, fn)
                try:
                    if os.path.getsize(p) > 4_000_000:
                        continue
                    t = rd(p)
                except OSError:
                    continue
                if '//@SUB' not in t and '//@PROTO ' not in t:
                    continue
                ds = parse_directives(t)
                if not ds:
                    continue
                # ** THE BASENAME BEATS THE PATH, AND THAT IS NOT COSMETIC. **
                # Every module's scratch dir contains COPIES OF OTHER
                # MODULES' sources -- `_scratch_mini_race/run10/snap0/src/
                # option_22.c` is a real file.  Guessing the module from the
                # PATH attributes it to mini_race, and then rule 2 cheerfully
                # resolves it against whichever mini_race row it happens to
                # name first.  MEASURED run 41 on the first smoke test: 277 of
                # 289 "problem" rows for mini_race were option files read out
                # of mini_race's scratch dir.  This is the same failure that
                # produced one module's fictional 747-row sweep.
                base = os.path.basename(p).lower()
                mod = None
                for mm, stem in MODULES.items():
                    if base.startswith(stem.lower()):
                        mod = mm
                        break
                if mod is None:
                    low = p.replace('\\', '/').lower()
                    for mm in sorted(MODULES, key=len, reverse=True):
                        if mm in low:
                            mod = mm
                            break
                if not mod or (only and mod != only):
                    continue
                # RULE 2: the row this DRAFT is for decides the owner.
                row = None
                for L in dict.fromkeys(LABEL.findall(t)):
                    if (mod, L) in owner:
                        row = L
                        break
                if row is None:
                    continue
                op = owner[(mod, row)]
                ot = otext.setdefault(op, rd(op))
                nscan += 1
                for (lno, raw, tok, old, new) in ds:
                    rows.append(('draft', mod, os.path.relpath(p, d), lno,
                                 classify(tok, old, new, ot), tok, raw))

    if drafts:
        print('  draft files attributed to a resolved row: %d' % nscan)

    from collections import Counter
    print()
    for side in ('owner', 'draft'):
        sub = [r for r in rows if r[0] == side]
        if not sub and side == 'draft' and not drafts:
            continue
        c = Counter(r[4] for r in sub)
        print('%s-side: %d directive(s)   %s' % (
            side.upper(), len(sub),
            '  '.join('%s=%d' % (k, c[k]) for k in
                      ('LIVE', 'SATISFIED', 'STALE', 'MALFORMED') if c[k])
            or '(none)'))
        bad = [r for r in sub if r[4] in ('STALE', 'MALFORMED')]
        for r in bad[:show]:
            print('    %-14s %-30s :%-5d %-9s %s'
                  % (r[1], r[2][:30], r[3], r[4], r[6].strip()[:66]))
        if len(bad) > show:
            print('    ... %d MORE not shown (%d total).  Use --show %d.'
                  % (len(bad) - show, len(bad), len(bad)))

    print()
    print('SCOPE NOT COVERED: the declarator contradiction (mode 3) and the '
          'missing directive (mode 4).  See the header.  A clean run here '
          'does NOT mean the drafts are fine.')
    return 1 if any(r[4] in ('STALE', 'MALFORMED') for r in rows) else 0


if __name__ == '__main__':
    sys.exit(main(sys.argv[1:]))
