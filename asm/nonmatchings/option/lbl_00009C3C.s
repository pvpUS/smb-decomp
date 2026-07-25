/* 00009C3C 7C0802A6 */ mflr r0
/* 00009C40 3C800000 */ lis r4, lbl_0000C8F0@ha
/* 00009C44 90010004 */ stw r0, 4(r1)
/* 00009C48 9421FF00 */ stwu r1, -0x100(r1)
/* 00009C4C BF2100E4 */ stmw r25, 0xe4(r1)
/* 00009C50 3BA40000 */ addi r29, r4, lbl_0000C8F0@l
/* 00009C54 3C800000 */ lis r4, lbl_0000C370@ha
/* 00009C58 3BE40000 */ addi r31, r4, lbl_0000C370@l
/* 00009C5C 8863000F */ lbz r3, 0xf(r3)
/* 00009C60 7C630774 */ extsb r3, r3
/* 00009C64 4BFFA309 */ bl lbl_00003F6C
/* 00009C68 28030000 */ cmplwi r3, 0
/* 00009C6C 41820040 */ beq lbl_00009CAC
/* 00009C70 C05F0000 */ lfs f2, 0(r31)
/* 00009C74 C0230004 */ lfs f1, 4(r3)
/* 00009C78 C0030008 */ lfs f0, 8(r3)
/* 00009C7C FC601090 */ fmr f3, f2
/* 00009C80 EC21002A */ fadds f1, f1, f0
/* 00009C84 4BFF6529 */ bl mathutil_mtxA_from_translate_xyz
/* 00009C88 3C600000 */ lis r3, lbl_10000000@ha
/* 00009C8C 38630000 */ addi r3, r3, lbl_10000000@l
/* 00009C90 38630184 */ addi r3, r3, 0x184
/* 00009C94 4BFF6519 */ bl mathutil_mtxA_to_mtx
/* 00009C98 3C600000 */ lis r3, mathutilData@ha
/* 00009C9C 38630000 */ addi r3, r3, mathutilData@l
/* 00009CA0 80630000 */ lwz r3, 0(r3)
/* 00009CA4 38800000 */ li r4, 0
/* 00009CA8 4BFF6505 */ bl GXLoadPosMtxImm
lbl_00009CAC:
/* 00009CAC 7FA3EB78 */ mr r3, r29
/* 00009CB0 4BFF64FD */ bl nlSprPut
/* 00009CB4 C01F0088 */ lfs f0, 0x88(r31)
/* 00009CB8 3BC100A0 */ addi r30, r1, 0xa0
/* 00009CBC 388000B3 */ li r4, 0xb3
/* 00009CC0 D0010060 */ stfs f0, 0x60(r1)
/* 00009CC4 3B200000 */ li r25, 0
/* 00009CC8 3C000020 */ lis r0, 0x20
/* 00009CCC C01F0060 */ lfs f0, 0x60(r31)
/* 00009CD0 7FC3F378 */ mr r3, r30
/* 00009CD4 D0010054 */ stfs f0, 0x54(r1)
/* 00009CD8 C01F0060 */ lfs f0, 0x60(r31)
/* 00009CDC D0010058 */ stfs f0, 0x58(r1)
/* 00009CE0 98810015 */ stb r4, 0x15(r1)
/* 00009CE4 389D1190 */ addi r4, r29, 0x1190
/* 00009CE8 9B210084 */ stb r25, 0x84(r1)
/* 00009CEC 9B210085 */ stb r25, 0x85(r1)
/* 00009CF0 9B210086 */ stb r25, 0x86(r1)
/* 00009CF4 90010088 */ stw r0, 0x88(r1)
/* 00009CF8 4BFF64B5 */ bl strcpy
/* 00009CFC 4BFF64B1 */ bl reset_text_draw_settings
/* 00009D00 88610015 */ lbz r3, 0x15(r1)
/* 00009D04 4BFF64A9 */ bl set_text_font
/* 00009D08 C0210054 */ lfs f1, 0x54(r1)
/* 00009D0C C0410058 */ lfs f2, 0x58(r1)
/* 00009D10 4BFF649D */ bl set_text_scale
/* 00009D14 80610088 */ lwz r3, 0x88(r1)
/* 00009D18 4BFF6495 */ bl func_80071B50
/* 00009D1C C0210060 */ lfs f1, 0x60(r1)
/* 00009D20 4BFF648D */ bl func_80071B1C
/* 00009D24 88010021 */ lbz r0, 0x21(r1)
/* 00009D28 88610020 */ lbz r3, 0x20(r1)
/* 00009D2C 5400402E */ slwi r0, r0, 8
/* 00009D30 88810022 */ lbz r4, 0x22(r1)
/* 00009D34 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00009D38 7C830378 */ or r3, r4, r0
/* 00009D3C 4BFF6471 */ bl set_text_mul_color
/* 00009D40 88010085 */ lbz r0, 0x85(r1)
/* 00009D44 88610084 */ lbz r3, 0x84(r1)
/* 00009D48 5400402E */ slwi r0, r0, 8
/* 00009D4C 88810086 */ lbz r4, 0x86(r1)
/* 00009D50 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00009D54 7C830378 */ or r3, r4, r0
/* 00009D58 4BFF6455 */ bl set_text_add_color
/* 00009D5C 7FC3F378 */ mr r3, r30
/* 00009D60 4BFF644D */ bl u_get_text_width
/* 00009D64 C81F0058 */ lfd f0, 0x58(r31)
/* 00009D68 380000FF */ li r0, 0xff
/* 00009D6C C85F00A8 */ lfd f2, 0xa8(r31)
/* 00009D70 FC000072 */ fmul f0, f0, f1
/* 00009D74 FC020028 */ fsub f0, f2, f0
/* 00009D78 FC000018 */ frsp f0, f0
/* 00009D7C D0010018 */ stfs f0, 0x18(r1)
/* 00009D80 C01F0090 */ lfs f0, 0x90(r31)
/* 00009D84 D001001C */ stfs f0, 0x1c(r1)
/* 00009D88 98010020 */ stb r0, 0x20(r1)
/* 00009D8C 98010021 */ stb r0, 0x21(r1)
/* 00009D90 9B210022 */ stb r25, 0x22(r1)
/* 00009D94 4BFF6419 */ bl reset_text_draw_settings
/* 00009D98 88610015 */ lbz r3, 0x15(r1)
/* 00009D9C 4BFF6411 */ bl set_text_font
/* 00009DA0 C0210054 */ lfs f1, 0x54(r1)
/* 00009DA4 C0410058 */ lfs f2, 0x58(r1)
/* 00009DA8 4BFF6405 */ bl set_text_scale
/* 00009DAC 80610088 */ lwz r3, 0x88(r1)
/* 00009DB0 4BFF63FD */ bl func_80071B50
/* 00009DB4 C83F0028 */ lfd f1, 0x28(r31)
/* 00009DB8 C0010060 */ lfs f0, 0x60(r1)
/* 00009DBC FC21002A */ fadd f1, f1, f0
/* 00009DC0 FC200818 */ frsp f1, f1
/* 00009DC4 4BFF63E9 */ bl func_80071B1C
/* 00009DC8 38600000 */ li r3, 0
/* 00009DCC 4BFF63E1 */ bl set_text_mul_color
/* 00009DD0 88010085 */ lbz r0, 0x85(r1)
/* 00009DD4 88610084 */ lbz r3, 0x84(r1)
/* 00009DD8 5400402E */ slwi r0, r0, 8
/* 00009DDC 88810086 */ lbz r4, 0x86(r1)
/* 00009DE0 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00009DE4 7C830378 */ or r3, r4, r0
/* 00009DE8 4BFF63C5 */ bl set_text_add_color
/* 00009DEC C85F0030 */ lfd f2, 0x30(r31)
/* 00009DF0 C0210018 */ lfs f1, 0x18(r1)
/* 00009DF4 C001001C */ lfs f0, 0x1c(r1)
/* 00009DF8 FC22082A */ fadd f1, f2, f1
/* 00009DFC FC42002A */ fadd f2, f2, f0
/* 00009E00 FC200818 */ frsp f1, f1
/* 00009E04 FC401018 */ frsp f2, f2
/* 00009E08 4BFF63A5 */ bl set_text_pos
/* 00009E0C 7FC3F378 */ mr r3, r30
/* 00009E10 4BFF639D */ bl sprite_puts
/* 00009E14 C0210060 */ lfs f1, 0x60(r1)
/* 00009E18 4BFF6395 */ bl func_80071B1C
/* 00009E1C 88010021 */ lbz r0, 0x21(r1)
/* 00009E20 88610020 */ lbz r3, 0x20(r1)
/* 00009E24 5400402E */ slwi r0, r0, 8
/* 00009E28 88810022 */ lbz r4, 0x22(r1)
/* 00009E2C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00009E30 7C830378 */ or r3, r4, r0
/* 00009E34 4BFF6379 */ bl set_text_mul_color
/* 00009E38 88010085 */ lbz r0, 0x85(r1)
/* 00009E3C 88610084 */ lbz r3, 0x84(r1)
/* 00009E40 5400402E */ slwi r0, r0, 8
/* 00009E44 88810086 */ lbz r4, 0x86(r1)
/* 00009E48 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00009E4C 7C830378 */ or r3, r4, r0
/* 00009E50 4BFF635D */ bl set_text_add_color
/* 00009E54 C0210018 */ lfs f1, 0x18(r1)
/* 00009E58 C041001C */ lfs f2, 0x1c(r1)
/* 00009E5C 4BFF6351 */ bl set_text_pos
/* 00009E60 7FC3F378 */ mr r3, r30
/* 00009E64 4BFF6349 */ bl sprite_puts
/* 00009E68 C01F0218 */ lfs f0, 0x218(r31)
/* 00009E6C 3C800000 */ lis r4, lbl_10000000@ha
/* 00009E70 3B640000 */ addi r27, r4, lbl_10000000@l
/* 00009E74 D01D0054 */ stfs f0, 0x54(r29)
/* 00009E78 387D0050 */ addi r3, r29, 0x50
/* 00009E7C C01B0148 */ lfs f0, 0x148(r27)
/* 00009E80 D01D0058 */ stfs f0, 0x58(r29)
/* 00009E84 4BFF6329 */ bl nlSprPut
/* 00009E88 387D10A8 */ addi r3, r29, 0x10a8
/* 00009E8C 4BFF6321 */ bl nlSprPut
/* 00009E90 3B400000 */ li r26, 0
/* 00009E94 3F804330 */ lis r28, 0x4330
lbl_00009E98:
/* 00009E98 6F408000 */ xoris r0, r26, 0x8000
/* 00009E9C C01F021C */ lfs f0, 0x21c(r31)
/* 00009EA0 900100DC */ stw r0, 0xdc(r1)
/* 00009EA4 3C600000 */ lis r3, lbl_0000C380@ha
/* 00009EA8 D0010018 */ stfs f0, 0x18(r1)
/* 00009EAC 938100D8 */ stw r28, 0xd8(r1)
/* 00009EB0 C8230000 */ lfd f1, lbl_0000C380@l(r3)
/* 00009EB4 C80100D8 */ lfd f0, 0xd8(r1)
/* 00009EB8 C85F0080 */ lfd f2, 0x80(r31)
/* 00009EBC FC000828 */ fsub f0, f0, f1
/* 00009EC0 C83F0220 */ lfd f1, 0x220(r31)
/* 00009EC4 FC020032 */ fmul f0, f2, f0
/* 00009EC8 FC01002A */ fadd f0, f1, f0
/* 00009ECC FC000018 */ frsp f0, f0
/* 00009ED0 D001001C */ stfs f0, 0x1c(r1)
/* 00009ED4 801B0154 */ lwz r0, 0x154(r27)
/* 00009ED8 7C1A0000 */ cmpw r26, r0
/* 00009EDC 4082001C */ bne lbl_00009EF8
/* 00009EE0 386000FF */ li r3, 0xff
/* 00009EE4 98610020 */ stb r3, 0x20(r1)
/* 00009EE8 38000000 */ li r0, 0
/* 00009EEC 98610021 */ stb r3, 0x21(r1)
/* 00009EF0 98010022 */ stb r0, 0x22(r1)
/* 00009EF4 48000018 */ b lbl_00009F0C
lbl_00009EF8:
/* 00009EF8 3860008F */ li r3, 0x8f
/* 00009EFC 98610020 */ stb r3, 0x20(r1)
/* 00009F00 38000000 */ li r0, 0
/* 00009F04 98610021 */ stb r3, 0x21(r1)
/* 00009F08 98010022 */ stb r0, 0x22(r1)
lbl_00009F0C:
/* 00009F0C 387E0000 */ addi r3, r30, 0
/* 00009F10 4CC63182 */ crclr 6
/* 00009F14 389D120C */ addi r4, r29, 0x120c
/* 00009F18 38BA0001 */ addi r5, r26, 1
/* 00009F1C 4BFF6291 */ bl sprintf
/* 00009F20 4BFF628D */ bl reset_text_draw_settings
/* 00009F24 88610015 */ lbz r3, 0x15(r1)
/* 00009F28 4BFF6285 */ bl set_text_font
/* 00009F2C C0210054 */ lfs f1, 0x54(r1)
/* 00009F30 C0410058 */ lfs f2, 0x58(r1)
/* 00009F34 4BFF6279 */ bl set_text_scale
/* 00009F38 80610088 */ lwz r3, 0x88(r1)
/* 00009F3C 4BFF6271 */ bl func_80071B50
/* 00009F40 C83F0028 */ lfd f1, 0x28(r31)
/* 00009F44 C0010060 */ lfs f0, 0x60(r1)
/* 00009F48 FC21002A */ fadd f1, f1, f0
/* 00009F4C FC200818 */ frsp f1, f1
/* 00009F50 4BFF625D */ bl func_80071B1C
/* 00009F54 38600000 */ li r3, 0
/* 00009F58 4BFF6255 */ bl set_text_mul_color
/* 00009F5C 88010085 */ lbz r0, 0x85(r1)
/* 00009F60 88610084 */ lbz r3, 0x84(r1)
/* 00009F64 5400402E */ slwi r0, r0, 8
/* 00009F68 88810086 */ lbz r4, 0x86(r1)
/* 00009F6C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00009F70 7C830378 */ or r3, r4, r0
/* 00009F74 4BFF6239 */ bl set_text_add_color
/* 00009F78 C85F0030 */ lfd f2, 0x30(r31)
/* 00009F7C C0210018 */ lfs f1, 0x18(r1)
/* 00009F80 C001001C */ lfs f0, 0x1c(r1)
/* 00009F84 FC22082A */ fadd f1, f2, f1
/* 00009F88 FC42002A */ fadd f2, f2, f0
/* 00009F8C FC200818 */ frsp f1, f1
/* 00009F90 FC401018 */ frsp f2, f2
/* 00009F94 4BFF6219 */ bl set_text_pos
/* 00009F98 7FC3F378 */ mr r3, r30
/* 00009F9C 4BFF6211 */ bl sprite_puts
/* 00009FA0 C0210060 */ lfs f1, 0x60(r1)
/* 00009FA4 4BFF6209 */ bl func_80071B1C
/* 00009FA8 88010021 */ lbz r0, 0x21(r1)
/* 00009FAC 88610020 */ lbz r3, 0x20(r1)
/* 00009FB0 5400402E */ slwi r0, r0, 8
/* 00009FB4 88810022 */ lbz r4, 0x22(r1)
/* 00009FB8 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00009FBC 7C830378 */ or r3, r4, r0
/* 00009FC0 4BFF61ED */ bl set_text_mul_color
/* 00009FC4 88010085 */ lbz r0, 0x85(r1)
/* 00009FC8 88610084 */ lbz r3, 0x84(r1)
/* 00009FCC 5400402E */ slwi r0, r0, 8
/* 00009FD0 88810086 */ lbz r4, 0x86(r1)
/* 00009FD4 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00009FD8 7C830378 */ or r3, r4, r0
/* 00009FDC 4BFF61D1 */ bl set_text_add_color
/* 00009FE0 C0210018 */ lfs f1, 0x18(r1)
/* 00009FE4 C041001C */ lfs f2, 0x1c(r1)
/* 00009FE8 4BFF61C5 */ bl set_text_pos
/* 00009FEC 7FC3F378 */ mr r3, r30
/* 00009FF0 4BFF61BD */ bl sprite_puts
/* 00009FF4 3B5A0001 */ addi r26, r26, 1
/* 00009FF8 2C1A0004 */ cmpwi r26, 4
/* 00009FFC 4180FE9C */ blt lbl_00009E98
/* 0000A000 3C600000 */ lis r3, lbl_10000000@ha
/* 0000A004 C85F0080 */ lfd f2, 0x80(r31)
/* 0000A008 38630000 */ addi r3, r3, lbl_10000000@l
/* 0000A00C C87F0228 */ lfd f3, 0x228(r31)
/* 0000A010 80030154 */ lwz r0, 0x154(r3)
/* 0000A014 3B630154 */ addi r27, r3, 0x154
/* 0000A018 3C600000 */ lis r3, lbl_0000C380@ha
/* 0000A01C 6C008000 */ xoris r0, r0, 0x8000
/* 0000A020 C8230000 */ lfd f1, lbl_0000C380@l(r3)
/* 0000A024 900100DC */ stw r0, 0xdc(r1)
/* 0000A028 3F804330 */ lis r28, 0x4330
/* 0000A02C 387D11BC */ addi r3, r29, 0x11bc
/* 0000A030 938100D8 */ stw r28, 0xd8(r1)
/* 0000A034 C80100D8 */ lfd f0, 0xd8(r1)
/* 0000A038 FC000828 */ fsub f0, f0, f1
/* 0000A03C FC020032 */ fmul f0, f2, f0
/* 0000A040 FC03002A */ fadd f0, f3, f0
/* 0000A044 FC000018 */ frsp f0, f0
/* 0000A048 D01D11C4 */ stfs f0, 0x11c4(r29)
/* 0000A04C 4BFF6161 */ bl nlSprPut
/* 0000A050 380000B0 */ li r0, 0xb0
/* 0000A054 98010015 */ stb r0, 0x15(r1)
/* 0000A058 3CA00000 */ lis r5, lbl_0000C380@ha
/* 0000A05C 380000FF */ li r0, 0xff
/* 0000A060 C01F0190 */ lfs f0, 0x190(r31)
/* 0000A064 3B400000 */ li r26, 0
/* 0000A068 387E0000 */ addi r3, r30, 0
/* 0000A06C D0010018 */ stfs f0, 0x18(r1)
/* 0000A070 389D121C */ addi r4, r29, 0x121c
/* 0000A074 80DB0000 */ lwz r6, 0(r27)
/* 0000A078 C8250000 */ lfd f1, lbl_0000C380@l(r5)
/* 0000A07C 6CC58000 */ xoris r5, r6, 0x8000
/* 0000A080 C85F0080 */ lfd f2, 0x80(r31)
/* 0000A084 90A100D4 */ stw r5, 0xd4(r1)
/* 0000A088 C87F0220 */ lfd f3, 0x220(r31)
/* 0000A08C 938100D0 */ stw r28, 0xd0(r1)
/* 0000A090 C80100D0 */ lfd f0, 0xd0(r1)
/* 0000A094 FC000828 */ fsub f0, f0, f1
/* 0000A098 FC020032 */ fmul f0, f2, f0
/* 0000A09C FC03002A */ fadd f0, f3, f0
/* 0000A0A0 FC000018 */ frsp f0, f0
/* 0000A0A4 D001001C */ stfs f0, 0x1c(r1)
/* 0000A0A8 98010020 */ stb r0, 0x20(r1)
/* 0000A0AC 98010021 */ stb r0, 0x21(r1)
/* 0000A0B0 9B410022 */ stb r26, 0x22(r1)
/* 0000A0B4 C01F0158 */ lfs f0, 0x158(r31)
/* 0000A0B8 D0010054 */ stfs f0, 0x54(r1)
/* 0000A0BC 4BFF60F1 */ bl strcpy
/* 0000A0C0 4BFF60ED */ bl reset_text_draw_settings
/* 0000A0C4 88610015 */ lbz r3, 0x15(r1)
/* 0000A0C8 4BFF60E5 */ bl set_text_font
/* 0000A0CC C0210054 */ lfs f1, 0x54(r1)
/* 0000A0D0 C0410058 */ lfs f2, 0x58(r1)
/* 0000A0D4 4BFF60D9 */ bl set_text_scale
/* 0000A0D8 80610088 */ lwz r3, 0x88(r1)
/* 0000A0DC 4BFF60D1 */ bl func_80071B50
/* 0000A0E0 C83F0028 */ lfd f1, 0x28(r31)
/* 0000A0E4 C0010060 */ lfs f0, 0x60(r1)
/* 0000A0E8 FC21002A */ fadd f1, f1, f0
/* 0000A0EC FC200818 */ frsp f1, f1
/* 0000A0F0 4BFF60BD */ bl func_80071B1C
/* 0000A0F4 38600000 */ li r3, 0
/* 0000A0F8 4BFF60B5 */ bl set_text_mul_color
/* 0000A0FC 88010085 */ lbz r0, 0x85(r1)
/* 0000A100 88610084 */ lbz r3, 0x84(r1)
/* 0000A104 5400402E */ slwi r0, r0, 8
/* 0000A108 88810086 */ lbz r4, 0x86(r1)
/* 0000A10C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000A110 7C830378 */ or r3, r4, r0
/* 0000A114 4BFF6099 */ bl set_text_add_color
/* 0000A118 C85F0030 */ lfd f2, 0x30(r31)
/* 0000A11C C0210018 */ lfs f1, 0x18(r1)
/* 0000A120 C001001C */ lfs f0, 0x1c(r1)
/* 0000A124 FC22082A */ fadd f1, f2, f1
/* 0000A128 FC42002A */ fadd f2, f2, f0
/* 0000A12C FC200818 */ frsp f1, f1
/* 0000A130 FC401018 */ frsp f2, f2
/* 0000A134 4BFF6079 */ bl set_text_pos
/* 0000A138 7FC3F378 */ mr r3, r30
/* 0000A13C 4BFF6071 */ bl sprite_puts
/* 0000A140 C0210060 */ lfs f1, 0x60(r1)
/* 0000A144 4BFF6069 */ bl func_80071B1C
/* 0000A148 88010021 */ lbz r0, 0x21(r1)
/* 0000A14C 88610020 */ lbz r3, 0x20(r1)
/* 0000A150 5400402E */ slwi r0, r0, 8
/* 0000A154 88810022 */ lbz r4, 0x22(r1)
/* 0000A158 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000A15C 7C830378 */ or r3, r4, r0
/* 0000A160 4BFF604D */ bl set_text_mul_color
/* 0000A164 88010085 */ lbz r0, 0x85(r1)
/* 0000A168 88610084 */ lbz r3, 0x84(r1)
/* 0000A16C 5400402E */ slwi r0, r0, 8
/* 0000A170 88810086 */ lbz r4, 0x86(r1)
/* 0000A174 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000A178 7C830378 */ or r3, r4, r0
/* 0000A17C 4BFF6031 */ bl set_text_add_color
/* 0000A180 C0210018 */ lfs f1, 0x18(r1)
/* 0000A184 C041001C */ lfs f2, 0x1c(r1)
/* 0000A188 4BFF6025 */ bl set_text_pos
/* 0000A18C 7FC3F378 */ mr r3, r30
/* 0000A190 4BFF601D */ bl sprite_puts
/* 0000A194 C01F0060 */ lfs f0, 0x60(r31)
/* 0000A198 D0010054 */ stfs f0, 0x54(r1)
/* 0000A19C 4BFF6011 */ bl vibration_get_cont_enable_mask
/* 0000A1A0 5479063E */ clrlwi r25, r3, 0x18
lbl_0000A1A4:
/* 0000A1A4 801B0000 */ lwz r0, 0(r27)
/* 0000A1A8 7C1A0000 */ cmpw r26, r0
/* 0000A1AC 4082001C */ bne lbl_0000A1C8
/* 0000A1B0 386000FF */ li r3, 0xff
/* 0000A1B4 98610020 */ stb r3, 0x20(r1)
/* 0000A1B8 38000000 */ li r0, 0
/* 0000A1BC 98610021 */ stb r3, 0x21(r1)
/* 0000A1C0 98010022 */ stb r0, 0x22(r1)
/* 0000A1C4 48000018 */ b lbl_0000A1DC
lbl_0000A1C8:
/* 0000A1C8 3860008F */ li r3, 0x8f
/* 0000A1CC 98610020 */ stb r3, 0x20(r1)
/* 0000A1D0 38000000 */ li r0, 0
/* 0000A1D4 98610021 */ stb r3, 0x21(r1)
/* 0000A1D8 98010022 */ stb r0, 0x22(r1)
lbl_0000A1DC:
/* 0000A1DC 38000001 */ li r0, 1
/* 0000A1E0 7C00D030 */ slw r0, r0, r26
/* 0000A1E4 7F200039 */ and. r0, r25, r0
/* 0000A1E8 41820054 */ beq lbl_0000A23C
/* 0000A1EC 6F408000 */ xoris r0, r26, 0x8000
/* 0000A1F0 C01F0230 */ lfs f0, 0x230(r31)
/* 0000A1F4 900100D4 */ stw r0, 0xd4(r1)
/* 0000A1F8 3CA00000 */ lis r5, lbl_0000C380@ha
/* 0000A1FC 4CC63182 */ crclr 6
/* 0000A200 7FC3F378 */ mr r3, r30
/* 0000A204 D0010018 */ stfs f0, 0x18(r1)
/* 0000A208 389D1244 */ addi r4, r29, 0x1244
/* 0000A20C 938100D0 */ stw r28, 0xd0(r1)
/* 0000A210 C8250000 */ lfd f1, lbl_0000C380@l(r5)
/* 0000A214 C80100D0 */ lfd f0, 0xd0(r1)
/* 0000A218 C85F0080 */ lfd f2, 0x80(r31)
/* 0000A21C FC000828 */ fsub f0, f0, f1
/* 0000A220 C83F0220 */ lfd f1, 0x220(r31)
/* 0000A224 FC020032 */ fmul f0, f2, f0
/* 0000A228 FC01002A */ fadd f0, f1, f0
/* 0000A22C FC000018 */ frsp f0, f0
/* 0000A230 D001001C */ stfs f0, 0x1c(r1)
/* 0000A234 4BFF5F79 */ bl sprintf
/* 0000A238 48000050 */ b lbl_0000A288
lbl_0000A23C:
/* 0000A23C 6F408000 */ xoris r0, r26, 0x8000
/* 0000A240 C01F0234 */ lfs f0, 0x234(r31)
/* 0000A244 900100D4 */ stw r0, 0xd4(r1)
/* 0000A248 3CA00000 */ lis r5, lbl_0000C380@ha
/* 0000A24C 4CC63182 */ crclr 6
/* 0000A250 7FC3F378 */ mr r3, r30
/* 0000A254 D0010018 */ stfs f0, 0x18(r1)
/* 0000A258 389D124C */ addi r4, r29, 0x124c
/* 0000A25C 938100D0 */ stw r28, 0xd0(r1)
/* 0000A260 C8250000 */ lfd f1, lbl_0000C380@l(r5)
/* 0000A264 C80100D0 */ lfd f0, 0xd0(r1)
/* 0000A268 C85F0080 */ lfd f2, 0x80(r31)
/* 0000A26C FC000828 */ fsub f0, f0, f1
/* 0000A270 C83F0220 */ lfd f1, 0x220(r31)
/* 0000A274 FC020032 */ fmul f0, f2, f0
/* 0000A278 FC01002A */ fadd f0, f1, f0
/* 0000A27C FC000018 */ frsp f0, f0
/* 0000A280 D001001C */ stfs f0, 0x1c(r1)
/* 0000A284 4BFF5F29 */ bl sprintf
lbl_0000A288:
/* 0000A288 4BFF5F25 */ bl reset_text_draw_settings
/* 0000A28C 88610015 */ lbz r3, 0x15(r1)
/* 0000A290 4BFF5F1D */ bl set_text_font
/* 0000A294 C0210054 */ lfs f1, 0x54(r1)
/* 0000A298 C0410058 */ lfs f2, 0x58(r1)
/* 0000A29C 4BFF5F11 */ bl set_text_scale
/* 0000A2A0 80610088 */ lwz r3, 0x88(r1)
/* 0000A2A4 4BFF5F09 */ bl func_80071B50
/* 0000A2A8 C83F0028 */ lfd f1, 0x28(r31)
/* 0000A2AC C0010060 */ lfs f0, 0x60(r1)
/* 0000A2B0 FC21002A */ fadd f1, f1, f0
/* 0000A2B4 FC200818 */ frsp f1, f1
/* 0000A2B8 4BFF5EF5 */ bl func_80071B1C
/* 0000A2BC 38600000 */ li r3, 0
/* 0000A2C0 4BFF5EED */ bl set_text_mul_color
/* 0000A2C4 88010085 */ lbz r0, 0x85(r1)
/* 0000A2C8 88610084 */ lbz r3, 0x84(r1)
/* 0000A2CC 5400402E */ slwi r0, r0, 8
/* 0000A2D0 88810086 */ lbz r4, 0x86(r1)
/* 0000A2D4 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000A2D8 7C830378 */ or r3, r4, r0
/* 0000A2DC 4BFF5ED1 */ bl set_text_add_color
/* 0000A2E0 C85F0030 */ lfd f2, 0x30(r31)
/* 0000A2E4 C0210018 */ lfs f1, 0x18(r1)
/* 0000A2E8 C001001C */ lfs f0, 0x1c(r1)
/* 0000A2EC FC22082A */ fadd f1, f2, f1
/* 0000A2F0 FC42002A */ fadd f2, f2, f0
/* 0000A2F4 FC200818 */ frsp f1, f1
/* 0000A2F8 FC401018 */ frsp f2, f2
/* 0000A2FC 4BFF5EB1 */ bl set_text_pos
/* 0000A300 7FC3F378 */ mr r3, r30
/* 0000A304 4BFF5EA9 */ bl sprite_puts
/* 0000A308 C0210060 */ lfs f1, 0x60(r1)
/* 0000A30C 4BFF5EA1 */ bl func_80071B1C
/* 0000A310 88010021 */ lbz r0, 0x21(r1)
/* 0000A314 88610020 */ lbz r3, 0x20(r1)
/* 0000A318 5400402E */ slwi r0, r0, 8
/* 0000A31C 88810022 */ lbz r4, 0x22(r1)
/* 0000A320 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000A324 7C830378 */ or r3, r4, r0
/* 0000A328 4BFF5E85 */ bl set_text_mul_color
/* 0000A32C 88010085 */ lbz r0, 0x85(r1)
/* 0000A330 88610084 */ lbz r3, 0x84(r1)
/* 0000A334 5400402E */ slwi r0, r0, 8
/* 0000A338 88810086 */ lbz r4, 0x86(r1)
/* 0000A33C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000A340 7C830378 */ or r3, r4, r0
/* 0000A344 4BFF5E69 */ bl set_text_add_color
/* 0000A348 C0210018 */ lfs f1, 0x18(r1)
/* 0000A34C C041001C */ lfs f2, 0x1c(r1)
/* 0000A350 4BFF5E5D */ bl set_text_pos
/* 0000A354 7FC3F378 */ mr r3, r30
/* 0000A358 4BFF5E55 */ bl sprite_puts
/* 0000A35C 3B5A0001 */ addi r26, r26, 1
/* 0000A360 2C1A0004 */ cmpwi r26, 4
/* 0000A364 4180FE40 */ blt lbl_0000A1A4
/* 0000A368 380000B3 */ li r0, 0xb3
/* 0000A36C 98010015 */ stb r0, 0x15(r1)
/* 0000A370 387D00F0 */ addi r3, r29, 0xf0
/* 0000A374 4BFF5E39 */ bl nlSprPut
/* 0000A378 388000FF */ li r4, 0xff
/* 0000A37C 4CC63182 */ crclr 6
/* 0000A380 98810020 */ stb r4, 0x20(r1)
/* 0000A384 38000000 */ li r0, 0
/* 0000A388 387E0000 */ addi r3, r30, 0
/* 0000A38C 98810021 */ stb r4, 0x21(r1)
/* 0000A390 389D1254 */ addi r4, r29, 0x1254
/* 0000A394 98010022 */ stb r0, 0x22(r1)
/* 0000A398 C01F0178 */ lfs f0, 0x178(r31)
/* 0000A39C D0010054 */ stfs f0, 0x54(r1)
/* 0000A3A0 80BB0000 */ lwz r5, 0(r27)
/* 0000A3A4 38A50001 */ addi r5, r5, 1
/* 0000A3A8 4BFF5E05 */ bl sprintf
/* 0000A3AC 4BFF5E01 */ bl reset_text_draw_settings
/* 0000A3B0 88610015 */ lbz r3, 0x15(r1)
/* 0000A3B4 4BFF5DF9 */ bl set_text_font
/* 0000A3B8 C0210054 */ lfs f1, 0x54(r1)
/* 0000A3BC C0410058 */ lfs f2, 0x58(r1)
/* 0000A3C0 4BFF5DED */ bl set_text_scale
/* 0000A3C4 80610088 */ lwz r3, 0x88(r1)
/* 0000A3C8 4BFF5DE5 */ bl func_80071B50
/* 0000A3CC C0210060 */ lfs f1, 0x60(r1)
/* 0000A3D0 4BFF5DDD */ bl func_80071B1C
/* 0000A3D4 88010021 */ lbz r0, 0x21(r1)
/* 0000A3D8 88610020 */ lbz r3, 0x20(r1)
/* 0000A3DC 5400402E */ slwi r0, r0, 8
/* 0000A3E0 88810022 */ lbz r4, 0x22(r1)
/* 0000A3E4 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000A3E8 7C830378 */ or r3, r4, r0
/* 0000A3EC 4BFF5DC1 */ bl set_text_mul_color
/* 0000A3F0 88010085 */ lbz r0, 0x85(r1)
/* 0000A3F4 88610084 */ lbz r3, 0x84(r1)
/* 0000A3F8 5400402E */ slwi r0, r0, 8
/* 0000A3FC 88810086 */ lbz r4, 0x86(r1)
/* 0000A400 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000A404 7C830378 */ or r3, r4, r0
/* 0000A408 4BFF5DA5 */ bl set_text_add_color
/* 0000A40C 7FC3F378 */ mr r3, r30
/* 0000A410 4BFF5D9D */ bl u_get_text_width
/* 0000A414 C81F0058 */ lfd f0, 0x58(r31)
/* 0000A418 C85F00A8 */ lfd f2, 0xa8(r31)
/* 0000A41C FC000072 */ fmul f0, f0, f1
/* 0000A420 FC020028 */ fsub f0, f2, f0
/* 0000A424 FC000018 */ frsp f0, f0
/* 0000A428 D0010018 */ stfs f0, 0x18(r1)
/* 0000A42C C01F0190 */ lfs f0, 0x190(r31)
/* 0000A430 D001001C */ stfs f0, 0x1c(r1)
/* 0000A434 4BFF5D79 */ bl reset_text_draw_settings
/* 0000A438 88610015 */ lbz r3, 0x15(r1)
/* 0000A43C 4BFF5D71 */ bl set_text_font
/* 0000A440 C0210054 */ lfs f1, 0x54(r1)
/* 0000A444 C0410058 */ lfs f2, 0x58(r1)
/* 0000A448 4BFF5D65 */ bl set_text_scale
/* 0000A44C 80610088 */ lwz r3, 0x88(r1)
/* 0000A450 4BFF5D5D */ bl func_80071B50
/* 0000A454 C83F0028 */ lfd f1, 0x28(r31)
/* 0000A458 C0010060 */ lfs f0, 0x60(r1)
/* 0000A45C FC21002A */ fadd f1, f1, f0
/* 0000A460 FC200818 */ frsp f1, f1
/* 0000A464 4BFF5D49 */ bl func_80071B1C
/* 0000A468 38600000 */ li r3, 0
/* 0000A46C 4BFF5D41 */ bl set_text_mul_color
/* 0000A470 88010085 */ lbz r0, 0x85(r1)
/* 0000A474 88610084 */ lbz r3, 0x84(r1)
/* 0000A478 5400402E */ slwi r0, r0, 8
/* 0000A47C 88810086 */ lbz r4, 0x86(r1)
/* 0000A480 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000A484 7C830378 */ or r3, r4, r0
/* 0000A488 4BFF5D25 */ bl set_text_add_color
/* 0000A48C C85F0030 */ lfd f2, 0x30(r31)
/* 0000A490 C0210018 */ lfs f1, 0x18(r1)
/* 0000A494 C001001C */ lfs f0, 0x1c(r1)
/* 0000A498 FC22082A */ fadd f1, f2, f1
/* 0000A49C FC42002A */ fadd f2, f2, f0
/* 0000A4A0 FC200818 */ frsp f1, f1
/* 0000A4A4 FC401018 */ frsp f2, f2
/* 0000A4A8 4BFF5D05 */ bl set_text_pos
/* 0000A4AC 7FC3F378 */ mr r3, r30
/* 0000A4B0 4BFF5CFD */ bl sprite_puts
/* 0000A4B4 C0210060 */ lfs f1, 0x60(r1)
/* 0000A4B8 4BFF5CF5 */ bl func_80071B1C
/* 0000A4BC 88010021 */ lbz r0, 0x21(r1)
/* 0000A4C0 88610020 */ lbz r3, 0x20(r1)
/* 0000A4C4 5400402E */ slwi r0, r0, 8
/* 0000A4C8 88810022 */ lbz r4, 0x22(r1)
/* 0000A4CC 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000A4D0 7C830378 */ or r3, r4, r0
/* 0000A4D4 4BFF5CD9 */ bl set_text_mul_color
/* 0000A4D8 88010085 */ lbz r0, 0x85(r1)
/* 0000A4DC 88610084 */ lbz r3, 0x84(r1)
/* 0000A4E0 5400402E */ slwi r0, r0, 8
/* 0000A4E4 88810086 */ lbz r4, 0x86(r1)
/* 0000A4E8 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000A4EC 7C830378 */ or r3, r4, r0
/* 0000A4F0 4BFF5CBD */ bl set_text_add_color
/* 0000A4F4 C0210018 */ lfs f1, 0x18(r1)
/* 0000A4F8 C041001C */ lfs f2, 0x1c(r1)
/* 0000A4FC 4BFF5CB1 */ bl set_text_pos
/* 0000A500 7FC3F378 */ mr r3, r30
/* 0000A504 4BFF5CA9 */ bl sprite_puts
/* 0000A508 4BFF5CA5 */ bl mathutil_mtxA_from_identity
/* 0000A50C 3C600000 */ lis r3, mathutilData@ha
/* 0000A510 38630000 */ addi r3, r3, mathutilData@l
/* 0000A514 80630000 */ lwz r3, 0(r3)
/* 0000A518 38800000 */ li r4, 0
/* 0000A51C 4BFF5C91 */ bl GXLoadPosMtxImm
/* 0000A520 BB2100E4 */ lmw r25, 0xe4(r1)
/* 0000A524 80010104 */ lwz r0, 0x104(r1)
/* 0000A528 38210100 */ addi r1, r1, 0x100
/* 0000A52C 7C0803A6 */ mtlr r0
/* 0000A530 4E800020 */ blr 
