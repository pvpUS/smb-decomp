/* 00006E64 7C0802A6 */ mflr r0
/* 00006E68 3CA00000 */ lis r5, lbl_0000F020@ha
/* 00006E6C 90010004 */ stw r0, 4(r1)
/* 00006E70 9421FFC8 */ stwu r1, -0x38(r1)
/* 00006E74 DBE10030 */ stfd f31, 0x30(r1)
/* 00006E78 FFE01090 */ fmr f31, f2
/* 00006E7C DBC10028 */ stfd f30, 0x28(r1)
/* 00006E80 FFC00890 */ fmr f30, f1
/* 00006E84 93E10024 */ stw r31, 0x24(r1)
/* 00006E88 3BE50000 */ addi r31, r5, lbl_0000F020@l
/* 00006E8C 93C10020 */ stw r30, 0x20(r1)
/* 00006E90 3BC40000 */ addi r30, r4, 0
/* 00006E94 93A1001C */ stw r29, 0x1c(r1)
/* 00006E98 3BA30000 */ addi r29, r3, 0
/* 00006E9C C03F2168 */ lfs f1, 0x2168(r31)
/* 00006EA0 4BFF92C1 */ bl func_80071B1C
/* 00006EA4 C01F2100 */ lfs f0, 0x2100(r31)
/* 00006EA8 EC20F02A */ fadds f1, f0, f30
/* 00006EAC EC40F82A */ fadds f2, f0, f31
/* 00006EB0 4BFF92B1 */ bl set_text_pos
/* 00006EB4 38600000 */ li r3, 0
/* 00006EB8 4BFF92A9 */ bl set_text_mul_color
/* 00006EBC 7FC3F378 */ mr r3, r30
/* 00006EC0 4BFF92A1 */ bl sprite_puts
/* 00006EC4 C03F1CFC */ lfs f1, 0x1cfc(r31)
/* 00006EC8 4BFF9299 */ bl func_80071B1C
/* 00006ECC FC20F090 */ fmr f1, f30
/* 00006ED0 FC40F890 */ fmr f2, f31
/* 00006ED4 4BFF928D */ bl set_text_pos
/* 00006ED8 7FA3EB78 */ mr r3, r29
/* 00006EDC 4BFF9285 */ bl set_text_mul_color
/* 00006EE0 7FC3F378 */ mr r3, r30
/* 00006EE4 4BFF927D */ bl sprite_puts
/* 00006EE8 8001003C */ lwz r0, 0x3c(r1)
/* 00006EEC CBE10030 */ lfd f31, 0x30(r1)
/* 00006EF0 CBC10028 */ lfd f30, 0x28(r1)
/* 00006EF4 7C0803A6 */ mtlr r0
/* 00006EF8 83E10024 */ lwz r31, 0x24(r1)
/* 00006EFC 83C10020 */ lwz r30, 0x20(r1)
/* 00006F00 83A1001C */ lwz r29, 0x1c(r1)
/* 00006F04 38210038 */ addi r1, r1, 0x38
/* 00006F08 4E800020 */ blr 
