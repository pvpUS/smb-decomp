/* 0000B454 7C0802A6 */ mflr r0
/* 0000B458 3C800000 */ lis r4, debugFlags@ha
/* 0000B45C 90010004 */ stw r0, 4(r1)
/* 0000B460 3CA00000 */ lis r5, lbl_100000B8@ha
/* 0000B464 9421FFB8 */ stwu r1, -0x48(r1)
/* 0000B468 93E10044 */ stw r31, 0x44(r1)
/* 0000B46C 93C10040 */ stw r30, 0x40(r1)
/* 0000B470 3BC30000 */ addi r30, r3, 0
/* 0000B474 38650000 */ addi r3, r5, lbl_100000B8@l
/* 0000B478 80040000 */ lwz r0, debugFlags@l(r4)
/* 0000B47C 3C800000 */ lis r4, lbl_0000C690@ha
/* 0000B480 3BE40000 */ addi r31, r4, lbl_0000C690@l
/* 0000B484 7000000A */ andi. r0, r0, 0xa
/* 0000B488 40820064 */ bne lbl_0000B4EC
/* 0000B48C C03F003C */ lfs f1, 0x3c(r31)
/* 0000B490 C0030000 */ lfs f0, 0(r3)
/* 0000B494 C05E000C */ lfs f2, 0xc(r30)
/* 0000B498 EC010032 */ fmuls f0, f1, f0
/* 0000B49C C03E0000 */ lfs f1, 0(r30)
/* 0000B4A0 EC02002A */ fadds f0, f2, f0
/* 0000B4A4 EC01002A */ fadds f0, f1, f0
/* 0000B4A8 D01E0000 */ stfs f0, 0(r30)
/* 0000B4AC C03F003C */ lfs f1, 0x3c(r31)
/* 0000B4B0 C0030004 */ lfs f0, 4(r3)
/* 0000B4B4 C05E0010 */ lfs f2, 0x10(r30)
/* 0000B4B8 EC010032 */ fmuls f0, f1, f0
/* 0000B4BC C03E0004 */ lfs f1, 4(r30)
/* 0000B4C0 EC02002A */ fadds f0, f2, f0
/* 0000B4C4 EC01002A */ fadds f0, f1, f0
/* 0000B4C8 D01E0004 */ stfs f0, 4(r30)
/* 0000B4CC C03F003C */ lfs f1, 0x3c(r31)
/* 0000B4D0 C0030008 */ lfs f0, 8(r3)
/* 0000B4D4 C05E0014 */ lfs f2, 0x14(r30)
/* 0000B4D8 EC010032 */ fmuls f0, f1, f0
/* 0000B4DC C03E0008 */ lfs f1, 8(r30)
/* 0000B4E0 EC02002A */ fadds f0, f2, f0
/* 0000B4E4 EC01002A */ fadds f0, f1, f0
/* 0000B4E8 D01E0008 */ stfs f0, 8(r30)
lbl_0000B4EC:
/* 0000B4EC 38E000FF */ li r7, 0xff
/* 0000B4F0 98E10036 */ stb r7, 0x36(r1)
/* 0000B4F4 38000000 */ li r0, 0
/* 0000B4F8 387E000C */ addi r3, r30, 0xc
/* 0000B4FC 98E10035 */ stb r7, 0x35(r1)
/* 0000B500 3881000C */ addi r4, r1, 0xc
/* 0000B504 98E10034 */ stb r7, 0x34(r1)
/* 0000B508 C03F0050 */ lfs f1, 0x50(r31)
/* 0000B50C C01E001C */ lfs f0, 0x1c(r30)
/* 0000B510 EC010032 */ fmuls f0, f1, f0
/* 0000B514 FC00001E */ fctiwz f0, f0
/* 0000B518 D8010038 */ stfd f0, 0x38(r1)
/* 0000B51C 80A1003C */ lwz r5, 0x3c(r1)
/* 0000B520 98A10037 */ stb r5, 0x37(r1)
/* 0000B524 80DE0000 */ lwz r6, 0(r30)
/* 0000B528 80BE0004 */ lwz r5, 4(r30)
/* 0000B52C 90C10028 */ stw r6, 0x28(r1)
/* 0000B530 90A1002C */ stw r5, 0x2c(r1)
/* 0000B534 80BE0008 */ lwz r5, 8(r30)
/* 0000B538 98E10026 */ stb r7, 0x26(r1)
/* 0000B53C 98E10025 */ stb r7, 0x25(r1)
/* 0000B540 98E10024 */ stb r7, 0x24(r1)
/* 0000B544 90A10030 */ stw r5, 0x30(r1)
/* 0000B548 98010027 */ stb r0, 0x27(r1)
/* 0000B54C C03F002C */ lfs f1, 0x2c(r31)
/* 0000B550 4BFF4BFD */ bl mathutil_vec_set_len
/* 0000B554 C05E0000 */ lfs f2, 0(r30)
/* 0000B558 3C600000 */ lis r3, debugFlags@ha
/* 0000B55C C001000C */ lfs f0, 0xc(r1)
/* 0000B560 C0210010 */ lfs f1, 0x10(r1)
/* 0000B564 EC420028 */ fsubs f2, f2, f0
/* 0000B568 C0010014 */ lfs f0, 0x14(r1)
/* 0000B56C D0410018 */ stfs f2, 0x18(r1)
/* 0000B570 C05E0004 */ lfs f2, 4(r30)
/* 0000B574 EC220828 */ fsubs f1, f2, f1
/* 0000B578 D021001C */ stfs f1, 0x1c(r1)
/* 0000B57C C03E0008 */ lfs f1, 8(r30)
/* 0000B580 EC010028 */ fsubs f0, f1, f0
/* 0000B584 D0010020 */ stfs f0, 0x20(r1)
/* 0000B588 80030000 */ lwz r0, debugFlags@l(r3)
/* 0000B58C 7000000A */ andi. r0, r0, 0xa
/* 0000B590 4082006C */ bne lbl_0000B5FC
/* 0000B594 C03E000C */ lfs f1, 0xc(r30)
/* 0000B598 C01F0054 */ lfs f0, 0x54(r31)
/* 0000B59C EC010032 */ fmuls f0, f1, f0
/* 0000B5A0 D01E000C */ stfs f0, 0xc(r30)
/* 0000B5A4 C03E0014 */ lfs f1, 0x14(r30)
/* 0000B5A8 C01F0054 */ lfs f0, 0x54(r31)
/* 0000B5AC EC010032 */ fmuls f0, f1, f0
/* 0000B5B0 D01E0014 */ stfs f0, 0x14(r30)
/* 0000B5B4 C03E0010 */ lfs f1, 0x10(r30)
/* 0000B5B8 C01F0058 */ lfs f0, 0x58(r31)
/* 0000B5BC EC010028 */ fsubs f0, f1, f0
/* 0000B5C0 D01E0010 */ stfs f0, 0x10(r30)
/* 0000B5C4 C03E001C */ lfs f1, 0x1c(r30)
/* 0000B5C8 C01F0044 */ lfs f0, 0x44(r31)
/* 0000B5CC EC010032 */ fmuls f0, f1, f0
/* 0000B5D0 D01E001C */ stfs f0, 0x1c(r30)
/* 0000B5D4 C03E0004 */ lfs f1, 4(r30)
/* 0000B5D8 C01F0000 */ lfs f0, 0(r31)
/* 0000B5DC FC010040 */ fcmpo cr0, f1, f0
/* 0000B5E0 4080000C */ bge lbl_0000B5EC
/* 0000B5E4 D01E0020 */ stfs f0, 0x20(r30)
/* 0000B5E8 48000014 */ b lbl_0000B5FC
lbl_0000B5EC:
/* 0000B5EC C03E0020 */ lfs f1, 0x20(r30)
/* 0000B5F0 C01F0020 */ lfs f0, 0x20(r31)
/* 0000B5F4 EC010028 */ fsubs f0, f1, f0
/* 0000B5F8 D01E0020 */ stfs f0, 0x20(r30)
lbl_0000B5FC:
/* 0000B5FC 4BFF4B51 */ bl mathutil_mtxA_from_mtxB
/* 0000B600 38610028 */ addi r3, r1, 0x28
/* 0000B604 38810018 */ addi r4, r1, 0x18
/* 0000B608 4BFF4B45 */ bl gxutil_draw_line_multicolor
/* 0000B60C 8001004C */ lwz r0, 0x4c(r1)
/* 0000B610 83E10044 */ lwz r31, 0x44(r1)
/* 0000B614 83C10040 */ lwz r30, 0x40(r1)
/* 0000B618 7C0803A6 */ mtlr r0
/* 0000B61C 38210048 */ addi r1, r1, 0x48
/* 0000B620 4E800020 */ blr 
