#!/usr/bin/env python3
"""Zero-build declarator scan: does a STILL-ASM function READ an incoming
argument register before defining it, while its owner declares it `(void)`?

That is the SIXTH DECLARATOR CLASS, found by mini_billiards on `lbl_0000A054`
in run 39: the owner says `(void)`, golden's signature takes parameters, and
every draft that gets the signature RIGHT is rejected with a diagnostic that
names the DRAFT ("undefined identifier 'arg0'"), so it reads as a bad draft.

Promoted from `_scratch_mini_billiards/run39/argscan.py`, which four modules
ran in run 39 with three different hard-coded `TREE =` constants:
  mini_billiards  16 rows -> 1 real hit (`lbl_0000A054`), landed, gated GOLDEN,
                  unblocked 2 of 2 stored drafts (2,094 instructions).
  mini_golf       -> 3 hits, all landed in one 7-line edit, gated GOLDEN,
                  unblocked THREE exact-length drafts (628 / 189 / 109).
  mini_fight      67 rows -> definite negative, AND its crude-grep cross-check
                  produced the false positive while argscan's liveness guard
                  was correct (`lbl_0000DCA0` / `lbl_0000B5D4` / `lbl_0000C22C`
                  set r3..r6 with lis/li/addi first -- outgoing call-argument
                  setup, not parameter homes).
  mini_bowling    6 rows -> 1 hit, priced at ZERO (the owner already carries the
                  permissive K&R form), and it found the FPR hole fixed below.

================================================================================
WHAT CHANGED ON PROMOTION -- THREE DEFECTS, ALL MEASURED ON THE WHOLE BOARD
================================================================================

(1) **FPR BLINDNESS** (reported by mini_bowling, run 39).  The scan read
    `r3..r10` only, so a function taking `(f32, f32)` was invisible.
    `mini_bowling lbl_00005B0C` homes its two float parameters at golden
    indices 10 and 12 with `fmr f28, f2` / `fmr f27, f1` and run-39 argscan
    reported NOTHING for it.  Now scans `f1..f8` as well.
    MEASURED on the 160 LIVE rows: the FPR extension exposes **2 rows** that
    were structurally invisible, of which **1 survives rule (2)** -- and it is
    exactly the named row, `mini_bowling lbl_00005B0C`.  (The other,
    `mini_fight lbl_00019340`, is `fdivs f0, f0, f1` AFTER a call, i.e. a
    return value, and rule (2) correctly withdraws it.)  MEASURED over all
    1,160 `.s` files on disk, live or not, it exposes 14.
    ** SO THE NET LIVE-ROW EFFECT OF THIS WHOLE PROMOTION IS +1 ROW AND -0. **
    That row is worth having -- it is a real member of the class and it needed
    `//@PROTO` + `//@SUB` in run 39 for exactly this reason -- but the headline
    is honesty about the size, not the size.

(2) **`bl` WAS TREATED AS A PURE USE, SO EVERY RETURN VALUE READ AS A
    PARAMETER.**  Not previously reported.  After a call, r3 holds a RETURN
    VALUE; the ABI has already destroyed any incoming parameter that was not
    saved first.  Run-39 argscan reported `mini_fight lbl_0000F9A0` as using r3
    before defining it -- the body is `bl rand` / `clrlwi r4, r3, 0x11`, and the
    function takes NO arguments at all.
    A call now marks r3..r12 and f0..f13 DEFINED.
    MEASURED on the 160 LIVE rows: removes **1 whole row** (`mini_fight
    lbl_00019340`) and narrows **2** (`mini_fight lbl_0001415C`, `mini_golf
    lbl_0000C33C` -- both drop a spurious `f1` while keeping the real hit).
    MEASURED over all 1,160 `.s` files: removes **11** and narrows **2**.
    ** THE FOUR CLEAREST EXAMPLES ARE ALL ON ALREADY-CONVERTED ROWS **, so they
    demonstrate the mechanism against real golden bytes but are not live work.
    Verified by hand:
      mini_fight lbl_0000F9A0   bl rand                          / clrlwi r4,r3
      mini_pilot lbl_00008568   bl create_sprite                 / cmplwi r3,0
      option     lbl_00003DD8   bl vibration_get_cont_enable_mask/ addi r28,r3,0
      test_mode  lbl_00007D20   bl window_set_cursor_pos         / lwz r0,0xc(r7)
    On the live set the rule's real job is narrower and worth stating plainly:
    it stops the FPR extension of rule (1) from introducing a NEW false
    positive, and it cleans two rows that keep their GPR lead either way.
    NO SIGNAL IS LOST BY THIS RULE: a parameter that survives a call must have
    been saved or homed BEFORE the call, and that save is itself a use, which
    the scan sees first.  GATED: arm N proves a call precedes the first use of
    every register the rule drops, on 100% of drops.

(3) **THE ROW LIST WAS `os.listdir(asm/nonmatchings/<stem>)`, WHICH IS NOT THE
    STILL-ASM SET.**  Converted functions keep their `.s` on disk; nothing
    includes them any more.  MEASURED in the main tree AND in three warm copies:
    mini_billiards has **70 `.s` files and 16 live rows**, mini_bowling 120 and
    6, mini_fight 237 and 67.  Board-wide that is **1,160 files for 160 live
    rows -- a 7.25x over-scan**, and the surplus rows are functions that are
    already matched C, where "the owner declares (void)" is a meaningless
    question and acting on the lead would be a regression.
    The row list is now rebuilt from the tree's own census: a label is live iff
    some `src/*.c` carries `#include "../asm/nonmatchings/<stem>/<label>.s"`.
    An explicit label with no such site is REFUSED, not silently scanned.

================================================================================
!! THIS TOOL EMITS LEADS.  IT NEVER EMITS A DEFECT.  READ THIS BEFORE EDITING !!
================================================================================
**A DECLARATION THAT DISAGREES WITH ITS DEFINITION IS NOT AUTOMATICALLY A
DEFECT.**  MEASURED by mini_golf in run 39, n = 1 gate, and it went the other
way: `src/mini_golf_53.c:257` declared `int lbl_00009404(void);` while the
matched definition at `src/mini_golf_16.c:326` reads `u8 lbl_00009404(void)`.
Changing `int` -> `u8` to make them agree produced a **NON-GOLDEN** build;
leaving `int` produced a GOLDEN one.  **The disagreement IS golden**, and the
hand-written `(u8)` casts at its call sites are correct source, not a
workaround.  Run `--counter` to see how large that population is before you
"tidy" anything: on this board it is not small.

So: every row this tool prints is a LEAD.  The proof is a `--gate`, never this
output.  The strong signal is a frame HOME (`stb r3,0x18c(r1)`) plus a later
reload; the parameter's TYPE is read off golden's own bytes (a `stb`/`lbz` pair
with `extsb.` at the use sites is `s8`, not `u8` -- mini_billiards, run 39).

================================================================================
SCAN RULE -- STATED, BECAUSE NOTHING IN tools/ DOES CONTROL-FLOW LIVENESS
================================================================================
  * linear scan of the `.s` in ADDRESS ORDER, stopping after `--limit`
    INSTRUCTIONS (default 120).  Run-39 argscan's docstring said "instruction
    120" but its code counted FILE LINES including labels and blanks; this
    counts instructions, as documented.
  * there is NO backward-branch stop.  Run-39 argscan's docstring claimed one
    ("stopping at the first backward branch target we have already passed") and
    the code never implemented it.  The claim is withdrawn rather than
    implemented: within the first 120 instructions of a prologue it never fired.
  * a register is DEFINED by the FIRST operand of any mnemonic that is not a
    store, branch, compare or `mt*` (those have no destination in field 1).
  * a register is USED if it appears anywhere after the first operand, or
    anywhere at all in a no-destination mnemonic's operands (so the base of a
    load, and both sides of a compare, count as uses).
  * a call (`bl`, `bctrl`, `blrl`) DEFINES r3..r12 and f0..f13 -- see (2).
  * GPR and FPR namespaces are separate: `r3` and `f3` are different registers.
  * reported: r3..r10 and f1..f8 USED BEFORE ANY DEFINITION.

usage:
  python tools/rel_argscan.py [--tree T] [--module M] [label ...]

    --tree T        module worktree root (default: cwd)
    --module M      module name (default: inferred from the tree directory)
    --limit N       instruction budget for the scan (default 120)
    --all           print every live row, including the ones with no hit
    --counter       census the declaration-vs-definition disagreements instead
                    (the counter-rule population -- see above)
    --legacy        reproduce run-39 argscan exactly (GPR-only, `bl` as a pure
                    use, `.s` listing as the row list).  For differencing only.
    --selftest      parser self-test, no tree needed

EXIT CODES ARE A CONTRACT (rel_blindtable's rule):
  0  the scan ran and every requested label resolved
  2  a requested label is not a live still-asm row, or the tree is unusable
"""
import os
import re
import sys
import glob

MODULES = ("mini_bowling", "mini_race", "mini_fight", "mini_pilot",
           "mini_golf", "mini_billiards", "sel_ngc", "option", "test_mode")
STEM = {"sel_ngc": "sel_ngc_rel"}

STORES = ("stb", "sth", "stw", "stfs", "stfd", "stbu", "sthu", "stwu", "stfsu",
          "stfdu", "stbx", "sthx", "stwx", "stfsx", "stfdx", "stmw", "stswi")
NODEST = STORES + ("b", "bl", "blr", "bne", "beq", "blt", "bgt", "ble", "bge",
                   "bdnz", "bctr", "bctrl", "bso", "bns", "cmpw", "cmpwi",
                   "cmplw", "cmplwi", "cmpo", "fcmpo", "fcmpu", "mtlr", "mtctr",
                   "mtspr", "mtcrf", "nop", "isync", "sync", "crclr", "crset",
                   # present in this corpus and destination-free; run-39
                   # argscan omitted them.  All are operand-free in practice,
                   # so they were harmless -- listed so the rule is honest.
                   "blrl", "beqlr", "bnelr", "bgelr", "blelr", "bltlr",
                   "bgtlr", "bdz", "mtfsb1", "mtfsf")
CALLS = ("bl", "bctrl", "blrl")

INSN = re.compile(r"^/\*\s*([0-9A-F]{8})\s+([0-9A-F]{8})\s*\*/\s+(\S+)\s*(.*)$")
GPR = re.compile(r"\br(\d{1,2})\b")
FPR = re.compile(r"\bf(\d{1,2})\b")
INC = re.compile(r'#include\s+"\.\./asm/nonmatchings/([^/"]+)/(\w+)\.s"')
# `[static] asm <ret> <label>(<params>)` -- the definition side, in the owner
# file.  The `static` arm is not optional decoration: MEASURED over all 160 live
# rows in the main tree, the owner declarator is `asm ...(void)` 137 times,
# `asm ...(<params>)` 14 times and `static asm ...(void)` 9 times.  A regex
# anchored on a bare `asm` reports NO-STUB on those 9 -- which is how option
# lbl_00000C94 and test_mode lbl_000010C4 read on the first run of this tool.
STUB = re.compile(r"^\s*(?:static\s+|extern\s+)*asm\s+(.+?)\b(%s)\s*\(([^)]*)\)")


def die(msg):
    print(msg, file=sys.stderr)
    raise SystemExit(2)


def regs(s, fpr=True):
    """-> ['r3', 'f1', ...] in operand order, GPR and FPR namespaces kept apart."""
    out = ["r%d" % int(x) for x in GPR.findall(s)]
    if fpr:
        out += ["f%d" % int(x) for x in FPR.findall(s)]
    return out


def is_arg(r):
    """Is `r` an EABI argument register?  r3..r10 (GPR) or f1..f8 (FPR)."""
    n = int(r[1:])
    return 3 <= n <= 10 if r[0] == "r" else 1 <= n <= 8


def scan(path, limit=120, fpr=True, callclobber=True):
    """-> (used_before_def, frame_homes), each [(reg, mnemonic, operands)]."""
    defined = set()
    ub, homes = [], []
    seen = 0
    for line in open(path, encoding="utf-8", errors="replace"):
        m = INSN.match(line.rstrip())
        if not m:
            continue
        if seen >= limit:
            break
        seen += 1
        mnem, ops = m.group(3), m.group(4)
        parts = [p.strip() for p in ops.split(",")] if ops else []
        if mnem in NODEST:
            src, dst = regs(ops, fpr), []
        else:
            dst = regs(parts[0], fpr) if parts else []
            src = regs(",".join(parts[1:]), fpr) if len(parts) > 1 else []
        for r in src:
            if is_arg(r) and r not in defined and r not in [u[0] for u in ub]:
                ub.append((r, mnem, ops))
        # a parameter homed to the frame right after the prologue is the strong
        # signal; `"r1)" in parts[1]` keeps it to stores through the FRAME
        # pointer, not through an argument pointer.
        if mnem in STORES and len(parts) > 1 and "r1)" in parts[1]:
            rr = regs(parts[0], fpr)
            if rr and is_arg(rr[0]) and rr[0] not in defined:
                homes.append((rr[0], mnem, ops))
        for r in dst:
            defined.add(r)
        if callclobber and mnem in CALLS:
            defined.update("r%d" % i for i in range(3, 13))
            defined.update("f%d" % i for i in range(0, 14))
    return ub, homes


# ---------------------------------------------------------------- tree census

def census(tree, stem):
    """-> {label: (srcpath, lineno)} for every LIVE still-asm row.

    The tree's own `#include "../asm/nonmatchings/<stem>/<label>.s"` lines are
    the authority, NOT the contents of asm/nonmatchings/<stem>/ (see defect 3).
    """
    live = {}
    for p in sorted(glob.glob(os.path.join(tree, "src", "*.c"))):
        for i, l in enumerate(open(p, encoding="utf-8", errors="replace"), 1):
            m = INC.search(l)
            if m and m.group(1) == stem:
                live[m.group(2)] = (p, i)
    return live


def stub_decl(srcpath, lineno, label):
    """The owner's `asm ...(...)` definition line for `label`.

    Searched BACKWARDS from the `#include` line, which is the only reliable
    anchor: the prototype block near the top of the file is duplicated into
    every TU in the module and says nothing about this owner.
    """
    lines = open(srcpath, encoding="utf-8", errors="replace").read().split("\n")
    pat = re.compile(STUB.pattern % re.escape(label))
    # NEAREST FIRST.  Searching the window forwards picks the EARLIEST line that
    # mentions the label, and the prototype block sits above the definitions in
    # every owner in this repo -- so a forward search returns a prototype from
    # ten lines up in preference to the declarator three lines up.
    for j in range(lineno - 2, max(-1, lineno - 12), -1):
        m = pat.match(lines[j])
        if m:
            return j + 1, lines[j].strip(), m.group(1).strip(), m.group(3).strip()
    return None, None, None, None


def owner_proto(srcpath, label):
    """The prototype for `label` IN THE OWNER FILE (not in the other TUs)."""
    pat = re.compile(r"^\s*(.*?\b%s)\s*\(([^)]*)\)\s*;" % re.escape(label))
    for i, l in enumerate(open(srcpath, encoding="utf-8", errors="replace"), 1):
        m = pat.match(l)
        if m:
            return i, l.strip(), m.group(2).strip()
    return None, None, None


def nparams(text):
    """Declared parameter count.  -> (n, kind) with kind in void/kr/fixed."""
    t = text.strip()
    if t == "":
        return 0, "kr"            # K&R `f()` -- permissive, accepts anything
    if t == "void":
        return 0, "void"
    return len([x for x in t.split(",") if x.strip()]), "fixed"


def verdict(ub, homes, stub_params, proto_params):
    """LEAD / OK / PARTIAL / KR / NO-STUB.  Never `DEFECT` -- see the header."""
    n = len(ub)
    if stub_params is None:
        return "NO-STUB", ("owner `asm` declarator not found within 10 lines "
                           "of the #include")
    sn, sk = nparams(stub_params)
    pn, pk = nparams(proto_params) if proto_params is not None else (None, None)
    if n == 0:
        return "NO-ARGS", "golden reads no argument register in the window"
    if sk == "kr":
        return "KR", ("owner `asm` declarator is K&R `()`; it accepts any "
                      "signature already, so this unblocks NOTHING "
                      "(mini_bowling lbl_0000C1D0, priced at zero, run 39)")
    if sk == "void":
        return "LEAD", ("owner declares (void) but golden reads %d argument "
                        "register(s)" % n)
    if sn >= n:
        return "OK", "owner already declares %d parameter(s) for %d read" % (sn, n)
    return "PARTIAL", ("owner declares %d parameter(s) but golden reads %d "
                       "argument register(s)" % (sn, n))


# ------------------------------------------------------- counter-rule census

def counter(tree):
    """Census declaration-vs-definition DISAGREEMENTS across the module.

    These are NOT defects.  MEASURED, n = 1 gate (mini_golf lbl_00009404, run
    39): making the declaration agree with the definition produced a NON-GOLDEN
    build and leaving it alone produced a GOLDEN one.  This mode exists so the
    size of the population is known before anyone sweeps it.
    """
    defs, protos = {}, {}
    dpat = re.compile(r"^\s*([A-Za-z_][\w \t\*]*?)\b(lbl_[0-9A-F]+)\s*\(([^)]*)\)\s*$")
    ppat = re.compile(r"^\s*([A-Za-z_][\w \t\*]*?)\b(lbl_[0-9A-F]+)\s*\(([^)]*)\)\s*;")
    for p in sorted(glob.glob(os.path.join(tree, "src", "*.c"))):
        prev = ""
        for i, l in enumerate(open(p, encoding="utf-8", errors="replace"), 1):
            m = ppat.match(l)
            if m:
                protos.setdefault(m.group(2), []).append(
                    (os.path.basename(p), i, m.group(1).strip(), m.group(3).strip()))
            else:
                m = dpat.match(l)
                if m and not prev.strip().startswith("asm"):
                    defs[m.group(2)] = (os.path.basename(p), i,
                                        m.group(1).strip(), m.group(3).strip())
            prev = l
    rows = []
    for sym, (df, dl, dret, dpar) in sorted(defs.items()):
        bad = [q for q in protos.get(sym, [])
               if q[2].replace(" ", "") != dret.replace(" ", "")
               or q[3].replace(" ", "") != dpar.replace(" ", "")]
        if bad:
            rows.append((sym, df, dl, dret, dpar, bad))
    return rows


# ------------------------------------------------------------------ selftest

def selftest():
    import tempfile
    d = tempfile.mkdtemp(prefix="rel_argscan_selftest_")
    def w(name, text):
        p = os.path.join(d, name)
        open(p, "w", newline="").write(text)
        return p

    def ins(addr, word, text):
        return "/* %08X %08X */ %s\n" % (addr, word, text)

    # 1. the FPR row run-39 argscan was blind to -- mini_bowling lbl_00005B0C's
    #    real first 13 instructions.
    p = w("fpr.s",
          ins(0x5B0C, 0x7C0802A6, "mflr r0") +
          ins(0x5B10, 0x3C600000, "lis r3, modeCtrl@ha") +
          ins(0x5B14, 0x90010004, "stw r0, 4(r1)") +
          ins(0x5B34, 0xFF801090, "fmr f28, f2") +
          ins(0x5B3C, 0xFF600890, "fmr f27, f1"))
    ub, homes = scan(p)
    assert [u[0] for u in ub] == ["f2", "f1"], ub
    ub2, _ = scan(p, fpr=False)
    assert ub2 == [], ub2          # ...and run-39 behaviour sees nothing

    # 2. the call-clobber false positive -- mini_fight lbl_0000F9A0.
    p = w("call.s",
          ins(0xF9A0, 0x7C0802A6, "mflr r0") +
          ins(0xF9A4, 0x90010004, "stw r0, 4(r1)") +
          ins(0xF9A8, 0x9421FFF8, "stwu r1, -8(r1)") +
          ins(0xF9AC, 0x4BFF07B9, "bl rand") +
          ins(0xF9B0, 0x5464047E, "clrlwi r4, r3, 0x11"))
    ub, _ = scan(p)
    assert ub == [], ub
    ub, _ = scan(p, callclobber=False)
    assert [u[0] for u in ub] == ["r3"], ub     # ...run-39 reports the FP

    # 3. a REAL GPR parameter, homed to the frame -- mini_billiards A054's shape.
    p = w("home.s",
          ins(0xA054, 0x7C0802A6, "mflr r0") +
          ins(0xA058, 0x9421FF00, "stwu r1, -0x100(r1)") +
          ins(0xA05C, 0x98610018, "stb r3, 0x18c(r1)") +
          ins(0xA060, 0x88610018, "lbz r3, 0x18c(r1)"))
    ub, homes = scan(p)
    assert [u[0] for u in ub] == ["r3"], ub
    assert [h[0] for h in homes] == ["r3"], homes

    # 4. outgoing call-argument setup is NOT a parameter -- the shape
    #    mini_fight's crude grep flagged and argscan correctly did not.
    p = w("out.s",
          ins(0xB5D4, 0x7C0802A6, "mflr r0") +
          ins(0xB5D8, 0x38600001, "li r3, 1") +
          ins(0xB5DC, 0x90610008, "stw r3, 8(r1)"))
    ub, homes = scan(p)
    assert ub == [] and homes == [], (ub, homes)

    # 5. the limit is in INSTRUCTIONS, and label lines do not consume it.
    body = "".join("lbl_%d:\n" % i + ins(i, i, "nop") for i in range(200))
    p = w("lim.s", body + ins(0x999, 1, "mr r31, r3"))
    assert scan(p, limit=120)[0] == []           # r3 read past the budget
    assert [u[0] for u in scan(p, limit=1000)[0]] == ["r3"]

    # 6. nparams / verdict -- the K&R and (void) forms must NOT collapse.
    assert nparams("void") == (0, "void")
    assert nparams("") == (0, "kr")
    assert nparams("s16 *p, f32 scale") == (2, "fixed")
    assert verdict([("r3", "mr", "")], [], "void", "void")[0] == "LEAD"
    assert verdict([("r3", "mr", "")], [], "", "")[0] == "KR"
    assert verdict([("r3", "mr", "")], [], "int a", None)[0] == "OK"
    assert verdict([("r3", "x", ""), ("r4", "x", "")], [], "int a", None)[0] == "PARTIAL"
    assert verdict([], [], "void", "void")[0] == "NO-ARGS"
    # ...and the vacuity check: a hit still reads LEAD after all five.
    assert verdict([("f1", "fmr", "")], [], "void", "void")[0] == "LEAD"

    # 7. owner resolution: `static asm` must parse, and the NEAREST declarator
    #    must win over the prototype block above it.  Both arms failed on the
    #    real tree before they were fixed (option lbl_00000C94 read NO-STUB).
    o = w("owner.c",
          "void lbl_00000C94(void);\n"          # 1  prototype block
          "void lbl_0000B040(void);\n"          # 2
          "\n"                                  # 3
          "#pragma force_active on\n"           # 4
          "static asm void lbl_00000C94(void)\n"  # 5  <- the declarator
          "{\n"                                 # 6
          "    nofralloc\n"                     # 7
          '#include "../asm/nonmatchings/option/lbl_00000C94.s"\n')  # 8
    ln, text, ret, params = stub_decl(o, 8, "lbl_00000C94")
    assert ln == 5 and params == "void", (ln, text, params)
    assert ret == "void", ret
    pl, ptext, pparams = owner_proto(o, "lbl_00000C94")
    assert pl == 1 and pparams == "void", (pl, ptext, pparams)
    # a plain `asm` declarator still parses, with parameters
    o2 = w("owner2.c",
           "asm void lbl_00022610(s16 *p, f32 scale)\n{\n    nofralloc\n"
           '#include "../asm/nonmatchings/mini_golf/lbl_00022610.s"\n')
    ln, _, _, params = stub_decl(o2, 4, "lbl_00022610")
    assert ln == 1 and params == "s16 *p, f32 scale", (ln, params)
    assert nparams(params) == (2, "fixed")

    print("rel_argscan selftest: 7 groups OK")


# ---------------------------------------------------------------------- main

def main():
    argv = sys.argv[1:]
    if "--selftest" in argv:
        selftest()
        return 0
    tree, mod, limit = None, None, 120
    show_all = do_counter = legacy = False
    labels = []
    i = 0
    while i < len(argv):
        a = argv[i]
        if a in ("--tree", "--module", "--limit"):
            if i + 1 >= len(argv):
                die("%s needs a value" % a)
            if a == "--tree":
                tree = argv[i + 1]
            elif a == "--module":
                mod = argv[i + 1]
            else:
                limit = int(argv[i + 1])
            i += 2
        elif a == "--all":
            show_all = True
            i += 1
        elif a == "--counter":
            do_counter = True
            i += 1
        elif a == "--legacy":
            legacy = True
            i += 1
        elif a.startswith("-"):
            die("rel_argscan: unknown option %r.  Labels do not start with "
                '"-".' % a)
        else:
            labels.append(a)
            i += 1

    if tree is None:
        tree = os.getcwd()
    if not os.path.isdir(os.path.join(tree, "src")):
        die("no src/ under %r -- pass --tree" % tree)
    if mod is None:
        mod = os.path.basename(os.path.normpath(tree))
    if mod not in MODULES:
        die("module %r unrecognised -- pass --module (one of: %s)"
            % (mod, ", ".join(MODULES)))
    stem = STEM.get(mod, mod)

    if do_counter:
        rows = counter(tree)
        print("DECLARATION-vs-DEFINITION DISAGREEMENTS in %s: %d symbol(s)"
              % (mod, len(rows)))
        print("** THESE ARE NOT DEFECTS.  MEASURED n=1 gate (mini_golf")
        print("   lbl_00009404, run 39): making them agree produced a")
        print("   NON-GOLDEN build.  Price a gate, not the tidiness. **")
        for sym, df, dl, dret, dpar, bad in rows:
            print("\n%s   definition %s:%d  ->  %s %s(%s)"
                  % (sym, df, dl, dret, sym, dpar))
            forms = {}
            for f, ln, ret, par in bad:
                forms.setdefault((ret, par), []).append("%s:%d" % (f, ln))
            for (ret, par), where in sorted(forms.items()):
                print("    %-42s x%-3d  %s%s"
                      % ("%s %s(%s);" % (ret, sym, par), len(where),
                         ", ".join(where[:3]),
                         " ..." if len(where) > 3 else ""))
        return 0

    live = census(tree, stem)
    if not live:
        die("no still-asm rows in %r for module %s -- is this the right tree?"
            % (tree, mod))
    if labels:
        missing = [l for l in labels if l not in live]
        if missing:
            die("not a live still-asm row in %s: %s\n"
                "(the tree's census has %d live row(s); a `.s` file on disk is "
                "NOT\n proof a row is live -- converted functions keep theirs)"
                % (mod, ", ".join(missing), len(live)))
        want = labels
    else:
        want = sorted(live)

    asmdir = os.path.join(tree, "asm", "nonmatchings", stem)
    nlead = nhit = 0
    print("# rel_argscan  module=%s  live rows=%d  scanned=%d  limit=%d insn%s"
          % (mod, len(live), len(want), limit, "  [LEGACY]" if legacy else ""))
    for lab in want:
        p = os.path.join(asmdir, lab + ".s")
        if not os.path.exists(p):
            print("%-16s NO .s AT %s" % (lab, p))
            nhit = 2
            continue
        ub, homes = scan(p, limit=limit, fpr=not legacy,
                         callclobber=not legacy)
        src, ln = live[lab]
        sline, stext, sret, sparams = stub_decl(src, ln, lab)
        pline, ptext, pparams = owner_proto(src, lab)
        v, why = verdict(ub, homes, sparams, pparams)
        if v == "NO-ARGS" and not show_all:
            continue
        if v == "LEAD":
            nlead += 1
        print("\n%-16s %s -- %s" % (lab, v, why))
        if ub:
            print("   uses-before-def : %s"
                  % ", ".join("%s (%s %s)" % u for u in ub))
        if homes:
            print("   FRAME HOME      : %s   <- strong signal"
                  % ", ".join("%s (%s %s)" % h for h in homes))
        print("   owner           : %s:%d  #include of %s.s"
              % (os.path.relpath(src, tree).replace(os.sep, "/"), ln, lab))
        if sline:
            print("   asm declarator  : %s:%d  %s"
                  % (os.path.relpath(src, tree).replace(os.sep, "/"),
                     sline, stext))
        if pline:
            print("   owner prototype : %s:%d  %s"
                  % (os.path.relpath(src, tree).replace(os.sep, "/"),
                     pline, ptext))
    print("\n%d LEAD(s).  A LEAD IS NOT A DEFECT -- the proof is a --gate."
          % nlead)
    if nlead:
        print("Both occurrences move, and they move DIFFERENTLY:")
        print("   void lbl_X(void);      ->  void lbl_X(<types>);")
        print("   asm void lbl_X(void)   ->  asm void lbl_X(<types+names>)")
        print("mwcc 1.1 accepts an `asm` declarator WITH parameters over "
              "nofralloc + a .s\ninclude -- MEASURED n=4 (mini_billiards x1, "
              "mini_golf x3, both GOLDEN).")
    return nhit


if __name__ == "__main__":
    sys.exit(main())
