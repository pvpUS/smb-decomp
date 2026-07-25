/* 000065F0 7C0802A6 */ mflr r0
/* 000065F4 3C600000 */ lis r3, lbl_0000FE78@ha
/* 000065F8 90010004 */ stw r0, 4(r1)
/* 000065FC 9421FF20 */ stwu r1, -0xe0(r1)
/* 00006600 BF2100C4 */ stmw r25, 0xc4(r1)
/* 00006604 3BC30000 */ addi r30, r3, lbl_0000FE78@l
/* 00006608 3C600000 */ lis r3, currentCamera@ha
/* 0000660C 3BE30000 */ addi r31, r3, currentCamera@l
/* 00006610 801E019C */ lwz r0, 0x19c(r30)
/* 00006614 9001009C */ stw r0, 0x9c(r1)
/* 00006618 801E01A0 */ lwz r0, 0x1a0(r30)
/* 0000661C 90010098 */ stw r0, 0x98(r1)
/* 00006620 801E01A4 */ lwz r0, 0x1a4(r30)
/* 00006624 90010094 */ stw r0, 0x94(r1)
/* 00006628 801E01A8 */ lwz r0, 0x1a8(r30)
/* 0000662C 90010090 */ stw r0, 0x90(r1)
/* 00006630 801E01AC */ lwz r0, 0x1ac(r30)
/* 00006634 9001008C */ stw r0, 0x8c(r1)
/* 00006638 807F0000 */ lwz r3, 0(r31)
/* 0000663C 3863000C */ addi r3, r3, 0xc
/* 00006640 4BFF9B1D */ bl mathutil_mtxA_from_translate
/* 00006644 3C600000 */ lis r3, powerOnTimer@ha
/* 00006648 C05E01B0 */ lfs f2, 0x1b0(r30)
/* 0000664C 3B830000 */ addi r28, r3, powerOnTimer@l
/* 00006650 801C0000 */ lwz r0, 0(r28)
/* 00006654 3C600000 */ lis r3, lbl_0000FEC8@ha
/* 00006658 3FA04330 */ lis r29, 0x4330
/* 0000665C C8230000 */ lfd f1, lbl_0000FEC8@l(r3)
/* 00006660 5400402E */ slwi r0, r0, 8
/* 00006664 900100BC */ stw r0, 0xbc(r1)
/* 00006668 93A100B8 */ stw r29, 0xb8(r1)
/* 0000666C C80100B8 */ lfd f0, 0xb8(r1)
/* 00006670 EC000828 */ fsubs f0, f0, f1
/* 00006674 EC020032 */ fmuls f0, f2, f0
/* 00006678 FC00001E */ fctiwz f0, f0
/* 0000667C D80100B0 */ stfd f0, 0xb0(r1)
/* 00006680 806100B4 */ lwz r3, 0xb4(r1)
/* 00006684 4BFF9AD9 */ bl mathutil_mtxA_rotate_y
/* 00006688 3B410040 */ addi r26, r1, 0x40
/* 0000668C C0DE009C */ lfs f6, 0x9c(r30)
/* 00006690 3F60E000 */ lis r27, 0xe000
/* 00006694 C0BB0008 */ lfs f5, 8(r27)
/* 00006698 C09B000C */ lfs f4, 0xc(r27)
/* 0000669C C07B0018 */ lfs f3, 0x18(r27)
/* 000066A0 C05B001C */ lfs f2, 0x1c(r27)
/* 000066A4 C03B0028 */ lfs f1, 0x28(r27)
/* 000066A8 C01B002C */ lfs f0, 0x2c(r27)
/* 000066AC ECA521BA */ fmadds f5, f5, f6, f4
/* 000066B0 D0A10040 */ stfs f5, 0x40(r1)
/* 000066B4 EC6311BA */ fmadds f3, f3, f6, f2
/* 000066B8 D0610044 */ stfs f3, 0x44(r1)
/* 000066BC EC2101BA */ fmadds f1, f1, f6, f0
/* 000066C0 D0210048 */ stfs f1, 0x48(r1)
/* 000066C4 807F0000 */ lwz r3, 0(r31)
/* 000066C8 3863000C */ addi r3, r3, 0xc
/* 000066CC 4BFF9A91 */ bl mathutil_mtxA_from_translate
/* 000066D0 801C0000 */ lwz r0, 0(r28)
/* 000066D4 5403402E */ slwi r3, r0, 8
/* 000066D8 4BFF9A85 */ bl mathutil_mtxA_rotate_x
/* 000066DC 3B210034 */ addi r25, r1, 0x34
/* 000066E0 C0DE01B4 */ lfs f6, 0x1b4(r30)
/* 000066E4 C0BB0008 */ lfs f5, 8(r27)
/* 000066E8 C09B000C */ lfs f4, 0xc(r27)
/* 000066EC C07B0018 */ lfs f3, 0x18(r27)
/* 000066F0 C05B001C */ lfs f2, 0x1c(r27)
/* 000066F4 C03B0028 */ lfs f1, 0x28(r27)
/* 000066F8 C01B002C */ lfs f0, 0x2c(r27)
/* 000066FC ECA521BA */ fmadds f5, f5, f6, f4
/* 00006700 D0A10034 */ stfs f5, 0x34(r1)
/* 00006704 EC6311BA */ fmadds f3, f3, f6, f2
/* 00006708 D0610038 */ stfs f3, 0x38(r1)
/* 0000670C EC2101BA */ fmadds f1, f1, f6, f0
/* 00006710 D021003C */ stfs f1, 0x3c(r1)
/* 00006714 807F0000 */ lwz r3, 0(r31)
/* 00006718 3863000C */ addi r3, r3, 0xc
/* 0000671C 4BFF9A41 */ bl mathutil_mtxA_from_translate
/* 00006720 801C0000 */ lwz r0, 0(r28)
/* 00006724 3C600000 */ lis r3, lbl_0000FEC8@ha
/* 00006728 C8230000 */ lfd f1, lbl_0000FEC8@l(r3)
/* 0000672C 5400402E */ slwi r0, r0, 8
/* 00006730 C05E01B8 */ lfs f2, 0x1b8(r30)
/* 00006734 900100AC */ stw r0, 0xac(r1)
/* 00006738 93A100A8 */ stw r29, 0xa8(r1)
/* 0000673C C80100A8 */ lfd f0, 0xa8(r1)
/* 00006740 EC000828 */ fsubs f0, f0, f1
/* 00006744 EC020032 */ fmuls f0, f2, f0
/* 00006748 FC00001E */ fctiwz f0, f0
/* 0000674C D80100A0 */ stfd f0, 0xa0(r1)
/* 00006750 806100A4 */ lwz r3, 0xa4(r1)
/* 00006754 4BFF9A09 */ bl mathutil_mtxA_rotate_z
/* 00006758 C03E0060 */ lfs f1, 0x60(r30)
/* 0000675C 38610028 */ addi r3, r1, 0x28
/* 00006760 C05E009C */ lfs f2, 0x9c(r30)
/* 00006764 FC600890 */ fmr f3, f1
/* 00006768 4BFF99F5 */ bl mathutil_mtxA_tf_point_xyz
/* 0000676C C03E0060 */ lfs f1, 0x60(r30)
/* 00006770 3861004C */ addi r3, r1, 0x4c
/* 00006774 38800000 */ li r4, 0
/* 00006778 4BFF99E5 */ bl GXInitLightSpot
/* 0000677C C03E018C */ lfs f1, 0x18c(r30)
/* 00006780 3861004C */ addi r3, r1, 0x4c
/* 00006784 C05E01BC */ lfs f2, 0x1bc(r30)
/* 00006788 38800003 */ li r4, 3
/* 0000678C 4BFF99D1 */ bl GXInitLightDistAttn
/* 00006790 387A0000 */ addi r3, r26, 0
/* 00006794 3881001C */ addi r4, r1, 0x1c
/* 00006798 4BFF99C5 */ bl mathutil_mtxA_tf_point
/* 0000679C C021001C */ lfs f1, 0x1c(r1)
/* 000067A0 3861004C */ addi r3, r1, 0x4c
/* 000067A4 C0410020 */ lfs f2, 0x20(r1)
/* 000067A8 C0610024 */ lfs f3, 0x24(r1)
/* 000067AC 4BFF99B1 */ bl GXInitLightPos
/* 000067B0 80010090 */ lwz r0, 0x90(r1)
/* 000067B4 38810018 */ addi r4, r1, 0x18
/* 000067B8 3861004C */ addi r3, r1, 0x4c
/* 000067BC 90010018 */ stw r0, 0x18(r1)
/* 000067C0 4BFF999D */ bl GXInitLightColor
/* 000067C4 3861004C */ addi r3, r1, 0x4c
/* 000067C8 38800004 */ li r4, 4
/* 000067CC 4BFF9991 */ bl GXLoadLightObjImm
/* 000067D0 C03E0060 */ lfs f1, 0x60(r30)
/* 000067D4 3861004C */ addi r3, r1, 0x4c
/* 000067D8 38800000 */ li r4, 0
/* 000067DC 4BFF9981 */ bl GXInitLightSpot
/* 000067E0 C03E018C */ lfs f1, 0x18c(r30)
/* 000067E4 3861004C */ addi r3, r1, 0x4c
/* 000067E8 C05E01BC */ lfs f2, 0x1bc(r30)
/* 000067EC 38800003 */ li r4, 3
/* 000067F0 4BFF996D */ bl GXInitLightDistAttn
/* 000067F4 38790000 */ addi r3, r25, 0
/* 000067F8 3881001C */ addi r4, r1, 0x1c
/* 000067FC 4BFF9961 */ bl mathutil_mtxA_tf_point
/* 00006800 C021001C */ lfs f1, 0x1c(r1)
/* 00006804 3861004C */ addi r3, r1, 0x4c
/* 00006808 C0410020 */ lfs f2, 0x20(r1)
/* 0000680C C0610024 */ lfs f3, 0x24(r1)
/* 00006810 4BFF994D */ bl GXInitLightPos
/* 00006814 8001008C */ lwz r0, 0x8c(r1)
/* 00006818 38810014 */ addi r4, r1, 0x14
/* 0000681C 3861004C */ addi r3, r1, 0x4c
/* 00006820 90010014 */ stw r0, 0x14(r1)
/* 00006824 4BFF9939 */ bl GXInitLightColor
/* 00006828 3861004C */ addi r3, r1, 0x4c
/* 0000682C 38800008 */ li r4, 8
/* 00006830 4BFF992D */ bl GXLoadLightObjImm
/* 00006834 C03E0060 */ lfs f1, 0x60(r30)
/* 00006838 3861004C */ addi r3, r1, 0x4c
/* 0000683C 38800000 */ li r4, 0
/* 00006840 4BFF991D */ bl GXInitLightSpot
/* 00006844 C03E018C */ lfs f1, 0x18c(r30)
/* 00006848 3861004C */ addi r3, r1, 0x4c
/* 0000684C C05E01BC */ lfs f2, 0x1bc(r30)
/* 00006850 38800003 */ li r4, 3
/* 00006854 4BFF9909 */ bl GXInitLightDistAttn
/* 00006858 38610028 */ addi r3, r1, 0x28
/* 0000685C 3881001C */ addi r4, r1, 0x1c
/* 00006860 4BFF98FD */ bl mathutil_mtxA_tf_point
/* 00006864 C021001C */ lfs f1, 0x1c(r1)
/* 00006868 3861004C */ addi r3, r1, 0x4c
/* 0000686C C0410020 */ lfs f2, 0x20(r1)
/* 00006870 C0610024 */ lfs f3, 0x24(r1)
/* 00006874 4BFF98E9 */ bl GXInitLightPos
/* 00006878 80010094 */ lwz r0, 0x94(r1)
/* 0000687C 38810010 */ addi r4, r1, 0x10
/* 00006880 3861004C */ addi r3, r1, 0x4c
/* 00006884 90010010 */ stw r0, 0x10(r1)
/* 00006888 4BFF98D5 */ bl GXInitLightColor
/* 0000688C 3861004C */ addi r3, r1, 0x4c
/* 00006890 38800010 */ li r4, 0x10
/* 00006894 4BFF98C9 */ bl GXLoadLightObjImm
/* 00006898 8001009C */ lwz r0, 0x9c(r1)
/* 0000689C 3881000C */ addi r4, r1, 0xc
/* 000068A0 38600000 */ li r3, 0
/* 000068A4 9001000C */ stw r0, 0xc(r1)
/* 000068A8 4BFF98B5 */ bl GXSetChanMatColor
/* 000068AC 80010098 */ lwz r0, 0x98(r1)
/* 000068B0 38810008 */ addi r4, r1, 8
/* 000068B4 38600000 */ li r3, 0
/* 000068B8 90010008 */ stw r0, 8(r1)
/* 000068BC 4BFF98A1 */ bl GXSetChanAmbColor
/* 000068C0 38600004 */ li r3, 4
/* 000068C4 38800001 */ li r4, 1
/* 000068C8 38A00000 */ li r5, 0
/* 000068CC 38C00000 */ li r6, 0
/* 000068D0 38E0001C */ li r7, 0x1c
/* 000068D4 39000002 */ li r8, 2
/* 000068D8 39200002 */ li r9, 2
/* 000068DC 4BFF9881 */ bl GXSetChanCtrl
/* 000068E0 38600001 */ li r3, 1
/* 000068E4 4BFF9879 */ bl GXSetNumChans
/* 000068E8 38600000 */ li r3, 0
/* 000068EC 388000FF */ li r4, 0xff
/* 000068F0 38A000FF */ li r5, 0xff
/* 000068F4 38C00004 */ li r6, 4
/* 000068F8 4BFF9865 */ bl GXSetTevOrder_cached
/* 000068FC 38600000 */ li r3, 0
/* 00006900 38800004 */ li r4, 4
/* 00006904 4BFF9859 */ bl GXSetTevOp_cached
/* 00006908 38600000 */ li r3, 0
/* 0000690C 4BFF9851 */ bl GXSetNumTexGens
/* 00006910 38600001 */ li r3, 1
/* 00006914 4BFF9849 */ bl GXSetNumTevStages_cached
/* 00006918 807F0000 */ lwz r3, 0(r31)
/* 0000691C 3863000C */ addi r3, r3, 0xc
/* 00006920 4BFF983D */ bl mathutil_mtxA_from_mtxB_translate
/* 00006924 C03E01C0 */ lfs f1, 0x1c0(r30)
/* 00006928 4BFF9835 */ bl mathutil_mtxA_scale_s
/* 0000692C 3C600000 */ lis r3, mathutilData@ha
/* 00006930 3BC30000 */ addi r30, r3, mathutilData@l
/* 00006934 807E0000 */ lwz r3, 0(r30)
/* 00006938 38800000 */ li r4, 0
/* 0000693C 4BFF9821 */ bl GXLoadNrmMtxImm
/* 00006940 807E0000 */ lwz r3, 0(r30)
/* 00006944 38800000 */ li r4, 0
/* 00006948 4BFF9815 */ bl GXLoadPosMtxImm
/* 0000694C 38600000 */ li r3, 0
/* 00006950 4BFF980D */ bl GXSetCurrentMtx
/* 00006954 38600008 */ li r3, 8
/* 00006958 38800008 */ li r4, 8
/* 0000695C 4BFF9801 */ bl GXDrawSphere
/* 00006960 BB2100C4 */ lmw r25, 0xc4(r1)
/* 00006964 800100E4 */ lwz r0, 0xe4(r1)
/* 00006968 382100E0 */ addi r1, r1, 0xe0
/* 0000696C 7C0803A6 */ mtlr r0
/* 00006970 4E800020 */ blr 
