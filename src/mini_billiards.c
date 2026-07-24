/*
 * mini_billiards.c  --  Monkey Billiards minigame REL module (mkbe.rel_mini_billiards.rel)
 *
 * UNVERIFIED STRUCTURAL FIRST DRAFT.
 *   - This repo cannot build (no CodeWarrior / baserom), so NOTHING here is byte-match
 *     verified.  The code below only syntax-checks and structurally follows its templates
 *     (src/mini_bowling.c and src/mini_pilot.c for the REL skeleton; src/game.c / src/mini.c
 *     / src/ball.c for behaviour).  Billiards is physically analogous to bowling, but its
 *     module is MUCH larger (asm/mini_billiards.s is ~36k lines) and its main loop and camera
 *     callback are large state machines that are NOT transcribed here.
 *   - Every struct type invented for this module is flagged "INVENTED / UNVERIFIED".
 *   - Only a first cohesive lifecycle batch is drafted (init, dest, the main-callback wrapper,
 *     the pause-apply/light-setup/record-clear helpers).  The big gameplay state machines,
 *     the draw callback and the camera callback are forward-declared stubs -- see the
 *     "REMAINING" note near the bottom for their asm offset ranges.
 *
 * asm source: asm/mini_billiards.s
 *   section .text  spans 0x000000C8 .. ~0x0001C1E4
 *   section .rodata (config blob, base lbl_0001C2B8) size 0x4AE4
 *   section .data   (base lbl_00020DA0) size 0x081D
 *   section .bss    (work area, base lbl_10000000) size 0xB43C
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
#include "input.h"
#include "light.h"
#include "mathutil.h"
#include "mode.h"
#include "pause_menu.h"
#include "pool.h"
#include "recplay.h"
#include "sound.h"
#include "sprite.h"
#include "stage.h"
#include "thread.h"
#include "variables.h"
#include "window.h"
#include "world.h"

/* ------------------------------------------------------------------------- *
 *  Alignment anchors (PRESERVED verbatim from the original stub).            *
 *    lbl_0001C2B8 - first word of the module .rodata config blob (the first  *
 *                   float is 0xBF800000 = -1.0f).  CFG_F32() reads floats out *
 *                   of the (un-transcribed) blob by byte offset.             *
 *    lbl_00020DA0 - first word of the module .data section (a scratch Vec is  *
 *                   written to its first 3 floats during init).              *
 * ------------------------------------------------------------------------- */
const u32 lbl_0001C2B8 = 0xBF800000;
u32 lbl_00020DA0[] = {0};

// Read a config float out of the (un-transcribed) .rodata blob by byte offset.
// UNVERIFIED: only the offsets are known, not the actual float values.
#define CFG_F32(off) (*(const f32 *)((const u8 *)&lbl_0001C2B8 + (off)))

// Same, but for the 8-byte double literals stored inline in the config blob
// (billiards_place_balls mixes single- and double-precision config reads).
#define CFG_F64(off) (*(const f64 *)((const u8 *)&lbl_0001C2B8 + (off)))

// Module helper that lives in src/mini.c but is not declared in any header
// (same situation as mini_bowling.c / mini_pilot.c).  Signature inferred -- UNVERIFIED.
void u_load_minigame_graphics(int group);

// A struct Light template that lives in the module .data section (lbl_00020F70),
// used to seed the background light pool.  Left extern -- data not transcribed.
// INVENTED reference / UNVERIFIED.
extern struct Light lbl_00020F70;

/* ------------------------------------------------------------------------- *
 *  INVENTED TYPE  (all UNVERIFIED -- field names/offsets are best guesses).  *
 *  The module .bss (base 0x10000000, real size 0xB43C) is one big work area.  *
 *  Only the low scalar fields the drafted functions touch are named; the huge *
 *  tail (path-node tables, per-record arrays, per-ball state, control bytes)  *
 *  is left as an opaque byte blob and accessed by raw offset where needed.    *
 * ------------------------------------------------------------------------- */
struct BilliardsWork
{
    /*0x000*/ u8 pad00[0x04];
    /*0x004*/ s8 unk4;
    /*0x005*/ u8 pad05[0x0A - 0x05];
    /*0x00A*/ s8 unkA;    // current sub-state mirror (dispatched on in the main body)
    /*0x00B*/ s8 unkB;    // previous sub-state
    /*0x00C*/ s8 unkC;    // set to 3 on un-pause
    /*0x00D*/ s8 unkD;
    /*0x00E*/ u8 pad0E[0x10 - 0x0E];
    /*0x010*/ s8 unk10;
    /*0x011*/ s8 unk11;
    /*0x012*/ s8 unk12;
    /*0x013*/ s8 unk13;   // small counter eased toward 0 each frame
    /*0x014*/ s8 unk14;
    /*0x015*/ s8 unk15;
    /*0x016*/ u8 pad16[0x1F - 0x16];
    /*0x01F*/ s8 unk1F;   // cleared at the top of each main frame
    /*0x020*/ s32 unk20;
    /*0x024*/ s32 unk24;  // frame / retry counter (incremented in the main body)
    /*0x028*/ u8 pad28[0x49 - 0x28];
    /*0x049*/ s8 unk49;
    /*0x04A*/ s16 unk4A;
    /*0x04C*/ s16 unk4C;
    /*0x04E*/ s16 unk4E;
    /*0x050*/ f32 unk50;
    /*0x054*/ u8 pad54[0x60 - 0x54];
    /*0x060*/ s8 unk60;
    /*0x061*/ u8 pad61[0x64 - 0x61];
    /*0x064*/ s32 threadNo[16];            // 0x64..0xA3: ape animation thread handles
    /*0x0A4*/ u8 rest[0xB43C - 0xA4];      // path-node tables, records, per-ball state, etc.
};

// One 0x68-byte per-ball placement record.  The 10-entry array lives at
// billiardsWork+0x9878.  Only used as an opaque copy-unit for the shuffle in
// billiards_place_balls (mwcc copies it in 8-byte chunks) -- fields are poked
// by raw offset elsewhere.  INVENTED / UNVERIFIED.
struct BilliardsBall
{
    u8 raw[0x68];
};

// Module .bss work area (lbl_10000000).
static struct BilliardsWork billiardsWork;

/* ------------------------------------------------------------------------- *
 *  Forward declarations                                                     *
 * ------------------------------------------------------------------------- */

// Drafted in this file:
static void billiards_init(void);            // lbl_000001E0
static void billiards_dest(void);            // lbl_00009E34  (_epilog)
static void billiards_main(void);            // lbl_00000F34  (main callback)
static void billiards_pause_apply(void);     // lbl_00009F0C
static void billiards_setup_lights(void);    // lbl_00009EC4
static void billiards_clear_records(void);   // lbl_00000754

// Called-but-not-yet-decompiled functions (forward declared so the file compiles).
// Signatures inferred from call sites -- UNVERIFIED.
static void billiards_main_body(void);                                  // lbl_00000F5C
static void billiards_pause_input(void);                                // lbl_00009F3C
static void billiards_draw(void);                                       // lbl_0000E8D0 (draw cb)
static void billiards_camera_callback(struct Camera *cam, struct Ball *ball); // lbl_0000C85C
static void billiards_init_records_a(void);                             // lbl_00000614
static void billiards_place_balls(void);                                // lbl_00000800
static void billiards_init_misc(void);                                  // lbl_00007C74

// Drafted below in this pass (bodies added after billiards_clear_records):
//   billiards_init_records_a, billiards_place_balls, billiards_init_misc,
//   billiards_pause_input, and the input-pointer helper billiards_setup_input_ptr.
static void billiards_setup_input_ptr(void);    // lbl_00000E68
static void billiards_clear_record_sub(u8 *p);  // one 0xC-byte bitfield sub-record

// Still-opaque module-internal helpers (forward-declared so the calls compile).
// Signatures inferred from call sites -- UNVERIFIED.
static void lbl_00016D9C(int a, int b);         // per-record init, called 10x by records-A init
static void lbl_0001968C(void);                 // demo/replay input setup (from setup_input_ptr)

/* ------------------------------------------------------------------------- *
 *  REL skeleton  (template: src/mini_pilot.c -- 4-arg set_minigame_callbacks) *
 * ------------------------------------------------------------------------- */

void _prolog(void)
{
    // ballCb = NULL for billiards (physics handled elsewhere); camera cb is set.
    set_minigame_callbacks(billiards_main, billiards_draw, NULL,
                           billiards_camera_callback);
    billiards_init();
    gameSubmodeRequest = SMD_MINI_BILLIARDS_MAIN;
}

void _epilog(void)
{
    billiards_dest();
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
    OSPanic("mini_billiards.c", 171, "\n");
}

/* ------------------------------------------------------------------------- *
 *  Init  (lbl_000001E0, 0x000001E0 .. 0x00000610)                          *
 *  DRAFT-UNCERTAIN: deep struct / camera / config-table setup.  Config floats *
 *  are read from the un-transcribed .rodata blob via CFG_F32().  The config-  *
 *  copy loop (asm @0x448) and the several raw-offset camera writes are LITERAL *
 *  transcriptions of the unrolled asm and are flagged unverified.            *
 * ------------------------------------------------------------------------- */

static void billiards_init(void)
{
    OSHeapHandle oldHeap;
    struct Camera *cam;
    s8 *status;
    struct World *world;
    struct Ball *ball;
    int i;

    load_stage(0xB4);

    // Reset the ape-animation thread handle table.
    for (i = 0; i < 16; i++)
        billiardsWork.threadNo[i] = -1;

    event_finish_all();
    free_all_bitmap_groups_except_com();
    func_800249D4();

    oldHeap = OSSetCurrentHeap(stageHeap);
    SoundGroupLoad(9);
    OSSetCurrentHeap(oldHeap);

    call_bitmap_load_group(8);

    oldHeap = OSSetCurrentHeap(stageHeap);
    u_load_minigame_graphics(6);
    OSSetCurrentHeap(oldHeap);

    event_start(EVENT_SPRITE);      // 0x10
    event_start(EVENT_SOUND);       // 0x12
    event_start(EVENT_BACKGROUND);  // 0x13
    event_start(EVENT_VIBRATION);   // 0x0B

    // light.h prototypes light_init() with no params, but the asm passes currStageId.
    ((void (*)(int))light_init)(currStageId);

    // Flag the worlds owned by active players.
    status = g_poolInfo.playerPool.statusList;
    world = worldInfo;
    for (i = 0; i < g_poolInfo.playerPool.count; i++, world++, status++)
    {
        if (*status == STAT_NORMAL)
            world->state = 1;
    }

    camera_set_state_all(0);
    recplay_init_first();
    ((void (*)(int))light_init)(currStageId);

    // Set up the (up to 4) split-screen camera viewports.
    for (i = 0; i < 4; i++)
        setup_camera_viewport(i, CFG_F32(0x8b4), CFG_F32(0x8b4),
                              CFG_F32(0x8b8), CFG_F32(0x8b8));

    start_screen_fade(0x100, 0, 0x3C);
    submodeFinishFunc = NULL;
    gameSubmodeRequest = SMD_MINI_BILLIARDS_MAIN;
    u_play_music(0x34, 0);
    event_start(EVENT_CAMERA);      // 0x0F

    camera_set_state_all(0x41);

    // Camera detail setup (raw offsets 0x2A2/0x2A8/0x2AA are into a second camera
    // view of the same struct -- LITERAL transcription, field semantics UNVERIFIED).
    cam = currentCamera;
    *((s8 *)cam + 0x2a2) = 0x42;

    billiardsWork.unk4A = -16384;   // 0xC000
    billiardsWork.unk4C = 0;
    billiardsWork.unk4E = 0;
    billiardsWork.unk50 = CFG_F32(0x8bc);

    ((f32 *)lbl_00020DA0)[0] = CFG_F32(0x8b4);
    ((f32 *)lbl_00020DA0)[1] = CFG_F32(0x8b4);
    ((f32 *)lbl_00020DA0)[2] = CFG_F32(0x8b4);

    billiardsWork.unk49 = 0;

    cam = currentCamera;
    cam->unk26 = 0x42;
    cam->flags |= 0x10;
    *((s8 *)cam + 0x2aa) = 0x42;
    *(s16 *)((u8 *)cam + 0x2a8) |= 0x10;

    // Config-copy: expand path/spline config records from the .rodata blob into
    // the work "path node" table at work+0xA4.  LITERAL structural transcription
    // of the unrolled asm loop @0x448 (record layout inferred) -- UNVERIFIED.
    {
        const u8 *src = (const u8 *)&lbl_0001C2B8;
        u8 *dst = (u8 *)&billiardsWork + 0xA4;
        int n;

        for (n = 0; n < 26; n++)
        {
            *(f32 *)(dst + 0x00) = *(const f32 *)(src + 0x00);
            *(f32 *)(dst + 0x04) = *(const f32 *)(src + 0x04);
            *(f32 *)(dst + 0x08) = *(const f32 *)(src + 0x08);
            *(f32 *)(dst + 0x0c) = *(const f32 *)(src + 0x0c);
            *(f32 *)(dst + 0x10) = CFG_F32(0x8b4);
            *(f32 *)(dst + 0x14) = CFG_F32(0x8b8);
            *(f32 *)(dst + 0x18) = CFG_F32(0x8b4);
            *(f32 *)(dst + 0x1c) = CFG_F32(0x8c0);
            *(f32 *)(dst + 0x20) = *(const f32 *)(src + 0x10);
            *(f32 *)(dst + 0x24) = *(const f32 *)(src + 0x14);
            *(f32 *)(dst + 0x28) = *(const f32 *)(src + 0x18);
            *(f32 *)(dst + 0x2c) = *(const f32 *)(src + 0x1c);
            *(f32 *)(dst + 0x30) = *(const f32 *)(src + 0x28);
            *(f32 *)(dst + 0x34) = *(const f32 *)(src + 0x2c);
            *(f32 *)(dst + 0x38) = *(const f32 *)(src + 0x30);
            *(f32 *)(dst + 0x3c) = *(const f32 *)(src + 0x34);
            src += 0x28;
            *(f32 *)(dst + 0x40) = CFG_F32(0x8b4);
            *(f32 *)(dst + 0x44) = CFG_F32(0x8b8);
            dst += 0x30;
            *(f32 *)(dst + 0x18) = CFG_F32(0x8b4);
            *(f32 *)(dst + 0x1c) = CFG_F32(0x8c0);
            *(f32 *)(dst + 0x20) = *(const f32 *)(src + 0x10);
            *(f32 *)(dst + 0x24) = *(const f32 *)(src + 0x14);
            *(f32 *)(dst + 0x28) = *(const f32 *)(src + 0x18);
            *(f32 *)(dst + 0x2c) = *(const f32 *)(src + 0x1c);
            src += 0x28;
            dst += 0x30;
        }
    }

    // Init the four player balls and clear their flags.
    ball = ballInfo;
    for (i = 0; i < 4; i++, ball++)
    {
        u_ball_init_2(ball);
        ball->flags = 0;
    }

    billiards_place_balls();
    billiardsWork.unk60 = 0;
    billiards_init_records_a();
    billiards_clear_records();

    billiardsWork.unk10 = 0;
    billiardsWork.unk20 = 0;
    billiardsWork.unkB = billiardsWork.unkA;

    // DIP-switch controlled "auto play" latch (raw halfword read of controllerInfo[0]).
    if ((dipSwitches & 1) && (controllerInfo[0].held.button & 0x10))
        billiardsWork.unkA = 1;
    else
        billiardsWork.unkA = 0;

    billiardsWork.unkC = 1;
    billiardsWork.unkD = 1;

    // Control-byte block at work+0xA64 (raw offsets -- UNVERIFIED field semantics).
    *((s8 *)&billiardsWork + 0xa64) = 0;
    *((s8 *)&billiardsWork + 0xa66) = 0;
    *(s16 *)((u8 *)&billiardsWork + 0xa68) = 0;
    *((s8 *)&billiardsWork + 0xa67) = 1;
    *((s8 *)&billiardsWork + 0xa6a) = 1;
    *((s8 *)&billiardsWork + 0xa6c) = 0;
    *(s16 *)((u8 *)&billiardsWork + 0xa6e) = 0;
    *((s8 *)&billiardsWork + 0xa6d) = 1;

    lbl_802F1C32 = 0;

    billiardsWork.unk11 = 0;
    billiardsWork.unk4 = 0;
    billiardsWork.unk12 = 0;
    billiardsWork.unk13 = 0;
    billiardsWork.unk14 = 0;
    billiardsWork.unk15 = 0;
    billiardsWork.unk24 = 0;

    billiards_init_misc();
}

/* ------------------------------------------------------------------------- *
 *  Dest  (lbl_00009E34, 0x00009E34 .. 0x00009EC0)  -- called from _epilog    *
 * ------------------------------------------------------------------------- */

static void billiards_dest(void)
{
    OSHeapHandle oldHeap;
    int i;

    u_clear_buffers_2_and_5();
    oldHeap = OSSetCurrentHeap(stageHeap);
    u_free_minigame_graphics();
    SoundGroupFree();
    OSSetCurrentHeap(oldHeap);

    for (i = 15; i >= 0; i--)
    {
        if (billiardsWork.threadNo[i] != -1)
        {
            thread_kill(billiardsWork.threadNo[i]);
            billiardsWork.threadNo[i] = -1;
        }
    }
}

/* ------------------------------------------------------------------------- *
 *  Main callback  (lbl_00000F34, 0x00000F34 .. 0x00000F58)                  *
 *  Thin wrapper: apply-pause -> main body -> pause input handling.           *
 * ------------------------------------------------------------------------- */

static void billiards_main(void)
{
    billiards_pause_apply();
    billiards_main_body();
    billiards_pause_input();
}

/* ------------------------------------------------------------------------- *
 *  Pause apply  (lbl_00009F0C, 0x00009F0C .. 0x00009F38)                    *
 *  If the pause menu requested a resume (bit 0x20), clear it and poke the     *
 *  work sub-state control byte at 0x0C.                                       *
 * ------------------------------------------------------------------------- */

static void billiards_pause_apply(void)
{
    if (!(pauseMenuState.unk4 & 0x20))
        return;
    pauseMenuState.unk4 &= ~0x20u;
    billiardsWork.unkC = 3;
}

/* ------------------------------------------------------------------------- *
 *  Light / ambient setup  (lbl_00009EC4, 0x00009EC4 .. 0x00009F08)          *
 *  Seeds the background light pool from the module data template and sets the *
 *  background ambient color from config floats.                              *
 * ------------------------------------------------------------------------- */

static void billiards_setup_lights(void)
{
    add_light_to_pool(&lbl_00020F70);
    set_bg_ambient(CFG_F32(0x9a4), CFG_F32(0x9a4), CFG_F32(0xb58));
}

/* ------------------------------------------------------------------------- *
 *  Clear per-slot records  (lbl_00000754, 0x00000754 .. 0x000007FC)         *
 *  Clears the 5-entry, 0x48-byte-stride record array at work+0x9710.          *
 *  LITERAL transcription of the unrolled clear (record layout UNVERIFIED).    *
 * ------------------------------------------------------------------------- */

static void billiards_clear_records(void)
{
    int i;

    for (i = 0; i < 5; i++)
    {
        u8 *rec = (u8 *)&billiardsWork + 0x9710 + i * 0x48;

        *(s8 *)(rec + 0x00) = -1;
        *(s8 *)(rec + 0x01) = 0;
        *(s16 *)(rec + 0x08) = 0;
        *(s16 *)(rec + 0x0a) = 0;
        *(s16 *)(rec + 0x0c) = 0;
        *(s16 *)(rec + 0x0e) = 0;
        *(s16 *)(rec + 0x10) = 0;
        *(s16 *)(rec + 0x12) = 0;
        *(s16 *)(rec + 0x14) = 0;
        *(s16 *)(rec + 0x18) = 0;
        *(s16 *)(rec + 0x16) = 0;
        *(s8 *)(rec + 0x02) = 0;
        *(s8 *)(rec + 0x04) = 0;
        *(s8 *)(rec + 0x03) = 0;
        *(s32 *)(rec + 0x1c) = 0;
        *(s32 *)(rec + 0x20) = 0;
        *(s16 *)(rec + 0x06) = 0;
        *(s8 *)(rec + 0x24) = -1;
        *(s8 *)(rec + 0x25) = 0;
        *(s16 *)(rec + 0x2c) = 0;
        *(s16 *)(rec + 0x2e) = 0;
        *(s16 *)(rec + 0x30) = 0;
        *(s16 *)(rec + 0x32) = 0;
        *(s16 *)(rec + 0x34) = 0;
        *(s16 *)(rec + 0x36) = 0;
        *(s16 *)(rec + 0x38) = 0;
        *(s16 *)(rec + 0x3c) = 0;
        *(s16 *)(rec + 0x3a) = 0;
        *(s8 *)(rec + 0x26) = 0;
        *(s8 *)(rec + 0x28) = 0;
        *(s8 *)(rec + 0x27) = 0;
        *(s32 *)(rec + 0x40) = 0;
        *(s32 *)(rec + 0x44) = 0;
        *(s16 *)(rec + 0x2a) = 0;
    }
}

/* ------------------------------------------------------------------------- *
 *  One 0xC-byte bitfield sub-record clear  (helper for records-A init)       *
 *  LITERAL transcription of the compiler-generated bitfield initialisation   *
 *  at lbl_00000634: every rlwimi masks a small field, inserting 0 except two *
 *  4-bit fields that are set to 15.  The exact bit masks below reproduce the  *
 *  asm read-modify-writes in order; the underlying bitfield struct layout is  *
 *  UNKNOWN, so this is kept as raw masked stores.  UNVERIFIED.                *
 * ------------------------------------------------------------------------- */

static void billiards_clear_record_sub(u8 *p)
{
    *(u16 *)(p + 0x0) &= 0x001F;                                  // rlwimi 5,16,26  v=0
    *(u16 *)(p + 0x8) &= (u16)~0x0FE0;                            // rlwimi 5,20,26  v=0
    *(u32 *)(p + 0x8) &= ~0x001FC000u;                           // rlwimi 14,11,17 v=0
    *(u16 *)(p + 0xa) &= (u16)~0x3F80;                           // rlwimi 7,18,24  v=0
    *(u8  *)(p + 0x3) &= (u8)~0x04;                               // rlwimi 2,29,29  v=0
    *(u8  *)(p + 0x5) = (u8)((*(u8 *)(p + 0x5) & (u8)~0x1E) | 0x1E); // rlwimi 1,27,30 v=15
    *(u16 *)(p + 0x2) &= (u16)~0x7FF8;                           // rlwimi 3,17,28  v=0
    *(u8  *)(p + 0x8) = (u8)((*(u8 *)(p + 0x8) & (u8)~0xF0) | 0xF0); // rlwimi 4,24,27 v=15
    *(u16 *)(p + 0x4) &= 0x001F;                                 // rlwimi 5,16,26  v=0
}

/* ------------------------------------------------------------------------- *
 *  Records-A init  (lbl_00000614, 0x00000614 .. 0x00000750)                 *
 *  Clears the 1500-entry, 0x18-byte-stride bitfield record array at          *
 *  work+0xA70 (each entry is two identical 0xC-byte sub-records), then calls  *
 *  the per-record init helper 10x and zeroes the work halfword at +0.         *
 *  DRAFT-UNCERTAIN: bitfield layout is a literal transcription (see helper).  *
 * ------------------------------------------------------------------------- */

static void billiards_init_records_a(void)
{
    u8 *rec = (u8 *)&billiardsWork + 0xA70;
    int i;

    for (i = 0; i < 1500; i++, rec += 0x18)
    {
        billiards_clear_record_sub(rec);
        billiards_clear_record_sub(rec + 0xC);
    }

    for (i = 0; i < 10; i++)
        lbl_00016D9C(i, 0);

    *(s16 *)&billiardsWork = 0;
}

/* ------------------------------------------------------------------------- *
 *  Ball placement (rand)  (lbl_00000800, 0x00000800 .. 0x00000E64)          *
 *  Places the 10 object balls at collision-free random positions in the      *
 *  config-defined rectangle (rejection sampling: retry while any pair is      *
 *  closer than CFG_F32(0x8b8)), copies the cue ball over entry 0, derives a   *
 *  fixed table of aim/pocket vectors, recomputes each ball's local offset     *
 *  vector, then shuffles balls 2..8 100 times and picks the input source.     *
 *  DRAFT-UNCERTAIN: the (f32)rand() magic-double idiom and the 0x8b4/0x8b8/…  *
 *  config reads are transcribed literally; the derived-vector block at        *
 *  work+0x98F0.. is a raw-offset transcription with UNKNOWN field semantics.  *
 * ------------------------------------------------------------------------- */

static void billiards_place_balls(void)
{
    u8 *const w = (u8 *)&billiardsWork;
    u8 *const arrBase = w + 0x9878;            // 10-entry, 0x68-stride ball array
    Vec axis;
    int i;
    int j;

    axis.x = CFG_F32(0x8c4);
    axis.y = CFG_F32(0x8c8);
    axis.z = CFG_F32(0x8cc);

    for (i = 0; i < 10; i++)
    {
        u8 *e = arrBase + i * 0x68;
        int collided;

        *(s8 *)(e + 0x00) = 1;
        *(f32 *)(e + 0x08) = CFG_F32(0x8b4);
        *(f32 *)(e + 0x0c) = CFG_F32(0x8b4);
        *(s8 *)(e + 0x02) = 0;
        *(s8 *)(e + 0x04) = -1;
        *(s8 *)(e + 0x05) = -1;
        *(s8 *)(e + 0x06) = -1;
        *(s8 *)(e + 0x03) = 0;

        do
        {
            collided = 0;

            *(f32 *)(e + 0x10) =
                CFG_F32(0x8d0) * (CFG_F32(0x8d4) * ((f32)rand() / CFG_F32(0x8d8)))
                - CFG_F32(0x8dc) - CFG_F32(0x8c0);
            *(f32 *)(e + 0x14) = CFG_F32(0x8c0);

            *(f32 *)(e + 0x18) =
                CFG_F32(0x8d0) * (CFG_F32(0x8e0) * ((f32)rand() / CFG_F32(0x8d8)))
                - CFG_F32(0x8e4) - CFG_F32(0x8c0);

            for (j = 0; j < i; j++)
            {
                u8 *p = arrBase + j * 0x68;
                f32 dz = *(f32 *)(e + 0x18) - *(f32 *)(p + 0x18);
                f32 dx = *(f32 *)(e + 0x10) - *(f32 *)(p + 0x10);
                if (dx * dx + dz * dz < CFG_F32(0x8b8))
                {
                    collided = 1;
                    break;
                }
            }
        } while ((s8)collided == 1);

        *(f32 *)(e + 0x1c) = *(f32 *)(e + 0x10);
        *(f32 *)(e + 0x20) = *(f32 *)(e + 0x14);
        *(f32 *)(e + 0x24) = *(f32 *)(e + 0x18);
        *(f32 *)(e + 0x34) = CFG_F32(0x8b4);
        *(f32 *)(e + 0x38) = CFG_F32(0x8b4);
        *(f32 *)(e + 0x3c) = CFG_F32(0x8b4);
        mathutil_quat_from_axis_angle((Quaternion *)(e + 0x44), &axis, 0);
        mathutil_quat_from_axis_angle((Quaternion *)(e + 0x54), &axis, 0);
    }

    // Cue ball: override entry 0 with fixed config placement.
    *(f32 *)(arrBase + 0x34) = CFG_F32(0x8e8);
    *(f32 *)(arrBase + 0x3c) = CFG_F32(0x8b4);
    mathutil_quat_from_axis_angle((Quaternion *)(arrBase + 0x54), &axis, 0);
    *(f32 *)(arrBase + 0x10) = CFG_F32(0x8ec);
    *(f32 *)(arrBase + 0x18) = CFG_F32(0x8b4);

    // Derived aim/pocket vector table (raw-offset literal transcription).
    {
        f32 aim = CFG_F32(0x908) * ((f32)rand() / CFG_F32(0x8d8)) + CFG_F32(0x90c);

        *(f32 *)(w + 0x98F0) = (f32)(CFG_F64(0x8f0)
            + CFG_F32(0x8f8) * ((f32)rand() / CFG_F32(0x8d8)) - CFG_F64(0x900));
        *(f32 *)(w + 0x98F8) =
            CFG_F32(0x8f8) * ((f32)rand() / CFG_F32(0x8d8)) - CFG_F32(0x908);

        *(f32 *)(w + 0x9B00) = *(f32 *)(w + 0x98F8) + CFG_F32(0x910) * aim;
        *(f32 *)(w + 0x9AF8) = *(f32 *)(w + 0x98F0) + CFG_F32(0x914) * aim;
        *(f32 *)(w + 0x9A98) = *(f32 *)(w + 0x98F8) - CFG_F32(0x910) * aim;
        *(f32 *)(w + 0x9A90) = *(f32 *)(w + 0x98F0) + CFG_F32(0x914) * aim;
        *(f32 *)(w + 0x9A30) = *(f32 *)(w + 0x9B00) + CFG_F32(0x910) * aim;
        *(f32 *)(w + 0x9A28) = *(f32 *)(w + 0x9AF8) + CFG_F32(0x914) * aim;
        *(f32 *)(w + 0x9C38) = *(f32 *)(w + 0x9B00) - CFG_F32(0x910) * aim;
        *(f32 *)(w + 0x9C30) = *(f32 *)(w + 0x9AF8) + CFG_F32(0x914) * aim;
        *(f32 *)(w + 0x9960) = *(f32 *)(w + 0x9A98) - CFG_F32(0x910) * aim;
        *(f32 *)(w + 0x9958) = *(f32 *)(w + 0x9A90) + CFG_F32(0x914) * aim;
        *(f32 *)(w + 0x9BD0) = *(f32 *)(w + 0x9A30) - CFG_F32(0x910) * aim;
        *(f32 *)(w + 0x9BC8) = *(f32 *)(w + 0x9A28) + CFG_F32(0x914) * aim;
        *(f32 *)(w + 0x9B68) = *(f32 *)(w + 0x9C38) - CFG_F32(0x910) * aim;
        *(f32 *)(w + 0x9B60) = *(f32 *)(w + 0x9C30) + CFG_F32(0x914) * aim;
        *(f32 *)(w + 0x99C8) = *(f32 *)(w + 0x9BD0) - CFG_F32(0x910) * aim;
        *(f32 *)(w + 0x99C0) = *(f32 *)(w + 0x9BC8) + CFG_F32(0x914) * aim;
    }

    // Recompute each ball's local offset vector (pos - anchor).
    for (i = 0; i < 10; i++)
    {
        u8 *e = arrBase + i * 0x68;
        *(f32 *)(e + 0x1c) = *(f32 *)(e + 0x10) - *(f32 *)(e + 0x34);
        *(f32 *)(e + 0x20) = *(f32 *)(e + 0x14) - *(f32 *)(e + 0x38);
        *(f32 *)(e + 0x24) = *(f32 *)(e + 0x18) - *(f32 *)(e + 0x3c);
    }

    *(s32 *)(w + 0x28) = 0;
    *(s32 *)(w + 0x30) = 0;

    // Shuffle balls 2..8 by swapping random pairs 100 times.
    {
        struct BilliardsBall *ball = (struct BilliardsBall *)arrBase;
        int k;

        for (k = 0; k < 100; k++)
        {
            int a = (rand() & 0x7fff) % 7 + 2;
            int b = (rand() & 0x7fff) % 7 + 2;
            struct BilliardsBall tmp;

            tmp = ball[a];
            ball[a] = ball[b];
            ball[b] = tmp;
        }
    }

    *(s16 *)(w + 0x1a) = 0;
    *(s16 *)(w + 0x1c) = 0;
    *(s8 *)(w + 0x48) = 1;

    billiards_setup_input_ptr();
}

/* ------------------------------------------------------------------------- *
 *  Input-pointer setup  (lbl_00000E68, 0x00000E68 .. 0x00000F30)            *
 *  Stores the ControllerInfo* the active player reads this frame into        *
 *  work+0x9C88.  In state 0x19 (or demo/replay mode) it substitutes the      *
 *  other pad / a synthesised controller at work+0x9C8C.                      *
 * ------------------------------------------------------------------------- */

static void billiards_setup_input_ptr(void)
{
    int idx = lbl_802F1C32;
    s8 *slot = (s8 *)&billiardsWork + idx * 6;
    struct ControllerInfo **dst =
        (struct ControllerInfo **)((u8 *)&billiardsWork + 0x9C88);

    if (slot[0xa66] != 0)
    {
        if (billiardsWork.unkA == 0x19)
        {
            *dst = &controllerInfo[playerControllerIDs[1 - idx]];
        }
        else
        {
            lbl_0001968C();
            *dst = (struct ControllerInfo *)((u8 *)&billiardsWork + 0x9C8C);
        }
    }
    else
    {
        *dst = &controllerInfo[playerControllerIDs[idx]];
    }
}

/* ------------------------------------------------------------------------- *
 *  Late/misc init  (lbl_00007C74, 0x00007C74 .. 0x00007D14)                 *
 *  Clears a 4-entry, 0x100-byte-stride table at work+0xA5BC; each entry is    *
 *  16 sub-records of 0x10 bytes (s16 at +0 set to -1, s32 at +0xC set to 0).  *
 * ------------------------------------------------------------------------- */

static void billiards_init_misc(void)
{
    u8 *p = (u8 *)&billiardsWork + 0xA5BC;
    int i;
    int j;

    for (i = 0; i < 4; i++, p += 0x100)
    {
        for (j = 0; j < 16; j++)
        {
            *(s16 *)(p + j * 0x10 + 0x0) = -1;
            *(s32 *)(p + j * 0x10 + 0xC) = 0;
        }
    }
}

/* ------------------------------------------------------------------------- *
 *  Pause input handler  (lbl_00009F3C, 0x00009F3C .. 0x0000A050)            *
 *  Chooses which pad the pause menu listens to based on the active player     *
 *  slot and the current sub-state, mirrors that into pauseMenuState, and      *
 *  toggles the per-slot "menu open" latch (work+0xA67) driving flag bits      *
 *  0x08 / 0x10 of pauseMenuState.unk4.                                        *
 * ------------------------------------------------------------------------- */

static void billiards_pause_input(void)
{
    int idx = lbl_802F1C32;
    s8 *slot = (s8 *)&billiardsWork + idx * 6;

    if (slot[0xa66] != 0
        || (u8)(billiardsWork.unkA - 10) <= 1
        || (u8)(billiardsWork.unkA - 7) <= 1)
    {
        pauseMenuState.unk16 = -1;
        lbl_802F0310[0] = 1;
        lbl_802F0310[1] = 1;
    }
    else
    {
        pauseMenuState.unk16 = (s16)playerControllerIDs[idx];
        lbl_802F0310[idx] = 1;
        lbl_802F0310[1 - idx] = 0;
    }

    if (pauseMenuState.unk4 & 0x10)
    {
        pauseMenuState.unk4 &= ~0x10u;
        slot[0xa67] ^= 1;
    }

    if (slot[0xa67] != 0)
        pauseMenuState.unk4 |= 8;
    else
        pauseMenuState.unk4 &= ~8u;
}

/* ------------------------------------------------------------------------- *
 *  DRAFTED IN THIS PASS (bodies above):                                       *
 *    - records-A init              lbl_00000614                                *
 *    - ball placement (rand)       lbl_00000800  (+ input helper lbl_00000E68) *
 *    - misc late init              lbl_00007C74                                *
 *    - pause input handler         lbl_00009F3C                                *
 *                                                                             *
 *  STILL forward-declared stubs (monolithic, raw-offset-heavy state machines  *
 *  judged too ambiguous to transcribe faithfully -- left as documented stubs): *
 *    - main body / state machine   lbl_00000F5C  (0x00000F5C .. 0x000023AC,    *
 *                                  ~1400 instrs; one inline function, not a    *
 *                                  dispatcher -- switches on work byte 0x0A)   *
 *    - camera callback             lbl_0000C85C  (0x0000C85C .. ~0x0000D0A0,   *
 *                                  inline state machine on work byte 0x0A)     *
 *    - draw callback               lbl_0000E8D0  (0x0000E8D0 .. ~0x00010FCC,   *
 *                                  ~2600 instrs of HUD/sprite drawing)         *
 *    - internal helpers            lbl_00016D9C, lbl_0001968C (bodies unknown) *
 *    - everything else from ~0x000023B0 onward (per-state gameplay, HUD,       *
 *      physics helpers, ape thread entry, etc.)                                *
 *  Also un-transcribed: the .rodata config blob (base lbl_0001C2B8), the .data *
 *  tables (base lbl_00020DA0: strings, jump tables, the light template         *
 *  lbl_00020F70), and the full work-struct field layout.                      *
 * ------------------------------------------------------------------------- */
