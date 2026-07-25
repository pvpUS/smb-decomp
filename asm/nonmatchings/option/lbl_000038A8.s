/* 000038A8 7C0802A6 */ mflr r0
/* 000038AC 3C600000 */ lis r3, lbl_10000000@ha
/* 000038B0 90010004 */ stw r0, 4(r1)
/* 000038B4 3C800000 */ lis r4, lbl_0000C230@ha
/* 000038B8 9421FF80 */ stwu r1, -0x80(r1)
/* 000038BC BF210064 */ stmw r25, 0x64(r1)
/* 000038C0 3BC30000 */ addi r30, r3, lbl_10000000@l
/* 000038C4 3C600000 */ lis r3, lbl_0000C640@ha
/* 000038C8 3BA40000 */ addi r29, r4, lbl_0000C230@l
/* 000038CC 3BE30000 */ addi r31, r3, lbl_0000C640@l
/* 000038D0 801E0078 */ lwz r0, 0x78(r30)
/* 000038D4 2C000000 */ cmpwi r0, 0
/* 000038D8 4081000C */ ble lbl_000038E4
/* 000038DC 2C000003 */ cmpwi r0, 3
/* 000038E0 4180029C */ blt lbl_00003B7C
lbl_000038E4:
/* 000038E4 A01E6E9C */ lhz r0, 0x6e9c(r30)
/* 000038E8 3C800100 */ lis r4, 0x100
/* 000038EC 3B64FFFF */ addi r27, r4, -1
/* 000038F0 540506B5 */ rlwinm. r5, r0, 0, 0x1a, 0x1a
/* 000038F4 3B800000 */ li r28, 0
/* 000038F8 41820010 */ beq lbl_00003908
/* 000038FC 3C600040 */ lis r3, 0x40
/* 00003900 3B64FF00 */ addi r27, r4, -256
/* 00003904 3B834040 */ addi r28, r3, 0x4040
lbl_00003908:
/* 00003908 54000673 */ rlwinm. r0, r0, 0, 0x19, 0x19
/* 0000390C 4182001C */ beq lbl_00003928
/* 00003910 88BE6EA0 */ lbz r5, 0x6ea0(r30)
/* 00003914 38610008 */ addi r3, r1, 8
/* 00003918 389F0248 */ addi r4, r31, 0x248
/* 0000391C 4CC63182 */ crclr 6
/* 00003920 4BFFC88D */ bl sprintf
/* 00003924 48000038 */ b lbl_0000395C
lbl_00003928:
/* 00003928 2C050000 */ cmpwi r5, 0
/* 0000392C 4182001C */ beq lbl_00003948
/* 00003930 88BE6EA0 */ lbz r5, 0x6ea0(r30)
/* 00003934 38610008 */ addi r3, r1, 8
/* 00003938 389F0254 */ addi r4, r31, 0x254
/* 0000393C 4CC63182 */ crclr 6
/* 00003940 4BFFC86D */ bl sprintf
/* 00003944 48000018 */ b lbl_0000395C
lbl_00003948:
/* 00003948 88BE6EA0 */ lbz r5, 0x6ea0(r30)
/* 0000394C 38610008 */ addi r3, r1, 8
/* 00003950 389F0260 */ addi r4, r31, 0x260
/* 00003954 4CC63182 */ crclr 6
/* 00003958 4BFFC855 */ bl sprintf
lbl_0000395C:
/* 0000395C A01E6E9C */ lhz r0, 0x6e9c(r30)
/* 00003960 3B400014 */ li r26, 0x14
/* 00003964 3B20001E */ li r25, 0x1e
/* 00003968 54000673 */ rlwinm. r0, r0, 0, 0x19, 0x19
/* 0000396C 40820064 */ bne lbl_000039D0
/* 00003970 4BFFC83D */ bl reset_text_draw_settings
/* 00003974 3860005D */ li r3, 0x5d
/* 00003978 4BFFC835 */ bl set_text_font
/* 0000397C C03D0124 */ lfs f1, 0x124(r29)
/* 00003980 FC400890 */ fmr f2, f1
/* 00003984 4BFFC829 */ bl set_text_scale
/* 00003988 9341005C */ stw r26, 0x5c(r1)
/* 0000398C 3C004330 */ lis r0, 0x4330
/* 00003990 3C800000 */ lis r4, lbl_0000C368@ha
/* 00003994 93210054 */ stw r25, 0x54(r1)
/* 00003998 3C600000 */ lis r3, lbl_0000C368@ha
/* 0000399C C8640000 */ lfd f3, lbl_0000C368@l(r4)
/* 000039A0 90010058 */ stw r0, 0x58(r1)
/* 000039A4 C8430000 */ lfd f2, lbl_0000C368@l(r3)
/* 000039A8 90010050 */ stw r0, 0x50(r1)
/* 000039AC C8210058 */ lfd f1, 0x58(r1)
/* 000039B0 C8010050 */ lfd f0, 0x50(r1)
/* 000039B4 EC211828 */ fsubs f1, f1, f3
/* 000039B8 EC401028 */ fsubs f2, f0, f2
/* 000039BC 4BFFC7F1 */ bl set_text_pos
/* 000039C0 887E6E9F */ lbz r3, 0x6e9f(r30)
/* 000039C4 38630034 */ addi r3, r3, 0x34
/* 000039C8 4BFFC7E5 */ bl sprite_putc
/* 000039CC 3B40003C */ li r26, 0x3c
lbl_000039D0:
/* 000039D0 38600062 */ li r3, 0x62
/* 000039D4 4BFFC7D9 */ bl set_text_font
/* 000039D8 C03D00F0 */ lfs f1, 0xf0(r29)
/* 000039DC FC400890 */ fmr f2, f1
/* 000039E0 4BFFC7CD */ bl set_text_scale
/* 000039E4 7F63DB78 */ mr r3, r27
/* 000039E8 4BFFC7C5 */ bl set_text_mul_color
/* 000039EC 7F83E378 */ mr r3, r28
/* 000039F0 4BFFC7BD */ bl set_text_add_color
/* 000039F4 38000024 */ li r0, 0x24
/* 000039F8 93410054 */ stw r26, 0x54(r1)
/* 000039FC 3F804330 */ lis r28, 0x4330
/* 00003A00 9001005C */ stw r0, 0x5c(r1)
/* 00003A04 3C800000 */ lis r4, lbl_0000C368@ha
/* 00003A08 3C600000 */ lis r3, lbl_0000C368@ha
/* 00003A0C C8640000 */ lfd f3, lbl_0000C368@l(r4)
/* 00003A10 93810050 */ stw r28, 0x50(r1)
/* 00003A14 C8430000 */ lfd f2, lbl_0000C368@l(r3)
/* 00003A18 93810058 */ stw r28, 0x58(r1)
/* 00003A1C C8210050 */ lfd f1, 0x50(r1)
/* 00003A20 C8010058 */ lfd f0, 0x58(r1)
/* 00003A24 EC211828 */ fsubs f1, f1, f3
/* 00003A28 EC401028 */ fsubs f2, f0, f2
/* 00003A2C 4BFFC781 */ bl set_text_pos
/* 00003A30 38610008 */ addi r3, r1, 8
/* 00003A34 4BFFC779 */ bl sprite_puts
/* 00003A38 80BE6EAC */ lwz r5, 0x6eac(r30)
/* 00003A3C 38610008 */ addi r3, r1, 8
/* 00003A40 389F026C */ addi r4, r31, 0x26c
/* 00003A44 4CC63182 */ crclr 6
/* 00003A48 4BFFC765 */ bl sprintf
/* 00003A4C C03D0128 */ lfs f1, 0x128(r29)
/* 00003A50 3B600014 */ li r27, 0x14
/* 00003A54 FC400890 */ fmr f2, f1
/* 00003A58 4BFFC755 */ bl set_text_scale
/* 00003A5C 3FC00100 */ lis r30, 0x100
/* 00003A60 387EFFFF */ addi r3, r30, -1
/* 00003A64 4BFFC749 */ bl set_text_mul_color
/* 00003A68 38600000 */ li r3, 0
/* 00003A6C 4BFFC741 */ bl set_text_add_color
/* 00003A70 38000040 */ li r0, 0x40
/* 00003A74 9361004C */ stw r27, 0x4c(r1)
/* 00003A78 3C800000 */ lis r4, lbl_0000C368@ha
/* 00003A7C 90010044 */ stw r0, 0x44(r1)
/* 00003A80 3C600000 */ lis r3, lbl_0000C368@ha
/* 00003A84 C8640000 */ lfd f3, lbl_0000C368@l(r4)
/* 00003A88 93810048 */ stw r28, 0x48(r1)
/* 00003A8C C8430000 */ lfd f2, lbl_0000C368@l(r3)
/* 00003A90 93810040 */ stw r28, 0x40(r1)
/* 00003A94 C8210048 */ lfd f1, 0x48(r1)
/* 00003A98 C8010040 */ lfd f0, 0x40(r1)
/* 00003A9C EC211828 */ fsubs f1, f1, f3
/* 00003AA0 EC401028 */ fsubs f2, f0, f2
/* 00003AA4 4BFFC709 */ bl set_text_pos
/* 00003AA8 38610008 */ addi r3, r1, 8
/* 00003AAC 4BFFC701 */ bl sprite_puts
/* 00003AB0 4BFFC6FD */ bl func_8004C2C8
/* 00003AB4 7C600734 */ extsh r0, r3
/* 00003AB8 C01D012C */ lfs f0, 0x12c(r29)
/* 00003ABC 6C008000 */ xoris r0, r0, 0x8000
/* 00003AC0 4CC63242 */ crset 6
/* 00003AC4 9001003C */ stw r0, 0x3c(r1)
/* 00003AC8 3C800000 */ lis r4, lbl_0000C270@ha
/* 00003ACC C8440000 */ lfd f2, lbl_0000C270@l(r4)
/* 00003AD0 38610008 */ addi r3, r1, 8
/* 00003AD4 93810038 */ stw r28, 0x38(r1)
/* 00003AD8 389F0278 */ addi r4, r31, 0x278
/* 00003ADC C8210038 */ lfd f1, 0x38(r1)
/* 00003AE0 EC211028 */ fsubs f1, f1, f2
/* 00003AE4 EC210024 */ fdivs f1, f1, f0
/* 00003AE8 4BFFC6C5 */ bl sprintf
/* 00003AEC 38000052 */ li r0, 0x52
/* 00003AF0 93610034 */ stw r27, 0x34(r1)
/* 00003AF4 3C800000 */ lis r4, lbl_0000C368@ha
/* 00003AF8 9001002C */ stw r0, 0x2c(r1)
/* 00003AFC 3C600000 */ lis r3, lbl_0000C368@ha
/* 00003B00 C8640000 */ lfd f3, lbl_0000C368@l(r4)
/* 00003B04 93810030 */ stw r28, 0x30(r1)
/* 00003B08 C8430000 */ lfd f2, lbl_0000C368@l(r3)
/* 00003B0C 93810028 */ stw r28, 0x28(r1)
/* 00003B10 C8210030 */ lfd f1, 0x30(r1)
/* 00003B14 C8010028 */ lfd f0, 0x28(r1)
/* 00003B18 EC211828 */ fsubs f1, f1, f3
/* 00003B1C EC401028 */ fsubs f2, f0, f2
/* 00003B20 4BFFC68D */ bl set_text_pos
/* 00003B24 38610008 */ addi r3, r1, 8
/* 00003B28 4BFFC685 */ bl sprite_puts
/* 00003B2C 3C600000 */ lis r3, powerOnTimer@ha
/* 00003B30 80030000 */ lwz r0, powerOnTimer@l(r3)
/* 00003B34 540006B7 */ rlwinm. r0, r0, 0, 0x1a, 0x1b
/* 00003B38 41820044 */ beq lbl_00003B7C
/* 00003B3C 38610008 */ addi r3, r1, 8
/* 00003B40 4CC63182 */ crclr 6
/* 00003B44 389F0124 */ addi r4, r31, 0x124
/* 00003B48 4BFFC665 */ bl sprintf
/* 00003B4C C03D00F0 */ lfs f1, 0xf0(r29)
/* 00003B50 FC400890 */ fmr f2, f1
/* 00003B54 4BFFC659 */ bl set_text_scale
/* 00003B58 387EFFFF */ addi r3, r30, -1
/* 00003B5C 4BFFC651 */ bl set_text_mul_color
/* 00003B60 38600000 */ li r3, 0
/* 00003B64 4BFFC649 */ bl set_text_add_color
/* 00003B68 C03D0130 */ lfs f1, 0x130(r29)
/* 00003B6C C05D0134 */ lfs f2, 0x134(r29)
/* 00003B70 4BFFC63D */ bl set_text_pos
/* 00003B74 38610008 */ addi r3, r1, 8
/* 00003B78 4BFFC635 */ bl sprite_puts
lbl_00003B7C:
/* 00003B7C BB210064 */ lmw r25, 0x64(r1)
/* 00003B80 80010084 */ lwz r0, 0x84(r1)
/* 00003B84 38210080 */ addi r1, r1, 0x80
/* 00003B88 7C0803A6 */ mtlr r0
/* 00003B8C 4E800020 */ blr 
