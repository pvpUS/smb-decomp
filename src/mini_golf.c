/*
 * mini_golf.c  --  Monkey Golf minigame REL module (mkbe.rel_mini_golf.rel)
 *
 * UNVERIFIED STRUCTURAL FIRST DRAFT.
 *   - This repo cannot build (no CodeWarrior / baserom), so NOTHING here is byte-match
 *     verified.  The code below only syntax-checks and structurally follows its templates
 *     (src/mini_bowling.c for the REL skeleton; src/game.c / src/mini.c for behaviour).
 *   - Every struct type invented for this module is flagged "INVENTED / UNVERIFIED".
 *   - mini_golf.s is the LARGEST REL module (~46k lines).  Only a first cohesive batch of
 *     tractable entry points is drafted here:  the REL skeleton, the GMA model-lookup
 *     helper, the module init/dest, the ball-callback dispatcher, and the small leaf
 *     accessors into the BSS work area.  The four large monolithic callbacks
 *     (main / draw / cb2 / camera) and every state/sub-handler are documented forward-
 *     declared STUBS -- see the "REMAINING" note near the bottom for their asm ranges.
 *
 * asm source: asm/mini_golf.s  (.text spans 0x000000C8 .. ~0x000260E4)
 */

#include <stddef.h>
#include <stdio.h>
#include <string.h>

#include <dolphin.h>

#include "global.h"
#include "avdisp.h"
#include "ball.h"
#include "camera.h"
#include "event.h"
#include "functions.h"
#include "game.h"
#include "info.h"
#include "mathutil.h"
#include "mode.h"
#include "mot_ape.h"
#include "pool.h"
#include "sound.h"
#include "sprite.h"
#include "stage.h"
#include "stcoli.h"
#include "variables.h"
#include "window.h"
#include "world.h"

// needed here temporarily for alignment (PRESERVED from the original stub).
// In the real module this symbol is the base of a 0x9C0-byte data section (config floats
// etc.) that is NOT transcribed here; CFG_F32() reads floats out of it by byte offset.
const u32 lbl_000260F0 = 0x00000000;

// Read a config float out of the (un-transcribed) module data blob by byte offset.
// UNVERIFIED: only the offsets are known, not the actual float values (CFG_F32(0) == 0.0f).
#define CFG_F32(off) (*(const f32 *)((const u8 *)&lbl_000260F0 + (off)))

// Prototypes for module helpers that live in src/mini.c / src/code_7.c but are not declared
// in any header.  Signatures taken from their definitions -- UNVERIFIED wiring only.
void u_set_minigame_callbacks_2(void (*mainCb)(), void (*drawCb)(), void (*cb2)(void),
                                void (*ballCb)(struct Ball *),
                                void (*cameraCb)(struct Camera *, struct Ball *));
int u_load_minigame_graphics(int group);
void u_free_minigame_graphics(void);

/* ------------------------------------------------------------------------- *
 *  INVENTED TYPES  (all UNVERIFIED -- field names/offsets are best guesses    *
 *  inferred from the asm accesses)                                            *
 * ------------------------------------------------------------------------- */

// Per-ball golf sub-work region, lives at BSS offset 0x170 (asm label lbl_10000170).
// Only the fields the ball callback zeroes are typed.  INVENTED / UNVERIFIED.
struct GolfBallWork
{
    /*0x00*/ u32 unk0;         // per-substate frame counter
    /*0x04*/ f32 unk4;         // last-frame ball speed (FCE0)
    /*0x08*/ u8 unk8;          // "owning" player id latch (init 9)
    /*0x09*/ u8 pad9[0x0C - 0x09];
    /*0x0C*/ u32 unkC;         // grow/shrink animation counter (F7E8 / FA18)
    /*0x10*/ s32 unk10;        // clamped tilt value [-0x1000 .. 0x3000] (FCE0)
    /*0x14*/ u32 unk14;        // globalAnimTimer snapshot (FCE0)
    /*0x18*/ u32 unk18;        // consecutive-frame counter (FCE0)
    /*0x1C*/ u8 pad1C[0x160 - 0x1C];
};

// Big BSS work area at module bss offset 0x10000000 (real size 0x2D0).  Only the header
// fields touched by the drafted functions are typed; the rest is padding.
// INVENTED / UNVERIFIED.
struct GolfWork
{
    /*0x000*/ u32 state;       // one-hot mode value dispatched on in the main callback
    /*0x004*/ Vec unk04;       // accessor lbl_00009320
    /*0x010*/ Vec unk10;       // accessors lbl_00009340 / lbl_00009360
    /*0x01C*/ u8 pad1C[0x028 - 0x01C];
    /*0x028*/ s16 unk28;       // init = 3
    /*0x02A*/ u8 pad2A[0x03A - 0x02A];
    /*0x03A*/ s16 unk3A;       // accessors lbl_000092F0 / lbl_00009404 / lbl_00009448
    /*0x03C*/ u8 pad3C[0x046 - 0x03C];
    /*0x046*/ s16 unk46;       // accessors lbl_00009384 / lbl_00009394
    /*0x048*/ s16 unk48;       // accessor lbl_000093A4
    /*0x04A*/ u8 pad4A[0x05C - 0x04A];
    /*0x05C*/ Vec unk5C;       // stage start position; accessors lbl_000092C4/D0/E0
    /*0x068*/ u8 pad68[0x0C8 - 0x068];
    /*0x0C8*/ u32 unkC8;       // accessor lbl_000093B4
    /*0x0CC*/ s32 unkCC;       // main-callback countdown timer
    /*0x0D0*/ u32 unkD0;       // accessor lbl_000093C4
    /*0x0D4*/ u8 padD4[0x0D9 - 0x0D4];
    /*0x0D9*/ s8 unkD9;
    /*0x0DA*/ u8 padDA[0x0E4 - 0x0DA];
    /*0x0E4*/ u32 unkE4;       // main-callback frame counter
    /*0x0E8*/ u8 padE8[0x0EB - 0x0E8];
    /*0x0EB*/ u8 unkEB;        // accessor lbl_00009310
    /*0x0EC*/ u8 padEC;
    /*0x0ED*/ u8 unkED;        // accessor lbl_00009300
    /*0x0EE*/ u8 padEE[0x0F0 - 0x0EE];
    /*0x0F0*/ u8 unkF0[4];     // init = 0
    /*0x0F4*/ u8 padF4[0x0F6 - 0x0F4];
    /*0x0F6*/ u8 unkF6;        // accessor lbl_00009424 (returns unkF6 == 0)
    /*0x0F7*/ u8 unkF7;
    /*0x0F8*/ u16 unkF8;       // accessor lbl_00009414
    /*0x0FA*/ u8 unkFA;        // init = 1
    /*0x0FB*/ s8 unkFB;        // accessor lbl_00009478
    /*0x0FC*/ s8 unkFC;        // init = (s8)modeCtrl.playerCount
    /*0x0FD*/ u8 padFD[0x100 - 0x0FD];
    /*0x100*/ Mtx unk100;      // main callback mathutil_mtxA_to_mtx target
    /*0x130*/ u8 camWork[0x170 - 0x130];   // camera sub-work region (lbl_10000130)
    /*0x170*/ struct GolfBallWork ballWork;
};

/* ------------------------------------------------------------------------- *
 *  Module statics                                                            *
 * ------------------------------------------------------------------------- */

// BSS work area (asm label lbl_10000000).
static struct GolfWork golfWork;

// Small data-section tables the leaf accessors read.  In the real module these live in the
// un-transcribed data section at 0x00026AB0+; modelled here with their (all-zero / -1)
// initial values.  INVENTED sizes -- UNVERIFIED.
static s8 lbl_00026AEC = -1;        // "play this sound once" latch byte (real word 0xFF000000)
static u8 lbl_00026AF4[4];          // per-current-player byte table (accessor lbl_00009458)
static u8 lbl_00026AF8[4][0x12];    // per-player x per-hole state table (accessor lbl_000093D4)

// Config sub-blob at data offset 0x264A8 (inside the 0x260F0 config region).  The ball
// sub-handlers read floats/doubles/vectors/quaternions out of it by byte offset.  Only the
// offsets are known; the actual contents are UNVERIFIED and modelled here as all-zero.
static const u8 lbl_000264A8[0x68];
#define BCFG_F32(off)  (*(const f32 *)(lbl_000264A8 + (off)))
#define BCFG_F64(off)  (*(const f64 *)(lbl_000264A8 + (off)))
#define BCFG_VEC(off)  (*(const Vec *)(lbl_000264A8 + (off)))
#define BCFG_QUAT(off) (*(const Quaternion *)(lbl_000264A8 + (off)))

// Standalone doubles in the module config region.  UNVERIFIED (modelled as zero).
static const f64 lbl_000264C8 = 0.0;   // amplitude of the ball's replay "bob" (F7E8 / FA18)
static const f64 lbl_000264E0 = 0.0;   // baseline height offset of the replay "bob"

// s16 "last set-up hole" latch (.data); triggers the per-ball start-pos reset in lbl_0000F290.
// UNVERIFIED initial value.
static s16 lbl_00026DF0 = -1;

// CodeWarrior fabs intrinsic (used by lbl_0000FCE0's angle-magnitude idiom).
extern double fabs(double);

/* ------------------------------------------------------------------------- *
 *  Forward declarations                                                      *
 * ------------------------------------------------------------------------- */

// Drafted in this file:
static struct GMAModel *lbl_000000C8(struct GMA *gma, char *name);  // GMA model lookup
static void lbl_0000027C(void);                                     // dest / purge
static void lbl_000002A8(void);                                     // init
static void lbl_0000F194(struct Ball *ball);                        // ball callback dispatcher

// The four large monolithic callbacks (documented stubs -- see REMAINING note):
static void lbl_000005CC(void);                                     // main callback  (0x5CC)
static void lbl_000056C4(void);                                     // draw callback  (0x56C4)
static void lbl_0001199C(void);                                     // callback #3    (0x1199C)
static void lbl_0000B36C(struct Camera *camera, struct Ball *ball); // camera callback(0xB36C)

// Ball-callback sub-handlers dispatched by lbl_0000F194 (drafted below).
static void lbl_0000F290(struct Ball *ball);
static void lbl_0000F750(struct Ball *ball);
static void lbl_0000FBC8(struct Ball *ball);
static void lbl_0000FCE0(struct Ball *ball);
static void lbl_0000F7E8(struct Ball *ball);
static void lbl_0000FA18(struct Ball *ball);

// Ball physics step local to this module (body at asm 0x00010304 -- not yet decompiled).
// Signature inferred from the call sites: (ball, physBall, flag).  Forward-declared stub.
static void lbl_00010304(struct Ball *ball, struct PhysicsBall *pb, int flag);

/* ------------------------------------------------------------------------- *
 *  REL skeleton  (template: src/mini_bowling.c)                              *
 * ------------------------------------------------------------------------- */

void _prolog(void)
{
    u_set_minigame_callbacks_2(lbl_000005CC, lbl_000056C4, lbl_0001199C,
                               lbl_0000F194, lbl_0000B36C);
    lbl_000002A8();
    puts("RELOCATION MINI_GOLF LOADED");
}

void _epilog(void)
{
    lbl_0000027C();
    puts("RELOCATION MINI_GOLF PURGED");
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
    OSPanic("mini_golf.c", 381, "\n");
}

/* ------------------------------------------------------------------------- *
 *  GMA model lookup  (lbl_000000C8, 0x000000C8 .. 0x0000014C)                *
 *  Structurally identical to stage_find_model(): scan a GMA's model-entry     *
 *  array for a name match and return the model (NULL if not found).           *
 * ------------------------------------------------------------------------- */

static struct GMAModel *lbl_000000C8(struct GMA *gma, char *name)
{
    struct GMAModelEntry *entry;
    int count;

    if (gma == NULL)
        return NULL;

    entry = gma->modelEntries;
    count = gma->numModels;
    while (count > 0)
    {
        if (strcmp(entry->name, name) == 0)
            return entry->model;
        entry++;
        count--;
    }
    return NULL;
}

/* ------------------------------------------------------------------------- *
 *  Dest / purge  (lbl_0000027C, 0x0000027C .. 0x000002A8)                    *
 * ------------------------------------------------------------------------- */

static void lbl_0000027C(void)
{
    event_finish_all();
    free_all_bitmap_groups_except_com();
    u_free_minigame_graphics();
    SoundGroupFree();
}

/* ------------------------------------------------------------------------- *
 *  Init  (lbl_000002A8, 0x000002A8 .. 0x000005CC)                            *
 *  DRAFT-UNCERTAIN: deep struct/camera setup; config floats read from the     *
 *  un-transcribed data blob via CFG_F32(); BSS field offsets are INVENTED.    *
 * ------------------------------------------------------------------------- */

static void lbl_000002A8(void)
{
    struct World *world;
    s8 *status;
    int cur;
    int next;
    int i;

    modeCtrl.gameType = 8;

    event_finish_all();
    free_all_bitmap_groups_except_com();
    func_800249D4();
    SoundGroupLoad(0xC);
    u_load_minigame_graphics(5);
    call_bitmap_load_group(0xA);

    // Mark the first modeCtrl.playerCount pool slots active.
    status = g_poolInfo.playerPool.statusList;
    status[0] = 0;
    status[1] = 0;
    status[2] = 0;
    status[3] = 0;
    for (i = 0; i < modeCtrl.playerCount; i++)
        status[i] = STAT_NORMAL;

    modeCtrl.currPlayer = 0;
    currentBall = &ballInfo[modeCtrl.currPlayer];
    currentCamera = &cameraInfo[modeCtrl.currPlayer];

    u_init_player_data_1();
    func_80044920();
    load_stage(0xA7);

    event_start(EVENT_STAGE);
    event_start(EVENT_WORLD);
    event_start(EVENT_BALL);
    event_start(EVENT_STOBJ);
    event_start(EVENT_INFO);
    event_start(EVENT_OBJ_COLLISION);
    event_start(EVENT_CAMERA);
    event_start(EVENT_SPRITE);
    event_start(EVENT_SOUND);
    event_start(EVENT_VIBRATION);
    event_start(EVENT_EFFECT);
    event_start(EVENT_BACKGROUND);

    // Mark the worlds owned by active players.
    status = g_poolInfo.playerPool.statusList;
    world = worldInfo;
    for (i = 0; i < g_poolInfo.playerPool.count; i++, world++, status++)
    {
        if (*status == STAT_NORMAL)
            world->state = 1;
    }

    // Set up the (up to 4) split-screen cameras.
    camera_set_state_all(0x40);
    for (i = 0; i < 4; i++)
        setup_camera_viewport(i, CFG_F32(0x00), CFG_F32(0x00), CFG_F32(0x00), CFG_F32(0x00));

    cur = modeCtrl.currPlayer;
    next = (cur + 1) % 4;
    cameraInfo[cur].subState = 0;
    cameraInfo[next].subState = 9;
    setup_camera_viewport(cur, CFG_F32(0x00), CFG_F32(0x00), CFG_F32(0x04), CFG_F32(0x04));
    setup_camera_viewport(next, CFG_F32(0x08), CFG_F32(0x00), CFG_F32(0x0C), CFG_F32(0x10));

    info_init_first();
    start_screen_fade(0x100, 0, 0x3C);

    golfWork.state = 1;
    golfWork.unk28 = 3;

    // Copy the stage's ball start position (if present) into the work struct.
    if (decodedStageLzPtr->unk88 != NULL)
        golfWork.unk5C = *(Vec *)decodedStageLzPtr->unk88;

    golfWork.unkFC = (s8)modeCtrl.playerCount;
    golfWork.unkF0[0] = 0;
    golfWork.unkF0[1] = 0;
    golfWork.unkF0[2] = 0;
    golfWork.unkF0[3] = 0;
    golfWork.unkF6 = 0;
    golfWork.unkF7 = 0;

    u_play_music(0x38, 0);
    set_text_font(0xB1);

    golfWork.unkFA = 1;
    lbl_00026AEC = -1;
    gameSubmodeRequest = 0x9F;
}

/* ------------------------------------------------------------------------- *
 *  Ball callback  (lbl_0000F194, 0x0000F194 .. 0x0000F290)                   *
 *  Dispatches on ball->unk148 via a 7-entry jump table; each case first       *
 *  clears a few golfBallWork fields, then runs the matching sub-handler.       *
 * ------------------------------------------------------------------------- */

static void lbl_0000F194(struct Ball *ball)
{
    struct GolfBallWork *bw = &golfWork.ballWork;

    switch (ball->unk148)
    {
    case 0:
        bw->unk14 = 0;
        bw->unk18 = 0;
        bw->unkC = 0;
        lbl_0000F290(ball);
        break;
    case 1:
        bw->unk14 = 0;
        bw->unk18 = 0;
        bw->unkC = 0;
        lbl_0000F750(ball);
        break;
    case 2:
        bw->unk14 = 0;
        bw->unk18 = 0;
        bw->unkC = 0;
        lbl_0000FBC8(ball);
        break;
    case 3:
        bw->unkC = 0;
        lbl_0000FCE0(ball);
        break;
    case 4:
        bw->unk14 = 0;
        bw->unk18 = 0;
        bw->unk0 = 0;
        lbl_0000F7E8(ball);
        break;
    case 5:
        bw->unk14 = 0;
        bw->unk18 = 0;
        bw->unk0 = 0;
        lbl_0000FA18(ball);
        break;
    case 6:
        bw->unk14 = 0;
        bw->unk18 = 0;
        bw->unk0 = 0;
        bw->unkC = 0;
        break;
    default:
        bw->unk14 = 0;
        bw->unk18 = 0;
        bw->unk0 = 0;
        bw->unkC = 0;
        break;
    }
}

/* ------------------------------------------------------------------------- *
 *  Leaf accessors into the BSS work struct (asm 0x000092C4 .. 0x000094xx).    *
 *  These trivial getters/setters are called by the un-transcribed draw /      *
 *  camera / ball-sub-handler code.  All offsets are INVENTED / UNVERIFIED.     *
 * ------------------------------------------------------------------------- */

// 0x000092C4/D0/E0: components of the stage-start-position vector.
static f32 lbl_000092C4(void) { return golfWork.unk5C.x; }
static f32 lbl_000092D0(void) { return golfWork.unk5C.y; }
static f32 lbl_000092E0(void) { return golfWork.unk5C.z; }

// 0x000092F0 / 0x00009404 / 0x00009448: the s16 field at 0x3A.
static s16 lbl_000092F0(void) { return golfWork.unk3A; }
static u8  lbl_00009404(void) { return (u8)golfWork.unk3A; }
static void lbl_00009448(int v) { golfWork.unk3A = (s8)v; }

// 0x00009300 / 0x00009310: byte fields at 0xED / 0xEB.
static u8 lbl_00009300(void) { return golfWork.unkED; }
static u8 lbl_00009310(void) { return golfWork.unkEB; }

// 0x00009320 / 0x00009340 / 0x00009360: copy the vector fields at 0x04 / 0x10.
static void lbl_00009320(Vec *v) { golfWork.unk04 = *v; }
static void lbl_00009340(Vec *v) { golfWork.unk10 = *v; }
static void lbl_00009360(Vec *out) { *out = golfWork.unk10; }

// 0x00009384 / 0x00009394 / 0x000093A4: the s16 fields at 0x46 / 0x48.
static void lbl_00009384(s16 *p) { golfWork.unk46 = *p; }
static void lbl_00009394(s16 *p) { *p = golfWork.unk46; }
static void lbl_000093A4(s16 *p) { golfWork.unk48 = *p; }

// 0x000093B4 / 0x000093C4: pointer/word fields at 0xC8 / 0xD0.
static u32 lbl_000093B4(void) { return golfWork.unkC8; }
static u32 lbl_000093C4(void) { return golfWork.unkD0; }

// 0x00009414: the u16 field at 0xF8.
static u16 lbl_00009414(void) { return golfWork.unkF8; }

// 0x00009424: logical-NOT of the byte at 0xF6 (returns 1 iff zero).
static int lbl_00009424(void) { return golfWork.unkF6 == 0; }

// 0x00009438 / 0x00009458 / 0x00009478: small data-table / work reads.
static s8 lbl_00009438(void) { return lbl_00026AEC; }
static u8 lbl_00009458(void) { return lbl_00026AF4[modeCtrl.currPlayer]; }
static s8 lbl_00009478(void) { return golfWork.unkFB; }

// 0x000093D4: per-player / per-hole state byte table.
static u8 lbl_000093D4(int player, int hole) { return lbl_00026AF8[player][hole]; }

/* ------------------------------------------------------------------------- *
 *  STUBS -- un-decompiled functions (bodies TODO).  Defined so the module is  *
 *  self-contained and compiles; NOT faithful transcriptions.                  *
 * ------------------------------------------------------------------------- */

// Main callback (0x000005CC .. ~0x000056C4).  ~5100-line FULLY-INLINE monolith (NOT a
// dispatcher-plus-handlers shape like mini_bowling's lbl_00000718 -- there are no separate
// mode-handler functions to peel off).  Structure mapped so far:
//   - entry guard `if (debugFlags & 0xA) return;`
//   - currentBall = &ballInfo[modeCtrl.currPlayer]
//   - mathutil_mtxA_from_translate_xyz(cfg,cfg,cfg) -> mathutil_mtxA_to_mtx(golfWork.unk100)
//   - if (golfWork.unkD9 >= 0) golfWork.unkD9--;
//   - a button-fired "skip" block gated on golfWork.state in {0x100,0x8000,0x10000,0x200,0x400}
//   - the golfWork.unkCC countdown + golfWork.unkE4 frame-counter block, which drives a large
//     per-player/per-hole SoundEffect / u_play_sound_0 cascade indexed by
//     lbl_00026AF8[modeCtrl.currPlayer][golfWork.unk3A]  (== *(u8*)(0x26AB0 + player*0x12 +
//     hole + 0x48), confirmed the same table modelled by lbl_00026AF8 / accessor lbl_000093D4)
//   - from ~0xEAC onward: the inline mode state machine (load_stage / event_start / camera
//     setup / u_play_music / start_screen_fade transitions), too intertwined to draft faithfully.
// Left as a documented stub rather than fabricated.  See REMAINING note.
static void lbl_000005CC(void) { /* TODO -- inline monolith, see comment above */ }

// Draw callback (0x000056C4 .. ~0x0000B36C).  ~5800-line per-frame sprite/model/label draw
// monolith.  Left as a documented stub (see REMAINING note).
static void lbl_000056C4(void) { /* TODO */ }

// Callback #3 (0x0001199C ..).  Purpose TBD.
static void lbl_0001199C(void) { /* TODO */ }

// Camera callback (0x0000B36C .. ~0x0000F194).  20-case inline jump-table monolith.
static void lbl_0000B36C(struct Camera *camera, struct Ball *ball)
{
    (void)camera;
    (void)ball;
    /* TODO */
}

/* ------------------------------------------------------------------------- *
 *  Ball sub-handler #0  (lbl_0000F290, 0x0000F290 .. 0x0000F750)             *
 *  ball->unk148 == 0 : first-time set-up for the current hole.  When the hole *
 *  index changed since last time, every player's ball is snapped to the       *
 *  stage start position; then the current ball's transform, spin quaternion   *
 *  and facing are initialised and it advances to substate 4.                  *
 *  DRAFT-UNCERTAIN: the per-ball snap loop is mwcc-unrolled in the asm and is  *
 *  reconstructed here as a plain loop; config reads are UNVERIFIED zeros.      *
 * ------------------------------------------------------------------------- */

static void lbl_0000F290(struct Ball *ball)
{
    Vec dir;
    int i;
    int n;

    if (lbl_00026DF0 != lbl_000092F0())
    {
        n = modeCtrl.playerCount;
        for (i = 0; i < n; i++)
        {
            ballInfo[i].pos = decodedStageLzPtr->startPos->pos;
            ballInfo[i].prevPos = decodedStageLzPtr->startPos->pos;
        }
        lbl_00026DF0 = lbl_000092F0();
    }

    ball->pos.x = decodedStageLzPtr->startPos->pos.x;
    ball->pos.y = decodedStageLzPtr->startPos->pos.y
                + BCFG_F64(0x20) * (BCFG_F64(0x28) * (BCFG_F64(0x28) * ball->accel));
    ball->pos.z = decodedStageLzPtr->startPos->pos.z;
    ball->prevPos = ball->pos;

    mathutil_mtxA_from_translate(&ball->pos);
    mathutil_mtxA_to_mtx(ball->unk30);

    ball->unkC4 = BCFG_F32(0x30);
    ball->speed = BCFG_F32(0x30);
    ball->unkB8 = BCFG_VEC(0x00);
    ball->ape->flags &= ~0x4000;
    ball->unkA8 = BCFG_QUAT(0x0C);
    ball->unk98 = ball->unkA8;

    ball->unk92 = decodedStageLzPtr->startPos->yrot;
    dir.x = -mathutil_sin(ball->unk92);
    dir.y = BCFG_F32(0x30);
    dir.z = -mathutil_sin(ball->unk92 + 0x4000);
    mot_ape_set_quat_from_vec(ball->ape, &dir);

    lbl_00009340(&ball->prevPos);
    lbl_00009320(&ball->pos);
    lbl_000093A4(&ball->unk92);
    lbl_00009384(&ball->unk92);

    ball->colorId = modeCtrl.currPlayer;
    golfWork.ballWork.unk0 = 0;
    golfWork.ballWork.unk8 = 9;
    ball->state = 0x1A;
    ball->unk148 = 4;
}

/* ------------------------------------------------------------------------- *
 *  Ball sub-handler #1  (lbl_0000F750, 0x0000F750 .. 0x0000F7E8)             *
 *  ball->unk148 == 1 : launch the ball with a config-driven initial velocity  *
 *  in the hole's start facing direction, then advance to substate 4.          *
 * ------------------------------------------------------------------------- */

static void lbl_0000F750(struct Ball *ball)
{
    ball->unk92 = decodedStageLzPtr->startPos->yrot;
    lbl_00009340(&ball->prevPos);
    lbl_00009320(&ball->pos);
    lbl_000093A4(&ball->unk92);
    lbl_00009384(&ball->unk92);

    ball->vel.x = BCFG_F32(0x30);
    ball->vel.y = BCFG_F32(0x34);
    ball->vel.z = BCFG_F32(0x30);
    ball->state = 0x1A;
    ball->unk148 = 4;
}

/* ------------------------------------------------------------------------- *
 *  Ball sub-handler #4  (lbl_0000F7E8, 0x0000F7E8 .. 0x0000FA18)             *
 *  ball->unk148 == 4 : turn-based replay "bob".  While the shrink counter is  *
 *  below a per-hole threshold the ball hovers with a sine bob; at the         *
 *  threshold the ball is handed to camera[currPlayer]; afterwards it spins in  *
 *  place until the replay is done.                                            *
 *  DRAFT-UNCERTAIN: config amplitudes UNVERIFIED; threshold table read from    *
 *  lbl_00026AF8 via lbl_000093D4.                                             *
 * ------------------------------------------------------------------------- */

static void lbl_0000F7E8(struct Ball *ball)
{
    struct PhysicsBall physBall;
    s32 threshold;

    if (lbl_000093D4(modeCtrl.currPlayer, lbl_00009404()) == 1)
        threshold = 0x21C;
    else if (lbl_000093D4(modeCtrl.currPlayer, lbl_00009404()) == 2)
        threshold = 0xF0;
    else if (lbl_000093D4(modeCtrl.currPlayer, lbl_00009404()) == 3)
        threshold = 0xF0;

    if (golfWork.ballWork.unkC < (u32)threshold)
    {
        ball->ape->flags &= ~0x4000;
        ball->prevPos.y = ball->pos.y;
        ball->pos.y = lbl_000264E0 + lbl_000092D0()
                    + lbl_000264C8 * mathutil_sin(globalAnimTimer << 10);
        ball->vel.y = ball->pos.y - ball->prevPos.y;
        init_physball_from_ball(ball, &physBall);
    }
    else if (golfWork.ballWork.unkC == (u32)threshold)
    {
        ball->ape->flags |= 0x4000;
        ball->flags |= 0x40;
        cameraInfo[modeCtrl.currPlayer].subState = 8;
        init_physball_from_ball(ball, &physBall);
    }
    else
    {
        mathutil_mtxA_from_quat(&ball->ape->unk60);
        mathutil_mtxA_rotate_y(0x800);
        mathutil_mtxA_to_quat(&ball->ape->unk60);
        if (!(ball->flags & 0x200) && (ball->ape->flags & 0x4000))
        {
            ball->flags &= ~0x500;
            ball->flags |= 0x200;
            u_play_sound_0(0x126);
        }
        lbl_00010304(ball, &physBall, 0);
    }

    golfWork.ballWork.unkC++;
    handle_ball_rotational_kinematics(ball, &physBall, 0);
    update_ball_ape_transform(ball, &physBall, 0);
    ball->unk80++;
}

/* ------------------------------------------------------------------------- *
 *  Ball sub-handler #5  (lbl_0000FA18, 0x0000FA18 .. 0x0000FBC8)             *
 *  ball->unk148 == 5 : same replay "bob" as substate 4, but with a fixed      *
 *  0x3C-frame threshold and the single-player camera[0] hand-off.             *
 * ------------------------------------------------------------------------- */

static void lbl_0000FA18(struct Ball *ball)
{
    struct PhysicsBall physBall;

    if (golfWork.ballWork.unkC < 0x3C)
    {
        ball->ape->flags &= ~0x4000;
        ball->prevPos.y = ball->pos.y;
        ball->pos.y = lbl_000264E0 + lbl_000092D0()
                    + lbl_000264C8 * mathutil_sin(globalAnimTimer << 10);
        ball->vel.y = ball->pos.y - ball->prevPos.y;
        init_physball_from_ball(ball, &physBall);
    }
    else if (golfWork.ballWork.unkC == 0x3C)
    {
        ball->ape->flags |= 0x4000;
        ball->flags |= 0x40;
        cameraInfo[0].subState = 8;
        init_physball_from_ball(ball, &physBall);
    }
    else
    {
        mathutil_mtxA_from_quat(&ball->ape->unk60);
        mathutil_mtxA_rotate_y(0x800);
        mathutil_mtxA_to_quat(&ball->ape->unk60);
        if (!(ball->flags & 0x200) && (ball->ape->flags & 0x4000))
        {
            ball->flags &= ~0x500;
            ball->flags |= 0x200;
            u_play_sound_0(0x126);
        }
        lbl_00010304(ball, &physBall, 0);
    }

    golfWork.ballWork.unkC++;
    handle_ball_rotational_kinematics(ball, &physBall, 0);
    update_ball_ape_transform(ball, &physBall, 0);
    ball->unk80++;
}

/* ------------------------------------------------------------------------- *
 *  Ball sub-handler #2  (lbl_0000FBC8, 0x0000FBC8 .. 0x0000FCE0)             *
 *  ball->unk148 == 2 : re-tee the ball from the last stored start position    *
 *  (golfWork.unk10) with a fresh spin quaternion and facing, then advance to  *
 *  substate 4.                                                                *
 * ------------------------------------------------------------------------- */

static void lbl_0000FBC8(struct Ball *ball)
{
    Vec dir;

    ball->vel.x = BCFG_F32(0x30);
    ball->vel.y = BCFG_F32(0x40);
    ball->vel.z = BCFG_F32(0x30);
    ball->unk80 = 0;
    ball->unk98.w = BCFG_F32(0x44);
    ball->unk98.x = BCFG_F32(0x30);
    ball->unk98.y = BCFG_F32(0x30);
    ball->unk98.z = BCFG_F32(0x30);

    lbl_00009360(&ball->pos);
    ball->pos.y = ball->pos.y
                + BCFG_F64(0x20) * (BCFG_F64(0x28) * (BCFG_F64(0x28) * ball->accel));
    ball->prevPos = ball->pos;
    lbl_00009320(&ball->pos);
    lbl_00009394(&ball->unk92);

    dir.x = -mathutil_sin(ball->unk92);
    dir.y = BCFG_F32(0x30);
    dir.z = -mathutil_sin(ball->unk92 + 0x4000);
    mot_ape_set_quat_from_vec(ball->ape, &dir);

    ball->state = 0x1A;
    ball->unk148 = 4;
}

/* ------------------------------------------------------------------------- *
 *  Ball sub-handler #3  (lbl_0000FCE0, 0x0000FCE0 .. 0x000100D4)             *
 *  ball->unk148 == 3 : the ball is in motion.  Runs the physics step, plays   *
 *  the roll/bonk sounds by impact speed, keeps a running "how long has the     *
 *  ball been slow" counter, and eventually snaps the ball to rest (substate 0) *
 *  once it has settled near the hole.                                         *
 *  DRAFT-UNCERTAIN: the largest sub-handler; several config thresholds are     *
 *  UNVERIFIED zeros and the exact settle heuristics are best-effort.           *
 * ------------------------------------------------------------------------- */

static void lbl_0000FCE0(struct Ball *ball)
{
    struct PhysicsBall physBall;
    f32 speed;
    f32 horizLimit;
    s32 angle;
    s32 tilt;

    ball->flags |= 0x10000;

    if (globalAnimTimer - golfWork.ballWork.unk14 == 1)
    {
        golfWork.ballWork.unk18++;
        golfWork.ballWork.unk14 = globalAnimTimer;
    }
    else
    {
        golfWork.ballWork.unk18 = 0;
        golfWork.ballWork.unk14 = globalAnimTimer;
    }

    lbl_00010304(ball, &physBall, 0);
    handle_ball_rotational_kinematics(ball, &physBall, 0);
    update_ball_ape_transform(ball, &physBall, 0);
    check_ball_teeter(ball->ape);

    if ((ball->flags & 0x4) && lbl_00009310() == 0)
    {
        speed = mathutil_sqrt(ball->vel.x * ball->vel.x
                            + ball->vel.y * ball->vel.y
                            + ball->vel.z * ball->vel.z);
        if (speed < BCFG_F32(0x48))
            u_play_sound_0(0x17);
        else if (speed < BCFG_F32(0x4C))
            u_play_sound_0(0x18);
        else
            u_play_sound_0(0x1A);
    }

    if (cameraInfo[modeCtrl.currPlayer].subState == 7)
    {
        ball->unk148 = 0;
        golfWork.ballWork.unk0 = 0;
        golfWork.ballWork.unk14 = 0;
        golfWork.ballWork.unk18 = 0;
        golfWork.ballWork.unk8 = 9;
    }

    angle = mathutil_atan(mathutil_sqrt(BCFG_F32(0x30) * BCFG_F32(0x30)
                                      + ball->unk114.x * ball->unk114.x
                                      + ball->unk114.z * ball->unk114.z)
                          / ball->unk114.y);
    tilt = (s32)fabs((f64)angle);
    window_set_cursor_pos(1, 1);

    if (golfWork.ballWork.unk10 > 0x3000)
        golfWork.ballWork.unk10 = 0x3000;
    if (golfWork.ballWork.unk10 < -0x1000)
        golfWork.ballWork.unk10 = -0x1000;

    if (golfWork.ballWork.unk18 > 0x3C && ball->unk80 > 0x3C && tilt < 0x1000)
    {
        speed = mathutil_sqrt(ball->vel.x * ball->vel.x
                            + ball->vel.y * ball->vel.y
                            + ball->vel.z * ball->vel.z);
        if (speed < BCFG_F64(0x50) && (physBall.flags & 0x1))
        {
            horizLimit = BCFG_F64(0x58) * ball->accel;
            if (ball->vel.x * ball->vel.x + ball->vel.z * ball->vel.z
                < horizLimit * horizLimit)
            {
                ball->vel.x = BCFG_F32(0x30);
                ball->vel.y = BCFG_F32(0x30);
                ball->vel.z = BCFG_F32(0x30);
                ball->unk148 = 0;
                golfWork.ballWork.unk14 = 0;
                golfWork.ballWork.unk18 = 0;
                golfWork.ballWork.unk0 = 0;
                golfWork.ballWork.unk8 = 9;
            }
            else
            {
                f32 horiz = mathutil_sqrt(ball->vel.x * ball->vel.x
                                        + ball->vel.z * ball->vel.z);
                f32 scale = (horiz - horizLimit) / horiz;
                ball->vel.x = ball->vel.x * scale;
                ball->vel.z = ball->vel.z * scale;
            }
        }
    }

    if (golfWork.ballWork.unk8 == modeCtrl.currPlayer)
    {
        if (golfWork.ballWork.unk4 <= BCFG_F64(0x60))
            golfWork.ballWork.unk0++;
        else
            golfWork.ballWork.unk0 = 0;

        golfWork.ballWork.unk4 = mathutil_sqrt(ball->vel.x * ball->vel.x
                                             + ball->vel.y * ball->vel.y
                                             + ball->vel.z * ball->vel.z);
        if (golfWork.ballWork.unk0 > 0x3C)
        {
            ball->vel.x = BCFG_F32(0x30);
            ball->vel.y = BCFG_F32(0x30);
            ball->vel.z = BCFG_F32(0x30);
            ball->unk148 = 0;
            golfWork.ballWork.unk0 = 0;
            golfWork.ballWork.unk14 = 0;
            golfWork.ballWork.unk18 = 0;
            golfWork.ballWork.unk8 = 9;
        }
        if (lbl_00009310() != 0)
        {
            ball->pos.x = ball->prevPos.x;
            ball->pos.z = ball->prevPos.z;
            ball->vel.x = BCFG_F32(0x30);
            ball->vel.z = BCFG_F32(0x30);
        }
    }
    else
    {
        golfWork.ballWork.unk8 = modeCtrl.currPlayer;
        golfWork.ballWork.unk0 = 0;
    }

    ball->unk80++;
}

/* ------------------------------------------------------------------------- *
 *  lbl_00010304 (0x00010304 ..) -- per-ball collision/physics step.  Not yet  *
 *  decompiled; forward-declared stub so the ball sub-handlers link.           *
 * ------------------------------------------------------------------------- */

static void lbl_00010304(struct Ball *ball, struct PhysicsBall *pb, int flag)
{
    (void)ball;
    (void)pb;
    (void)flag;
    /* TODO */
}

/* ------------------------------------------------------------------------- *
 *  DRAFTED in this pass (structural, syntax-checked, NOT byte-verified):       *
 *    - ball sub-handlers   lbl_0000F290 / F750 / F7E8 / FA18 / FBC8 / FCE0     *
 *      (dispatched by lbl_0000F194; jump table lbl_00026DF4).  New GolfBallWork *
 *      fields unk4/unk8/unk10 identified.                                       *
 *                                                                              *
 *  REMAINING (still stubbed or un-transcribed):                                *
 *    - main callback          lbl_000005CC  (0x000005CC .. ~0x000056C4)        *
 *      FULLY-INLINE ~5100-line monolith (no separable handlers); leading       *
 *      structure documented at the stub.  Uses lbl_00026AF8[player][hole]      *
 *      (== 0x26AB0 + player*0x12 + hole + 0x48) for its sound cascade.          *
 *    - draw callback          lbl_000056C4  (0x000056C4 .. ~0x0000B36C)        *
 *      ~5800-line per-frame draw monolith.                                     *
 *    - camera callback        lbl_0000B36C  (0x0000B36C .. 0x0000F194)         *
 *      (20-case inline jump table on camera->subState, jump table lbl_00026D50)*
 *    - callback #3            lbl_0001199C  (0x0001199C onward)                *
 *    - lbl_00010304  (0x00010304 ..)  per-ball collision/physics step (called  *
 *      by the ball sub-handlers; body still stubbed)                           *
 *    - everything from ~0x00011A6C onward (0x00011A6C .. 0x000260E4), incl.     *
 *      the many lbl_0002xxxx helpers and the model/label draw routines.         *
 *  Also un-transcribed: the module data config blob (lbl_000260F0, 0x9C0 B; the *
 *  ball handlers read its lbl_000264A8/C8/E0 sub-region), the string /          *
 *  jump-table / score tables in the data section (0x00026AB0+), and the        *
 *  doubles at lbl_00026118 / lbl_00026158.                                     *
 * ------------------------------------------------------------------------- */
