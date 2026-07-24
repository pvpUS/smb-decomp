/* 0000B848 7C0802A6 */ mflr r0
/* 0000B84C 90010004 */ stw r0, 4(r1)
/* 0000B850 9421FFD8 */ stwu r1, -0x28(r1)
/* 0000B854 BF610014 */ stmw r27, 0x14(r1)
/* 0000B858 3B630000 */ addi r27, r3, 0
/* 0000B85C 3C600000 */ lis r3, lbl_00014800@ha
/* 0000B860 3BA30000 */ addi r29, r3, lbl_00014800@l
/* 0000B864 387B0148 */ addi r3, r27, 0x148
/* 0000B868 4BFF48F9 */ bl mathutil_mtxA_from_mtx
/* 0000B86C 387B0124 */ addi r3, r27, 0x124
/* 0000B870 C0430000 */ lfs f2, 0(r3)
/* 0000B874 C0230004 */ lfs f1, 4(r3)
/* 0000B878 C0030008 */ lfs f0, 8(r3)
/* 0000B87C 3C60E000 */ lis r3, 0xe000
/* 0000B880 D043000C */ stfs f2, 0xc(r3)
/* 0000B884 D023001C */ stfs f1, 0x1c(r3)
/* 0000B888 D003002C */ stfs f0, 0x2c(r3)
/* 0000B88C C03D037C */ lfs f1, 0x37c(r29)
/* 0000B890 C05D0380 */ lfs f2, 0x380(r29)
/* 0000B894 C01D0384 */ lfs f0, 0x384(r29)
/* 0000B898 FC200850 */ fneg f1, f1
/* 0000B89C FC401050 */ fneg f2, f2
/* 0000B8A0 FC600050 */ fneg f3, f0
/* 0000B8A4 4BFF48BD */ bl mathutil_mtxA_translate_xyz
/* 0000B8A8 3B800000 */ li r28, 0
/* 0000B8AC 3BE00000 */ li r31, 0
/* 0000B8B0 3BC00000 */ li r30, 0
/* 0000B8B4 48000040 */ b lbl_0000B8F4
lbl_0000B8B8:
/* 0000B8B8 7CBBF214 */ add r5, r27, r30
/* 0000B8BC 80650004 */ lwz r3, 4(r5)
/* 0000B8C0 389E0004 */ addi r4, r30, 4
/* 0000B8C4 80050008 */ lwz r0, 8(r5)
/* 0000B8C8 7C9B2214 */ add r4, r27, r4
/* 0000B8CC 90650094 */ stw r3, 0x94(r5)
/* 0000B8D0 90050098 */ stw r0, 0x98(r5)
/* 0000B8D4 8005000C */ lwz r0, 0xc(r5)
/* 0000B8D8 9005009C */ stw r0, 0x9c(r5)
/* 0000B8DC 801D03A8 */ lwz r0, 0x3a8(r29)
/* 0000B8E0 7C60FA14 */ add r3, r0, r31
/* 0000B8E4 4BFF487D */ bl mathutil_mtxA_tf_point
/* 0000B8E8 3B9C0001 */ addi r28, r28, 1
/* 0000B8EC 3BFF0014 */ addi r31, r31, 0x14
/* 0000B8F0 3BDE000C */ addi r30, r30, 0xc
lbl_0000B8F4:
/* 0000B8F4 881D03AC */ lbz r0, 0x3ac(r29)
/* 0000B8F8 7C1C0000 */ cmpw r28, r0
/* 0000B8FC 4180FFBC */ blt lbl_0000B8B8
/* 0000B900 BB610014 */ lmw r27, 0x14(r1)
/* 0000B904 8001002C */ lwz r0, 0x2c(r1)
/* 0000B908 38210028 */ addi r1, r1, 0x28
/* 0000B90C 7C0803A6 */ mtlr r0
/* 0000B910 4E800020 */ blr 
