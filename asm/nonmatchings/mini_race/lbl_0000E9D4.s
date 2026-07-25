/* 0000E9D4 7C0802A6 */ mflr r0
/* 0000E9D8 3CA00000 */ lis r5, lbl_00015C08@ha
/* 0000E9DC 90010004 */ stw r0, 4(r1)
/* 0000E9E0 9421FF80 */ stwu r1, -0x80(r1)
/* 0000E9E4 DBE10078 */ stfd f31, 0x78(r1)
/* 0000E9E8 BF610064 */ stmw r27, 0x64(r1)
/* 0000E9EC 7C7B1B78 */ mr r27, r3
/* 0000E9F0 3BA50000 */ addi r29, r5, lbl_00015C08@l
/* 0000E9F4 80030048 */ lwz r0, 0x48(r3)
/* 0000E9F8 3C600000 */ lis r3, lbl_10000054@ha
/* 0000E9FC 5404103A */ slwi r4, r0, 2
/* 0000EA00 38030000 */ addi r0, r3, lbl_10000054@l
/* 0000EA04 7C602214 */ add r3, r0, r4
/* 0000EA08 3C800000 */ lis r4, lbl_00013C48@ha
/* 0000EA0C 83830000 */ lwz r28, 0(r3)
/* 0000EA10 3C600000 */ lis r3, lbl_10000028@ha
/* 0000EA14 3BC40000 */ addi r30, r4, lbl_00013C48@l
/* 0000EA18 3BE30000 */ addi r31, r3, lbl_10000028@l
/* 0000EA1C 4BFF1761 */ bl reset_text_draw_settings
/* 0000EA20 3C600020 */ lis r3, 0x20
/* 0000EA24 4BFF1759 */ bl func_80071B50
/* 0000EA28 C3FB0008 */ lfs f31, 8(r27)
/* 0000EA2C 3C600100 */ lis r3, 0x100
/* 0000EA30 C01E0008 */ lfs f0, 8(r30)
/* 0000EA34 38A3FFFF */ addi r5, r3, -1
/* 0000EA38 39000000 */ li r8, 0
/* 0000EA3C D001001C */ stfs f0, 0x1c(r1)
/* 0000EA40 38E0FFFF */ li r7, -1
/* 0000EA44 38C00005 */ li r6, 5
/* 0000EA48 C01E0008 */ lfs f0, 8(r30)
/* 0000EA4C 3C80FFFF */ lis r4, 0xffff
/* 0000EA50 38000717 */ li r0, 0x717
/* 0000EA54 D0010020 */ stfs f0, 0x20(r1)
/* 0000EA58 3861000C */ addi r3, r1, 0xc
/* 0000EA5C C01E0018 */ lfs f0, 0x18(r30)
/* 0000EA60 D0010028 */ stfs f0, 0x28(r1)
/* 0000EA64 D0010024 */ stfs f0, 0x24(r1)
/* 0000EA68 C01E0008 */ lfs f0, 8(r30)
/* 0000EA6C D0010030 */ stfs f0, 0x30(r1)
/* 0000EA70 D001002C */ stfs f0, 0x2c(r1)
/* 0000EA74 91010034 */ stw r8, 0x34(r1)
/* 0000EA78 90E1003C */ stw r7, 0x3c(r1)
/* 0000EA7C 90C10040 */ stw r6, 0x40(r1)
/* 0000EA80 C01E0008 */ lfs f0, 8(r30)
/* 0000EA84 D0010038 */ stfs f0, 0x38(r1)
/* 0000EA88 90A10044 */ stw r5, 0x44(r1)
/* 0000EA8C 91010048 */ stw r8, 0x48(r1)
/* 0000EA90 90810044 */ stw r4, 0x44(r1)
/* 0000EA94 9001000C */ stw r0, 0xc(r1)
/* 0000EA98 C01B0004 */ lfs f0, 4(r27)
/* 0000EA9C D0010010 */ stfs f0, 0x10(r1)
/* 0000EAA0 D3E10014 */ stfs f31, 0x14(r1)
/* 0000EAA4 C01B004C */ lfs f0, 0x4c(r27)
/* 0000EAA8 D0010018 */ stfs f0, 0x18(r1)
/* 0000EAAC 4BFF16D1 */ bl nlSprPut
/* 0000EAB0 C03B004C */ lfs f1, 0x4c(r27)
/* 0000EAB4 C01E00EC */ lfs f0, 0xec(r30)
/* 0000EAB8 EC210028 */ fsubs f1, f1, f0
/* 0000EABC 4BFF16C1 */ bl func_80071B1C
/* 0000EAC0 38600048 */ li r3, 0x48
/* 0000EAC4 4BFF16B9 */ bl set_text_font
/* 0000EAC8 C03E00E4 */ lfs f1, 0xe4(r30)
/* 0000EACC C01B0004 */ lfs f0, 4(r27)
/* 0000EAD0 EC41F82A */ fadds f2, f1, f31
/* 0000EAD4 EC21002A */ fadds f1, f1, f0
/* 0000EAD8 4BFF16A5 */ bl set_text_pos
/* 0000EADC A09C001E */ lhz r4, 0x1e(r28)
/* 0000EAE0 387D00A0 */ addi r3, r29, 0xa0
/* 0000EAE4 4CC63182 */ crclr 6
/* 0000EAE8 4BFF1695 */ bl sprite_printf
/* 0000EAEC 38600045 */ li r3, 0x45
/* 0000EAF0 4BFF168D */ bl set_text_font
/* 0000EAF4 C01E001C */ lfs f0, 0x1c(r30)
/* 0000EAF8 C03E00F0 */ lfs f1, 0xf0(r30)
/* 0000EAFC EFE0F82A */ fadds f31, f0, f31
/* 0000EB00 C01B0004 */ lfs f0, 4(r27)
/* 0000EB04 EC21002A */ fadds f1, f1, f0
/* 0000EB08 FC40F890 */ fmr f2, f31
/* 0000EB0C 4BFF1671 */ bl set_text_pos
/* 0000EB10 801C0014 */ lwz r0, 0x14(r28)
/* 0000EB14 540006B5 */ rlwinm. r0, r0, 0, 0x1a, 0x1a
/* 0000EB18 4182001C */ beq lbl_0000EB34
/* 0000EB1C A09C0000 */ lhz r4, 0(r28)
/* 0000EB20 387D0118 */ addi r3, r29, 0x118
/* 0000EB24 4CC63182 */ crclr 6
/* 0000EB28 38840001 */ addi r4, r4, 1
/* 0000EB2C 4BFF1651 */ bl sprite_printf
/* 0000EB30 48000028 */ b lbl_0000EB58
lbl_0000EB34:
/* 0000EB34 A01C0000 */ lhz r0, 0(r28)
/* 0000EB38 5400103A */ slwi r0, r0, 2
/* 0000EB3C 7C7D002E */ lwzx r3, r29, r0
/* 0000EB40 4BFF163D */ bl set_text_mul_color
/* 0000EB44 A09C0000 */ lhz r4, 0(r28)
/* 0000EB48 387D0120 */ addi r3, r29, 0x120
/* 0000EB4C 4CC63182 */ crclr 6
/* 0000EB50 38840001 */ addi r4, r4, 1
/* 0000EB54 4BFF1629 */ bl sprite_printf
lbl_0000EB58:
/* 0000EB58 38600045 */ li r3, 0x45
/* 0000EB5C 4BFF1621 */ bl set_text_font
/* 0000EB60 C03E00F0 */ lfs f1, 0xf0(r30)
/* 0000EB64 FC40F890 */ fmr f2, f31
/* 0000EB68 C01B0004 */ lfs f0, 4(r27)
/* 0000EB6C C07E01EC */ lfs f3, 0x1ec(r30)
/* 0000EB70 EC01002A */ fadds f0, f1, f0
/* 0000EB74 EC23002A */ fadds f1, f3, f0
/* 0000EB78 4BFF1605 */ bl set_text_pos
/* 0000EB7C A01F0002 */ lhz r0, 2(r31)
/* 0000EB80 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 0000EB84 41820050 */ beq lbl_0000EBD4
/* 0000EB88 A01C0000 */ lhz r0, 0(r28)
/* 0000EB8C 3C600000 */ lis r3, lbl_10000048@ha
/* 0000EB90 3B630000 */ addi r27, r3, lbl_10000048@l
/* 0000EB94 4CC63182 */ crclr 6
/* 0000EB98 5400083C */ slwi r0, r0, 1
/* 0000EB9C 7C7B0214 */ add r3, r27, r0
/* 0000EBA0 A8830000 */ lha r4, 0(r3)
/* 0000EBA4 387D012C */ addi r3, r29, 0x12c
/* 0000EBA8 4BFF15D5 */ bl sprite_printf
/* 0000EBAC A01C0000 */ lhz r0, 0(r28)
/* 0000EBB0 5400083C */ slwi r0, r0, 1
/* 0000EBB4 7C7B0214 */ add r3, r27, r0
/* 0000EBB8 A8030000 */ lha r0, 0(r3)
/* 0000EBBC 2C000001 */ cmpwi r0, 1
/* 0000EBC0 41820048 */ beq lbl_0000EC08
/* 0000EBC4 387D0138 */ addi r3, r29, 0x138
/* 0000EBC8 4CC63182 */ crclr 6
/* 0000EBCC 4BFF15B1 */ bl sprite_printf
/* 0000EBD0 48000038 */ b lbl_0000EC08
lbl_0000EBD4:
/* 0000EBD4 801C0014 */ lwz r0, 0x14(r28)
/* 0000EBD8 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 0000EBDC 41820020 */ beq lbl_0000EBFC
/* 0000EBE0 889C01C8 */ lbz r4, 0x1c8(r28)
/* 0000EBE4 387D00B0 */ addi r3, r29, 0xb0
/* 0000EBE8 88BC01C9 */ lbz r5, 0x1c9(r28)
/* 0000EBEC 4CC63182 */ crclr 6
/* 0000EBF0 88DC01CA */ lbz r6, 0x1ca(r28)
/* 0000EBF4 4BFF1589 */ bl sprite_printf
/* 0000EBF8 48000010 */ b lbl_0000EC08
lbl_0000EBFC:
/* 0000EBFC 387D013C */ addi r3, r29, 0x13c
/* 0000EC00 4CC63182 */ crclr 6
/* 0000EC04 4BFF1579 */ bl sprite_printf
lbl_0000EC08:
/* 0000EC08 BB610064 */ lmw r27, 0x64(r1)
/* 0000EC0C 80010084 */ lwz r0, 0x84(r1)
/* 0000EC10 CBE10078 */ lfd f31, 0x78(r1)
/* 0000EC14 38210080 */ addi r1, r1, 0x80
/* 0000EC18 7C0803A6 */ mtlr r0
/* 0000EC1C 4E800020 */ blr 
