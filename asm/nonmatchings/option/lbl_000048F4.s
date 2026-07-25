/* 000048F4 7C0802A6 */ mflr r0
/* 000048F8 7C651B78 */ mr r5, r3
/* 000048FC 90010004 */ stw r0, 4(r1)
/* 00004900 3C800000 */ lis r4, lbl_0000C8F0@ha
/* 00004904 9421FF00 */ stwu r1, -0x100(r1)
/* 00004908 BF0100E0 */ stmw r24, 0xe0(r1)
/* 0000490C 3B640000 */ addi r27, r4, lbl_0000C8F0@l
/* 00004910 3C800000 */ lis r4, lbl_0000C370@ha
/* 00004914 3BE40000 */ addi r31, r4, lbl_0000C370@l
/* 00004918 8863000F */ lbz r3, 0xf(r3)
/* 0000491C 83A5002C */ lwz r29, 0x2c(r5)
/* 00004920 7C630774 */ extsb r3, r3
/* 00004924 4BFFF649 */ bl lbl_00003F6C
/* 00004928 28030000 */ cmplwi r3, 0
/* 0000492C 41820040 */ beq lbl_0000496C
/* 00004930 C05F0000 */ lfs f2, 0(r31)
/* 00004934 C0230004 */ lfs f1, 4(r3)
/* 00004938 C0030008 */ lfs f0, 8(r3)
/* 0000493C FC601090 */ fmr f3, f2
/* 00004940 EC21002A */ fadds f1, f1, f0
/* 00004944 4BFFB869 */ bl mathutil_mtxA_from_translate_xyz
/* 00004948 3C600000 */ lis r3, lbl_10000000@ha
/* 0000494C 38630000 */ addi r3, r3, lbl_10000000@l
/* 00004950 38630184 */ addi r3, r3, 0x184
/* 00004954 4BFFB859 */ bl mathutil_mtxA_to_mtx
/* 00004958 3C600000 */ lis r3, mathutilData@ha
/* 0000495C 38630000 */ addi r3, r3, mathutilData@l
/* 00004960 80630000 */ lwz r3, 0(r3)
/* 00004964 38800000 */ li r4, 0
/* 00004968 4BFFB845 */ bl GXLoadPosMtxImm
lbl_0000496C:
/* 0000496C 7F63DB78 */ mr r3, r27
/* 00004970 4BFFB83D */ bl nlSprPut
/* 00004974 387B00F0 */ addi r3, r27, 0xf0
/* 00004978 4BFFB835 */ bl nlSprPut
/* 0000497C C01F0088 */ lfs f0, 0x88(r31)
/* 00004980 3BC1009C */ addi r30, r1, 0x9c
/* 00004984 38C000B3 */ li r6, 0xb3
/* 00004988 D001005C */ stfs f0, 0x5c(r1)
/* 0000498C 388000FF */ li r4, 0xff
/* 00004990 38A00000 */ li r5, 0
/* 00004994 C01F0060 */ lfs f0, 0x60(r31)
/* 00004998 3C000020 */ lis r0, 0x20
/* 0000499C 387E0000 */ addi r3, r30, 0
/* 000049A0 D0010050 */ stfs f0, 0x50(r1)
/* 000049A4 C01F0060 */ lfs f0, 0x60(r31)
/* 000049A8 D0010054 */ stfs f0, 0x54(r1)
/* 000049AC 98C10011 */ stb r6, 0x11(r1)
/* 000049B0 9881001C */ stb r4, 0x1c(r1)
/* 000049B4 9881001D */ stb r4, 0x1d(r1)
/* 000049B8 389B0370 */ addi r4, r27, 0x370
/* 000049BC 98A1001E */ stb r5, 0x1e(r1)
/* 000049C0 98A10080 */ stb r5, 0x80(r1)
/* 000049C4 98A10081 */ stb r5, 0x81(r1)
/* 000049C8 98A10082 */ stb r5, 0x82(r1)
/* 000049CC 90010084 */ stw r0, 0x84(r1)
/* 000049D0 C01F008C */ lfs f0, 0x8c(r31)
/* 000049D4 D0010014 */ stfs f0, 0x14(r1)
/* 000049D8 C01F0090 */ lfs f0, 0x90(r31)
/* 000049DC D0010018 */ stfs f0, 0x18(r1)
/* 000049E0 4BFFB7CD */ bl strcpy
/* 000049E4 4BFFB7C9 */ bl reset_text_draw_settings
/* 000049E8 88610011 */ lbz r3, 0x11(r1)
/* 000049EC 4BFFB7C1 */ bl set_text_font
/* 000049F0 C0210050 */ lfs f1, 0x50(r1)
/* 000049F4 C0410054 */ lfs f2, 0x54(r1)
/* 000049F8 4BFFB7B5 */ bl set_text_scale
/* 000049FC 80610084 */ lwz r3, 0x84(r1)
/* 00004A00 4BFFB7AD */ bl func_80071B50
/* 00004A04 C83F0028 */ lfd f1, 0x28(r31)
/* 00004A08 C001005C */ lfs f0, 0x5c(r1)
/* 00004A0C FC21002A */ fadd f1, f1, f0
/* 00004A10 FC200818 */ frsp f1, f1
/* 00004A14 4BFFB799 */ bl func_80071B1C
/* 00004A18 38600000 */ li r3, 0
/* 00004A1C 4BFFB791 */ bl set_text_mul_color
/* 00004A20 88010081 */ lbz r0, 0x81(r1)
/* 00004A24 88610080 */ lbz r3, 0x80(r1)
/* 00004A28 5400402E */ slwi r0, r0, 8
/* 00004A2C 88810082 */ lbz r4, 0x82(r1)
/* 00004A30 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00004A34 7C830378 */ or r3, r4, r0
/* 00004A38 4BFFB775 */ bl set_text_add_color
/* 00004A3C C85F0030 */ lfd f2, 0x30(r31)
/* 00004A40 C0210014 */ lfs f1, 0x14(r1)
/* 00004A44 C0010018 */ lfs f0, 0x18(r1)
/* 00004A48 FC22082A */ fadd f1, f2, f1
/* 00004A4C FC42002A */ fadd f2, f2, f0
/* 00004A50 FC200818 */ frsp f1, f1
/* 00004A54 FC401018 */ frsp f2, f2
/* 00004A58 4BFFB755 */ bl set_text_pos
/* 00004A5C 7FC3F378 */ mr r3, r30
/* 00004A60 4BFFB74D */ bl sprite_puts
/* 00004A64 C021005C */ lfs f1, 0x5c(r1)
/* 00004A68 4BFFB745 */ bl func_80071B1C
/* 00004A6C 8801001D */ lbz r0, 0x1d(r1)
/* 00004A70 8861001C */ lbz r3, 0x1c(r1)
/* 00004A74 5400402E */ slwi r0, r0, 8
/* 00004A78 8881001E */ lbz r4, 0x1e(r1)
/* 00004A7C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00004A80 7C830378 */ or r3, r4, r0
/* 00004A84 4BFFB729 */ bl set_text_mul_color
/* 00004A88 88010081 */ lbz r0, 0x81(r1)
/* 00004A8C 88610080 */ lbz r3, 0x80(r1)
/* 00004A90 5400402E */ slwi r0, r0, 8
/* 00004A94 88810082 */ lbz r4, 0x82(r1)
/* 00004A98 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00004A9C 7C830378 */ or r3, r4, r0
/* 00004AA0 4BFFB70D */ bl set_text_add_color
/* 00004AA4 C0210014 */ lfs f1, 0x14(r1)
/* 00004AA8 C0410018 */ lfs f2, 0x18(r1)
/* 00004AAC 4BFFB701 */ bl set_text_pos
/* 00004AB0 7FC3F378 */ mr r3, r30
/* 00004AB4 4BFFB6F9 */ bl sprite_puts
/* 00004AB8 C03F0094 */ lfs f1, 0x94(r31)
/* 00004ABC 387B00A0 */ addi r3, r27, 0xa0
/* 00004AC0 C05F0098 */ lfs f2, 0x98(r31)
/* 00004AC4 4BFFF7F9 */ bl lbl_000042BC
/* 00004AC8 C01F009C */ lfs f0, 0x9c(r31)
/* 00004ACC 3C800000 */ lis r4, lbl_10000000@ha
/* 00004AD0 38840000 */ addi r4, r4, lbl_10000000@l
/* 00004AD4 D01B0054 */ stfs f0, 0x54(r27)
/* 00004AD8 387B0050 */ addi r3, r27, 0x50
/* 00004ADC C0040048 */ lfs f0, 0x48(r4)
/* 00004AE0 D01B0058 */ stfs f0, 0x58(r27)
/* 00004AE4 4BFFB6C9 */ bl nlSprPut
/* 00004AE8 3B000000 */ li r24, 0
/* 00004AEC 5700103A */ slwi r0, r24, 2
/* 00004AF0 7F5B0214 */ add r26, r27, r0
/* 00004AF4 3F804330 */ lis r28, 0x4330
/* 00004AF8 3B5A01A0 */ addi r26, r26, 0x1a0
lbl_00004AFC:
/* 00004AFC 6F008000 */ xoris r0, r24, 0x8000
/* 00004B00 C01F00A0 */ lfs f0, 0xa0(r31)
/* 00004B04 900100DC */ stw r0, 0xdc(r1)
/* 00004B08 3C800000 */ lis r4, lbl_0000C380@ha
/* 00004B0C 38600000 */ li r3, 0
/* 00004B10 D0010014 */ stfs f0, 0x14(r1)
/* 00004B14 938100D8 */ stw r28, 0xd8(r1)
/* 00004B18 C8240000 */ lfd f1, lbl_0000C380@l(r4)
/* 00004B1C C80100D8 */ lfd f0, 0xd8(r1)
/* 00004B20 C85F0080 */ lfd f2, 0x80(r31)
/* 00004B24 FC000828 */ fsub f0, f0, f1
/* 00004B28 C83F0078 */ lfd f1, 0x78(r31)
/* 00004B2C FC020032 */ fmul f0, f2, f0
/* 00004B30 FC01002A */ fadd f0, f1, f0
/* 00004B34 FC000018 */ frsp f0, f0
/* 00004B38 D0010018 */ stfs f0, 0x18(r1)
/* 00004B3C 98610080 */ stb r3, 0x80(r1)
/* 00004B40 98610081 */ stb r3, 0x81(r1)
/* 00004B44 98610082 */ stb r3, 0x82(r1)
/* 00004B48 801D0014 */ lwz r0, 0x14(r29)
/* 00004B4C 7C00C000 */ cmpw r0, r24
/* 00004B50 40820018 */ bne lbl_00004B68
/* 00004B54 380000FF */ li r0, 0xff
/* 00004B58 9801001C */ stb r0, 0x1c(r1)
/* 00004B5C 9801001D */ stb r0, 0x1d(r1)
/* 00004B60 9861001E */ stb r3, 0x1e(r1)
/* 00004B64 48000014 */ b lbl_00004B78
lbl_00004B68:
/* 00004B68 3800008F */ li r0, 0x8f
/* 00004B6C 9801001C */ stb r0, 0x1c(r1)
/* 00004B70 9801001D */ stb r0, 0x1d(r1)
/* 00004B74 9861001E */ stb r3, 0x1e(r1)
lbl_00004B78:
/* 00004B78 7FC3F378 */ mr r3, r30
/* 00004B7C 809A0000 */ lwz r4, 0(r26)
/* 00004B80 4BFFB62D */ bl strcpy
/* 00004B84 4BFFB629 */ bl reset_text_draw_settings
/* 00004B88 88610011 */ lbz r3, 0x11(r1)
/* 00004B8C 4BFFB621 */ bl set_text_font
/* 00004B90 C0210050 */ lfs f1, 0x50(r1)
/* 00004B94 C0410054 */ lfs f2, 0x54(r1)
/* 00004B98 4BFFB615 */ bl set_text_scale
/* 00004B9C 80610084 */ lwz r3, 0x84(r1)
/* 00004BA0 4BFFB60D */ bl func_80071B50
/* 00004BA4 C83F0028 */ lfd f1, 0x28(r31)
/* 00004BA8 C001005C */ lfs f0, 0x5c(r1)
/* 00004BAC FC21002A */ fadd f1, f1, f0
/* 00004BB0 FC200818 */ frsp f1, f1
/* 00004BB4 4BFFB5F9 */ bl func_80071B1C
/* 00004BB8 38600000 */ li r3, 0
/* 00004BBC 4BFFB5F1 */ bl set_text_mul_color
/* 00004BC0 88010081 */ lbz r0, 0x81(r1)
/* 00004BC4 88610080 */ lbz r3, 0x80(r1)
/* 00004BC8 5400402E */ slwi r0, r0, 8
/* 00004BCC 88810082 */ lbz r4, 0x82(r1)
/* 00004BD0 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00004BD4 7C830378 */ or r3, r4, r0
/* 00004BD8 4BFFB5D5 */ bl set_text_add_color
/* 00004BDC C85F0030 */ lfd f2, 0x30(r31)
/* 00004BE0 C0210014 */ lfs f1, 0x14(r1)
/* 00004BE4 C0010018 */ lfs f0, 0x18(r1)
/* 00004BE8 FC22082A */ fadd f1, f2, f1
/* 00004BEC FC42002A */ fadd f2, f2, f0
/* 00004BF0 FC200818 */ frsp f1, f1
/* 00004BF4 FC401018 */ frsp f2, f2
/* 00004BF8 4BFFB5B5 */ bl set_text_pos
/* 00004BFC 7FC3F378 */ mr r3, r30
/* 00004C00 4BFFB5AD */ bl sprite_puts
/* 00004C04 C021005C */ lfs f1, 0x5c(r1)
/* 00004C08 4BFFB5A5 */ bl func_80071B1C
/* 00004C0C 8801001D */ lbz r0, 0x1d(r1)
/* 00004C10 8861001C */ lbz r3, 0x1c(r1)
/* 00004C14 5400402E */ slwi r0, r0, 8
/* 00004C18 8881001E */ lbz r4, 0x1e(r1)
/* 00004C1C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00004C20 7C830378 */ or r3, r4, r0
/* 00004C24 4BFFB589 */ bl set_text_mul_color
/* 00004C28 88010081 */ lbz r0, 0x81(r1)
/* 00004C2C 88610080 */ lbz r3, 0x80(r1)
/* 00004C30 5400402E */ slwi r0, r0, 8
/* 00004C34 88810082 */ lbz r4, 0x82(r1)
/* 00004C38 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00004C3C 7C830378 */ or r3, r4, r0
/* 00004C40 4BFFB56D */ bl set_text_add_color
/* 00004C44 C0210014 */ lfs f1, 0x14(r1)
/* 00004C48 C0410018 */ lfs f2, 0x18(r1)
/* 00004C4C 4BFFB561 */ bl set_text_pos
/* 00004C50 7FC3F378 */ mr r3, r30
/* 00004C54 4BFFB559 */ bl sprite_puts
/* 00004C58 3B180001 */ addi r24, r24, 1
/* 00004C5C 28180007 */ cmplwi r24, 7
/* 00004C60 3B5A0004 */ addi r26, r26, 4
/* 00004C64 4180FE98 */ blt lbl_00004AFC
/* 00004C68 380000FF */ li r0, 0xff
/* 00004C6C 9801001C */ stb r0, 0x1c(r1)
/* 00004C70 3B000000 */ li r24, 0
/* 00004C74 7F19C378 */ mr r25, r24
/* 00004C78 9801001D */ stb r0, 0x1d(r1)
/* 00004C7C 571A1838 */ slwi r26, r24, 3
/* 00004C80 3F804330 */ lis r28, 0x4330
/* 00004C84 9B01001E */ stb r24, 0x1e(r1)
/* 00004C88 9B010080 */ stb r24, 0x80(r1)
/* 00004C8C 9B010081 */ stb r24, 0x81(r1)
/* 00004C90 9B010082 */ stb r24, 0x82(r1)
/* 00004C94 C01F00A4 */ lfs f0, 0xa4(r31)
/* 00004C98 D0010050 */ stfs f0, 0x50(r1)
/* 00004C9C 801D0014 */ lwz r0, 0x14(r29)
/* 00004CA0 54001838 */ slwi r0, r0, 3
/* 00004CA4 7F7B0214 */ add r27, r27, r0
/* 00004CA8 3B7B0338 */ addi r27, r27, 0x338
/* 00004CAC 480001D0 */ b lbl_00004E7C
lbl_00004CB0:
/* 00004CB0 809B0000 */ lwz r4, 0(r27)
/* 00004CB4 7FC3F378 */ mr r3, r30
/* 00004CB8 7C84D02E */ lwzx r4, r4, r26
/* 00004CBC 4BFFB4F1 */ bl strcpy
/* 00004CC0 4BFFB4ED */ bl reset_text_draw_settings
/* 00004CC4 88610011 */ lbz r3, 0x11(r1)
/* 00004CC8 4BFFB4E5 */ bl set_text_font
/* 00004CCC C0210050 */ lfs f1, 0x50(r1)
/* 00004CD0 C0410054 */ lfs f2, 0x54(r1)
/* 00004CD4 4BFFB4D9 */ bl set_text_scale
/* 00004CD8 80610084 */ lwz r3, 0x84(r1)
/* 00004CDC 4BFFB4D1 */ bl func_80071B50
/* 00004CE0 C021005C */ lfs f1, 0x5c(r1)
/* 00004CE4 4BFFB4C9 */ bl func_80071B1C
/* 00004CE8 8801001D */ lbz r0, 0x1d(r1)
/* 00004CEC 8861001C */ lbz r3, 0x1c(r1)
/* 00004CF0 5400402E */ slwi r0, r0, 8
/* 00004CF4 8881001E */ lbz r4, 0x1e(r1)
/* 00004CF8 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00004CFC 7C830378 */ or r3, r4, r0
/* 00004D00 4BFFB4AD */ bl set_text_mul_color
/* 00004D04 88010081 */ lbz r0, 0x81(r1)
/* 00004D08 88610080 */ lbz r3, 0x80(r1)
/* 00004D0C 5400402E */ slwi r0, r0, 8
/* 00004D10 88810082 */ lbz r4, 0x82(r1)
/* 00004D14 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00004D18 7C830378 */ or r3, r4, r0
/* 00004D1C 4BFFB491 */ bl set_text_add_color
/* 00004D20 7FC3F378 */ mr r3, r30
/* 00004D24 4BFFB489 */ bl u_get_text_width
/* 00004D28 C81F0058 */ lfd f0, 0x58(r31)
/* 00004D2C 6F208000 */ xoris r0, r25, 0x8000
/* 00004D30 900100D4 */ stw r0, 0xd4(r1)
/* 00004D34 3C600000 */ lis r3, lbl_0000C380@ha
/* 00004D38 FC000072 */ fmul f0, f0, f1
/* 00004D3C C85F00A8 */ lfd f2, 0xa8(r31)
/* 00004D40 3C800000 */ lis r4, lbl_0000C380@ha
/* 00004D44 938100D0 */ stw r28, 0xd0(r1)
/* 00004D48 FC220028 */ fsub f1, f2, f0
/* 00004D4C C80100D0 */ lfd f0, 0xd0(r1)
/* 00004D50 FC200818 */ frsp f1, f1
/* 00004D54 D0210014 */ stfs f1, 0x14(r1)
/* 00004D58 80BB0004 */ lwz r5, 4(r27)
/* 00004D5C C8230000 */ lfd f1, lbl_0000C380@l(r3)
/* 00004D60 3805FFFF */ addi r0, r5, -1
/* 00004D64 C8440000 */ lfd f2, lbl_0000C380@l(r4)
/* 00004D68 6C008000 */ xoris r0, r0, 0x8000
/* 00004D6C FC000828 */ fsub f0, f0, f1
/* 00004D70 900100DC */ stw r0, 0xdc(r1)
/* 00004D74 C87F00B8 */ lfd f3, 0xb8(r31)
/* 00004D78 938100D8 */ stw r28, 0xd8(r1)
/* 00004D7C C89F00B0 */ lfd f4, 0xb0(r31)
/* 00004D80 C82100D8 */ lfd f1, 0xd8(r1)
/* 00004D84 FC211028 */ fsub f1, f1, f2
/* 00004D88 FC230072 */ fmul f1, f3, f1
/* 00004D8C FC240828 */ fsub f1, f4, f1
/* 00004D90 FC01002A */ fadd f0, f1, f0
/* 00004D94 FC000018 */ frsp f0, f0
/* 00004D98 D0010018 */ stfs f0, 0x18(r1)
/* 00004D9C 4BFFB411 */ bl reset_text_draw_settings
/* 00004DA0 88610011 */ lbz r3, 0x11(r1)
/* 00004DA4 4BFFB409 */ bl set_text_font
/* 00004DA8 C0210050 */ lfs f1, 0x50(r1)
/* 00004DAC C0410054 */ lfs f2, 0x54(r1)
/* 00004DB0 4BFFB3FD */ bl set_text_scale
/* 00004DB4 80610084 */ lwz r3, 0x84(r1)
/* 00004DB8 4BFFB3F5 */ bl func_80071B50
/* 00004DBC C83F0028 */ lfd f1, 0x28(r31)
/* 00004DC0 C001005C */ lfs f0, 0x5c(r1)
/* 00004DC4 FC21002A */ fadd f1, f1, f0
/* 00004DC8 FC200818 */ frsp f1, f1
/* 00004DCC 4BFFB3E1 */ bl func_80071B1C
/* 00004DD0 38600000 */ li r3, 0
/* 00004DD4 4BFFB3D9 */ bl set_text_mul_color
/* 00004DD8 88010081 */ lbz r0, 0x81(r1)
/* 00004DDC 88610080 */ lbz r3, 0x80(r1)
/* 00004DE0 5400402E */ slwi r0, r0, 8
/* 00004DE4 88810082 */ lbz r4, 0x82(r1)
/* 00004DE8 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00004DEC 7C830378 */ or r3, r4, r0
/* 00004DF0 4BFFB3BD */ bl set_text_add_color
/* 00004DF4 C85F0030 */ lfd f2, 0x30(r31)
/* 00004DF8 C0210014 */ lfs f1, 0x14(r1)
/* 00004DFC C0010018 */ lfs f0, 0x18(r1)
/* 00004E00 FC22082A */ fadd f1, f2, f1
/* 00004E04 FC42002A */ fadd f2, f2, f0
/* 00004E08 FC200818 */ frsp f1, f1
/* 00004E0C FC401018 */ frsp f2, f2
/* 00004E10 4BFFB39D */ bl set_text_pos
/* 00004E14 7FC3F378 */ mr r3, r30
/* 00004E18 4BFFB395 */ bl sprite_puts
/* 00004E1C C021005C */ lfs f1, 0x5c(r1)
/* 00004E20 4BFFB38D */ bl func_80071B1C
/* 00004E24 8801001D */ lbz r0, 0x1d(r1)
/* 00004E28 8861001C */ lbz r3, 0x1c(r1)
/* 00004E2C 5400402E */ slwi r0, r0, 8
/* 00004E30 8881001E */ lbz r4, 0x1e(r1)
/* 00004E34 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00004E38 7C830378 */ or r3, r4, r0
/* 00004E3C 4BFFB371 */ bl set_text_mul_color
/* 00004E40 88010081 */ lbz r0, 0x81(r1)
/* 00004E44 88610080 */ lbz r3, 0x80(r1)
/* 00004E48 5400402E */ slwi r0, r0, 8
/* 00004E4C 88810082 */ lbz r4, 0x82(r1)
/* 00004E50 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00004E54 7C830378 */ or r3, r4, r0
/* 00004E58 4BFFB355 */ bl set_text_add_color
/* 00004E5C C0210014 */ lfs f1, 0x14(r1)
/* 00004E60 C0410018 */ lfs f2, 0x18(r1)
/* 00004E64 4BFFB349 */ bl set_text_pos
/* 00004E68 7FC3F378 */ mr r3, r30
/* 00004E6C 4BFFB341 */ bl sprite_puts
/* 00004E70 3B5A0008 */ addi r26, r26, 8
/* 00004E74 3B390020 */ addi r25, r25, 0x20
/* 00004E78 3B180001 */ addi r24, r24, 1
lbl_00004E7C:
/* 00004E7C 801B0004 */ lwz r0, 4(r27)
/* 00004E80 7C180000 */ cmpw r24, r0
/* 00004E84 4180FE2C */ blt lbl_00004CB0
/* 00004E88 4BFFB325 */ bl mathutil_mtxA_from_identity
/* 00004E8C 3C600000 */ lis r3, mathutilData@ha
/* 00004E90 38630000 */ addi r3, r3, mathutilData@l
/* 00004E94 80630000 */ lwz r3, 0(r3)
/* 00004E98 38800000 */ li r4, 0
/* 00004E9C 4BFFB311 */ bl GXLoadPosMtxImm
/* 00004EA0 BB0100E0 */ lmw r24, 0xe0(r1)
/* 00004EA4 80010104 */ lwz r0, 0x104(r1)
/* 00004EA8 38210100 */ addi r1, r1, 0x100
/* 00004EAC 7C0803A6 */ mtlr r0
/* 00004EB0 4E800020 */ blr 
