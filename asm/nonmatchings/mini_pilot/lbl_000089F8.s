/* 000089F8 7C0802A6 */ mflr r0
/* 000089FC 3CA00000 */ lis r5, lbl_0000C360@ha
/* 00008A00 90010004 */ stw r0, 4(r1)
/* 00008A04 3C800000 */ lis r4, currentBall@ha
/* 00008A08 38C00000 */ li r6, 0
/* 00008A0C 9421FF68 */ stwu r1, -0x98(r1)
/* 00008A10 38000B09 */ li r0, 0xb09
/* 00008A14 DBE10090 */ stfd f31, 0x90(r1)
/* 00008A18 DBC10088 */ stfd f30, 0x88(r1)
/* 00008A1C BF610074 */ stmw r27, 0x74(r1)
/* 00008A20 3BC50000 */ addi r30, r5, lbl_0000C360@l
/* 00008A24 38A0FFFF */ li r5, -1
/* 00008A28 83A40000 */ lwz r29, currentBall@l(r4)
/* 00008A2C 38800005 */ li r4, 5
/* 00008A30 C3E30004 */ lfs f31, 4(r3)
/* 00008A34 C3C30008 */ lfs f30, 8(r3)
/* 00008A38 3C600100 */ lis r3, 0x100
/* 00008A3C C01E0054 */ lfs f0, 0x54(r30)
/* 00008A40 3BE3FFFF */ addi r31, r3, -1
/* 00008A44 3861000C */ addi r3, r1, 0xc
/* 00008A48 D001001C */ stfs f0, 0x1c(r1)
/* 00008A4C C01E0054 */ lfs f0, 0x54(r30)
/* 00008A50 D0010020 */ stfs f0, 0x20(r1)
/* 00008A54 C01E0098 */ lfs f0, 0x98(r30)
/* 00008A58 D0010028 */ stfs f0, 0x28(r1)
/* 00008A5C D0010024 */ stfs f0, 0x24(r1)
/* 00008A60 C01E0054 */ lfs f0, 0x54(r30)
/* 00008A64 D0010030 */ stfs f0, 0x30(r1)
/* 00008A68 D001002C */ stfs f0, 0x2c(r1)
/* 00008A6C 90C10034 */ stw r6, 0x34(r1)
/* 00008A70 90A1003C */ stw r5, 0x3c(r1)
/* 00008A74 90810040 */ stw r4, 0x40(r1)
/* 00008A78 C01E0054 */ lfs f0, 0x54(r30)
/* 00008A7C D0010038 */ stfs f0, 0x38(r1)
/* 00008A80 93E10044 */ stw r31, 0x44(r1)
/* 00008A84 90C10048 */ stw r6, 0x48(r1)
/* 00008A88 9001000C */ stw r0, 0xc(r1)
/* 00008A8C C81E0080 */ lfd f0, 0x80(r30)
/* 00008A90 FC00F82A */ fadd f0, f0, f31
/* 00008A94 FC000018 */ frsp f0, f0
/* 00008A98 D0010010 */ stfs f0, 0x10(r1)
/* 00008A9C C81E00B8 */ lfd f0, 0xb8(r30)
/* 00008AA0 FC00F02A */ fadd f0, f0, f30
/* 00008AA4 FC000018 */ frsp f0, f0
/* 00008AA8 D0010014 */ stfs f0, 0x14(r1)
/* 00008AAC C01E009C */ lfs f0, 0x9c(r30)
/* 00008AB0 D0010018 */ stfs f0, 0x18(r1)
/* 00008AB4 4BFF7699 */ bl nlSprPut
/* 00008AB8 3C600000 */ lis r3, modeCtrl@ha
/* 00008ABC C85E00C0 */ lfd f2, 0xc0(r30)
/* 00008AC0 38630000 */ addi r3, r3, modeCtrl@l
/* 00008AC4 8003002C */ lwz r0, 0x2c(r3)
/* 00008AC8 3B63002C */ addi r27, r3, 0x2c
/* 00008ACC 3C600000 */ lis r3, lbl_0000C3C0@ha
/* 00008AD0 6C008000 */ xoris r0, r0, 0x8000
/* 00008AD4 C8230000 */ lfd f1, lbl_0000C3C0@l(r3)
/* 00008AD8 9001006C */ stw r0, 0x6c(r1)
/* 00008ADC 3F804330 */ lis r28, 0x4330
/* 00008AE0 93810068 */ stw r28, 0x68(r1)
/* 00008AE4 C8010068 */ lfd f0, 0x68(r1)
/* 00008AE8 FC000828 */ fsub f0, f0, f1
/* 00008AEC FC020032 */ fmul f0, f2, f0
/* 00008AF0 FC000018 */ frsp f0, f0
/* 00008AF4 D0010024 */ stfs f0, 0x24(r1)
/* 00008AF8 C83E00C0 */ lfd f1, 0xc0(r30)
/* 00008AFC C0010024 */ lfs f0, 0x24(r1)
/* 00008B00 FC01002A */ fadd f0, f1, f0
/* 00008B04 FC000018 */ frsp f0, f0
/* 00008B08 D001002C */ stfs f0, 0x2c(r1)
/* 00008B0C 887D014A */ lbz r3, 0x14a(r29)
/* 00008B10 48002385 */ bl lbl_0000AE94
/* 00008B14 6C608000 */ xoris r0, r3, 0x8000
/* 00008B18 C81E00C0 */ lfd f0, 0xc0(r30)
/* 00008B1C 90010064 */ stw r0, 0x64(r1)
/* 00008B20 3C600000 */ lis r3, lbl_0000C3C0@ha
/* 00008B24 C8430000 */ lfd f2, lbl_0000C3C0@l(r3)
/* 00008B28 38000B0C */ li r0, 0xb0c
/* 00008B2C 93810060 */ stw r28, 0x60(r1)
/* 00008B30 3861000C */ addi r3, r1, 0xc
/* 00008B34 C8210060 */ lfd f1, 0x60(r1)
/* 00008B38 FC211028 */ fsub f1, f1, f2
/* 00008B3C FC000072 */ fmul f0, f0, f1
/* 00008B40 FC000018 */ frsp f0, f0
/* 00008B44 D0010028 */ stfs f0, 0x28(r1)
/* 00008B48 C83E00C0 */ lfd f1, 0xc0(r30)
/* 00008B4C C0010028 */ lfs f0, 0x28(r1)
/* 00008B50 FC01002A */ fadd f0, f1, f0
/* 00008B54 FC000018 */ frsp f0, f0
/* 00008B58 D0010030 */ stfs f0, 0x30(r1)
/* 00008B5C C01E00C8 */ lfs f0, 0xc8(r30)
/* 00008B60 D001001C */ stfs f0, 0x1c(r1)
/* 00008B64 C01E00C8 */ lfs f0, 0xc8(r30)
/* 00008B68 D0010020 */ stfs f0, 0x20(r1)
/* 00008B6C 9001000C */ stw r0, 0xc(r1)
/* 00008B70 D3E10010 */ stfs f31, 0x10(r1)
/* 00008B74 D3C10014 */ stfs f30, 0x14(r1)
/* 00008B78 C01E009C */ lfs f0, 0x9c(r30)
/* 00008B7C D0010018 */ stfs f0, 0x18(r1)
/* 00008B80 4BFF75CD */ bl nlSprPut
/* 00008B84 4BFF75C9 */ bl reset_text_draw_settings
/* 00008B88 38600053 */ li r3, 0x53
/* 00008B8C 4BFF75C1 */ bl set_text_font
/* 00008B90 C03E0008 */ lfs f1, 8(r30)
/* 00008B94 4BFF75B9 */ bl func_80071B1C
/* 00008B98 38600000 */ li r3, 0
/* 00008B9C 4BFF75B1 */ bl set_text_mul_color
/* 00008BA0 C81E00D8 */ lfd f0, 0xd8(r30)
/* 00008BA4 C85E00D0 */ lfd f2, 0xd0(r30)
/* 00008BA8 FFC0F02A */ fadd f30, f0, f30
/* 00008BAC FC22F82A */ fadd f1, f2, f31
/* 00008BB0 FC42F02A */ fadd f2, f2, f30
/* 00008BB4 FC200818 */ frsp f1, f1
/* 00008BB8 FC401018 */ frsp f2, f2
/* 00008BBC 4BFF7591 */ bl set_text_pos
/* 00008BC0 801B0000 */ lwz r0, 0(r27)
/* 00008BC4 3C600000 */ lis r3, lbl_10000044@ha
/* 00008BC8 3C800000 */ lis r4, lbl_0000D328@ha
/* 00008BCC 4CC63182 */ crclr 6
/* 00008BD0 5400103A */ slwi r0, r0, 2
/* 00008BD4 3BA30000 */ addi r29, r3, lbl_10000044@l
/* 00008BD8 7C7D0214 */ add r3, r29, r0
/* 00008BDC 3B840000 */ addi r28, r4, lbl_0000D328@l
/* 00008BE0 80830000 */ lwz r4, 0(r3)
/* 00008BE4 7F83E378 */ mr r3, r28
/* 00008BE8 4BFF7565 */ bl sprite_printf
/* 00008BEC C03E009C */ lfs f1, 0x9c(r30)
/* 00008BF0 4BFF755D */ bl func_80071B1C
/* 00008BF4 7FE3FB78 */ mr r3, r31
/* 00008BF8 4BFF7555 */ bl set_text_mul_color
/* 00008BFC FC20F890 */ fmr f1, f31
/* 00008C00 FC40F018 */ frsp f2, f30
/* 00008C04 4BFF7549 */ bl set_text_pos
/* 00008C08 801B0000 */ lwz r0, 0(r27)
/* 00008C0C 387C0000 */ addi r3, r28, 0
/* 00008C10 4CC63182 */ crclr 6
/* 00008C14 5400103A */ slwi r0, r0, 2
/* 00008C18 7C9D0214 */ add r4, r29, r0
/* 00008C1C 80840000 */ lwz r4, 0(r4)
/* 00008C20 4BFF752D */ bl sprite_printf
/* 00008C24 BB610074 */ lmw r27, 0x74(r1)
/* 00008C28 8001009C */ lwz r0, 0x9c(r1)
/* 00008C2C CBE10090 */ lfd f31, 0x90(r1)
/* 00008C30 CBC10088 */ lfd f30, 0x88(r1)
/* 00008C34 7C0803A6 */ mtlr r0
/* 00008C38 38210098 */ addi r1, r1, 0x98
/* 00008C3C 4E800020 */ blr 
