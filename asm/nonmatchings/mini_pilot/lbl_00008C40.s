/* 00008C40 7C0802A6 */ mflr r0
/* 00008C44 3C800000 */ lis r4, lbl_0000C360@ha
/* 00008C48 90010004 */ stw r0, 4(r1)
/* 00008C4C 3CC00000 */ lis r6, lbl_0000D218@ha
/* 00008C50 9421FF58 */ stwu r1, -0xa8(r1)
/* 00008C54 DBE100A0 */ stfd f31, 0xa0(r1)
/* 00008C58 DBC10098 */ stfd f30, 0x98(r1)
/* 00008C5C DBA10090 */ stfd f29, 0x90(r1)
/* 00008C60 DB810088 */ stfd f28, 0x88(r1)
/* 00008C64 DB610080 */ stfd f27, 0x80(r1)
/* 00008C68 93E1007C */ stw r31, 0x7c(r1)
/* 00008C6C 3BE40000 */ addi r31, r4, lbl_0000C360@l
/* 00008C70 3C800000 */ lis r4, currentBall@ha
/* 00008C74 93C10078 */ stw r30, 0x78(r1)
/* 00008C78 93A10074 */ stw r29, 0x74(r1)
/* 00008C7C 3BA60000 */ addi r29, r6, lbl_0000D218@l
/* 00008C80 93810070 */ stw r28, 0x70(r1)
/* 00008C84 83840000 */ lwz r28, currentBall@l(r4)
/* 00008C88 3C800000 */ lis r4, lbl_802F1FD0@ha
/* 00008C8C 80BF00E0 */ lwz r5, 0xe0(r31)
/* 00008C90 801F00E4 */ lwz r0, 0xe4(r31)
/* 00008C94 90A10010 */ stw r5, 0x10(r1)
/* 00008C98 3CA00000 */ lis r5, lbl_100000A8@ha
/* 00008C9C 3BC50000 */ addi r30, r5, lbl_100000A8@l
/* 00008CA0 90010014 */ stw r0, 0x14(r1)
/* 00008CA4 80040000 */ lwz r0, lbl_802F1FD0@l(r4)
/* 00008CA8 C3E30004 */ lfs f31, 4(r3)
/* 00008CAC 540004E7 */ rlwinm. r0, r0, 0, 0x13, 0x13
/* 00008CB0 C3C30008 */ lfs f30, 8(r3)
/* 00008CB4 41820040 */ beq lbl_00008CF4
/* 00008CB8 A89E0008 */ lha r4, 8(r30)
/* 00008CBC 3C600000 */ lis r3, lbl_0000C3C0@ha
/* 00008CC0 C8430000 */ lfd f2, lbl_0000C3C0@l(r3)
/* 00008CC4 6C808000 */ xoris r0, r4, 0x8000
/* 00008CC8 C81F00E8 */ lfd f0, 0xe8(r31)
/* 00008CCC 9001006C */ stw r0, 0x6c(r1)
/* 00008CD0 3C004330 */ lis r0, 0x4330
/* 00008CD4 90010068 */ stw r0, 0x68(r1)
/* 00008CD8 C8210068 */ lfd f1, 0x68(r1)
/* 00008CDC FC211028 */ fsub f1, f1, f2
/* 00008CE0 FC010040 */ fcmpo cr0, f1, f0
/* 00008CE4 40800024 */ bge lbl_00008D08
/* 00008CE8 38040001 */ addi r0, r4, 1
/* 00008CEC B01E0008 */ sth r0, 8(r30)
/* 00008CF0 48000018 */ b lbl_00008D08
lbl_00008CF4:
/* 00008CF4 A87E0008 */ lha r3, 8(r30)
/* 00008CF8 2C030000 */ cmpwi r3, 0
/* 00008CFC 4081000C */ ble lbl_00008D08
/* 00008D00 3803FFFF */ addi r0, r3, -1
/* 00008D04 B01E0008 */ sth r0, 8(r30)
lbl_00008D08:
/* 00008D08 C01F0054 */ lfs f0, 0x54(r31)
/* 00008D0C 3C600100 */ lis r3, 0x100
/* 00008D10 3883FFFF */ addi r4, r3, -1
/* 00008D14 D0010028 */ stfs f0, 0x28(r1)
/* 00008D18 38E00000 */ li r7, 0
/* 00008D1C 38C0FFFF */ li r6, -1
/* 00008D20 C01F0054 */ lfs f0, 0x54(r31)
/* 00008D24 38A00005 */ li r5, 5
/* 00008D28 38000B18 */ li r0, 0xb18
/* 00008D2C D001002C */ stfs f0, 0x2c(r1)
/* 00008D30 38610018 */ addi r3, r1, 0x18
/* 00008D34 C01F0098 */ lfs f0, 0x98(r31)
/* 00008D38 D0010034 */ stfs f0, 0x34(r1)
/* 00008D3C D0010030 */ stfs f0, 0x30(r1)
/* 00008D40 C01F0054 */ lfs f0, 0x54(r31)
/* 00008D44 D001003C */ stfs f0, 0x3c(r1)
/* 00008D48 D0010038 */ stfs f0, 0x38(r1)
/* 00008D4C 90E10040 */ stw r7, 0x40(r1)
/* 00008D50 90C10048 */ stw r6, 0x48(r1)
/* 00008D54 90A1004C */ stw r5, 0x4c(r1)
/* 00008D58 C01F0054 */ lfs f0, 0x54(r31)
/* 00008D5C D0010044 */ stfs f0, 0x44(r1)
/* 00008D60 90810050 */ stw r4, 0x50(r1)
/* 00008D64 90E10054 */ stw r7, 0x54(r1)
/* 00008D68 90010018 */ stw r0, 0x18(r1)
/* 00008D6C D3E1001C */ stfs f31, 0x1c(r1)
/* 00008D70 D3C10020 */ stfs f30, 0x20(r1)
/* 00008D74 C01F00F0 */ lfs f0, 0xf0(r31)
/* 00008D78 D0010024 */ stfs f0, 0x24(r1)
/* 00008D7C 4BFF73D1 */ bl nlSprPut
/* 00008D80 C83F0100 */ lfd f1, 0x100(r31)
/* 00008D84 C01C0008 */ lfs f0, 8(r28)
/* 00008D88 C85F00F8 */ lfd f2, 0xf8(r31)
/* 00008D8C FC210032 */ fmul f1, f1, f0
/* 00008D90 C81F0108 */ lfd f0, 0x108(r31)
/* 00008D94 FC220828 */ fsub f1, f2, f1
/* 00008D98 FF600818 */ frsp f27, f1
/* 00008D9C FC1B0040 */ fcmpo cr0, f27, f0
/* 00008DA0 40800008 */ bge lbl_00008DA8
/* 00008DA4 C37F0110 */ lfs f27, 0x110(r31)
lbl_00008DA8:
/* 00008DA8 C81F00B8 */ lfd f0, 0xb8(r31)
/* 00008DAC 38000B16 */ li r0, 0xb16
/* 00008DB0 C83F0088 */ lfd f1, 0x88(r31)
/* 00008DB4 38610018 */ addi r3, r1, 0x18
/* 00008DB8 FC1E0028 */ fsub f0, f30, f0
/* 00008DBC FFA1F82A */ fadd f29, f1, f31
/* 00008DC0 90010018 */ stw r0, 0x18(r1)
/* 00008DC4 FF80D82A */ fadd f28, f0, f27
/* 00008DC8 FFA0E818 */ frsp f29, f29
/* 00008DCC FF80E018 */ frsp f28, f28
/* 00008DD0 D3A1001C */ stfs f29, 0x1c(r1)
/* 00008DD4 D3810020 */ stfs f28, 0x20(r1)
/* 00008DD8 C01F0008 */ lfs f0, 8(r31)
/* 00008DDC D0010024 */ stfs f0, 0x24(r1)
/* 00008DE0 4BFF736D */ bl nlSprPut
/* 00008DE4 881C014A */ lbz r0, 0x14a(r28)
/* 00008DE8 38810010 */ addi r4, r1, 0x10
/* 00008DEC 38610018 */ addi r3, r1, 0x18
/* 00008DF0 5400083C */ slwi r0, r0, 1
/* 00008DF4 7C0402AE */ lhax r0, r4, r0
/* 00008DF8 90010018 */ stw r0, 0x18(r1)
/* 00008DFC C81F0118 */ lfd f0, 0x118(r31)
/* 00008E00 FC00E82A */ fadd f0, f0, f29
/* 00008E04 FC000018 */ frsp f0, f0
/* 00008E08 D001001C */ stfs f0, 0x1c(r1)
/* 00008E0C C01F0120 */ lfs f0, 0x120(r31)
/* 00008E10 EC1C0028 */ fsubs f0, f28, f0
/* 00008E14 D0010020 */ stfs f0, 0x20(r1)
/* 00008E18 C01F0008 */ lfs f0, 8(r31)
/* 00008E1C D0010024 */ stfs f0, 0x24(r1)
/* 00008E20 4BFF732D */ bl nlSprPut
/* 00008E24 A87E0008 */ lha r3, 8(r30)
/* 00008E28 7C600735 */ extsh. r0, r3
/* 00008E2C 41820084 */ beq lbl_00008EB0
/* 00008E30 6C608000 */ xoris r0, r3, 0x8000
/* 00008E34 9001006C */ stw r0, 0x6c(r1)
/* 00008E38 3860000D */ li r3, 0xd
/* 00008E3C 3C004330 */ lis r0, 0x4330
/* 00008E40 9061004C */ stw r3, 0x4c(r1)
/* 00008E44 3C600000 */ lis r3, lbl_0000C3C0@ha
/* 00008E48 90010068 */ stw r0, 0x68(r1)
/* 00008E4C 38000B39 */ li r0, 0xb39
/* 00008E50 C8430000 */ lfd f2, lbl_0000C3C0@l(r3)
/* 00008E54 38610018 */ addi r3, r1, 0x18
/* 00008E58 C8210068 */ lfd f1, 0x68(r1)
/* 00008E5C C81F00E8 */ lfd f0, 0xe8(r31)
/* 00008E60 FC211028 */ fsub f1, f1, f2
/* 00008E64 FC010024 */ fdiv f0, f1, f0
/* 00008E68 FC000018 */ frsp f0, f0
/* 00008E6C D0010028 */ stfs f0, 0x28(r1)
/* 00008E70 C0010028 */ lfs f0, 0x28(r1)
/* 00008E74 D001002C */ stfs f0, 0x2c(r1)
/* 00008E78 90010018 */ stw r0, 0x18(r1)
/* 00008E7C C81F0128 */ lfd f0, 0x128(r31)
/* 00008E80 FC00E82A */ fadd f0, f0, f29
/* 00008E84 FC000018 */ frsp f0, f0
/* 00008E88 D001001C */ stfs f0, 0x1c(r1)
/* 00008E8C C81F0130 */ lfd f0, 0x130(r31)
/* 00008E90 FC00E02A */ fadd f0, f0, f28
/* 00008E94 FC000018 */ frsp f0, f0
/* 00008E98 D0010020 */ stfs f0, 0x20(r1)
/* 00008E9C C01F009C */ lfs f0, 0x9c(r31)
/* 00008EA0 D0010024 */ stfs f0, 0x24(r1)
/* 00008EA4 4BFF72A9 */ bl nlSprPut
/* 00008EA8 38000005 */ li r0, 5
/* 00008EAC 9001004C */ stw r0, 0x4c(r1)
lbl_00008EB0:
/* 00008EB0 C01F00C8 */ lfs f0, 0xc8(r31)
/* 00008EB4 3CA00000 */ lis r5, modeCtrl@ha
/* 00008EB8 3C800000 */ lis r4, playerCharacterSelection@ha
/* 00008EBC D0010028 */ stfs f0, 0x28(r1)
/* 00008EC0 3C600000 */ lis r3, neutralFaceTable@ha
/* 00008EC4 38A50000 */ addi r5, r5, modeCtrl@l
/* 00008EC8 C01F0138 */ lfs f0, 0x138(r31)
/* 00008ECC 38840000 */ addi r4, r4, playerCharacterSelection@l
/* 00008ED0 38030000 */ addi r0, r3, neutralFaceTable@l
/* 00008ED4 D001002C */ stfs f0, 0x2c(r1)
/* 00008ED8 38610018 */ addi r3, r1, 0x18
/* 00008EDC 80A5002C */ lwz r5, 0x2c(r5)
/* 00008EE0 54A5103A */ slwi r5, r5, 2
/* 00008EE4 7C842A14 */ add r4, r4, r5
/* 00008EE8 80840000 */ lwz r4, 0(r4)
/* 00008EEC 5484103A */ slwi r4, r4, 2
/* 00008EF0 7C802214 */ add r4, r0, r4
/* 00008EF4 80040000 */ lwz r0, 0(r4)
/* 00008EF8 90010018 */ stw r0, 0x18(r1)
/* 00008EFC C01F000C */ lfs f0, 0xc(r31)
/* 00008F00 EC00E82A */ fadds f0, f0, f29
/* 00008F04 D001001C */ stfs f0, 0x1c(r1)
/* 00008F08 C01F013C */ lfs f0, 0x13c(r31)
/* 00008F0C EC1C0028 */ fsubs f0, f28, f0
/* 00008F10 D0010020 */ stfs f0, 0x20(r1)
/* 00008F14 C01F0008 */ lfs f0, 8(r31)
/* 00008F18 D0010024 */ stfs f0, 0x24(r1)
/* 00008F1C 4BFF7231 */ bl nlSprPut
/* 00008F20 C01F0140 */ lfs f0, 0x140(r31)
/* 00008F24 3BC00B15 */ li r30, 0xb15
/* 00008F28 38610018 */ addi r3, r1, 0x18
/* 00008F2C D0010028 */ stfs f0, 0x28(r1)
/* 00008F30 C01F00C8 */ lfs f0, 0xc8(r31)
/* 00008F34 D001002C */ stfs f0, 0x2c(r1)
/* 00008F38 93C10018 */ stw r30, 0x18(r1)
/* 00008F3C C81F0048 */ lfd f0, 0x48(r31)
/* 00008F40 FFFF0028 */ fsub f31, f31, f0
/* 00008F44 FF80F818 */ frsp f28, f31
/* 00008F48 D381001C */ stfs f28, 0x1c(r1)
/* 00008F4C C81F0148 */ lfd f0, 0x148(r31)
/* 00008F50 FC00F02A */ fadd f0, f0, f30
/* 00008F54 FC000018 */ frsp f0, f0
/* 00008F58 D0010020 */ stfs f0, 0x20(r1)
/* 00008F5C C01F009C */ lfs f0, 0x9c(r31)
/* 00008F60 D0010024 */ stfs f0, 0x24(r1)
/* 00008F64 4BFF71E9 */ bl nlSprPut
/* 00008F68 93C10018 */ stw r30, 0x18(r1)
/* 00008F6C 38610018 */ addi r3, r1, 0x18
/* 00008F70 D381001C */ stfs f28, 0x1c(r1)
/* 00008F74 C81F0150 */ lfd f0, 0x150(r31)
/* 00008F78 FC00F02A */ fadd f0, f0, f30
/* 00008F7C FC000018 */ frsp f0, f0
/* 00008F80 D0010020 */ stfs f0, 0x20(r1)
/* 00008F84 C01F009C */ lfs f0, 0x9c(r31)
/* 00008F88 D0010024 */ stfs f0, 0x24(r1)
/* 00008F8C 4BFF71C1 */ bl nlSprPut
/* 00008F90 93C10018 */ stw r30, 0x18(r1)
/* 00008F94 38610018 */ addi r3, r1, 0x18
/* 00008F98 D381001C */ stfs f28, 0x1c(r1)
/* 00008F9C C81F0158 */ lfd f0, 0x158(r31)
/* 00008FA0 FC00F02A */ fadd f0, f0, f30
/* 00008FA4 FC000018 */ frsp f0, f0
/* 00008FA8 D0010020 */ stfs f0, 0x20(r1)
/* 00008FAC C01F009C */ lfs f0, 0x9c(r31)
/* 00008FB0 D0010024 */ stfs f0, 0x24(r1)
/* 00008FB4 4BFF7199 */ bl nlSprPut
/* 00008FB8 4BFF7195 */ bl reset_text_draw_settings
/* 00008FBC 38600057 */ li r3, 0x57
/* 00008FC0 4BFF718D */ bl set_text_font
/* 00008FC4 C81F0148 */ lfd f0, 0x148(r31)
/* 00008FC8 FC20E090 */ fmr f1, f28
/* 00008FCC FC5E0028 */ fsub f2, f30, f0
/* 00008FD0 FC401018 */ frsp f2, f2
/* 00008FD4 4BFF7179 */ bl set_text_pos
/* 00008FD8 C81F0108 */ lfd f0, 0x108(r31)
/* 00008FDC FC1B0040 */ fcmpo cr0, f27, f0
/* 00008FE0 4C401382 */ cror 2, 0, 2
/* 00008FE4 40820034 */ bne lbl_00009018
/* 00008FE8 3C600000 */ lis r3, globalAnimTimer@ha
/* 00008FEC 80030000 */ lwz r0, globalAnimTimer@l(r3)
/* 00008FF0 5400EFFF */ rlwinm. r0, r0, 0x1d, 0x1f, 0x1f
/* 00008FF4 41820030 */ beq lbl_00009024
/* 00008FF8 C01C0008 */ lfs f0, 8(r28)
/* 00008FFC 387D0108 */ addi r3, r29, 0x108
/* 00009000 4CC63182 */ crclr 6
/* 00009004 FC00001E */ fctiwz f0, f0
/* 00009008 D8010068 */ stfd f0, 0x68(r1)
/* 0000900C 8081006C */ lwz r4, 0x6c(r1)
/* 00009010 4BFF713D */ bl sprite_printf
/* 00009014 48000010 */ b lbl_00009024
lbl_00009018:
/* 00009018 387D0114 */ addi r3, r29, 0x114
/* 0000901C 4CC63182 */ crclr 6
/* 00009020 4BFF712D */ bl sprite_printf
lbl_00009024:
/* 00009024 C81F0160 */ lfd f0, 0x160(r31)
/* 00009028 FC20F818 */ frsp f1, f31
/* 0000902C FC40F02A */ fadd f2, f0, f30
/* 00009030 FC401018 */ frsp f2, f2
/* 00009034 4BFF7119 */ bl set_text_pos
/* 00009038 387D0118 */ addi r3, r29, 0x118
/* 0000903C 4CC63182 */ crclr 6
/* 00009040 4BFF710D */ bl sprite_printf
/* 00009044 C83F0168 */ lfd f1, 0x168(r31)
/* 00009048 C81F0170 */ lfd f0, 0x170(r31)
/* 0000904C FC21F82A */ fadd f1, f1, f31
/* 00009050 FC40F02A */ fadd f2, f0, f30
/* 00009054 FC200818 */ frsp f1, f1
/* 00009058 FC401018 */ frsp f2, f2
/* 0000905C 4BFF70F1 */ bl set_text_pos
/* 00009060 387D011C */ addi r3, r29, 0x11c
/* 00009064 4CC63182 */ crclr 6
/* 00009068 4BFF70E5 */ bl sprite_printf
/* 0000906C 800100AC */ lwz r0, 0xac(r1)
/* 00009070 CBE100A0 */ lfd f31, 0xa0(r1)
/* 00009074 CBC10098 */ lfd f30, 0x98(r1)
/* 00009078 7C0803A6 */ mtlr r0
/* 0000907C CBA10090 */ lfd f29, 0x90(r1)
/* 00009080 CB810088 */ lfd f28, 0x88(r1)
/* 00009084 CB610080 */ lfd f27, 0x80(r1)
/* 00009088 83E1007C */ lwz r31, 0x7c(r1)
/* 0000908C 83C10078 */ lwz r30, 0x78(r1)
/* 00009090 83A10074 */ lwz r29, 0x74(r1)
/* 00009094 83810070 */ lwz r28, 0x70(r1)
/* 00009098 382100A8 */ addi r1, r1, 0xa8
/* 0000909C 4E800020 */ blr 
