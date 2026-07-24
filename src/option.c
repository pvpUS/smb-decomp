#include <stddef.h>
#include <stdio.h>
#include <string.h>

#include <dolphin.h>

#include "global.h"
#include "bitmap.h"
#include "event.h"
#include "input.h"
#include "light.h"
#include "memcard.h"
#include "mode.h"
#include "polydisp.h"
#include "ranking_screen.h"
#include "sound.h"
#include "sprite.h"
#include "stage.h"
#include "vibration.h"
#include "window.h"

/*
 * option.rel  --  the options menu module.
 *
 * STATUS: UNVERIFIED structural first draft.  This repo cannot build (no CodeWarrior),
 * so NOTHING here is byte-match verified.  Only the REL skeleton (_prolog/_epilog/
 * _unresolved), the submode dispatcher, and the SELECT / SOUND / MEMORY-CARD submode
 * handlers have been decompiled.  Everything from option_pad_init (asm offset 0xAE0)
 * onward is still raw asm and is only forward-declared below.
 */

/* Undecompiled globals from the main .dol not (yet) exposed in a header. */
extern u32 lbl_802F2130;

/* memcard.c functions not declared in memcard.h */
void func_8009F4CC(u8 a);
void func_800A4DF0(void);

/*
 * ranking_screen.c helpers that are file-static there but resolved by address in
 * this REL.  Declared locally (they are only commented-out in functions.h).
 */
void func_800AB414(void);
void func_800AB444(void);

/* ------------------------------------------------------------------ */
/* Forward declarations for this module's static functions.           */
/* Names marked (STUB) are not decompiled yet -- only referenced by    */
/* the dispatch table / callbacks below.                               */
/* ------------------------------------------------------------------ */
static void mode_option_func(void);
static void option_draw(void);                 /* lbl_00003F10 (STUB) */

static void option_select_init(void);          /* lbl_000002F4 */
static void option_select_main(void);          /* lbl_00000360 */
static void option_sound_init(void);           /* lbl_0000057C */
static void option_sound_main(void);           /* lbl_000005E8 */
static void option_sound_submode_finish(void); /* lbl_00000714 */
static void option_memcard_init(void);         /* lbl_0000073C */
static void option_memcard_main(void);         /* lbl_0000077C */

/* Newly decompiled this pass (offsets in asm/option.s). */
static void option_point_init(void);           /* lbl_000020E0 */
static void option_point_main(void);           /* lbl_0000210C */
static void option_ranking_init(void);         /* lbl_00002158 */
static void option_ranking_submode_finish(void); /* lbl_0000266C */
static void option_autosave_init(void);        /* lbl_00002C74 */
static void option_autosave_main(void);        /* lbl_00002CEC */
static void option_separate_init(void);        /* lbl_00002D78 */
static void option_separate_main(void);        /* lbl_00002DA4 */
static void option_pad_menu_init(void);        /* lbl_00003C2C */
static void option_pad_menu_main(void);        /* lbl_00003C6C */
static void option_pad_vib_init(void);         /* lbl_00003D8C */
static void option_pad_vib_main(void);         /* lbl_00003DD8 */

/*
 * The following submode handlers are still raw asm.  They are large state
 * machines that drive INVENTED replay-list / pad-config structures whose layout
 * is not yet understood well enough to draft faithfully, so they remain stubs.
 */
static void option_pad_init(void);             /* lbl_00000AE0 (STUB) */
static void option_pad_main(void);             /* lbl_00000C94 (STUB) */
static void option_ranking_main(void);         /* lbl_000021D8 (STUB) */
static void option_replay_init(void);          /* lbl_000026A0 (STUB) */
static void option_replay_main(void);          /* lbl_00002704 (STUB) */
static void option_replay_play_init(void);     /* lbl_00002F14 (STUB) */
static void option_replay_play_main(void);     /* lbl_00003240 (STUB) */

/* Internal helpers used by the decompiled functions but not decompiled here. */
static void lbl_000047D0(void); /* prolog sprite/UI setup */
static void lbl_00004204(int);  /* select-menu enter transition */
static void lbl_00004260(int);  /* menu leave transition */
static void lbl_00004EB4(void); /* select submode setup */
static void lbl_00007F90(void); /* sound submode setup */
static void lbl_0000C148(void); /* memory-card submode setup */
static void lbl_00007790(void); /* point submode setup */
static void lbl_0000925C(void); /* ranking submode setup */
static void lbl_00008A34(void); /* separate submode setup */
static void lbl_00009A78(void); /* pad-menu submode setup */
static void lbl_0000A534(void); /* pad-vibration submode setup */
static void lbl_00001598(void); /* pad submode scene draw */
static void lbl_000038A8(void); /* replay-play scene draw overlay */

/* ------------------------------------------------------------------ */
/* Module data                                                         */
/* ------------------------------------------------------------------ */

// needed here temporarily for alignment (preserved from the original stub)
const u32 lbl_0000C230 = 0x54000000;

/*
 * INVENTED / UNVERIFIED.  The option REL keeps its private state in its own module
 * .bss (section at 0x10000000, length 0x6F40).  Only the fields actually touched by
 * the functions decompiled so far are named; everything else is opaque filler.  The
 * field names, the offsets past 0x138, and the total size are all guesses.
 */
struct OptionWork
{
    /* 0x000 */ u8 filler000[0x38];
    /* 0x038 */ u8 unk38;          // render flag driven by globalAnimTimer in the tick fn
    /* 0x039 */ u8 unk39;          // 0/1 flag set by the pad submodes (UNVERIFIED)
    /* 0x03A */ u8 filler03A[0x50 - 0x3A];
    /* 0x050 */ s32 selectSel;     // top-level menu cursor (0..6)
    /* 0x054 */ u8 filler054[0xB0 - 0x54];
    /* 0x0B0 */ s32 unkB0;         // ranking submode state (UNVERIFIED)
    /* 0x0B4 */ s32 unkB4;         // ranking submode state (UNVERIFIED)
    /* 0x0B8 */ u8 filler0B8[0xD8 - 0xB8];
    /* 0x0D8 */ s32 soundTimer;    // sound-test periodic beep timer
    /* 0x0DC */ u8 filler0DC[0x114 - 0xDC];
    /* 0x114 */ s32 padMenuSel;    // pad-menu cursor 0..1 (UNVERIFIED)
    /* 0x118 */ u8 filler118[0x130 - 0x118];
    /* 0x130 */ s32 memcardState;  // memcard menu cursor 0..3, plus sub-states 4,5
    /* 0x134 */ s32 memcardMode;   // save/load mode requested
    /* 0x138 */ s32 memcardConfirm;// yes/no in the delete-confirm sub-dialog
    /* 0x13C */ u8 filler13C[0x154 - 0x13C];
    /* 0x154 */ s32 vibSel;        // pad-vibration cursor 0..3 (UNVERIFIED)
    /* 0x158 */ u8 filler158[0x1B4 - 0x158];
    /* 0x1B4 */ s16 soundModeDelay;// frames to wait before toggling mono/stereo
    /* 0x1B6 */ u8 filler1B6[0x6F40 - 0x1B6];
};

static struct OptionWork optionWork;

/* INVENTED / UNVERIFIED layout for the seven top-level menu entries (asm 0xC7A4). */
struct OptionMenuItem
{
    s32 disabled;      // 0 == selectable
    const char *label;
    s32 submode;       // gameSubmodeRequest fired when chosen
};

/*
 * Two single-byte constants the sound-test submode loads out of rodata (asm 0xC6A4/5).
 * Kept as named consts so the loads survive; values are a music id and a sound id.
 */
static const u8 lbl_0000C6A4 = 2;
static const u8 lbl_0000C6A5 = 3;

static struct OptionMenuItem optionSelectMenu[] = {
    { 0, "REPLAY",        SMD_OPTION_REPLAY_INIT   },
    { 0, "POINT",         SMD_OPTION_POINT_INIT    },
    { 0, "RANKING",       SMD_OPTION_RANKING_INIT  },
    { 0, "SOUND",         SMD_OPTION_SOUND_INIT    },
    { 0, "SEPARATE MODE", SMD_OPTION_SEPARATE_INIT },
    { 0, "PAD",           SMD_OPTION_PAD_MENU_INIT },
    { 0, "MEMORY CARD",   SMD_OPTION_MEMCARD_INIT  },
};

/*
 * Submode dispatch table (asm 0xC640, in .data because its entries get relocated).
 * Indexed by gameSubmode - SMD_OPTION_SELECT_INIT.  The names/order of the not-yet-
 * decompiled entries are inferred from the SMD_OPTION_* enum order.
 */
static void (*optionSubmodeFuncs[])(void) = {
    option_select_init,      // 0xAE SMD_OPTION_SELECT_INIT
    option_select_main,      // 0xAF SMD_OPTION_SELECT_MAIN
    option_sound_init,       // 0xB0 SMD_OPTION_SOUND_INIT
    option_sound_main,       // 0xB1 SMD_OPTION_SOUND_MAIN
    option_pad_init,         // 0xB2 SMD_OPTION_PAD_INIT
    option_pad_main,         // 0xB3 SMD_OPTION_PAD_MAIN
    option_memcard_init,     // 0xB4 SMD_OPTION_MEMCARD_INIT
    option_memcard_main,     // 0xB5 SMD_OPTION_MEMCARD_MAIN
    option_point_init,       // 0xB6 SMD_OPTION_POINT_INIT
    option_point_main,       // 0xB7 SMD_OPTION_POINT_MAIN
    option_ranking_init,     // 0xB8 SMD_OPTION_RANKING_INIT
    option_ranking_main,     // 0xB9 SMD_OPTION_RANKING_MAIN
    option_autosave_init,    // 0xBA SMD_OPTION_AUTOSAVE_INIT
    option_autosave_main,    // 0xBB SMD_OPTION_AUTOSAVE_MAIN
    option_replay_init,      // 0xBC SMD_OPTION_REPLAY_INIT
    option_replay_main,      // 0xBD SMD_OPTION_REPLAY_MAIN
    option_separate_init,    // 0xBE SMD_OPTION_SEPARATE_INIT
    option_separate_main,    // 0xBF SMD_OPTION_SEPARATE_MAIN
    option_replay_play_init, // 0xC0 SMD_OPTION_REPLAY_PLAY_INIT
    option_replay_play_main, // 0xC1 SMD_OPTION_REPLAY_PLAY_MAIN
    option_pad_menu_init,    // 0xC2 SMD_OPTION_PAD_MENU_INIT
    option_pad_menu_main,    // 0xC3 SMD_OPTION_PAD_MENU_MAIN
    option_pad_vib_init,     // 0xC4 SMD_OPTION_PAD_VIB_INIT
    option_pad_vib_main,     // 0xC5 SMD_OPTION_PAD_VIB_MAIN
};

/* ================================================================== */
/* REL skeleton                                                        */
/* ================================================================== */

void _prolog(void)
{
    lbl_802F2130 = 1;
    u_clear_buffers_2_and_5();
    free_all_bitmap_groups_except_com();
    func_800249D4();
    unload_stage();
    // asm passes r3 = 0; light.h under-specifies light_init() as taking no args, so cast
    ((void (*)(int))light_init)(0);
    event_finish_all();
    event_start(EVENT_SPRITE);
    event_start(EVENT_SOUND);
    call_bitmap_load_group(BMP_SEL);
    lbl_000047D0();
    start_screen_fade(0x100, 0, 30);
    lbl_802F1B74 = mode_option_func;
    lbl_802F1B70 = option_draw;
    puts("OPTION LOADED\n");
}

void _epilog(void)
{
    event_finish_all();
    lbl_802F1B74 = NULL;
    lbl_802F1B70 = NULL;
    puts("OPTION PURGED\n");
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
    OSPanic("option.c", 151, "\n");
}

/* ================================================================== */
/* Tick callback (installed into lbl_802F1B74) -- submode dispatcher   */
/* ================================================================== */

static void mode_option_func(void)
{
    if (globalAnimTimer & (1 << 2))
        optionWork.unk38 = 0xBF;
    else
        optionWork.unk38 = 0;

    if (gameSubmode <= SMD_OPTION_TOP || gameSubmode >= SMD_OPTION_BOTTOM)
        printf("sub_mode: error %d in Option", gameSubmode);
    else
        optionSubmodeFuncs[gameSubmode - SMD_OPTION_SELECT_INIT]();
}

/* ================================================================== */
/* SELECT submode (top-level option menu)                              */
/* ================================================================== */

static void option_select_init(void)
{
    optionWork.unk39 = 0;
    lbl_00004EB4();
    if (lbl_802014E0.unk0 != 0x49)
        u_play_music(0x49, 0);
    modeCtrl.courseFlags &= ~(1 << 2);
    gameSubmodeRequest = SMD_OPTION_SELECT_MAIN;
}

static void option_select_main(void)
{
    s32 sel;

    if (modeCtrl.courseFlags & (1 << 2))
    {
        // exit fade already scheduled: count down, then bounce to the title screen
        if (--modeCtrl.submodeTimer > 0)
            return;
        modeCtrl.submodeTimer = 0;
        modeCtrl.menuSel = 3;
        modeCtrl.unk10 = 1;
        gameModeRequest = MD_ADV;
        gameSubmodeRequest = SMD_ADV_TITLE_REINIT;
        return;
    }

    sel = (s8)optionWork.selectSel;
    if ((g_currPlayerButtons[4] & PAD_BUTTON_DOWN)
     || (g_currPlayerAnalogButtons[4] & PAD_BUTTON_DOWN))
    {
        if ((s8)++sel >= 7)
            sel = 0;
    }
    if ((g_currPlayerButtons[4] & PAD_BUTTON_UP)
     || (g_currPlayerAnalogButtons[4] & PAD_BUTTON_UP))
    {
        if ((s8)--sel < 0)
            sel = 6;
    }
    if ((s8)sel != optionWork.selectSel)
    {
        u_play_sound_0(0x6C);
        optionWork.selectSel = (s8)sel;
    }

    if (optionSelectMenu[optionWork.selectSel].disabled == 0)
    {
        if (g_currPlayerButtons[2] & PAD_BUTTON_A)
        {
            u_play_sound_0(0x6A);
            lbl_00004204(0x58);
            modeCtrl.submodeTimer = 30;
            gameSubmodeRequest = optionSelectMenu[optionWork.selectSel].submode;
            return;
        }
    }
    if (g_currPlayerButtons[2] & PAD_BUTTON_B)
    {
        if (eventInfo[EVENT_MEMCARD].state != EV_STATE_INACTIVE)
            return;
        u_play_sound_0(0x6B);
        if (func_8009F4C4() == 1)
        {
            gameSubmodeRequest = SMD_OPTION_AUTOSAVE_INIT;
        }
        else
        {
            modeCtrl.submodeTimer = 30;
            start_screen_fade(0x101, 0, modeCtrl.submodeTimer);
            u_play_music(modeCtrl.submodeTimer, 2);
            modeCtrl.courseFlags |= (1 << 2);
        }
    }
}

/* ================================================================== */
/* SOUND submode (mono / stereo test)                                  */
/* ================================================================== */

static void option_sound_init(void)
{
    u_play_music(lbl_0000C6A4, 0);
    lbl_00007F90();
    optionWork.soundTimer = 30;
    optionWork.soundModeDelay = 0;
    submodeFinishFunc = option_sound_submode_finish;
    gameSubmodeRequest = SMD_OPTION_SOUND_MAIN;
}

static void option_sound_main(void)
{
    if (--optionWork.soundTimer == 0)
    {
        u_play_sound_0(lbl_0000C6A5);
        optionWork.soundTimer = 60;
    }

    if (optionWork.soundModeDelay > 0)
    {
        if (--optionWork.soundModeDelay > 0)
            return;
        u_change_sound_mode(OSGetSoundMode() == 1 ? 0 : 1);
        u_play_music(lbl_0000C6A4, 0);
    }

    if ((g_currPlayerButtons[4] & PAD_BUTTON_LEFT)
     || (g_currPlayerAnalogButtons[4] & PAD_BUTTON_LEFT)
     || (g_currPlayerButtons[4] & PAD_BUTTON_RIGHT)
     || (g_currPlayerAnalogButtons[4] & PAD_BUTTON_RIGHT))
    {
        u_play_sound_0(0x6C);
        u_play_music(-1, 1);
        optionWork.soundModeDelay = 5;
        return;
    }
    if (g_currPlayerButtons[2] & PAD_BUTTON_B)
    {
        u_play_sound_0(0x6B);
        lbl_00004260(0x5C);
        gameSubmodeRequest = SMD_OPTION_SELECT_INIT;
    }
}

// installed as submodeFinishFunc while the sound submode is active
static void option_sound_submode_finish(void)
{
    u_play_music(30, 2);
}

/* ================================================================== */
/* MEMORY CARD submode                                                 */
/* ================================================================== */

static void option_memcard_init(void)
{
    lbl_0000C148();
    optionWork.memcardState = 0;
    optionWork.memcardMode = 0;
    gameSubmodeRequest = SMD_OPTION_MEMCARD_MAIN;
}

static void option_memcard_main(void)
{
    s32 sel;

    if (eventInfo[EVENT_MEMCARD].state == EV_STATE_RUNNING)
        return;

    sel = optionWork.memcardState;
    if ((g_currPlayerButtons[4] & PAD_BUTTON_UP)
     || (g_currPlayerAnalogButtons[4] & PAD_BUTTON_UP))
    {
        if (sel <= 3)
        {
            if (--sel < 0)
                sel = 3;
        }
    }
    else if ((g_currPlayerButtons[4] & PAD_BUTTON_DOWN)
     || (g_currPlayerAnalogButtons[4] & PAD_BUTTON_DOWN))
    {
        if (sel <= 3)
        {
            if (++sel > 3)
                sel = 0;
        }
    }
    if (sel != optionWork.memcardState)
    {
        u_play_sound_0(0x6C);
        optionWork.memcardState = sel;
    }

    if (optionWork.memcardState >= 0 && optionWork.memcardState < 4)
    {
        if (g_currPlayerButtons[2] & PAD_BUTTON_B)
        {
            u_play_sound_0(0x6B);
            lbl_00004260(0x5F);
            gameSubmodeRequest = SMD_OPTION_SELECT_INIT;
            return;
        }
    }

    switch (optionWork.memcardState)
    {
    case 0:
        optionWork.memcardMode = 0;
        if (g_currPlayerButtons[2] & PAD_BUTTON_A)
        {
            u_play_sound_0(0x6A);
            memcard_set_mode((u8)optionWork.memcardMode);
            event_start(EVENT_MEMCARD);
        }
        break;
    case 1:
        optionWork.memcardMode = 1;
        if (g_currPlayerButtons[2] & PAD_BUTTON_A)
        {
            u_play_sound_0(0x6A);
            memcard_set_mode((u8)optionWork.memcardMode);
            event_start(EVENT_MEMCARD);
        }
        break;
    case 2:
    {
        s32 cur = func_8009F4C4();
        s32 old = cur;
        if ((g_currPlayerButtons[4] & PAD_BUTTON_LEFT)
         || (g_currPlayerAnalogButtons[4] & PAD_BUTTON_LEFT)
         || (g_currPlayerButtons[4] & PAD_BUTTON_RIGHT)
         || (g_currPlayerAnalogButtons[4] & PAD_BUTTON_RIGHT))
            cur = (cur == 1) ? 0 : 1;
        if (old != cur)
        {
            u_play_sound_0(0x65);
            func_8009F4CC((u8)cur);
        }
        break;
    }
    case 3:
        if (g_currPlayerButtons[2] & PAD_BUTTON_A)
        {
            u_play_sound_0(0x6A);
            optionWork.memcardState = 4;
            optionWork.memcardConfirm = 0;
        }
        break;
    case 4:
    {
        s32 choice = optionWork.memcardConfirm;
        s32 old = choice;
        if ((g_currPlayerButtons[4] & PAD_BUTTON_RIGHT)
         || (g_currPlayerAnalogButtons[4] & PAD_BUTTON_RIGHT))
            choice = 0;
        else if ((g_currPlayerButtons[4] & PAD_BUTTON_LEFT)
         || (g_currPlayerAnalogButtons[4] & PAD_BUTTON_LEFT))
            choice = 1;
        if (choice != old)
        {
            u_play_sound_0(0x6C);
            optionWork.memcardConfirm = choice;
        }
        if (g_currPlayerButtons[2] & PAD_BUTTON_A)
        {
            if (optionWork.memcardConfirm == 1)
            {
                u_play_sound_0(0x6A);
                func_800A4DF0();
                optionWork.memcardState = 5;
            }
            else
            {
                u_play_sound_0(0x6B);
                optionWork.memcardState = 3;
            }
        }
        else if (g_currPlayerButtons[2] & PAD_BUTTON_B)
        {
            u_play_sound_0(0x6B);
            optionWork.memcardState = 3;
        }
        break;
    }
    case 5:
        if (g_currPlayerButtons[2] != 0)
        {
            u_play_sound_0(0x6B);
            optionWork.memcardState = 3;
        }
        break;
    }
}

/* ================================================================== */
/* POINT submode (point / total-play stats screen)                     */
/* ================================================================== */

static void option_point_init(void)
{
    lbl_00007790();
    gameSubmodeRequest = SMD_OPTION_POINT_MAIN;
}

static void option_point_main(void)
{
    if (g_currPlayerButtons[2] & PAD_BUTTON_B)
    {
        u_play_sound_0(0x6B);
        lbl_00004260(0x5A);
        gameSubmodeRequest = SMD_OPTION_SELECT_INIT;
    }
}

/* ================================================================== */
/* RANKING submode                                                     */
/* ================================================================== */

static void option_ranking_init(void)
{
    func_800AB414();
    u_play_music(0x42, 0);
    lbl_0000925C();
    optionWork.unkB0 = 0;
    optionWork.unkB4 = 0;
    modeCtrl.courseFlags &= ~(1 << 2);
    submodeFinishFunc = option_ranking_submode_finish;
    gameSubmodeRequest = SMD_OPTION_RANKING_MAIN;
}

// installed as submodeFinishFunc while the ranking submode is active
static void option_ranking_submode_finish(void)
{
    if (modeCtrl.courseFlags & (1 << 2))
        func_800AB444();
}

/* ================================================================== */
/* AUTOSAVE submode (auto-save prompt on exit)                         */
/* ================================================================== */

static void option_autosave_init(void)
{
    memcard_set_mode(3);
    event_start(EVENT_MEMCARD);
    modeCtrl.submodeTimer = 100;
    start_screen_fade(0x101, 0, modeCtrl.submodeTimer);
    u_play_music(modeCtrl.submodeTimer, 2);
    modeCtrl.courseFlags &= ~(1 << 2);
    gameSubmodeRequest = SMD_OPTION_AUTOSAVE_MAIN;
}

static void option_autosave_main(void)
{
    if (modeCtrl.submodeTimer > 0)
        modeCtrl.submodeTimer--;

    if (!(modeCtrl.courseFlags & (1 << 2)))
    {
        if (eventInfo[EVENT_MEMCARD].state == EV_STATE_RUNNING)
            return;
        modeCtrl.courseFlags |= (1 << 2);
        return;
    }

    if (modeCtrl.submodeTimer > 0)
        return;

    modeCtrl.submodeTimer = 0;
    modeCtrl.menuSel = 3;
    modeCtrl.unk10 = 1;
    gameModeRequest = MD_ADV;
    gameSubmodeRequest = SMD_ADV_TITLE_REINIT;
}

/* ================================================================== */
/* SEPARATE MODE submode (split-screen layout select, 2x2 grid)        */
/* ================================================================== */

static void option_separate_init(void)
{
    lbl_00008A34();
    gameSubmodeRequest = SMD_OPTION_SEPARATE_MAIN;
}

static void option_separate_main(void)
{
    s32 orig = modeCtrl.splitscreenMode;
    s32 sel = orig;

    if (orig % 2 != 0)
    {
        // right column: LEFT moves to the left column
        if ((g_currPlayerButtons[2] & PAD_BUTTON_LEFT)
         || (g_currPlayerAnalogButtons[2] & PAD_BUTTON_LEFT))
            sel--;
    }
    else
    {
        // left column: RIGHT moves to the right column
        if ((g_currPlayerButtons[2] & PAD_BUTTON_RIGHT)
         || (g_currPlayerAnalogButtons[2] & PAD_BUTTON_RIGHT))
            sel++;
    }

    if ((u8)sel < 2)
    {
        // top row: DOWN moves to the bottom row
        if ((g_currPlayerButtons[2] & PAD_BUTTON_DOWN)
         || (g_currPlayerAnalogButtons[2] & PAD_BUTTON_DOWN))
            sel += 2;
    }
    else
    {
        // bottom row: UP moves to the top row
        if ((g_currPlayerButtons[2] & PAD_BUTTON_UP)
         || (g_currPlayerAnalogButtons[2] & PAD_BUTTON_UP))
            sel -= 2;
    }

    if ((u8)sel > 3)
        sel = 0;

    if ((u8)sel != orig)
    {
        u_play_sound_0(0x6C);
        modeCtrl.splitscreenMode = (u8)sel;
    }

    if (g_currPlayerButtons[2] & PAD_BUTTON_B)
    {
        u_play_sound_0(0x6B);
        lbl_00004260(0x5D);
        gameSubmodeRequest = SMD_OPTION_SELECT_INIT;
    }
}

/* ================================================================== */
/* PAD MENU submode (choose "pad config" vs. "vibration")              */
/* ================================================================== */

static void option_pad_menu_init(void)
{
    lbl_00009A78();
    optionWork.padMenuSel = (s8)optionWork.unk39;
    gameSubmodeRequest = SMD_OPTION_PAD_MENU_MAIN;
}

static void option_pad_menu_main(void)
{
    s32 sel = optionWork.padMenuSel;

    if ((g_currPlayerButtons[2] & PAD_BUTTON_UP)
     || (g_currPlayerAnalogButtons[2] & PAD_BUTTON_UP)
     || (g_currPlayerButtons[2] & PAD_BUTTON_DOWN)
     || (g_currPlayerAnalogButtons[2] & PAD_BUTTON_DOWN))
    {
        sel = (sel == 0) ? 1 : 0;
    }
    if (sel != optionWork.padMenuSel)
    {
        u_play_sound_0(0x6C);
        optionWork.padMenuSel = sel;
    }

    if (g_currPlayerButtons[2] & PAD_BUTTON_A)
    {
        u_play_sound_0(0x6A);
        if (optionWork.padMenuSel == 0)
        {
            lbl_00004204(0x5E);
            gameSubmodeRequest = SMD_OPTION_PAD_INIT;
        }
        else if (optionWork.padMenuSel == 1)
        {
            lbl_00004204(0x5E);
            gameSubmodeRequest = SMD_OPTION_PAD_VIB_INIT;
        }
    }
    else if (g_currPlayerButtons[2] & PAD_BUTTON_B)
    {
        u_play_sound_0(0x6B);
        lbl_00004260(0x5E);
        gameSubmodeRequest = SMD_OPTION_SELECT_INIT;
    }
}

/* ================================================================== */
/* PAD VIBRATION submode (per-controller rumble enable toggles)        */
/* ================================================================== */

static void option_pad_vib_init(void)
{
    optionWork.unk39 = 1;
    lbl_0000A534();
    optionWork.vibSel = 0;
    gameSubmodeRequest = SMD_OPTION_PAD_VIB_MAIN;
}

static void option_pad_vib_main(void)
{
    u8 curMask = vibration_get_cont_enable_mask();
    s32 newMask = curMask;
    s32 sel = optionWork.vibSel;

    if ((g_currPlayerButtons[2] & PAD_BUTTON_UP)
     || (g_currPlayerAnalogButtons[2] & PAD_BUTTON_UP))
    {
        if (--sel < 0)
            sel = 3;
    }
    else if ((g_currPlayerButtons[2] & PAD_BUTTON_DOWN)
     || (g_currPlayerAnalogButtons[2] & PAD_BUTTON_DOWN))
    {
        if (++sel >= 4)
            sel = 0;
    }
    if (sel != optionWork.vibSel)
    {
        u_play_sound_0(0x6C);
        optionWork.vibSel = sel;
    }

    if ((g_currPlayerButtons[2] & PAD_BUTTON_RIGHT)
     || (g_currPlayerAnalogButtons[2] & PAD_BUTTON_RIGHT)
     || (g_currPlayerButtons[2] & PAD_BUTTON_LEFT)
     || (g_currPlayerAnalogButtons[2] & PAD_BUTTON_LEFT))
    {
        u_play_sound_0(0x65);
        newMask ^= (1 << sel);
    }

    if ((u8)newMask != (u8)curMask)
        vibration_set_cont_enable_mask(newMask);

    if (g_currPlayerButtons[2] & PAD_BUTTON_B)
    {
        u_play_sound_0(0x6B);
        lbl_00004260(0x60);
        gameSubmodeRequest = SMD_OPTION_PAD_MENU_INIT;
    }
}

/* ================================================================== */
/* Draw callback (installed into lbl_802F1B70) -- per-submode scene     */
/* ================================================================== */

static void option_draw(void)
{
    if (gameSubmode >= SMD_OPTION_REPLAY_PLAY_INIT)
    {
        if (gameSubmode < SMD_OPTION_PAD_MENU_INIT)
        {
            // replay playback (0xC0 / 0xC1): render the live game scene
            draw_normal_game_scene();
            lbl_000038A8();
        }
    }
    else if (gameSubmode >= SMD_OPTION_MEMCARD_INIT)
    {
        /* memcard .. separate submodes draw nothing extra here */
    }
    else if (gameSubmode >= SMD_OPTION_PAD_INIT)
    {
        // pad config (0xB2 / 0xB3)
        lbl_00001598();
    }
}
