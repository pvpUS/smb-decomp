/* 00002D00 7C0802A6 */ mflr r0
/* 00002D04 3C600000 */ lis r3, debugFlags@ha
/* 00002D08 90010004 */ stw r0, 4(r1)
/* 00002D0C 9421FFE0 */ stwu r1, -0x20(r1)
/* 00002D10 93E1001C */ stw r31, 0x1c(r1)
/* 00002D14 93C10018 */ stw r30, 0x18(r1)
/* 00002D18 80030000 */ lwz r0, debugFlags@l(r3)
/* 00002D1C 7000000A */ andi. r0, r0, 0xa
/* 00002D20 40820188 */ bne lbl_00002EA8
/* 00002D24 386000BE */ li r3, 0xbe
/* 00002D28 4BFFD461 */ bl background_set_random_seed
/* 00002D2C 386000BE */ li r3, 0xbe
/* 00002D30 4BFFD459 */ bl load_stage
/* 00002D34 3C600000 */ lis r3, modeCtrl@ha
/* 00002D38 38830000 */ addi r4, r3, modeCtrl@l
/* 00002D3C 38E00000 */ li r7, 0
/* 00002D40 90E40000 */ stw r7, 0(r4)
/* 00002D44 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00002D48 39000000 */ li r8, 0
/* 00002D4C 90E40008 */ stw r7, 8(r4)
/* 00002D50 38C30000 */ addi r6, r3, lbl_801EEDA8@l
/* 00002D54 38000007 */ li r0, 7
/* 00002D58 90E40004 */ stw r7, 4(r4)
/* 00002D5C 38A0FFFF */ li r5, -1
/* 00002D60 2C08000A */ cmpwi r8, 0xa
/* 00002D64 90060000 */ stw r0, 0(r6)
/* 00002D68 90A60004 */ stw r5, 4(r6)
/* 00002D6C 90E60008 */ stw r7, 8(r6)
/* 00002D70 B0A6000C */ sth r5, 0xc(r6)
/* 00002D74 B0E6000E */ sth r7, 0xe(r6)
/* 00002D78 A806000E */ lha r0, 0xe(r6)
/* 00002D7C 80860000 */ lwz r4, 0(r6)
/* 00002D80 5400103A */ slwi r0, r0, 2
/* 00002D84 7C660214 */ add r3, r6, r0
/* 00002D88 90830010 */ stw r4, 0x10(r3)
/* 00002D8C 90A60068 */ stw r5, 0x68(r6)
/* 00002D90 4080006C */ bge lbl_00002DFC
/* 00002D94 90A6006C */ stw r5, 0x6c(r6)
/* 00002D98 39000008 */ li r8, 8
/* 00002D9C 90A60094 */ stw r5, 0x94(r6)
/* 00002DA0 90A60070 */ stw r5, 0x70(r6)
/* 00002DA4 90A60098 */ stw r5, 0x98(r6)
/* 00002DA8 90A60074 */ stw r5, 0x74(r6)
/* 00002DAC 90A6009C */ stw r5, 0x9c(r6)
/* 00002DB0 90A60078 */ stw r5, 0x78(r6)
/* 00002DB4 90A600A0 */ stw r5, 0xa0(r6)
/* 00002DB8 90A6007C */ stw r5, 0x7c(r6)
/* 00002DBC 90A600A4 */ stw r5, 0xa4(r6)
/* 00002DC0 90A60080 */ stw r5, 0x80(r6)
/* 00002DC4 90A600A8 */ stw r5, 0xa8(r6)
/* 00002DC8 90A60084 */ stw r5, 0x84(r6)
/* 00002DCC 90A600AC */ stw r5, 0xac(r6)
/* 00002DD0 90A60088 */ stw r5, 0x88(r6)
/* 00002DD4 90A600B0 */ stw r5, 0xb0(r6)
/* 00002DD8 480000C4 */ b lbl_00002E9C
lbl_00002DDC:
/* 00002DDC 2008000A */ subfic r0, r8, 0xa
/* 00002DE0 2C08000A */ cmpwi r8, 0xa
/* 00002DE4 7C0903A6 */ mtctr r0
/* 00002DE8 40800014 */ bge lbl_00002DFC
lbl_00002DEC:
/* 00002DEC 90A3006C */ stw r5, 0x6c(r3)
/* 00002DF0 90A30094 */ stw r5, 0x94(r3)
/* 00002DF4 38630004 */ addi r3, r3, 4
/* 00002DF8 4200FFF4 */ bdnz lbl_00002DEC
lbl_00002DFC:
/* 00002DFC 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00002E00 3BE30000 */ addi r31, r3, lbl_801EEDA8@l
/* 00002E04 3BC00000 */ li r30, 0
/* 00002E08 93DF0110 */ stw r30, 0x110(r31)
/* 00002E0C 4BFFEB05 */ bl lbl_00001910
/* 00002E10 38000001 */ li r0, 1
/* 00002E14 901F0040 */ stw r0, 0x40(r31)
/* 00002E18 3CA00000 */ lis r5, modeCtrl@ha
/* 00002E1C 3C800000 */ lis r4, lbl_802F1C10@ha
/* 00002E20 907F003C */ stw r3, 0x3c(r31)
/* 00002E24 38A50000 */ addi r5, r5, modeCtrl@l
/* 00002E28 38840000 */ addi r4, r4, lbl_802F1C10@l
/* 00002E2C 801F003C */ lwz r0, 0x3c(r31)
/* 00002E30 3C600000 */ lis r3, playerCharacterSelection@ha
/* 00002E34 90050024 */ stw r0, 0x24(r5)
/* 00002E38 88040004 */ lbz r0, 4(r4)
/* 00002E3C 7C000774 */ extsb r0, r0
/* 00002E40 94030000 */ stwu r0, playerCharacterSelection@l(r3)
/* 00002E44 88040005 */ lbz r0, 5(r4)
/* 00002E48 7C000774 */ extsb r0, r0
/* 00002E4C 90030004 */ stw r0, 4(r3)
/* 00002E50 88040006 */ lbz r0, 6(r4)
/* 00002E54 7C000774 */ extsb r0, r0
/* 00002E58 90030008 */ stw r0, 8(r3)
/* 00002E5C 88040007 */ lbz r0, 7(r4)
/* 00002E60 7C000774 */ extsb r0, r0
/* 00002E64 9003000C */ stw r0, 0xc(r3)
/* 00002E68 93DF0048 */ stw r30, 0x48(r31)
/* 00002E6C 93DF004C */ stw r30, 0x4c(r31)
/* 00002E70 93DF0050 */ stw r30, 0x50(r31)
/* 00002E74 93DF0054 */ stw r30, 0x54(r31)
/* 00002E78 93DF0044 */ stw r30, 0x44(r31)
/* 00002E7C 4BFFD3B9 */ bl lbl_00000234
/* 00002E80 4BFFD4BD */ bl lbl_0000033C
/* 00002E84 4BFFD305 */ bl func_800123DC
/* 00002E88 38600100 */ li r3, 0x100
/* 00002E8C 38800000 */ li r4, 0
/* 00002E90 38A0001E */ li r5, 0x1e
/* 00002E94 4BFFD2F5 */ bl start_screen_fade
/* 00002E98 48000010 */ b lbl_00002EA8
lbl_00002E9C:
/* 00002E9C 5500103A */ slwi r0, r8, 2
/* 00002EA0 7C660214 */ add r3, r6, r0
/* 00002EA4 4BFFFF38 */ b lbl_00002DDC
lbl_00002EA8:
/* 00002EA8 80010024 */ lwz r0, 0x24(r1)
/* 00002EAC 83E1001C */ lwz r31, 0x1c(r1)
/* 00002EB0 83C10018 */ lwz r30, 0x18(r1)
/* 00002EB4 7C0803A6 */ mtlr r0
/* 00002EB8 38210020 */ addi r1, r1, 0x20
/* 00002EBC 4E800020 */ blr 
