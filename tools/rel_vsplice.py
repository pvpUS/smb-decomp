#!/usr/bin/env python3
"""Variant scorer: splice ONE function body into its owner, build, score, restore.

Promoted from `_scratch_mini_race/run19/vs.py` -- **the tool that drove all 135
variants of run 19's +1,145 / +11, the largest single-module result in the
project.** Three hardcoded constants became options; nothing else changed.

usage: python tools/rel_vsplice.py <label> <owner-src-relpath> <variant-dir>
                                   [--module M] [--tree T]

Why this rather than `rel_gfscan`: that one needs WHOLE-FILE `.c` variants, so
a module storing function-body fragments (mini_golf, mini_bowling) cannot use
it, and a whole-file install into a big mixed TU is the rollback hazard the
brief warns about. This splices exactly one definition and restores the owner in
a `finally`, so it cannot lose a banked conversion.

It is also CRLF-correct by construction, which matters more than it sounds: a
silent LF/CRLF no-op cost a module a variant in run 18 AND in run 19, and
mini_race read a stale score as a real result because of it.

Each variant file in <variant-dir> is the COMPLETE text of one function
definition (starting with its first declarator line, ending with the closing
brace at column 0).  The owner file's existing definition of that function is
located by scanning for a line that starts the definition and running to the
first line that is exactly "}".  The variant text is spliced in with the
owner's own line endings, the module is built, the label is scored, and the
owner is restored in a finally.

Line endings: the owner tree is CRLF.  Variants may be written LF; they are
normalised to the owner's ending before splicing.  (Run 18/19 both lost a
variant to a silent LF/CRLF no-op.)
"""
import os
import re
import subprocess
import sys

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TREE = None                 # set from --tree, or the cwd if it looks like a tree
MOD = None                  # set from --module, or inferred from TREE's name


def find_def(text, label):
    """Return (start, end) char offsets of the definition of `label`."""
    lines = text.split("\n")
    starts = []
    for i, ln in enumerate(lines):
        if re.search(r"\b" + re.escape(label) + r"\s*\(", ln) and not ln.rstrip(
            "\r"
        ).endswith(";"):
            # a definition line, not a prototype
            starts.append(i)
    if not starts:
        raise SystemExit("no definition line for %s" % label)
    i0 = starts[-1]
    # walk forward to the closing brace at column 0
    for j in range(i0, len(lines)):
        if lines[j].rstrip("\r") == "}":
            break
    else:
        raise SystemExit("no closing brace for %s" % label)
    pre = "\n".join(lines[:i0]) + "\n"
    body = "\n".join(lines[i0:j + 1])
    post = "\n" + "\n".join(lines[j + 1:])
    assert pre + body + post == text
    return pre, body, post


def score(label, owner):
    cmd = [
        sys.executable,
        os.path.join(REPO, "tools", "rel_sweep.py"),
        MOD,
        "--file",
        owner,
        "--label",
        label,
        "--tree",
        TREE,
    ]
    p = subprocess.run(cmd, cwd=REPO, capture_output=True, text=True)
    out = p.stdout + p.stderr
    m = re.search(r"RAW\s+(\d+)\s+ALIGNED\s+(\d+)\s+\((\d+) edit regions?\)"
                  r"(?:\s+span (\S+) of (\d+))?", out)
    if m:
        return "RAW %s ALIGNED %s in %s regions span %s" % (
            m.group(1), m.group(2), m.group(3), m.group(4) or "-"), out

    # RUN-32 FIX -- this was a FICTIONAL-MATCH MODE, found by mini_billiards.
    #
    # `rel_sweep`'s own trap-5 guard TEXT contains the word MATCH:
    #   "... is an ASM STUB here and any MATCH is trivial."
    #   "... that reports MATCH (trap 5)."
    # so the old `if "MATCH" in out` scored an UNBUILT label as a perfect
    # match.  Both of mini_billiards' stored `pf`-form drafts reported a flat
    # MATCH in run 32; one identifier rename exposed `RAW 14 ALIGNED 14 in 6`.
    # Any module feeding `pf`-form drafts to this tool was exposed.
    #
    # Order matters: the guard check MUST come first, because its message is
    # exactly what the naive test matched on.
    stub = re.search(r"(is an ASM STUB here|does not DEFINE|"
                     r"as an `asm` function|trap 5)", out)
    if stub:
        return "FAIL(not-built: %s)" % stub.group(1), out
    # A real verdict from `rel_sweep --file --label` is printed anchored, as
    # "<label>: MATCH" on its own line.  Anchor on that rather than on a
    # substring anywhere in the output.
    if re.search(r"^\s*\S+:\s+MATCH\s*$", out, re.M):
        return "MATCH", out
    if "error" in out.lower() or "Error" in out:
        return "FAIL(compile)", out
    return "?", out


_TOOL = "vsplice"

# --------------------------------------------------------------------------- #
# RUN 40 -- THE DIRECTIVE GAP.  `//@SUB` / `//@PROTO` / `//@DROPRE` are
# implemented in `rel_tuprobe.py` ONLY.  This tool has never implemented them
# and never warned: a directive line is spliced/compiled as a C comment, so the
# owner-level retype it asks for silently does not happen and the figure that
# comes back is a score of a DIFFERENT PROGRAM.
#
# It REFUSES rather than implementing them, deliberately.  Implementing a second
# copy of the directive engine is how two tools drift, and this project has the
# scar: rel_tuprobe's own directive handling took three runs and two escaping
# fixes to settle.  One implementation, one place.
#
# ⚠ SCOPE, STATED SO IT CANNOT BE MISREAD AS MORE: this guard detects `//@`
# MARKER LINES and nothing else.  It makes NO claim about a draft whose own
# signature CONTRADICTS a landed declarator -- MEASURED by test_mode in run 40
# on `lbl_0000F6F0`, where the run-24/26/31 body family carries ZERO `//@`
# lines and still fails, with `identifier redeclared / was declared as
# 'void (struct Ape *, int)' / now declared as 'void (long, long)'` cascading
# to "undefined identifier" at DRAFT line numbers.  That is a fourth failure
# mode, no directive is present, and NO directive fix can reach it.  Do not
# read a clean pass here as "the draft's declarators are healthy".
#
# ⚠⚠ AND IT DOES NOT TELL YOU TO "ADD THE THIRD PIPE".  MEASURED by option in
# run 40, n = 14/14 stale directives across 9 owner files: every one was a
# malformed single-pipe `//@SUB` AND every one also had a DEAD OLD ANCHOR, so
# repairing the separator only converts `MALFORMED DIRECTIVE` into `ANCHOR
# MISSING` -- same rc=2, different message, no draft rescued.  The repair that
# works is to NEUTRALISE the line (the owner already carries the declarator the
# directive was asking for).
_DIRECTIVES = ('//@SUB', '//@PROTO', '//@DROPRE', '//@SUBST', '//@DROP')


def _check_directives(paths):
    """Refuse any input file carrying a directive this tool cannot apply."""
    hits = []
    for p in paths:
        try:
            fh = open(p, encoding='utf-8', errors='replace')
        except OSError:
            continue
        with fh:
            for i, line in enumerate(fh, 1):
                s = line.strip()
                for d in _DIRECTIVES:
                    if s.startswith(d):
                        hits.append((p, i, s[:96]))
                        break
    if not hits:
        return
    sys.stderr.write(
        'rel_%s: %d DIRECTIVE LINE(S) THIS TOOL CANNOT APPLY.\n' % (_TOOL, len(hits)))
    for p, i, s in hits:
        sys.stderr.write('    %s:%d  %s\n' % (p, i, s))
    sys.stderr.write(
        '\n`//@SUB` / `//@PROTO` / `//@DROPRE` are implemented in\n'
        'tools/rel_tuprobe.py and NOWHERE ELSE.  Passed through here they are\n'
        'C comments: they do nothing, and the score you would get back is a\n'
        'score of a DIFFERENT PROGRAM than the draft describes.  Refusing\n'
        'instead of reporting that number.\n\n'
        'Do ONE of:\n'
        '  * score it with rel_tuprobe.py, which applies the directives; or\n'
        '  * NEUTRALISE the line and re-run here -- if the owner already\n'
        '    carries the declarator the directive asks for, the directive is\n'
        '    stale and deleting it is the whole fix.\n'
        '⚠ DO NOT "repair" a single-pipe `//@SUB` to three pipes and retry.\n'
        '  MEASURED, option run 40, n=14/14: all fourteen stale directives were\n'
        '  single-pipe AND had a dead old anchor, so fixing the separator only\n'
        '  turns MALFORMED DIRECTIVE into ANCHOR MISSING -- same rc=2, no draft\n'
        '  rescued.\n')
    raise SystemExit(2)


MODULES = ("mini_bowling", "mini_race", "mini_fight", "mini_pilot",
           "mini_golf", "mini_billiards", "sel_ngc", "option", "test_mode")


def main():
    global TREE, MOD
    argv = sys.argv[1:]
    for opt in ("--tree", "--module"):
        if opt in argv:
            i = argv.index(opt)
            if i + 1 >= len(argv):
                sys.exit("%s needs a value" % opt)
            if opt == "--tree":
                TREE = argv[i + 1]
            else:
                MOD = argv[i + 1]
            del argv[i:i + 2]
    if len(argv) < 3:
        sys.exit(__doc__.strip().splitlines()[0] +
                 "\nusage: rel_vsplice.py <label> <owner-src-relpath> "
                 "<variant-dir> [--module M] [--tree T]")
    label, owner, vdir = argv[0], argv[1], argv[2]

    # RUN 40 -- refuse a directive-bearing variant BEFORE the owner is read.
    # An earlier draft put this check after `find_def()`, so a variant carrying
    # `//@SUB` was only refused once the owner had already been parsed -- and
    # never at all if the owner parse failed first.  Bad input is rejected
    # before anything is opened for writing.
    import glob as _glob
    if os.path.isdir(vdir):
        _check_directives(sorted(
            _glob.glob(os.path.join(vdir, '*.txt')) +
            _glob.glob(os.path.join(vdir, '*.c')) +
            _glob.glob(os.path.join(vdir, '*.frag'))))

    if TREE is None:
        TREE = os.getcwd()
    if not os.path.isdir(os.path.join(TREE, "src")):
        sys.exit("no src/ under %r -- pass --tree" % TREE)
    if MOD is None:
        # `C:/tmp/smbm/mini_race` -> mini_race. Refuse to guess wrongly: an
        # unrecognised name is a hard error, not a silent build of the wrong
        # module. (Four tools have shipped a --tree defect of exactly that
        # shape; see HANDOFF's STANDING RULES.)
        MOD = os.path.basename(os.path.normpath(TREE))
    if MOD not in MODULES:
        sys.exit("module %r unrecognised -- pass --module (one of: %s)"
                 % (MOD, ", ".join(MODULES)))

    path = os.path.join(TREE, owner.replace("/", os.sep))
    orig = open(path, newline="").read()
    pre, body, post = find_def(orig, label)
    crlf = "\r\n" in orig
    # Accept .c as well as .txt.  Until run 20 this filter was .txt-only while
    # the usage text promised only "the complete text of one function
    # definition", so a directory of .c fragments scored NOTHING -- a bare
    # "=== ranked ===" and exit 0, no diagnostic.  mini_pilot lost every
    # real-link figure of run 20 to it and the orchestrator hit it again
    # recovering test_mode.  Zero candidates is now a hard error, not silence.
    names = [n for n in sorted(os.listdir(vdir))
             if n.endswith((".txt", ".c", ".frag"))]
    if not names:
        sys.exit("no variant files in %s -- expected *.txt, *.c or *.frag "
                 "(found %d other file(s))" % (vdir, len(os.listdir(vdir))))
    results = []
    try:
        for name in names:
            v = open(os.path.join(vdir, name), newline="").read()
            v = v.replace("\r\n", "\n")
            if crlf:
                v = v.replace("\n", "\r\n")
            if not v.endswith("\r\n" if crlf else "\n"):
                v += "\r\n" if crlf else "\n"
            v = v.rstrip("\r\n") + ("\r" if crlf else "")
            open(path, "w", newline="").write(pre + v + post)
            s, out = score(label, owner)
            results.append((name, s))
            print("%-40s %s" % (name, s), flush=True)
            if s.startswith("FAIL") or s == "?":
                open(os.path.join(vdir, name + ".log"), "w").write(out)
    finally:
        open(path, "w", newline="").write(orig)
    print("\n=== ranked ===")
    def key(r):
        m = re.search(r"ALIGNED (\d+)", r[1])
        return int(m.group(1)) if m else (-1 if r[1] == "MATCH" else 10 ** 6)
    for name, s in sorted(results, key=key):
        print("%-40s %s" % (name, s))


if __name__ == "__main__":
    main()
