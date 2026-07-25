/* 00006FF4 7C0802A6 */ mflr r0
/* 00006FF8 3CA00000 */ lis r5, controllerInfo@ha
/* 00006FFC 90010004 */ stw r0, 4(r1)
/* 00007000 9421FFC8 */ stwu r1, -0x38(r1)
/* 00007004 BF610024 */ stmw r27, 0x24(r1)
/* 00007008 7C7F1B78 */ mr r31, r3
/* 0000700C 8803002E */ lbz r0, 0x2e(r3)
/* 00007010 3C600000 */ lis r3, playerControllerIDs@ha
/* 00007014 7C000774 */ extsb r0, r0
/* 00007018 5404103A */ slwi r4, r0, 2
/* 0000701C 38030000 */ addi r0, r3, playerControllerIDs@l
/* 00007020 7C602214 */ add r3, r0, r4
/* 00007024 80030000 */ lwz r0, 0(r3)
/* 00007028 3C600000 */ lis r3, lbl_000137B8@ha
/* 0000702C C8430000 */ lfd f2, lbl_000137B8@l(r3)
/* 00007030 38650000 */ addi r3, r5, controllerInfo@l
/* 00007034 1C00003C */ mulli r0, r0, 0x3c
/* 00007038 7C630214 */ add r3, r3, r0
/* 0000703C 88030002 */ lbz r0, 2(r3)
/* 00007040 3C600000 */ lis r3, lbl_00013740@ha
/* 00007044 3BC30000 */ addi r30, r3, lbl_00013740@l
/* 00007048 7C000774 */ extsb r0, r0
/* 0000704C C01E0298 */ lfs f0, 0x298(r30)
/* 00007050 6C008000 */ xoris r0, r0, 0x8000
/* 00007054 9001001C */ stw r0, 0x1c(r1)
/* 00007058 3C004330 */ lis r0, 0x4330
/* 0000705C 3C600000 */ lis r3, lbl_10001AF0@ha
/* 00007060 90010018 */ stw r0, 0x18(r1)
/* 00007064 3BA30000 */ addi r29, r3, lbl_10001AF0@l
/* 00007068 3B7D0010 */ addi r27, r29, 0x10
/* 0000706C C8210018 */ lfd f1, 0x18(r1)
/* 00007070 3B9D0014 */ addi r28, r29, 0x14
/* 00007074 387F0000 */ addi r3, r31, 0
/* 00007078 EC211028 */ fsubs f1, f1, f2
/* 0000707C 389D000C */ addi r4, r29, 0xc
/* 00007080 EC010024 */ fdivs f0, f1, f0
/* 00007084 D01D000C */ stfs f0, 0xc(r29)
/* 00007088 C01E0008 */ lfs f0, 8(r30)
/* 0000708C D01D0010 */ stfs f0, 0x10(r29)
/* 00007090 C01E0008 */ lfs f0, 8(r30)
/* 00007094 D01D0014 */ stfs f0, 0x14(r29)
/* 00007098 48001AC9 */ bl lbl_00008B60
/* 0000709C C01E0008 */ lfs f0, 8(r30)
/* 000070A0 3C600000 */ lis r3, cameraInfo@ha
/* 000070A4 38630000 */ addi r3, r3, cameraInfo@l
/* 000070A8 D01C0000 */ stfs f0, 0(r28)
/* 000070AC D01B0000 */ stfs f0, 0(r27)
/* 000070B0 C03D000C */ lfs f1, 0xc(r29)
/* 000070B4 C01E028C */ lfs f0, 0x28c(r30)
/* 000070B8 EC010032 */ fmuls f0, f1, f0
/* 000070BC D01D000C */ stfs f0, 0xc(r29)
/* 000070C0 881F002E */ lbz r0, 0x2e(r31)
/* 000070C4 7C000774 */ extsb r0, r0
/* 000070C8 1C000284 */ mulli r0, r0, 0x284
/* 000070CC 7C630214 */ add r3, r3, r0
/* 000070D0 A863001A */ lha r3, 0x1a(r3)
/* 000070D4 4BFF90A9 */ bl mathutil_mtxA_from_rotate_y
/* 000070D8 387D000C */ addi r3, r29, 0xc
/* 000070DC 38830000 */ addi r4, r3, 0
/* 000070E0 4BFF909D */ bl mathutil_mtxA_tf_vec
/* 000070E4 387D000C */ addi r3, r29, 0xc
/* 000070E8 BB610024 */ lmw r27, 0x24(r1)
/* 000070EC 8001003C */ lwz r0, 0x3c(r1)
/* 000070F0 38210038 */ addi r1, r1, 0x38
/* 000070F4 7C0803A6 */ mtlr r0
/* 000070F8 4E800020 */ blr 
