/* 00009E88 7C0802A6 */ mflr r0
/* 00009E8C 3C800000 */ lis r4, polyDisp@ha
/* 00009E90 90010004 */ stw r0, 4(r1)
/* 00009E94 9421FFE0 */ stwu r1, -0x20(r1)
/* 00009E98 93E1001C */ stw r31, 0x1c(r1)
/* 00009E9C 3BE30000 */ addi r31, r3, 0
/* 00009EA0 80040000 */ lwz r0, polyDisp@l(r4)
/* 00009EA4 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00009EA8 41820028 */ beq lbl_00009ED0
/* 00009EAC 3C600000 */ lis r3, lbl_0001C108@ha
/* 00009EB0 C03F0038 */ lfs f1, 0x38(r31)
/* 00009EB4 C0030000 */ lfs f0, lbl_0001C108@l(r3)
/* 00009EB8 FC010040 */ fcmpo cr0, f1, f0
/* 00009EBC 41800094 */ blt lbl_00009F50
/* 00009EC0 A81F0000 */ lha r0, 0(r31)
/* 00009EC4 540007FF */ clrlwi. r0, r0, 0x1f
/* 00009EC8 41820008 */ beq lbl_00009ED0
/* 00009ECC 48000084 */ b lbl_00009F50
lbl_00009ED0:
/* 00009ED0 387F0034 */ addi r3, r31, 0x34
/* 00009ED4 4BFF6291 */ bl mathutil_mtxA_from_mtxB_translate
/* 00009ED8 4BFF628D */ bl mathutil_mtxA_sq_from_identity
/* 00009EDC 3C600000 */ lis r3, mathutilData@ha
/* 00009EE0 A89F00A4 */ lha r4, 0xa4(r31)
/* 00009EE4 80A30000 */ lwz r5, mathutilData@l(r3)
/* 00009EE8 3C600000 */ lis r3, lbl_0001C218@ha
/* 00009EEC C0430000 */ lfs f2, lbl_0001C218@l(r3)
/* 00009EF0 C025000C */ lfs f1, 0xc(r5)
/* 00009EF4 C005001C */ lfs f0, 0x1c(r5)
/* 00009EF8 EC01002A */ fadds f0, f1, f0
/* 00009EFC EC020032 */ fmuls f0, f2, f0
/* 00009F00 FC00001E */ fctiwz f0, f0
/* 00009F04 D8010010 */ stfd f0, 0x10(r1)
/* 00009F08 80010014 */ lwz r0, 0x14(r1)
/* 00009F0C 7C000734 */ extsh r0, r0
/* 00009F10 7C640214 */ add r3, r4, r0
/* 00009F14 4BFF6251 */ bl mathutil_mtxA_rotate_z
/* 00009F18 C03F0024 */ lfs f1, 0x24(r31)
/* 00009F1C 4BFF6249 */ bl mathutil_mtxA_scale_s
/* 00009F20 C03F0018 */ lfs f1, 0x18(r31)
/* 00009F24 C05F001C */ lfs f2, 0x1c(r31)
/* 00009F28 C07F0020 */ lfs f3, 0x20(r31)
/* 00009F2C 4BFF6239 */ bl nlObjPutSetFadeColorBase
/* 00009F30 C03F0024 */ lfs f1, 0x24(r31)
/* 00009F34 4BFF6231 */ bl nlSetScaleFactor
/* 00009F38 3C600000 */ lis r3, g_commonNlObj@ha
/* 00009F3C 38630000 */ addi r3, r3, g_commonNlObj@l
/* 00009F40 80630000 */ lwz r3, 0(r3)
/* 00009F44 806300D8 */ lwz r3, 0xd8(r3)
/* 00009F48 4BFF621D */ bl nlObjPut
/* 00009F4C 4BFF6219 */ bl fade_color_base_default
lbl_00009F50:
/* 00009F50 80010024 */ lwz r0, 0x24(r1)
/* 00009F54 83E1001C */ lwz r31, 0x1c(r1)
/* 00009F58 38210020 */ addi r1, r1, 0x20
/* 00009F5C 7C0803A6 */ mtlr r0
/* 00009F60 4E800020 */ blr 
