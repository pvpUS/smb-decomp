/* 0000BACC 7C0802A6 */ mflr r0
/* 0000BAD0 3C600000 */ lis r3, minigameGma@ha
/* 0000BAD4 90010004 */ stw r0, 4(r1)
/* 0000BAD8 38630000 */ addi r3, r3, minigameGma@l
/* 0000BADC 3CC00000 */ lis r6, lbl_0000C690@ha
/* 0000BAE0 9421FF50 */ stwu r1, -0xb0(r1)
/* 0000BAE4 DBE100A8 */ stfd f31, 0xa8(r1)
/* 0000BAE8 DBC100A0 */ stfd f30, 0xa0(r1)
/* 0000BAEC BF010080 */ stmw r24, 0x80(r1)
/* 0000BAF0 3B040000 */ addi r24, r4, 0
/* 0000BAF4 3B850000 */ addi r28, r5, 0
/* 0000BAF8 3BE60000 */ addi r31, r6, lbl_0000C690@l
/* 0000BAFC 80630000 */ lwz r3, 0(r3)
/* 0000BB00 83C30008 */ lwz r30, 8(r3)
/* 0000BB04 4BFF4649 */ bl mathutil_mtxA_push
/* 0000BB08 38610044 */ addi r3, r1, 0x44
/* 0000BB0C 4BFF4641 */ bl mathutil_mtxA_to_mtx
/* 0000BB10 4BFF463D */ bl mathutil_mtxA_from_mtxB
/* 0000BB14 38610044 */ addi r3, r1, 0x44
/* 0000BB18 4BFF4635 */ bl mathutil_mtxA_mult_right
/* 0000BB1C C0380000 */ lfs f1, 0(r24)
/* 0000BB20 C0580004 */ lfs f2, 4(r24)
/* 0000BB24 C0180008 */ lfs f0, 8(r24)
/* 0000BB28 EC210072 */ fmuls f1, f1, f1
/* 0000BB2C EC2208BA */ fmadds f1, f2, f2, f1
/* 0000BB30 EC20083A */ fmadds f1, f0, f0, f1
/* 0000BB34 4BFF4619 */ bl mathutil_sqrt
/* 0000BB38 C01F008C */ lfs f0, 0x8c(r31)
/* 0000BB3C C05F0090 */ lfs f2, 0x90(r31)
/* 0000BB40 EFE00072 */ fmuls f31, f0, f1
/* 0000BB44 C01F0020 */ lfs f0, 0x20(r31)
/* 0000BB48 EFFF1024 */ fdivs f31, f31, f2
/* 0000BB4C FC1F0040 */ fcmpo cr0, f31, f0
/* 0000BB50 40810008 */ ble lbl_0000BB58
/* 0000BB54 FFE00090 */ fmr f31, f0
lbl_0000BB58:
/* 0000BB58 FC20F890 */ fmr f1, f31
/* 0000BB5C 4BFF45F1 */ bl avdisp_set_alpha
/* 0000BB60 4BFF45ED */ bl mathutil_mtxA_push
/* 0000BB64 3861002C */ addi r3, r1, 0x2c
/* 0000BB68 38830004 */ addi r4, r3, 4
/* 0000BB6C 38630008 */ addi r3, r3, 8
/* 0000BB70 3F20E000 */ lis r25, 0xe000
/* 0000BB74 C059000C */ lfs f2, 0xc(r25)
/* 0000BB78 C039001C */ lfs f1, 0x1c(r25)
/* 0000BB7C C019002C */ lfs f0, 0x2c(r25)
/* 0000BB80 D041002C */ stfs f2, 0x2c(r1)
/* 0000BB84 D0240000 */ stfs f1, 0(r4)
/* 0000BB88 D0030000 */ stfs f0, 0(r3)
/* 0000BB8C 38610038 */ addi r3, r1, 0x38
/* 0000BB90 C05F0000 */ lfs f2, 0(r31)
/* 0000BB94 C03F0020 */ lfs f1, 0x20(r31)
/* 0000BB98 FC601090 */ fmr f3, f2
/* 0000BB9C 4BFF45B1 */ bl mathutil_mtxA_tf_vec_xyz
/* 0000BBA0 C3C10040 */ lfs f30, 0x40(r1)
/* 0000BBA4 C0210038 */ lfs f1, 0x38(r1)
/* 0000BBA8 EC1E07B2 */ fmuls f0, f30, f30
/* 0000BBAC EC210072 */ fmuls f1, f1, f1
/* 0000BBB0 EC21002A */ fadds f1, f1, f0
/* 0000BBB4 4BFF4599 */ bl mathutil_sqrt
/* 0000BBB8 D0210038 */ stfs f1, 0x38(r1)
/* 0000BBBC 38610038 */ addi r3, r1, 0x38
/* 0000BBC0 C01F0000 */ lfs f0, 0(r31)
/* 0000BBC4 D0010040 */ stfs f0, 0x40(r1)
/* 0000BBC8 4BFF4585 */ bl mathutil_vec_normalize_len
/* 0000BBCC 4BFF4581 */ bl mathutil_mtxA_sq_from_identity
/* 0000BBD0 C021003C */ lfs f1, 0x3c(r1)
/* 0000BBD4 C0410038 */ lfs f2, 0x38(r1)
/* 0000BBD8 4BFF4575 */ bl mathutil_mtxA_rotate_z_sin_cos
/* 0000BBDC FC00F210 */ fabs f0, f30
/* 0000BBE0 C83F0098 */ lfd f1, 0x98(r31)
/* 0000BBE4 C0410034 */ lfs f2, 0x34(r1)
/* 0000BBE8 C09F0040 */ lfs f4, 0x40(r31)
/* 0000BBEC FC210032 */ fmul f1, f1, f0
/* 0000BBF0 C001002C */ lfs f0, 0x2c(r1)
/* 0000BBF4 C0610030 */ lfs f3, 0x30(r1)
/* 0000BBF8 ECA22028 */ fsubs f5, f2, f4
/* 0000BBFC C05F00A0 */ lfs f2, 0xa0(r31)
/* 0000BC00 FC200818 */ frsp f1, f1
/* 0000BC04 EC431028 */ fsubs f2, f3, f2
/* 0000BC08 EC002028 */ fsubs f0, f0, f4
/* 0000BC0C D019000C */ stfs f0, 0xc(r25)
/* 0000BC10 D059001C */ stfs f2, 0x1c(r25)
/* 0000BC14 D0B9002C */ stfs f5, 0x2c(r25)
/* 0000BC18 EC01F82A */ fadds f0, f1, f31
/* 0000BC1C C07F0020 */ lfs f3, 0x20(r31)
/* 0000BC20 EC43002A */ fadds f2, f3, f0
/* 0000BC24 4BFF4529 */ bl mathutil_mtxA_scale_xyz
/* 0000BC28 3C800000 */ lis r4, mathutilData@ha
/* 0000BC2C 3C600000 */ lis r3, lbl_0000D3A0@ha
/* 0000BC30 3B640000 */ addi r27, r4, mathutilData@l
/* 0000BC34 3B230000 */ addi r25, r3, lbl_0000D3A0@l
/* 0000BC38 3BA00000 */ li r29, 0
/* 0000BC3C 3F404330 */ lis r26, 0x4330
lbl_0000BC40:
/* 0000BC40 C03F00A0 */ lfs f1, 0xa0(r31)
/* 0000BC44 C05F0000 */ lfs f2, 0(r31)
/* 0000BC48 C07F0058 */ lfs f3, 0x58(r31)
/* 0000BC4C 4BFF4501 */ bl mathutil_mtxA_translate_xyz
/* 0000BC50 3860FC00 */ li r3, -1024
/* 0000BC54 4BFF44F9 */ bl mathutil_mtxA_rotate_z
/* 0000BC58 807B0000 */ lwz r3, 0(r27)
/* 0000BC5C 38800000 */ li r4, 0
/* 0000BC60 4BFF44ED */ bl gxutil_load_pos_nrm_matrix
/* 0000BC64 6FA08000 */ xoris r0, r29, 0x8000
/* 0000BC68 C01F00A8 */ lfs f0, 0xa8(r31)
/* 0000BC6C 9001007C */ stw r0, 0x7c(r1)
/* 0000BC70 3C600000 */ lis r3, lbl_0000C6D8@ha
/* 0000BC74 C8430000 */ lfd f2, lbl_0000C6D8@l(r3)
/* 0000BC78 93410078 */ stw r26, 0x78(r1)
/* 0000BC7C C07F00A4 */ lfs f3, 0xa4(r31)
/* 0000BC80 C8210078 */ lfd f1, 0x78(r1)
/* 0000BC84 C09F0020 */ lfs f4, 0x20(r31)
/* 0000BC88 EC211028 */ fsubs f1, f1, f2
/* 0000BC8C EC010024 */ fdivs f0, f1, f0
/* 0000BC90 EC030032 */ fmuls f0, f3, f0
/* 0000BC94 EC240028 */ fsubs f1, f4, f0
/* 0000BC98 4BFF44B5 */ bl avdisp_set_alpha
/* 0000BC9C 578016BA */ rlwinm r0, r28, 2, 0x1a, 0x1d
/* 0000BCA0 7C790214 */ add r3, r25, r0
/* 0000BCA4 80030000 */ lwz r0, 0(r3)
/* 0000BCA8 38800002 */ li r4, 2
/* 0000BCAC 54001838 */ slwi r0, r0, 3
/* 0000BCB0 7F1E002E */ lwzx r24, r30, r0
/* 0000BCB4 7F03C378 */ mr r3, r24
/* 0000BCB8 4BFF4495 */ bl set_shape_flags_in_model
/* 0000BCBC 38780000 */ addi r3, r24, 0
/* 0000BCC0 3B9C0001 */ addi r28, r28, 1
/* 0000BCC4 4BFF4489 */ bl avdisp_draw_model_unculled_sort_none
/* 0000BCC8 3BBD0001 */ addi r29, r29, 1
/* 0000BCCC 2C1D0005 */ cmpwi r29, 5
/* 0000BCD0 4180FF70 */ blt lbl_0000BC40
/* 0000BCD4 4BFF4479 */ bl mathutil_mtxA_pop
/* 0000BCD8 4BFF4475 */ bl mathutil_mtxA_push
/* 0000BCDC 38610014 */ addi r3, r1, 0x14
/* 0000BCE0 38830004 */ addi r4, r3, 4
/* 0000BCE4 38630008 */ addi r3, r3, 8
/* 0000BCE8 3F20E000 */ lis r25, 0xe000
/* 0000BCEC C059000C */ lfs f2, 0xc(r25)
/* 0000BCF0 C039001C */ lfs f1, 0x1c(r25)
/* 0000BCF4 C019002C */ lfs f0, 0x2c(r25)
/* 0000BCF8 D0410014 */ stfs f2, 0x14(r1)
/* 0000BCFC D0240000 */ stfs f1, 0(r4)
/* 0000BD00 D0030000 */ stfs f0, 0(r3)
/* 0000BD04 38610020 */ addi r3, r1, 0x20
/* 0000BD08 C05F0000 */ lfs f2, 0(r31)
/* 0000BD0C C03F0080 */ lfs f1, 0x80(r31)
/* 0000BD10 FC601090 */ fmr f3, f2
/* 0000BD14 4BFF4439 */ bl mathutil_mtxA_tf_vec_xyz
/* 0000BD18 C3C10028 */ lfs f30, 0x28(r1)
/* 0000BD1C C0A10020 */ lfs f5, 0x20(r1)
/* 0000BD20 EC1E07B2 */ fmuls f0, f30, f30
/* 0000BD24 EC250172 */ fmuls f1, f5, f5
/* 0000BD28 EC21002A */ fadds f1, f1, f0
/* 0000BD2C 4BFF4421 */ bl mathutil_sqrt
/* 0000BD30 D0210020 */ stfs f1, 0x20(r1)
/* 0000BD34 38610020 */ addi r3, r1, 0x20
/* 0000BD38 C01F0000 */ lfs f0, 0(r31)
/* 0000BD3C D0010028 */ stfs f0, 0x28(r1)
/* 0000BD40 4BFF440D */ bl mathutil_vec_normalize_len
/* 0000BD44 4BFF4409 */ bl mathutil_mtxA_sq_from_identity
/* 0000BD48 C0210024 */ lfs f1, 0x24(r1)
/* 0000BD4C C0410020 */ lfs f2, 0x20(r1)
/* 0000BD50 4BFF43FD */ bl mathutil_mtxA_rotate_z_sin_cos
/* 0000BD54 FC00F210 */ fabs f0, f30
/* 0000BD58 C85F0098 */ lfd f2, 0x98(r31)
/* 0000BD5C C021001C */ lfs f1, 0x1c(r1)
/* 0000BD60 C07F0040 */ lfs f3, 0x40(r31)
/* 0000BD64 FCA20032 */ fmul f5, f2, f0
/* 0000BD68 C0010014 */ lfs f0, 0x14(r1)
/* 0000BD6C C0410018 */ lfs f2, 0x18(r1)
/* 0000BD70 EC811828 */ fsubs f4, f1, f3
/* 0000BD74 C03F00A0 */ lfs f1, 0xa0(r31)
/* 0000BD78 FCA02818 */ frsp f5, f5
/* 0000BD7C EC220828 */ fsubs f1, f2, f1
/* 0000BD80 EC03002A */ fadds f0, f3, f0
/* 0000BD84 D019000C */ stfs f0, 0xc(r25)
/* 0000BD88 D039001C */ stfs f1, 0x1c(r25)
/* 0000BD8C D099002C */ stfs f4, 0x2c(r25)
/* 0000BD90 EC05F82A */ fadds f0, f5, f31
/* 0000BD94 FC202850 */ fneg f1, f5
/* 0000BD98 C07F0020 */ lfs f3, 0x20(r31)
/* 0000BD9C EC43002A */ fadds f2, f3, f0
/* 0000BDA0 4BFF43AD */ bl mathutil_mtxA_scale_xyz
/* 0000BDA4 3C800000 */ lis r4, mathutilData@ha
/* 0000BDA8 3C600000 */ lis r3, lbl_0000D3A0@ha
/* 0000BDAC 3B240000 */ addi r25, r4, mathutilData@l
/* 0000BDB0 3B630000 */ addi r27, r3, lbl_0000D3A0@l
/* 0000BDB4 3BA00000 */ li r29, 0
/* 0000BDB8 3F404330 */ lis r26, 0x4330
lbl_0000BDBC:
/* 0000BDBC C03F00A0 */ lfs f1, 0xa0(r31)
/* 0000BDC0 C05F0000 */ lfs f2, 0(r31)
/* 0000BDC4 C07F0058 */ lfs f3, 0x58(r31)
/* 0000BDC8 4BFF4385 */ bl mathutil_mtxA_translate_xyz
/* 0000BDCC 3860FC00 */ li r3, -1024
/* 0000BDD0 4BFF437D */ bl mathutil_mtxA_rotate_z
/* 0000BDD4 80790000 */ lwz r3, 0(r25)
/* 0000BDD8 38800000 */ li r4, 0
/* 0000BDDC 4BFF4371 */ bl gxutil_load_pos_nrm_matrix
/* 0000BDE0 6FA08000 */ xoris r0, r29, 0x8000
/* 0000BDE4 C01F00A8 */ lfs f0, 0xa8(r31)
/* 0000BDE8 9001007C */ stw r0, 0x7c(r1)
/* 0000BDEC 3C600000 */ lis r3, lbl_0000C6D8@ha
/* 0000BDF0 C8430000 */ lfd f2, lbl_0000C6D8@l(r3)
/* 0000BDF4 93410078 */ stw r26, 0x78(r1)
/* 0000BDF8 C07F00A4 */ lfs f3, 0xa4(r31)
/* 0000BDFC C8210078 */ lfd f1, 0x78(r1)
/* 0000BE00 C09F0020 */ lfs f4, 0x20(r31)
/* 0000BE04 EC211028 */ fsubs f1, f1, f2
/* 0000BE08 EC010024 */ fdivs f0, f1, f0
/* 0000BE0C EC030032 */ fmuls f0, f3, f0
/* 0000BE10 EC240028 */ fsubs f1, f4, f0
/* 0000BE14 4BFF4339 */ bl avdisp_set_alpha
/* 0000BE18 578016BA */ rlwinm r0, r28, 2, 0x1a, 0x1d
/* 0000BE1C 7C7B0214 */ add r3, r27, r0
/* 0000BE20 80030000 */ lwz r0, 0(r3)
/* 0000BE24 38800002 */ li r4, 2
/* 0000BE28 54001838 */ slwi r0, r0, 3
/* 0000BE2C 7F1E002E */ lwzx r24, r30, r0
/* 0000BE30 7F03C378 */ mr r3, r24
/* 0000BE34 4BFF4319 */ bl set_shape_flags_in_model
/* 0000BE38 38780000 */ addi r3, r24, 0
/* 0000BE3C 3B9C0001 */ addi r28, r28, 1
/* 0000BE40 4BFF430D */ bl avdisp_draw_model_unculled_sort_none
/* 0000BE44 3BBD0001 */ addi r29, r29, 1
/* 0000BE48 2C1D0005 */ cmpwi r29, 5
/* 0000BE4C 4180FF70 */ blt lbl_0000BDBC
/* 0000BE50 4BFF42FD */ bl mathutil_mtxA_pop
/* 0000BE54 4BFF42F9 */ bl mathutil_mtxA_pop
/* 0000BE58 BB010080 */ lmw r24, 0x80(r1)
/* 0000BE5C 800100B4 */ lwz r0, 0xb4(r1)
/* 0000BE60 CBE100A8 */ lfd f31, 0xa8(r1)
/* 0000BE64 CBC100A0 */ lfd f30, 0xa0(r1)
/* 0000BE68 7C0803A6 */ mtlr r0
/* 0000BE6C 382100B0 */ addi r1, r1, 0xb0
/* 0000BE70 4E800020 */ blr 
