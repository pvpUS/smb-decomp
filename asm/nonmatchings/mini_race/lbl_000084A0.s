/* 000084A0 7C0802A6 */ mflr r0
/* 000084A4 3C800000 */ lis r4, decodedStageLzPtr@ha
/* 000084A8 90010004 */ stw r0, 4(r1)
/* 000084AC 38840000 */ addi r4, r4, decodedStageLzPtr@l
/* 000084B0 9421FFD0 */ stwu r1, -0x30(r1)
/* 000084B4 BF410018 */ stmw r26, 0x18(r1)
/* 000084B8 3B430000 */ addi r26, r3, 0
/* 000084BC 3C600000 */ lis r3, lbl_00013740@ha
/* 000084C0 3BE30000 */ addi r31, r3, lbl_00013740@l
/* 000084C4 3BDA0004 */ addi r30, r26, 4
/* 000084C8 3B600000 */ li r27, 0
/* 000084CC 80840000 */ lwz r4, 0(r4)
/* 000084D0 83A40078 */ lwz r29, 0x78(r4)
/* 000084D4 839D0034 */ lwz r28, 0x34(r29)
/* 000084D8 480000DC */ b lbl_000085B4
lbl_000084DC:
/* 000084DC C0BE0000 */ lfs f5, 0(r30)
/* 000084E0 C05C0000 */ lfs f2, 0(r28)
/* 000084E4 C09E0004 */ lfs f4, 4(r30)
/* 000084E8 C03C0004 */ lfs f1, 4(r28)
/* 000084EC C07E0008 */ lfs f3, 8(r30)
/* 000084F0 C01C0008 */ lfs f0, 8(r28)
/* 000084F4 ECA51028 */ fsubs f5, f5, f2
/* 000084F8 EC840828 */ fsubs f4, f4, f1
/* 000084FC EC630028 */ fsubs f3, f3, f0
/* 00008500 EC250172 */ fmuls f1, f5, f5
/* 00008504 EC24093A */ fmadds f1, f4, f4, f1
/* 00008508 EC2308FA */ fmadds f1, f3, f3, f1
/* 0000850C C01F0340 */ lfs f0, 0x340(r31)
/* 00008510 FC010040 */ fcmpo cr0, f1, f0
/* 00008514 41810098 */ bgt lbl_000085AC
/* 00008518 7F83E378 */ mr r3, r28
/* 0000851C 4BFF7C61 */ bl mathutil_mtxA_from_translate
/* 00008520 A87C0010 */ lha r3, 0x10(r28)
/* 00008524 4BFF7C59 */ bl mathutil_mtxA_rotate_z
/* 00008528 A87C000E */ lha r3, 0xe(r28)
/* 0000852C 4BFF7C51 */ bl mathutil_mtxA_rotate_y
/* 00008530 A87C000C */ lha r3, 0xc(r28)
/* 00008534 4BFF7C49 */ bl mathutil_mtxA_rotate_x
/* 00008538 387E0000 */ addi r3, r30, 0
/* 0000853C 3881000C */ addi r4, r1, 0xc
/* 00008540 4BFF7C3D */ bl mathutil_mtxA_rigid_inv_tf_point
/* 00008544 C001000C */ lfs f0, 0xc(r1)
/* 00008548 C05F0070 */ lfs f2, 0x70(r31)
/* 0000854C FC001040 */ fcmpo cr0, f0, f2
/* 00008550 4180005C */ blt lbl_000085AC
/* 00008554 C03F0020 */ lfs f1, 0x20(r31)
/* 00008558 FC000840 */ fcmpo cr0, f0, f1
/* 0000855C 41810050 */ bgt lbl_000085AC
/* 00008560 C0010014 */ lfs f0, 0x14(r1)
/* 00008564 FC001040 */ fcmpo cr0, f0, f2
/* 00008568 41800044 */ blt lbl_000085AC
/* 0000856C FC000840 */ fcmpo cr0, f0, f1
/* 00008570 4181003C */ bgt lbl_000085AC
/* 00008574 839A0144 */ lwz r28, 0x144(r26)
/* 00008578 801C0014 */ lwz r0, 0x14(r28)
/* 0000857C 540006F7 */ rlwinm. r0, r0, 0, 0x1b, 0x1b
/* 00008580 41820044 */ beq lbl_000085C4
/* 00008584 38600052 */ li r3, 0x52
/* 00008588 4BFF7BF5 */ bl u_play_sound_0
/* 0000858C 801C0014 */ lwz r0, 0x14(r28)
/* 00008590 540006B5 */ rlwinm. r0, r0, 0, 0x1a, 0x1a
/* 00008594 4082000C */ bne lbl_000085A0
/* 00008598 386000DC */ li r3, 0xdc
/* 0000859C 4BFF7BE1 */ bl u_play_sound_0
lbl_000085A0:
/* 000085A0 7F43D378 */ mr r3, r26
/* 000085A4 4BFFE345 */ bl lbl_000068E8
/* 000085A8 4800001C */ b lbl_000085C4
lbl_000085AC:
/* 000085AC 3B7B0001 */ addi r27, r27, 1
/* 000085B0 3B9C0014 */ addi r28, r28, 0x14
lbl_000085B4:
/* 000085B4 801D0030 */ lwz r0, 0x30(r29)
/* 000085B8 7F630734 */ extsh r3, r27
/* 000085BC 7C030000 */ cmpw r3, r0
/* 000085C0 4180FF1C */ blt lbl_000084DC
lbl_000085C4:
/* 000085C4 BB410018 */ lmw r26, 0x18(r1)
/* 000085C8 80010034 */ lwz r0, 0x34(r1)
/* 000085CC 38210030 */ addi r1, r1, 0x30
/* 000085D0 7C0803A6 */ mtlr r0
/* 000085D4 4E800020 */ blr 
