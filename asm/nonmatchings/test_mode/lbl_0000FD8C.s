/* 0000FD8C 7C0802A6 */ mflr r0
/* 0000FD90 3C600000 */ lis r3, lbl_10003BF8@ha
/* 0000FD94 90010004 */ stw r0, 4(r1)
/* 0000FD98 9421FFF0 */ stwu r1, -0x10(r1)
/* 0000FD9C 93E1000C */ stw r31, 0xc(r1)
/* 0000FDA0 93C10008 */ stw r30, 8(r1)
/* 0000FDA4 3BC30000 */ addi r30, r3, lbl_10003BF8@l
/* 0000FDA8 3C600000 */ lis r3, lbl_000101E0@ha
/* 0000FDAC 801E00BC */ lwz r0, 0xbc(r30)
/* 0000FDB0 3BE30000 */ addi r31, r3, lbl_000101E0@l
/* 0000FDB4 2C000003 */ cmpwi r0, 3
/* 0000FDB8 40820008 */ bne lbl_0000FDC0
/* 0000FDBC 4BFFE62D */ bl lbl_0000E3E8
lbl_0000FDC0:
/* 0000FDC0 3C600000 */ lis r3, controllerInfo@ha
/* 0000FDC4 38630000 */ addi r3, r3, controllerInfo@l
/* 0000FDC8 A0030018 */ lhz r0, 0x18(r3)
/* 0000FDCC 54000673 */ rlwinm. r0, r0, 0, 0x19, 0x19
/* 0000FDD0 41820010 */ beq lbl_0000FDE0
/* 0000FDD4 801E00C8 */ lwz r0, 0xc8(r30)
/* 0000FDD8 68000001 */ xori r0, r0, 1
/* 0000FDDC 901E00C8 */ stw r0, 0xc8(r30)
lbl_0000FDE0:
/* 0000FDE0 801E00C8 */ lwz r0, 0xc8(r30)
/* 0000FDE4 2C000000 */ cmpwi r0, 0
/* 0000FDE8 4182006C */ beq lbl_0000FE54
/* 0000FDEC 4BFF0371 */ bl mathutil_mtxA_push
/* 0000FDF0 4BFF036D */ bl mathutil_mtxA_from_mtxB
/* 0000FDF4 C03F000C */ lfs f1, 0xc(r31)
/* 0000FDF8 C05F00C8 */ lfs f2, 0xc8(r31)
/* 0000FDFC FC600890 */ fmr f3, f1
/* 0000FE00 4BFF035D */ bl mathutil_mtxA_translate_xyz
/* 0000FE04 A81E00CC */ lha r0, 0xcc(r30)
/* 0000FE08 7C031670 */ srawi r3, r0, 2
/* 0000FE0C 7C630194 */ addze r3, r3
/* 0000FE10 4BFF034D */ bl mathutil_mtxA_rotate_z
/* 0000FE14 A87E00CC */ lha r3, 0xcc(r30)
/* 0000FE18 4BFF0345 */ bl mathutil_mtxA_rotate_x
/* 0000FE1C A89E00CC */ lha r4, 0xcc(r30)
/* 0000FE20 3C600000 */ lis r3, commonGma@ha
/* 0000FE24 3BE30000 */ addi r31, r3, commonGma@l
/* 0000FE28 38040020 */ addi r0, r4, 0x20
/* 0000FE2C B01E00CC */ sth r0, 0xcc(r30)
/* 0000FE30 807F0000 */ lwz r3, 0(r31)
/* 0000FE34 80630008 */ lwz r3, 8(r3)
/* 0000FE38 80630090 */ lwz r3, 0x90(r3)
/* 0000FE3C 4BFF0321 */ bl avdisp_draw_model_unculled_sort_translucent
/* 0000FE40 807F0000 */ lwz r3, 0(r31)
/* 0000FE44 80630008 */ lwz r3, 8(r3)
/* 0000FE48 806300B0 */ lwz r3, 0xb0(r3)
/* 0000FE4C 4BFF0311 */ bl avdisp_draw_model_unculled_sort_translucent
/* 0000FE50 4BFF030D */ bl mathutil_mtxA_pop
lbl_0000FE54:
/* 0000FE54 80010014 */ lwz r0, 0x14(r1)
/* 0000FE58 83E1000C */ lwz r31, 0xc(r1)
/* 0000FE5C 83C10008 */ lwz r30, 8(r1)
/* 0000FE60 7C0803A6 */ mtlr r0
/* 0000FE64 38210010 */ addi r1, r1, 0x10
/* 0000FE68 4E800020 */ blr 
