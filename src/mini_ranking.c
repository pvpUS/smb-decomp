/*
 * mini_ranking.c  --  Party-minigame high-score ranking + name-entry screen (REL submode).
 *
 * UNVERIFIED STRUCTURAL FIRST-DRAFT.
 * This repo cannot build (no CodeWarrior / baserom.dol), so nothing here is byte-matched.
 * It only syntax-checks and structurally follows its templates (ranking_screen.c,
 * mini_commend.c).  Struct `MiniRankingWork` and the compact score-record structs are
 * INVENTED (field names/offsets inferred from the asm) and flagged as unverified.
 *
 * The four large per-game draw variants (func_800A9254 / func_800A98A0 / func_800A9F00 /
 * func_800AA6E4, one per minigame background) are structural drafts.  func_800A9254 is a
 * best-effort transcription; the other three are documented stubs (see TODOs) since they are
 * ~430-560 line near-identical variants and cannot be verified.
 */

#include <stdlib.h>
#include <string.h>
#include <dolphin.h>

#include "global.h"
#include "ball.h"
#include "bitmap.h"
#include "event.h"
#include "input.h"
#include "mathutil.h"
#include "mode.h"
#include "name_entry.h"
#include "preview.h"
#include "sound.h"
#include "sprite.h"
#include "window.h"

// ------------------------------------------------------------------
// Invented work struct (asm label lbl_802C6180). UNVERIFIED field layout.
// ------------------------------------------------------------------
struct MiniRankingWork
{
    /*0x00*/ u32 flags;            // bit0 = name-entry in progress
    /*0x04*/ s8 gameSel;           // minigame index (0..11)
    /*0x05*/ s8 playerId;          // controller/player currently entering (-1 = none)
    /*0x06*/ s8 gameCategory;      // record-format category (compared vs 1)
    /*0x07*/ s8 fadeCounter;       // highlight fade-in counter (0..8)
    /*0x08*/ s8 unk8;              // counter (0..8)
    /*0x09*/ s8 unk9;              // counter (0..0x3c)
    /*0x0A*/ s8 curSlot;           // index into playerSlots being edited
    /*0x0B*/ s8 playerSlots[4];    // 0x0B..0x0E: rank slot claimed by each player (-1 = none)
    /*0x0F*/ s8 letterPos;         // current initials cursor position (0..3)
    /*0x10*/ s8 letterIdx;         // current charset index for the cursor
    /*0x11*/ s8 initials[3];       // 0x11..0x13 entered initials (charset indices)
    /*0x14*/ u32 activeMask;       // bitmask of active players
    /*0x18*/ u32 highlightColor;   // packed grey highlight color
    /*0x1C*/ float colorR;
    /*0x20*/ float colorG;
    /*0x24*/ float colorB;
    /*0x28*/ float unk28;          // animated scale/offset
    /*0x2C*/ struct Preview preview;
};

static struct MiniRankingWork mini_ranking_work;

// ------------------------------------------------------------------
// Invented compact high-score record layouts (per minigame). UNVERIFIED.
// The record array for each game lives in the data table lbl_801D5960[].records.
// ------------------------------------------------------------------
struct MiniScoreTime      // 8 bytes: race / golf (key = min*6000 + sec*100 + centi)
{
    u8 name[3];
    s8 rank;
    u8 min;
    u8 sec;
    u8 centi;
    u8 unk7;
};

struct MiniScoreU16Pair   // 8 bytes: target / billiards (key = unk4 [+ unk6])
{
    u8 name[3];
    s8 rank;
    u16 unk4;
    u16 unk6;
};

struct MiniScoreU16       // 6 bytes: bowling (key = unk4)
{
    u8 name[3];
    s8 rank;
    u16 unk4;
};

// Per-game table entry (asm label lbl_801D5960). UNVERIFIED.
struct MiniRankGameDef
{
    void (*initFunc)(int, int);
    void *records;
    s32 count;
    char *gctPath;
};

// ------------------------------------------------------------------
// External data tables/templates (large data blobs left as extern placeholders).
// TODO: data tables (asm .data @ lbl_801D58A8 sprite/label templates, lbl_801D5960 game
// table, lbl_801D5C1C, lbl_801D6054/61E4/6514 char maps, lbl_801D6608/6644/6654/6664
// name lists, lbl_801D6674/6684/66A4/66B4/66C4/66D4 debug-print tables).
// ------------------------------------------------------------------
extern struct MiniRankGameDef lbl_801D5960[];
extern u8 lbl_801D58A8[];                 // big NLsprarg/label template + score-array blob
extern struct MiniRankGameDef *lbl_801D5C1C[];
extern const char lbl_802F16D8[];         // 3-char blank-initials source for strncpy
extern u8 lbl_801D6054[];                 // "category 1" rank-marker NLsprarg template
extern u8 lbl_801D61E4[];                 // per-player rank-marker NLsprarg pointer table
extern u8 lbl_801D6514[];                 // time-column layout table
extern u8 lbl_801D6674[];                 // debug-print rank-name string table

// forward decls
static void lbl_800A7A6C(void);
static void lbl_800A7C10(s8 *, struct Sprite *);
static void func_800A916C(struct Sprite *);
static void lbl_800A9254(struct Sprite *);
static void lbl_800A98A0(struct Sprite *);
static void lbl_800A9F00(struct Sprite *);
static void lbl_800AA6E4(struct Sprite *);
static void func_800AB358(int, int);
static void func_800AB414(void);
static void func_800AB480(s8 *, struct Sprite *);
static int func_800ABAE0(int, struct MiniScoreTime *, int, int);
static int func_800ABCF4(int, struct MiniScoreTime *, int, int);
static int func_800ABE80(int, struct MiniScoreU16Pair *, int, int);
static int func_800AC064(int, struct MiniScoreU16 *, int, int);
static int func_800AC248(int, struct MiniScoreU16Pair *, int, int);

void func_800A7A8C(s8 gameSel, u32 flags);
void func_800A7B7C(void);
void func_800A82D0(struct Sprite *);
void func_800A83C4(int row, float x, float y);
void func_800A85F8(int row, float x, float y);
void func_800A8828(s8 *initials, int player, float x, float y);
void func_800A8C44(u8 *timeData, int player, float x, float y);
void func_800A8FCC(int medal, int player, float x, float y);
void func_800AB2A0(int gameSel, int arg1);
void func_800AB444(void);
int func_800AC43C(int gameSel, void *records, int count);
void func_800AB720(struct MiniScoreTime *rec);
void func_800AB830(struct MiniScoreU16Pair *rec);
void func_800AB8D8(struct MiniScoreU16 *rec);
void func_800AB974(struct MiniScoreU16Pair *rec);
void func_800ABA10(struct MiniScoreU16Pair *rec);
void func_800AADC4(int state, int arg1);
void func_800AAE80(int state, int arg1);
void func_800AAF40(int state, int arg1);
void func_800AB174(int state, int arg1);

// ==================================================================
// Submode entry points
// ==================================================================

void submode_mini_ranking_init_func(void)
{
    event_start(0x10);
    event_start(0x12);
    modeCtrl.unk10 = 0;
    func_800AB2A0(modeCtrl.unk10, 0);
    func_800AB414();
    u_play_music(0x42, 0);
    submodeFinishFunc = lbl_800A7A6C;
    gameSubmodeRequest = SMD_MINI_RANKING_MAIN;
}

void submode_mini_ranking_main_func(void)
{
    int sel;

    window_set_cursor_pos(1, 1);
    window_printf_2("RANKING\n");
    window_printf_2(" [%d/%d]\n", modeCtrl.unk10, 12);

    if (debugFlags & 0xA)
        return;

    // Debug harness: cycle through the 12 minigame rankings with the D-pad.
    if (!(mini_ranking_work.flags & 1))
    {
        sel = modeCtrl.unk10;
        if (REPEAT_WITH_R_ACCEL(0, PAD_BUTTON_LEFT))
        {
            sel--;
            if (sel < 0)
                sel = 0xB;
        }
        if (REPEAT_WITH_R_ACCEL(0, PAD_BUTTON_RIGHT))
        {
            sel++;
            if (sel >= 0xC)
                sel = 0;
        }
        if (sel != modeCtrl.unk10)
        {
            func_800AB2A0(sel, 0);
            modeCtrl.unk10 = sel;
        }
    }

    // Debug: adjust the placeholder record slot (playerSlots[0], clamped -1..4).
    if (!(mini_ranking_work.flags & 1))
    {
        s8 v = mini_ranking_work.playerSlots[0];
        if (REPEAT_WITH_R_ACCEL(0, PAD_BUTTON_UP))
        {
            v--;
            if (v < 0)
                v = 4;
        }
        if (REPEAT_WITH_R_ACCEL(0, PAD_BUTTON_DOWN))
        {
            v++;
            if (v >= 5)
                v = 0;
        }
        mini_ranking_work.playerSlots[0] = v;
    }

    // Debug: START begins editing the currently-selected placeholder record.
    if ((controllerInfo[0].pressed.button & PAD_BUTTON_START)
        && !(mini_ranking_work.flags & 1)
        && mini_ranking_work.playerSlots[0] >= 0)
    {
        func_800AB2A0(modeCtrl.unk10, 1);
    }

    // Debug: Y injects a random score record into the selected game and reports its rank.
    if (controllerInfo[0].pressed.button & PAD_BUTTON_Y)
    {
        sel = modeCtrl.unk10;
        switch (sel)
        {
        default:
            if (sel >= 0 && sel < 6)
            {
                struct MiniScoreTime rec;
                func_800AB720(&rec);
                func_800AB720(&rec);
                func_800AB720(&rec);
                func_800AB720(&rec);
                func_800AB720(&rec);
                func_800AB720(&rec);
                func_800AB720(&rec);
                func_800AB720(&rec);
                if (func_800AC43C(sel, &rec, 4) != 0)
                {
                    func_800AB2A0(sel, 1);
                    printf("entry: TRUE\n");
                }
                else
                {
                    func_800AB2A0(sel, 0);
                    printf("entry: FALSE\n");
                }
            }
            break;
        case 6:
        case 7:
        case 8:
            {
                struct MiniScoreU16Pair rec;
                func_800AB830(&rec);
                if (func_800AC43C(sel, &rec, 1) != 0)
                {
                    func_800AB2A0(sel, 1);
                    printf("entry: TRUE\n");
                }
                else
                {
                    func_800AB2A0(sel, 0);
                    printf("entry: FALSE\n");
                }
            }
            break;
        case 9:
            {
                struct MiniScoreU16 rec;
                func_800AB8D8(&rec);
                if (func_800AC43C(9, &rec, 1) != 0)
                {
                    func_800AB2A0(9, 1);
                    printf("entry: TRUE\n");
                }
                else
                {
                    func_800AB2A0(9, 0);
                    printf("entry: FALSE\n");
                }
            }
            break;
        case 10:
            {
                struct MiniScoreU16Pair rec;
                func_800AB974(&rec);
                if (func_800AC43C(10, &rec, 1) != 0)
                {
                    func_800AB2A0(10, 1);
                    printf("entry: TRUE\n");
                }
                else
                {
                    func_800AB2A0(10, 0);
                    printf("entry: FALSE\n");
                }
            }
            break;
        case 11:
            {
                struct MiniScoreU16Pair rec;
                func_800ABA10(&rec);
                if (func_800AC43C(11, &rec, 1) != 0)
                {
                    func_800AB2A0(11, 1);
                    printf("entry: TRUE\n");
                }
                else
                {
                    func_800AB2A0(11, 0);
                    printf("entry: FALSE\n");
                }
            }
            break;
        }
    }
}

static void lbl_800A7A6C(void)
{
    func_800AB444();
}

// ==================================================================
// Work-struct setup / cursor navigation
// ==================================================================

// Prepare the work struct for editing player `gameSel`'s new entry; OR in `flags`.
void func_800A7A8C(s8 gameSel, u32 flags)
{
    int i;
    s8 *slot;

    mini_ranking_work.gameSel = gameSel;
    mini_ranking_work.flags |= flags;
    mini_ranking_work.letterPos = 0;
    mini_ranking_work.letterIdx = 2;
    mini_ranking_work.unk8 = 0;
    mini_ranking_work.unk9 = 0;
    mini_ranking_work.initials[0] = 0;
    mini_ranking_work.initials[1] = 0;
    mini_ranking_work.initials[2] = 0;

    slot = mini_ranking_work.playerSlots;
    for (i = 0; i < 4; i++, slot++)
    {
        if (*slot >= 0)
        {
            mini_ranking_work.curSlot = (s8)i;
            break;
        }
    }

    if (mini_ranking_work.flags & 1)
    {
        mini_ranking_work.fadeCounter = 8;
        mini_ranking_work.colorR = 412.0f;
        mini_ranking_work.colorG = 118.0f;
        mini_ranking_work.colorB = 60.0f;
    }
    else
    {
        mini_ranking_work.fadeCounter = 0;
        mini_ranking_work.colorR = 500.0f;
        mini_ranking_work.colorG = 122.0f;
        mini_ranking_work.colorB = 68.0f;
    }

    if ((mini_ranking_work.flags & 1) && (mini_ranking_work.flags & 6))
        mini_ranking_work.unk28 = 43.5f;
    else
        mini_ranking_work.unk28 = 60.0f;
}

// Advance the cursor to the next active player slot; clears editing flag if none remain.
void func_800A7B7C(void)
{
    int i;
    s8 *slot;

    i = mini_ranking_work.curSlot + 1;
    slot = &mini_ranking_work.playerSlots[i];
    for (; i < 4; i++, slot++)
    {
        if (*slot >= 0)
        {
            mini_ranking_work.curSlot = (s8)i;
            mini_ranking_work.letterPos = 0;
            mini_ranking_work.letterIdx = 2;
            mini_ranking_work.unk8 = 0;
            mini_ranking_work.unk9 = 0;
            mini_ranking_work.initials[0] = 0;
            mini_ranking_work.initials[1] = 0;
            mini_ranking_work.initials[2] = 0;
            return;
        }
    }
    mini_ranking_work.flags &= ~1;
}

// ==================================================================
// Per-frame update + name-entry input (sprite mainFunc). HIGH/DRAFT.
// ==================================================================
static void lbl_800A7C10(s8 *status, struct Sprite *sprite)
{
    u32 g;

    if (mini_ranking_work.flags & 1)
    {
        // Editing: fade highlight in, ease colors toward the "active" tint.
        if (++mini_ranking_work.fadeCounter > 8)
            mini_ranking_work.fadeCounter = 8;
        mini_ranking_work.colorR += (412.0 - mini_ranking_work.colorR) * 0.2;
        mini_ranking_work.colorG += (118.0 - mini_ranking_work.colorG) * 0.2;
        mini_ranking_work.colorB += (60.0 - mini_ranking_work.colorB) * 0.2;
        mini_ranking_work.unk9 = 0;
    }
    else
    {
        // Idle: fade highlight out, ease colors toward the "inactive" tint.
        if (--mini_ranking_work.fadeCounter < 0)
            mini_ranking_work.fadeCounter = 0;
        mini_ranking_work.colorR += (500.0 - mini_ranking_work.colorR) * 0.2;
        mini_ranking_work.colorG += (122.0 - mini_ranking_work.colorG) * 0.2;
        mini_ranking_work.colorB += (68.0 - mini_ranking_work.colorB) * 0.2;
        if (mini_ranking_work.unk9 < 0x3C)
            mini_ranking_work.unk9++;
    }

    if ((mini_ranking_work.flags & 1) && (mini_ranking_work.flags & 6))
        mini_ranking_work.unk28 += (43.5 - mini_ranking_work.unk28) * 0.2;
    else
        mini_ranking_work.unk28 += (60.0 - mini_ranking_work.unk28) * 0.2;

    if (mini_ranking_work.unk8 < 8)
        mini_ranking_work.unk8++;

    g = 0xFF - (u32)(127.0f * (float)mini_ranking_work.fadeCounter * 0.125f);
    mini_ranking_work.highlightColor = 0xFF000000 | (g << 16) | (g << 8) | g;

    if (mini_ranking_work.flags & 1)
    {
        // Name entry for the current player.
        int cont = playerControllerIDs[mini_ranking_work.curSlot];
        s8 pos = mini_ranking_work.letterPos;

        if (pos < 3)
        {
            // Cycle the charset index for the current initial with up/down.
            s8 idx = mini_ranking_work.letterIdx;
            if (REPEAT_WITH_R_ACCEL(cont, PAD_BUTTON_UP))
            {
                idx--;
                if (idx < 0)
                    idx = 0x2C;
            }
            if (REPEAT_WITH_R_ACCEL(cont, PAD_BUTTON_DOWN))
            {
                idx++;
                if (idx >= 0x2D)
                    idx = 0;
            }
            if (idx != mini_ranking_work.letterIdx)
                u_play_sound_0(0x6C);
            mini_ranking_work.letterIdx = idx;
            mini_ranking_work.initials[pos] = lbl_801D58A8[idx];
        }
        else
        {
            // On the confirm position, toggle between OK/CANCEL with up/down.
            s8 idx = mini_ranking_work.letterIdx;
            if (REPEAT_WITH_R_ACCEL(cont, PAD_BUTTON_UP))
            {
                idx--;
                if (idx < 0)
                    idx = 1;
            }
            if (REPEAT_WITH_R_ACCEL(cont, PAD_BUTTON_DOWN))
            {
                idx++;
                if (idx >= 2)
                    idx = 0;
            }
            if (idx != mini_ranking_work.letterIdx)
                u_play_sound_0(0x6C);
            mini_ranking_work.letterIdx = idx;
            mini_ranking_work.initials[0] = lbl_801D58A8[idx];
        }

        // A: confirm current character / advance the cursor.
        if ((controllerInfo[cont].pressed.button & PAD_BUTTON_A)
            && mini_ranking_work.unk8 >= 8)
        {
            s8 idx = mini_ranking_work.letterIdx;
            if (idx == 0x5C)  // charset '\\' == blank / delete
            {
                if (mini_ranking_work.letterPos > 0)
                {
                    if (mini_ranking_work.letterPos < 3)
                        mini_ranking_work.letterIdx = 0;
                    mini_ranking_work.letterPos--;
                    u_play_sound_0(0x66);
                }
            }
            else
            {
                s8 pos2;
                if (idx == 0x5E)  // charset '[' == end marker
                    mini_ranking_work.letterIdx = 0x20;
                pos2 = mini_ranking_work.letterPos;
                mini_ranking_work.initials[pos2] = mini_ranking_work.letterIdx;
                mini_ranking_work.letterPos++;
                if (mini_ranking_work.letterPos >= 3)
                {
                    mini_ranking_work.letterIdx = 1;
                }
                if (mini_ranking_work.letterPos >= 4)
                    func_800A7B7C();
                if (mini_ranking_work.letterPos < 4)
                    u_play_sound_0(0x65);
                else
                    u_play_sound_0(0x6A);
            }
        }

        // B: delete the previous character.
        if ((controllerInfo[cont].held.button & PAD_BUTTON_B)
            && mini_ranking_work.unk8 >= 8
            && mini_ranking_work.letterPos > 0)
        {
            if (mini_ranking_work.letterPos < 3)
                mini_ranking_work.letterIdx = 0;
            mini_ranking_work.letterPos--;
            mini_ranking_work.letterIdx = mini_ranking_work.initials[mini_ranking_work.letterPos];
            u_play_sound_0(0x66);
        }

        // Commit the entered initials into the player's high-score record.
        if (mini_ranking_work.flags & 2)
        {
            struct MiniRankGameDef *def = &lbl_801D5960[mini_ranking_work.gameSel];
            u8 *arr = (u8 *)def->records;
            memcpy(&arr[mini_ranking_work.playerSlots[mini_ranking_work.curSlot]
                        * def->count],
                   mini_ranking_work.initials, 3);
        }
    }

    (void)status;
    (void)sprite;
}

// ==================================================================
// Preview background + label draw wrapper (called by draw variants)
// ==================================================================
void func_800A82D0(struct Sprite *sprite)
{
    u8 spD8[0x88];
    struct Sprite tmp;

    preview_draw(&mini_ranking_work.preview, 0, 0, 0.0f, 0.0f, 10.0f, 640.0f, 480.0f);
    // The two decorative label sprites re-use the generic drawFunc via templates.
    nlSprPut((NLsprarg *)&lbl_801D58A8[0x38C]);
    *(float *)&lbl_801D58A8[0x3E4] = mini_ranking_work.colorR;
    nlSprPut((NLsprarg *)&lbl_801D58A8[0x3DC]);

    // Build a transient label sprite for the header and draw it. NOTE: field offsets
    // and the source string (blob @0xC54) are structural approximations, unverified.
    memset(&tmp, 0, sizeof(tmp));
    tmp.fontId = 0xB3;
    tmp.mulR = 0xFF;
    tmp.mulG = 0xFF;
    tmp.mulB = 0;
    tmp.flags = 0x00200000;
    tmp.scaleX = 0.1f;
    tmp.scaleY = 1.0f;
    tmp.opacity = 145.0f;
    strcpy(tmp.text, (char *)&lbl_801D58A8[0xC54]);
    tmp.depth = 423.0 + mini_ranking_work.colorR;
    func_800A916C(&tmp);

    (void)spD8;
    (void)sprite;
}

// ==================================================================
// Per-cell drawing helpers (rank bar, rank digit, initials, time/score, medal)
// ==================================================================

// Draws the coloured rank-row bar for row `row` at (x,y). HIGH.
void func_800A83C4(int row, float x, float y)
{
    NLsprarg *params;
    s8 *slot;
    int found = 0;
    int player = 0;
    u32 color;

    slot = &mini_ranking_work.playerSlots[0];
    if (row == mini_ranking_work.playerSlots[0]) { found = 1; player = 0; }
    else if (row == mini_ranking_work.playerSlots[1]) { found = 1; player = 1; }
    else if (row == mini_ranking_work.playerSlots[2]) { found = 1; player = 2; }
    else if (row == mini_ranking_work.playerSlots[3]) { found = 1; player = 3; }
    else player = 4;

    params = (NLsprarg *)&lbl_801D58A8[0x6FC];
    if (found)
    {
        // active (claimed) rows use a bright bar
        if (mini_ranking_work.gameCategory == 1)
            color = ((u32 *)&lbl_801D58A8[0x758])[0];
        else
            color = ((u32 *)&lbl_801D58A8[0x74C])[player];
        params->sprno = 0x326;
        if (row == mini_ranking_work.playerSlots[mini_ranking_work.curSlot])
            *(u32 *)((u8 *)params + 0x38) = color;
        else
        {
            // scale the base color by the editing-fade highlight (approx.)
            float f = (float)(color & 0xFF) * 0.5f;
            u32 r = (u32)((color >> 24) & 0xFF);
            u32 gg = (u32)((color >> 16) & 0xFF);
            u32 b = (u32)((color >> 8) & 0xFF);
            (void)f;
            *(u32 *)((u8 *)params + 0x38) =
                (r << 24) | (gg << 16) | (b << 8) | (color & 0xFF);
        }
    }
    else
    {
        params->sprno = 0x314;
        if (row == mini_ranking_work.playerSlots[mini_ranking_work.curSlot])
            *(s32 *)((u8 *)params + 0x38) = -1;
        else
            *(u32 *)((u8 *)params + 0x38) = mini_ranking_work.highlightColor;
    }
    params->x = x;
    params->y = y;
    nlSprPut(params);
    (void)slot;
}

// Draws the rank number '1'..'5' for row `row`. HIGH.
void func_800A85F8(int row, float x, float y)
{
    NLsprarg *params;
    int found = 0;
    int player = 0;
    int color;
    int addColor = 0;

    reset_text_draw_settings();
    set_text_font(0x22);

    if (row == mini_ranking_work.playerSlots[mini_ranking_work.curSlot])
        color = -1;
    else
        color = mini_ranking_work.highlightColor;
    set_text_mul_color(color);

    if (mini_ranking_work.flags & 1)
    {
        addColor = 0;
    }
    else if (mini_ranking_work.activeMask & (1 << row))
    {
        // pulsing flash based on the global animation timer
        u32 t = globalAnimTimer % 60;
        if (t > 30)
            t = 60 - t;
        t <<= 3;
        addColor = (t << 16) | (t << 8) | t;
    }
    set_text_add_color(addColor);

    set_text_pos(x, y);
    sprite_printf("%d", row + 1);

    // A small marker sprite is drawn when the row is claimed by a player.
    if (row == mini_ranking_work.playerSlots[0]) { found = 1; player = 0; }
    else if (row == mini_ranking_work.playerSlots[1]) { found = 1; player = 1; }
    else if (row == mini_ranking_work.playerSlots[2]) { found = 1; player = 2; }
    else if (row == mini_ranking_work.playerSlots[3]) { found = 1; player = 3; }
    else player = 4;

    if (found)
    {
        if (mini_ranking_work.gameCategory == 1)
            params = (NLsprarg *)&lbl_801D6054[0];
        else
            params = ((NLsprarg **)&lbl_801D61E4[0])[player];
        params->x = x - 26.0f;
        params->y = y - 10.0f;
        {
            u32 t = globalAnimTimer % 60;
            if (t > 30)
                t = 60 - t;
            t <<= 2;
            *(u32 *)((u8 *)params + 0x3C) = (t << 16) | (t << 8) | t;
        }
        nlSprPut(params);
    }
}

// Draws up to 3 initials characters `initials[]` for player `player` at (x,y). HIGH.
void func_800A8828(s8 *initials, int player, float x, float y)
{
    int i;
    float ycur = 2.0f + y;

    reset_text_draw_settings();
    set_text_font(0x20);

    for (i = 0; i < 3 && initials[i] != 0; i++)
    {
        int color;
        float xcur = x + i * 36.0f;

        func_80071B1C(2.0f);
        set_text_mul_color(0xFF000000);
        if ((mini_ranking_work.flags & 1)
            && mini_ranking_work.playerSlots[mini_ranking_work.curSlot] == player
            && mini_ranking_work.letterPos == i)
        {
            u32 t = globalAnimTimer % 60;
            if (t > 30)
                t = 60 - t;
            t <<= 2;
            set_text_add_color((t << 16) | (t << 8) | t);
        }
        else if (mini_ranking_work.flags & 1)
        {
            set_text_add_color(0);
        }
        else if (!(mini_ranking_work.activeMask & (1 << player)))
        {
            set_text_add_color(0);
        }
        else
        {
            u32 t = globalAnimTimer % 60;
            if (t > 30)
                t = 60 - t;
            t <<= 3;
            set_text_add_color((t << 16) | (t << 8) | t);
        }

        // shadow pass then main pass
        set_text_pos(2.0f + xcur, ycur);
        sprite_printf("%c", initials[i]);
        func_80071B1C(1.0f);
        if (mini_ranking_work.playerSlots[mini_ranking_work.curSlot] == player)
            color = -1;
        else
            color = mini_ranking_work.highlightColor;
        set_text_mul_color(color);
        set_text_pos(xcur, y);
        sprite_printf("%c", initials[i]);
    }
}

// Draws the time value "mm:ss.cc" for player `player` at (x,y). DRAFT.
void func_800A8C44(u8 *timeData, int player, float x, float y)
{
    int i;
    float ycur = 2.0f + y;

    reset_text_draw_settings();
    set_text_font(0x21);

    if (mini_ranking_work.flags & 1)
        set_text_add_color(0);
    else if (mini_ranking_work.activeMask & (1 << player))
    {
        u32 t = globalAnimTimer % 60;
        if (t > 30)
            t = 60 - t;
        t <<= 3;
        set_text_add_color((t << 16) | (t << 8) | t);
    }
    else
        set_text_add_color(0);

    for (i = 0; i < 3; i++)
    {
        int color;
        int v = timeData[i];
        float xcur = x + i * 49.0f;   // NOTE: column spacing approximate

        if (i == 1)
            v = v < 0 ? 0 : (v > 0x3B ? 0x3B : v);
        else
            v = v < 0 ? 0 : (v > 0x63 ? 0x63 : v);

        func_80071B1C(2.0f);
        set_text_mul_color(0xFF000000);
        set_text_pos(2.0f + xcur, ycur);
        sprite_printf("%d", v / 10);
        set_text_pos(2.0f + xcur + 17.0f, ycur);
        sprite_printf("%d", v % 10);

        func_80071B1C(1.0f);
        if (mini_ranking_work.playerSlots[mini_ranking_work.curSlot] == player)
            color = -1;
        else
            color = mini_ranking_work.highlightColor;
        set_text_mul_color(color);
        set_text_pos(xcur, y);
        sprite_printf("%d", v / 10);
        set_text_pos(xcur + 17.0f, y);
        sprite_printf("%d", v % 10);
    }

    // separators ':' between the columns
    func_80071B1C(2.0f);
    set_text_mul_color(0xFF000000);
    set_text_pos(380.0 + x - 346.0, y);
    sprite_puts(":");
    func_80071B1C(1.0f);
    if (mini_ranking_work.playerSlots[mini_ranking_work.curSlot] == player)
        set_text_mul_color(-1);
    else
        set_text_mul_color(mini_ranking_work.highlightColor);
    set_text_pos(y - 2.0, x);   // NOTE: exact separator placement unverified
    sprite_puts(":");
    sprite_puts(":");
}

// Draws the medal / place icon `medal` for player `player`. DRAFT.
void func_800A8FCC(int medal, int player, float x, float y)
{
    u8 *base;
    NLsprarg *params;

    if (medal < 0 || medal >= 4)
        return;

    base = &lbl_801D58A8[medal * 8 + 0xA8C];
    params = (NLsprarg *)&lbl_801D58A8[0xA3C];
    params->sprno = *(u16 *)base;   // bmp index from per-medal table
    params->x = 380.0 + x;          // NOTE: layout approximate
    params->y = 21.0 + y;
    params->zm_x = 1.0f;
    {
        // pulse the medal alpha via a sine of the timer
        float s = 4096.0f * mathutil_sin(globalAnimTimer * 0x190 + 0x4000);
        params->trnsl = (float)(s);
    }
    nlSprPut(params);

    // second overlay copy
    params = (NLsprarg *)&lbl_801D58A8[0xA48];
    params->sprno = *(u16 *)(base + 2);
    *(float *)((u8 *)params) = 0.5f;
    nlSprPut(params);

    (void)player;
}

// ==================================================================
// Generic label draw (sprite drawFunc). Draws sprite->text twice (shadow+main). CERTAIN.
// ==================================================================
static void func_800A916C(struct Sprite *sprite)
{
    reset_text_draw_settings();
    set_text_font(sprite->fontId);
    set_text_scale(sprite->scaleX, sprite->scaleY);
    // NOTE: func_80071B50 takes a u32 arg in the asm, but its header prototype is (); cast.
    ((void (*)(u32))func_80071B50)(sprite->flags);

    // shadow pass
    func_80071B1C(0.1 + sprite->depth);
    set_text_mul_color(0);
    set_text_add_color(0);
    set_text_pos(2.0 + sprite->x, 2.0 + sprite->y);
    sprite_puts(sprite->text);

    // main pass
    func_80071B1C(sprite->depth);
    set_text_mul_color((sprite->mulB) | ((sprite->mulR << 16) & 0x00FF0000) | (sprite->mulG << 8));
    set_text_add_color((sprite->addB) | ((sprite->addR << 16) & 0x00FF0000) | (sprite->addG << 8));
    set_text_pos(sprite->x, sprite->y);
    sprite_puts(sprite->text);
}

// ==================================================================
// Per-game ranking-screen draw variants (sprite drawFuncs), one per minigame.
// func_800A9254 is a structural draft; the other three are documented stubs.
// ==================================================================

// Race ranking draw. DRAFT-UNCERTAIN (structural transcription of first variant).
static void lbl_800A9254(struct Sprite *sprite)
{
    int row;
    u8 *rec;
    float y;

    func_800A82D0(sprite);

    // background label templates
    nlSprPut((NLsprarg *)&lbl_801D58A8[0x42C]);
    nlSprPut((NLsprarg *)&lbl_801D58A8[0x47C]);
    nlSprPut((NLsprarg *)&lbl_801D58A8[0x60C]);
    nlSprPut((NLsprarg *)&lbl_801D58A8[0x5BC]);

    // per-row entries (5 rows)
    rec = &lbl_801D58A8[mini_ranking_work.gameSel * 16 + 0xBC];
    y = 118.0f;
    for (row = 0; row < 5; row++)
    {
        func_800A83C4(row, 0.0f, y);
        func_800A85F8(row, y, y - 1.0f);
        func_800A8828((s8 *)rec, row, 122.0f, y);          // initials
        func_800A8C44((u8 *)(rec + 4), row, 118.0f, y);    // time value
        func_800A8FCC(rec[3], row, 122.0f, y);             // medal / place

        if (rec[7] & 1)
        {
            // extra decorative sprite for flagged entries
            NLsprarg *p = (NLsprarg *)&lbl_801D58A8[0xAAC];
            p->sprno = 0x31C;
            if (row == mini_ranking_work.playerSlots[mini_ranking_work.curSlot])
                *(s32 *)((u8 *)p + 0x38) = -1;
            else
                *(u32 *)((u8 *)p + 0x38) = mini_ranking_work.highlightColor;
            nlSprPut(p);
        }
        y += mini_ranking_work.unk28;
        rec += 8;
    }

    // "now editing" overlay + on-screen name-entry keyboard while a player is entering.
    if (mini_ranking_work.fadeCounter < 8 || !(mini_ranking_work.flags & 6))
    {
        // TODO: name-entry keyboard/preview overlay (asm 0x800A95D4..0x800A9858) -- structural
        // draft only; draws the charset column, the current initials, and the confirm markers
        // via func_800A8828/func_800A8C44 against the work struct.  Not transcribed.
    }
}

// ------------------------------------------------------------------
// Draw helpers shared by the score / pins / stroke draw variants below.
// These factor out code the compiler inlined at each call site; they are
// UNVERIFIED readability reconstructions (offsets/constants read from the asm
// at 0x800A98A0 / 0x800A9F00 / 0x800AA6E4).
//
// NOTE on the work struct: the three variants below read the "colorG"/"colorB"
// float fields (work + 0x20 / + 0x24) as the animated row Y-start / Y-step.
// Those fields are mislabelled as colours in `struct MiniRankingWork`; here they
// are the row-layout values easing between the editing/idle targets.  Left in
// place (the struct is used verbatim by the already-drafted functions).
// ------------------------------------------------------------------

// Foreground mul-colour for a row: white (-1) when this row is the slot being
// edited, otherwise the animated grey highlight.
static u32 mini_ranking_row_color(int row)
{
    if (row == mini_ranking_work.playerSlots[mini_ranking_work.curSlot])
        return (u32)-1;
    return mini_ranking_work.highlightColor;
}

// Pulsing additive flash used to draw attention to a newly-placed active row.
static int mini_ranking_flash_add_color(int player, int shift)
{
    u32 t;
    if (mini_ranking_work.flags & 1)
        return 0;
    if (!(mini_ranking_work.activeMask & (1u << player)))
        return 0;
    t = globalAnimTimer % 60;
    if (t > 30)
        t = 60 - t;
    t <<= shift;
    return (int)((t << 16) | (t << 8) | t);
}

// Right-aligned decimal renderer (drop-shadow pass + main pass per digit) with
// leading-zero suppression.  Caller sets font / scale / add-colour beforehand.
static void mini_ranking_put_number(int value, int placeStart, float x0, float spacing,
                                    float mainY, float shadowY, int player)
{
    u32 mulColor = mini_ranking_row_color(player);
    int drawn = 0;
    int col = 0;
    int place;

    for (place = placeStart; place > 0; place /= 10, col++)
    {
        int digit;
        float x;

        if (drawn == 0 && place >= 10 && value / place == 0)
            continue;

        digit = value / place;
        x = x0 + col * spacing;

        func_80071B1C(2.0f);
        set_text_mul_color(0xFF000000);
        set_text_pos(2.0f + x, shadowY);
        sprite_printf("%d", digit);

        func_80071B1C(1.0f);
        set_text_mul_color(mulColor);
        set_text_pos(x, mainY);
        sprite_printf("%d", digit);

        value -= digit * place;
        drawn = 1;
    }
}

// Score ranking draw (party minigames 6-8, 8-byte MiniScoreU16Pair records).
// DRAFT-UNCERTAIN structural transcription of asm 0x800A98A0..0x800A9EFF: draws
// the game-specific centred sub-header, four background label templates, then five
// score rows (rank bar, rank digit, initials, numeric score, unit sprite, medal,
// two status-flag sprites).  The record-array pointer is *loaded* from the game
// table (a deref the 0x800A9254 draft above omits).
static void lbl_800A98A0(struct Sprite *sprite)
{
    int row;
    u8 *rec;
    float y;
    NLsprarg *p;

    func_800A82D0(sprite);

    // Game-specific centred sub-header (the score-column unit label).
    {
        char *sub = *(char **)&lbl_801D58A8[mini_ranking_work.gameSel * 4 + 0xD3C];
        float w, x;
        reset_text_draw_settings();
        set_text_font(0xB3);
        set_text_scale(0.8f, 0.8f);
        ((void (*)(u32))func_80071B50)(0x00200000);
        w = u_get_text_width(sub);
        x = 396.0 - 0.5 * w;
        reset_text_draw_settings();
        set_text_font(0xB3);
        set_text_scale(0.8f, 0.8f);
        ((void (*)(u32))func_80071B50)(0x00200000);
        func_80071B1C(0.1 + 0.1);           // shadow depth
        set_text_mul_color(0);
        set_text_add_color(0);
        set_text_pos(2.0 + x, 2.0 + 37.0);
        sprite_puts(sub);
        func_80071B1C(0.1);                 // main depth
        set_text_mul_color(0x00EF9A00);
        set_text_add_color(0);
        set_text_pos(x, 37.0);
        sprite_puts(sub);
    }

    nlSprPut((NLsprarg *)&lbl_801D58A8[0x42C]);
    nlSprPut((NLsprarg *)&lbl_801D58A8[0x47C]);
    nlSprPut((NLsprarg *)&lbl_801D58A8[0x51C]);
    nlSprPut((NLsprarg *)&lbl_801D58A8[0x5BC]);

    rec = *(u8 **)&lbl_801D58A8[mini_ranking_work.gameSel * 16 + 0xBC];
    y = mini_ranking_work.colorG;   // 0x20: animated row Y-start
    for (row = 0; row < 5; row++)
    {
        int score;

        func_800A83C4(row, 0.0f, y);
        func_800A85F8(row, 50.0f, y - 1.0f);
        func_800A8828((s8 *)rec, row, 172.0f, y - 1.0f);

        // numeric score (up to 5 digits)
        score = *(u16 *)(rec + 4);
        reset_text_draw_settings();
        set_text_font(0x23);
        set_text_add_color(mini_ranking_flash_add_color(row, 3));
        mini_ranking_put_number(score, 10000, 327.0f, 22.0f, y + 2.0f, y + 4.0f, row);

        // decorative unit sprite (sprno preset in template @0xAFC)
        p = (NLsprarg *)&lbl_801D58A8[0xAFC];
        p->x = 438.0f;
        p->y = y + 10.0f;
        p->base_color = mini_ranking_row_color(row);
        nlSprPut(p);

        // medal / place icon
        func_800A8FCC(rec[3], row, 520.0f, y - 5.0f);

        // status-flag sprites (record byte 6 bits 0 and 1)
        if (rec[6] & 1)
        {
            p = (NLsprarg *)&lbl_801D58A8[0xAAC];
            p->sprno = 0x327;
            p->x = 568.0f;
            p->y = y - 5.0f;
            p->base_color = mini_ranking_row_color(row);
            nlSprPut(p);
        }
        if (rec[6] & 2)
        {
            p = (NLsprarg *)&lbl_801D58A8[0xAAC];
            p->sprno = 0x328;
            p->x = 587.0f;
            p->y = y - 5.0f;
            p->base_color = mini_ranking_row_color(row);
            nlSprPut(p);
        }

        y += mini_ranking_work.colorB;   // 0x24: animated row Y-step
        rec += 8;
    }

    (void)sprite;
}

// Score / pins ranking draw (party minigames 9 & 10, 6-byte MiniScoreU16 records).
// DRAFT-UNCERTAIN structural transcription of asm 0x800A9F00..0x800AA6E3.  No
// sub-header; the numeric column and its unit sprites branch on the minigame index.
static void lbl_800A9F00(struct Sprite *sprite)
{
    int row;
    u8 *rec;
    float y;
    NLsprarg *p;

    func_800A82D0(sprite);

    nlSprPut((NLsprarg *)&lbl_801D58A8[0x42C]);
    nlSprPut((NLsprarg *)&lbl_801D58A8[0x47C]);
    nlSprPut((NLsprarg *)&lbl_801D58A8[0x51C]);
    nlSprPut((NLsprarg *)&lbl_801D58A8[0x5BC]);

    rec = *(u8 **)&lbl_801D58A8[mini_ranking_work.gameSel * 16 + 0xBC];
    y = mini_ranking_work.colorG;
    for (row = 0; row < 5; row++)
    {
        int value;

        func_800A83C4(row, 0.0f, y);
        func_800A85F8(row, 50.0f, y - 1.0f);
        func_800A8828((s8 *)rec, row, 172.0f, y - 1.0f);

        switch (mini_ranking_work.gameSel)
        {
        case 9:   // "PINS": integer 0..300
            value = *(u16 *)(rec + 4);
            if (value > 300)
                value = 300;
            reset_text_draw_settings();
            set_text_font(0x23);
            set_text_add_color(mini_ranking_flash_add_color(row, 3));
            mini_ranking_put_number(value, 100, 357.0f, 22.0f, y + 2.0f, y + 4.0f, row);

            p = (NLsprarg *)&lbl_801D58A8[0xAFC];
            p->x = 424.0f;
            p->y = y + 12.0f;
            p->base_color = mini_ranking_row_color(row);
            nlSprPut(p);
            break;
        case 10:  // "SCORE": integer 0..99 plus singular/plural unit sprite(s)
            value = *(u16 *)(rec + 4);
            if (value > 99)
                value = 99;
            reset_text_draw_settings();
            set_text_font(0x23);
            set_text_add_color(mini_ranking_flash_add_color(row, 3));
            mini_ranking_put_number(value, 10, 367.0f, 22.0f, y + 2.0f, y + 4.0f, row);

            if (*(u16 *)(rec + 4) == 1)
            {
                p = (NLsprarg *)&lbl_801D58A8[0xB4C];
                p->x = 414.0f;
                p->y = y + 12.0f;
                p->base_color = mini_ranking_row_color(row);
                nlSprPut(p);
            }
            else
            {
                p = (NLsprarg *)&lbl_801D58A8[0xB9C];
                p->x = 414.0f;
                p->y = y + 12.0f;
                p->base_color = mini_ranking_row_color(row);
                nlSprPut(p);
                p = (NLsprarg *)&lbl_801D58A8[0xBEC];
                p->x = 449.0f;
                p->y = y + 12.0f;
                p->base_color = mini_ranking_row_color(row);
                nlSprPut(p);
            }
            break;
        default:
            break;
        }

        func_800A8FCC(rec[3], row, 520.0f, y - 5.0f);

        y += mini_ranking_work.colorB;
        rec += 6;
    }

    (void)sprite;
}

// Stroke ranking draw (party minigame 11, 8-byte MiniScoreU16Pair records).
// DRAFT-UNCERTAIN structural transcription of asm 0x800AA6E4..0x800AADC3.  Six
// background templates and three scaled numeric columns per row: out (rec+4),
// in (rec+6) and total (out+in).  Each column is x-shifted for narrower values
// (>=100:0, >=10:-9, else -17) and the total column sits on a higher Y baseline.
static void lbl_800AA6E4(struct Sprite *sprite)
{
    int row;
    u8 *rec;
    float y;

    func_800A82D0(sprite);

    nlSprPut((NLsprarg *)&lbl_801D58A8[0x42C]);
    nlSprPut((NLsprarg *)&lbl_801D58A8[0x47C]);
    nlSprPut((NLsprarg *)&lbl_801D58A8[0x6AC]);
    nlSprPut((NLsprarg *)&lbl_801D58A8[0x65C]);
    nlSprPut((NLsprarg *)&lbl_801D58A8[0x4CC]);
    nlSprPut((NLsprarg *)&lbl_801D58A8[0x5BC]);

    rec = *(u8 **)&lbl_801D58A8[mini_ranking_work.gameSel * 16 + 0xBC];
    y = mini_ranking_work.colorG;
    for (row = 0; row < 5; row++)
    {
        int outScore, inScore, total;
        float adj;

        func_800A83C4(row, 0.0f, y);
        func_800A85F8(row, 50.0f, y - 1.0f);
        func_800A8828((s8 *)rec, row, 172.0f, y - 1.0f);

        // "out" column
        outScore = *(u16 *)(rec + 4);
        if (outScore > 999)
            outScore = 999;
        adj = (outScore >= 100) ? 0.0f : ((outScore >= 10) ? -9.0f : -17.0f);
        reset_text_draw_settings();
        set_text_font(0x23);
        set_text_add_color(mini_ranking_flash_add_color(row, 3));
        set_text_scale(0.8f, 0.7857143f /* sdata2 0x3F492492 */);
        mini_ranking_put_number(outScore, 100, 311.0f + adj, 17.0f, y + 5.0f, y + 7.0f, row);

        // "in" column
        inScore = *(u16 *)(rec + 6);
        if (inScore > 999)
            inScore = 999;
        adj = (inScore >= 100) ? 0.0f : ((inScore >= 10) ? -9.0f : -17.0f);
        reset_text_draw_settings();
        set_text_font(0x23);
        set_text_add_color(mini_ranking_flash_add_color(row, 3));
        set_text_scale(0.8f, 0.7857143f /* sdata2 0x3F492492 */);
        mini_ranking_put_number(inScore, 100, 367.0f + adj, 17.0f, y + 5.0f, y + 7.0f, row);

        // "total" column (higher Y baseline, wider digit spacing)
        total = *(u16 *)(rec + 4) + *(u16 *)(rec + 6);
        if (total > 999)
            total = 999;
        adj = (total >= 100) ? 0.0f : ((total >= 10) ? -9.0f : -17.0f);
        reset_text_draw_settings();
        set_text_font(0x23);
        set_text_add_color(mini_ranking_flash_add_color(row, 3));
        set_text_scale(0.8f, 0.7857143f /* sdata2 0x3F492492 */);
        mini_ranking_put_number(total, 100, 424.0f + adj, 21.0f, y + 2.0f, y + 4.0f, row);

        func_800A8FCC(rec[3], row, 520.0f, y - 5.0f);

        y += mini_ranking_work.colorB;
        rec += 8;
    }

    (void)sprite;
}

// ==================================================================
// Sprite creators, one per game state (populate the background + label sprites).
// ==================================================================

void func_800AADC4(int state, int arg1)
{
    struct Sprite *sprite;

    func_800A7A8C(state, arg1);

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->tag = 0x65;
        sprite->x = 166.0f;
        sprite->y = 34.0f;
        sprite->textAlign = 0;
        sprite->fontId = 0xB1;
        sprite->mulR = 0xFF;
        sprite->mulG = 0xFF;
        sprite->mulB = 0;
        sprite->drawFunc = func_800A916C;
        strcpy(sprite->text, "TIME RANKING");
    }
    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->tag = 0x65;
        sprite->depth = 1.0f;
        sprite->mainFunc = lbl_800A7C10;
        sprite->drawFunc = lbl_800A9254;
        strcpy(sprite->text, "RANKING");
    }
}

void func_800AAE80(int state, int arg1)
{
    struct Sprite *sprite;

    func_800A7A8C(state, arg1);

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->tag = 0x65;
        sprite->x = 188.0f;
        sprite->y = 34.0f;
        sprite->textAlign = 0;
        sprite->fontId = 0xB3;
        sprite->mulR = 0xFF;
        sprite->mulG = 0xFF;
        sprite->mulB = 0;
        sprite->drawFunc = func_800A916C;
        strcpy(sprite->text, "SCORE RANKING");
    }
    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->tag = 0x65;
        sprite->depth = 1.0f;
        sprite->mainFunc = lbl_800A7C10;
        sprite->drawFunc = lbl_800A98A0;
        strcpy(sprite->text, "RANKING");
    }
}

void func_800AAF40(int state, int arg1)
{
    struct Sprite *sprite;

    func_800A7A8C(state, arg1);

    switch (mini_ranking_work.gameSel)
    {
    case 9:
        sprite = create_sprite();
        if (sprite != NULL)
        {
            sprite->tag = 0x65;
            sprite->x = 152.0f;
            sprite->y = 34.0f;
            sprite->textAlign = 0;
            sprite->fontId = 0xB3;
            sprite->mulR = 0xFF;
            sprite->mulG = 0xFF;
            sprite->mulB = 0;
            sprite->drawFunc = func_800A916C;
            strcpy(sprite->text, "SCORE RANKING");
        }
        sprite = create_sprite();
        if (sprite == NULL)
            break;
        sprite->tag = 0x65;
        sprite->x = 304.0f;
        sprite->y = 37.0f;
        sprite->fontId = 0xB3;
        sprite->textAlign = 4;
        sprite->mulR = 0xEF;
        sprite->mulG = 0x9A;
        sprite->mulB = 0;
        sprite->scaleX = 0.8f;
        sprite->scaleY = 0.8f;
        sprite->drawFunc = func_800A916C;
        strcpy(sprite->text, "PINS");
        break;
    case 10:
        sprite = create_sprite();
        if (sprite != NULL)
        {
            sprite->tag = 0x65;
            sprite->x = 294.0f;
            sprite->y = 34.0f;
            sprite->textAlign = 0;
            sprite->fontId = 0xB3;
            sprite->mulR = 0xFF;
            sprite->mulG = 0xFF;
            sprite->mulB = 0;
            sprite->drawFunc = func_800A916C;
            strcpy(sprite->text, "SCORE RANKING");
        }
        sprite = create_sprite();
        if (sprite == NULL)
            break;
        sprite->tag = 0x65;
        sprite->x = 316.0f;
        sprite->y = 37.0f;
        sprite->fontId = 0xB3;
        sprite->textAlign = 4;
        sprite->mulR = 0xEF;
        sprite->mulG = 0x9A;
        sprite->mulB = 0;
        sprite->scaleX = 0.8f;
        sprite->scaleY = 0.8f;
        sprite->drawFunc = func_800A916C;
        strcpy(sprite->text, "SCORE");
        break;
    default:
        break;
    }

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->tag = 0x65;
        sprite->depth = 1.0f;
        sprite->mainFunc = lbl_800A7C10;
        sprite->drawFunc = lbl_800A9F00;
        strcpy(sprite->text, "RANKING");
    }
}

void func_800AB174(int state, int arg1)
{
    struct Sprite *sprite;

    func_800A7A8C(state, arg1);

    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->tag = 0x65;
        sprite->x = 222.0f;
        sprite->y = 34.0f;
        sprite->textAlign = 0;
        sprite->fontId = 0xB3;
        sprite->mulR = 0xFF;
        sprite->mulG = 0xFF;
        sprite->mulB = 0;
        sprite->drawFunc = func_800A916C;
        strcpy(sprite->text, "RANKING");
    }
    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->tag = 0x65;
        sprite->x = 316.0f;
        sprite->y = 37.0f;
        sprite->fontId = 0xB3;
        sprite->textAlign = 0;
        sprite->mulR = 0xEF;
        sprite->mulG = 0x9A;
        sprite->mulB = 0;
        sprite->scaleX = 0.8f;
        sprite->scaleY = 0.8f;
        sprite->drawFunc = func_800A916C;
        strcpy(sprite->text, "STROKE");
    }
    sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->tag = 0x65;
        sprite->depth = 1.0f;
        sprite->mainFunc = lbl_800A7C10;
        sprite->drawFunc = lbl_800AA6E4;
        strcpy(sprite->text, "RANKING");
    }
}

// ==================================================================
// Load / switch / free the ranking background + records.
// ==================================================================

void func_800AB2A0(int gameSel, int arg1)
{
    struct MiniRankGameDef *def;

    call_bitmap_load_group(3);
    if (gameMode != 5)
        u_play_music(0x42, 0);
    destroy_sprite_with_tag(0x65);

    def = &lbl_801D5960[gameSel];
    def->initFunc(gameSel, arg1);

    preview_create(&mini_ranking_work.preview, def->gctPath, 0, 0x280, 0x1E0, 0xE);
    preview_sync(&mini_ranking_work.preview);
}

// Re-run the init for a game, reloading the background only if the gct file changed.
static void func_800AB358(int gameSel, int arg1)
{
    char *oldPath = lbl_801D5960[mini_ranking_work.gameSel].gctPath;

    destroy_sprite_with_tag(0x65);
    lbl_801D5960[gameSel].initFunc(gameSel, arg1);
    if (strcmp(oldPath, lbl_801D5960[gameSel].gctPath) != 0)
    {
        ((void (*)(struct Preview *))preview_free)(&mini_ranking_work.preview);
        preview_create(&mini_ranking_work.preview, lbl_801D5960[gameSel].gctPath, 0, 0x280,
                       0x1E0, 0xE);
        preview_sync(&mini_ranking_work.preview);
    }
}

// Clear the work struct (no active players / not editing).
static void func_800AB414(void)
{
    mini_ranking_work.flags = 0;
    mini_ranking_work.playerSlots[0] = -1;
    mini_ranking_work.playerSlots[1] = -1;
    mini_ranking_work.playerSlots[2] = -1;
    mini_ranking_work.playerSlots[3] = -1;
    mini_ranking_work.activeMask = 0;
    mini_ranking_work.playerId = -1;
}

void func_800AB444(void)
{
    destroy_sprite_with_tag(0x65);
    call_bitmap_free_group(3);
    ((void (*)(struct Preview *))preview_free)(&mini_ranking_work.preview);
}

// ==================================================================
// Decorative scrolling side-banner sprites.
// ==================================================================
static void func_800AB480(s8 *status, struct Sprite *sprite)
{
    if (sprite->userVar > 0)
        sprite->x = 544.0f + (float)(sprite->counter % 30);
    else
        sprite->x = 46.0f - (float)(sprite->counter % 30);
    sprite->counter++;
    if (sprite->counter >= 30)
        sprite->counter = 0;
    (void)status;
}

static void func_800AB564(void)
{
    struct Sprite *sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->tag = 0x65;
        sprite->x = 46.0f;
        sprite->y = 24.0f;
        sprite->userVar = -1;
        sprite->depth = 0.05f;
        sprite->scaleX = 2.0f;
        sprite->scaleY = 2.0f;
        sprite->textAlign = 0;
        sprite->fontId = 0xB0;
        sprite->mainFunc = func_800AB480;
        sprite->drawFunc = func_800A916C;
        strcpy(sprite->text, ">>>");
    }
}

static void func_800AB5F8(void)
{
    struct Sprite *sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->tag = 0x65;
        sprite->x = 544.0f;
        sprite->y = 24.0f;
        sprite->userVar = 1;
        sprite->depth = 0.05f;
        sprite->scaleX = 2.0f;
        sprite->scaleY = 2.0f;
        sprite->textAlign = 0;
        sprite->fontId = 0xB0;
        sprite->mainFunc = func_800AB480;
        sprite->drawFunc = func_800A916C;
        strcpy(sprite->text, "<<<");
    }
}

static void func_800AB68C(void)
{
    struct Sprite *sprite = create_sprite();
    if (sprite != NULL)
    {
        sprite->tag = 0x65;
        sprite->type = 1;
        sprite->bmpId = 0x315;
        sprite->x = 320.0f;
        sprite->y = 48.0f;
        sprite->depth = 10.0f;
        sprite->textAlign = 4;
        strcpy(sprite->text, "BG");
    }
}

static int func_800AB6F8(void)
{
    if (mini_ranking_work.unk9 < 0x3C)
        return -1;
    return 0;
}

// ==================================================================
// Debug random-record generators (Y button in the debug harness).
// ==================================================================

void func_800AB720(struct MiniScoreTime *rec)
{
    rec->rank = rand() % 4;
    rec->min = rand() % 100;
    rec->sec = rand() % 60;
    rec->centi = rand() % 100;
    rec->unk7 = rand() % 4;
    printf("%s %02d'%02d\"%02d\n",
           ((char **)&lbl_801D6674[0])[rec->rank],
           rec->min, rec->sec, rec->centi, rec->unk7);
}

void func_800AB830(struct MiniScoreU16Pair *rec)
{
    rec->rank = rand() % 4;
    rec->unk4 = rand() % 10000;
    rec->unk6 = rand() % 4;
    printf("%s %d\n", ((char **)&lbl_801D6674[0])[rec->rank], rec->unk4);
}

void func_800AB8D8(struct MiniScoreU16 *rec)
{
    rec->rank = rand() % 4;
    rec->unk4 = rand() % 300;
    printf("%s %d\n", ((char **)&lbl_801D6674[0])[rec->rank], rec->unk4);
}

void func_800AB974(struct MiniScoreU16Pair *rec)
{
    rec->rank = rand() % 4;
    rec->unk4 = rand() % 100;
    printf("%s %d\n", ((char **)&lbl_801D6674[0])[rec->rank], rec->unk4);
}

void func_800ABA10(struct MiniScoreU16Pair *rec)
{
    rec->rank = rand() % 4;
    rec->unk4 = rand() % 100;
    rec->unk6 = rand() % 100;
    printf("%s %d\n", ((char **)&lbl_801D6674[0])[rec->rank], rec->unk4 + rec->unk6);
}

// ==================================================================
// High-score insertion (one per record key type). Structural; UNVERIFIED.
// query != 0 => just report the rank without inserting; returns -1 if it would not place.
// ==================================================================

static int func_800ABAE0(int gameSel, struct MiniScoreTime *newRec, int player, int query)
{
    struct MiniScoreTime *arr = (struct MiniScoreTime *)lbl_801D5960[gameSel].records;
    int newKey = newRec->min * 6000 + newRec->sec * 100 + newRec->centi;
    int i, j;

    for (i = 0; i < 5; i++)
    {
        int key = arr[i].min * 6000 + arr[i].sec * 100 + arr[i].centi;
        if (newKey < key)
        {
            if (query)
                return i;
            for (j = 4; j > i; j--)
                arr[j] = arr[j - 1];
            memset(newRec, 0, 3);
            arr[i] = *newRec;
            mini_ranking_work.playerSlots[player] = (s8)i;
            for (j = player - 1; j >= 0; j--)
            {
                s8 s = mini_ranking_work.playerSlots[j];
                if (s >= i)
                {
                    if (s < 4)
                        mini_ranking_work.playerSlots[j] = s + 1;
                    else
                        mini_ranking_work.playerSlots[j] = -1;
                }
            }
            return 1;
        }
    }
    return query ? -1 : 0;
}

// "Rank counter" variant used by games 0..5 (target-style). Structural draft. DRAFT-UNCERTAIN.
static int func_800ABCF4(int gameSel, struct MiniScoreTime *records, int count, int query)
{
    struct MiniScoreTime *arr = (struct MiniScoreTime *)lbl_801D5960[gameSel].records;
    int newKey = records->min * 6000 + records->sec * 100 + records->centi;
    struct MiniRankGameDef *def;
    int worst = 0;
    int i;

    for (i = 1; i < count; i++)
    {
        int key = records[i].min * 6000 + records[i].sec * 100 + records[i].centi;
        if (newKey < key)
            worst = i;
    }

    def = lbl_801D5C1C[0];
    {
        struct MiniScoreTime *cand = &records[worst];
        int candKey = cand->min * 6000 + cand->sec * 100 + cand->centi;
        int defKey = ((struct MiniScoreTime *)def)->min * 6000
                     + ((struct MiniScoreTime *)def)->sec * 100
                     + ((struct MiniScoreTime *)def)->centi;
        if (candKey < defKey)
        {
            if (query)
                return 5;
            memset(cand, 0, 3);
            *(struct MiniScoreTime *)def = *cand;
            if (mini_ranking_work.playerSlots[worst] >= 0)
            {
                mini_ranking_work.flags |= 2;
                mini_ranking_work.playerId = (s8)worst;
            }
            else
            {
                mini_ranking_work.flags |= 4;
                mini_ranking_work.playerId = (s8)worst;
                mini_ranking_work.playerSlots[worst] = 5;
            }
            return query ? -1 : 1;
        }
    }
    (void)arr;
    return query ? -1 : 0;
}

static int func_800ABE80(int gameSel, struct MiniScoreU16Pair *newRec, int player, int query)
{
    struct MiniScoreU16Pair *arr = (struct MiniScoreU16Pair *)lbl_801D5960[gameSel].records;
    int i, j;

    for (i = 0; i < 5; i++)
    {
        if (newRec->unk4 > arr[i].unk4)
        {
            if (query)
                return i;
            for (j = 4; j > i; j--)
                arr[j] = arr[j - 1];
            memset(newRec, 0, 3);
            arr[i] = *newRec;
            mini_ranking_work.playerSlots[player] = (s8)i;
            for (j = player - 1; j >= 0; j--)
            {
                s8 s = mini_ranking_work.playerSlots[j];
                if (s >= i)
                {
                    if (s < 4)
                        mini_ranking_work.playerSlots[j] = s + 1;
                    else
                        mini_ranking_work.playerSlots[j] = -1;
                }
            }
            return 1;
        }
    }
    return query ? -1 : 0;
}

static int func_800AC064(int gameSel, struct MiniScoreU16 *newRec, int player, int query)
{
    struct MiniScoreU16 *arr = (struct MiniScoreU16 *)lbl_801D5960[gameSel].records;
    int i, j;

    for (i = 0; i < 5; i++)
    {
        if (newRec->unk4 > arr[i].unk4)
        {
            if (query)
                return i;
            for (j = 4; j > i; j--)
                arr[j] = arr[j - 1];
            memset(newRec, 0, 3);
            arr[i] = *newRec;
            mini_ranking_work.playerSlots[player] = (s8)i;
            for (j = player - 1; j >= 0; j--)
            {
                s8 s = mini_ranking_work.playerSlots[j];
                if (s >= i)
                {
                    if (s < 4)
                        mini_ranking_work.playerSlots[j] = s + 1;
                    else
                        mini_ranking_work.playerSlots[j] = -1;
                }
            }
            return 1;
        }
    }
    return query ? -1 : 0;
}

static int func_800AC248(int gameSel, struct MiniScoreU16Pair *newRec, int player, int query)
{
    struct MiniScoreU16Pair *arr = (struct MiniScoreU16Pair *)lbl_801D5960[gameSel].records;
    int newKey = newRec->unk4 + newRec->unk6;
    int i, j;

    for (i = 0; i < 5; i++)
    {
        int key = arr[i].unk4 + arr[i].unk6;
        if (newKey < key)
        {
            if (query)
                return i;
            for (j = 4; j > i; j--)
                arr[j] = arr[j - 1];
            memset(newRec, 0, 3);
            arr[i] = *newRec;
            mini_ranking_work.playerSlots[player] = (s8)i;
            for (j = player - 1; j >= 0; j--)
            {
                s8 s = mini_ranking_work.playerSlots[j];
                if (s >= i)
                {
                    if (s < 4)
                        mini_ranking_work.playerSlots[j] = s + 1;
                    else
                        mini_ranking_work.playerSlots[j] = -1;
                }
            }
            return 1;
        }
    }
    return query ? -1 : 0;
}

// ==================================================================
// Dispatch: insert a set of `count` records for `gameSel` and build the active mask.
// ==================================================================
int func_800AC43C(int gameSel, void *records, int count)
{
    u8 *rec = (u8 *)records;
    int result = 0;
    int i;

    func_800AB414();
    mini_ranking_work.gameCategory = (s8)count;

    for (i = 0; i < count; i++)
    {
        if (gameSel >= 9)
        {
            if (gameSel == 0xB)
            {
                result |= func_800AC248(gameSel, (struct MiniScoreU16Pair *)rec, i, 0);
                rec += 8;
            }
            else if (gameSel < 0xB)  // 9, 10
            {
                result |= func_800AC064(gameSel, (struct MiniScoreU16 *)rec, i, 0);
                rec += 6;
            }
        }
        else if (gameSel >= 6)  // 6, 7, 8
        {
            result |= func_800ABE80(gameSel, (struct MiniScoreU16Pair *)rec, i, 0);
            rec += 8;
        }
        else if (gameSel >= 0)  // 0..5
        {
            result |= func_800ABAE0(gameSel, (struct MiniScoreTime *)rec, i, 0);
            rec += 8;
        }
    }

    // Build the active-player bitmask from the claimed rank slots.
    {
        s8 *slot = mini_ranking_work.playerSlots;
        for (i = 0; i < count; i++, slot++)
        {
            if (*slot >= 0)
                mini_ranking_work.activeMask |= (1 << *slot);
        }
    }

    // Games 0..5 additionally run the "rank counter" pass.
    if (gameSel >= 0 && gameSel < 6)
    {
        if (func_800ABCF4(gameSel, (struct MiniScoreTime *)records, count, 0) != 0)
        {
            mini_ranking_work.activeMask |= 0x20;
            result = 1;
        }
    }

    return result;
}

// ==================================================================
// Single-record rank query (returns the placed rank or -1). Structural; UNVERIFIED.
// ==================================================================
static int func_800AC5E0(int gameSel, void *record)
{
    func_800AB414();

    if (gameSel >= 0xB)
    {
        if (gameSel == 0xB)
            return func_800AC248(gameSel, (struct MiniScoreU16Pair *)record, 0, 1);
        return -1;
    }
    if (gameSel >= 9)
        return func_800AC064(gameSel, (struct MiniScoreU16 *)record, 0, 1);
    if (gameSel >= 6)
        return func_800ABE80(gameSel, (struct MiniScoreU16Pair *)record, 0, 1);
    if (gameSel >= 0)
    {
        int a = func_800ABAE0(gameSel, (struct MiniScoreTime *)record, 0, 1);
        int b = func_800ABCF4(gameSel, (struct MiniScoreTime *)record, 1, 1);
        if (a >= 0 && b >= 0)
            return a;
        if (b >= 0)
            return b;
        return a;
    }
    return -1;
}
