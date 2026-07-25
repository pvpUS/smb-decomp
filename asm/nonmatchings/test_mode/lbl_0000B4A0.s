/* 0000B4A0 7C0802A6 */ mflr r0
/* 0000B4A4 3C600000 */ lis r3, lbl_10000F70@ha
/* 0000B4A8 90010004 */ stw r0, 4(r1)
/* 0000B4AC 9421FFE0 */ stwu r1, -0x20(r1)
/* 0000B4B0 93E1001C */ stw r31, 0x1c(r1)
/* 0000B4B4 3BE30000 */ addi r31, r3, lbl_10000F70@l
/* 0000B4B8 480009DD */ bl lbl_0000BE94
/* 0000B4BC 3C600000 */ lis r3, controllerInfo@ha
/* 0000B4C0 38630000 */ addi r3, r3, controllerInfo@l
/* 0000B4C4 A0830018 */ lhz r4, 0x18(r3)
/* 0000B4C8 54800739 */ rlwinm. r0, r4, 0, 0x1c, 0x1c
/* 0000B4CC 41820010 */ beq lbl_0000B4DC
/* 0000B4D0 807F0008 */ lwz r3, 8(r31)
/* 0000B4D4 38030001 */ addi r0, r3, 1
/* 0000B4D8 901F0008 */ stw r0, 8(r31)
lbl_0000B4DC:
/* 0000B4DC 38BF0008 */ addi r5, r31, 8
/* 0000B4E0 807F0008 */ lwz r3, 8(r31)
/* 0000B4E4 2C030000 */ cmpwi r3, 0
/* 0000B4E8 40810014 */ ble lbl_0000B4FC
/* 0000B4EC 5480077B */ rlwinm. r0, r4, 0, 0x1d, 0x1d
/* 0000B4F0 4182000C */ beq lbl_0000B4FC
/* 0000B4F4 3803FFFF */ addi r0, r3, -1
/* 0000B4F8 90050000 */ stw r0, 0(r5)
lbl_0000B4FC:
/* 0000B4FC 3C600000 */ lis r3, controllerInfo@ha
/* 0000B500 A0830000 */ lhz r4, controllerInfo@l(r3)
/* 0000B504 548007BD */ rlwinm. r0, r4, 0, 0x1e, 0x1e
/* 0000B508 41820018 */ beq lbl_0000B520
/* 0000B50C 3C600000 */ lis r3, lbl_00010124@ha
/* 0000B510 C03F000C */ lfs f1, 0xc(r31)
/* 0000B514 C0030000 */ lfs f0, lbl_00010124@l(r3)
/* 0000B518 EC010028 */ fsubs f0, f1, f0
/* 0000B51C D01F000C */ stfs f0, 0xc(r31)
lbl_0000B520:
/* 0000B520 548007FF */ clrlwi. r0, r4, 0x1f
/* 0000B524 41820018 */ beq lbl_0000B53C
/* 0000B528 3C600000 */ lis r3, lbl_00010124@ha
/* 0000B52C C03F000C */ lfs f1, 0xc(r31)
/* 0000B530 C0030000 */ lfs f0, lbl_00010124@l(r3)
/* 0000B534 EC01002A */ fadds f0, f1, f0
/* 0000B538 D01F000C */ stfs f0, 0xc(r31)
lbl_0000B53C:
/* 0000B53C 4BFF4C21 */ bl mathutil_mtxA_from_mtxB
/* 0000B540 3C600000 */ lis r3, currentCamera@ha
/* 0000B544 38630000 */ addi r3, r3, currentCamera@l
/* 0000B548 80630000 */ lwz r3, 0(r3)
/* 0000B54C 38810008 */ addi r4, r1, 8
/* 0000B550 3863000C */ addi r3, r3, 0xc
/* 0000B554 4BFF4C09 */ bl mathutil_mtxA_tf_point
/* 0000B558 C0010010 */ lfs f0, 0x10(r1)
/* 0000B55C FC000050 */ fneg f0, f0
/* 0000B560 D01F0000 */ stfs f0, 0(r31)
/* 0000B564 4BFF4BF9 */ bl u_replay_test_main
/* 0000B568 80010024 */ lwz r0, 0x24(r1)
/* 0000B56C 83E1001C */ lwz r31, 0x1c(r1)
/* 0000B570 38210020 */ addi r1, r1, 0x20
/* 0000B574 7C0803A6 */ mtlr r0
/* 0000B578 4E800020 */ blr 
