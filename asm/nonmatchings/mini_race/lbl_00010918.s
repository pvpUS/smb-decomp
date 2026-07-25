/* 00010918 7C0802A6 */ mflr r0
/* 0001091C 3CA00000 */ lis r5, lbl_00015C08@ha
/* 00010920 90010004 */ stw r0, 4(r1)
/* 00010924 9421FF80 */ stwu r1, -0x80(r1)
/* 00010928 DBE10078 */ stfd f31, 0x78(r1)
/* 0001092C 93E10074 */ stw r31, 0x74(r1)
/* 00010930 93C10070 */ stw r30, 0x70(r1)
/* 00010934 3BC50000 */ addi r30, r5, lbl_00015C08@l
/* 00010938 93A1006C */ stw r29, 0x6c(r1)
/* 0001093C 93810068 */ stw r28, 0x68(r1)
/* 00010940 7C7C1B78 */ mr r28, r3
/* 00010944 80030048 */ lwz r0, 0x48(r3)
/* 00010948 3C600000 */ lis r3, lbl_10001AE0@ha
/* 0001094C A8DC0010 */ lha r6, 0x10(r28)
/* 00010950 5404103A */ slwi r4, r0, 2
/* 00010954 38030000 */ addi r0, r3, lbl_10001AE0@l
/* 00010958 7C602214 */ add r3, r0, r4
/* 0001095C 3C800000 */ lis r4, lbl_00013C48@ha
/* 00010960 83A30000 */ lwz r29, 0(r3)
/* 00010964 2C060014 */ cmpwi r6, 0x14
/* 00010968 3BE40000 */ addi r31, r4, lbl_00013C48@l
/* 0001096C 418101E0 */ bgt lbl_00010B4C
/* 00010970 6CC08000 */ xoris r0, r6, 0x8000
/* 00010974 C01F00AC */ lfs f0, 0xac(r31)
/* 00010978 90010064 */ stw r0, 0x64(r1)
/* 0001097C 3C004330 */ lis r0, 0x4330
/* 00010980 3C600000 */ lis r3, lbl_00013C70@ha
/* 00010984 C87F01D8 */ lfd f3, 0x1d8(r31)
/* 00010988 90010060 */ stw r0, 0x60(r1)
/* 0001098C C8430000 */ lfd f2, lbl_00013C70@l(r3)
/* 00010990 C8210060 */ lfd f1, 0x60(r1)
/* 00010994 EC211028 */ fsubs f1, f1, f2
/* 00010998 EC010024 */ fdivs f0, f1, f0
/* 0001099C FFE30028 */ fsub f31, f3, f0
/* 000109A0 FFE0F818 */ frsp f31, f31
/* 000109A4 4BFEF7D9 */ bl reset_text_draw_settings
/* 000109A8 3C600020 */ lis r3, 0x20
/* 000109AC 4BFEF7D1 */ bl func_80071B50
/* 000109B0 FC20F890 */ fmr f1, f31
/* 000109B4 4BFEF7C9 */ bl set_text_opacity
/* 000109B8 C3FC0008 */ lfs f31, 8(r28)
/* 000109BC 3C600100 */ lis r3, 0x100
/* 000109C0 C01F0008 */ lfs f0, 8(r31)
/* 000109C4 38A3FFFF */ addi r5, r3, -1
/* 000109C8 39000000 */ li r8, 0
/* 000109CC D001001C */ stfs f0, 0x1c(r1)
/* 000109D0 38E0FFFF */ li r7, -1
/* 000109D4 38C00005 */ li r6, 5
/* 000109D8 C01F0008 */ lfs f0, 8(r31)
/* 000109DC 3C80FFFF */ lis r4, 0xffff
/* 000109E0 38000717 */ li r0, 0x717
/* 000109E4 D0010020 */ stfs f0, 0x20(r1)
/* 000109E8 3861000C */ addi r3, r1, 0xc
/* 000109EC C01F0018 */ lfs f0, 0x18(r31)
/* 000109F0 D0010028 */ stfs f0, 0x28(r1)
/* 000109F4 D0010024 */ stfs f0, 0x24(r1)
/* 000109F8 C01F0008 */ lfs f0, 8(r31)
/* 000109FC D0010030 */ stfs f0, 0x30(r1)
/* 00010A00 D001002C */ stfs f0, 0x2c(r1)
/* 00010A04 91010034 */ stw r8, 0x34(r1)
/* 00010A08 90E1003C */ stw r7, 0x3c(r1)
/* 00010A0C 90C10040 */ stw r6, 0x40(r1)
/* 00010A10 C01F0008 */ lfs f0, 8(r31)
/* 00010A14 D0010038 */ stfs f0, 0x38(r1)
/* 00010A18 90A10044 */ stw r5, 0x44(r1)
/* 00010A1C 91010048 */ stw r8, 0x48(r1)
/* 00010A20 90810044 */ stw r4, 0x44(r1)
/* 00010A24 9001000C */ stw r0, 0xc(r1)
/* 00010A28 C01C0004 */ lfs f0, 4(r28)
/* 00010A2C D0010010 */ stfs f0, 0x10(r1)
/* 00010A30 D3E10014 */ stfs f31, 0x14(r1)
/* 00010A34 C01C004C */ lfs f0, 0x4c(r28)
/* 00010A38 D0010018 */ stfs f0, 0x18(r1)
/* 00010A3C 4BFEF741 */ bl nlSprPut
/* 00010A40 C03C004C */ lfs f1, 0x4c(r28)
/* 00010A44 4BFEF739 */ bl func_80071B1C
/* 00010A48 38600048 */ li r3, 0x48
/* 00010A4C 4BFEF731 */ bl set_text_font
/* 00010A50 C03F00E4 */ lfs f1, 0xe4(r31)
/* 00010A54 C01C0004 */ lfs f0, 4(r28)
/* 00010A58 EC41F82A */ fadds f2, f1, f31
/* 00010A5C EC21002A */ fadds f1, f1, f0
/* 00010A60 4BFEF71D */ bl set_text_pos
/* 00010A64 A09D0020 */ lhz r4, 0x20(r29)
/* 00010A68 387E00A0 */ addi r3, r30, 0xa0
/* 00010A6C 4CC63182 */ crclr 6
/* 00010A70 4BFEF70D */ bl sprite_printf
/* 00010A74 38600045 */ li r3, 0x45
/* 00010A78 4BFEF705 */ bl set_text_font
/* 00010A7C C01F001C */ lfs f0, 0x1c(r31)
/* 00010A80 C03F00F0 */ lfs f1, 0xf0(r31)
/* 00010A84 EFE0F82A */ fadds f31, f0, f31
/* 00010A88 C01C0004 */ lfs f0, 4(r28)
/* 00010A8C EC21002A */ fadds f1, f1, f0
/* 00010A90 FC40F890 */ fmr f2, f31
/* 00010A94 4BFEF6E9 */ bl set_text_pos
/* 00010A98 801D0014 */ lwz r0, 0x14(r29)
/* 00010A9C 540006B5 */ rlwinm. r0, r0, 0, 0x1a, 0x1a
/* 00010AA0 4182001C */ beq lbl_00010ABC
/* 00010AA4 A09D0000 */ lhz r4, 0(r29)
/* 00010AA8 387E0118 */ addi r3, r30, 0x118
/* 00010AAC 4CC63182 */ crclr 6
/* 00010AB0 38840001 */ addi r4, r4, 1
/* 00010AB4 4BFEF6C9 */ bl sprite_printf
/* 00010AB8 48000028 */ b lbl_00010AE0
lbl_00010ABC:
/* 00010ABC A01D0000 */ lhz r0, 0(r29)
/* 00010AC0 5400103A */ slwi r0, r0, 2
/* 00010AC4 7C7E002E */ lwzx r3, r30, r0
/* 00010AC8 4BFEF6B5 */ bl set_text_mul_color
/* 00010ACC A09D0000 */ lhz r4, 0(r29)
/* 00010AD0 387E0120 */ addi r3, r30, 0x120
/* 00010AD4 4CC63182 */ crclr 6
/* 00010AD8 38840001 */ addi r4, r4, 1
/* 00010ADC 4BFEF6A1 */ bl sprite_printf
lbl_00010AE0:
/* 00010AE0 38600045 */ li r3, 0x45
/* 00010AE4 4BFEF699 */ bl set_text_font
/* 00010AE8 C03F00F0 */ lfs f1, 0xf0(r31)
/* 00010AEC FC40F890 */ fmr f2, f31
/* 00010AF0 C01C0004 */ lfs f0, 4(r28)
/* 00010AF4 C07F01EC */ lfs f3, 0x1ec(r31)
/* 00010AF8 EC01002A */ fadds f0, f1, f0
/* 00010AFC EC23002A */ fadds f1, f3, f0
/* 00010B00 4BFEF67D */ bl set_text_pos
/* 00010B04 A01D0000 */ lhz r0, 0(r29)
/* 00010B08 3C600000 */ lis r3, lbl_10000048@ha
/* 00010B0C 3B830000 */ addi r28, r3, lbl_10000048@l
/* 00010B10 4CC63182 */ crclr 6
/* 00010B14 5400083C */ slwi r0, r0, 1
/* 00010B18 7C7C0214 */ add r3, r28, r0
/* 00010B1C A8830000 */ lha r4, 0(r3)
/* 00010B20 387E012C */ addi r3, r30, 0x12c
/* 00010B24 4BFEF659 */ bl sprite_printf
/* 00010B28 A01D0000 */ lhz r0, 0(r29)
/* 00010B2C 5400083C */ slwi r0, r0, 1
/* 00010B30 7C7C0214 */ add r3, r28, r0
/* 00010B34 A8030000 */ lha r0, 0(r3)
/* 00010B38 2C000001 */ cmpwi r0, 1
/* 00010B3C 41820010 */ beq lbl_00010B4C
/* 00010B40 387E0138 */ addi r3, r30, 0x138
/* 00010B44 4CC63182 */ crclr 6
/* 00010B48 4BFEF635 */ bl sprite_printf
lbl_00010B4C:
/* 00010B4C 80010084 */ lwz r0, 0x84(r1)
/* 00010B50 CBE10078 */ lfd f31, 0x78(r1)
/* 00010B54 83E10074 */ lwz r31, 0x74(r1)
/* 00010B58 7C0803A6 */ mtlr r0
/* 00010B5C 83C10070 */ lwz r30, 0x70(r1)
/* 00010B60 83A1006C */ lwz r29, 0x6c(r1)
/* 00010B64 83810068 */ lwz r28, 0x68(r1)
/* 00010B68 38210080 */ addi r1, r1, 0x80
/* 00010B6C 4E800020 */ blr 
