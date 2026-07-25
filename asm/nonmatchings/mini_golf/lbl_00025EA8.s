/* 00025EA8 7C0802A6 */ mflr r0
/* 00025EAC 90010004 */ stw r0, 4(r1)
/* 00025EB0 9421FF98 */ stwu r1, -0x68(r1)
/* 00025EB4 4BFDA31D */ bl mathutil_mtxA_push
/* 00025EB8 3C600000 */ lis r3, modeCtrl@ha
/* 00025EBC 38630000 */ addi r3, r3, modeCtrl@l
/* 00025EC0 8083002C */ lwz r4, 0x2c(r3)
/* 00025EC4 3C600000 */ lis r3, cameraInfo@ha
/* 00025EC8 38030000 */ addi r0, r3, cameraInfo@l
/* 00025ECC 1C640284 */ mulli r3, r4, 0x284
/* 00025ED0 7C601A14 */ add r3, r0, r3
/* 00025ED4 38630144 */ addi r3, r3, 0x144
/* 00025ED8 4BFDA2F9 */ bl mathutil_mtxA_from_mtx
/* 00025EDC 4BFDA2F5 */ bl mathutil_mtxA_rigid_invert
/* 00025EE0 38610038 */ addi r3, r1, 0x38
/* 00025EE4 4BFDA2ED */ bl mathutil_mtxA_to_mtx
/* 00025EE8 4BFDA2E9 */ bl mathutil_mtxA_pop
/* 00025EEC 4BFDA2E5 */ bl mathutil_mtxA_push
/* 00025EF0 38610038 */ addi r3, r1, 0x38
/* 00025EF4 4BFDA2DD */ bl mathutil_mtxA_mult_left
/* 00025EF8 4BFDA2D9 */ bl mathutil_mtxA_push
/* 00025EFC 3C600000 */ lis r3, lbl_10000248@ha
/* 00025F00 38630000 */ addi r3, r3, lbl_10000248@l
/* 00025F04 38630028 */ addi r3, r3, 0x28
/* 00025F08 4BFDA2C9 */ bl mathutil_mtxA_mult_left
/* 00025F0C 38610008 */ addi r3, r1, 8
/* 00025F10 4BFDA2C1 */ bl mathutil_mtxA_to_mtx
/* 00025F14 4BFDA2BD */ bl mathutil_mtxA_pop
/* 00025F18 4BFDA2B9 */ bl mathutil_mtxA_pop
/* 00025F1C 38600001 */ li r3, 1
/* 00025F20 38800004 */ li r4, 4
/* 00025F24 38A00005 */ li r5, 5
/* 00025F28 38C00000 */ li r6, 0
/* 00025F2C 4BFDA2A5 */ bl GXSetBlendMode_cached
/* 00025F30 3C600000 */ lis r3, gxCache@ha
/* 00025F34 38630000 */ addi r3, r3, gxCache@l
/* 00025F38 80630000 */ lwz r3, 0(r3)
/* 00025F3C 88030008 */ lbz r0, 8(r3)
/* 00025F40 28000001 */ cmplwi r0, 1
/* 00025F44 4082001C */ bne lbl_00025F60
/* 00025F48 80030004 */ lwz r0, 4(r3)
/* 00025F4C 2C000002 */ cmpwi r0, 2
/* 00025F50 40820010 */ bne lbl_00025F60
/* 00025F54 88030000 */ lbz r0, 0(r3)
/* 00025F58 28000001 */ cmplwi r0, 1
/* 00025F5C 4182003C */ beq lbl_00025F98
lbl_00025F60:
/* 00025F60 38600001 */ li r3, 1
/* 00025F64 38800002 */ li r4, 2
/* 00025F68 38A00001 */ li r5, 1
/* 00025F6C 4BFDA265 */ bl GXSetZMode
/* 00025F70 3C600000 */ lis r3, gxCache@ha
/* 00025F74 38830000 */ addi r4, r3, gxCache@l
/* 00025F78 80640000 */ lwz r3, 0(r4)
/* 00025F7C 38A00001 */ li r5, 1
/* 00025F80 38000002 */ li r0, 2
/* 00025F84 98A30000 */ stb r5, 0(r3)
/* 00025F88 80640000 */ lwz r3, 0(r4)
/* 00025F8C 90030004 */ stw r0, 4(r3)
/* 00025F90 80640000 */ lwz r3, 0(r4)
/* 00025F94 98A30008 */ stb r5, 8(r3)
lbl_00025F98:
/* 00025F98 38610008 */ addi r3, r1, 8
/* 00025F9C 3880001E */ li r4, 0x1e
/* 00025FA0 38A00001 */ li r5, 1
/* 00025FA4 4BFDA22D */ bl GXLoadTexMtxImm
/* 00025FA8 38600000 */ li r3, 0
/* 00025FAC 38800001 */ li r4, 1
/* 00025FB0 38A00000 */ li r5, 0
/* 00025FB4 38C0001E */ li r6, 0x1e
/* 00025FB8 38E00000 */ li r7, 0
/* 00025FBC 3900007D */ li r8, 0x7d
/* 00025FC0 4BFDA211 */ bl GXSetTexCoordGen2
/* 00025FC4 3C600000 */ lis r3, lbl_10000248@ha
/* 00025FC8 38630000 */ addi r3, r3, lbl_10000248@l
/* 00025FCC 80630020 */ lwz r3, 0x20(r3)
/* 00025FD0 38800000 */ li r4, 0
/* 00025FD4 4BFDA1FD */ bl GXLoadTexObj_cached
/* 00025FD8 38600000 */ li r3, 0
/* 00025FDC 38800000 */ li r4, 0
/* 00025FE0 38A00000 */ li r5, 0
/* 00025FE4 4BFDA1ED */ bl GXSetTevSwapMode_cached
/* 00025FE8 38600000 */ li r3, 0
/* 00025FEC 4BFDA1E5 */ bl GXSetTevDirect
/* 00025FF0 38600000 */ li r3, 0
/* 00025FF4 38800000 */ li r4, 0
/* 00025FF8 38A00000 */ li r5, 0
/* 00025FFC 38C000FF */ li r6, 0xff
/* 00026000 4BFDA1D1 */ bl GXSetTevOrder_cached
/* 00026004 38600000 */ li r3, 0
/* 00026008 3880000F */ li r4, 0xf
/* 0002600C 38A0000F */ li r5, 0xf
/* 00026010 38C0000F */ li r6, 0xf
/* 00026014 38E00008 */ li r7, 8
/* 00026018 4BFDA1B9 */ bl GXSetTevColorIn_cached
/* 0002601C 38600000 */ li r3, 0
/* 00026020 38800000 */ li r4, 0
/* 00026024 38A00000 */ li r5, 0
/* 00026028 38C00000 */ li r6, 0
/* 0002602C 38E00000 */ li r7, 0
/* 00026030 39000000 */ li r8, 0
/* 00026034 4BFDA19D */ bl GXSetTevColorOp_cached
/* 00026038 38600000 */ li r3, 0
/* 0002603C 38800007 */ li r4, 7
/* 00026040 38A00007 */ li r5, 7
/* 00026044 38C00007 */ li r6, 7
/* 00026048 38E00004 */ li r7, 4
/* 0002604C 4BFDA185 */ bl GXSetTevAlphaIn_cached
/* 00026050 38600000 */ li r3, 0
/* 00026054 38800000 */ li r4, 0
/* 00026058 38A00000 */ li r5, 0
/* 0002605C 38C00000 */ li r6, 0
/* 00026060 38E00000 */ li r7, 0
/* 00026064 39000000 */ li r8, 0
/* 00026068 4BFDA169 */ bl GXSetTevAlphaOp_cached
/* 0002606C 38600000 */ li r3, 0
/* 00026070 4BFDA161 */ bl GXSetNumIndStages
/* 00026074 38600001 */ li r3, 1
/* 00026078 4BFDA159 */ bl GXSetNumChans
/* 0002607C 38600001 */ li r3, 1
/* 00026080 4BFDA151 */ bl GXSetNumTevStages_cached
/* 00026084 38600001 */ li r3, 1
/* 00026088 4BFDA149 */ bl GXSetNumTexGens
/* 0002608C 8001006C */ lwz r0, 0x6c(r1)
/* 00026090 38210068 */ addi r1, r1, 0x68
/* 00026094 7C0803A6 */ mtlr r0
/* 00026098 4E800020 */ blr 
