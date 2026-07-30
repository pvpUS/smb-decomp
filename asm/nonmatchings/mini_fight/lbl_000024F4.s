lbl_000024F4:
/* 000024F4 7C0802A6 */ mflr r0
/* 000024F8 3CA00000 */ lis r5, lbl_0001BF80@ha
/* 000024FC 90010004 */ stw r0, 4(r1)
/* 00002500 9421FFE0 */ stwu r1, -0x20(r1)
/* 00002504 93E1001C */ stw r31, 0x1c(r1)
/* 00002508 7C7F1B78 */ mr r31, r3
/* 0000250C 93C10018 */ stw r30, 0x18(r1)
/* 00002510 93A10014 */ stw r29, 0x14(r1)
/* 00002514 3BA50000 */ addi r29, r5, lbl_0001BF80@l
/* 00002518 93810010 */ stw r28, 0x10(r1)
/* 0000251C 80C300A4 */ lwz r6, 0xa4(r3)
/* 00002520 3C600000 */ lis r3, ballInfo@ha
/* 00002524 38030000 */ addi r0, r3, ballInfo@l
/* 00002528 80860000 */ lwz r4, 0(r6)
/* 0000252C 3B860000 */ addi r28, r6, 0
/* 00002530 1C6401A4 */ mulli r3, r4, 0x1a4
/* 00002534 7C601A14 */ add r3, r0, r3
/* 00002538 80030094 */ lwz r0, 0x94(r3)
/* 0000253C 540006F7 */ rlwinm. r0, r0, 0, 0x1b, 0x1b
/* 00002540 408200C8 */ bne lbl_00002608
/* 00002544 7F83E378 */ mr r3, r28
/* 00002548 48001781 */ bl lbl_00003CC8
/* 0000254C 3C600000 */ lis r3, polyDisp@ha
/* 00002550 80030000 */ lwz r0, polyDisp@l(r3)
/* 00002554 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00002558 41820018 */ beq lbl_00002570
/* 0000255C C01F0034 */ lfs f0, 0x34(r31)
/* 00002560 C03F005C */ lfs f1, 0x5c(r31)
/* 00002564 FC000050 */ fneg f0, f0
/* 00002568 FC010040 */ fcmpo cr0, f1, f0
/* 0000256C 4180009C */ blt lbl_00002608
lbl_00002570:
/* 00002570 387F0058 */ addi r3, r31, 0x58
/* 00002574 4BFFDBF1 */ bl mathutil_mtxA_from_mtxB_translate
/* 00002578 A87F0072 */ lha r3, 0x72(r31)
/* 0000257C 4BFFDBE9 */ bl mathutil_mtxA_rotate_y
/* 00002580 A87F0070 */ lha r3, 0x70(r31)
/* 00002584 4BFFDBE1 */ bl mathutil_mtxA_rotate_x
/* 00002588 A87F0074 */ lha r3, 0x74(r31)
/* 0000258C 4BFFDBD9 */ bl mathutil_mtxA_rotate_z
/* 00002590 C03F0048 */ lfs f1, 0x48(r31)
/* 00002594 4BFFDBD1 */ bl mathutil_mtxA_scale_s
/* 00002598 3C600000 */ lis r3, mathutilData@ha
/* 0000259C 3BC30000 */ addi r30, r3, mathutilData@l
/* 000025A0 807E0000 */ lwz r3, 0(r30)
/* 000025A4 38800000 */ li r4, 0
/* 000025A8 4BFFDBBD */ bl GXLoadPosMtxImm
/* 000025AC 807E0000 */ lwz r3, 0(r30)
/* 000025B0 38800000 */ li r4, 0
/* 000025B4 4BFFDBB1 */ bl GXLoadNrmMtxImm
/* 000025B8 C03F0048 */ lfs f1, 0x48(r31)
/* 000025BC 4BFFDBA9 */ bl avdisp_set_bound_sphere_scale
/* 000025C0 801C001C */ lwz r0, 0x1c(r28)
/* 000025C4 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 000025C8 41820018 */ beq lbl_000025E0
/* 000025CC C03D0060 */ lfs f1, 0x60(r29)
/* 000025D0 C09D0008 */ lfs f4, 8(r29)
/* 000025D4 FC400890 */ fmr f2, f1
/* 000025D8 FC600890 */ fmr f3, f1
/* 000025DC 4BFFDB89 */ bl avdisp_set_post_add_color
lbl_000025E0:
/* 000025E0 807F0054 */ lwz r3, 0x54(r31)
/* 000025E4 4BFFDB81 */ bl avdisp_draw_model_culled_sort_translucent
/* 000025E8 801C001C */ lwz r0, 0x1c(r28)
/* 000025EC 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 000025F0 41820018 */ beq lbl_00002608
/* 000025F4 C03D0008 */ lfs f1, 8(r29)
/* 000025F8 FC400890 */ fmr f2, f1
/* 000025FC FC600890 */ fmr f3, f1
/* 00002600 FC800890 */ fmr f4, f1
/* 00002604 4BFFDB61 */ bl avdisp_set_post_add_color
lbl_00002608:
/* 00002608 80010024 */ lwz r0, 0x24(r1)
/* 0000260C 83E1001C */ lwz r31, 0x1c(r1)
/* 00002610 83C10018 */ lwz r30, 0x18(r1)
/* 00002614 7C0803A6 */ mtlr r0
/* 00002618 83A10014 */ lwz r29, 0x14(r1)
/* 0000261C 83810010 */ lwz r28, 0x10(r1)
/* 00002620 38210020 */ addi r1, r1, 0x20
/* 00002624 4E800020 */ blr 
