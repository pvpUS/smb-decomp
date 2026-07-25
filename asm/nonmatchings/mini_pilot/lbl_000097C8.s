/* 000097C8 7C0802A6 */ mflr r0
/* 000097CC 3C800000 */ lis r4, lbl_0000C360@ha
/* 000097D0 90010004 */ stw r0, 4(r1)
/* 000097D4 9421FFA8 */ stwu r1, -0x58(r1)
/* 000097D8 DBE10050 */ stfd f31, 0x50(r1)
/* 000097DC DBC10048 */ stfd f30, 0x48(r1)
/* 000097E0 DBA10040 */ stfd f29, 0x40(r1)
/* 000097E4 DB810038 */ stfd f28, 0x38(r1)
/* 000097E8 93E10034 */ stw r31, 0x34(r1)
/* 000097EC 3BE40000 */ addi r31, r4, lbl_0000C360@l
/* 000097F0 3C800000 */ lis r4, lbl_0000D218@ha
/* 000097F4 93C10030 */ stw r30, 0x30(r1)
/* 000097F8 3BC40000 */ addi r30, r4, lbl_0000D218@l
/* 000097FC 93A1002C */ stw r29, 0x2c(r1)
/* 00009800 93810028 */ stw r28, 0x28(r1)
/* 00009804 C3E30004 */ lfs f31, 4(r3)
/* 00009808 C3C30008 */ lfs f30, 8(r3)
/* 0000980C 3C600000 */ lis r3, currentBall@ha
/* 00009810 FFA0F890 */ fmr f29, f31
/* 00009814 83830000 */ lwz r28, currentBall@l(r3)
/* 00009818 C39F01B0 */ lfs f28, 0x1b0(r31)
/* 0000981C 4BFF6931 */ bl reset_text_draw_settings
/* 00009820 38600009 */ li r3, 9
/* 00009824 4BFF6929 */ bl set_text_font
/* 00009828 FC20E090 */ fmr f1, f28
/* 0000982C FC40E090 */ fmr f2, f28
/* 00009830 4BFF691D */ bl set_text_scale
/* 00009834 3C800000 */ lis r4, lbl_10000066@ha
/* 00009838 3C600000 */ lis r3, lbl_10000064@ha
/* 0000983C 38840000 */ addi r4, r4, lbl_10000066@l
/* 00009840 A8030000 */ lha r0, lbl_10000064@l(r3)
/* 00009844 A8840000 */ lha r4, 0(r4)
/* 00009848 7C040000 */ cmpw r4, r0
/* 0000984C 41800048 */ blt lbl_00009894
/* 00009850 C83F01B8 */ lfd f1, 0x1b8(r31)
/* 00009854 C81F01C0 */ lfd f0, 0x1c0(r31)
/* 00009858 FC21E82A */ fadd f1, f1, f29
/* 0000985C FC5E0028 */ fsub f2, f30, f0
/* 00009860 FC200818 */ frsp f1, f1
/* 00009864 FC401018 */ frsp f2, f2
/* 00009868 4BFF68E5 */ bl set_text_pos
/* 0000986C 387E0128 */ addi r3, r30, 0x128
/* 00009870 4BFF68DD */ bl sprite_puts
/* 00009874 C81F01C8 */ lfd f0, 0x1c8(r31)
/* 00009878 FC40F090 */ fmr f2, f30
/* 0000987C FC20E82A */ fadd f1, f0, f29
/* 00009880 FC200818 */ frsp f1, f1
/* 00009884 4BFF68C9 */ bl set_text_pos
/* 00009888 387E0130 */ addi r3, r30, 0x130
/* 0000988C 4BFF68C1 */ bl sprite_puts
/* 00009890 48000040 */ b lbl_000098D0
lbl_00009894:
/* 00009894 2C04000A */ cmpwi r4, 0xa
/* 00009898 41800018 */ blt lbl_000098B0
/* 0000989C C83F0070 */ lfd f1, 0x70(r31)
/* 000098A0 C01F01B0 */ lfs f0, 0x1b0(r31)
/* 000098A4 FC010032 */ fmul f0, f1, f0
/* 000098A8 FFBD0028 */ fsub f29, f29, f0
/* 000098AC FFA0E818 */ frsp f29, f29
lbl_000098B0:
/* 000098B0 FC20E890 */ fmr f1, f29
/* 000098B4 FC40F090 */ fmr f2, f30
/* 000098B8 4BFF6895 */ bl set_text_pos
/* 000098BC 3C600000 */ lis r3, lbl_10000066@ha
/* 000098C0 4CC63182 */ crclr 6
/* 000098C4 A8830000 */ lha r4, lbl_10000066@l(r3)
/* 000098C8 387E0138 */ addi r3, r30, 0x138
/* 000098CC 4BFF6881 */ bl sprite_printf
lbl_000098D0:
/* 000098D0 3C600000 */ lis r3, modeCtrl@ha
/* 000098D4 3BA30000 */ addi r29, r3, modeCtrl@l
/* 000098D8 801D0024 */ lwz r0, 0x24(r29)
/* 000098DC 2C000001 */ cmpwi r0, 1
/* 000098E0 41820094 */ beq lbl_00009974
/* 000098E4 889C014A */ lbz r4, 0x14a(r28)
/* 000098E8 3C600000 */ lis r3, lbl_801B7CF8@ha
/* 000098EC 38030000 */ addi r0, r3, lbl_801B7CF8@l
/* 000098F0 C87F01D0 */ lfd f3, 0x1d0(r31)
/* 000098F4 1C64000C */ mulli r3, r4, 0xc
/* 000098F8 7C601A14 */ add r3, r0, r3
/* 000098FC C0230000 */ lfs f1, 0(r3)
/* 00009900 C0030004 */ lfs f0, 4(r3)
/* 00009904 C0430008 */ lfs f2, 8(r3)
/* 00009908 FC230072 */ fmul f1, f3, f1
/* 0000990C FC030032 */ fmul f0, f3, f0
/* 00009910 FC4300B2 */ fmul f2, f3, f2
/* 00009914 FC20081E */ fctiwz f1, f1
/* 00009918 FC00001E */ fctiwz f0, f0
/* 0000991C FC40101E */ fctiwz f2, f2
/* 00009920 D8210018 */ stfd f1, 0x18(r1)
/* 00009924 D8010010 */ stfd f0, 0x10(r1)
/* 00009928 8081001C */ lwz r4, 0x1c(r1)
/* 0000992C D8410020 */ stfd f2, 0x20(r1)
/* 00009930 80010014 */ lwz r0, 0x14(r1)
/* 00009934 80A10024 */ lwz r5, 0x24(r1)
/* 00009938 5403442E */ rlwinm r3, r0, 8, 0x10, 0x17
/* 0000993C 5083821E */ rlwimi r3, r4, 0x10, 8, 0xf
/* 00009940 50A3063E */ rlwimi r3, r5, 0, 0x18, 0x1f
/* 00009944 4BFF6809 */ bl set_text_mul_color
/* 00009948 C81F01E0 */ lfd f0, 0x1e0(r31)
/* 0000994C C03F01D8 */ lfs f1, 0x1d8(r31)
/* 00009950 FC40F02A */ fadd f2, f0, f30
/* 00009954 EC21F82A */ fadds f1, f1, f31
/* 00009958 FC401018 */ frsp f2, f2
/* 0000995C 4BFF67F1 */ bl set_text_pos
/* 00009960 809D002C */ lwz r4, 0x2c(r29)
/* 00009964 387E0144 */ addi r3, r30, 0x144
/* 00009968 4CC63182 */ crclr 6
/* 0000996C 38840001 */ addi r4, r4, 1
/* 00009970 4BFF67DD */ bl sprite_printf
lbl_00009974:
/* 00009974 8001005C */ lwz r0, 0x5c(r1)
/* 00009978 CBE10050 */ lfd f31, 0x50(r1)
/* 0000997C CBC10048 */ lfd f30, 0x48(r1)
/* 00009980 7C0803A6 */ mtlr r0
/* 00009984 CBA10040 */ lfd f29, 0x40(r1)
/* 00009988 CB810038 */ lfd f28, 0x38(r1)
/* 0000998C 83E10034 */ lwz r31, 0x34(r1)
/* 00009990 83C10030 */ lwz r30, 0x30(r1)
/* 00009994 83A1002C */ lwz r29, 0x2c(r1)
/* 00009998 83810028 */ lwz r28, 0x28(r1)
/* 0000999C 38210058 */ addi r1, r1, 0x58
/* 000099A0 4E800020 */ blr 
