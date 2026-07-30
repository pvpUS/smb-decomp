/* 00006E3C 7C0802A6 */ mflr r0
/* 00006E40 3CA00000 */ lis r5, lbl_0000C2C8@ha
/* 00006E44 90010004 */ stw r0, 4(r1)
/* 00006E48 9421FFD0 */ stwu r1, -0x30(r1)
/* 00006E4C 93E1002C */ stw r31, 0x2c(r1)
/* 00006E50 93C10028 */ stw r30, 0x28(r1)
/* 00006E54 3BC50000 */ addi r30, r5, lbl_0000C2C8@l
/* 00006E58 93A10024 */ stw r29, 0x24(r1)
/* 00006E5C 3BA40000 */ addi r29, r4, 0
/* 00006E60 93810020 */ stw r28, 0x20(r1)
/* 00006E64 3B830000 */ addi r28, r3, 0
/* 00006E68 4BFF92E5 */ bl camera_clear
/* 00006E6C 3BE00000 */ li r31, 0
/* 00006E70 B3FC010C */ sth r31, 0x10c(r28)
/* 00006E74 387C000C */ addi r3, r28, 0xc
/* 00006E78 C01D0004 */ lfs f0, 4(r29)
/* 00006E7C D01C000C */ stfs f0, 0xc(r28)
/* 00006E80 C83E0000 */ lfd f1, 0(r30)
/* 00006E84 C01D0008 */ lfs f0, 8(r29)
/* 00006E88 FC01002A */ fadd f0, f1, f0
/* 00006E8C FC000018 */ frsp f0, f0
/* 00006E90 D01C0010 */ stfs f0, 0x10(r28)
/* 00006E94 C01D000C */ lfs f0, 0xc(r29)
/* 00006E98 D01C0014 */ stfs f0, 0x14(r28)
/* 00006E9C 4BFF92B1 */ bl mathutil_mtxA_from_translate
/* 00006EA0 3C600000 */ lis r3, decodedStageLzPtr@ha
/* 00006EA4 38630000 */ addi r3, r3, decodedStageLzPtr@l
/* 00006EA8 80630000 */ lwz r3, 0(r3)
/* 00006EAC 80630010 */ lwz r3, 0x10(r3)
/* 00006EB0 A863000E */ lha r3, 0xe(r3)
/* 00006EB4 4BFF9299 */ bl mathutil_mtxA_rotate_y
/* 00006EB8 C01E0008 */ lfs f0, 8(r30)
/* 00006EBC 389C0000 */ addi r4, r28, 0
/* 00006EC0 38610010 */ addi r3, r1, 0x10
/* 00006EC4 D0010010 */ stfs f0, 0x10(r1)
/* 00006EC8 C01E000C */ lfs f0, 0xc(r30)
/* 00006ECC D0010014 */ stfs f0, 0x14(r1)
/* 00006ED0 C01E0010 */ lfs f0, 0x10(r30)
/* 00006ED4 D0010018 */ stfs f0, 0x18(r1)
/* 00006ED8 4BFF9275 */ bl mathutil_mtxA_tf_point
/* 00006EDC C01E0008 */ lfs f0, 8(r30)
/* 00006EE0 38610010 */ addi r3, r1, 0x10
/* 00006EE4 389C00AC */ addi r4, r28, 0xac
/* 00006EE8 D0010010 */ stfs f0, 0x10(r1)
/* 00006EEC C01E0008 */ lfs f0, 8(r30)
/* 00006EF0 D0010014 */ stfs f0, 0x14(r1)
/* 00006EF4 C01E0010 */ lfs f0, 0x10(r30)
/* 00006EF8 D0010018 */ stfs f0, 0x18(r1)
/* 00006EFC 4BFF9251 */ bl mathutil_mtxA_tf_point
/* 00006F00 C03C000C */ lfs f1, 0xc(r28)
/* 00006F04 C01C0000 */ lfs f0, 0(r28)
/* 00006F08 EC010028 */ fsubs f0, f1, f0
/* 00006F0C D0010010 */ stfs f0, 0x10(r1)
/* 00006F10 C03C0010 */ lfs f1, 0x10(r28)
/* 00006F14 C01C0004 */ lfs f0, 4(r28)
/* 00006F18 EC010028 */ fsubs f0, f1, f0
/* 00006F1C D0010014 */ stfs f0, 0x14(r1)
/* 00006F20 C03C0014 */ lfs f1, 0x14(r28)
/* 00006F24 C01C0008 */ lfs f0, 8(r28)
/* 00006F28 EC010028 */ fsubs f0, f1, f0
/* 00006F2C D0010018 */ stfs f0, 0x18(r1)
/* 00006F30 C0210010 */ lfs f1, 0x10(r1)
/* 00006F34 C0410018 */ lfs f2, 0x18(r1)
/* 00006F38 4BFF9215 */ bl mathutil_atan2
/* 00006F3C 38038000 */ addi r0, r3, -32768
/* 00006F40 B01C001A */ sth r0, 0x1a(r28)
/* 00006F44 C0010018 */ lfs f0, 0x18(r1)
/* 00006F48 C0210010 */ lfs f1, 0x10(r1)
/* 00006F4C EC210072 */ fmuls f1, f1, f1
/* 00006F50 EC20083A */ fmadds f1, f0, f0, f1
/* 00006F54 4BFF91F9 */ bl mathutil_sqrt
/* 00006F58 FC400890 */ fmr f2, f1
/* 00006F5C C0210014 */ lfs f1, 0x14(r1)
/* 00006F60 4BFF91ED */ bl mathutil_atan2
/* 00006F64 B07C0018 */ sth r3, 0x18(r28)
/* 00006F68 38000001 */ li r0, 1
/* 00006F6C B3FC001C */ sth r31, 0x1c(r28)
/* 00006F70 981C001F */ stb r0, 0x1f(r28)
/* 00006F74 80010034 */ lwz r0, 0x34(r1)
/* 00006F78 83E1002C */ lwz r31, 0x2c(r1)
/* 00006F7C 83C10028 */ lwz r30, 0x28(r1)
/* 00006F80 83A10024 */ lwz r29, 0x24(r1)
/* 00006F84 83810020 */ lwz r28, 0x20(r1)
/* 00006F88 38210030 */ addi r1, r1, 0x30
/* 00006F8C 7C0803A6 */ mtlr r0
/* 00006F90 4E800020 */ blr 
