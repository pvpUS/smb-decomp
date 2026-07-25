/* 00023DD4 7C0802A6 */ mflr r0
/* 00023DD8 3C600000 */ lis r3, lbl_00026550@ha
/* 00023DDC 90010004 */ stw r0, 4(r1)
/* 00023DE0 38000044 */ li r0, 0x44
/* 00023DE4 38A00000 */ li r5, 0
/* 00023DE8 9421FF90 */ stwu r1, -0x70(r1)
/* 00023DEC 3880FFFF */ li r4, -1
/* 00023DF0 BF61005C */ stmw r27, 0x5c(r1)
/* 00023DF4 3BE30000 */ addi r31, r3, lbl_00026550@l
/* 00023DF8 3C600000 */ lis r3, lbl_00026E28@ha
/* 00023DFC 3BC30000 */ addi r30, r3, lbl_00026E28@l
/* 00023E00 38610008 */ addi r3, r1, 8
/* 00023E04 90010008 */ stw r0, 8(r1)
/* 00023E08 3800000A */ li r0, 0xa
/* 00023E0C C01F0170 */ lfs f0, 0x170(r31)
/* 00023E10 D001000C */ stfs f0, 0xc(r1)
/* 00023E14 C01F022C */ lfs f0, 0x22c(r31)
/* 00023E18 D0010010 */ stfs f0, 0x10(r1)
/* 00023E1C C01F01B4 */ lfs f0, 0x1b4(r31)
/* 00023E20 D0010014 */ stfs f0, 0x14(r1)
/* 00023E24 C01F04A8 */ lfs f0, 0x4a8(r31)
/* 00023E28 D0010018 */ stfs f0, 0x18(r1)
/* 00023E2C C01F04AC */ lfs f0, 0x4ac(r31)
/* 00023E30 D001001C */ stfs f0, 0x1c(r1)
/* 00023E34 C01F03B0 */ lfs f0, 0x3b0(r31)
/* 00023E38 D0010024 */ stfs f0, 0x24(r1)
/* 00023E3C D0010020 */ stfs f0, 0x20(r1)
/* 00023E40 C01F0134 */ lfs f0, 0x134(r31)
/* 00023E44 D001002C */ stfs f0, 0x2c(r1)
/* 00023E48 D0010028 */ stfs f0, 0x28(r1)
/* 00023E4C 90A10030 */ stw r5, 0x30(r1)
/* 00023E50 C01F0134 */ lfs f0, 0x134(r31)
/* 00023E54 D0010034 */ stfs f0, 0x34(r1)
/* 00023E58 90810038 */ stw r4, 0x38(r1)
/* 00023E5C 9001003C */ stw r0, 0x3c(r1)
/* 00023E60 90810040 */ stw r4, 0x40(r1)
/* 00023E64 90A10044 */ stw r5, 0x44(r1)
/* 00023E68 C03F04B0 */ lfs f1, 0x4b0(r31)
/* 00023E6C C05F04B4 */ lfs f2, 0x4b4(r31)
/* 00023E70 48000251 */ bl lbl_000240C0
/* 00023E74 4BFDC35D */ bl reset_text_draw_settings
/* 00023E78 386000B3 */ li r3, 0xb3
/* 00023E7C 4BFDC355 */ bl set_text_font
/* 00023E80 C03F04B8 */ lfs f1, 0x4b8(r31)
/* 00023E84 C05F0134 */ lfs f2, 0x134(r31)
/* 00023E88 4BFDC349 */ bl set_text_scale
/* 00023E8C 3C600100 */ lis r3, 0x100
/* 00023E90 3863FF00 */ addi r3, r3, -256
/* 00023E94 4BFDC33D */ bl set_text_mul_color
/* 00023E98 C03F04BC */ lfs f1, 0x4bc(r31)
/* 00023E9C 4BFDC335 */ bl func_80071B1C
/* 00023EA0 3C600000 */ lis r3, lbl_802F1BE8@ha
/* 00023EA4 38630000 */ addi r3, r3, lbl_802F1BE8@l
/* 00023EA8 88630004 */ lbz r3, 4(r3)
/* 00023EAC 3B600000 */ li r27, 0
/* 00023EB0 7C600775 */ extsb. r0, r3
/* 00023EB4 41820010 */ beq lbl_00023EC4
/* 00023EB8 7C600774 */ extsb r0, r3
/* 00023EBC 2C000001 */ cmpwi r0, 1
/* 00023EC0 40820044 */ bne lbl_00023F04
lbl_00023EC4:
/* 00023EC4 3C600000 */ lis r3, modeCtrl@ha
/* 00023EC8 3BA30000 */ addi r29, r3, modeCtrl@l
/* 00023ECC 3B800000 */ li r28, 0
/* 00023ED0 48000020 */ b lbl_00023EF0
lbl_00023ED4:
/* 00023ED4 807D002C */ lwz r3, 0x2c(r29)
/* 00023ED8 7F84E378 */ mr r4, r28
/* 00023EDC 4BFE54F9 */ bl lbl_000093D4
/* 00023EE0 5460063E */ clrlwi r0, r3, 0x18
/* 00023EE4 7F60DA14 */ add r27, r0, r27
/* 00023EE8 3B7BFFFD */ addi r27, r27, -3
/* 00023EEC 3B9C0001 */ addi r28, r28, 1
lbl_00023EF0:
/* 00023EF0 4BFE5515 */ bl lbl_00009404
/* 00023EF4 5460063E */ clrlwi r0, r3, 0x18
/* 00023EF8 7C1C0000 */ cmpw r28, r0
/* 00023EFC 4180FFD8 */ blt lbl_00023ED4
/* 00023F00 48000040 */ b lbl_00023F40
lbl_00023F04:
/* 00023F04 3C600000 */ lis r3, modeCtrl@ha
/* 00023F08 3BA30000 */ addi r29, r3, modeCtrl@l
/* 00023F0C 3B800009 */ li r28, 9
/* 00023F10 48000020 */ b lbl_00023F30
lbl_00023F14:
/* 00023F14 807D002C */ lwz r3, 0x2c(r29)
/* 00023F18 7F84E378 */ mr r4, r28
/* 00023F1C 4BFE54B9 */ bl lbl_000093D4
/* 00023F20 5460063E */ clrlwi r0, r3, 0x18
/* 00023F24 7F60DA14 */ add r27, r0, r27
/* 00023F28 3B7BFFFD */ addi r27, r27, -3
/* 00023F2C 3B9C0001 */ addi r28, r28, 1
lbl_00023F30:
/* 00023F30 4BFE54D5 */ bl lbl_00009404
/* 00023F34 5460063E */ clrlwi r0, r3, 0x18
/* 00023F38 7C1C0000 */ cmpw r28, r0
/* 00023F3C 4180FFD8 */ blt lbl_00023F14
lbl_00023F40:
/* 00023F40 2C1B0000 */ cmpwi r27, 0
/* 00023F44 408200B8 */ bne lbl_00023FFC
/* 00023F48 3C600000 */ lis r3, modeCtrl@ha
/* 00023F4C C03F03B0 */ lfs f1, 0x3b0(r31)
/* 00023F50 38630000 */ addi r3, r3, modeCtrl@l
/* 00023F54 8003002C */ lwz r0, 0x2c(r3)
/* 00023F58 3C600000 */ lis r3, ballInfo@ha
/* 00023F5C 38630000 */ addi r3, r3, ballInfo@l
/* 00023F60 1C0001A4 */ mulli r0, r0, 0x1a4
/* 00023F64 7C630214 */ add r3, r3, r0
/* 00023F68 806300FC */ lwz r3, 0xfc(r3)
/* 00023F6C 38800005 */ li r4, 5
/* 00023F70 38A00004 */ li r5, 4
/* 00023F74 38C00000 */ li r6, 0
/* 00023F78 4BFDC259 */ bl new_ape_stat_motion
/* 00023F7C C03F04C0 */ lfs f1, 0x4c0(r31)
/* 00023F80 C05F04C4 */ lfs f2, 0x4c4(r31)
/* 00023F84 4BFDC24D */ bl set_text_pos
/* 00023F88 387E3ABC */ addi r3, r30, 0x3abc
/* 00023F8C 4BFDC245 */ bl sprite_puts
/* 00023F90 C03F04C0 */ lfs f1, 0x4c0(r31)
/* 00023F94 C05F04C8 */ lfs f2, 0x4c8(r31)
/* 00023F98 4BFDC239 */ bl set_text_pos
/* 00023F9C 387E3ADC */ addi r3, r30, 0x3adc
/* 00023FA0 4BFDC231 */ bl sprite_puts
/* 00023FA4 C03F04C0 */ lfs f1, 0x4c0(r31)
/* 00023FA8 C05F04CC */ lfs f2, 0x4cc(r31)
/* 00023FAC 4BFDC225 */ bl set_text_pos
/* 00023FB0 387E3B08 */ addi r3, r30, 0x3b08
/* 00023FB4 4BFDC21D */ bl sprite_puts
/* 00023FB8 4BFDC219 */ bl reset_text_draw_settings
/* 00023FBC 38600009 */ li r3, 9
/* 00023FC0 4BFDC211 */ bl set_text_font
/* 00023FC4 3C600100 */ lis r3, 0x100
/* 00023FC8 3863A000 */ addi r3, r3, -24576
/* 00023FCC 4BFDC205 */ bl set_text_mul_color
/* 00023FD0 C03F04BC */ lfs f1, 0x4bc(r31)
/* 00023FD4 4BFDC1FD */ bl func_80071B1C
/* 00023FD8 C03F04D0 */ lfs f1, 0x4d0(r31)
/* 00023FDC FC400890 */ fmr f2, f1
/* 00023FE0 4BFDC1F1 */ bl set_text_scale
/* 00023FE4 C03F020C */ lfs f1, 0x20c(r31)
/* 00023FE8 C05F03C8 */ lfs f2, 0x3c8(r31)
/* 00023FEC 4BFDC1E5 */ bl set_text_pos
/* 00023FF0 387E3B30 */ addi r3, r30, 0x3b30
/* 00023FF4 4BFDC1DD */ bl sprite_puts
/* 00023FF8 480000B4 */ b lbl_000240AC
lbl_00023FFC:
/* 00023FFC 3C600000 */ lis r3, modeCtrl@ha
/* 00024000 C03F03B0 */ lfs f1, 0x3b0(r31)
/* 00024004 38630000 */ addi r3, r3, modeCtrl@l
/* 00024008 8003002C */ lwz r0, 0x2c(r3)
/* 0002400C 3C600000 */ lis r3, ballInfo@ha
/* 00024010 38630000 */ addi r3, r3, ballInfo@l
/* 00024014 1C0001A4 */ mulli r0, r0, 0x1a4
/* 00024018 7C630214 */ add r3, r3, r0
/* 0002401C 806300FC */ lwz r3, 0xfc(r3)
/* 00024020 38800005 */ li r4, 5
/* 00024024 38A00008 */ li r5, 8
/* 00024028 38C00000 */ li r6, 0
/* 0002402C 4BFDC1A5 */ bl new_ape_stat_motion
/* 00024030 C03F0454 */ lfs f1, 0x454(r31)
/* 00024034 C05F04C4 */ lfs f2, 0x4c4(r31)
/* 00024038 4BFDC199 */ bl set_text_pos
/* 0002403C 387E3B3C */ addi r3, r30, 0x3b3c
/* 00024040 4BFDC191 */ bl sprite_puts
/* 00024044 C03F0454 */ lfs f1, 0x454(r31)
/* 00024048 C05F04C8 */ lfs f2, 0x4c8(r31)
/* 0002404C 4BFDC185 */ bl set_text_pos
/* 00024050 387E3B64 */ addi r3, r30, 0x3b64
/* 00024054 4BFDC17D */ bl sprite_puts
/* 00024058 C03F0454 */ lfs f1, 0x454(r31)
/* 0002405C C05F04CC */ lfs f2, 0x4cc(r31)
/* 00024060 4BFDC171 */ bl set_text_pos
/* 00024064 387E3B88 */ addi r3, r30, 0x3b88
/* 00024068 4BFDC169 */ bl sprite_puts
/* 0002406C 4BFDC165 */ bl reset_text_draw_settings
/* 00024070 38600009 */ li r3, 9
/* 00024074 4BFDC15D */ bl set_text_font
/* 00024078 3C6000FF */ lis r3, 0xff
/* 0002407C 38634600 */ addi r3, r3, 0x4600
/* 00024080 4BFDC151 */ bl set_text_mul_color
/* 00024084 C03F04BC */ lfs f1, 0x4bc(r31)
/* 00024088 4BFDC149 */ bl func_80071B1C
/* 0002408C C03F04D0 */ lfs f1, 0x4d0(r31)
/* 00024090 FC400890 */ fmr f2, f1
/* 00024094 4BFDC13D */ bl set_text_scale
/* 00024098 C03F04D4 */ lfs f1, 0x4d4(r31)
/* 0002409C C05F03C8 */ lfs f2, 0x3c8(r31)
/* 000240A0 4BFDC131 */ bl set_text_pos
/* 000240A4 387E3BB0 */ addi r3, r30, 0x3bb0
/* 000240A8 4BFDC129 */ bl sprite_puts
lbl_000240AC:
/* 000240AC BB61005C */ lmw r27, 0x5c(r1)
/* 000240B0 80010074 */ lwz r0, 0x74(r1)
/* 000240B4 38210070 */ addi r1, r1, 0x70
/* 000240B8 7C0803A6 */ mtlr r0
/* 000240BC 4E800020 */ blr 
