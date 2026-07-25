/* 00025BD0 7C0802A6 */ mflr r0
/* 00025BD4 3C600000 */ lis r3, lbl_10000248@ha
/* 00025BD8 90010004 */ stw r0, 4(r1)
/* 00025BDC 9421FF60 */ stwu r1, -0xa0(r1)
/* 00025BE0 93E1009C */ stw r31, 0x9c(r1)
/* 00025BE4 3BE30000 */ addi r31, r3, lbl_10000248@l
/* 00025BE8 4BFDA5E9 */ bl mathutil_mtxA_push
/* 00025BEC 3C600000 */ lis r3, modeCtrl@ha
/* 00025BF0 38630000 */ addi r3, r3, modeCtrl@l
/* 00025BF4 8083002C */ lwz r4, 0x2c(r3)
/* 00025BF8 3C600000 */ lis r3, cameraInfo@ha
/* 00025BFC 38030000 */ addi r0, r3, cameraInfo@l
/* 00025C00 1C640284 */ mulli r3, r4, 0x284
/* 00025C04 7C601A14 */ add r3, r0, r3
/* 00025C08 38630144 */ addi r3, r3, 0x144
/* 00025C0C 4BFDA5C5 */ bl mathutil_mtxA_from_mtx
/* 00025C10 4BFDA5C1 */ bl mathutil_mtxA_rigid_invert
/* 00025C14 38610068 */ addi r3, r1, 0x68
/* 00025C18 4BFDA5B9 */ bl mathutil_mtxA_to_mtx
/* 00025C1C 4BFDA5B5 */ bl mathutil_mtxA_pop
/* 00025C20 4BFDA5B1 */ bl mathutil_mtxA_push
/* 00025C24 38610068 */ addi r3, r1, 0x68
/* 00025C28 4BFDA5A9 */ bl mathutil_mtxA_mult_left
/* 00025C2C 4BFDA5A5 */ bl mathutil_mtxA_push
/* 00025C30 387F0028 */ addi r3, r31, 0x28
/* 00025C34 4BFDA59D */ bl mathutil_mtxA_mult_left
/* 00025C38 38610038 */ addi r3, r1, 0x38
/* 00025C3C 4BFDA595 */ bl mathutil_mtxA_to_mtx
/* 00025C40 4BFDA591 */ bl mathutil_mtxA_pop
/* 00025C44 4BFDA58D */ bl mathutil_mtxA_push
/* 00025C48 387F0058 */ addi r3, r31, 0x58
/* 00025C4C 4BFDA585 */ bl mathutil_mtxA_mult_left
/* 00025C50 38610008 */ addi r3, r1, 8
/* 00025C54 4BFDA57D */ bl mathutil_mtxA_to_mtx
/* 00025C58 4BFDA579 */ bl mathutil_mtxA_pop
/* 00025C5C 4BFDA575 */ bl mathutil_mtxA_pop
/* 00025C60 38600001 */ li r3, 1
/* 00025C64 38800004 */ li r4, 4
/* 00025C68 38A00005 */ li r5, 5
/* 00025C6C 38C00000 */ li r6, 0
/* 00025C70 4BFDA561 */ bl GXSetBlendMode_cached
/* 00025C74 3C600000 */ lis r3, gxCache@ha
/* 00025C78 38630000 */ addi r3, r3, gxCache@l
/* 00025C7C 80630000 */ lwz r3, 0(r3)
/* 00025C80 88030008 */ lbz r0, 8(r3)
/* 00025C84 28000001 */ cmplwi r0, 1
/* 00025C88 4082001C */ bne lbl_00025CA4
/* 00025C8C 80030004 */ lwz r0, 4(r3)
/* 00025C90 2C000002 */ cmpwi r0, 2
/* 00025C94 40820010 */ bne lbl_00025CA4
/* 00025C98 88030000 */ lbz r0, 0(r3)
/* 00025C9C 28000001 */ cmplwi r0, 1
/* 00025CA0 4182003C */ beq lbl_00025CDC
lbl_00025CA4:
/* 00025CA4 38600001 */ li r3, 1
/* 00025CA8 38800002 */ li r4, 2
/* 00025CAC 38A00001 */ li r5, 1
/* 00025CB0 4BFDA521 */ bl GXSetZMode
/* 00025CB4 3C600000 */ lis r3, gxCache@ha
/* 00025CB8 38830000 */ addi r4, r3, gxCache@l
/* 00025CBC 80640000 */ lwz r3, 0(r4)
/* 00025CC0 38A00001 */ li r5, 1
/* 00025CC4 38000002 */ li r0, 2
/* 00025CC8 98A30000 */ stb r5, 0(r3)
/* 00025CCC 80640000 */ lwz r3, 0(r4)
/* 00025CD0 90030004 */ stw r0, 4(r3)
/* 00025CD4 80640000 */ lwz r3, 0(r4)
/* 00025CD8 98A30008 */ stb r5, 8(r3)
lbl_00025CDC:
/* 00025CDC 38610038 */ addi r3, r1, 0x38
/* 00025CE0 3880001E */ li r4, 0x1e
/* 00025CE4 38A00001 */ li r5, 1
/* 00025CE8 4BFDA4E9 */ bl GXLoadTexMtxImm
/* 00025CEC 38600000 */ li r3, 0
/* 00025CF0 38800001 */ li r4, 1
/* 00025CF4 38A00000 */ li r5, 0
/* 00025CF8 38C0001E */ li r6, 0x1e
/* 00025CFC 38E00000 */ li r7, 0
/* 00025D00 3900007D */ li r8, 0x7d
/* 00025D04 4BFDA4CD */ bl GXSetTexCoordGen2
/* 00025D08 807F0020 */ lwz r3, 0x20(r31)
/* 00025D0C 38800000 */ li r4, 0
/* 00025D10 4BFDA4C1 */ bl GXLoadTexObj_cached
/* 00025D14 38600000 */ li r3, 0
/* 00025D18 38800000 */ li r4, 0
/* 00025D1C 38A00001 */ li r5, 1
/* 00025D20 4BFDA4B1 */ bl GXSetTevSwapMode_cached
/* 00025D24 38600000 */ li r3, 0
/* 00025D28 4BFDA4A9 */ bl GXSetTevDirect
/* 00025D2C 38600000 */ li r3, 0
/* 00025D30 38800000 */ li r4, 0
/* 00025D34 38A00000 */ li r5, 0
/* 00025D38 38C000FF */ li r6, 0xff
/* 00025D3C 4BFDA495 */ bl GXSetTevOrder_cached
/* 00025D40 38600000 */ li r3, 0
/* 00025D44 3880000F */ li r4, 0xf
/* 00025D48 38A0000F */ li r5, 0xf
/* 00025D4C 38C0000F */ li r6, 0xf
/* 00025D50 38E0000C */ li r7, 0xc
/* 00025D54 4BFDA47D */ bl GXSetTevColorIn_cached
/* 00025D58 38600000 */ li r3, 0
/* 00025D5C 38800000 */ li r4, 0
/* 00025D60 38A00000 */ li r5, 0
/* 00025D64 38C00000 */ li r6, 0
/* 00025D68 38E00001 */ li r7, 1
/* 00025D6C 39000000 */ li r8, 0
/* 00025D70 4BFDA461 */ bl GXSetTevColorOp_cached
/* 00025D74 38600000 */ li r3, 0
/* 00025D78 38800007 */ li r4, 7
/* 00025D7C 38A00007 */ li r5, 7
/* 00025D80 38C00007 */ li r6, 7
/* 00025D84 38E00004 */ li r7, 4
/* 00025D88 4BFDA449 */ bl GXSetTevAlphaIn_cached
/* 00025D8C 38600000 */ li r3, 0
/* 00025D90 38800000 */ li r4, 0
/* 00025D94 38A00000 */ li r5, 0
/* 00025D98 38C00000 */ li r6, 0
/* 00025D9C 38E00001 */ li r7, 1
/* 00025DA0 39000000 */ li r8, 0
/* 00025DA4 4BFDA42D */ bl GXSetTevAlphaOp_cached
/* 00025DA8 38610008 */ addi r3, r1, 8
/* 00025DAC 38800021 */ li r4, 0x21
/* 00025DB0 38A00001 */ li r5, 1
/* 00025DB4 4BFDA41D */ bl GXLoadTexMtxImm
/* 00025DB8 38600001 */ li r3, 1
/* 00025DBC 38800001 */ li r4, 1
/* 00025DC0 38A00000 */ li r5, 0
/* 00025DC4 38C00021 */ li r6, 0x21
/* 00025DC8 38E00000 */ li r7, 0
/* 00025DCC 3900007D */ li r8, 0x7d
/* 00025DD0 4BFDA401 */ bl GXSetTexCoordGen2
/* 00025DD4 807F0024 */ lwz r3, 0x24(r31)
/* 00025DD8 38800001 */ li r4, 1
/* 00025DDC 4BFDA3F5 */ bl GXLoadTexObj_cached
/* 00025DE0 38600001 */ li r3, 1
/* 00025DE4 38800000 */ li r4, 0
/* 00025DE8 38A00000 */ li r5, 0
/* 00025DEC 4BFDA3E5 */ bl GXSetTevSwapMode_cached
/* 00025DF0 38600001 */ li r3, 1
/* 00025DF4 4BFDA3DD */ bl GXSetTevDirect
/* 00025DF8 38600001 */ li r3, 1
/* 00025DFC 38800001 */ li r4, 1
/* 00025E00 38A00001 */ li r5, 1
/* 00025E04 38C000FF */ li r6, 0xff
/* 00025E08 4BFDA3C9 */ bl GXSetTevOrder_cached
/* 00025E0C 38600001 */ li r3, 1
/* 00025E10 3880000F */ li r4, 0xf
/* 00025E14 38A00000 */ li r5, 0
/* 00025E18 38C00008 */ li r6, 8
/* 00025E1C 38E0000F */ li r7, 0xf
/* 00025E20 4BFDA3B1 */ bl GXSetTevColorIn_cached
/* 00025E24 38600001 */ li r3, 1
/* 00025E28 38800000 */ li r4, 0
/* 00025E2C 38A00000 */ li r5, 0
/* 00025E30 38C00000 */ li r6, 0
/* 00025E34 38E00001 */ li r7, 1
/* 00025E38 39000000 */ li r8, 0
/* 00025E3C 4BFDA395 */ bl GXSetTevColorOp_cached
/* 00025E40 38600001 */ li r3, 1
/* 00025E44 38800007 */ li r4, 7
/* 00025E48 38A00007 */ li r5, 7
/* 00025E4C 38C00007 */ li r6, 7
/* 00025E50 38E00000 */ li r7, 0
/* 00025E54 4BFDA37D */ bl GXSetTevAlphaIn_cached
/* 00025E58 38600001 */ li r3, 1
/* 00025E5C 38800000 */ li r4, 0
/* 00025E60 38A00000 */ li r5, 0
/* 00025E64 38C00000 */ li r6, 0
/* 00025E68 38E00001 */ li r7, 1
/* 00025E6C 39000000 */ li r8, 0
/* 00025E70 4BFDA361 */ bl GXSetTevAlphaOp_cached
/* 00025E74 38600000 */ li r3, 0
/* 00025E78 4BFDA359 */ bl GXSetNumIndStages
/* 00025E7C 38600001 */ li r3, 1
/* 00025E80 4BFDA351 */ bl GXSetNumChans
/* 00025E84 38600002 */ li r3, 2
/* 00025E88 4BFDA349 */ bl GXSetNumTevStages_cached
/* 00025E8C 38600002 */ li r3, 2
/* 00025E90 4BFDA341 */ bl GXSetNumTexGens
/* 00025E94 800100A4 */ lwz r0, 0xa4(r1)
/* 00025E98 83E1009C */ lwz r31, 0x9c(r1)
/* 00025E9C 382100A0 */ addi r1, r1, 0xa0
/* 00025EA0 7C0803A6 */ mtlr r0
/* 00025EA4 4E800020 */ blr 
