/* 00011A6C 7C0802A6 */ mflr r0
/* 00011A70 2C0300B4 */ cmpwi r3, 0xb4
/* 00011A74 90010004 */ stw r0, 4(r1)
/* 00011A78 3CC00000 */ lis r6, lbl_100001C8@ha
/* 00011A7C 3CA00000 */ lis r5, lbl_00026E28@ha
/* 00011A80 9421FEA0 */ stwu r1, -0x160(r1)
/* 00011A84 3C800000 */ lis r4, lbl_00026550@ha
/* 00011A88 DBE10158 */ stfd f31, 0x158(r1)
/* 00011A8C DBC10150 */ stfd f30, 0x150(r1)
/* 00011A90 DBA10148 */ stfd f29, 0x148(r1)
/* 00011A94 DB810140 */ stfd f28, 0x140(r1)
/* 00011A98 93E1013C */ stw r31, 0x13c(r1)
/* 00011A9C 3BE40000 */ addi r31, r4, lbl_00026550@l
/* 00011AA0 93C10138 */ stw r30, 0x138(r1)
/* 00011AA4 3BC50000 */ addi r30, r5, lbl_00026E28@l
/* 00011AA8 93A10134 */ stw r29, 0x134(r1)
/* 00011AAC 93810130 */ stw r28, 0x130(r1)
/* 00011AB0 3B860000 */ addi r28, r6, lbl_100001C8@l
/* 00011AB4 40820010 */ bne lbl_00011AC4
/* 00011AB8 38000000 */ li r0, 0
/* 00011ABC 901C0040 */ stw r0, 0x40(r28)
/* 00011AC0 48000114 */ b lbl_00011BD4
lbl_00011AC4:
/* 00011AC4 6C608000 */ xoris r0, r3, 0x8000
/* 00011AC8 C87F0158 */ lfd f3, 0x158(r31)
/* 00011ACC 9001012C */ stw r0, 0x12c(r1)
/* 00011AD0 3FA04330 */ lis r29, 0x4330
/* 00011AD4 3C600000 */ lis r3, lbl_000266F8@ha
/* 00011AD8 93A10128 */ stw r29, 0x128(r1)
/* 00011ADC C8230000 */ lfd f1, lbl_000266F8@l(r3)
/* 00011AE0 C8010128 */ lfd f0, 0x128(r1)
/* 00011AE4 FC000828 */ fsub f0, f0, f1
/* 00011AE8 FC001840 */ fcmpo cr0, f0, f3
/* 00011AEC 408100B0 */ ble lbl_00011B9C
/* 00011AF0 801C0040 */ lwz r0, 0x40(r28)
/* 00011AF4 3C600000 */ lis r3, lbl_000266A0@ha
/* 00011AF8 C8630000 */ lfd f3, lbl_000266A0@l(r3)
/* 00011AFC 9001012C */ stw r0, 0x12c(r1)
/* 00011B00 C03F0164 */ lfs f1, 0x164(r31)
/* 00011B04 93A10128 */ stw r29, 0x128(r1)
/* 00011B08 C09F0160 */ lfs f4, 0x160(r31)
/* 00011B0C C8410128 */ lfd f2, 0x128(r1)
/* 00011B10 C01F0168 */ lfs f0, 0x168(r31)
/* 00011B14 EC421828 */ fsubs f2, f2, f3
/* 00011B18 EC220824 */ fdivs f1, f2, f1
/* 00011B1C EC240072 */ fmuls f1, f4, f1
/* 00011B20 EC010028 */ fsubs f0, f1, f0
/* 00011B24 FC00001E */ fctiwz f0, f0
/* 00011B28 D8010120 */ stfd f0, 0x120(r1)
/* 00011B2C 80610124 */ lwz r3, 0x124(r1)
/* 00011B30 4BFEE6A1 */ bl mathutil_sin
/* 00011B34 80BC0040 */ lwz r5, 0x40(r28)
/* 00011B38 3C800000 */ lis r4, lbl_000266A0@ha
/* 00011B3C 3C600000 */ lis r3, lbl_000266A0@ha
/* 00011B40 C8A40000 */ lfd f5, lbl_000266A0@l(r4)
/* 00011B44 90A1011C */ stw r5, 0x11c(r1)
/* 00011B48 C8830000 */ lfd f4, lbl_000266A0@l(r3)
/* 00011B4C 38050001 */ addi r0, r5, 1
/* 00011B50 90A10114 */ stw r5, 0x114(r1)
/* 00011B54 C05F016C */ lfs f2, 0x16c(r31)
/* 00011B58 93A10118 */ stw r29, 0x118(r1)
/* 00011B5C C0DF0134 */ lfs f6, 0x134(r31)
/* 00011B60 93A10110 */ stw r29, 0x110(r1)
/* 00011B64 C8010118 */ lfd f0, 0x118(r1)
/* 00011B68 C8610110 */ lfd f3, 0x110(r1)
/* 00011B6C ECA02828 */ fsubs f5, f0, f5
/* 00011B70 C81F0140 */ lfd f0, 0x140(r31)
/* 00011B74 EC632028 */ fsubs f3, f3, f4
/* 00011B78 901C0040 */ stw r0, 0x40(r28)
/* 00011B7C EC6500F2 */ fmuls f3, f5, f3
/* 00011B80 EC431024 */ fdivs f2, f3, f2
/* 00011B84 EC46102A */ fadds f2, f6, f2
/* 00011B88 EC211024 */ fdivs f1, f1, f2
/* 00011B8C FFC0082A */ fadd f30, f0, f1
/* 00011B90 FFC0F018 */ frsp f30, f30
/* 00011B94 FFE0F090 */ fmr f31, f30
/* 00011B98 4800003C */ b lbl_00011BD4
lbl_00011B9C:
/* 00011B9C 90010114 */ stw r0, 0x114(r1)
/* 00011BA0 3C600000 */ lis r3, lbl_000266F8@ha
/* 00011BA4 C8230000 */ lfd f1, lbl_000266F8@l(r3)
/* 00011BA8 93A10110 */ stw r29, 0x110(r1)
/* 00011BAC C85F0140 */ lfd f2, 0x140(r31)
/* 00011BB0 C8010110 */ lfd f0, 0x110(r1)
/* 00011BB4 C3FF0134 */ lfs f31, 0x134(r31)
/* 00011BB8 FC000828 */ fsub f0, f0, f1
/* 00011BBC FC030028 */ fsub f0, f3, f0
/* 00011BC0 FC000032 */ fmul f0, f0, f0
/* 00011BC4 FC02002A */ fadd f0, f2, f0
/* 00011BC8 FC000018 */ frsp f0, f0
/* 00011BCC FFC20024 */ fdiv f30, f2, f0
/* 00011BD0 FFC0F018 */ frsp f30, f30
lbl_00011BD4:
/* 00011BD4 4BFEE5FD */ bl reset_text_draw_settings
/* 00011BD8 38600009 */ li r3, 9
/* 00011BDC 4BFEE5F5 */ bl set_text_font
/* 00011BE0 FC20F890 */ fmr f1, f31
/* 00011BE4 FC40F090 */ fmr f2, f30
/* 00011BE8 4BFEE5E9 */ bl set_text_scale
/* 00011BEC C03F0174 */ lfs f1, 0x174(r31)
/* 00011BF0 C01F017C */ lfs f0, 0x17c(r31)
/* 00011BF4 EFA107F2 */ fmuls f29, f1, f31
/* 00011BF8 C03F0170 */ lfs f1, 0x170(r31)
/* 00011BFC EF8007B2 */ fmuls f28, f0, f30
/* 00011C00 C01F0178 */ lfs f0, 0x178(r31)
/* 00011C04 EC21E828 */ fsubs f1, f1, f29
/* 00011C08 EC40E028 */ fsubs f2, f0, f28
/* 00011C0C 4BFEE5C5 */ bl set_text_pos
/* 00011C10 3C600000 */ lis r3, modeCtrl@ha
/* 00011C14 38630000 */ addi r3, r3, modeCtrl@l
/* 00011C18 3B830024 */ addi r28, r3, 0x24
/* 00011C1C 80030024 */ lwz r0, 0x24(r3)
/* 00011C20 2C000001 */ cmpwi r0, 1
/* 00011C24 41820088 */ beq lbl_00011CAC
/* 00011C28 8003002C */ lwz r0, 0x2c(r3)
/* 00011C2C 2C000002 */ cmpwi r0, 2
/* 00011C30 41820050 */ beq lbl_00011C80
/* 00011C34 40800014 */ bge lbl_00011C48
/* 00011C38 2C000000 */ cmpwi r0, 0
/* 00011C3C 41820018 */ beq lbl_00011C54
/* 00011C40 40800028 */ bge lbl_00011C68
/* 00011C44 48000068 */ b lbl_00011CAC
lbl_00011C48:
/* 00011C48 2C000004 */ cmpwi r0, 4
/* 00011C4C 40800060 */ bge lbl_00011CAC
/* 00011C50 48000048 */ b lbl_00011C98
lbl_00011C54:
/* 00011C54 3C6000FF */ lis r3, 0xff
/* 00011C58 4BFEE579 */ bl set_text_mul_color
/* 00011C5C 387E39D4 */ addi r3, r30, 0x39d4
/* 00011C60 4BFEE571 */ bl sprite_puts
/* 00011C64 48000048 */ b lbl_00011CAC
lbl_00011C68:
/* 00011C68 3C60002C */ lis r3, 0x2c
/* 00011C6C 386365FF */ addi r3, r3, 0x65ff
/* 00011C70 4BFEE561 */ bl set_text_mul_color
/* 00011C74 387E39D8 */ addi r3, r30, 0x39d8
/* 00011C78 4BFEE559 */ bl sprite_puts
/* 00011C7C 48000030 */ b lbl_00011CAC
lbl_00011C80:
/* 00011C80 3C6000FC */ lis r3, 0xfc
/* 00011C84 3863FF2C */ addi r3, r3, -212
/* 00011C88 4BFEE549 */ bl set_text_mul_color
/* 00011C8C 387E39DC */ addi r3, r30, 0x39dc
/* 00011C90 4BFEE541 */ bl sprite_puts
/* 00011C94 48000018 */ b lbl_00011CAC
lbl_00011C98:
/* 00011C98 3C60002D */ lis r3, 0x2d
/* 00011C9C 3863FF57 */ addi r3, r3, -169
/* 00011CA0 4BFEE531 */ bl set_text_mul_color
/* 00011CA4 387E39E0 */ addi r3, r30, 0x39e0
/* 00011CA8 4BFEE529 */ bl sprite_puts
lbl_00011CAC:
/* 00011CAC 3C600100 */ lis r3, 0x100
/* 00011CB0 3863FFFF */ addi r3, r3, -1
/* 00011CB4 4BFEE51D */ bl set_text_mul_color
/* 00011CB8 C83F0188 */ lfd f1, 0x188(r31)
/* 00011CBC C01F0190 */ lfs f0, 0x190(r31)
/* 00011CC0 FC210772 */ fmul f1, f1, f29
/* 00011CC4 C87F0180 */ lfd f3, 0x180(r31)
/* 00011CC8 C05F0178 */ lfs f2, 0x178(r31)
/* 00011CCC EC0007B2 */ fmuls f0, f0, f30
/* 00011CD0 FC230828 */ fsub f1, f3, f1
/* 00011CD4 EC420028 */ fsubs f2, f2, f0
/* 00011CD8 FC200818 */ frsp f1, f1
/* 00011CDC 4BFEE4F5 */ bl set_text_pos
/* 00011CE0 387E39E4 */ addi r3, r30, 0x39e4
/* 00011CE4 4BFEE4ED */ bl sprite_puts
/* 00011CE8 801C0000 */ lwz r0, 0(r28)
/* 00011CEC 2C000001 */ cmpwi r0, 1
/* 00011CF0 4182008C */ beq lbl_00011D7C
/* 00011CF4 C83F01A0 */ lfd f1, 0x1a0(r31)
/* 00011CF8 C01F0178 */ lfs f0, 0x178(r31)
/* 00011CFC FC210772 */ fmul f1, f1, f29
/* 00011D00 C87F0198 */ lfd f3, 0x198(r31)
/* 00011D04 C89F0180 */ lfd f4, 0x180(r31)
/* 00011D08 EC40E02A */ fadds f2, f0, f28
/* 00011D0C FC030072 */ fmul f0, f3, f1
/* 00011D10 FC240028 */ fsub f1, f4, f0
/* 00011D14 FC200818 */ frsp f1, f1
/* 00011D18 4BFEE4B9 */ bl set_text_pos
/* 00011D1C 3C6000E0 */ lis r3, 0xe0
/* 00011D20 3863AFFF */ addi r3, r3, -20481
/* 00011D24 4BFEE4AD */ bl set_text_mul_color
/* 00011D28 C81F01A0 */ lfd f0, 0x1a0(r31)
/* 00011D2C FC2007F2 */ fmul f1, f0, f31
/* 00011D30 FC4007B2 */ fmul f2, f0, f30
/* 00011D34 FC200818 */ frsp f1, f1
/* 00011D38 FC401018 */ frsp f2, f2
/* 00011D3C 4BFEE495 */ bl set_text_scale
/* 00011D40 3C600000 */ lis r3, modeCtrl@ha
/* 00011D44 4CC63182 */ crclr 6
/* 00011D48 38630000 */ addi r3, r3, modeCtrl@l
/* 00011D4C 8083002C */ lwz r4, 0x2c(r3)
/* 00011D50 3C600000 */ lis r3, playerControllerIDs@ha
/* 00011D54 38030000 */ addi r0, r3, playerControllerIDs@l
/* 00011D58 5483103A */ slwi r3, r4, 2
/* 00011D5C 7C601A14 */ add r3, r0, r3
/* 00011D60 80A30000 */ lwz r5, 0(r3)
/* 00011D64 3861000C */ addi r3, r1, 0xc
/* 00011D68 389E39EC */ addi r4, r30, 0x39ec
/* 00011D6C 38A50001 */ addi r5, r5, 1
/* 00011D70 4BFEE461 */ bl sprintf
/* 00011D74 3861000C */ addi r3, r1, 0xc
/* 00011D78 4BFEE459 */ bl sprite_puts
lbl_00011D7C:
/* 00011D7C 80010164 */ lwz r0, 0x164(r1)
/* 00011D80 CBE10158 */ lfd f31, 0x158(r1)
/* 00011D84 CBC10150 */ lfd f30, 0x150(r1)
/* 00011D88 7C0803A6 */ mtlr r0
/* 00011D8C CBA10148 */ lfd f29, 0x148(r1)
/* 00011D90 CB810140 */ lfd f28, 0x140(r1)
/* 00011D94 83E1013C */ lwz r31, 0x13c(r1)
/* 00011D98 83C10138 */ lwz r30, 0x138(r1)
/* 00011D9C 83A10134 */ lwz r29, 0x134(r1)
/* 00011DA0 83810130 */ lwz r28, 0x130(r1)
/* 00011DA4 38210160 */ addi r1, r1, 0x160
/* 00011DA8 4E800020 */ blr 
