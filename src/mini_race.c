/*
 * mini_race.c  --  Monkey Race minigame REL module (mkbe.rel_mini_race.rel)
 *
 * UNVERIFIED STRUCTURAL FIRST DRAFT.
 *   - This repo cannot build (no CodeWarrior / baserom), so NOTHING here is byte-match
 *     verified.  The code below only syntax-checks and structurally follows its templates
 *     (src/mini_bowling.c and src/mini_pilot.c for the REL minigame skeleton; src/game.c /
 *     src/mini.c for behaviour).
 *   - Every struct type invented for this module is flagged "INVENTED / UNVERIFIED".
 *   - Only the module-lifecycle batch is drafted (init / dest / main+dispatch / draw /
 *     ball & camera callbacks / graphics load-free / mode + ball-substate setters, plus two
 *     small math helpers).  See the "REMAINING" note near the bottom for the asm offset
 *     ranges that are still in asm/mini_race.s.
 *
 * asm source: asm/mini_race.s  (section .text spans 0x000000D0 .. ~0x00013674)
 *
 * The race mode state machine has 15 modes (jump table @ lbl_00014108); the .data name
 * table gives their names:
 *    0  RMD_RACE_INIT_FIRST   1  RMD_RACE_INIT        2  RMD_RACE_INTRO_INIT
 *    3  RMD_RACE_INTRO        4  RMD_RACE_READY_INIT  5  RMD_RACE_READY
 *    6  RMD_RACE_MAIN         7  RMD_RESULT_INIT      8  RMD_RESULT_MAIN
 *    9  RMD_COMMEND_INIT     10  RMD_COMMEND_MAIN    11  RMD_RANKING_INIT
 *   12  RMD_RANKING_MAIN     13  RMD_DEST_INIT       14  RMD_DEST_MAIN
 */

#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <dolphin.h>

#include "global.h"
#include "ball.h"
#include "camera.h"
#include "effect.h"
#include "event.h"
#include "functions.h"
#include "game.h"
#include "hud.h"
#include "item.h"
#include "mathutil.h"
#include "mode.h"
#include "pool.h"
#include "sound.h"
#include "sprite.h"
#include "stage.h"
#include "variables.h"
#include "window.h"

// ---------------------------------------------------------------------------
// Alignment anchors PRESERVED from the original stub.  In the real module these
// are the first words of two untranscribed data sections:
//   lbl_00013680 - .rodata config blob (section 4, 0xA84 bytes).  Its first 7
//                  words are the item-type-2 ItemFuncs (init reads them); config
//                  floats are read out of it by byte offset via RACE_CFG().
//   lbl_00014108 - .data race-mode jump table (section 5).  15 function pointers
//                  indexed by raceWork.unk38, followed by name strings and more
//                  data tables.  Its first entry is the RMD_RACE_INIT_FIRST handler.
// Kept exactly as the stub declared them; the rest of both sections still lives in
// the (not-yet-transcribed) data of asm/mini_race.s.
// ---------------------------------------------------------------------------
typedef void (*UnkFunc)();
extern void lbl_0001157C();
const UnkFunc lbl_00013680 = lbl_0001157C;
extern void lbl_000008B4();
UnkFunc lbl_00014108 = lbl_000008B4;

// Read a config float out of the (un-transcribed) .rodata blob by byte offset.
// Decoded values that this draft relies on (from asm/mini_race.s .rodata):
//   RACE_CFG(0x1C) = 0xBF800000 = -1.0f
//   RACE_CFG(0x20) = 0x00000000 =  0.0f
//   RACE_CFG(0x40) = 0x42C80000 =  100.0f   (aka lbl_000136C0)
// UNVERIFIED: only word 0 of the blob is present in this C file, so at link/run time
// these reads would resolve into whatever follows the anchor.  Structural only.
#define RACE_CFG(off) (*(const f32 *)((const u8 *)&lbl_00013680 + (off)))

// Second (larger) module .rodata config blob at lbl_00013740.  The ball-substate
// handlers read floats / vectors / quaternions out of it by byte offset (this is a
// per-ball "reset template": spin quaternion, config velocities, keyframe scale
// factors, etc.).  Its contents are NOT transcribed here, so only the byte offsets
// are known -- every value read through RCFG_* is UNVERIFIED.  Modelled as an
// opaque extern blob so the offsets type-check.
extern const u8 lbl_00013740[];
#define RCFG_F32(off)  (*(const f32 *)(lbl_00013740 + (off)))
#define RCFG_F64(off)  (*(const f64 *)(lbl_00013740 + (off)))
#define RCFG_VEC(off)  (*(const Vec *)(lbl_00013740 + (off)))
#define RCFG_QUAT(off) (*(const Quaternion *)(lbl_00013740 + (off)))

// ---------------------------------------------------------------------------
// Externs not declared in project headers.
// ---------------------------------------------------------------------------
void item_replace_type_funcs(int itemType, struct ItemFuncs *newFuncs);
int u_load_minigame_graphics(int index);

// view.c: u8 lbl_802C4960[0x1400] -- 32 entries of 0xA0 bytes, reset by race_init().
extern u8 lbl_802C4960[0x1400];

// Ball-substate jump table (20 entries) and camera-substate jump table (12 entries).
// Both live in the module .data (lbl_00015A20 / lbl_00015AD8), left untranscribed.
extern void (*const lbl_00015A20[])(struct Ball *);
extern void (*const lbl_00015AD8[])(struct Camera *, struct Ball *);

// ---------------------------------------------------------------------------
// External data tables read by the mode handlers (all UNVERIFIED).
//   lbl_801EED88  - main-DOL config record (struct Struct801EED88, declared in
//                   variables.h) read by RMD_RACE_INIT_FIRST: unk0 -> unk28, byte
//                   [unk28+1] -> unk2c, unk8 -> unk2a.
//   lbl_802F02F8  - main-DOL character-assignment byte table indexed by unk28.
//   lbl_00014060  - module .data table of 3 x struct EffectFuncs (0x30 bytes) installed
//                   by lbl_00012D50 for effect types 0x26/0x29/0x2C.  Untranscribed.
extern s8 lbl_802F02F8[];
extern u8 lbl_00014060[];

// Mode/ball helpers whose bodies are still in asm/mini_race.s.  Signatures inferred
// from call sites -- UNVERIFIED.
void lbl_00010218(int arg);   // called by RMD_RACE_READY_INIT with (unk3c - 180)
void lbl_00010484(void);      // called by RMD_RACE_INTRO
void lbl_0000B834(void);      // called by RMD_RACE_READY when unk3c hits 0xB3

/* ------------------------------------------------------------------------- *
 *  INVENTED TYPES  (all UNVERIFIED -- field names/offsets are best guesses)  *
 * ------------------------------------------------------------------------- */

// Per-racer extended state.  The module .bss holds an array of 4 (stride 0x29C) at
// bss offset 0x1070; each active ball's `unk144` pointer also aliases one of these
// (all accessed offsets are < 0x29C, consistent with the array stride).  Only the
// fields touched by the drafted lifecycle functions are typed.  INVENTED / UNVERIFIED.
struct RaceItem
{
    /*0x000*/ u8 pad000[0x14];
    /*0x014*/ u32 unk14;   // flag word (bit 0x40 = frozen, 0x2000/0x4000 = timers, 0x8000 = hide)
    /*0x018*/ u32 unk18;   // snapshot of unk14 taken each frame in the ball callback
    /*0x01C*/ s16 unk1c;   // countdown timer
    /*0x01E*/ u8 pad01E[0x22 - 0x1E];
    /*0x022*/ s16 unk22;   // integer factor for the per-frame unk1e4 calc
    /*0x024*/ u8 pad024[0x1CC - 0x24];
    /*0x1CC*/ s16 unk1cc;  // countdown timer
    /*0x1CE*/ u8 pad1CE[0x1D4 - 0x1CE];
    /*0x1D4*/ f32 unk1d4;  // keyframe-cursor param (fed to lbl_000031C0/lbl_00003238)
    /*0x1D8*/ f32 unk1d8;  // keyframe-cursor param
    /*0x1DC*/ f32 unk1dc;
    /*0x1E0*/ f32 unk1e0;
    /*0x1E4*/ f32 unk1e4;  // written each frame from unk30 / unk22 / unk1dc
    /*0x1E8*/ f32 unk1e8;  // snapshot of unk1d4 at goal (lbl_000040C0)
    /*0x1EC*/ f32 unk1ec;  // snapshot of unk1d8 at goal
    /*0x1F0*/ f32 unk1f0;  // snapshot of unk1dc at goal
    /*0x1F4*/ f32 unk1f4;  // snapshot of unk1e0 at goal
    /*0x1F8*/ u8 pad1F8[0x23C - 0x1F8];
    /*0x23C*/ Vec unk23c;  // config-template vector, zeroed on fall-out settle
    /*0x248*/ u8 pad248[0x260 - 0x248];
    /*0x260*/ s16 unk260;  // countdown timer
    /*0x262*/ u8 pad262[0x268 - 0x262];
    /*0x268*/ s16 unk268;  // countdown timer; clears unk14 bit 0x4000 on expiry
    /*0x26A*/ s16 unk26a;  // countdown timer
    /*0x26C*/ s16 unk26c;  // countdown timer
    /*0x26E*/ s16 unk26e;  // countdown timer
    /*0x270*/ u8 pad270[0x294 - 0x270];
    /*0x294*/ s16 unk294;  // countdown timer
    /*0x296*/ u8 pad296[0x29C - 0x296];
};

// Module .bss work area (section 6, base 0x10000000, size 0x1B28).  Only the header
// fields touched by the drafted functions are typed; raceData[] is the per-racer array
// at 0x1070.  INVENTED / UNVERIFIED.
struct RaceWork
{
    /*0x0000*/ s32 unk0;        // reset to 0 by race_set_mode()
    /*0x0004*/ s8 status[4];    // saved copy of g_poolInfo.playerBuf[0..3]
    /*0x0008*/ s32 charSel[4];  // saved copy of playerCharacterSelection[0..3]
    /*0x0018*/ u8 pad018[0x28 - 0x18];
    /*0x0028*/ s16 unk28;
    /*0x002A*/ s16 unk2a;
    /*0x002C*/ s16 unk2c;
    /*0x002E*/ s16 unk2e;
    /*0x0030*/ f32 unk30;       // = RACE_CFG(0x20) (0.0f); scale for the unk1e4 calc
    /*0x0034*/ u8 pad034[0x38 - 0x34];
    /*0x0038*/ s16 unk38;       // current race mode (jump-table index)
    /*0x003A*/ s16 unk3a;
    /*0x003C*/ s32 unk3c;       // countdown timer
    /*0x0040*/ s16 unk40;       // countdown timer
    /*0x0042*/ s16 unk42;       // music-delay countdown timer
    /*0x0044*/ s16 unk44;       // previous race mode
    /*0x0046*/ s16 unk46;       // course/map index (RMD_RACE_INIT_FIRST) -- INVENTED
    /*0x0048*/ s16 unk48;       // cleared together with unk4a/unk4c/unk4e -- INVENTED
    /*0x004A*/ s16 unk4a;       // INVENTED
    /*0x004C*/ s16 unk4c;       // INVENTED
    /*0x004E*/ s16 unk4e;       // INVENTED
    /*0x0050*/ u8 pad050[0x1070 - 0x50];
    /*0x1070*/ struct RaceItem raceData[4];
    /*0x1AE0*/ u8 pad1AE0[0x1B28 - 0x1AE0];
};

// Keyframe channel descriptor consumed by lbl_000031C0 (3 x {count, frames}).
// INVENTED / UNVERIFIED.
struct RaceKeyframeChannel
{
    s32 count;
    struct Keyframe *frames;
};

/* ------------------------------------------------------------------------- *
 *  Module statics                                                           *
 * ------------------------------------------------------------------------- */

// BSS work area (lbl_10000000).
static struct RaceWork raceWork;

/* ------------------------------------------------------------------------- *
 *  Forward declarations                                                     *
 * ------------------------------------------------------------------------- */

// Drafted in this file:
static void race_init(void);                                          // lbl_00000228
static void race_dest(void);                                          // lbl_0000048C
static void race_main(void);                                          // lbl_0000056C (main cb)
static void race_draw(void);                                          // lbl_000007EC (draw cb)
static void race_set_mode(int mode);                                  // lbl_00000838
static void race_load_graphics(void);                                 // lbl_00003094
static void race_free_graphics(void);                                 // lbl_000030DC
static void race_ball_callback(struct Ball *ball);                    // lbl_00003398
static void race_set_ball_substate(struct Ball *ball, int subMode);   // lbl_0000340C
static void race_camera_callback(struct Camera *camera, struct Ball *ball); // lbl_00008C4C
static void lbl_000031C0(struct RaceKeyframeChannel *ch, Vec *out, float t);
static f32 lbl_00003238(f32 x);

// Referenced-by-name but NOT yet decompiled (bodies remain in asm/mini_race.s).
// Signatures inferred from call sites -- UNVERIFIED.
static void lbl_0000A9EC(void);       // draw handler for modes 0..9
static void lbl_0000B67C(void);       // draw handler for mode 10 (RMD_COMMEND_MAIN)

// ---------------------------------------------------------------------------
// Race-mode handlers, indexed by raceWork.unk38 through the .data jump table
// lbl_00014108.  These have external linkage because that (untranscribed) table
// references them by symbol.  Bodies drafted below where marked; the rest remain
// in asm/mini_race.s.  lbl_000008B4 (mode 0) is declared with the anchor above.
//   0  lbl_000008B4  RMD_RACE_INIT_FIRST   (drafted)
//   1  lbl_00000A68  RMD_RACE_INIT         (asm -- large stage/event/camera setup)
//   2  lbl_00000EAC  RMD_RACE_INTRO_INIT   (drafted)
//   3  lbl_00000FB4  RMD_RACE_INTRO        (drafted)
//   4  lbl_00001040  RMD_RACE_READY_INIT   (drafted)
//   5  lbl_000010F4  RMD_RACE_READY        (drafted)
//   6  lbl_0000118C  RMD_RACE_MAIN         (asm -- deep per-racer physics/HUD loop)
//   7  lbl_000016F8  RMD_RESULT_INIT       (asm)
//   8  lbl_0000182C  RMD_RESULT_MAIN       (asm)
//   9  lbl_000019AC  RMD_COMMEND_INIT      (asm)
//  10  lbl_00001CF0  RMD_COMMEND_MAIN      (asm)
//  11  lbl_00001E14  RMD_RANKING_INIT      (asm)
//  12  lbl_00001ED0  RMD_RANKING_MAIN      (asm)
//  13  lbl_00001F94  RMD_DEST_INIT         (asm)
//  14  lbl_00001FDC  RMD_DEST_MAIN         (asm)
void lbl_00000EAC(void);
void lbl_00000FB4(void);
void lbl_00001040(void);
void lbl_000010F4(void);
void lbl_00000A68(void);
void lbl_0000118C(void);
void lbl_000016F8(void);
void lbl_0000182C(void);
void lbl_000019AC(void);
void lbl_00001CF0(void);
void lbl_00001E14(void);
void lbl_00001ED0(void);
void lbl_00001F94(void);
void lbl_00001FDC(void);

// Effect-func install helper (drafted below).
void lbl_00012D50(void);

// Module-internal per-ball physics/collision helpers still living in asm/mini_race.s.
// The drafted ball-substate handlers below call these; signatures are inferred from
// their call sites -- UNVERIFIED.  (lbl_000069D0 / lbl_00006CF0 / lbl_000070FC pass
// or return a Vec*; lbl_00007688 returns a "reached goal" flag.)
void lbl_00005CEC(struct Ball *ball);
void lbl_00006248(struct Ball *ball);
Vec *lbl_00006CF0(struct Ball *ball);
void lbl_000069D0(struct Ball *ball, Vec *v);
Vec *lbl_000070FC(struct Ball *ball);
int  lbl_00007688(struct Ball *ball);
void lbl_00007710(struct Ball *ball);
void lbl_00007800(struct Ball *ball);
void lbl_00007D4C(struct Ball *ball);
void lbl_00007F88(struct Ball *ball);
void lbl_00008160(struct Ball *ball);
void lbl_00008324(struct Ball *ball);
void lbl_000084A0(struct Ball *ball);

// Ball-substate handlers dispatched through lbl_00015A20 (20 entries).  All still
// in asm/mini_race.s; declared here so the table can be wired up later.
void lbl_00003A90(struct Ball *); void lbl_000040C0(struct Ball *);
void lbl_00004284(struct Ball *); void lbl_000044AC(struct Ball *);
void lbl_00004540(struct Ball *); void lbl_00004634(struct Ball *);
void lbl_00004718(struct Ball *); void lbl_0000480C(struct Ball *);
void lbl_00004910(struct Ball *); void lbl_00004BB0(struct Ball *);
void lbl_00004D78(struct Ball *); void lbl_000050F0(struct Ball *);
void lbl_0000528C(struct Ball *); void lbl_00005428(struct Ball *);
void lbl_000055CC(struct Ball *); void lbl_0000568C(struct Ball *);
void lbl_00005884(struct Ball *); void lbl_00005998(struct Ball *);
void lbl_00005A84(struct Ball *); void lbl_00005C20(struct Ball *);

// Camera-substate handlers dispatched through lbl_00015AD8 (12 entries).  All still
// in asm/mini_race.s.
void lbl_00008CC8(struct Camera *, struct Ball *); void lbl_00008EC8(struct Camera *, struct Ball *);
void lbl_0000933C(struct Camera *, struct Ball *); void lbl_000098A8(struct Camera *, struct Ball *);
void lbl_00009A08(struct Camera *, struct Ball *); void lbl_00009BF8(struct Camera *, struct Ball *);
void lbl_00009D3C(struct Camera *, struct Ball *); void lbl_0000A088(struct Camera *, struct Ball *);
void lbl_0000A31C(struct Camera *, struct Ball *); void lbl_0000A364(struct Camera *, struct Ball *);
void lbl_0000A4DC(struct Camera *, struct Ball *); void lbl_0000A6D4(struct Camera *, struct Ball *);

/* ------------------------------------------------------------------------- *
 *  REL skeleton  (template: src/mini_pilot.c)                               *
 * ------------------------------------------------------------------------- */

void _prolog(void)
{
    set_minigame_callbacks(race_main, race_draw, race_ball_callback,
                           race_camera_callback);
    race_init();
    gameSubmodeRequest = SMD_MINI_RACE_MAIN;
    if (debugFlags & 4)
        puts("[MONKEY RACE] LOADED\n");
}

void _epilog(void)
{
    race_dest();
    if (debugFlags & 4)
        puts("[MONKEY RACE] PURGED\n");
}

void _unresolved(void)
{
    u32 i;
    u32 *sp;

    puts("\nError: A called an unlinked function.\n");
    puts("Address:      Back Chain    LR Save\n");

    i = 0;
    sp = (u32 *)OSGetStackPointer();
    while (sp != NULL && (u32)sp != 0xFFFFFFFF && i++ < 16)
    {
        printf("0x%08x:   0x%08x    0x%08x\n", (u32)sp, sp[0], sp[1]);
        sp = (u32 *)sp[0];
    }
    OSPanic("mini_race.c", 918, "\n");
}

/* ------------------------------------------------------------------------- *
 *  Init  (lbl_00000228, 0x00000228 .. 0x00000488)                          *
 *  DRAFT-UNCERTAIN: the leading loop resets the 32-entry view buffer         *
 *  (lbl_802C4960) to default config floats; the pattern per 0x14 sub-block   *
 *  is [c1c, c20, c20, skip, c20], transcribed structurally.                  *
 * ------------------------------------------------------------------------- */

static void race_init(void)
{
    struct ItemFuncs funcs;
    f32 c1c;
    f32 c20;
    int e;
    int b;

    // Reset the 32 view entries (0xA0 bytes each) to default config floats.
    c1c = RACE_CFG(0x1c);  // -1.0f
    c20 = RACE_CFG(0x20);  //  0.0f
    for (e = 0; e < 32; e++)
    {
        f32 *p = (f32 *)&lbl_802C4960[e * 0xA0];
        for (b = 0; b < 8; b++, p += 5)
        {
            p[0] = c1c;
            p[1] = c20;
            p[2] = c20;
            p[4] = c20;
        }
    }

    event_finish_all();
    unload_stage();
    u_free_minigame_graphics();
    race_free_graphics();
    free_all_bitmap_groups_except_com();
    func_800249D4();

    // Install this module's item-type-2 funcs (first 7 words of the config blob).
    funcs = *(struct ItemFuncs *)&lbl_00013680;
    item_replace_type_funcs(2, &funcs);

    lbl_00012D50();

    // Save the player pool status + character selections so race_dest() can restore them.
    raceWork.status[0] = g_poolInfo.playerBuf[0];
    raceWork.charSel[0] = playerCharacterSelection[0];
    raceWork.status[1] = g_poolInfo.playerBuf[1];
    raceWork.charSel[1] = playerCharacterSelection[1];
    raceWork.status[2] = g_poolInfo.playerBuf[2];
    raceWork.charSel[2] = playerCharacterSelection[2];
    raceWork.status[3] = g_poolInfo.playerBuf[3];
    raceWork.charSel[3] = playerCharacterSelection[3];

    raceWork.unk38 = 0;
    raceWork.unk3c = 0;

    SoundGroupLoad(0xD);
    race_load_graphics();
    call_bitmap_load_group(7);

    raceWork.unk28 = 0;
    raceWork.unk2a = 0;
    raceWork.unk2c = 3;
    raceWork.unk30 = RACE_CFG(0x20);
    raceWork.unk2e = 0;
}

/* ------------------------------------------------------------------------- *
 *  Dest  (lbl_0000048C, 0x0000048C .. 0x00000568)                          *
 * ------------------------------------------------------------------------- */

static void race_dest(void)
{
    struct ItemFuncs funcs;

    event_finish_all();
    race_free_graphics();
    reset_camera_viewport();
    call_bitmap_free_group(7);
    SoundGroupFree();

    // Clear this module's item-type-2 funcs (lbl_000136A4 is 7 NULL words).
    memset(&funcs, 0, sizeof(funcs));
    item_replace_type_funcs(2, &funcs);

    // Restore the player pool status + character selections saved by race_init().
    g_poolInfo.playerBuf[0] = raceWork.status[0];
    playerCharacterSelection[0] = raceWork.charSel[0];
    g_poolInfo.playerBuf[1] = raceWork.status[1];
    playerCharacterSelection[1] = raceWork.charSel[1];
    g_poolInfo.playerBuf[2] = raceWork.status[2];
    playerCharacterSelection[2] = raceWork.charSel[2];
    g_poolInfo.playerBuf[3] = raceWork.status[3];
    playerCharacterSelection[3] = raceWork.charSel[3];
}

/* ------------------------------------------------------------------------- *
 *  Main callback / mode dispatch  (lbl_0000056C, 0x056C .. 0x000007E8)     *
 *  DRAFT-UNCERTAIN: the per-ball countdown loop pokes an untyped race sub-   *
 *  struct (RaceItem, invented); bit masks decoded from the rlwinm forms.     *
 * ------------------------------------------------------------------------- */

static void race_main(void)
{
    // Restart request: modeCtrl.courseFlags bit 0x4000 forces RMD_RACE_INIT.
    if (modeCtrl.courseFlags & 0x4000)
    {
        modeCtrl.courseFlags &= ~0x4000u;
        race_set_mode(1);
    }

    if (!(debugFlags & 0xA))
    {
        if (raceWork.unk3c > 0)
            raceWork.unk3c--;
        if (raceWork.unk40 > 0)
            raceWork.unk40--;
        if (raceWork.unk42 >= 0)
            raceWork.unk42--;
        if (raceWork.unk42 == 0)
            u_play_music(0x64, 0xA);

        // Per-ball countdown update, only while EVENT_BALL is running.
        if (eventInfo[EVENT_BALL].state == EV_STATE_RUNNING)
        {
            int i;
            for (i = 0; i < 4; i++)
            {
                struct Ball *ball = &ballInfo[i];
                struct RaceItem *rc;

                if (ball->unk0 != STAT_NORMAL)
                    continue;
                rc = (struct RaceItem *)ball->unk144;
                if (rc == NULL)
                    continue;

                if (rc->unk14 & 0x40)
                {
                    ball->flags |= 0x10;
                    continue;
                }

                if (rc->unk1c > 0)
                    rc->unk1c--;
                if (rc->unk1cc > 0)
                    rc->unk1cc--;
                if (rc->unk268 > 0)
                {
                    rc->unk268--;
                    if (rc->unk268 == 0)
                        rc->unk14 &= ~0x4000u;
                }
                if (rc->unk26a > 0)
                    rc->unk26a--;
                if (rc->unk26c > 0)
                    rc->unk26c--;
                if (rc->unk26e > 0)
                    rc->unk26e--;
                if (rc->unk294 >= 0)
                    rc->unk294--;
                if (rc->unk260 > 0)
                    rc->unk260--;

                if (rc->unk14 & 0x8000)
                    ball->flags |= 0x10;
                else
                    ball->flags &= ~0x10u;

                rc->unk1e4 = raceWork.unk30
                             * (RACE_CFG(0x40) * (f32)rc->unk22 + rc->unk1dc)
                             / RACE_CFG(0x40);
            }
        }
    }

    // Dispatch to the current race-mode handler (jump table @ lbl_00014108).
    (&lbl_00014108)[raceWork.unk38]();
}

/* ------------------------------------------------------------------------- *
 *  Draw callback  (lbl_000007EC, 0x07EC .. 0x00000834)                     *
 * ------------------------------------------------------------------------- */

static void race_draw(void)
{
    s16 mode = raceWork.unk38;

    if (mode >= 0 && mode <= 9)
        lbl_0000A9EC();
    else if (mode == 0xA)
        lbl_0000B67C();
}

/* ------------------------------------------------------------------------- *
 *  Race-mode setter  (lbl_00000838, 0x0838 .. 0x000008B0)                  *
 * ------------------------------------------------------------------------- */

static void race_set_mode(int mode)
{
    if (mode < 0 || mode >= 0xF)
        OSPanic("mini_race_mode.c", 1183, "Illegal race mode.\n");

    raceWork.unk44 = raceWork.unk38;  // save previous mode
    raceWork.unk38 = (s16)mode;
    raceWork.unk0 = 0;
}

/* ------------------------------------------------------------------------- *
 *  Graphics load / free  (lbl_00003094 / lbl_000030DC)                     *
 * ------------------------------------------------------------------------- */

static void race_load_graphics(void)
{
    OSHeapHandle oldHeap = OSSetCurrentHeap(stageHeap);
    u_load_minigame_graphics(1);
    OSSetCurrentHeap(oldHeap);
}

static void race_free_graphics(void)
{
    OSHeapHandle oldHeap = OSSetCurrentHeap(stageHeap);
    u_free_minigame_graphics();
    OSSetCurrentHeap(oldHeap);
}

/* ------------------------------------------------------------------------- *
 *  Ball callback  (lbl_00003398, 0x3398 .. 0x00003408)                     *
 *  Snapshots the racer flag word then dispatches on ball->unk148.           *
 * ------------------------------------------------------------------------- */

static void race_ball_callback(struct Ball *ball)
{
    struct RaceItem *rc = &raceWork.raceData[ball->playerId];

    rc->unk18 = rc->unk14;

    if (ball->unk148 < 0x14)
        lbl_00015A20[ball->unk148](ball);
}

/* ------------------------------------------------------------------------- *
 *  Ball-substate setter  (lbl_0000340C, 0x340C .. 0x00003470)              *
 * ------------------------------------------------------------------------- */

static void race_set_ball_substate(struct Ball *ball, int subMode)
{
    if (subMode < 0 || subMode >= 0x14)
        OSPanic("mini_race_ball.c", 150, "Illegal ball sub mode : %d\n", subMode);

    ball->unk148 = (u8)subMode;
}

/* ------------------------------------------------------------------------- *
 *  Camera callback  (lbl_00008C4C, 0x8C4C .. 0x00008CC4)                    *
 *  Dispatches on camera->subState via a 12-entry jump table.                *
 * ------------------------------------------------------------------------- */

static void race_camera_callback(struct Camera *camera, struct Ball *ball)
{
    s8 sub = camera->subState;

    if (sub < 0 || sub >= 0xC)
        return;

    if (modeCtrl.unk30 != 3)
    {
        if (((struct RaceItem *)ball->unk144)->unk14 & 0x20)
            return;
    }

    lbl_00015AD8[camera->subState](camera, ball);
}

/* ------------------------------------------------------------------------- *
 *  Small math helpers                                                       *
 * ------------------------------------------------------------------------- */

// lbl_000031C0 (0x31C0): fill a Vec by interpolating three keyframe channels at time t.
static void lbl_000031C0(struct RaceKeyframeChannel *ch, Vec *out, float t)
{
    out->x = interpolate_keyframes(ch[0].count, ch[0].frames, t);
    out->y = interpolate_keyframes(ch[1].count, ch[1].frames, t);
    out->z = interpolate_keyframes(ch[2].count, ch[2].frames, t);
}

// lbl_00003238 (0x3238): wrap x into [RACE_CFG(0x20), RACE_CFG(0x40)) (i.e. [0.0, 100.0)).
static f32 lbl_00003238(f32 x)
{
    if (x < RACE_CFG(0x20))
        x += RACE_CFG(0x40);
    if (x >= RACE_CFG(0x40))
        x -= RACE_CFG(0x40);
    return x;
}

/* ------------------------------------------------------------------------- *
 *  Init helper  (lbl_00012D50, 0x12D50 .. 0x12DFC)                          *
 *  Installs this module's effect-type funcs for types 0x26 / 0x29 / 0x2C.    *
 *  The three struct EffectFuncs records live back-to-back at lbl_00014060    *
 *  (module .data, untranscribed).  Mirrors race_init's item_replace_type.    *
 * ------------------------------------------------------------------------- */

void lbl_00012D50(void)
{
    struct EffectFuncs funcs;

    funcs = *(struct EffectFuncs *)(lbl_00014060 + 0x00);
    effect_replace_type_funcs(0x26, &funcs);
    funcs = *(struct EffectFuncs *)(lbl_00014060 + 0x10);
    effect_replace_type_funcs(0x29, &funcs);
    funcs = *(struct EffectFuncs *)(lbl_00014060 + 0x20);
    effect_replace_type_funcs(0x2C, &funcs);
}

/* ------------------------------------------------------------------------- *
 *  Race-mode handlers (jump table lbl_00014108).                            *
 *  Drafted batch: modes 0, 2, 3, 4, 5.  Modes 1, 6..14 remain in asm.        *
 * ------------------------------------------------------------------------- */

/* Mode 0 -- RMD_RACE_INIT_FIRST (lbl_000008B4, 0x08B4 .. 0x0A64).
 * DRAFT-UNCERTAIN: reads main-DOL config table lbl_801EED88 as a byte/word blob
 * and the character table lbl_802F02F8; the unk2a bit-clear order (~1, ~4, ~2)
 * is transcribed exactly from three separate rlwinm stores.  New RaceWork
 * fields unk46/unk48/unk4a/unk4c/unk4e are INVENTED. */
void lbl_000008B4(void)
{
    int i;

    raceWork.unk28 = (s8)lbl_801EED88.unk0;
    raceWork.unk2c = (s8)((u8 *)&lbl_801EED88)[raceWork.unk28 + 1];
    raceWork.unk2a = (s32)lbl_801EED88.unk8;

    if (raceWork.unk2a & 0x10)
    {
        raceWork.unk2a &= ~1;
        raceWork.unk2a &= ~4;
        raceWork.unk2a &= ~2;
        raceWork.unk2c = (s8)lbl_802F02F8[raceWork.unk28];
    }

    if (modeCtrl.unk30 == 1)
        raceWork.unk2a &= ~0x20u;
    else
        raceWork.unk2a |= 0x20;

    if ((raceWork.unk2a & 1) || modeCtrl.unk30 == 3)
    {
        for (i = modeCtrl.unk30; i < 4; i++)
        {
            g_poolInfo.playerBuf[i] = STAT_NORMAL;
            playerCharacterSelection[i] = (rand() & 0x7FFF) % 4;
        }
    }

    if (raceWork.unk2a & 1)
        raceWork.unk46 = 4;
    else
        raceWork.unk46 = (s16)modeCtrl.unk30;

    if (raceWork.unk2a & 0x8)
    {
        raceWork.unk2e = 0;
        raceWork.unk48 = 0;
        raceWork.unk4a = 0;
        raceWork.unk4c = 0;
        raceWork.unk4e = 0;
    }

    raceWork.unk44 = raceWork.unk38;  // save previous mode
    raceWork.unk38 = 1;               // -> RMD_RACE_INIT
    raceWork.unk0 = 0;
}

/* Mode 2 -- RMD_RACE_INTRO_INIT (lbl_00000EAC, 0x0EAC .. 0x0FB0).
 * For each active racer: clear ball hide/ape flags, put the ball into ball
 * substate 6, and arm raceData[].unk1c to 0x1770.  The `if (unk14 & 0x40)`
 * test is emitted with a duplicate branch in asm; written once here. */
void lbl_00000EAC(void)
{
    struct Ball *ball = ballInfo;
    int i;

    for (i = 0; i < 4; i++, ball++)
    {
        struct RaceItem *rc;

        if (ball->unk0 != STAT_NORMAL)
            continue;
        rc = (struct RaceItem *)ball->unk144;
        if (rc->unk14 & 0x40)
            continue;

        ball->flags &= ~0x10u;
        ball->ape->flags &= ~0x20u;
        race_set_ball_substate(ball, 6);
        raceWork.raceData[ball->playerId].unk1c = 0x1770;
    }

    if (raceWork.unk2a & 0x8)
        raceWork.unk3c = 0xB4;
    else
        raceWork.unk3c = 0x5A;

    raceWork.unk44 = raceWork.unk38;
    raceWork.unk38 = 3;               // -> RMD_RACE_INTRO
    raceWork.unk0 = 0;
}

/* Mode 3 -- RMD_RACE_INTRO (lbl_00000FB4, 0x0FB4 .. 0x103C).
 * Fires an intro voice clip once (when unk3c == 0x78) and advances to
 * RMD_RACE_READY_INIT when the intro timer expires. */
void lbl_00000FB4(void)
{
    if (debugFlags & 0xA)
        return;

    if ((raceWork.unk2a & 0x8) && raceWork.unk3c == 0x78)
    {
        u_play_sound_0(raceWork.unk2e + 0x1F8);
        lbl_00010484();
    }

    if (raceWork.unk3c == 0)
    {
        raceWork.unk44 = raceWork.unk38;
        raceWork.unk38 = 4;           // -> RMD_RACE_READY_INIT
        raceWork.unk0 = 0;
    }
}

/* Mode 4 -- RMD_RACE_READY_INIT (lbl_00001040, 0x1040 .. 0x10F0).
 * Sets the 300-frame ready timer, arms each active racer's unk1c, kicks off the
 * ready sequence (lbl_00010218 with the 120-frame lead), then advances. */
void lbl_00001040(void)
{
    struct Ball *ball = ballInfo;
    int i;

    raceWork.unk3c = 0x12C;

    for (i = 0; i < 4; i++, ball++)
    {
        struct RaceItem *rc;

        if (ball->unk0 != STAT_NORMAL)
            continue;
        rc = (struct RaceItem *)ball->unk144;
        if (rc->unk14 & 0x40)
            continue;

        raceWork.raceData[ball->playerId].unk1c = 0x12C;
    }

    lbl_00010218(raceWork.unk3c - 180);

    raceWork.unk44 = raceWork.unk38;
    raceWork.unk38 = 5;               // -> RMD_RACE_READY
    raceWork.unk0 = 0;
}

/* Mode 5 -- RMD_RACE_READY (lbl_000010F4, 0x10F4 .. 0x118C).
 * Ready-countdown; triggers a sub-event at 0xB3, the GO banner + SE at 0xA, and
 * on expiry plays the start SE and enters RMD_RACE_MAIN. */
void lbl_000010F4(void)
{
    if (debugFlags & 0xA)
        return;

    if (raceWork.unk3c == 0xB3)
        lbl_0000B834();

    if (raceWork.unk3c == 0xA)
    {
        hud_show_go_banner(0x3C);
        u_play_sound_0(0x1E7);
    }

    if (raceWork.unk3c == 0)
    {
        u_play_sound_0(0x3B0DF);
        raceWork.unk44 = raceWork.unk38;
        raceWork.unk38 = 6;           // -> RMD_RACE_MAIN
        raceWork.unk0 = 0;
    }
}

/* ------------------------------------------------------------------------- *
 *  Ball-substate handlers (jump table lbl_00015A20, keyed on ball->unk148).  *
 *  Drafted contiguous batch: the shared physics chain 40C0 / 4284 / 44AC     *
 *  plus the two fall-out settle pairs 4540+4634 and 4718+480C.  These call a  *
 *  web of module-internal helpers (lbl_00005CEC .. lbl_000084A0, extern-      *
 *  declared above with UNVERIFIED signatures) and read the per-ball config    *
 *  template via RCFG_*.  The remaining 13 ball handlers (the big spawn/init   *
 *  lbl_00003A90, the raycast/keyframe steppers, and the sound/HUD/music       *
 *  handlers) stay as documented forward-declared stubs -- see REMAINING.      *
 *                                                                            *
 *  NOTE: `ball->ape->flags &= 0x20000` below is a faithful transcription of a *
 *  single-bit keep mask (rlwinm rA,rS,0,14,14), not a clear -- it wipes every *
 *  ape flag except bit 0x20000.  Flagged as odd but intentional.             *
 * ------------------------------------------------------------------------- */

/* lbl_000040C0 (0x40C0 .. 0x4280) -- core per-frame ball physics step.
 * Snapshots prevPos, recomputes speed, runs the module collision/rotation
 * helpers, integrates position by velocity, and on a "reached goal" result
 * from lbl_00007688 snapshots the keyframe cursor and hands the ball to the
 * goal-replay substate 8 (camera subState 7). */
void lbl_000040C0(struct Ball *ball)
{
    struct RaceItem *rc = (struct RaceItem *)ball->unk144;

    ball->prevPos = ball->pos;
    ball->speed = mathutil_sqrt(ball->vel.x * ball->vel.x
                              + ball->vel.y * ball->vel.y
                              + ball->vel.z * ball->vel.z);
    ball->flags &= ~0x20u;

    lbl_00007800(ball);
    lbl_00005CEC(ball);
    if (ball->unk120 & 1)
    {
        lbl_00007D4C(ball);
        lbl_00008160(ball);
        lbl_00008324(ball);
        lbl_000084A0(ball);
    }
    lbl_00007F88(ball);
    lbl_00006248(ball);

    if (rc->unk14 & 0x20)
        lbl_000069D0(ball, lbl_000070FC(ball));
    else
        lbl_000069D0(ball, lbl_00006CF0(ball));

    ball->pos.x += ball->vel.x;
    ball->pos.y += ball->vel.y;
    ball->pos.z += ball->vel.z;

    if (lbl_00007688(ball))
    {
        u_play_sound_0(0x1D);
        u_play_sound_0(0x15);
        rc->unk1e8 = rc->unk1d4;
        rc->unk1ec = rc->unk1d8;
        rc->unk1f0 = rc->unk1dc;
        rc->unk1f4 = rc->unk1e0;
        ball->unk148 = 8;
        if (!(rc->unk14 & 0x20))
            cameraInfo[ball->playerId].subState = 7;
        rc->unk1c = 0x3C;
    }
    else if (rc->unk14 & 0x2)
    {
        ball->unk148 = 0xB;
    }
}

/* lbl_00004284 (0x4284 .. 0x44A8) -- "reached goal" ball init.  Plays the goal
 * SE, re-seats the ball's spin quaternion from config template A, faces the
 * split-screen camera down the racetrack (two keyframe lookups differenced),
 * then runs one physics frame through lbl_000044AC.
 * DRAFT-UNCERTAIN: the camera-facing math reads keyframe channels off
 * decodedStageLzPtr->unk78 (cast to the invented RaceKeyframeChannel) and the
 * config-blob scale factors at 0x68/0x9C. */
void lbl_00004284(struct Ball *ball)
{
    struct RaceItem *rc = (struct RaceItem *)ball->unk144;
    Vec a;
    Vec b;

    u_play_sound_0(0x281E);

    if (!(rc->unk14 & 0x20))
        cameraInfo[ball->playerId].subState = 2;

    ball->unkC4 = RCFG_F32(0x08);
    ball->speed = RCFG_F32(0x08);
    ball->unkB8 = RCFG_VEC(0x80);
    ball->unkA8 = RCFG_QUAT(0x8C);
    ball->unk98 = ball->unkA8;
    mathutil_mtxA_to_quat(&ball->unkA8);
    ball->ape->flags &= 0x20000u;

    lbl_00007710(ball);

    if (!(rc->unk14 & 0x20))
    {
        f32 t = RCFG_F32(0x68) * (RCFG_F32(0x9C) / raceWork.unk30);
        lbl_000031C0((struct RaceKeyframeChannel *)decodedStageLzPtr->unk78, &a,
                     rc->unk1d4);
        lbl_000031C0((struct RaceKeyframeChannel *)decodedStageLzPtr->unk78, &b,
                     lbl_00003238(rc->unk1d4 + t));
        a.x = b.x - a.x;
        a.y = b.y - a.y;
        a.z = b.z - a.z;
        cameraInfo[ball->playerId].rotY = mathutil_atan2(a.x, a.z) - 0x8000;
    }

    rc->unk14 |= 0x10000;
    rc->unk14 &= ~1u;
    ball->unk148 = 3;
    lbl_000044AC(ball);
}

/* lbl_000044AC (0x44AC .. 0x453C) -- runs one physics frame (lbl_000040C0),
 * then blinks the ball (BALL_FLAG_INVISIBLE) while the intro countdown unk1c
 * runs; when it reaches 0 the blink is cleared and the ball drops to substate 1. */
void lbl_000044AC(struct Ball *ball)
{
    struct RaceItem *rc = (struct RaceItem *)ball->unk144;

    lbl_000040C0(ball);

    if (rc->unk1c == 0)
    {
        ball->flags &= ~0x10u;
        rc->unk14 &= ~0x10000u;
        ball->unk148 = 1;
    }
    else if (globalAnimTimer & 0x4)
    {
        ball->flags &= ~0x10u;
    }
    else
    {
        ball->flags |= 0x10;
    }
}

/* lbl_00004540 (0x4540 .. 0x4630) -- reset the ball's spin quaternion from
 * config template B, clear the ape flag, enter fall-out settle substate 5,
 * then run one settle frame via lbl_00004634. */
void lbl_00004540(struct Ball *ball)
{
    ball->unkC4 = RCFG_F32(0x08);
    ball->speed = RCFG_F32(0x08);
    ball->unkB8 = RCFG_VEC(0xA0);
    ball->unkA8 = RCFG_QUAT(0xAC);
    ball->unk98 = ball->unkA8;
    mathutil_mtxA_to_quat(&ball->unkA8);
    ball->ape->flags &= 0x20000u;
    ball->unk148 = 5;
    lbl_00004634(ball);
}

/* lbl_00004634 (0x4634 .. 0x4714) -- fall-out settle A.  When the countdown
 * unk1c expires, zero the ball velocity + config-template delta and drop back
 * to substate 1; every frame apply gravity to Y and integrate. */
void lbl_00004634(struct Ball *ball)
{
    struct RaceItem *rc = (struct RaceItem *)ball->unk144;

    if (rc->unk1c <= 0)
    {
        u_play_sound_0(0x281E);
        ball->vel.z = RCFG_F32(0x08);
        ball->vel.y = RCFG_F32(0x08);
        ball->vel.x = RCFG_F32(0x08);
        rc->unk23c.z = RCFG_F32(0x08);
        rc->unk23c.y = RCFG_F32(0x08);
        rc->unk23c.x = RCFG_F32(0x08);
        ball->unk148 = 1;
    }

    lbl_00007710(ball);

    ball->prevPos = ball->pos;
    ball->speed = mathutil_sqrt(ball->vel.x * ball->vel.x
                              + ball->vel.y * ball->vel.y
                              + ball->vel.z * ball->vel.z);
    ball->flags &= ~0x20u;
    ball->vel.y -= ball->accel;
    ball->pos.y += ball->vel.y;
}

/* lbl_00004718 (0x4718 .. 0x4808) -- reset the ball's spin quaternion from
 * config template C, clear the ape flag, enter fall-out settle substate 5,
 * then run one settle frame via lbl_0000480C. */
void lbl_00004718(struct Ball *ball)
{
    ball->unkC4 = RCFG_F32(0x08);
    ball->speed = RCFG_F32(0x08);
    ball->unkB8 = RCFG_VEC(0xBC);
    ball->unkA8 = RCFG_QUAT(0xC8);
    ball->unk98 = ball->unkA8;
    mathutil_mtxA_to_quat(&ball->unkA8);
    ball->ape->flags &= 0x20000u;
    ball->unk148 = 5;
    lbl_0000480C(ball);
}

/* lbl_0000480C (0x480C .. 0x490C) -- fall-out settle B.  Like lbl_00004634 but
 * pins horizontal velocity to the config template every frame and runs the ape
 * update (lbl_00007710) twice. */
void lbl_0000480C(struct Ball *ball)
{
    struct RaceItem *rc = (struct RaceItem *)ball->unk144;

    if (rc->unk1c <= 0)
    {
        u_play_sound_0(0x281E);
        ball->vel.z = RCFG_F32(0x08);
        ball->vel.y = RCFG_F32(0x08);
        ball->vel.x = RCFG_F32(0x08);
        rc->unk23c.z = RCFG_F32(0x08);
        rc->unk23c.y = RCFG_F32(0x08);
        rc->unk23c.x = RCFG_F32(0x08);
        ball->unk148 = 1;
    }

    lbl_00007710(ball);

    ball->prevPos = ball->pos;
    ball->speed = mathutil_sqrt(ball->vel.x * ball->vel.x
                              + ball->vel.y * ball->vel.y
                              + ball->vel.z * ball->vel.z);
    ball->flags &= ~0x20u;
    ball->vel.y -= ball->accel;
    ball->vel.z = RCFG_F32(0x08);
    ball->vel.x = RCFG_F32(0x08);
    ball->pos.y += ball->vel.y;
    lbl_00007710(ball);
}

/* ------------------------------------------------------------------------- *
 *  DRAFTED IN THIS PASS (added to the earlier lifecycle batch):             *
 *    - race modes 0/2/3/4/5   lbl_000008B4, EAC, FB4, 1040, 10F4            *
 *    - effect-func installer  lbl_00012D50                                   *
 *    - ball-substate physics  lbl_000040C0 (core step), lbl_00004284        *
 *      chain + fall-out         (goal init), lbl_000044AC (blink wrapper),   *
 *      settle handlers          lbl_00004540+lbl_00004634 (settle A),        *
 *                               lbl_00004718+lbl_0000480C (settle B).        *
 *      New RaceItem fields: unk1d4/unk1d8/unk1e0 (keyframe cursor params),   *
 *      unk1e8/unk1ec/unk1f0/unk1f4 (goal snapshots), Vec unk23c.  Config     *
 *      reads use RCFG_* over the un-transcribed blob lbl_00013740 -- values  *
 *      UNVERIFIED.  Calls ~13 module-internal helpers (lbl_00005CEC ..       *
 *      lbl_000084A0) whose bodies remain in asm; signatures inferred.        *
 *                                                                            *
 *  REMAINING (still in asm/mini_race.s -- forward-declared stubs only):     *
 *    - race modes 1, 6..14         lbl_00000A68, 118C, 16F8, 182C, 19AC,    *
 *                                    1CF0, 1E14, 1ED0, 1F94, 1FDC            *
 *      (mode 1 is the big stage/event/camera init; mode 6 RMD_RACE_MAIN is   *
 *       a deep per-racer physics/HUD/item loop -- both too ambiguous to      *
 *       draft faithfully against the untranscribed .data config records.)    *
 *    - 13 remaining ball handlers  lbl_00003A90 (big spawn/init), 4910,     *
 *                                    4BB0, 4D78 (raycast/keyframe steppers), *
 *                                    50F0, 528C, 5428, 55CC, 568C, 5884,    *
 *                                    5998, 5A84, 5C20 (sound/HUD/music) --   *
 *                                    each reads untranscribed data tables    *
 *                                    (lbl_00015768/15934/13884) so left as   *
 *                                    documented stubs.                        *
 *    - 12 camera-substate handlers lbl_00008CC8 .. lbl_0000A6D4             *
 *                                    (jump table @ lbl_00015AD8; each reads  *
 *                                    the config-double blob lbl_00013AA0,    *
 *                                    still un-transcribed -- left as stubs).  *
 *    - draw handlers               lbl_0000A9EC (modes 0..9),               *
 *                                    lbl_0000B67C (mode 10)                  *
 *    - the 7 item-type-2 funcs     lbl_0001157C, 115C8, 11658, 11870,       *
 *                                    118BC, 118D8, 118DC                     *
 *    - time formatter              lbl_0000326C (MM:SS.CC, 3-byte out; uses  *
 *      magic-double /60,/1000,/10 arithmetic -- deferred, needs the exact    *
 *      lbl_00013738/0001373C/000136C8 constants to reproduce), and every     *
 *      remaining helper from ~0x3474 onward.                                  *
 *  Also un-transcribed: the .rodata config blob (lbl_00013680), the effect-  *
 *  func table (lbl_00014060) and the .data jump/name/layout tables           *
 *  (lbl_00014108 onward).                                                     *
 * ------------------------------------------------------------------------- */
