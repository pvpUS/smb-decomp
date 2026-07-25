/* 00003CC8 7C0802A6 */ mflr r0
/* 00003CCC 3CA00000 */ lis r5, minigameGma@ha
/* 00003CD0 90010004 */ stw r0, 4(r1)
/* 00003CD4 38A50000 */ addi r5, r5, minigameGma@l
/* 00003CD8 3C800000 */ lis r4, polyDisp@ha
/* 00003CDC 9421FFD8 */ stwu r1, -0x28(r1)
/* 00003CE0 BF610014 */ stmw r27, 0x14(r1)
/* 00003CE4 3B830034 */ addi r28, r3, 0x34
/* 00003CE8 80A50000 */ lwz r5, 0(r5)
/* 00003CEC 80040000 */ lwz r0, polyDisp@l(r4)
/* 00003CF0 80650008 */ lwz r3, 8(r5)
/* 00003CF4 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00003CF8 836300A0 */ lwz r27, 0xa0(r3)
/* 00003CFC 40820060 */ bne lbl_00003D5C
/* 00003D00 3C600000 */ lis r3, mathutilData@ha
/* 00003D04 3BC30000 */ addi r30, r3, mathutilData@l
/* 00003D08 3BA0000C */ li r29, 0xc
lbl_00003D0C:
/* 00003D0C 7F83E378 */ mr r3, r28
/* 00003D10 4BFFC455 */ bl mathutil_mtxA_from_mtxB_translate
/* 00003D14 A87C001A */ lha r3, 0x1a(r28)
/* 00003D18 4BFFC44D */ bl mathutil_mtxA_rotate_y
/* 00003D1C A87C0018 */ lha r3, 0x18(r28)
/* 00003D20 4BFFC445 */ bl mathutil_mtxA_rotate_x
/* 00003D24 A87C001C */ lha r3, 0x1c(r28)
/* 00003D28 4BFFC43D */ bl mathutil_mtxA_rotate_z
/* 00003D2C 807E0000 */ lwz r3, 0(r30)
/* 00003D30 38800000 */ li r4, 0
/* 00003D34 4BFFC431 */ bl GXLoadPosMtxImm
/* 00003D38 807E0000 */ lwz r3, 0(r30)
/* 00003D3C 38800000 */ li r4, 0
/* 00003D40 4BFFC425 */ bl GXLoadNrmMtxImm
/* 00003D44 7F63DB78 */ mr r3, r27
/* 00003D48 4BFFC41D */ bl avdisp_draw_model_culled_sort_translucent
/* 00003D4C 37BDFFFF */ addic. r29, r29, -1
/* 00003D50 3B9C0020 */ addi r28, r28, 0x20
/* 00003D54 4181FFB8 */ bgt lbl_00003D0C
/* 00003D58 48000074 */ b lbl_00003DCC
lbl_00003D5C:
/* 00003D5C 3C600000 */ lis r3, mathutilData@ha
/* 00003D60 3C800000 */ lis r4, lbl_0001C060@ha
/* 00003D64 3BE30000 */ addi r31, r3, mathutilData@l
/* 00003D68 3BC40000 */ addi r30, r4, lbl_0001C060@l
/* 00003D6C 3BA0000C */ li r29, 0xc
lbl_00003D70:
/* 00003D70 C03C0004 */ lfs f1, 4(r28)
/* 00003D74 C01E0000 */ lfs f0, 0(r30)
/* 00003D78 FC010040 */ fcmpo cr0, f1, f0
/* 00003D7C 41800044 */ blt lbl_00003DC0
/* 00003D80 7F83E378 */ mr r3, r28
/* 00003D84 4BFFC3E1 */ bl mathutil_mtxA_from_mtxB_translate
/* 00003D88 A87C001A */ lha r3, 0x1a(r28)
/* 00003D8C 4BFFC3D9 */ bl mathutil_mtxA_rotate_y
/* 00003D90 A87C0018 */ lha r3, 0x18(r28)
/* 00003D94 4BFFC3D1 */ bl mathutil_mtxA_rotate_x
/* 00003D98 A87C001C */ lha r3, 0x1c(r28)
/* 00003D9C 4BFFC3C9 */ bl mathutil_mtxA_rotate_z
/* 00003DA0 807F0000 */ lwz r3, 0(r31)
/* 00003DA4 38800000 */ li r4, 0
/* 00003DA8 4BFFC3BD */ bl GXLoadPosMtxImm
/* 00003DAC 807F0000 */ lwz r3, 0(r31)
/* 00003DB0 38800000 */ li r4, 0
/* 00003DB4 4BFFC3B1 */ bl GXLoadNrmMtxImm
/* 00003DB8 7F63DB78 */ mr r3, r27
/* 00003DBC 4BFFC3A9 */ bl avdisp_draw_model_culled_sort_translucent
lbl_00003DC0:
/* 00003DC0 37BDFFFF */ addic. r29, r29, -1
/* 00003DC4 3B9C0020 */ addi r28, r28, 0x20
/* 00003DC8 4181FFA8 */ bgt lbl_00003D70
lbl_00003DCC:
/* 00003DCC BB610014 */ lmw r27, 0x14(r1)
/* 00003DD0 8001002C */ lwz r0, 0x2c(r1)
/* 00003DD4 38210028 */ addi r1, r1, 0x28
/* 00003DD8 7C0803A6 */ mtlr r0
/* 00003DDC 4E800020 */ blr 
