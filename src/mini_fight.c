/*
 * mini_fight.c  --  Monkey Fight minigame REL module (mkbe.rel_mini_fight.rel)
 *
 * UNVERIFIED STRUCTURAL FIRST DRAFT.
 *   - This repo cannot build (no CodeWarrior / baserom), so NOTHING here is byte-match
 *     verified.  The code below only syntax-checks and structurally follows its templates
 *     (src/mini_bowling.c / src/mini_billiards.c / src/mini_race.c for the REL minigame
 *     skeleton; src/game.c / src/mini.c / src/ball.c for behaviour).
 *   - Every struct type invented for this module is flagged "INVENTED / UNVERIFIED".
 *   - Only the module-lifecycle spine is drafted: prolog/epilog/unresolved, init (lbl_0000A690),
 *     dest (lbl_0000A974), the main-callback wrapper (lbl_0000AAD0), the draw-callback wrapper
 *     (lbl_0000ABA8), the ball callback (lbl_0000FF34) and the camera callback (lbl_00012248).
 *     Every gameplay state handler, draw body, per-player/per-camera substate handler and init
 *     helper stays in asm and is referenced through the module jump tables or forward-declared
 *     stubs.  See the "REMAINING" note near the bottom.
 *
 * asm source: asm/mini_fight.s  (~32k lines)
 *   section .text   spans 0x000000C8 .. ~0x0001BF78
 *   section .rodata (config blob, base lbl_0001BF80) size 0x0998   (first word 0x3F400000 = 0.75f)
 *   section .data   (base lbl_0001C918) size 0x1309   -- module strings then the jump tables
 *   section .bss    (base lbl_10000000) size 0x19570  -- the work area is rooted at lbl_10017520
 *
 * The module's per-frame "mode" is a plain index (0..20) into the jump table lbl_0001CBE0.
 * The .data name/text tables (lbl_0001C9E4, lbl_0001CA68, ...) are left in asm.
 */

#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <dolphin.h>

#include "global.h"
#include "ball.h"
#include "bitmap.h"
#include "camera.h"
#include "effect.h"
#include "event.h"
#include "functions.h"
#include "input.h"
#include "item.h"
#include "mode.h"
#include "mt_effect.h"
#include "nl2ngc.h"
#include "pool.h"
#include "sound.h"
#include "sprite.h"
#include "stage.h"
#include "variables.h"
#include "window.h"

#include "../data/common.nlobj.h"

/* ------------------------------------------------------------------------- *
 *  Alignment anchor (PRESERVED from the original stub).                      *
 *    lbl_0001BF80 - first word of the module .rodata config blob (section 4). *
 *      Its first float is 0x3F400000 = 0.75f.  init() reads the fight-tuning  *
 *      floats out of this (un-transcribed) blob at the byte offset of the     *
 *      lbl_0001C238 sub-table, i.e. CFG_F32(0x2B8 + k).                       *
 *  The module .data jump/name tables (lbl_0001CBE0, lbl_0001D678, ...) are    *
 *  asm-owned and referenced extern below, so no separate .data anchor is      *
 *  needed to keep their ordering.  CONFIDENCE: high (this is genuinely the    *
 *  first .rodata word and matches the CFG-blob pattern of the sibling RELs).  *
 * ------------------------------------------------------------------------- */
const u32 lbl_0001BF80 = 0x3F400000;

// Read a config float out of the (un-transcribed) .rodata blob by byte offset.
// UNVERIFIED: only word 0 of the blob is present in this file, so any offset past it
// reads adjacent memory at run time.  Structural only.  Decoded values relied on here:
//   CFG_F32(0x2B8) = 0x3F800000 = 1.0f      CFG_F32(0x2CC) = 0x40000000 = 2.0f
//   CFG_F32(0x2BC) = 0x3E4CCCCD = 0.2f      CFG_F32(0x2D0) = 0x3F000000 = 0.5f
//   CFG_F32(0x2C0) = 0x3FA66666 = 1.3f      CFG_F32(0x2D4) = 0x3F4CCCCD = 0.8f
//   CFG_F32(0x2C4) = 0x00000000 = 0.0f      CFG_F32(0x2D8) = 0x3FC00000 = 1.5f
//   CFG_F32(0x2C8) = 0x3EE66666 = 0.45f
#define CFG_F32(off) (*(const f32 *)((const u8 *)&lbl_0001BF80 + (off)))

/* ------------------------------------------------------------------------- *
 *  Externs not declared in project headers.                                  *
 * ------------------------------------------------------------------------- */

// Module helper that lives in src/mini.c but is not declared in any header
// (same situation as mini_bowling.c / mini_billiards.c).  Signature inferred -- UNVERIFIED.
void u_load_minigame_graphics(int group);

// Declared (commented-out) in src/functions.h but not exported; frees the commendation-
// screen data.  Local prototype so this file compiles.  Signature inferred -- UNVERIFIED.
void mini_commend_free_data(void);

// DOL global from src/code_5.c (an anonymous struct there).  Only bit 0 of its first word
// is read by this module (a "fill empty player slots" / demo flag).  Declared as a bare u32
// here.  UNVERIFIED reference.
extern u32 lbl_801EED98;

// Module jump tables, defined in asm/mini_fight.s .data and referenced by the callbacks:
//   lbl_0001CBE0 - 21 mode handlers, indexed by fightWork.unk144.
//   lbl_0001D678 - ball substate handlers, indexed by ball->unk148 (named ball_func_* in asm).
//   lbl_0001D768 - camera substate handlers, indexed by camera->subState.
extern void (*const lbl_0001CBE0[])(void);
extern void (*const lbl_0001D678[])(struct Ball *);
extern void (*const lbl_0001D768[])(struct Camera *, struct Ball *);

// Stobj / item type-function registrars.  func_8006B3E8 lives in src/stobj.c and
// item_replace_type_funcs in src/item.c; neither is exported by a header (same as
// mini_race.c re-declares item_replace_type_funcs locally).  Signatures inferred -- UNVERIFIED.
struct StobjFuncs;
void func_8006B3E8(s32 type, struct StobjFuncs *funcs);
void item_replace_type_funcs(int itemType, struct ItemFuncs *newFuncs);

// src/stage.c registrar for a stage post-load callback (returns previous callback).
// Not header-declared; local prototype so this file compiles.  UNVERIFIED.
Struct80206DEC_Func func_80047518(Struct80206DEC_Func func);

// Asm-owned .data type-function-table blobs (still in asm/mini_fight.s .data).  Accessed by
// byte offset exactly as the asm computes them, so no per-group symbol is needed.  UNVERIFIED.
extern u8 lbl_0001C9D8[];   // StobjFuncs groups for stobj types 5..8 (stride 0x18, base +0x1c)
extern u8 lbl_0001CB40[];   // EffectFuncs groups for effect types 0x18..0x2b (stride 0x10)
extern u8 lbl_0001D790[];   // ItemFuncs groups for item types 1/3/4 (stride 0x1c)

// Asm-owned .data sound-id table indexed by fightWork.unk148 (values 0x186..0x199).  UNVERIFIED.
extern s32 lbl_0001CC44[];

/* ------------------------------------------------------------------------- *
 *  INVENTED TYPE  (all UNVERIFIED -- field names/offsets are best guesses).   *
 *  The module .bss holds one big work area rooted at lbl_10017520 (real size  *
 *  0x8A8, up to lbl_10017DC8).  Only the low scalar fields the drafted        *
 *  lifecycle functions touch are named; the per-player fight-state array      *
 *  (stride 0x18, base 0x144 == lbl_10017664) and everything else is an opaque *
 *  byte blob accessed by raw offset where needed.                            *
 * ------------------------------------------------------------------------- */
struct FightWork
{
    /*0x000*/ u8 pad000[0x54];
    /*0x054*/ u8 unk54;                      // <- lbl_801EED98.unk4E   (set by mode 0)
    /*0x055*/ u8 unk55;                      // <- lbl_801EED98.unk4F
    /*0x056*/ u8 unk56;                      // <- lbl_801EED98.unk50
    /*0x057*/ u8 pad057[0x138 - 0x57];
    /*0x138*/ u8 savedPlayerCount;           // saved modeCtrl.playerCount
    /*0x139*/ u8 pad139[0x13C - 0x139];
    /*0x13C*/ s8 savedStatus[4];             // saved g_poolInfo.playerPool.statusList[0..3]
    /*0x140*/ u8 savedCharSel[4];            // saved (u8)playerCharacterSelection[0..3]
    /*0x144*/ u16 unk144;                    // current mode (index into lbl_0001CBE0)
    /*0x146*/ u16 unk146;                    // requested next mode
    /*0x148*/ s16 unk148;                    // sub-index (mode 5 uses it to index lbl_0001CC44)
    /*0x14A*/ u8 players[0x884 - 0x14A];     // per-player state (base 0x144, stride 0x18) + more
    /*0x884*/ s16 unk884;                    // set to -1 by mode 2
    /*0x886*/ u8 pad886[0x88C - 0x886];
    /*0x88C*/ u32 unk88C;                    // event/sound flag word (bit 1 => play sfx 0x67)
    /*0x890*/ s32 unk890;                    // <- (s8)lbl_801EED98.unk4C (set by mode 0)
    /*0x894*/ u8 pad894[0x8A8 - 0x894];
};

// Per-player fight-state flag word.  Element i lives at work + 0x144 + i*0x18; the "spawn
// gate" flag is the u16 at element+0x1a.  Accessed by raw offset to sidestep the ambiguous
// element size (the asm strides by 0x18 but reads a field at 0x1a).  UNVERIFIED.
#define FIGHT_PLAYER_FLAG(i) (*(u16 *)((u8 *)&fightWork + 0x144 + (i) * 0x18 + 0x1a))

/* ------------------------------------------------------------------------- *
 *  Module statics                                                           *
 * ------------------------------------------------------------------------- */

// BSS work area (lbl_10017520).
static struct FightWork fightWork;

// Module .bss flag (lbl_10018CFC); bit 0 selects the replay draw path and gates the
// commend-data free in dest.  INVENTED / UNVERIFIED.
static u32 lbl_10018CFC;

/* ------------------------------------------------------------------------- *
 *  INVENTED "scene sequence" subsystem (all UNVERIFIED).                      *
 *    lbl_0000EC58 builds a 7-entry command table (each entry {init,main,dest} *
 *    at stride 0xC) plus a 0x9F4-byte scratch buffer, and lbl_100188E8 is the *
 *    controller whose .pc field selects the active command.  Entry 0 is the   *
 *    empty (all-NULL) command; entries 1..6 dispatch the lbl_0000EF78.. scene  *
 *    handlers that remain in asm.  Field names/offsets are best guesses.       *
 * ------------------------------------------------------------------------- */
struct FightSceneCmd
{
    /*0x0*/ void (*init)(void);
    /*0x4*/ void (*main)(void);
    /*0x8*/ void (*dest)(void);
};

struct FightSceneSeq
{
    /*0x00*/ s32 pc;                         // active command index (0 == none)
    /*0x04*/ u8 pad04[0x14 - 0x04];
    /*0x14*/ void *work;                     // -> lbl_10017E98.work
};

// lbl_10017E98: command table (cmds[0..6]) + scratch buffer (0x9F4).  INVENTED / UNVERIFIED.
static struct
{
    /*0x00*/ struct FightSceneCmd cmds[7];
    /*0x54*/ u8 work[0x9F4];
} lbl_10017E98;

// lbl_100188E8: scene-sequence controller.  INVENTED / UNVERIFIED.
static struct FightSceneSeq lbl_100188E8;

// lbl_10019040: per-player fight-camera work array (4 elements, stride 0x14C == 0x530 total).
// Only the size is known; contents stay opaque.  INVENTED / UNVERIFIED.
static u8 lbl_10019040[0x530];

/* ------------------------------------------------------------------------- *
 *  Forward declarations                                                     *
 * ------------------------------------------------------------------------- */

// Drafted in this file:
static void fight_init(void);                                           // lbl_0000A690
static void fight_dest(void);                                           // lbl_0000A974
static void fight_main(void);                                           // lbl_0000AAD0 (main cb)
static void fight_draw(void);                                           // lbl_0000ABA8 (draw cb)
static void fight_ball_callback(struct Ball *ball);                     // lbl_0000FF34 (ball cb)
static void fight_camera_callback(struct Camera *camera, struct Ball *ball); // lbl_00012248

// Referenced-by-name but NOT yet decompiled (bodies remain in asm/mini_fight.s).
// Signatures inferred from call sites -- UNVERIFIED.
static void lbl_0000EC58(void);   // init sub-inits
static void lbl_0000FEC8(void);
static void lbl_00007444(void);
static void lbl_00000210(void);
static void lbl_000121FC(void);
static void lbl_00013C1C(void);
static void lbl_00019340(void);
static void lbl_0001A37C(void);
static void lbl_0000E9D8(void);
static void lbl_0000EE80(void);   // dest sub-dests
static void lbl_0000FF30(void);
static void lbl_000074DC(void);
static void lbl_00000270(void);
static void lbl_00013C6C(void);
static void lbl_00019B3C(void);
static void lbl_0001A550(void);
static void lbl_0001A3DC(void);   // main-callback helpers
static void lbl_00004D14(void);
static void lbl_0000CF98(void);
static void lbl_00019464(void);
static void lbl_0001199C(void);
static void lbl_0000E4D4(void);   // draw-callback helpers
static void lbl_0000AD9C(void);
static void lbl_0000ABE8(void);
static void lbl_00019B40(void);
static void lbl_0001181C(struct Ball *ball); // ball-callback helper

// Mode handlers drafted in this file (wired via the asm jump table lbl_0001CBE0):
static void lbl_0000AEEC(void);   // mode 0  (module init / spawn balls)
static void lbl_0000AFCC(void);   // mode 1
static void lbl_0000AFE0(void);   // mode 2
static void lbl_0000B028(void);   // mode 3
static void lbl_0000B3D4(void);   // mode 5  (ready / count-down)

// Helpers reached by the drafted sub-inits / sub-dests / mode handlers but still in asm.
// Signatures inferred from call sites -- UNVERIFIED.
static void lbl_00004314(void);            // tail of lbl_00000210 (stobj sub-init)
static void lbl_0001B910(void *elem);      // per-element init in lbl_0001A37C
static void lbl_0000D8D8(void);            // reached by mode 2
static void lbl_0000E3E4(void);            // reached by mode 2
static int  lbl_0000EBF4(void);            // predicate used by mode 5
static void lbl_0000FEC4(void);            // tail of lbl_0000EC58 (scene-seq init)

// The 7-entry scene command table's handlers (entries 1..6); still in asm.
static void lbl_0000EF78(void); static void lbl_0000EF7C(void); static void lbl_0000EF80(void);
static void lbl_0000EF84(void); static void lbl_0000EF88(void); static void lbl_0000EF8C(void);
static void lbl_0000EF90(void); static void lbl_0000F078(void); static void lbl_0000F2C4(void);
static void lbl_0000FD38(void); static void lbl_0000FD6C(void); static void lbl_0000FD8C(void);
static void lbl_0000FD90(void); static void lbl_0000FDE4(void); static void lbl_0000FE04(void);
static void lbl_0000FE08(void); static void lbl_0000FE5C(void); static void lbl_0000FE7C(void);

/* ------------------------------------------------------------------------- *
 *  REL skeleton  (template: src/mini_race.c -- 4-arg set_minigame_callbacks) *
 * ------------------------------------------------------------------------- */

void _prolog(void)
{
    set_minigame_callbacks(fight_main, fight_draw, fight_ball_callback,
                           fight_camera_callback);
    puts("RELOCATION MINI_FIGHT LOADED");
    fight_init();
    gameSubmodeRequest = SMD_MINI_FIGHT_MAIN;
}

void _epilog(void)
{
    fight_dest();
    set_minigame_callbacks(NULL, NULL, NULL, NULL);
    puts("RELOCATION MINI_FIGHT PURGED");
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
    OSPanic("mini_fight.c", 79, "\n");
}

/* ------------------------------------------------------------------------- *
 *  Init  (lbl_0000A690, 0x0000A690 .. 0x0000A970)                           *
 *  DRAFT-UNCERTAIN: seeds the ~20 Monkey-Fight tuning globals (the debug menu *
 *  in src/window.c) from the config table, saves the player-pool status /     *
 *  character selection for dest() to restore, optionally fills empty player   *
 *  slots with random CPU characters, then chains nine deeper sub-inits.       *
 *  The window-global stores that hold floats are type-punned to match stfs.   *
 * ------------------------------------------------------------------------- */

static void fight_init(void)
{
    OSHeapHandle oldHeap;
    s8 *status;
    int i;

    // Fight tuning parameters (see the WI_EDIT_* debug menu in src/window.c).
    lbl_802F1EA2 = 0xA800;                     // CAM ANG X
    lbl_802F1EA0 = 0;                          // CAM ANG Y
    *(f32 *)&lbl_802F1E9C = CFG_F32(0x2B8);    // BALL POWER       (1.0)
    lbl_802F1E98 = 0xA;                        // BLT INTERVAL     (10)
    lbl_802F1E94 = 0;                          // BLT TRIGER MODE
    lbl_802F1E90 = 0;                          // BLT SWING MODE
    lbl_802F1E8C = 0x5A;                       // BLT TIME         (90)
    *(f32 *)&lbl_802F1E88 = CFG_F32(0x2BC);    // BLT SPD          (0.2)
    *(f32 *)&lbl_802F1E84 = CFG_F32(0x2C0);    // BLT POWER        (1.3)
    *(f32 *)&lbl_802F1E80 = CFG_F32(0x2C4);    // BLT REACT POWER  (0.0)
    *(f32 *)&lbl_802F1E7C = CFG_F32(0x2C8);    //                  (0.45)
    lbl_802F1E78 = CFG_F32(0x2B8);             // LV COEF          (1.0)
    lbl_802F1E74 = CFG_F32(0x2CC);             //                  (2.0)
    lbl_802F1E70 = CFG_F32(0x2D0);             //                  (0.5)
    lbl_802F1E6C = CFG_F32(0x2D4);             //                  (0.8)
    lbl_802F1E6A = 0x14;                       //                  (20)
    lbl_802F1E68 = 0xA;                        //                  (10)
    lbl_802F1E66 = 5;
    lbl_802F1E64 = 0;
    lbl_802F1E60 = CFG_F32(0x2D8);             // KILL DECIDE SEC  (1.5)
    lbl_802F1E5C = CFG_F32(0x2CC);             // MUTEKI SEC       (2.0)

    memset((u8 *)&fightWork + 0x144, 0, 0x750);
    fightWork.unk146 = 0;
    modeCtrl.gameType = 4;
    modeCtrl.currPlayer = 0;

    free_all_bitmap_groups_except_com();
    func_800249D4();
    bitmap_load_group(5);
    bitmap_load_group(9);

    oldHeap = OSSetCurrentHeap(stageHeap);
    u_load_minigame_graphics(2);
    OSSetCurrentHeap(oldHeap);

    SoundGroupLoad(0xB);
    event_finish_all();

    // Snapshot the player-pool status + character selections for dest() to restore.
    fightWork.savedPlayerCount = modeCtrl.playerCount;
    status = g_poolInfo.playerPool.statusList;
    fightWork.savedStatus[0] = status[0];
    fightWork.savedCharSel[0] = playerCharacterSelection[0];
    fightWork.savedStatus[1] = status[1];
    fightWork.savedCharSel[1] = playerCharacterSelection[1];
    fightWork.savedStatus[2] = status[2];
    fightWork.savedCharSel[2] = playerCharacterSelection[2];
    fightWork.savedStatus[3] = status[3];
    fightWork.savedCharSel[3] = playerCharacterSelection[3];

    // Optionally top the roster up to 4 with random CPU characters.
    if (lbl_801EED98 & 1)
    {
        modeCtrl.playerCount = 4;
        for (i = 0; i < 4; i++)
        {
            if (status[i] == STAT_NULL)
            {
                status[i] = STAT_NORMAL;
                playerCharacterSelection[i] = (rand() & 0x7FFF) % 4;
                playerControllerIDs[i] = playerControllerIDs[0];
                FIGHT_PLAYER_FLAG(i) |= 1;
            }
        }
    }

    lbl_0000EC58();
    lbl_0000FEC8();
    lbl_00007444();
    lbl_00000210();
    lbl_000121FC();
    lbl_00013C1C();
    lbl_00019340();
    lbl_0001A37C();
    lbl_0000E9D8();
}

/* ------------------------------------------------------------------------- *
 *  Dest  (lbl_0000A974, 0x0000A974 .. 0x0000AACC)  -- called from _epilog    *
 * ------------------------------------------------------------------------- */

static void fight_dest(void)
{
    OSHeapHandle oldHeap;
    s8 *status;

    lbl_0000EE80();
    lbl_0000FF30();
    lbl_000074DC();
    lbl_00000270();
    lbl_00013C6C();
    lbl_00019B3C();
    lbl_0001A550();

    if (lbl_10018CFC & 1)
    {
        oldHeap = OSSetCurrentHeap(stageHeap);
        mini_commend_free_data();
        OSSetCurrentHeap(oldHeap);
        lbl_10018CFC &= ~1;
    }

    SoundGroupFree();

    oldHeap = OSSetCurrentHeap(stageHeap);
    u_free_minigame_graphics();
    OSSetCurrentHeap(oldHeap);

    bitmap_free_group(5);
    bitmap_free_group(9);

    // Restore the player-pool status + character selections snapshotted in init().
    modeCtrl.playerCount = fightWork.savedPlayerCount;
    status = g_poolInfo.playerPool.statusList;
    status[0] = fightWork.savedStatus[0];
    playerCharacterSelection[0] = fightWork.savedCharSel[0];
    status[1] = fightWork.savedStatus[1];
    playerCharacterSelection[1] = fightWork.savedCharSel[1];
    status[2] = fightWork.savedStatus[2];
    playerCharacterSelection[2] = fightWork.savedCharSel[2];
    status[3] = fightWork.savedStatus[3];
    playerCharacterSelection[3] = fightWork.savedCharSel[3];

    event_finish_all();
    VISetNextFrameBuffer(gfxBufferInfo->currFrameBuf);
    VIWaitForRetrace();
}

/* ------------------------------------------------------------------------- *
 *  Main callback  (lbl_0000AAD0, 0x0000AAD0 .. 0x0000ABA4)                   *
 *  Advances the mode index, dispatches the current mode handler, then runs    *
 *  the fixed per-frame update / draw-prep helpers (skipped in debug pause).   *
 * ------------------------------------------------------------------------- */

static void fight_main(void)
{
    fightWork.unk144 = fightWork.unk146;
    lbl_0001CBE0[fightWork.unk144]();
    modeCtrl.currPlayer = 0;

    if (lbl_801EED98 & 1)
        lbl_0001A3DC();

    if (!(debugFlags & 0xA))
        lbl_00004D14();

    lbl_0000CF98();

    if (!(debugFlags & 0xA))
        lbl_00019464();

    if (!(debugFlags & 0xA))
        lbl_0001199C();

    if (fightWork.unk88C & 2)
    {
        u_play_sound_0(0x67);
        fightWork.unk88C &= ~2;
    }
}

/* ------------------------------------------------------------------------- *
 *  Draw callback  (lbl_0000ABA8, 0x0000ABA8 .. 0x0000ABE4)                   *
 * ------------------------------------------------------------------------- */

static void fight_draw(void)
{
    lbl_0000E4D4();
    if (lbl_10018CFC & 1)
        lbl_0000AD9C();   // replay / commend draw path
    else
        lbl_0000ABE8();   // normal per-viewport draw
    lbl_00019B40();
}

/* ------------------------------------------------------------------------- *
 *  Ball callback  (lbl_0000FF34, 0x0000FF34 .. 0x0000FFC0)                   *
 *  Dispatches on ball->unk148 via the module ball-substate table.  Note the   *
 *  "state relay": ball->state (0x3) is copied into unk148 and reset to 0x18   *
 *  unless it is already 0x18.                                                *
 * ------------------------------------------------------------------------- */

static void fight_ball_callback(struct Ball *ball)
{
    if (FIGHT_PLAYER_FLAG(ball->playerId) & 1)
        lbl_0001181C(ball);

    lbl_0001D678[ball->unk148](ball);

    if (ball->state != 0x18)
    {
        ball->unk148 = ball->state;
        ball->state = 0x18;
    }
}

/* ------------------------------------------------------------------------- *
 *  Camera callback  (lbl_00012248, 0x00012248 .. 0x0001228C)                 *
 *  Dispatches on camera->subState via the module camera-substate table.       *
 * ------------------------------------------------------------------------- */

static void fight_camera_callback(struct Camera *camera, struct Ball *ball)
{
    s8 sub = camera->subState;

    if (sub >= 0)
        lbl_0001D768[sub](camera, ball);
}

/* ========================================================================= *
 *  INIT SUB-INITS  (chained by fight_init)                                   *
 * ========================================================================= */

/* lbl_00000210 (0x210 .. 0x26C): register the four Monkey-Fight stobj type
 * function-tables (types 5..8 == SOT_MF_PNL_BUMPER/ELECTRAP/BULLET_TEST/BOX),
 * then run the deeper stobj setup lbl_00004314.  The tables live in asm .data
 * inside lbl_0001C9D8 (stride 0x18 == sizeof StobjFuncs).  CONFIDENCE: high. */
static void lbl_00000210(void)
{
    func_8006B3E8(5, (struct StobjFuncs *)&lbl_0001C9D8[0x1c]);
    func_8006B3E8(6, (struct StobjFuncs *)&lbl_0001C9D8[0x34]);
    func_8006B3E8(7, (struct StobjFuncs *)&lbl_0001C9D8[0x4c]);
    func_8006B3E8(8, (struct StobjFuncs *)&lbl_0001C9D8[0x64]);
    lbl_00004314();
}

/* lbl_00007444 (0x7444 .. 0x74D8): install the module's effect-type handler
 * tables (types 0x18,0x19,0x1a,0x1c,0x1d,0x1e,0x1f,0x2a,0x2b) from lbl_0001CB40
 * (stride 0x10 == sizeof EffectFuncs).  CONFIDENCE: high. */
static void lbl_00007444(void)
{
    effect_replace_type_funcs(0x18, (struct EffectFuncs *)&lbl_0001CB40[0x00]);
    effect_replace_type_funcs(0x19, (struct EffectFuncs *)&lbl_0001CB40[0x10]);
    effect_replace_type_funcs(0x1a, (struct EffectFuncs *)&lbl_0001CB40[0x20]);
    effect_replace_type_funcs(0x1c, (struct EffectFuncs *)&lbl_0001CB40[0x30]);
    effect_replace_type_funcs(0x1d, (struct EffectFuncs *)&lbl_0001CB40[0x40]);
    effect_replace_type_funcs(0x1e, (struct EffectFuncs *)&lbl_0001CB40[0x50]);
    effect_replace_type_funcs(0x1f, (struct EffectFuncs *)&lbl_0001CB40[0x60]);
    effect_replace_type_funcs(0x2a, (struct EffectFuncs *)&lbl_0001CB40[0x70]);
    effect_replace_type_funcs(0x2b, (struct EffectFuncs *)&lbl_0001CB40[0x80]);
}

/* lbl_00013C1C (0x13C1C .. 0x13C68): install the module's item-type handler
 * tables (types 1,3,4) from lbl_0001D790 (stride 0x1c == sizeof ItemFuncs).
 * CONFIDENCE: high. */
static void lbl_00013C1C(void)
{
    item_replace_type_funcs(1, (struct ItemFuncs *)&lbl_0001D790[0x00]);
    item_replace_type_funcs(3, (struct ItemFuncs *)&lbl_0001D790[0x1c]);
    item_replace_type_funcs(4, (struct ItemFuncs *)&lbl_0001D790[0x38]);
}

/* lbl_000121FC (0x121FC .. 0x12244): reset each of the four cameras' subState to
 * -1 (setting currentCamera to each in turn, restoring it afterward).
 * CONFIDENCE: high. */
static void lbl_000121FC(void)
{
    struct Camera *savedCamera;
    int i;

    savedCamera = currentCamera;
    for (i = 0; i < 4; i++)
    {
        currentCamera = &cameraInfo[i];
        cameraInfo[i].subState = -1;
    }
    currentCamera = savedCamera;
}

/* lbl_0000FEC8 (0xFEC8 .. 0xFF2C): put every active player's ball into ball
 * substate 0x1d (the demo-init entry of lbl_0001D678), matching the bowling
 * init loop shape.  CONFIDENCE: high. */
static void lbl_0000FEC8(void)
{
    struct Ball *savedBall;
    struct Ball *ball;
    s8 *status;
    int i;

    savedBall = currentBall;
    status = g_poolInfo.playerPool.statusList;
    ball = ballInfo;
    for (i = 0; i < g_poolInfo.playerPool.count; i++, ball++, status++)
    {
        if (*status == STAT_NORMAL)
        {
            currentBall = ball;
            ball->unk148 = 0x1d;
        }
    }
    currentBall = savedBall;
}

/* lbl_0000E9D8 (0xE9D8 .. 0xEA0C): make the common "hide-ball mark" model use
 * an additive-ish tev/ITI attribute (same call as src/minimap.c line 77).
 * CONFIDENCE: high. */
static void lbl_0000E9D8(void)
{
    MTEfcChangeAttributeITI(NLOBJ_MODEL(g_commonNlObj, NLMODEL_common_hideball_mark),
                            0x1BFFFFFF, 0x24000000);
}

/* lbl_0001A37C (0x1A37C .. 0x1A3D8): clear the per-player fight-camera work array
 * (4 * 0x14C == 0x530) and run lbl_0001B910 on each element.  CONFIDENCE: high
 * for structure; the work-array type is invented. */
static void lbl_0001A37C(void)
{
    u8 *elem;
    int i;

    memset(lbl_10019040, 0, sizeof(lbl_10019040));
    elem = lbl_10019040;
    for (i = 4; i > 0; i--, elem += 0x14C)
        lbl_0001B910(elem);
}

/* lbl_0000EC58 (0xEC58 .. 0xEDA4): build the 7-entry scene-command table + its
 * scratch buffer, point the controller at the buffer, then hand off to
 * lbl_0000FEC4.  Structure is faithful; the FightSceneCmd/Seq types are invented
 * and the entry handlers stay in asm.  CONFIDENCE: medium (invented subsystem). */
static void lbl_0000EC58(void)
{
    memset(&lbl_100188E8, 0, sizeof(lbl_100188E8));
    memset(lbl_10017E98.work, 0, sizeof(lbl_10017E98.work));
    lbl_100188E8.work = lbl_10017E98.work;

    lbl_10017E98.cmds[0].init = NULL;
    lbl_10017E98.cmds[0].main = NULL;
    lbl_10017E98.cmds[0].dest = NULL;
    lbl_10017E98.cmds[1].init = lbl_0000EF78;
    lbl_10017E98.cmds[1].main = lbl_0000EF7C;
    lbl_10017E98.cmds[1].dest = lbl_0000EF80;
    lbl_10017E98.cmds[2].init = lbl_0000EF84;
    lbl_10017E98.cmds[2].main = lbl_0000EF88;
    lbl_10017E98.cmds[2].dest = lbl_0000EF8C;
    lbl_10017E98.cmds[3].init = lbl_0000EF90;
    lbl_10017E98.cmds[3].main = lbl_0000F078;
    lbl_10017E98.cmds[3].dest = lbl_0000F2C4;
    lbl_10017E98.cmds[4].init = lbl_0000FD38;
    lbl_10017E98.cmds[4].main = lbl_0000FD6C;
    lbl_10017E98.cmds[4].dest = lbl_0000FD8C;
    lbl_10017E98.cmds[5].init = lbl_0000FD90;
    lbl_10017E98.cmds[5].main = lbl_0000FDE4;
    lbl_10017E98.cmds[5].dest = lbl_0000FE04;
    lbl_10017E98.cmds[6].init = lbl_0000FE08;
    lbl_10017E98.cmds[6].main = lbl_0000FE5C;
    lbl_10017E98.cmds[6].dest = lbl_0000FE7C;

    lbl_0000FEC4();
}

/* ========================================================================= *
 *  DEST SUB-DESTS  (chained by fight_dest)                                   *
 * ========================================================================= */

/* lbl_00000270 (0x270 .. 0x2B8): unregister the four Monkey-Fight stobj types. */
static void lbl_00000270(void)
{
    func_8006B3E8(5, NULL);
    func_8006B3E8(6, NULL);
    func_8006B3E8(7, NULL);
    func_8006B3E8(8, NULL);
}

/* lbl_000074DC (0x74DC .. 0x7560): unregister the module effect types. */
static void lbl_000074DC(void)
{
    effect_replace_type_funcs(0x18, NULL);
    effect_replace_type_funcs(0x19, NULL);
    effect_replace_type_funcs(0x1a, NULL);
    effect_replace_type_funcs(0x1c, NULL);
    effect_replace_type_funcs(0x1d, NULL);
    effect_replace_type_funcs(0x1e, NULL);
    effect_replace_type_funcs(0x1f, NULL);
    effect_replace_type_funcs(0x2a, NULL);
    effect_replace_type_funcs(0x2b, NULL);
}

/* lbl_00013C6C (0x13C6C .. 0x13CA8): unregister the module item types. */
static void lbl_00013C6C(void)
{
    item_replace_type_funcs(1, NULL);
    item_replace_type_funcs(3, NULL);
    item_replace_type_funcs(4, NULL);
}

/* lbl_0000FF30 (0xFF30): empty sub-dest (single blr). */
static void lbl_0000FF30(void)
{
}

/* lbl_0001A550 (0x1A550): empty sub-dest (single blr). */
static void lbl_0001A550(void)
{
}

/* lbl_0000EE80 (0xEE80 .. 0xEEE0): tear down the scene sequence -- run the active
 * command's destroy slot (if any), clear the program counter, then reset the
 * stage post-load callback.  CONFIDENCE: medium (invented subsystem). */
static void lbl_0000EE80(void)
{
    if (lbl_100188E8.pc != 0)
    {
        lbl_10017E98.cmds[lbl_100188E8.pc].dest();
        lbl_100188E8.pc = 0;
    }
    func_80047518(NULL);
}

/* ========================================================================= *
 *  MODE HANDLERS  (dispatched via lbl_0001CBE0[fightWork.unk144])            *
 * ========================================================================= */

/* lbl_0000AEEC -- mode 0 (0xAEEC .. 0xAFC8): module bootstrap.  Requests mode 1,
 * latches three config bytes out of lbl_801EED98, restarts the camera+ball
 * events, then puts every active player's ball into state 0x18 / substate 0x1d.
 * The lbl_801EED98 fields are read by byte offset (it is declared u32 for the
 * bit-0 flag fight_init uses).  CONFIDENCE: high for logic, UNVERIFIED offsets. */
static void lbl_0000AEEC(void)
{
    struct Ball *savedBall;
    struct Ball *ball;
    s8 *status;
    int i;

    fightWork.unk146 = 1;
    fightWork.unk890 = (s8)((u8 *)&lbl_801EED98)[4];  // lbl_801EED98.unk4C (sign-extended)
    fightWork.unk54 = ((u8 *)&lbl_801EED98)[6];       // lbl_801EED98.unk4E
    fightWork.unk55 = ((u8 *)&lbl_801EED98)[7];       // lbl_801EED98.unk4F
    fightWork.unk56 = ((u8 *)&lbl_801EED98)[8];       // lbl_801EED98.unk50

    event_finish_all();
    event_start(EVENT_CAMERA);
    event_start(EVENT_BALL);
    camera_set_state_all(0x3B);

    savedBall = currentBall;
    status = g_poolInfo.playerPool.statusList;
    ball = ballInfo;
    for (i = 0; i < g_poolInfo.playerPool.count; i++, ball++, status++)
    {
        if (*status == STAT_NORMAL)
        {
            currentBall = ball;
            ball->state = 0x18;
            ball->unk148 = 0x1d;
        }
    }
    currentBall = savedBall;
}

/* lbl_0000AFCC -- mode 1 (0xAFCC .. 0xAFDC): request mode 2.  CONFIDENCE: certain. */
static void lbl_0000AFCC(void)
{
    fightWork.unk146 = 2;
}

/* lbl_0000AFE0 -- mode 2 (0xAFE0 .. 0xB024): request mode 3, reset the sub-index /
 * -1 latch / flag word, then run the two mode-2 setup helpers.  CONFIDENCE: high. */
static void lbl_0000AFE0(void)
{
    fightWork.unk146 = 3;
    fightWork.unk148 = 0;
    fightWork.unk884 = -1;
    fightWork.unk88C = 0;
    lbl_0000D8D8();
    lbl_0000E3E4();
}

/* lbl_0000B028 -- mode 3 (0xB028 .. 0xB038): request mode 4.  CONFIDENCE: certain. */
static void lbl_0000B028(void)
{
    fightWork.unk146 = 4;
}

/* lbl_0000B3D4 -- mode 5 (0xB3D4 .. 0xB50C): ready / count-down.  Ticks the two
 * modeCtrl timers, plays the round-call voice at the trigger tick, and advances
 * to mode 6 when the timer expires or a player presses A.  lbl_0001CC44 is the
 * asm sound-id table, indexed by fightWork.unk148.  CONFIDENCE: draft-uncertain
 * (lbl_0000EBF4 semantics and the exact button word are inferred). */
static void lbl_0000B3D4(void)
{
    s32 timer;
    int soundId;

    if (debugFlags & 0xA)
        return;

    if (modeCtrl.submodeTimer > 0)
        modeCtrl.submodeTimer--;
    if (modeCtrl.unk18 > 0)
        modeCtrl.unk18--;

    if (modeCtrl.submodeTimer == 0x249)
    {
        if (lbl_0000EBF4())
            soundId = 0x184;
        else
            soundId = lbl_0001CC44[fightWork.unk148];
        u_play_sound_0(soundId);
    }

    timer = modeCtrl.submodeTimer;
    if (timer != 0)
    {
        if (modeCtrl.unk18 != 0)
            return;
        if (!(g_currPlayerButtons[2] & PAD_BUTTON_A))
            return;
    }

    fightWork.unk146 = 6;
    if (timer > 0x249)
    {
        if (lbl_0000EBF4())
            soundId = 0x184;
        else
            soundId = lbl_0001CC44[fightWork.unk148];
        u_play_sound_0(soundId);
    }
    u_play_music(0x2E, 0);
}

/* ------------------------------------------------------------------------- *
 *  REMAINING (still in asm/mini_fight.s, referenced above):                  *
 *    - mode handlers          lbl_0001CBE0[] targets (0x0000AEEC .. 0x0000CE24) *
 *    - ball substate handlers lbl_0001D678[] targets (ball_func_* + lbl_0001003x..) *
 *    - camera substate handlers lbl_0001D768[] targets (lbl_00012290 ..)      *
 *    - init sub-inits         lbl_0000EC58 / FEC8 / 00007444 / 00000210 /     *
 *                             000121FC / 00013C1C / 00019340 / 0001A37C / E9D8 *
 *    - dest sub-dests         lbl_0000EE80 / FF30 / 000074DC / 00000270 /     *
 *                             00013C6C / 00019B3C / 0001A550                  *
 *    - per-frame helpers      lbl_00004D14 / 0000CF98 / 00019464 / 0001199C / *
 *                             0001A3DC (main); 0000E4D4 / AD9C / ABE8 / 00019B40 *
 *                             (draw); 0001181C (ball)                         *
 *  Also un-transcribed: the .rodata config blob past lbl_0001BF80 and every    *
 *  .data table from lbl_0001C9D8 onward (name/text tables + the jump tables).  *
 * ------------------------------------------------------------------------- */
