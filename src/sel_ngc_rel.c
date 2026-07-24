/*
 * sel_ngc_rel.c  --  NGC-mode stage / minigame select REL module
 *                    (submodes SMD_SEL_NGC_INIT/MAIN/REINIT/DEST, gameSubmode 0x1F..0x22).
 *
 * UNVERIFIED STRUCTURAL FIRST DRAFT.
 *   - This repo cannot build a matching DOL from this file (no CodeWarrior / baserom here),
 *     so NOTHING below is byte-match verified.  It only syntax-checks and structurally
 *     follows its templates:
 *         src/sel_stage_rel.c  -- the sibling stage-select REL (skeleton + conventions)
 *         src/mini_bowling.c   -- the reference for expanding a REL stub into a draft
 *   - Only a first cohesive batch is drafted: the REL skeleton (_prolog/_epilog/_unresolved)
 *     plus the submode init / reinit / event-setup helpers.  Everything else (the ~0x6700-byte
 *     main state machine at lbl_000030F4, the draw callback at lbl_000118E4, and all the
 *     lbl_* handlers in between) is left as forward-declared stubs -- see the REMAINING note
 *     near the bottom for the outstanding asm offset ranges.
 *   - Every struct/global invented for this module is flagged "INVENTED / UNVERIFIED".
 *
 * asm source: asm/sel_ngc_rel.s   (.text spans 0x000000D0 .. 0x00011B60)
 */

#include <math.h>
#include <stddef.h>
#include <stdio.h>

#include <dolphin.h>

#include "global.h"
#include "background.h"
#include "ball.h"
#include "bitmap.h"
#include "camera.h"
#include "course.h"
#include "effect.h"
#include "event.h"
#include "functions.h"
#include "info.h"
#include "input.h"
#include "item.h"
#include "lens_flare.h"
#include "light.h"
#include "load.h"
#include "mathutil.h"
#include "mode.h"
#include "mot_ape.h"
#include "nl2ngc.h"
#include "ord_tbl.h"
#include "pool.h"
#include "rend_efc.h"
#include "sound.h"
#include "sprite.h"
#include "stage.h"
#include "stobj.h"
#include "thread.h"
#include "variables.h"
#include "window.h"

#include "../data/common.nlobj.h"

// needed here temporarily for alignment (PRESERVED from the original stub).
// In the module .data this symbol is the "loaded" banner string that _prolog prints.
char lbl_00012180[] = "RELOCATION SEL_NGC LOADED";

/* ------------------------------------------------------------------------- *
 *  Main-DOL globals used by this module that are not yet typed in a header.  *
 *  INVENTED extern declarations -- offsets/usage inferred from the asm.      *
 * ------------------------------------------------------------------------- */

// Byte read as a signed value into lbl_802F1FB0 by the selection-setup helper.
// UNVERIFIED.
extern s8 lbl_801EED50;
// Small struct immediately preceding lbl_801EEDA8; only [0xC] (a word) is touched here.
// UNVERIFIED.
extern u8 lbl_801EED98[];

/* ------------------------------------------------------------------------- *
 *  INVENTED work-struct overlays  (all UNVERIFIED)                          *
 * ------------------------------------------------------------------------- */

// Overlay of the main-DOL sel_ngc work struct (asm label lbl_801EEDA8, declared generically
// as struct Struct801EEDA8, 0x118 bytes).  This module treats it as a state machine with a
// small "state history" stack.  Only the fields touched by the drafted functions are named;
// everything else is padding.  INVENTED / UNVERIFIED field layout.
struct SelNgcWork
{
    /* 0x00 */ s32 state;      // current one-hot(ish) state value
    /* 0x04 */ s32 unk4;       // reset to -1 on (re)init
    /* 0x08 */ s32 unk8;
    /* 0x0C */ s16 unkC;       // reset to -1 on (re)init
    /* 0x0E */ s16 histDepth;  // number of entries pushed on the state history stack
    /* 0x10 */ s32 hist[11];   // 0x10..0x3B: state history stack (indexed by histDepth)
    /* 0x3C */ s32 unk3C;      // connected-controller count (-> modeCtrl.playerCount)
    /* 0x40 */ s32 unk40;
    /* 0x44 */ s32 unk44;
    /* 0x48 */ s32 unk48;
    /* 0x4C */ s32 unk4C;
    /* 0x50 */ s32 unk50;
    /* 0x54 */ s32 unk54;
    /* 0x58 */ s32 unk58;
    /* 0x5C */ s32 unk5C;
    /* 0x60 */ s32 unk60;
    /* 0x64 */ s32 unk64;
    /* 0x68 */ s32 unk68[11];  // 0x68..0x93: per-slot table, cleared to -1
    /* 0x94 */ s32 spriteTags[10]; // 0x94..0xBB: per-slot sprite tags, cleared to -1
    /* 0xBC */ s32 unkBC;
    /* 0xC0 */ s32 unkC0;
    /* 0xC4 */ Vec charaPos[4]; // 0xC4..0xF3: per-character preview positions (read by the ape-load callback)
    /* 0xF4 */ u8  fillerF4[0xF8 - 0xF4];
    /* 0xF8 */ f32 unkF8;   // draw: time-ish value clamped to <=641.0
    /* 0xFC */ f32 unkFC;   // draw: viewport-top numerator
    /* 0x100 */ f32 unk100; // draw: animated viewport-width basis
    /* 0x104 */ f32 unk104; // draw: viewport-height numerator
    /* 0x108 */ u8  filler108[0x110 - 0x108];
    /* 0x110 */ s32 unk110;
    /* 0x114 */ u8  filler114[0x118 - 0x114];
};

#define SEL_WORK ((struct SelNgcWork *)&lbl_801EEDA8)

// The module's own .bss work area (asm label lbl_10000000, size 0x0A18).
// INVENTED / UNVERIFIED -- only the two fields the drafted code touches are named.
struct SelNgcModuleBss
{
    /* 0x00 */ u8  filler0[0x18];
    /* 0x18 */ s32 unk18[9]; // 0x18..0x3B: 9 flags set to 1 by the selection-setup helper
    /* 0x3C */ s32 stageId;  // preloaded stage id (0xBE) for preload_stage_files()
    /* 0x40 */ u8  filler40[0x0A18 - 0x40];
};

static struct SelNgcModuleBss lbl_10000000;

/* ------------------------------------------------------------------------- *
 *  Sprite subsystem template tables  (all UNVERIFIED)                       *
 *                                                                           *
 *  The per-index sprite creator / mainFunc / drawFunc read two large        *
 *  module-internal blobs by raw byte offset:                                *
 *    - lbl_00011CB0  (.rodata): float/double lerp factors, targets and the   *
 *      int->float magic-double constants.                                    *
 *    - lbl_00012730  (.data)  : the per-bmpId sprite position table          *
 *      (base +0x432c, stride 8: {f32 x; f32 y;}), the two per-bmpId bitmap-  *
 *      layer format tables (base +0x4448 and +0x4788, stride 0x20), the      *
 *      sprintf label format string (+0x43fc), the per-textAlign target-x     *
 *      table (+0x4408) and the locked-label format string (+0x48e8).         *
 *  These blobs are far too large to transcribe here, so they are modelled    *
 *  as opaque externs accessed by offset (they are in reality defined inside  *
 *  this translation unit; extern keeps the draft syntax-checkable).          *
 *  INVENTED / UNVERIFIED.                                                    *
 * ------------------------------------------------------------------------- */

extern u8 lbl_00011CB0[];  // module .rodata blob base
extern u8 lbl_00012730[];  // module .data template blob base

#define RF32(off) (*(const f32 *)(lbl_00011CB0 + (off)))
#define RF64(off) (*(const f64 *)(lbl_00011CB0 + (off)))
#define DF32(off) (*(const f32 *)(lbl_00012730 + (off)))

// One per-bmpId bitmap-layer format entry inside the lbl_00012730 blob.
// INVENTED / UNVERIFIED (offsets inferred from the drawFunc's field accesses).
struct SelNgcSprLayer
{
    /* 0x00 */ s32 sprno;    // NLsprarg.sprno (bitmap id)
    /* 0x04 */ s32 nextIdx;  // index into the layer1 table (only meaningful in the layer0 table)
    /* 0x08 */ f32 ofsX;     // position offset = ofsX * scaleX
    /* 0x0C */ f32 ofsY;
    /* 0x10 */ f32 u0k;      // u0 = u0k / texWidth
    /* 0x14 */ f32 v0k;      // v0 = v0k / texHeight
    /* 0x18 */ f32 u1k;      // u1 = u0 + u1k / texWidth
    /* 0x1C */ f32 v1k;      // v1 = v0 + v1k / texHeight
};

#define SPR_LAYER0(i) (*(const struct SelNgcSprLayer *)(lbl_00012730 + 0x4448 + (i) * 0x20))
#define SPR_LAYER1(i) (*(const struct SelNgcSprLayer *)(lbl_00012730 + 0x4788 + (i) * 0x20))

/* ------------------------------------------------------------------------- *
 *  Forward declarations                                                     *
 * ------------------------------------------------------------------------- */

// Sprite callbacks wired up by the per-index creator lbl_0000EBD4 (drafted below).
static void lbl_0000ECB0(s8 *status, struct Sprite *sprite);  // sprite mainFunc
static void lbl_0000F788(struct Sprite *sprite);              // sprite drawFunc

// Drafted in this file.
static void lbl_00000234(void);   // selection-setup helper
static int  lbl_00001910(void);   // count connected controllers
static void lbl_0000033C(void);   // event / graphics / music setup
static void lbl_00002D00(void);   // SMD_SEL_NGC_INIT   handler
static void lbl_00002EC0(void);   // SMD_SEL_NGC_REINIT handler

// Drafted lower in this file.
static void lbl_000118E4(void);              // draw callback (registered callback)
static void lbl_00009868(struct Ape *ape, int arg); // ape-load callback
static void lbl_0000EBD4(int idx);           // per-index sprite creator (sprite subsystem)

// Called-but-not-yet-decompiled (forward-declared so this file compiles).  Signatures
// inferred from the call sites -- UNVERIFIED.
static void lbl_000030F4(void);              // main per-frame handler (registered callback)
static void lbl_0000A950(void);              // sub-init called from lbl_0000033C

/* ------------------------------------------------------------------------- *
 *  REL skeleton  (template: src/sel_stage_rel.c)                            *
 *  CERTAIN structure; the gameSubmode dispatch is transcribed directly.      *
 * ------------------------------------------------------------------------- */

void _prolog(void)
{
    func_80012510(lbl_000030F4, lbl_000118E4, NULL, NULL);

    switch (gameSubmode)
    {
    case SMD_SEL_NGC_INIT:    // 0x1F
        lbl_00002D00();
        break;
    case SMD_SEL_NGC_REINIT:  // 0x21
        lbl_00002EC0();
        break;
    default:
        break;
    }

    gameSubmodeRequest = SMD_SEL_NGC_MAIN;  // 0x20
    puts(lbl_00012180);
}

void _epilog(void)
{
    event_finish_all();
    func_800249D4();
    puts("RELOCATION SEL_NGC PURGED");
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
    OSPanic("sel_ngc_rel.c", 85, "\n");
}

/* ------------------------------------------------------------------------- *
 *  lbl_00000234 (0x234): selection-setup helper.                            *
 *  Resets the shared course/selection tables to their "all difficulties"    *
 *  defaults.  DRAFT-UNCERTAIN (writes to several loosely-typed globals).     *
 * ------------------------------------------------------------------------- */

static void lbl_00000234(void)
{
    int i;

    modeCtrl.unk30 = 1;

    for (i = 0; i < 6; i++)
    {
        lbl_8027CE24[i].unk0 = 1;
        lbl_8027CE24[i].unk2 = 0;
        lbl_8027CE24[i].unk4 = 0;
    }

    u_isCompetitionModeCourse = 0;
    lbl_802F1FB0 = (s8)lbl_801EED50;
    lbl_802F1FAC = 0;

    for (i = 0; i < 9; i++)
        lbl_10000000.unk18[i] = 1;

    *(s32 *)&lbl_801EED98[0xC] = 0;
}

/* ------------------------------------------------------------------------- *
 *  lbl_00001910 (0x1910): number of connected controllers                   *
 *  (controllerInfo[i].held.err == PAD_ERR_NONE).  HIGH.                      *
 * ------------------------------------------------------------------------- */

static int lbl_00001910(void)
{
    int count = 0;

    if (controllerInfo[0].held.err == 0)
        count++;
    if (controllerInfo[1].held.err == 0)
        count++;
    if (controllerInfo[2].held.err == 0)
        count++;
    if (controllerInfo[3].held.err == 0)
        count++;

    return count;
}

/* ------------------------------------------------------------------------- *
 *  lbl_0000033C (0x33C): event / graphics / ape / music setup.              *
 *  Shared by both the init and reinit handlers.  DRAFT-UNCERTAIN.           *
 * ------------------------------------------------------------------------- */

static void lbl_0000033C(void)
{
    struct SelNgcWork *w = SEL_WORK;
    int i;

    if (debugFlags & 0xA)
        return;

    u_clear_buffers_2_and_5();
    event_start(EVENT_STAGE);      // 1
    event_start(4);
    event_start(5);
    event_start(0xF);
    event_start(0x10);
    event_start(0x12);
    event_start(0xD);
    event_start(0x13);

    // light.h prototypes light_init() with no params, but the asm passes r3=0; cast so the
    // argument is preserved. UNVERIFIED.
    ((void (*)(int))light_init)(0);
    camera_set_state_all(0x34);

    g_poolInfo.playerPool.statusList[0] = STAT_NORMAL;
    g_poolInfo.playerPool.statusList[1] = STAT_NULL;
    g_poolInfo.playerPool.statusList[2] = STAT_NULL;
    g_poolInfo.playerPool.statusList[3] = STAT_NULL;

    call_bitmap_load_group(4);
    lbl_0000A950();

    for (i = 0; i < 0x1A; i++)
        lbl_0000EBD4(i);

    w->unkBC = 0;
    w->unkC0 = 0;

    ape_get_by_type(0, 0, lbl_00009868);
    ape_get_by_type(1, 1, lbl_00009868);
    ape_get_by_type(2, 2, lbl_00009868);
    ape_get_by_type(3, 3, lbl_00009868);

    w->unk58 = 0;
    w->unk5C = 0;
    w->unk60 = 0;
    w->unk64 = 0;

    lbl_10000000.stageId = 0xBE;
    preload_stage_files(lbl_10000000.stageId);
    w->unkC0 = 1;

    // Pick the background music.  courseFlags bit 0x10000 selects the "competition" set.
    if (modeCtrl.courseFlags & 0x10000)
    {
        switch (modeCtrl.gameType)
        {
        case 3:
            u_play_music(8, 0);
            break;
        case 4:
            u_play_music(0xA, 0);
            break;
        case 5:
            u_play_music(0xC, 0);
            break;
        default:
            if (is_minigame_unlocked(6) && is_minigame_unlocked(7) && is_minigame_unlocked(8))
                u_play_music(6, 0);
            else
                u_play_music(4, 0);
            break;
        }
    }
    else
    {
        if (is_minigame_unlocked(6) && is_minigame_unlocked(7) && is_minigame_unlocked(8))
            u_play_music(6, 0);
        else
            u_play_music(4, 0);
    }

    gameSubmodeRequest = SMD_SEL_NGC_MAIN;
}

/* ------------------------------------------------------------------------- *
 *  lbl_00002D00 (0x2D00): SMD_SEL_NGC_INIT handler.                         *
 *  Loads stage 0xBE, initialises the work struct + state history stack,      *
 *  then runs the shared setup helpers and fades in.  DRAFT-UNCERTAIN.        *
 * ------------------------------------------------------------------------- */

static void lbl_00002D00(void)
{
    struct SelNgcWork *w = SEL_WORK;
    int i;

    if (debugFlags & 0xA)
        return;

    background_set_random_seed(0xBE);
    load_stage(0xBE);

    modeCtrl.submodeTimer = 0;
    modeCtrl.courseFlags = 0;
    modeCtrl.difficulty = 0;

    w->state = 7;
    w->unk4 = -1;
    w->unk8 = 0;
    w->unkC = -1;
    w->histDepth = 0;
    w->hist[w->histDepth] = w->state;

    for (i = 0; i < 11; i++)
        w->unk68[i] = -1;
    for (i = 0; i < 10; i++)
        w->spriteTags[i] = -1;

    w->unk110 = 0;
    w->unk3C = lbl_00001910();
    w->unk40 = 1;
    modeCtrl.playerCount = w->unk3C;

    playerCharacterSelection[0] = (s8)lbl_802F1C10.unk4[0];
    playerCharacterSelection[1] = (s8)lbl_802F1C10.unk4[1];
    playerCharacterSelection[2] = (s8)lbl_802F1C10.unk4[2];
    playerCharacterSelection[3] = (s8)lbl_802F1C10.unk4[3];

    w->unk48 = 0;
    w->unk4C = 0;
    w->unk50 = 0;
    w->unk54 = 0;
    w->unk44 = 0;

    lbl_00000234();
    lbl_0000033C();
    func_800123DC();
    start_screen_fade(FADE_IN, RGBA(0, 0, 0, 0), 30);
}

/* ------------------------------------------------------------------------- *
 *  lbl_00002EC0 (0x2EC0): SMD_SEL_NGC_REINIT handler.                       *
 *  Re-enters the select screen: pops / restores the state-history stack      *
 *  according to which courseFlags "return" bit is set, re-runs the setup      *
 *  helpers, then re-tags the previously created sprites.  DRAFT-UNCERTAIN.    *
 * ------------------------------------------------------------------------- */

static void lbl_00002EC0(void)
{
    struct SelNgcWork *w = SEL_WORK;
    u32 flags;
    int i;

    if (debugFlags & 0xA)
        return;

    modeCtrl.submodeTimer = 0;
    flags = modeCtrl.courseFlags;

    if (flags & 0x8000)
    {
        w->unkC = -1;
        w->histDepth--;
        w->state = w->hist[w->histDepth];
        start_screen_fade(FADE_IN, RGBA(0, 0, 0, 0), 30);
    }
    else if (flags & 0x10000)
    {
        w->unkC = -1;
        w->histDepth--;
        w->state = 4;
    }
    else if (flags & 0x80000)
    {
        w->unkC = -1;
        w->histDepth = 1;
        lbl_00000234();
        w->state = 4;
    }
    else
    {
        w->unkC = -1;
        w->histDepth = 1;
        lbl_00000234();
        w->state = 4;
        start_screen_fade(FADE_OUT, RGBA(0, 0, 0, 0), 1);
    }

    // Common tail.
    w->unk4 = -1;
    w->unk8 = 0;
    for (i = 0; i < 11; i++)
        w->unk68[i] = -1;

    w->unk110 = 0;
    w->unk48 = 0;
    w->unk4C = 0;
    w->unk50 = 0;
    w->unk54 = 0;
    w->unk44 = 0;

    lbl_0000033C();
    modeCtrl.courseFlags = 0;
    reset_camera_viewport();

    for (i = 0; i < w->histDepth; i++)
    {
        if (w->spriteTags[i] != -1)
        {
            struct Sprite *sp = find_sprite_with_tag(w->spriteTags[i]);
            if (sp != NULL)
            {
                sp->userVar = 7;
                sp->textAlign = (s8)i;
            }
        }
    }

    func_800123DC();
}

/* ------------------------------------------------------------------------- *
 *  Draw callback  lbl_000118E4 (0x000118E4 .. 0x00011A90).                  *
 *  Sets up the (animated) select-screen viewport, then draws the stage,      *
 *  the START_SIGN preview model, the background and the per-event layers      *
 *  into it.  Registered as the draw callback via func_80012510 in _prolog.    *
 *  HIGH confidence -- structural template: polydisp.c / ending.c draw code.   *
 * ------------------------------------------------------------------------- */

// The .data float/double table the draw callback reads from (asm label lbl_00012160).
// Decoded IEEE-754 exactly: f64 at 0x0, then f32 values.  INVENTED name / UNVERIFIED.
static const struct
{
    /* 0x00 */ f64 maxVal;   // 641.0
    /* 0x08 */ f32 zero;     // 0.0
    /* 0x0C */ f32 screenW;  // 640.0
    /* 0x10 */ f32 one;      // 1.0
    /* 0x14 */ f32 screenH;  // 448.0
    /* 0x18 */ f32 depthBg;  // 400.0
} lbl_00012160 = { 641.0, 0.0f, 640.0f, 1.0f, 448.0f, 400.0f };

static void lbl_000118E4(void)
{
    struct SelNgcWork *w = SEL_WORK;
    f32 left;    // f31
    f32 width;   // f30

    if (w->unkF8 >= lbl_00012160.maxVal)
        left = lbl_00012160.maxVal;
    else
        left = w->unkF8;

    width = w->unk100;
    if (left < lbl_00012160.zero)
    {
        f32 tmp = width + left;
        if (tmp >= lbl_00012160.zero)
        {
            if (tmp <= lbl_00012160.screenW)
                width = tmp;
            else
                width = lbl_00012160.screenW;
        }
        else
        {
            width = lbl_00012160.zero;
        }
        left = lbl_00012160.zero;
    }

    if (is_load_queue_not_empty())
        width = lbl_00012160.zero;

    if (lbl_00012160.zero == width)
    {
        setup_camera_viewport(0, lbl_00012160.zero, lbl_00012160.zero,
                              lbl_00012160.one, lbl_00012160.one);
        set_current_camera(0);
        return;
    }

    setup_camera_viewport(0,
                          left / lbl_00012160.screenW,
                          w->unkFC / lbl_00012160.screenH,
                          width / lbl_00012160.screenW,
                          w->unk104 / lbl_00012160.screenH);
    set_current_camera(0);
    background_light_assign();

    if (modeCtrl.gameType != 4)
    {
        mathutil_mtxA_from_mtxB();
        mathutil_mtxA_translate((Vec *)decodedStageLzPtr->startPos);
        mathutil_mtxA_rotate_y(stageInfo.unk0 << 9);
        nl2ngc_draw_model_sort_translucent_alt2(
            NLOBJ_MODEL(g_commonNlObj, NLMODEL_common_START_SIGN));
    }

    stage_draw();

    if (eventInfo[EVENT_BACKGROUND].state == EV_STATE_RUNNING)
    {
        ord_tbl_set_depth_offset(lbl_00012160.depthBg);
        background_draw();
        ord_tbl_set_depth_offset(lbl_00012160.zero);
    }
    if (eventInfo[EVENT_REND_EFC].state == EV_STATE_RUNNING)
        rend_efc_draw(0x10);
    if (eventInfo[EVENT_ITEM].state == EV_STATE_RUNNING)
        item_draw();
    if (eventInfo[EVENT_STOBJ].state == EV_STATE_RUNNING)
        stobj_draw();
    if (eventInfo[EVENT_EFFECT].state == EV_STATE_RUNNING)
        effect_draw();
    if (backgroundInfo.unk8 & 1)
        lens_flare_draw_mask(0);
    ord_tbl_draw_nodes();
    if (backgroundInfo.unk8 & 1)
        lens_flare_draw(0);
    if (eventInfo[EVENT_REND_EFC].state == EV_STATE_RUNNING)
        rend_efc_draw(8);

    setup_camera_viewport(0, lbl_00012160.zero, lbl_00012160.zero,
                          lbl_00012160.one, lbl_00012160.one);
    set_current_camera(0);
}

/* ------------------------------------------------------------------------- *
 *  Ape-load callback  lbl_00009868 (0x00009868 .. 0x00009B90).              *
 *  Registered via ape_get_by_type() for each of the (up to 4) preview        *
 *  monkeys in lbl_0000033C.  If the sel_ngc mode is being torn down (or this  *
 *  is the 4th ape, arg==3), the ape is destroyed; otherwise it is placed,     *
 *  oriented and given an idle animation.  DRAFT-UNCERTAIN:                     *
 *    - the top guard reproduces four compiler boolean idioms;                 *
 *    - the idle-animation id keeps a leftover register default of 4 that is    *
 *      only observable on the "matched, credit-exhausted" path (see below);    *
 *    - unk48[] (0x48) is indexed per player slot and unk58[] (0x58) per        *
 *      character; both overlay the individually-named fields of SelNgcWork.    *
 * ------------------------------------------------------------------------- */

// ape->unk3C is set to this constant Vec (asm label lbl_00011BC8).  UNVERIFIED name.
static const Vec lbl_00011BC8 = { 0.0f, -0.12f, 0.0f };

static void lbl_00009868(struct Ape *ape, int arg)
{
    struct SelNgcWork *w = SEL_WORK;
    int slot;
    int loopCount;
    int flagA;
    int flagB;
    int gameType;
    int matched;
    int motionId;

    if (arg == 3
     || gameMode != MD_SEL
     || gameSubmodeRequest == SMD_SEL_NGC_DEST
     || gameModeRequest != -1)
    {
        ape_destroy(ape);
        if (arg == 3)
            return;
        thread_exit();
        return;
    }

    if (debugFlags & 0xA)
        return;

    ape->flags &= ~0x13;
    ape->flags |= 1;
    if (w->unkBC == 1)
        ape->flags &= ~0x20;
    else
        ape->flags |= 0x20;

    ape->pos = w->charaPos[ape->charaId];
    mathutil_mtxA_from_identity();
    mathutil_mtxA_translate(&ape->pos);
    mathutil_mtxA_rotate_y(0x8000);
    mathutil_mtxA_rotate_y(0xC000);
    mathutil_mtxA_to_quat(&ape->unk60);

    gameType = modeCtrl.gameType;
    flagB = 0;
    if (gameType == 6 && lbl_802F1BF4.unk4 == 0)
        flagB = 1;
    flagA = 0;
    if (flagB && modeCtrl.playerCount == 1)
        flagA = 1;
    if (flagA)
        loopCount = 2;
    else
        loopCount = modeCtrl.playerCount;

    matched = 0;
    motionId = 4;  // leftover register default; only reaches the call on the
                   // "matched & credit-exhausted" path (see header note)
    for (slot = 0; slot < loopCount; slot++)
    {
        if (ape->charaId == playerCharacterSelection[slot])
            matched = 1;
        switch (gameType)
        {
        case 0:
        case 5:
        case 6:
        case 7:
        case 8:
            if (((s32 *)&w->unk48)[slot] == 0)
                slot = loopCount;  // matches "r12 = r8" -> loop exits next iteration
            break;
        case 1:
        case 3:
        case 4:
            if (w->unk110 != 0 && ((s32 *)&w->unk48)[slot] == 0)
                slot = loopCount;
            break;
        default:
            break;
        }
    }

    if (((s32 *)&w->unk58)[ape->charaId] > 0)
        ((s32 *)&w->unk58)[ape->charaId]--;

    if (((s32 *)&w->unk58)[ape->charaId] > 0)
        motionId = 1;
    else if (!matched)
        motionId = 5;

    new_ape_stat_motion(ape, 8, motionId, motionId, 0.0f);
    ape->unk3C = lbl_00011BC8;
    ape_skel_anim_main(ape);
}

/* ========================================================================= *
 *  SEPARABLE SPRITE SUBSYSTEM  (the 0x1A "menu icon" sprites)               *
 *                                                                           *
 *  lbl_0000033C creates 0x1A of these via lbl_0000EBD4(i).  Each sprite runs *
 *  lbl_0000ECB0 once per frame (mainFunc, a 12-state animation machine) and  *
 *  draws itself via lbl_0000F788 (drawFunc, three nlSprPut layers + a text   *
 *  overlay for locked minigames).                                            *
 *  All three DRAFT-UNCERTAIN (syntax-check only):                            *
 *    - the template tables are accessed by raw offset (see notes above);     *
 *    - the many u8/s16 -> float lerps are written as natural C casts (mwcc    *
 *      re-emits the xoris/0x4330 magic-double boilerplate);                   *
 *    - the constant *values* were not decoded -- they are referenced by      *
 *      their rodata offset, so no literal was fabricated.                     *
 * ========================================================================= */

/* ------------------------------------------------------------------------- *
 *  lbl_0000EBD4 (0xEBD4): per-index sprite creator.                         *
 *  create_sprite(), initialise it from the position table (indexed by idx)   *
 *  and the shared scale/depth/opacity rodata slots, wire the mainFunc and     *
 *  drawFunc callbacks, then sprintf() its bitmap label.  HIGH structure.      *
 * ------------------------------------------------------------------------- */

static void lbl_0000EBD4(int idx)
{
    struct Sprite *sprite = create_sprite();

    if (sprite == NULL)
        return;

    sprite->tag = idx + 0x32;
    sprite->type = SPRITE_TYPE_BITMAP;
    sprite->x = DF32(0x432c + idx * 8);
    sprite->y = DF32(0x4330 + idx * 8);
    sprite->depth = RF32(0x3b4);
    sprite->textAlign = 0;
    sprite->scaleX = RF32(0x8);
    sprite->scaleY = RF32(0x8);
    sprite->opacity = RF32(0x8);
    sprite->userVar = 6;
    sprite->mainFunc = lbl_0000ECB0;
    sprite->drawFunc = lbl_0000F788;
    sprite->bmpId = idx;
    sprintf(sprite->text, (char *)(lbl_00012730 + 0x43fc), idx);
}

/* ------------------------------------------------------------------------- *
 *  lbl_0000ECB0 (0xECB0): sprite mainFunc -- 12-state animation machine.     *
 *  Dispatches on sprite->userVar (0..0xB) through the .data jump table        *
 *  lbl_00016B48 (only 6 distinct bodies).  Every state falls through to the   *
 *  common tail at lbl_0000F760 (the depth update); userVar > 0xB skips        *
 *  straight to that tail.  DRAFT-UNCERTAIN.                                    *
 *                                                                             *
 *  States (userVar -> body):                                                  *
 *    0,5,8,10 -> lbl_0000ECEC : ease position/scale/opacity in; colour -> 128 *
 *    1,9,11   -> lbl_0000EFB4 : same, but colour -> 255 and a y bias          *
 *    2        -> lbl_0000F28C : arm the fade-out (counter=0xF, go to state 4) *
 *    3        -> lbl_0000F2A0 : ease to the "selected" slot; flashing add-clr *
 *    4        -> lbl_0000F460 : fade out over `counter`, then go to state 6   *
 *    6        -> (tail only, no-op)                                           *
 *    7        -> lbl_0000F4B4 : ease to a per-textAlign target; add-clr -> 0  *
 * ------------------------------------------------------------------------- */

static void lbl_0000ECB0(s8 *status, struct Sprite *sprite)
{
    struct SelNgcWork *w = SEL_WORK;

    (void)status;

    switch (sprite->userVar)
    {
    case 0:
    case 5:
    case 8:
    case 10:
    {
        int bmpId = sprite->bmpId;
        f32 posX = DF32(0x432c + bmpId * 8);
        f32 posY = DF32(0x4330 + bmpId * 8);
        f32 tgtX = posX;

        if (bmpId >= 3 && bmpId <= 6)
        {
            if (w->unk40 == 2)
                tgtX = posX - RF32(0x3b8);
            else if (modeCtrl.gameType == 6)
                tgtX = posX + RF32(0x3bc);
        }
        sprite->x = sprite->x + RF64(0x0) * (tgtX - sprite->x);
        sprite->y = sprite->y + RF64(0x0) * (posY - sprite->y);

        sprite->mulR = sprite->mulR + RF64(0x0) * (128 - sprite->mulR);
        sprite->mulG = sprite->mulG + RF64(0x0) * (128 - sprite->mulG);
        sprite->mulB = sprite->mulB + RF64(0x0) * (128 - sprite->mulB);
        sprite->addR = 0;
        sprite->addG = 0;
        sprite->addB = 0;

        sprite->scaleX = sprite->scaleX + RF64(0x1b0) * (RF64(0x3c0) - sprite->scaleX);
        sprite->scaleY = sprite->scaleX;
        sprite->opacity = sprite->opacity + RF64(0x0) * (RF64(0x30) - sprite->opacity);
        break;
    }

    case 1:
    case 9:
    case 11:
    {
        int bmpId = sprite->bmpId;
        f32 posX = DF32(0x432c + bmpId * 8);
        f32 posY = DF32(0x4330 + bmpId * 8);
        f32 tgtX = posX;
        f32 tgtY = posY - RF32(0x94);

        if (bmpId >= 3 && bmpId <= 6)
        {
            if (w->unk40 == 2)
                tgtX = posX - RF32(0x3b8);
            else if (modeCtrl.gameType == 6)
            {
                tgtX = posX + RF32(0x3bc);
                tgtY = posY;  // branch B does not apply the y bias
            }
        }
        sprite->x = sprite->x + RF64(0x0) * (tgtX - sprite->x);
        sprite->y = sprite->y + RF64(0x0) * (tgtY - sprite->y);

        sprite->mulR = sprite->mulR + RF64(0x0) * (255 - sprite->mulR);
        sprite->mulG = sprite->mulG + RF64(0x0) * (255 - sprite->mulG);
        sprite->mulB = sprite->mulB + RF64(0x0) * (255 - sprite->mulB);
        sprite->addR = 0;
        sprite->addG = 0;
        sprite->addB = 0;

        sprite->scaleX = sprite->scaleX + RF64(0x1b0) * (RF64(0x3c8) - sprite->scaleX);
        sprite->scaleY = sprite->scaleX;
        sprite->opacity = sprite->opacity + RF64(0x0) * (RF64(0x30) - sprite->opacity);
        break;
    }

    case 2:
        sprite->counter = 0xf;
        sprite->userVar = 4;
        break;

    case 3:
        // ease toward the "selected" slot centre (RF32(0x14) == centre x)
        sprite->x = sprite->x + RF64(0x0) * (RF32(0x14) - sprite->x);
        sprite->y = sprite->y + RF64(0x0) * (RF32(0x3d0) - sprite->y);

        sprite->mulR = sprite->mulR + RF64(0x0) * (255 - sprite->mulR);
        sprite->mulG = sprite->mulG + RF64(0x0) * (255 - sprite->mulG);
        sprite->mulB = sprite->mulB + RF64(0x0) * (255 - sprite->mulB);
        // flashing additive colour: 0 or 0x80 driven by a globalAnimTimer bit.
        sprite->addR = (globalAnimTimer << 5) & 0x80;
        sprite->addG = (globalAnimTimer << 5) & 0x80;
        sprite->addB = (globalAnimTimer << 5) & 0x80;

        sprite->scaleX = sprite->scaleX + RF64(0x1b0) * (RF64(0x3d8) - sprite->scaleX);
        sprite->scaleY = sprite->scaleX;
        sprite->opacity = sprite->opacity + RF64(0x0) * (RF64(0x30) - sprite->opacity);
        break;

    case 4:
        sprite->counter--;
        sprite->opacity = sprite->counter / RF32(0x94);
        if (sprite->counter == 0)
            sprite->userVar = 6;
        break;

    case 6:
        // no per-state work; only the common tail runs
        break;

    case 7:
        // ease toward a per-textAlign target x (table at lbl_00012730+0x4408)
        sprite->x = sprite->x + RF64(0x2e8) * (DF32(0x4408 + sprite->textAlign * 4) - sprite->x);
        sprite->y = sprite->y + RF64(0x2e8) * (RF32(0x3e0) - sprite->y);

        sprite->mulR = sprite->mulR + RF64(0x2e8) * (128 - sprite->mulR);
        sprite->mulG = sprite->mulG + RF64(0x2e8) * (128 - sprite->mulG);
        sprite->mulB = sprite->mulB + RF64(0x2e8) * (128 - sprite->mulB);
        sprite->addR = sprite->addR + RF64(0x2e8) * (0 - sprite->addR);
        sprite->addG = sprite->addG + RF64(0x2e8) * (0 - sprite->addG);
        sprite->addB = sprite->addB + RF64(0x2e8) * (0 - sprite->addB);

        sprite->scaleX = sprite->scaleX + RF64(0x0) * (RF64(0x98) - sprite->scaleX);
        sprite->scaleY = sprite->scaleX;
        sprite->opacity = sprite->opacity + RF64(0x2e8) * (RF64(0x30) - sprite->opacity);
        break;

    default:
        break;
    }

    // common tail (lbl_0000F760): depth tracks opacity.
    sprite->depth = RF64(0x3e8) - RF32(0x3c) * sprite->opacity;
}

/* ------------------------------------------------------------------------- *
 *  lbl_0000F788 (0xF788): sprite drawFunc.                                  *
 *  Draws the icon as three stacked nlSprPut layers -- a fixed frame bitmap    *
 *  (0x40e), a per-bmpId foreground bitmap (layer0) and its companion bitmap   *
 *  (layer1) -- with the foreground UVs derived from the loaded texture's      *
 *  dimensions.  Optionally adds a pulsing "selected" glow (0x410) and, for    *
 *  locked minigame icons, a "?" text label.  DRAFT-UNCERTAIN.                 *
 * ------------------------------------------------------------------------- */

static void lbl_0000F788(struct Sprite *sprite)
{
    NLsprarg params;
    u32 sprno;
    struct TPLTextureHeader *tex;
    f32 alphaFactor;

    /* ---- layer: fixed frame bitmap 0x40e ---- */
    params.sprno = 0x40e;
    params.x = sprite->x;
    params.y = sprite->y;
    params.z = sprite->depth;
    params.zm_x = sprite->scaleX;
    params.zm_y = sprite->scaleY;
    params.u0 = RF32(0x8);
    params.v0 = RF32(0x8);
    params.u1 = RF32(0xc);
    params.v1 = RF32(0xc);
    params.ang = sprite->rotation;
    params.trnsl = sprite->opacity;
    params.listType = -1;
    params.attr = (sprite->flags & ~0xF) | 0xA;
    params.base_color = RGBA(sprite->mulR, sprite->mulG, sprite->mulB, (u8)(RF32(0x10) * sprite->opacity));
    params.offset_color = RGBA(sprite->addR, sprite->addG, sprite->addB, 0);

    if (sprite->userVar == 1)
    {
        sprite->addR = RF64(0x3f0) * fabs(mathutil_sin(globalAnimTimer << 9));
        sprite->addG = sprite->addR;
        sprite->addB = sprite->addR;
        params.offset_color = RGBA(sprite->addR, sprite->addG, sprite->addB, 0);
    }
    nlSprPut(&params);

    /* ---- layer0: per-bmpId foreground bitmap ---- */
    sprno = SPR_LAYER0(sprite->bmpId).sprno;
    params.sprno = sprno;
    tex = &bitmapGroups[(sprno >> 8) & 0xFF].tpl->texHeaders[sprno & 0xFF];
    params.x = sprite->x + SPR_LAYER0(sprite->bmpId).ofsX * sprite->scaleX;
    params.y = sprite->y + SPR_LAYER0(sprite->bmpId).ofsY * sprite->scaleY;
    params.z = sprite->depth - RF64(0x190);
    params.u0 = SPR_LAYER0(sprite->bmpId).u0k / (f32)tex->width;
    params.v0 = SPR_LAYER0(sprite->bmpId).v0k / (f32)tex->height;
    params.u1 = params.u0 + SPR_LAYER0(sprite->bmpId).u1k / (f32)tex->width;
    params.v1 = params.v0 + SPR_LAYER0(sprite->bmpId).v1k / (f32)tex->height;
    params.zm_x = sprite->scaleX * (params.u1 - params.u0);
    params.zm_y = sprite->scaleY * (params.v1 - params.v0);
    nlSprPut(&params);

    /* ---- layer1: companion bitmap (index from layer0.nextIdx) ---- */
    {
        u32 idx1 = SPR_LAYER0(sprite->bmpId).nextIdx;
        u32 sprno1 = SPR_LAYER1(idx1).sprno;
        struct TPLTextureHeader *tex1 = &bitmapGroups[(sprno1 >> 8) & 0xFF].tpl->texHeaders[sprno1 & 0xFF];

        params.sprno = sprno1;
        params.x = sprite->x + SPR_LAYER1(idx1).ofsX * sprite->scaleX;
        params.y = sprite->y + SPR_LAYER1(idx1).ofsY * sprite->scaleY;
        params.z = sprite->depth - RF64(0x190);
        params.u0 = SPR_LAYER1(idx1).u0k / (f32)tex1->width;
        params.v0 = SPR_LAYER1(idx1).v0k / (f32)tex1->height;
        params.u1 = params.u0 + SPR_LAYER1(idx1).u1k / (f32)tex1->width;
        params.v1 = params.v0 + SPR_LAYER1(idx1).v1k / (f32)tex1->height;
        params.zm_x = sprite->scaleX * (params.u1 - params.u0);
        params.zm_y = sprite->scaleY * (params.v1 - params.v0);
        nlSprPut(&params);
    }

    if (sprite->userVar == 1)
    {
        sprite->addR = 0;
        sprite->addG = 0;
        sprite->addB = 0;
        params.offset_color = RGBA(sprite->addR, sprite->addG, sprite->addB, 0);
    }

    /* ---- optional "selected" glow (states 5, 8, 9) ---- */
    if (sprite->userVar == 5 || (u32)(sprite->userVar - 8) <= 1)
    {
        params.sprno = 0x410;
        params.x = sprite->x;
        params.y = sprite->y;
        params.z = sprite->depth - RF64(0x330);
        params.zm_x = RF64(0x3c8) * sprite->scaleX;
        params.zm_y = RF64(0x3c8) * sprite->scaleY;
        params.u0 = RF32(0x8);
        params.v0 = RF32(0x8);
        params.u1 = RF32(0xc);
        params.v1 = RF32(0xc);
        if (sprite->userVar == 5)
            alphaFactor = RF64(0x30);
        else
            alphaFactor = RF64(0x3f8) - RF64(0x400) * fabs(mathutil_sin(globalAnimTimer << 9));
        params.trnsl = sprite->opacity * alphaFactor;
        params.base_color = RGBA(255, 255, 255, (u8)(RF32(0x10) * sprite->opacity));
        params.offset_color = RGBA(0, 0, 0, 0);
        nlSprPut(&params);
    }

    /* ---- optional locked-minigame "?" label (states 5, 8, 9, 10, 11) ---- */
    if (sprite->userVar == 5 || (u32)(sprite->userVar - 8) <= 3)
    {
        int draw = 0;
        s8 tag = sprite->tag;

        if (tag == 0x3f)
            draw = !is_minigame_unlocked(6);
        else if (tag == 0x40)
            draw = !is_minigame_unlocked(7);
        else if (tag == 0x41)
            draw = !is_minigame_unlocked(8);

        if (draw)
        {
            reset_text_draw_settings();
            set_text_font(1);
            set_text_scale(RF64(0x378) * sprite->scaleX, RF64(0x378) * sprite->scaleY);
            set_text_mul_color(0x00FFFF00);
            func_80071B1C(RF32(0x3c));
            set_text_opacity(sprite->opacity);
            set_text_pos(sprite->x + RF32(0x408) * sprite->scaleX,
                         sprite->y + RF32(0x40c) * sprite->scaleY);
            sprite_printf((char *)(lbl_00012730 + 0x48e8), 0x9c4);
        }
    }
}

/* ------------------------------------------------------------------------- *
 *  REMAINING (not yet decompiled -- forward-declared stubs above):          *
 *    - main per-frame handler  lbl_000030F4  (0x000030F4 .. 0x00009854).     *
 *      ~0x6700-byte state machine.  The registered per-frame callback.  Its   *
 *      prologue computes a connected-controller mask from playerControllerIDs *
 *      and decrements a raft of work-struct timers, then dispatches on        *
 *      w->state (0..0x3A) through the 59-entry .data jump table lbl_00012644  *
 *      (targets in 0x00003548 .. 0x00009854).  NOT the 9-entry table          *
 *      lbl_00012238 -- that one (targets lbl_00000608 .. lbl_00001768) is     *
 *      consumed by the separate sub-dispatcher whose bctr is at 0x00000604.   *
 *      Left stubbed: 59 inline state handlers are too many to draft faithfully *
 *      without byte-match verification.                                        *
 *    - sub-init  lbl_0000A950 (0x0000A950 .. ~0x0000EBD4).                    *
 *  DRAFTED in earlier passes (UNVERIFIED, syntax-check only):                 *
 *    - draw callback  lbl_000118E4  (0x000118E4 .. 0x00011A90).              *
 *    - ape-load callback  lbl_00009868  (0x00009868 .. 0x00009B90).         *
 *  DRAFTED in this pass -- the separable sprite subsystem (UNVERIFIED):       *
 *    - per-index sprite creator lbl_0000EBD4 (0x0000EBD4 .. 0x0000ECB0).      *
 *    - sprite mainFunc lbl_0000ECB0 (0x0000ECB0 .. 0x0000F788): 12-state      *
 *      animation machine via the 12-entry jump table lbl_00016B48 (6 distinct  *
 *      bodies).  All 6 bodies + the common tail are drafted.                   *
 *    - sprite drawFunc lbl_0000F788 (0x0000F788 .. 0x0000FE0C): three         *
 *      nlSprPut layers + optional glow + locked-minigame text.                 *
 *      The template tables lbl_00011CB0 / lbl_00012730 are accessed by raw     *
 *      offset (opaque externs); the per-bmpId layer entries use the invented   *
 *      struct SelNgcSprLayer.  NOTE: the next sibling creators lbl_0000FE0C    *
 *      / lbl_0000FF7C (their own mainFunc/drawFunc pair) remain un-drafted.    *
 *  Un-transcribed data (still in asm/sel_ngc_rel.s):
 *    - .rodata @ 0x00011B68 (0x614 bytes; the draw table lbl_00012160 and the  *
 *      ape const lbl_00011BC8 that ARE drafted were transcribed inline above). *
 *    - .data   @ 0x00012180 (0x5319 bytes: banner strings, the lbl_00012238    *
 *      and lbl_00012644 jump tables, gct/gma path strings, preview .tpl paths, *
 *      sprite position/format templates at lbl_00012730).                      *
 *    - .bss    @ 0x10000000 (0xA18 bytes: modelled here only as              *
 *      struct SelNgcModuleBss with the two touched fields named).             *
 * ------------------------------------------------------------------------- */
