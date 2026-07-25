/* 000245D4 7C0802A6 */ mflr r0
/* 000245D8 3C600000 */ lis r3, lbl_0002A9E8@ha
/* 000245DC 90010004 */ stw r0, 4(r1)
/* 000245E0 38830000 */ addi r4, r3, lbl_0002A9E8@l
/* 000245E4 3C600000 */ lis r3, lbl_00026A38@ha
/* 000245E8 9421FFF0 */ stwu r1, -0x10(r1)
/* 000245EC 93E1000C */ stw r31, 0xc(r1)
/* 000245F0 3BE30000 */ addi r31, r3, lbl_00026A38@l
/* 000245F4 93C10008 */ stw r30, 8(r1)
/* 000245F8 88040000 */ lbz r0, 0(r4)
/* 000245FC 28000000 */ cmplwi r0, 0
/* 00024600 41820058 */ beq lbl_00024658
/* 00024604 38000000 */ li r0, 0
/* 00024608 98040000 */ stb r0, 0(r4)
/* 0002460C 3C600000 */ lis r3, modeCtrl@ha
/* 00024610 38630000 */ addi r3, r3, modeCtrl@l
/* 00024614 90040004 */ stw r0, 4(r4)
/* 00024618 3883002C */ addi r4, r3, 0x2c
/* 0002461C 3C600000 */ lis r3, ballInfo@ha
/* 00024620 80040000 */ lwz r0, 0(r4)
/* 00024624 38630000 */ addi r3, r3, ballInfo@l
/* 00024628 38A300FC */ addi r5, r3, 0xfc
/* 0002462C 1C0001A4 */ mulli r0, r0, 0x1a4
/* 00024630 7C65002E */ lwzx r3, r5, r0
/* 00024634 80030014 */ lwz r0, 0x14(r3)
/* 00024638 540004E2 */ rlwinm r0, r0, 0, 0x13, 0x11
/* 0002463C 90030014 */ stw r0, 0x14(r3)
/* 00024640 80040000 */ lwz r0, 0(r4)
/* 00024644 1C0001A4 */ mulli r0, r0, 0x1a4
/* 00024648 7C65002E */ lwzx r3, r5, r0
/* 0002464C 80030014 */ lwz r0, 0x14(r3)
/* 00024650 54000524 */ rlwinm r0, r0, 0, 0x14, 0x12
/* 00024654 90030014 */ stw r0, 0x14(r3)
lbl_00024658:
/* 00024658 C03F0000 */ lfs f1, 0(r31)
/* 0002465C C05F0004 */ lfs f2, 4(r31)
/* 00024660 C07F0008 */ lfs f3, 8(r31)
/* 00024664 4BFDBB6D */ bl mathutil_mtxA_from_translate_xyz
/* 00024668 3C600001 */ lis r3, 1
/* 0002466C 38638000 */ addi r3, r3, -32768
/* 00024670 4BFDBB61 */ bl mathutil_mtxA_rotate_z
/* 00024674 3860C000 */ li r3, -16384
/* 00024678 4BFDBB59 */ bl mathutil_mtxA_rotate_y
/* 0002467C 3860C000 */ li r3, -16384
/* 00024680 4BFDBB51 */ bl mathutil_mtxA_rotate_x
/* 00024684 3C600000 */ lis r3, lbl_10000210@ha
/* 00024688 3BC30000 */ addi r30, r3, lbl_10000210@l
/* 0002468C 387E0000 */ addi r3, r30, 0
/* 00024690 4BFDBB41 */ bl mathutil_mtxA_to_mtx
/* 00024694 7FC3F378 */ mr r3, r30
/* 00024698 4BFE531D */ bl lbl_000099B4
/* 0002469C 3C600000 */ lis r3, modeCtrl@ha
/* 000246A0 C03F000C */ lfs f1, 0xc(r31)
/* 000246A4 38630000 */ addi r3, r3, modeCtrl@l
/* 000246A8 8003002C */ lwz r0, 0x2c(r3)
/* 000246AC 3C600000 */ lis r3, ballInfo@ha
/* 000246B0 38630000 */ addi r3, r3, ballInfo@l
/* 000246B4 1C0001A4 */ mulli r0, r0, 0x1a4
/* 000246B8 7C630214 */ add r3, r3, r0
/* 000246BC 806300FC */ lwz r3, 0xfc(r3)
/* 000246C0 3880000D */ li r4, 0xd
/* 000246C4 38A00000 */ li r5, 0
/* 000246C8 38C00000 */ li r6, 0
/* 000246CC 4BFDBB05 */ bl new_ape_stat_motion
/* 000246D0 80010014 */ lwz r0, 0x14(r1)
/* 000246D4 83E1000C */ lwz r31, 0xc(r1)
/* 000246D8 83C10008 */ lwz r30, 8(r1)
/* 000246DC 7C0803A6 */ mtlr r0
/* 000246E0 38210010 */ addi r1, r1, 0x10
/* 000246E4 4E800020 */ blr 
