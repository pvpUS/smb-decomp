/*
 * mini_bowling.c  --  Monkey Bowling minigame REL module (mkbe.rel_mini_bowling.rel)
 *
 * UNVERIFIED STRUCTURAL FIRST DRAFT.
 *   - This repo cannot build (no CodeWarrior / baserom), so NOTHING here is byte-match
 *     verified.  The code below only syntax-checks and structurally follows its templates
 *     (src/sel_stage_rel.c for the REL skeleton; src/game.c / src/mini.c for behaviour).
 *   - Every struct type invented for this module is flagged "INVENTED / UNVERIFIED".
 *   - Successive cohesive batches of functions are drafted here.  The current batch adds the
 *     replay-snapshot save/restore helpers and the five ball-callback substate handlers
 *     (lbl_00007964/79E8 and lbl_00007A6C/7C54/7E74/7FE0/80E0), templated on src/ball.c and
 *     src/mini_golf.c.  See the "REMAINING" note near the bottom for the asm offset ranges
 *     that are still forward-declared stubs.
 *
 * asm source: asm/mini_bowling.s  (section .text spans 0x000000D0 .. ~0x0000EF44)
 */

#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>

#include <dolphin.h>

#include "global.h"
#include "ball.h"
#include "bitmap.h"
#include "camera.h"
#include "event.h"
#include "functions.h"
#include "game.h"
#include "info.h"
#include "input.h"
#include "light.h"
#include "mathutil.h"
#include "mode.h"
#include "mot_ape.h"
#include "polydisp.h"
#include "pool.h"
#include "rend_efc.h"
#include "sound.h"
#include "sprite.h"
#include "stage.h"
#include "thread.h"
#include "variables.h"
#include "window.h"
#include "world.h"

// needed here temporarily for alignment (PRESERVED from the original stub).
// In the real module this symbol is the base of a 0x5F00-byte .rodata config-data table
// (floats etc.) that is NOT transcribed here; CFG_F32() reads floats out of it by offset.
const u32 lbl_0000F020 = 0x0000004B;

// Read a config float out of the (un-transcribed) module .rodata blob by byte offset.
// UNVERIFIED: only the offsets are known, not the actual float values.
#define CFG_F32(off) (*(const f32 *)((const u8 *)&lbl_0000F020 + (off)))

// Prototypes for module helpers that live in src/mini.c but are not declared in any header.
// Signatures inferred from the call sites -- UNVERIFIED.
void u_set_minigame_callbacks_2(void (*mainCb)(), void (*drawCb)(), void (*cb2)(void),
                                void (*ballCb)(struct Ball *),
                                void (*cameraCb)(struct Camera *, struct Ball *));
void u_load_minigame_graphics(int group);

/* ------------------------------------------------------------------------- *
 *  INVENTED TYPES  (all UNVERIFIED -- field names/offsets are best guesses)  *
 * ------------------------------------------------------------------------- */

// Per-player bowling scorecard.  Lives in an array of 4 inside BowlingWork (stride 0x4C).
// INVENTED / UNVERIFIED.
struct BowlingScore
{
    /* 0x00 */ s32 total;
    /* 0x04 */ s16 unk4;
    /* 0x06 */ s8 unk6;
    /* 0x07 */ s8 unk7;
    /* 0x08 */ s8 unk8;
    /* 0x09 */ s8 unk9;
    /* 0x0A */ s16 unkA;
    /* 0x0C */ s16 frameScore[10]; // filled with -1 at init
    /* 0x20 */ s8 rolls1[0x15];    // filled with 0 at init
    /* 0x35 */ s8 rolls2[0x15];    // filled with 0 at init
    /* 0x4A */ u8 pad4A[0x4C - 0x4A];
};

// Big BSS work area at module bss offset 0x10000000 (real size 0x1B288).  Only the header
// fields touched by the drafted functions are typed; the rest is padding.
// INVENTED / UNVERIFIED.
struct BowlingWork
{
    /* 0x000 */ s32 timer;
    /* 0x004 */ s16 unk4;
    /* 0x006 */ s8 unk6;
    /* 0x007 */ s8 unk7;
    /* 0x008 */ s8 unk8;
    /* 0x009 */ u8 pad9[0x00C - 0x009];
    /* 0x00C */ struct BowlingScore scores[4];
    /* 0x13C */ s16 unk13C;
    /* 0x13E */ s8 unk13E;
    /* 0x13F */ s8 unk13F;
    /* 0x140 */ s8 unk140;
    /* 0x141 */ u8 pad141[0x144 - 0x141];
    /* 0x144 */ s32 unk144;
    /* 0x148 */ s8 unk148;
    /* 0x149 */ s8 unk149;
    /* 0x14A */ s8 unk14A;
    /* 0x14B */ s8 unk14B;
    /* 0x14C */ s8 unk14C;
    /* 0x14D */ u8 pad14D[0x154 - 0x14D];
    /* 0x154 */ u32 unk154;
    /* 0x158 */ u32 unk158;
    /* 0x15C */ s16 unk15C;
    /* 0x15E */ s16 unk15E;
    /* 0x160 */ f32 unk160;
    /* 0x164 */ f32 unk164;
    /* 0x168 */ f32 unk168;
    /* 0x16C */ f32 unk16C;
    /* 0x170 */ f32 unk170;
    /* 0x174 */ s16 unk174;
    /* 0x176 */ u8 pad176[0x178 - 0x176];
    // Replay snapshot save areas (asm labels lbl_10000178 / lbl_100004C0).  lbl_00007964
    // snapshots ballInfo[0] and its ape orientation into slot [idx]; lbl_000079E8 restores.
    // INVENTED field names -- offsets/sizes match the BSS layout (0x348 = 2*sizeof(Ball),
    // 0x20 = 2*sizeof(Quaternion)).
    /* 0x178 */ struct Ball ballSnapshot[2];
    /* 0x4C0 */ Quaternion apeQuatSnapshot[2];
    /* 0x4E0 */ u8 pad4E0[0x1B288 - 0x4E0];
};

// Module .data header at data offset 0x14F20.  Holds the mode state machine value.
// INVENTED / UNVERIFIED.
struct BowlingModeState
{
    /* 0x00 */ s32 state; // one-hot mode value dispatched on in the main callback
    /* 0x04 */ s32 unk4;
    /* 0x08 */ s8 unk8;
    /* 0x09 */ s8 unk9;
    /* 0x0A */ s8 unkA;
    /* 0x0B */ s8 unkB;
    /* 0x0C */ s32 unkC;
};

/* ------------------------------------------------------------------------- *
 *  Module statics                                                           *
 * ------------------------------------------------------------------------- */

// .data (lbl_00014F20) -- initial values transcribed from asm.
static struct BowlingModeState s_mode = { 1, 0x61, 1, 3, 2, 0, -1 };

// BSS work area (lbl_10000000).
static struct BowlingWork s_work;

// A "play this fall sound only once" latch (lbl_000153E4, .data, init -1).
static s32 lbl_000153E4 = -1;

// Sound-handle latch element 0 (lbl_000153E0, .data, init -1).  In the module lbl_000153E0
// and lbl_000153E4 above are a contiguous 2-word array {-1, -1}; the ball sub-handlers stop
// whatever sound each holds and reset both to -1.  Kept as two separate named statics here to
// avoid rewriting the already-drafted lbl_00007878 (which references lbl_000153E4 directly).
static s32 lbl_000153E0 = -1;

// Ball-physics config table (asm label lbl_00011258, module .rodata, 0x68 bytes).  The ball
// sub-handlers read these through a base pointer (matching the asm's r31-relative loads), so
// they are modelled here as one shared const object.  The NUMERIC VALUES are decoded exactly
// from the .rodata bytes; only the field NAMES are INVENTED / UNVERIFIED.
static const struct BowlingBallCfg
{
    /* 0x00 */ f64 unk0;      // -5.0    gutter/fall Y threshold (used by lbl_00007878)
    /* 0x08 */ Vec unk8;      // {0,0,0} copied into ball->unkB8 on reset
    /* 0x14 */ f32 unk14;     // 0.0     generic reset scalar (pos/vel/speed component)
    /* 0x18 */ f32 unk18;     // 0.11    reset height (ball radius above the lane)
    /* 0x1C */ f32 unk1C;     // -1.0    ape facing Z on reset
    /* 0x20 */ s32 unk20[8];  // 0x5A..0x61  pin-hit sfx id template (see lbl_00007C54)
    /* 0x40 */ f64 unk40;     // 0.00015 sideways spin -> vel.x force coefficient
    /* 0x48 */ f64 unk48;     // -0.05   vel.z upper clamp threshold
    /* 0x50 */ f32 unk50;     // -0.05   vel.z clamp value
    /* 0x54 */ f32 unk54;     // 4.0     substate-3 launch Y
    /* 0x58 */ f32 unk58;     // -100.0  substate-3 launch Z
    /* 0x5C */ f32 unk5C;     // 12.0    x ball->accel -> initial vel.y
    /* 0x60 */ f32 unk60;     // 1.0     substate-3 launch vel.z
    /* 0x64 */ f32 unk64;     // 0.0     (trailing pad)
} ballCfg = {
    -5.0,
    { 0.0f, 0.0f, 0.0f },
    0.0f, 0.11f, -1.0f,
    { 0x5A, 0x5B, 0x5C, 0x5D, 0x5E, 0x5F, 0x60, 0x61 },
    0.00015, -0.05, -0.05f, 4.0f, -100.0f, 12.0f, 1.0f, 0.0f,
};

// Per-frame spin / vel.z decay coefficient (asm label lbl_000112C0).  Value exact.
static const f64 lbl_000112C0 = 0.99;

/* ------------------------------------------------------------------------- *
 *  Forward declarations                                                     *
 * ------------------------------------------------------------------------- */

// Drafted in this file:
static void lbl_0000020C(void);                                  // init
static void lbl_00000718(void);                                  // main / mode dispatch
static void lbl_00001888(void);                                  // dest / finish
static void lbl_00007878(struct Ball *ball);                     // ball callback
static void lbl_0000871C(struct Camera *camera, struct Ball *ball); // camera callback
static f32  lbl_000086E4(Vec *v);                                // vec length helper
static void lbl_00007740(void);                                  // start result BGM
static int  lbl_00007778(void);                                  // any active player pressed A?
static void lbl_000076D0(void);                                  // commentary countdown tick
static void lbl_00007964(int idx, struct Ball *ball);            // save ball+ape snapshot
static void lbl_000079E8(int idx, struct Ball *ball);            // restore ball+ape snapshot

// Called-but-not-yet-decompiled locals (forward declared so the file compiles).
// Signatures inferred from call sites -- UNVERIFIED.
static void lbl_000009EC(void);                     // draw callback (0x9EC)
static void lbl_00000F98(void);                     // callback #3 (0xF98)
static void lbl_000066C4(struct Ape *ape, int arg); // ape thread entry (0x66C4)
static int  lbl_000082E4(struct Ball *ball);        // pin/collision resolve (STUB, 0x82E4)
static void lbl_0000A808(void);
static void lbl_0000A878(struct Ball *ball);
static void lbl_0000B460(int idx);
static void lbl_000097B4(void);
// state handlers (dispatched from lbl_00000718):
static void lbl_00001908(void);
static void lbl_00001B14(void);
static void lbl_00001C84(void);
static void lbl_00001F1C(void);
static void lbl_000021B4(void);
static void lbl_00002454(void);
static void lbl_000027B0(void);
static void lbl_00002DE0(void);
static void lbl_00003574(void);
static void lbl_00003A10(void);
static void lbl_00003D24(void);
static void lbl_00003DC0(void);
static void lbl_000042A4(void);
static void lbl_000045E8(void);
static void lbl_00004BD8(void);
// ball-callback substate handlers (dispatched from lbl_00007878) -- DRAFTED below:
static void lbl_00007A6C(struct Ball *ball);
static void lbl_00007C54(struct Ball *ball);
static void lbl_00007E74(struct Ball *ball);
static void lbl_00007FE0(struct Ball *ball);
static void lbl_000080E0(struct Ball *ball);
// camera-callback substate handlers (dispatched from lbl_0000871C):
static void lbl_000089FC(struct Camera *camera, struct Ball *ball);
static void lbl_00008B8C(struct Camera *camera, struct Ball *ball);
static void lbl_00008C68(struct Camera *camera, struct Ball *ball);
static void lbl_00008D2C(struct Camera *camera, struct Ball *ball);
static void lbl_00008DF0(struct Camera *camera, struct Ball *ball);
static void lbl_00008EC0(struct Camera *camera, struct Ball *ball);
static void lbl_00008FB0(struct Camera *camera, struct Ball *ball);
static void lbl_00009048(struct Camera *camera, struct Ball *ball);
static void lbl_000090CC(struct Camera *camera, struct Ball *ball);
static void lbl_00009134(struct Camera *camera, struct Ball *ball);
static void lbl_0000919C(struct Camera *camera, struct Ball *ball);
static void lbl_00009230(struct Camera *camera, struct Ball *ball);

/* ------------------------------------------------------------------------- *
 *  REL skeleton  (template: src/sel_stage_rel.c)                            *
 * ------------------------------------------------------------------------- */

void _prolog(void)
{
    u_set_minigame_callbacks_2(lbl_00000718, lbl_000009EC, lbl_00000F98,
                               lbl_00007878, lbl_0000871C);
    lbl_0000020C();
    gameSubmodeRequest = 0x97;
    puts("RELOCATION BOWLING LOADED\n");
}

void _epilog(void)
{
    lbl_00001888();
    puts("RELOCATION BOWLING PURGED\n");
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
    OSPanic("mini_bowling.c", 415, "\n");
}

/* ------------------------------------------------------------------------- *
 *  Init  (lbl_0000020C, 0x0000020C .. 0x00000714)                          *
 *  DRAFT-UNCERTAIN: deep struct/thread/camera setup; config floats read     *
 *  from the un-transcribed .rodata blob via CFG_F32(); scorecard-clear loops *
 *  reconstructed structurally (mwcc emitted unrolled memset-style code).     *
 * ------------------------------------------------------------------------- */

static void lbl_0000020C(void)
{
    struct Ball *savedBall;
    struct Ball *ball;
    struct World *world;
    struct Camera *savedCamera;
    s8 *status;
    int i;
    int j;

    event_finish_all();
    free_all_bitmap_groups_except_com();
    func_800249D4();
    SoundGroupLoad(0xA);
    func_80044920();
    load_stage(0xB3);
    u_load_minigame_graphics(4);
    call_bitmap_load_group(6);

    submodeFinishFunc = lbl_00001888;

    event_start(EVENT_STAGE);
    event_start(EVENT_WORLD);
    event_start(EVENT_BALL);
    event_start(EVENT_STOBJ);
    event_start(EVENT_INFO);
    event_start(EVENT_CAMERA);
    event_start(EVENT_SPRITE);
    event_start(EVENT_SOUND);
    event_start(EVENT_EFFECT);
    event_start(EVENT_BACKGROUND);
    event_start(EVENT_REND_EFC);
    event_start(EVENT_VIBRATION);

    // light.h prototypes light_init() with no params, but the asm passes r3=0xB3;
    // cast through a matching pointer type so the argument is preserved. UNVERIFIED.
    ((void (*)(int))light_init)(0xB3);
    rend_efc_mirror_enable();

    stageInfo.unk1C |= 1;
    stageInfo.unk0 = 0;

    u_init_player_data_1();

    // Assign the "current ball" to whichever player pool slots are active.
    savedBall = currentBall;
    status = g_poolInfo.playerPool.statusList;
    ball = ballInfo;
    for (i = 0; i < g_poolInfo.playerPool.count; i++, ball++, status++)
    {
        if (*status == STAT_NORMAL)
        {
            currentBall = ball;
            ball->state = 1;
        }
    }
    currentBall = savedBall;

    // Mark the worlds owned by active players.
    status = g_poolInfo.playerPool.statusList;
    world = worldInfo;
    for (i = 0; i < g_poolInfo.playerPool.count; i++, world++, status++)
    {
        if (*status == STAT_NORMAL)
            world->state = 1;
    }

    // Spawn an ape animation thread per active player.
    status = g_poolInfo.playerPool.statusList;
    for (i = 0; i < 4; i++)
    {
        if (status[i])
            apeThreadNo[i] = thread_create(lbl_000066C4, ballInfo[i].ape, 5);
    }

    // Set up the (up to 4) split-screen cameras.
    camera_set_state_all(0x3D);
    savedCamera = currentCamera;
    for (i = 0; i < 4; i++)
    {
        currentCamera = &cameraInfo[i];
        cameraInfo[i].subState = 0;
        cameraInfo[i].unk26 = 9;
    }
    currentCamera = savedCamera;

    for (i = 0; i < 4; i++)
        setup_camera_viewport(i, CFG_F32(0x1C98), CFG_F32(0x1C98),
                              CFG_F32(0x1C9C), CFG_F32(0x1C9C));

    info_init_first();

    // Reset each player's scorecard.
    for (i = 0; i < 4; i++)
    {
        struct BowlingScore *sc = &s_work.scores[i];
        sc->total = 0;
        sc->unk4 = 0;
        sc->unk6 = 1;
        sc->unk7 = 1;
        sc->unk8 = 0;
        sc->unk9 = 0;
        sc->unkA = 0;
        for (j = 0; j < 10; j++)
            sc->frameScore[j] = -1;
        for (j = 0; j < 0x15; j++)
        {
            sc->rolls1[j] = 0;
            sc->rolls2[j] = 0;
        }
    }

    s_work.unk13C = 0;
    s_work.unk13E = 0;
    s_mode.unk8 = 1;
    s_work.unk4 = 0;
    s_work.unk6 = 0;
    s_work.unk7 = 0;
    s_work.unk8 = 0xB;
    s_work.unk144 = 0;
    start_screen_fade(0x100, 0, 30);
    s_mode.unkC = -1;
    u_play_music(0x36, 0);

    lbl_0000A808();

    if (lbl_802F1BF0 == 0)
    {
        s_mode.state = 1;
        s_mode.unk4 = 0x21;
        s_work.timer = 0x2710;
    }
    else
    {
        s_mode.state = 0x800;
        s_mode.unk4 = 0x8001;
        s_work.timer = 0x2710;
    }

    lbl_00007964(0, ballInfo);
    lbl_0000B460(0);
    lbl_00007964(1, ballInfo);
    lbl_0000B460(1);

    s_work.unk13F = 0;
    s_work.unk140 = 0;
    lbl_000097B4();

    s_work.unk148 = -1;
    s_work.unk149 = -1;
    s_work.unk14A = -1;
    s_work.unk14B = -1;
    s_work.unk14C = 0;
}

/* ------------------------------------------------------------------------- *
 *  Main callback / mode dispatch  (lbl_00000718, 0x718 .. 0x9E8)           *
 *  The state field is a one-hot value; mwcc compiles the switch as a binary *
 *  search matching the asm.  Trailing sound/haptic logic is DRAFT.          *
 * ------------------------------------------------------------------------- */

static void lbl_00000718(void)
{
    struct Ball *ball;

    lbl_000076D0();

    if (debugFlags & 0xA)
        return;

    s_work.timer--;

    switch (s_mode.state)
    {
    case 0x0001: lbl_00001908(); break;
    case 0x0002: lbl_00001B14(); break;
    case 0x0004: lbl_00001C84(); break;
    case 0x0008: lbl_00001F1C(); break;
    case 0x0010: lbl_000021B4(); break;
    case 0x0020: lbl_00002454(); break;
    case 0x0040: lbl_000027B0(); break;
    case 0x0080: lbl_00002DE0(); break;
    case 0x0100: lbl_00003574(); break;
    case 0x0200: lbl_00003A10(); break;
    case 0x0400: lbl_00003D24(); break;
    case 0x0800: lbl_00003DC0(); break;
    case 0x1000: lbl_000042A4(); break;
    case 0x2000: lbl_000045E8(); break;
    case 0x4000: lbl_00004BD8(); break;
    default:     s_mode.state = 1; break;
    }

    // Pan a positional sound by the current ball's Z position.
    // Constants are exact IEEE-754 doubles: -48/49 and -32/49.
    ball = currentBall;
    SoundEffect((s8)(-0.9795918367346939 * ball->pos.z),
                (s8)(-0.6530612244897959 * ball->pos.z));

    if (s_work.unk144 > 0)
        s_work.unk144--;

    if (s_mode.state == 0x200)
        return;

    if (lbl_802F1BF0 != 1)
    {
        struct ControllerInfo *ctrl;

        ball = currentBall;
        ctrl = &controllerInfo[playerControllerIDs[ball->playerId]];
        if ((ctrl->pressed.button & PAD_BUTTON_X) && (s_mode.unk4 & 1)
            && !(s_mode.state & 0x100))
        {
            s_mode.unk8 = (s_mode.unk8 == 0);
            u_play_sound_0(0x98);
        }

        if (s_mode.unk8 != 0)
        {
            if (s_mode.unk9 > 3)
                s_mode.unk9--;
        }
        else
        {
            if (s_mode.unk9 < 0xA)
                s_mode.unk9++;
        }
    }

    lbl_0000A878(currentBall);
}

/* ------------------------------------------------------------------------- *
 *  Dest / finish  (lbl_00001888, 0x1888 .. 0x1904)  -- also submodeFinishFunc *
 * ------------------------------------------------------------------------- */

static void lbl_00001888(void)
{
    int i;

    u_clear_buffers_2_and_5();
    event_finish_all();
    polyDisp.flags &= ~0x20;
    u_free_minigame_graphics();
    bitmap_free_group(6);
    SoundGroupFree();

    for (i = 15; i >= 0; i--)
    {
        if (apeThreadNo[i] != -1)
            thread_kill(apeThreadNo[i]);
    }
}

/* ------------------------------------------------------------------------- *
 *  Ball callback  (lbl_00007878, 0x7878 .. 0x7960)                         *
 * ------------------------------------------------------------------------- */

static void lbl_00007878(struct Ball *ball)
{
    switch (ball->unk148)
    {
    case 0: lbl_00007A6C(ball); break;
    case 1: lbl_00007C54(ball); break;
    case 2: lbl_00007E74(ball); break;
    case 3: lbl_00007FE0(ball); break;
    case 4: lbl_000080E0(ball); break;
    default: break;
    }

    // Ball fell below the lane: play the gutter/fall sound once.
    if (ball->pos.y < -5.0 && !(ball->flags & 0x1000) && lbl_000153E4 == -1)
    {
        u_play_sound_0(0x1D);
        lbl_000153E4 = u_play_sound_2(0x15);
    }

    ball->unk80++;
}

/* ------------------------------------------------------------------------- *
 *  Camera callback  (lbl_0000871C, 0x871C .. 0x87C8)                       *
 *  Dispatches on camera->subState via a 12-entry jump table.                *
 * ------------------------------------------------------------------------- */

static void lbl_0000871C(struct Camera *camera, struct Ball *ball)
{
    if (debugFlags & 0xA)
        return;

    if (camera->subState < 0 || camera->subState > 0xB)
        return;

    switch (camera->subState)
    {
    case 0:  lbl_000089FC(camera, ball); break;
    case 1:  lbl_00008B8C(camera, ball); break;
    case 2:  lbl_00008C68(camera, ball); break;
    case 3:  lbl_00008D2C(camera, ball); break;
    case 4:  lbl_00008DF0(camera, ball); break;
    case 5:  lbl_00008EC0(camera, ball); break;
    case 6:  lbl_00008FB0(camera, ball); break;
    case 7:  lbl_00009048(camera, ball); break;
    case 8:  lbl_000090CC(camera, ball); break;
    case 9:  lbl_00009134(camera, ball); break;
    case 10: lbl_0000919C(camera, ball); break;
    case 11: lbl_00009230(camera, ball); break;
    }
}

/* ------------------------------------------------------------------------- *
 *  Small helpers                                                            *
 * ------------------------------------------------------------------------- */

// lbl_000086E4 (0x86E4): magnitude of a Vec.
static f32 lbl_000086E4(Vec *v)
{
    return mathutil_sqrt(v->x * v->x + v->y * v->y + v->z * v->z);
}

// lbl_00007740 (0x7740): clear the commentary counter and start the result-screen BGM.
static void lbl_00007740(void)
{
    s_work.unk15C = 0;
    u_play_music(0x64, 8);
}

// lbl_00007778 (0x7778): returns 1 if any active player pressed A this frame.
static int lbl_00007778(void)
{
    s8 *status = g_poolInfo.playerPool.statusList;

    if (status[0] && (controllerInfo[playerControllerIDs[0]].pressed.button & PAD_BUTTON_A))
        return 1;
    if (status[1] && (controllerInfo[playerControllerIDs[1]].pressed.button & PAD_BUTTON_A))
        return 1;
    if (status[2] && (controllerInfo[playerControllerIDs[2]].pressed.button & PAD_BUTTON_A))
        return 1;
    if (status[3] && (controllerInfo[playerControllerIDs[3]].pressed.button & PAD_BUTTON_A))
        return 1;
    return 0;
}

// lbl_000076D0 (0x76D0): tick the "commentary" countdown; fires a sound event when the
// counter reaches its trigger value and starts the result BGM when it expires.
static void lbl_000076D0(void)
{
    if ((s16)s_work.unk15C > 0)
    {
        if (s_work.unk15C == s_work.unk15E)
            func_8002BFCC(s_work.unk154, s_work.unk158);

        s_work.unk15C--;
        if ((s16)s_work.unk15C <= 0)
            lbl_00007740();
    }
}

/* ------------------------------------------------------------------------- *
 *  Replay snapshot save/restore  (lbl_00007964 / lbl_000079E8)              *
 *  Copy the whole current ball (ballInfo[0], 0x1A4 bytes) and its ape        *
 *  orientation quaternion into save slot [idx] (idx 0 or 1), or restore it.  *
 *  The asm copies are mwcc-unrolled; rendered here as struct assignments.     *
 *  lbl_000079E8 is only reached from the (still-stubbed) mode handlers.       *
 * ------------------------------------------------------------------------- */

static void lbl_00007964(int idx, struct Ball *ball)
{
    if (idx < 0 || idx > 1)
        return;
    s_work.ballSnapshot[idx] = *ball;
    s_work.apeQuatSnapshot[idx] = ball->ape->unk60;
}

static void lbl_000079E8(int idx, struct Ball *ball)
{
    if (idx < 0 || idx > 1)
        return;
    *ball = s_work.ballSnapshot[idx];
    ball->ape->unk60 = s_work.apeQuatSnapshot[idx];
}

/* ------------------------------------------------------------------------- *
 *  Ball callback substate 0 -- init  (lbl_00007A6C, 0x7A6C .. 0x7C50)       *
 *  Reset the ball to its lane start pose, clear any playing ball sounds and  *
 *  advance to substate 2.  Config reads (ballCfg.unkNN) are exact values;    *
 *  their symbolic meaning is a best guess.                                   *
 * ------------------------------------------------------------------------- */

static void lbl_00007A6C(struct Ball *ball)
{
    Vec dir;

    u_ball_init_2(ball);

    ball->pos.x = ballCfg.unk14;
    ball->pos.y = ballCfg.unk18;
    ball->pos.z = ballCfg.unk14;
    ball->prevPos.x = ballCfg.unk14;
    ball->prevPos.y = ballCfg.unk18;
    ball->prevPos.z = ballCfg.unk14;
    ball->vel.x = ballCfg.unk14;
    ball->vel.y = ballCfg.unk14;
    ball->vel.z = ballCfg.unk14;
    ball->rotX = 0;
    ball->rotY = 0;
    ball->rotZ = 0;
    ball->unk60 = 0;
    ball->unk62 = 0;
    ball->unk64 = 0;
    ball->flags &= ~BALL_FLAG_INVISIBLE;
    ball->ape->flags &= ~(APE_FLAG_14 | APE_FLAG_INVISIBLE);
    ball->speed = ballCfg.unk14;
    ball->unkC4 = ballCfg.unk14;
    ball->unkB8 = ballCfg.unk8;

    mathutil_mtxA_from_identity();
    mathutil_mtxA_to_quat(&ball->unk98);
    mathutil_mtxA_rotate_z(ball->rotZ);
    mathutil_mtxA_rotate_y(ball->rotY);
    mathutil_mtxA_rotate_x(ball->rotX);
    mathutil_mtxA_to_mtx(ball->unk30);
    mathutil_mtxA_to_mtx(ball->unkC8);
    mathutil_mtxA_to_quat(&ball->unkA8);

    ball->colorId = (modeCtrl.playerCount == 1) ? 3 : ball->playerId;

    dir.x = ballCfg.unk14;
    dir.y = ballCfg.unk14;
    dir.z = ballCfg.unk1C;
    mot_ape_set_quat_from_vec(ball->ape, &dir);

    if (lbl_000153E0 != -1)
    {
        SoundOff(lbl_000153E0);
        lbl_000153E0 = -1;
    }
    if (lbl_000153E4 != -1)
    {
        SoundOff(lbl_000153E4);
        lbl_000153E4 = -1;
    }

    ball->unk80 = 0;
    ball->state = BALL_STATE_25;
    ball->unk148 = 2;
}

/* ------------------------------------------------------------------------- *
 *  Ball callback substate 1 -- rolling  (lbl_00007C54, 0x7C54 .. 0x7E70)    *
 *  Advance the ball's position/spin one frame with a rotY-driven sideways    *
 *  hook, gravity and a downward-velocity clamp, rebuild its transform/quats, *
 *  run the pin/collision resolve and play a random pin-hit sound.            *
 * ------------------------------------------------------------------------- */

static void lbl_00007C54(struct Ball *ball)
{
    int code;

    ball->prevPos = ball->pos;
    ball->speed = mathutil_sqrt(ball->vel.x * ball->vel.x
                              + ball->vel.y * ball->vel.y
                              + ball->vel.z * ball->vel.z);
    mathutil_mtx_copy(ball->unk30, ball->unkC8);

    ball->vel.x -= ballCfg.unk40 * mathutil_sin(ball->rotY * 2);
    ball->vel.y -= ball->accel;
    if (ball->vel.z > ballCfg.unk48)
        ball->vel.z = ballCfg.unk50;

    ball->pos.x += ball->vel.x;
    ball->pos.y += ball->vel.y;
    ball->pos.z += ball->vel.z;
    ball->rotX += ball->unk60;
    ball->rotY += ball->unk62;
    ball->rotZ += ball->unk64;

    mathutil_mtxA_from_rotate_z(ball->rotZ);
    mathutil_mtxA_rotate_y(ball->rotY);
    mathutil_mtxA_rotate_x(ball->rotX);
    mathutil_mtxA_to_quat(&ball->unk98);
    mathutilData->mtxA[0][3] = ball->pos.x;
    mathutilData->mtxA[1][3] = ball->pos.y;
    mathutilData->mtxA[2][3] = ball->pos.z;
    mathutil_mtxA_to_mtx(ball->unk30);
    mathutil_mtxA_to_quat(&ball->unkA8);

    code = lbl_000082E4(ball);
    if (code == 5 || code == 15 || code == 7 || code == 10)
        ball->flags |= BALL_FLAG_GOAL;

    if (ball->ape->unk24 == 10 && (ball->unk80 & 0xF) == 0)
    {
        // asm copies these 8 ids (== ballCfg.unk20) to the stack, then indexes.
        s32 pinSounds[8] = { 0x5A, 0x5B, 0x5C, 0x5D, 0x5E, 0x5F, 0x60, 0x61 };
        u_play_sound_0(pinSounds[rand() & 7]);
    }
}

/* ------------------------------------------------------------------------- *
 *  Ball callback substate 2 -- settle/replay  (lbl_00007E74, 0x7E74 .. 0x7FDC) *
 *  Like substate 1 but without the sideways hook or pin sound; re-faces the   *
 *  ape to a fixed direction each frame.                                       *
 * ------------------------------------------------------------------------- */

static void lbl_00007E74(struct Ball *ball)
{
    Vec dir;

    ball->prevPos = ball->pos;
    ball->speed = mathutil_sqrt(ball->vel.x * ball->vel.x
                              + ball->vel.y * ball->vel.y
                              + ball->vel.z * ball->vel.z);
    mathutil_mtx_copy(ball->unk30, ball->unkC8);

    ball->vel.y -= ball->accel;

    ball->pos.x += ball->vel.x;
    ball->pos.y += ball->vel.y;
    ball->pos.z += ball->vel.z;
    ball->rotX += ball->unk60;
    ball->rotY += ball->unk62;
    ball->rotZ += ball->unk64;

    mathutil_mtxA_from_rotate_z(ball->rotZ);
    mathutil_mtxA_rotate_y(ball->rotY);
    mathutil_mtxA_rotate_x(ball->rotX);
    mathutil_mtxA_to_quat(&ball->unk98);
    mathutilData->mtxA[0][3] = ball->pos.x;
    mathutilData->mtxA[1][3] = ball->pos.y;
    mathutilData->mtxA[2][3] = ball->pos.z;
    mathutil_mtxA_to_mtx(ball->unk30);
    mathutil_mtxA_to_quat(&ball->unkA8);

    lbl_000082E4(ball);

    dir.x = ballCfg.unk14;
    dir.y = ballCfg.unk14;
    dir.z = ballCfg.unk1C;
    mot_ape_set_quat_from_vec(ball->ape, &dir);
}

/* ------------------------------------------------------------------------- *
 *  Ball callback substate 3 -- launch  (lbl_00007FE0, 0x7FE0 .. 0x80DC)     *
 *  Place the ball at the throw start pose with a config-driven arc velocity,  *
 *  give it a fixed X-spin, stop any ball sounds and advance to substate 4.    *
 * ------------------------------------------------------------------------- */

static void lbl_00007FE0(struct Ball *ball)
{
    ball->pos.x = ballCfg.unk14;
    ball->pos.y = ballCfg.unk54;
    ball->pos.z = ballCfg.unk58;
    ball->prevPos.x = ballCfg.unk14;
    ball->prevPos.y = ballCfg.unk54;
    ball->prevPos.z = ballCfg.unk58;
    ball->vel.x = ballCfg.unk14;
    ball->vel.y = ballCfg.unk5C * ball->accel;
    ball->vel.z = ballCfg.unk60;
    ball->rotX = 0;
    ball->rotY = 0;
    ball->rotZ = 0;
    ball->unk60 = 0x1000;
    ball->unk62 = 0;
    ball->unk64 = 0;
    ball->speed = ballCfg.unk14;

    if (lbl_000153E0 != -1)
    {
        SoundOff(lbl_000153E0);
        lbl_000153E0 = -1;
    }
    if (lbl_000153E4 != -1)
    {
        SoundOff(lbl_000153E4);
        lbl_000153E4 = -1;
    }

    ball->unk80 = 0;
    ball->unk148 = 4;
}

/* ------------------------------------------------------------------------- *
 *  Ball callback substate 4 -- airborne throw  (lbl_000080E0, 0x80E0 .. 0x82E0) *
 *  Integrate the thrown ball with gravity, a per-frame spin/vel.z decay        *
 *  (lbl_000112C0 == 0.99), rebuild transform/quats, run pin resolve and face   *
 *  the ape toward this player's camera.                                        *
 * ------------------------------------------------------------------------- */

static void lbl_000080E0(struct Ball *ball)
{
    Vec dir;

    ball->prevPos = ball->pos;
    ball->speed = mathutil_sqrt(ball->vel.x * ball->vel.x
                              + ball->vel.y * ball->vel.y
                              + ball->vel.z * ball->vel.z);
    mathutil_mtx_copy(ball->unk30, ball->unkC8);

    ball->vel.y -= ball->accel;
    ball->vel.z *= lbl_000112C0;
    ball->unk60 = (s16)(ball->unk60 * lbl_000112C0);

    ball->pos.x += ball->vel.x;
    ball->pos.y += ball->vel.y;
    ball->pos.z += ball->vel.z;
    ball->rotX += ball->unk60;
    ball->rotY += ball->unk62;
    ball->rotZ += ball->unk64;

    mathutil_mtxA_from_rotate_z(ball->rotZ);
    mathutil_mtxA_rotate_y(ball->rotY);
    mathutil_mtxA_rotate_x(ball->rotX);
    mathutil_mtxA_to_quat(&ball->unk98);
    mathutilData->mtxA[0][3] = ball->pos.x;
    mathutilData->mtxA[1][3] = ball->pos.y;
    mathutilData->mtxA[2][3] = ball->pos.z;
    mathutil_mtxA_to_mtx(ball->unk30);
    mathutil_mtxA_to_quat(&ball->unkA8);

    lbl_000082E4(ball);

    dir.x = cameraInfo[ball->playerId].eye.x - ball->pos.x;
    dir.y = cameraInfo[ball->playerId].eye.y - ball->pos.y;
    dir.z = cameraInfo[ball->playerId].eye.z - ball->pos.z;
    mot_ape_set_quat_from_vec(ball->ape, &dir);
}

/* ------------------------------------------------------------------------- *
 *  REMAINING (not yet decompiled -- forward-declared stubs above):          *
 *    - draw callback           lbl_000009EC  (0x09EC .. 0x0F94)             *
 *    - callback #3             lbl_00000F98  (0x0F98 .. 0x1884)             *
 *    - state handlers          lbl_00001908 .. lbl_00004BD8                 *
 *    - pin/collision resolve   lbl_000082E4  (0x82E4 .. 0x86E0)  STUB       *
 *    - camera substate handlers lbl_000089FC .. lbl_00009230  (need the      *
 *                              shared camera-interp helper lbl_000087CC)      *
 *    - ape thread entry        lbl_000066C4  (0x66C4)                       *
 *    - misc helpers            lbl_000097B4, 0000A808, lbl_0000A878,        *
 *                              lbl_0000B460, and everything from ~0x9230      *
 *                              onward (0x9230 .. 0xEF44).                     *
 *  Drafted this pass: the two replay-snapshot helpers (lbl_00007964 /         *
 *  lbl_000079E8) and all five ball-callback substate handlers (lbl_00007A6C,  *
 *  7C54, 7E74, 7FE0, 80E0).  The ball-physics config values in ballCfg /      *
 *  lbl_000112C0 are decoded exactly from the module .rodata.                  *
 *  Still un-transcribed: the rest of the .rodata config blob (lbl_0000F020)   *
 *  and the pin-arrangement name strings / tables in .data (0x14F30 onward).   *
 * ------------------------------------------------------------------------- */
