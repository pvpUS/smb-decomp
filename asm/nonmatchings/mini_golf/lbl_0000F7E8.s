/* 0000F7E8 7C0802A6 */ mflr r0
/* 0000F7EC 3C800000 */ lis r4, lbl_10000170@ha
/* 0000F7F0 90010004 */ stw r0, 4(r1)
/* 0000F7F4 9421FF80 */ stwu r1, -0x80(r1)
/* 0000F7F8 DBE10078 */ stfd f31, 0x78(r1)
/* 0000F7FC 93E10074 */ stw r31, 0x74(r1)
/* 0000F800 3BE40000 */ addi r31, r4, lbl_10000170@l
/* 0000F804 93C10070 */ stw r30, 0x70(r1)
/* 0000F808 93A1006C */ stw r29, 0x6c(r1)
/* 0000F80C 3BA30000 */ addi r29, r3, 0
/* 0000F810 93810068 */ stw r28, 0x68(r1)
/* 0000F814 4BFF9BF1 */ bl lbl_00009404
/* 0000F818 3C800000 */ lis r4, modeCtrl@ha
/* 0000F81C 38840000 */ addi r4, r4, modeCtrl@l
/* 0000F820 3BC4002C */ addi r30, r4, 0x2c
/* 0000F824 5464063E */ clrlwi r4, r3, 0x18
/* 0000F828 807E0000 */ lwz r3, 0(r30)
/* 0000F82C 4BFF9BA9 */ bl lbl_000093D4
/* 0000F830 5460063E */ clrlwi r0, r3, 0x18
/* 0000F834 28000001 */ cmplwi r0, 1
/* 0000F838 4082000C */ bne lbl_0000F844
/* 0000F83C 3B80021C */ li r28, 0x21c
/* 0000F840 48000048 */ b lbl_0000F888
lbl_0000F844:
/* 0000F844 4BFF9BC1 */ bl lbl_00009404
/* 0000F848 5464063E */ clrlwi r4, r3, 0x18
/* 0000F84C 807E0000 */ lwz r3, 0(r30)
/* 0000F850 4BFF9B85 */ bl lbl_000093D4
/* 0000F854 5460063E */ clrlwi r0, r3, 0x18
/* 0000F858 28000002 */ cmplwi r0, 2
/* 0000F85C 4082000C */ bne lbl_0000F868
/* 0000F860 3B8000F0 */ li r28, 0xf0
/* 0000F864 48000024 */ b lbl_0000F888
lbl_0000F868:
/* 0000F868 4BFF9B9D */ bl lbl_00009404
/* 0000F86C 5464063E */ clrlwi r4, r3, 0x18
/* 0000F870 807E0000 */ lwz r3, 0(r30)
/* 0000F874 4BFF9B61 */ bl lbl_000093D4
/* 0000F878 5460063E */ clrlwi r0, r3, 0x18
/* 0000F87C 28000003 */ cmplwi r0, 3
/* 0000F880 40820008 */ bne lbl_0000F888
/* 0000F884 3B8000F0 */ li r28, 0xf0
lbl_0000F888:
/* 0000F888 809F000C */ lwz r4, 0xc(r31)
/* 0000F88C 7C04E040 */ cmplw r4, r28
/* 0000F890 40800074 */ bge lbl_0000F904
/* 0000F894 809D00FC */ lwz r4, 0xfc(r29)
/* 0000F898 3C600000 */ lis r3, globalAnimTimer@ha
/* 0000F89C 80040014 */ lwz r0, 0x14(r4)
/* 0000F8A0 540004A0 */ rlwinm r0, r0, 0, 0x12, 0x10
/* 0000F8A4 90040014 */ stw r0, 0x14(r4)
/* 0000F8A8 C01D0008 */ lfs f0, 8(r29)
/* 0000F8AC D01D0014 */ stfs f0, 0x14(r29)
/* 0000F8B0 80030000 */ lwz r0, globalAnimTimer@l(r3)
/* 0000F8B4 5403502A */ slwi r3, r0, 0xa
/* 0000F8B8 4BFF0919 */ bl mathutil_sin
/* 0000F8BC 3C600000 */ lis r3, (lbl_000264A8+0x20)@ha
/* 0000F8C0 C8030000 */ lfd f0, (lbl_000264A8+0x20)@l(r3)
/* 0000F8C4 FFE00072 */ fmul f31, f0, f1
/* 0000F8C8 4BFF9A09 */ bl lbl_000092D0
/* 0000F8CC 3C600000 */ lis r3, lbl_000264E0@ha
/* 0000F8D0 C8030000 */ lfd f0, lbl_000264E0@l(r3)
/* 0000F8D4 387D0000 */ addi r3, r29, 0
/* 0000F8D8 3881000C */ addi r4, r1, 0xc
/* 0000F8DC FC00082A */ fadd f0, f0, f1
/* 0000F8E0 FC00F82A */ fadd f0, f0, f31
/* 0000F8E4 FC000018 */ frsp f0, f0
/* 0000F8E8 D01D0008 */ stfs f0, 8(r29)
/* 0000F8EC C03D0008 */ lfs f1, 8(r29)
/* 0000F8F0 C01D0014 */ lfs f0, 0x14(r29)
/* 0000F8F4 EC010028 */ fsubs f0, f1, f0
/* 0000F8F8 D01D0020 */ stfs f0, 0x20(r29)
/* 0000F8FC 4BFF08D5 */ bl init_physball_from_ball
/* 0000F900 480000BC */ b lbl_0000F9BC
lbl_0000F904:
/* 0000F904 4082004C */ bne lbl_0000F950
/* 0000F908 809D00FC */ lwz r4, 0xfc(r29)
/* 0000F90C 3C600000 */ lis r3, cameraInfo@ha
/* 0000F910 38A30000 */ addi r5, r3, cameraInfo@l
/* 0000F914 80040014 */ lwz r0, 0x14(r4)
/* 0000F918 38C00008 */ li r6, 8
/* 0000F91C 387D0000 */ addi r3, r29, 0
/* 0000F920 60004000 */ ori r0, r0, 0x4000
/* 0000F924 90040014 */ stw r0, 0x14(r4)
/* 0000F928 3881000C */ addi r4, r1, 0xc
/* 0000F92C 801D0094 */ lwz r0, 0x94(r29)
/* 0000F930 60000040 */ ori r0, r0, 0x40
/* 0000F934 901D0094 */ stw r0, 0x94(r29)
/* 0000F938 801E0000 */ lwz r0, 0(r30)
/* 0000F93C 1C000284 */ mulli r0, r0, 0x284
/* 0000F940 7CA50214 */ add r5, r5, r0
/* 0000F944 98C5001F */ stb r6, 0x1f(r5)
/* 0000F948 4BFF0889 */ bl init_physball_from_ball
/* 0000F94C 48000070 */ b lbl_0000F9BC
lbl_0000F950:
/* 0000F950 807D00FC */ lwz r3, 0xfc(r29)
/* 0000F954 38630060 */ addi r3, r3, 0x60
/* 0000F958 4BFF0879 */ bl mathutil_mtxA_from_quat
/* 0000F95C 38600800 */ li r3, 0x800
/* 0000F960 4BFF0871 */ bl mathutil_mtxA_rotate_y
/* 0000F964 807D00FC */ lwz r3, 0xfc(r29)
/* 0000F968 38630060 */ addi r3, r3, 0x60
/* 0000F96C 4BFF0865 */ bl mathutil_mtxA_to_quat
/* 0000F970 809D0094 */ lwz r4, 0x94(r29)
/* 0000F974 548005AD */ rlwinm. r0, r4, 0, 0x16, 0x16
/* 0000F978 40820034 */ bne lbl_0000F9AC
/* 0000F97C 807D00FC */ lwz r3, 0xfc(r29)
/* 0000F980 80030014 */ lwz r0, 0x14(r3)
/* 0000F984 54000463 */ rlwinm. r0, r0, 0, 0x11, 0x11
/* 0000F988 41820024 */ beq lbl_0000F9AC
/* 0000F98C 3800FAFF */ li r0, -1281
/* 0000F990 7C800038 */ and r0, r4, r0
/* 0000F994 901D0094 */ stw r0, 0x94(r29)
/* 0000F998 38600126 */ li r3, 0x126
/* 0000F99C 801D0094 */ lwz r0, 0x94(r29)
/* 0000F9A0 60000200 */ ori r0, r0, 0x200
/* 0000F9A4 901D0094 */ stw r0, 0x94(r29)
/* 0000F9A8 4BFF0829 */ bl u_play_sound_0
lbl_0000F9AC:
/* 0000F9AC 387D0000 */ addi r3, r29, 0
/* 0000F9B0 3881000C */ addi r4, r1, 0xc
/* 0000F9B4 38A00000 */ li r5, 0
/* 0000F9B8 4800094D */ bl lbl_00010304
lbl_0000F9BC:
/* 0000F9BC 80BF000C */ lwz r5, 0xc(r31)
/* 0000F9C0 387D0000 */ addi r3, r29, 0
/* 0000F9C4 3881000C */ addi r4, r1, 0xc
/* 0000F9C8 38050001 */ addi r0, r5, 1
/* 0000F9CC 901F000C */ stw r0, 0xc(r31)
/* 0000F9D0 38A00000 */ li r5, 0
/* 0000F9D4 4BFF07FD */ bl handle_ball_rotational_kinematics
/* 0000F9D8 387D0000 */ addi r3, r29, 0
/* 0000F9DC 3881000C */ addi r4, r1, 0xc
/* 0000F9E0 38A00000 */ li r5, 0
/* 0000F9E4 4BFF07ED */ bl update_ball_ape_transform
/* 0000F9E8 807D0080 */ lwz r3, 0x80(r29)
/* 0000F9EC 38030001 */ addi r0, r3, 1
/* 0000F9F0 901D0080 */ stw r0, 0x80(r29)
/* 0000F9F4 80010084 */ lwz r0, 0x84(r1)
/* 0000F9F8 CBE10078 */ lfd f31, 0x78(r1)
/* 0000F9FC 83E10074 */ lwz r31, 0x74(r1)
/* 0000FA00 83C10070 */ lwz r30, 0x70(r1)
/* 0000FA04 83A1006C */ lwz r29, 0x6c(r1)
/* 0000FA08 83810068 */ lwz r28, 0x68(r1)
/* 0000FA0C 38210080 */ addi r1, r1, 0x80
/* 0000FA10 7C0803A6 */ mtlr r0
/* 0000FA14 4E800020 */ blr 
