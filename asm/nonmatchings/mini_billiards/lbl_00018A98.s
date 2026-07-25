/* 00018A98 7C0802A6 */ mflr r0
/* 00018A9C 3C800000 */ lis r4, lbl_00020B58@ha
/* 00018AA0 90010004 */ stw r0, 4(r1)
/* 00018AA4 9421FF68 */ stwu r1, -0x98(r1)
/* 00018AA8 93E10094 */ stw r31, 0x94(r1)
/* 00018AAC 3BE40000 */ addi r31, r4, lbl_00020B58@l
/* 00018AB0 93C10090 */ stw r30, 0x90(r1)
/* 00018AB4 7C7E1B78 */ mr r30, r3
/* 00018AB8 93A1008C */ stw r29, 0x8c(r1)
/* 00018ABC 880300C0 */ lbz r0, 0xc0(r3)
/* 00018AC0 3C600000 */ lis r3, lbl_10009878@ha
/* 00018AC4 3BA30000 */ addi r29, r3, lbl_10009878@l
/* 00018AC8 7C000774 */ extsb r0, r0
/* 00018ACC 1C000068 */ mulli r0, r0, 0x68
/* 00018AD0 7C7D0214 */ add r3, r29, r0
/* 00018AD4 38630054 */ addi r3, r3, 0x54
/* 00018AD8 4BFE765D */ bl mathutil_mtxA_from_quat
/* 00018ADC 3861003C */ addi r3, r1, 0x3c
/* 00018AE0 4BFE7655 */ bl mathutil_mtxA_to_mtx
/* 00018AE4 387E0060 */ addi r3, r30, 0x60
/* 00018AE8 4BFE764D */ bl mathutil_mtxA_from_quat
/* 00018AEC 4BFE7649 */ bl mathutil_mtxA_normalize_basis
/* 00018AF0 3861003C */ addi r3, r1, 0x3c
/* 00018AF4 4BFE7641 */ bl mathutil_mtxA_mult_left
/* 00018AF8 4BFE763D */ bl mathutil_mtxA_normalize_basis
/* 00018AFC 801E0014 */ lwz r0, 0x14(r30)
/* 00018B00 5400039D */ rlwinm. r0, r0, 0, 0xe, 0xe
/* 00018B04 40820024 */ bne lbl_00018B28
/* 00018B08 881E00C0 */ lbz r0, 0xc0(r30)
/* 00018B0C C01F0060 */ lfs f0, 0x60(r31)
/* 00018B10 7C000774 */ extsb r0, r0
/* 00018B14 1C000068 */ mulli r0, r0, 0x68
/* 00018B18 7C7D0214 */ add r3, r29, r0
/* 00018B1C C0230060 */ lfs f1, 0x60(r3)
/* 00018B20 FC010040 */ fcmpo cr0, f1, f0
/* 00018B24 41800138 */ blt lbl_00018C5C
lbl_00018B28:
/* 00018B28 3861003C */ addi r3, r1, 0x3c
/* 00018B2C 4BFE7609 */ bl mathutil_mtxA_to_mtx
/* 00018B30 80BF0030 */ lwz r5, 0x30(r31)
/* 00018B34 3861006C */ addi r3, r1, 0x6c
/* 00018B38 801F0034 */ lwz r0, 0x34(r31)
/* 00018B3C 7C641B78 */ mr r4, r3
/* 00018B40 90A10018 */ stw r5, 0x18(r1)
/* 00018B44 9001001C */ stw r0, 0x1c(r1)
/* 00018B48 801F0038 */ lwz r0, 0x38(r31)
/* 00018B4C 90010020 */ stw r0, 0x20(r1)
/* 00018B50 80A10018 */ lwz r5, 0x18(r1)
/* 00018B54 8001001C */ lwz r0, 0x1c(r1)
/* 00018B58 90A1006C */ stw r5, 0x6c(r1)
/* 00018B5C 90010070 */ stw r0, 0x70(r1)
/* 00018B60 80010020 */ lwz r0, 0x20(r1)
/* 00018B64 90010074 */ stw r0, 0x74(r1)
/* 00018B68 4BFE75CD */ bl mathutil_mtxA_rigid_inv_tf_vec
/* 00018B6C 80BF003C */ lwz r5, 0x3c(r31)
/* 00018B70 3861006C */ addi r3, r1, 0x6c
/* 00018B74 801F0040 */ lwz r0, 0x40(r31)
/* 00018B78 38810030 */ addi r4, r1, 0x30
/* 00018B7C 90A10030 */ stw r5, 0x30(r1)
/* 00018B80 90010034 */ stw r0, 0x34(r1)
/* 00018B84 801F0044 */ lwz r0, 0x44(r31)
/* 00018B88 90010038 */ stw r0, 0x38(r1)
/* 00018B8C 4BFE75A9 */ bl mathutil_vec_dot_normalized
/* 00018B90 801E0014 */ lwz r0, 0x14(r30)
/* 00018B94 C01F0064 */ lfs f0, 0x64(r31)
/* 00018B98 5400039D */ rlwinm. r0, r0, 0, 0xe, 0xe
/* 00018B9C EC200828 */ fsubs f1, f0, f1
/* 00018BA0 40820078 */ bne lbl_00018C18
/* 00018BA4 C01F0068 */ lfs f0, 0x68(r31)
/* 00018BA8 FC010040 */ fcmpo cr0, f1, f0
/* 00018BAC 4081006C */ ble lbl_00018C18
/* 00018BB0 807F0048 */ lwz r3, 0x48(r31)
/* 00018BB4 3881006C */ addi r4, r1, 0x6c
/* 00018BB8 801F004C */ lwz r0, 0x4c(r31)
/* 00018BBC 90610024 */ stw r3, 0x24(r1)
/* 00018BC0 90010028 */ stw r0, 0x28(r1)
/* 00018BC4 801F0050 */ lwz r0, 0x50(r31)
/* 00018BC8 9001002C */ stw r0, 0x2c(r1)
/* 00018BCC C0E10028 */ lfs f7, 0x28(r1)
/* 00018BD0 C0610074 */ lfs f3, 0x74(r1)
/* 00018BD4 C0C1002C */ lfs f6, 0x2c(r1)
/* 00018BD8 C0A1006C */ lfs f5, 0x6c(r1)
/* 00018BDC C1010024 */ lfs f8, 0x24(r1)
/* 00018BE0 C0810070 */ lfs f4, 0x70(r1)
/* 00018BE4 EC4700F2 */ fmuls f2, f7, f3
/* 00018BE8 EC260172 */ fmuls f1, f6, f5
/* 00018BEC EC080132 */ fmuls f0, f8, f4
/* 00018BF0 EC46113C */ fnmsubs f2, f6, f4, f2
/* 00018BF4 D041006C */ stfs f2, 0x6c(r1)
/* 00018BF8 EC2808FC */ fnmsubs f1, f8, f3, f1
/* 00018BFC D0210070 */ stfs f1, 0x70(r1)
/* 00018C00 EC07017C */ fnmsubs f0, f7, f5, f0
/* 00018C04 D0010074 */ stfs f0, 0x74(r1)
/* 00018C08 38610078 */ addi r3, r1, 0x78
/* 00018C0C 38A0038E */ li r5, 0x38e
/* 00018C10 4BFE7525 */ bl mathutil_quat_from_axis_angle
/* 00018C14 4800002C */ b lbl_00018C40
lbl_00018C18:
/* 00018C18 80BF0054 */ lwz r5, 0x54(r31)
/* 00018C1C 3881000C */ addi r4, r1, 0xc
/* 00018C20 801F0058 */ lwz r0, 0x58(r31)
/* 00018C24 38610078 */ addi r3, r1, 0x78
/* 00018C28 90A1000C */ stw r5, 0xc(r1)
/* 00018C2C 38A1006C */ addi r5, r1, 0x6c
/* 00018C30 90010010 */ stw r0, 0x10(r1)
/* 00018C34 801F005C */ lwz r0, 0x5c(r31)
/* 00018C38 90010014 */ stw r0, 0x14(r1)
/* 00018C3C 4BFE74F9 */ bl mathutil_quat_from_dirs
lbl_00018C40:
/* 00018C40 38610078 */ addi r3, r1, 0x78
/* 00018C44 4BFE74F1 */ bl mathutil_quat_normalize
/* 00018C48 38610078 */ addi r3, r1, 0x78
/* 00018C4C 4BFE74E9 */ bl mathutil_mtxA_from_quat
/* 00018C50 4BFE74E5 */ bl mathutil_mtxA_normalize_basis
/* 00018C54 3861003C */ addi r3, r1, 0x3c
/* 00018C58 4BFE74DD */ bl mathutil_mtxA_mult_left
lbl_00018C5C:
/* 00018C5C 8001009C */ lwz r0, 0x9c(r1)
/* 00018C60 83E10094 */ lwz r31, 0x94(r1)
/* 00018C64 83C10090 */ lwz r30, 0x90(r1)
/* 00018C68 7C0803A6 */ mtlr r0
/* 00018C6C 83A1008C */ lwz r29, 0x8c(r1)
/* 00018C70 38210098 */ addi r1, r1, 0x98
/* 00018C74 4E800020 */ blr 
