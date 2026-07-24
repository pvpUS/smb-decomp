/**
 * mini_pilot.c - Monkey Target minigame REL module.
 *
 * UNVERIFIED STRUCTURAL FIRST-DRAFT.  This repo cannot build yet (no CodeWarrior
 * / baserom), so NOTHING here is byte-match verified.  It only syntax-checks and
 * structurally follows its templates (rel_sample.c / sel_stage_rel.c for the REL
 * skeleton, item_pilot.c for the shared Monkey Target globals).
 *
 * Drafted so far (module lifecycle batch): _prolog/_epilog/_unresolved, the
 * init/dest entry points, the main + state-dispatch callbacks, the graphics
 * load/free wrappers, the per-mode reset, and the stage loader.
 *
 * NOT yet drafted (asm offsets remaining): item-spawn helpers @0x7B8..0xDC8, the
 * draw callback @0x3B6C, the ball callback @0x4F68, the camera callback @0x6DFC,
 * and all per-state gameplay functions @0x1000..0xBDA4.  See report.
 */
#include <stddef.h>
#include <stdio.h>
#include <string.h>

#include <dolphin.h>

#include "global.h"
#include "ball.h"
#include "bitmap.h"
#include "camera.h"
#include "event.h"
#include "game.h"
#include "input.h"
#include "item.h"
#include "light.h"
#include "mathutil.h"
#include "mode.h"
#include "ord_tbl.h"
#include "pause_menu.h"
#include "pool.h"
#include "sound.h"
#include "sprite.h"
#include "stage.h"
#include "stcoli.h"
#include "vibration.h"
#include "window.h"

// -----------------------------------------------------------------------------
// Preserved from the original alignment stub.  These are the first words of two
// untranscribed module data tables:
//   lbl_0000BE80 - section-4 config table (init reads floats at +0x30/+0x34;
//                  the spawn helpers read many more fields).  Cast to access.
//   lbl_0000C740 - section-5 s16 array of stage IDs, indexed by pilotWork.unk40.
// Kept as the alignment anchors the stub declared; the real data still lives in
// the (not-yet-transcribed) data sections.
// -----------------------------------------------------------------------------
const u32 lbl_0000BE80 = 0x003A003B;
u32 lbl_0000C740 = 0x00970098;

// Accessors into the (untranscribed) section-4 config blob at lbl_0000BE80.
// mwcc addresses both the config struct fields AND nearby float/double literal
// constants via an offset from the config base register, so several "constants"
// referenced by the gameplay code (e.g. lbl_0000C030 == config+0x1B0,
// lbl_0000C2A8 == config+0x428) fall out as fixed byte offsets here.  Because
// the data section is not transcribed, the exact literal VALUES are unknown; we
// preserve the ACCESS (base+offset) faithfully and flag the reads as opaque.
#define PILOT_CFG_F(off) (((const f32 *)&lbl_0000BE80)[(off) >> 2])
#define PILOT_CFG_D(off) (*(const double *)((const u8 *)&lbl_0000BE80 + (off)))

// -----------------------------------------------------------------------------
// Shared Monkey Target globals.  These are DEFINED in item_pilot.c (main.dol);
// this REL references them, so they are extern here.  (lbl_80285A58 is a file
// static in item_pilot.c that this module aliases by absolute address.)
// Names/types mirror item_pilot.c exactly.
// -----------------------------------------------------------------------------
extern s16 lbl_802F1FF6;      // current minigame phase/state
extern s16 lbl_802F1FF4;      // pending phase request (-1 = none)
extern s16 lbl_802F1FEC;
extern s16 lbl_802F1FE4[4];
extern void (*lbl_802F1FD4)(void);
extern u32 lbl_802F1FD0;      // status bitfield
extern u32 lbl_80285A58[4];   // per-player score accumulator
extern u8 lbl_80285A68[0x18];
extern u8 lbl_80285A80[0x30];
// lbl_802F1BFC is declared in variables.h (struct Struct802F1BFC).
// lbl_802F1FF0 is declared in variables.h as s32.  The following three are
// file-static floats/s16 in item_pilot.c that this REL aliases by address
// (types mirror item_pilot.c: lbl_802F1FDC/lbl_802F1FD8 are float, FE0 is s16).
extern f32 lbl_802F1FDC;   // per-frame "boost/charge" countdown value
extern f32 lbl_802F1FD8;
extern s16 lbl_802F1FE0;

// -----------------------------------------------------------------------------
// INVENTED TYPE - UNVERIFIED.  The module .bss (section 6, base 0x10000000, size
// 0xC4) is one work struct.  Field names/offsets below are inferred only from
// the lifecycle functions that touch them; padding is a best guess to reach the
// 0xC4 total.  Treat the whole struct as provisional.
// -----------------------------------------------------------------------------
struct PilotWork
{
    u8 pad00[0x04];       // 0x00
    f32 unk4;             // 0x04 - float threshold read by pilot_func_6b94
    u32 unk8[4];          // 0x08 - working copy of unk44[]
    s16 unk18;            // 0x18 - mode/flag s16 (lbl_10000018)
    u8 pad1a[0x2C - 0x1A];// 0x1A
    s32 unk2c;            // 0x2C
    s32 unk30;            // 0x30
    u8 pad34[2];          // 0x34
    s16 unk36;            // 0x36
    void *unk38;          // 0x38 - heap alloc (0xA00C bytes)
    void *unk3c;          // 0x3C - heap alloc (0x1400C bytes)
    s16 unk40;            // 0x40 - current stage/mode index (0..2)
    u8 pad42[2];          // 0x42
    u32 unk44[4];         // 0x44
    s16 unk54[4];         // 0x54
    s16 unk5c[4];         // 0x5C
    s16 unk64;            // 0x64
    s16 unk66;            // 0x66
    u8 pad68[0xC4 - 0x68];// 0x68
};

struct PilotWork pilotWork;  // module .bss @ 0x10000000

// -----------------------------------------------------------------------------
// State-function jump table @ lbl_0000C748 (section-5 data, not transcribed).
// Declared extern so the dispatcher syntax-checks; real table is untranscribed.
// -----------------------------------------------------------------------------
extern void (*const lbl_0000C748[])(void);

// Prototypes not present in project headers.
int u_load_minigame_graphics(int index);
void mini_commend_free_data(void);
int item_create(struct Item *item);  // defined in item.c, undeclared in item.h

// INVENTED / UNVERIFIED.  One fixed item-spawn descriptor (0x10 bytes) from the
// untranscribed section-4 spawn tables.  Field layout is inferred from the
// access pattern in lbl_000007B8 (three floats + a terminating s16); the tables
// themselves (lbl_0000C88C, lbl_0000CB0C[]) are not transcribed.
struct PilotItemSpawn
{
    Vec pos;      // 0x00
    s16 subType;  // 0x0C  (-1 terminates the list)
    s16 pad0e;    // 0x0E
};
extern const struct PilotItemSpawn lbl_0000C88C[];
extern const struct PilotItemSpawn *const lbl_0000CB0C[];  // indexed by unk40

// -----------------------------------------------------------------------------
// Drafted functions.
// -----------------------------------------------------------------------------
static void pilot_init(void);          // lbl_000001F8
static void pilot_dest(void);          // lbl_000003B4
static void pilot_main(void);          // lbl_0000044C (main callback)
static void pilot_dispatch_state(void);// lbl_0000047C
static void pilot_reset_state(void);   // lbl_000004E0
static void pilot_load_graphics(void); // lbl_00000648
static void pilot_free_graphics(void); // lbl_0000066C
static void pilot_load_stage(void);    // lbl_00000698

// -----------------------------------------------------------------------------
// NOT yet drafted - forward declared so the drafted code above references them.
// Signatures inferred from call sites; bodies remain in asm/mini_pilot.s.
// -----------------------------------------------------------------------------
static void pilot_draw(void);                                  // lbl_00003B6C
static void pilot_ball_callback(struct Ball *ball);            // lbl_00004F68
static void pilot_camera_callback(struct Camera *cam, struct Ball *ball); // lbl_00006DFC
static void pilot_func_4024(void);                             // lbl_00004024 (-> lbl_802F1FD4)
static void pilot_ringbuf_init(void *buf, int size);           // lbl_0000AF68

// -----------------------------------------------------------------------------
// Batch 2 (this pass) - see report.  Drafted below in asm-offset order:
//   pilot_state_00      lbl_0000101C  state 0: end-of-turn score tally + round
//                                     advance, then re-dispatch in-frame.
//   pilot_state_02      lbl_00001538  state 2: post-load "ready" wait -> 3/9.
//   pilot_func_4024     lbl_00004024  per-ape ordering-table draw registration.
//   pilot_ball_callback lbl_00004F68  ball-state dispatcher via lbl_0000C7BC.
//   pilot_ballsub_0/1/2 lbl_00004FA8 / 5008 / 5044  ball sub-handlers.
//   pilot_ringbuf_init  lbl_0000AF68  smoke/trail particle ring-buffer reset.
// -----------------------------------------------------------------------------

// Ball sub-handler jump table @ lbl_0000C7BC (untranscribed rodata, 4 entries),
// indexed by ball->unk148 (0..3).  Declared extern like lbl_0000C748.
extern void (*const lbl_0000C7BC[])(struct Ball *ball);

// INVENTED / UNVERIFIED.  Ordering-table node built by pilot_func_4024; mirrors
// src/ball.c's BallDrawNode (0x10 bytes: next, drawFunc, lightGroup, ballId).
struct PilotBallDrawNode
{
    struct OrdTblNode node;  // 0x00 next, 0x04 drawFunc
    u32 lightGroup;          // 0x08
    u32 ballId;              // 0x0C
};

static void pilot_state_00(void);                 // lbl_0000101C
static void pilot_state_02(void);                 // lbl_00001538
static void pilot_ballsub_0(struct Ball *ball);   // lbl_00004FA8
static void pilot_ballsub_1(struct Ball *ball);   // lbl_00005008
static void pilot_ballsub_2(struct Ball *ball);   // lbl_00005044

// Internal helpers.  pilot_func_580c / pilot_func_6b94 are DRAFTED below (batch
// 3); the rest remain stubs whose bodies are still in asm/mini_pilot.s.
// Signatures inferred from call-site register setup only; UNVERIFIED.
static void pilot_func_6b94(void);                                          // lbl_00006B94 (drafted)
static void pilot_func_580c(struct Ball *b);                                // lbl_0000580C (drafted)
static void pilot_func_6124(struct Ball *b, struct PhysicsBall *pb, int f);  // lbl_00006124 (stub)
static void pilot_func_5824(struct Ball *b);                                // lbl_00005824 (stub)
static void pilot_func_6490(struct Ball *b, struct PhysicsBall *pb, int f);  // lbl_00006490 (stub)
static void pilot_func_669c(struct Ball *b, struct PhysicsBall *pb, int f);  // lbl_0000669C (stub)
static void pilot_func_40ec(struct PilotBallDrawNode *node);                // lbl_000040EC (stub)
static void pilot_func_bfc(void);                                           // lbl_00000BFC (stub)

// Batch 3 (this pass) - drafted below.
static void pilot_ballsub_3(struct Ball *ball);   // lbl_0000509C
static void pilot_spawn_items_fixed(void);        // lbl_000007B8
static int  pilot_func_6d14(void);                // lbl_00006D14

void _prolog(void)
{
    set_minigame_callbacks(pilot_main, pilot_draw, pilot_ball_callback,
                           pilot_camera_callback);
    puts(/* lbl_0000C7CC - actual string untranscribed */ "MONKEY TARGET LOADED\n");
    pilot_init();
}

void _epilog(void)
{
    pilot_dest();
    puts(/* lbl_0000C7EC - actual string untranscribed */ "MONKEY TARGET PURGED\n");
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
    OSPanic("mini_pilot.c", 288, "\n");
}

static void pilot_init(void)
{
    OSHeapHandle oldHeap;
    struct Ball *savedBall;
    struct Ball *ball;
    int i;

    event_finish_all();
    free_all_bitmap_groups_except_com();
    func_800249D4();
    unload_stage();
    SoundGroupLoad(0xE);

    oldHeap = OSSetCurrentHeap(stageHeap);
    bitmap_load_group(0xB);
    OSSetCurrentHeap(oldHeap);

    u_init_player_data_1();
    pilot_load_graphics();
    lbl_802F1FD4 = pilot_func_4024;

    for (i = 0; i < 4; i++)
    {
        float x = ((float *)&lbl_0000BE80)[0x30 / 4];
        float y = ((float *)&lbl_0000BE80)[0x34 / 4];
        setup_camera_viewport(i, x, x, y, y);
    }

    lbl_802F1FF4 = -1;
    lbl_802F1FF6 = 0;
    pilot_reset_state();
    camera_set_state_all(0x43);

    // For each active player ball, force state = 1 (uses currentBall as scratch).
    savedBall = currentBall;
    ball = ballInfo;
    for (i = 0; i < g_poolInfo.playerPool.count; i++)
    {
        if (g_poolInfo.playerPool.statusList[i] == STAT_NORMAL)
        {
            currentBall = ball;
            ball->state = 1;
        }
        ball = (struct Ball *)((u8 *)ball + 0x1A4);
    }
    currentBall = savedBall;

    start_screen_fade(0x100, 0, 0x1E);
    u_play_music(0x32, 0);
    gameSubmodeRequest = SMD_MINI_PILOT_MAIN;

    pilotWork.unk38 = OSAllocFromHeap(stageHeap, 0xA00C);
    pilotWork.unk3c = OSAllocFromHeap(stageHeap, 0x1400C);
    pilot_ringbuf_init(pilotWork.unk38, 0x400);
    pilot_ringbuf_init(pilotWork.unk3c, 0x800);
}

static void pilot_dest(void)
{
    event_finish_all();
    OSFreeToHeap(stageHeap, pilotWork.unk3c);
    OSFreeToHeap(stageHeap, pilotWork.unk38);
    if (lbl_802F1FD0 & 4)
    {
        mini_commend_free_data();
        lbl_802F1FD0 &= ~4u;
    }
    pilot_free_graphics();
    bitmap_free_group(0xB);
    SoundGroupFree();
    lbl_802F1FD0 = 0;
}

static void pilot_main(void)
{
    if (!(debugFlags & 0xA))
        pilot_dispatch_state();
}

static void pilot_dispatch_state(void)
{
    if (lbl_802F1FF4 != -1)
    {
        lbl_802F1FF6 = lbl_802F1FF4;
        lbl_802F1FF4 = -1;
    }
    lbl_0000C748[lbl_802F1FF6]();
}

static void pilot_reset_state(void)
{
    int i;
    int k;

    pilotWork.unk40 = 0;
    lbl_802F1FD0 = lbl_802F1BFC.unk4;

    // Per-player (4) reset.  In asm this is a 2-iteration loop handling two
    // players each; unrolled here to one player per iteration.
    for (i = 0; i < 4; i++)
    {
        pilotWork.unk8[i] = 0;
        pilotWork.unk44[i] = 0;
        lbl_80285A58[i] = 0;
        lbl_802F1FE4[i] = 0;
        pilotWork.unk54[i] = i;
        pilotWork.unk5c[i] = i;
        for (k = 0; k < 6; k++)
            ((s16 *)lbl_80285A80)[i * 6 + k] = 0;
        for (k = 0; k < 3; k++)
            ((s16 *)lbl_80285A68)[i * 3 + k] = 0;
    }

    lbl_802F1FEC = 0;
    pilotWork.unk2c = -1;
    pilotWork.unk30 = -1;
    pilotWork.unk64 = (s8)lbl_802F1BFC.unk0;
    pilotWork.unk66 = 1;
    pilot_load_stage();
}

static void pilot_load_graphics(void)
{
    u_load_minigame_graphics(3);
}

static void pilot_free_graphics(void)
{
    u_free_minigame_graphics();
    lbl_802F1FD4 = NULL;
}

static void pilot_load_stage(void)
{
    s16 *stageIds = (s16 *)&lbl_0000C740;  // untranscribed section-5 table
    int mode;

    event_finish_all();
    lbl_802F1FD0 &= 0x18;
    pauseMenuState.unk4 |= 2;
    fogInfo.enabled = 0;

    load_stage(stageIds[pilotWork.unk40]);

    mode = pilotWork.unk40;
    if (mode + 1 < 3)
        preload_stage_files(stageIds[mode + 1]);
    else
        preload_stage_files(stageIds[0]);

    // 0x734: seed per-player working arrays from the stage config.
    pilotWork.unk8[0] = pilotWork.unk44[0];
    lbl_80285A58[0] = 0;
    pilotWork.unk54[0] = pilotWork.unk5c[0];
    pilotWork.unk8[1] = pilotWork.unk44[1];
    lbl_80285A58[1] = 0;
    pilotWork.unk54[1] = pilotWork.unk5c[1];
    pilotWork.unk8[2] = pilotWork.unk44[2];
    lbl_80285A58[2] = 0;
    pilotWork.unk54[2] = pilotWork.unk5c[2];
    pilotWork.unk8[3] = pilotWork.unk44[3];
    lbl_80285A58[3] = 0;
    pilotWork.unk54[3] = pilotWork.unk5c[3];

    pilotWork.unk36 = 0;
    lbl_802F1FF4 = 1;
}

// -----------------------------------------------------------------------------
// Batch 2 - drafted this pass (offset order).  Structurally faithful to the asm
// and to siblings (src/ball.c ball_draw, src/mini_golf.c ball sub-handlers), but
// NOT byte-match verified.
// -----------------------------------------------------------------------------

/*
 * State 0 - lbl_0000101C.  Runs at the end of a player's turn: folds that
 * player's pending score (lbl_80285A58) into the running total (unk44), clears
 * the per-player tally tables, silences a few looping SFX, restarts the round
 * jingle, then - only for player 0 - either advances the stage/round counter or,
 * once all rounds are exhausted, jumps straight to the results state (0x17).
 * Otherwise it reloads the stage and re-runs the state dispatcher in-frame.
 */
static void pilot_state_00(void)
{
    int player = modeCtrl.currPlayer;
    int i;

    pilotWork.unk44[player] += lbl_80285A58[player];
    lbl_80285A58[player] = 0;
    lbl_802F1FEC = 0;
    for (i = 0; i < 6; i++)
        ((s16 *)lbl_80285A80)[player * 6 + i] = 0;
    for (i = 0; i < 3; i++)
        ((s16 *)lbl_80285A68)[player * 3 + i] = 0;

    SoundOffID(0xEF);
    SoundOffID(0xF9);
    SoundOffID(0xF3);
    u_play_music(0x64, 8);
    u_init_player_data_2();

    if (modeCtrl.currPlayer == 0)  // asm re-reads currPlayer here (after calls)
    {
        if (pilotWork.unk66 < pilotWork.unk64)
        {
            if (++pilotWork.unk40 >= 3)
                pilotWork.unk40 = 0;
            pilotWork.unk66++;
        }
        else
        {
            event_finish_all();
            lbl_802F1FF6 = 0x17;
            lbl_802F1FF4 = -1;
            lbl_0000C748[0x17]();
            return;
        }
    }

    pilot_load_stage();

    // Inlined dispatch tail (identical body to pilot_dispatch_state).
    if (lbl_802F1FF4 != -1)
    {
        lbl_802F1FF6 = lbl_802F1FF4;
        lbl_802F1FF4 = -1;
    }
    lbl_0000C748[lbl_802F1FF6]();
}

/*
 * State 2 - lbl_00001538.  "Ready" countdown after a stage loads.  Frame 0 parks
 * the current ball in its intro pose (state 0x17, sub-state 0, made visible with
 * gravity held); after 0x78 frames it transitions to state 3 (when the
 * lbl_802F1FD0 & 0x10 mode bit is set) or state 9 otherwise.
 */
static void pilot_state_02(void)
{
    struct Ball *ball = currentBall;
    s32 counter = lbl_802F1FF0;

    lbl_802F1FF0 = counter + 1;
    if (counter == 0)
    {
        ball->state = 0x17;
        ball->unk148 = 0;
        ball->flags &= ~BALL_FLAG_INVISIBLE;
        ball->ape->flags &= ~0x20u;
        ball->flags |= BALL_FLAG_14;
        return;
    }
    if (lbl_802F1FF0 < 0x78)
        return;
    if (lbl_802F1FD0 & 0x10)
        lbl_802F1FF4 = 3;
    else
        lbl_802F1FF4 = 9;
}

/*
 * lbl_00004024 - installed into lbl_802F1FD4 in pilot_init and called each frame
 * by the game main loop.  For every active ball whose sub-state is 2 or 3, builds
 * an ordering-table node whose draw callback is the ape shadow/model renderer
 * (pilot_func_40ec, still in asm).  Mirrors src/ball.c ball_draw()'s new-ball path.
 */
static void pilot_func_4024(void)
{
    struct Ball *ball = ballInfo;
    s8 *status = g_poolInfo.playerPool.statusList;
    int i;

    for (i = 0; i < g_poolInfo.playerPool.count; i++, ball++, status++)
    {
        struct PilotBallDrawNode *node;
        struct OrdTblNode *entry;

        if (*status == STAT_NULL || *status == STAT_FREEZE)
            continue;
        if (ball->unk148 != 2 && ball->unk148 != 3)
            continue;

        mathutil_mtxA_from_mtxB();
        entry = ord_tbl_get_entry_for_pos(&ball->pos);
        node = ord_tbl_alloc_node(sizeof(*node));
        node->node.drawFunc = (OrdTblDrawFunc)pilot_func_40ec;
        node->lightGroup = peek_light_group();
        node->ballId = i;
        ord_tbl_insert_node(entry, &node->node);
    }
}

/*
 * lbl_00004F68 - per-ball callback (installed via set_minigame_callbacks).
 * Dispatches on ball->unk148 through the 4-entry lbl_0000C7BC table, then runs
 * the shared post-update helper (pilot_func_6b94, still in asm).
 */
static void pilot_ball_callback(struct Ball *ball)
{
    lbl_0000C7BC[ball->unk148](ball);
    pilot_func_6b94();
}

// lbl_00004FA8 - ball sub-handler 0 (unk148 == 0): normal per-frame flight.
static void pilot_ballsub_0(struct Ball *ball)
{
    struct PhysicsBall physBall;

    pilot_func_6124(ball, &physBall, 0);
    handle_ball_rotational_kinematics(ball, &physBall, 0);
    update_ball_ape_transform(ball, &physBall, 0);
    ball->unk80++;
}

// lbl_00005008 - ball sub-handler 1 (unk148 == 1): one-shot that bumps the ball
// into sub-state 2 and immediately runs sub-handler 2.
static void pilot_ballsub_1(struct Ball *ball)
{
    pilot_func_580c(ball);
    ball->unk148 = 2;
    pilot_ballsub_2(ball);
}

// lbl_00005044 - ball sub-handler 2 (unk148 == 2): post-landing per-frame update.
static void pilot_ballsub_2(struct Ball *ball)
{
    struct PhysicsBall physBall;

    pilot_func_5824(ball);
    pilot_func_6490(ball, &physBall, 0);
    update_ball_ape_transform(ball, &physBall, 0);
    ball->unk80++;
}

/*
 * lbl_0000AF68 - resets a smoke/trail particle ring buffer (the 0xA00C / 0x1400C
 * allocations made in pilot_init).  Layout is INVENTED / UNVERIFIED:
 *   +0x00 s32 count, +0x04 s32 writeCursor, +0x08 f32, then `count` 0x28-byte
 *   particle records from +0x0C, each cleared at its +0x20 f32 field.
 * The stored constant is lbl_0000C690[0] == 0.0f.  Leaf function (no prologue).
 */
static void pilot_ringbuf_init(void *buf, int count)
{
    u32 *hdr = buf;
    u8 *entry = (u8 *)buf + 0x0C;
    int i;

    hdr[0] = (u32)count;
    hdr[1] = 0;
    ((f32 *)buf)[2] = 0.0f;
    for (i = 0; i < count; i++, entry += 0x28)
        *(f32 *)(entry + 0x20) = 0.0f;
}

// -----------------------------------------------------------------------------
// Batch 3 - drafted this pass (asm-offset order).  Structurally faithful to the
// asm and to siblings, but NOT byte-match verified.  Every config-blob literal
// is read through PILOT_CFG_* because the data section is untranscribed, so the
// exact constant VALUES are unknown - only the base+offset access is preserved.
// -----------------------------------------------------------------------------

/*
 * lbl_000007B8 - spawns the stage's fixed item set.  Clears a stack Item, walks
 * the shared descriptor list (lbl_0000C88C) then the per-stage list selected by
 * pilotWork.unk40 (lbl_0000CB0C[unk40]), item_create()-ing each, and finally
 * defers to lbl_00000BFC for the randomised set.  Every item uses type 5 and
 * animGroupId 0.  DRAFT-UNCERTAIN: the two spawn tables are untranscribed and
 * struct PilotItemSpawn is INVENTED from the access pattern only.
 */
static void pilot_spawn_items_fixed(void)
{
    struct Item item;
    const struct PilotItemSpawn *e;

    memset(&item, 0, sizeof(item));
    item.type = 5;

    for (e = lbl_0000C88C; e->subType != -1; e++)
    {
        item.pos = e->pos;
        item.subType = e->subType;
        item.animGroupId = 0;
        item_create(&item);
    }
    for (e = lbl_0000CB0C[pilotWork.unk40]; e->subType != -1; e++)
    {
        item.pos = e->pos;
        item.subType = e->subType;
        item.animGroupId = 0;
        item_create(&item);
    }
    pilot_func_bfc();
}

/*
 * lbl_0000509C - ball sub-handler 3 (unk148 == 3): settled per-frame update with
 * a "charge/boost" countdown.  While the shared charge value lbl_802F1FDC is
 * above the config threshold @0x1B0 it decays by config @0x2A0 (or @0x308 when
 * pilotWork.unk18 is set); once it reaches/passes the threshold it snaps back to
 * config float @0x30 and fires a one-shot SFX (0xF1) + rumble on that player's
 * pad.  Then runs the shared collision/rotation/transform update trio.
 */
static void pilot_ballsub_3(struct Ball *ball)
{
    struct PhysicsBall physBall;

    if (lbl_802F1FDC > PILOT_CFG_D(0x1B0))
    {
        if (pilotWork.unk18 == 0)
            lbl_802F1FDC = lbl_802F1FDC - PILOT_CFG_D(0x2A0);
        else
            lbl_802F1FDC = lbl_802F1FDC - PILOT_CFG_D(0x308);
    }
    if (lbl_802F1FDC <= PILOT_CFG_D(0x1B0))
    {
        lbl_802F1FDC = PILOT_CFG_F(0x30);
        u_play_sound_0(0xF1);
        vibration_control(playerControllerIDs[ball->playerId], VIBRATION_STATE_1,
                          0xA);
    }
    pilot_func_669c(ball, &physBall, 0);
    handle_ball_rotational_kinematics(ball, &physBall, 0);
    update_ball_ape_transform(ball, &physBall, 0);
    ball->unk80++;
}

/*
 * lbl_0000580C - resets the shared charge value lbl_802F1FDC to its config
 * default (config float @0x34).  Leaf; ignores its ball argument (the asm takes
 * no parameters).
 */
static void pilot_func_580c(struct Ball *ball)
{
    lbl_802F1FDC = PILOT_CFG_F(0x34);
}

/*
 * lbl_00006B94 - post-ball-update flag maintenance, run after every ball
 * sub-handler.  During phase 0xE, while the charge value (pilotWork.unk4) is
 * below config threshold @0x428 and unk18 is clear, sets lbl_802F1FD0 bit
 * 0x1000; otherwise clears it.
 */
static void pilot_func_6b94(void)
{
    if (lbl_802F1FF6 == 0xE && pilotWork.unk4 < PILOT_CFG_D(0x428) &&
        pilotWork.unk18 == 0)
    {
        lbl_802F1FD0 |= 0x1000;
        return;
    }
    lbl_802F1FD0 &= ~0x1000u;
}

/*
 * lbl_00006D14 - returns 1 if any active player is pressing A (PAD_BUTTON_A,
 * 0x100) this frame, else 0.  Fixed 4-player scan (unrolled in the asm; written
 * as a loop here).  Not wired to a call site in the drafted code yet.
 */
static int pilot_func_6d14(void)
{
    s8 *status = g_poolInfo.playerPool.statusList;
    int i;

    for (i = 0; i < 4; i++)
    {
        if (status[i] != 0 &&
            (controllerInfo[playerControllerIDs[i]].pressed.button & PAD_BUTTON_A))
            return 1;
    }
    return 0;
}
