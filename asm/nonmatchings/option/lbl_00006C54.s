/* 00006C54 7C0802A6 */ mflr r0
/* 00006C58 3C800000 */ lis r4, lbl_0000C8F0@ha
/* 00006C5C 90010004 */ stw r0, 4(r1)
/* 00006C60 9421FEF0 */ stwu r1, -0x110(r1)
/* 00006C64 DBE10108 */ stfd f31, 0x108(r1)
/* 00006C68 BEC100E0 */ stmw r22, 0xe0(r1)
/* 00006C6C 3BC40000 */ addi r30, r4, lbl_0000C8F0@l
/* 00006C70 3C800000 */ lis r4, lbl_0000C370@ha
/* 00006C74 3BE40000 */ addi r31, r4, lbl_0000C370@l
/* 00006C78 8863000F */ lbz r3, 0xf(r3)
/* 00006C7C 7C630774 */ extsb r3, r3
/* 00006C80 4BFFD2ED */ bl lbl_00003F6C
/* 00006C84 28030000 */ cmplwi r3, 0
/* 00006C88 41820040 */ beq lbl_00006CC8
/* 00006C8C C05F0000 */ lfs f2, 0(r31)
/* 00006C90 C0230004 */ lfs f1, 4(r3)
/* 00006C94 C0030008 */ lfs f0, 8(r3)
/* 00006C98 FC601090 */ fmr f3, f2
/* 00006C9C EC21002A */ fadds f1, f1, f0
/* 00006CA0 4BFF950D */ bl mathutil_mtxA_from_translate_xyz
/* 00006CA4 3C600000 */ lis r3, lbl_10000000@ha
/* 00006CA8 38630000 */ addi r3, r3, lbl_10000000@l
/* 00006CAC 38630184 */ addi r3, r3, 0x184
/* 00006CB0 4BFF94FD */ bl mathutil_mtxA_to_mtx
/* 00006CB4 3C600000 */ lis r3, mathutilData@ha
/* 00006CB8 38630000 */ addi r3, r3, mathutilData@l
/* 00006CBC 80630000 */ lwz r3, 0(r3)
/* 00006CC0 38800000 */ li r4, 0
/* 00006CC4 4BFF94E9 */ bl GXLoadPosMtxImm
lbl_00006CC8:
/* 00006CC8 7FC3F378 */ mr r3, r30
/* 00006CCC 4BFF94E1 */ bl nlSprPut
/* 00006CD0 C01F0088 */ lfs f0, 0x88(r31)
/* 00006CD4 3BA100A8 */ addi r29, r1, 0xa8
/* 00006CD8 388000B3 */ li r4, 0xb3
/* 00006CDC D0010068 */ stfs f0, 0x68(r1)
/* 00006CE0 3B200000 */ li r25, 0
/* 00006CE4 3C000020 */ lis r0, 0x20
/* 00006CE8 C01F00A4 */ lfs f0, 0xa4(r31)
/* 00006CEC 7FA3EB78 */ mr r3, r29
/* 00006CF0 D001005C */ stfs f0, 0x5c(r1)
/* 00006CF4 C01F0060 */ lfs f0, 0x60(r31)
/* 00006CF8 D0010060 */ stfs f0, 0x60(r1)
/* 00006CFC 9881001D */ stb r4, 0x1d(r1)
/* 00006D00 389E08B4 */ addi r4, r30, 0x8b4
/* 00006D04 9B21008C */ stb r25, 0x8c(r1)
/* 00006D08 9B21008D */ stb r25, 0x8d(r1)
/* 00006D0C 9B21008E */ stb r25, 0x8e(r1)
/* 00006D10 90010090 */ stw r0, 0x90(r1)
/* 00006D14 4BFF9499 */ bl strcpy
/* 00006D18 4BFF9495 */ bl reset_text_draw_settings
/* 00006D1C 8861001D */ lbz r3, 0x1d(r1)
/* 00006D20 4BFF948D */ bl set_text_font
/* 00006D24 C021005C */ lfs f1, 0x5c(r1)
/* 00006D28 C0410060 */ lfs f2, 0x60(r1)
/* 00006D2C 4BFF9481 */ bl set_text_scale
/* 00006D30 80610090 */ lwz r3, 0x90(r1)
/* 00006D34 4BFF9479 */ bl func_80071B50
/* 00006D38 C0210068 */ lfs f1, 0x68(r1)
/* 00006D3C 4BFF9471 */ bl func_80071B1C
/* 00006D40 88010029 */ lbz r0, 0x29(r1)
/* 00006D44 88610028 */ lbz r3, 0x28(r1)
/* 00006D48 5400402E */ slwi r0, r0, 8
/* 00006D4C 8881002A */ lbz r4, 0x2a(r1)
/* 00006D50 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00006D54 7C830378 */ or r3, r4, r0
/* 00006D58 4BFF9455 */ bl set_text_mul_color
/* 00006D5C 8801008D */ lbz r0, 0x8d(r1)
/* 00006D60 8861008C */ lbz r3, 0x8c(r1)
/* 00006D64 5400402E */ slwi r0, r0, 8
/* 00006D68 8881008E */ lbz r4, 0x8e(r1)
/* 00006D6C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00006D70 7C830378 */ or r3, r4, r0
/* 00006D74 4BFF9439 */ bl set_text_add_color
/* 00006D78 7FA3EB78 */ mr r3, r29
/* 00006D7C 4BFF9431 */ bl u_get_text_width
/* 00006D80 C81F0058 */ lfd f0, 0x58(r31)
/* 00006D84 380000FF */ li r0, 0xff
/* 00006D88 C85F00A8 */ lfd f2, 0xa8(r31)
/* 00006D8C FC000072 */ fmul f0, f0, f1
/* 00006D90 FC020028 */ fsub f0, f2, f0
/* 00006D94 FC000018 */ frsp f0, f0
/* 00006D98 D0010020 */ stfs f0, 0x20(r1)
/* 00006D9C C01F0090 */ lfs f0, 0x90(r31)
/* 00006DA0 D0010024 */ stfs f0, 0x24(r1)
/* 00006DA4 98010028 */ stb r0, 0x28(r1)
/* 00006DA8 98010029 */ stb r0, 0x29(r1)
/* 00006DAC 9B21002A */ stb r25, 0x2a(r1)
/* 00006DB0 4BFF93FD */ bl reset_text_draw_settings
/* 00006DB4 8861001D */ lbz r3, 0x1d(r1)
/* 00006DB8 4BFF93F5 */ bl set_text_font
/* 00006DBC C021005C */ lfs f1, 0x5c(r1)
/* 00006DC0 C0410060 */ lfs f2, 0x60(r1)
/* 00006DC4 4BFF93E9 */ bl set_text_scale
/* 00006DC8 80610090 */ lwz r3, 0x90(r1)
/* 00006DCC 4BFF93E1 */ bl func_80071B50
/* 00006DD0 C83F0028 */ lfd f1, 0x28(r31)
/* 00006DD4 C0010068 */ lfs f0, 0x68(r1)
/* 00006DD8 FC21002A */ fadd f1, f1, f0
/* 00006DDC FC200818 */ frsp f1, f1
/* 00006DE0 4BFF93CD */ bl func_80071B1C
/* 00006DE4 38600000 */ li r3, 0
/* 00006DE8 4BFF93C5 */ bl set_text_mul_color
/* 00006DEC 8801008D */ lbz r0, 0x8d(r1)
/* 00006DF0 8861008C */ lbz r3, 0x8c(r1)
/* 00006DF4 5400402E */ slwi r0, r0, 8
/* 00006DF8 8881008E */ lbz r4, 0x8e(r1)
/* 00006DFC 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00006E00 7C830378 */ or r3, r4, r0
/* 00006E04 4BFF93A9 */ bl set_text_add_color
/* 00006E08 C85F0030 */ lfd f2, 0x30(r31)
/* 00006E0C C0210020 */ lfs f1, 0x20(r1)
/* 00006E10 C0010024 */ lfs f0, 0x24(r1)
/* 00006E14 FC22082A */ fadd f1, f2, f1
/* 00006E18 FC42002A */ fadd f2, f2, f0
/* 00006E1C FC200818 */ frsp f1, f1
/* 00006E20 FC401018 */ frsp f2, f2
/* 00006E24 4BFF9389 */ bl set_text_pos
/* 00006E28 7FA3EB78 */ mr r3, r29
/* 00006E2C 4BFF9381 */ bl sprite_puts
/* 00006E30 C0210068 */ lfs f1, 0x68(r1)
/* 00006E34 4BFF9379 */ bl func_80071B1C
/* 00006E38 88010029 */ lbz r0, 0x29(r1)
/* 00006E3C 88610028 */ lbz r3, 0x28(r1)
/* 00006E40 5400402E */ slwi r0, r0, 8
/* 00006E44 8881002A */ lbz r4, 0x2a(r1)
/* 00006E48 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00006E4C 7C830378 */ or r3, r4, r0
/* 00006E50 4BFF935D */ bl set_text_mul_color
/* 00006E54 8801008D */ lbz r0, 0x8d(r1)
/* 00006E58 8861008C */ lbz r3, 0x8c(r1)
/* 00006E5C 5400402E */ slwi r0, r0, 8
/* 00006E60 8881008E */ lbz r4, 0x8e(r1)
/* 00006E64 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00006E68 7C830378 */ or r3, r4, r0
/* 00006E6C 4BFF9341 */ bl set_text_add_color
/* 00006E70 C0210020 */ lfs f1, 0x20(r1)
/* 00006E74 C0410024 */ lfs f2, 0x24(r1)
/* 00006E78 4BFF9335 */ bl set_text_pos
/* 00006E7C 7FA3EB78 */ mr r3, r29
/* 00006E80 4BFF932D */ bl sprite_puts
/* 00006E84 C03F0148 */ lfs f1, 0x148(r31)
/* 00006E88 387E07D0 */ addi r3, r30, 0x7d0
/* 00006E8C C05F009C */ lfs f2, 0x9c(r31)
/* 00006E90 4BFFD42D */ bl lbl_000042BC
/* 00006E94 3B200000 */ li r25, 0
/* 00006E98 5720103A */ slwi r0, r25, 2
/* 00006E9C 7F5E0214 */ add r26, r30, r0
/* 00006EA0 3F604330 */ lis r27, 0x4330
/* 00006EA4 3B5A089C */ addi r26, r26, 0x89c
lbl_00006EA8:
/* 00006EA8 6F208000 */ xoris r0, r25, 0x8000
/* 00006EAC C01F014C */ lfs f0, 0x14c(r31)
/* 00006EB0 900100DC */ stw r0, 0xdc(r1)
/* 00006EB4 3C600000 */ lis r3, lbl_0000C380@ha
/* 00006EB8 2C190000 */ cmpwi r25, 0
/* 00006EBC D0010020 */ stfs f0, 0x20(r1)
/* 00006EC0 936100D8 */ stw r27, 0xd8(r1)
/* 00006EC4 C8230000 */ lfd f1, lbl_0000C380@l(r3)
/* 00006EC8 C80100D8 */ lfd f0, 0xd8(r1)
/* 00006ECC C85F0080 */ lfd f2, 0x80(r31)
/* 00006ED0 FC000828 */ fsub f0, f0, f1
/* 00006ED4 C83F0150 */ lfd f1, 0x150(r31)
/* 00006ED8 FC020032 */ fmul f0, f2, f0
/* 00006EDC FC01002A */ fadd f0, f1, f0
/* 00006EE0 FC000018 */ frsp f0, f0
/* 00006EE4 D0010024 */ stfs f0, 0x24(r1)
/* 00006EE8 40820030 */ bne lbl_00006F18
/* 00006EEC 4BFF92C1 */ bl are_all_continues_unlocked
/* 00006EF0 2C030000 */ cmpwi r3, 0
/* 00006EF4 41820014 */ beq lbl_00006F08
/* 00006EF8 387D0000 */ addi r3, r29, 0
/* 00006EFC 389E08C4 */ addi r4, r30, 0x8c4
/* 00006F00 4BFF92AD */ bl strcpy
/* 00006F04 480000AC */ b lbl_00006FB0
lbl_00006F08:
/* 00006F08 7FA3EB78 */ mr r3, r29
/* 00006F0C 809A0000 */ lwz r4, 0(r26)
/* 00006F10 4BFF929D */ bl strcpy
/* 00006F14 4800009C */ b lbl_00006FB0
lbl_00006F18:
/* 00006F18 2C190001 */ cmpwi r25, 1
/* 00006F1C 40820080 */ bne lbl_00006F9C
/* 00006F20 4BFF928D */ bl are_all_continues_unlocked
/* 00006F24 2C030000 */ cmpwi r3, 0
/* 00006F28 41820014 */ beq lbl_00006F3C
/* 00006F2C 387D0000 */ addi r3, r29, 0
/* 00006F30 389E08E0 */ addi r4, r30, 0x8e0
/* 00006F34 4BFF9279 */ bl strcpy
/* 00006F38 48000078 */ b lbl_00006FB0
lbl_00006F3C:
/* 00006F3C 38600006 */ li r3, 6
/* 00006F40 4BFF926D */ bl is_minigame_unlocked
/* 00006F44 2C030000 */ cmpwi r3, 0
/* 00006F48 4182003C */ beq lbl_00006F84
/* 00006F4C 38600007 */ li r3, 7
/* 00006F50 4BFF925D */ bl is_minigame_unlocked
/* 00006F54 2C030000 */ cmpwi r3, 0
/* 00006F58 4182002C */ beq lbl_00006F84
/* 00006F5C 38600008 */ li r3, 8
/* 00006F60 4BFF924D */ bl is_minigame_unlocked
/* 00006F64 2C030000 */ cmpwi r3, 0
/* 00006F68 4182001C */ beq lbl_00006F84
/* 00006F6C 387D0000 */ addi r3, r29, 0
/* 00006F70 389E08FC */ addi r4, r30, 0x8fc
/* 00006F74 4BFF9239 */ bl strcpy
/* 00006F78 C01F0158 */ lfs f0, 0x158(r31)
/* 00006F7C D001005C */ stfs f0, 0x5c(r1)
/* 00006F80 48000030 */ b lbl_00006FB0
lbl_00006F84:
/* 00006F84 7FA3EB78 */ mr r3, r29
/* 00006F88 809A0000 */ lwz r4, 0(r26)
/* 00006F8C 4BFF9221 */ bl strcpy
/* 00006F90 C01F015C */ lfs f0, 0x15c(r31)
/* 00006F94 D001005C */ stfs f0, 0x5c(r1)
/* 00006F98 48000018 */ b lbl_00006FB0
lbl_00006F9C:
/* 00006F9C 7FA3EB78 */ mr r3, r29
/* 00006FA0 809A0000 */ lwz r4, 0(r26)
/* 00006FA4 4BFF9209 */ bl strcpy
/* 00006FA8 C01F00A4 */ lfs f0, 0xa4(r31)
/* 00006FAC D001005C */ stfs f0, 0x5c(r1)
lbl_00006FB0:
/* 00006FB0 4BFF91FD */ bl reset_text_draw_settings
/* 00006FB4 8861001D */ lbz r3, 0x1d(r1)
/* 00006FB8 4BFF91F5 */ bl set_text_font
/* 00006FBC C021005C */ lfs f1, 0x5c(r1)
/* 00006FC0 C0410060 */ lfs f2, 0x60(r1)
/* 00006FC4 4BFF91E9 */ bl set_text_scale
/* 00006FC8 80610090 */ lwz r3, 0x90(r1)
/* 00006FCC 4BFF91E1 */ bl func_80071B50
/* 00006FD0 C83F0028 */ lfd f1, 0x28(r31)
/* 00006FD4 C0010068 */ lfs f0, 0x68(r1)
/* 00006FD8 FC21002A */ fadd f1, f1, f0
/* 00006FDC FC200818 */ frsp f1, f1
/* 00006FE0 4BFF91CD */ bl func_80071B1C
/* 00006FE4 38600000 */ li r3, 0
/* 00006FE8 4BFF91C5 */ bl set_text_mul_color
/* 00006FEC 8801008D */ lbz r0, 0x8d(r1)
/* 00006FF0 8861008C */ lbz r3, 0x8c(r1)
/* 00006FF4 5400402E */ slwi r0, r0, 8
/* 00006FF8 8881008E */ lbz r4, 0x8e(r1)
/* 00006FFC 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007000 7C830378 */ or r3, r4, r0
/* 00007004 4BFF91A9 */ bl set_text_add_color
/* 00007008 C85F0030 */ lfd f2, 0x30(r31)
/* 0000700C C0210020 */ lfs f1, 0x20(r1)
/* 00007010 C0010024 */ lfs f0, 0x24(r1)
/* 00007014 FC22082A */ fadd f1, f2, f1
/* 00007018 FC42002A */ fadd f2, f2, f0
/* 0000701C FC200818 */ frsp f1, f1
/* 00007020 FC401018 */ frsp f2, f2
/* 00007024 4BFF9189 */ bl set_text_pos
/* 00007028 7FA3EB78 */ mr r3, r29
/* 0000702C 4BFF9181 */ bl sprite_puts
/* 00007030 C0210068 */ lfs f1, 0x68(r1)
/* 00007034 4BFF9179 */ bl func_80071B1C
/* 00007038 88010029 */ lbz r0, 0x29(r1)
/* 0000703C 88610028 */ lbz r3, 0x28(r1)
/* 00007040 5400402E */ slwi r0, r0, 8
/* 00007044 8881002A */ lbz r4, 0x2a(r1)
/* 00007048 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000704C 7C830378 */ or r3, r4, r0
/* 00007050 4BFF915D */ bl set_text_mul_color
/* 00007054 8801008D */ lbz r0, 0x8d(r1)
/* 00007058 8861008C */ lbz r3, 0x8c(r1)
/* 0000705C 5400402E */ slwi r0, r0, 8
/* 00007060 8881008E */ lbz r4, 0x8e(r1)
/* 00007064 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007068 7C830378 */ or r3, r4, r0
/* 0000706C 4BFF9141 */ bl set_text_add_color
/* 00007070 C0210020 */ lfs f1, 0x20(r1)
/* 00007074 C0410024 */ lfs f2, 0x24(r1)
/* 00007078 4BFF9135 */ bl set_text_pos
/* 0000707C 7FA3EB78 */ mr r3, r29
/* 00007080 4BFF912D */ bl sprite_puts
/* 00007084 3B390001 */ addi r25, r25, 1
/* 00007088 28190006 */ cmplwi r25, 6
/* 0000708C 3B5A0004 */ addi r26, r26, 4
/* 00007090 4180FE18 */ blt lbl_00006EA8
/* 00007094 C01F0160 */ lfs f0, 0x160(r31)
/* 00007098 3C600000 */ lis r3, g_totalPlayPoints@ha
/* 0000709C 380000B0 */ li r0, 0xb0
/* 000070A0 4CC63182 */ crclr 6
/* 000070A4 D0010020 */ stfs f0, 0x20(r1)
/* 000070A8 3B630000 */ addi r27, r3, g_totalPlayPoints@l
/* 000070AC C01F0164 */ lfs f0, 0x164(r31)
/* 000070B0 387D0000 */ addi r3, r29, 0
/* 000070B4 389E0930 */ addi r4, r30, 0x930
/* 000070B8 D0010024 */ stfs f0, 0x24(r1)
/* 000070BC 9801001D */ stb r0, 0x1d(r1)
/* 000070C0 80BB0000 */ lwz r5, 0(r27)
/* 000070C4 4BFF90E9 */ bl sprintf
/* 000070C8 4BFF90E5 */ bl reset_text_draw_settings
/* 000070CC 8861001D */ lbz r3, 0x1d(r1)
/* 000070D0 4BFF90DD */ bl set_text_font
/* 000070D4 C021005C */ lfs f1, 0x5c(r1)
/* 000070D8 C0410060 */ lfs f2, 0x60(r1)
/* 000070DC 4BFF90D1 */ bl set_text_scale
/* 000070E0 80610090 */ lwz r3, 0x90(r1)
/* 000070E4 4BFF90C9 */ bl func_80071B50
/* 000070E8 C83F0028 */ lfd f1, 0x28(r31)
/* 000070EC C0010068 */ lfs f0, 0x68(r1)
/* 000070F0 FC21002A */ fadd f1, f1, f0
/* 000070F4 FC200818 */ frsp f1, f1
/* 000070F8 4BFF90B5 */ bl func_80071B1C
/* 000070FC 38600000 */ li r3, 0
/* 00007100 4BFF90AD */ bl set_text_mul_color
/* 00007104 8801008D */ lbz r0, 0x8d(r1)
/* 00007108 8861008C */ lbz r3, 0x8c(r1)
/* 0000710C 5400402E */ slwi r0, r0, 8
/* 00007110 8881008E */ lbz r4, 0x8e(r1)
/* 00007114 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007118 7C830378 */ or r3, r4, r0
/* 0000711C 4BFF9091 */ bl set_text_add_color
/* 00007120 C85F0030 */ lfd f2, 0x30(r31)
/* 00007124 C0210020 */ lfs f1, 0x20(r1)
/* 00007128 C0010024 */ lfs f0, 0x24(r1)
/* 0000712C FC22082A */ fadd f1, f2, f1
/* 00007130 FC42002A */ fadd f2, f2, f0
/* 00007134 FC200818 */ frsp f1, f1
/* 00007138 FC401018 */ frsp f2, f2
/* 0000713C 4BFF9071 */ bl set_text_pos
/* 00007140 7FA3EB78 */ mr r3, r29
/* 00007144 4BFF9069 */ bl sprite_puts
/* 00007148 C0210068 */ lfs f1, 0x68(r1)
/* 0000714C 4BFF9061 */ bl func_80071B1C
/* 00007150 88010029 */ lbz r0, 0x29(r1)
/* 00007154 88610028 */ lbz r3, 0x28(r1)
/* 00007158 5400402E */ slwi r0, r0, 8
/* 0000715C 8881002A */ lbz r4, 0x2a(r1)
/* 00007160 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007164 7C830378 */ or r3, r4, r0
/* 00007168 4BFF9045 */ bl set_text_mul_color
/* 0000716C 8801008D */ lbz r0, 0x8d(r1)
/* 00007170 8861008C */ lbz r3, 0x8c(r1)
/* 00007174 5400402E */ slwi r0, r0, 8
/* 00007178 8881008E */ lbz r4, 0x8e(r1)
/* 0000717C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007180 7C830378 */ or r3, r4, r0
/* 00007184 4BFF9029 */ bl set_text_add_color
/* 00007188 C0210020 */ lfs f1, 0x20(r1)
/* 0000718C C0410024 */ lfs f2, 0x24(r1)
/* 00007190 4BFF901D */ bl set_text_pos
/* 00007194 7FA3EB78 */ mr r3, r29
/* 00007198 4BFF9015 */ bl sprite_puts
/* 0000719C 4BFF9011 */ bl are_all_continues_unlocked
/* 000071A0 2C030000 */ cmpwi r3, 0
/* 000071A4 41820108 */ beq lbl_000072AC
/* 000071A8 C01F0160 */ lfs f0, 0x160(r31)
/* 000071AC 3C600000 */ lis r3, g_recordPlayPoints@ha
/* 000071B0 38A30000 */ addi r5, r3, g_recordPlayPoints@l
/* 000071B4 4CC63182 */ crclr 6
/* 000071B8 D0010020 */ stfs f0, 0x20(r1)
/* 000071BC 7FA3EB78 */ mr r3, r29
/* 000071C0 C01F0168 */ lfs f0, 0x168(r31)
/* 000071C4 389E0930 */ addi r4, r30, 0x930
/* 000071C8 D0010024 */ stfs f0, 0x24(r1)
/* 000071CC 80A50000 */ lwz r5, 0(r5)
/* 000071D0 4BFF8FDD */ bl sprintf
/* 000071D4 4BFF8FD9 */ bl reset_text_draw_settings
/* 000071D8 8861001D */ lbz r3, 0x1d(r1)
/* 000071DC 4BFF8FD1 */ bl set_text_font
/* 000071E0 C021005C */ lfs f1, 0x5c(r1)
/* 000071E4 C0410060 */ lfs f2, 0x60(r1)
/* 000071E8 4BFF8FC5 */ bl set_text_scale
/* 000071EC 80610090 */ lwz r3, 0x90(r1)
/* 000071F0 4BFF8FBD */ bl func_80071B50
/* 000071F4 C83F0028 */ lfd f1, 0x28(r31)
/* 000071F8 C0010068 */ lfs f0, 0x68(r1)
/* 000071FC FC21002A */ fadd f1, f1, f0
/* 00007200 FC200818 */ frsp f1, f1
/* 00007204 4BFF8FA9 */ bl func_80071B1C
/* 00007208 38600000 */ li r3, 0
/* 0000720C 4BFF8FA1 */ bl set_text_mul_color
/* 00007210 8801008D */ lbz r0, 0x8d(r1)
/* 00007214 8861008C */ lbz r3, 0x8c(r1)
/* 00007218 5400402E */ slwi r0, r0, 8
/* 0000721C 8881008E */ lbz r4, 0x8e(r1)
/* 00007220 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007224 7C830378 */ or r3, r4, r0
/* 00007228 4BFF8F85 */ bl set_text_add_color
/* 0000722C C85F0030 */ lfd f2, 0x30(r31)
/* 00007230 C0210020 */ lfs f1, 0x20(r1)
/* 00007234 C0010024 */ lfs f0, 0x24(r1)
/* 00007238 FC22082A */ fadd f1, f2, f1
/* 0000723C FC42002A */ fadd f2, f2, f0
/* 00007240 FC200818 */ frsp f1, f1
/* 00007244 FC401018 */ frsp f2, f2
/* 00007248 4BFF8F65 */ bl set_text_pos
/* 0000724C 7FA3EB78 */ mr r3, r29
/* 00007250 4BFF8F5D */ bl sprite_puts
/* 00007254 C0210068 */ lfs f1, 0x68(r1)
/* 00007258 4BFF8F55 */ bl func_80071B1C
/* 0000725C 88010029 */ lbz r0, 0x29(r1)
/* 00007260 88610028 */ lbz r3, 0x28(r1)
/* 00007264 5400402E */ slwi r0, r0, 8
/* 00007268 8881002A */ lbz r4, 0x2a(r1)
/* 0000726C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007270 7C830378 */ or r3, r4, r0
/* 00007274 4BFF8F39 */ bl set_text_mul_color
/* 00007278 8801008D */ lbz r0, 0x8d(r1)
/* 0000727C 8861008C */ lbz r3, 0x8c(r1)
/* 00007280 5400402E */ slwi r0, r0, 8
/* 00007284 8881008E */ lbz r4, 0x8e(r1)
/* 00007288 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000728C 7C830378 */ or r3, r4, r0
/* 00007290 4BFF8F1D */ bl set_text_add_color
/* 00007294 C0210020 */ lfs f1, 0x20(r1)
/* 00007298 C0410024 */ lfs f2, 0x24(r1)
/* 0000729C 4BFF8F11 */ bl set_text_pos
/* 000072A0 7FA3EB78 */ mr r3, r29
/* 000072A4 4BFF8F09 */ bl sprite_puts
/* 000072A8 48000118 */ b lbl_000073C0
lbl_000072AC:
/* 000072AC 807B0000 */ lwz r3, 0(r27)
/* 000072B0 28030000 */ cmplwi r3, 0
/* 000072B4 208309C4 */ subfic r4, r3, 0x9c4
/* 000072B8 40800008 */ bge lbl_000072C0
/* 000072BC 388009C4 */ li r4, 0x9c4
lbl_000072C0:
/* 000072C0 7C852379 */ or. r5, r4, r4
/* 000072C4 40800008 */ bge lbl_000072CC
/* 000072C8 38A00000 */ li r5, 0
lbl_000072CC:
/* 000072CC C01F0160 */ lfs f0, 0x160(r31)
/* 000072D0 387D0000 */ addi r3, r29, 0
/* 000072D4 4CC63182 */ crclr 6
/* 000072D8 389E0930 */ addi r4, r30, 0x930
/* 000072DC D0010020 */ stfs f0, 0x20(r1)
/* 000072E0 C01F0168 */ lfs f0, 0x168(r31)
/* 000072E4 D0010024 */ stfs f0, 0x24(r1)
/* 000072E8 4BFF8EC5 */ bl sprintf
/* 000072EC 4BFF8EC1 */ bl reset_text_draw_settings
/* 000072F0 8861001D */ lbz r3, 0x1d(r1)
/* 000072F4 4BFF8EB9 */ bl set_text_font
/* 000072F8 C021005C */ lfs f1, 0x5c(r1)
/* 000072FC C0410060 */ lfs f2, 0x60(r1)
/* 00007300 4BFF8EAD */ bl set_text_scale
/* 00007304 80610090 */ lwz r3, 0x90(r1)
/* 00007308 4BFF8EA5 */ bl func_80071B50
/* 0000730C C83F0028 */ lfd f1, 0x28(r31)
/* 00007310 C0010068 */ lfs f0, 0x68(r1)
/* 00007314 FC21002A */ fadd f1, f1, f0
/* 00007318 FC200818 */ frsp f1, f1
/* 0000731C 4BFF8E91 */ bl func_80071B1C
/* 00007320 38600000 */ li r3, 0
/* 00007324 4BFF8E89 */ bl set_text_mul_color
/* 00007328 8801008D */ lbz r0, 0x8d(r1)
/* 0000732C 8861008C */ lbz r3, 0x8c(r1)
/* 00007330 5400402E */ slwi r0, r0, 8
/* 00007334 8881008E */ lbz r4, 0x8e(r1)
/* 00007338 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000733C 7C830378 */ or r3, r4, r0
/* 00007340 4BFF8E6D */ bl set_text_add_color
/* 00007344 C85F0030 */ lfd f2, 0x30(r31)
/* 00007348 C0210020 */ lfs f1, 0x20(r1)
/* 0000734C C0010024 */ lfs f0, 0x24(r1)
/* 00007350 FC22082A */ fadd f1, f2, f1
/* 00007354 FC42002A */ fadd f2, f2, f0
/* 00007358 FC200818 */ frsp f1, f1
/* 0000735C FC401018 */ frsp f2, f2
/* 00007360 4BFF8E4D */ bl set_text_pos
/* 00007364 7FA3EB78 */ mr r3, r29
/* 00007368 4BFF8E45 */ bl sprite_puts
/* 0000736C C0210068 */ lfs f1, 0x68(r1)
/* 00007370 4BFF8E3D */ bl func_80071B1C
/* 00007374 88010029 */ lbz r0, 0x29(r1)
/* 00007378 88610028 */ lbz r3, 0x28(r1)
/* 0000737C 5400402E */ slwi r0, r0, 8
/* 00007380 8881002A */ lbz r4, 0x2a(r1)
/* 00007384 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007388 7C830378 */ or r3, r4, r0
/* 0000738C 4BFF8E21 */ bl set_text_mul_color
/* 00007390 8801008D */ lbz r0, 0x8d(r1)
/* 00007394 8861008C */ lbz r3, 0x8c(r1)
/* 00007398 5400402E */ slwi r0, r0, 8
/* 0000739C 8881008E */ lbz r4, 0x8e(r1)
/* 000073A0 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000073A4 7C830378 */ or r3, r4, r0
/* 000073A8 4BFF8E05 */ bl set_text_add_color
/* 000073AC C0210020 */ lfs f1, 0x20(r1)
/* 000073B0 C0410024 */ lfs f2, 0x24(r1)
/* 000073B4 4BFF8DF9 */ bl set_text_pos
/* 000073B8 7FA3EB78 */ mr r3, r29
/* 000073BC 4BFF8DF1 */ bl sprite_puts
lbl_000073C0:
/* 000073C0 C01F0160 */ lfs f0, 0x160(r31)
/* 000073C4 D0010020 */ stfs f0, 0x20(r1)
/* 000073C8 C01F016C */ lfs f0, 0x16c(r31)
/* 000073CC D0010024 */ stfs f0, 0x24(r1)
/* 000073D0 4BFF8DDD */ bl are_all_continues_unlocked
/* 000073D4 2C030000 */ cmpwi r3, 0
/* 000073D8 41820024 */ beq lbl_000073FC
/* 000073DC 387D0000 */ addi r3, r29, 0
/* 000073E0 389E0934 */ addi r4, r30, 0x934
/* 000073E4 4BFF8DC9 */ bl strcpy
/* 000073E8 C01F0170 */ lfs f0, 0x170(r31)
/* 000073EC 380000B3 */ li r0, 0xb3
/* 000073F0 D0010020 */ stfs f0, 0x20(r1)
/* 000073F4 9801001D */ stb r0, 0x1d(r1)
/* 000073F8 4800001C */ b lbl_00007414
lbl_000073FC:
/* 000073FC 4BFF8DB1 */ bl get_max_continues
/* 00007400 38A30000 */ addi r5, r3, 0
/* 00007404 4CC63182 */ crclr 6
/* 00007408 387D0000 */ addi r3, r29, 0
/* 0000740C 389E0930 */ addi r4, r30, 0x930
/* 00007410 4BFF8D9D */ bl sprintf
lbl_00007414:
/* 00007414 4BFF8D99 */ bl reset_text_draw_settings
/* 00007418 8861001D */ lbz r3, 0x1d(r1)
/* 0000741C 4BFF8D91 */ bl set_text_font
/* 00007420 C021005C */ lfs f1, 0x5c(r1)
/* 00007424 C0410060 */ lfs f2, 0x60(r1)
/* 00007428 4BFF8D85 */ bl set_text_scale
/* 0000742C 80610090 */ lwz r3, 0x90(r1)
/* 00007430 4BFF8D7D */ bl func_80071B50
/* 00007434 C83F0028 */ lfd f1, 0x28(r31)
/* 00007438 C0010068 */ lfs f0, 0x68(r1)
/* 0000743C FC21002A */ fadd f1, f1, f0
/* 00007440 FC200818 */ frsp f1, f1
/* 00007444 4BFF8D69 */ bl func_80071B1C
/* 00007448 38600000 */ li r3, 0
/* 0000744C 4BFF8D61 */ bl set_text_mul_color
/* 00007450 8801008D */ lbz r0, 0x8d(r1)
/* 00007454 8861008C */ lbz r3, 0x8c(r1)
/* 00007458 5400402E */ slwi r0, r0, 8
/* 0000745C 8881008E */ lbz r4, 0x8e(r1)
/* 00007460 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007464 7C830378 */ or r3, r4, r0
/* 00007468 4BFF8D45 */ bl set_text_add_color
/* 0000746C C85F0030 */ lfd f2, 0x30(r31)
/* 00007470 C0210020 */ lfs f1, 0x20(r1)
/* 00007474 C0010024 */ lfs f0, 0x24(r1)
/* 00007478 FC22082A */ fadd f1, f2, f1
/* 0000747C FC42002A */ fadd f2, f2, f0
/* 00007480 FC200818 */ frsp f1, f1
/* 00007484 FC401018 */ frsp f2, f2
/* 00007488 4BFF8D25 */ bl set_text_pos
/* 0000748C 7FA3EB78 */ mr r3, r29
/* 00007490 4BFF8D1D */ bl sprite_puts
/* 00007494 C0210068 */ lfs f1, 0x68(r1)
/* 00007498 4BFF8D15 */ bl func_80071B1C
/* 0000749C 88010029 */ lbz r0, 0x29(r1)
/* 000074A0 88610028 */ lbz r3, 0x28(r1)
/* 000074A4 5400402E */ slwi r0, r0, 8
/* 000074A8 8881002A */ lbz r4, 0x2a(r1)
/* 000074AC 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000074B0 7C830378 */ or r3, r4, r0
/* 000074B4 4BFF8CF9 */ bl set_text_mul_color
/* 000074B8 8801008D */ lbz r0, 0x8d(r1)
/* 000074BC 8861008C */ lbz r3, 0x8c(r1)
/* 000074C0 5400402E */ slwi r0, r0, 8
/* 000074C4 8881008E */ lbz r4, 0x8e(r1)
/* 000074C8 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000074CC 7C830378 */ or r3, r4, r0
/* 000074D0 4BFF8CDD */ bl set_text_add_color
/* 000074D4 C0210020 */ lfs f1, 0x20(r1)
/* 000074D8 C0410024 */ lfs f2, 0x24(r1)
/* 000074DC 4BFF8CD1 */ bl set_text_pos
/* 000074E0 7FA3EB78 */ mr r3, r29
/* 000074E4 4BFF8CC9 */ bl sprite_puts
/* 000074E8 3C600000 */ lis r3, lbl_10000000@ha
/* 000074EC 38630000 */ addi r3, r3, lbl_10000000@l
/* 000074F0 380000B3 */ li r0, 0xb3
/* 000074F4 3B630184 */ addi r27, r3, 0x184
/* 000074F8 9801001D */ stb r0, 0x1d(r1)
/* 000074FC 7F63DB78 */ mr r3, r27
/* 00007500 4BFF8CAD */ bl mathutil_mtxA_from_mtx
/* 00007504 C03F0174 */ lfs f1, 0x174(r31)
/* 00007508 C05F008C */ lfs f2, 0x8c(r31)
/* 0000750C C07F0000 */ lfs f3, 0(r31)
/* 00007510 4BFF8C9D */ bl mathutil_mtxA_translate_xyz
/* 00007514 C03F0178 */ lfs f1, 0x178(r31)
/* 00007518 4BFF8C95 */ bl mathutil_mtxA_scale_s
/* 0000751C 3C600000 */ lis r3, mathutilData@ha
/* 00007520 38630000 */ addi r3, r3, mathutilData@l
/* 00007524 80630000 */ lwz r3, 0(r3)
/* 00007528 38800000 */ li r4, 0
/* 0000752C 4BFF8C81 */ bl GXLoadPosMtxImm
/* 00007530 3B5E07C4 */ addi r26, r30, 0x7c4
/* 00007534 3AFE0634 */ addi r23, r30, 0x634
/* 00007538 3B1E0684 */ addi r24, r30, 0x684
/* 0000753C 3B800000 */ li r28, 0
/* 00007540 3F204330 */ lis r25, 0x4330
lbl_00007544:
/* 00007544 3AC0FFFF */ li r22, -1
/* 00007548 387C0006 */ addi r3, r28, 6
/* 0000754C 4BFF8C61 */ bl is_minigame_unlocked
/* 00007550 2C030000 */ cmpwi r3, 0
/* 00007554 40820008 */ bne lbl_0000755C
/* 00007558 3AC00000 */ li r22, 0
lbl_0000755C:
/* 0000755C 6F808000 */ xoris r0, r28, 0x8000
/* 00007560 C85F0180 */ lfd f2, 0x180(r31)
/* 00007564 900100DC */ stw r0, 0xdc(r1)
/* 00007568 3C800000 */ lis r4, lbl_0000C380@ha
/* 0000756C C8240000 */ lfd f1, lbl_0000C380@l(r4)
/* 00007570 7EE3BB78 */ mr r3, r23
/* 00007574 932100D8 */ stw r25, 0xd8(r1)
/* 00007578 C80100D8 */ lfd f0, 0xd8(r1)
/* 0000757C FC000828 */ fsub f0, f0, f1
/* 00007580 FC020032 */ fmul f0, f2, f0
/* 00007584 FFE00018 */ frsp f31, f0
/* 00007588 D3FE0638 */ stfs f31, 0x638(r30)
/* 0000758C C01F0000 */ lfs f0, 0(r31)
/* 00007590 D01E063C */ stfs f0, 0x63c(r30)
/* 00007594 92DE066C */ stw r22, 0x66c(r30)
/* 00007598 4BFF8C15 */ bl nlSprPut
/* 0000759C D3FE0688 */ stfs f31, 0x688(r30)
/* 000075A0 7F03C378 */ mr r3, r24
/* 000075A4 C01F0188 */ lfs f0, 0x188(r31)
/* 000075A8 D01E068C */ stfs f0, 0x68c(r30)
/* 000075AC 92DE06BC */ stw r22, 0x6bc(r30)
/* 000075B0 4BFF8BFD */ bl nlSprPut
/* 000075B4 807A0000 */ lwz r3, 0(r26)
/* 000075B8 D3E30004 */ stfs f31, 4(r3)
/* 000075BC C01F018C */ lfs f0, 0x18c(r31)
/* 000075C0 D0030008 */ stfs f0, 8(r3)
/* 000075C4 92C30038 */ stw r22, 0x38(r3)
/* 000075C8 4BFF8BE5 */ bl nlSprPut
/* 000075CC 3B9C0001 */ addi r28, r28, 1
/* 000075D0 2C1C0003 */ cmpwi r28, 3
/* 000075D4 3B5A0004 */ addi r26, r26, 4
/* 000075D8 4180FF6C */ blt lbl_00007544
/* 000075DC 7F63DB78 */ mr r3, r27
/* 000075E0 4BFF8BCD */ bl mathutil_mtxA_from_mtx
/* 000075E4 3C600000 */ lis r3, mathutilData@ha
/* 000075E8 3B830000 */ addi r28, r3, mathutilData@l
/* 000075EC 807C0000 */ lwz r3, 0(r28)
/* 000075F0 38800000 */ li r4, 0
/* 000075F4 4BFF8BB9 */ bl GXLoadPosMtxImm
/* 000075F8 387E00F0 */ addi r3, r30, 0xf0
/* 000075FC 4BFF8BB1 */ bl nlSprPut
/* 00007600 387D0000 */ addi r3, r29, 0
/* 00007604 389E0944 */ addi r4, r30, 0x944
/* 00007608 4BFF8BA5 */ bl strcpy
/* 0000760C 4BFF8BA1 */ bl reset_text_draw_settings
/* 00007610 8861001D */ lbz r3, 0x1d(r1)
/* 00007614 4BFF8B99 */ bl set_text_font
/* 00007618 C021005C */ lfs f1, 0x5c(r1)
/* 0000761C C0410060 */ lfs f2, 0x60(r1)
/* 00007620 4BFF8B8D */ bl set_text_scale
/* 00007624 80610090 */ lwz r3, 0x90(r1)
/* 00007628 4BFF8B85 */ bl func_80071B50
/* 0000762C C0210068 */ lfs f1, 0x68(r1)
/* 00007630 4BFF8B7D */ bl func_80071B1C
/* 00007634 88010029 */ lbz r0, 0x29(r1)
/* 00007638 88610028 */ lbz r3, 0x28(r1)
/* 0000763C 5400402E */ slwi r0, r0, 8
/* 00007640 8881002A */ lbz r4, 0x2a(r1)
/* 00007644 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007648 7C830378 */ or r3, r4, r0
/* 0000764C 4BFF8B61 */ bl set_text_mul_color
/* 00007650 8801008D */ lbz r0, 0x8d(r1)
/* 00007654 8861008C */ lbz r3, 0x8c(r1)
/* 00007658 5400402E */ slwi r0, r0, 8
/* 0000765C 8881008E */ lbz r4, 0x8e(r1)
/* 00007660 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007664 7C830378 */ or r3, r4, r0
/* 00007668 4BFF8B45 */ bl set_text_add_color
/* 0000766C 7FA3EB78 */ mr r3, r29
/* 00007670 4BFF8B3D */ bl u_get_text_width
/* 00007674 C81F0058 */ lfd f0, 0x58(r31)
/* 00007678 C85F00A8 */ lfd f2, 0xa8(r31)
/* 0000767C FC000072 */ fmul f0, f0, f1
/* 00007680 FC020028 */ fsub f0, f2, f0
/* 00007684 FC000018 */ frsp f0, f0
/* 00007688 D0010020 */ stfs f0, 0x20(r1)
/* 0000768C C01F0190 */ lfs f0, 0x190(r31)
/* 00007690 D0010024 */ stfs f0, 0x24(r1)
/* 00007694 4BFF8B19 */ bl reset_text_draw_settings
/* 00007698 8861001D */ lbz r3, 0x1d(r1)
/* 0000769C 4BFF8B11 */ bl set_text_font
/* 000076A0 C021005C */ lfs f1, 0x5c(r1)
/* 000076A4 C0410060 */ lfs f2, 0x60(r1)
/* 000076A8 4BFF8B05 */ bl set_text_scale
/* 000076AC 80610090 */ lwz r3, 0x90(r1)
/* 000076B0 4BFF8AFD */ bl func_80071B50
/* 000076B4 C83F0028 */ lfd f1, 0x28(r31)
/* 000076B8 C0010068 */ lfs f0, 0x68(r1)
/* 000076BC FC21002A */ fadd f1, f1, f0
/* 000076C0 FC200818 */ frsp f1, f1
/* 000076C4 4BFF8AE9 */ bl func_80071B1C
/* 000076C8 38600000 */ li r3, 0
/* 000076CC 4BFF8AE1 */ bl set_text_mul_color
/* 000076D0 8801008D */ lbz r0, 0x8d(r1)
/* 000076D4 8861008C */ lbz r3, 0x8c(r1)
/* 000076D8 5400402E */ slwi r0, r0, 8
/* 000076DC 8881008E */ lbz r4, 0x8e(r1)
/* 000076E0 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000076E4 7C830378 */ or r3, r4, r0
/* 000076E8 4BFF8AC5 */ bl set_text_add_color
/* 000076EC C85F0030 */ lfd f2, 0x30(r31)
/* 000076F0 C0210020 */ lfs f1, 0x20(r1)
/* 000076F4 C0010024 */ lfs f0, 0x24(r1)
/* 000076F8 FC22082A */ fadd f1, f2, f1
/* 000076FC FC42002A */ fadd f2, f2, f0
/* 00007700 FC200818 */ frsp f1, f1
/* 00007704 FC401018 */ frsp f2, f2
/* 00007708 4BFF8AA5 */ bl set_text_pos
/* 0000770C 7FA3EB78 */ mr r3, r29
/* 00007710 4BFF8A9D */ bl sprite_puts
/* 00007714 C0210068 */ lfs f1, 0x68(r1)
/* 00007718 4BFF8A95 */ bl func_80071B1C
/* 0000771C 88010029 */ lbz r0, 0x29(r1)
/* 00007720 88610028 */ lbz r3, 0x28(r1)
/* 00007724 5400402E */ slwi r0, r0, 8
/* 00007728 8881002A */ lbz r4, 0x2a(r1)
/* 0000772C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007730 7C830378 */ or r3, r4, r0
/* 00007734 4BFF8A79 */ bl set_text_mul_color
/* 00007738 8801008D */ lbz r0, 0x8d(r1)
/* 0000773C 8861008C */ lbz r3, 0x8c(r1)
/* 00007740 5400402E */ slwi r0, r0, 8
/* 00007744 8881008E */ lbz r4, 0x8e(r1)
/* 00007748 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000774C 7C830378 */ or r3, r4, r0
/* 00007750 4BFF8A5D */ bl set_text_add_color
/* 00007754 C0210020 */ lfs f1, 0x20(r1)
/* 00007758 C0410024 */ lfs f2, 0x24(r1)
/* 0000775C 4BFF8A51 */ bl set_text_pos
/* 00007760 7FA3EB78 */ mr r3, r29
/* 00007764 4BFF8A49 */ bl sprite_puts
/* 00007768 4BFF8A45 */ bl mathutil_mtxA_from_identity
/* 0000776C 807C0000 */ lwz r3, 0(r28)
/* 00007770 38800000 */ li r4, 0
/* 00007774 4BFF8A39 */ bl GXLoadPosMtxImm
/* 00007778 BAC100E0 */ lmw r22, 0xe0(r1)
/* 0000777C 80010114 */ lwz r0, 0x114(r1)
/* 00007780 CBE10108 */ lfd f31, 0x108(r1)
/* 00007784 38210110 */ addi r1, r1, 0x110
/* 00007788 7C0803A6 */ mtlr r0
/* 0000778C 4E800020 */ blr 
