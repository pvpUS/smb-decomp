/* 000056BC 7C0802A6 */ mflr r0
/* 000056C0 3C600000 */ lis r3, lbl_0000FE78@ha
/* 000056C4 90010004 */ stw r0, 4(r1)
/* 000056C8 9421FFE0 */ stwu r1, -0x20(r1)
/* 000056CC 93E1001C */ stw r31, 0x1c(r1)
/* 000056D0 3BE30000 */ addi r31, r3, lbl_0000FE78@l
/* 000056D4 3881000C */ addi r4, r1, 0xc
/* 000056D8 801F0180 */ lwz r0, 0x180(r31)
/* 000056DC 38600000 */ li r3, 0
/* 000056E0 90010010 */ stw r0, 0x10(r1)
/* 000056E4 801F017C */ lwz r0, 0x17c(r31)
/* 000056E8 9001000C */ stw r0, 0xc(r1)
/* 000056EC 4BFFAA71 */ bl GXSetChanMatColor
/* 000056F0 80010010 */ lwz r0, 0x10(r1)
/* 000056F4 38810008 */ addi r4, r1, 8
/* 000056F8 38600000 */ li r3, 0
/* 000056FC 90010008 */ stw r0, 8(r1)
/* 00005700 4BFFAA5D */ bl GXSetChanAmbColor
/* 00005704 38600004 */ li r3, 4
/* 00005708 38800000 */ li r4, 0
/* 0000570C 38A00000 */ li r5, 0
/* 00005710 38C00000 */ li r6, 0
/* 00005714 38E00000 */ li r7, 0
/* 00005718 39000000 */ li r8, 0
/* 0000571C 39200002 */ li r9, 2
/* 00005720 4BFFAA3D */ bl GXSetChanCtrl
/* 00005724 38600001 */ li r3, 1
/* 00005728 4BFFAA35 */ bl GXSetNumChans
/* 0000572C 38600000 */ li r3, 0
/* 00005730 388000FF */ li r4, 0xff
/* 00005734 38A000FF */ li r5, 0xff
/* 00005738 38C00004 */ li r6, 4
/* 0000573C 4BFFAA21 */ bl GXSetTevOrder_cached
/* 00005740 38600000 */ li r3, 0
/* 00005744 38800004 */ li r4, 4
/* 00005748 4BFFAA15 */ bl GXSetTevOp_cached
/* 0000574C 38600000 */ li r3, 0
/* 00005750 4BFFAA0D */ bl GXSetNumTexGens
/* 00005754 38600001 */ li r3, 1
/* 00005758 4BFFAA05 */ bl GXSetNumTevStages_cached
/* 0000575C 3C600000 */ lis r3, currentCamera@ha
/* 00005760 38630000 */ addi r3, r3, currentCamera@l
/* 00005764 80630000 */ lwz r3, 0(r3)
/* 00005768 3863000C */ addi r3, r3, 0xc
/* 0000576C 4BFFA9F1 */ bl mathutil_mtxA_from_mtxB_translate
/* 00005770 C03F0184 */ lfs f1, 0x184(r31)
/* 00005774 4BFFA9E9 */ bl mathutil_mtxA_scale_s
/* 00005778 3C600000 */ lis r3, mathutilData@ha
/* 0000577C 3BE30000 */ addi r31, r3, mathutilData@l
/* 00005780 807F0000 */ lwz r3, 0(r31)
/* 00005784 38800000 */ li r4, 0
/* 00005788 4BFFA9D5 */ bl GXLoadNrmMtxImm
/* 0000578C 807F0000 */ lwz r3, 0(r31)
/* 00005790 38800000 */ li r4, 0
/* 00005794 4BFFA9C9 */ bl GXLoadPosMtxImm
/* 00005798 38600000 */ li r3, 0
/* 0000579C 4BFFA9C1 */ bl GXSetCurrentMtx
/* 000057A0 38600008 */ li r3, 8
/* 000057A4 38800008 */ li r4, 8
/* 000057A8 4BFFA9B5 */ bl GXDrawSphere
/* 000057AC 80010024 */ lwz r0, 0x24(r1)
/* 000057B0 83E1001C */ lwz r31, 0x1c(r1)
/* 000057B4 38210020 */ addi r1, r1, 0x20
/* 000057B8 7C0803A6 */ mtlr r0
/* 000057BC 4E800020 */ blr 
