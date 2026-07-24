/* 000066C4 7C0802A6 */ mflr r0
/* 000066C8 2C040003 */ cmpwi r4, 3
/* 000066CC 90010004 */ stw r0, 4(r1)
/* 000066D0 3CE00000 */ lis r7, lbl_0000F020@ha
/* 000066D4 9421FFB8 */ stwu r1, -0x48(r1)
/* 000066D8 DBE10040 */ stfd f31, 0x40(r1)
/* 000066DC 93E1003C */ stw r31, 0x3c(r1)
/* 000066E0 3BE70000 */ addi r31, r7, lbl_0000F020@l
/* 000066E4 93C10038 */ stw r30, 0x38(r1)
/* 000066E8 93A10034 */ stw r29, 0x34(r1)
/* 000066EC 7C7D1B78 */ mr r29, r3
/* 000066F0 93810030 */ stw r28, 0x30(r1)
/* 000066F4 880300C0 */ lbz r0, 0xc0(r3)
/* 000066F8 3C600000 */ lis r3, ballInfo@ha
/* 000066FC 7C060774 */ extsb r6, r0
/* 00006700 1CA601A4 */ mulli r5, r6, 0x1a4
/* 00006704 38030000 */ addi r0, r3, ballInfo@l
/* 00006708 7FC02A14 */ add r30, r0, r5
/* 0000670C 41820008 */ beq lbl_00006714
/* 00006710 48000010 */ b lbl_00006720
lbl_00006714:
/* 00006714 7FA3EB78 */ mr r3, r29
/* 00006718 4BFF9A49 */ bl ape_destroy
/* 0000671C 48000184 */ b lbl_000068A0
lbl_00006720:
/* 00006720 3C600000 */ lis r3, debugFlags@ha
/* 00006724 80030000 */ lwz r0, debugFlags@l(r3)
/* 00006728 7000000A */ andi. r0, r0, 0xa
/* 0000672C 40820174 */ bne lbl_000068A0
/* 00006730 3C600000 */ lis r3, modeCtrl@ha
/* 00006734 38630000 */ addi r3, r3, modeCtrl@l
/* 00006738 8003002C */ lwz r0, 0x2c(r3)
/* 0000673C 7C060000 */ cmpw r6, r0
/* 00006740 40820160 */ bne lbl_000068A0
/* 00006744 387E0004 */ addi r3, r30, 4
/* 00006748 38810010 */ addi r4, r1, 0x10
/* 0000674C 38A00000 */ li r5, 0
/* 00006750 4BFF9A11 */ bl raycast_stage_down
/* 00006754 807D0014 */ lwz r3, 0x14(r29)
/* 00006758 3800FFEC */ li r0, -20
/* 0000675C 7C600038 */ and r0, r3, r0
/* 00006760 901D0014 */ stw r0, 0x14(r29)
/* 00006764 80010010 */ lwz r0, 0x10(r1)
/* 00006768 540007FF */ clrlwi. r0, r0, 0x1f
/* 0000676C 40820024 */ bne lbl_00006790
/* 00006770 C03E0020 */ lfs f1, 0x20(r30)
/* 00006774 C01F2144 */ lfs f0, 0x2144(r31)
/* 00006778 FC010040 */ fcmpo cr0, f1, f0
/* 0000677C 40800014 */ bge lbl_00006790
/* 00006780 801D0014 */ lwz r0, 0x14(r29)
/* 00006784 60000002 */ ori r0, r0, 2
/* 00006788 901D0014 */ stw r0, 0x14(r29)
/* 0000678C 4800003C */ b lbl_000067C8
lbl_00006790:
/* 00006790 387E00B8 */ addi r3, r30, 0xb8
/* 00006794 C0230000 */ lfs f1, 0(r3)
/* 00006798 C0430004 */ lfs f2, 4(r3)
/* 0000679C C0030008 */ lfs f0, 8(r3)
/* 000067A0 EC210072 */ fmuls f1, f1, f1
/* 000067A4 EC2208BA */ fmadds f1, f2, f2, f1
/* 000067A8 EC20083A */ fmadds f1, f0, f0, f1
/* 000067AC 4BFF99B5 */ bl mathutil_sqrt
/* 000067B0 C01F2148 */ lfs f0, 0x2148(r31)
/* 000067B4 FC010040 */ fcmpo cr0, f1, f0
/* 000067B8 40800010 */ bge lbl_000067C8
/* 000067BC 801D0014 */ lwz r0, 0x14(r29)
/* 000067C0 60000001 */ ori r0, r0, 1
/* 000067C4 901D0014 */ stw r0, 0x14(r29)
lbl_000067C8:
/* 000067C8 801D0014 */ lwz r0, 0x14(r29)
/* 000067CC 387D0000 */ addi r3, r29, 0
/* 000067D0 540007BE */ clrlwi r0, r0, 0x1e
/* 000067D4 7C000034 */ cntlzw r0, r0
/* 000067D8 541CD97E */ srwi r28, r0, 5
/* 000067DC 4BFF9985 */ bl u_ball_something_with_ape_rotation
/* 000067E0 2C1C0000 */ cmpwi r28, 0
/* 000067E4 41820014 */ beq lbl_000067F8
/* 000067E8 7FA3EB78 */ mr r3, r29
/* 000067EC 4BFF9975 */ bl u_ball_something_with_walking_speed
/* 000067F0 FFE00890 */ fmr f31, f1
/* 000067F4 48000028 */ b lbl_0000681C
lbl_000067F8:
/* 000067F8 C3FF1C98 */ lfs f31, 0x1c98(r31)
/* 000067FC 387D0060 */ addi r3, r29, 0x60
/* 00006800 4BFF9961 */ bl mathutil_mtxA_from_quat
/* 00006804 4BFF995D */ bl mathutil_mtxA_normalize_basis
/* 00006808 801D0014 */ lwz r0, 0x14(r29)
/* 0000680C 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00006810 4182000C */ beq lbl_0000681C
/* 00006814 7FA3EB78 */ mr r3, r29
/* 00006818 4BFF9949 */ bl func_80037718
lbl_0000681C:
/* 0000681C 801E0094 */ lwz r0, 0x94(r30)
/* 00006820 540006B5 */ rlwinm. r0, r0, 0, 0x1a, 0x1a
/* 00006824 41820028 */ beq lbl_0000684C
/* 00006828 387E001C */ addi r3, r30, 0x1c
/* 0000682C C0230000 */ lfs f1, 0(r3)
/* 00006830 C0430004 */ lfs f2, 4(r3)
/* 00006834 C0030008 */ lfs f0, 8(r3)
/* 00006838 EC210072 */ fmuls f1, f1, f1
/* 0000683C EC2208BA */ fmadds f1, f2, f2, f1
/* 00006840 EC20083A */ fmadds f1, f0, f0, f1
/* 00006844 4BFF991D */ bl mathutil_sqrt
/* 00006848 FFE00890 */ fmr f31, f1
lbl_0000684C:
/* 0000684C 7FA3EB78 */ mr r3, r29
/* 00006850 4BFF9911 */ bl check_ball_teeter
/* 00006854 387D0060 */ addi r3, r29, 0x60
/* 00006858 4BFF9909 */ bl mathutil_mtxA_to_quat
/* 0000685C 7FA3EB78 */ mr r3, r29
/* 00006860 FC20F890 */ fmr f1, f31
/* 00006864 48000061 */ bl lbl_000068C4
/* 00006868 7FA3EB78 */ mr r3, r29
/* 0000686C 4BFF98F5 */ bl ape_skel_anim_main
/* 00006870 801D0014 */ lwz r0, 0x14(r29)
/* 00006874 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 00006878 4082000C */ bne lbl_00006884
/* 0000687C 7FA3EB78 */ mr r3, r29
/* 00006880 4BFF98E1 */ bl func_8003765C
lbl_00006884:
/* 00006884 387D0000 */ addi r3, r29, 0
/* 00006888 389E0104 */ addi r4, r30, 0x104
/* 0000688C 4BFF98D5 */ bl ape_face_dir
/* 00006890 38000000 */ li r0, 0
/* 00006894 901E0100 */ stw r0, 0x100(r30)
/* 00006898 C01F1C98 */ lfs f0, 0x1c98(r31)
/* 0000689C D01E0110 */ stfs f0, 0x110(r30)
lbl_000068A0:
/* 000068A0 8001004C */ lwz r0, 0x4c(r1)
/* 000068A4 CBE10040 */ lfd f31, 0x40(r1)
/* 000068A8 83E1003C */ lwz r31, 0x3c(r1)
/* 000068AC 7C0803A6 */ mtlr r0
/* 000068B0 83C10038 */ lwz r30, 0x38(r1)
/* 000068B4 83A10034 */ lwz r29, 0x34(r1)
/* 000068B8 83810030 */ lwz r28, 0x30(r1)
/* 000068BC 38210048 */ addi r1, r1, 0x48
/* 000068C0 4E800020 */ blr 
