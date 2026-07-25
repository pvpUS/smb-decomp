# smb-decomp — Session Handoff

> Working handoff for a fresh Claude Code session. This file is scratch/WIP notes — it is tracked on the WIP branch `wip/rel-drafts-and-dol-matches` so it survives between sessions, but **delete it before any upstream PR**; it is not project code.

---

## 0.11 — RUN 5 DONE (2026-07-25): +5,768 insn, 5.79% -> 8.83%. START HERE.

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
