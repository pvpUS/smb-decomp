#!/usr/bin/env python3
"""Does MATCHED code ever emit this prologue shape, and WHERE?  ~20s tree-wide.

Promoted from option's run-39 `scanbad.py` / `scangood.py` pair.  That pair
answered the question that closed an axis and produced the "37 candidates exist
-- read them, do not sweep" recommendation, and the two scripts are the SAME
objdump parser and the SAME prologue-window walk with two different hard-coded
predicates.  The predicate is now an argument.

THE WINDOW (mwcc 1.1 non-leaf frame setup) -- the thing every one of these
questions is really about:

    mflr r0
    <gap1>              instructions between `mflr r0` and `stw r0,4(r1)`
    stw  r0, 4(r1)
    <gap2>              instructions between `stw r0,4(r1)` and `stwu`
    stwu r1, -N(r1)
    <save block>        stw rCS / stmw / stfd
    ...

usage:
  python tools/rel_shapescan.py [--shape NAME | --where EXPR] <object> [...]

    --shape NAME   a named, VALIDATED shape (see --list)
    --where EXPR   a Python expression over the fields below; a function is
                   reported when it evaluates true
    --fields       print the field table and exit
    --list         print the named shapes and their --where equivalents
    --count        totals only, no per-function rows
    --limit N      stop after N reported rows
    --selftest     parser self-test, no objects needed

  <object> may be any ELF objdump can read: `supermonkeyball.elf` for a DOL-wide
  census, a module `.plf`, or a list of `.o` files.

FIELDS available to --where / --shape (all per function):

    name        function symbol
    obj         basename of the containing object
    n           instruction count
    n_gap1      len(gap1)              n_gap2      len(gap2)
    lis_g1      `lis` count in gap1    lis_g2      `lis` count in gap2
    mats_cs     `addi rCS, rLIS, 0` in the head -- a symbol address materialised
                DIRECTLY into a callee-saved register
    mats_tmp    the same into a VOLATILE register, inside gap2
    copies      `mr rCS, rTMP` after the stwu that copies a gap2 materialisation
                into a callee-saved home
    cond        conditional branches in the whole body
    save        'stmw' or 'stw' -- which save form the prologue uses
    scratch     'PARALLEL' (the window's `lis`es target distinct registers),
                'SERIAL' (they reuse one), or 'NONE'

NAMED SHAPES (both are option's run-39 scripts, reproduced exactly -- gated):

    gap2copy    (was scanbad.py)   n_gap2 and mats_tmp and copies
                "an `addi rTMP,rS,0` completing a symbol @l in the pre-stwu
                window whose result is then copied into a callee-saved home by
                `mr rCS,rTMP` after the save block"
    labreak     (was scangood.py)  n_gap2 == 0 and mats_cs >= 2 and cond
                "two symbol addresses materialised DIRECTLY into callee-saved
                homes, gap2 EMPTY, and a conditional branch present" -- the
                exemplars that BREAK the run-39 lab rule
    gap2addi    n_gap2 and mats_tmp
                the gap2copy population before the `mr` requirement

⚠⚠ **PASS UNLINKED OBJECTS (`.o` / `.plf`), NOT `supermonkeyball.elf`, FOR ANY
SHAPE THAT MENTIONS `mats_cs`, `mats_tmp` OR `copies`.**  MEASURED this run:
`--shape gap2copy` and `--shape gap2addi` report **0 on the whole DOL ELF and
55 / 5 on two `.plf`s**, and the zero is STRUCTURAL, not an absence.  A
materialisation is recognised by `addi rD, rS, 0` -- the unrelocated `@l` half.
In `supermonkeyball.elf` the linker has already applied the relocation, so the
same instruction reads `addi r6, r6, 68` and the test can never fire.  option's
own run-39 census was correctly taken over "this tree's objects" (n=1523
prologues) and its numbers stand; its script's docstring nevertheless said
"DOL-wide", and pointing that script at the DOL returns a silent, confident 0.
**This tool now detects the condition and says so instead** (see the RELOCATION
WARNING in the output).  Shapes over `n_gap1/n_gap2/lis_*/cond/save/scratch`
only are safe on a linked ELF.

⚠ A COUNT IS NOT AN ANSWER.  This tool tells you a shape EXISTS in matched code
and names the sites; it does not tell you the shape is reachable from YOUR
source.  option's own use of it ended in "37 candidates exist -- READ THEM, do
not sweep", and that was the right call.

EXIT CODES:  0 the scan ran   2 bad arguments, or objdump failed
"""
import os
import re
import subprocess
import sys

OBJDUMP = os.environ.get(
    "SHAPESCAN_OBJDUMP",
    r"C:/devkitPro/devkitPPC/bin/powerpc-eabi-objdump.exe")

CS = set("r%d" % i for i in range(13, 32))          # callee-saved, as option's
BR = ("beq", "bne", "blt", "bgt", "ble", "bge", "bdnz", "bdz", "bnl", "bng",
      "bso", "bns")

FUNC = re.compile(r"^([0-9a-f]{8}) <(.+)>:$")
INSN = re.compile(r"^\s*([0-9a-f]+):\s+([0-9a-f]{2} ){4}\s*(\S+)\s*(.*)$")

SHAPES = {
    "gap2copy": ("n_gap2 and mats_tmp and copies",
                 "was scanbad.py -- symbol @l completed in gap2, then copied "
                 "to a callee-saved home"),
    "labreak":  ("n_gap2 == 0 and mats_cs >= 2 and cond",
                 "was scangood.py -- the exemplars that BREAK the run-39 lab "
                 "rule"),
    "gap2addi": ("n_gap2 and mats_tmp",
                 "the gap2copy population before the `mr` requirement"),
}


def die(msg):
    print(msg, file=sys.stderr)
    raise SystemExit(2)


def dis(path):
    """-> {function: [(mnemonic, operands)]}.  option's parser, unchanged."""
    r = subprocess.run([OBJDUMP, "-d", path], capture_output=True, text=True)
    if r.returncode != 0 and not r.stdout:
        die("objdump failed on %s:\n%s" % (path, r.stderr.strip()))
    funcs, cur = {}, None
    for line in r.stdout.splitlines():
        m = FUNC.match(line)
        if m:
            cur = m.group(2)
            funcs[cur] = []
            continue
        m = INSN.match(line)
        if m and cur:
            funcs[cur].append((m.group(3), m.group(4).split(";")[0].strip()))
    return funcs


def window(ins):
    """-> (i_stw, i_stwu) or None.  option's walk, unchanged: the `stwu` search
    is capped at the first EIGHT instructions and breaks on the first `stwu`."""
    if not ins or ins[0][0] != "mflr":
        return None
    i_stw = i_stwu = None
    for i, (mn, op) in enumerate(ins[:8]):
        if mn == "stw" and op.startswith("r0,4(r1)"):
            i_stw = i
        if mn == "stwu":
            i_stwu = i
            break
    if i_stw is None or i_stwu is None:
        return None
    return i_stw, i_stwu


def fields(obj, name, ins):
    """-> dict of the documented fields, or None if there is no full window."""
    w = window(ins)
    if w is None:
        return None
    i_stw, i_stwu = w
    gap1 = ins[1:i_stw]
    gap2 = ins[i_stw + 1:i_stwu]
    head = ins[:i_stwu + 16]

    # `lis` destinations.  option's scanbad reads them from ins[:i_stwu] and its
    # scangood from `head`; the two agree because a `lis` after the stwu cannot
    # be the source of an @l completed BEFORE it.  Kept as scangood's (wider).
    lis_pre = set(op.split(",")[0] for mn, op in ins[:i_stwu] if mn == "lis")
    lis_head = set(op.split(",")[0] for mn, op in head if mn == "lis")

    def is_mat(op, dstset, srcset):
        f = [x.strip() for x in op.split(",")]
        return (len(f) == 3 and f[2] == "0" and f[1] in srcset
                and (dstset is None or f[0] in dstset))

    mats_cs = [op for mn, op in head
               if mn == "addi" and is_mat(op, CS, lis_head)]
    # EXACTLY option's scanbad test -- `len(f)==3 and f[2]=='0' and f[1] in
    # lis_regs`, with NO filter on the destination.  An earlier draft of this
    # file also required the destination NOT to be callee-saved, which reads
    # plausible ("rTMP") and is MEASURED behaviour-neutral here (0 instances in
    # gap2 across both .plf files) -- but it is not in the tool being
    # reproduced, and a silent extra filter that agrees today is a divergence
    # waiting to happen.  Removed.
    mats_tmp = [op for mn, op in gap2
                if mn == "addi" and is_mat(op, None, lis_pre)]
    # ...and the copy into a callee-saved home, within 16 of the stwu
    copies = []
    for op in mats_tmp:
        tmp = op.split(",")[0].strip()
        for j in range(i_stwu + 1, min(i_stwu + 16, len(ins))):
            m2, o2 = ins[j]
            if m2 == "mr":
                d, s = [x.strip() for x in o2.split(",")[:2]]
                if d in CS and s == tmp:
                    copies.append((op, o2))
    l1 = [op.split(",")[0] for mn, op in gap1 if mn == "lis"]
    l2 = [op.split(",")[0] for mn, op in gap2 if mn == "lis"]
    regs = l1 + l2
    return {
        "name": name, "obj": obj, "n": len(ins),
        "n_gap1": len(gap1), "n_gap2": len(gap2),
        "lis_g1": len(l1), "lis_g2": len(l2),
        "mats_cs": len(mats_cs), "mats_tmp": len(mats_tmp),
        "copies": len(copies), "cond": sum(1 for mn, _ in ins if mn in BR),
        "save": "stmw" if any(mn == "stmw" for mn, _ in head[:i_stwu + 8])
                else "stw",
        "scratch": "PARALLEL" if len(set(regs)) > 1 else
                   ("SERIAL" if regs else "NONE"),
        "_mats_tmp": mats_tmp, "_mats_cs": mats_cs, "_copies": copies,
    }


def selftest():
    def I(t):
        mn, _, op = t.partition(" ")
        return (mn, op.strip())

    # option's scanbad shape, hand-built from its own description.
    bad = [I(x) for x in [
        "mflr r0", "lis r3,0x8000", "stw r0,4(r1)", "addi r4,r3,0",
        "stwu r1,-32(r1)", "stw r31,28(r1)", "mr r31,r4", "blr"]]
    f = fields("t", "bad", bad)
    assert f["n_gap2"] == 1 and f["mats_tmp"] == 1 and f["copies"] == 1, f
    assert f["mats_cs"] == 0, f
    assert ev(SHAPES["gap2copy"][0], f) and not ev(SHAPES["labreak"][0], f)

    # option's scangood shape: gap2 EMPTY, two @l straight into callee-saved.
    good = [I(x) for x in [
        "mflr r0", "lis r3,0x8000", "lis r4,0x8001", "stw r0,4(r1)",
        "stwu r1,-32(r1)", "stmw r29,20(r1)", "addi r30,r3,0",
        "addi r31,r4,0", "cmpwi r30,0", "beq 0x40", "blr"]]
    f = fields("t", "good", good)
    assert f["n_gap2"] == 0, f
    assert f["mats_cs"] == 2, f["_mats_cs"]
    assert f["cond"] == 1 and f["save"] == "stmw", f
    assert ev(SHAPES["labreak"][0], f) and not ev(SHAPES["gap2copy"][0], f)

    # a function with NO window is skipped, not crashed on, and a leaf too.
    assert fields("t", "leaf", [I("li r3,0"), I("blr")]) is None
    assert fields("t", "empty", []) is None
    assert fields("t", "nostwu", [I("mflr r0"), I("stw r0,4(r1)"), I("blr")]) is None

    # the `stwu` search really is capped at 8 -- a deep stwu yields NO window,
    # which is option's behaviour and must not silently change.
    deep = [I("mflr r0"), I("stw r0,4(r1)")] + [I("nop")] * 8 + [I("stwu r1,-16(r1)")]
    assert fields("t", "deep", deep) is None

    # a malformed --where is a hard error, not a silent zero.
    try:
        ev("n_gap2 and (", {"n_gap2": 1})
        raise AssertionError("malformed --where accepted")
    except SystemExit:
        pass
    # ...and an unknown name in --where is an error too, not False.
    try:
        ev("no_such_field > 0", {"n_gap2": 1})
        raise AssertionError("unknown field accepted")
    except SystemExit:
        pass
    # vacuity: a valid expression still evaluates after both rejections.
    assert ev("n_gap2 == 1", {"n_gap2": 1}) is True

    # the objdump line parser: a real objdump body line, and three near-misses.
    m = INSN.match("    8005f520:\t7c 08 02 a6 \tmflr    r0")
    assert m and m.group(3) == "mflr" and m.group(4).strip() == "r0", m
    assert FUNC.match("8005f520 <lbl_8005F520>:").group(2) == "lbl_8005F520"
    assert not INSN.match("8005f520 <lbl_8005F520>:")
    assert not FUNC.match("    8005f520:\t7c 08 02 a6 \tmflr    r0")
    print("rel_shapescan selftest: 6 groups OK")


def ev(expr, f):
    try:
        return bool(eval(expr, {"__builtins__": {}}, f))
    except Exception as e:
        die("--where %r: %s: %s" % (expr, type(e).__name__, e))


def main():
    argv = sys.argv[1:]
    if "--selftest" in argv:
        selftest()
        return 0
    if "--fields" in argv or "--list" in argv:
        if "--list" in argv:
            print("named shapes:")
            for k, (e, d) in sorted(SHAPES.items()):
                print("  %-10s --where %-42s %s" % (k, repr(e), d))
        if "--fields" in argv:
            print(__doc__[__doc__.index("FIELDS available"):
                          __doc__.index("NAMED SHAPES")])
        return 0
    where = None
    count_only = False
    limit = None
    paths = []
    i = 0
    while i < len(argv):
        a = argv[i]
        if a in ("--shape", "--where", "--limit"):
            if i + 1 >= len(argv):
                die("%s needs a value" % a)
            v = argv[i + 1]
            if a == "--shape":
                if v not in SHAPES:
                    die("unknown --shape %r.  Known: %s  (or use --where)"
                        % (v, ", ".join(sorted(SHAPES))))
                where = SHAPES[v][0]
            elif a == "--where":
                where = v
            else:
                limit = int(v)
            i += 2
        elif a == "--count":
            count_only = True
            i += 1
        elif a.startswith("-"):
            die("rel_shapescan: unknown option %r" % a)
        else:
            paths.append(a)
            i += 1
    if not paths:
        die(__doc__.strip().splitlines()[0] + "\n\nusage: python "
            "tools/rel_shapescan.py [--shape NAME | --where EXPR] <object>...\n"
            "       --list   the named shapes\n"
            "       --fields the field table")
    if where is None:
        die("no shape given -- pass --shape NAME (see --list) or --where EXPR.\n"
            "Refusing to default: a census with no predicate is a count of\n"
            "every function with a frame, which is not a question anybody asked.")
    missing = [p for p in paths if not os.path.exists(p)]
    if missing:
        die("no such object: %s" % ", ".join(missing))

    tot = win = hit = 0
    n_lis = n_lis0 = 0        # `lis` total, and `lis rD,0` (i.e. unrelocated)
    rows = []
    for p in paths:
        base = os.path.basename(p)
        for name, ins in dis(p).items():
            tot += 1
            for mn, op in ins:
                if mn == "lis":
                    n_lis += 1
                    f3 = op.split(",")
                    if len(f3) == 2 and f3[1].strip() == "0":
                        n_lis0 += 1
            f = fields(base, name, ins)
            if f is None:
                continue
            win += 1
            if ev(where, f):
                hit += 1
                if limit is None or len(rows) < limit:
                    rows.append(f)
    print("--where %s" % where)
    print("functions disassembled                          : %d" % tot)
    print("  of those, with a full mflr/stw/stwu window    : %d" % win)
    print("  MATCHING THE SHAPE                            : %d" % hit)

    # RELOCATION WARNING -- see the header.  `addi rD,rS,0` is the UNRELOCATED
    # `@l` half; if an object has thousands of `addi` and not one with a zero
    # immediate, its relocations are applied and every mats_*/copies test in
    # this tool is structurally incapable of firing.  Printed BEFORE anyone can
    # read the 0 as an answer.
    if n_lis0 == 0 and n_lis > 0 and re.search(
            r"\bmats_cs\b|\bmats_tmp\b|\bcopies\b", where):
        print()
        print("!! RELOCATION WARNING -- THIS COUNT IS BIASED LOW, BADLY.")
        print("   %d `lis` instructions here and NOT ONE is `lis rD,0`, so the"
              % n_lis)
        print("   relocations are already APPLIED: this is a LINKED image.")
        print("   A symbol materialisation is recognised as `addi rD,rS,0` --")
        print("   the UNRELOCATED `@l` half.  After linking, the only ones that")
        print("   still read `,0` are the symbols whose low half happens to be")
        print("   zero, so `mats_cs`/`mats_tmp`/`copies` under-count SEVERELY.")
        print("   MEASURED this run, fraction of windowed functions with")
        print("   mats_cs > 0:  supermonkeyball.elf 182/2230 = 8.2%, against")
        print("   mkbe.option.plf 39/69 = 57% and mkbe.rel_mini_race.plf")
        print("   115/191 = 60%.  mats_tmp > 0: 0/2230 linked, 19-22% unlinked.")
        print("   ** A ZERO HERE IS NOT EVIDENCE OF ABSENCE. **  Re-run against")
        print("   `.o` or `.plf` objects to get the real population.")
    if not count_only and rows:
        print()
        print("%-22s %-38s %-4s %4s %4s %4s %4s %4s"
              % ("object", "function", "save", "n", "g1", "g2", "mCS", "cond"))
        for f in rows:
            print("%-22s %-38s %-4s %4d %4d %4d %4d %4d"
                  % (f["obj"][:22], f["name"][:38], f["save"], f["n"],
                     f["n_gap1"], f["n_gap2"], f["mats_cs"], f["cond"]))
        if limit is not None and hit > len(rows):
            print("... %d more (--limit %d)" % (hit - len(rows), limit))
    return 0


if __name__ == "__main__":
    sys.exit(main())
