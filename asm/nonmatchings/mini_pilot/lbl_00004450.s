/* 00004450 7C0802A6 */ mflr r0
/* 00004454 3C800000 */ lis r4, lbl_10000000@ha
/* 00004458 90010004 */ stw r0, 4(r1)
/* 0000445C 3C600000 */ lis r3, currentBall@ha
/* 00004460 38840000 */ addi r4, r4, lbl_10000000@l
/* 00004464 9421FFE0 */ stwu r1, -0x20(r1)
/* 00004468 DBE10018 */ stfd f31, 0x18(r1)
/* 0000446C 93E10014 */ stw r31, 0x14(r1)
/* 00004470 93C10010 */ stw r30, 0x10(r1)
/* 00004474 83E30000 */ lwz r31, currentBall@l(r3)
/* 00004478 3C600000 */ lis r3, lbl_0000BE80@ha
/* 0000447C 3BC30000 */ addi r30, r3, lbl_0000BE80@l
/* 00004480 38640068 */ addi r3, r4, 0x68
/* 00004484 C0430000 */ lfs f2, 0(r3)
/* 00004488 C0230004 */ lfs f1, 4(r3)
/* 0000448C C0030008 */ lfs f0, 8(r3)
/* 00004490 EC4200B2 */ fmuls f2, f2, f2
/* 00004494 EC41107A */ fmadds f2, f1, f1, f2
/* 00004498 EC40103A */ fmadds f2, f0, f0, f2
/* 0000449C C81E0240 */ lfd f0, 0x240(r30)
/* 000044A0 FC020040 */ fcmpo cr0, f2, f0
/* 000044A4 418000B0 */ blt lbl_00004554
/* 000044A8 C0240068 */ lfs f1, 0x68(r4)
/* 000044AC C0440070 */ lfs f2, 0x70(r4)
/* 000044B0 4BFFBC9D */ bl mathutil_atan2
/* 000044B4 881F002E */ lbz r0, 0x2e(r31)
/* 000044B8 3C800000 */ lis r4, cameraInfo@ha
/* 000044BC 3BE30000 */ addi r31, r3, 0
/* 000044C0 C03E01CC */ lfs f1, 0x1cc(r30)
/* 000044C4 7C000774 */ extsb r0, r0
/* 000044C8 1C000284 */ mulli r0, r0, 0x284
/* 000044CC C05E0248 */ lfs f2, 0x248(r30)
/* 000044D0 C07E024C */ lfs f3, 0x24c(r30)
/* 000044D4 38640000 */ addi r3, r4, cameraInfo@l
/* 000044D8 7C630214 */ add r3, r3, r0
/* 000044DC C0830038 */ lfs f4, 0x38(r3)
/* 000044E0 3861000C */ addi r3, r1, 0xc
/* 000044E4 38810008 */ addi r4, r1, 8
/* 000044E8 480027E5 */ bl lbl_00006CCC
/* 000044EC C3FE0250 */ lfs f31, 0x250(r30)
/* 000044F0 4BFFBC5D */ bl mathutil_mtxA_from_mtxB
/* 000044F4 C05E0254 */ lfs f2, 0x254(r30)
/* 000044F8 C0210008 */ lfs f1, 8(r1)
/* 000044FC C001000C */ lfs f0, 0xc(r1)
/* 00004500 3C60E000 */ lis r3, 0xe000
/* 00004504 D003000C */ stfs f0, 0xc(r3)
/* 00004508 D023001C */ stfs f1, 0x1c(r3)
/* 0000450C D043002C */ stfs f2, 0x2c(r3)
/* 00004510 7FE30734 */ extsh r3, r31
/* 00004514 4BFFBC39 */ bl mathutil_mtxA_rotate_y
/* 00004518 FC20F890 */ fmr f1, f31
/* 0000451C 4BFFBC31 */ bl mathutil_mtxA_scale_s
/* 00004520 3C600000 */ lis r3, mathutilData@ha
/* 00004524 38630000 */ addi r3, r3, mathutilData@l
/* 00004528 80630000 */ lwz r3, 0(r3)
/* 0000452C 38800000 */ li r4, 0
/* 00004530 4BFFBC1D */ bl gxutil_load_pos_nrm_matrix
/* 00004534 FC20F890 */ fmr f1, f31
/* 00004538 4BFFBC15 */ bl avdisp_set_bound_sphere_scale
/* 0000453C 3C600000 */ lis r3, minigameGma@ha
/* 00004540 38630000 */ addi r3, r3, minigameGma@l
/* 00004544 80630000 */ lwz r3, 0(r3)
/* 00004548 80630008 */ lwz r3, 8(r3)
/* 0000454C 80630048 */ lwz r3, 0x48(r3)
/* 00004550 4BFFBBFD */ bl avdisp_draw_model_unculled_sort_translucent
lbl_00004554:
/* 00004554 80010024 */ lwz r0, 0x24(r1)
/* 00004558 CBE10018 */ lfd f31, 0x18(r1)
/* 0000455C 83E10014 */ lwz r31, 0x14(r1)
/* 00004560 7C0803A6 */ mtlr r0
/* 00004564 83C10010 */ lwz r30, 0x10(r1)
/* 00004568 38210020 */ addi r1, r1, 0x20
/* 0000456C 4E800020 */ blr 
