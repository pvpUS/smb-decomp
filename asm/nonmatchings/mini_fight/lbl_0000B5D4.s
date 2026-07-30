/* 0000B5D4 7C0802A6 */ mflr r0
/* 0000B5D8 3C600000 */ lis r3, debugFlags@ha
/* 0000B5DC 90010004 */ stw r0, 4(r1)
/* 0000B5E0 9421FFD0 */ stwu r1, -0x30(r1)
/* 0000B5E4 BF210014 */ stmw r25, 0x14(r1)
/* 0000B5E8 80030000 */ lwz r0, debugFlags@l(r3)
/* 0000B5EC 7000000A */ andi. r0, r0, 0xa
/* 0000B5F0 4082011C */ bne lbl_0000B70C
/* 0000B5F4 3C600000 */ lis r3, modeCtrl@ha
/* 0000B5F8 38C30000 */ addi r6, r3, modeCtrl@l
/* 0000B5FC 80A60000 */ lwz r5, 0(r6)
/* 0000B600 3C800000 */ lis r4, lbl_0001C260@ha
/* 0000B604 3C600000 */ lis r3, lbl_0001C270@ha
/* 0000B608 3805FFFF */ addi r0, r5, -1
/* 0000B60C 90060000 */ stw r0, 0(r6)
/* 0000B610 38A40000 */ addi r5, r4, lbl_0001C260@l
/* 0000B614 3C004330 */ lis r0, 0x4330
/* 0000B618 80860000 */ lwz r4, 0(r6)
/* 0000B61C C8230000 */ lfd f1, lbl_0001C270@l(r3)
/* 0000B620 6C838000 */ xoris r3, r4, 0x8000
/* 0000B624 C8450000 */ lfd f2, 0(r5)
/* 0000B628 9061000C */ stw r3, 0xc(r1)
/* 0000B62C 90010008 */ stw r0, 8(r1)
/* 0000B630 C8010008 */ lfd f0, 8(r1)
/* 0000B634 FC000828 */ fsub f0, f0, f1
/* 0000B638 FC020000 */ fcmpu cr0, f2, f0
/* 0000B63C 40820070 */ bne lbl_0000B6AC
/* 0000B640 3C800000 */ lis r4, currentBall@ha
/* 0000B644 3C600000 */ lis r3, g_poolInfo@ha
/* 0000B648 3BA40000 */ addi r29, r4, currentBall@l
/* 0000B64C 3BC30000 */ addi r30, r3, g_poolInfo@l
/* 0000B650 837D0000 */ lwz r27, 0(r29)
/* 0000B654 3C600000 */ lis r3, ballInfo@ha
/* 0000B658 835E000C */ lwz r26, 0xc(r30)
/* 0000B65C 38030000 */ addi r0, r3, ballInfo@l
/* 0000B660 7C1C0378 */ mr r28, r0
/* 0000B664 3B200000 */ li r25, 0
/* 0000B668 3BE0001E */ li r31, 0x1e
/* 0000B66C 4800002C */ b lbl_0000B698
lbl_0000B670:
/* 0000B670 881A0000 */ lbz r0, 0(r26)
/* 0000B674 2C000002 */ cmpwi r0, 2
/* 0000B678 40820014 */ bne lbl_0000B68C
/* 0000B67C 939D0000 */ stw r28, 0(r29)
/* 0000B680 7F83E378 */ mr r3, r28
/* 0000B684 9BFC0148 */ stb r31, 0x148(r28)
/* 0000B688 48002209 */ bl lbl_0000D890
lbl_0000B68C:
/* 0000B68C 3B390001 */ addi r25, r25, 1
/* 0000B690 3B9C01A4 */ addi r28, r28, 0x1a4
/* 0000B694 3B5A0001 */ addi r26, r26, 1
lbl_0000B698:
/* 0000B698 801E0008 */ lwz r0, 8(r30)
/* 0000B69C 7C190000 */ cmpw r25, r0
/* 0000B6A0 4180FFD0 */ blt lbl_0000B670
/* 0000B6A4 3C600000 */ lis r3, currentBall@ha
/* 0000B6A8 93630000 */ stw r27, currentBall@l(r3)
lbl_0000B6AC:
/* 0000B6AC 3C600000 */ lis r3, modeCtrl@ha
/* 0000B6B0 38630000 */ addi r3, r3, modeCtrl@l
/* 0000B6B4 80630000 */ lwz r3, 0(r3)
/* 0000B6B8 3C800000 */ lis r4, lbl_0001C270@ha
/* 0000B6BC C8240000 */ lfd f1, lbl_0001C270@l(r4)
/* 0000B6C0 3C800000 */ lis r4, lbl_0001C268@ha
/* 0000B6C4 6C608000 */ xoris r0, r3, 0x8000
/* 0000B6C8 9001000C */ stw r0, 0xc(r1)
/* 0000B6CC 3C004330 */ lis r0, 0x4330
/* 0000B6D0 C8440000 */ lfd f2, lbl_0001C268@l(r4)
/* 0000B6D4 90010008 */ stw r0, 8(r1)
/* 0000B6D8 C8010008 */ lfd f0, 8(r1)
/* 0000B6DC FC000828 */ fsub f0, f0, f1
/* 0000B6E0 FC020000 */ fcmpu cr0, f2, f0
/* 0000B6E4 40820008 */ bne lbl_0000B6EC
/* 0000B6E8 4800EC79 */ bl lbl_0001A360
lbl_0000B6EC:
/* 0000B6EC 3C600000 */ lis r3, modeCtrl@ha
/* 0000B6F0 80030000 */ lwz r0, modeCtrl@l(r3)
/* 0000B6F4 2C000000 */ cmpwi r0, 0
/* 0000B6F8 40820014 */ bne lbl_0000B70C
/* 0000B6FC 3C600000 */ lis r3, lbl_10017664@ha
/* 0000B700 38630000 */ addi r3, r3, lbl_10017664@l
/* 0000B704 38000008 */ li r0, 8
/* 0000B708 B0030002 */ sth r0, 2(r3)
lbl_0000B70C:
/* 0000B70C BB210014 */ lmw r25, 0x14(r1)
/* 0000B710 80010034 */ lwz r0, 0x34(r1)
/* 0000B714 38210030 */ addi r1, r1, 0x30
/* 0000B718 7C0803A6 */ mtlr r0
/* 0000B71C 4E800020 */ blr 
