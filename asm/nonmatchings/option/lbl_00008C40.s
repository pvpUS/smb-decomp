/* 00008C40 7C0802A6 */ mflr r0
/* 00008C44 7C651B78 */ mr r5, r3
/* 00008C48 90010004 */ stw r0, 4(r1)
/* 00008C4C 3C800000 */ lis r4, lbl_0000C8F0@ha
/* 00008C50 9421FEE0 */ stwu r1, -0x120(r1)
/* 00008C54 BE0100E0 */ stmw r16, 0xe0(r1)
/* 00008C58 3BC40000 */ addi r30, r4, lbl_0000C8F0@l
/* 00008C5C 3C800000 */ lis r4, lbl_0000C370@ha
/* 00008C60 3BE40000 */ addi r31, r4, lbl_0000C370@l
/* 00008C64 8863000F */ lbz r3, 0xf(r3)
/* 00008C68 8365002C */ lwz r27, 0x2c(r5)
/* 00008C6C 7C630774 */ extsb r3, r3
/* 00008C70 4BFFB2FD */ bl lbl_00003F6C
/* 00008C74 28030000 */ cmplwi r3, 0
/* 00008C78 41820040 */ beq lbl_00008CB8
/* 00008C7C C05F0000 */ lfs f2, 0(r31)
/* 00008C80 C0230004 */ lfs f1, 4(r3)
/* 00008C84 C0030008 */ lfs f0, 8(r3)
/* 00008C88 FC601090 */ fmr f3, f2
/* 00008C8C EC21002A */ fadds f1, f1, f0
/* 00008C90 4BFF751D */ bl mathutil_mtxA_from_translate_xyz
/* 00008C94 3C600000 */ lis r3, lbl_10000000@ha
/* 00008C98 38630000 */ addi r3, r3, lbl_10000000@l
/* 00008C9C 38630184 */ addi r3, r3, 0x184
/* 00008CA0 4BFF750D */ bl mathutil_mtxA_to_mtx
/* 00008CA4 3C600000 */ lis r3, mathutilData@ha
/* 00008CA8 38630000 */ addi r3, r3, mathutilData@l
/* 00008CAC 80630000 */ lwz r3, 0(r3)
/* 00008CB0 38800000 */ li r4, 0
/* 00008CB4 4BFF74F9 */ bl GXLoadPosMtxImm
lbl_00008CB8:
/* 00008CB8 7FC3F378 */ mr r3, r30
/* 00008CBC 4BFF74F1 */ bl nlSprPut
/* 00008CC0 C01F0088 */ lfs f0, 0x88(r31)
/* 00008CC4 3BA100A0 */ addi r29, r1, 0xa0
/* 00008CC8 388000B3 */ li r4, 0xb3
/* 00008CCC D0010060 */ stfs f0, 0x60(r1)
/* 00008CD0 3A000000 */ li r16, 0
/* 00008CD4 3C000020 */ lis r0, 0x20
/* 00008CD8 C01F0060 */ lfs f0, 0x60(r31)
/* 00008CDC 7FA3EB78 */ mr r3, r29
/* 00008CE0 D0010054 */ stfs f0, 0x54(r1)
/* 00008CE4 C01F0060 */ lfs f0, 0x60(r31)
/* 00008CE8 D0010058 */ stfs f0, 0x58(r1)
/* 00008CEC 98810015 */ stb r4, 0x15(r1)
/* 00008CF0 389E104C */ addi r4, r30, 0x104c
/* 00008CF4 9A010084 */ stb r16, 0x84(r1)
/* 00008CF8 9A010085 */ stb r16, 0x85(r1)
/* 00008CFC 9A010086 */ stb r16, 0x86(r1)
/* 00008D00 90010088 */ stw r0, 0x88(r1)
/* 00008D04 4BFF74A9 */ bl strcpy
/* 00008D08 4BFF74A5 */ bl reset_text_draw_settings
/* 00008D0C 88610015 */ lbz r3, 0x15(r1)
/* 00008D10 4BFF749D */ bl set_text_font
/* 00008D14 C0210054 */ lfs f1, 0x54(r1)
/* 00008D18 C0410058 */ lfs f2, 0x58(r1)
/* 00008D1C 4BFF7491 */ bl set_text_scale
/* 00008D20 80610088 */ lwz r3, 0x88(r1)
/* 00008D24 4BFF7489 */ bl func_80071B50
/* 00008D28 C0210060 */ lfs f1, 0x60(r1)
/* 00008D2C 4BFF7481 */ bl func_80071B1C
/* 00008D30 88010021 */ lbz r0, 0x21(r1)
/* 00008D34 88610020 */ lbz r3, 0x20(r1)
/* 00008D38 5400402E */ slwi r0, r0, 8
/* 00008D3C 88810022 */ lbz r4, 0x22(r1)
/* 00008D40 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00008D44 7C830378 */ or r3, r4, r0
/* 00008D48 4BFF7465 */ bl set_text_mul_color
/* 00008D4C 88010085 */ lbz r0, 0x85(r1)
/* 00008D50 88610084 */ lbz r3, 0x84(r1)
/* 00008D54 5400402E */ slwi r0, r0, 8
/* 00008D58 88810086 */ lbz r4, 0x86(r1)
/* 00008D5C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00008D60 7C830378 */ or r3, r4, r0
/* 00008D64 4BFF7449 */ bl set_text_add_color
/* 00008D68 7FA3EB78 */ mr r3, r29
/* 00008D6C 4BFF7441 */ bl u_get_text_width
/* 00008D70 C81F0058 */ lfd f0, 0x58(r31)
/* 00008D74 380000FF */ li r0, 0xff
/* 00008D78 C85F00A8 */ lfd f2, 0xa8(r31)
/* 00008D7C FC000072 */ fmul f0, f0, f1
/* 00008D80 FC020028 */ fsub f0, f2, f0
/* 00008D84 FC000018 */ frsp f0, f0
/* 00008D88 D0010018 */ stfs f0, 0x18(r1)
/* 00008D8C C01F0090 */ lfs f0, 0x90(r31)
/* 00008D90 D001001C */ stfs f0, 0x1c(r1)
/* 00008D94 98010020 */ stb r0, 0x20(r1)
/* 00008D98 98010021 */ stb r0, 0x21(r1)
/* 00008D9C 9A010022 */ stb r16, 0x22(r1)
/* 00008DA0 4BFF740D */ bl reset_text_draw_settings
/* 00008DA4 88610015 */ lbz r3, 0x15(r1)
/* 00008DA8 4BFF7405 */ bl set_text_font
/* 00008DAC C0210054 */ lfs f1, 0x54(r1)
/* 00008DB0 C0410058 */ lfs f2, 0x58(r1)
/* 00008DB4 4BFF73F9 */ bl set_text_scale
/* 00008DB8 80610088 */ lwz r3, 0x88(r1)
/* 00008DBC 4BFF73F1 */ bl func_80071B50
/* 00008DC0 C83F0028 */ lfd f1, 0x28(r31)
/* 00008DC4 C0010060 */ lfs f0, 0x60(r1)
/* 00008DC8 FC21002A */ fadd f1, f1, f0
/* 00008DCC FC200818 */ frsp f1, f1
/* 00008DD0 4BFF73DD */ bl func_80071B1C
/* 00008DD4 38600000 */ li r3, 0
/* 00008DD8 4BFF73D5 */ bl set_text_mul_color
/* 00008DDC 88010085 */ lbz r0, 0x85(r1)
/* 00008DE0 88610084 */ lbz r3, 0x84(r1)
/* 00008DE4 5400402E */ slwi r0, r0, 8
/* 00008DE8 88810086 */ lbz r4, 0x86(r1)
/* 00008DEC 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00008DF0 7C830378 */ or r3, r4, r0
/* 00008DF4 4BFF73B9 */ bl set_text_add_color
/* 00008DF8 C85F0030 */ lfd f2, 0x30(r31)
/* 00008DFC C0210018 */ lfs f1, 0x18(r1)
/* 00008E00 C001001C */ lfs f0, 0x1c(r1)
/* 00008E04 FC22082A */ fadd f1, f2, f1
/* 00008E08 FC42002A */ fadd f2, f2, f0
/* 00008E0C FC200818 */ frsp f1, f1
/* 00008E10 FC401018 */ frsp f2, f2
/* 00008E14 4BFF7399 */ bl set_text_pos
/* 00008E18 7FA3EB78 */ mr r3, r29
/* 00008E1C 4BFF7391 */ bl sprite_puts
/* 00008E20 C0210060 */ lfs f1, 0x60(r1)
/* 00008E24 4BFF7389 */ bl func_80071B1C
/* 00008E28 88010021 */ lbz r0, 0x21(r1)
/* 00008E2C 88610020 */ lbz r3, 0x20(r1)
/* 00008E30 5400402E */ slwi r0, r0, 8
/* 00008E34 88810022 */ lbz r4, 0x22(r1)
/* 00008E38 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00008E3C 7C830378 */ or r3, r4, r0
/* 00008E40 4BFF736D */ bl set_text_mul_color
/* 00008E44 88010085 */ lbz r0, 0x85(r1)
/* 00008E48 88610084 */ lbz r3, 0x84(r1)
/* 00008E4C 5400402E */ slwi r0, r0, 8
/* 00008E50 88810086 */ lbz r4, 0x86(r1)
/* 00008E54 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00008E58 7C830378 */ or r3, r4, r0
/* 00008E5C 4BFF7351 */ bl set_text_add_color
/* 00008E60 C0210018 */ lfs f1, 0x18(r1)
/* 00008E64 C041001C */ lfs f2, 0x1c(r1)
/* 00008E68 4BFF7345 */ bl set_text_pos
/* 00008E6C 7FA3EB78 */ mr r3, r29
/* 00008E70 4BFF733D */ bl sprite_puts
/* 00008E74 3B400000 */ li r26, 0
/* 00008E78 3C600000 */ lis r3, lbl_10000000@ha
/* 00008E7C 38630000 */ addi r3, r3, lbl_10000000@l
/* 00008E80 5740103A */ slwi r0, r26, 2
/* 00008E84 3C800000 */ lis r4, mathutilData@ha
/* 00008E88 3EE0FF90 */ lis r23, 0xff90
/* 00008E8C 7E630214 */ add r19, r3, r0
/* 00008E90 3A230184 */ addi r17, r3, 0x184
/* 00008E94 3C600000 */ lis r3, globalAnimTimer@ha
/* 00008E98 3A5E0E94 */ addi r18, r30, 0xe94
/* 00008E9C 3AA40000 */ addi r21, r4, mathutilData@l
/* 00008EA0 3B9E0634 */ addi r28, r30, 0x634
/* 00008EA4 3AD78F8F */ addi r22, r23, -28785
/* 00008EA8 3A030000 */ addi r16, r3, globalAnimTimer@l
/* 00008EAC 3E804330 */ lis r20, 0x4330
lbl_00008EB0:
/* 00008EB0 7E238B78 */ mr r3, r17
/* 00008EB4 4BFF72F9 */ bl mathutil_mtxA_from_mtx
/* 00008EB8 381AFFFF */ addi r0, r26, -1
/* 00008EBC C83F01E0 */ lfd f1, 0x1e0(r31)
/* 00008EC0 6C008000 */ xoris r0, r0, 0x8000
/* 00008EC4 C013002C */ lfs f0, 0x2c(r19)
/* 00008EC8 900100DC */ stw r0, 0xdc(r1)
/* 00008ECC 3C600000 */ lis r3, lbl_0000C380@ha
/* 00008ED0 FC41002A */ fadd f2, f1, f0
/* 00008ED4 C8A30000 */ lfd f5, lbl_0000C380@l(r3)
/* 00008ED8 928100D8 */ stw r20, 0xd8(r1)
/* 00008EDC C8DF01D8 */ lfd f6, 0x1d8(r31)
/* 00008EE0 C88100D8 */ lfd f4, 0xd8(r1)
/* 00008EE4 C8FF00A8 */ lfd f7, 0xa8(r31)
/* 00008EE8 FC401018 */ frsp f2, f2
/* 00008EEC FC042828 */ fsub f0, f4, f5
/* 00008EF0 C07F0000 */ lfs f3, 0(r31)
/* 00008EF4 FC060032 */ fmul f0, f6, f0
/* 00008EF8 FC27002A */ fadd f1, f7, f0
/* 00008EFC FC200818 */ frsp f1, f1
/* 00008F00 4BFF72AD */ bl mathutil_mtxA_translate_xyz
/* 00008F04 C0330020 */ lfs f1, 0x20(r19)
/* 00008F08 4BFF72A5 */ bl mathutil_mtxA_scale_s
/* 00008F0C 80750000 */ lwz r3, 0(r21)
/* 00008F10 38800000 */ li r4, 0
/* 00008F14 4BFF7299 */ bl GXLoadPosMtxImm
/* 00008F18 C01F0000 */ lfs f0, 0(r31)
/* 00008F1C D01E0638 */ stfs f0, 0x638(r30)
/* 00008F20 C01F0000 */ lfs f0, 0(r31)
/* 00008F24 D01E063C */ stfs f0, 0x63c(r30)
/* 00008F28 801B0014 */ lwz r0, 0x14(r27)
/* 00008F2C 7C1A0000 */ cmpw r26, r0
/* 00008F30 40820010 */ bne lbl_00008F40
/* 00008F34 3800FFFF */ li r0, -1
/* 00008F38 901C0038 */ stw r0, 0x38(r28)
/* 00008F3C 48000008 */ b lbl_00008F44
lbl_00008F40:
/* 00008F40 92DC0038 */ stw r22, 0x38(r28)
lbl_00008F44:
/* 00008F44 7F83E378 */ mr r3, r28
/* 00008F48 4BFF7265 */ bl nlSprPut
/* 00008F4C 801B0014 */ lwz r0, 0x14(r27)
/* 00008F50 7C1A0000 */ cmpw r26, r0
/* 00008F54 40820038 */ bne lbl_00008F8C
/* 00008F58 80100000 */ lwz r0, 0(r16)
/* 00008F5C 3B20FFFF */ li r25, -1
/* 00008F60 5403482C */ slwi r3, r0, 9
/* 00008F64 4BFF7249 */ bl mathutil_sin
/* 00008F68 FC200A10 */ fabs f1, f1
/* 00008F6C C81F01E8 */ lfd f0, 0x1e8(r31)
/* 00008F70 FC200072 */ fmul f1, f0, f1
/* 00008F74 4BFF7239 */ bl __cvt_fp2unsigned
/* 00008F78 5464801E */ slwi r4, r3, 0x10
/* 00008F7C 5460402E */ slwi r0, r3, 8
/* 00008F80 7C800378 */ or r0, r4, r0
/* 00008F84 7C780378 */ or r24, r3, r0
/* 00008F88 4800000C */ b lbl_00008F94
lbl_00008F8C:
/* 00008F8C 3B378F8F */ addi r25, r23, -28785
/* 00008F90 3B000000 */ li r24, 0
lbl_00008F94:
/* 00008F94 80720000 */ lwz r3, 0(r18)
/* 00008F98 C01F0000 */ lfs f0, 0(r31)
/* 00008F9C D0030004 */ stfs f0, 4(r3)
/* 00008FA0 C01F0188 */ lfs f0, 0x188(r31)
/* 00008FA4 D0030008 */ stfs f0, 8(r3)
/* 00008FA8 93230038 */ stw r25, 0x38(r3)
/* 00008FAC 9303003C */ stw r24, 0x3c(r3)
/* 00008FB0 4BFF71FD */ bl nlSprPut
/* 00008FB4 2C1A0000 */ cmpwi r26, 0
/* 00008FB8 4082000C */ bne lbl_00008FC4
/* 00008FBC 387E0EF0 */ addi r3, r30, 0xef0
/* 00008FC0 48000008 */ b lbl_00008FC8
lbl_00008FC4:
/* 00008FC4 387E0EA0 */ addi r3, r30, 0xea0
lbl_00008FC8:
/* 00008FC8 C01F0000 */ lfs f0, 0(r31)
/* 00008FCC D0030004 */ stfs f0, 4(r3)
/* 00008FD0 C01F018C */ lfs f0, 0x18c(r31)
/* 00008FD4 D0030008 */ stfs f0, 8(r3)
/* 00008FD8 93230038 */ stw r25, 0x38(r3)
/* 00008FDC 9303003C */ stw r24, 0x3c(r3)
/* 00008FE0 4BFF71CD */ bl nlSprPut
/* 00008FE4 3B5A0001 */ addi r26, r26, 1
/* 00008FE8 2C1A0003 */ cmpwi r26, 3
/* 00008FEC 3A730004 */ addi r19, r19, 4
/* 00008FF0 3A520004 */ addi r18, r18, 4
/* 00008FF4 4180FEBC */ blt lbl_00008EB0
/* 00008FF8 7E238B78 */ mr r3, r17
/* 00008FFC 4BFF71B1 */ bl mathutil_mtxA_from_mtx
/* 00009000 3C600000 */ lis r3, mathutilData@ha
/* 00009004 38630000 */ addi r3, r3, mathutilData@l
/* 00009008 80630000 */ lwz r3, 0(r3)
/* 0000900C 38800000 */ li r4, 0
/* 00009010 4BFF719D */ bl GXLoadPosMtxImm
/* 00009014 387E00F0 */ addi r3, r30, 0xf0
/* 00009018 4BFF7195 */ bl nlSprPut
/* 0000901C 380000FF */ li r0, 0xff
/* 00009020 98010020 */ stb r0, 0x20(r1)
/* 00009024 3A400000 */ li r18, 0
/* 00009028 56511838 */ slwi r17, r18, 3
/* 0000902C 98010021 */ stb r0, 0x21(r1)
/* 00009030 3E004330 */ lis r16, 0x4330
/* 00009034 9A410022 */ stb r18, 0x22(r1)
/* 00009038 C01F00A4 */ lfs f0, 0xa4(r31)
/* 0000903C D0010054 */ stfs f0, 0x54(r1)
/* 00009040 801B0014 */ lwz r0, 0x14(r27)
/* 00009044 54001838 */ slwi r0, r0, 3
/* 00009048 7E7E0214 */ add r19, r30, r0
/* 0000904C 3A731034 */ addi r19, r19, 0x1034
/* 00009050 480001D4 */ b lbl_00009224
lbl_00009054:
/* 00009054 80930000 */ lwz r4, 0(r19)
/* 00009058 7FA3EB78 */ mr r3, r29
/* 0000905C 7C84882E */ lwzx r4, r4, r17
/* 00009060 4BFF714D */ bl strcpy
/* 00009064 4BFF7149 */ bl reset_text_draw_settings
/* 00009068 88610015 */ lbz r3, 0x15(r1)
/* 0000906C 4BFF7141 */ bl set_text_font
/* 00009070 C0210054 */ lfs f1, 0x54(r1)
/* 00009074 C0410058 */ lfs f2, 0x58(r1)
/* 00009078 4BFF7135 */ bl set_text_scale
/* 0000907C 80610088 */ lwz r3, 0x88(r1)
/* 00009080 4BFF712D */ bl func_80071B50
/* 00009084 C0210060 */ lfs f1, 0x60(r1)
/* 00009088 4BFF7125 */ bl func_80071B1C
/* 0000908C 88010021 */ lbz r0, 0x21(r1)
/* 00009090 88610020 */ lbz r3, 0x20(r1)
/* 00009094 5400402E */ slwi r0, r0, 8
/* 00009098 88810022 */ lbz r4, 0x22(r1)
/* 0000909C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000090A0 7C830378 */ or r3, r4, r0
/* 000090A4 4BFF7109 */ bl set_text_mul_color
/* 000090A8 88010085 */ lbz r0, 0x85(r1)
/* 000090AC 88610084 */ lbz r3, 0x84(r1)
/* 000090B0 5400402E */ slwi r0, r0, 8
/* 000090B4 88810086 */ lbz r4, 0x86(r1)
/* 000090B8 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000090BC 7C830378 */ or r3, r4, r0
/* 000090C0 4BFF70ED */ bl set_text_add_color
/* 000090C4 7FA3EB78 */ mr r3, r29
/* 000090C8 4BFF70E5 */ bl u_get_text_width
/* 000090CC C81F0058 */ lfd f0, 0x58(r31)
/* 000090D0 6E408000 */ xoris r0, r18, 0x8000
/* 000090D4 900100D4 */ stw r0, 0xd4(r1)
/* 000090D8 3C600000 */ lis r3, lbl_0000C380@ha
/* 000090DC FC000072 */ fmul f0, f0, f1
/* 000090E0 C83F00A8 */ lfd f1, 0xa8(r31)
/* 000090E4 3C800000 */ lis r4, lbl_0000C380@ha
/* 000090E8 920100D0 */ stw r16, 0xd0(r1)
/* 000090EC FC210028 */ fsub f1, f1, f0
/* 000090F0 C80100D0 */ lfd f0, 0xd0(r1)
/* 000090F4 FC200818 */ frsp f1, f1
/* 000090F8 D0210018 */ stfs f1, 0x18(r1)
/* 000090FC 80B30004 */ lwz r5, 4(r19)
/* 00009100 C8230000 */ lfd f1, lbl_0000C380@l(r3)
/* 00009104 3805FFFF */ addi r0, r5, -1
/* 00009108 C8440000 */ lfd f2, lbl_0000C380@l(r4)
/* 0000910C 6C008000 */ xoris r0, r0, 0x8000
/* 00009110 FC000828 */ fsub f0, f0, f1
/* 00009114 900100DC */ stw r0, 0xdc(r1)
/* 00009118 C83F0080 */ lfd f1, 0x80(r31)
/* 0000911C 920100D8 */ stw r16, 0xd8(r1)
/* 00009120 FC010032 */ fmul f0, f1, f0
/* 00009124 C87F00B8 */ lfd f3, 0xb8(r31)
/* 00009128 C82100D8 */ lfd f1, 0xd8(r1)
/* 0000912C C89F00B0 */ lfd f4, 0xb0(r31)
/* 00009130 FC211028 */ fsub f1, f1, f2
/* 00009134 FC230072 */ fmul f1, f3, f1
/* 00009138 FC240828 */ fsub f1, f4, f1
/* 0000913C FC01002A */ fadd f0, f1, f0
/* 00009140 FC000018 */ frsp f0, f0
/* 00009144 D001001C */ stfs f0, 0x1c(r1)
/* 00009148 4BFF7065 */ bl reset_text_draw_settings
/* 0000914C 88610015 */ lbz r3, 0x15(r1)
/* 00009150 4BFF705D */ bl set_text_font
/* 00009154 C0210054 */ lfs f1, 0x54(r1)
/* 00009158 C0410058 */ lfs f2, 0x58(r1)
/* 0000915C 4BFF7051 */ bl set_text_scale
/* 00009160 80610088 */ lwz r3, 0x88(r1)
/* 00009164 4BFF7049 */ bl func_80071B50
/* 00009168 C83F0028 */ lfd f1, 0x28(r31)
/* 0000916C C0010060 */ lfs f0, 0x60(r1)
/* 00009170 FC21002A */ fadd f1, f1, f0
/* 00009174 FC200818 */ frsp f1, f1
/* 00009178 4BFF7035 */ bl func_80071B1C
/* 0000917C 38600000 */ li r3, 0
/* 00009180 4BFF702D */ bl set_text_mul_color
/* 00009184 88010085 */ lbz r0, 0x85(r1)
/* 00009188 88610084 */ lbz r3, 0x84(r1)
/* 0000918C 5400402E */ slwi r0, r0, 8
/* 00009190 88810086 */ lbz r4, 0x86(r1)
/* 00009194 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00009198 7C830378 */ or r3, r4, r0
/* 0000919C 4BFF7011 */ bl set_text_add_color
/* 000091A0 C85F0030 */ lfd f2, 0x30(r31)
/* 000091A4 C0210018 */ lfs f1, 0x18(r1)
/* 000091A8 C001001C */ lfs f0, 0x1c(r1)
/* 000091AC FC22082A */ fadd f1, f2, f1
/* 000091B0 FC42002A */ fadd f2, f2, f0
/* 000091B4 FC200818 */ frsp f1, f1
/* 000091B8 FC401018 */ frsp f2, f2
/* 000091BC 4BFF6FF1 */ bl set_text_pos
/* 000091C0 7FA3EB78 */ mr r3, r29
/* 000091C4 4BFF6FE9 */ bl sprite_puts
/* 000091C8 C0210060 */ lfs f1, 0x60(r1)
/* 000091CC 4BFF6FE1 */ bl func_80071B1C
/* 000091D0 88010021 */ lbz r0, 0x21(r1)
/* 000091D4 88610020 */ lbz r3, 0x20(r1)
/* 000091D8 5400402E */ slwi r0, r0, 8
/* 000091DC 88810022 */ lbz r4, 0x22(r1)
/* 000091E0 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000091E4 7C830378 */ or r3, r4, r0
/* 000091E8 4BFF6FC5 */ bl set_text_mul_color
/* 000091EC 88010085 */ lbz r0, 0x85(r1)
/* 000091F0 88610084 */ lbz r3, 0x84(r1)
/* 000091F4 5400402E */ slwi r0, r0, 8
/* 000091F8 88810086 */ lbz r4, 0x86(r1)
/* 000091FC 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00009200 7C830378 */ or r3, r4, r0
/* 00009204 4BFF6FA9 */ bl set_text_add_color
/* 00009208 C0210018 */ lfs f1, 0x18(r1)
/* 0000920C C041001C */ lfs f2, 0x1c(r1)
/* 00009210 4BFF6F9D */ bl set_text_pos
/* 00009214 7FA3EB78 */ mr r3, r29
/* 00009218 4BFF6F95 */ bl sprite_puts
/* 0000921C 3A310008 */ addi r17, r17, 8
/* 00009220 3A520001 */ addi r18, r18, 1
lbl_00009224:
/* 00009224 80130004 */ lwz r0, 4(r19)
/* 00009228 7C120000 */ cmpw r18, r0
/* 0000922C 4180FE28 */ blt lbl_00009054
/* 00009230 4BFF6F7D */ bl mathutil_mtxA_from_identity
/* 00009234 3C600000 */ lis r3, mathutilData@ha
/* 00009238 38630000 */ addi r3, r3, mathutilData@l
/* 0000923C 80630000 */ lwz r3, 0(r3)
/* 00009240 38800000 */ li r4, 0
/* 00009244 4BFF6F69 */ bl GXLoadPosMtxImm
/* 00009248 BA0100E0 */ lmw r16, 0xe0(r1)
/* 0000924C 80010124 */ lwz r0, 0x124(r1)
/* 00009250 38210120 */ addi r1, r1, 0x120
/* 00009254 7C0803A6 */ mtlr r0
/* 00009258 4E800020 */ blr 
