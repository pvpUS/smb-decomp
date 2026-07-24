/* 00007E74 7C0802A6 */ mflr r0
/* 00007E78 3C800000 */ lis r4, lbl_00011258@ha
/* 00007E7C 90010004 */ stw r0, 4(r1)
/* 00007E80 9421FFE0 */ stwu r1, -0x20(r1)
/* 00007E84 93E1001C */ stw r31, 0x1c(r1)
/* 00007E88 7C7F1B78 */ mr r31, r3
/* 00007E8C 93C10018 */ stw r30, 0x18(r1)
/* 00007E90 3BC40000 */ addi r30, r4, lbl_00011258@l
/* 00007E94 389F001C */ addi r4, r31, 0x1c
/* 00007E98 80630004 */ lwz r3, 4(r3)
/* 00007E9C 801F0008 */ lwz r0, 8(r31)
/* 00007EA0 907F0010 */ stw r3, 0x10(r31)
/* 00007EA4 901F0014 */ stw r0, 0x14(r31)
/* 00007EA8 801F000C */ lwz r0, 0xc(r31)
/* 00007EAC 901F0018 */ stw r0, 0x18(r31)
/* 00007EB0 C0240000 */ lfs f1, 0(r4)
/* 00007EB4 C0440004 */ lfs f2, 4(r4)
/* 00007EB8 C0040008 */ lfs f0, 8(r4)
/* 00007EBC EC210072 */ fmuls f1, f1, f1
/* 00007EC0 EC2208BA */ fmadds f1, f2, f2, f1
/* 00007EC4 EC20083A */ fmadds f1, f0, f0, f1
/* 00007EC8 4BFF8299 */ bl mathutil_sqrt
/* 00007ECC D03F00F8 */ stfs f1, 0xf8(r31)
/* 00007ED0 387F0030 */ addi r3, r31, 0x30
/* 00007ED4 389F00C8 */ addi r4, r31, 0xc8
/* 00007ED8 4BFF8289 */ bl mathutil_mtx_copy
/* 00007EDC C03F0020 */ lfs f1, 0x20(r31)
/* 00007EE0 C01F006C */ lfs f0, 0x6c(r31)
/* 00007EE4 EC010028 */ fsubs f0, f1, f0
/* 00007EE8 D01F0020 */ stfs f0, 0x20(r31)
/* 00007EEC C03F001C */ lfs f1, 0x1c(r31)
/* 00007EF0 C01F0004 */ lfs f0, 4(r31)
/* 00007EF4 EC01002A */ fadds f0, f1, f0
/* 00007EF8 D01F0004 */ stfs f0, 4(r31)
/* 00007EFC C03F0020 */ lfs f1, 0x20(r31)
/* 00007F00 C01F0008 */ lfs f0, 8(r31)
/* 00007F04 EC01002A */ fadds f0, f1, f0
/* 00007F08 D01F0008 */ stfs f0, 8(r31)
/* 00007F0C C03F0024 */ lfs f1, 0x24(r31)
/* 00007F10 C01F000C */ lfs f0, 0xc(r31)
/* 00007F14 EC01002A */ fadds f0, f1, f0
/* 00007F18 D01F000C */ stfs f0, 0xc(r31)
/* 00007F1C A87F0028 */ lha r3, 0x28(r31)
/* 00007F20 A81F0060 */ lha r0, 0x60(r31)
/* 00007F24 7C030214 */ add r0, r3, r0
/* 00007F28 B01F0028 */ sth r0, 0x28(r31)
/* 00007F2C A87F002A */ lha r3, 0x2a(r31)
/* 00007F30 A81F0062 */ lha r0, 0x62(r31)
/* 00007F34 7C030214 */ add r0, r3, r0
/* 00007F38 B01F002A */ sth r0, 0x2a(r31)
/* 00007F3C A87F002C */ lha r3, 0x2c(r31)
/* 00007F40 A81F0064 */ lha r0, 0x64(r31)
/* 00007F44 7C030214 */ add r0, r3, r0
/* 00007F48 B01F002C */ sth r0, 0x2c(r31)
/* 00007F4C A87F002C */ lha r3, 0x2c(r31)
/* 00007F50 4BFF8211 */ bl mathutil_mtxA_from_rotate_z
/* 00007F54 A87F002A */ lha r3, 0x2a(r31)
/* 00007F58 4BFF8209 */ bl mathutil_mtxA_rotate_y
/* 00007F5C A87F0028 */ lha r3, 0x28(r31)
/* 00007F60 4BFF8201 */ bl mathutil_mtxA_rotate_x
/* 00007F64 387F0098 */ addi r3, r31, 0x98
/* 00007F68 4BFF81F9 */ bl mathutil_mtxA_to_quat
/* 00007F6C 387F0004 */ addi r3, r31, 4
/* 00007F70 C0430000 */ lfs f2, 0(r3)
/* 00007F74 C0230004 */ lfs f1, 4(r3)
/* 00007F78 C0030008 */ lfs f0, 8(r3)
/* 00007F7C 3C60E000 */ lis r3, 0xe000
/* 00007F80 D043000C */ stfs f2, 0xc(r3)
/* 00007F84 D023001C */ stfs f1, 0x1c(r3)
/* 00007F88 D003002C */ stfs f0, 0x2c(r3)
/* 00007F8C 387F0030 */ addi r3, r31, 0x30
/* 00007F90 4BFF81D1 */ bl mathutil_mtxA_to_mtx
/* 00007F94 387F00A8 */ addi r3, r31, 0xa8
/* 00007F98 4BFF81C9 */ bl mathutil_mtxA_to_quat
/* 00007F9C 7FE3FB78 */ mr r3, r31
/* 00007FA0 48000345 */ bl lbl_000082E4
/* 00007FA4 C01E0014 */ lfs f0, 0x14(r30)
/* 00007FA8 3881000C */ addi r4, r1, 0xc
/* 00007FAC D001000C */ stfs f0, 0xc(r1)
/* 00007FB0 C01E0014 */ lfs f0, 0x14(r30)
/* 00007FB4 D0010010 */ stfs f0, 0x10(r1)
/* 00007FB8 C01E001C */ lfs f0, 0x1c(r30)
/* 00007FBC D0010014 */ stfs f0, 0x14(r1)
/* 00007FC0 807F00FC */ lwz r3, 0xfc(r31)
/* 00007FC4 4BFF819D */ bl mot_ape_set_quat_from_vec
/* 00007FC8 80010024 */ lwz r0, 0x24(r1)
/* 00007FCC 83E1001C */ lwz r31, 0x1c(r1)
/* 00007FD0 83C10018 */ lwz r30, 0x18(r1)
/* 00007FD4 7C0803A6 */ mtlr r0
/* 00007FD8 38210020 */ addi r1, r1, 0x20
/* 00007FDC 4E800020 */ blr 
