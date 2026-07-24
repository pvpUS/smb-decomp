# smb-decomp — Session Handoff

> Working handoff for a fresh Claude Code session. This file is scratch/WIP notes — **do not commit it as project code** (add to a WIP branch or delete before any upstream PR). It is git-untracked.

---

## 0. TL;DR — where we are and what to do next

- This is a **matching decompilation** of Super Monkey Ball (GameCube). Goal: C that compiles (with CodeWarrior 1.1) to **byte-identical** original binaries.
- **The DOL is essentially done.** We matched 2 more stub functions in an earlier session; 6 remaining stubs are genuine CodeWarrior register-allocator tie-breaks (documented, low ROI).
- **The RELs (minigames) are the big remaining surface.** They ARE verifiable (per-REL sha1s in `supermonkeyball.sha1`). We built a **splitter** (`tools/rel_split.py`) that carves a monolithic REL into per-function pieces so functions can be matched one at a time, validated a **byte-neutral split of `mini_bowling`**, and (this session) added **multi-file output + `--isolate`** and **matched `lbl_00007778` in the real `mini_bowling.rel` (golden `29ded64...`)**.
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
- **Committed checkpoints on this branch** (`git log` after `5138d8f`): `36a14f1` (multi-file + `--isolate`; matched `lbl_00007778`; 3-file split) and a follow-up (`--isolate-range`; matched `lbl_00007740`; restructured to 5 files). Not pushed to the fork yet.
- **Current mini_bowling layout (5 files, builds golden `29ded64...`, 3 functions matched as C):**
  - `src/mini_bowling.c` — asm-include stubs before 0x7740
  - `src/mini_bowling_2.c` — **pure-C range** `lbl_00007740` + `lbl_00007778` (both matched, one file via `--isolate-range`)
  - `src/mini_bowling_3.c` — asm-include stubs (0x7778 .. 0x86E4)
  - `src/mini_bowling_4.c` — **pure-C singleton** `lbl_000086E4` (`--isolate`)
  - `src/mini_bowling_5.c` — asm-include stubs after 0x86E4
  - `asm/mini_bowling.s` (data-only) — last in `SOURCES`
  - `asm/nonmatchings/mini_bowling/` — 120 per-function bodies.
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
- **Validated:** mini_bowling split rebuilds to the golden `29ded64...` (byte-neutral) as a single file, as 6 uniform chunks, as a 3-file `--isolate` split, and as a 5-file `--isolate` + `--isolate-range` split with 3 functions matched as C; `sha1sum -c` confirms nothing else broke.

**THE DEOPT FINDING — CORRECTED (this is the single most important REL gotcha):** the earlier "one giant TU exceeds a size threshold" explanation was WRONG. The real rule: **mwcc's inline assembler disables the instruction scheduler + peephole optimizer for every C function that shares a translation unit with ANY `asm` block.** It is the presence of inline asm, not the amount. Verified directly this session with the exact build flags:
- `lbl_00007778` compiled **alone** (with or without `#pragma force_active`) → `extsb.` (record-form compare) + `blr` early-returns = **byte-exact match**.
- The **same** C + a **single** `static asm` sibling in the TU → `extsb`+`cmpwi` + `b <epilogue>` = **no match**.
- The same C in a 4-function chunk and in a 20-function chunk produced the **identical** (wrong) bytes — so chunk *size* is irrelevant.
`lbl_000086E4` matched earlier inside the big TU only because it is optimizer-insensitive (linear code, nothing to schedule).

**THE FIX — pure-C files via `--isolate` (PROVEN end-to-end):** put each to-be-converted function in its **own `.c` file with no asm-include siblings**. `python tools/rel_split.py mini_bowling <args> --isolate lbl_00007778` emits 3 files — `src/mini_bowling.c` (39 asm funcs before), `src/mini_bowling_2.c` (the lone `lbl_00007778`), `src/mini_bowling_3.c` (77 asm funcs after). Convert `_2.c`'s single body to C, list all three (then `asm/mini_bowling.s`) in `SOURCES` in order → **`mkbe.rel_mini_bowling.rel` = `29ded64...` golden.** Notes:
- Asm-include functions can ALL stay grouped in as few files as you like — they carry no C to optimize, so grouping is byte-identical (`--chunk-size` is cosmetic; default 0 = as few files as possible).
- `.text` order is preserved because each `.c` is a contiguous offset range and `SOURCES` lists them in order (linker groups each object's `.text` as one block). You cannot interleave functions between objects arbitrarily.
- Cross-file references are auto-promoted to global symbols by `compute_globals` (REL24 `bl` / `@ha/@l` across files; conditional REL14 branches never cross a function boundary, so this is safe).
- Converted C bodies are hand-written and applied AFTER the split; re-running the splitter regenerates asm-include scaffolding and needs those conversions re-applied (same as `lbl_000086E4` always did).
- **`--isolate-range START END`** puts a whole contiguous run into ONE pure-C file — use it to consolidate an already-matched run into a single file (the sel_stage_rel end state, few C files). A range file is pure C only once EVERY function in it is C; until then it still holds asm-include stubs that deopt its own converted members. So match a run function-by-function with singleton `--isolate` first (each independently golden-checkable), THEN consolidate with `--isolate-range`. Proven: `--isolate-range lbl_00007740 lbl_00007778` puts both matched functions in one pure-C file and the REL stays `29ded64...`. Ranges/singletons are validated (unknown label / backwards / overlapping → clear error) before any writes.

## 7. Strategy & concrete next steps (in order)

1. **DONE (committed):** `tools/rel_split.py` multi-file + `--isolate` + `--isolate-range`; matched `lbl_00007740`, `lbl_00007778`, `lbl_000086E4` as C in `mini_bowling.rel` (golden); full `sha1sum -c` still all-OK. mini_bowling is the 5-file split described in §4.
2. **Keep matching mini_bowling** with the `--isolate` workflow above. Match new functions as singleton `--isolate` files (incremental golden checks), then `--isolate-range` to consolidate contiguous matched runs. Candidates (drafts in `git show 5138d8f:src/mini_bowling.c`, UNVERIFIED starting points — the "isolation-corrected" forms are NOT saved and must be re-derived/re-verified): `lbl_00007964`/`lbl_000079E8` (replay snapshot save/restore — need the right struct/offsets), then the ball/camera callback runs. Reconstruct each from the asm, verify struct offsets, objdump the built `.plf` function vs `asm/nonmatchings/mini_bowling/<lbl>.s` for per-function feedback, and gate on the whole-REL `29ded64...`.
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
- `mkbe.rel_sample.rel` is a template/sample module, not real game code.
- Auto-memory (`MEMORY.md` + files under the memory dir) loads automatically in a new session in this repo — the durable facts here are also captured there.
