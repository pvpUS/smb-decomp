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
    if "MATCH" in out:
        return "MATCH", out
    if "error" in out.lower() or "Error" in out:
        return "FAIL(compile)", out
    return "?", out


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
    results = []
    try:
        for name in sorted(os.listdir(vdir)):
            if not name.endswith(".txt"):
                continue
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
