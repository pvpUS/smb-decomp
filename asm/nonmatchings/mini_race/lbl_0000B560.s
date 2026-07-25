/* 0000B560 7C0802A6 */ mflr r0
/* 0000B564 3C800000 */ lis r4, lbl_00013BD0@ha
/* 0000B568 90010004 */ stw r0, 4(r1)
/* 0000B56C 38C00000 */ li r6, 0
/* 0000B570 38E00002 */ li r7, 2
/* 0000B574 9421FFD8 */ stwu r1, -0x28(r1)
/* 0000B578 93E10024 */ stw r31, 0x24(r1)
/* 0000B57C 3BE40000 */ addi r31, r4, lbl_00013BD0@l
/* 0000B580 93C10020 */ stw r30, 0x20(r1)
/* 0000B584 809F0058 */ lwz r4, 0x58(r31)
/* 0000B588 801F005C */ lwz r0, 0x5c(r31)
/* 0000B58C 9081000C */ stw r4, 0xc(r1)
/* 0000B590 90010010 */ stw r0, 0x10(r1)
/* 0000B594 809F0060 */ lwz r4, 0x60(r31)
/* 0000B598 801F0064 */ lwz r0, 0x64(r31)
/* 0000B59C 90810014 */ stw r4, 0x14(r1)
/* 0000B5A0 90010018 */ stw r0, 0x18(r1)
/* 0000B5A4 801F0068 */ lwz r0, 0x68(r31)
/* 0000B5A8 9001001C */ stw r0, 0x1c(r1)
/* 0000B5AC 80A30144 */ lwz r5, 0x144(r3)
/* 0000B5B0 48000028 */ b lbl_0000B5D8
lbl_0000B5B4:
/* 0000B5B4 7CE40734 */ extsh r4, r7
/* 0000B5B8 38040264 */ addi r0, r4, 0x264
/* 0000B5BC 7C0500AE */ lbzx r0, r5, r0
/* 0000B5C0 28000000 */ cmplwi r0, 0
/* 0000B5C4 41820010 */ beq lbl_0000B5D4
/* 0000B5C8 7C852214 */ add r4, r5, r4
/* 0000B5CC 88C40264 */ lbz r6, 0x264(r4)
/* 0000B5D0 48000010 */ b lbl_0000B5E0
lbl_0000B5D4:
/* 0000B5D4 38E7FFFF */ addi r7, r7, -1
lbl_0000B5D8:
/* 0000B5D8 7CE00735 */ extsh. r0, r7
/* 0000B5DC 4080FFD8 */ bge lbl_0000B5B4
lbl_0000B5E0:
/* 0000B5E0 54C00DFC */ rlwinm r0, r6, 1, 0x17, 0x1e
/* 0000B5E4 3881000C */ addi r4, r1, 0xc
/* 0000B5E8 7FC402AE */ lhax r30, r4, r0
/* 0000B5EC 7FC00735 */ extsh. r0, r30
/* 0000B5F0 41800074 */ blt lbl_0000B664
/* 0000B5F4 A8050268 */ lha r0, 0x268(r5)
/* 0000B5F8 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 0000B5FC 40820068 */ bne lbl_0000B664
/* 0000B600 C0230008 */ lfs f1, 8(r3)
/* 0000B604 C0030068 */ lfs f0, 0x68(r3)
/* 0000B608 C05F006C */ lfs f2, 0x6c(r31)
/* 0000B60C EC01002A */ fadds f0, f1, f0
/* 0000B610 C0230004 */ lfs f1, 4(r3)
/* 0000B614 C063000C */ lfs f3, 0xc(r3)
/* 0000B618 EC42002A */ fadds f2, f2, f0
/* 0000B61C 4BFF4B61 */ bl mathutil_mtxA_from_mtxB_translate_xyz
/* 0000B620 4BFF4B5D */ bl mathutil_mtxA_sq_from_identity
/* 0000B624 C03F0070 */ lfs f1, 0x70(r31)
/* 0000B628 FC400890 */ fmr f2, f1
/* 0000B62C FC600890 */ fmr f3, f1
/* 0000B630 4BFF4B4D */ bl mathutil_mtxA_scale_xyz
/* 0000B634 3C600000 */ lis r3, mathutilData@ha
/* 0000B638 38630000 */ addi r3, r3, mathutilData@l
/* 0000B63C 80630000 */ lwz r3, 0(r3)
/* 0000B640 38800000 */ li r4, 0
/* 0000B644 4BFF4B39 */ bl gxutil_load_pos_nrm_matrix
/* 0000B648 3C600000 */ lis r3, minigameGma@ha
/* 0000B64C 38630000 */ addi r3, r3, minigameGma@l
/* 0000B650 80630000 */ lwz r3, 0(r3)
/* 0000B654 57C01838 */ slwi r0, r30, 3
/* 0000B658 80630008 */ lwz r3, 8(r3)
/* 0000B65C 7C63002E */ lwzx r3, r3, r0
/* 0000B660 4BFF4B1D */ bl avdisp_draw_model_culled_sort_translucent
lbl_0000B664:
/* 0000B664 8001002C */ lwz r0, 0x2c(r1)
/* 0000B668 83E10024 */ lwz r31, 0x24(r1)
/* 0000B66C 83C10020 */ lwz r30, 0x20(r1)
/* 0000B670 7C0803A6 */ mtlr r0
/* 0000B674 38210028 */ addi r1, r1, 0x28
/* 0000B678 4E800020 */ blr 
