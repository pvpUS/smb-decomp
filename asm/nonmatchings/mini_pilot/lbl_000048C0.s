/* 000048C0 7C0802A6 */ mflr r0
/* 000048C4 3C600000 */ lis r3, lbl_0000BE80@ha
/* 000048C8 90010004 */ stw r0, 4(r1)
/* 000048CC 3C800000 */ lis r4, currentBall@ha
/* 000048D0 9421FF88 */ stwu r1, -0x78(r1)
/* 000048D4 93E10074 */ stw r31, 0x74(r1)
/* 000048D8 3BE30000 */ addi r31, r3, lbl_0000BE80@l
/* 000048DC 93C10070 */ stw r30, 0x70(r1)
/* 000048E0 807F02A8 */ lwz r3, 0x2a8(r31)
/* 000048E4 801F02AC */ lwz r0, 0x2ac(r31)
/* 000048E8 83C40000 */ lwz r30, currentBall@l(r4)
/* 000048EC 90610048 */ stw r3, 0x48(r1)
/* 000048F0 9001004C */ stw r0, 0x4c(r1)
/* 000048F4 801F02B0 */ lwz r0, 0x2b0(r31)
/* 000048F8 90010050 */ stw r0, 0x50(r1)
/* 000048FC C03F02B4 */ lfs f1, 0x2b4(r31)
/* 00004900 FC400890 */ fmr f2, f1
/* 00004904 FC600890 */ fmr f3, f1
/* 00004908 FC800890 */ fmr f4, f1
/* 0000490C 4BFFB841 */ bl avdisp_set_post_mult_color
/* 00004910 38600001 */ li r3, 1
/* 00004914 38800003 */ li r4, 3
/* 00004918 38A00000 */ li r5, 0
/* 0000491C 4BFFB831 */ bl avdisp_set_z_mode
/* 00004920 387E0004 */ addi r3, r30, 4
/* 00004924 38810054 */ addi r4, r1, 0x54
/* 00004928 38A00000 */ li r5, 0
/* 0000492C 4BFFB821 */ bl raycast_stage_down
/* 00004930 28030000 */ cmplwi r3, 0
/* 00004934 418200A4 */ beq lbl_000049D8
/* 00004938 4BFFB815 */ bl mathutil_mtxA_from_identity
/* 0000493C C03F02B8 */ lfs f1, 0x2b8(r31)
/* 00004940 4BFFB80D */ bl mathutil_mtxA_scale_s
/* 00004944 38610008 */ addi r3, r1, 8
/* 00004948 4BFFB805 */ bl mathutil_mtxA_to_mtx
/* 0000494C 38610058 */ addi r3, r1, 0x58
/* 00004950 4BFFB7FD */ bl mathutil_mtxA_from_mtxB_translate
/* 00004954 38610008 */ addi r3, r1, 8
/* 00004958 4BFFB7F5 */ bl mathutil_mtxA_mult_left
/* 0000495C 38610008 */ addi r3, r1, 8
/* 00004960 4BFFB7ED */ bl mathutil_mtxA_to_mtx
/* 00004964 38610038 */ addi r3, r1, 0x38
/* 00004968 38810048 */ addi r4, r1, 0x48
/* 0000496C 38A10064 */ addi r5, r1, 0x64
/* 00004970 4BFFB7DD */ bl mathutil_quat_from_dirs
/* 00004974 38610038 */ addi r3, r1, 0x38
/* 00004978 4BFFB7D5 */ bl mathutil_mtxA_from_quat
/* 0000497C 38610008 */ addi r3, r1, 8
/* 00004980 4BFFB7CD */ bl mathutil_mtxA_mult_left
/* 00004984 3C600000 */ lis r3, lbl_802F1FDC@ha
/* 00004988 C81F01B0 */ lfd f0, 0x1b0(r31)
/* 0000498C C0230000 */ lfs f1, lbl_802F1FDC@l(r3)
/* 00004990 FC010040 */ fcmpo cr0, f1, f0
/* 00004994 40810010 */ ble lbl_000049A4
/* 00004998 C03F02BC */ lfs f1, 0x2bc(r31)
/* 0000499C 4BFFB7B1 */ bl mathutil_mtxA_scale_s
/* 000049A0 4800000C */ b lbl_000049AC
lbl_000049A4:
/* 000049A4 C03F02C0 */ lfs f1, 0x2c0(r31)
/* 000049A8 4BFFB7A5 */ bl mathutil_mtxA_scale_s
lbl_000049AC:
/* 000049AC 3C600000 */ lis r3, mathutilData@ha
/* 000049B0 38630000 */ addi r3, r3, mathutilData@l
/* 000049B4 80630000 */ lwz r3, 0(r3)
/* 000049B8 38800000 */ li r4, 0
/* 000049BC 4BFFB791 */ bl gxutil_load_pos_nrm_matrix
/* 000049C0 3C600000 */ lis r3, commonGma@ha
/* 000049C4 38630000 */ addi r3, r3, commonGma@l
/* 000049C8 80630000 */ lwz r3, 0(r3)
/* 000049CC 80630008 */ lwz r3, 8(r3)
/* 000049D0 80630270 */ lwz r3, 0x270(r3)
/* 000049D4 4BFFB779 */ bl avdisp_draw_model_culled_sort_none
lbl_000049D8:
/* 000049D8 C03F0034 */ lfs f1, 0x34(r31)
/* 000049DC FC400890 */ fmr f2, f1
/* 000049E0 FC600890 */ fmr f3, f1
/* 000049E4 FC800890 */ fmr f4, f1
/* 000049E8 4BFFB765 */ bl avdisp_set_post_mult_color
/* 000049EC 38600001 */ li r3, 1
/* 000049F0 38800003 */ li r4, 3
/* 000049F4 38A00001 */ li r5, 1
/* 000049F8 4BFFB755 */ bl avdisp_set_z_mode
/* 000049FC 8001007C */ lwz r0, 0x7c(r1)
/* 00004A00 83E10074 */ lwz r31, 0x74(r1)
/* 00004A04 83C10070 */ lwz r30, 0x70(r1)
/* 00004A08 7C0803A6 */ mtlr r0
/* 00004A0C 38210078 */ addi r1, r1, 0x78
/* 00004A10 4E800020 */ blr 
