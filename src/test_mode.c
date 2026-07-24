/*
 * test_mode.c  --  Debug / test-mode REL module (mkbe.rel_test_mode.rel)
 *
 * UNVERIFIED STRUCTURAL FIRST DRAFT.
 *   - This repo cannot build (no CodeWarrior / baserom), so NOTHING here is byte-match
 *     verified.  The code below only syntax-checks and structurally follows its templates
 *     (src/sel_stage_rel.c for the REL skeleton; src/mini_bowling.c / src/mini_ranking.c
 *     for how a REL module is expanded and how un-transcribed data blobs are accessed).
 *   - Every struct type invented for this module is flagged "INVENTED / UNVERIFIED".
 *   - Only a first cohesive batch of functions is drafted (the module spine: prolog/epilog,
 *     the per-frame submode dispatcher, the "exit" submode, and the DIP-switch / debug-menu
 *     navigation submodes).  See the "REMAINING" note near the bottom for everything that is
 *     still just a forward-declared stub.
 *
 * asm source: asm/test_mode.s  (section .text spans 0x000000D0 .. 0x0000FE6C).
 *
 * This is a hugely data-driven debug menu.  The module's ~0x5855-byte .data section is a
 * single blob anchored at the alignment symbol lbl_000102B0 (PRESERVED verbatim from the
 * original stub, below).  That blob holds, in order:
 *     - the submode function-pointer table (indexed by gameSubmode-0x5F),
 *     - the debug-menu label strings and printf format strings, and
 *     - the 27-entry debug-menu item table (at byte offset 0x27C).
 * None of that blob is transcribed here; the drafted code reaches into it by byte offset
 * exactly the way src/mini_bowling.c reaches into its un-transcribed config blob.  Because
 * only the first word of the blob (lbl_000102B0[0] == lbl_00000270) is emitted by this file,
 * any offset access past that word reads adjacent .data at run time -- fine for a structural
 * first draft, NOT byte-accurate.
 */

#include <stddef.h>
#include <stdio.h>

#include <dolphin.h>

#include "global.h"
#include "bitmap.h"
#include "camera.h"
#include "event.h"
#include "functions.h"
#include "input.h"
#include "light.h"
#include "mathutil.h"
#include "mode.h"
#include "nl2ngc.h"
#include "polydisp.h"
#include "recplay.h"
#include "sound.h"
#include "sprite.h"
#include "stage.h"
#include "variables.h"
#include "window.h"

/* ------------------------------------------------------------------------- *
 *  External DOL globals referenced by this module but not declared in any    *
 *  header we include.  Types taken from their real definitions:              *
 *    bgTypeNames    -> src/background.c (char *[])                            *
 *    dipSwitchNames -> src/pool.c       (char *[])                           *
 *    lbl_802F0980   -> src/window.c     (u32, == number of DIP switches, 32) *
 *    lbl_802F2130   -> src/load.c       (u32)                                *
 *  (lbl_802F1F40, the background-selector index, is declared in variables.h) *
 * ------------------------------------------------------------------------- */
extern char *bgTypeNames[];
extern char *dipSwitchNames[];
extern u32 lbl_802F0980;
extern u32 lbl_802F2130;

/* ------------------------------------------------------------------------- *
 *  INVENTED TYPES  (all UNVERIFIED)                                          *
 * ------------------------------------------------------------------------- */

// One row of the on-screen debug menu.  The real 27-entry array lives inside the
// un-transcribed lbl_000102B0 blob at byte offset 0x27C (see file header).  INVENTED.
struct TestMenuItem
{
    /* 0x0 */ s32 type;         // 0 = selectable item, 1 = stage-num field,
                                //  2 = background field, 3 = section header (skipped)
    /* 0x4 */ const char *label;
    /* 0x8 */ s32 submode;      // gameSubmode requested when a type-0 item is chosen
};

// Module BSS work area (asm label lbl_10000000, real size 0x3CC6).  This is really a
// per-test union; only the header fields plus the handful of fields touched by the drafted
// functions are typed, the rest stays opaque padding.  All field names/offsets INVENTED.
//   0x0C..0x3F  belong to the sound-test submode (lbl_00001008/lbl_000010C4, not drafted).
//   0x40..0x77  are the prerender/preview draw fields read by lbl_00009060's inline cases.
struct TestModeWork
{
    /* 0x00 */ s32 menuCursor;    // lbl_10000000: selected debug-menu row (0..0x1A)
    /* 0x04 */ s32 dipBitCursor;  // lbl_10000004: selected DIP-switch bit
    /* 0x08 */ s32 padIndex;      // lbl_10000008: controller index for the input test

    // --- Sound-test submode fields (0x0C..0x3F).  All names/types INVENTED (UNVERIFIED),
    //     derived from the writes in the sound-test init (lbl_00001008) and the reads in the
    //     sound-test main (lbl_000010C4).  0x0C..0x1F are the "live sound-request" screen,
    //     0x20..0x3F back the ICS / effect / music / mode sub-screens.
    /* 0x0C */ s32 sndPage;        // current sound-test page (0..6), jump-table selector
    /* 0x10 */ s32 sndGroupIdx;    // selected sound-group index (0..0x10)
    /* 0x14 */ s32 sndSoundId;     // current sound id within the group
    /* 0x18 */ u8 sndVol;          // 0..127 volume (SoundVol)
    /* 0x19 */ u8 sndPanLR;        // left/right pan (SoundPan arg1)
    /* 0x1A */ u8 sndPanFB;        // front/back pan (SoundPan arg2)
    /* 0x1B */ u8 pad1B;
    /* 0x1C */ u16 sndPitch;       // SoundPitch (centered on 0x2000)
    /* 0x1E */ u16 sndDoppler;     // SoundDop   (centered on 0x2000)
    /* 0x20 */ u16 sndUnk20;       // seeded 0; not read by the main (UNVERIFIED)
    /* 0x22 */ u8 sndRev;          // SoundRev level
    /* 0x23 */ u8 sndCho;          // SoundCho level
    /* 0x24 */ s32 sndIcsReqBase;  // ICS request base id (seeded 0, never changed here)
    /* 0x28 */ u8 sndIcsPan;       // ICS pan level
    /* 0x29 */ u8 pad29[3];
    /* 0x2C */ s32 sndPage3Idx;    // effect-page selector (0..5) for func_8002CEB4
    /* 0x30 */ u16 sndPage3Val;    // effect-page value (centered on 0x100)
    /* 0x32 */ u16 pad32;
    /* 0x34 */ s32 sndMusicId;     // music/BGM id (0..0x49) for u_play_music
    /* 0x38 */ s32 sndUnk38;       // seeded 0xff; not read by the main (UNVERIFIED)
    /* 0x3C */ s32 sndPage6Idx;    // sound-mode/volume sub-selector (0..2)
    /* 0x40 */ s32 prerenderNameIdx;  // UNVERIFIED: index into the TM_DATA @0x93C texfmt/name table
    /* 0x44 */ s32 prerenderMaskNum;  // UNVERIFIED: printed as %d on the prerender screen
    /* 0x48 */ GXTexObj prerenderTexObj;  // UNVERIFIED: EFB->texture copy target (0x20 bytes)
    /* 0x68 */ void *prerenderTexBuf;     // UNVERIFIED: copied-texture image buffer
    /* 0x6C */ s32 previewModelIdx;       // UNVERIFIED: model index within previewModelList
    /* 0x70 */ s32 previewNameIdx;        // UNVERIFIED: index into the TM_DATA @0x2080 name table
    /* 0x74 */ void *previewModelList;    // UNVERIFIED: loaded model-list base (see case 0x70)
    /* 0x78 */ u8 pad78[0x3CC6 - 0x78];
};

/* ------------------------------------------------------------------------- *
 *  Module statics                                                           *
 * ------------------------------------------------------------------------- */

// BSS work area (lbl_10000000).
static struct TestModeWork s_work;

// needed here temporarily for alignment (PRESERVED verbatim from the original stub).
// lbl_0000FE78 is a lone .rodata word; lbl_000102B0 is the first entry (== the "exit"
// submode) of the un-transcribed submode function-pointer table / data blob.
const u32 lbl_0000FE78 = 0x405FC000;
extern void lbl_00000270();
void (*lbl_000102B0)() = lbl_00000270;

// Byte-addressable view of the un-transcribed .data blob anchored at lbl_000102B0.
#define TM_DATA ((u8 *)&lbl_000102B0)
// The debug-menu item table (27 rows).  UNVERIFIED: only its offset (0x27C) is known.
#define TM_MENU ((struct TestMenuItem *)(TM_DATA + 0x27C))

/* ------------------------------------------------------------------------- *
 *  Forward declarations                                                     *
 * ------------------------------------------------------------------------- */

// Drafted in this file:
static void lbl_00000208(void);    // per-frame callback: submode dispatch
static void lbl_00000308(void);    // submode 0x60: debug-menu navigation input
static void lbl_00000630(void);    // debug-menu display (draw)
static void lbl_00000780(void);    // submode-finish printf ("DIP DEST")
static void lbl_000007AC(void);    // submode 0x63: DIP-switch screen init
static void lbl_00000804(void);    // submode 0x64: DIP-switch screen input
static void lbl_00000934(void);    // DIP-switch display (draw)
static void lbl_00000A8C(void);    // submode 0x61: input-test init
static void lbl_00000AAC(void);    // submode 0x62: input-test main (nav + display)
static void lbl_00001008(void);    // submode 0x65: sound-test init
static void lbl_000010C4(void);    // submode 0x66: sound-test main (7-page state machine)
static void lbl_00001F54(void);    // submode 0x67: prerender-test init
static void lbl_00002048(void);    // submode 0x68: prerender-test main (input only)
static void lbl_00002664(void);    // submode 0x6E: forwarder to lbl_0000BFE8

// Registered draw callback / per-submode draw dispatcher (drafted below).
void lbl_00009060(void);

// Helpers called by the "exit" submode (lbl_00000270) -- NOT drafted, forward-declared only.
void lbl_0000B44C(void);
void lbl_0000BFA0(void);
void lbl_000094C0(void);
void lbl_00002108(void);
void lbl_00002760(void);

// Shared bitmap/font-test main; the 0x6E submode main (lbl_00002664) just forwards to it.
// NOT drafted here -- forward-declared only.
void lbl_0000BFE8(void);

// Per-submode draw routines dispatched by lbl_00009060 -- NOT drafted, forward-declared only.
// (Their update/main counterparts live in the un-transcribed submode fptr table @ lbl_000102B0.)
void lbl_0000215C(void);           // prerender-screen draw helper
void lbl_00001B78(void);           // 0x66 model-test draw
void lbl_000095F8(void);           // 0x6A EFC-model draw (part 1)
void lbl_00009998(void);           // 0x6A EFC-model draw (part 2)
void draw_test_camera_target(void);
void lbl_0000B57C(void);           // 0x6C draw
void lbl_0000C00C(void);           // 0x6E draw
void lbl_000031B8(void);           // 0x72 draw
void lbl_00003A4C(void);           // 0x74 draw
void lbl_0000FD8C(void);           // 0x78 setup
void lbl_00005384(void);           // 0x7B draw
void lbl_000073EC(void);           // 0x7D draw
void lbl_00007D20(void);           // 0x7F draw
void lbl_00008008(void);           // 0x81 draw
void lbl_0000884C(void);           // 0x83 draw
void lbl_00008F40(void);           // 0x85 draw

/* ------------------------------------------------------------------------- *
 *  REL skeleton  (template: src/sel_stage_rel.c)                            *
 *  _prolog registers the per-frame callback (lbl_00000208) and the draw      *
 *  callback (lbl_00009060) into the two DOL hook slots.                       *
 * ------------------------------------------------------------------------- */

void _prolog(void)
{
    lbl_802F1B74 = lbl_00000208;
    lbl_802F1B70 = lbl_00009060;
    puts("TEST MODE LOADED\n");
}

void _epilog(void)
{
    lbl_802F1B74 = NULL;
    lbl_802F1B70 = NULL;
    puts("TEST MODE PURGED\n");
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
    OSPanic("test_mode.c", 154, "\n");
}

/* ------------------------------------------------------------------------- *
 *  Per-frame callback / submode dispatch  (lbl_00000208, 0x208 .. 0x26C)     *
 *  Test-mode submodes occupy gameSubmode 0x5F..0x8D; anything else is a bug.  *
 *  HIGH.                                                                      *
 * ------------------------------------------------------------------------- */
static void lbl_00000208(void)
{
    int submode = gameSubmode;

    if (submode <= 0x5E || submode >= 0x8E)
    {
        printf("sub_mode: error %d in Test", submode);
        return;
    }

    // Dispatch through the (un-transcribed) function-pointer table at lbl_000102B0.
    (&lbl_000102B0)[submode - 0x5F]();
}

/* ------------------------------------------------------------------------- *
 *  Submode 0x5F: exit test mode  (lbl_00000270, 0x270 .. 0x304)              *
 *  Tears down everything the test screens set up and returns to submode 0x60. *
 *  NB: kept NON-static so it stays compatible with the PRESERVED alignment    *
 *  line `void (*lbl_000102B0)() = lbl_00000270;` above.  HIGH.                *
 * ------------------------------------------------------------------------- */
void lbl_00000270(void)
{
    lbl_802F2130 = 0;
    reset_camera_viewport();
    lbl_0000B44C();
    lbl_0000BFA0();
    lbl_000094C0();
    lbl_00002108();
    lbl_00002760();
    start_screen_fade(0, 0, 1);
    u_play_music(-1, 1);
    bitmap_free_group(0xE);
    func_800249D4();
    unload_stage();
    event_finish_all();
    // light.h prototypes light_init() with no params, but the asm passes r3=0; cast through
    // a matching pointer type so the argument is preserved.  UNVERIFIED.
    ((void (*)(int))light_init)(0);
    s_work.menuCursor = 0;
    gameSubmodeRequest = 0x60;
}

/* ------------------------------------------------------------------------- *
 *  Submode 0x60: debug-menu navigation input  (lbl_00000308, 0x308 .. 0x62C) *
 *  Leaf function.  Up/Down (with R-trigger accel) move the cursor, skipping   *
 *  section-header rows (type 3); A launches a selectable item; Left/Right     *
 *  edit the stage-number and background-index fields.  DRAFT.                 *
 * ------------------------------------------------------------------------- */
static void lbl_00000308(void)
{
    struct TestMenuItem *menu = TM_MENU;
    int cursor = s_work.menuCursor;

    if (REPEAT_WITH_R_ACCEL(0, PAD_BUTTON_DOWN))
    {
        do
        {
            if (++cursor >= 0x1B)
                cursor = 0;
        } while (menu[cursor].type == 3);
    }
    if (REPEAT_WITH_R_ACCEL(0, PAD_BUTTON_UP))
    {
        do
        {
            if (--cursor < 0)
                cursor = 0x1A;
        } while (menu[cursor].type == 3);
    }
    s_work.menuCursor = cursor;

    switch (menu[cursor].type)
    {
    case 0:  // selectable item: A launches its submode
        if (controllerInfo[0].pressed.button & PAD_BUTTON_A)
            gameSubmodeRequest = (s16)menu[cursor].submode;
        break;

    case 1:  // stage-number field (clamped 1..200)
    {
        int v = loadingStageIdRequest;
        if (REPEAT_WITH_R_ACCEL(0, PAD_BUTTON_LEFT))
        {
            if (--v < 1)
                v = 1;
        }
        if (REPEAT_WITH_R_ACCEL(0, PAD_BUTTON_RIGHT))
        {
            if (++v > 0xC8)
                v = 0xC8;
        }
        if (v != loadingStageIdRequest)
            loadingStageIdRequest = (s16)v;
        break;
    }

    case 2:  // background-index field (clamped 0..27)
    {
        int v = (s16)lbl_802F1F40;
        if (REPEAT_WITH_R_ACCEL(0, PAD_BUTTON_LEFT))
        {
            if (--v < 0)
                v = 0;
        }
        if (REPEAT_WITH_R_ACCEL(0, PAD_BUTTON_RIGHT))
        {
            if (++v > 0x1B)
                v = 0x1B;
        }
        if (v != (s16)lbl_802F1F40)
            lbl_802F1F40 = (s16)v;
        break;
    }

    default:  // type 3 (section header) or unused: no action
        break;
    }
}

/* ------------------------------------------------------------------------- *
 *  Submode-finish helper for the DIP-switch screen  (lbl_00000780, 0x780).   *
 *  CERTAIN.                                                                   *
 * ------------------------------------------------------------------------- */
static void lbl_00000780(void)
{
    printf("DIP DEST\n");
}

/* ------------------------------------------------------------------------- *
 *  Submode 0x63: DIP-switch screen init  (lbl_000007AC, 0x7AC .. 0x800).      *
 *  HIGH.                                                                      *
 * ------------------------------------------------------------------------- */
static void lbl_000007AC(void)
{
    if (debugFlags & 0xA)
        return;

    u_clear_buffers_2_and_5();
    s_work.dipBitCursor = 0;
    submodeFinishFunc = lbl_00000780;
    gameSubmodeRequest = 0x64;
}

/* ------------------------------------------------------------------------- *
 *  Submode 0x64: DIP-switch screen input  (lbl_00000804, 0x804 .. 0x930).     *
 *  Leaf function.  Up/Down move the selected bit (wrapping across the         *
 *  lbl_802F0980 DIP-switch count); A toggles the selected bit.  DRAFT.        *
 * ------------------------------------------------------------------------- */
static void lbl_00000804(void)
{
    if (debugFlags & 0xA)
        return;

    if (REPEAT_WITH_R_ACCEL(0, PAD_BUTTON_UP))
    {
        if (--s_work.dipBitCursor < 0)
            s_work.dipBitCursor = lbl_802F0980 - 1;
    }
    if (REPEAT_WITH_R_ACCEL(0, PAD_BUTTON_DOWN))
    {
        if (++s_work.dipBitCursor >= (int)lbl_802F0980)
            s_work.dipBitCursor = 0;
    }
    if (controllerInfo[0].pressed.button & PAD_BUTTON_A)
        dipSwitches ^= (1 << s_work.dipBitCursor);
}

/* ------------------------------------------------------------------------- *
 *  Submode 0x61: input-test init  (lbl_00000A8C, 0xA8C .. 0xAA8).             *
 *  CERTAIN.                                                                   *
 * ------------------------------------------------------------------------- */
static void lbl_00000A8C(void)
{
    s_work.padIndex = 0;
    gameSubmodeRequest = 0x62;
}

/* ------------------------------------------------------------------------- *
 *  Debug-menu display  (lbl_00000630, 0x630 .. 0x77C).                        *
 *  Draws the 27-row debug menu: a title, each row's label/value (formatted    *
 *  per TestMenuItem.type), and the ">" cursor marker.  The format strings all  *
 *  live inside the un-transcribed TM_DATA blob (offsets 0x3C0/0x3CC/0x3D0/     *
 *  0x3E0/0x400).  HIGH (structure); UNVERIFIED (blob string offsets).          *
 * ------------------------------------------------------------------------- */
static void lbl_00000630(void)
{
    struct TestMenuItem *menu = TM_MENU;
    int i;

    window_set_cursor_pos(1, 1);
    window_printf_2((char *)(TM_DATA + 0x3C0));  // screen title
    for (i = 0; i < 0x1B; i++)
    {
        window_set_cursor_pos(0xE, i + 3);
        switch (menu[i].type)
        {
        case 0:  // selectable item
            window_printf_2((char *)(TM_DATA + 0x3CC), menu[i].label);
            break;
        case 1:  // stage-number field
            window_printf_2((char *)(TM_DATA + 0x3D0), loadingStageIdRequest);
            break;
        case 2:  // background field
        {
            int bg = (s16)lbl_802F1F40;
            window_printf_2((char *)(TM_DATA + 0x3E0), bg, bgTypeNames[bg]);
            break;
        }
        case 3:  // section header
            window_set_text_color(WINDOW_COLOR_GREEN);
            window_move_cursor(-8, 1);
            window_printf_2((char *)(TM_DATA + 0x3CC), menu[i].label);
            window_set_text_color(WINDOW_COLOR_WHITE);
            break;
        default:  // type < 0 or >= 4: skip
            break;
        }
    }
    window_set_cursor_pos(0xC, (u16)(s_work.menuCursor + 3));
    window_set_text_color(WINDOW_COLOR_RED);
    window_printf_2((char *)(TM_DATA + 0x400));  // cursor marker
    window_set_text_color(WINDOW_COLOR_WHITE);
}

/* ------------------------------------------------------------------------- *
 *  DIP-switch display  (lbl_00000934, 0x934 .. 0xA88).                        *
 *  Scrolling list of the lbl_802F0980 DIP switches (name + ON/OFF), grouped   *
 *  in blocks of 4 (blank row every 4th), with the ">" cursor marker.  HIGH    *
 *  (structure); UNVERIFIED (blob string offsets).                             *
 * ------------------------------------------------------------------------- */
static void lbl_00000934(void)
{
    int i;
    int scroll;

    window_set_cursor_pos(1, 1);
    window_printf_2((char *)(TM_DATA + 0x270));  // title

    // Keep the selected bit on screen: scroll = clamp(cursor - 10, 0, 14).
    if (s_work.dipBitCursor - 10 < 0)
        scroll = 0;
    else if (s_work.dipBitCursor - 10 > 0xE)
        scroll = 0xE;
    else
        scroll = s_work.dipBitCursor - 10;

    for (i = 0; i < (int)lbl_802F0980; i++)
    {
        window_set_cursor_pos(0xC, (3 - scroll) + i + i / 4);
        if (i == s_work.dipBitCursor)
            window_set_text_color(WINDOW_COLOR_GREEN);
        window_printf_2((char *)(TM_DATA + 0x418), dipSwitchNames[i],
                        (dipSwitches & (1 << i)) ? (char *)(TM_DATA + 0x410)
                                                 : (char *)(TM_DATA + 0x414));
        if (i == s_work.dipBitCursor)
            window_set_text_color(WINDOW_COLOR_WHITE);
    }

    window_set_cursor_pos(0xA, (3 - scroll) + s_work.dipBitCursor + s_work.dipBitCursor / 4);
    window_set_text_color(WINDOW_COLOR_RED);
    // window.h prototypes u_debug_print() with no params, but the asm passes r3 = string;
    // cast through a matching pointer type so the argument is preserved.  UNVERIFIED.
    ((void (*)(const char *))u_debug_print)((char *)(TM_DATA + 0x400));  // cursor marker
    window_set_text_color(WINDOW_COLOR_WHITE);
}

/* ------------------------------------------------------------------------- *
 *  Submode 0x62: input-test main  (lbl_00000AAC, 0xAAC .. 0x1004).            *
 *  Holding L on pad 0 + Left/Right cycles the displayed controller index      *
 *  (0..3), then dumps that controller's digital buttons, analog axes/triggers *
 *  and the analogInputs[] emulated-direction flags, each formatted from a     *
 *  TM_DATA blob string.  DRAFT (mechanical, but every blob string offset is    *
 *  UNVERIFIED and the button/analog display order follows the asm exactly).    *
 * ------------------------------------------------------------------------- */
static void lbl_00000AAC(void)
{
    struct ControllerInfo *ci;
    struct AnalogInput *ai;
    const char *on = (char *)(TM_DATA + 0x444);
    const char *off = (char *)(TM_DATA + 0x414);
    int padIndex = s_work.padIndex;
    u16 held;
    u16 ah;

    // Hold L on pad 0 + press Left/Right to change which controller is shown.
    if (controllerInfo[0].held.button & PAD_TRIGGER_L)
    {
        u16 pressed = controllerInfo[0].pressed.button;
        if (pressed & PAD_BUTTON_LEFT)
        {
            if (--padIndex < 0)
                padIndex = 0;
        }
        if (pressed & PAD_BUTTON_RIGHT)
        {
            if (++padIndex >= 4)
                padIndex = 3;
        }
    }
    s_work.padIndex = padIndex;

    window_set_cursor_pos(1, 1);
    window_printf_2((char *)(TM_DATA + 0x424));  // title
    window_set_cursor_pos(3, 3);
    window_set_text_color(WINDOW_COLOR_GREEN);
    window_printf_2((char *)(TM_DATA + 0x430), padIndex);
    window_set_text_color(WINDOW_COLOR_WHITE);
    window_printf_2((char *)(TM_DATA + 0x140));  // newline

    ci = &controllerInfo[padIndex];
    held = ci->held.button;
    window_printf_2((char *)(TM_DATA + 0x448), (held & PAD_BUTTON_LEFT)  ? on : off);
    window_printf_2((char *)(TM_DATA + 0x45C), (held & PAD_BUTTON_RIGHT) ? on : off);
    window_printf_2((char *)(TM_DATA + 0x470), (held & PAD_BUTTON_DOWN)  ? on : off);
    window_printf_2((char *)(TM_DATA + 0x484), (held & PAD_BUTTON_UP)    ? on : off);
    window_printf_2((char *)(TM_DATA + 0x498), (held & PAD_TRIGGER_Z)    ? on : off);
    window_printf_2((char *)(TM_DATA + 0x4AC), (held & PAD_TRIGGER_L)    ? on : off);
    window_printf_2((char *)(TM_DATA + 0x4C0), (held & PAD_TRIGGER_R)    ? on : off);
    window_printf_2((char *)(TM_DATA + 0x4D4), (held & PAD_BUTTON_A)     ? on : off);
    window_printf_2((char *)(TM_DATA + 0x4E8), (held & PAD_BUTTON_B)     ? on : off);
    window_printf_2((char *)(TM_DATA + 0x4FC), (held & PAD_BUTTON_X)     ? on : off);
    window_printf_2((char *)(TM_DATA + 0x510), (held & PAD_BUTTON_Y)     ? on : off);
    window_printf_2((char *)(TM_DATA + 0x524), (held & PAD_BUTTON_START) ? on : off);
    window_printf_2((char *)(TM_DATA + 0x140));  // newline

    window_printf_2((char *)(TM_DATA + 0x538), ci->held.stickX);
    window_printf_2((char *)(TM_DATA + 0x54C), ci->held.stickY);
    window_printf_2((char *)(TM_DATA + 0x560), ci->held.substickX);
    window_printf_2((char *)(TM_DATA + 0x574), ci->held.substickY);
    window_printf_2((char *)(TM_DATA + 0x588), ci->held.triggerLeft);
    window_printf_2((char *)(TM_DATA + 0x59C), ci->held.triggerRight);
    window_printf_2((char *)(TM_DATA + 0x5B0), ci->held.analogA);
    window_printf_2((char *)(TM_DATA + 0x5C4), ci->held.analogB);
    window_printf_2((char *)(TM_DATA + 0x5D8), ci->held.err);

    window_set_cursor_pos(0x17, 3);
    window_printf_2((char *)(TM_DATA + 0x5EC));  // analog header
    window_printf_2((char *)(TM_DATA + 0x140));  // newline

    ai = &analogInputs[padIndex];
    ah = ai->held;
    window_printf_2((char *)(TM_DATA + 0x5F8), (ah & ANALOG_STICK_LEFT)    ? on : off);
    window_printf_2((char *)(TM_DATA + 0x60C), (ah & ANALOG_STICK_RIGHT)   ? on : off);
    window_printf_2((char *)(TM_DATA + 0x620), (ah & ANALOG_STICK_DOWN)    ? on : off);
    window_printf_2((char *)(TM_DATA + 0x634), (ah & ANALOG_STICK_UP)      ? on : off);
    window_printf_2((char *)(TM_DATA + 0x648), (ah & ANALOG_CSTICK_LEFT)   ? on : off);
    window_printf_2((char *)(TM_DATA + 0x65C), (ah & ANALOG_CSTICK_RIGHT)  ? on : off);
    window_printf_2((char *)(TM_DATA + 0x670), (ah & ANALOG_CSTICK_DOWN)   ? on : off);
    window_printf_2((char *)(TM_DATA + 0x684), (ah & ANALOG_CSTICK_UP)     ? on : off);
    window_printf_2((char *)(TM_DATA + 0x4AC), (ah & ANALOG_TRIGGER_LEFT)  ? on : off);
    window_printf_2((char *)(TM_DATA + 0x4C0), (ah & ANALOG_TRIGGER_RIGHT) ? on : off);

    window_set_cursor_pos(0x16, 0x12);
    window_printf_2((char *)(TM_DATA + 0x698));
    window_printf_2((char *)(TM_DATA + 0x140));
    window_printf_2((char *)(TM_DATA + 0x6A8));
    window_printf_2((char *)(TM_DATA + 0x6B8));
    window_printf_2((char *)(TM_DATA + 0x6C4));
    window_printf_2((char *)(TM_DATA + 0x6D8));
    window_printf_2((char *)(TM_DATA + 0x6E4));
}

/* ------------------------------------------------------------------------- *
 *  Submode 0x65: sound-test init  (lbl_00001008, 0x1008 .. 0x10C0).           *
 *  Seeds the whole sound-test work area (0x0C..0x3C) to its defaults and       *
 *  hands off to the sound-test main (0x66).  HIGH (field offsets read straight  *
 *  from the asm; field *semantics* are INVENTED/UNVERIFIED).                    *
 * ------------------------------------------------------------------------- */
static void lbl_00001008(void)
{
    event_start(0x12);
    u_play_music(1, 3);

    s_work.sndPage = 1;
    s_work.sndGroupIdx = 0;
    s_work.sndSoundId = g_soundGroupDesc[0].unused + 1;
    s_work.sndVol = 0x7F;
    s_work.sndPanLR = 0;
    s_work.sndPanFB = 0;
    s_work.sndPitch = 0x2000;
    s_work.sndDoppler = 0x2000;
    s_work.sndUnk20 = 0;
    s_work.sndRev = 0;
    s_work.sndCho = 0;
    s_work.sndIcsReqBase = 0;
    s_work.sndIcsPan = 0;
    s_work.sndPage3Idx = 0;
    s_work.sndPage3Val = 0x100;
    s_work.sndMusicId = 0;
    s_work.sndUnk38 = 0xFF;
    s_work.sndPage6Idx = 0;

    gameSubmodeRequest = 0x66;
}

/* ------------------------------------------------------------------------- *
 *  Submode 0x66: sound-test main  (lbl_000010C4, 0x10C4 .. 0x1B74).            *
 *  Up/Down (pressed-or-repeat) cycle the 7 pages; Y triggers ev_sound_dest();  *
 *  a jump table (lbl_000109A8) then runs the selected page.  The pages drive    *
 *  the low-level Sound* API from pad-0 analog inputs.                           *
 *                                                                               *
 *  DRAFT-UNCERTAIN.  Structurally follows the asm branch-for-branch, but:       *
 *    - the sound-test work-field semantics are INVENTED (see struct);           *
 *    - the packed SoundReqDirect / SoundIcsReq request words are transcribed    *
 *      from the exact rlwinm shift/mask fields but the originating C expression  *
 *      is UNVERIFIED (flagged inline);                                          *
 *    - the double scale constants are decoded exactly from the lbl_0000FE78     *
 *      pool (127.0 / 0.793 / 1.05 / 8192.0 / 136.533 / 0.907 / 0.747 / 0.864 /  *
 *      256.0 / 3.459), but the pool is not transcribed so this only mirrors      *
 *      the arithmetic, it is not byte-accurate;                                 *
 *    - func_8002CEB4/AC/B0 are prototyped void in sound.h; the asm passes args   *
 *      so they are called through matching casts.                               *
 * ------------------------------------------------------------------------- */

// pad-0 "menu-scroll" predicate used throughout the sound-test pages: the button
// is active if freshly pressed, auto-repeating, or held together with X as an
// accelerator (bit 0x15 == PAD_BUTTON_X in the asm).  UNVERIFIED helper shape.
#define SND_BTN(btn)                                                       \
    ((controllerInfo[0].pressed.button & (btn)) ||                        \
     (controllerInfo[0].repeat.button & (btn)) ||                         \
     ((controllerInfo[0].held.button & (btn)) &&                          \
      (controllerInfo[0].held.button & PAD_BUTTON_X)))

static void lbl_000010C4(void)
{
    struct ControllerInfo *ci = &controllerInfo[0];

    if (debugFlags & 0xA)
        return;

    // Page navigation (pressed-or-repeat only; no accelerator here).
    if ((ci->pressed.button & PAD_BUTTON_DOWN) || (ci->repeat.button & PAD_BUTTON_DOWN))
    {
        if (++s_work.sndPage > 6)
            s_work.sndPage = 0;
    }
    if ((ci->pressed.button & PAD_BUTTON_UP) || (ci->repeat.button & PAD_BUTTON_UP))
    {
        if (--s_work.sndPage < 0)
            s_work.sndPage = 6;
    }
    if (ci->pressed.button & PAD_BUTTON_Y)
        ev_sound_dest();

    if ((u32)s_work.sndPage > 6)
        return;

    switch (s_work.sndPage)
    {
    case 0:  // group load / unload
        if (SND_BTN(PAD_BUTTON_RIGHT))
        {
            if (++s_work.sndGroupIdx > 0x10)
                s_work.sndGroupIdx = 0;
        }
        if (SND_BTN(PAD_BUTTON_LEFT))
        {
            if (--s_work.sndGroupIdx < 0)
                s_work.sndGroupIdx = 0x10;
        }
        if (SND_BTN(PAD_BUTTON_RIGHT) || SND_BTN(PAD_BUTTON_LEFT))
            s_work.sndSoundId = g_soundGroupDesc[s_work.sndGroupIdx].unused + 1;
        if (ci->pressed.button & PAD_BUTTON_B)
            SoundGroupFree();
        if (ci->pressed.button & PAD_BUTTON_A)
            SoundGroupLoad(s_work.sndGroupIdx);
        break;

    case 1:  // live sound request with vol/pan/pitch/doppler/rev/cho
        if (SND_BTN(PAD_BUTTON_RIGHT))
            s_work.sndSoundId++;
        if (SND_BTN(PAD_BUTTON_LEFT))
            s_work.sndSoundId--;
        if (g_soundDesc[s_work.sndSoundId].unk8 == 1)
        {
            if (s_work.sndSoundId == g_soundGroupDesc[s_work.sndGroupIdx].unused)
                s_work.sndSoundId = g_soundGroupDesc[s_work.sndGroupIdx + 1].unused - 1;
            else
                s_work.sndSoundId = g_soundGroupDesc[s_work.sndGroupIdx].unused + 1;
        }

        s_work.sndVol = (int)(127.0 - 0.793 * ci->held.triggerLeft);
        SoundVol(s_work.sndSoundId, s_work.sndVol);
        s_work.sndPanLR = (int)(1.05 * ci->held.substickX);
        s_work.sndPanFB = (int)(1.05 * ci->held.substickY);
        SoundPan(s_work.sndSoundId, s_work.sndPanLR, s_work.sndPanFB);
        s_work.sndPitch = (int)(8192.0 + 136.533 * ci->held.stickX);
        SoundPitch(s_work.sndSoundId, s_work.sndPitch);
        s_work.sndDoppler = (int)(8192.0 + 136.533 * ci->held.stickY);
        SoundDop(s_work.sndSoundId, s_work.sndDoppler);
        if (!(ci->held.button & PAD_BUTTON_X))
        {
            s_work.sndRev = (int)(0.907 * ci->held.analogA);
            SoundRev(s_work.sndSoundId, s_work.sndRev);
        }
        else
        {
            s_work.sndCho = (int)(0.907 * ci->held.analogA);
            SoundCho(s_work.sndSoundId, s_work.sndCho);
        }
        u_somePlayerId = 0;
        if (ci->pressed.button & PAD_BUTTON_A)
        {
            // Packed sound-request word.  UNVERIFIED source expression; the shift/mask
            // fields mirror the rlwinm/slwi encoding in the asm exactly.
            u32 req = ((((s8)s_work.sndVol - 127) << 11) & 0x3F800) |
                      ((s_work.sndPanLR << 18) & 0x1FC0000) |
                      ((u32)s_work.sndPanFB << 25) |
                      s_work.sndSoundId;
            SoundReqDirect(req);
        }
        if (ci->pressed.button & PAD_BUTTON_B)
            SoundOff(s_work.sndSoundId);
        break;

    case 2:  // ICS request (recomputed and re-issued every frame)
    {
        u32 req;

        s_work.sndIcsPan = (int)(0.747 * ci->held.analogA);
        s_work.sndVol = (int)(127.0 - 0.747 * ci->held.triggerLeft);
        s_work.sndPanLR = (int)(0.864 * ci->held.substickX);
        s_work.sndPanFB = (int)(0.864 * ci->held.substickY);
        // UNVERIFIED source expression; mirrors the rlwinm/slwi fields in the asm.
        req = ((s_work.sndPanLR << 18) & 0x1FC0000) |
              ((u32)(s8)s_work.sndPanFB << 25) |
              s_work.sndIcsReqBase;
        SoundIcsReq(req, s_work.sndIcsPan, s_work.sndVol);
        break;
    }

    case 3:  // func_8002CEB4 effect page
        if (SND_BTN(PAD_BUTTON_RIGHT))
        {
            if (++s_work.sndPage3Idx >= 6)
                s_work.sndPage3Idx = 0;
        }
        if (SND_BTN(PAD_BUTTON_LEFT))
        {
            if (--s_work.sndPage3Idx < 0)
                s_work.sndPage3Idx = 5;
        }
        s_work.sndPage3Val = (int)(256.0 + 3.459 * ci->held.stickX);
        ((void (*)(u16, u16))func_8002CEB4)(s_work.sndPage3Idx, s_work.sndPage3Val);
        if (ci->pressed.button & PAD_BUTTON_A)
            ((void (*)(u16))func_8002CEAC)(s_work.sndPage3Idx);
        if (ci->pressed.button & PAD_BUTTON_B)
            ((void (*)(u16))func_8002CEB0)(s_work.sndPage3Idx);
        break;

    case 4:  // music / BGM page
        if (SND_BTN(PAD_BUTTON_RIGHT))
        {
            if (++s_work.sndMusicId >= 0x4A)
                s_work.sndMusicId = 0;
        }
        if (SND_BTN(PAD_BUTTON_LEFT))
        {
            if (--s_work.sndMusicId < 0)
                s_work.sndMusicId = 0x49;
        }
        if (ci->pressed.button & PAD_BUTTON_X)
            g_soundMuted ^= 1;
        if (ci->pressed.button & PAD_BUTTON_Y)
            u_play_music(-1, 5);
        if (ci->pressed.button & PAD_BUTTON_A)
            u_play_music(s_work.sndMusicId, 0);
        if (ci->pressed.button & PAD_BUTTON_B)
            u_play_music(-1, 1);
        break;

    case 5:  // stream page
        if (ci->pressed.button & PAD_BUTTON_A)
            SoundStreamStart();
        if (ci->pressed.button & PAD_BUTTON_B)
            SoundStreamEnd();
        break;

    case 6:  // sound-mode / SE+BGM volume page (C-stick driven)
    {
        u16 arep = analogInputs[0].repeat;

        if (arep & ANALOG_CSTICK_DOWN)
        {
            if (++s_work.sndPage6Idx > 2)
                s_work.sndPage6Idx = 0;
        }
        if (arep & ANALOG_CSTICK_UP)
        {
            if (--s_work.sndPage6Idx < 0)
                s_work.sndPage6Idx = 2;
        }

        if (s_work.sndPage6Idx == 1)
        {
            int v = g_soundSEVol;
            if (arep & ANALOG_CSTICK_RIGHT)
                v += 5;
            if (arep & ANALOG_CSTICK_LEFT)
                v -= 5;
            if (v > 0x64)
                v = 0x64;
            if (v < 0)
                v = 0;
            if (v != g_soundSEVol)
                g_soundSEVol = v;
        }
        else if (s_work.sndPage6Idx == 2)
        {
            int v = g_soundBGMVol;
            if (arep & ANALOG_CSTICK_RIGHT)
                v += 5;
            if (arep & ANALOG_CSTICK_LEFT)
                v -= 5;
            if (v > 0x64)
                v = 0x64;
            if (v < 0)
                v = 0;
            if (v != g_soundBGMVol)
                g_soundBGMVol = v;
        }
        else if (s_work.sndPage6Idx == 0)
        {
            u16 apr = analogInputs[0].pressed;
            int mode = 0;
            int changed = 0;
            if (apr & ANALOG_CSTICK_LEFT)
            {
                mode = 0;
                changed = 1;
            }
            else if (apr & ANALOG_CSTICK_RIGHT)
            {
                mode = 1;
                changed = 1;
            }
            if (changed)
                u_change_sound_mode(mode);
        }
        break;
    }
    }
}

/* ------------------------------------------------------------------------- *
 *  Submode 0x67: prerender-test init  (lbl_00001F54, 0x1F54 .. 0x2044).        *
 *  Seeds the prerender fields, lazily allocates the EFB->texture copy buffer    *
 *  (0x280 x 0x1E0 RGBA8) from the current heap, points the GXTexObj at it, then  *
 *  starts the shared replay viewer and hands off to submode 0x68.               *
 *  DRAFT-UNCERTAIN: GX/heap sequence is mechanical, but the texfmt table read    *
 *  (TM_DATA+0x93C) and the 0x48/0x68 field types are INVENTED/UNVERIFIED.        *
 * ------------------------------------------------------------------------- */
static void lbl_00001F54(void)
{
    u32 size;

    s_work.prerenderNameIdx = 0;
    s_work.prerenderMaskNum = 0xC0;

    size = GXGetTexBufferSize(0x280, 0x1E0, GX_TF_RGBA8, GX_FALSE, 0);
    if (s_work.prerenderTexBuf == NULL)
        s_work.prerenderTexBuf = OSAllocFromHeap(__OSCurrHeap, size);

    if (s_work.prerenderTexBuf == NULL)
    {
        gameSubmodeRequest = 0x5F;
        return;
    }

    GXInitTexObj(&s_work.prerenderTexObj, s_work.prerenderTexBuf,
                 currRenderMode->fbWidth, currRenderMode->efbHeight,
                 (GXTexFmt)((u32 *)(TM_DATA + 0x93C))[s_work.prerenderNameIdx * 2],
                 GX_CLAMP, GX_CLAMP, GX_FALSE);
    u_replay_test_init();
    camera_set_state_all(CAMERA_STATE_TEST);
    gameSubmodeRequest = 0x68;
}

/* ------------------------------------------------------------------------- *
 *  Submode 0x68: prerender-test main  (lbl_00002048, 0x2048 .. 0x2104).        *
 *  Input-only: Left/Right cycle the texfmt index (0..6, wrapping) and Up/Down   *
 *  adjust the mask value (0..0xFF); the actual drawing/EFB copy lives in the     *
 *  0x68 case of lbl_00009060.  Ends by ticking the shared replay viewer.         *
 *  HIGH (fields already typed; behaviour read straight from the asm).            *
 * ------------------------------------------------------------------------- */
static void lbl_00002048(void)
{
    u16 pressed = controllerInfo[0].pressed.button;

    if (pressed & PAD_BUTTON_LEFT)
    {
        if (--s_work.prerenderNameIdx < 0)
            s_work.prerenderNameIdx = 6;
    }
    if (pressed & PAD_BUTTON_RIGHT)
    {
        if (++s_work.prerenderNameIdx > 6)
            s_work.prerenderNameIdx = 0;
    }
    if (pressed & PAD_BUTTON_UP)
    {
        if (s_work.prerenderMaskNum < 0xFF)
            s_work.prerenderMaskNum++;
    }
    if (pressed & PAD_BUTTON_DOWN)
    {
        if (s_work.prerenderMaskNum > 0)
            s_work.prerenderMaskNum--;
    }
    u_replay_test_main();
}

/* ------------------------------------------------------------------------- *
 *  Submode 0x6E: main  (lbl_00002664, 0x2664 .. 0x2680).                       *
 *  Thin forwarder to the shared bitmap/font-test main.  CERTAIN (one call).     *
 * ------------------------------------------------------------------------- */
static void lbl_00002664(void)
{
    lbl_0000BFE8();
}

/* ------------------------------------------------------------------------- *
 *  Per-submode draw dispatcher  (lbl_00009060, 0x9060 .. 0x9334).             *
 *  Registered as the draw hook in _prolog.  Jump table lbl_00014810 keys off  *
 *  (gameSubmode - 0x60); most cases just invoke the matching per-test draw     *
 *  routine, a few inline their drawing.  The pure-dispatch structure is HIGH;  *
 *  the three inline cases (0x68 prerender, 0x70 preview, 0x78 common-model)    *
 *  are DRAFT-UNCERTAIN -- they read UNVERIFIED s_work fields, un-transcribed    *
 *  TM_DATA tables and the lbl_0000FE78 float pool.                             *
 * ------------------------------------------------------------------------- */
void lbl_00009060(void)
{
    switch (gameSubmode)
    {
    case 0x60:  // debug menu
        lbl_00000630();
        break;
    case 0x64:  // DIP switches
        lbl_00000934();
        break;
    case 0x66:  // model test
        lbl_00001B78();
        break;
    case 0x68:  // prerender test: draw the scene, then EFB->texture copy
    {
        window_set_cursor_pos(4, 4);
        window_printf_2((char *)(TM_DATA + 0x974));
        window_printf_2((char *)(TM_DATA + 0x980),
                        ((char **)(TM_DATA + 0x940))[s_work.prerenderNameIdx * 2]);
        window_printf_2((char *)(TM_DATA + 0x990), s_work.prerenderMaskNum);
        draw_normal_game_scene();
        lbl_0000215C();

        GXSetTexCopySrc(0, 0, currRenderMode->fbWidth, currRenderMode->efbHeight);
        GXSetTexCopyDst(currRenderMode->fbWidth, currRenderMode->efbHeight,
                        (GXTexFmt)((u32 *)(TM_DATA + 0x93C))[s_work.prerenderNameIdx * 2], 0);
        GXCopyTex(s_work.prerenderTexBuf, 0);
        GXInitTexObj(&s_work.prerenderTexObj, s_work.prerenderTexBuf,
                     currRenderMode->fbWidth, currRenderMode->efbHeight,
                     (GXTexFmt)((u32 *)(TM_DATA + 0x93C))[s_work.prerenderNameIdx * 2], 0, 0, 0);
        {
            // lbl_0000FE78 is the base of this module's un-transcribed rodata float pool;
            // +0x60 (index 0x18) is the LOD constant.  UNVERIFIED.
            float lod = ((float *)&lbl_0000FE78)[0x18];
            GXInitTexObjLOD(&s_work.prerenderTexObj, 0, 0, lod, lod, lod, 0, 0, 0);
        }
        break;
    }
    case 0x6A:  // EFC model test
        window_set_cursor_pos(4, 4);
        window_printf_2((char *)(TM_DATA + 0x9A0));
        lbl_000095F8();
        lbl_00009998();
        draw_test_camera_target();
        break;
    case 0x6C:
        lbl_0000B57C();
        break;
    case 0x6E:
        lbl_0000C00C();
        break;
    case 0x70:  // motion/preview viewer: draw the selected model from previewModelList
    {
        struct NlModel **list = (struct NlModel **)s_work.previewModelList;

        window_set_cursor_pos(4, 4);
        window_printf_2((char *)(TM_DATA + 0x26E0),
                        ((char **)(TM_DATA + 0x2080))[s_work.previewNameIdx * 3]);
        if (list == NULL)
        {
            window_printf_2((char *)(TM_DATA + 0x26F4));
            break;
        }
        // Each list[idx+1] is a model pointer carrying a small header just below it.
        {
            struct NlModel *model = list[s_work.previewModelIdx + 1];
            window_printf_2((char *)(TM_DATA + 0x2700), ((u32 *)model)[-2]);
            window_printf_2((char *)(TM_DATA + 0x2714), *((u32 **)model)[-1]);
            mathutil_mtxA_from_mtxB();
            nlObjPut(list[s_work.previewModelIdx + 1]);
            draw_test_camera_target();
        }
        break;
    }
    case 0x72:
        lbl_000031B8();
        break;
    case 0x74:
        lbl_00003A4C();
        break;
    case 0x76:
        func_8004A800();
        break;
    case 0x78:  // common-model draw
        lbl_0000FD8C();
        mathutil_mtxA_from_mtxB();
        nl2ngc_draw_model_sort_translucent_alt2(NLOBJ_MODEL(g_commonNlObj, 2));
        break;
    case 0x7B:
        lbl_00005384();
        break;
    case 0x7D:
        lbl_000073EC();
        break;
    case 0x7F:
        lbl_00007D20();
        break;
    case 0x81:
        lbl_00008008();
        break;
    case 0x83:
        lbl_0000884C();
        break;
    case 0x85:
        lbl_00008F40();
        break;
    default:
        break;
    }
}

/* ------------------------------------------------------------------------- *
 *  REMAINING (not yet decompiled -- forward-declared stubs above, or reached  *
 *  only through the un-transcribed submode function-pointer table):           *
 *    - the individual per-test 3D VIEWER submode mains + per-test draw         *
 *      routines: model / nlObjPut / EFC / pattern / motion / preview / blur /  *
 *      shadow / focus / indirect viewers, and the model/heap-heavy inits that  *
 *      feed them (lbl_000025B0 stage/event init, lbl_00002684 preview init,    *
 *      lbl_00002790 preview main, lbl_00002990 pattern init, lbl_00002A30      *
 *      pattern main, ...).  These are struct-heavy and read un-transcribed     *
 *      TM_DATA tables (e.g. lbl_00012330 model list, lbl_00010BEC texfmt), so  *
 *      their TestModeWork sub-struct layouts are unverifiable here; drafting    *
 *      them would be fabrication rather than faithful.  Reached through the     *
 *      fptr table @ lbl_000102B0 and through lbl_00009060's jump table         *
 *      (per-test draw routines lbl_00001B78, lbl_000095F8, lbl_0000B57C,       *
 *      lbl_0000C00C, lbl_000031B8, lbl_00003A4C, lbl_0000FD8C, lbl_00005384,   *
 *      lbl_000073EC, lbl_00007D20, lbl_00008008, lbl_0000884C, lbl_00008F40,   *
 *      lbl_0000215C, lbl_00009998).                                            *
 *    - exit-submode helpers        lbl_0000B44C, lbl_0000BFA0, lbl_000094C0,   *
 *                                  lbl_00002108, lbl_00002760                  *
 *    - shared bitmap/font-test main lbl_0000BFE8 (0x6E main just forwards)     *
 *    - replay submode (0x75/0x76) uses external u_replay_test_init/main.       *
 *  Also un-transcribed: the entire lbl_000102B0 .data blob (submode fptr       *
 *  table + menu strings/format strings + the 27-entry menu item table) and the *
 *  lbl_0000FE78 .rodata float/double pool.                                     *
 *                                                                              *
 *  Drafted in earlier passes: lbl_00000630 (menu display), lbl_00000934 (DIP   *
 *  display), lbl_00000AAC (input-test main, submode 0x62), draw dispatcher     *
 *  lbl_00009060, plus the lifecycle / nav / DIP handlers.                      *
 *  Drafted in THIS pass: lbl_00001008 (sound-test init, 0x65), lbl_000010C4    *
 *  (sound-test main, 0x66), lbl_00001F54 (prerender init, 0x67), lbl_00002048  *
 *  (prerender main/input, 0x68) and lbl_00002664 (0x6E forwarder).             *
 * ------------------------------------------------------------------------- */
