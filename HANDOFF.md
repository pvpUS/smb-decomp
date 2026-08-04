# smb-decomp — Session Handoff

> Working handoff for a fresh Claude Code session. This file is scratch/WIP notes — it is tracked on the WIP branch `wip/rel-drafts-and-dol-matches` so it survives between sessions, but **delete it before any upstream PR**; it is not project code.

---

## STANDING RULES — apply to EVERY run. Not superseded by any `§0.x` section.

Run sections below are newest-first and each gets superseded by the next. **This
section does not.** A rule here holds until it is changed *here*.

### ONE AGENT PER MODULE. NO WORKERS. EVERY RUN.

A run is **exactly nine agents, one per REL module.** A module agent must **not**
spawn subagents, workers, or helper agents of any kind. Its module is its own
work, done directly in its own warm copy.

This is permanent, not a run-13 experiment. **Runs 13, 14 and 15 all ran this
way: zero stranding, zero worktree-merge hazards, zero lost matches, three
times running.** The evidence:

- **The concurrency cap is 20 project-wide.** With nine module agents live only
  11 workers can exist at any moment, first-come — so worker plans are plans
  around a resource that may not be there. In run 12 **mini_pilot lost both
  spawns, mini_race all four, mini_golf two, and mini_fight lost w3 three
  times — and w3's three targets (`6F44` 316, `6A40` 321, `1199C` 484) went
  untouched purely because of that, not because they were hard.**
- **Worker worktrees diverge from their parent, and the merge is the hazard.**
  mini_fight's w4 was cloned *before* the parent converted two functions;
  copying its files wholesale would have **silently lost 10 instructions.** It
  survived only because that parent thought to check.
- **Run 11 lost a 651-instruction MATCH** — the largest single conversion of that
  run — to a worktree whose parent closed before it did.
- **Tools defaulted `--tree` to the parent's tree**, so workers following the
  brief literally built and gated someone else's tree. Four separate tools have
  carried that defect. The whole class only exists because of workers.

**If you want a worker, narrow scope instead.** Report what you did not reach —
run 12's most valuable outputs were measurements and corrections, not
conversions, and three modules that converted nothing changed the project's model
of what is blocked.

**Orchestrator:** launch the nine module agents and nothing else. Do the merge,
gate, clean build, commit and handoff yourself. **Every run brief you write must
restate this section** — the brief is regenerated per run and an agent only ever
reads the brief, so a rule that lives only here will not reach it.

---

## 0.22 — RUN 16 DONE (2026-08-03): +4,752 insn, 32.60% -> 35.10%. START HERE.

Nine parallel agents, one per module, **no workers — fourth consecutive run
under the standing rule, zero stranding again.** **Eight of nine gained** — the
best spread the project has had — and the one that converted nothing produced
two falsifications of standing claims.

| module | still-asm | insn | % | gained |
|---|---|---|---|---|
| **mini_pilot** | 19 fns | 8101/12137 | **66.75%** | **+1,143 / +4** |
| **mini_bowling** | 23 fns | 9220/15313 | **60.21%** | **+805 / +3** |
| test_mode | 30 fns | 8901/16231 | 54.84% | +230 / +1 |
| **mini_race** | 63 fns | 10203/19817 | **51.49%** | **+636 / +9** |
| sel_ngc | 14 fns | 5314/18084 | 29.39% | **0** |
| mini_fight | 79 fns | 7548/28588 | 26.40% | +139 / +1 |
| option | 19 fns | 3053/12375 | 24.67% | +217 / +1 |
| mini_billiards | 26 fns | 6800/28793 | 23.62% | **+1,174 / +4** |
| mini_golf | 24 fns | 7644/38919 | 19.64% | +408 / +1 |
| **TOTAL** | **297 fns** | **66784/190257** | **35.10%** | **+4,752 / +24** |

**Verified**: eight trees moved (**15 modified, 21 deleted, 1 Makefile — the
only SOURCES change is mini_race's 21-file merge; no carve landed anywhere**);
all eight re-merged and rebuilt GOLDEN **in the main tree** at the exact sha1
each agent reported; **all nine pass `rel_structcheck` CLEAN**; the main-tree
census reproduces all nine agents' still-asm figures **exactly**; a clean build
from 946 deleted objects gives **946 objects under `src/`+`asm/` and 1,116
tree-wide — 21 fewer than run 15's 1,137, which is exactly mini_race's 21-file
merge** — and `sha1sum -c supermonkeyball.sha1` = **all 12 OK**. Diff scanned
for game binaries first — clean. sel_ngc was **source-identical** to the main
tree and was not merged.

### ★★ THE BIG LESSON: `PCMP_REGBLIND=GF` IS THE HIGHEST-YIELD THING IN THE PROJECT, AND THE BACKLOG IS FULL OF FUNCTIONS IT UNBLOCKS

Run 15 built the all-register blind and priced its absence. **Run 16 spent it,
and three conversions came from re-measuring a figure nobody doubted:**

- **test_mode `DF28` (230) had been recorded for FOUR RUNS as 45 in 28** —
  hopeless. Under `GF` it is **2 in 2**: 230 of 232 instructions already
  correctly ordered, the whole residual callee-saved *numbering*. Three probe
  batches later it gated GOLDEN.
- **option `077C` (217) had been recorded for THREE RUNS as 4 in 4.** Under
  `GF` it is **0 in 0** — 217/217 byte-identical, one callee-saved register
  wrong. First conversion in that module since run 13.
- **mini_billiards: five of eight inherited figures were wrong.** `lbl_000189B4`
  carried as "16 in 3" for four runs is **0 in 0**; `lbl_000025B0` carried as a
  14-diff numbering problem is **12 in 4 structural**, so run 13's 72 type
  variants could never have worked.

> **mini_pilot states the rule exactly: "the three inherited figures all
> reproduced exactly; what was stale was the BLIND, not the number."**

**Re-measure the whole backlog under `GF` before drafting anything.** The
counter-trap is real but cheap to check:

> **★ A `GF 0 in 0` CAN BE A BLIND ARTEFACT.** test_mode's `AEDC` residual is
> two adjacent instructions swapped — `addi r30,r5,SYM@l` / `addi r29,r3,0`.
> Under `GF` **both normalise to `addi rA,rA,0`**, so the tool reports 0 in 0 on
> a function that is two instructions wrong. **Before believing a `GF 0 in 0`,
> print the `gf` diff and check both sides are the same mnemonic with the same
> NON-REGISTER operands.**

**`rel_pcmp`'s `G/F/GF` does NOT have the frC bug mini_golf found in the
harvested `regblind.py`** (which never masks bits 6-10 of A-form FP, so every
`fmuls`/`fmadds` leaks a register and reads as structural). Verified in the main
tree: `rel_pcmp` blinds disassembled **text**, not bit fields, so
`fmadds f1,f2,f3,f4 -> fmadds fA,fA,fA,fA`. **Every `GF` verdict in this run
stands.** It is also the reason `regblind.py` was not promoted as-is.

### ★★ DRAFT FIRST, GRIND SECOND — settled, with three numbers and one confession

- **mini_pilot converted ALL FOUR of its assigned never-opened targets from a
  blank page, +1,143, taking the module from 57.33% to 66.75%.** Every one came
  off an already-matched DOL twin, `camera_func_level_main` in `src/camera.c` —
  **found by grepping `src/*.c` for a struct field name, not by `rel_xref`.**
  First draft of a 300-instruction function was 17 aligned in 7.
- **mini_bowling drafted both of its never-opened targets to MATCH on the
  SECOND COMPILE each** (360 + 289 insn).
- **mini_race matched 9 of the 10 functions it opened.**

> **mini_bowling's confession is the counter-measurement and it is worth more
> than its conversions: "I spent the first ~30% of the run grinding A23C (the
> brief's top recommendation) for 0 instructions, then ~70% drafting for 805.
> The ordering cost roughly the 6F0C carve (387)." Its predecessor reported the
> same trade against itself in run 15.**

### ★★ THE MERGE IS THE VOLUME LEVER, CONFIRMED AT SCALE — AND IT NEEDS `pragmafix`

**mini_race merged 21 source files (`91..112`) into the magic-owning TU. Cost 0
instructions, unblocked 1,876 a-BLOCKED insn, banked 636 of them.** `.rodata`
state untouched (`0x5F0` + 8 + `0x48C` = `0xA84`); one C object still owns
exactly one magic, now serving 22 C functions. Run 15's hypothesis is confirmed
and taken to its limit.

> **A merge is NOT golden without `#pragma peephole on` before every C function
> that follows an asm block.** mini_race wrote `pragmafix.py` to insert them and
> a 16-file merge then gated first try. **This belongs inside
> `rel_merge_tu.py`.**

### ★★ THE PEEPHOLE PRAGMA IS WORTH MORE THAN THE 8 RUN 15 MEASURED

**mini_race `FBA4` sat at 21 in 13 through 14 variants**; the entire residual
was two `rlwinm.` record forms degrading to `rlwinm`+`cmp`+`beq`. **`#pragma
peephole on` before the newly-converted function took IDENTICAL SOURCE to
MATCH** — worth **21 aligned and 4 real instructions**. It was nearly filed as
structural.

Independently confirmed by the orchestrator's own tool work, as a one-line
control: restoring one function to asm form mid-TU in `mini_bowling_34.c` gates
**GOLDEN** with the pragma inserted and **NOT GOLDEN** with that single line
deleted and nothing else changed.

### ★★ THE r0 STAGING ARTIFACT — TWO MECHANISMS, FOUND INDEPENDENTLY, AND RUN 15's RULE IS FALSIFIED

Run 15 left "the staging happens when r0 is free". **option falsified it against
`9C3C`'s own original** (slot-B empty, r0 free, no staging). Two modules then
found compatible mechanisms from micro-probes:

- **mini_bowling** (30+ probes): mwcc stages a symbol address through r0
  **exactly when a pointer local holding that symbol is the source of a
  ZERO-OFFSET copy into another pointer local that is MODIFIED anywhere in the
  function.** A non-zero offset does not trigger it; a copy into an unmodified
  pointer does not; a compiler induction over `((struct T *)SYMBOL)[i]` does
  not. **Fix: an intermediate `u8 *pp = symbol;` declared BEFORE the base
  local** — `pp` before `work` = 0 in 0, `pp` after = 29 in 15.
- **option** (15-line probe): mwcc stages it **iff the local's own value
  (offset 0) is copied into a register to be passed as a CALL ARGUMENT** — any
  position, any point in the function. Via a second *declaration-initialised*
  local => direct; via a statement assignment => bad again.
- **mini_race sharpens both**: on `E900` the original has **no pointer variable
  at all** — both induction variables are strength-reduced from `[i]` and
  `i*0x1C`. **A direct symbol materialisation is evidence the source has no
  pointer local, however much the asm increments one.**

Together these **bound brief idiom 7**: unmodified => direct *only if also never
passed bare*. option's run-15 cross-reference of 143 GOOD / 3 BAD is **corrected
to 377 / 24** (the old script did not read relocations).

### ★ OPTIMISER PRAGMAS: LIVE IN THREE MODULES, DEAD IN TWO — SWEEP THEM AS A DIAGNOSTIC, NOT A FIX

- **sel_ngc found a THIRD live one**: `#pragma opt_strength_reduction off`,
  55 -> 46. It also **falsified run 15's "the missing `b lbl_0000BC0C` is not
  source-reachable by any of 18 switch spellings"** — `opt_common_subs off`
  produces it, RAW 192 -> **21**.
- **mini_golf proved a pragma is a PROXY and eliminated it**:
  `opt_common_subs off` (worth 48) is *fully replaced* by spelling one of two
  duplicate pool reads as `((f32 *)pool)[0x89]`. **The installed match carries
  no pragma.**
- **mini_fight measured all 13 pragmas dead on four functions**; **mini_bowling
  all five dead** on its artifact. **This bounds brief idiom 8: what won 56 -> 8
  in mini_golf does nothing in mini_fight.**
- test_mode's `DF28` needed `opt_propagation off` **and could not eliminate
  it** — it ships in the source, lexically scoped. Honest and worth 230.

**So: a pragma that moves the score is telling you a source shape exists. Find
the shape. Ship the pragma only when you cannot.**

### ★★ NEW HAZARD, HIT BY TWO MODULES INDEPENDENTLY: THE STORED-DRAFT REVERT

> **`nearmiss/run<N>/` drafts are WHOLE-FILE COPIES that predate that run's own
> conversions, and `rel_sweep --sweep` ends by telling you to `cp` the winner
> over the owner file.**

- **mini_fight**: doing that would have **silently reverted 223 banked golden
  instructions** (`lbl_000154B0`). Caught only by diffing first. It wrote
  `inject.py` (brace-matched single-function injection) instead.
- **mini_race actually lost five conversions this way** and caught it only
  because **`rel_structcheck`'s C-definition count disagreed with what it had
  seen minutes earlier.** *That count is a cheap canary — run it between
  conversions.*

**Every module's stored drafts have this property, including the run-16 set
just written.** mini_race and mini_fight both regenerated theirs against the
end-of-run owner so they do not roll anything back; assume the others did not.

**Tool fix, specified:** before printing `cp <variant> <owner>`, `rel_sweep`
must compare the `lbl_` definition sets of the two files and refuse when the
owner defines a function the variant does not.

### ★ CARVES: THE BRIEF'S PRICES WERE WRONG IN THE SAME DIRECTION THREE TIMES, AND MEASURING THE PREMISE BEAT FOLLOWING THE LIST

**Every module told to open with a carve declined it after measuring, and every
one found something cheaper.** This is the third consecutive run in which
checking a listed target's premise outperformed executing it.

- **mini_billiards** was told to open with `lbl_0000E8D0` (2,496 + 1,494 =
  3,990). It measured: **2,496 insn, 167 labels, 54 distinct callees** — the
  minigame's whole draw routine, 3.3x the largest function ever matched there.
  **Better recipe, every number verified by `objdump`: carve 8 bytes at
  `lbl_00020848`, not 16 at `lbl_00020840`** — `lbl_000115F4` (1,494) uses only
  the signed magic, `lbl_00020840` keeps its data so `E8D0`'s asm still links.
  **Cost 0 to gain 1,494.** And even that is dominated by `lbl_0001A18C` (1,469)
  **which needs no carve at all.**
- **mini_golf** was told its carve cost 478 to gain 15,280. **It costs a
  1,967-instruction blind draft**: `mini_golf_58.c` holds exactly four
  functions, three need the signed `0x266F8`, and the smallest of those is
  1,967 — 2.6x the project record, landing atomically or the module will not
  link. **Replacement, nobody has costed it: `_58..62` are already contiguous
  in SOURCES — merge them, carve into the merged TU, convert `lbl_00023AB4`
  (109). Entry cost 109 instead of 1,967, 18x cheaper, unblocking 16,489.**
- **mini_bowling found a new one**: `lbl_00006F0C` (387) needs BOTH magics, and
  the module's only contiguous `[SIGNED][UNSIGNED]` hole is at `0x10D58` —
  already `_26.c`'s magic. **Carve those 8 bytes: cost 0, gain 387.**
- **test_mode priced but did not take**: `lbl_00010278` is an **8-byte** magic
  whose first user is `E3E8` (144) with `FBA8` (121) behind it — **265 off an
  8-byte carve, the cheapest in the module**, never drafted for a third run.

### ★ THE IDIOM HAUL

1. **A bare `bCOND X; b Y` where X is the next instruction is a positive,
   greppable signature for a TERNARY in the source. An `if` never emits it.**
   mini_golf ran the §1 cross-reference as its *second* tool call and got **60
   hits, every one in already-converted C.** `MAX(a,b)` in `mini_race_117bd.c`
   is the recipe.
2. **A near-miss short one callee-saved FPR means a SOURCE TEMP IS MISSING, and
   mwcc will not invent it.** Writing the value into an explicit `f32 s`:
   119 in 50 -> **87 in 29**, RAW 444 -> 87, frame 0x90 -> 0x98, whole epilogue
   corrected. (sel_ngc)
3. **A loop's scratch float and the tail's scratch float are ONE source
   variable — and WHICH partner matters:** merging with `y` = 71, with `tx` =
   84, separate = 87. (sel_ngc)
4. **Declaration order of two symbol-valued pointer locals decides which gets
   r3/r4 as its `@ha` scratch, and it is worth the whole prologue** — `68C4`
   went **68 aligned in 41 regions -> 0 in 0** with no other change.
   **Cheapest sweep in the project; do it first on any function that
   materialises two REL symbols.** (mini_bowling)
5. **Respell exactly ONE of N repeated reads of a CSE'd pool address** — closed
   3 of mini_billiards' 4 conversions (worth 8, 7, 15). It is a **one-site**
   change (both sites = neither), the **subscript** form is the live one, and it
   is **not universal** (81 combinations flat on another function). Confirmed on
   a third module and on a **subtraction** by sel_ngc (71 -> 65, zero count
   change).
6. **A local reused for two sequential purposes must be TWO locals** (instant
   MATCH), while run 15's converse stands for branches. **Count live ranges:
   mutually-exclusive branches want ONE name, sequential values want TWO.**
   (mini_billiards, mini_pilot)
7. **A ternary whose arms differ in type takes the wider type and moves the
   narrowing conversion after the join, costing an `fmr`** — cast the wider arm
   back to `f32`. **No diff-count signature at all.** (mini_golf)
8. **Binding the first half of a product to a scratch local as its own statement
   forces left-to-right evaluation and changes which int->double stack-temp pair
   each conversion gets** — 16 -> 6. Invisible to any register blind.
   (mini_golf)
9. **A pointer stepped through a loop is either a user local or a compiler
   induction variable, and mwcc allocates the two completely differently.**
   `dst = SYM; dst += 0x24` pays an `mr`; `(SYM + i * 0x24)` at the single use
   makes the optimiser emit the identical `addi` and materialise the base
   directly -> MATCH. **A sweep axis, not a rule** — the same transform made
   another function worse (13 in 6 -> 19 in 7). (mini_fight)
10. **Declaration order + embedded assignment MULTIPLY**: flat at 7 across 13
    spellings; `f32 e;` before `t` **plus** `sx = D + (e = C*t)` -> MATCH.
    Either alone is worth <=2. (mini_race)
11. **NLsprarg house style**: `sprno`/`x`/`y`/`z` assigned **last**;
    `params.u0 = params.v0 = X;` shares one load where two statements emit two.
    **Redundant double field assignments are real — write them.** (mini_race)
12. **New address spelling `(s8)(base + i)[K]` keeps K in the load
    displacement**; four other spellings fold it into the index (6 in 2 each).
    (mini_pilot)
13. **`(rand() & 0x7FFF) * 2`** is the only form giving
    `rlwinm ...,1,0x10,0x1e`; an explicit `(s16)` cast is inert. (mini_pilot)
14. **`f32 + 0.0` folds to a bare double conversion** — `lfs; frsp; stfs`, no
    `.rodata`. A non-folding literal costs a REL its hash. (mini_bowling)
15. **An extra copy before a call fixes argument-setup order.**
    (mini_billiards, read straight out of matched code)
16. **Two axes each WORSE alone and right together** — a plain hill-climb cannot
    find that. (mini_billiards `E3A4`)
17. **Dead locals of an exact size are a real feature** (8/8/16 bytes on three
    mini_race functions, none on a fourth); type and position are inert. And the
    8-byte frame filler must be declared **after** `params` (270 -> 104) —
    later declaration, lower address. (mini_fight)
18. **Callee-saved rank by declaration order: the winner was a MIDDLE
    permutation** (`str,cfg,rec` MATCH; the other five scored 4/7/18/22/25).
    Do not assume monotonicity. (mini_race)
19. **Declaration order of `f32` locals is bimodal and coarse** — all 24
    permutations scored exactly 87 or 90 and the rank needed was flat.
    **Bounds run-15 idiom E.** (sel_ngc)
20. **Idiom 30 extended to address-of**: `m = &((s32 *)p)[0x4D]` MATCHes where
    `m = (s32 *)(p + 0x134)` is 4 in 4 — same instruction, same count, only the
    coalescing web changes. (option)

### BOUNDED, CONTRADICTED OR FALSIFIED

- **Run 15's "staging happens when r0 is free" — FALSIFIED** by option against
  `9C3C`'s own original. Two replacement mechanisms above.
- **"969 insn blocked on volatile register numbering" (sel_ngc, three runs
  running) — FALSE for `B920`**: plain 16 in 11, **ALLBLIND 12 in 11**,
  GF-safe 15 in 12.
- **Run 15's "not source-reachable by any of 18 switch spellings" — FALSIFIED**
  by `opt_common_subs off`.
- **Brief idiom 8 (optimiser pragmas) — BOUNDED**: live in sel_ngc/test_mode/
  mini_golf, **dead in mini_fight (13 pragmas x 4 functions) and mini_bowling
  (5)**.
- **Brief idiom 7 — BOUNDED TWICE** (see the r0 section).
- **Run 15's mini_golf carve price (cost 478) — WRONG BY 4x**; run 15's
  "converting `123B4` costs 352" — **real cost 0**, proven by unchanged
  `.rodata`.
- **`rel_bctr`'s 21 mini_fight sub-functions (1,749 insn) untouched a FIFTH
  run.**

### TOOL BUGS — fixed this run, and still open

**Fixed and landed at close-out** (see the commit): `rel_restore_asm.py
--only`, plus its three measured findings; the `mini_golf_pool_tail.s`
correction; the `rel_fdiff` docstring.

**`rel_restore_asm.py` hard-coding `asm void f(void)` was found INDEPENDENTLY
by mini_bowling and by the orchestrator in the same run**, from opposite
directions.

**Still open, ranked for run 17:**

1. **`rel_sweep --sweep`'s `cp <variant> <owner>` hint can revert banked work.**
   Compare `lbl_` definition sets and refuse. **Top item — it destroys, and it
   has now bitten two modules.** Promote mini_fight's `inject.py`.
2. **`pragmafix.py` belongs inside `rel_merge_tu.py`** — a merge is not golden
   without it and every future merge needs it. (mini_race)
3. **`rel_census.py` is wrong in both directions, still.** mini_billiards
   under-report **4,587** (re-derived 14 fns / 8,526 vs the census's 7 / 3,939);
   mini_bowling **887** (`magic: 0 signed + 1 unsigned` is really **6 + 1**);
   mini_fight re-derived **6,186 reachable / 29%, no carve, no merge**. Promote
   mini_bowling's `magicmap.py`.
4. **`rel_pcmp` compiles EVERY `.c` in a probe dir**, so scoring one label in a
   six-draft directory prints `FAIL` for the other five. Not broken drafts —
   worth a docstring line. (option)
5. Promote: **test_mode's `pd.py`** (as `tools/rel_pdiag.py` — prints the
   aligned diff for one probe under any `PCMP_REGBLIND` by importing
   `rel_pcmp`; **it is what turned "`DF28` is 2 in 2" into the conversion**),
   **mini_fight's `mset.py`** (blinded multiset compare — distinguishes "wrong
   instructions" from "wrong order"), **sel_ngc's `gen.py`** (variant generator
   that rejects missing/non-unique anchors instead of silently emitting an
   unmodified file, preserves CRLF, blocks case-collisions — every module
   hand-rolls this), **mini_golf's `findskip.py`** and **`regblind_FIXED.py`**,
   **option's `prol.py`**, **mini_race's `mkvar.py`**.
6. **`tools/rel_probe_preamble_mini_billiards.h` must be harvested** —
   mini_billiards lost `rel_pcmp` for all of run 15 for want of it, and this
   run **three of five inherited near-misses failed to compile because of the
   PREAMBLE, not the draft** — one then measured 0 in 0 and converted.

### HAZARDS

- **The `python`-on-stdin heredoc hang hit a SIXTH consecutive run** — option,
  mini_billiards, mini_fight, mini_race (twice) **and the orchestrator.**
  mini_race states the rule that actually works: **never type `python` in Bash
  without a script path or `-c` as the very next token.**
- **A restore can UN-EMIT its TU's magic.** Restoring `mini_bowling_42.c`'s only
  int->float conversion removed the object's 8-byte `.rodata`, shortened the
  image by 8 and produced 4,496 differing runs — **while every function in the
  TU still scored ALIGNED 0 and `rel_structcheck` reported CLEAN.**
- **`rel_structcheck`'s C-definition count is a cheap canary for silent
  reverts** — it is what caught mini_race's five lost conversions.
- **`tools/rel_split_args/` is never synced by `warm_reset`**, so `diff -rq
  tools` reports four files differing in every warm copy. **The content is
  identical — it is line endings alone** (verified). Permanent false positive in
  the one check agents use for tamper detection.

### NEXT RUN — ranked

1. **mini_race: `lbl_0000F3D4` (334) — now unblocked by the 21-file merge, the
   largest reachable item, NEVER DRAFTED IN SIXTEEN RUNS. Its own instruction:
   make it the first action.** Then `EC20` 281, `E1CC` 213, `E520` 163, `F174`
   152, `107D0` 70 (879 insn, all open; `107D0` is the same loop shape as the
   `E900` it matched). **The five big b-POOL rows went untouched a THIRD run.**
2. **mini_golf: merge `_58..62` (already contiguous), carve `0x266F8` into the
   merged TU, convert `lbl_00023AB4` (109). Entry cost 109, not 1,967 — 18x
   cheaper — unblocking 16,489.** Near-miss `lbl_00011FEC` (242) is **5 in 4 /
   all-blind 0 in 0**, 237/242 byte-exact.
3. **mini_billiards: `lbl_0001B880` (651) FIRST, before any near-miss —
   unopened for a THIRD run with a defensible reason each time.** Then
   `lbl_0001A18C` (1,469), **no carve needed**. The 8-byte `0x20848` carve
   (cost 0, gain 1,494) after those.
4. **mini_bowling: the 8-byte `0x10D58` carve — cost 0, gain 387** — then
   `5B0C` (720, largest, magic-free; **its run-14 draft does not compile, it
   needs a `lbl_1000000C` struct declaration that was never stored with it**)
   and `C1D0` (566). **Stop grinding `A23C`** (4 in 3, GF 1 in 1, span 10-10)
   until someone finds a converted function where two modified pointers derive
   from one symbol local with no extra copy.
5. **mini_fight: `lbl_0000FA18` (200) — FULLY DECODED this run (spawn_stobj
   loop, 0-param frame), ran out of budget rather than understanding. Its own
   top recommendation.** Then `165B4` (374, now the largest never-opened) and
   `15E00` (389, blank-page drafted, **whole 389-instruction blinded multiset
   already identical — pure scheduling**). The `0x1C138` carve and the 21
   `bctr` sub-functions remain.
6. **test_mode: the 8-byte carve at `lbl_00010278` -> `E3E8` (144) + `FBA8`
   (121) = 265, the cheapest carve in the module, never drafted for a THIRD
   run — open with it.** Then `E628` (419, now 44 in 25 / **gf,GF 6 in 5**) and
   `D084` (207, GF 5 in 4). **`A7FC` is structural under both blinds — do not
   grind it again.**
7. **mini_pilot: 1,010 insn are draft-only with NO carve needed** — including
   `lbl_00000A30`/`lbl_00000BFC` (230), **which are NOT image-blocked as
   recorded**: `mini_pilot_9.c.o` already emits their magic. `lbl_0000A098`
   (385) is **GF 5 in 3, span 223-233** — best remaining ratio in the module.
   **The `0xC6D8` carve should open run 18, not 17.**
8. **option: `lbl_00003240` (410) is `GF` 0 in 0** — byte-identical schedule,
   a 3-cycle among two compiler CSEs and one source local. **Largest cheap
   target in the module.** Then `lbl_00008068` (627, never opened) and the
   `_11c`+`_11d` merge + `C270` carve (1,299, untouched a THIRD run).
9. **sel_ngc: `lbl_00009868` (203) — the only b-POOL live row, NOT TOUCHED AT
   ALL for a third run.** `B1C0` (472) is now drafted at 46 in 27, span 9-310,
   426/472 byte-identical — RAW == ALIGNED, so it is pure substitution.

### RUN-17 PREP

- **`C:/tmp/smbm/warm_reset_run17.sh` EXISTS AND IS READY.** Two fixes over
  run 16's: it now syncs `tools/rel_split_args/` (removing a permanent
  four-file false positive from the tamper check every agent runs), and the
  three-runs-stale `mini_golf_pool_tail.s` note is corrected in place.
- **`C:/tmp/smbm/RUN17_BRIEF.md` DOES NOT EXIST YET — writing it is the next
  session's first action.** Base it on `RUN16_BRIEF.md` plus this section.
  Carry forward verbatim: the STANDING RULES block, the `GF`-artefact check,
  the stored-draft revert hazard, and the `python`-on-stdin rule in mini_race's
  wording.
- **`C:/tmp/smbm/RUN16_RESULTS.md`** holds all nine reports verbatim (228 KB).
- **Re-measure the entire backlog under `GF` first** — it converted three
  functions this run that had been written off for three to four runs each.
- **`rel_sweep`'s `cp` hint is the top tools item — it destroys banked work.**
- **ONE AGENT PER MODULE, NO WORKERS** — fourth consecutive run, zero stranding.
---

## 0.21 — RUN 15 DONE (2026-08-03): +2,649 insn, 31.21% -> 32.60%. Superseded by §0.22.

Nine parallel agents, one per module, **no workers — third consecutive run under
the standing rule, zero stranding again.** Four gained, **five converted
nothing**, and for the sixth run running the zero-conversion modules produced
several of the run's most valuable results.

| module | still-asm | insn | % | gained |
|---|---|---|---|---|
| **mini_pilot** | 23 fns | 6958/12137 | **57.33%** | **+645 / +3** |
| mini_bowling | 26 fns | 8415/15313 | 54.96% | **0** |
| test_mode | 31 fns | 8671/16231 | 53.42% | **0** |
| mini_race | 72 fns | 9567/19817 | 48.28% | **+470 / +4** |
| sel_ngc | 14 fns | 5314/18084 | 29.38% | **0** |
| mini_fight | 80 fns | 7409/28588 | 25.92% | **+726 / +5** |
| option | 20 fns | 2836/12375 | 22.92% | **0** |
| mini_billiards | 30 fns | 5626/28793 | 19.54% | **+808 / +2** |
| mini_golf | 25 fns | 7236/38919 | 18.59% | **0** |
| **TOTAL** | **321 fns** | **62032/190257** | **32.60%** | **+2,649 / +14** |

**Verified**: only four trees moved (8 files total, no deletions, **no Makefile
or SOURCES change anywhere — no merge and no carve landed this run**); all four
re-merged and rebuilt GOLDEN **in the main tree** at the exact sha1 each agent
reported; all nine pass `rel_structcheck`; a clean build from deleted objects
gives **1,137 objects** and `sha1sum -c supermonkeyball.sha1` = **all 12 OK**.
Diff scanned for game binaries first — clean. Committed at `c6966fd`, tools at
`db35a38` / `5f99f68` / `0e50a21` / `c6966fd`.

> The five +0 modules were **source-identical** to the main tree and were not
> merged. Every one of them left its tree pristine and re-gated GOLDEN as its
> last action.

### ★★ THE BIG LESSON: `rel_tu_map`'s magic-anchor count is WRONG, and it has been misleading the project for fourteen runs

Run 14 found that nothing in the toolchain can tell you who already owns a
magic. **Run 15 found the mechanism, and it is a one-line tool defect.**

> **`rel_tu_map.py` only reads `asm/<mod>.s`. It never reads the CARVED data
> segments `asm/<mod>_d*.s`, so every magic that already moved into a carved
> segment — or that a C object emits — is invisible to it.**

mini_race settled it end to end. `rel_magicscan`'s **8 signed + 1 unsigned is
correct**; its offsets are REL file offsets, which in this project **equal**
rodata label addresses. `objdump -h` over all 301 objects: exactly three emit
`.rodata` — `asm/mini_race.s.o` `0x5F0`, `src/mini_race_100.c.o` **8**, and
`asm/mini_race_d1.s.o` **`0x48C`, which holds four magics**. `rel_tu_map`'s
"4 anchors" is just the four `.4byte 0x43300000` in `asm/mini_race.s`; its
5-TU map is wrong and there are at least 8.

**The payoff is immediate and fully specified: 21 a-BLOCKED rows / 2,444 insn
read `lbl_00013C70`, which `src/mini_race_100.c` ALREADY emits.** mini_race was
carved in the run-5/6 era and **nobody in fourteen runs noticed the hole is a
magic filled by a C object.** No carve is needed anywhere in that module.

The census is wrong in **both** directions and every module must re-derive:
mini_billiards under-reports reachable by **5,482**, mini_fight by **1,335**,
mini_bowling by **736** (compiled proof — `rel_probe --sections` shows each
draft emitting exactly the 8 bytes `_56.c.o` already owns), while **mini_golf
OVER-reports by 650** (run 14's "1,128 unblocked" is really 650; `lbl_00012EEC`
lives in an object that emits no `.rodata`).

### ★ DRAFTING PAID, AND THE PROOF IS THREE BUILDS

**mini_billiards' `lbl_0000D7E8` (751 insn) went blank page -> MATCH in three
scored builds**, entirely on cross-reference: a sibling gave the 2-arg
signature (a dead `ball` param, visible in the frame), another gave a verbatim
loop template, `camera_face_direction` in the DOL gave the tail, and one
`rel_findwin` call settled an `s8`/`u8` question against already-converted
code. mini_race matched **two** functions on the first draft, mini_fight one.

**And the counter-lesson is just as clear: five modules converted nothing, and
four of the five say in their own words that they ground instead of drafting.**
test_mode: "I ground A7FC's last instruction instead of drafting the 806 and
265 behind the carves — the brief's §1 mistake, made in the other direction."
mini_bowling: "A23C, the largest of the three, scored better on its first
compile than 9D18 reached after six rounds."

**mini_pilot names the sharpest version of it.** It spent ~15 builds on one
instruction, and it paid (+280) — **but the winning idea came from the
`rel_findconv` command §2 told it to run FIRST and it ran FIFTEENTH.** Run at
the first 1-in-1 it would have freed ~9 builds. **mini_golf reported this exact
lesson in run 14 and mini_pilot repeated it.** Two runs, same mistake, same
command.

### ★ THE IDIOM HAUL — the richest of any run, and several have NO instruction-count signature

1. **Two reads of the SAME pool address spelled DIFFERENTLY still CSE to one
   load but SWAP THE VOLATILE FPR PAIR, at zero instruction cost.**
   `*(f32*)(k+0x78)` in the compare + `((f32*)k)[0x1e]` in the store -> MATCH;
   the same spelling twice -> 4 in 2. **Three of mini_fight's five conversions
   turn on it.** A knob with no count signature is why fifteen runs of counting
   diffs never found it.
2. **mwcc emits `fadd fD,fA,fB` LEAF-FIRST regardless of source order.** To get
   temp-first the left operand must be a **named variable** — and binding the
   subexpression to an **EXISTING** local is free (-> MATCH) while a **NEW** one
   costs a callee-saved FPR and scores **93**. `lbl_00008C40` sat at 1 in 1
   through **46 measured variants** before this. (mini_pilot, 280 insn)
3. **`!(x & 3)` is NOT `(x & 3) == 0`** — the `== 0` form emits a redundant
   `neg`. It re-permuted a whole function: **68 in 41 -> 13 in 7**, the largest
   single-token effect measured in test_mode.
4. **STATEMENT ORDER BEATS DECLARATION ORDER — sweep it FIRST.** Six
   declaration permutations flat at 9; moving two statements ahead of a
   division -> MATCH. (mini_billiards)
5. **Source order of two independent `fdivs` is live even though the scheduler
   reorders them anyway** — worth **28 aligned**, and the emitted order is
   identical either way, **so the asm gives you no hint the axis exists.**
6. **A conditionally-updated float needs TWO named source variables** or mwcc
   swaps the callee-saved FPR pair: one variable + if/else = 8, ternary = 5,
   **two variables = 1.** Declaration order was flat across all 6 permutations
   — **SSA-value count decides this, not declaration order.** (mini_race)
7. **mwcc never materialises a symbol address directly into a pointer local
   that is MODIFIED anywhere in the function** — it stages via a scratch
   register and pays an `mr`. Unmodified => direct, and one copy is free.
   (test_mode, from four micro-probes; this is `A7FC`'s last instruction)
8. **PER-FUNCTION OPTIMISER PRAGMAS ARE A LIVE AXIS NOBODY HAS SWEPT.** Source
   unchanged: `#pragma opt_common_subs off` took 56 in 29 -> **8 in 4**;
   `#pragma opt_propagation off` took 45 in 11 -> **32 in 6**. Neither changes
   the instruction count — only which volatile FPR / stack temp holds a value,
   so they are probably a **proxy for a source shape**. mini_golf did **not**
   install either. **Sweep the pragmas after ~20 flat spellings.**
9. **`#pragma peephole on` does NOT survive being set at the top of a file** — a
   file-top pragma scored the same as no pragma at all. **Re-issue it after
   every asm block.** It is worth **8 aligned** (mini_race, first price). And
   `peephole off` is catastrophic in both modules that measured it (+20 insn /
   61-66 aligned, and 226 vs 9) => **the peephole is definitively ON in the
   original.**
10. **`&((u8 (*)[S])(base + K))[i][0]` forces `base + i*S` BEFORE `+K`**, where
    every ordinary spelling adds K to the scaled index. 12 in 7 -> 3 in 1 ->
    MATCH. (mini_fight)
11. **`i < 3` and `i <= 2` are NOT interchangeable** — read the bound off the
    `cmpwi`. And **a redundant `case` label on a switch's default arm changes
    the dispatch tree** (26 -> 16). (sel_ngc)
12. **mwcc 1.1 will not constant-fold `base + 0*0x9C`**, so `L[n]` subscripts
    cost 3 — and this is identical with a genuinely typed extern, so **the
    typed extern is not the differentiator.** (test_mode)
13. `*(s8 *)x == smallconst` -> `lbz; cmpwi` with **no `extsb`**; `u8` gives
    `cmplwi`. **Absence of `extsb` does not mean unsigned.** And `extsh.` after
    `lha` means an s16 **local**, `cmpwi` a memory compare (52 -> 16 in one
    edit). (mini_billiards, mini_pilot)
14. **mwcc picks single/double arithmetic from the OPERAND types, not the
    destination** — `double d = f32 - f32` still emits `fsubs`.
15. **A declared-but-never-referenced `int` local changes register allocation
    at zero instruction-count change** (98 -> 84 aligned, both 191 insn) —
    refines run-14 idiom 15. (mini_bowling)
16. **An enum-typed loop variable blocks reassociation of two `t += 3;`** where
    `int`/`long`/`u32` are identical to each other: 13 in 7 -> 9 in 4, making a
    280-instruction tail exact. (test_mode)
17. **`(j % 10)` + `(j / 10)` defeat a CSE that inlining `j / 10` twice does
    not** — bounds run-13 idiom 4. (sel_ngc)
18. `if (!(a > b))` gives a bare `ble`; `if (a <= b)` costs `cror 2,0,2`+`beq`.
    But mini_golf measured the same pair as **±1 per site with the direction
    depending on which count you are short** (-4 on one function, +22 on
    another). **Both are true; it is function-dependent.**

### BOUNDED, CONTRADICTED OR FALSIFIED — five inherited rules moved

- **The parameter save area is `nparams*4`, NOT `align8(nparams*4)`** —
  **option and mini_pilot measured this independently**, mini_pilot on four
  functions. **Bounds test_mode's run-14 idiom 10**, which predicted 8 for 5
  params.
- **Run 13's GPR "rank by static use count" rule predicted NEITHER sel_ngc
  function** — `int` declaration order was the dominant lever instead (90 -> 36
  across 12 variants, bimodal).
- **Run 14's "callee-saved FPRs rank by declaration order alone" holds only
  WITHIN A LIVE RANGE.** Giving two regions their own callee-saved pair costs
  **217-231** against **30** for reusing one. And mini_race found declaration
  order flat across all 6 permutations where SSA-value count decided. **The FPR
  rule is now: per live range first, declaration order within it.**
- **Run 14 idiom 21 (a redundant `(u8 *)` cast on a REL label is live) is
  CONDITIONAL.** mini_fight **confirmed it on a second module** (42 in 24 ->
  MATCH) but found a matched function in the same TU using the uncast form;
  **mini_pilot produced a direct counter-example** — `mr rD,rS` and
  `addi rD,rS,0` came out of the same source line.
- **Run 14 idiom 8 (`long` is not `int`) is bounded**: in mini_race's
  `lbl_0000D41C`, **`long` == `int` == `s32`**. Sweep it, but it is not a rule.
- **mini_golf: idiom 3 beats idiom 1** — declaring the *more-used* pointer
  first still moved it to the LOWER callee-saved register and cost 31 aligned.
  **option measured the opposite direction on a per-variable basis** (earlier
  decl -> HIGHER callee-saved, clean monotone ladder 48 -> 23). **Declaration
  position is live per-VARIABLE and the sign is not fixed.**
- **Run 22's compare rule does not extend to float ARITHMETIC** — all
  commutative `fadds`/`fmuls` orders and 8 regroupings byte-identical; only
  *compares* keep source order. (mini_golf)

### ★ THE SCORER'S BLIND SPOT WAS EXPENSIVE, AND IT IS NOW FIXED

**`PCMP_REGBLIND` only ever blinded VOLATILES** (r0, r3..r12 / f0..f13), so a
callee-saved rank error read as "structural, do not sweep". Run 14 knew this
abstractly; **run 15 priced it, and FOUR separate agents hand-built their own
all-register blind because the tool could not express it** (option, mini_golf,
mini_fight, mini_bowling).

> option's `lbl_00008C40`: `gf` reports **23 in 22** — structural — while an
> all-register blind reports **4 in 3**. The schedule is byte-identical from
> instruction 9 to 391 and the entire residual is callee-saved rank, which **is
> a sweepable axis.** Two of that module's five near-misses were mis-triaged.

**Fixed in `5f99f68`: `PCMP_REGBLIND=G/F/GF` blinds ALL of that register file.**
Lowercase is unchanged and byte-identical (the five known byte-exact functions
still score 0 in 0). **`r1` and `r2` are never blinded in any mode** — they are
not allocatable, so blinding them would manufacture a false MATCH. **A `gf`
reading is only evidence of "structural" once `GF` agrees with it.**

Also fixed (`0e50a21`): **an unrecognised `PCMP_REGBLIND` was silently
ignored**, so `PCMP_REGBLIND=all` blinded nothing and read exactly like an
unblinded score. That is the expensive direction — it reports a **correct**
schedule as wrong. mini_bowling was briefly misled by it.

**The cost of run 14's broken scorer is now measured, not assumed.** test_mode
re-scored all 13 of its stored drafts with the fixed tool and **five recorded
figures were wrong** — `lbl_0000E2E8` (64) had been recorded for **three runs**
as a 14-diff schedule problem and is regblind **0 in 0**, pure volatile
numbering. sel_ngc found something worse in its own inherited draft: grinding
`BEE8` from 100 in 47 to 60 in 33, **four outright SOURCE ERRORS were worth 40
of it and the register sweep only 13** — a wrong colour constant, a wrong loop
bound, an invented local and an inverted `if`/`else`. **A stored draft is not a
measurement either.**

### ★ `rel_merge_tu.py`'s SIX DEFECTS ARE FIXED, PLUS A SEVENTH (`db35a38`)

Four of the six had **one root cause**: `split_items` closed an item at every
line where the brace depth was zero, so a `struct Foo` declarator, its `{...};`
body, and any two-line prototype were shredded into pieces that keyed on
nothing.

- **1,2** a conflicting DATA extern was dropped with no diagnostic -> now
  **REPORTED** as a symbol/forms/files table. **It does not decide**:
  mini_pilot resolved three such conflicts by taking the WEAKER form (provably
  codegen-neutral) and could not resolve the fourth at any price.
- **3** duplicated tag kept the absorbed BODY and lost the `struct X` line.
  **The tool's own `carried over a definition the base head lacked ({)` message
  WAS the bug report.**
- **4** where two heads defined a tag differently the base won **even when it
  was a strict subset**. Now ranked by member count.
- **5,6 PULL AGAINST EACH OTHER.** Auto-carrying an absorbed `#include` looks
  like the fix for 5 until you notice it walks straight into 6: **32 adjacent
  mini_bowling groups would have had `sound.h` injected**, and
  `src/mini_bowling_26.c` omits it on purpose so its own
  `SoundIcsReq(u32,int,int)` beats the header's `(u32,u8,s8)`. **A dropped
  include is a loud mwcc error; a wrongly added one can cost a match.** The
  include block is now touched in NEITHER direction and both are reported.
- **7 NEW** — a **multi-line prototype** was never one item, so the run-11/12
  retype reconciliation **silently never fired for one.**

**Proof, not assertion**: `tools/rel_merge_tu_selftest.py` (31 checks, both
directions); old-vs-new replayed over **all 1,555 adjacent file groups** in the
tree with all 66 differences audited; and a real merge of
`src/mini_bowling_67.c` + `_68.c`, which the **OLD** tool turns into
`struct/union/enum/class tag 'BowlPin' redefined` and the new one builds
**GOLDEN**.

### ORCHESTRATOR ERROR, recorded so it is not repeated

**I committed tool changes to the main tree while the run was live.** Agents
diff their `tools/` against the main tree, so **two agents spent real time
investigating it as a possible tamper** — their flagging was exactly correct
behaviour and the protocol worked; the sequencing was mine and was wrong.

**Tools work belongs BEFORE launch or AFTER close-out.** If it must happen
mid-run, write `TOOLS_UPDATED.md` into every warm copy *at the same moment as
the commit*, not after someone notices.

I did propagate the scorer mid-run (read-only, additive, selftest-backed) with
a `TOOLS_UPDATED.md`, once four agents had independently hand-built it.
**`rel_merge_tu.py` was deliberately NOT propagated** — it writes and deletes
source files and agents had been briefed to hand-repair it. mini_pilot
confirmed the propagation landed cleanly and used the new blind.

### NEW: ANYTHING AN AGENT LEAVES IN `tools/` IS DESTROYED BY THE NEXT WARM RESET

`warm_reset_run<N>.sh` copies `tools/` **from** the main tree. Run 14's
mini_pilot agent regenerated a working 233-line probe preamble and reported it
as left in the tree for the next agent — **it only ever existed in that agent's
warm copy, and this run's reset deleted it.** Run 15's mini_pilot then found
the tree's copy broken (130 lines, missing `lbl_10000074`, `lbl_0000D314`,
`lbl_0000D320`; every probe touching them died with `undefined identifier`) and
rebuilt a 265-line one from scratch.

**Harvested as `tools/rel_probe_preamble_mini_pilot.h`.** The generic
`tools/rel_probe_preamble.h` is and always was **mini_bowling's**. Hand
tools-directory artifacts to the orchestrator or they are lost.

### FALSE REPORTS AND FALSIFIED WARNINGS — do not re-report these

- **`rel_pdiff.py`'s hard-coded `PCMP_MODULE` was FIXED IN RUN 14.** option and
  mini_golf both reported it as still live because the comment recording the
  fix **quoted the old expression verbatim**, so a grep for the module name hits
  live-looking code. Comment reworded in `5f99f68`. **Three consecutive runs
  have reported this tool; the last two were wrong.**
- **"Stored drafts do not rebuild" — FALSIFIED as a category error.** mini_pilot:
  run 14's "failing" drafts are `rel_pcmp` probe units and only fail under
  `rel_sweep --sweep`, which replaces the whole owner file; they reproduce
  their recorded scores exactly. **The last three runs' reports of this may all
  be the same mistake.** (mini_fight's separate finding stands on its own terms:
  12 of its 40 stored drafts genuinely did not compile.)

### TOOL BUGS STILL OPEN — ranked for run 16

1. **`rel_tu_map.py` never reads `asm/<mod>_d*.s`**, so its anchor count and TU
   map are wrong in every carved module. **This is the top tools item** — it
   has misled the project for fourteen runs and mini_race has the exact repro.
2. **`rel_restore_asm.py` refuses to work on a merged TU** (most of mini_pilot
   now) — it needs an `--only <label>` mode. mini_pilot restored by hand.
3. **`rel_census.py` is wrong in BOTH directions** (see above). Its a-BLOCKED
   test is still the inline `lis rN,0x4330`.
4. Worth promoting to `tools/`: **mini_golf's `regblind.py`** (register-blind
   scorer over the real linked build — no probe-preamble dependency, no
   relocation-noise inflation), **mini_fight's `remeasure.py`**, **test_mode's
   `rescore.py` / `scan3.py`**.
5. `rel_sweep --sweep`'s "install the winner" hint sorts alphabetically within
   a tie and can name a variant that is merely first among equals. (mini_golf)

### HAZARDS — one new, and the heredoc trap hit a FIFTH consecutive run

- **The `python - <<'EOF'` heredoc hang hit three modules again.** sel_ngc
  sharpens it: it is **any** form that leaves `python` reading stdin, not just
  that spelling — **it bit once even with `< /dev/null`.** mini_pilot hit it
  three times in one run despite the warning. **Write generators to a FILE.**
- **NEW: `tail -N` on your own sorted output hides the best row.** It nearly
  cost mini_fight the `4D14` finding. Same class as the standing
  `rel_sweep` MATCH-first/FAIL-last warning, in a different guise.
- **The tree's sources are natively CRLF** and msys2 `cat -A` hides it; an
  LF-joined anchor fails silently, sometimes as a bare `AssertionError`. Raised
  by four modules this run.

### TRADES TAKEN, each with a number

- **mini_billiards declined the `lbl_0000E8D0` carve a second time**: 2,496 insn
  is 3.3x the function that took half its run, and with ~40% of budget left a
  carve banks **0**. *"Cost ~865 realised to gain 0-or-2,496 at well under even
  odds — don't."* **Correct, and it says plainly the carve needs a run that
  OPENS with it.**
- **mini_fight declined the `80..83` merge**: un-carving `0x1C760` would destroy
  **357 banked, golden instructions** to unblock 1,405 undrafted ones. *Cost 357
  certain to gain 1,405 speculative — not until one of `80..83` has a scored
  draft.*
- **test_mode declined the `_71..75 -> _70` merge — the brief's cheapest listed
  target for it — after checking the premise: "cost 0, gain 0, plus an
  irreversible SOURCES rewrite."** `A7FC` finished at 334 against 333, and a
  merge banks nothing without a landed conversion. **A refusal with the premise
  checked beats following the list.**
- **mini_race skipped the `_100/_101/_102` merge** (cost 31 now, leaves 2,444
  blocked one more run) to bank four conversions. **Its own instruction:
  reverse this first next run.**
- **mini_golf priced its carve: cost 478 to gain 15,280, net +14,802.**
- **sel_ngc bought `BEE8`'s ~35 builds for -40 aligned because a draft existed,
  and left `B1C0` (472) untranscribed for a second run.**

### NEXT RUN — ranked, and the top two are the largest levers in the project

1. **mini_race: merge `_100`+`_101`+`_102` (adjacent in SOURCES) and convert
   `lbl_000100B4` (31) -> unblocks 21 rows / 2,444 insn. NO CARVE NEEDED
   ANYWHERE.** Fully specified in its report; extend outward to
   `0xB948..0x10918` for all 2,465. Its own top instruction. Then the five
   largest b-POOL rows — `3474` (391), `9D3C` (211), `6CF0` (193), `A6D4` (188),
   `62F8` (170) — **never opened for the second run running**, because
   "smallest never-opened first" cost it its biggest targets.
2. **mini_golf: the `lbl_000266F8` carve — 15,280 insn inside `mini_golf_58.c`
   alone, net +14,802.** Priced and feasibility-checked: `d3` splits cleanly at
   the 8-aligned `0x266F8`, both halves carry zero `.text`, the hazard is six
   stubs naming the label. It cannot go to `_53.c` (already owns `0x266A0`,
   0x58 bytes away). **Nobody has ever looked at `lbl_000261E8/261F0` (7,770)
   either.**
3. **mini_billiards: OPEN with the `lbl_0000E8D0` carve** (2,496 + `115F4`
   1,494 = **3,990 off one carve**), recipe ready and deferred twice. Then
   `1B880` (651) and `1A18C` (1469) — **2,120 insn never opened, second run
   running.** `1968C` is 9 in 6 / regblind **1 in 1** (555/564 byte-exact) — one
   real missing `addi`.
4. **mini_fight: `15E00` (389) + `165B4` (374) = 763 insn, FREE, never
   opened** — largest ready surface left. `4D14` (438) is **2 in 1, span 15-16**
   *or* ALLBLIND **0 in 0** at the right count — two exclusive failures over one
   pool pointer. Then the `0x1C138` carve (2,363, still the cleanest). The 21
   `rel_bctr` sub-functions (1,749) are untouched for a **fourth** run.
5. **test_mode: `E628` (419, gf 8 in 7 — six sevenths is unswept register
   numbering) -> `D084` (207, gf 5 in 4) -> `DF28` (230, never drafted, "the
   most tractable unconverted function in the module") -> the one-swap family
   `2684`+`2048`+`AEDC` (393 insn, ONE idea closes three).** `E2E8` (64) is
   regblind 0 in 0. **Remove `lbl_0000F940` from do-not-restart — it is gf
   1 in 1.**
6. **mini_pilot: `7444`/`6F94`/`7A20` (920) + `178C`/`11CC` (442) = 1,362 insn
   merged, gated, magic-owned and never opened.** Then the `0xC6D8` carve
   (+733), not started for a second run. `85B4` (226) is 70 in 21 / `GF` 39 in
   19. **`rel_merge_tu` is fixed, so the `lbl_80285A80` question is now cheap.**
7. **sel_ngc: `B1C0` (472) is the only live function in the module never
   opened, deferred twice — it must be someone's FIRST action.** Its real
   bottleneck is now named three times over: `9868`, `B920` and `BEE8` —
   **969 insn** — are each blocked on volatile register numbering that
   declaration order, expression spelling and statement order all fail to move.
   `B920` is 16 in 11 with 353/370 byte-identical.
8. **mini_bowling: `9230` (289) and `68C4` (360) never opened.** `A23C` (245) is
   **4 in 3, GF 1 in 1**; all three of its drafts die on one artifact, and
   `lbl_0000A610` — matched, same file, identical `u8 *work =` idiom — compiles
   to the direct form. **Live-local count is the untested hypothesis, with a
   matched control in the same TU.** Cracking it lands 245 immediately.
9. **option: `8C40` all-blind 4 in 3** (structural only under the old blind).
   `6C54`/`8C40`/`9C3C` are drafted and real-build scored. The `_11c`+`_11d`
   merge unblocking 1,299 is **materially cheaper now** that `rel_merge_tu` is
   fixed. Its prologue artifact is bounded: **143 matched C functions do it
   right, 3 do it wrong**, and the closest good control has r0 already occupied
   pre-`stwu` — *the staging happens when r0 is free.*

### RUN-16 PREP

- **`C:/tmp/smbm/RUN15_RESULTS.md`** holds all nine reports verbatim (212 KB).
- **`rel_merge_tu.py` is FIXED** (six defects + a seventh, selftest-backed) and
  **lands for run 16** — it was deliberately not propagated mid-run. Several
  modules deferred merges because of it; those merges are now cheap.
- **`PCMP_REGBLIND=GF`** exists. **Re-measure every inherited figure**: five of
  test_mode's thirteen were wrong, and four modules mis-triaged near-misses as
  structural.
- **`rel_tu_map.py` is the top tools item.**
- **ONE AGENT PER MODULE, NO WORKERS** — third consecutive run with zero
  stranding and zero lost work.

---

## 0.20 — RUN 14 DONE (2026-08-01): +3,312 insn, 29.47% -> 31.21%. Superseded by §0.21.

Nine parallel agents, one per module, **no workers — second run under the
standing rule, zero stranding again.** Six gained, three converted nothing, and
**for the fifth run running the zero-conversion modules produced the run's most
valuable results.**

| module | still-asm | insn | % | gained |
|---|---|---|---|---|
| **mini_bowling** | 26 fns | 8415/15313 | **54.96%** | +118 / +1 |
| **test_mode** | 31 fns | 8671/16231 | **53.42%** | **+1,414 / +6** |
| **mini_pilot** | 26 fns | 6313/12137 | **52.02%** | +297 / +3 |
| mini_race | 76 fns | 9097/19817 | 45.90% | **+1,072 / +4** |
| sel_ngc | 14 fns | 5314/18084 | 29.38% | **0** |
| mini_fight | 85 fns | 6683/28588 | 23.38% | +93 / +1 |
| option | 20 fns | 2836/12375 | 22.92% | **0** |
| mini_golf | 25 fns | 7236/38919 | 18.59% | +318 / +3 |
| mini_billiards | 32 fns | 4818/28793 | 16.73% | **0** |
| **TOTAL** | **335 fns** | **59383/190257** | **31.21%** | **+3,312 / +18** |

**Verified**: all seven changed modules re-merged and rebuilt GOLDEN **in the
main tree** at the exact sha1 each agent reported; all nine pass
`rel_structcheck` here; a clean build from deleted objects gives **1,137
objects** and `sha1sum -c supermonkeyball.sha1` = **all 12 OK**, `.dol` at
`424e8ce10135686de0709a147e6a3a5a3fda02f1`. Diff scanned for game binaries
first — clean; **135 files (24 modified, 107 deleted, 4 new).** Committed at
`eb089be`, tools at `1826a6d`.

> option and sel_ngc were **source-identical** to the main tree and were not
> merged. mini_billiards converted nothing but **did** land a 22-file merge, so
> seven trees moved, not six.

### ★★ THE BIG LESSON: magic OWNERSHIP is invisible to every tool we have

Run 13 found that mwcc emits one magic per TU. **Run 14 found that nothing in
the toolchain can tell you who already owns one — and that four modules were
sitting on carved magics nobody knew about.**

- **mini_fight**: three C objects were **already emitting a carved magic before
  this run started, and twelve runs had not noticed.** `mini_fight_71.c` owned
  the signed magic at `0x1C648`, needed by **17 functions / 3,026 insn**, and
  contained exactly one of them.
- **mini_pilot**: **`rel_tu_map.py` reports `0 magic anchors` for the module and
  every prior run believed it.** `objdump -h` over all 111 objects shows
  **three**. 4,178 of its 5,116 a-BLOCKED instructions were never structural.
- **mini_bowling**: **7** magics, not the census's 1; six already emitted by C
  objects.
- **mini_billiards**: census under-reports reachable by **6,233 insn**.

> **The method that works, and it is the same in all four: map every still-asm
> function to the magic ADDRESS it references (`.rodata` bytes + the linker
> map), never to the inline `lis rN,0x4330` the census tests for.** Then merge
> into the object that already owns it. **`tools/rel_magicscan.py` is new and
> reads the inventory straight off the golden linked REL.**

Merges are cheap and they are where the volume is: **21 files → 3 objects
(mini_fight, 1,974 insn), 22 files → 1 (mini_billiards, +2,467), three merges of
9/7/14 files (mini_pilot, 2,888), three of 7/13/6 (mini_bowling).** `#pragma
peephole on` where needed, zero C edits, GOLDEN each time. On mini_fight's `68c`
the pragma **repaired six already-broken matched functions.**

**Refinement worth knowing (mini_golf, which falsified its own first count):**
a function can read the owned magic *label* while its actual conversion is
`xoris`-signed off a **different, still-asm** magic. "Reading a magic label does
not block" does **not** imply it unblocks.

### ★ THE COUNTER-CASE — test_mode, and it is why "no carve required" is not a rule

**test_mode had NO object emitting any `.rodata` at all**, so run 13's
merge-only recipe would have banked **zero** and a carve was mandatory. It took
**+1,414, the run's largest gain**, on a different recipe:

> **`rel_carve --list`'s `first user` column IS the a-BLOCKED worklist.** Six of
> its nine magics had a reachable a-BLOCKED first user — a one-command unblock
> each. **Four of the six matched at 0 in 0 on the first probe batch.** They
> were never hard, only unreachable.

**Check which case you are in before planning** — `objdump -h` every object once
and see whether any `.rodata` exists at all.

### ★ SETTLED: two magics are emitted CONTIGUOUSLY, so "needs both" is not death

**mini_billiards, two compiled probes; mini_pilot independently from the dead
direction:**

> **mwcc emits BOTH of a TU's magics as ONE CONTIGUOUS 16-BYTE `.rodata` block,
> in SOURCE FIRST-USE ORDER.** A two-magic function is dead **iff** the golden
> image has no such block in its required order — *not* because "no single
> object can own both."

Also settled, never written down before: **`0x43300000_80000000` is the SIGNED
magic, `0x43300000_00000000` the UNSIGNED.**

**Run 13's sel_ngc retirement was built on the wrong premise and survives
anyway.** Re-derived against the golden linked REL at every byte alignment:
both orders absent, closest signed/unsigned pair **456 bytes apart**. **2,303
insn stay retired**, now for a reason that will survive the next rule change.
The real obstacle is the 456 bytes of `d1.s` data between the two magics.

New retirements on structural proof: **mini_billiards 1,879**, **mini_pilot
`lbl_00009C18` (205)** — and its corollary that **`0xC5B8` is worth exactly 0,
so nobody should carve it.** Un-retired: **sel_ngc `lbl_00009868` (203)**,
reproduces at 12 in 10 with regblind **1 in 1**, `b-POOL`, no carve or merge
needed. **Retiring on exhaustion has now failed six times.**

### ★ ANSWERED AND CLOSED: the retyped-extern probe — 5 modules to 1

Run 13's "best clean cross-module probe for run 14" was mis-posed. **option,
mini_golf, test_mode, mini_fight and mini_race all measured the declared TYPE
inert**; mini_bowling, which raised it, **falsified its own claim** and named
the real axis, which the others independently agree with:

> **What is live is the ADDRESS-MATERIALISATION SHAPE of the read, not the
> declared type.** `X[i].m` on a correctly-typed extern is the only spelling
> mwcc folds; a cast or a hoisted base local costs the same. **Retyping is a
> precondition, not the lever**, and the direction flips with access shape.

mini_golf: bound to a named pointer local, `u8[]`+cast / `struct X` /
`struct X[]` are byte-identical. mini_fight: dropping the local cost **47 and
71** on two functions. **Do not re-sweep the type. Sweep bare-subscript vs cast
vs base-local.**

### ★ THE REGISTER-RANK RULES SPLIT BY REGISTER FILE

> **mwcc allocates callee-saved FPRs by DECLARATION ORDER ALONE (first →
> `f31`); static use count is entirely inert.** 64 probes, clean grid.

**This is the opposite of run 13's GPR rule** (rank by static use count,
declaration order only as tie-break) — which sel_ngc established and then
generalised to FPRs **without testing.** Two rules now, split by register file.

Related, and it names a mechanism run 13 left unexplained: **an expression whose
value is exactly a bare-symbol pointer local's address AT OFFSET 0 forces mwcc
to materialise it ahead of the frame and pay an `mr rD,r0`; any non-zero offset
does not.** That is the "repaired an unrelated prologue coalescing failure" of
run-13 idiom 7.

### ★ THE IDIOM THAT CLOSED THREE FUNCTIONS, FOUND BY CROSS-REFERENCE

> **An unsigned value tested `>= 0` inside an `&&` is a semantic no-op that mwcc
> still materialises in the register allocator.** RHS a **constant** → four dead
> instructions (`li r0,0; li r4,-1; subfc; subfze`). RHS a **variable** → **zero
> instructions**, its only effect moving the compared load out of `r0` into a
> numbered volatile. **Must be spelled inline at both sites.**

mini_golf found it in **one command** —
`rel_findwin.py 'subfc r(\d+), \S+' 'subfze r\1\b'` — two hits project-wide, one
being mini_race's **already-matched** `lbl_00003398`. It closed `FA18` (108),
`FBC8` (70) and **`F7E8` (140), the handoff's "cheapest close in the project",
stuck at 2 in 1 across ~185 spellings over three runs.**

**mini_golf's own lesson, stated as a directive: run `rel_findwin`/`rel_findconv`
BEFORE the local sweeps.** It spent the first third of its run on 68 spellings
that went nowhere. sel_ngc made a 396-insn function draftable in about an hour
off a converted sibling in the same file. **Cross-reference remains the highest-
yield lever in the project.**

### OTHER NEW IDIOMS, all golden-build-proven

1. **A case-range `switch` emits TWO branches to the default block; no
   `if`/`&&`/`||`/`goto` spelling reproduces it** — nine equivalents stalled at
   3 in 1, `switch { case 0..3: ...; case 4..6: goto rnd; }` gave 0 in 0.
   `default:` and an explicit second arm are **not** interchangeable.
   (mini_bowling)
2. **`long` is not `int`.** A 256-iteration loop: `int`/`s32`/`u32` fold the
   zero-trip guard away, `s16`/`u16` lose the ctr loop, **`long` emits both
   guard and `mtctr`/`bdnz`** — the original. 18 → MATCH. `int` ≡ `s32`
   byte-identical **again**. **Sweep `long` separately.** (mini_race)
3. **A named pointer to the SOURCE fixes a small aggregate copy's SCHEDULE** —
   `ps = &src; dst = *ps;` restored the paired `lwz;lwz;stw;stw;lwz;stw` where
   `volatile` on both sides, 4 copy spellings and 240 declaration orders were
   flat. 12 → MATCH. **This is the axis run 13's `11658` died on.** (mini_race)
4. **A discarded `(f32)x;` expression statement emits mwcc's int→float store
   pair with no use** — value CSE'd, stores not; worth 8 insn + 16 frame bytes.
   **A dead local is DCE'd whole and does not do this.** (mini_pilot)
5. **`fsubs` vs `fsub` in the magic sequence reads the `(f32)` cast straight off
   the asm** — last diff standing in both directions. (mini_pilot)
6. **Parameter save area is `align8(nparams*4)`, and 0 for `void`** — refines
   run-13 idiom 13, which predicts 4 for one param. But **check the direction**:
   one function was 8 bytes short and needed a **declared 8-byte local nothing
   reads.** Tell: a param area shifts *all* locals up; a dead local only moves
   the ones below it. (test_mode; confirmed with a control by mini_pilot, where
   two same-file same-type callbacks needed 5 params and 2)
7. **`x = A * (y = B);` ≠ `y = B; x = A * y;`** — worth 8 aligned insn.
   (test_mode)
8. **A redundant `(u8 *)` cast on a REL data label is LIVE** — it flips
   parameter homing `addi rD,rS,0` → `mr rD,rS`. **This is the knob mini_fight
   flagged in run 13.** (mini_billiards)
9. **`volatile` on a repeated pool read defeats cross-block load CSE** (22 in 7
   → 11 in 6) and changes nothing else. (mini_fight)
10. **`sprite->x += e;` matches where `sprite->x = sx + e;` and
    `sprite->x = sprite->x + e;` do not** — the compound-assignment operator
    itself, not a use count (both leave `sx` with 2 static refs). (sel_ngc)
11. **Casting a function designator to pass an undeclared argument emits an
    INDIRECT call** (`mtctr; bctrl`). A **K&R prototype** `void f();` serves
    both a zero-arg and a one-arg call site with a direct `bl` — **a use for a
    documented dead axis.** (sel_ngc)
12. **A typed struct pointer stops mwcc folding a constant into load
    displacements** — 8 `u8 *` spellings of `g + sel*8 + K` all fold,
    `&((struct P *)(g + K))[sel]` reproduces the original's separate `addi`.
    (option)
13. Float guards as an early `continue` give a bare `bgt`; inside an `&&` chain
    they cost the `cror 2,0,2; bne` pair (41 → 24). Splitting
    `x = f() * (E);` into two statements flips the `fmuls` operands, while
    `A*B` vs `B*A` in one statement is inert. (mini_race)

### BOUNDED / RETRACTED BY THEIR OWN AUTHORS

- **"`register float` allocates in reverse declaration order" does NOT carry to
  ordinary temps** — a `register f32` pair scored **36** against the plain
  form's 4. **Bind it to asm operands only.** (mini_fight, bounding its own
  run-13 claim)
- **mini_bowling's run-13 idiom 8 (retyped extern), falsified by its author** —
  see above.
- **mini_golf's `lbl_00022D4C` is STRUCTURAL** — `PCMP_REGBLIND=gf` identical to
  unblinded. Run 13's 96 declaration orders + 112 spellings were **the wrong
  tool by construction.** Do not type-sweep it again.
- **Declaration order is inert or live depending on ANOTHER local's type** —
  mini_race: **720 permutations byte-identical** with `s8 chara`; retyping that
  one local to `int` made the same 720 spread 4-42.

### ★ THE SCORER WAS LYING, AND IT IS FIXED (`1826a6d`)

**Four defects, from four modules, every one INFLATING a near-miss score** — and
a near-miss score is what the next agent uses to pick an axis. On five functions
byte-exact in the tree today, the pre-fix scorer reported **15 phantom diffs**,
including **10 in 10 on mini_race's `lbl_000021C8`** against a truth of 0 in 0 —
exactly matching that module's independent "10 of 16 were phantom."

1. **Extended mnemonics were never canonicalised.** `or. rA,rS,rS` vs
   `mr. rA,rS` alone is **112 occurrences project-wide** (mini_billiards). Now
   folded on both sides: cr-logical aliases and symbolic CR bits
   (`4*cr1+eq` ↔ `6`), the whole `rlwinm` family, `mr`/`not`/`nop`/`li`/`lis`/
   `subi`, SPR moves.
2. **16-bit immediates compared unsigned** — the `.s` side's `0xffff` never
   equalled objdump's `-1`, so every `addis rX,rX,-1` scored +1 region
   (test_mode). **Its warning about the fix was right and is honoured**:
   normalise BOTH sides, inside `to_words()`.
3. **`(lbl_X+0xNN)@ha/@l` was not masked as a relocation** — it became
   `(L+0x34)@ha` and scored against the object side's plain `0`. **This inflated
   `PCMP_REGBLIND` itself**: mini_golf's `F7E8` read 2 in 1 when the true
   schedule residual was **0 in 0**. The spelling exists because of mini_golf's
   own run-13 finding.
4. **`module()` returned one string for two jobs** — `rel_probe` wants
   `sel_ngc`, `asm/nonmatchings/` wants `sel_ngc_rel`. **Every sel_ngc probe
   reported a silent FAIL and that module ran all of run 14 without the tool.**

Plus **`rel_pdiff.py`'s `mini_bowling` default — reported by FOUR modules.**
**`tools/rel_pcmp_selftest.py` is new and asserts both directions** (distinct
encodings must stay distinct, or a canonicaliser manufactures false MATCHes)
plus five known byte-exact functions at 0 in 0. **Treat every regblind figure
recorded in run 14's reports as an upper bound — they were measured with the
broken tool.**

**`PCMP_REGBLIND` also has a real blind spot: it is blind to callee-saved
renumbering by construction**, so a callee-saved rank error reads as
"structural, don't sweep" — which is what it wrongly said about sel_ngc's
`E778` `f31`/`f30` swap. **Run `gf` and an all-register blind.**

### ★ `rel_merge_tu.py` IS NOW THE PROJECT'S PROBLEM TOOL — 6 defects, 3 modules

Merging is the primary lever now, so this is where the tools budget goes.
**None of these is fixed.**

1. **Silently drops conflicting DATA externs** (it reconciles prototypes but not
   data). One symbol — `lbl_80285A80`, `struct PilotTgtRow[]` vs `u8[]` — **is
   why 1,290 mini_pilot instructions are still parked.**
2. **A data label's richer `extern struct T sym;` is dropped for the base's
   `extern u8 sym[];`.** (mini_fight)
3. **A duplicated struct tag keeps the absorbed BODY and loses the `struct X`
   line**, leaving an orphan top-level `{...};`. **The tool's own
   `carried over a definition the base head lacked ({)` message IS the bug
   report.** (mini_fight)
4. **Where two files define a tag differently, the base wins even when it is a
   strict subset.** (mini_fight)
5. **Absorbed `#include`s are dropped.** (mini_fight)
6. **It unions `#include`s but cannot express a deliberate ABSENCE** —
   mini_bowling's `_30.c` omits `sound.h` on purpose because its own
   `SoundIcsReq(u32,int,int)` beats the header's `(u32,u8,s8)`. The union makes
   mwcc reject the TU; dropping the custom extern instead compiles and
   **silently loses the match** (`lbl_00007518` → 6 in 6, span 24-78).

Six reusable repair scripts are in `_scratch_mini_fight/`.

### DESTRUCTIVE HAZARDS AND TRAPS (re-confirmed, plus new)

- **The `python - <<'PYEOF'` heredoc trap hit a FOURTH consecutive run**, three
  modules again, each losing a full 2-minute timeout. **Write generators to a
  file.**
- **NEW: a Python text-mode write converts the tree's LF sources to CRLF** and
  broke a restore at byte 3. Use `newline=''` or `cp`. (option)
- **NEW: variant filenames differing only in CASE silently overwrite** on the
  Windows scratch filesystem — a 16-variant sweep produced 4 files.
  (mini_billiards)
- **NEW: a manual `.plf`-only build makes `rel_sweep --sweep` print
  `BUILD FAILED ... .rel does not exist` for every variant.** (mini_golf)
- The `git status` false positive on a warm copy was raised **again** (mini_golf,
  third module in three runs). **Verify by `cmp`.**

### TRADES TAKEN, and scope not reached

- **option and sel_ngc both bet depth over breadth and both say it did not
  pay.** option left `6C54` (719), `8C40` (391), `9C3C` (574) — **1,684 insn —
  not drafted at all**; sel_ngc left `B1C0` (472), `BEE8` (396), `B920` (370) —
  **1,238 insn**, and says a first pass would at least have produced a number.
  **Both are right, and this is the third run where a deep grind on a
  near-miss returned less than drafting would have.**
- **mini_bowling** chose not to merge across `_25b.c` to keep `5B0C`'s pure TU —
  **verified it bought nothing**, since the only thing past it needs the
  unsigned magic anyway. It also names its own miss: it ground `9AA8` to 2 in 2
  instead of starting a fresh body.
- **mini_fight** merged `78f`+`79`: gains `17950`+`17BA0` (284), **forecloses
  `177C8` (98)**; a leaf-split recovers it.
- **sel_ngc priced run 13's "foreclosed" `lbl_0000F788` (417)**: freeing it costs
  reverting 450 insn. **Net −33. Don't.** *A foreclosure with arithmetic beats a
  warning.*
- **mini_billiards did not carve `lbl_0000E8D0`** (2,496 insn, adjacent magics,
  right order) because §7 forbids carving without converting in the same run.
  **Correct call — the carve recipe is in its report, ready.**

### NEW BLOCKED CLASS THE CENSUS CANNOT SEE

**Image-blocked** (mini_pilot): `A30`/`BFC` (115 each) are blocked by
**local-array initialiser-list `.rodata` images** sitting non-adjacent to their
TU's magic, not by a magic at all. Precise path documented in its report.

### CARVE REVISIONS — mini_race's now exists, test_mode's is new

`--from` wants a rev whose `asm/<mod>.s` is still **pristine**.
**mini_race `11cbf20`** (its carve landed in `36fe55d`; verified `--list` works
— it had never been examined in 14 runs, and `lbl_000136C8` is a MAGIC whose
first user is `lbl_0000056C`). **test_mode `33444d5`** (carved this run in
`eb089be`). Unchanged: mini_pilot/mini_bowling/mini_fight `11cbf20`, sel_ngc
`d32e854`, mini_golf `36fe55d`, option `56859b0`.

### NEXT RUN — ranked, and it is mostly DRAFTING

**Five modules unblocked large surfaces this run and drafted almost none of
them. That is the whole opportunity.**

1. **mini_fight: 7,051 insn reachable — 32% of what remains in the module —
   with NO carve and NO merge**, after this run's three merges. Its one
   conversion **matched on the first draft.** Biggest ready surface in the
   project.
2. **option: 1,684 insn never drafted** (`6C54` 719, `8C40` 391, `9C3C` 574) —
   **the skeleton is now written down, so they are much cheaper than they were**
   — plus the **C270 merge unblocking 1,299** (`0C94` 577 + `1598` 722), which
   falsified run 13's "cannot be staged". Its two near-misses share **one**
   prologue artifact (`mr r29,r0`, proven a scheduler decision) sitting in front
   of the whole 2,445-insn family: `9454` **6 in 4 with every callee-saved
   register correct**, `48F4` 24 in 18 with **one callee-saved pair transposed.**
3. **mini_billiards: 3,435 insn never attempted** — **start `lbl_0000D7E8`
   (751) from asm, do NOT re-optimise `E3A4`** (its own instruction). It triaged
   all four and **none is fma-blocked.** Then `lbl_0000E8D0` (2,496) via the
   ready carve. **Three runs at +0; it needs a draft, not another measurement.**
4. **mini_bowling: 1,229 insn reachable today** — merged, gated, magic owned,
   **never drafted**: `97B4` (189), `9D18` (146), `A23C` (245), `9230` (289),
   `68C4` (360). Near-miss `9AA8` (156) is **2 in 2, 155/156 byte-exact.**
5. **mini_pilot: `lbl_00009440` (219) and `lbl_000089F8` (146)** — both merged,
   both `nlSprPut` with matched templates in `_45.c`/`_10k.c`; it ran out of
   budget at their door. Then the **`0xC6D8` carve (+733)**.
6. **test_mode: `lbl_0000A7FC` (333) needs only a merge of `_71..75` → `_70`,
   magic already carved.** Then `95F8`+`9A0C` (806, one carve + merge),
   `E3E8`+`FBA8` (265, one carve). `AEDC` (290) is **2 in 2 and regblind 2 in 2
   ⇒ structural, do not type-sweep.**
7. **mini_golf: the 1,128 insn it unblocked** — start `lbl_00011FEC` (242),
   which needs no pool constant. **Untouched by any run: `lbl_000266F8` (15,062)
   and `lbl_000261E8/261F0` (7,770) — the real volume in the largest module.**
8. **mini_race: 29 fns / 3,573 insn reachable**, largest `3474` (391), `9D3C`
   (211), `6CF0` (193). **Its carve is now examinable** (above). `19AC` (209) is
   2 in 2, 207/209 byte-exact, **regblind == aligned ⇒ schedule, not numbering.**
   TU4's **4 fns / 885 insn in a 16-fn contiguous range is the cheap merge
   probe.** Unresolved: the census says 7 signed + 1 unsigned against
   `rel_tu_map`'s 4 anchors — **`rel_magicscan` says 8 + 1; nobody has
   reconciled the anchor count.**
9. **sel_ngc: `BEE8` (396) at 100 in 47, `--blind GF` 41** — two thirds is
   callee-saved numbering **it never swept.** `B1C0` (472), `B920` (370) never
   drafted. `9868` (203) is **un-retired at 12 in 10, regblind 1 in 1.**

### RUN-15 PREP

- **`C:/tmp/smbm/RUN14_RESULTS.md`** holds all nine reports verbatim (182 KB).
- **`tools/rel_magicscan.py`, `rel_pcmp_selftest.py`** are new; `rel_pcmp`/
  `rel_pdiff` are fixed. **`rel_merge_tu.py`'s six defects are NOT fixed** and
  are the top tools item.
- **ONE AGENT PER MODULE, NO WORKERS** — second consecutive run with zero
  stranding and zero lost work.

---

## 0.19 — RUN 13 DONE (2026-07-31): +2,494 insn, 28.16% -> 29.47%. Superseded by §0.20.

Nine parallel agents, one per module, **no workers — the standing rule's first
run, and it worked**: zero stranding, zero worktree-merge hazards, zero lost
matches, against run 12's nine dead spawns and three targets untouched purely
from the concurrency cap.

Six gained, **three converted nothing — and for the fourth run running, those
three produced the run's most valuable results.**

| module | still-asm | insn | % | gained |
|---|---|---|---|---|
| **mini_bowling** | 27 fns | 8297/15313 | **54.18%** | **0** |
| **mini_pilot** | 29 fns | 6016/12137 | **49.57%** | +390 / +1 |
| **test_mode** | 37 fns | 7257/16231 | **44.71%** | +610 / +2 |
| mini_race | 80 fns | 8025/19817 | 40.50% | **+630 / +4** |
| sel_ngc | 14 fns | 5314/18084 | 29.38% | +297 / +3 |
| mini_fight | 86 fns | 6590/28588 | 23.05% | **0** |
| option | 20 fns | 2836/12375 | 22.92% | +263 / **+5** |
| mini_golf | 28 fns | 6918/38919 | 17.78% | +304 / +1 |
| mini_billiards | 32 fns | 4818/28793 | 16.73% | **0** |
| **TOTAL** | **353 fns** | **56071/190257** | **29.47%** | **+2,494 / +16** |

**Verified**: all nine re-merged and rebuilt GOLDEN **in the main tree** at the
exact sha1 each agent reported; all nine pass `rel_structcheck` here; a clean
build from deleted objects/`.dol`/`.elf`/`.rel` gives **1,240 objects and
`sha1sum -c supermonkeyball.sha1` = all 12 OK**, `.dol` at
`424e8ce10135686de0709a147e6a3a5a3fda02f1`. Diff scanned for game binaries
first — clean; **65 files.** Committed at `c548f1a`, tools at `afc61ed`.

> **1,240 vs run 12's 1,280 is itself a check**: exactly the 42 files merged away
> (option 30, sel_ngc 8, mini_billiards 4) less mini_golf's 2 new segments.

### ★★ THE BIG LESSON: the `a-BLOCKED` class is MOSTLY NOT STRUCTURAL

**option's finding, and it reframes the largest blocked category in almost every
module.**

> **mwcc emits ONE magic double per TRANSLATION UNIT, shared by every function in
> it — which is how the original was compiled. An a-BLOCKED function unblocks by
> MERGING INTO THE TU THAT OWNS ITS MAGIC. No carve at all.**

Every run before this treated a-BLOCKED as needing a `.rodata` carve, and three
runs were spent grinding carves. **The proof was already sitting in option's own
tree**: `option_30.c` was a 6-function TU whose members shared a **single** 8-byte
`.rodata`, and it was the only object in the module emitting any. option merged
**30 files into one**, gating GOLDEN at each step, took **all five** of its
conversions from that one move, and left **2,445 further instructions magic-free
and needing only drafting.**

**`rel_census`'s a-BLOCKED test (`rel_census.py:324`) checks only for the inline
`lis rN,0x4330`; it never checks whether the function's object already owns the
magic.** Reported independently by **two** modules: mini_billiards measured it
under-reporting REACHABLE by **3,766 insn**, option by **9 functions**. **Treat
every a-BLOCKED row as a CANDIDATE, exactly as `rel_bctr` rows already are.**

**Merging is now cheap at every size** — run 13 confirmed on a 30-file, a 9-file,
a 5-file and three 2-file merges. sel_ngc's two **each gated GOLDEN as a no-op
before any C was written.** mini_billiards' two text-adjacent merges needed **no
pragma at all** (after merging both are C-then-asm, and the deopt is positional);
its third *did* break and went GOLDEN with **zero C edits** once the pragma went
in. **Read every "too risky to merge" verdict in this file as cheap.**

**But merging has a real cost: SOURCES order fixes `.text` order, so absorbing a
file can FORECLOSE a function.** sel_ngc took a 236-insn certainty over a
417-insn speculation (`lbl_0000F788`) and said so explicitly; option's 29-file
merge absorbed `option_46.c`, foreclosing an unproven path for `lbl_00008068`
(627). **Both reversible by splitting back out. State the trade.**

### ★ SETTLED: compare operand order — 414 measured cells

mini_bowling, `cmporder.py`, 414 cells × 2 spellings across type × context ×
operand-kind × relation: **174 INERT, 240 LIVE, 0 FAIL.**

> **mwcc 1.1 NEVER canonicalises a compare between two REGISTER operands. It
> emits them in SOURCE ORDER and picks the branch condition to match. Order is
> inert only where one operand is not a register.**

1. **Integer vs CONSTANT: INERT**, all relations, all contexts — folds to
   `cmpwi r3,5`, so there is only one possible order. **This is where the
   inherited "integers are canonicalised" claim came from.**
2. **Float/double vs CONSTANT: LIVE for `< > <= >=`, INERT for `== !=`** (mwcc
   always loads the constant first for equality, since `beq`/`bne` is symmetric).
   **This is exactly mini_fight's "live on one compare and inert on another in
   the same function."**
3. **`return a < b;` as a VALUE: INERT for `< > <= >=`** (no compare emitted at
   all — branchless `eqv/subfc/srwi/addze/clrlwi`), **LIVE for `== !=`.**

Floats are **LIVE in every register-vs-register cell**. **mini_race's run-12
"float order is inert" is not reproducible in any of 96 float cells** — and
mini_race itself re-measured it as marginally live this run.

### ★ SETTLED: mwcc 1.1 NEVER contracts into `fmadds`

Probe-proven at the project's exact flags — **not even the two-term case**
(`a*b+c` → `fmuls; fadds`). **Therefore every `fmadds`/`fnmsubs` in the original
game came from an inline-`asm` block, and any residual whose expected output
contains one CANNOT be closed by rewriting C.** This is the general form of the
`mathutil.h` note and explains why that note is true. mini_fight used a
file-local `static inline` holding `asm` to take `lbl_00006F44` (316) from **146
in 69 to 9 in 2**. Supporting: **mwcc allocates `register float` in REVERSE
declaration order** (last declared gets `f0`); passing the **struct pointer**
(not `&s->member`) addresses off the base with a displacement.

### ★ A STRUCTURAL RETIREMENT: 2,303 insn in sel_ngc are DEAD, not blocked

**Run 12's magic-economy model — sel_ngc's own — assigned each blocked function
to exactly one magic. It is wrong for three, which load BOTH:** `lbl_00010438`
(958), `lbl_0000ECB0` (694), `lbl_0000C970` (651). The two holes are 8 bytes each
**on opposite sides of `asm/sel_ngc_rel_d1.s`**, so no object can own both.
**Counted exactly, not inferred: there is not one `lbl_00011EC8@l+` spelling in
the module**, so every `lfd` against that label is the magic itself.
`lbl_00011728` (63) is dead for the mirror reason. **sel_ngc's entire live
surface is now 1,517 insn, all in `sel_ngc_rel_29.c`, all in place.**

### ★ DEMOTED — two rules this handoff put in run 13's brief as project-wide

1. **`int` ↔ `s32`: "if every diff is a register field, sweep local TYPES, not
   order" was measured INERT in FIVE of the six modules that tried it**, several
   on exactly that signature — mini_billiards 72 variants flat, **sel_ngc 432
   flat across two functions while declaration order was the whole lever**,
   mini_golf ~70 flat, test_mode 30 over 7 axes flat, option 24 flat, mini_fight
   18 flat. **It is real but narrow**: it matched mini_golf's `F290` (blocking a
   zero-trip loop fold — the documented mechanism) and mini_race's `568C` (`s16`
   induction variable strength-reduced into a walking pointer). **Sweep it
   cheaply; do not build a plan on it.**
2. **The REGION-COUNT tell FAILED.** On mini_bowling's `5B0C` the aligned metric
   ranked **18 in 7** above **32 in 9** — and **the 32 had the correct schedule
   while also having MORE regions.** Both proximity heuristics pointed the wrong
   way on the same case. **`rel_pcmp`'s new `PCMP_REGBLIND` is the reliable
   discriminator** (below).

### RETRACTED BY THEIR OWN AUTHORS

- **test_mode's run-12 idiom 4** — "repeating a full global expression beats a
  named pointer local" — **false as stated**: on `AEDC` the no-local family
  scored **41-57 against the local's 3**. **The real rule is WHICH USE SITE is
  spelled inline**: `B57C` matched with the *last* of three uses inline and the
  first two through the local (all-local 10, all-inline 17, **mixed MATCH**).
- **mini_fight's "the pragma restores `addi rD,rS,0`"** — `mr` vs
  `addi rD,rS,0` for parameter homing flips on an unrelated axis (adding a
  bare-symbol-address local), with the pragma making **no difference at all**.
- **option's run-12 idiom 11** (block-scoped `base+K` pointer local) — it was
  flagged in the brief as prove-or-retract, **never got a golden build,
  retracted.**
- **mini_billiards: `lbl_00020B58` IS a literal pool.** Run 12 said it was a real
  global and said not to build that merge. Its bytes are `100.0f / FLT_EPSILON /
  0.0 / 0.0f / 1.0 / 2.0`; written as source literals `lbl_000186EC` goes 8 in 5
  → **7 in 7 with every FP register correct**, all residual diffs `.rodata`
  offsets. **Run 10's structural theory was right.** *(Bounded: does not
  generalise — `lbl_000189B4` got worse.)*
- **`lbl_0000A098` IS UN-RETIRED.** On the do-not-restart list since run 9;
  mini_pilot found run 11's draft **reproduces at 13 in 10.** *A retirement with
  a working 13-aligned draft behind it is not a retirement.* **Retiring on
  exhaustion has now failed five times; on positive evidence, twice.**

### RANK AND MATERIALISATION — the most productive family this run

1. **mwcc ranks callee-saved locals by STATIC USE COUNT, with declaration order
   only as the TIE-BREAK** (sel_ngc: k(12)=r30 > tbl(8)=r29 > sel(2)=r28).
   **This predicts when declaration order will and will not move.**
2. **A named pointer local initialised IN ITS DECLARATION is hoisted to the
   prologue; declared uninitialised and assigned as a STATEMENT it materialises
   where you put it — and both rank differently from the same expression left
   inline.** Three outcomes from one CSE: **22 / 19 / 11.** (sel_ngc)
3. **First-declared local gets the LOWER callee-saved register** and the *higher*
   stack address; **stack locals are laid out last-declared-lowest** (mini_pilot
   77 → 2; mini_fight fixed ~40 displacements at once).
4. **Chaining a store through an otherwise-dead FRESH local re-ranks a hoisted
   literal against a pointer temp** — `*(int *)(w+0x5A8) = z = 0;` removed all 13
   diffs. **Naming an EXISTING pad instead costs that pad its stack slot.**
   (test_mode)
5. **mwcc emits a single `addi rD,rHA,sym@l` only for an expression whose value
   is EXACTLY a symbol's address**, canonicalising `(u8*)G`, `G+0`, `&G[0]`,
   `&Gobj.member@0` — **and gives every such expression top register weight,
   above every user local.** Any non-zero-offset spelling keeps its rank but
   always costs a second `addi`. **Run-11 idiom 3's `&Gobj.member` escape does
   NOT work at member offset 0.** *(Not unconditional — a matched sibling has a
   bare `u8 *k = lbl_X;` in r29 while the parameter takes r31.)* (mini_fight)

### OTHER NEW IDIOMS, all golden-build-proven

6. **`((T *)(base + K))[i]` folds `+K` into the induction base AND can repair an
   unrelated prologue coalescing failure** — sel_ngc, raw 90 → raw 14, worth 76
   aligned; `*(T *)(base + K + i*4)` does neither.
7. **An 8-byte struct assignment BLOCK-COPIES** (`lwz;lwz;stw;stw`); two
   `*(s32 *)` stores give `lwz;stw;lwz;stw`; **`memcpy(...,8)` emits an
   out-of-line `bl memcpy`.** (mini_pilot)
8. **`volatile` on the SOURCE of a small aggregate copy defeats mwcc's fold** and
   reproduces the `src → stack temp → dst` double copy. **Bounded: does NOT
   change scheduling.** (mini_race)
9. **Binding a local aggregate's address to a named pointer local flips
   argument-setup order at a call** — **the converse of idiom 4 above**, which is
   about a *global*. For the address of a **local aggregate passed as an
   argument**, the pointer local is **required**. (mini_race, ×2)
10. **An unused `struct Sprite *` PARAMETER is visible in the frame** — mwcc
    reserves its home at `8(r1)`, so every stack displacement shifts by 4.
    **Nothing in the body can produce this; only the caller reveals it.**
    (mini_pilot)
11. **The parameter save area at `r1+8` is `nparams*4` off the DECLARED count,
    dead params included** — one function needed **four** params (three dead).
    (mini_race)
12. **`(u32)f(...) == 0` gives `cmplwi`; both `f(...) == 0` and `!f(...)` give
    `cmpwi`** — **`!x` is NOT an unsigned zero-test.** (mini_race)
13. **A `min` as a ternary is not interchangeable with the `if` form** —
    `v = (v<3)?v:3;` MATCHed where both `if` forms scored raw 55. (option)
14. **`(lbl_X+0xNN)@ha/@l` is accepted by mwcc's inline assembler and is
    byte-identical** (gated GOLDEN twice). **This removes `rel_carve`'s "only ONE
    carved label can be a zero-size alias" restriction.** (mini_golf)
15. **A loop-invariant expression over a global must be hoisted IN THE SOURCE** —
    mwcc will not hoist a global load across a call it cannot prove pure.
16. **An `asm` stub can be given a parameter list with ZERO codegen effect** —
    needed because `rel_merge_tu` correctly reconciles a caller's richer
    prototype down to the `void` of the definition it absorbs. (sel_ngc)

### ★ UNRESOLVED, and the best clean cross-module probe for run 14

**Declaring a REL data label as its REAL TYPE.** mini_bowling: `extern struct
BowlScore lbl_X[];` + `sym[i].f` instead of `extern u8 lbl_X[];` + cast **changed
the whole prologue schedule** (regblind 7 in 6 → **2 in 2**), with the **indexing
spelling inert** and the **declared type live** — controlled both directions.
mini_race measured the **opposite**: retyping was inert, and dropping a walking
pointer for a **bare subscript** was the lever. **Both have measurements.**
**Every module carries a block of `extern u8 lbl_XXXXXXXX[];` and this has never
been swept.** *(mwcc 1.1 rejects `struct X;` then `struct X {...}` — a retyped
extern needing a tag needs the FULL definition ahead of it.)*

### TOOLS — promoted at `afc61ed`

**`rel_merge_back.py`'s warm-asm glob was `<stem>.s` + `<stem>_d*.s`**, so
mini_golf's hand-written `asm/mini_golf_pool_tail.s` — **the first asm segment
here not named `_d<N>`** — was dropped while `replace_sources()` still wrote it
into SOURCES. Widened to `<stem>_*.s` on both the copy and the stale-delete pass.

Harvested (`rel_merge_back` does not carry `tools/`, so this is deliberate):

- **`rel_pcmp.py`** — ~1.3 s compile-only scorer, `rel_ascore`'s exact metric,
  **plus `PCMP_REGBLIND=g|f|gf`, which masks volatile GPR/FPR NUMBERS and
  separates "wrong schedule" from "right schedule, wrong numbering".** *regblind
  0 in 0 → sweep ranks/types; regblind == aligned → structural, do NOT spend a
  type sweep.* **Three bugs fixed vs its run-12 form** — named-symbol relocations
  were unmasked (an inherited draft scored **94 in 82** against a true 18 in 7),
  `bdnz` targets masked on one side only, module hard-coded. **Run 12's
  "validated to the digit" held only for probes whose relocations were all
  `lbl_`.**
- **`rel_pdiff.py`**, **`rel_findconv.py`** (regex over all nine modules' asm
  reporting whether each hit is already converted, 0.6 s), **`rel_findwin.py`**
  (two regexes over consecutive instructions with `\1` back-references),
  **`rel_cmporder.py`** (the 414-cell experiment), **`rel_restore_asm.py`**.
- **`tools/rel_probe_preamble.h` is mini_bowling's — REGENERATE PER MODULE.**
- `findfold.py`/`findrank.py` **not** promoted (each hard-codes one query;
  `findwin` subsumes `findfold`). **`findrank`'s corpus — 91 hits, 55 already
  converted — is still unharvested.**

### ★ DESTRUCTIVE HAZARDS FOUND BY HITTING THEM

- **`git show HEAD:src/x.c > src/x.c` SILENTLY TRUNCATES THE FILE TO ZERO** when
  the path is not in the warm copy's stale HEAD — **the redirect creates the file
  before git fails.** Destroyed two mini_fight files. The old brief called this
  "not a safe restore"; **it is a destructive one.**
- **`REL_FLAGS := -sdata 0 -sdata2 0` is a `%.plf` TARGET-SPECIFIC variable.**
  Building `src/x.c.o` directly omits it and puts FP scalar literals in
  **`.sdata2` instead of `.rodata`** — mini_golf briefly concluded mwcc was not
  emitting a pool. **Any `.o` inspection must go through `make mkbe.<mod>.plf`.**
- **A `*/` inside a draft's own header comment kills the file.** Two modules
  independently lost a run-12 draft to a comment containing `u8*/Vec*`; it
  surfaces as a cascade from inside `dolphin/mtx.h` or `types.h`. **Third
  consecutive run a stored draft failed to rebuild.**
- **`rel_sweep` prints MATCH FIRST and FAIL LAST** — `head -N` and `tail -N` each
  hide one. mini_race nearly missed two matches.
- **The `python - <<'PYEOF'` heredoc trap is still live** — three modules hit it
  again, each losing a full 2-minute timeout.
- **An mtime-based tamper check on a warm copy produces a FALSE POSITIVE** — the
  uniform recent mtimes are the file-sync. **Verify by `cmp` against the main
  tree, not `git status`.**

### NEW DEAD AXES

The extern-declaration *shape* (object-vs-array, `&` vs decay, sized array,
`int[]`/`Vec[]`/`float[]` — 10 spellings inert, test_mode); all 6 commutative
`fadds` operand orders on mini_bowling's `EDB0`; 96 declaration orders on
mini_golf's `22D4C`; 120 on option's coalesced web (**falsifying option's own
run-11 idiom 6**); `(rep & 7) == 0` vs `!(rep & 7)`.

### NEXT RUN — ranked

1. **Apply option's TU-magic finding to every module.** Re-derive a-BLOCKED
   yourself; the census over-reports. The class is **59 fns / 12,471 insn in
   mini_fight alone**, 44/6,670 in mini_race, 24/5,116 in mini_pilot, 18/4,457 in
   test_mode, 16/4,515 in mini_bowling.
2. **option's 2,445 magic-free instructions inside `option_30.c` need only
   drafting** — `48F4`(368), `6C54`(719), `8C40`(391), `9454`(393), `9C3C`(574),
   all call-heavy and branch-light, the cheapest kind. **Biggest ready block in
   the project.**
3. **mini_billiards' five merge-unblocked functions — `E3A4`(331), `D7E8`(751),
   `1968C`(564), `1B880`(651), `1A18C`(1469) = 3,766 insn, none ever
   attempted.** Start at `E3A4`: smallest and `static`.
4. **sel_ngc's live surface is 1,517 insn, all in one file, zero setup** —
   `E778`(279, **at 11 in 8**), `B920`(370), `BEE8`(396), `B1C0`(472).
5. **test_mode: `AEDC`(290) at 2 in 2 span 8-10** (one adjacent prologue swap),
   then `E628`(419, try the explicit-CSE local at region 135), `D084`(207),
   `DF28`(230, never re-swept).
6. **mini_fight: `6F44`(316) at 9 in 2**, `4D14`(438) at 3 in 2, and
   `1199C`(484) — **the one function in the module with `fmadds` in its expected
   output**, now understood. Its carve `lbl_0001C348` is **listed and unblocked**
   (`--from 11cbf20`, 120 bytes, one carve gets `10030`+`101C8`).
7. **mini_race left 1,281 insn of single-function pure files it never started** —
   `21C8`(182), `19AC`(209), `85D8`(270), `A68`(273), `118C`(347). **Its carve
   state has still never been examined.**
8. **mini_bowling's `5B0C`(720) is at 3 in 2 with 717/720 byte-exact** and
   `EDB0`(153) at regblind **0 in 0** (pure FPR numbering — sweep ranks).
   **`C1D0`(566) is regblind-unchanged: structural, do NOT type-sweep it.**
9. **mini_golf `F7E8`(140) at 2 in 1**; `FBC8`(70) is **provably not
   source-reachable as its own TU** — it needs to be in the **same TU as F290**,
   i.e. the `_41`..`_45` merge, which is cheap now.
10. **mini_pilot: the `0xC6D8` carve + `50b/50c/50d/50e` merge (+733)** and
    **ownership reassignment** (`0xBEE0` +479, `0xC3C0` +380, `0xC2F0` +232),
    still untried. `A098`(385) is un-retired at 13 in 10.

### RUN-14 PREP IS DONE

- **`C:/tmp/smbm/warm_reset_run14.sh` written and RUN.** All nine warm copies
  file-synced from the main tree at `c548f1a`, **all nine gate GOLDEN from
  DELETED objects, `fail=0`.** It now also copies `tools/*.h` — a `*.py`-only
  copy would have silently left the warm copies without
  `rel_probe_preamble.h`.
- **`C:/tmp/smbm/RUN14_BRIEF.md` written — hand it to every module agent.** It
  **leads with the TU-magic finding**, not the pragma, because that is now the
  cheapest large lever in the project. It carries the settled compare-order rule,
  the `fmadds` result, `PCMP_REGBLIND` as the residual classifier, the demotion
  of `int`/`s32` and the region-count tell, the six destructive hazards, and the
  unresolved retyped-extern probe.
- **`C:/tmp/smbm/RUN13_RESULTS.md`** holds all nine per-module reports.
- **ONE AGENT PER MODULE, NO WORKERS** remains the standing rule, restated in
  the brief's §11 — **its first run produced zero stranding and zero lost work.**

---

## 0.18 — RUN 12 DONE (2026-07-31): +6,845 insn, 24.56% -> 28.16%. Superseded by §0.19.

Nine parallel agents, one per module. Six gained, **three converted nothing** —
and two of those three produced corrections worth more than their instructions.

| module | still-asm | insn | % | gained |
|---|---|---|---|---|
| **mini_bowling** | 27 fns | 8297/15313 | **54.18%** | +704 / +4 |
| mini_pilot | 30 fns | 5626/12137 | 46.35% | **0** |
| **test_mode** | 39 fns | 6647/16231 | **40.95%** | **+1,792 / +6** |
| mini_race | 84 fns | 7395/19817 | 37.32% | +680 / +7 |
| sel_ngc | 17 fns | 5017/18084 | 27.74% | +719 / +5 |
| **mini_fight** | 86 fns | 6590/28588 | 23.05% | **+2,035 / +27** |
| option | 25 fns | 2573/12375 | 20.79% | **0** |
| mini_golf | 29 fns | 6614/38919 | 17.00% | +915 / +2 |
| mini_billiards | 32 fns | 4818/28793 | 16.73% | **0** |
| **TOTAL** | **369 fns** | **53577/190257** | **28.16%** | **+6,845 / +51** |

**Verified**: all six changed modules re-merged and rebuilt GOLDEN **in the main
tree** at the exact sha1 each agent reported; all nine pass `rel_structcheck`
here; a clean build from deleted objects/`.dol`/`.elf` gives **1,280 objects and
`sha1sum -c supermonkeyball.sha1` = all 12 OK**, `.dol` at
`424e8ce10135686de0709a147e6a3a5a3fda02f1`. Diff scanned for game binaries
first — clean; **81 files: 80 `.c`, 1 Makefile**. Committed at `80afa9b`, tools
at `35b13b6`.

> **§0.17's mini_golf row is arithmetically wrong** — it carries denominator
> **33,220** while its percentage was computed against **38,919**. 38,919 is the
> figure consistent with the project total of 190,257 *and* with the module's own
> census (32,305 remaining + 6,614 converted). The table above uses 38,919, which
> is why mini_golf reads 17.15% -> 17.00% rather than the "14.64%" run 11 claimed.

### ★ THE BIG LESSON: the mixed-TU deopt is POSITIONAL, and it is ONLY the peephole

**Four modules confirmed this independently, each with a golden build.** §3's
"Presence, not amount" is wrong on both halves.

| arrangement | result |
|---|---|
| C function alone (pure TU) | reference |
| `asm` block **then** the C function | **DIFFERS** |
| C function **then** the `asm` block | **BYTE-IDENTICAL** |
| `asm` block, **`#pragma peephole on`**, then the C function | **BYTE-IDENTICAL** |

`#pragma scheduling on`, `optimization_level` and `global_optimizer` add nothing.
**The scheduler is not involved at all** — the inline assembler disables the
**peephole optimizer** for the **remainder of the TU only**.

- **sel_ngc**: run 11's deep merge came back NOT GOLDEN with **318 banked
  instructions broken**. It **now gates GOLDEN with no C edit whatsoever** — only
  the pragma. `lbl_0000D39C` (was 12 in 8), `D5A8` (34 in 16), `DDF4` (14 in 8)
  all restored. **That is where its +719 came from.**
- **mini_race**: four-way `rel_probe` on a function it matched byte-exactly.
  `asm`-then-C is **104 insn** where pure is 103. Plus a free corroboration —
  the module's only mixed TU **has matched since run 8 precisely because it
  defines its C before the asm block.**
- **mini_fight**: controlled A/B, no pragma **11 in 7**, pragma **MATCH**. It
  restores *both* `addi rD,rS,0` and the prologue interleave of the `lis`.
- Probes: `_scratch_sel_ngc/run12/probe_order.py`, `probe_pragma{,2}.py`;
  `addpeep.py` inserts them idempotently.

**Consequences: `rel_isolate`, `rel_purify` and much of the splitting apparatus
are largely unnecessary.** The project spent several runs building and debugging
those tools — including **four separate file-destroying bugs** — to achieve by
file surgery what one line achieves in place. **Every §3 symptom (unfolded `@l`,
return folding, `addi`→`mr`, `extsh.`→`cmpwi`) is one mechanism.**

### ★ SECOND PROJECT-WIDE AXIS: `int` and `s32` are DIFFERENT TYPES to mwcc 1.1

`s32`/`u32` are `signed`/`unsigned long`; `int` is `int`. **Three independent
confirmations, each golden-built:**

- **test_mode**: one declaration `int d` → `s32 d`, nothing else, **1 aligned →
  MATCH**. The original's `else` arm recomputes `x - 10` instead of copying the
  `addic.` temp; with `int` mwcc copy-propagates, with `s32` the implicit
  int→long conversion **blocks it**.
- **mini_bowling** (w3): a literal-bounded loop **keeps** its zero-trip entry test
  with an `s32`/`long` counter and **folds it away** with `int`. **20 → MATCH on a
  323-insn function.** Only the inner counter matters.
- **mini_race**: a narrow local's *type* flipped a **five-register** permutation,
  30 diffs → MATCH, **instruction sequence byte-identical either way**.
  Declaration order was NOT the lever (7 orders flat).

**The project uses `s32` and `int` interchangeably today. This has never been
swept.** Rule: *if every diff is a register field, sweep local TYPES, not order.*

### INHERITED CLAIMS FALSIFIED — every module that re-measured found error

1. **mini_race has NOTHING TO PURIFY.** Its assignment (mine, relayed from §0.17)
   was "50 of its reachable functions are b-POOL, so purification is its
   highest-volume lever". It mapped every reachable function to its owner:
   **zero reachable instructions sit in a mixed TU**; all 44 reachable owners are
   all-asm files, 26 already single-function. **Run 11's "purification alone"
   matches were single-function ISOLATIONS, not C↔asm splits.**
2. **test_mode's pointer-local ceiling is real but its PRESCRIPTION IS
   BACKWARDS.** Run 11 said `u8 *base = lbl_XXXX;` is a ceiling needing a `.bss`
   carve. Measured: pointer local **31**, `u8 *const` 31, `int *` 31, loads on the
   bare global **68**, stores on it **140**, everything on it **196**. And w1
   showed the ceiling **was never the blocker** on `lbl_000057C0` — its residual
   was a volatile-rank tie an explicit `s16 rep` local fixed. **No `.bss` carve is
   justified.**
3. **A POSITIVE-EVIDENCE RETIREMENT WAS WRONG.** mini_fight matched
   `lbl_0000E458` — retired across runs 5-7 after ~110 formulations — **in 26
   builds**, by sweeping declaration order (24→10→9→2→MATCH). **§8's "retiring on
   positive evidence keeps holding" now has a counter-example.** Closing byte:
   `&w->rec[n]` builds the offset in a *fresh* register; `(struct FightRec *)((u8
   *)w + 0x8A8) + n` builds it in the destination's own register.
4. **option's own run-10 idiom 6 fails** — "a coalesced web's callee-saved rank is
   set by its LAST-declared member" is byte-identical across **all 120
   declaration permutations**.
5. **`lbl_00004D14`'s run-11 diagnosis is wrong.** `lbl_0001C068` is a real symbol
   reachable in one `addi`; the blocker is that a **bare, never-modified symbol
   address is promoted above every user local (r31)** while the original has it at
   declaration rank r29. `volatile` and `const` do **not** defeat it; only
   arithmetic does, at 2 extra instructions.
6. **Declaration order is function-dependent, not general** — inert on four
   test_mode functions, 588 permutations flat in mini_billiards, 12 permutations
   flat in sel_ngc's `E778` **while the same TU's `D82C` went 56 in 38 → 6 in 1
   on that exact axis.**

**Three modules found a stored run-11 draft that does not compile or does not
reproduce its recorded score** (`mini_billiards lbl_000186EC` "8 in 5",
`mini_fight lbl_00017230` "9 in 8" — all six drafts fail to compile —
`test_mode lbl_000057C0` "7 in 4"). **A recorded figure with no working draft
behind it is not a measurement.**

### ★ CENSUS CORRECTION: `b-POOL` is a LOWER BOUND, not a classification

Two modules independently, both with builds:

- **mini_golf**: `lbl_0000F290` is **mis-classified — it needs a `.rodata`
  carve** of `lbl_000264A8+0x00..0x34`. General, cheap diagnostic: **mwcc gives a
  CSE'd pointer-load the HIGHEST FP temp and a source-level float literal the
  LOWEST**, so an FP-temp rotation with correct load order means *this function
  owns that `.rodata`*. **`lbl_0000FBC8`'s four-run-old residual is that exact
  rotation on that exact pool.**
- **mini_fight**: `lbl_00010030` + `lbl_000101C8` (257 insn) assign **whole-struct
  constants** (`(Vec){0,0,0}`, `(Quaternion){0,0,0,1}`) that mwcc copies
  pool→stack→dest. Every external-read spelling gets the frame wrong; the compound
  literal restores it and **emits 28 bytes of `.rodata`** (objdump-verified). Both
  want `lbl_0001C348` — **one carve gets both.**

Also: **mini_billiards' target was the wrong frame entirely.** `d1`/`d2`/`d3`
carry **zero `.text`**, so `_15`↔`_16`, `_34`↔`_35`, `_52`↔`_55` are text-adjacent:
**8 functions / 5,672 insn need a MERGE, not a carve** — shallowest
**`_55.c`→`_52.c` = 2,120 insn** and **`_35.c`→`_34.c` = 1,082 insn, no carve
either.** `lbl_00000800`(410) is not carve-reachable at all; `lbl_0001CC88` is in
`.rodata` (not `.data`) but has no sole consumer. **Combined with the pragma, this
is the cheapest large block in the project.**

And **sel_ngc's magic economy is split by SIGN**: signed `@0x11D00` owned by
`_29.c` (13 users), unsigned `@0x11EC8` owned by `_52.c` (5 users).
`lbl_00011BC0` is **permanently dead**. That is the correct reason `C970`(651)
and `10438`(958) are blocked — cleaner than run 11's incidental "0x1C8 apart".

### `rel_bctr` OVERCOUNTS — and the rule that settles a `bctr` row

**option proved the tool's "10 hidden functions" are the ten ARMS of one jump
table** inside a single 33-instruction function. mini_fight then gave the
discriminator and verified every boundary by reading:

> **A switch arm must lie INSIDE the body of the function holding its `bctr`.**

mini_fight: **all 23 of its non-`bctr` sub-functions lie outside every `bctr`
extent — zero arms**; correct answer **21 reachable / 1,749** (2 are a-BLOCKED).
Run 11's headline "31 / 2,733" was **start-of-run-11, before its own splits, and
is not comparable.** Script: `_scratch_mini_fight/run12/bctr_extent.py`.

### TOOLS — five defects found by hitting them, all fixed at `35b13b6`

- **`rel_sweep.py` and `rel_probe.py` defaulted `--tree` to
  `C:/tmp/smbm/<module>` REGARDLESS OF CWD**, so a worker running the brief's own
  command line built, **installed variants into**, and `--gate`d its **PARENT's**
  tree. Reported independently by **mini_pilot, mini_bowling and mini_fight's w1
  and w2**. Both now resolve from the tool's own location, as `rel_ascore`
  already did. Verified: `rel_sweep option --gate` from the main tree now deletes
  68 **main-tree** objects.
- **`rel_probe.py`'s probe object was a fixed `<tmp>/rel_probe.o`** — two agents
  on one module raced on one file and could each score the other's compile. **A
  new fictional-match mode.** Now per-pid.
- **`rel_bctr.py`'s a-BLOCKED detection was DEAD CODE** — it searched the ARGS
  field (`x[3]`) for an opcode that lives in `x[2]`. **That is exactly why it
  over-reported mini_fight by 2 functions / 305 insn.** Fixed; it now reproduces
  the hand-verified 21 / 1,749 to the instruction.
- **`rel_split.py` emitted a bare `extern void %s();`**, so **59 of 61
  mini_billiards files carry `extern void sqrt();`** and any conversion calling
  `sqrt` dies with *"cannot convert 'void' to 'double'"* — **why one stored draft
  has never compiled in any run.** Now uses real prototypes for the known
  libc/libm set. New splits only; no existing object changes.
- **`rel_isolate.py` overwrote existing letter-suffixed siblings** (mini_fight's
  w4 lost `18bb.c`/`18bc.c`). **THE FOURTH TOOL HERE TO SHIP
  INVENT-A-FILENAME-AND-CLOBBER**, after `isolate.py`, `rel_rematch` and both
  agents' `rel_purify` — every one exiting 0 with a clean, non-golden build. Now
  picks free suffixes and refuses when there are too few.
- **`rel_sweep.py` died on a non-ASCII variant FILENAME** (cp1252
  `UnicodeEncodeError` out of a progress print), throwing away a 700-variant
  sweep. `errors='replace'` now. **The report that its restore "never runs" is
  WRONG** — it is in a `try/finally` and does run on a normal exception; the real
  exposure is a **killed** process, which skips `finally`.

**`rel_merge_tu.py` IS FIXED in sel_ngc's tree and NOT YET HARVESTED** —
`_scratch_sel_ngc/run12/rel_merge_tu.patch`. Head union (keeps whichever
declaration *says more*) + prototype reconciliation; it reproduced automatically
every fix run 11 made by hand. **`rel_merge_back` does not carry `tools/`, so
this must be harvested deliberately.**

**Still open:** `rel_carve.py --list --from <pre-carve-rev>` **WORKS** (option
proved it; the "no way to test a second carve" blocker is gone) but the carve
**operation** also needs `--from`, which is undocumented; **no pre-carve revision
is recorded for mini_fight at all**. Known pre-carve revs: mini_pilot/mini_bowling
`11cbf20`, sel_ngc `d32e854`, mini_golf `36fe55d`, **option `56859b0`**.

**Worth promoting** (unharvested): mini_bowling's `pcmp.py` (scores compile-only
probes with `rel_ascore`'s exact metric in ~1.3 s, validated to the digit) and
`findfold/findrank/findconv.py` (**pattern-shaped cross-reference across all nine
modules' asm, reporting whether each hit is already converted** — `rel_xref` is
marked EXHAUSTED in three modules; **pattern cross-reference is not**);
test_mode's `restore_asm.py` (**reverts body AND head prototype** — mini_race hit
the same gap independently: `rel_genvar` handles the forward direction and
nothing handles the reverse).

### CRLF IS NOT A CORRECTNESS HAZARD — stop hand-normalising

The clean build that produced **all 12 correct hashes** ran against a working
tree containing **89 bare-LF files**. `core.autocrlf=true` + `* text=auto` means
git normalises on both sides and `git status` is clean. **Line endings
demonstrably do not affect mwcc's output.** Three agents reported LF-writing
tools as bugs this run and two spent time hand-normalising in run 11. It is
cosmetic.

### PROCESS

**The 20-agent concurrency cap is a real constraint.** With nine module agents
live, **at most 11 workers exist project-wide.** mini_pilot lost both spawns,
mini_race lost all four, mini_golf lost two, mini_fight lost w3 three times —
**and w3's targets (`6F44` 316, `6A40` 321, `1199C` 484) went untouched as a
direct result.** Either launch fewer module agents or tell them workers may fail
and they need a solo plan.

**Run 11's stranding failure was not repeated, and its mirror image was caught.**
mini_bowling, test_mode and mini_fight all had every worker close first with an
explicit disposition, and all re-verified integrated work **in the parent's
tree**. mini_fight caught the inverse hazard: **w4's tree was cloned before the
parent converted two functions, so copying wholesale would have silently lost 10
insn** — it re-applied them into the files w4's split had moved them to, and
merged SOURCES lines rather than copying either Makefile. mini_billiards stopped
believing a worker was outstanding; re-engaging it confirmed near-miss-and-
reverted with nothing stranded.

### NEW IDIOMS — ranked, all proven by a golden build

1. **`#pragma peephole on` after an `asm` block fully restores mwcc 1.1 codegen**
   (above). Highest-value item in several runs.
2. **`int` vs `s32` flips copy-propagation, zero-trip loop tests and whole
   register permutations** (above).
3. **THE ARRAY-INDEXING FAMILY IS ABOUT WHERE THE CONSTANT SITS.** Four modules
   refined run-11 idiom 1 in one run: mini_bowling — `((T *)(base + K))[idx]`,
   constant on the byte POINTER and index as SUBSCRIPT, is the only form that
   folds a block-copy's first cursor off the PRE-rebase base *and* keeps the
   rebase (**worth 250 insn after three runs stuck at 2-in-2 over ~99
   spellings**); mini_pilot — **parenthesising the byte offset** flips the `add`
   operand order (`*(s16*)((u8*)T + (i*6 + 2))` → `add r3,r3,r0`); sel_ngc — an
   **inline cast expression, not a pointer local** (`((struct S *)SYM)[i].x`), and
   a named `struct S *tbl` costs `lfsx` *and* a frame slot; option — **all forms
   are byte-identical when there is no extra constant offset.** And sel_ngc found
   the **opposite** answer 12 KB away, where a pointer local was *required* to
   fold `+0x440` into an induction base.
4. **Repeating a full global expression beats a named pointer local** — 4 uses of
   `(*(struct T **)lbl_X)->sel` MATCHed first try; the pointer-local form scores
   20 and a field hoist 14. **This is the house style of already-matched files.**
   (test_mode)
5. **Deleting a named pointer local flips which module-global base is materialised
   first.** Rank follows *declaration* order, materialisation follows *first-use*
   order, and **they cannot be decoupled by reordering assignments.**
   (mini_bowling)
6. **`(v & 0xFF) * 256` vs `<< 8` fold to the same `rlwinm` but give opposite
   operand order in a following commutative `or`** — extends run-11 idiom 11 to a
   **consumer** of the shifted value. (sel_ngc)
7. **An assignment inside an argument list flips volatile-FP temp allocation** —
   `f(a, ty = expr)` matched where `ty = expr;` first sat at 6 in 1 across 10
   variants. (sel_ngc) **And** assigning a pointer local inside argument 1 of a
   call whose argument 2 is a call materialises the address after the `bl` while
   keeping declaration rank (8 → 2). (mini_golf)
8. **A bare array subscript on a retyped file-local `extern` folds `@l` into the
   `addi`; the `(T *)` cast form spends a copy** — worth 103 insn, but **live in
   both directions** (the bare form was *worse* elsewhere, emitting a per-use
   `lis/addi`). (mini_race)
9. **Comparing a pointer against a NULL-valued pointer LOCAL reproduces
   `li r0,0; cmplw`** where `p == NULL` gives `cmplwi` — raw 97 → raw 2.
   (mini_race)
10. **Making an implicit CSE explicit as its own local re-ranks it in the
    allocator** — 32 → 14 aligned. (mini_billiards)
11. **Block-scoping a `base+K` pointer local produces mwcc's short-lived
    `addi rD,base,K` address temps** and removed *every* scalar frame slot
    (0x80 → 0x58); **split declaration/assignment decouples rank from evaluation
    order** (rank follows declaration, arithmetic follows assignment). (option —
    **flagged: no golden build, nothing matched**)
12. **If/else ARM ORDER is visible and is a lever** — both conditions negated so
    the `else` body becomes the fallthrough. (mini_race)
13. **`subfc` + `subfze rD,-1` is mwcc's carry-materialisation of an unsigned
    relational used as a VALUE**; mwcc constant-folds `c >= 0` but not `c >= z`.
    (mini_golf)
14. **`rel_sweep`'s REGION COUNT is the tell the aligned score is not — every
    wrong-shape winner this run had MORE regions than the correct one.**
    (mini_golf)

**NEW DEAD AXES:** 21 spellings of 7 parenthesisations × 2 `fadd` operand orders ×
2 pool-read conventions (mini_golf); 25 control-flow spellings of a short-circuit
guard all produce the identical merged branch (mini_race); narrowing `(s8)`/`(s16)`
casts on stores, module-wide, and `if (A && B)` vs nested ifs (mini_fight);
`(rep & 7) == 0` vs `!(rep & 7)` (mini_billiards); `btn` type and position, `u8 *`
vs `s32 *`, 8 `flg` rank slots (option).

**STRUCK / BOUNDED:**
- **`initialised declarations vs later assignment` is NOT "much worse"** — option
  measured the split form strictly *better* (24 → 20), test_mode measured it
  **inert**. Re-scope it.
- **Compare operand order is unsettled in BOTH directions.** mini_golf: **integer
  order follows the SOURCE**, contradicting the inherited canonicalisation claim.
  mini_race: **float order is INERT** here. mini_fight: float order is **live on
  one compare and inert on another in the same function.** **This needs one clean
  cross-module probe, not nine sweeps.**
- **Run-11 idiom 2 bounded**: mwcc pins a volatile FPR for values with **real live
  ranges**, not plain copies — adding or removing an `f32` local was completely
  inert. (mini_billiards)
- **`mathutil_vec_dot_prod` is a `static inline` holding `asm` and is a hard
  scheduling barrier AT EACH INLINED CALL SITE.** §3 is right that it does not
  trigger the TU-wide deopt and **wrong that it is free.** (mini_bowling w2)

### RESOLVED BY THE ORCHESTRATOR — `func_8000716C`'s argument order stands

mini_bowling's w3 measured value-first at **18** and the committed pointer-first
at **20** and flagged the header as wrong. **Do not change it.** Settled:

- **The committed spelling is proven.** `float func_8000716C(float *out, float
  x)` is what run 12's clean build used, and that build produced **all 12 correct
  hashes.** Its three golden call sites are `mini_billiards_33b.c:323`, `:413`
  and `_33c.c:373`, all `func_8000716C(&ptr, value)`, plus the `asm` definition at
  `mathutil.c:210`. Flipping the header means editing all four.
- **Neither order is more correct at the ABI.** PPC EABI runs GPR and FPR
  argument sequences independently, so the pointer lands in `r3` and the float in
  `f1` either way — *the header comment already says this.* **The declared order
  therefore changes only the ORDER THE TWO ARGUMENT EXPRESSIONS ARE EVALUATED**,
  since mwcc evaluates call arguments left-to-right (run-11 idiom 5).
- **So w3's 2-diff delta is a per-call-site scheduling axis, not a header bug**,
  and it is reachable **without** touching the header — compute the operand you
  want first into a temp, or into the argument list, at that call site. *(This
  last step is reasoning from the ABI plus the committed comment, not a
  measurement; w3 had no match either way — 18 and 20 are both misses.)*

**A module that wants the other evaluation order should sweep the call site, not
report the header.**

Its sibling bug is still open: **`u_math_unk9_smth_w_quats(..., register float
c)` forces an `frsp` the original lacks** (probe, all four spellings); workaround
in `src/mini_billiards_33b.c`.

### NEXT RUN — ranked

1. **The pragma is a MERGE ENABLER, not a project-wide sweep — measured after the
   run.** `tools/rel_peephole.py --list-mixed` (promoted in run-13 prep) and
   `rel_structcheck`'s NOTE list **agree exactly: only 3 of 9 modules contain a
   mixed TU, 4 files total** — mini_fight `15c`/`15ej`, mini_race `115i`, sel_ngc
   `_29` (already pragma'd in run 12). **The other six have none.** The project
   spent several runs isolating to eliminate mixed TUs and it worked, so there is
   almost nothing to apply the pragma *to* in place.
   **Its value is that merging creates a mixed TU, and that was merging's whole
   cost.** Run 11 measured 3 of 4 absorbed functions broken, 318 insn at risk;
   sel_ngc's entire +719 was that same merge re-run with one line added.
   **Read every "too risky to merge" verdict in this file as now cheap.**
2. **mini_billiards' two merges — `_55`→`_52` (2,120 insn) and `_35`→`_34`
   (1,082) — need no carve at all** and the pragma removes their only risk.
   **3,202 instructions, and the module has converted nothing for two runs.**
3. **Sweep `int` ↔ `s32` on every near-miss whose residual is register fields.**
   Three modules matched functions of 86, 323 and 30-diff size on this axis alone.
4. **sel_ngc's in-place set is staged with ZERO setup** — `src/sel_ngc_rel_29.c`
   spans `.text 0xA950..0xEBD4` and owns the signed magic, so `E778`(279, at 22 in
   18), `B920`(370), `BEE8`(396), `B1C0`(472) are all reachable in place.
   Extending through `_51.c` adds `FE0C`(92), `FF7C`(144), `11330`(61).
5. **test_mode's three near-misses: `AEDC`(290) at 3 in 3 with a draft ready and
   ONE extra `addi rD,rS,0`; `6B98`(533) at 13 in 12, all one r6↔r7 swap;
   `E628`(419).**
6. **mini_fight: w3's three untouched targets (`6F44` 316, `6A40` 321, `1199C`
   484) — lost to the concurrency cap, not to difficulty** — then `4498`(543) and
   `4D14`(438) at 3 in 2 with the corrected diagnosis above.
7. **mini_race has ~2,200 insn of untouched single-function pure files needing no
   split** (`4BB0` `568C` `11658` `4910` `7A9C` `21C8` `19AC` `4D78` `85D8` `A68`
   `118C`), and **no carve work has ever been done there.**
8. **mini_golf `F7E8`(140) is at 2 in 1 with 138/140 byte-exact**; `F290`(304) and
   probably `FBC8`(70) are **carve candidates, not grinds** (see census
   correction). `E99C`(480) is **a-BLOCKED, not reachable** — four runs of the
   handoff calling it a target was wrong; it needs `lbl_000263B0` carved into
   `mini_golf_38.c`, costing `lbl_0000B8A8`(337).
9. **option's 762 genuinely-open instructions are 98.6% byte-exact in draft
   form** — `3240`(410) at 20 in 15, `077C`(217) at 4 in 4, `00360`(135) at 28 in
   14. **Unsettled: the handoff says hole `C4B0` is worth 0 because `lbl_00008068`
   is its sole solo-eligible owner, but `--list --from 56859b0` reports its first
   user as `lbl_00005340`(1,498).**
10. **mini_pilot: `lbl_0000A754`(390, b-POOL) has never been drafted in any run.**
    Its `lbl_0000C6D8` carve is **BUILT, not just legal** (7 `.text` instructions
    from golden; needs `--from 11cbf20` and all four holes on ONE command line),
    and **the carve is not single-use** — merging `50b/50c/50d/50e` emits one
    magic for three functions, **a +733 path**. Untried lever: **ownership
    reassignment** (`0xBEE0` +479, `0xC3C0` +380, `0xC2F0` +232). Only **733 of
    its 5,116 a-BLOCKED insn sit behind an uncarved magic.**

### RUN-13 PREP IS DONE — recorded here on purpose, not left in `/c/tmp`

- **`C:/tmp/smbm/warm_reset_run13.sh` written and RUN.** All nine warm copies
  file-synced from the main tree at `2836d09`, and **all nine gate GOLDEN from
  DELETED objects, `fail=0`.** Re-verified afterwards with the `.o`-excluded
  comparison: **`src/`, `asm/`, `tools/` and `Makefile` all 0 differences in
  every module, no stale `TOOLS_UPDATED.md`.**
- The script now **deletes the `.o`/`.dep` files that come across inside `src/`
  and `asm/`** from the main tree's own build. Run 12's script did the same but
  the reason was undocumented; a stale all-asm `.rel` hashes GOLDEN, which is the
  oldest fictional-match mode here.
- **`C:/tmp/smbm/RUN13_BRIEF.md` written — hand it to every module agent.** It
  **leads with `#pragma peephole on`**, not with the census, because that is the
  cheapest instruction in the project and it re-scores every inherited residual.
  It also carries: b-POOL is a lower bound; `rel_bctr` is a candidate list not a
  count; the region-count tell; the `int`/`s32` axis; the corrected §3; the
  20-agent cap and the worktree-clone hazard; and CRLF explicitly retired.
- **`C:/tmp/smbm/RUN12_RESULTS.md`** holds all nine per-module reports.
- **ONE AGENT PER MODULE, NO WORKERS — now a STANDING RULE**, promoted to the
  top-of-file section that run sections do not supersede, and restated in the
  brief's §11. It applies to every run from here, not just run 13.
- **Two tools promoted and pushed** (`bdf447c`): `rel_peephole.py` (from
  sel_ngc's `addpeep.py`, plus a read-only `--list-mixed`) and the
  `rel_merge_tu.py` fix — the latter unblocks three modules and is a
  prerequisite for run 13's biggest single item. **`rel_merge_tu`'s `--tree` had
  the same defaults-to-another-tree defect** as `rel_sweep`/`rel_probe`; fixed.
- **Still unharvested** (they survive in `_scratch_*`, which the reset does not
  touch, but are not in git): mini_bowling's `pcmp.py` and
  `findfold`/`findrank`/`findconv.py` pattern cross-reference, test_mode's
  `restore_asm.py`. **`rel_merge_back` does not carry `tools/`**, so anything an
  agent builds must be harvested deliberately.
- **All nine warm copies re-synced with the promoted tools; `tooldiffs=0`
  everywhere.** `src/`/`asm/` untouched since the gated reset, so no rebuild was
  needed.

---

## 0.17.5 — RUN-12 PREP (recorded retroactively)

**The run-11 session wrote `warm_reset_run12.sh` and `RUN12_BRIEF.md` and then
ended without recording either in this file**, so run 12's session had to
rediscover them from `/c/tmp/smbm` mtimes. Full record:
`C:/tmp/smbm/RUN12_PREP.md`. **Do not repeat that — write the prep section
before the session ends.**

What run 12's orchestrator verified before launching, rather than trusting the
brief's claim: content identity of `src/`, `asm/`, `Makefile` and `tools/` in all
nine warm copies (**0 differences**), absence of a stale `TOOLS_UPDATED.md`, and
`rel_sweep --gate` **GOLDEN in all nine.**

> **Trap for the next orchestrator:** a bare `diff -rq src /c/tmp/smbm/<m>/src`
> reports a difference for **every** module. That is not drift — the **main tree**
> carries `.o` files in `src/` and `asm/` from its own build while the reset
> deletes objects in the copies. **Exclude `*.o` and `*.dep`.**

---

## 0.17 — RUN 11 DONE (2026-07-30): +7,684 insn, 20.52% -> 24.56%. Superseded by §0.18.

Nine parallel agents, one per module. **The biggest run in the project's
history — 2.4x run 10**, and it came from modules acting on run 10's census
correction rather than from any new technique.

| module | still-asm | insn | % | gained |
|---|---|---|---|---|
| **mini_bowling** | 31 fns | 7593/15313 | **49.59%** | **+2,308 / +8 fns** |
| **mini_pilot** | 30 fns | 5626/12137 | **46.35%** | +853 / +6 |
| mini_race | 91 fns | 6715/19817 | 33.89% | +748 / **+17** |
| test_mode | 45 fns | 4855/16231 | 29.91% | +1,273 / +8 |
| sel_ngc | 22 fns | 4298/18084 | 23.77% | **0** |
| option | 25 fns | 2573/12375 | 20.79% | +496 / +2 |
| mini_billiards | 32 fns | 4818/28793 | 16.73% | +1,697 / +4 |
| mini_fight | 113 fns | 4555/28588 | 15.93% | +33 / +7 |
| mini_golf | 31 fns | 5699/33220 | 14.64% | +276 / +1 |
| **TOTAL** | **420 fns** | **46732/190257** | **24.56%** | **+7,684 / +51** |

**Verified**: all nine gate GOLDEN on merge; all nine pass `rel_structcheck` in
the main tree; a completely clean build from deleted objects/`.dol`/`.elf` gives
**1,264 objects and `sha1sum -c supermonkeyball.sha1` = all 12 OK**. Diff scanned
for game binaries first — clean; **106 files: 76 `.c`, 29 `.s`, 1 Makefile**.
Committed at `a3ac591`, tools at `61102e7`, header fix at `8f68f36`.

### THE BIG LESSON: the modules that acted on run 10's census won

**mini_bowling converted ZERO in run 10** and spent that run measuring. Its own
closing words named the never-attempted c-FREE/b-POOL set as where its volume
was — **6 of its 8 conversions came from exactly there, and it is now the
project's highest module at 49.59%.** mini_golf found the same thing
independently and put it sharper:

> **b-POOL functions bank instructions with no carve, no ordering constraint and
> no `.rodata` risk whatsoever** — and **1,635 insn of them sat untouched for
> four runs while three runs ground the carve.**

The corollary is uncomfortable and worth acting on: **the ranked target lists in
this handoff have been pointing at the expensive work.** mini_golf's #1 (the
carve-gated small functions) and sel_ngc's #1 (an `stmw`-class from-scratch
decompile) both under-produced; the modules that ignored the glamour target and
swept their reachable set produced 82% of the run.

### FOUR INHERITED "FACTS" FALSIFIED, each by a golden build

1. **"`(u32)x >= N` and `x >= NU` cannot produce `cmplwi` (project-wide)" is
   FALSE.** Falsified **independently by test_mode and by option — the very
   module that asserted it in run 10.** test_mode measured `cmplwi r0, 6` from
   `(u32)x > 6` and found golden `src/test_mode_49.c` **already shipping
   `if (v >= 0x18U)` against `cmplwi r0, 0x18`**; option's `lbl_000021D8` matches
   *only* with `(u32)++sel >= 3` and the bare `>= 3` spelling is the one
   remaining diff. **Struck from the dead-axis list.**
2. **"mwcc canonicalises the comparison direction" holds for INTEGERS ONLY.**
   **Float compare operand order is preserved** — three independent
   confirmations (mini_fight `k18 < e20` → `bge` vs `e20 > k18` → `ble`;
   mini_bowling's `B914` and `CAA8`).
3. **Run-10 idiom 3 is falsified.** A module-global address in a pointer local is
   hoisted to the top callee-saved register **only when it is a BARE symbol
   address**. `G + 8`, `&G[8]`, `&Gobj.member` leave the local at its declaration
   rank. And the promoted temp does **not** always take r31 — add a second
   address constant and the first drops to **r21, below every user local**.
4. **Run-10 idiom 2 ("mwcc's CSE temps outrank ALL user locals") INVERTED three
   times, in two modules** — mini_race twice (27 and 15 vs 11 and 12, the named
   local correct in both) and sel_ngc once (21 / raw 29, worse). **Demote it: it
   is now failing more often than it works.**

Also: **mini_bowling's array-of-structs form SUPERSEDES run-10 idiom 4** as the
general way to get `add rD, base, index` (see idioms below); **run 10's
structural theory for mini_billiards' `18xxx` group is falsified by direct
measurement** — substituting the exact IEEE values as literals scores *worse*
(28 in 10 vs the pool read's 16 in 3), so **`lbl_00020B58` is a real global, not
a literal pool — do not build that merge**; and **sel_ngc measured the deep
merge's price**: 3 of 4 newly-absorbed C functions break under the mixed-TU
deopt, **318 banked insn at risk**, so run 10's "zero already-C functions
deoptimised" holds for the **shallow** merge only.

### `rel_leafsplit.py` WORKED, AND LEAVES ARE REAL FUNCTIONS

Promoted before the run (`4735d82`) from run 10's unaudited `leafsplit.py`, with
the free-suffix fix and a refusal on group owner files. It reached the census's
`leaf?` column and **`bctr` rows, which `rel_ssplit` refuses outright.**

**Tally: test_mode 7/7 real, mini_race 2/2, mini_pilot 1/1, mini_fight's all
real — against mini_bowling's 0/6.** Assuming "arm" would have been wrong four
times out of five. **Read them.**

mini_race pinned the mechanism: a leaf sits immediately after a `blr` epilogue
and opens `mflr r0; stw r0,4(r1)` — **it simply has no `stwu`**, which is what
defeated the old prologue rule.

### THE CENSUS UNDERCOUNTS `bctr` ROWS — 2,733 insn in mini_fight alone

mini_fight reproduced the orchestrator's table exactly, then read its `bctr` rows
by hand as the brief said to. The census charges **3 rows / 6,214 insn** to
`d-JUMPTBL`; per function it is **4 fns / 2,396**, and those rows hide **31
reachable functions / 2,733 insn.** Corrected reachability **78 fns / 8,894
(37%), not 47 / 6,161 (26%)**. Script: `_scratch_mini_fight/run11/bctr_rows.py`
(boundary rule = a label directly after a `blr`). **It shed 9 functions / 2,132
insn out of three monster rows as byte-neutral gated splits** — the durable part
of its +33.

### TOOLS — three defects found by hitting them, all fixed at `61102e7`

- **`rel_census.py`'s bias hit rate measured PROGRESS, not correctness.** It
  scanned only `asm/nonmatchings/`, so a `_prolog +` target whose function had
  been **converted** counted as a miss. mini_fight watched its own rate decay
  **149/149 → 146/149** across the run while gating GOLDEN, and the tool began
  printing "distrust d-JUMPTBL" at it. **A number that falls as you succeed is
  worse than none.** Now scans `src/` too; mini_fight is back to 149/149 and all
  eight other modules are byte-identical.
- **`rel_genvar.py` wrote bare LF into a CRLF tree** — reported independently by
  **three** agents; two normalised a match by hand, and the LF files reached the
  repo (git printed 31 CRLF warnings on the run-11 commit).
- **`rel_purify.py` dropped file-scope type definitions.** `rel_split` puts a
  file's invented struct **below the last function**, so block-slicing handed it
  to one output and every other died with `illegal use of incomplete struct`
  (mini_race, `struct RaceSub49`). Now copied into every output like the prefix.

**`src/mathutil.h`'s `func_8000716C` was WRONG and is fixed (`8f68f36`)** —
`float func_8000716C(double)` where the asm body ends `stfs f0, 0(r3)`, i.e.
**r3 is an out-pointer.** Found independently by mini_billiards and a
mini_bowling worker, both of which had to `#define` it away in their own `.c`;
fixing it moved one function **raw 222 → 83**. Argument order is not fixed by
the ABI (pointer→r3, float→f1 either way) and the two agents chose opposite
orders — the committed spelling is the one with a golden build behind it.
**Still unfixed: `u_math_unk9_smth_w_quats(..., register float c)` forces an
`frsp` the original lacks** (probe, all four spellings); its workaround remains
in `mini_billiards_33b.c`, documented.

**Still unfixed and NOT exercised this run:** `rel_merge_tu.py` **keeps only the
FIRST file's head** — drops per-file `//@SUB` retypes *and* local structs,
`static` forward declarations and retyped `extern`s (sel_ngc; mechanical fixes in
`_scratch_sel_ngc/run11/fixprotos.py`, `headdiff.py`, `patchhead.py`).
`rel_carve.py --list` refuses on an already-carved module. **`rel_tu_map.py` and
`rel_carve.py` take the ASM STEM, not the module name** — `rel_tu_map.py sel_ngc`
dies with `FileNotFoundError` while `rel_sweep`/`rel_census`/`rel_merge_tu` all
take `sel_ngc`; **the same naming hazard made `rel_rowcount` silently report ZERO
in run 10.** `rel_structcheck` rejects `--tree`.

### NEW IDIOMS — ranked, all proven by a golden build

1. **Indexing an ARRAY OF STRUCTS is the only way to get `add rD, base, index`
   with the base in rA.** `p = (u8 *)&((struct S *)(w + K))[i]` gives
   `mulli; add rD,base,idx; addi rD,rD,K`; every byte-offset spelling gives the
   other order, and **run-10 idiom 4's two-step bump sinks the `+K` into every
   later displacement.** Matched `lbl_000027B0` after run 10 spent ~470 variants
   stuck at 1-in-1, and took another function 90 → 32. **This supersedes run-10
   idiom 4.** (mini_bowling)
2. **mwcc pins ONE volatile FP register per local variable for its whole life,
   not per live range.** Reusing one `f32 s` for a dot product, a divide result
   and a scale factor cost **37 diffs**. **Tell: a variable's later use lands in
   the register its earlier, unrelated use claimed.** (mini_bowling `w4`)
3. **Signedness of a narrow field is visible.** `int → s8/s16` store emits
   `extsb`/`extsh` first; `int → u8/u16` emits nothing, so **a bare `lwz`+`stb`
   means the field is UNSIGNED**. Independently: **`lbz`+`cmpwi` without `extsb`
   ⇒ `s8`**, `u8` gives `cmplwi`. **And it applies PER-ARRAY, not per-function**
   — one function had `s8[4]` and `u8[4]` side by side. (mini_pilot,
   mini_billiards, mini_bowling `w3`)
4. **The `(s8)`-cast byte-store narrowing rule.** When the whole RHS of a byte
   store is narrowable mwcc deletes the `extsb` of every `s8` **leaf** (five
   spellings fold identically), **but a cast on a NON-leaf survives**
   (`(s8)(int)x`, `(s8)(x|0)`). Explains why `x == 2` needs no `extsb` but
   `x == 2 || x == 3` does. (mini_bowling `w2`)
5. **mwcc evaluates call arguments left-to-right, so a value a later argument
   needs must be computed IN the argument list, not as a preceding statement.**
   6 in 3 → MATCH. (mini_pilot)
6. **A coalesced web's callee-saved rank is set by its LAST-declared member** —
   56 in 41 → 28 in 17 with no other change. (option)
7. **`base + i*S + K` folds differently for an ARRAY NAME vs a `u8 *` LOCAL** —
   probe-proven in 12 instructions, worth 160 aligned. (mini_billiards)
8. **A named pointer local coalesces into the register holding the base it came
   from; deleting it gives mwcc's CSE temp a FRESH register.** Seven spellings
   flat at 13 in 13, removal → MATCH — **but measured in both directions: in
   another function every named local costs a callee-saved register.**
   (mini_pilot)
9. **A dead second parameter does NOT reserve `r4` — one PASSED THROUGH TO A
   CALL does.** Seven dead-param spellings flat at 8; `f(w, a1)` on the indirect
   call → MATCH. **Bounds run-10 idiom 1.** (mini_race)
10. **`x += RHS` fixes a commutative `fadd`'s operand order where no
    one-expression spelling can** — a worker had called that instruction
    unreachable. (mini_bowling)
11. **`(v & 0x7F) << 11` and `(v << 11) & 0x3F800` fold to the SAME `rlwinm` but
    give different Sethi–Ullman orderings** — the last 2 diffs of a 651-insn
    match. **Try it first on any `(x << N) & mask` scheduler tie.** (mini_bowling
    `w4`)
12. **`a = b = expr` gives the load to the RIGHTMOST and an `addi rD,rS,0` copy
    to the leftmost.** (option)
13. **mwcc reserves a frame slot for a pointer local even when it is fully
    register-allocated** — a declared-first `struct Ball *` supplied the missing
    8 frame bytes *and* fixed an operand order. **Dead `int`/`Vec`/`f64`/`char[]`
    pads do NOT substitute; position and kind both matter.** (option)
14. **A DEAD PARAMETER is how you buy stack** (`nparams*4` at `r1+8`), and
    **mwcc reserves a frame slot for every `f32` local even when it never
    spills**. Outgoing arguments cost stack only from the **9th GPR argument**.
    (mini_bowling)
15. **`*(u32 *)&t` defeats mwcc's fold of a small aggregate copy** — same lever
    as `*(Vec *)&a` for 12-byte copies. (mini_race)
16. **The CALLEE's declared parameter type decides the `extsb` at the CALL
    SITE**: `void f(s8)` passes the raw `lbz`; `void f(int)` emits `extsb`.
    (mini_race)
17. **Statement-group order changes REGISTER ALLOCATION, not just the schedule**
    — 73 → 24 with the emitted sequence identical and only registers renamed.
    **And store order does NOT reveal source order** for independently-stored
    `Vec` locals (43 → 24 by writing them in the opposite order). (mini_bowling)
18. **A dead-looking initialiser can be load-bearing by its ABSENCE** — adding
    `best_i = 0` cost one `li` and shifted the whole function. Conversely **an
    unused local of pointer type still eats a 4-byte stack slot.** (mini_bowling)
19. **A dead int→float conversion is spelled with the COMMA OPERATOR** —
    `((n - 17) / K, <live expr>)` reproduces the orphaned magic-double `stw`s,
    65 → 26, where a dead *local* scores 90. (mini_golf)
20. **`-(s16)e` vs `-(s32)e` for an `s16` local** decides truncate-at-store vs
    sign-extend-at-use; **`memcpy()` emits `bl memcpy` while a struct ASSIGNMENT
    inlines the `lwzu`/`stwu` loop**; **mwcc 1.1 does NOT auto-contract
    `a*a+b*b` into `fmadds`** — every `fmadds` comes from `mathutil.h`.
    (mini_billiards)
21. **A two-step assignment defeats induction-variable reassociation** (16 → 6,
    control at 24). (test_mode)

**NEW DEAD AXES — proven, do not re-sweep:** `register` is **completely inert in
mwcc 1.1** (29 variants byte-identical); all 12 associativity forms of a
float expression (mini_golf); K&R callee declarations do **not** inflate the
frame (probe-proven, mini_bowling `w3`); `if ((m = e) != NULL)` vs `m = e; if (m
!= NULL)` (test_mode); the `BALL_FOREACH` preamble assignment order (mini_fight);
declaration position of a callee-saved pointer local (mini_race); 24 permutations
of four scalar inits and all 12 `b = a;` orders (sel_ngc).

### NEGATIVES WITH MECHANISMS — the good kind of retire

- **sel_ngc `lbl_00010214`(137)** — inherited "162 in 9" was wrong, it is **110
  in 5**. Root cause: the unroll factor (original ×4, every draft ×8). **40
  spellings all strength-reduce to the same pointer form** where the original
  keeps a byte-offset induction variable; unroll signature verified **on the
  object** for six. **Not source-reachable with the current body.**
- **sel_ngc `lbl_00009868`(203)** — 86 builds, no movement, reproduces exactly at
  **12 in 10**.
- **test_mode's ceiling, reduced to a 15-line probe:** **mwcc keeps a global load
  across a store to a NAMED TYPED GLOBAL, but a store through ANY pointer local
  kills it.** The original needs both — so **`u8 *base = lbl_XXXX;`, the
  convention every converted file in this project uses, is itself a ceiling.**
  Lifting it likely needs a `.bss` carve.
- **mini_bowling `lbl_00003574`(295)** — the frame is 8 bytes larger than the
  original's, so every displacement is +8. **68 automatic single-statement-removal
  probes plus ~20 hand-built micro-probes prove no individual call causes it**;
  it appears only with the nested 4×4 rank loop, i.e. register-pressure driven.
- **mini_billiards' four `18xxx` functions (393 insn) are blocked by ONE
  mechanism** — correct instruction sequence, volatile-FPR numbering off by a
  consistent shift, flat across statement order, compound assignment, named
  temps, **all 16 `volatile` masks**, `register`, declaration order, statement
  splitting and return type. **That is the next micro-probe campaign.**

### A NEW FICTIONAL-MATCH MODE

**A plain `static` helper that mwcc inlines is STILL EMITTED OUT-OF-LINE under
`-inline auto`** — 332 bytes of extra `.text` ahead of the real function, **behind
a per-function diff that looks perfect.** `static inline` suppresses it.
(test_mode)

### PROCESS — what worked, and the one thing that nearly went wrong

**The `TOOLS_UPDATED.md` marker protocol worked.** mini_billiards, which in run
10 falsely accused its own subagent over an unexplained `tools/` diff, this run
verified the tree and reported "no unexplained diff, sole later mtime is
`rel_leafsplit.py`, exactly as the marker says."

**Worker results nearly got stranded.** mini_bowling spawned five workers and
**closed out before three of them finished**; `w4`'s **651-instruction MATCH —
the largest single conversion of the run — was sitting in a scratch worktree with
its parent finished.** It was recovered by re-engaging the parent, which found
the trees had genuinely diverged (w4 was cloned between two split operations).
**Rule for run 12: a module agent must not close until its workers have, and must
report each worker's disposition explicitly.** `w3` and `w5` handled themselves
correctly — both restored their owner files to asm and re-gated GOLDEN rather
than leaving a non-matching body in the tree.

### NEXT RUN — ranked

1. **Sweep the reachable set, smallest-first, in every module.** 29,851 insn are
   reachable **today with no carve and no merge**. This is the third run running
   in which that beat every glamour target. Biggest pools: **mini_fight 50 fns /
   7,112** (plus 2,733 more inside its `bctr` rows), **mini_race 44 / 5,955**,
   **test_mode 22 / 4,305**, **mini_billiards 10 / 4,275**.
2. **mini_fight `lbl_00004D14`(438) is at 3 in 2, span 15-438** — all 438
   instructions, the frame, the scheduling and all ten callee-saved registers
   byte-exact. The one defect is that the address costs two `addi` because
   **mwcc never folds a nonzero offset into the `@ha/@l` relocation** (5 spellings,
   all 5 in 4). Then `lbl_00004498`(543) in the same shape.
3. **mini_bowling `lbl_00005B0C`(720) is at raw 36 with the correct length** —
   **instructions 46-719 (94%) are byte-exact**; the entire residual is the
   prologue, where the original schedules a `lis` into slot 4 and mwcc sinks it
   to slot 20. Attack only that. Also `lbl_0000C1D0`(566) at **14 in 3** — a pure
   scheduler tie, identical instruction multiset and registers, one statement of
   drift.
4. **test_mode `lbl_000057C0`(908) is at raw 47 — 861 of 908 byte-identical**,
   residual confined to one block and a volatile rotation. It was assigned
   explicitly this run after two runs unstarted and it delivered; finish it.
5. **option `lbl_00003240`(410)** — now its largest reachable target, and **it
   shares most of its call set with the just-matched `lbl_00002F14`, so the
   template work is done.** Also `lbl_0000077C`(217) at **4 in 4** (one pointer
   temp in r29 where the original has r30, dead across 88 permutations).
6. **mini_bowling's magic carve is worth +903 and its PRECONDITION IS BUILT** —
   `lbl_000009EC` and `lbl_00000F98` are alone together in `_4bb.c`, contiguous in
   `.text`, correctly ordered in SOURCES, both verified to subtract *both*
   magics, and **the two holes are adjacent**, so one 16-byte emitter at 0x10D58
   is the play.
7. **sel_ngc is merge-gated, not grind-gated** (2% reachable in place). Its
   shallow merge is landed and free: **`lbl_0000B1C0`(472), `B920`(370) and
   `BEE8`(396) — 1,238 insn — now sit in the magic-owning TU at zero setup.**
   But all three are `stmw`-class from-scratch decompiles that went **unstarted
   two runs running**. Assign with an explicit budget or drop them and bank the
   `D39C`/`D5A8`/`DDF4` repair path instead (which unlocks 719 more).
8. **mini_billiards: six a-BLOCKED functions at 192-410 insn = 1,830, one per
   available magic hole** — its largest un-started lever. Six magic doubles
   remain in the blob (3 signed, 2 unsigned in `.rodata`, 1 unsigned in `.data`),
   plus a decoy at `d2:3794` the census correctly excludes.
9. **mini_golf: the four no-carve b-POOL functions are the cheapest work left** —
   `lbl_00007F34`(708), `lbl_0000F290`(304), `lbl_0000BDEC`(207),
   `lbl_0000F7E8`(140) = **1,359 insn, all single-function TUs**, all analysed.
   `lbl_0000E99C`(480) is now **three runs unwritten** — assign or drop it.
   New: `lbl_00009C50`(1,420) needs **one 16-byte carve** (its two holes are
   adjacent, unlike `C33C`'s), but taking it costs `lbl_000005CC`(5,182)
   permanently.
10. **mini_race `lbl_0000D41C`(50) at 4 in 3** and `lbl_00005C20`(51) at 7 in 5;
    `lbl_000050F0`(103) is its largest untouched c-FREE. **50 of its reachable
    functions are b-POOL, so purification is its highest-volume lever** — it
    confirmed mixed-TU damage twice more, with a **new symptom: a mixed TU also
    flips `extsh. rD,rS` into `cmpwi rD,0`.**

---

## 0.16 — RUN 10 DONE (2026-07-30): +3,197 insn, 18.84% -> 20.52%. Superseded by §0.17.

Nine parallel agents, one per module. **The four-run decline stopped**: 7,575 ->
4,377 -> 3,302 -> **3,197** (97% of run 9). And the function count nearly
doubled, **+42 -> +77**, because most of the gain came from *splitting rows that
were miscounted as single functions*, not from grinding harder.

| module | still-asm | insn | % | gained |
|---|---|---|---|---|
| **mini_pilot** | 35 rows | 4773/12137 | **39.33%** | **+25 fns / +1,359** |
| mini_bowling | 39 rows | 5285/15313 | 34.51% | **0** |
| mini_race | 99 rows | 5967/19817 | 30.11% | +17 fns / +197 |
| sel_ngc | 22 rows | 4298/18084 | 23.77% | +1 fn / +153 |
| test_mode | 53 rows | 3582/16231 | 22.07% | +9 fns / +142 |
| option | 27 rows | 2077/12375 | 16.78% | +1 fn / +39 |
| mini_fight | 104 rows | 4522/28588 | 15.82% | +19 fns / +260 |
| **mini_golf** | 32 rows | 5423/38919 | **13.93%** | **+4 fns / +967** |
| mini_billiards | 36 rows | 3121/28793 | 10.84% | +1 fn / +80 |
| **TOTAL** | **447 rows** | **39048/190257** | **20.52%** | **+77 / +3,197** |

**Verified**: all nine gate GOLDEN on merge; all nine pass `rel_structcheck`; a
completely clean build from deleted objects/`.dol`/`.elf` gives **1,238 objects
and `sha1sum -c supermonkeyball.sha1` = all 12 OK**. Diff scanned for game
binaries first — clean; **414 files: 240 `.c`, 173 `.s`, 1 Makefile**. Committed
at `39eb941`.

### THE BIG LESSON: the reachability tables were the bottleneck, not the grinding

Run 8 falsified the measurements. Run 9 falsified the instrument. **Run 10
falsified the CENSUS** — how many functions there are and which are reachable.
Two modules alone were wrong by **6,170 instructions of misclassification**:

- **mini_pilot: wrong by +2,352.** Run 9 recorded "rows == functions here, 5
  reachable fns / 1,215 insn, 86.1% blocked". The fixed `rel_rowcount` found
  **3 rows holding 35 extra functions**; the real figure was **36 fns / 3,567**.
  That one correction produced **43% of the entire run's instructions.**
- **mini_fight: over-counted jump-table code by 3,818.** It classified all 26
  functions in its 3 `bctr` rows as dead (6,214 insn); **per function only 4
  functions / 2,396 actually contain `bctr`.** It also counted magic-*label
  readers* as blocked, which the run-6 carve finding says they are not — **only
  an inline `lis rN,0x4330` spends the budget.**

Run 9's caveat ("the `blr` heuristic invents phantoms") was right; the
*conclusion* modules drew from it ("so rows == functions here") was wrong.
**Re-derive the census per FUNCTION before doing anything else. It is still the
cheapest instruction in the project.**

### THE GROUND TRUTH THAT SETTLES IT, found independently by TWO modules

**Data code-pointers are stored as `_prolog + X`, where `X = (listing address)
− 0xD0`.** Decode the `.data` blob with that bias and you get the exact set of
jump-table arm addresses and vtable entry points.

- **mini_race** used it to prove `lbl_00012D50` contains **no `bctr` at all**
  (it is 13 functions, not 8), that `lbl_0001157C` is **22 functions** with one
  `bctr` confined to a single body, and that run 9's dismissed "1- and
  3-instruction phantoms" are **real functions** — vtable members, two of them a
  bare `blr`, and **all 10 tiny ones it converted matched.**
- **test_mode** derived the same thing from `.4byte _prolog + 0xNNNN` and gave
  the rule that works:

> **entry = a label with zero in-row references, preceded by `blr` (not `b`,
> not `bctr`), whose address is NOT a decoded `_prolog +` target.**

Its naive version — "label after a terminator with no in-row reference" — found
**123 functions and over-splits catastrophically** (one row became eighteen
2-instruction "functions"). The `_prolog +` exclusion is what makes it sound.

**This is the single highest-value tool to build for run 11.** It would settle
the 32 remaining `leaf?` candidates and every `bctr` row in the project.

### THE CENSUS IS NOW LEAF-AWARE, AND THE LEAVES ARE REAL

`rel_rowcount.py` was missing **every leaf function** (its entry rule required
`mflr`/`stwu`; test_mode's 84-insn leaf starts with a bare `lis`). Fixed, and it
now reports three categories: `confirmed`, **`leaf?` (an explicit UNKNOWN)**, and
`bctr rows`. It is also **stub-aware** — a `.s` is not deleted when its row is
converted, so the raw row count overstated remaining work by >2x.

**test_mode read all 7 of its `leaf?` candidates: all 7 are real functions.** It
split them (byte-neutral, gated GOLDEN *before* converting) and matched 6. **Two
live inside `bctr` rows, which `rel_ssplit.py` refuses** — they sit after the
jump-table function's final `blr`. The brief's "assume an arm until proven
otherwise" was **wrong in both cases**. mini_bowling checked its 6 and they
**are** arms (8-byte spacing). **Read them; do not assume either way.**

Two independent recons reproduced `rel_rowcount` exactly (test_mode: 55 rows +
7 leaves = 62; mini_billiards: 36/36). **The leaf-awareness is sound.**

### THE PROJECT-WIDE CARVE RULE THAT WAS FALSE

§0.15 recorded as a **"structural bound proved (sel_ngc)"**:

> signed and unsigned magic can never share an object

**Falsified independently by mini_bowling, option and mini_golf, and verified
directly.** One TU doing both int->float conversions compiles fine and emits 16
bytes. With an f32 literal added the orchestrator's probe lays out
`[f32 f32][signed][unsigned]`; **option's probe put the literals BETWEEN the two
magics**, and mini_golf's real module pool has them **0x30 apart with a literal
run between**. So:

> **One object MAY emit both magics. Their positions inside that object's
> `.rodata` are decided by mwcc's pool layout and are NOT guaranteed adjacent.
> Dump the pool; never assume.**

mini_bowling's entire +903 plan depends on this being false. mini_golf's
`lbl_0000C33C` (1,220) needs a **label-boundary-spanning range carve**
(0x26380-0x263B8) precisely because they are *not* adjacent there.

### A CARVE IS A PRECONDITION, NOT A CONVERSION

Run 9 sold mini_golf's carve as "17,209 insn, mechanically proven, one command",
and this handoff relayed it as that module's target #1. **It banks ZERO by
itself.** Carving removes 8 bytes that some `.c` must then emit; if no converted
C lands for a hole the module cannot gate — and **the data-only probe `.s` that
run 9 validated with cannot be merged back.** mini_golf reproved the mechanism,
then **un-carved one hole** because nothing landed for it.

It also caught that `lbl_00013664`(1,967) is **not** "the smallest member of
rank 1" — it is the smallest of one family; the smallest carve-gated functions
are **214-253 insn**, which is what it converted instead, and why it produced the
run's second-biggest gain.

### THE SCORER LIED AGAIN — in the exact mirror of run 8

**`rel_ascore.py` inflated a pure register renaming.** mini_fight's
`lbl_00004D14` sits at **raw 101 with every instruction positionally aligned**
and was reported as **ALIGNED 387**; `--sweep` ranked the correct variant **LAST
in three separate sweeps.**

Root cause: difflib latches onto a long matching block **off the diagonal** when
the words repeat — and real PPC asm repeats heavily (`nop`, `mr`, `blr`, the same
`stw`/`lwz` pairs in every prologue) — then pays an insert **and** a delete for
everything around it instead of a substitution.

**Fixed at `860974f`, and the cap is exact rather than a heuristic: when the two
sequences are the same length, the identity alignment costs exactly `raw`
substitutions, so the true edit cost can never exceed raw.** Verified it does not
defeat aligned scoring (a genuine 1-instruction insertion still scores **1**
where positional raw is 45), and all 81 scorable converted mini_pilot functions
still score 0. Applied identically to `rel_ascore`, `rel_sweep`, `rel_regions`.

**And rank still is not proximity, in BOTH directions.** mini_billiards had four
variants tied at aligned 4 / **raw 75** while the byte-exact body scored aligned
5 / **raw 5**. test_mode had an accidental control (`^` for `+`) score **10**
while every correct spelling sat at 25. **Read the regions; and when raw and
aligned disagree sharply, look at both.**

### RETIRING FOR EXHAUSTION KEEPS PROVING UNSAFE

**Two more retired functions now MATCH.**

- **mini_pilot `lbl_0000893C`** — retired in run 9 at "2 in 2" after ten
  variants. The lever was **naming the `mathutil_vec_len()` call result**, an
  axis those ten never touched.
- mini_bowling's run-9 `lbl_00001B14` (one `CAMERA_FOREACH_2` call).

Retiring on **positive evidence** keeps holding (mini_golf `lbl_000109CC`
re-confirmed twice; mini_pilot `lbl_0000B130` closed with a mechanism).
**Retiring on exhaustion has now failed three times.**

And the decisive negative this run: **mini_billiards measured `lbl_0000A054`**
(2,094 insn, unstarted for two runs) at **608 aligned in 290 regions, span 100%**
— one edit region per 7.2 instructions. **A translation problem, not a
near-miss. Drop it.** That is what a real "retire" looks like.

### NEW IDIOMS — ranked, all proven by a golden build

1. **A DEAD SECOND PARAMETER is load-bearing — it reserves `r4` and renumbers
   every volatile.** Nine 1-parameter spellings were **flat at 8 in 3**;
   `(struct Camera *, struct Ball *)` matched first try in three spellings.
   **Read the volatile registers the original AVOIDS to recover the arity.**
   (mini_pilot)
2. **mwcc's CSE temps for repeatedly-taken STACK addresses rank above ALL user
   locals.** Replacing them with explicit `Vec *` locals used only at the second
   occurrence reproduces the codegen *and* pins their slots — 123 -> 101 raw.
   **The general fix for "everything right, callee-saved registers rotated".**
   (mini_fight)
3. **A pointer local holding an unmodified module-global address is hoisted to
   the top callee-saved register, unconditionally** — 25 spellings all land at
   r31, and dead self-modification is folded away. (mini_fight)
4. **Two-step pointer bump forces the `add` operand order.** `add rD, base,
   index` is produced ONLY by `p = tbl + idx*8;` then a separate `p += K;`. **All
   17 one-expression spellings** give `add rD, index, base`. **1 in 1 -> MATCH on
   three functions at once.** (mini_golf)
5. **`tbl[i]` with TWO separate locals is not interchangeable with any
   single-expression form** — five spellings flat at 4 in 2; a `tbl` pointer
   local *plus* an `i` index local -> MATCH. **But they must be assigned LATE**;
   at-declaration costs a fourth callee-saved register. (mini_pilot)
6. **A compound assignment `x += RHS` defeats mwcc's CSE of `x` against an
   earlier local holding the same value; `x = x + RHS` does not.** (sel_ngc; and
   mini_pilot found the same lever for FPR allocation — `x = a; x += b;`
   allocates `x` where it will live, `f32 x = a + b;` computes into scratch)
7. **`__fabs` is an mwcc PPC builtin needing no header.** A prototyped
   `double fabs(double);` emits `bl fabs`; unqualified `fabs` compiles as an
   **undeclared int-returning call**. `<math.h>` inlines it but risks 16 bytes of
   `.rodata` that break a carve. **12 in 2 -> MATCH.** (mini_golf, mini_billiards)
8. **The unroll factor is set by the TRIP COUNT.** 3,000 iterations of a
   9-statement body unrolls x8; the original is x2; rewriting as 1,500 iterations
   touching two records reproduces it (136 -> 4). (mini_billiards)
9. **Scoping pointer locals into an INNER BLOCK at their point of use** — 14 in 4
   -> MATCH, same instructions, different volatile numbering. **Generalises
   run-9 idiom 4 beyond loop induction variables.** (mini_pilot)
10. **Where you assign the loop-count local flips the volatile allocation** —
    read inline first and assign the local after: **17 -> 1** across three
    functions. (mini_golf)
11. **A branchless multi-term guard needs bitwise `|`, and ASSOCIATIVITY IS NOT
    NEUTRAL**: `a || b || c` = 38, `a | b | c` = 27, `a | (b | c)` = **9**.
    (test_mode)
12. **`if (a != K) {X} else {Y}` is NOT `if (a == K) {Y} else {X}`** — `!=` emits
    `beq <else>` with X as fallthrough. (mini_golf)
13. **`beq target; b default` is a one-case `switch`, not `if/else`** (which
    emits an inverted `bne`) — worth 18 aligned. (sel_ngc)
14. **Naming a CALL RESULT reorders varargs `crclr 6` against the format-string
    `addi`** — 2 -> MATCH where five other "name something" spellings held at 2.
    (mini_pilot)
15. **`f32 - f32` assigned to an `f64` still emits `fsubs`**; only an explicit
    `(f64)` cast on an operand gives `fsub`. (mini_billiards)
16. **A lerp target repeated three times must be a DIRECT global expression, not
    an `f32 *` pointer local** — the pointer form costs a third callee-saved
    register and 8 bytes of frame. **21 in 9 -> MATCH.** (option)
17. **Non-hoisted locals take descending callee-saved registers in declaration
    order** (first declared -> r31), and **block scope == declared last**.
    (mini_fight)
18. **`cur` as a CSE'd re-read, not a named local** (71 -> 56), and a 3-way
    dispatch as an **if/else chain, not a `switch`** (77 -> 71; ten switch
    spellings all worse). (option)

**NEW DEAD AXES — proven, do not re-sweep:** `(u32)x >= 3` and `x >= 3U` are
**canonicalised to `cmpwi` and cannot produce `cmplwi`** (option — project-wide);
initialised declarations vs later assignment (sel_ngc — **much worse**, 62-115,
the initialiser is emitted above the early return); the parameter-copy `mr`/`addi`
spelling (mini_race — four spellings flat, control 11 in 8); comparison operand
order (mini_race — mwcc canonicalises the compare direction); mini_bowling's
block-copy *destination* expression (26 spellings); the `REPEAT_LOCAL`
button-word hoist (test_mode — 32 variants all exactly 22, **and this is the very
lever that broke a function in run 9, so it does not generalise**).

### CORRECTIONS TO THINGS THIS HANDOFF ITSELF GOT WRONG

Four of the six falsified "facts" were relayed by the orchestrator from §0.15.
**Agents that checked instead of acting produced the run's best output.**

- **`rel_merge_back` does NOT copy only `src/<stem>*.c`.** It also syncs
  `asm/nonmatchings/<stem>/` **by content**, copies `asm/<stem>.s` and
  `asm/<stem>_d*.s`, **removes deleted `src/<stem>_*.c`**, and rewrites the
  Makefile SOURCES block. mini_golf: believing the relay "would have made me
  conclude the carve was unmergeable and skip the whole run's work."
  **Only shared headers (`src/*.h`) are dropped.**
- **An unfolded `lis;addi;lwz 0(rX)` is NOT always the mixed-TU signature** —
  `__OSCurrHeap` is `volatile int`, and **a volatile global never gets the
  address-fold peephole.** (test_mode)
- **§2/§3 UNDERSTATE the mixed-TU damage.** Beyond the address-fold peephole, a
  mixed TU also disables **return folding** (`bgelr` becomes a branch to the
  epilogue) and turns `addi rD,rS,0` into `mr rD,rS`. Golden proof: two functions
  improved (1 in 1 -> MATCH, 7 in 5 -> 1) with **no C change** — only the TU was
  purified. (mini_race)
- **sel_ngc's `lbl_0000C518` "HARD STOP" is not a blocker** — an asm sibling
  emits no `.rodata`, so the chain steps over it. The value past it is **1,295,
  not 1,649**: run 9 counted a permanently-impossible 651-insn function as
  reachable and missed three that are.
- **mini_bowling's magic prize is 935, not 3,372** — run 9 summed ten consumers
  that would all have to share one TU across `.text` 0x09EC-0x6F0C.
- **option has FOUR magic doubles, not two** (`C270` signed, `C368` unsigned,
  `C380` signed, `C4B0` unsigned); `option_d1.s` also holds a **decoy
  `0x43300000` that is the f32 176.0**. And `lbl_00002F14`(203) is **c-FREE, not
  b-POOL** — never attempted.
- **mini_billiards: run 9 listed only the LARGEST c-FREE functions**, so **six
  never-attempted reachable functions totalling 1,955 insn were never written
  down as targets.**
- **mini_fight: 16 magic doubles in the blob, 5 UNSIGNED**; run 9's recon tested
  only the signed form. **Every module that has not re-scanned with both patterns
  is under-counting.**

### ORCHESTRATOR PROCESS ERROR — do not repeat

I propagated tool fixes into all nine **live** trees mid-run without leaving a
marker. **Three agents independently flagged `tools/rel_merge_tu.py` as modified
by an unknown party**, and mini_billiards **falsely accused its own subagent of
violating instructions and lying about it** (verified byte-identical to my fix).
Their detection — mtime + `git diff` — was exactly right. **If tools must be
propagated mid-run, write `TOOLS_UPDATED.md` into each tree saying what and why.**

### TOOLS — promoted, fixed, and the queue for run 11

**Promoted this run** (`7dcdd3b`): `rel_regions.py` (contents of each edit
region), `rel_probe.py` (compile-only micro-probe, ~1s, Makefile-exact flags).
**Fixed**: `rel_sweep --sweep` ranks on **aligned**; `rel_rowcount` leaf-aware +
stub-aware; `rel_xref_spine` takes a module; `rel_carve` refuses a bare long-run
`--hole` **and no longer un-carves on refusal**; `rel_rematch` derives
extra-starts from group files and hard-fails on an instruction-count change;
`rel_merge_tu` no longer hard-coded to mini_billiards (`1969e98`); `rel_fdiff`
no longer defaults to mini_race (`ce6e07c`); the aligned-scorer cap (`860974f`).

**BUILT BY AGENTS, HARVESTED TO `C:/tmp/smbm/_run10_harvest/`, NOT YET PROMOTED
— this is run 11's highest-value prep:**

1. **`rel_purify.py`** (mini_race) — splits a mixed group file at every **C-to-asm
   boundary**. `rel_isolate` groups by asm block, so converted C stays glued to
   asm and every output is *still mixed*. Byte-neutral, gated GOLDEN.
2. **`isolate_mixed.py`** (mini_fight) — **the same gap, solved independently**,
   used 4x all GOLDEN. Merge these two into one tool.
3. **`leafsplit.py`** (test_mode) — splits a trailing leaf into its own file +
   SOURCES entry, and **does what `rel_ssplit` cannot: `bctr` rows**. Note its
   first version orphaned 4 leaves' instructions by cutting the `.s` before the
   clone rewrite — **the same silent-deletion class as `rel_rematch`.**
4. **The `_prolog + (addr − 0xD0)` entry decoder** (mini_race + test_mode) — see
   above. Build this one first.
5. `rel_ssplit.py` patches (mini_race): `--extra-start`, and `--allow-bctr` with a
   **checked** jump-table containment test instead of the blanket refusal — it
   found only 10 of 13 real functions in one row without it. **And it still
   misses LEAF functions** (requires `mflr`/`stwu`); teach it the
   external-reference rule `rel_rowcount` already uses.
6. `magicmap.py` (mini_pilot) — traces every blocked function to the magic double
   it reads. Should be in the census tool.

**Known-broken, still unfixed:** `rel_merge_tu.py` **drops per-file `//@SUB`
prototype retypes** (option: `redeclared` + a cascade of `undefined identifier`);
`rel_isolate.py` leaves a **blank line before `#pragma force_active reset`**;
`rel_carve.py` refuses `--list` *and* `--from worktree` on an already-carved
module, so **option currently has no way to test a second carve**;
`rel_probe.py` **needs the module's full include preamble**, not `global.h`
(documented at `c4f61c4`, but the tool could read it automatically).

### RUN-11 PREP DONE (post-run-10, commit `26b82df`)

- **Pushed**: `fork/wip/rel-drafts-and-dol-matches` at `27223b0` (was `1ef703e`).
- **`tools/rel_census.py` is BUILT** — the per-function census, the run's #1
  follow-up. It decodes the `.data` jump tables instead of guessing. Two things
  run 10's two independent versions both got wrong, now fixed:
  - **the `_prolog +` bias is MODULE-DEPENDENT** — measured **0xD0** for
    mini_bowling/mini_race/mini_pilot/sel_ngc/test_mode, **0xC8** for
    mini_fight/mini_billiards/option, **0x14C** for mini_golf. mini_race
    hard-coded 0xD0; test_mode used no bias, making its filter hit 12% of
    targets, i.e. **nearly inert** — the `blr` rule was doing all its work.
    The tool derives it per module and reports the hit rate (100% everywhere,
    runner-up 13-50%).
  - **a `_prolog + X` target is NOT always a switch arm** — it is equally often
    a **vtable entry, i.e. a real function**. Excluding them wholesale dropped
    9 real functions from mini_race and 23 from mini_fight. A switch arm only
    exists in a row that contains a `bctr`, so the exclusion is scoped to those.
  Validated against the agents' own tables: mini_race 108/13,850,
  mini_billiards 36/25,672, **test_mode 53/12,649 with all four categories
  identical**, plus option, mini_golf, sel_ngc, mini_bowling exact. Conservative
  inside `bctr` rows (mini_fight: 108 vs the agent's hand-derived 127).
- **`tools/rel_purify.py` is PROMOTED** (mini_race's + mini_fight's merged) —
  and promoting it **caught a file-destroying bug both versions ship**. They
  name outputs `<base>b.c`, `<base>c.c` … unconditionally; in an already-split
  tree those names are taken. Purifying `mini_race_28.c` **overwrote
  `src/mini_race_28b.c`, deleting `lbl_00004910` (168 instructions)**, added a
  duplicate SOURCES line, and built clean, non-golden, exit 0. **That is the
  run-9 `isolate.py` defect reintroduced — the third tool to hit it.** Fixed by
  choosing free suffixes. Also fixed: both strip `static` from every definition,
  promoting file-local symbols to global and changing the REL's symbol table
  even when `.text` is byte-identical. Verified: `mini_race_28.c` purified into
  a pure-C and a pure-asm TU **gates GOLDEN**.
- **All nine warm copies RESET to `26b82df`, each rebuilt to its golden sha1
  with `rel_sweep --gate` from DELETED objects. `fail=0`.** Re-run with
  `C:/tmp/smbm/warm_reset_run11.sh`. CW temps `C:/tmp/tmp_<mod>` exist.
- **`C:/tmp/smbm/RUN11_BRIEF.md` is written** — hand it to every module agent.
  It leads with the census, not with a target list.
- **`C:/tmp/smbm/RUN10_RESULTS.md`** holds all nine per-module reports.
- **Harvested but NOT promoted**, in `C:/tmp/smbm/_run10_harvest/`:
  `leafsplit.py` (does what `rel_ssplit` cannot — `bctr` rows — but is
  **unaudited for the naming hazard above**), mini_race's `rel_ssplit` patches
  (`--extra-start`, a *checked* `--allow-bctr`), and `magicmap.py`.
- Still unfixed: `rel_merge_tu.py` drops per-file `//@SUB` prototype retypes;
  `rel_isolate.py` leaves a stray blank line before `#pragma force_active
  reset`; `rel_carve.py` refuses `--list` and `--from worktree` on an
  already-carved module, so **option has no way to test a second carve**;
  `rel_ssplit.py` still misses leaf functions.

### NEXT RUN — ranked

1. **Run `tools/rel_census.py` in every module first.** Two modules' tables were
   wrong by 6,170 insn this run and only four of nine have had a trustworthy
   pass. Still the cheapest instruction in the project.
2. **mini_fight `lbl_00004D14`(438) is one register-numbering away** — fully
   decoded, byte-exact except three callee-saved registers, and the mechanism is
   understood (the original keeps `lbl_0001C068` out of the auto-hoisted class).
   Then `lbl_00004498`(543) in the same shape. **Best ~981 insn in the project.**
3. **mini_golf: the carve is landed and the small functions are the way in.**
   214-253 insn each, `lbl_0000E99C`(480) fully analysed but unwritten, three
   arms ending in the verbatim body of the already-matched `lbl_0000C230`.
4. **test_mode `lbl_000057C0`(908) has now gone TWO runs unstarted** — its #1
   target both times, and the module is fully isolated so it gets the scheduler
   free. Assign it explicitly or drop it. (This is the mini_billiards `A054`
   pattern; that one turned out to be a genuine drop.)
5. **mini_pilot: nine c-FREE functions / 2,151 insn untouched**, module now fully
   isolated (35 fns, 35 files, zero group files). Plus the free carve
   `lbl_0000B624`(+298) or `lbl_0000BACC`(+234), **verified accepted**. Also
   re-measure `lbl_000097C8` and `lbl_00003BDC` — their figures are inherited,
   **and this is the module where a function was retired on a number wrong by 13.**
6. **mini_bowling: 11 never-attempted c-FREE functions / 5,206 insn**, every one
   in a single-asm-block file. **That, not the magic carve, is where its volume
   is** — its own closing words. Plus `lbl_000027B0` at **1 in 1** (a commutative
   operand swap).
7. **mini_billiards `lbl_0000C10C`(468)** — isolated, c-FREE, and A054's own
   static helper; plus `lbl_0000C85C`(530), both now scheduler-on at zero setup.
   **`lbl_0000A054` is DROPPED** (608 in 290, span 100%).
8. **sel_ngc's tree is staged**: `lbl_0000B1C0`(472) already sits in the
   magic-owning TU and gates GOLDEN, so run 11 iterates in place. Then
   `B920`(370) + `BEE8`(396) with **zero already-C functions deoptimised.**
   Corrected ceiling **39.65%**, not 34.0%.
9. **mini_race: 61 fns / 6,703 reachable no-carve** (run 9 said 40 / 5,065), and
   the `lbl_00015E08` phase-1 family is **247 insn in 5 near-identical
   functions** — crack one, the other four are near-free.
10. **option is genuinely capped at ~42%**: 8 fns / 4,261 behind a proven-
   unreachable prologue. Its live plays are the `C270` merge (**1,299**) and
   finishing the `C380` group. `lbl_000021D8`(293) is **56 in 41 and the whole
   residual is ONE callee-saved transposition.**

---

## 0.15 — RUN 9 DONE (2026-07-29): +3,302 insn, 17.11% -> 18.84%. Superseded by §0.16.

Nine parallel agents, one per module. **The rate declined again — 75% of run 8,
which was 58% of run 7.** Three consecutive declines: 7,575 -> 4,377 -> 3,302.

| module | funcs | insn | % | gained |
|---|---|---|---|---|
| mini_bowling | 39 asm | 5285/15313 | 34.51% | +3 fns / +319 |
| mini_race | 83 asm | 5770/19817 | 29.12% | +10 fns / +556 |
| mini_pilot | 25 asm | 3414/12137 | 28.13% | +1 fn / +61 |
| sel_ngc | 50/73 | 4145/18084 | 22.92% | +1 fn / +338 |
| test_mode | 72 C bodies | 3440/16231 | 21.19% | **+17 fns / +606** |
| option | 43/71 | 2038/12375 | 16.47% | +1 fn / +109 |
| mini_fight | 142 fns left | 4262/28588 | 14.91% | +5 fns / **+642** |
| mini_golf | 82/118 | 4456/38919 | 11.45% | +1 fn / +87 |
| mini_billiards | 33/70 | 3041/28793 | 10.56% | +3 fns / +584 |
| **TOTAL** | | **35851/190257** | **18.84%** | **+42 / +3,302** |

Run 8 falsified the measurements. **Run 9 falsified the instrument that replaced
them, and the controls that were supposed to catch it.** Both defects were
introduced by run 8's own fixes.

### THE BIG LESSON: the controls have been failing silently, and now we know why

Run 8's rule was "always include a deliberately-wrong control, and make it
STRUCTURALLY wrong." **Four agents' controls failed this run anyway.** mini_golf
found the mechanism:

> **`rel_ascore.py` and `asweep.py` MASK the displacement field of `b`/`bl`**
> (`nz()` on opcodes 16/18). A control that only changes a branch target, or
> which function is called, is **completely invisible** — it scores identical to
> baseline.

That retroactively explains test_mode's run-8 failure and mini_billiards',
sel_ngc's and mini_golf's this run. **A control must change an opcode, a
register, or a NON-BRANCH displacement.** Every "this axis is dead" verdict whose
only validation was a branch-only or immediate-only control is **unproven** —
that includes several in §0.14.

Worse, **the aligned score is not proof of proximity.** On mini_golf
`lbl_0000FBC8`, three structurally *wrong* variants score **4** (they emit an
`fmul f0,f0,f0` the original never does) while the variant whose instructions
match the original exactly scores **9**. Aligned >> raw, but you still have to
read the instructions. `_scratch_mini_golf/regions.py` prints the **contents** of
each edit region side by side and is what found both of that module's idioms.

### THE SECOND INSTRUMENT BUG: `rel_ascore.py` scores a ROW, not a FUNCTION

Found independently by **mini_race, mini_fight and test_mode**, all three of which
built their own per-function slicer. 17 of mini_fight's 154 rows hold more than
one function, so a "309-insn function" is four, and one bad body hides three good
ones. `pscore.py` slices using the **map's per-function address+size** (a fixed
offset slides every later slice once a body changes length).

`rel_rowcount.py` has the complementary hole: **its entry heuristic requires
`mflr`/`stwu`, so it MISSES LEAF FUNCTIONS.** test_mode's second-largest
conversion (84 insn) starts with a bare `lis` and was invisible to it and to the
recon; it was found by reading asm. **A leaf-aware entry scan is unfinished work
in every module.**

### THE COUNTING FINDING, PART 2: classify per FUNCTION, not per ROW

§0.14 established that a row is a file. Run 9 shows the reachability tables
inherited that bug in the other direction: **one `bctr` (or one `lis rN,0x4330`)
in a row condemned every sibling in it.** test_mode re-derived per function:

| | run 8 (per row) | run 9 (per function) |
|---|---|---|
| c-FREE | 20 fns / 4,432 | **47 fns / 5,874** |
| d-JUMPTBL | 5 / **3,514** | 5 / **2,632** |

**+1,442 insn appeared with no work done.** A 1,169-insn row written off as a
jump table holds three `bctr`-free functions worth 484; a 385-insn a-BLOCKED row
holds seven clean functions, six of which were converted. **Instruction totals are
unchanged — only classification.** Every module's table needs this treatment;
only test_mode, mini_fight, mini_billiards and mini_pilot have had it.

And **mini_race falsified §0.14's own function counts**: `lbl_0001157C` = 19 and
`lbl_00012D50` = 8 are **not established** — both rows contain `bctr`, and the
detector cannot tell a jump-table arm from a function start, so it over-splits
(21 and 10, with 1- and 3-instruction phantoms). `lbl_000008B4` = 15 IS confirmed.

### §2 IS ONLY HALF TRUE — and the counter-example is cheap

Partial conversion of a group file works, but **mwcc's address-fold peephole is
ALSO disabled in a mixed TU**, not just the scheduler and peephole. Nearly every
mini_race function loads a scalar module global. Same C body:

| `lbl_00001FDC` (15 insn) | result |
|---|---|
| in `mini_race_9.c` with 14 asm siblings | **4 in 3** |
| alone in `mini_race_9o.c` | **MATCH** |

The wrong words are `lis;addi;lwz 0(rX)` instead of `lis;lwz @l(rX)`.
**RULE: if a residual is an unfolded `@l`, stop sweeping and isolate.**

### THE RECON ERROR THAT KEEPS PAYING: only the SIGNED magic was ever tested

Three modules found hidden magic doubles by adding `43300000 00000000`:
- **sel_ngc — this FALSIFIES run 8's "capped at ~32%" verdict.** `lbl_00011EC8`
  sits unowned in the data blob; its carve is **landed and gates GOLDEN**, and
  run 10's hand-over is "decompile one function, delete one SOURCES line."
  Ceiling corrected to **34.0%**, and run 8's "HARD STOP" at `lbl_0000C518` is a
  scheduler risk (bounded by §2), not a wall — a further 1,649 if it holds.
- **mini_bowling had three uncarved magics, not two** (`recon8.py` tested
  `words[:2] == ['0x43300000','0x80000000']` only).
- mini_billiards re-confirmed its six.

**Structural bound proved (sel_ngc): signed and unsigned magic can never share an
object** — a TU doing both emits them adjacent.

### CARVE: mini_golf's 17,209-insn plan is MECHANICALLY PROVEN

Run 8 costed it; run 9 built it. **All six holes carved simultaneously, module
gates GOLDEN.** Each hole is filled by a data-only `.s` object at its owning
`.c`'s SOURCES position — byte-equivalent to the `.c` emitting the 8 bytes itself,
since a pure-C object reading its pool externally emits no `.rodata`.
**Segmentation, hole ordering, zero-size aliasing and the SOURCES interleave are
all correct for the whole plan at once.** The tool confirmed the loosened
ownership rule five times in its own output. `--from 36fe55d` reproduces the
committed carve byte-for-byte. **Rank 1 does NOT need the `lbl_00012EEC`
isolate.** Script: `_scratch_mini_golf/carve_all.py`, re-runnable.

Two corrections in the other direction:
- **option's carve is worth ~2,055, not 3,389.** `lbl_00008068`(627) is the sole
  solo-eligible owner of hole `lbl_0000C4B0` **and is itself blocked — that hole
  is worth 0.**
- **mini_pilot's `0xC6D8` is NOT gated on `lbl_0000B130`** (an orchestrator
  relay, checked with the tool rather than argued): `--into src/mini_pilot_50d.c`
  is accepted, giving `lbl_0000B624` (+298) or `lbl_0000BACC` (+234) with **no
  prerequisite at all.**

### TWO NEW FICTIONAL-MATCH MODES, both inside run 8's own tools

- **`rel_rematch.py` SILENTLY DELETES CODE.** It reconstructs `--extra-start`
  only from pure-C files, so a still-asm label `rel_split` cannot auto-detect
  merges into its predecessor — and **if that predecessor is already pure C the
  instructions vanish from `.text`.** test_mode lost 48 instructions to a
  **clean, warning-free, non-golden** build whose only symptom was the hash.
  Workaround: pass every still-asm row label via `--extra-start-file`. Real fix:
  derive extra-starts from group files' asm-include set too, and **hard-fail if
  the re-split changes the total instruction count.**
- **`rel_ascore.py` scores against a STALE `.plf` after a failed build.** Its
  "still an asm stub" guard reads the current `src/` tree, so a label that is C in
  source but asm in the surviving binary reports a confident `ALIGNED 0 — MATCH`.
  **test_mode got three fictional matches this way.** `rm -f mkbe.<mod>.plf`
  before every score.

Also: **`isolate.py` names its output `<stem>i.c` unconditionally**, so isolating
a second function out of an already-split group **silently destroys the first**,
exit 0 (mini_billiards). And `rel_carve.py --hole LABEL` means *all bytes of that
label's run* — carving a long-run label without `:8` deletes real data and exits 0
(mini_bowling). And `rel_xref_spine.py` is **hard-coded to mini_race**.

### IDIOMS ARE CONDITIONAL, NOT GENERAL — four modules found the conditions

This is the most useful methodological output of the run. **An idiom ported
without sweeping its axis is now a known way to lose builds.**

- **Run-8 idiom 9 INVERTS.** test_mode: a `u8 *` base lets mwcc *rematerialise and
  sink* the base past calls into a volatile, where a typed base keeps it
  callee-saved (31 in 11 -> MATCH) — the **exact opposite** of what run 8 recorded.
- **mini_race supplied its missing precondition:** `((T *)(base + K))[i]` folds K
  into the load displacement **only when `base` is a `u8 *`** (two functions stuck
  at 3-in-1 through nine spellings, both MATCH on retyping). And the inverse holds
  in the same module — a typed struct pointer is materialised *eagerly* into a
  callee-saved register; `u8 *` is *sunk* to first use. **Both types are needed,
  chosen by whether you want the address hoisted or the constant folded.**
- **mini_fight narrowed run-8 idiom 8:** the struct-array form is decisive on a
  genuinely *indexed global byte array* (9 in 3 -> MATCH vs 16 flat byte-pointer
  spellings); the discriminator is `global_array + idx*stride + off`.
- **mini_billiards made run-8 idiom 1 per-site:** the *direction* of the struct-copy
  pointer local is the axis, and two sites in one function can want opposite
  directions (0 / 2 / 5 / 7 across the four combinations).

### NEW IDIOMS — ranked, all proven by a golden build

1. **A base address the original RE-MATERIALISES (`lis/addi`) in more than one
   region is a DIRECT GLOBAL EXPRESSION, not a pointer local** — the tell is a
   reload into a callee-saved register that was never clobbered. 186 -> 83.
   **Grep the asm for a repeated `lis <sym>@ha`.** And the second-order finding
   that explains why past runs missed it: **the declaration-order lever only
   becomes visible after the globals are spelled right** — with the pointer local
   present, all six permutations were flat at 186; once removed, swapping two
   declarations gave **0**. (mini_billiards)
2. **A NESTED ASSIGNMENT forces mwcc to evaluate the RIGHT subtree first.**
   `x0 = v.x - (hw = 4.0f*s/3.0f);` scored **0**; the same arithmetic as two
   statements scored 6. mwcc pushes FP temps in evaluation order and a binop
   result reuses only the stack top. **The general lever for "the instructions are
   right but three volatile FP temps are rotated".** (mini_golf)
3. **A pointer local assigned `&global` is materialised into a scratch and copied;
   a compiler-created induction variable from an INDEX loop gets the address
   straight into its register.** The lever is the **loop form**, not the address
   spelling: rewriting `e = &tbl; while (e->x != -1) ++e;` as an indexed `for`
   took 3 -> 0 while 11 address spellings held at 3. **Collapse the user variable
   out of existence rather than respelling its assignment.** (mini_pilot)
4. **A pointer used only as a loop induction variable must be assigned LATE**, not
   at its declaration — initialising at the top costs a callee-saved register and
   computes `i*S+base` in the preheader. Four late-assigned shapes all MATCH; the
   same shape initialised at declaration scores 8. (test_mode)
5. **`switch` CASE BODIES are emitted in source order even when the compare tree
   is a binary search** — read the body order off `.text`, not the tree. Worth
   -121 aligned in one edit. (sel_ngc)
6. **mwcc's stack layout is REVERSE declaration order — first-declared gets the
   HIGHEST address. Read the frame backwards and you have the declaration order.**
   Worth 52 aligned diffs in one edit. A local **array** declared last gets the
   **lowest** slot; dead scalars are eliminated, dead arrays are not.
   (mini_fight, sel_ngc)
7. **Declared FP locals map onto callee-saved FPRs in declaration order, highest
   first — but a compiler TEMP that must survive a call is allocated FIRST and
   steals f31**, pushing every declared local down one. Naming the temp restores
   the mapping (10 -> 6). (mini_golf)
8. **Which of two pointers into one record is "primary" decides the register the
   base sum lands in.** `p = base + i*S; q = p + K;` vs `q = base + i*S + K;
   p = q - K;`. 4 in 2 -> MATCH after 25 other variants were flat at 4.
   (mini_fight)
9. **`if (a >= b) return;` on floats emits `fcmpo; cror 2,1,2; beq`; the
   original's bare `bge` requires `if (a < b) { body }`.** The `cror` word
   **`4C411382`** is a greppable tell. (mini_fight)
10. **Dead stack locals are frame-size-EXACT, not count-exact, and POSITION
    matters** — six wildly different declarations all match at the right total
    size; the same pads declared *after* the array score 24. **And they reach
    REGISTER allocation, not just frame layout** — one moved a clean 2 in 2 to
    7 in 4. Sweep it; never assume the direction. (option, test_mode)
11. **A variable-index inner loop over a local array reserves 12 bytes of frame
    that no source local occupies.** Deleting the index variable and reading
    through a pointer local took 48 in 18 -> 9 in 6, where no pad count, type or
    order moved it while the index existed. (option)
12. **`((struct T *)(base+K))[i].f` and `*(T *)&((u8 *)(base+K))[i*S]` are NOT
    interchangeable** even computing the same address — **9 vs 92**. The struct
    form reproduces mwcc's out-of-line remainder-loop preheader, the pointer form
    the `stbu`-folded rebase, **and you cannot have both.** (mini_billiards)
13. **Two spellings of the same field DEFEAT a CSE** — 8 -> 1 by writing the guard
    `*(u16 *)(w+0x2A) & 0x10` while the following read/modify used `s->unk2`;
    making both `s->unk2` lets mwcc CSE the load. Rewriting *all* accesses
    w-relative was worse (23). (mini_race)
14. **`done |= X;` puts the OR accumulator on the LEFT; a single `a|b|c|d` puts it
    on the RIGHT** — in all 24 orders. (sel_ngc)
15. **`t = *(T *)expr; dst = t;` allocates a stack temp; `dst = *(T *)expr;` does
    not.** The original's frame size is ground truth for how many temps to name.
    (mini_fight)
16. **mwcc reserves a parameter-home area of `nparams * 4` at `r1+8`** — read the
    parameter count off the stack offsets before writing C. (sel_ngc)
17. **Pointer TYPE in a copy loop changes the STACK FRAME SIZE.** (mini_billiards)
18. **Run-8 idiom 2 (union for 8-byte alignment) works on a struct with NO 8-byte
    member**, moving a 0x5C struct from r1+0xC to r1+0x10 (15 -> 10). A *trailing*
    `f64 pad` is dropped entirely; a *leading* one fixes only the frame size.
    (mini_golf)

**NEW DEAD AXES — proven, do not re-sweep:** `(unsigned)x >= 0` folds in **every**
spelling (21 forms byte-identical), so the `li/li/subfc/subfze` group is **mwcc's
switch range-check prologue**, not an unsigned relational (mini_golf); `f64`
declaration order in mini_billiards `lbl_00018474` (15 groupings, 11 identical);
the two-term dot-product spellings (byte-identical); 726 declaration-order
permutations of six integer locals in mini_pilot `lbl_0000A098` (all >= 15).

### THE GENERALISABLE RULE OF THE RUN

**Re-test every near-miss whose draft hand-rolls something since promoted into a
shared header.** mini_bowling's `lbl_00001B14` was shelved at "18 in 3" and is
**one `CAMERA_FOREACH_2` call** — the macro landed in `src/camera.h` at `42fc57c`
*after* run 8 ended, so it was never re-tested. The same fix halved
`lbl_00001908` (12 in 8 -> 6 in 5). **Span, not the count, is what exposed it:**
18 diffs spanning only insn 73-86 of 92 was difflib counting a register-renamed
block.

### RE-MEASUREMENT: correctly scoped, and mostly clean

§1 of RUN9_BRIEF led with re-measuring. The result validates mini_fight's run-8
exposure analysis rather than run 8's alarm: **mini_bowling re-scored all ten of
its residuals and every number reproduced exactly; mini_billiards found no
inherited number wrong** (run 8 had already scored it with an aligned differ).
**The exposure really was raw-only sweep directories.** Where numbers did move
they moved **both ways** — option found two residuals *worse* than recorded
(25->32, 6->7) and two raw figures corrected sharply down (82->37, 98->30);
sel_ngc found one at 162, not the recorded 110.

### DEAD ENDS RETIRED ON POSITIVE EVIDENCE

- **mini_pilot `lbl_0000B130` — CLOSED.** 20 statement-structure variants, ten
  scoring exactly 7 in 4; the two that differ both hoist the load into
  callee-saved f30 with +8 frame, exactly run 8's predicted mechanism.
- **option `lbl_00007868`/`6AD0`/`5020` — NOT SOURCE-REACHABLE**, proven with a
  **20-line compile-only micro-benchmark**: an address local used bare (offset 0)
  anywhere is materialised into a volatile before frame setup and copied after the
  saves; nine workarounds all still trigger it. **8 functions / 4,261 insn sit
  behind this, all still asm, and none of the 43 converted functions has that
  prologue.**
- **mini_billiards `lbl_0000D7E8`+`lbl_0000E3A4` (1,082 insn)** — need the
  `lbl_0001CF50` hole owned by `_34.c`, but the `bctr` function `lbl_0000D330`
  sits between them in `.text`.
- mini_bowling `lbl_0000EC38`(12 in 9, 83%), `lbl_00004BD8`(14 in 10, 64%),
  `lbl_00003A10`(26 in 17, 59%); mini_pilot `lbl_00009C18`(205); test_mode
  `lbl_00009560` (dead code in the original).
- **RE-CONFIRMED, not restarted:** mini_golf `lbl_000109CC` (14 in 14),
  mini_billiards `lbl_00006DC0`, test_mode `lbl_0000F940` (50 in 12, 89%).

**FALSIFIED:** run 8's "316 insn behind the `REPEAT_WITH_R_ACCEL` lever, and
cracking `lbl_00000780` very likely carries `lbl_0000D084`". `lbl_00000780`
cracked (7 in 3 -> MATCH); the identical lever moved `lbl_0000D084` **23 in 12 ->
59 in 25** across all nine variants. **The real figure was 98.** The two differ
because one has a store between the macro uses that kills the CSE.

### THE MICRO-BENCHMARK IS THE METHOD CHANGE WORTH KEEPING

option's `micro/mk.sh` and sel_ngc's `run9/fprobe.py` both compile **without
linking** (~1 s, or 4x faster than a make round-trip) and answer "what does mwcc
do with X?" independent of any function. That is how option proved its wall and
how sel_ngc found three idioms. **Caveat: a `.plf`-based probe is WRONG on
truncated bodies** — it reads past the function end into the next one.

### RUN-10 PREP DONE (post-run-9, commit `a80b64f`)

- **Pushed**: `fork/wip/rel-drafts-and-dol-matches` at `f470ac9` (was `354f976`).
- **`tools/rel_ascore.py` had THREE defects, all fixed and regression-tested**
  against 577 converted functions across all nine modules (0 non-zero):
  it masked every branch displacement (so branch-only controls were invisible);
  it scored a stale `.plf` after a failed build (three fictional MATCHes); and
  it scored a whole ROW as one function. It now prints a **per-function
  breakdown** automatically, taking expected boundaries from the label names and
  got boundaries from consecutive map addresses.
- **`tools/rel_rowcount.py`'s branch regex was wrong**: `(?:[^,]*,\s*)?` matches
  newlines, so it ran past the end of the line, captured a label from an
  unrelated instruction and MISSED the real target. A 61-instruction function
  counted as five. **Project total corrected from 940 rows / 50 multi-function /
  211 unaccounted to 992 / 29 / 159.** `lbl_000008B4`=15, `lbl_00010B98`=4 and
  `lbl_000022D8`=21 survive; **`lbl_0001157C`=19 and `lbl_00012D50`=8 remain
  UNVERIFIED** (both rows contain `bctr`).
- **Promoted**: `tools/rel_ssplit.py` (row -> per-function bodies; refuses `bctr`
  rows) and `tools/rel_isolate.py` (the fixed isolate, now `--tree`-aware).
- **All nine warm copies RESET to `a80b64f`, clean, each rebuilt to its golden
  sha1 with `rel_sweep --gate` from DELETED objects.** `fail=0`. Re-run with
  `C:/tmp/smbm/warm_reset_run10.sh`. CW temps `C:/tmp/tmp_<mod>` exist.
- **`C:/tmp/smbm/RUN10_BRIEF.md` is written** — hand it to every module agent. It
  leads with the control/scorer failure, not with a target list.
- **`C:/tmp/smbm/RUN9_RESULTS.md`** holds all nine per-module reports.
- Still NOT promoted (worth doing): the compile-only micro-probe (option's
  `micro/mk.sh`, sel_ngc's `run9/fprobe.py`), mini_golf's `regions.py`, and an
  aligned-ranking `--sweep` inside `rel_sweep.py` (it still ranks on RAW).
  `rel_xref_spine.py` is still hard-coded to mini_race.

### STATE FOR RUN 10

- **All nine warm copies merged** with `rel_merge_back.py --all`; each rebuilt
  GOLDEN in the main tree on merge.
- **Verified by a completely clean build**: every object, `.rel`/`.plf`/`.map`,
  the `.dol` and `.elf` deleted first, then `make all` from nothing —
  **1,167 objects, `sha1sum -c supermonkeyball.sha1` = all 12 OK.**
- **All nine pass `tools/rel_structcheck.py`** in the merged tree.
- Diff scanned for game binaries first (`.dol/.elf/.rel/.plf/.o/.map/.bin/.a/.exe`,
  `baserom*`) — clean; **288 files: 205 `.c`, 82 `.s`, 1 Makefile.**
- **`C:/tmp/smbm/RUN9_RESULTS.md`** holds all nine per-module reports — every
  idiom, residual and tool bug in the agents' own words.
- Warm copies are at run-9 state, NOT reset. `C:/tmp/smbm/warm_reset_run9.sh`
  is the model for a run-10 script (fetches from the main working tree by path,
  since the commits are local).

### TOOLS TO PROMOTE BEFORE RUN 10 — this is the run's highest-value follow-up

Six agents independently built tools that work around the same three gaps.
**Promote these before writing RUN10_BRIEF, or six agents will rebuild them
again:**

1. **Per-function scoring** — `_scratch_mini_fight/pscore.py` + `pasweep.py`
   (slices by the map's per-function address+size). Fixes `rel_ascore`'s row bug.
2. **Row splitting** — `_scratch_mini_race/ssplit.py`. Splits a row's `.s` into
   per-function bodies and rewrites the owning `.c`; byte-neutral, GOLDEN over 9
   rows. **Refuses any row containing `bctr`**, and preserves the row label's
   existing parameter list. This is what turns "that row is 15 functions" into
   converting one of them.
3. **Fixed isolate** — `_scratch_mini_race/isolate9.py` (suffixes b-z, strips
   `static` from shared forward decls, **keeps C preceding the first asm block** —
   run 8's version silently deleted it).
4. **Region contents** — `_scratch_mini_golf/regions.py`.
5. **Compile-only micro-probe** — option's `micro/mk.sh`, sel_ngc's `fprobe.py`.
6. **Aligned-ranking sweeper** — five agents wrote one (`asweep.py`, `asw9.py`,
   `h.py`). `rel_sweep --sweep` still ranks on RAW.
7. **Fix in place:** `rel_ascore.py` (stop masking branch displacements; stat the
   `.plf`), `rel_rematch.py` (extra-starts from group files, hard-fail on
   instruction-count change), `rel_rowcount.py` (leaf functions),
   `rel_xref_spine.py` (un-hard-code mini_race), `isolate.py` (don't clobber),
   `rel_carve.py` (default `:8`, or refuse a bare long-run label).

### NEXT RUN — ranked

1. **Promote the tools above.** Six agents rebuilt the same three workarounds this
   run; that is pure waste and it is fixable in one sitting.
2. **mini_golf: TAKE THE CARVE — 17,209 insn, proven, one command.**
   `lbl_00013664`(1,967) is the smallest member of rank 1 and its family is
   nlSprPut/text-draw, with two matched in-module templates. Largest single
   opportunity in the project by a wide margin.
3. **sel_ngc: the unsigned-magic carve is LANDED** — decompile `lbl_0000F788`(417)
   or `lbl_00011424`(153) and delete one SOURCES line. Then test whether
   `lbl_0000C518`'s "HARD STOP" is really just a scheduler risk (+1,649).
4. **mini_fight: 2,050 insn never started**, all surveyed. `lbl_00004D14`(438) +
   `lbl_00004498`(543) are in single-asm-block files — no isolate — and
   `lbl_00004D14` is the direct sibling of the now-matched `lbl_00003DE0`, so
   `src/mini_fight_10.c` is a live template. **Best 981 insn in that module.**
5. **test_mode is FULLY ISOLATED** — 55 asm stubs in 55 files, zero group files,
   so every conversion gets the scheduler for free. `lbl_000057C0`(908) is the
   same family as everything that matched this run and **the macro wall is down**.
   Also: run a **leaf-aware entry scan** here first.
6. **mini_race: 40 fns / 5,065 insn carve-free, and `mini_race_28.c` now has zero
   setup cost.** Cheapest-first: `lbl_00000FB4`(35) `lbl_000055CC`(48)
   `lbl_00005C20`(51) `lbl_0000BCE8`(58) `lbl_00005998`(59) `lbl_0000480C`(65).
7. **mini_billiards `lbl_0000A054` (2,094) has now gone TWO runs unstarted** and is
   39% of the module's carve-free remainder. Assign it explicitly or drop it.
8. **mini_bowling's magic map is a MERGE problem, not a carve problem** —
   `lbl_00010D58`+`D60` gates **3,372 insn** behind one object emitting both
   magics. The right question is `grep -l 'lbl_XXXX@' asm/nonmatchings/*/*.s`,
   never `rel_carve --list`.
9. **Re-derive every module's reachability table PER FUNCTION** (§ above). Only
   four of nine have had it; test_mode gained 1,442 insn of classification.
10. **mini_pilot: two no-prerequisite carves** (`lbl_0000B624` +298 or
    `lbl_0000BACC` +234) plus `lbl_0000A754`(390), the largest untouched
    carve-free target.
11. **option is the most constrained module** — 8 functions / 4,261 insn behind a
    proven-unreachable prologue, and its carve is 2,055 not 3,389.
    `lbl_000021D8`(293) and `lbl_00003240`(410) are never-attempted and have the
    naturally-hoisted prologue.

---

## 0.14 — RUN 8 DONE (2026-07-28): +4,377 insn, 14.81% -> 17.11%. Superseded by §0.15.

Nine parallel agents, one per module. **The rate declined — this is 58% of run
7.** Two modules finished at or near zero, and three of the nine produced their
instructions only in a reopened follow-up round rather than the main pass.

| module | funcs | insn | % | gained |
|---|---|---|---|---|
| mini_bowling | 78/120 | 4966/15313 | 32.43% | **0** |
| mini_pilot | — | 3353/12137 | 27.63% | +1 fn / +73 |
| mini_race | 91 defs | 5214/19817 | 26.31% | +16 fns / **+1,817** |
| sel_ngc | 49/73 | 3807/18084 | 21.05% | +1 fn / +159 |
| test_mode | 55/99 | 2834/16231 | 17.46% | +6 fns / +781 |
| option | 42/71 | 1929/12375 | 15.59% | +1 fn / +325 |
| mini_fight | 94 defs | 3620/28588 | 12.66% | +8 fns / +631 |
| mini_golf | 81/118 | 4369/38919 | 11.23% | +1 fn / +325 |
| mini_billiards | 30/70 | 2457/28793 | 8.53% | +1 fn / +266 |
| **TOTAL** | | **32549/190257** | **17.11%** | **+45 / +4,377** |

Note the run-7 total was **8 insn too high** (28,180 should read 28,172) — the
recon regex bug below. The 14.81% figure is unaffected at 2dp.

**The run's value is not the instructions. It is six corrections, every one of
which had made the remaining work look harder than it is.** Runs 5, 6 and 7 each
falsified inherited "confirmed" facts; run 8 falsified the *measurements
themselves*, which is worse and more valuable.

### THE BIG LESSON: the project has been measuring wrong for at least two runs

1. **Raw diff counts misrank sweeps, and `rel_sweep --sweep` ranks on them.**
   mini_fight's matching variant for `lbl_0000EA10` scored **raw 116** against a
   non-match at 63 — ranked **53 places worse**. It was a byte-exact match the
   sweep had already found and thrown away; re-ranking recovered 121 insn.
   mini_golf's winner read **raw 319 / aligned 0**. test_mode's best
   `lbl_0000F7BC` variant sat at the bottom of every sweep and is **aligned 5
   with the correct frame** — the frame problem it spent ~150 builds on only
   existed because raw hid the simpler form.
2. **Run 7's residual table is in those raw units** — so is every "retired"
   verdict built on it. mini_pilot re-measured: `lbl_000007B8` recorded 49 is
   **3**; `lbl_000097C8`, **retired** at 16 after 104 variants, is **3**.
   **A function was retired on a number wrong by 13.** But do NOT assume a
   direction: mini_golf's run-7 agent mixed `mset.py` and raw numbers, so one of
   its residuals was recorded *below* its true aligned value. **Just measure.**
3. **Judge on region count, span and causality — never the bare number.**
   1-3 regions = localised tie, grind it. regions ≈ count = whole-function
   allocation mismatch, retire. Many regions + high count = still a
   *translation* problem, rewrite the body. This retired mini_golf
   `lbl_000109CC` on **positive evidence** (14 aligned across 14 regions) — the
   first time this project has retired anything for a reason rather than
   exhaustion. **Three caveats, each found the hard way:** regions can be
   concentrated in a prefix (mini_fight: 8 regions inside the first 27 of 139);
   N regions can be ONE substitution repeated per unrolled iteration
   (mini_fight); and regions can be *causal* — mini_race's regions 2 and 3 were
   downstream of an `extsh` CSE in region 1, deciding a register 7 and 12
   instructions later. Converse too: mini_pilot's `lbl_000097C8` is 3-in-3, a
   textbook "retire", yet all three are one `lis` displaced by 14 slots.
   **`tools/rel_ascore.py` prints count AND span. Use it, not `adiff.py`** —
   adiff reads n+12 words past the function and under-reported two residuals.

### THE STRUCTURAL FINDING: isolate scripts are a precaution, not a prerequisite

**A group file can be converted PARTIALLY.** mini_race matched `lbl_0000D8EC`
and `lbl_00004634` with asm siblings left in the same TU — `mini_race_28.c` has
**five** — and the module gates GOLDEN. Verified properly: built one both ways,
sibling as asm and as C, **identical bytes**.

This does not falsify §3. mwcc really does disable the scheduler and peephole
for every C function sharing a TU with an `asm` block; what it shows is that
**some functions don't need them**. So a match in place is proof for that
function only — confirm by building both ways before relying on it.

Consequences: try in place → gate → isolate only on failure. `mini_race_28.c`
went from a 1,454-insn all-or-nothing bet to **six independent bets with zero
setup**. Worth most to mini_fight, where `rel_rematch` destroys the tree two
ways. `tools/rel_structcheck.py` reports a mixed TU as a NOTE, not a failure.

### THE COUNTING FINDING: a recon row is a FILE, not a function

`rel_rowcount.py`, run on the merged tree: **940 rows, 50 hold more than one
function, 211 functions unaccounted for** in every module's reachability table.
(mini_race measured 935/52/214 pre-merge; test_mode's re-split moved it.)

**`lbl_000008B4` is not a 1,497-instruction function — it is 15 functions**
averaging ~100 insn, each with a complete prologue and epilogue, none referenced
from `.data`. Verified by hand. Every brief since run 6 has called it the
project's largest reachable target and a whole-run job. Combined with partial
conversion it is now one of the *safest* targets in mini_race. Same for
`lbl_0001157C` (19 functions, written off as jump-table at 1,197 insn),
`lbl_00012D50` (8), `lbl_00008C4C` (5).

**Instruction totals are unaffected** — only function counts. And do not use the
cheap heuristic: "a label after `blr` is a new function" invents 8 phantom files
and 20 phantom bodies in one file on mini_pilot, because early returns are
followed by ordinary branch labels. Use "never branched to within its own file",
or `rel_split`'s generated declaration list.

### THE CARVE FINDING: the ownership rule barely binds

`rel_carve.py`'s `--into` refusal only fires when the constant's **first user is
already C** (`defining_file()` returns None for an asm stub, so `expect` is None
and the check is skipped — verified by reading the source). **First user still
asm ⇒ any `.c` may own that hole.** You do not have to convert the first user.

That misreading alone had frozen **~17,000 insn in mini_golf**, whose 7,131-insn
`lbl_0001B5B8` was written off for being the *fifth* user of its magic double.
Its costed plan: **17,209 insn behind five 8-byte carves and one isolate.**

**The real constraints, which do still bind:** `.rodata` follows SOURCES order,
so among objects that actually emit `.rodata` their SOURCES order must match
hole order; **each magic double can be emitted by exactly one object** (this is
what caps mini_race's 8-double programme at ~3,900 insn, not 7,509); and a
pure-C object that only *reads* pool constants externally emits no `.rodata` at
all and does not participate in the ordering.

**One object may hold SEVERAL functions if they are contiguous in `.text`, and
emits the magic once** (option). That is why option's carve plan is worth
**3,389 insn, not 1,349**: `lbl_00000C94` and `lbl_00001598` are adjacent
(0xC94 + 577*4 = 0x1598), so you take both, not "one only".

### `--gate` GOLDEN DOES NOT PROVE THE SOURCE IS SOUND

test_mode shipped a file with a **duplicated preamble and a stray second
`#pragma force_active on`** that gated GOLDEN and reported MATCH. The corruption
was **semantically empty** — repeated declarations emit nothing, `force_active
on` is idempotent, `.text` untouched — so it would have broken the next
`rel_rematch`, not this build. Cause: extracting a body with
`src.index('void lbl_X(void)')`, which matches the forward *declaration* first.

**Run `tools/rel_structcheck.py <module>` before reporting.** All nine modules
pass in the merged tree.

**The `objdump -h` close-out check must be "no *unexpected* non-`.text`
content", NOT "`.text`-only"** — mini_fight has three untouched objects carrying
8 bytes of `43300000 80000000`; those are its magic-double hole owners working
as designed. Whitelist the 8-byte doubles or baseline-diff. `<math.h>`'s 16
bytes is still caught.

### FOUR WAYS A SWEEP LIED — all found by a deliberately-wrong control

The control variant is the only thing that distinguishes "mwcc canonicalises
this axis" from "my sweep never ran". **Always include one, and make it
STRUCTURALLY wrong, not subtly wrong** — test_mode's one-instruction mask
control scored identical to baseline on raw and 10-vs-7 on aligned.

- **`genvar.py` copied the file's existing forward declaration verbatim**, so
  any variant with a different parameter list became a bare `FAIL` — **86 of
  132** in one sweep, silently reporting a hypothesis as exhausted that was
  never tested. mwcc sometimes compiles it anyway and reports `undefined
  identifier` **at the function body**. Fixed as `tools/rel_genvar.py`. Same
  root cause: **`rel_split` preambles declare every function `void lbl_X(void)`.**
- **`python - <<'PYEOF'` heredocs double backslashes**, turning C
  line-continuations into literal `\n` — 48 of 49 variants failed to compile
  (mini_bowling). Write generators with a file write, not a shell heredoc.
  *(I hit this myself while promoting the tools.)*
- **A bare `str.replace(old, new, 1)` patched the wrong one of two identical
  lines** in a two-function file — six "variants" that were the same file
  (mini_race). **This will recur**: 50 rows hold sibling functions that share
  idioms and therefore share lines.
- **`rel_sweep` does print `FAIL` — it sorts it last**, so piping through
  `head -N` re-creates the bug by hand (test_mode). The tool is fine; the usage
  was not.

### NEW IDIOMS — ranked, all proven by a golden build

1. **Struct-copy codegen is governed by the live-value SET and RANGE, not by
   spelling.** mini_race swept nine spellings to exhaustion; none changed the
   live set. `Vec *pt = &t; dir = *pt;` — one extra live value — took
   `lbl_0000B2F0` from 5 diffs to MATCH. Then the refinement: declaring it at
   the top gives **2 in 1**, but declaring it uninitialised and **assigning it
   one statement before the copy** gives **MATCH**. Same semantics, same live
   *set*; the live **range** was the last two instructions. Four *wrong* live
   values scored 161/91/138/66. **Merged rule:** cast the second statement's
   source to change *whether* the temp survives; add a pointer local to change
   *which registers* it uses; control *where you assign* it to change the
   surrounding pressure. **Boundary:** it governs scratch-register selection in
   a block copy and does NOT reach FPR allocation in a scalar chain.
2. **An 8-byte-aligned stack temp means a `union`, not a `Vec`.** `Vec a; Vec b;`
   are 4-aligned; the original's compiler temporaries were at 0x08/0x18 with
   frame 0x28. `union PilotV { Vec v; f64 align; }` reproduces it. 11 -> 0.
3. **mwcc fully unrolls small constant-bound loops containing a `break`.** A
   9-way `if/else if` chain stuck at 10 diffs went **10 -> 0** as a `for` loop.
4. **Two globals competing for a register are decided by source REFERENCE
   ORDER, not use count.** Proven on three different pairs: mini_golf (writing
   the struct copy first hoisted `&stageBoundSphere` into a callee-saved reg,
   27 -> 12), mini_bowling twice (`cameraBackup` before `camera` swaps r3/r4
   while staying fused, 22 -> 10; and `ballInfo` before `g_poolInfo` fixes an
   `@ha` pairing outright). **Statement order, not just declaration order.**
5. **Use `__fabs(x)` with NO `<math.h>`.** Identical codegen, but the header
   emits **16 bytes of `.rodata`** for an unused inline sqrt that passes the
   per-function diff and fails the module gate. Calling `fabs` with no
   declaration at all is worse still — implicit `int fabs()` emits a real `bl`
   plus an int->double conversion (51 diffs).
6. **A `.rodata` block that is exactly one function's constants in first-use
   order, f64s first, IS that function's literal pool.** Dump the pool before
   grinding any pool-reading near-miss; sel_ngc had spent two runs treating the
   symptom. And when that pool belongs to the last object in SOURCES, the carve
   is `.if 0` + one SOURCES move — no `rel_carve`, no segment file.
7. **The pool-base spelling lever INVERTS between modules — sweep it, never
   port it.** option: `f64 *c` scored 75, `u8 *c` scored 315. mini_golf: `u8 *c`
   scored **0**, `f64 *c` **55**. The discriminator is the pool LAYOUT —
   option's constants are a contiguous per-TU block, golf's are scattered at
   large non-uniform offsets with one not 8-aligned. `((f32 *)c)[N]` is a third
   distinct form, worse than both in option. mini_fight swept all three with
   controls: **identical** there, and its clean-looking correlation was an
   artefact.
8. **A struct-field array access keeps a constant as a load displacement; byte-
   pointer arithmetic never does.** `((struct T*)base)->arr[i]` gives
   `add rD,base,i / lbz 0x148(rD)`; all four pointer spellings give
   `addi rD,i,0x148 / lbzx`. **But it does not generalise** — mini_fight found it
   strictly worse on a non-indexed field read off a saved base (2 -> 6-8) and an
   exact tie on a genuine indexed struct array.
9. **A `u8 *` base with `*(int *)(p + K)` casts makes mwcc hoist `p+K` into
   callee-saved registers; a typed pointer keeps plain displacement addressing.**
   91 -> 25 on one build (test_mode).
10. **Chained assignment gets "one load, N stores" from a repeated global read**
    — `a->x = a->y = a->z = *(f32 *)lbl_X;` took 102 -> MATCH and gave the
    original's reverse store order for free (mini_race).
11. **`(Vec *)(p + 0x38 + i*0xC)` beats a `q` pointer walked with `q += 0xC`** —
    the explicit pointer lets mwcc *coalesce* `q` into `p`; the index form
    builds a derived IV. 152 -> 1. Mirror image of "one extra callee-saved
    register means a pointer local that shouldn't exist" (29 -> 10) — **both
    directions occur, sweep both.**
12. **`if (x == 0x10 || x == 0x12)` is NOT the equivalent `switch`** — the
    switch emits a binary search pivoting at 0x11 with signed `cmpwi`; `||`
    emits the original's linear `cmplwi` chain. **And the `bne next; b out` pair
    §0.12 calls "the switch tell" is ALSO what a two-term `||` produces** — that
    diagnostic has been giving false positives.
13. **Dead stack locals are load-bearing and size-exact.** mwcc allocates a slot
    for every declared local including unused ones; test_mode needed **five**
    unused `int`s to reproduce a 24-byte local area (7 -> MATCH), option needed
    exactly 2 pads (1/3/4 all wrong). **But it is module-dependent** —
    mini_bowling swept it and trailing pads did not move a stack slot there.
14. **Declaration order of `f64` locals maps 1:1 onto FPRs ONLY when declaration
    order already equals first-assignment order.** mini_golf *computed* the
    target order and scored 7; the literal source order scored **0**. Sweep it,
    do not compute it.
15. **`for`-init clause placement is a DEAD axis project-wide** — 24 variants
    moving one, two or all three initialisations into `for (...)` in every
    order all scored identically. mwcc canonicalises it. Never sweep it again.

### DEAD ENDS RETIRED ON POSITIVE EVIDENCE — and one that reopened

- **mini_golf `lbl_000109CC`** — 14 aligned across **14 regions**, a
  whole-function allocation mismatch. Retired for a reason, not for exhaustion.
- **mini_billiards `lbl_00006DC0`** (646 insn, 1 aligned) — `mr r7,r6` is NOT an
  argument copy (I misread it as one; there is no `bl` between the prologue and
  `0x6E64`, and the golden output contains `li r6,1`, so the value is a
  materialised constant). ~40 computed-initialiser shapes across 10 sweeps.
- **mini_pilot `lbl_0000B130`** (7 in 4, gating +733 insn) — **the two
  requirements are mutually exclusive in every writable form**: the original's
  `lfs f2,0x18(r28)` must be *allocated* before the division but *scheduled*
  after `bl rand`. Inline forms hoist it into callee-saved f30 (+8 frame, 16
  diffs); split-statement forms keep schedule and frame right but let the
  conversion claim f2/f3 (7 diffs). 712 variants.
- **REOPENED: everything on the run-7 residual list.** See the measurement
  section — those numbers are raw. Re-measure before believing any of them.

### STATE FOR RUN 9

- **Commits `29f21e9` (run 8), `14b0911` (tools) and `42fc57c` (shared headers)**
  on `wip/rel-drafts-and-dol-matches`. **Pushed**: `fork/wip/rel-drafts-and-dol-matches`
  at `354f976` (was `4f1b2b2`). Diff scanned for game binaries first
  (`.dol/.elf/.rel/.plf/.o/.map/.bin/.a/.exe`, `baserom*`) — clean; 167 files,
  all `.c`/`.s`/`.py`/`.h`/`.md`/Makefile. Working tree clean.
  (167 rather than the run-8 commit's 260 because many test_mode files differed
  only in line endings, which git normalises away.)
- **`mathutil_vec_sq_distance()` is now in `src/mathutil.h` and
  `CAMERA_FOREACH_2` in `src/camera.h`**, with the 6 + 3 per-file duplicates
  removed. §0.13 flagged this as a decision for whoever upstreams; **between
  runs is the only workable time**, because `rel_merge_back` drops header edits
  so an agent cannot land it from a warm copy — it can only re-duplicate.
  Verified byte-neutral by its own full clean rebuild (all 12 OK); the plan was
  to revert if it had not been. mini_fight alone has 11 functions containing the
  sq-distance block, so this saves nine more copies next run.
- **All nine warm copies at `C:/tmp/smbm/<mod>` are RESET to `42fc57c`, clean,
  and each rebuilt to its golden sha1 with `rel_sweep --gate`** — every module
  object plus the `.rel`/`.plf` DELETED first, not incrementally. All nine
  GOLDEN, `fail=0`. Re-run with `C:/tmp/smbm/warm_reset_run9.sh`, which fetches
  from the main working tree by path (the commits are local, so the GitHub
  remotes cannot serve them). CW temps `C:/tmp/tmp_<mod>` exist.
- **`C:/tmp/smbm/RUN9_BRIEF.md` is written** — hand it to every module agent. It
  leads with **re-measuring**, not with a target list, because rescoring
  inherited residuals is the highest-value action available and one such
  re-measurement already turned a "retired at 16" function into a 3.
- **Near-miss drafts were NOT re-exported to a `run8-nearmiss-drafts/` dir this
  run** — each module's drafts and READMEs are in its own
  `C:/tmp/smbm/_scratch_<mod>/nearmiss/`, and `RUN8_RESULTS.md` indexes them.
  run5/6/7 dirs are still next door and their unconverted entries remain valid
  **but every residual in them is a RAW count.**
- **Verified by a completely clean build**: all objects, every `.rel`/`.plf`/
  `.map`, the `.dol` and `.elf` deleted first, then `make all` from nothing —
  **1,101 objects, `sha1sum -c supermonkeyball.sha1` = all 12 OK.** Diff scanned
  for game binaries first: clean, 260 files (249 `.c`, 10 `.s`, 1 Makefile).
- **All nine modules pass `tools/rel_structcheck.py`** in the merged tree.
- **`C:/tmp/smbm/RUN8_RESULTS.md`** holds all nine per-module reports verbatim
  (6,815 lines) — every idiom, residual and tool bug in the agents' own words.
- **`rel_rematch` now corrupts mini_bowling too** — its run-8 isolates created 7
  letter-suffixed files. The "mini_bowling is CLEAR" note in RUN8_BRIEF is
  **false as of this run**. Safe modules are now **test_mode and mini_golf only**.

### NEXT RUN — ranked

1. **Re-measure before doing anything else.** Every run-7 residual, and any
   sweep directory whose only ranking was `rel_sweep --sweep` raw. mini_fight
   and mini_pilot both re-ranked theirs and found nothing — but mini_fight's
   exposure analysis is precise: **the risk is specifically raw-only sweeps that
   were never re-ranked.** One recovered 121 insn.
2. **mini_race is the richest field by far and has zero setup cost.**
   `mini_race_28.c`'s five remaining rows (1,336 insn, one at a time, partial
   conversion proven); `lbl_0000DB70` is **MATCHED**; `lbl_000008B4` is **15
   functions**, not one; `lbl_0001157C` is 19. `lbl_00005A84`+`lbl_0000528C`
   share one prologue-scheduling residual — **solve it once and 362 insn fall.**
3. **mini_golf's carve plan: 17,209 insn behind five 8-byte carves and one
   isolate**, all five orderings verified consistent. `mini_golf_58.c` is a
   15,758-insn contiguous run that splits exactly on the magic boundary. This is
   the largest single opportunity in the project.
4. **mini_billiards: two jump-table-free mergeable chains, ~7,400 insn** — hole
   0x20CA0 covers 2,684 with only matched C between, hole 0x1CBD0 covers the
   unbroken `_11…_24` chain (4,687). Merge verified byte-neutral
   (`tools/rel_merge_tu.py`). Plus `lbl_0000A054` (2,094) never started.
5. **mini_pilot `0xC6D8`: +733 insn, recipe proven** (`--from 11cbf20`, all four
   holes on one line), gated only on `lbl_0000B130`. Try the mirror of the one
   direction that worked: *collapse* the pointer local so the address is
   materialised at its single point of use.
6. **option: 3,389 insn of carve**, plus the magic-free pun at 5 diffs
   (unlocks five functions, 211 insn). `lbl_00007868` at 5 aligned blocks 747
   insn across three functions on one two-address prologue.
7. **test_mode: `test_mode_13`'s trio (2,087 insn) is already isolated** — run 9
   can write C with no rematch. The `REPEAT_WITH_R_ACCEL` macro lever is worth
   **316 measured insn** (`lbl_00000780` 109 + `lbl_0000D084` 207, whose 23
   regions span only instructions 5-100 and are that macro 4x).
8. **mini_bowling: restart `lbl_000042A4` from the 4-aligned draft, NOT the
   3-aligned one.** Two anti-correlated defects; the lower score has provably
   *wrong* register allocation while the higher one is one instruction in the
   wrong slot. `lbl_00001908` (131) shares the defect — **222 insn from one
   fix.** Its xref corpus is **proven exhausted** (1,752 bodies, nothing above
   0.60) — everything left is a from-asm decompile.
9. **mini_fight: 2,692 insn of never-touched carve-free work**, and **try it in
   place first** — it split `mini_fight_10.c` this run but `rel_rematch`
   destroys that tree two ways. xref is spent there too.
10. **sel_ngc is capped and now quantified**: ~25% carve-free, ~32% with the
    magic project, **68% walled off by `.data` jump tables** (8,822 insn
    confirmed). Its one magic unlock is worth **at most 1,238 insn** because
    extending `_29.c` hits a `.data` table with 3,120 insn behind it.
    `lbl_00001E10` (338, c-FREE) is the largest untouched carve-free target.
11. **Still open, cheap, and cross-module:** option's `lbl_000042BC` ported to
    mini_golf at spine similarity **1.000** for +325 insn this run. Run
    `tools/rel_xref_spine.py` across modules before decompiling anything —
    though note `rel_xref.py`'s call-set ranking **saturates** (19 of 82
    mini_race targets tied at 1.00 because they all call `nlSprPut`).

---

## 0.13 — RUN 7 DONE (2026-07-27): +7,575 insn, 10.83% -> 14.81%. Superseded by §0.14.

Nine parallel agents, one per module. **The rate did not decline — it nearly
doubled.** Run 6 was +3,813 / +47 fns on the same nine modules; run 7 is
**+7,575 / +59 fns**, and every module gained.

| module | funcs | insn | % | gained |
|---|---|---|---|---|
| mini_bowling | 78/120 | 4966/15313 | 32.43% | +9 fns / +1,122 |
| mini_pilot | — | 3280/12137 | 27.02% | +5 fns / +1,062 |
| sel_ngc | 48/73 | 3648/18084 | 20.17% | +10 fns / +1,404 |
| mini_race | 75/157 | 3405/19817 | 17.18% | +8 fns / +819 |
| option | 41/71 | 1604/12375 | 12.96% | +3 fns / +266 |
| test_mode | 46/94 | 2053/16231 | 12.65% | +11 lbls / +1,132 |
| mini_fight | 84/154 | 2989/28588 | 10.46% | +8 fns / +794 |
| mini_golf | 80/118 | 4044/38919 | 10.39% | +3 fns / +497 |
| mini_billiards | 29/70 | 2191/28793 | 7.61% | +2 fns / +479 |
| **TOTAL** | | **28180/190257** | **14.81%** | **+59 / +7,575** |

§0.12 predicted per-agent yield would keep varying 20x and that picking targets
matters more than pushing hard on one. Both held — but the *reason* the run
doubled is a single method, below.

### THE BIG LESSON: cross-referencing already-matched code is the whole game

§0.12 idiom 1 recorded this as a curiosity found once. In run 7 it produced the
majority of the gain, across every module that tried it:

- **mini_pilot** took **four of five** conversions out of `src/ball.c`.
  `lbl_00006124` is `handle_ball_linear_kinematics` (2 diffs first build);
  `lbl_000051A4` is `u_ball_ape_thread` — **MATCH on the first real build.**
- **mini_fight** took **six of eight**, five MATCHing on the first build, and
  went from run 6's +61 to **+794 (13x)**.
- **mini_golf** took **all three**, from an already-matched IN-MODULE template.
- **mini_bowling** ported `mini_race/lbl_00010BC8` verbatim into
  `lbl_000066C4` — **MATCH on the first build.**
- **test_mode** found `src/input.h`'s `REPEAT_WITH_R_ACCEL` macro reproduces a
  13-instruction chain byte-exactly and appears 6x across two functions — **~90
  of its 418 converted instructions are that one macro.**

**`tools/rel_xref.py` is NEW and mechanises it.** Fingerprints each unconverted
function by the symbols it `bl`s and ranks every matched C function in the tree
by call-set coverage; defaults to the module's whole unconverted set. Validated
against the three known answers. **Open every module with it in run 8.**

Two agents independently built stronger variants worth folding in: mini_fight's
indexes **all 8,899 named DOL functions plus all 935 REL asm functions** by
opcode spine (difflib ratio, ~4 min); mini_bowling's does the same across the
other eight REL modules but cannot see DOL bodies (they have no `.s` left) —
`objdump -d src/*.c.o` is the fix. `tools/rel_xref.py` parses `src/*.c` so it
DOES see DOL bodies; the approaches are complementary, not redundant.

**Strictly stronger than grepping sources** (mini_race): `powerpc-eabi-objdump
-d src/*.c.o` over the built DOL objects, searching for an instruction SHAPE,
then reading the C that produced it. That is how the run's best find happened.

### THE BEST SINGLE FIND: `mathutil.h` is missing a helper

A 12-instruction block recurs across the minigames — six live FPRs, every load
hoisted above the subtractions:
```
lfs f5,0(rA) lfs f2,0(rB) lfs f4,4(rA) lfs f1,4(rB) lfs f3,8(rA) lfs f0,8(rB)
fsubs f5,f5,f2  fsubs f4,f4,f1  fsubs f3,f3,f0
fmuls fD,f5,f5  fmadds fD,f4,f4,fD  fmadds fD,f3,f3,fD
```
**No plain-C spelling reproduces it** — `mathutil_sum_of_sq_3(a->x - b->x, …)`
gives a 5-register form and ~150 variants floored at 10 diffs. It is
`mathutil_vec_distance()`'s inline asm **minus the trailing `mathutil_sqrt`
call**. Added as a local `static inline`: **10 diffs -> MATCH on the first
build**, then five more functions matched almost immediately.

**18 still-unconverted functions across three modules contain this block:**
mini_race `lbl_000020A4` `lbl_000021C8` `lbl_00003474` `lbl_00007A9C`
`lbl_0000B2F0` `lbl_00012D50`; **mini_fight x11** (`lbl_0000351C` `lbl_00005A08`
`lbl_000080D4` `lbl_0000AD9C` `lbl_0000BC94` `lbl_00010018` `lbl_00010B98`
`lbl_000122C8` `lbl_000131C4` `lbl_000135DC` `lbl_0001B43C`); mini_bowling
`lbl_0000CAA8`. Where the block is *followed* by `bl mathutil_sqrt`, the existing
`mathutil_vec_distance` is what you want.

**It is duplicated into each `.c` that needs it, NOT put in `src/mathutil.h`** —
`rel_merge_back` only copies `src/<stem>*.c` and would silently drop a header
edit. Same for mini_bowling's `CAMERA_FOREACH_2`. **Both belong in the shared
headers; promoting them is a deliberate decision for whoever upstreams, not
something an agent should do mid-run.**

### RECONNAISSANCE IN §0.12 WAS WRONG IN FIVE PLACES — re-derive, don't trust

Every module that checked its own brief found an error in it.

- **mini_pilot: "~24% of remaining is magic-blocked" is INVERTED — it is 85%**
  (20 fns / 7,492 blocked vs 7 / 1,349 reachable).
- **test_mode: "no `.data` jump table" is WRONG.** It has **5 `bctr` functions
  totalling 3,514 insn** — 25% of what remains is structurally unreachable and
  had been counted nowhere.
- **mini_bowling: all three of its named targets were wrong.** The 33
  letter-suffixed files are GONE at `d1f91c4` so the `rel_rematch` hazard no
  longer applies; the "top prize" `lbl_000146A0` TU is entirely a-BLOCKED (a
  carve project, not a merge); and the "`_42.c`..`_53.c` mechanical merge" had
  nothing to merge — those files were already pure C.
- **option has FOUR magic doubles, not one** (`lbl_0000C270` `lbl_0000C380`
  signed, `lbl_0000C368` `lbl_0000C4B0` unsigned; only `0xC380` carved).
- **mini_billiards' magic set was mis-stated** — `lbl_00020848` `lbl_00020B10`
  `lbl_00020C20` are in the blob; `lbl_0001CBD0`/`lbl_0001CC88` were carved in
  run 5 and are therefore in no `.s` at all.

### PROJECT-WIDE REACHABILITY — the run's most durable output

Every module now has a per-function table, regenerable from a script in its
scratch dir. **Plan run 8 off this.**

| module | remaining | reachable now | magic-blocked | jump table |
|---|---|---|---|---|
| mini_race | 82 / 16,412 | **39 / 7,434 (45%)** | 40 / 7,509 | 3 / 1,469 |
| mini_billiards | 41 / 26,602 | **19 / 6,902 (26%)** | 17 / 12,596 | 5 / 7,103 |
| test_mode | 48 / 14,178 | **25 / 5,632 (40%)** | 18 / 5,032 | 5 / 3,514 |
| mini_bowling | 42 / 10,341 | **21 / 5,292 (51%)** | 18 / 4,742 | 3 / 307 |
| mini_fight | 70 / 25,599 | **26 / 4,751 (19%)** | 41 / 14,634 | 3 / 6,214 |
| mini_golf | 38 / 34,875 | **11 / 2,750 (8%)** | 23 / 28,048 | 4 / 4,077 |
| option | 30 / 10,771 | **10 / 2,439 (23%)** | 18 / 7,951 | 2 / 381 |
| mini_pilot | 27 / 8,841 | **7 / 1,349 (15%)** | 20 / 7,492 | — |
| sel_ngc | 25 / 14,436 | **4 / 837 (6%)** | 17 / 4,775 | 4 / 8,824 |
| **TOTAL** | | **~37,400** | **~92,800** | **~31,900** |

**~37,400 instructions are convertible today with no carve.** Jump tables are now
measured at **~31,900 insn project-wide** — far above §0.12's ~5,850 guess,
because three modules had never counted them.

### DEAD ENDS THAT FELL THIS RUN — re-test before believing any of them

Three separate "confirmed" entries were wrong, continuing the pattern from runs
5 and 6. **Assume any blocking entry on the dead-end list is worth one re-test.**

- **"mini_fight is exhausted at the small end; none are cheap."** It had no
  reachability table. Once built, **21% of its remaining mass was carve-free**,
  and run 6's four grinds were all in the reachable set — it had been grinding
  the four hardest members while 5,000 insn of easier work sat unclassified.
  Result: +61 -> **+794**.
- **option's magic-free type-pun, "confirmed dead" in §0.12/§9.** It went
  **17 diffs -> 5**, with correct frame, correct multiset, correct `lfsu`, and
  **every FPR correct**; a sibling independently reached 6. Run 6 rejected it on
  a sub-lever (store the low word first) that only fails on the shape run 6
  tested — it *helps* once the pool constants are hoisted first.
- **mini_billiards' 8-member pool TU**, written off in runs 4 and 5 and re-opened
  in run 6, converted cleanly this run.

Two that held, and should now be retired for good:
- **mini_golf `lbl_000109CC`** — ~1,150 formulations across three runs, still 14.
  The carve is verified to work and the carve-free pool-read form is *worse* (16).
  Residual is a pure 3-register rotation. **Retire it.**
- **mini_pilot `lbl_000097C8`** — 16 diffs after 104 further variants on top of
  run 6's. The original computes `currentBall@ha` late into a dead r3; no source
  form reaches it. **Retire it.** (`lbl_0000893C` at 2 diffs was already retired
  in run 6 and stayed untouched, correctly.)

### NEW IDIOMS — ranked, all proven by a golden build

1. **A missing `mathutil_vec_sq_distance` (see above).** Add as a local
   `static inline`; inline asm in a `static inline` does not trigger the
   asm-sibling deopt. 10 diffs -> MATCH, then five more functions.
2. **Same-TU auto-inlining is real — use `static inline`, NEVER plain `static`.**
   `-inline auto` is on, so the original TU inlined small helpers into callers.
   Calling the real function gives 27 diffs, writing the loop out gives 98, a
   **`static inline`** helper gives MATCH first try. **A plain `static` helper
   also scores MATCH per-function but emits an out-of-line copy that silently
   shifts `.text` and the REL hashes non-golden.** Put it outside the
   `force_active` block. (sel_ngc)
3. **An enum-typed parameter defeats increment folding.** With `int id`, mwcc
   folds `f(id); id+=3; f(id); id+=3;` into `addi r4,r28,3`+`addi r28,r28,6`;
   **`GXTexMtx id`** emits two separate `addi r28,r28,3` — instant MATCH.
   `int`/`s32`/`u32` fold; `u8`/`short` give 20. (test_mode)
4. **`a.x += b.x` is NOT `a.x = b.x + a.x`** — the compound form loads in the
   wrong order and picks the wrong `fadds` slot. Same for `x = pool * x` vs
   `x *= pool`. (mini_bowling; note this is the *opposite* direction from §0.11
   idiom 17's division case, so check the asm rather than assuming.)
5. **`for (i=0;i<N;i++,q++) *q=0;` does NOT fully unroll where `arr[i]=0` does.**
   Index form unrolls to 16 flat `stw`s; the comma-increment pointer form
   unrolls x8 leaving `mtctr 2`+`bdnz`. `*q++ = 0` and `q[i] = 0` give the flat
   form. 41 -> 7. (test_mode)
6. **A global read used as an array subscript needs its own STATEMENT** to fold
   `@l` into the load: `set = &tbl[*(s16 *)lbl_X]` gives `lis; addi rX,rX,@l;
   lha`; splitting it gives the original's `lis; lha rY,@l(rX)`. **143 -> 19, and
   16 spellings of the deref itself changed nothing** — it is the statement, not
   the expression. (mini_pilot)
7. **The address-spelling lever is PER-SITE and both directions occur in one
   function.** Sweeping the 5x5 cross product of two spellings at two sites took
   a function 9 -> 0; a sibling needs the opposite pairing. **Never pick one
   spelling globally.** (mini_billiards)
8. **`&arr[K]` into a pointer local PLUS a separate full-expression read of the
   same element** is what gives `addis rT,base,1 / addi rSAVED,rT,-K / lbz -K(rT)`.
   No `q + CONST` spelling reaches it. **197 -> 0.** (mini_billiards)
9. **`&((T *)((u8 *)base + K))[i*N]` beats `(T *)((u8 *)base + K + i*sizeof(T))`**
   for placing a large constant — mwcc canonicalises `base+idx+const` to
   `(idx+const)+base`, so folding it into the INDEX is the only route to
   `add rD,base,idx; addi rD,rD,const`. 7 -> MATCH. (test_mode)
10. **A redundant cast on an ALREADY-correctly-typed base blocks a displacement
    fold** — `*(T *)(tbl + K)` folds the next access's offset into one `addi`;
    `*(T *)((u8 *)tbl + K)` materialises the base into a callee-saved register.
    **MATCH vs 87.** And **to stop mwcc collapsing `v = *(Vec *)src; dst = v;`
    into one struct copy, put a redundant cast on the SECOND statement's
    source** (65 -> 10). (mini_golf, mini_bowling — both generalise run 6's cast
    finding)
11. **`((f32 *)t)[2]` vs `*(f32 *)(t + 8)` is worth 116 diffs** — the raw
    spelling gets CSE'd into an `fmr`, the array spelling forces the reload.
    128 -> 12. (sel_ngc)
12. **An embedded assignment defeats an alias-induced reload:**
    `*(f32 *)(w+0x160) += (v = *(f32 *)(w+0x164));` MATCHes where the separate
    statement gave 2 and the inline reload gave 141. Two `u8 *`-derived
    addresses can alias so mwcc will not CSE across the store. (mini_bowling)
13. **Declaration order of `f64` locals maps 1:1 onto FPR numbers f1,f2,f3…** —
    read the numbers off the asm and declare in that order. (option)
14. **mwcc lays declared locals out in REVERSE declaration order** (last declared
    = lowest address); **`Vec out; Vec v;` puts `out` at the HIGHER address**.
    A trailing unused `s32 pad;` relocates slots **without changing frame size**.
    **A PARAMETER competes in the callee-saved order too.** (sel_ngc, mini_race,
    mini_bowling)
15. **Compare types, sharpened.** A `u8` switch scrutinee gives `lbz; cmpwi` with
    no `extsb`; `char`/`s8` gives `lbz; extsb; cmpwi`. An `(s8)` cast inside an
    `==`/`!=` test gives `cmpwi` with **no** `extsb` (equality is sign-agnostic
    so mwcc drops the extension but keeps the signed compare) — this resolves the
    apparent contradiction in the old idiom 16. `int i` + `i < 27U` gives
    `cmplwi` while keeping `i == s32field` as `cmpw`: **the unsigned LITERAL
    drives the bound compare, not the variable's type.** (mini_race, mini_fight,
    test_mode)
16. **`NULL2` is not interchangeable with `NULL`/`0`** — `NULL2` emits
    `li r0,0; cmplw`, `NULL` emits `cmplwi`. 97 diffs. (mini_race)
17. **`CAMERA_FOREACH` has two spellings in the wild.** The stock `camera.h`
    macro gives the fused `lwzu r6, currentCamera@l(r4)`; declaring
    `struct Camera **cc = &currentCamera;` first gives the unfused
    `lis / addi / lwz`. **Read the asm and pick.** (mini_bowling)
18. **`sizeof(struct StageGoal) == 0x14`** — its `/*0x14*/ char type;` comment is
    WRONG, the field is at 0x12. Four matches depend on the 0x14 stride.
    (mini_race)

### TOOL WORK — five commits, each validated against a REPRODUCED failure

`tools/rel_sweep.py` had three defects that all report a confident wrong answer.

- **`--gate` is NEW and is the only valid proof of a match.** A per-function diff
  of 0 is necessary, not sufficient — it comes from a build reusing every sibling
  object. `--gate` deletes EVERY module object plus the `.rel`/`.plf`, rebuilds,
  and checks `supermonkeyball.sha1`. Verified both directions.
- **Trap 4 (`--sweep` restore).** It used `shutil.move` of a `copy2` backup, so
  the restored `.c` kept its original mtime and every later build silently linked
  the last variant. Now stamps mtime and drops the object.
- **Trap 5 (wrong `--file` reports MATCH).** Found by mini_fight: point `--file`
  at a file that does not contain `--label` and the untouched stub elsewhere
  trivially matches itself, printing a clean `MATCH (0 diffs)`. A forward
  declaration in the named file makes it look plausible. Now refuses unless the
  named file really defines the label in C.
- **Trap 6 (`--sweep` discards the winner).** Found independently by
  **mini_bowling AND test_mode**, and it cost each of them a near-miss false
  report: the sweep restores the pre-sweep CONTENT, so a winning variant is gone
  and the file is the asm stub again. Now prints a loud notice with a
  copy-pasteable install command; `--install-best` keeps the winner.
- **The all-same nonzero exit was a FALSE ALARM** and is now advisory —
  `build()` already refuses to score a file it saw no `Compiling` line for, so
  trap 1 is closed by construction. It fired 3-4 times per agent, including on
  all-MATCH sets.
- **`--gate` now prints an `objdump -h` audit on failure** (sel_ngc's
  recommendation): `rel_fdiff` locates a function by symbol, so an extra
  out-of-line helper or an unexpected `.rodata` passes the per-function gate
  while the REL hashes non-golden. Verified by reproducing sel_ngc's exact
  symptom — `#include <math.h>` alone emits 16 bytes of `.rodata` for an inline
  sqrt's 0.5 and 3.0, and it cost them a golden hash.

**`tools/rel_xref.py` is NEW** (see above).

### OTHER TOOL HAZARDS FOUND — read before touching the tools

- **`rel_rematch` now corrupts THREE modules**, not one. Its `src_files()` sort
  bug hits any tree with letter-suffixed files, and after run 7 **mini_race (7),
  option (11), sel_ngc (10) and mini_billiards** all carry them. It exits 0.
  **mini_fight is destroyed a second way**: it hoists hand-added mid-preamble
  `#include`s but regenerates the `extern` stubs that were hand-deleted to make
  them compile, so `make` dies in files you never touched. **mini_bowling is now
  CLEAR** — its 33 letter-suffixed files are gone.
- **Carve-safe isolate scripts are the standard route now**, one per module in
  its scratch dir, all verified byte-neutral. Two traps they share: **`static asm`
  functions called by a sibling stop linking once split** (drop `static` from the
  definition AND the forward decl in every file), and **re-running an isolate
  after `git checkout` duplicates the file's SOURCES line** — it builds and links
  while compiling the object twice.
- **A recon script that greps `nonmatchings/<mod>/` over-counts asm siblings by
  one**, because the generated preamble contains that string in a COMMENT. It
  made four singleton files look like they needed an isolate script and nearly
  cost 958 insn of easy work. **Anchor on `#include "../asm/nonmatchings/`.**
- **`rel_merge_back` only copies `src/<stem>*.c`** — a `src/mathutil.h` or
  `src/camera.h` edit is silently dropped. This is why the two new shared helpers
  are duplicated per-file.

### NEXT RUN — ranked, reconnaissance done, ~37,400 carve-free insn available

1. **Open every module with `tools/rel_xref.py`.** It is the single highest-yield
   action available and most modules have not been swept with it. Fold in
   mini_fight's opcode-spine variant (all 8,899 DOL + 935 REL functions) and add
   `objdump -d src/*.c.o` so matched DOL bodies are indexed too.
2. **Cash the `sqdist.h` helper into the 18 identified functions** — mini_fight
   x11, mini_race x6, mini_bowling `lbl_0000CAA8`. Decide first whether it goes
   into `src/mathutil.h` (with `CAMERA_FOREACH_2` into `src/camera.h`) rather
   than staying duplicated.
3. **mini_bowling `mini_bowling_82.c`: `lbl_0000CAA8`(651) + `lbl_0000C1D0`(566),
   both c-FREE.** Converting both makes the file pure C with no isolate script —
   **1,217 insn, the biggest carve-free block anywhere**, and `lbl_0000CAA8`
   contains the sq-distance block.
4. **mini_race is the richest field: 39 fns / 7,434 insn reachable.** Cheapest
   first: `lbl_0000048C`(56, draft at 8 diffs) `lbl_00007800`(60, draft at 11)
   `lbl_000044AC`(98, 0 fops) `lbl_00002E04`(104) `lbl_0000B2F0`(156)
   `lbl_000021C8`(182) — the last two are already isolated singletons and both
   use the new helper. `lbl_000008B4`(1,497) is the largest reachable item.
5. **test_mode `test_mode_13.c` holds `lbl_000057C0`(908) + `lbl_00006974`(670) +
   `lbl_000073EC`(509)** — 2,087 insn behind one `rel_rematch --add`.
6. **mini_fight, 2,507 carve-free insn none attempted**: `lbl_00004498`(543)
   `lbl_0001199C`(484) `lbl_00004D14`(438) `lbl_000135DC`(400) `lbl_00003DE0`(333)
   `lbl_00010B98`(309). The 1st/3rd/5th are mutual 0.58-0.69 opcode siblings in
   one file, so cracking one should carry the other two.
7. **option: two more carves are worked out and VERIFIED to produce the intended
   interleave** — `lbl_0000C4B0` -> `lbl_00008068`(627) and `lbl_0000C270` ->
   `lbl_00001598`(722) or `lbl_00000C94`(577), one only. Command in
   `_scratch_option/nearmiss/run7/MAGIC_HOLES.md`. Also **the magic-free pun is
   at 5 diffs** — landing it unlocks five functions at once.
8. **mini_billiards: 19 fns / 6,902 insn reachable, largely unattempted.**
   `lbl_0000A054`(2,094) is the biggest single reachable function in the project
   outside mini_race's `lbl_000008B4`.
9. **Carve projects, in value order:** mini_race still has **8 magic doubles with
   one carved** (7,509 blocked insn); mini_pilot's `_9.c`->`_10.c` (1,477) and
   `_30.c`->`_31.c` (1,086) are `.text`-adjacent so the same-object trick applies
   with no new hole; mini_billiards has 7 blocked fns (3,964) on a magic that
   **already has a hole owner**.
10. **Deprioritise sel_ngc and mini_golf.** sel_ngc is now 61% jump-table / 33%
    magic-blocked with only 837 carve-free insn left; mini_golf is 8% reachable.
11. **Standard close-out for every agent: regenerate the reachability table.**
    test_mode caught a silently-lost match that way, and it costs one script run.

---


### VERIFICATION — what was actually proven

- All nine warm copies merged with `tools/rel_merge_back.py --all`; **each
  rebuilt in the main tree to its golden sha1 from DELETED objects**, all nine
  reported GOLDEN.
- Then a **completely clean rebuild**: all 890 objects plus every `.rel`/`.plf`/
  `.map`, `supermonkeyball.dol` and the `.elf` removed first, `make all` from
  nothing. **`sha1sum -c supermonkeyball.sha1` = all 12 artifacts OK.** This is
  stronger than run 6's gate, which kept the DOL objects.
- Commit `e1a934f`, 551 files: 542 `.c`, 8 `.s`, 1 Makefile. Diff scanned for
  game binaries first (`.dol/.elf/.rel/.plf/.o/.map/.bin`, `baserom*`) — clean.
  Working tree clean afterwards.
- Every agent additionally gated its own module on the golden sha1 with all
  module objects deleted before reporting.

**Still-unverified inferences to flag if anyone upstreams this.** All byte-match;
none is confirmed against a symbol file. Carried over: `SelNgcMenu`, `FightCell`,
`FightSceneWork`, `FightPart`, `FightRail`, `FightCam`, `RaceSub`/`RaceSub2`,
`TestModeVecKey`, `struct Preview *` at `sprite + 0x2C`, `BilliardsPlayer`,
`BilliardsApe`. **New in run 7:** `FightDepthMaskParams`, `SelNgcState`,
`SelNgcSlot`, `SelNgcCharInfo`, `TestModelWork` (note: two files give fields
0x14/0x18/0x1C *different* pointer types because each TU needs a different one),
`TestDipEntry`, `TestResEntry`, `BowlSlot`, `BowlBank`, `BowlSndSet`/`BowlSnd4`,
extended `BowlPin` (byte-compatible with the stub in `_68.c`, should replace it),
and extensions to `BilliardsPlayer`/`BilliardsApe`. One is *solid* rather than
invented: **`lbl_00018A98`, `lbl_00018C78`, `lbl_00018F4C` and `lbl_00019264` in
mini_billiards all take `struct Ape *`** — `flags` 0x14, `unk60`, `ballId` 0xC0
all line up.

### STATE FOR RUN 8

- **Near-miss drafts and recon scripts rescued** to
  `D:/Nonschool Projects/smb-updated-decomp/run7-nearmiss-drafts/` — 170 files
  (12 READMEs, 51 drafts, 90 scripts) with a top-level `README.md` giving every
  residual diff count, an explicit **do-NOT-restart list**, and the 18 functions
  the new `sqdist.h` applies to. Deliberately outside the repo; none of it
  byte-matches. run5/run6 dirs are still next door and their unconverted entries
  remain valid.
- **All NINE warm copies at `C:/tmp/smbm/<mod>` are RESET to `f12f683`, clean
  (0 dirty), and each rebuilt to its golden sha1 with `rel_sweep --gate`** — i.e.
  with every module object plus the `.rel`/`.plf` DELETED first, not
  incrementally. All nine reported GOLDEN. Run 6 proved a preserved `.o` can be
  linked stale and still hash golden, so an incremental baseline is worthless.
  Their CW temps `C:/tmp/tmp_<mod>` exist. Re-run with
  `C:/tmp/smbm/warm_reset_run8.sh`, which fetches from the main working tree by
  path (the run-7 commits are local only, so the GitHub remotes cannot serve
  them).
- **`C:/tmp/smbm/RUN8_BRIEF.md` is written** — hand it to every module agent. It
  leads with `tools/rel_xref.py` and with **re-deriving reconnaissance**, because
  five per-module facts in the previous brief were wrong and the agents that
  checked theirs gained the most. Every path it references was verified to exist.
- **`C:/tmp/smbm/RUN7_RESULTS.md`** holds the full per-module reports this
  section summarises — every idiom, residual and tool bug in the agents' own
  words. `RUN7_BRIEF.md` is superseded.
- **Pushed**: `fork/wip/rel-drafts-and-dol-matches` at `b42e0f7` (was
  `41483ab` — note §0.12 recorded the run-6 push as `78bde4a`, but `41483ab`
  went out too). Diff scanned for game binaries first
  (`.dol/.elf/.rel/.plf/.o/.map/.bin`, `baserom*`) — clean; 175 files, all
  `.c`/`.py`/`.md`/Makefile.

## 0.12 — RUN 6 DONE (2026-07-27): +3,813 insn, 8.83% -> 10.83%. Superseded by §0.13.

Nine parallel agents, one per module. All merged into the main tree, each rebuilt
**there** to its golden sha1, then a **from-scratch** `make all` (all 751 REL
module objects plus every `.rel`/`.plf` deleted first) = all 12 artifacts OK.
Commits: `5cf8951` (seven modules) `f88915a` (mini_race + tool fix) `9c2c14a`
(mini_golf). Working tree clean.

| module | funcs | insn | % | gained |
|---|---|---|---|---|
| mini_bowling | 69/120 | 3844/15313 | 25.10% | +6 fns / +479 |
| mini_pilot | — | 2218/12137 | 18.27% | +11 fns / +649 |
| mini_race | 67/157 | 2586/19817 | 13.05% | +5 fns / +332 |
| sel_ngc | 38/73 | 2244/18084 | 12.41% | +4 fns / +756 |
| option | 38/71 | 1338/12375 | 10.81% | +5 fns / +397 |
| mini_golf | 77/118 | 3547/38919 | 9.11% | +1 fn / +237 |
| mini_fight | 76/154 | 2195/28588 | 7.68% | +1 fn / +61 |
| test_mode | 35/94 | 921/16231 | 5.67% | +11 fns / +555 |
| mini_billiards | 27/70 | 1712/28793 | 5.95% | +3 fns / +347 |
| **TOTAL** | | **20605/190257** | **10.83%** | **+47 fns / +3,813** |

**The rate HAS declined this time** — run 5 was +5,768. §0.11 predicted this: run 5
drew 48% of its gain from three freshly-split modules and there are none left.
Run 6 is ~66% of run 5 on a picked-over field. Per-agent yield now varies 20x
(pilot +649 from near-misses, fight +61 from four dead ends), and **which
functions you pick now matters far more than how hard you push on one.**

### THE BIG LESSON: the carve ceiling was mostly imaginary

Runs 3-5 built an elaborate theory around carving `.rodata` holes, whole-TU
conversions, and a "58-function incremental ceiling". **Most of it was
unnecessary.** A pure-C object that READS pool constants externally emits **no
`.rodata` section at all** — mini_billiards proved this with `objdump -h` on the
`.o`, not by inference, and mini_golf confirmed it independently.

Only an actual **int->float conversion** spends a module's magic-double budget.
Consequences:

- **Detect blocked functions with `grep 'lis rN, 0x4330'` on the asm. NEVER by
  grepping for the magic constant's label.** sel_ngc found two functions a label
  scan called clean that were blocked via a *different* magic. mini_golf found
  the reverse: counting `lfs/lfd` with a literal `lbl_` operand reports its three
  biggest reachable functions as "0 pool loads" because they load via a hoisted
  base register with a displacement. **§0.11's float-pressure numbers for golf
  are wrong for this reason.**
- **The "all N members of the TU must match at once" blocker was largely
  fictional.** Of mini_billiards' 8-member `lbl_00020B58` TU — written off in
  runs 4 AND 5 — exactly ONE member does an int->float conversion. The other
  seven (960 insn) are individually attemptable with no carve.
- **Spell the read with a TYPED pointer local**: `f64 *c = (f64 *)lbl_POOL;
  c[11]`. The `u8 *c = lbl_POOL; *(f64 *)(c + 0x58)` form rematerialises the base
  into a volatile register after a call (32 diffs vs 0) in option. **But this is
  function-dependent** — mini_golf swept all 12 spellings on one function and
  they scored identically, so try both rather than assuming.
- **The §0.10 "workaround produces different codegen" dead end is EXPLAINED.**
  Its symptom was mwcc materialising the pool base early into callee-saved regs
  where the workaround sank it into the branch. The lever is the local's TYPE:
  **an integer-typed address local (`u32 src = (u32)lbl_X;`) forces eager
  materialisation into a callee-saved GPR; a pointer-typed one (`u8 *src =
  lbl_X;`) lets it sink past a call into a volatile.** `register`,
  initializer-vs-statement and declaration order had zero effect on that axis.

### REACHABLE-WORK TRIAGE — the most valuable output of this run

Every agent classified its remaining functions by `lis rN, 0x4330`. **Plan run 7
off this table, not off percentages.** "Reachable" = convertible today with no
new carve.

| module | remaining | reachable now | magic-blocked | `.data` jump table |
|---|---|---|---|---|
| mini_race | 90 fns / 17,231 | **47 fns / 8,253 (48%)** | 40 / 7,509 | 3 / 1,469 |
| test_mode | 59 fns / 15,310 | **38 fns / 7,608 (47%)** | 21 / 7,702 | — |
| mini_bowling | 51 fns / 11,469 | **30 fns / 6,420 (56%)** | 18 / 4,742 | 3 / 307 |
| mini_golf | 41 fns / 35,372 | **13 fns / 2,952 (8%)** | 23 / 28,048 | 4 / 4,077 |
| sel_ngc | 35 fns | **14 fns / 2,241** | 17 | 1 |
| mini_billiards | 43 fns | ≥7 fns / 960 in the pool TU alone | — | — |
| mini_pilot | 32 chunks | — | ~24% of remaining | — |

**mini_race, test_mode and mini_bowling are where run 7 should go**: ~22,300 insn
of carve-free work between them, in modules whose remaining functions are small.
**mini_golf is the trap** — 38,919 insn total but only 2,952 reachable; 79% sits
behind int->float in five huge TUs (`lbl_0001B5B8` alone is 7,131 insn). Its
per-agent yield was the worst in the run and will stay that way.

Two standing structural buckets: `.data` switch jump tables (`bctr`) remain
unreachable — `rel_carve` only holes `.rodata` — and now total ~5,850 insn
project-wide. Magic-blocked work is NOT permanently blocked: mini_race has **8
magic doubles in its blob and only one carved**, so its 7,509 blocked insn is a
run-7 carve project, not a ceiling.

### NEW IDIOMS — ranked, all proven by a golden build

1. **Scan already-matched DOL code before decompiling from asm.** mini_golf's
   `lbl_00010304` (237 insn) is a **verbatim copy of
   `handle_ball_linear_kinematics` in `src/ball.c`**, changing only float
   literals -> pool reads and one callee. Ported across: **2 diffs on the first
   build**, then MATCH. This is the single cheapest match anyone has ever made
   here and nobody had looked. mini_bowling separately found three
   byte-identical sibling functions that took one C body verbatim.
2. **A hidden vararg already sitting in r4.** test_mode's `lbl_00000208` sat at
   22 diffs for ~20 spellings; the `printf` call sets only r3, but r4 still held
   `gameSubmode` from the entry `lha` — it IS the second argument.
   `printf(fmt, gameSubmode)` -> instant MATCH. **A call site with no `li`/`mr`
   for r4/r5 but a live value there is an invisible argument, not dead code.**
3. **In a FRAMELESS function mwcc duplicates the epilogue**, so `ret = 1; …
   return ret;` is NOT `return 1;`. The assignment form emits bare conditional
   returns (`bnelr`/`bltlr`/`beqlr`) plus one `li r3,0` hoisted to entry:
   54 diffs -> 2 (mini_race).
4. **`s32` and `int` are DIFFERENT TYPES to the register allocator** (`s32` is
   `signed long`). `s32 m = x % 16;` matched where `int m` gave 6 diffs. Also
   flipped another function 16<->22. Try both spellings anywhere a `%`//` result
   or assignment target is involved. Separately, **`int i` folds away mwcc's
   zero-trip loop guard where `s32 i` keeps it** (mini_bowling, 28 diffs -> 0).
5. **Cast placement decides displacement-vs-index, and the cast must CHANGE the
   pointer type.** `((s8 *)(q + K))[i*N]` -> `add rX,q,idx; lbz K(rX)`;
   `(q+K)[i*N]`, `*(s8 *)(q+K+i*N)`, `q[i*N+K]` (11 spellings, one tree) ->
   `addi rX,idx,K; lbzx`. Float twin: `((f32 *)(base + K))[i]` keeps K as a
   displacement, `((f32 *)base)[i + K/4]` folds it into the index. **Mixing the
   two spellings for the same array in one loop** is what reproduces two
   different addressing forms (mini_race matched first try on this).
6. **The FRA-slot lever applies to pool-read operands, and splitting a fused
   multiply-add into statements is catastrophic**: `f1 = pool[17] * -f1 +
   pool[15];` MATCHes, `f1 = -f1 * pool[17]; f1 += pool[15];` costs **110
   diffs** — the opposite direction from §0.11 idiom 17's division case.
7. **The "-1 trick" needs TWO uses to materialise.** A single inline
   `*((u32 *)(p+0x34) - 1)` folds back to `lwz r4,0x30(r31)`; the same expression
   at **two** use sites (no variable) materialises the address once, and the
   FIRST use still folds to base+disp while the second goes through the register.
   9 -> 0 and 40 -> 0 in test_mode. A declared pointer variable instead puts it
   in a callee-saved register and hoists it above the call.
8. **To hoist a global's ADDRESS into the entry block, declare a local
   pointer-to-the-global**: `struct Camera **cam = &currentCamera;` +
   `(*cam)->lookAt.x` moved `lis/addi` above an early-return `bnelr` where 9
   other spellings stalled.
9. **`mathutil_sqrt(mathutil_vec_sq_len(&v))` is NOT `mathutil_vec_len(&v)`** —
   same instructions, different callee-saved FPR for the result (8 diffs -> 0
   after ~20 permutations stalled). And **inline asm inside a `mathutil.h`
   `static inline` does NOT trigger the asm-sibling deopt**.
10. **`mathutil_mtxA_set_translate_xyz(x,y,z)` is the only way to get the "load
    all three, then store all three" mtxA block** — three separate assignments
    serialize into load/store pairs through one FPR.
11. **An `int` loop counter with an explicit `(s16)` cast in the loop CONDITION**
    gives `extsh; cmpwi` for the bound while keeping `j = i` a plain `mr`; a
    genuine `s16` counter forces `extsh` on every read.
12. **`.data` fn-ptr-table dispatch** matches as
    `(*(void (**)(void))(lbl_TABLE + (i - BASE) * 4))();` — the array-index form
    gives 13 diffs, a pointer local 34.
13. **Extending a pointer local's live range outranks declaration order.** The
    same address spelled off an already-declared local rather than
    module-base + absolute offset took a function 7 diffs -> 0 after NO
    declaration or statement permutation had moved it — then all 12 permutations
    matched. Conversely **repeating a module-data base instead of caching it in a
    local** took another function 72 -> 44 (the opposite of §0.11 idiom 10). Try
    both.
14. **Comma-operator init in `for` beats both a declaration initializer and a
    preceding statement** (8 / 86 / 0 diffs on one function).
15. **A `switch` with one case + default emits `beq body; b default`** where the
    equivalent `if/else` emits a single `bne` — a reliable tell for a switch.
16. **`extsb` + `cmplwi` is `(u32)(s8)x >= K`**, not `(u8)x >= K` (which gives
    `clrlwi`). **A `(s32)` cast on a `u32` global forces `cmpwi` over `cmplwi`**
    even against 0.
17. **`rel_split` merges `.data` fn-ptr-table handlers into their predecessor in
    mini_pilot too** — §0.11's audit claiming only `option` has this problem is
    WRONG. No `--extra-start` re-split was needed there: the blob references them
    as `_prolog + 0xNNNN`, so writing all five as plain C in one file just works.

### CORRECTIONS — the NOT-levers list (§6 of RUN6_BRIEF) is substantially WRONG

Three agents independently falsified entries. **Re-test anything on that list
that is blocking you.**

- **`T *p = (T *)arr;` is NOT the same as `T *p = arr;`.** Adding a redundant
  cast to an *unrelated* pointer local's array-decay initializer flipped a
  DIFFERENT value's parameter home from `mr r30,r3` to `addi r30,r3,0`, 1 diff
  -> 0. Verified by isolation: `u8 *`, `char *` and `s8 *` casts all match, only
  the uncast form fails — it is the **cast**, not the type. (But it is not
  universal: pilot swept 9 combinations at 16 diffs and golf 128 at 14, both
  unmoved.)
- **`((f32 *)src)[27]` and `*(f32 *)(src + 0x6c)` are different expressions to
  mwcc's CSE.** Mixing the two spellings across two occurrences suppresses a
  pre-call hoist into `f31` while the peephole still coalesces them to one load.
- **A value-adjacent empty `switch` case is STILL unrecoverable** — mini_race
  re-tested it hard (10 case-sets, `s8`/`u8`/`int` scrutinees, `goto`, nested
  `if`) and mwcc folds it into `default` and re-pivots every time. §0.11's
  softening of this applies only to NON-adjacent cases. Believe §0.9 here.
- **Declaration order is NOT the universal lever §0.11 claims.** golf swept 720
  permutations on one branch and 336 scalar/aggregate interleavings for zero
  movement; race swept **360** declaration permutations on `lbl_0000C7E4` and
  moved it only by hoisting one statement. For same-sized scalars whose live
  ranges are pinned by their initialisation points it does nothing — **but
  moving a variable between block and function scope does** (30 -> 35/54).

### TOOL BUGS — three fixed, read before using the tools

- **`rel_merge_back.py` linked STALE OBJECTS and could report GOLDEN for a tree
  it never built.** It copied warm-copy files with `shutil.copy2`, preserving the
  SOURCE mtime — routinely older than the `.o` already in the main tree — so make
  skipped the recompile. mini_race surfaced it as a bogus
  `multiply-defined: lbl_00012D50` (only `_117.c` defines it; main still held a
  `_95.c.o` from the OLD split numbering that did). Fixed in `f88915a`:
  `copyfile` + `utime(now)`, and it deletes the module's objects before building.
  **General rule this run kept re-teaching: anything that restores or copies a
  `.c` must stamp its mtime, and any golden gate must delete objects first.**
- **`rel_merge_back.py` merged ALL NINE warm copies on a bare or
  unrecognised-flag invocation** — it stripped every `--`-prefixed argument, so
  `--help` fell through to "everything". This pulled half-written state from
  seven still-running agents into the main tree during this run. It now requires
  an explicit module list or `--all` and rejects unknown flags.
- **`rel_carve.py` `sources_block()` died with a bare `StopIteration`** on
  `option`, `test_mode` and `sel_ngc` — it knew only the
  `# mkbe.rel_<mod>.rel sources` spelling. Same three-spelling trap `rel_rematch`
  already had. Two agents patched it independently; fixed in `5cf8951`.
- **`rel_sweep` deletes only the `.o` of the file under test** — a sibling's
  stale object survives make's 1-second granularity. mini_fight hit a non-golden
  hash with `git status` COMPLETELY CLEAN; only `rm -f src/mini_fight*.c.o`
  fixed it. **And `--sweep`'s restore is `shutil.move` of a `copy2` backup**, so
  the restored `.c` keeps its original mtime, is older than the last variant's
  `.o`, and every subsequent build silently links that variant. Not yet fixed —
  `rm -f src/<file>.c.o` after every sweep.
- **`rel_sweep --sweep`'s "every variant scored the same" nonzero exit is a FALSE
  ALARM** on canonical variant sets. It fired 3-6 times per agent, including on
  an all-MATCH set of 12 permutations. Gate on the golden sha1. To prove builds
  are real, add a **deliberately-wrong control variant** (agents saw 74 vs 1).
- **`rel_rematch` re-propagates a hand-added `#include` but not the extern
  deletions that made it compile** — the regenerated `extern u8 X[];` then
  conflicts with the header, failing in a file you did not touch.
- **After a rematch, `git checkout src/<file>` is actively dangerous** — it
  restores the PRE-rematch file and reintroduces functions the re-split moved
  elsewhere (`multiply-defined`). Snapshot stub files AFTER the rematch.
- **`rel_rematch` corrupts a tree containing hand-named files.** `src_files()`
  sorts `<mod>_<digits>.c` numerically and keys everything else 0, so
  mini_bowling's 33 letter-suffixed files (`_1b.c`, `_5c.c`) sorted to the FRONT
  of SOURCES, destroying `.text` order, with every function defined twice. **It
  exits 0.** Any module carrying hand-named files will hit this.
- The `Makefile` is **CRLF** — a script rewriting SOURCES with an LF pattern
  dies on a bare `AssertionError`.

### NEXT RUN — ranked, with reconnaissance done

1. **mini_race, test_mode, mini_bowling — ~22,300 insn of carve-free work.**
   Highest yield in the project by a wide margin. All three have full
   per-function reachable tables (race's regenerable via
   `_scratch_mini_race/recon4.py`). race's single biggest item is
   `lbl_000008B4` (1,497 insn, pool-reads only, 2 pool loads, 15 float ops).
2. **mini_bowling's two mergeable TUs**: `lbl_000146A0` (5 fns / **854 insn**,
   span 0x97B4-0xA23C with only one already-C interloper — the top prize) and
   `lbl_00011338` (289 insn, `_42.c`..`_53.c` are ALL pure C already, a
   mechanical merge). Two more singletons need a new hole (129 + 98).
3. **mini_golf `lbl_000109CC` is at 14 diffs and its carve is fully worked out**
   — draft + generator at `_scratch_mini_golf/nearmiss/`, and the exact command
   is in the run-6 golf report (note `--from 36fe55d`, since HEAD and worktree
   are both already carved). Residual is one 3-register rotation.
4. **mini_billiards' pool TU is open** — 7 of 8 members (960 insn) need no carve.
   `lbl_000023B0` is at 11 diffs, `lbl_00018474` at 15.
5. **mini_pilot near-misses**: `lbl_0000893C` at 2 diffs — **recommend dropping
   it**, the agent showed the identical DAG elsewhere in the module emits the
   other `crclr` order, so it is a scheduler ready-list tie source cannot reach.
   `lbl_000097C8` at 16, `lbl_000007B8` at 49 (one instruction, 25+ forms tried).
6. **option: `lbl_00009BB4` reaches 0 text diffs** but is blocked on the spent
   magic budget. If anyone lands a hand-punned magic-free form (currently 17
   diffs, correct frame, correct instruction multiset), **all five decoded
   functions unlock at once — 211 insn, no carve.**
7. **mini_fight is exhausted at the small end** — 79 asm functions remain and
   none are cheap. `lbl_0000F078` (147) and `lbl_0000EA10` (121) both read a pool
   base at fixed displacements and are the prime `f32 *k = …; k[n]` candidates.
8. **Deprioritise mini_golf generally** (8% reachable) despite its size.

### RUN 7 IS SET UP — everything below is done and verified

- **All NINE warm copies** at `C:/tmp/smbm/<mod>` reset to `d1f91c4`, cleaned
  (0 untracked), and **each rebuilt to its golden sha1 with every module object
  DELETED first** — not incrementally. Run 6 proved a preserved `.o` can be
  linked stale and still hash golden, so an incremental "verified" baseline is
  worthless. All nine reported GOLDEN. Their CW temps `C:/tmp/tmp_<mod>` exist.
  Re-run with `scratchpad/warm_verify.sh` if you need to re-establish it.
- **`C:/tmp/smbm/RUN7_BRIEF.md`** is the agent briefing — hand it to every module
  agent. It supersedes RUN6_BRIEF.md, which contains rules now known WRONG (the
  NOT-levers list, declaration order as a universal lever, the empty-switch-case
  scope, and the whole-TU carve framing). It leads with **reachability
  classification** and **checking already-matched DOL code**, because those are
  where run 6's cheapest wins came from.
- **Near-miss drafts rescued** to
  `D:/Nonschool Projects/smb-updated-decomp/run6-nearmiss-drafts/` — 48 files
  across all nine modules with a `README.md` giving each one's residual diff
  count and what is left, **including an explicit do-NOT-restart list** for the
  four proven not source-reachable. run5-nearmiss-drafts/ is still next door and
  its unconverted entries remain valid. Deliberately outside the repo — none of
  it byte-matches.
- Also rescued: `mini_race/recon4.py` (regenerates a full per-function
  reachability table — the cleanest worked example of the `lis rN, 0x4330`
  classification), two variant generators, and two carve-safe isolation scripts.
- **Pushed**: `fork/wip/rel-drafts-and-dol-matches` at `78bde4a` (was `091adbf`).
  Diff scanned for game binaries first (`.dol/.elf/.rel/.plf/.o/.map/.bin`,
  `baserom*`) — clean; 409 files, all `.c`/`.s`/`.py`/`.md`/Makefile.

**Still-unverified inferences to flag if anyone upstreams this:** invented
structs in sel_ngc (`SelNgcMenu`), mini_fight (`FightCell`, `FightSceneWork`,
`FightPart`, `FightRail`, `FightCam`), mini_race (`RaceSub`/`RaceSub2`),
test_mode (`TestModeVecKey`, `struct Preview *` at `sprite + 0x2C` inside
`sprite.h`'s `filler12`), mini_billiards (`BilliardsPlayer`, `BilliardsApe`).
All byte-match; none is confirmed against a symbol file.

---

## 0.11 — RUN 5 DONE (2026-07-25): +5,768 insn, 5.79% -> 8.83%. Superseded by §0.12.

Nine parallel agents. **Every REL module in the project is now split** — `option`
and `test_mode` were the last two monoliths, and splitting them means
**`make all` succeeds again** for the first time since the 2026-07-24 drafts.
All merged into the main tree, each rebuilt **there** to its golden sha1,
`sha1sum -c supermonkeyball.sha1` = all 12 OK. Working tree clean.

Commits: `245ffee` `9ca43d2` `a66a4a5` `56859b0` `5bea543` `1994198` `4631f58`
`07f3f69` (+ two small follow-ups).

| module | funcs | insn | % | gained |
|---|---|---|---|---|
| mini_bowling | 63/120 | 3365/15313 | 21.97% | +10 fns / +477 |
| mini_race | 62/157 | 2254/19817 | 11.37% | +11 fns / +574 |
| mini_fight | 75/154 | 2134/28588 | 7.46% | +11 fns / +761 |
| mini_pilot | 39/78 | 1569/12137 | 12.93% | +9 fns / +349 |
| mini_golf | 76/118 | 3310/38919 | 8.50% | +4 fns / +277 |
| mini_billiards | 24/70 | 1365/28793 | 4.74% | +7 fns / +535 |
| **sel_ngc** | 34/73 | 1488/18084 | 8.23% | **+34 fns / +1488** |
| **option** | 33/71 | 941/12375 | 7.60% | **+33 fns / +941** |
| **test_mode** | 24/94 | 366/16231 | 2.25% | **+24 fns / +366** |
| **TOTAL** | **430/935** | **16792/190257** | **8.83%** | **+143 fns / +5,768** |

Run 4 was +4,155 across six modules. **The rate is still not declining** — but
note *where* the gain came from: the three freshly-split modules supplied 2,795
of the 5,768 (48%). The six picked-over minigames supplied +2,973, which is
about 70% of their run-4 figure. **Fresh modules are worth far more per agent-hour
than grinding old ones, and there are no fresh modules left.**

### THE BIG LESSON: a "confirmed dead end" was wrong, cheaply

mini_bowling `lbl_0000A778` sat on the known-blocked list from run 3 because
`src/sound.h` declares `SoundVol(u16, u8)` where the original TU used `int`, and
fixing the header perturbs the DOL and every other module. **It never needed
fixing.** Drop the `#include` from that ONE pure-C file and hand-declare
`extern void SoundVol(u16, int);` locally; `rel_rematch` already preserves
hand-typed imported-fn externs, so it survives a re-split. Same trick converted
`lbl_00007518`.

**Generalise:** any `u8`/`s8`/`u16` parameter in a shared header that appears at
a call site as an un-truncated `addi rN,rM,0` or a negative `li`. And more
broadly — **re-test the known-blocked list rather than trusting it.** Two other
entries are now known to be mis-stated (see corrections below).

### TOOL CHANGES — all committed, read before using the tools

- **`tools/rel_sweep.py` is NEW and you should use it instead of writing a
  harness.** Four agents independently wrote one with the same three defects and
  lost hours each; one shipped three fictional "0 diffs" results. The defects:
  1. `subprocess.run(cmd, shell=True)` on Windows goes through **cmd.exe**, which
     cannot run `/c/msys64/...`. It sets a returncode, prints nothing, raises
     nothing — so a harness checking `if 'Error' in stdout` passes on empty
     output and **never builds at all**, and every variant scores identically off
     the previous `.plf`. This also affected `rel_merge_back` itself, whose
     verify step had therefore never rebuilt anything.
  2. A failed compile leaves the previous `.o`; the diff then describes it.
  3. make's timestamp granularity skips recompiles on rapid successive edits.
  The tool uses an argv list, deletes the `.o`/`.plf`/`.rel` first, and refuses
  to report a score unless the log contains `Compiling src/<file>` **and**
  `rel_fdiff` emitted a verdict. `--sweep <dir>` ranks variants and exits nonzero
  if they all scored the same.
- **`tools/rel_scan_syms.py` is NEW.** Replaces the ~10-build "harvest
  `undefined label` errors in waves" loop when splitting a fresh module. Derives
  the whole `--extern-fn`/`--extern-data` set statically. Reproduced test_mode's
  hand-derived set exactly (35/35 fns, 9/9 data).
- **`tools/rel_split_args/<stem>.args`** now records the exact `rel_split`
  arguments per module, plus `option.starts` for `--extra-start-file`.
  **sel_ngc needs this**: `rel_rematch` genuinely CANNOT re-split it, because
  `run_split()` never passes `--include` and `saved_inc` only restores includes
  to pure-C files, so the group files come back non-compiling.
- **`rel_rematch` fixes:** (a) it looked up the Makefile SOURCES block with only
  `# mkbe.rel_<mod>.rel sources` — three spellings exist, and it threw
  `StopIteration` *after* rewriting src, leaving a half-updated tree; (b) it
  discarded `--extra-start`, which is a **false negative, not a crash**: the
  re-split merges fn-ptr-table handlers back into their predecessor, so a correct
  11-insn conversion is reported as a 716-insn function with 700 diffs. Added
  `--extra-start` / `--extra-start-file`.
- **`rel_merge_back` fixes:** handles all nine modules (three names per module
  diverge — warm dir / stem / target); copies `asm/nonmatchings/<stem>/` on a
  first split; **syncs those bodies by CONTENT**, because a re-split can move a
  handler out of the neighbour it was merged into and copy-if-missing would leave
  the same instructions in both; and actually runs the build now.

### CORRECTIONS — believe these over §0.9/§0.10

- **"Assert the src file count goes UP after `rel_rematch`" is a FALSE ALARM.**
  rematch merges adjacent all-asm chunk files and can re-split previously merged
  handlers, so the count legitimately fell (golf 72->65, pilot 53->50) while
  functions were added. Assert instead on: all labels accounted for, zero
  duplicate definitions, and the pure-C function count.
- **Float MIN `bge/b/fmr` is NOT "the ternary's empty then-branch".**
  `v = t < C ? t : C;` puts `C` in the destination and inverts the branch. What
  reproduces it is `if (t < C) v = t; else v = C;` with `t` and `v` as SEPARATE
  locals — they coalesce, which is what empties the then-branch. 41 diffs -> 1.
- **The empty-`switch`-case dead end is narrower than stated.** Only the
  *value-adjacent* empty case is unrecoverable. A non-adjacent one IS
  reproducible, and case bodies are emitted in SOURCE order: reordering cases
  2/5/6/9 -> 2/6/5/9 took race `lbl_000068E8` from 20 diffs to 0, and deleting
  `case 9: break;` cost 49.
- **Memory-load CSE CAN be suppressed.** Two spellings of one pooled constant
  produced two SEPARATE loads at a basic-block join; the later peephole did not
  collapse them (39 -> 26 diffs). The old rule said it always does.
- **The billiards `lbl_00020B58` whole-TU carve is necessary but NOT sufficient.**
  `lbl_000189B4` was re-tested with real float literals (simulating the carve) and
  the residual 4-way FPR permutation survives. Do not plan that carve as a
  guaranteed unlock.
- **`rel_fdiff` usage is `FDIFF_MODULE=<stem> python tools/rel_fdiff.py
  mkbe.<target>.plf <lbl>...`** — it takes the `.plf`, and reads the module from
  the environment.

### NEW IDIOMS — ranked, all proven by a golden build

1. **The "-1 trick" forces pointer materialisation.**
   `(f32 *)(base + NEXT_OFFSET) - 1` emits `addis` + an `addi` merged into the
   first access (`lfsu`/`stfsu`/`stbu`); `(f32 *)(base + OFFSET)` gets folded into
   every access's displacement instead. Broke a run-3 blocker (3 diffs -> 0).
   **Whenever the original shows `lfsu`/`stfsu`/`stbu`, or `addi rX,rBase,off`
   feeding later `0(rX)` accesses, spell the address off the NEXT field.**
2. **`f32 *p = (f32 *)lbl_X; p[n]` is NOT equivalent to
   `u8 *p = lbl_X; *(f32 *)(p + 4n)`.** The `u8*`+cast form lets mwcc hoist a
   repeated base+disp into an extra callee-saved register. Took one sel_ngc
   function 79 diffs -> 0 and another 6 -> 0 after eight spellings had failed.
3. **Declaration order is the highest-yield single lever.** Volatile GPRs are
   handed out in ASCENDING declaration order, callee-saved in DESCENDING.
   Block-scoped declarations outrank enclosing-scope ones. Separate loop counters
   `i, j, k` beat reusing one `i` (110 diffs -> 9). Sweep all n! orders — builds
   are 0.7-8 s and the winner is often not adjacent to the runner-up.
4. **Full unrolling is far more aggressive than "x2".** An 8-trip loop with a
   3-statement body unrolls COMPLETELY to straight-line code; a 10-trip unrolls 8
   plus a remainder loop with an out-of-line preheader; a 3000-trip unrolls x6.
   A run of N identical store groups is an unrolled loop, factor up to 8. And a
   49-trip loop unrolled x7 is a FLAT loop in source, not a 7x7 nest — the nested
   form is unfixable (frame 0x20 vs 0x18), the flat form matches exactly.
5. **An unused local is a legitimate frame-size tool** — but only as the LAST
   declaration; declared first it is absorbed by top slack. Combine with the frame
   oracle (`locals = frame - 8 - saved`) and add exactly the shortfall.
6. **Call arguments are evaluated RIGHT-TO-LEFT.** To force left-to-right load
   order, hoist them into locals assigned in order.
7. **A declaration INITIALIZER and an equivalent assignment STATEMENT are not
   interchangeable for scheduling** (16 vs 113 diffs, identical intended
   allocation).
8. **Frame size counts DECLARED locals, not spills** (2-3 -> 0x18, 4 -> 0x20,
   5 -> 0x28), which bounds how many the original had before you try shapes.
9. **`base[i]` keeps the base register alive** (`addi rW,rBase,0`); `p++`
   coalesces it away.
10. **A hoisted `.rodata`-pool base held across a call needs an explicit DECLARED
    local**, first in declaration order. Repeating the expression is not enough —
    without it mwcc rematerialises the base after the call in a scratch register
    and the frame is 8 instead of 0x10.
11. **Three int->int store spellings are distinct:** `x = (a == K);` is branchless
    `subfic/cntlzw/rlwinm`; `if/else` gives two stores; `x = (a == K) ? 1 : 0;`
    gives `li/b/li` and ONE store.
12. **A `(u32)` cast on an int EXPRESSION is NOT folded** when it is the compare
    operand (`cmplwi` vs `cmpwi`) — the opposite of a `(u32)` on a call result.
13. **`a = b = expr` gives one load and two stores in reverse field order**, where
    two statements give two loads.
14. **Typing a module data pointer and writing `lbl_X->field`** (rather than
    caching it in a local) matched 4 sel_ngc functions first try — the original
    reloads after every store because the store may alias.
15. **`int` beats `s16`/`s8` for a value only stored into a narrow field** — mwcc
    still emits the `extsb`/`extsh`, and the narrow local adds a redundant one.
16. **Macros are literal source.** `BALL_FOREACH`/`CAMERA_FOREACH` reproduce
    byte-exactly including artifacts, and are NOT interchangeable with their
    hand-expansion (the extra `{ }` scope matters: 6 -> 35 diffs).
17. **Compound assignment also picks a DIVISION destination:**
    `lead = K; lead /= -v;` gives `fdiv f2,f2,f1` where `lead = K / -v;` gives
    `fdiv f1,f2,f1` plus a wasted `fmr`.

### NOT levers — mwcc canonicalises these to identical bytes (verified by sha1)

Stop burning attempts on them: `(T*)u8array` vs `&typedScalar` vs
`&typedArray[0]` vs array decay; `*p` vs `p[0]`; `*(f32*)k` vs `((f32*)k)[0]` vs
`((struct S*)k)->m`; `for`-init vs separate assignment vs `while`; `++e` vs `e++`;
`a -= b` vs `a = a - b`; a local for a call result vs the inline expression.
Two spellings only diverge when they force different **address materialisations**.
Also: `addi rD,rS,0` is NOT a deopt marker and NOT a type signal — it is used for
plain integer argument copies too.

### AUDIT RESULT — do not go re-splitting

`rel_split` detects function starts as `bl` targets plus `@ha/@l`-loaded labels.
option genuinely defeated that: ~35 of its handlers are dispatched only through
the `.data` fn-ptr table at `lbl_0000C640`, so it found 47 of 71 starts (median
263!). Recovering them (a label is a start iff the preceding instruction is
`blr`) gave 71 functions at median 46, still golden.

**The other eight modules do NOT have this problem.** Resolving every data->text
relocation in each blob (including the carved `_dN` segments) against known starts
leaves 319 addresses that are not function starts — but every one is inside a
function containing `bctr` and none opens with a prologue. They are switch-case
labels, exactly what `rel_split` intends to keep interior. Verified with a
prologue filter calibrated against known-real starts (85-97% hit rate).

### NEXT RUN — concrete, ranked, with the reconnaissance already done

There are no fresh modules left, so run 6 is about **cashing in near-misses and
doing whole-TU conversions**. Every item below has a saved draft or a decoded body.

1. **mini_fight — ~2,983 insn of CARVE-FREE work in functions <=200 insn**, in
   pre-existing singleton files needing no rematch: `lbl_0000F078`(147),
   `lbl_0000DCA0`(191), `lbl_0000EA10`(121), `lbl_0000D9E0`(145, sitting at 86
   diffs). `mini_fight_49.c` holds `lbl_0000F6F4`+`lbl_0000F848` (171) — both must
   convert together or the file stays deopted. Near-miss drafts in
   `C:/tmp/smbm/_scratch_mini_fight/nearmiss/`.
2. **sel_ngc — `--isolate-range lbl_0000A950 lbl_0000AFB0` + one carve unlocks
   491 insn (2.7%)**, and it is mechanical: `lbl_0000A950` (408 insn) is 13
   repetitions of a `create_sprite()` block already matched four times.
3. **test_mode `lbl_0000C0B0`(66) is at 4 diffs**, all pure instruction ordering,
   and very likely falls to a small statement-order sweep.
4. **mini_golf `lbl_000109CC`(295) is at 32 diffs** with branch 1 and the whole
   frame already exact — draft at
   `C:/tmp/smbm/_scratch_mini_golf/lbl_000109CC_32diff.c`. Otherwise **triage golf
   by FLOAT PRESSURE, not size**: `lbl_00023DD4`(187, 0 float ops),
   `lbl_00007F34`(708, 0 pool loads), `lbl_000109CC`(295, 0 pool loads).
5. **mini_billiards `lbl_00019FD4`(40)** needs `_52/_53/_54.c` hand-merged into one
   object so the `lbl_00020CA0` magic is emitted once — mechanical.
   `lbl_00003CC8`(161) is decoded but unattempted.
6. **mini_pilot near-misses:** `lbl_0000893C` at 2 diffs (one scheduler slot),
   `lbl_0000B000` at 4 (one FPR tie-break). Drafts in
   `C:/tmp/smbm/_scratch_mini_pilot/`.
7. **mini_bowling** needs two whole-TU conversions: the module has TWO magic
   doubles (0x146A0, 0x14D90) so at least two TUs. 0x14D90's hole is owned by
   `mini_bowling_52.c`; 0x146A0 has no hole at all and its first `.text` user is
   `lbl_000097B4`.
8. **option:** five functions (`lbl_00009BB4` `lbl_0000A600` `lbl_000093C0`
   `lbl_00004858` `lbl_0000B10C`) are fully decoded
   (`x = x + c58 * ((c210 + c80 * (double)n) - x)`) but need the single
   `lbl_0000C380` magic and are scattered across `.text`.

### RUN 6 IS SET UP — everything below is done and verified

- **Pushed**: `fork/wip/rel-drafts-and-dol-matches` at `8817308`. Diff scanned for
  game binaries first (`.dol/.elf/.rel/.plf/.o/.map/.bin`, `baserom*`) — clean;
  640 files, all `.c`/`.s`/`.py`/`.args`/`.md`/Makefile.
- **All NINE warm copies** at `C:/tmp/smbm/<mod>` have been reset to `8817308`,
  cleaned, and **each rebuilt to its golden sha1 from the refreshed state**
  (verified, all nine). Their CW temps `C:/tmp/tmp_<mod>` are in place. Build
  objects were preserved, so builds stay incremental.
- **`C:/tmp/smbm/RUN6_BRIEF.md`** is the agent briefing — hand it to every module
  agent. It supersedes RUN5_BRIEF.md, which contains rules now known WRONG (the
  file-count assertion, the float-MIN ternary shape, the empty-switch-case scope,
  the memory-CSE claim, and the `rel_fdiff` invocation).
- **Near-miss drafts rescued out of Windows temp** to
  `D:/Nonschool Projects/smb-updated-decomp/run5-nearmiss-drafts/` with a
  `README.md` giving each one's residual diff count and exactly what is left.
  19 files across mini_fight, mini_golf, mini_pilot, mini_billiards, sel_ngc.
  Deliberately outside the repo — none of it byte-matches, so none belongs in git.
  **These are the cheapest instructions available anywhere in the project**
  (a 2-diff, two more at 2-4, several under 15).

**Unverified inferences to flag if anyone upstreams this:** invented structs in
sel_ngc (`SelNgcMenu`), mini_fight (`FightCell`, `FightSceneWork`, `FightPart`,
`FightRail`, `FightCam`), mini_race (`RaceSub`/`RaceSub2` extensions), test_mode
(`TestModeVecKey`, and a `struct Preview *` read at `sprite + 0x2C` inside
`sprite.h`'s `filler12`). All byte-match; none is confirmed against a symbol file.

---

## 0.10 — RUN 5 PREP (2026-07-25). Superseded by §0.11; kept for the split recipes.

Everything below is verified and committed at `d32e854`. Working tree clean,
all 12 artifacts OK.

### SEVEN warm copies, all clean at `d32e854`, ready to hand to agents

`C:/tmp/smbm/<mod>` (full repo incl. `.git`, minus `baserom.*`) with its own CW
linker temp `C:/tmp/tmp_<mod>`. **`sel_ngc` is new this run.**

| module | golden sha1 | funcs | insn | % |
|---|---|---|---|---|
| mini_bowling | `29ded64794215790b8bfd6fc6c2517ca835b6b1a` | 53/120 | 2888/15313 | 18.9% |
| mini_race | `c600a0f425b42405f27527f57bcba110fffa0431` | 51/157 | 1680/19817 | 8.5% |
| mini_fight | `233b6073feb2ec293cff024523019225c41f5604` | 64/154 | 1373/28588 | 4.8% |
| mini_pilot | `cc2b2ef2b1c2bdf613beae9c71ff32d75e03059f` | 30/75 | 1220/12137 | 10.1% |
| mini_golf | `fc70c4e88e1f22e908bbcc4e263cb45e74310b93` | 72/118 | 3033/38919 | 7.8% |
| mini_billiards | `4ff9ee4165b581f68848c6a0ce3448baf62b6c73` | 17/70 | 830/28793 | 2.9% |
| **sel_ngc** | **`e8bbf3075538ec60a275cf70141e36c63f6e5fcd`** | **0/73** | **0/18084** | **0.0%** |
| **7-MODULE TOTAL** | | | **11024/161651** | **6.8%** |

Note the target name differs from the module name: build **`mkbe.sel_ngc.rel`**,
module/file stem is **`sel_ngc_rel`**.

### sel_ngc — freshly split, best ROI in the project right now

18,084 insn, 73 functions, **median 75** — a far better size profile than the
picked-over minigames (whose remaining medians are 120-190). It has genuinely
small functions again, which is where the hit rate is:

`lbl_0000A634(9) lbl_0000A658(9) lbl_0000A7B0(9) _epilog(12) lbl_0000A840(12)
lbl_0000A67C(19) lbl_00001910(22) lbl_000101BC(22) lbl_0000A7D4(27)
lbl_0000D7C0(27) lbl_0000E43C(32) lbl_0000E4BC(33) _prolog(34) lbl_00011688(40)
lbl_0000A4A0(41) _unresolved(43) lbl_00001D58(46) lbl_00011824(48)
lbl_0000B0FC(49) lbl_0000DDF4(53) lbl_0000E368(53) lbl_0000EBD4(55)`

The `lbl_0000A4A0..lbl_0000A950` cluster (12 functions, ~9-56 insn each) is one
obvious TU-ish run to sweep first. mini_fight converted `_prolog`/`_epilog`/
`_unresolved` in run 4, so those three are known-doable here too.

**Mass is extremely concentrated: the top 10 functions are 68% of the module,
and `lbl_000030F4` alone is 6,621 insn (37%).** Do NOT open that one early.
Others: `lbl_000005D4`(1231) `lbl_00010438`(958) `lbl_0000ECB0`(694)
`lbl_0000C970`(651) `lbl_0000B1C0`(472).

**Re-split reproducer** (needed after any `rel_rematch`; `rel_rematch` calls
`rel_split`, so normally you do not run this by hand — but this is the exact
argument set that yields golden, recovered by iterating on the compiler's
`undefined label` / `illegal use of label` errors):

```
python tools/rel_split.py sel_ngc_rel \
  --include stddef.h --include stdio.h --include stdlib.h --include global.h \
  --include ball.h --include bitmap.h --include camera.h --include event.h \
  --include functions.h --include game.h --include info.h --include input.h \
  --include light.h --include mathutil.h --include mode.h --include mot_ape.h \
  --include polydisp.h --include pool.h --include rend_efc.h --include sound.h \
  --include sprite.h --include stage.h --include thread.h --include variables.h \
  --include window.h --include world.h --include pause_menu.h --include string.h \
  --include avdisp.h --include background.h --include obj_collision.h \
  --include ord_tbl.h --include stcoli.h \
  --extern-data g_totalPlayPoints --extern-data lbl_801EED50 \
  --extern-data lbl_801EED98 --extern-data lbl_8027CE24 \
  --extern-data lbl_802F1FA8 --extern-data lbl_802F1FAC \
  --extern-data lbl_802F1FB0 --extern-data lbl_802F1FB4 \
  --extern-data u_isCompetitionModeCourse \
  --extern-fn __cvt_fp2unsigned --extern-fn are_all_continues_unlocked \
  --extern-fn course_first --extern-fn course_floor_count \
  --extern-fn effect_draw --extern-fn empty_file_cache \
  --extern-fn empty_load_queue --extern-fn file_preload \
  --extern-fn floor_to_stage_id --extern-fn func_8009F4C4 \
  --extern-fn func_80067310 --extern-fn is_floor_visited \
  --extern-fn is_load_queue_not_empty --extern-fn is_minigame_unlocked \
  --extern-fn item_draw --extern-fn lens_flare_draw \
  --extern-fn lens_flare_draw_mask --extern-fn memcard_set_mode \
  --extern-fn nl2ngc_draw_model_sort_translucent_alt2 --extern-fn preview_create \
  --extern-fn preview_create_with_allocated_tex --extern-fn preview_draw \
  --extern-fn preview_free --extern-fn preview_main \
  --extern-fn spend_play_points --extern-fn start_preview_image_read \
  --extern-fn stobj_draw --extern-fn textbox_add_text \
  --extern-fn textbox_set_properties
```
Restore the monolithic blob first: `git show d32e854^:asm/sel_ngc_rel.s > asm/sel_ngc_rel.s`
(HEAD's copy is the data-only split). **Do not use `5138d8f` for sel_ngc** —
that commit's `src/sel_ngc_rel.c` is the bad draft.

### The splitter bug sel_ngc exposed (fixed in `d32e854`, read before splitting anything new)

`rel_split` un-`.if 0`s the module's alignment stub so the `.s` owns all data,
then adds `.balign 8` at the section start. That is right when the stub is a
4/8-byte word (`const u32 lbl_X = 0x4B;` — every minigame) and **wrong when it is
a STRING**: mwcc pads `char lbl_X[] = "..."` to a 4-byte boundary, `.asciz` does
not, so sel_ngc's `.data` came out 26 bytes where the original had 28 and the REL
was 4 bytes short. Now the guard is dropped only when the block's emitted size is
a multiple of 4; otherwise it stays and the generated `.c` keeps defining the
symbol. **And the `.balign 8` must then also be skipped for that section** — with
the stub C-owned the `.s` contribution follows the `.c`'s bytes, so forcing it to
8 rounds its start 28 -> 32 and re-creates the same 4-byte shift. That second
half is what made the first fix still hash non-golden. Verified a strict no-op
for all six minigames (byte-identical resolver output, 0 C-owned stubs each).

**Expect the same class of problem when splitting `option` and `test_mode`.**
Check `.if 0` stub size vs 4 before assuming the tool is right.

### `option` / `test_mode` — the other two unsplit modules

`option` 12,375 insn, `test_mode` 16,231 insn. Both still have their unverified
2026-07-24 draft `.c` wired into the Makefile next to the monolithic `asm/<mod>.s`,
which is why **`make all` still fails** (it now gets past sel_ngc and dies at
`test_mode` with `multiply-defined: '_prolog'`). Splitting them the same way
fixes `make all` outright and opens 28,606 more insn. Their pre-draft stubs are at
`git show 5138d8f^:src/<mod>.c`. Procedure that worked for sel_ngc:
1. Restore the pre-draft stub, build the target, confirm it hashes golden
   **before touching anything** (this is the all-asm baseline).
2. `rel_split.py <mod>` with no args, build, and harvest the
   `undefined label` / `illegal use of label` names from the compiler output.
   They arrive in WAVES (the compiler aborts early) — loop until no new name
   appears. ~10 iterations for sel_ngc.
3. Named symbols are almost all covered by the standard game-header set above;
   only `lbl_*` addresses and a handful of functions need explicit
   `--extern-data` / `--extern-fn`.
4. **Delete the `.rel` before every build.** A failed compile leaves the previous
   object AND the previous `.rel` in place, and the stale all-asm `.rel` hashes
   GOLDEN — a fictional match. This bit me live during the sel_ngc split.
5. Re-splitting consumes `asm/<mod>.s` (it becomes data-only), so restore it from
   git before each re-split attempt.

### Reminders for whoever runs run 5

- Priorities by untapped mass: **sel_ngc (18,084, easiest)**, mini_billiards
  (27,963), mini_fight (27,215), mini_golf (35,886).
- All six minigames now carry a COMMITTED carve, so `rel_carve --from HEAD` is
  wrong everywhere: `rel_rematch` first, then `--from worktree`. sel_ngc has no
  carve yet.
- `rel_rematch`'s file-loss bug is fixed at the root, but still back up and assert
  `ls src/<mod>*.c | wc -l` goes UP.
- **Namespace scratchpad paths per module.** The scratchpad is shared between
  parallel agents; run 4's fight agent `rm -rf`'d a shared path and destroyed the
  race agent's backups.
- Use `tools/rel_fdiff.py` for per-function feedback rather than rebuilding one.

---

## 0.9 — RUN 4 DONE (2026-07-25): +4,155 insn, 4.8% -> 7.7%. MERGED + all 12 artifacts OK.

Six parallel agents, one per minigame REL. Each merged into the main tree, rebuilt
**there** to its golden sha1, `sha1sum -c supermonkeyball.sha1` = all 12 OK.
Committed as `68ec41e` (work) + `fcbeeab` (tool fixes).

| module | funcs | insn | % | gained |
|---|---|---|---|---|
| mini_bowling | 53/120 | 2888/15313 | 18.9% | +16 fns / +1244 |
| mini_golf | 72/118 | 3033/38919 | 7.8% | +10 fns / +1058 |
| mini_fight | 64/154 | 1373/28588 | 4.8% | +19 fns / +681 |
| mini_race | 51/157 | 1680/19817 | 8.5% | +12 fns / +477 |
| mini_pilot | 30/75 | 1220/12137 | 10.1% | +7 fns / +417 |
| mini_billiards | 17/70 | 830/28793 | 2.9% | +3 fns / +278 |
| **TOTAL** | **287/694** | **11024/143567** | **7.7%** | **+67 fns / +4155** |

Run 3 was +3,147, so run 4 was ~32% better on harder functions. **The rate is NOT
declining yet** — §0.8 predicted it would.

### TOOL FIXES — all committed in `fcbeeab`, read this before touching the tools

- **The `rel_rematch` file-loss bug is ROOT-CAUSED AND FIXED.** It detected a
  still-asm file by the bare substring `nonmatchings/<mod>/`, but `rel_split`'s
  multi-function **header comment** contains `asm/nonmatchings/<mod>/.` — so a
  fully-converted pure-C file that kept that header was classified as a stub and
  silently reverted. Now matches the real `#include "../asm/nonmatchings/<mod>/`
  directive. **This was live at merge time: 14 of run 4's 16 new mini_bowling
  files carry that comment; one `rel_rematch` would have reverted 1,244 insn.**
  Keep asserting the file count goes UP anyway.
- `rel_rematch` also now re-applies committed `#include`s the regenerated preamble
  drops, and finds the SOURCES block end by continuation lines (it used to look
  for `asm/<mod>.s` as terminator — `rel_carve` moves that to the front, and the
  old code raised `StopIteration` *after* rewriting src, leaving a half-updated tree).
- **`rel_carve` now hard-guards the already-carved-HEAD trap** and accepts
  `--from worktree`. **ALL SIX modules now carry committed carve segments**, so
  `--from HEAD` is wrong everywhere. Correct order: `rel_rematch` (regenerates a
  complete blob) → `rel_carve <mod> --from worktree --hole … --into …`.
  `--undo` is not usable on a committed carve and now says so.
- **`tools/rel_fdiff.py` is new** — per-function objdump-vs-`asm/nonmatchings`
  diff, addresses from the fresh `.map` (they shift as soon as one converted
  function changes size), masks unrelocated `0x48000001` `bl` placeholders.
  Three agents built equivalents independently; use this one.

### TWO STRUCTURAL BLOCKERS CLEARED

1. **The §0.8 "isolate-range can't be bootstrapped" item is SOLVED** (golf,
   +322 insn). Recipe: `rel_rematch --add` each range member as a **separate
   singleton**. Each then emits its own magic double so the REL hash is NOT
   golden — **but extra `.rodata` only shifts DATA sections, `.text` addresses
   are unaffected, so per-function objdump diffs stay valid.** Drive every member
   to 0 text diffs, merge the objects by hand (concatenate the
   `#pragma force_active on … reset` bodies in `.text` order into the first file,
   delete the others, drop their SOURCES lines), then carve ONE hole. Re-diff
   after merging: the merge can deopt a previously-clean member.
2. **Hand-splitting beats `rel_rematch` when the tools are in a bad state**
   (bowling 18.9%, fight). Split multi-function asm files, verify the all-asm
   split still hashes golden **before** writing any C. Gotcha: `rel_split` emits
   `static void lbl_X(void);` forward decls for labels not referenced cross-file,
   so splitting such a label away from its caller makes the symbol vanish at
   `elf2rel` — promote those decls to non-static in ALL files. De-`static`ing
   split-out `asm` functions is byte-neutral (verified twice).

### NEW MWCC IDIOMS — ranked, all proven by a golden build

1. **`mathutil_vec_sq_len(&v)` / `mathutil_vec_len(&v)` are NOT interchangeable
   with `mathutil_sum_of_sq_3(v.x,v.y,v.z)`.** The Vec-pointer forms load x,y,z
   in ascending address order from memory; the 3-arg form evaluates right-to-left
   and keeps components in registers. Took bowling `lbl_0000D650` 27/106 → 106/106.
   `mathutil_vec_dot_prod` / `vec_cross_prod` reproduce their chains exactly too.
2. **mwcc's front-end CSE is SYNTACTIC.** Spelling one pooled constant two ways
   (`*(f32 *)(p + 0xC)` vs `((f32 *)p)[3]`) suppresses CSE; a later peephole still
   collapses it to ONE load, but allocation flips from a real register to scratch.
   Unlocked two fight functions after ~8 failed formulations each.
3. **`-O4,p` UNROLLS small constant-trip loops** (×2 for a 10-trip, keeping one
   induction increment; a 4-trip becomes `mtctr 2`). Repetitive-store runs are
   unrolled loops, not straight-line source.
4. **Do NOT introduce pointer locals for array/struct bases — let CSE do it.**
   `struct Ball *b = &ballInfo[i];` forces the index `mulli` up front and permutes
   every register. Writing the subscript out in full took golf `lbl_00009538`
   21 diffs → 0. (Opposite case: an explicit local for an intermediate ADDRESS,
   `struct FightSub *s = &g.sub[i];`, fixed a fight function no declaration order
   could. Try both.)
5. **Compound assignment picks the FRA slot:** `t = a; t *= b;` where neither
   plain source order reproduces `fmul fD,fD,fX`.
6. **Float `if (a >= b)` NEVER compiles to `blt`** (mwcc emits `cror eq,gt,eq` +
   `bne`). A bare `blt` guarding a whole body means an early `if (a < b) return;`.
   Float `MIN` is `bge/b/fmr` — the ternary's empty then-branch, not `if (a>=b) a=b;`.
7. **`lbz`+`cmpwi` with no `extsb` ⇒ the field is `s8`.** `u8` gives `cmplwi`.
   Loop counters: `cmplwi` ⇒ `u32`, `cmpw` ⇒ signed.
8. **A `(u32)` cast on a call result is FOLDED** — assign to a `u32` local instead
   (`cmplwi rX,0` after a `bl` means an unsigned return type in that TU).
9. **Declaration order and STATEMENT order are independent levers**; one fight
   function needed a specific pair of both. Builds are ~8 s, so brute-force
   sweeps over all 24/120 permutations are cheap and were decisive several times.
10. **Single vs double precision is decided by the OPERANDS, not the destination**
    — `f32 - f32` emits `fsubs` even when assigned to a `double`; cast one operand
    to get `fsub`. Relatedly, `double` *parameters* (K&R promotion) reproduce
    functions that do all math in double.
11. `n = A - B; n--;` writes in place where `n = A - B - 1;` adds a temp + `mr`.
    `!x` and `x == 0` differ (`x == 0` adds a redundant `neg`).
12. For aggregates the **LAST-declared local gets the LOWEST stack offset**
    (FPRs/GPRs still descend with declaration order).

### DEAD ENDS — confirmed, do not re-derive

- **Hand-rolled int→float via type-punning cannot dodge the magic double.**
  It does emit zero `.rodata`, but produces `fsub`+`frsp` where mwcc's built-in
  idiom gives one `fsubs`, plus a larger frame. This escape hatch does not exist.
- **An empty `switch` case adjacent to a non-empty one is not recoverable** —
  mwcc folds it into `default` and re-pivots. 13 shapes tried. The matching source
  for that asm is usually an `int`-promoted signed range guard instead.
- `.data` switch jump tables remain structurally unreachable (`rel_carve` only
  holes `.rodata`). Add bowling `lbl_0000664C` to the known-blocked list.

### KNOWN-BLOCKED ADDITIONS (beyond §0.8's, which all still hold)

- fight `lbl_00018154`/`lbl_000181A8`: need the magic at `lbl_0001C648`, whose
  hole is owned by `src/mini_fight_71.c` and is far away in `.text`. Only a
  whole-TU conversion of `0x154B0..0x18F00` (17 magic users) reaches them.
- fight `lbl_0000FF34`: body is now CERTAIN (documented in the run-4 agent notes);
  store order `unk148,state` gives the right instruction order but puts `t` in r0,
  the swap gives r3 but the wrong store order. Mutually exclusive. Stop.
- golf `lbl_0000FA18`: the original carries 4 DEAD instructions (`subfc`/`subfze`
  computing an unread `(u64)counter - 0xFFFFFFFF00000000`) — the only `subfze` in
  the module — plus 8 unaccounted frame bytes. Some 64-bit construct not identified.
- billiards: the `lbl_00020B58` pool TU is exactly `lbl_00018474`, `lbl_00018608`,
  `lbl_000186EC`, `lbl_000189B4`, `lbl_00018A98`, `lbl_00018C78`, `lbl_00018F4C`,
  `lbl_00019264` (1158 insn). A whole-TU carve is the ONLY route to real float
  literals there, but all 8 must match at once and 3 are allocator-stuck.

### Process notes for the next run

- **Namespace scratchpad paths per module.** The session scratchpad is SHARED
  between parallel agents; run 4's fight agent `rm -rf`'d a path and destroyed the
  race agent's backups. (No loss — race was already merged and golden.)
- **A build-failure guard is mandatory**, not advisory. Golf hit §0.8's fictional-
  match trap live: a missing forward decl failed one `.o`, the stale asm-include
  object stayed, and the per-function diff reported a false 0/70 match. Hard-fail
  on `^# Error` before diffing.
- **The hash proves nothing about file integrity.** A fight helper's bad regex
  deleted `#pragma force_active on` plus every following forward decl in 5 files
  and the REL still hashed golden. Diff structure too.
- Remaining: 132,543 insn. Median remaining function is now larger again; billiards
  (2.9%) and fight (4.8%) hold the most untapped mass.

---

## 0.8 — RUN 3 DONE (2026-07-25): +3,147 insn, 2.6% -> 4.8%. MERGED + all 12 artifacts OK.

Six parallel agents, one per minigame REL. **Merged into the main tree, each REL
rebuilt in-tree to its golden sha1, `sha1sum -c supermonkeyball.sha1` = all 12 OK.**

| module | funcs | insn | % | gained |
|---|---|---|---|---|
| mini_bowling | 37/120 | 1644/15313 | 10.7% | +19 fns / +1157 |
| mini_golf | 62/118 | 1975/38919 | 5.1% | +11 fns / +929 |
| mini_race | 39/157 | 1203/19817 | 6.1% | +6 fns / +363 |
| mini_pilot | 23/75 | 803/12137 | 6.6% | +5 fns / +286 |
| mini_billiards | 14/70 | 552/28793 | 1.9% | +2 fns / +218 |
| mini_fight | 45/154 | 692/28588 | 2.4% | +3 fns / +194 |
| **TOTAL** | | **6869/143567** | **4.8%** | **+3,147** |

Run 2 was +1,841 insn, so run 3 was ~70% better on *harder* functions.
Merge-back tool: `tools/rel_merge_back.py` (handles the `asm/<mod>_d*.s` carve
segments that run 2's version knew nothing about).

### THE BIG LESSON: carving was NOT what produced this. mwcc idiom knowledge was.

Run 3 was designed around `rel_carve.py`. **Only ~2 of the ~46 matches used it.**
mini_golf matched 11 functions with the carve fully UNDONE. Ranked levers:

1. **`mathutil_sum_of_sq_2()` / `mathutil_sum_of_sq_3()` / `mathutil_vec_len()`
   (inline asm in `src/mathutil.h`) are the ONLY source of `fmuls`/`fmadds`
   contraction** — mwcc does NOT contract `a*a+b*b+c*c` itself. Unlocked 4 of
   golf's 11. Highest-value single fact in this document.
2. **Declaration order maps to DESCENDING callee-saved registers** (first-declared
   gets the highest GPR) and to descending stack offsets for aggregates.
3. **Frame arithmetic is an oracle:** `locals = frame - 8 - saved_bytes`. A
   smaller frame than the original means the original had real locals — add them.
4. **Typed globals**: `extern struct FightWork lbl_10017664;` + `.sub[i].unk12`
   changed base-register selection from r0 to r3 where every raw-`u8*` phrasing
   failed.
5. `__fabs` works without `<math.h>`. Hand-added `extern`s and structs survive
   `rel_rematch`; hand-added `#include`s do NOT.

### Corrections to §0.7 — believe these over anything above

- **The "hoisted literal-pool base" FAIL-FAST rule is TOO STRICT.** Three of six
  agents said so independently. `u8 *p = (u8 *)lbl_XXXX;` then
  `*(f32 *)(p + 0xNN)` reproduces `lis/addi` into a callee-saved reg plus literal
  offsets EXACTLY, including offsets reaching past the base label into
  neighbouring pool entries. It applies ONLY to mwcc's own generated literal
  pool. Do not skip on this signature alone — it suppressed real matches.
- **The asm-sibling deopt is sometimes REQUIRED.** bowling `lbl_000087CC`: plain
  C promoted a local `Vec` into f28-f30; the original keeps it in memory.
  Routing through `mathutil_sum_of_sq_2` (which contains an `asm` block)
  reproduced the original exactly.
- **Incremental carving ceiling ≈ 58 functions, not ~200.** Only ONE .c object
  can emit a given 8-byte magic double, and one object contributes exactly ONE
  CONTIGUOUS `.rodata` block. 58 magic anchors vs 217 direct-magic functions.
  Often even less: pilot `lbl_00009C18` needs two non-adjacent constants
  (`0xC3C0` + `0xC5B8`) so its anchor is structurally unusable.
- **A second user of an already-carved magic CAN be matched — put it in the SAME
  object.** bowling merged `lbl_0000E2E0`+`lbl_0000E3A0`+`lbl_0000E450` into one
  range file; `.rodata` stayed exactly 8 bytes.

### TOOL BUGS — two fixed, two still live

- **FIXED** `rel_rematch.py` silently deleted struct members whose line began
  with a comment (`/*0x00*/ u8 filler0[0x58];`), so hand-added structs came back
  as `struct X { };`. `is_scaffold()` now uses a real comment-only test.
  Workaround if you hit an old copy: write offsets as TRAILING comments.
- **FIXED** `rel_carve.py` prefix-carves (`--hole lbl:8`) lost the zero-size
  alias, so still-asm users failed to link.
- **LIVE** `rel_rematch.py` can LOSE newly-converted files. In mini_race it
  reported "re-applied 33 pure-C files", did not see the 6 converted that
  session, reverted all 6, and dropped 79 -> 76 files. In mini_golf an earlier
  run took 41 -> 40 and silently broke the module. **Back up before every
  `rel_rematch`, and assert `ls src/<mod>*.c | wc -l` goes UP.**
- **LIVE** `rel_carve.py` only holes `.rodata`. Switch jump tables live in
  `.data` (bowling `lbl_0000871C`/`lbl_00009230`, golf `lbl_0000F194`) and are
  structurally unreachable until it handles `.data` too.

### Two build traps that produce FALSE results

1. `make src/<file>.c.o` compiles with the WRONG flags. `%.plf: CFLAGS +=
   $(REL_FLAGS)` means `-sdata 0 -sdata2 0 -g` only apply when the GOAL is the
   `.plf`. A direct object build puts constants in `.sdata2` with SDA21
   addressing instead of `@ha/@l` — code that can never match, and it leaves a
   wrongly-flagged `.o` the REL build considers up to date. Always
   `make mkbe.rel_<mod>.plf`.
2. **A failed compile leaves the previous object in place.** If that object was
   the asm-include build, a per-function diff reports a PERFECT MATCH that is
   fiction. Any diff harness must assert the `.o` is newer than the `.c`.

### Known-blocked, do not re-derive

- bowling `lbl_0000A808`/`lbl_0000B460`/`lbl_0000B654` (278 insn): all three
  originals carry a redundant loop-entry guard (`li rX,0; cmpwi rX,10; bgelr`)
  that mwcc folds away. 7 formulations tried. One shared unexplained root cause.
- bowling `lbl_0000A778`: `src/sound.h` declares `SoundVol(u16,u8)` where the
  original TU used `int` params. Fixing it perturbs the DOL and every module.
- golf `lbl_000252C0`/`lbl_0002544C`/`lbl_0002572C` share magic `lbl_00026A98`
  with `lbl_000255CC` interleaved in `.text` — needs
  `--isolate-range lbl_000252C0 lbl_0002572C`, which `rel_rematch --add`
  (singletons only) cannot bootstrap. Do it by hand.

### Where the wall is

Every agent reported the same shape: functions driven to 1-4 instruction
differences, then lost to register-allocator tie-breaks. billiards
`lbl_0000341C` reached 149/152, `lbl_00018608` 47/57; fight `lbl_0000FF34`
reached ONE diff over ~20 variants; pilot `lbl_0000B130` 199/201. 136,698 insn
remain in the minigame RELs; at run-3 rate that is ~43 more runs, and the rate
declines as tractable functions deplete.

---

## 0.7 — 2026-07-25: THE RODATA CEILING IS GONE. Read this before anything else.

The previous "ceiling" (§0.6) capped the project at ~33% of the minigame RELs:
68.8% of the remaining 139,845 instructions sat in functions needing a
compiler-generated constant (192 fns / 67.1% of mass need the int->float magic
double; 18 fns / 13.7% need a switch jump table). **That cap was a property of
the tooling, not of the binary.** All of it is now reachable.

### What was actually wrong

`rel_split.py` keeps ALL module data in one blob (`asm/<mod>.s`, last in
SOURCES) and splits only `.text`. A converted function's mwcc-emitted constants
therefore land *ahead* of the whole original blob instead of *replacing* the
original bytes. The tool comments say rodata must stay one contiguous blob
because an earlier attempt to split it failed. **That attempt failed for a
fixable reason:** labels referenced *within* the blob were local symbols, so
splitting orphaned them and `elf2rel` died with `could not find symbol`. Promote
those to `.global` and the blob splits byte-neutrally.

### Proven, each gated on golden `cc2b2ef2…` (mkbe.rel_mini_pilot.rel)

1. **rodata spans multiple objects byte-neutrally** once cross-object refs are
   `.global`.
2. **A pure-C object's emitted `.rodata` fills a carved hole.** Done twice:
   `lbl_00008568` with real `200.0f`/`170.0f` literals, and `lbl_0000A69C` with
   a genuine `(f32)` int->float cast emitting the magic double. Built uncarved
   first to reproduce the documented failure (`1e7464b3…`, object emitted
   exactly `43300000 80000000`), then carved -> golden.
3. **Shared constants survive**: a constant used by N functions keeps its symbol
   as a **zero-size label at the end of the preceding segment**. It resolves to
   the hole's address (`00000540 g .rodata 00000000 lbl_0000C3C0`, == 0xC3C0),
   so the 8 still-asm users keep linking while the C object supplies the bytes.

### THE TWO RULES

- **ORDERING.** Objects contribute `.rodata` in SOURCES order, and SOURCES
  follows `.text` order. A constant must be emitted by the .c file holding its
  **first user in .text order**. Verified by deliberately breaking it: emitting
  `0xC3C8`/`0xC3CC` from the `0x8568` file while `0xC3C0`'s magic came from the
  `0xA69C` file gave `[200.0f][170.0f][magic]` where the original has
  `[magic][200.0f][170.0f]` — same bytes, swapped, nothing else moved.
  `rel_carve.py` refuses this.
- **ONE OBJECT PER TU POOL.** mwcc emits the magic double **once per translation
  unit**, not per function, and pools/dedups literals across the whole TU in
  first-use order. Confirmed by compiling a probe with the real REL flags:
  three functions, the second doing its own int->float, produced ONE magic and
  emitted `[0.99][magic][0.75][1.25][2.5][3.75]` — first-use order, no second
  magic. So **two .c files can never split one TU's pool.**

### What that means for the workflow

The endgame unit is a **whole TU in one pure-C file, with its entire rodata pool
carved as a single hole** — mwcc then regenerates the pool itself, in the right
order, with the right dedup. No per-constant negotiation. The per-constant
carving still works for the *incremental* case (convert one function of a TU
while the rest stay asm — that is what got `lbl_0000A69C` to golden), and that
is the cheap way to keep scoring.

### Tools (both untracked, working)

- **`tools/rel_carve.py`** — `--list` shows every rodata constant with its
  first-use function and the .c that must own it (MAGIC flagged).
  `--hole <label>[:<bytes>] --into <src.c>` carves one constant (repeatable);
  `--hole-range <first>:<last> --into <src.c>` carves a whole TU pool;
  `--undo` restores. Restores the pristine blob from `git show HEAD:asm/<mod>.s`
  every run, so it is **idempotent — pass ALL holes on one command line**.
  Validates before writing, so a rejected request leaves the tree untouched.
  Run it **after** `rel_rematch.py`; `--undo` first if re-running rematch
  (rematch finds the SOURCES block by looking for `asm/<mod>.s` as the last line).
- **`tools/rel_tu_map.py`** — TU partition + magic anchors per module.
  **47 TUs across the 6 modules**, median ~1.1-2.2k insn.

Recover TU boundaries from **magic doubles only**. A first attempt treating
every rodata reference as TU-local was wrong: a named `const` table defined in
one .c is legitimately referenced from another via `extern`, and mini_billiards
has several spanning most of the module, which collapsed it to a bogus single
28,723-insn TU. Group functions around magic anchors, merging anchors whose user
ranges overlap (the signed `…80000000` and unsigned `…00000000` forms sit 8
bytes apart in one pool).

### Honest scope (measured, not estimated)

Whole-project, by instructions of game code: **~50% done**, not 2.6%. The 2.6%
counts only the 6 split minigame RELs. Remaining game code = 204,484 insn
(143,567 minigame RELs + 46,690 option/sel_ngc/test_mode, unsplit + 11,526
credits/mini_ranking + 2,701 DOL stubs). A further 57,736 insn of Dolphin SDK /
MusyX / MSL asm under `libraries/` is conventionally out of scope.

Duplication is NOT a lever: hashing all 694 REL function bodies (exact shape,
mnemonic-only, and 5-gram Jaccard) found only 15 exact clone groups worth
**1,354 insn (~1%)**, and 55 near-duplicate pairs. Don't plan around it.

The remaining functions are big: matched median **19** insn, remaining median
**118**, mean 268, max 7,131. 30 functions >=800 insn hold 44% of the remaining
mass. Progress per function will keep falling; progress per *TU converted* is
the metric that now matters.

---

## 0.6 — RUN 2 (2026-07-24): +50 functions, 1.3% -> 2.6%  [superseded by §0.8]

**RESULT — all 6 modules merged to main, each rebuilt in-tree to its golden sha1, committed on `wip/rel-drafts-and-dol-matches`; `sha1sum -c supermonkeyball.sha1` = all 12 artifacts OK.**

| module | funcs was->now | insns was->now | commit |
|---|---|---|---|
| mini_bowling | 6->16 | 186->487 | 279e705 |
| mini_race | 23->32 | 624->840 | 1647d978 |
| mini_fight | 36->42 | 327->498 | cf95f8f |
| mini_pilot | 12->20 | 262->517 | 4030db1 |
| mini_golf | 39->51 | 345->1046 | 52e5508 |
| mini_billiards | 7->12 | 137->334 | 7d7576f |
| **TOTAL** | **123->173 (+50)** | **1881->3722 (+1841; 1.3%->2.6%)** | tool fix: 0536c4e |

Merge-back used `scratchpad/merge_back.py` (swaps `src/<mod>*.c`, splices the module's Makefile SOURCES block preserving main's CRLF) then an in-tree rebuild gated on golden — validated on all 6. Warm copies remain under `C:/tmp/smbm/<mod>` (each still builds golden) until cleaned up.

> **⚠ THE "CEILING" BELOW WAS DISPROVED ON 2026-07-25 — see §0.7.** The
> rodata-duplication blocker is solved; `tools/rel_carve.py` carves a hole in the
> data blob so a pure-C object supplies its own constants. Read §0.7 FIRST; the
> bullet immediately below is kept only to explain what the old workarounds were.

**FINDINGS / CEILINGS (recurred across EVERY agent — read before the next run):**
- **~~Magic-double `.rodata` duplication is the dominant blocker.~~ SOLVED — see §0.7.** Any function whose C needs a *compiler-generated* int->float constant (`0x4330000080000000`), or emits its own float/double *literal*, makes mwcc write that constant into the per-function TU's `.rodata`, duplicating the module's shared pool (kept verbatim in `asm/<mod>.s`) and shifting the data layout — `.text` matches perfectly, layout doesn't. Old workaround: read existing constants as `*(double*)lbl_XXXX` instead of a literal (still fine, still used in committed code). The real fix is to carve the constant OUT of `asm/<mod>.s` and let the C object emit it — §0.7.
- **Typed-global opportunity (unlocks ~4+ more in fight alone) — TOOL SUPPORT DONE (f338d48):** some functions match only when a `.bss`/`.data` table is declared as a *typed struct/array global* (so mwcc uses base-in-`@ha` + `addi @l` addressing) instead of `extern u8 …[]`. `rel_rematch` now PRESERVES a hand-typed data extern (`extern struct S d;` / `extern T d[8];`) in its pure-C file across re-splits, plus any struct/typedef the extern needs. So: convert a fight function, hand-type its data extern in that pure-C file, gate on golden — it survives. (The remaining work is doing those conversions.)
- **Imported-fn signatures — DONE (f338d48):** `rel_split` emits the generic `extern void <fn>();`; `rel_rematch` now re-applies a hand-typed imported-fn extern (`extern int func_80042214(u32);`, pilot `_17.c`) over it (keyed by symbol). Verified: pilot round-trips through `rel_rematch` to golden with the typed extern intact (the old tool clobbered it).
- **fn-ptr-table sub-handlers — DONE (f338d48):** `rel_rematch` now passes every reconstructed pure-C label (and `--add`) as `--extra-start`, so a handler reached only through a `.data` fn-ptr table (`blrl`, not a `bl`/`@ha` target) is isolable and valid as a range endpoint. This fixed the `rel_rematch mini_pilot` "unknown end label lbl_00005008" crash and the earlier `--add lbl_00004E84` crash.
- **Splitter crash caveats that REMAIN (recover via `git show HEAD:<path> > <path>`; whole-tree `git checkout` is blocked by the sandbox classifier, use per-file):** never `rel_rematch --add` (a) an already-matched label, or (b) a label INSIDE an existing matched `--isolate-range` — either still crashes `rel_split` mid-run and wipes the uncommitted `src/<mod>*.c`. The "smallest asm file" scan lists already-matched stubs too, so filter against what is already C.
- Remaining skips are ordinary CW register-allocator / instruction-scheduler tie-breaks (documented per module in the commit bodies + agent notes) — low ROI.

---

### Run-2 setup (kept for reference)

Launched **one background `decompiler` (Opus) agent per minigame REL** to extend matching beyond the run-1 baseline (§0.5). Setup validated end-to-end before launch:

- **Isolation:** each agent owns a full warm copy at `C:/tmp/smbm/<module>` (robocopy of the repo **including `.git`** — needed because `rel_rematch.py` does `git show 5138d8f:asm/<mod>.s` — excluding only `baserom.*`; ~47MB real bytes each) with its own CW linker temp `C:/tmp/tmp_<module>`. `du` over-reports these ~10x (Windows allocation units); real tree+`.git` ≈ 47MB. Verified: `mini_pilot` warm copy builds `cc2b2ef…` golden from the isolated path.
- **TOOL FIX (committed-worthy, applied to `tools/rel_rematch.py`):** the old rematch regenerated each pure-C file's preamble and **dropped any hand-typed forward declaration for a function DEFINED IN ANOTHER file** (e.g. `void lbl_00016D9C(int a, int b);` in `mini_billiards_9.c`, whose body is an asm stub in `_10.c`) — its sig-rewrite only covered labels defined *in the same file*, so a typed call reverted to the generic `void lbl_X(void);` and no longer compiled. Fix: capture each committed file's forward-decl lines (`saved_fwd`) and re-apply them verbatim over the regenerated preamble (committed decl > local-def sig > generic). Verified: `rel_rematch mini_billiards` with no `--add` now reproduces `4ff9ee…` golden (it previously **failed to compile** `_9.c`). The fixed tool is copied into all 6 warm copies.
- **`python` gotcha:** `rel_rematch.py` must run via the **Bash-tool default python** (`Python 3.13.5`, has `git`) — NOT inside the msys2 `-lc` build wrapper (msys2 mingw has no `python`). Only `make` runs inside the msys2 wrapper.

**Golden hashes (the per-agent gate):** bowling `29ded64794215790b8bfd6fc6c2517ca835b6b1a` · race `c600a0f425b42405f27527f57bcba110fffa0431` · fight `233b6073feb2ec293cff024523019225c41f5604` · pilot `cc2b2ef2b1c2bdf613beae9c71ff32d75e03059f` · golf `fc70c4e88e1f22e908bbcc4e263cb45e74310b93` · billiards `4ff9ee4165b581f68848c6a0ce3448baf62b6c73`.

**Per-agent loop:** `python tools/rel_rematch.py <mod> --add <lbl>` → convert the new stub file to pure C (template = an already-matched pure-C sibling in the same module + the run-1 draft `git show 5138d8f:src/<mod>.c`) → `make … mkbe.rel_<mod>.rel` → gate on golden sha1 → confirm `grep -c '#include "../asm/nonmatchings' src/<mod>_N.c` == 0 on the new file. Match smallest-first; skip reg-allocator tie-breaks after ~2 tries.

**Seed candidates (smallest unmatched, insn count):** bowling `lbl_0000E870(9) lbl_0000D8CC(16) lbl_000090CC(26) …` · race `lbl_0000FC8C(14) lbl_000007EC(19) lbl_00007900(20) …` · fight `lbl_000121FC(19) lbl_000117CC(20) lbl_00018154(21) …` · pilot `lbl_00006CCC(18) lbl_00008568(19) lbl_0000AE94(19) …` · golf `lbl_0000982C(21) lbl_00009538(35) lbl_0000F750(38) …` · billiards `lbl_00007D18(26) lbl_00009E34(36) lbl_00019FD4(40) …`.

**MERGE-BACK (orchestrator does this after agents finish):** for each module copy `C:/tmp/smbm/<mod>/src/<mod>*.c` → repo `src/` (delete repo `src/<mod>_*.c` first so removed split files don't linger), then copy that module's `SOURCES` block from the copy's `Makefile`, rebuild the REL **in the main tree**, confirm golden, and `grep`-confirm the new C survived. `asm/<mod>.s` + `asm/nonmatchings/<mod>/` are deterministic from the split (unchanged content) — no need to copy. Then re-measure with the §0.5 script and commit per-module. **NEVER copy `*.rel/.plf/.elf/.map/.o`.**

---

## 0.5 — PARALLEL ROLLOUT DONE + NEXT-RUN PLAYBOOK

All six minigame RELs are split + partially matched to pure C, each building to its golden sha1, committed + pushed on `wip/rel-drafts-and-dol-matches`. The 5 non-bowling modules were done by 5 parallel Opus subagents (one per module) in isolated warm copies.

**BASELINE — measured progress after run 1** (matched vs total; the honest metric is instructions of code, NOT function count — the easy small functions went first):

| module | funcs matched/total | instructions matched/total | % code |
|---|---|---|---|
| mini_bowling | 6/120 | 186/15313 | 1.2% |
| mini_race | 23/157 | 624/19817 | 3.1% |
| mini_fight | 36/154 | 327/28588 | 1.1% |
| mini_pilot | 12/75 | 262/12137 | 2.2% |
| mini_golf | 39/118 | 345/38919 | 0.9% |
| mini_billiards | 7/70 | 137/28793 | 0.5% |
| **TOTAL** | **123/694** | **1881/143567** | **1.3%** |

**Re-measure after the next run with this exact script** (run from repo root; compares matched-vs-total instructions per module so you can compute the delta / rate):
```python
python3 - <<'PY'
import glob, os, re
for m in ['mini_bowling','mini_race','mini_fight','mini_pilot','mini_golf','mini_billiards']:
    insn = {os.path.basename(b)[:-2]: sum(1 for l in open(b) if re.match(r'/\* [0-9A-Fa-f]{8} ', l))
            for b in glob.glob(f'asm/nonmatchings/{m}/*.s')}
    src = '\n'.join(open(p, errors='ignore').read() for p in glob.glob(f'src/{m}*.c'))
    still = set(re.findall(r'nonmatchings/%s/(lbl_[0-9A-Fa-f]+|_prolog|_epilog|_unresolved)\.s' % m, src))
    matched = set(insn) - still
    im, it = sum(insn[l] for l in matched), sum(insn.values())
    print(f"{m:<16}{len(matched):>4}/{len(insn):<4} funcs   {im:>6}/{it:<6} insn  {100*im/it:5.1f}%")
PY
```

**To EXTEND an already-matched module (this is what the next run does):** each module is already split; re-running `rel_split.py` from scratch would clobber the committed C. Use **`tools/rel_rematch.py`** instead — it reconstructs the module's whole split (imports, `--isolate`/`--isolate-range` layout, and the FULL content of every pure-C file incl. any struct/typedef a match added) from the committed `src/<mod>*.c`, restores the monolithic `asm/<mod>.s` from commit `5138d8f`, re-splits, and swaps the saved C back in — plus it carves any NEW functions you name into their own pure-C files:
```
python tools/rel_rematch.py <module> --add <lbl> [--add <lbl> ...]
```
Then convert each `--add` stub file to C (verify in isolation first — see below), rebuild, and gate on the golden sha1. Verified: `rel_rematch <module>` with no `--add` reproduces golden for mini_pilot and mini_golf.

**Run-1 method (kept for reference / new modules):**
- **Isolation:** git worktrees DON'T work (mwcc is gitignored). REL builds need the prebuilt DOL (ELF2REL resolves imports from `supermonkeyball.map/.elf`), so a warm copy must be the full tree minus `.git`/`baserom` (~44MB; robocopy). Per-agent `TMP=C:/tmp/w<x>` for the CW linker; each agent works in a spaceless `C:/tmp/smbm/<x>`.
- **Integrate a finished module** back to main: copy `src/<mod>*.c` + `asm/<mod>.s` + `asm/nonmatchings/<mod>/` + its Makefile `SOURCES` block, then rebuild the REL in main to independently confirm golden + run `sha1sum -c`.
- **iso-verify caveat:** the isolated mwcc compile MUST add `-sdata 0 -sdata2 0 -g` (the REL_FLAGS from Makefile line ~61) or DOL globals use small-data addressing (`R_PPC_EMB_SDA21`, 1 insn) instead of the golden `lis@ha`+`lwz@l` — false verification.
- **VERIFY the C survived, not just the hash:** an all-asm split ALSO hashes golden, so after any regen confirm `grep -c '#include "../asm/nonmatchings' src/<mod>_N.c` == 0 on your pure-C files.
- The `rel_split.py` `.data` `.balign 8` fix (3 agents found it independently) is already in the tool.

Each module's remaining functions are the harder ones (physics/draw/dispatch, register-allocator tie-breaks — some never source-matchable). Continue per-module: `rel_rematch --add <lbl>`, write matching C, isolation objdump-verify, rebuild, gate on the whole-REL golden.

## 0. TL;DR — where we are and what to do next

- This is a **matching decompilation** of Super Monkey Ball (GameCube). Goal: C that compiles (with CodeWarrior 1.1) to **byte-identical** original binaries.
- **The DOL is essentially done.** We matched 2 more stub functions in an earlier session; 6 remaining stubs are genuine CodeWarrior register-allocator tie-breaks (documented, low ROI).
- **START AT §0.11 (run 5 done: all 9 REL modules split, 8.83%, `make all` works again).** Then §0.9 for the older idiom list — but §0.11's CORRECTIONS section overrides §0.9/§0.10 wherever they disagree. §0.6/§0.7/§0.8 are history; §0.7's fail-fast rule is WRONG (§0.8 corrects it) and §0.8's tool-bug list is superseded.
- **The RELs (minigames) are the big remaining surface.** They ARE verifiable (per-REL sha1s in `supermonkeyball.sha1`). We built a **splitter** (`tools/rel_split.py`) that carves a monolithic REL into per-function pieces so functions can be matched one at a time, validated a **byte-neutral split of `mini_bowling`**, added **multi-file output + `--isolate`/`--isolate-range`**, and **matched 6 functions in the real `mini_bowling.rel` (golden `29ded64...`)**: `lbl_000076D0`, `lbl_00007740`, `lbl_00007778`, `lbl_00007964`, `lbl_000079E8`, `lbl_000086E4`.
- **CRITICAL FINDING — CORRECTED THIS SESSION:** the real cause of the "deopt" is **NOT a TU-size threshold**. mwcc's inline assembler **turns off the instruction scheduler + peephole optimizer for EVERY C function that shares a translation unit with an `asm` block** — it is the *presence* of inline asm, not the amount. Verified directly: `lbl_00007778` compiles byte-perfect in isolation (`extsb.`, `blr` guards); adding **a single `static asm` sibling** to its TU flips it to `extsb`+`cmpwi` / `b <epilogue>` (no match); a 4-function chunk deopts identically to the 120-function one. **Fix = put each to-be-converted C function in its OWN pure-C file with no asm-include siblings.** (Uniform "chunking" by function count does NOT help — that was the earlier, wrong hypothesis.) See §6.
- **Immediate next task:** continue matching mini_bowling functions with the proven workflow — `python tools/rel_split.py mini_bowling <same --extern-fn args> --isolate <lbl> [--isolate <lbl> ...]`, convert each isolated singleton file's body to C, keep the Makefile `SOURCES` in `.text` order, rebuild, confirm `29ded64...`. Then generalize + roll out to the other modules (mini_race/fight/golf/billiards/pilot, option, test_mode, sel_ngc).

---

## 1. Project basics

- Repo: `d:/Nonschool Projects/smb-updated-decomp/smb-decomp` (a clone of `camthehaxman/smb-decomp`; upstream `camthesaxman/smb-decomp`).
- Output artifacts and their **golden sha1s** are in `supermonkeyball.sha1`:
  - `supermonkeyball.dol` → `424e8ce10135686de0709a147e6a3a5a3fda02f1`
  - `mkbe.rel_mini_bowling.rel` → `29ded64794215790b8bfd6fc6c2517ca835b6b1a` (+ 10 other RELs, each listed)
- Verify everything at once: `sha1sum -c supermonkeyball.sha1` (all should say OK when the tree is in a matching state).
- Progress metric tool: `calcprogress.py`.

## 2. Build & toolchain (Windows + msys2 + CodeWarrior 1.1)

**Use CodeWarrior 1.1, NOT 1.0** (1.0 mis-allocates registers in some functions). The Makefile default is `COMPILER_VERSION ?= 1.1` — honor it.

Working build command (run from the Bash tool; delegates to msys2 so the native CW tools get a valid `TMP`):
```
/c/msys64/usr/bin/bash.exe -lc 'export DEVKITPPC=/c/devkitPro/devkitPPC PATH="/mingw64/bin:$PATH" TMP=C:/tmp TEMP=C:/tmp; cd /c/smbwork; make OS=Windows_NT COMPILER_VERSION=1.1 HOSTCC=gcc CC_CHECK=true <TARGET> 2>&1 | tail -20'
```
- `<TARGET>` = `supermonkeyball.dol` (the DOL), or `mkbe.rel_mini_bowling.rel` (a specific REL), or `all` (everything — but see §7, drafts break `all`).
- `/c/smbwork` is a **junction to the repo** (spaceless path). `make`/host `gcc` live in msys64 (not default PATH). `OS=Windows_NT` avoids the wine branch. `HOSTCC=gcc` builds tools. `CC_CHECK=true` skips the modern-gcc K&R lint (mwcc is the real compiler). `TMP=C:/tmp` must be set from inside msys2.
- Rebuilds are **fast/incremental**. After a compiler-version change delete stale objects first (`find . -name '*.o' -delete`).

## 3. Verification (per-function) — the WORKING method is raw objdump, not diff.py

`diff.py` exists but fights Windows/Py3.13 (ansiwrap imports the removed `imp` module; `make print-DEVKITPPC` doesn't inherit env from git-bash). **Skip it. Use raw objdump byte-diff instead.**

- **`baserom.dol`** (the original game) IS in the repo root (gitignored). We generated **`baserom.elf`** from it with **`dol2elf.py`** (in repo root): `python dol2elf.py baserom.dol baserom.elf`. This is the diff reference for **DOL** functions. (Regenerate if missing.)
- **DOL per-function diff** (S/E = vaddr/end from `supermonkeyball.map`, format `<fileoff> <size> <vaddr> <align> <name>`):
  ```
  OBJ=/c/devkitPro/devkitPPC/bin/powerpc-eabi-objdump.exe
  $OBJ -drz -j .text --start-address=$S --stop-address=$E baserom.elf        | grep -E '^[0-9a-f]+:' | sed -E 's/^[0-9a-f]+:\t//; s/\t.*//' > /tmp/base.txt
  $OBJ -drz -j .text --start-address=$S --stop-address=$E supermonkeyball.elf | grep -E '^[0-9a-f]+:' | sed -E 's/^[0-9a-f]+:\t//; s/\t.*//' > /tmp/mine.txt
  diff /tmp/base.txt /tmp/mine.txt   # empty = byte match; the grep/sed strip reloc/symbol noise
  ```
- **REL per-function diff**: the `.plf` (partially-linked ELF, one per REL) is the diffable reference. **The matching `.plf`s currently on disk ARE the reference — snapshot them BEFORE building any REL** (`cp *.plf` to a safe dir), because a rebuild overwrites them. NOTE: the previous session's snapshots were in a session-specific scratchpad and are **gone** — re-snapshot from the current (matching) tree at the start. Then diff `objdump -d -j .text` of the built `.plf` vs the snapshot; since only your changed function differs, the diff localizes.
- **Whole-target pass/fail** (no per-byte feedback needed): build, then `sha1sum` the output vs the golden hash. For a REL, if every function except yours is still its exact original asm, then the REL hashing to its golden value proves YOUR converted function byte-matches.

## 4. Git / fork state

- Local branch: **`wip/rel-drafts-and-dol-matches`** (HEAD `5138d8f`). `master` (`e55e6a5`) is untouched.
- Fork pushed: **`https://github.com/pvpUS/smb-decomp`**, branch `wip/rel-drafts-and-dol-matches`. Remote is `fork`. Auth is `gh` account **pvpUS** (active).
- Commits on the branch:
  - `bdb8aff` — the 2 verified DOL matches (bg_water.c, bg_pilot.c).
  - `5138d8f` — WIP: all REL minigame **drafts** + `dol2elf.py` + mini_fight Makefile wiring. **The draft C for every REL module lives here** — retrieve with `git show 5138d8f:src/<module>.c`. These drafts are unverified but are strong STARTING POINTS for matching.
- **Committed checkpoints on this branch** (`git log` after `5138d8f`): `36a14f1` (multi-file + `--isolate`; matched `lbl_00007778`), `d408e28` (`--isolate-range`; matched `lbl_00007740`) — both pushed to the fork — then a follow-up matching the replay-snapshot pair.
- **Current mini_bowling layout (7 files, builds golden `29ded64...`, 6 functions matched as C):**
  - `src/mini_bowling.c` — asm-include stubs before 0x76D0
  - `src/mini_bowling_2.c` — **pure-C** `lbl_000076D0` + `lbl_00007740` + `lbl_00007778` (`--isolate-range`)
  - `src/mini_bowling_3.c` — asm-include stubs (0x7778 .. 0x7964)
  - `src/mini_bowling_4.c` — **pure-C** `lbl_00007964` + `lbl_000079E8` (replay snapshot save/restore; `--isolate-range`)
  - `src/mini_bowling_5.c` — asm-include stubs (0x79E8 .. 0x86E4)
  - `src/mini_bowling_6.c` — **pure-C** `lbl_000086E4` (`--isolate`)
  - `src/mini_bowling_7.c` — asm-include stubs after 0x86E4
  - `asm/mini_bowling.s` (data-only) — last in `SOURCES`
  - `asm/nonmatchings/mini_bowling/` — 120 per-function bodies.
- **VERIFY CONVERSIONS, not just the hash:** an all-asm-include split is ALSO golden, so a `29ded64...` build does NOT prove your C conversions are present — confirm the pure-C files actually contain the C (`grep -c '#include "../asm/nonmatchings' src/mini_bowling_N.c` == 0) before committing. (A botched regen that reverted to all-asm still hashes golden.)
- **Reproducing the matched state:** re-running `tools/rel_split.py` regenerates asm-include scaffolding and clobbers the hand-matched C, so the 5 conversions are re-applied by a scratch helper (`mb_build.py`, session-local) that holds the isolate spec + each matched C body in one place. The committed `.c` files ARE the source of truth; the helper is just for re-splitting when adding new isolations.
- **The 5 matched functions + their key facts (for re-derivation if needed):**
  - `lbl_00007740` — `*(s16*)(lbl_10000154+8)=0; u_play_music(0x64,8);`
  - `lbl_00007778` — any active player pressed A: `g_poolInfo.playerPool.statusList[i]` gate + `controllerInfo[playerControllerIDs[i]].pressed.button & PAD_BUTTON_A`, four separate `if(...)return 1;`
  - `lbl_00007964` / `lbl_000079E8` — save/restore: two separate `if(idx<0)return; if(idx>1)return;` guards (NOT a combined `||` — that mis-generates the `bgtlr`), then `((struct Ball*)lbl_10000178)[idx]` copy (Ball is 0x1A4) and `((Quaternion*)lbl_100004C0)[idx] = ball->ape->unk60` (Ape.unk60 at 0x60).
  - `lbl_000086E4` — Vec magnitude via `asm{}` sq-len idiom + `mathutil_sqrt` (optimizer-insensitive).
- **NEVER commit/push game binaries.** `baserom.*`, `*.dol`, `*.elf`, `*.rel`, `*.plf`, `*.o`, `*.map`, `*.bin` are all gitignored (copyrighted). Before any push, scan the diff for those patterns.

## 5. What's matched vs. not (DOL)

**Matched this session (asm stub → verified C, committed in `bdb8aff`):**
- `lbl_8005F520` (src/bg_water.c), `func_80064C30` (src/bg_pilot.c).

**Attempted, hit the CodeWarrior register-allocator wall, left as asm stubs (documented residuals — low ROI, need a new lever like different build flags):**
- `grading_play` (recplay.c) — 1 register-coloring bit (fsubs f1 vs f5); the `!temp_f1_3;` no-op IS required.
- `ev_sound_init` (sound.c) — 2-instr redundant loop guard mwcc deletes.
- `func_8006AD3C` (obj_collision.c) — reg-alloc only; correct dot order is `(z2+(x2+y1))-(z1+(x1+y1))`.
- `show_dvd_err_msg` (dvd.c) — 24 reg-naming diffs.
- `bg_pilot_draw` (bg_pilot.c) — f5/f6 tie-break.
- `input_main` (input.c) — structural (stack frame differs); known WIP.

These DOL stubs use the pattern `#ifdef NONMATCHING <C attempt> #else asm void F(){nofralloc #include "../asm/nonmatchings/F.s"} #endif`.

## 6. REL matching — infrastructure, the deopt finding, and the fix

**The RELs (minigames) are monolithic asm** (`asm/<module>.s` = whole module; `src/<module>.c` was a 4-line alignment stub). Dropping draft C into the `.c` collides (duplicate symbols) with the `.s`. `sel_stage_rel` is the only fully-done REL — it's **100% C across 3 `.c` files** (`sel_stage_rel.c`, `_2.c`, `_3.c`), no asm. That 3-file structure is the model (see the fix below).

**`tools/rel_split.py`** carves a monolithic REL into per-function asm-includes so functions become individually replaceable. It:
- Finds function starts = the 3 `.global`s + every `bl` target + every `@ha/@l` address-loaded `.text` label (does NOT split at jump-table/switch-case labels — keeps `bc` REL14 branches interior).
- Writes each function body to `asm/nonmatchings/<module>/<label>.s`.
- Rewrites `asm/<module>.s` to **data-only** (keeps `.rodata/.data/.bss/.sdata/.sdata2`; adds `.balign 8` to restore rodata alignment; un-`.if 0`s the alignment stub symbol; rewrites data→text relocs as `_prolog + <offset>`).
- Generates `src/<module>.c` = includes + externs + per-function `static asm void lbl_X(){nofralloc #include ...}` (globals non-static), all wrapped in `#pragma force_active on ... reset` (REQUIRED so mwcc doesn't dead-strip statics reached only via jump tables).
- Per-module knobs it exposes: `--include`, `--extern-fn`, `--extern-data`, `--extra-start`, plus (this session) **`--isolate <lbl>`** and `--chunk-size N` for multi-file output. Undeclared imports/data are found mechanically from the build's `undefined label` / `illegal use of label` errors.
- **Validated:** mini_bowling rebuilds to the golden `29ded64...` (byte-neutral) as a single file, as 6 uniform chunks, and as `--isolate`/`--isolate-range` splits up to the current 7-file layout with **6 functions matched as C**; `sha1sum -c` confirms nothing else broke.

> ### ⚠ THE DEOPT MODEL BELOW IS WRONG — corrected in run 12, see §0.18
>
> **It is POSITIONAL, and it is ONLY the peephole optimizer.** Confirmed by four
> modules independently, each with a golden build:
>
> | arrangement | result |
> |---|---|
> | C function alone (pure TU) | reference |
> | `asm` block **then** the C function | **DIFFERS** |
> | C function **then** the `asm` block | **BYTE-IDENTICAL** |
> | `asm`, **`#pragma peephole on`**, then the C function | **BYTE-IDENTICAL** |
>
> The scheduler is **not involved at all** — `#pragma scheduling on`,
> `optimization_level` and `global_optimizer` change nothing. The inline
> assembler disables the **peephole** for the **remainder of the TU only**, which
> is why a C function placed *before* the asm block was never affected.
>
> **So "the fix" below — isolating into pure-C files — is usually unnecessary.**
> `tools/rel_peephole.py` inserts the pragma and `--list-mixed <module>` reports
> where it applies. Measured after run 12: **only 3 of 9 modules contain a mixed
> TU at all (4 files), because the project already isolated them away.** The
> pragma's real value is that **merging creates a mixed TU, and that was
> merging's whole cost.**
>
> Keep reading below for the `rel_split`/`--isolate` mechanics, which are still
> accurate — just not the reason you think.

**THE DEOPT FINDING — SUPERSEDED, kept for the probe detail (read the box above first):** the earlier "one giant TU exceeds a size threshold" explanation was WRONG, and so is this replacement. The claim at the time: **mwcc's inline assembler disables the instruction scheduler + peephole optimizer for every C function that shares a translation unit with ANY `asm` block** — presence, not amount. Verified at the time with the exact build flags:
- `lbl_00007778` compiled **alone** (with or without `#pragma force_active`) → `extsb.` (record-form compare) + `blr` early-returns = **byte-exact match**.
- The **same** C + a **single** `static asm` sibling in the TU → `extsb`+`cmpwi` + `b <epilogue>` = **no match**.
- The same C in a 4-function chunk and in a 20-function chunk produced the **identical** (wrong) bytes — so chunk *size* is irrelevant.
`lbl_000086E4` matched earlier inside the big TU only because it is optimizer-insensitive (linear code, nothing to schedule).

**THE FIX — pure-C files via `--isolate` (works, but see the box above: `#pragma peephole on` achieves the same thing in place and should be tried FIRST):** put each to-be-converted function in its **own `.c` file with no asm-include siblings**. `python tools/rel_split.py mini_bowling <args> --isolate lbl_00007778` emits 3 files — `src/mini_bowling.c` (39 asm funcs before), `src/mini_bowling_2.c` (the lone `lbl_00007778`), `src/mini_bowling_3.c` (77 asm funcs after). Convert `_2.c`'s single body to C, list all three (then `asm/mini_bowling.s`) in `SOURCES` in order → **`mkbe.rel_mini_bowling.rel` = `29ded64...` golden.** Notes:
- Asm-include functions can ALL stay grouped in as few files as you like — they carry no C to optimize, so grouping is byte-identical (`--chunk-size` is cosmetic; default 0 = as few files as possible).
- `.text` order is preserved because each `.c` is a contiguous offset range and `SOURCES` lists them in order (linker groups each object's `.text` as one block). You cannot interleave functions between objects arbitrarily.
- Cross-file references are auto-promoted to global symbols by `compute_globals` (REL24 `bl` / `@ha/@l` across files; conditional REL14 branches never cross a function boundary, so this is safe).
- Converted C bodies are hand-written and applied AFTER the split; re-running the splitter regenerates asm-include scaffolding and needs those conversions re-applied (same as `lbl_000086E4` always did).
- **`--isolate-range START END`** puts a whole contiguous run into ONE pure-C file — use it to consolidate an already-matched run into a single file (the sel_stage_rel end state, few C files). A range file is pure C only once EVERY function in it is C; until then it still holds asm-include stubs that deopt its own converted members. So match a run function-by-function with singleton `--isolate` first (each independently golden-checkable), THEN consolidate with `--isolate-range`. Proven: `--isolate-range lbl_00007740 lbl_00007778` puts both matched functions in one pure-C file and the REL stays `29ded64...`. Ranges/singletons are validated (unknown label / backwards / overlapping → clear error) before any writes.

## 7. Strategy & concrete next steps (in order)

1. **DONE (committed + pushed):** `tools/rel_split.py` multi-file + `--isolate` + `--isolate-range`; matched 6 functions as C in `mini_bowling.rel` (golden); full `sha1sum -c` still all-OK. mini_bowling is the 7-file split described in §4.
2. **Keep matching mini_bowling** with the `--isolate` workflow above. Match new functions as singleton `--isolate` files (incremental golden checks), then `--isolate-range` to consolidate contiguous matched runs. Next candidates (drafts in `git show 5138d8f:src/mini_bowling.c`, UNVERIFIED starting points): the ball-callback substate run `lbl_00007A6C`/`lbl_00007C54`/`lbl_00007E74`/`lbl_00007FE0`/`lbl_000080E0` (contiguous — ideal for one range file), the camera-callback run (`lbl_0000871C` .. `lbl_00009230`), and `lbl_00007878`. Reconstruct each from the asm, verify struct offsets, objdump the built `.plf` function vs `asm/nonmatchings/mini_bowling/<lbl>.s` for per-function feedback, and gate on the whole-REL `29ded64...`.
3. **Generalize + roll out** to the other modules (mini_race/fight/golf/billiards/pilot, option, test_mode, sel_ngc). Each split is independent; validation builds collide in a shared tree, so use the **warm-copy method** (§8).
4. **Parallel-match** functions across split modules (warm copies, drafts from `5138d8f` as references, objdump/sha1 verification). Expect a much better hit rate than the DOL tail.
5. Merge matched files back to the main tree; re-run `sha1sum -c` to confirm the whole set still matches.

## 8. Reusable methods

- **Warm-copy parallel builds** (avoids build contention — multiple `make`s in one tree clobber each other): `tar -c --exclude=.git -f base.tar .` from the repo (via `/c/smbwork`), extract to `C:/tmp/smbm/{A,B,C,D}` (each ~51MB, includes all `.o` so builds stay incremental), give each worker its own `TMP=C:/tmp/w<X>` (CW linker temp), build with `cd /c/tmp/smbm/<X>`, partition work **by file** (so merge-back = copy changed files), then merge and do one final confirming build. 16 logical CPUs here — 4 workers is comfortable.
- **`dol2elf.py`** — regenerate `baserom.elf` from `baserom.dol` for DOL diffs.
- **Snapshot `.plf`s** before REL builds (they're the diff reference and get overwritten).

## 9. Gotchas

- CW **1.1 not 1.0**. `TMP` must be a native writable dir set inside msys2. `OS=Windows_NT` required.
- The REL **drafts break `make all`** (dup symbols vs monolithic `.s`) — expected; `supermonkeyball.dol` is unaffected and still matches.
- Some functions are genuine **CW allocator tie-breaks** — byte-identical schedule, different register numbering; not reachable by source reformulation. Don't over-invest; document and move on.
- **The asm-sibling deopt** (§6) — the single most important REL gotcha: a C function reproduces the original schedule ONLY in a pure-C file (no `asm` block anywhere in its TU). Not a size threshold.
- **Anything in §5-§9 claiming compiler-generated `.rodata` is an unavoidable ceiling is OUT OF DATE — see §0.7.** Use `tools/rel_carve.py`. The two rules that still bind: a constant must be emitted by the .c file holding its first user in `.text` order, and one TU's pool cannot be split across two .c files (mwcc emits the magic double once per TU and pools literals TU-wide in first-use order).
- `rel_carve.py` and `rel_rematch.py` fight over the Makefile SOURCES block: rematch expects `asm/<mod>.s` to be the LAST line, carve moves it first and appends `asm/<mod>_dN.s`. Always `rel_carve <mod> --undo` before re-running rematch.
- `mkbe.rel_sample.rel` is a template/sample module, not real game code.
- Auto-memory (`MEMORY.md` + files under the memory dir) loads automatically in a new session in this repo — the durable facts here are also captured there.
