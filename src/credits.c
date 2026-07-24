/*
 * credits.c - Staff-roll / credits sequence (Super Monkey Ball)
 *
 * UNVERIFIED structural first-draft decompiled from asm/credits.s.
 * This repository cannot currently build (no CodeWarrior / baserom.dol), so
 * NOTHING here has been byte-match verified. Everything below only
 * "syntax-checks and structurally follows its template" (src/mode.c and
 * src/ending.c were used as structural templates).
 *
 * Notable unverified inventions (see report):
 *  - struct CreditsWork      : layout for the 0x2A0-byte blob at lbl_802C6918
 *  - struct CreditsStar      : element of the star/snow array lbl_801D7524
 *  - struct CreditsParticle  : element of lbl_801D83B0 / lbl_801DEF44 (stride 0x34)
 *  - the many lbl_802F22xx scalar state globals (types inferred from access width)
 *  - the large lbl_801D6E00 data buffer is left as a TODO data placeholder
 */

#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "avdisp.h"
#include "background.h"
#include "ball.h"
#include "camera.h"
#include "effect.h"
#include "event.h"
#include "gxutil.h"
#include "info.h"
#include "input.h"
#include "light.h"
#include "load.h"
#include "mathutil.h"
#include "mode.h"
#include "mot_ape.h"
#include "nl2ngc.h"
#include "pool.h"
#include "shadow.h"
#include "sound.h"
#include "sprite.h"
#include "stage.h"
#include "vibration.h"
#include "window.h"
#include "world.h"

/* ------------------------------------------------------------------------- */
/* Invented / unverified types                                               */
/* ------------------------------------------------------------------------- */

/*
 * lbl_802C6918 : 0x2A0-byte .bss blob = the credits "work" struct.
 * r28/r31 point at it in credits_init / credits_main.  Only the offsets the
 * code actually touches are named; the rest is filler.  UNVERIFIED.
 */
struct CreditsWork
{
    /* 0x00 */ u8 filler0[0xC];
    /* 0x0C */ f32 unkC;   // scalar "progress" position (fed to camera x & z)
    /* 0x10 */ f32 unk10;
    /* 0x14 */ f32 unk14;
    /* 0x18 */ f32 unk18;
    /* 0x1C */ f32 unk1C;
    /* 0x20 */ f32 unk20;
    /* 0x24 */ f32 unk24;  // previous unkC
    /* 0x28 */ f32 unk28;  // previous unk10
    /* 0x2C */ f32 unk2C;  // previous unk14
    /* 0x30 */ f32 unk30;
    /* 0x34 */ f32 unk34;
    /* 0x38 */ f32 unk38;
    /* 0x3C */ f32 unk3C;
    /* 0x40 */ f32 unk40;
    /* 0x44 */ f32 unk44;
    /* 0x48 */ f32 unk48;
    /* 0x4C */ f32 unk4C;
    /* 0x50 */ f32 unk50;
    /* 0x54 */ f32 unk54;
    /* 0x58 */ f32 unk58;
    /* 0x5C */ f32 unk5C;
    /* 0x60 */ f32 unk60;
    /* 0x64 */ f32 unk64;
    /* 0x68 */ f32 unk68;
    /* 0x6C */ f32 unk6C;  // Vec (model / ape world pos) x
    /* 0x70 */ f32 unk70;  // .y
    /* 0x74 */ f32 unk74;  // .z
    /* 0x78 */ Mtx unk78;
    /* 0xA8 */ Quaternion unkA8;
    /* 0xB8 */ Mtx unkB8;
    /* 0xE8 */ u8 fillerE8[0x2A0 - 0xE8];
};

/* lbl_801D7524 : 200 stars/snow points, stride 0x10.  UNVERIFIED. */
struct CreditsStar
{
    /* 0x0 */ f32 x;
    /* 0x4 */ f32 y;
    /* 0x8 */ f32 z;
    /* 0xC */ f32 unkC;   // read via fctiwz and compared to 0x100 = "active"
};

/* lbl_801D83B0 (524) and lbl_801DEF44 (290) : particles, stride 0x34.  UNVERIFIED. */
struct CreditsParticle
{
    /* 0x00 */ f32 unk0;
    /* 0x04 */ f32 unk4;
    /* 0x08 */ f32 unk8;
    /* 0x0C */ f32 unkC;
    /* 0x10 */ f32 unk10;
    /* 0x14 */ f32 unk14;
    /* 0x18 */ f32 unk18;
    /* 0x1C */ f32 unk1C;
    /* 0x20 */ f32 unk20;
    /* 0x24 */ f32 unk24;
    /* 0x28 */ f32 unk28;
    /* 0x2C */ f32 unk2C;
    /* 0x30 */ f32 unk30;
};

/* ------------------------------------------------------------------------- */
/* Data tables (owned by asm/credits.s .data/.bss).                          */
/* TODO: these large tables are NOT transcribed here - declared extern.       */
/* ------------------------------------------------------------------------- */
extern u8 lbl_801D6E00[];                     /* 0x801D6E00 big composite credits data buffer */
extern struct CreditsStar lbl_801D7524[200];  /* 0x801D7524 (== lbl_801D6E00 + 0x724) */
extern struct CreditsParticle lbl_801D83B0[]; /* 0x801D83B0 (== lbl_801D6E00 + 0x15B0), 524 */
extern struct CreditsParticle lbl_801DEF44[]; /* 0x801DEF44, 290 */

/* Character strings used by the roll (asm .sdata) */
extern char string_STAFF[];

/* ------------------------------------------------------------------------- */
/* Credits state globals (asm .sbss lbl_802F22xx).  Types from access width. */
/* ------------------------------------------------------------------------- */
struct CreditsWork lbl_802C6918;

s32 lbl_802F2210;
s32 lbl_802F2214;
s32 lbl_802F2218;
s32 lbl_802F221C;
s32 lbl_802F2220;   /* scratch loop index */
s32 lbl_802F2224;
s32 lbl_802F2228;
s32 lbl_802F222C;   /* main phase counter */
s32 lbl_802F2230;
u8  lbl_802F2234;   /* current roll character */
s32 lbl_802F2238;
s32 lbl_802F223C;
s32 lbl_802F2240;
s32 lbl_802F2244;
s32 lbl_802F2248;
s32 lbl_802F224C;
s32 lbl_802F2250;
struct Ape *lbl_802F2254;
s32 lbl_802F2258;
s32 lbl_802F225C;
f32 lbl_802F2260;
s32 lbl_802F2264;   /* angle */
f32 lbl_802F2268;
f32 lbl_802F226C;
f32 lbl_802F2270;
f32 lbl_802F2274;   /* velocity of unkC */
f32 lbl_802F2278;
f32 lbl_802F227C;
s32 lbl_802F2280;
s32 lbl_802F2284;
s32 lbl_802F2288;
s32 lbl_802F228C;
s32 lbl_802F2290;
s32 lbl_802F2294;
s32 lbl_802F2298;
s32 lbl_802F229C;   /* glyph/model index from func_800B4710 */
f32 lbl_802F22A0;
f32 lbl_802F22A4;
f32 lbl_802F22A8;
f32 lbl_802F22AC;
f32 lbl_802F22B0;
f32 lbl_802F22B4;   /* main timeline value */
f32 lbl_802F22B8;
f32 lbl_802F22BC;
f32 lbl_802F22C0;
/* lbl_802F22C8 is declared "extern u32" in variables.h and shared with
 * game.c / memcard.c / ending_dialogue.c; credits owns the definition. */
u32 lbl_802F22C8;

/* forward decls */
void func_800B0B48(void);
void func_800B340C(void);
void func_800B34B4(void);
void func_800B361C(void);
void func_800B3784(void);
void func_800B38EC(void);
void func_800B3CC8(void);
void func_800B3DCC(void);
void func_800B3ECC(void);
void func_800B42EC(void);
void func_800B4710(int c);
void func_800B4A50(void);
void func_800B5020(void);
void func_800B55E4(void);
void func_800B5B5C(void);
void func_800B5C54(void);

/* ------------------------------------------------------------------------- */

void credits_finish(void)
{
    u_free_minigame_graphics();
    ape_destroy(lbl_802F2254);
    lbl_802F2254 = NULL;
    event_finish_all();
    destroy_sprite_with_tag(0);
    call_bitmap_free_group(2);
    u_play_music(0x46, 1);
}

void credits_init(void)
{
    struct CreditsWork *work = &lbl_802C6918;
    struct Ball *savedBall = currentBall;
    s8 *status;
    struct Ball *ball;
    int i;

    event_finish_all();
    load_stage(0xC5);
    submodeFinishFunc = credits_finish;
    start_screen_fade(0x100, 0x00FFFFFF, 0x1E);

    event_start(0x12);
    event_start(0xF);
    event_start(1);
    event_start(0x13);
    event_start(0xD);
    event_start(4);
    event_start(5);
    event_start(7);
    event_start(0x10);
    event_start(2);
    event_start(0xB);
    u_play_music(0x46, 0);
    camera_set_state_all(CAMERA_STATE_CREDITS);
    event_start(3);

    status = g_poolInfo.playerPool.statusList;
    ball = ballInfo;
    for (i = 0; i < g_poolInfo.playerPool.count; i++)
    {
        if (status[i] == STAT_NORMAL)
        {
            currentBall = ball;
            ball->state = 0;
        }
        ball += 1;
    }
    currentBall = savedBall;

    call_bitmap_load_group(2);
    info_init_first();

    currentCamera->eye.x = 0.0f;
    work->unkC = 0.0f;
    currentCamera->lookAt.x = work->unkC;
    currentCamera->rotZ = 0;
    lbl_802F2214 = 0;

    work->unk18 = work->unkC - (-90.0f);
    work->unk1C = 0.5f;
    work->unk20 = 0.07999999821186066f;

    currentBall = ballInfo + modeCtrl.currPlayer;

    work->unk24 = 0.0f;
    work->unkC = 0.0f;
    work->unk28 = 1.0f;
    work->unk10 = 1.0f;
    work->unk2C = 0.0f;
    work->unk14 = 0.0f;
    lbl_802F2274 = 0.0f;
    lbl_802F2278 = -90.0f;
    lbl_802F22B8 = 0.0f;
    work->unk38 = 0.0f;
    work->unk34 = 0.0f;
    work->unk30 = 0.0f;

    work->unk64 = 1.0f;
    work->unk50 = 1.0f;
    work->unk3C = 1.0f;
    work->unk60 = 0.0f;
    work->unk5C = 0.0f;
    work->unk54 = 0.0f;
    work->unk4C = 0.0f;
    work->unk44 = 0.0f;
    work->unk40 = 0.0f;
    work->unk6C = 1.0f;
    work->unk74 = 0.0f;
    work->unk70 = 0.0f;

    mathutil_mtxA_from_identity();
    mathutil_mtxA_to_mtx(work->unk78);
    mathutil_mtxA_to_quat(&work->unkA8);

    lbl_802F22AC = 0.0f;
    lbl_802F22B4 = -90.0f;
    lbl_802F22A4 = 0.0f;
    lbl_802F22BC = 0.0f;
    lbl_802F2288 = 0;
    lbl_802F222C = 1;
    lbl_802F2210 = 0;
    lbl_802F2228 = 0;
    lbl_802F2284 = 0;
    lbl_802F2218 = 0;
    lbl_802F225C = 0;
    lbl_802F2258 = 0;
    lbl_802F2224 = 0;

    func_800B3784();
    func_800B5B5C();
    func_800B340C();
    func_800B34B4();

    gameSubmodeRequest = 0x93;
}

/*
 * credits_main - per-frame credits update (camera / timeline / SFX driver).
 * Structural draft; the dense float arithmetic is transcribed as faithfully
 * as the read allows but is UNVERIFIED.
 */
void credits_main(void)
{
    struct CreditsWork *work = &lbl_802C6918;
    s8 *status;
    struct World *world;
    int i;

    if (debugFlags & 0xA)
        goto done;

    if (lbl_802F22B4 == 0.0f)
    {
        status = g_poolInfo.playerPool.statusList;
        world = worldInfo;
        for (i = 0; i < g_poolInfo.playerPool.count; i++)
        {
            if (status[i] == STAT_NORMAL)
                world->state = 0xB;
            world += 1;
        }
        lbl_802F2288 = 1;
    }

    if (lbl_802F22A4 != 0.0f && lbl_802F2288 != 0)
        event_finish(2);

    currentCamera->eye.x = work->unkC;
    currentCamera->lookAt.x = work->unkC;
    {
        struct Ball *b = ballInfo + modeCtrl.currPlayer;
        b->pos.x = work->unkC;
        b->pos.y = work->unk10;
        b->pos.z = work->unk14;
    }

    if (lbl_802F22C8 & (1 << 1))
    {
        int padIdx = playerControllerIDs[modeCtrl.currPlayer];
        if ((controllerInfo[padIdx].pressed.button & PAD_BUTTON_START)
         && lbl_802F2258 == 0
         && lbl_802F22B4 >= -60.0
         && lbl_802F22B4 <= 2880.0)
        {
            lbl_802F2258 = 1;
            lbl_802F22B4 = 4000.0f;
        }
    }

    if (lbl_802F22B4 >= 0.0 && lbl_802F22B4 <= 0.5)
        lbl_802F225C = 1;

    if (lbl_802F222C >= 80.0 && lbl_802F222C <= 2900.0 && lbl_802F222C < 0x24)
    {
        lbl_802F222C += 1;
        lbl_802F22A8 = 0.0f;
        if ((lbl_802F222C & 1) != 0)
            func_800B3784();
        if ((lbl_802F222C & 1) == 0)
            func_800B361C();
        func_800B34B4();
    }
    if ((lbl_802F222C & 1) != 0)
        func_800B3CC8();
    if ((lbl_802F222C & 1) == 0)
        func_800B3DCC();

    if (lbl_802F22A4 != 0.0f)
        lbl_802F22A8 += 1.0f;

    /* --- timeline advance (lbl_802F22B4 / lbl_802F2274) --- */
    if (lbl_802F22A4 == 0.0f)
    {
        f32 acc = lbl_802F2278;
        lbl_802F22B8 += acc;
        lbl_802F22B4 += acc;
        lbl_802F22A0 -= 1.0f;
        if (lbl_802F22B8 < 10.0)
            lbl_802F22B8 = 0.0f;
        if (lbl_802F22B4 > 0.0f)
            lbl_802F22AC += 1.0f;
    }

    /* controller-driven speed of lbl_802F2274 (draft) */
    if (lbl_802F22A4 == 0.0f && lbl_802F2288 != 0)
    {
        int padIdx = playerControllerIDs[modeCtrl.currPlayer];
        f32 stickY = (f32)(s8)controllerInfo[padIdx].held.stickX;
        if (stickY < -60.0f)
        {
            lbl_802F2274 = lbl_802F2274 - 0.01;
            lbl_802F2214++;
        }
        else if (stickY < 60.0f)
        {
            lbl_802F2274 = lbl_802F2274 + 0.01;
            lbl_802F2214++;
        }
        else
        {
            lbl_802F2274 = lbl_802F2274 + (stickY - 6000.0f) / 6000.0f;
            lbl_802F2214++;
        }
    }

    lbl_802F2274 = (f32)(lbl_802F2274 * 0.98);
    work->unk24 = work->unkC;
    work->unk2C = work->unk14;
    work->unk28 = work->unk10;
    work->unkC = work->unkC + lbl_802F2274;

    /* star / snow proximity + background interaction loop (draft) */
    if (lbl_802F2284 == 0)
    {
        lbl_802F2220 = 0;
        for (lbl_802F2220 = 0; lbl_802F2220 < 0xC8; lbl_802F2220++)
        {
            struct CreditsStar *st = &lbl_801D7524[lbl_802F2220];
            if ((int)st->unkC != 0x100)
                continue;
            {
                f32 dx = st->x - work->unkC;
                f32 dy = st->y - work->unk10;
                f32 dz = lbl_802F22B4 - st->z;
                f32 d2 = dx * dx + dy * dy + dz * dz;
                if (d2 <= 0.0f)
                    continue;
                if (sqrtf(d2) >= 1.0f)
                    continue;
            }
            lbl_802F2280 = 1;
            u_play_sound_0(0xB003);
            st->unkC = 255.0f;
            if (lbl_802F2228 % 10 == 0)
                u_play_sound_0(0x501F);
            lbl_802F2228 += 1;
            /* background_interact when >=8 flakes present (draft) */
            background_interact(0);
        }
    }

    if (lbl_802F2280 != 0)
    {
        u_play_sound_0(0x3B003);
        lbl_802F2280 = 0;
    }

    if (work->unkC < -9.35)
    {
        lbl_802F2274 = lbl_802F2274 * -1.0f;
        work->unkC = -9.350000381469727f;
    }
    if (9.35 < work->unkC)
    {
        lbl_802F2274 = lbl_802F2274 * -1.0f;
        work->unkC = 9.350000381469727f;
    }

    currentCamera->eye.x = work->unkC;
    currentCamera->lookAt.x = work->unkC;

    lbl_802F2270 = 10.0f;
    lbl_802F2268 = lbl_802F2274;
    lbl_802F226C = lbl_802F2278;
    work->unk6C = work->unkC;
    work->unk70 = work->unk10;
    work->unk74 = work->unk14;

    lbl_802F22B0 = lbl_802F22B4;
    lbl_802F2270 = 1000.0f;

    func_800B5020();
    func_800B4A50();

    work->unkC = work->unk6C;
    work->unk10 = work->unk70;
    work->unk14 = work->unk74;

    lbl_802F22B4 = lbl_802F22B0;
    lbl_802F2274 = lbl_802F2268;
    lbl_802F2278 = lbl_802F226C;
    if (lbl_802F22A4 == 0.0f)
        func_800B55E4();
    func_800B5C54();

    lbl_802F2260 = (f32)(fabs(lbl_802F2278) / 0.00275);

    /* engine sound + timeline event SFX (draft) */
    if (lbl_802F22B4 < 0.0)
    {
        SoundIcsReq((s8)currentBall->playerId, 0, 0);
    }
    else if (lbl_802F22A4 != 0.0f)
    {
        SoundIcsReq((s8)currentBall->playerId, 0, 0);
    }
    else if (lbl_802F225C != 0)
    {
        SoundIcsReq((s8)currentBall->playerId, (int)lbl_802F2260, 0x41);
    }

    if (-30.0 <= lbl_802F22B4 && lbl_802F22B4 < -29.8)
        SoundReq(0x8C);
    if (-0.4 <= lbl_802F22B4 && lbl_802F22B4 < -0.2)
        SoundReq(0x8D);
    if (lbl_802F22B4 >= 2900.0 && lbl_802F22B4 < 2900.2)
        u_play_sound_0(8);
    if (lbl_802F22B4 >= -5.0 && lbl_802F22B4 < -3.0)
        u_play_sound_0(0x1E);

    if (lbl_802F22A4 != 0.0f)
    {
        f32 t = (f32)globalAnimTimer - lbl_802F22B4;
        if (20.0 <= t && t < 22.0)
        {
            if (lbl_802F2224 <= 0xB)
                u_play_sound_0(0x59);
            else if (lbl_802F2224 <= 0x16)
                u_play_sound_0(0x58);
            else
                u_play_sound_0(0x1B);
        }
    }

    if (lbl_802F2258 == 0 && lbl_802F22A4 != 0.0f)
    {
        f32 t = (f32)globalAnimTimer - lbl_802F22B4;
        if (t == 55.0)
            u_play_sound_0(0x1E9);
    }
    if (lbl_802F22A4 != 0.0f)
    {
        f32 t = (f32)globalAnimTimer - lbl_802F22B4;
        if (t == 300.0)
            u_play_sound_0(0x126);
    }
    if (lbl_802F22A4 != 0.0f)
    {
        f32 t = (f32)globalAnimTimer - lbl_802F22B4;
        if (t == 500.0)
            SoundOffID(0x126);
    }

    /* copy common-model root pos into work Vec, build billboard matrix */
    {
        u8 *m = *(u8 **)((u8 *)g_commonNlObj + 0xC);
        work->unk6C = *(f32 *)(m + 8);
        work->unk70 = *(f32 *)(m + 0xC);
        work->unk74 = *(f32 *)(m + 0x10);
    }
    mathutil_mtxA_from_identity();
    mathutil_mtxA_rotate_y(lbl_802F2264);
    mathutil_mtxA_rotate_x(0x4000);
    mathutil_mtxA_scale_xyz(0.10000000149011612f, 0.03999999910593033f, 0.10000000149011612f);
    mathutil_mtxA_translate_xyz(-work->unk6C, -work->unk70, -work->unk74);
    mathutil_mtxA_to_mtx(work->unkB8);

done:
    ;
}

/*
 * func_800B340C - clear/reset the 200-entry star array (lbl_801D7524).
 * Each 0x80 block covers 8 stars; 25 blocks = 200 stars.
 */
void func_800B340C(void)
{
    f32 *p = (f32 *)lbl_801D7524;
    int i;

    for (i = 0; i < 0x19; i++)
    {
        int j;
        for (j = 0; j < 8; j++)
        {
            p[0] = -100.0f;
            p[2] = 256.0f;      /* lbl_802F6408 */
            p[3] = -0.0f;       /* lbl_802F6274 */
            p[2] = -0.0f;       /* second store to 0x8 (matches asm ordering) */
            p += 4;
        }
    }
}

/*
 * func_800B34B4 - randomize the 200 stars (lbl_801D7524).
 */
void func_800B34B4(void)
{
    struct CreditsStar *st = lbl_801D7524;
    f32 y = 10.0f;   /* lbl_802F60BC */
    int i;

    for (i = 0; i < 0xC8; i++)
    {
        st->x = 0.0f;
        st->z = 0.0f;
        st->unkC = (f32)(int)st->unkC;             /* fctiwz round-trip */
        st->x = (f32)((rand() & 0x1FFFF) % 19 - 9); /* [-9 .. 9] */
        st->y = y;
        y = (f32)(y + 0.4);
        if (y >= 65.0)
            y = 11.0f;
        st->z = st->y + (f32)((lbl_802F222C - 1) * 80.0);
        st += 1;
    }
}

/*
 * func_800B361C - (re)spawn the 524-entry particle array lbl_801D83B0.
 */
void func_800B361C(void)
{
    struct CreditsParticle *pt = lbl_801D83B0;
    int i;

    lbl_802F2220 = 0;
    for (i = 0; i < 0x20C; i++)
    {
        pt->unk18 = 0.0f;
        pt->unkC = pt->unk8;
        pt->unk1C = 0.0f;
        pt->unk10 = 0.0f;
        pt->unk10 = (f32)((rand() & 0x1FFFF) % 30 - 0);         /* base */
        pt->unk10 = (f32)(pt->unk10 + (25.0 + 5.0 * (lbl_802F222C - 1)));
        pt->unk20 = (f32)(int)pt->unk20;
        pt->unk28 = 0.0f;
        lbl_802F2220++;
        pt += 1;
    }
}

/*
 * func_800B3784 - (re)spawn the 290-entry particle array lbl_801DEF44.
 * Same shape as func_800B361C but a different table/count and offset 0x14.
 */
void func_800B3784(void)
{
    struct CreditsParticle *pt = lbl_801DEF44;
    int i;

    lbl_802F2220 = 0;
    for (i = 0; i < 0x122; i++)
    {
        pt->unk18 = 0.0f;
        pt->unkC = pt->unk8;
        pt->unk1C = 0.0f;
        pt->unk14 = 0.0f;
        pt->unk14 = (f32)((rand() & 0x1FFFF) % 30 - 0);
        pt->unk14 = (f32)(pt->unk14 + (90.0 + 5.0 * (lbl_802F222C - 1)));
        pt->unk20 = (f32)(int)pt->unk20;
        pt->unk28 = 0.0f;
        lbl_802F2220++;
        pt += 1;
    }
}

/*
 * func_800B38EC - draw the star / snow field (lbl_801D7524) as billboarded
 * models.  Full structural transcription of asm/credits.s 4081..4337.
 * (Expanded this pass from the previous placeholder stub.)  UNVERIFIED: no
 * byte-match possible, but every asm branch/call/matrix op is reproduced.
 *
 * Per star:
 *   - if (int)unkC == 0x100 (spawned/active): draw when the timeline delta is
 *     inside the -30..5 window; the sub-band 0..10 (relative to the current
 *     phase's 80-unit block) fades the star in (post_mult_color + alpha),
 *     otherwise it is drawn solid; then a second decoration NL model is drawn.
 *   - otherwise it is in the "collected" state: unkC counts down by 10 each
 *     frame (a shrink-away animation, drawn translucent) until it reaches 0.
 *
 * Model 0x23 of commonGma (== 0x118/8) is the star model; NL model 3 of
 * g_commonNlObj is the small decoration drawn over each active star.
 */
void func_800B38EC(void)
{
    struct CreditsWork *work = &lbl_802C6918;

    for (lbl_802F2220 = 0; lbl_802F2220 < 0xC8; lbl_802F2220++)
    {
        struct CreditsStar *st = &lbl_801D7524[lbl_802F2220];

        if ((int)st->unkC == 0x100)
        {
            f32 d = lbl_802F22B4 - st->z;
            f32 band;

            if (d <= -30.0 || d >= 5.0)
                continue;

            band = lbl_802F22B4 - 80.0 * (lbl_802F222C - 1);
            if (band >= 0.0 && band <= 10.0)
            {
                /* fade-in band: scaled/alpha'd draw */
                f32 s;
                mathutil_mtxA_from_mtxB();
                mathutil_mtxA_translate_xyz(st->x, st->y, lbl_802F22B4 - st->z);
                mathutil_mtxA_rotate_y(globalAnimTimer << 9);
                s = (lbl_802F22B4 - 80.0 * (lbl_802F222C - 1)) / 10.0 * 10.0 / 10.0;
                mathutil_mtxA_scale_xyz(s, s, s);
                gxutil_load_pos_nrm_matrix(mathutilData->mtxA, 0);
                avdisp_set_post_mult_color(1.0f, 1.0f, 1.0f, 1.0f);
                avdisp_set_alpha((lbl_802F22B4 - 80.0 * (lbl_802F222C - 1)) / 10.0);
                avdisp_draw_model_culled_sort_all(commonGma->modelEntries[0x23].model);
            }
            else
            {
                /* outside fade band: solid draw */
                mathutil_mtxA_from_mtxB();
                mathutil_mtxA_translate_xyz(st->x, st->y, lbl_802F22B4 - st->z);
                mathutil_mtxA_rotate_y(globalAnimTimer << 9);
                gxutil_load_pos_nrm_matrix(mathutilData->mtxA, 0);
                avdisp_draw_model_culled_sort_none(commonGma->modelEntries[0x23].model);
            }

            /* small decoration NL model over the star */
            mathutil_mtxA_translate_xyz(0.0f, -0.495f, 0.0f);
            mathutil_mtxA_scale_xyz(-0.5f, -0.5f, -0.5f);
            nl2ngc_draw_model_alpha_sort_none(NLOBJ_MODEL(g_commonNlObj, 3), 0.4f);
        }
        else
        {
            f32 fade;
            f32 s;

            if ((int)st->unkC <= 0)
            {
                st->unkC = 0.0f;
                continue;
            }
            st->unkC = st->unkC - 10.0f;

            mathutil_mtxA_from_mtxB();
            fade = 1.0 - st->unkC * 0.00390625f;   /* 1/256 */
            mathutil_mtxA_translate_xyz(
                fade * ((work->unk18 + work->unkC) - st->x),
                (work->unk1C - st->y) * fade,
                (work->unk20 - (lbl_802F22B4 - st->z)) * fade);
            mathutil_mtxA_translate_xyz(st->x, st->y, lbl_802F22B4 - st->z);
            s = 1.0 - (256.0f - st->unkC) * 0.00390625f;
            mathutil_mtxA_scale_xyz(s, s, s);
            mathutil_mtxA_rotate_y(globalAnimTimer << 12);
            gxutil_load_pos_nrm_matrix(mathutilData->mtxA, 0);
            avdisp_draw_model_culled_sort_translucent(
                commonGma->modelEntries[0x23].model);
        }
    }
}

/*
 * func_800B3CC8 - update one half of the lbl_801D6E00 particle sub-array.
 * Structural draft.  UNVERIFIED.
 */
void func_800B3CC8(void)
{
    /* counts stored at lbl_801D6E00 + phase*8 - 8/-4 */
    s32 *hdr = (s32 *)(lbl_801D6E00 + lbl_802F222C * 8);
    struct CreditsParticle *pt;
    f32 tl = lbl_802F22B4;
    int i;

    lbl_802F228C = hdr[-2];
    lbl_802F2290 = hdr[-1];
    lbl_802F2220 = lbl_802F228C;

    pt = (struct CreditsParticle *)(lbl_801D6E00 + 0x10000 + lbl_802F2220 * 0x34 - 32444);
    for (i = lbl_802F2220; i < lbl_802F2290; i++)
    {
        pt->unkC = pt->unkC + pt->unk1C;
        if (tl == pt->unk14)
            pt->unk18 = 10.0f;
        if (10.0f == pt->unk18)
        {
            pt->unk1C = (f32)(pt->unk1C - 0.01);
            pt->unk18 = 10.0f;
            if (pt->unkC < 0.0 && pt->unk0 <= 9.5 && pt->unk0 >= -9.5)
            {
                pt->unkC = 0.0f;
                pt->unk18 = 1.0f;
            }
            else
            {
                pt->unk18 = 1.0f;
            }
        }
        lbl_802F2220++;
        pt += 1;
    }
}

/*
 * func_800B3DCC - as func_800B3CC8 but for the other lbl_801D6E00 sub-array.
 * Structural draft.  UNVERIFIED.
 */
void func_800B3DCC(void)
{
    s32 *hdr = (s32 *)(lbl_801D6E00 + 0x118 + lbl_802F222C * 8);
    struct CreditsParticle *pt;
    f32 tl = lbl_802F22B4;
    int i;

    lbl_802F2294 = hdr[0];
    lbl_802F2298 = hdr[1];
    lbl_802F2220 = lbl_802F2294;

    pt = (struct CreditsParticle *)(lbl_801D6E00 + lbl_802F2220 * 0x34 + 0x15B0);
    for (i = lbl_802F2220; i < lbl_802F2298; i++)
    {
        pt->unkC = pt->unkC + pt->unk1C;
        if (tl == pt->unk10)
            pt->unk18 = 10.0f;
        if (10.0f == pt->unk18)
        {
            pt->unk1C = (f32)(pt->unk1C - 0.01);
            pt->unk18 = 10.0f;
            if (pt->unkC < 0.0 && pt->unk0 <= 9.5 && pt->unk0 >= -9.5)
            {
                pt->unkC = 0.0f;
                pt->unk18 = 1.0f;
            }
            else
            {
                pt->unk18 = 1.0f;
            }
        }
        lbl_802F2220++;
        pt += 1;
    }
}

/*
 * func_800B3ECC - draw the roll's letter models (from decodedStageGma),
 * one glyph per lbl_801D83B0 entry.  Structural draft.  UNVERIFIED.
 */
void func_800B3ECC(void)
{
    int i;

    for (lbl_802F2220 = 0; lbl_802F2220 < lbl_802F2298; lbl_802F2220++)
    {
        struct CreditsParticle *pt = &lbl_801D83B0[lbl_802F2220];

        lbl_802F2234 = lbl_801D6E00[0x13A4 + lbl_802F2220];
        func_800B4710((s8)lbl_802F2234);
        if (lbl_802F2234 == 0x2B)
            continue;

        if (0.0f == pt->unk18)
        {
            mathutil_mtxA_from_mtx((f32 (*)[4])userWork);
            mathutil_mtxA_translate_xyz(pt->unk0, pt->unk4, pt->unkC);
            mathutil_mtxA_scale_xyz(0.8500000238418579f, 0.8500000238418579f, 0.8500000238418579f);
            gxutil_load_pos_nrm_matrix(mathutilData->mtxA, 0);
            avdisp_draw_model_unculled_sort_translucent(
                decodedStageGmaPtr->modelEntries[lbl_802F229C].model);
        }
    }
    (void)i;
}

/*
 * func_800B4710 - map a roll character to a glyph/model index (lbl_802F229C).
 * Faithful: this is a literal switch over the (sign-extended) character.
 */
void func_800B4710(int c)
{
    switch ((s8)c)
    {
    case 'A': case 'a': lbl_802F229C = 0x01; break;
    case 'B': case 'b': lbl_802F229C = 0x07; break;
    case 'C': case 'c': lbl_802F229C = 0x0C; break;
    case 'D': case 'd': lbl_802F229C = 0x10; break;
    case 'E': case 'e': lbl_802F229C = 0x13; break;
    case 'F': case 'f': lbl_802F229C = 0x17; break;
    case 'G': case 'g': lbl_802F229C = 0x1A; break;
    case 'H': case 'h': lbl_802F229C = 0x1C; break;
    case 'I': case 'i': lbl_802F229C = 0x1D; break;
    case 'J': case 'j': lbl_802F229C = 0x1E; break;
    case 'K': case 'k': lbl_802F229C = 0x1F; break;
    case 'L': case 'l': lbl_802F229C = 0x20; break;
    case 'M': case 'm': lbl_802F229C = 0x22; break;
    case 'N': case 'n': lbl_802F229C = 0x24; break;
    case 'O': case 'o': lbl_802F229C = 0x26; break;
    case 'P': case 'p': lbl_802F229C = 0x28; break;
    case 'Q': case 'q': lbl_802F229C = 0x2E; break;
    case 'R': case 'r': lbl_802F229C = 0x30; break;
    case 'S': case 's': lbl_802F229C = 0x31; break;
    case 'T': case 't': lbl_802F229C = 0x38; break;
    case 'U': case 'u': lbl_802F229C = 0x3B; break;
    case 'V': case 'v': lbl_802F229C = 0x3D; break;
    case 'W': case 'w': lbl_802F229C = 0x3E; break;
    case 'X': case 'x': lbl_802F229C = 0x3F; break;
    case 'Y': case 'y': lbl_802F229C = 0x40; break;
    case 'Z': case 'z': lbl_802F229C = 0x41; break;
    case ',': lbl_802F229C = 0x0E; break;
    case '.': lbl_802F229C = 0x2C; break;
    case '&': lbl_802F229C = 0x03; break;
    case '/': lbl_802F229C = 0x37; break;
    case '2': lbl_802F229C = 0x3A; break;
    default: break;
    }
}

/* ------------------------------------------------------------------------- */
/* The following are large draw / physics / ape functions that have only     */
/* been analysed at the call-graph level.  They are left as clearly-marked   */
/* structural stubs to keep the file self-consistent and compilable.         */
/* TODO(decomp): expand from asm/credits.s (offsets noted).                   */
/* ------------------------------------------------------------------------- */

/*
 * func_800B0B48 @ 0x800B0B48 : the master credits DRAW routine (~2747 asm
 * instructions).  Draws the scene: ball shadow, lit background, stage,
 * effects, then a long series of alpha-blended scrolling background gradient
 * panels, the roll's letter models (via func_800B38EC / func_800B3ECC /
 * func_800B42EC), and the sprite/text overlays.
 *
 * Only the top-level orchestration prologue is decompiled with confidence.
 * The very large conditional draw body (dozens of near-identical
 * avdisp_set_post_mult_color / mathutil_mtxA_translate_xyz / avdisp_set_alpha /
 * avdisp_draw_model_unculled_sort_* sequences plus the text/sprite HUD) is
 * summarised structurally and left as a TODO.  UNVERIFIED.
 */
void func_800B0B48(void)
{
    /* asm passes modeCtrl.currPlayer in r3, but the header prototype for
     * change_current_camera() takes no parameters, so it is called bare here. */
    change_current_camera();
    u_draw_ball_shadow();
    background_light_assign();
    reset_light_group(modeCtrl.currPlayer);

    if (lbl_802F2254 != NULL)
        mot_ape_thread(lbl_802F2254, 0);

    /* orient the "sky" matrix stashed in userWork+0x30 */
    mathutil_mtxA_from_mtx((f32 (*)[4])((u8 *)userWork + 0x30));
    mathutil_mtxA_translate_xyz(0.0f, 200.0f, 0.0f);   /* lbl_802F6238 */
    mathutil_mtxA_rotate_x(-2304);
    mathutil_mtxA_to_mtx((f32 (*)[4])((u8 *)userWork + 0x30));

    stage_draw();
    background_draw();
    effect_draw();

    /*
     * TODO(decomp): the remainder (asm/credits.s lines ~1046..3749) draws:
     *   - if (lbl_802F22B4 < 0): a stack of scrolling background gradient
     *     panels (repeated set_post_mult_color / translate(z = -120,-110,...) /
     *     set_alpha(0.6,0.7,0.8,0.9,1.0) / draw model from decodedStageGma),
     *   - the star field         -> func_800B38EC(),
     *   - the roll letter models  -> func_800B3ECC() and func_800B42EC(),
     *   - the ape / ball,
     *   - the sprite + text overlays (create_sprite, sprite_printf, sprintf,
     *     set_text_pos/font/mul_color/opacity, func_800702C8, func_80071B50).
     * These are structurally repetitive but not transcribed here.
     */
    func_800B38EC();
    func_800B3ECC();
    func_800B42EC();
}

/*
 * func_800B42EC @ 0x800B42EC : second glyph/model draw pass, sibling of
 * func_800B3ECC (walks the other letter sub-array of lbl_801D6E00 and draws
 * each glyph model from decodedStageGma).  Structural draft.  UNVERIFIED.
 */
void func_800B42EC(void)
{
    s32 *hdr = (s32 *)(lbl_801D6E00 + lbl_802F222C * 8);

    lbl_802F228C = hdr[-2];
    lbl_802F2290 = hdr[-1];

    for (lbl_802F2220 = lbl_802F228C; lbl_802F2220 < lbl_802F2290; lbl_802F2220++)
    {
        struct CreditsParticle *pt =
            (struct CreditsParticle *)(lbl_801D6E00 + lbl_802F2220 * 0x34 + 0x8144);

        lbl_802F2234 = lbl_801D6E00[lbl_802F2220];   /* char table region */
        func_800B4710((s8)lbl_802F2234);
        if (lbl_802F2234 == 0x2B)
            continue;

        if (0.0f == pt->unk18)
        {
            mathutil_mtxA_from_mtx((f32 (*)[4])userWork);
            mathutil_mtxA_translate_xyz(pt->unk0, pt->unk4, pt->unkC);
            mathutil_mtxA_scale_xyz(0.8500000238418579f, 0.8500000238418579f, 0.8500000238418579f);
            gxutil_load_pos_nrm_matrix(mathutilData->mtxA, 0);
            avdisp_draw_model_unculled_sort_translucent(
                decodedStageGmaPtr->modelEntries[lbl_802F229C].model);
        }
    }
}

/*
 * func_800B4A50 @ 0x800B4A50 : letter/banana collision with the ball.  For each
 * active letter of the current phase, tests distance to the ball; on a hit it
 * plays SFX + vibration and spawns a burst of "break apart" effects (built in
 * the work scratch area at work+0xE8 / +0x194).  Structural draft; the dense
 * per-letter distance math is approximated.  UNVERIFIED.
 */
void func_800B4A50(void)
{
    struct CreditsWork *work = &lbl_802C6918;
    struct Effect *fx = (struct Effect *)((u8 *)work + 0xE8);
    struct Effect *fx2 = (struct Effect *)((u8 *)work + 0x194);
    s32 *hdr = (s32 *)(lbl_801D6E00 + 0x118 + lbl_802F222C * 8);
    int i;
    int n;

    lbl_802F2294 = hdr[0];
    lbl_802F2298 = hdr[1];

    for (lbl_802F2220 = lbl_802F2294; lbl_802F2220 < lbl_802F2298; lbl_802F2220++)
    {
        struct CreditsParticle *pt =
            (struct CreditsParticle *)(lbl_801D6E00 + lbl_802F2220 * 0x34 + 0x15B0);
        f32 dist;

        if (1.0f != pt->unk18)                 /* 0x15c8: active flag */
            continue;
        if (lbl_801D6E00[0x13A4 + lbl_802F2220] == 0x2B)   /* '+' = space */
            continue;
        if (0.0f != *(f32 *)((u8 *)pt + 0x28)) /* 0x15d8: already-hit flag */
            continue;
        if (256.0f != *(f32 *)((u8 *)pt + 0x20))   /* 0x15d0 */
            continue;

        /* distance from the ball to this letter (draft) */
        {
            f32 dx = *(f32 *)((u8 *)pt + 0x8) - work->unkC;
            f32 dz = lbl_802F22B4 - pt->unk0 - work->unk14;
            f32 dy = 0.5 - work->unk10;             /* lbl_802F60F8 */
            dist = mathutil_sqrt(dx * dx + dy * dy + dz * dz);
        }
        if (dist >= 1.0f)                          /* lbl_802F6188 */
            continue;

        lbl_802F227C = mathutil_sqrt(lbl_802F2278 * lbl_802F2278
                                   + lbl_802F2274 * lbl_802F2274);

        /* nudge the ball off the letter along the collision normal (draft) */
        /* ...updates work->unkC/unk14, lbl_802F22B0/2268/226C... */

        SoundReq(8);
        *(f32 *)((u8 *)pt + 0x28) += 1.0f;     /* mark hit */
        *(f32 *)((u8 *)pt + 0x20) = 255.0f;
        lbl_802F22A0 = -15.0f;                 /* lbl_802F6468 */
        lbl_802F2228 -= 10;
        *(f32 *)((u8 *)pt + 0x24) = 1.0f;

        vibration_control(playerControllerIDs[modeCtrl.currPlayer], 1, 0x1E);
        u_play_sound_0(0x17);

        /* burst of 5 splash effects */
        memset(fx, 0, 0xAC);
        fx->type = 0x13;
        fx->playerId = (s16)modeCtrl.currPlayer;
        fx->pos.x = work->unkC;
        fx->pos.y = work->unk10;
        fx->pos.z = work->unk14;
        fx->unk18 = 0.2f;                      /* lbl_802F6314 stashed at sp+0x18 */
        for (lbl_802F2220 = 0; lbl_802F2220 < 5; lbl_802F2220++)
        {
            fx->vel.x = (f32)(RAND_FLOAT() * 0.11 - 0.25);   /* draft */
            fx->vel.y = (f32)(RAND_FLOAT() * 0.11 - 0.25 + 0.01);
            fx->vel.z = (f32)(RAND_FLOAT() * 0.11 - 0.25);
            spawn_effect(fx);
        }

        /* burst of 10 secondary effects */
        memset(fx2, 0, 0xAC);
        *(s16 *)((u8 *)fx2 + 0x14) = (s16)modeCtrl.currPlayer;
        *(s16 *)((u8 *)fx2 + 0x8) = 0x2F;
        *(void **)((u8 *)fx2 + 0x30) = (u8 *)work + 0xC;
        *(s16 *)((u8 *)fx2 + 0xA2) = (s16)(rand() & 0x7FFF);
        for (n = 0; n < 0xA; n++)
        {
            *(s32 *)((u8 *)fx2 + 0x10) = n;
            spawn_effect(fx2);
        }
    }
    (void)i;
}

/*
 * func_800B5020 @ 0x800B5020 : parallel of func_800B4A50 for the other letter
 * array (the two are dispatched back-to-back from credits_main).  Same shape.
 * Structural draft.  UNVERIFIED.  TODO(decomp): full body at lines 5682..6059.
 */
void func_800B5020(void)
{
    struct CreditsWork *work = &lbl_802C6918;
    struct Effect *fx = (struct Effect *)((u8 *)work + 0xE8);
    struct Effect *fx2 = (struct Effect *)((u8 *)work + 0x194);
    s32 *hdr = (s32 *)(lbl_801D6E00 + lbl_802F222C * 8);
    int n;

    lbl_802F228C = hdr[-2];
    lbl_802F2290 = hdr[-1];

    for (lbl_802F2220 = lbl_802F228C; lbl_802F2220 < lbl_802F2290; lbl_802F2220++)
    {
        struct CreditsParticle *pt =
            (struct CreditsParticle *)(lbl_801D6E00 + lbl_802F2220 * 0x34 + 0x8144);
        f32 dist;

        if (1.0f != pt->unk18)
            continue;
        /* distance from the ball to this letter (draft) */
        {
            f32 dx = pt->unk8 - work->unkC;
            f32 dz = lbl_802F22B4 - pt->unk0 - work->unk14;
            f32 dy = 0.5 - work->unk10;
            dist = mathutil_sqrt(dx * dx + dy * dy + dz * dz);
        }
        if (dist >= 1.0f)
            continue;

        SoundReq(8);
        vibration_control(playerControllerIDs[modeCtrl.currPlayer], 1, 0x1E);
        u_play_sound_0(0x17);

        memset(fx, 0, 0xAC);
        fx->type = 0x13;
        fx->playerId = (s16)modeCtrl.currPlayer;
        fx->pos.x = work->unkC;
        fx->pos.y = work->unk10;
        fx->pos.z = work->unk14;
        for (n = 0; n < 5; n++)
            spawn_effect(fx);

        memset(fx2, 0, 0xAC);
        for (n = 0; n < 0xA; n++)
            spawn_effect(fx2);
    }
}

/*
 * func_800B55E4 @ 0x800B55E4 : quaternion / ape orientation update.  Builds the
 * ball orientation quaternion (from velocity direction) and blends it with the
 * ape's motion using quat_mult / quat_slerp / quat_from_dirs.  Structural draft
 * of the call sequence.  UNVERIFIED.  TODO(decomp): full body at 6060..6415.
 */
void func_800B55E4(void)
{
    struct CreditsWork *work = &lbl_802C6918;
    Quaternion q0;
    Quaternion q1;
    Vec dir0;
    Vec dir1;
    f32 len;

    (void)work;

    /* orientation from current velocity direction */
    len = mathutil_sqrt(lbl_802F2274 * lbl_802F2274 + lbl_802F2278 * lbl_802F2278);
    dir0.x = (len != 0.0f) ? lbl_802F2274 / len : 0.0f;
    dir0.y = 0.0f;
    dir0.z = (len != 0.0f) ? lbl_802F2278 / len : 0.0f;
    dir1.x = 0.0f;
    dir1.y = 0.0f;
    dir1.z = 1.0f;

    mathutil_quat_from_dirs(&q0, &dir1, &dir0);
    mathutil_quat_from_axis_angle(&q1, &dir0, (s16)lbl_802F2264);
    mathutil_quat_mult(&q0, &q0, &q1);
    mathutil_quat_normalize(&q0);

    mathutil_mtxA_from_quat(&q0);
    mathutil_mtxA_to_mtx(work->unk78);
    mathutil_mtxA_to_quat(&work->unkA8);
    /* NOTE: several sin/normalize_len steps between are approximated. */
}

/*
 * func_800B5B5C @ 0x800B5B5C : create/init the credits ape.  Faithful draft.
 */
void func_800B5B5C(void)
{
    struct CreditsWork *work = &lbl_802C6918;
    struct Ape *ape;

    lbl_802F221C = playerCharacterSelection[modeCtrl.currPlayer];
    ape = u_make_ape((enum Character)lbl_802F221C);
    lbl_802F2254 = ape;

    work->unk6C = 0.0f;
    work->unk70 = 0.0f;
    work->unk74 = 1.0f;

    ape->pos.x = work->unkC;
    ape->pos.y = (f32)(work->unk10 - 0.14);   /* lbl_802F64B0 */
    ape->pos.z = work->unk14;
    ape->unk48.x = 0.0f;
    ape->unk48.y = 0.0f;
    ape->unk48.z = 0.0f;
    ape->colorId = modeCtrl.currPlayer;

    new_ape_stat_motion(ape, 8, 0, 0, 0.0f);
    ape_skel_anim_main(ape);
    mot_ape_set_quat_from_vec(ape, (Vec *)&work->unk6C);
}

/*
 * func_800B5C54 @ 0x800B5C54 : per-frame ape animation / orientation update.
 * Structural draft (motion-select + quaternion slerp).  UNVERIFIED.
 */
void func_800B5C54(void)
{
    struct CreditsWork *work = &lbl_802C6918;
    struct Ape *ape = lbl_802F2254;
    Quaternion q;
    s16 rotX, rotY, rotZ;
    f32 len;

    ape->pos.x = work->unkC;
    ape->pos.y = (f32)(work->unk10 - 0.12);   /* lbl_802F64B8 */
    ape->pos.z = work->unk14;
    ape->unk48.x = lbl_802F2274;
    ape->unk48.y = 0.0f;
    ape->unk48.z = lbl_802F2278;

    if (lbl_802F22B4 < 0.0)
    {
        new_ape_stat_motion(ape, 1, 0, 0, 0.0f);
    }
    else if (lbl_802F22A0 <= 0.0f)
    {
        len = mathutil_sqrt(ape->unk48.x * ape->unk48.x
                          + ape->unk48.y * ape->unk48.y
                          + ape->unk48.z * ape->unk48.z);
        new_ape_stat_motion(ape, 4, 0, 0, (f32)(len / 360.0));   /* lbl_802F6430 */
    }
    else if (lbl_802F22A4 != 0.0f)
    {
        f32 t = (f32)globalAnimTimer - lbl_802F22A4;
        if (t < 100.0)   /* lbl_802F6378 */
        {
            len = mathutil_sqrt(ape->unk48.x * ape->unk48.x
                              + ape->unk48.y * ape->unk48.y
                              + ape->unk48.z * ape->unk48.z);
            new_ape_stat_motion(ape, 5, 0, 0, len);
        }
    }
    else
    {
        len = mathutil_sqrt(ape->unk48.x * ape->unk48.x
                          + ape->unk48.y * ape->unk48.y
                          + ape->unk48.z * ape->unk48.z);
        new_ape_stat_motion(ape, 0, 0, 0, len);
    }

    ape_skel_anim_main(ape);
    mathutil_mtxA_from_quat(&ape->unk60);

    if (lbl_802F22A4 != 0.0f)
    {
        mathutil_mtxA_push();
        mathutil_mtxA_from_identity();
        mathutil_mtxA_rotate_y(0x4000);
        mathutil_mtxA_to_quat(&q);
        mathutil_mtxA_pop();
        mathutil_quat_slerp(&ape->unk60, &ape->unk60, &q, 0.05999999865889549f);
    }
    else
    {
        mathutil_mtxA_to_euler_yxz(&rotY, &rotX, &rotZ);
        rotY -= 0x4000;
        len = mathutil_sqrt(lbl_802F2274 * lbl_802F2274
                          + 0.0f * 0.0f
                          + lbl_802F2278 * lbl_802F2278);
        work->unk6C = lbl_802F2274 / len;
        work->unk70 = 0.0f;
        len = mathutil_sqrt(lbl_802F2274 * lbl_802F2274
                          + 0.0f * 0.0f
                          + lbl_802F2278 * lbl_802F2278);
        work->unk74 = -lbl_802F2278 / len;
        mot_ape_set_quat_from_vec(ape, (Vec *)&work->unk6C);
    }
}
