/* 00018C78 7C0802A6 */ mflr r0
/* 00018C7C 3CA00000 */ lis r5, lbl_00020B58@ha
/* 00018C80 90010004 */ stw r0, 4(r1)
/* 00018C84 9421FF48 */ stwu r1, -0xb8(r1)
/* 00018C88 DBE100B0 */ stfd f31, 0xb0(r1)
/* 00018C8C 93E100AC */ stw r31, 0xac(r1)
/* 00018C90 3BE50000 */ addi r31, r5, lbl_00020B58@l
/* 00018C94 93C100A8 */ stw r30, 0xa8(r1)
/* 00018C98 7C7E1B78 */ mr r30, r3
/* 00018C9C 93A100A4 */ stw r29, 0xa4(r1)
/* 00018CA0 3BA10094 */ addi r29, r1, 0x94
/* 00018CA4 880300C0 */ lbz r0, 0xc0(r3)
/* 00018CA8 3C600000 */ lis r3, lbl_10009878@ha
/* 00018CAC 38630000 */ addi r3, r3, lbl_10009878@l
/* 00018CB0 7C000774 */ extsb r0, r0
/* 00018CB4 1C000068 */ mulli r0, r0, 0x68
/* 00018CB8 7C830214 */ add r4, r3, r0
/* 00018CBC 80640034 */ lwz r3, 0x34(r4)
/* 00018CC0 80040038 */ lwz r0, 0x38(r4)
/* 00018CC4 90610094 */ stw r3, 0x94(r1)
/* 00018CC8 90010098 */ stw r0, 0x98(r1)
/* 00018CCC 8004003C */ lwz r0, 0x3c(r4)
/* 00018CD0 9001009C */ stw r0, 0x9c(r1)
/* 00018CD4 C01F0018 */ lfs f0, 0x18(r31)
/* 00018CD8 D0010098 */ stfs f0, 0x98(r1)
/* 00018CDC C0210094 */ lfs f1, 0x94(r1)
/* 00018CE0 C0410098 */ lfs f2, 0x98(r1)
/* 00018CE4 C001009C */ lfs f0, 0x9c(r1)
/* 00018CE8 EC210072 */ fmuls f1, f1, f1
/* 00018CEC EC2208BA */ fmadds f1, f2, f2, f1
/* 00018CF0 EC20083A */ fmadds f1, f0, f0, f1
/* 00018CF4 4BFE7441 */ bl mathutil_sqrt
/* 00018CF8 C01F009C */ lfs f0, 0x9c(r31)
/* 00018CFC FC010040 */ fcmpo cr0, f1, f0
/* 00018D00 4080000C */ bge lbl_00018D0C
/* 00018D04 C03F0018 */ lfs f1, 0x18(r31)
/* 00018D08 48000224 */ b lbl_00018F2C
lbl_00018D0C:
/* 00018D0C 7FA3EB78 */ mr r3, r29
/* 00018D10 4BFE7425 */ bl mathutil_vec_normalize_len
/* 00018D14 387D0000 */ addi r3, r29, 0
/* 00018D18 389D0000 */ addi r4, r29, 0
/* 00018D1C 4BFE7419 */ bl mathutil_mtxA_rigid_inv_tf_vec
/* 00018D20 807F006C */ lwz r3, 0x6c(r31)
/* 00018D24 801F0070 */ lwz r0, 0x70(r31)
/* 00018D28 C0210094 */ lfs f1, 0x94(r1)
/* 00018D2C 90610018 */ stw r3, 0x18(r1)
/* 00018D30 9001001C */ stw r0, 0x1c(r1)
/* 00018D34 801F0074 */ lwz r0, 0x74(r31)
/* 00018D38 90010020 */ stw r0, 0x20(r1)
/* 00018D3C 80610018 */ lwz r3, 0x18(r1)
/* 00018D40 8001001C */ lwz r0, 0x1c(r1)
/* 00018D44 90610088 */ stw r3, 0x88(r1)
/* 00018D48 9001008C */ stw r0, 0x8c(r1)
/* 00018D4C 80010020 */ lwz r0, 0x20(r1)
/* 00018D50 90010090 */ stw r0, 0x90(r1)
/* 00018D54 C01F00A0 */ lfs f0, 0xa0(r31)
/* 00018D58 FC010040 */ fcmpo cr0, f1, f0
/* 00018D5C 408100CC */ ble lbl_00018E28
/* 00018D60 C01F0064 */ lfs f0, 0x64(r31)
/* 00018D64 FC010040 */ fcmpo cr0, f1, f0
/* 00018D68 408000C0 */ bge lbl_00018E28
/* 00018D6C 807F0078 */ lwz r3, 0x78(r31)
/* 00018D70 801F007C */ lwz r0, 0x7c(r31)
/* 00018D74 9061003C */ stw r3, 0x3c(r1)
/* 00018D78 90010040 */ stw r0, 0x40(r1)
/* 00018D7C 801F0080 */ lwz r0, 0x80(r31)
/* 00018D80 90010044 */ stw r0, 0x44(r1)
/* 00018D84 C0A1003C */ lfs f5, 0x3c(r1)
/* 00018D88 C0410094 */ lfs f2, 0x94(r1)
/* 00018D8C C0810040 */ lfs f4, 0x40(r1)
/* 00018D90 C0210098 */ lfs f1, 0x98(r1)
/* 00018D94 C0610044 */ lfs f3, 0x44(r1)
/* 00018D98 C001009C */ lfs f0, 0x9c(r1)
/* 00018D9C EC4500B2 */ fmuls f2, f5, f2
/* 00018DA0 EC44107A */ fmadds f2, f4, f1, f2
/* 00018DA4 EC43103A */ fmadds f2, f3, f0, f2
/* 00018DA8 C01F00A4 */ lfs f0, 0xa4(r31)
/* 00018DAC FC020040 */ fcmpo cr0, f2, f0
/* 00018DB0 4C411382 */ cror 2, 1, 2
/* 00018DB4 41820014 */ beq lbl_00018DC8
/* 00018DB8 C01F00A8 */ lfs f0, 0xa8(r31)
/* 00018DBC FC020040 */ fcmpo cr0, f2, f0
/* 00018DC0 4C401382 */ cror 2, 0, 2
/* 00018DC4 40820014 */ bne lbl_00018DD8
lbl_00018DC8:
/* 00018DC8 C01F0018 */ lfs f0, 0x18(r31)
/* 00018DCC D001003C */ stfs f0, 0x3c(r1)
/* 00018DD0 C01F00AC */ lfs f0, 0xac(r31)
/* 00018DD4 D0010044 */ stfs f0, 0x44(r1)
lbl_00018DD8:
/* 00018DD8 38810088 */ addi r4, r1, 0x88
/* 00018DDC C0E10040 */ lfs f7, 0x40(r1)
/* 00018DE0 C061009C */ lfs f3, 0x9c(r1)
/* 00018DE4 C0C10044 */ lfs f6, 0x44(r1)
/* 00018DE8 C0A10094 */ lfs f5, 0x94(r1)
/* 00018DEC C101003C */ lfs f8, 0x3c(r1)
/* 00018DF0 C0810098 */ lfs f4, 0x98(r1)
/* 00018DF4 EC4700F2 */ fmuls f2, f7, f3
/* 00018DF8 EC260172 */ fmuls f1, f6, f5
/* 00018DFC EC080132 */ fmuls f0, f8, f4
/* 00018E00 EC46113C */ fnmsubs f2, f6, f4, f2
/* 00018E04 D0410088 */ stfs f2, 0x88(r1)
/* 00018E08 EC2808FC */ fnmsubs f1, f8, f3, f1
/* 00018E0C D021008C */ stfs f1, 0x8c(r1)
/* 00018E10 EC07017C */ fnmsubs f0, f7, f5, f0
/* 00018E14 D0010090 */ stfs f0, 0x90(r1)
/* 00018E18 38610078 */ addi r3, r1, 0x78
/* 00018E1C 38A002D8 */ li r5, 0x2d8
/* 00018E20 4BFE7315 */ bl mathutil_quat_from_axis_angle
/* 00018E24 4800002C */ b lbl_00018E50
lbl_00018E28:
/* 00018E28 80BF0084 */ lwz r5, 0x84(r31)
/* 00018E2C 3881000C */ addi r4, r1, 0xc
/* 00018E30 801F0088 */ lwz r0, 0x88(r31)
/* 00018E34 38610078 */ addi r3, r1, 0x78
/* 00018E38 90A1000C */ stw r5, 0xc(r1)
/* 00018E3C 38A10094 */ addi r5, r1, 0x94
/* 00018E40 90010010 */ stw r0, 0x10(r1)
/* 00018E44 801F008C */ lwz r0, 0x8c(r31)
/* 00018E48 90010014 */ stw r0, 0x14(r1)
/* 00018E4C 4BFE72E9 */ bl mathutil_quat_from_dirs
lbl_00018E50:
/* 00018E50 4BFE72E5 */ bl mathutil_mtxA_push
/* 00018E54 38610078 */ addi r3, r1, 0x78
/* 00018E58 4BFE72DD */ bl mathutil_mtxA_from_quat
/* 00018E5C 4BFE72D9 */ bl mathutil_mtxA_normalize_basis
/* 00018E60 38610048 */ addi r3, r1, 0x48
/* 00018E64 4BFE72D1 */ bl mathutil_mtxA_to_mtx
/* 00018E68 4BFE72CD */ bl mathutil_mtxA_pop
/* 00018E6C 38610048 */ addi r3, r1, 0x48
/* 00018E70 4BFE72C5 */ bl mathutil_mtxA_mult_right
/* 00018E74 4BFE72C1 */ bl mathutil_mtxA_push
/* 00018E78 80BF0090 */ lwz r5, 0x90(r31)
/* 00018E7C 3C600000 */ lis r3, lbl_10009878@ha
/* 00018E80 80DF0094 */ lwz r6, 0x94(r31)
/* 00018E84 38030000 */ addi r0, r3, lbl_10009878@l
/* 00018E88 38810024 */ addi r4, r1, 0x24
/* 00018E8C 90A10030 */ stw r5, 0x30(r1)
/* 00018E90 38A10030 */ addi r5, r1, 0x30
/* 00018E94 90C10034 */ stw r6, 0x34(r1)
/* 00018E98 807F0098 */ lwz r3, 0x98(r31)
/* 00018E9C 90610038 */ stw r3, 0x38(r1)
/* 00018EA0 887E00C0 */ lbz r3, 0xc0(r30)
/* 00018EA4 C03F00B0 */ lfs f1, 0xb0(r31)
/* 00018EA8 7C630774 */ extsb r3, r3
/* 00018EAC 1C630068 */ mulli r3, r3, 0x68
/* 00018EB0 7C601A14 */ add r3, r0, r3
/* 00018EB4 38630054 */ addi r3, r3, 0x54
/* 00018EB8 4BFE727D */ bl u_math_unk7
/* 00018EBC C0210024 */ lfs f1, 0x24(r1)
/* 00018EC0 C0410028 */ lfs f2, 0x28(r1)
/* 00018EC4 C001002C */ lfs f0, 0x2c(r1)
/* 00018EC8 EC210072 */ fmuls f1, f1, f1
/* 00018ECC EC2208BA */ fmadds f1, f2, f2, f1
/* 00018ED0 EC20083A */ fmadds f1, f0, f0, f1
/* 00018ED4 4BFE7261 */ bl mathutil_sqrt
/* 00018ED8 FFE00890 */ fmr f31, f1
/* 00018EDC 4BFE7259 */ bl mathutil_mtxA_pop
/* 00018EE0 3C600000 */ lis r3, lbl_1000000A@ha
/* 00018EE4 88030000 */ lbz r0, lbl_1000000A@l(r3)
/* 00018EE8 7C000774 */ extsb r0, r0
/* 00018EEC 2C000013 */ cmpwi r0, 0x13
/* 00018EF0 41820024 */ beq lbl_00018F14
/* 00018EF4 2C00000A */ cmpwi r0, 0xa
/* 00018EF8 4182001C */ beq lbl_00018F14
/* 00018EFC 2C00000B */ cmpwi r0, 0xb
/* 00018F00 41820014 */ beq lbl_00018F14
/* 00018F04 2C000014 */ cmpwi r0, 0x14
/* 00018F08 4182000C */ beq lbl_00018F14
/* 00018F0C 2C000016 */ cmpwi r0, 0x16
/* 00018F10 40820018 */ bne lbl_00018F28
lbl_00018F14:
/* 00018F14 C01F00B8 */ lfs f0, 0xb8(r31)
/* 00018F18 C03F00B4 */ lfs f1, 0xb4(r31)
/* 00018F1C EC0007F2 */ fmuls f0, f0, f31
/* 00018F20 EC210032 */ fmuls f1, f1, f0
/* 00018F24 48000008 */ b lbl_00018F2C
lbl_00018F28:
/* 00018F28 C03F0018 */ lfs f1, 0x18(r31)
lbl_00018F2C:
/* 00018F2C 800100BC */ lwz r0, 0xbc(r1)
/* 00018F30 CBE100B0 */ lfd f31, 0xb0(r1)
/* 00018F34 83E100AC */ lwz r31, 0xac(r1)
/* 00018F38 7C0803A6 */ mtlr r0
/* 00018F3C 83C100A8 */ lwz r30, 0xa8(r1)
/* 00018F40 83A100A4 */ lwz r29, 0xa4(r1)
/* 00018F44 382100B8 */ addi r1, r1, 0xb8
/* 00018F48 4E800020 */ blr 
