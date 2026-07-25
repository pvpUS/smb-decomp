/* 00003C6C 7C0802A6 */ mflr r0
/* 00003C70 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 00003C74 90010004 */ stw r0, 4(r1)
/* 00003C78 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 00003C7C 9421FFE8 */ stwu r1, -0x18(r1)
/* 00003C80 93E10014 */ stw r31, 0x14(r1)
/* 00003C84 93C10010 */ stw r30, 0x10(r1)
/* 00003C88 3BC30004 */ addi r30, r3, 4
/* 00003C8C 93A1000C */ stw r29, 0xc(r1)
/* 00003C90 A0830004 */ lhz r4, 4(r3)
/* 00003C94 3C600000 */ lis r3, lbl_10000000@ha
/* 00003C98 38630000 */ addi r3, r3, lbl_10000000@l
/* 00003C9C 54800739 */ rlwinm. r0, r4, 0, 0x1c, 0x1c
/* 00003CA0 83A30114 */ lwz r29, 0x114(r3)
/* 00003CA4 3BE300FC */ addi r31, r3, 0xfc
/* 00003CA8 40820028 */ bne lbl_00003CD0
/* 00003CAC 3C600000 */ lis r3, g_currPlayerAnalogButtons@ha
/* 00003CB0 38630000 */ addi r3, r3, g_currPlayerAnalogButtons@l
/* 00003CB4 A0630004 */ lhz r3, 4(r3)
/* 00003CB8 54600739 */ rlwinm. r0, r3, 0, 0x1c, 0x1c
/* 00003CBC 40820014 */ bne lbl_00003CD0
/* 00003CC0 5480077B */ rlwinm. r0, r4, 0, 0x1d, 0x1d
/* 00003CC4 4082000C */ bne lbl_00003CD0
/* 00003CC8 5460077B */ rlwinm. r0, r3, 0, 0x1d, 0x1d
/* 00003CCC 41820010 */ beq lbl_00003CDC
lbl_00003CD0:
/* 00003CD0 7FA00034 */ cntlzw r0, r29
/* 00003CD4 5400D97E */ srwi r0, r0, 5
/* 00003CD8 7C1D0378 */ mr r29, r0
lbl_00003CDC:
/* 00003CDC 801F0018 */ lwz r0, 0x18(r31)
/* 00003CE0 7C1D0000 */ cmpw r29, r0
/* 00003CE4 41820010 */ beq lbl_00003CF4
/* 00003CE8 3860006C */ li r3, 0x6c
/* 00003CEC 4BFFC4C1 */ bl u_play_sound_0
/* 00003CF0 93BF0018 */ stw r29, 0x18(r31)
lbl_00003CF4:
/* 00003CF4 A07E0000 */ lhz r3, 0(r30)
/* 00003CF8 546005EF */ rlwinm. r0, r3, 0, 0x17, 0x17
/* 00003CFC 41820050 */ beq lbl_00003D4C
/* 00003D00 3860006A */ li r3, 0x6a
/* 00003D04 4BFFC4A9 */ bl u_play_sound_0
/* 00003D08 801F0018 */ lwz r0, 0x18(r31)
/* 00003D0C 2C000000 */ cmpwi r0, 0
/* 00003D10 4082001C */ bne lbl_00003D2C
/* 00003D14 3860005E */ li r3, 0x5e
/* 00003D18 480004ED */ bl lbl_00004204
/* 00003D1C 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00003D20 380000B2 */ li r0, 0xb2
/* 00003D24 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00003D28 48000048 */ b lbl_00003D70
lbl_00003D2C:
/* 00003D2C 2C000001 */ cmpwi r0, 1
/* 00003D30 40820040 */ bne lbl_00003D70
/* 00003D34 3860005E */ li r3, 0x5e
/* 00003D38 480004CD */ bl lbl_00004204
/* 00003D3C 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00003D40 380000C4 */ li r0, 0xc4
/* 00003D44 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00003D48 48000028 */ b lbl_00003D70
lbl_00003D4C:
/* 00003D4C 546005AD */ rlwinm. r0, r3, 0, 0x16, 0x16
/* 00003D50 41820020 */ beq lbl_00003D70
/* 00003D54 3860006B */ li r3, 0x6b
/* 00003D58 4BFFC455 */ bl u_play_sound_0
/* 00003D5C 3860005E */ li r3, 0x5e
/* 00003D60 48000501 */ bl lbl_00004260
/* 00003D64 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00003D68 380000AE */ li r0, 0xae
/* 00003D6C B0030000 */ sth r0, gameSubmodeRequest@l(r3)
lbl_00003D70:
/* 00003D70 8001001C */ lwz r0, 0x1c(r1)
/* 00003D74 83E10014 */ lwz r31, 0x14(r1)
/* 00003D78 83C10010 */ lwz r30, 0x10(r1)
/* 00003D7C 7C0803A6 */ mtlr r0
/* 00003D80 83A1000C */ lwz r29, 0xc(r1)
/* 00003D84 38210018 */ addi r1, r1, 0x18
/* 00003D88 4E800020 */ blr 
