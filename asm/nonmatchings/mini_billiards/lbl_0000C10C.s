/* 0000C10C 7C0802A6 */ mflr r0
/* 0000C110 3C800000 */ lis r4, lbl_0001CE18@ha
/* 0000C114 90010004 */ stw r0, 4(r1)
/* 0000C118 3CA00000 */ lis r5, lbl_0001CAD8@ha
/* 0000C11C 3CE00000 */ lis r7, lbl_1000000E@ha
/* 0000C120 9421FF20 */ stwu r1, -0xe0(r1)
/* 0000C124 DBE100D8 */ stfd f31, 0xd8(r1)
/* 0000C128 DBC100D0 */ stfd f30, 0xd0(r1)
/* 0000C12C DBA100C8 */ stfd f29, 0xc8(r1)
/* 0000C130 DB8100C0 */ stfd f28, 0xc0(r1)
/* 0000C134 DB6100B8 */ stfd f27, 0xb8(r1)
/* 0000C138 DB4100B0 */ stfd f26, 0xb0(r1)
/* 0000C13C BEE1008C */ stmw r23, 0x8c(r1)
/* 0000C140 3B840000 */ addi r28, r4, lbl_0001CE18@l
/* 0000C144 3C800000 */ lis r4, lbl_10009878@ha
/* 0000C148 3B430000 */ addi r26, r3, 0
/* 0000C14C 3AE50000 */ addi r23, r5, lbl_0001CAD8@l
/* 0000C150 3B040000 */ addi r24, r4, lbl_10009878@l
/* 0000C154 3BC70000 */ addi r30, r7, lbl_1000000E@l
/* 0000C158 3B600000 */ li r27, 0
/* 0000C15C 3B200000 */ li r25, 0
/* 0000C160 80DC0074 */ lwz r6, 0x74(r28)
/* 0000C164 801C0078 */ lwz r0, 0x78(r28)
/* 0000C168 90C10078 */ stw r6, 0x78(r1)
/* 0000C16C 3CC00000 */ lis r6, lbl_10000049@ha
/* 0000C170 3BE60000 */ addi r31, r6, lbl_10000049@l
/* 0000C174 9001007C */ stw r0, 0x7c(r1)
/* 0000C178 801C007C */ lwz r0, 0x7c(r28)
/* 0000C17C 90010080 */ stw r0, 0x80(r1)
lbl_0000C180:
/* 0000C180 7C78CA14 */ add r3, r24, r25
/* 0000C184 38830034 */ addi r4, r3, 0x34
/* 0000C188 C0440000 */ lfs f2, 0(r4)
/* 0000C18C C0240004 */ lfs f1, 4(r4)
/* 0000C190 C0040008 */ lfs f0, 8(r4)
/* 0000C194 EC4200B2 */ fmuls f2, f2, f2
/* 0000C198 EC41107A */ fmadds f2, f1, f1, f2
/* 0000C19C EC40103A */ fmadds f2, f0, f0, f2
/* 0000C1A0 C01C002C */ lfs f0, 0x2c(r28)
/* 0000C1A4 FC020040 */ fcmpo cr0, f2, f0
/* 0000C1A8 40800018 */ bge lbl_0000C1C0
/* 0000C1AC C0230060 */ lfs f1, 0x60(r3)
/* 0000C1B0 C81C0030 */ lfd f0, 0x30(r28)
/* 0000C1B4 FC200A10 */ fabs f1, f1
/* 0000C1B8 FC010040 */ fcmpo cr0, f1, f0
/* 0000C1BC 41810664 */ bgt lbl_0000C820
lbl_0000C1C0:
/* 0000C1C0 7C78CA14 */ add r3, r24, r25
/* 0000C1C4 38830034 */ addi r4, r3, 0x34
/* 0000C1C8 C0440000 */ lfs f2, 0(r4)
/* 0000C1CC C0240004 */ lfs f1, 4(r4)
/* 0000C1D0 C0040008 */ lfs f0, 8(r4)
/* 0000C1D4 EC4200B2 */ fmuls f2, f2, f2
/* 0000C1D8 EC41107A */ fmadds f2, f1, f1, f2
/* 0000C1DC EC40103A */ fmadds f2, f0, f0, f2
/* 0000C1E0 C01C002C */ lfs f0, 0x2c(r28)
/* 0000C1E4 FC020040 */ fcmpo cr0, f2, f0
/* 0000C1E8 40810018 */ ble lbl_0000C200
/* 0000C1EC C03C0038 */ lfs f1, 0x38(r28)
/* 0000C1F0 38610048 */ addi r3, r1, 0x48
/* 0000C1F4 38A10078 */ addi r5, r1, 0x78
/* 0000C1F8 4BFF3F3D */ bl u_math_unk8
/* 0000C1FC 48000024 */ b lbl_0000C220
lbl_0000C200:
/* 0000C200 C01C0024 */ lfs f0, 0x24(r28)
/* 0000C204 D0010048 */ stfs f0, 0x48(r1)
/* 0000C208 C01C0024 */ lfs f0, 0x24(r28)
/* 0000C20C D001004C */ stfs f0, 0x4c(r1)
/* 0000C210 C01C0024 */ lfs f0, 0x24(r28)
/* 0000C214 D0010050 */ stfs f0, 0x50(r1)
/* 0000C218 C01C003C */ lfs f0, 0x3c(r28)
/* 0000C21C D0010054 */ stfs f0, 0x54(r1)
lbl_0000C220:
/* 0000C220 80810048 */ lwz r4, 0x48(r1)
/* 0000C224 38610038 */ addi r3, r1, 0x38
/* 0000C228 8001004C */ lwz r0, 0x4c(r1)
/* 0000C22C 90810038 */ stw r4, 0x38(r1)
/* 0000C230 80810050 */ lwz r4, 0x50(r1)
/* 0000C234 9001003C */ stw r0, 0x3c(r1)
/* 0000C238 80010054 */ lwz r0, 0x54(r1)
/* 0000C23C 90810040 */ stw r4, 0x40(r1)
/* 0000C240 90010044 */ stw r0, 0x44(r1)
/* 0000C244 4BFF3EF1 */ bl u_math_unk6
/* 0000C248 38610038 */ addi r3, r1, 0x38
/* 0000C24C 7FB8CA14 */ add r29, r24, r25
/* 0000C250 38830000 */ addi r4, r3, 0
/* 0000C254 38BD0054 */ addi r5, r29, 0x54
/* 0000C258 4BFF3EDD */ bl mathutil_quat_mult
/* 0000C25C 881D0002 */ lbz r0, 2(r29)
/* 0000C260 7C000775 */ extsb. r0, r0
/* 0000C264 4082012C */ bne lbl_0000C390
/* 0000C268 387D0054 */ addi r3, r29, 0x54
/* 0000C26C 3881002C */ addi r4, r1, 0x2c
/* 0000C270 4BFF3EC5 */ bl mathutil_quat_to_axis_angle
/* 0000C274 FFE00890 */ fmr f31, f1
/* 0000C278 C03C0080 */ lfs f1, 0x80(r28)
/* 0000C27C 38610068 */ addi r3, r1, 0x68
/* 0000C280 389D0054 */ addi r4, r29, 0x54
/* 0000C284 38A10048 */ addi r5, r1, 0x48
/* 0000C288 4BFF3EAD */ bl mathutil_quat_slerp
/* 0000C28C C03C0084 */ lfs f1, 0x84(r28)
/* 0000C290 38610058 */ addi r3, r1, 0x58
/* 0000C294 389D0054 */ addi r4, r29, 0x54
/* 0000C298 38A10048 */ addi r5, r1, 0x48
/* 0000C29C 4BFF3E99 */ bl mathutil_quat_slerp
/* 0000C2A0 38610068 */ addi r3, r1, 0x68
/* 0000C2A4 4BFF3E91 */ bl mathutil_quat_normalize
/* 0000C2A8 38610058 */ addi r3, r1, 0x58
/* 0000C2AC 4BFF3E89 */ bl mathutil_quat_normalize
/* 0000C2B0 38610068 */ addi r3, r1, 0x68
/* 0000C2B4 3881002C */ addi r4, r1, 0x2c
/* 0000C2B8 4BFF3E7D */ bl mathutil_quat_to_axis_angle
/* 0000C2BC 387D0034 */ addi r3, r29, 0x34
/* 0000C2C0 C0630000 */ lfs f3, 0(r3)
/* 0000C2C4 C0430004 */ lfs f2, 4(r3)
/* 0000C2C8 C0030008 */ lfs f0, 8(r3)
/* 0000C2CC EC8300F2 */ fmuls f4, f3, f3
/* 0000C2D0 EC8220BA */ fmadds f4, f2, f2, f4
/* 0000C2D4 EC80203A */ fmadds f4, f0, f0, f4
/* 0000C2D8 C07C0038 */ lfs f3, 0x38(r28)
/* 0000C2DC FC5F07F2 */ fmul f2, f31, f31
/* 0000C2E0 FC010072 */ fmul f0, f1, f1
/* 0000C2E4 FC201018 */ frsp f1, f2
/* 0000C2E8 FC000018 */ frsp f0, f0
/* 0000C2EC EC230072 */ fmuls f1, f3, f1
/* 0000C2F0 EC030032 */ fmuls f0, f3, f0
/* 0000C2F4 EC230072 */ fmuls f1, f3, f1
/* 0000C2F8 EC030032 */ fmuls f0, f3, f0
/* 0000C2FC EC21202A */ fadds f1, f1, f4
/* 0000C300 EC210028 */ fsubs f1, f1, f0
/* 0000C304 4BFF3E31 */ bl mathutil_sqrt
/* 0000C308 FFE00890 */ fmr f31, f1
/* 0000C30C C03C0038 */ lfs f1, 0x38(r28)
/* 0000C310 38610058 */ addi r3, r1, 0x58
/* 0000C314 38810020 */ addi r4, r1, 0x20
/* 0000C318 38A10078 */ addi r5, r1, 0x78
/* 0000C31C 4BFF3E19 */ bl u_math_unk7
/* 0000C320 C0210020 */ lfs f1, 0x20(r1)
/* 0000C324 38610020 */ addi r3, r1, 0x20
/* 0000C328 C01D0034 */ lfs f0, 0x34(r29)
/* 0000C32C EC01002A */ fadds f0, f1, f0
/* 0000C330 D0010020 */ stfs f0, 0x20(r1)
/* 0000C334 C0210024 */ lfs f1, 0x24(r1)
/* 0000C338 C01D0038 */ lfs f0, 0x38(r29)
/* 0000C33C EC01002A */ fadds f0, f1, f0
/* 0000C340 D0010024 */ stfs f0, 0x24(r1)
/* 0000C344 C0210028 */ lfs f1, 0x28(r1)
/* 0000C348 C01D003C */ lfs f0, 0x3c(r29)
/* 0000C34C EC01002A */ fadds f0, f1, f0
/* 0000C350 D0010028 */ stfs f0, 0x28(r1)
/* 0000C354 4BFF3DE1 */ bl mathutil_vec_normalize_len
/* 0000C358 C0010020 */ lfs f0, 0x20(r1)
/* 0000C35C EC0007F2 */ fmuls f0, f0, f31
/* 0000C360 D01D0034 */ stfs f0, 0x34(r29)
/* 0000C364 C0010028 */ lfs f0, 0x28(r1)
/* 0000C368 EC0007F2 */ fmuls f0, f0, f31
/* 0000C36C D01D003C */ stfs f0, 0x3c(r29)
/* 0000C370 80610068 */ lwz r3, 0x68(r1)
/* 0000C374 8001006C */ lwz r0, 0x6c(r1)
/* 0000C378 907D0054 */ stw r3, 0x54(r29)
/* 0000C37C 901D0058 */ stw r0, 0x58(r29)
/* 0000C380 80610070 */ lwz r3, 0x70(r1)
/* 0000C384 80010074 */ lwz r0, 0x74(r1)
/* 0000C388 907D005C */ stw r3, 0x5c(r29)
/* 0000C38C 901D0060 */ stw r0, 0x60(r29)
lbl_0000C390:
/* 0000C390 7FB8CA14 */ add r29, r24, r25
/* 0000C394 38610068 */ addi r3, r1, 0x68
/* 0000C398 389D0054 */ addi r4, r29, 0x54
/* 0000C39C 38BD0044 */ addi r5, r29, 0x44
/* 0000C3A0 4BFF3D95 */ bl mathutil_quat_mult
/* 0000C3A4 80610068 */ lwz r3, 0x68(r1)
/* 0000C3A8 8001006C */ lwz r0, 0x6c(r1)
/* 0000C3AC 907D0044 */ stw r3, 0x44(r29)
/* 0000C3B0 901D0048 */ stw r0, 0x48(r29)
/* 0000C3B4 80610070 */ lwz r3, 0x70(r1)
/* 0000C3B8 80010074 */ lwz r0, 0x74(r1)
/* 0000C3BC 907D004C */ stw r3, 0x4c(r29)
/* 0000C3C0 901D0050 */ stw r0, 0x50(r29)
/* 0000C3C4 C01D0034 */ lfs f0, 0x34(r29)
/* 0000C3C8 C03D003C */ lfs f1, 0x3c(r29)
/* 0000C3CC EC400032 */ fmuls f2, f0, f0
/* 0000C3D0 C01C0024 */ lfs f0, 0x24(r28)
/* 0000C3D4 EC210072 */ fmuls f1, f1, f1
/* 0000C3D8 EFE2082A */ fadds f31, f2, f1
/* 0000C3DC FC1F0040 */ fcmpo cr0, f31, f0
/* 0000C3E0 40810260 */ ble lbl_0000C640
/* 0000C3E4 FC20F890 */ fmr f1, f31
/* 0000C3E8 38610010 */ addi r3, r1, 0x10
/* 0000C3EC 4BFF3D49 */ bl func_8000716C
/* 0000C3F0 FFE00890 */ fmr f31, f1
/* 0000C3F4 4BFF3D41 */ bl mathutil_mtxA_from_identity
/* 0000C3F8 C03D0034 */ lfs f1, 0x34(r29)
/* 0000C3FC C01D003C */ lfs f0, 0x3c(r29)
/* 0000C400 EC3F0072 */ fmuls f1, f31, f1
/* 0000C404 EC5F0032 */ fmuls f2, f31, f0
/* 0000C408 4BFF3D2D */ bl mathutil_mtxA_rotate_y_sin_cos
/* 0000C40C C03C0024 */ lfs f1, 0x24(r28)
/* 0000C410 C05C003C */ lfs f2, 0x3c(r28)
/* 0000C414 4BFF3D21 */ bl mathutil_mtxA_rotate_z_sin_cos
/* 0000C418 387D0054 */ addi r3, r29, 0x54
/* 0000C41C 38810068 */ addi r4, r1, 0x68
/* 0000C420 4BFF3D15 */ bl u_math_unk11
/* 0000C424 C03C0038 */ lfs f1, 0x38(r28)
/* 0000C428 38610068 */ addi r3, r1, 0x68
/* 0000C42C 38810014 */ addi r4, r1, 0x14
/* 0000C430 38A10078 */ addi r5, r1, 0x78
/* 0000C434 4BFF3D01 */ bl u_math_unk7
/* 0000C438 C01C0024 */ lfs f0, 0x24(r28)
/* 0000C43C D0010018 */ stfs f0, 0x18(r1)
/* 0000C440 C01C0024 */ lfs f0, 0x24(r28)
/* 0000C444 D001001C */ stfs f0, 0x1c(r1)
/* 0000C448 C0210014 */ lfs f1, 0x14(r1)
/* 0000C44C C81C0040 */ lfd f0, 0x40(r28)
/* 0000C450 FC200A10 */ fabs f1, f1
/* 0000C454 FC010040 */ fcmpo cr0, f1, f0
/* 0000C458 40810050 */ ble lbl_0000C4A8
/* 0000C45C 38610014 */ addi r3, r1, 0x14
/* 0000C460 38830000 */ addi r4, r3, 0
/* 0000C464 4BFF3CD1 */ bl mathutil_mtxA_tf_vec
/* 0000C468 C0210014 */ lfs f1, 0x14(r1)
/* 0000C46C C01C0088 */ lfs f0, 0x88(r28)
/* 0000C470 EC010032 */ fmuls f0, f1, f0
/* 0000C474 D0010014 */ stfs f0, 0x14(r1)
/* 0000C478 C021001C */ lfs f1, 0x1c(r1)
/* 0000C47C C01C0088 */ lfs f0, 0x88(r28)
/* 0000C480 EC010032 */ fmuls f0, f1, f0
/* 0000C484 D001001C */ stfs f0, 0x1c(r1)
/* 0000C488 C03D0034 */ lfs f1, 0x34(r29)
/* 0000C48C C0010014 */ lfs f0, 0x14(r1)
/* 0000C490 EC01002A */ fadds f0, f1, f0
/* 0000C494 D01D0034 */ stfs f0, 0x34(r29)
/* 0000C498 C03D003C */ lfs f1, 0x3c(r29)
/* 0000C49C C001001C */ lfs f0, 0x1c(r1)
/* 0000C4A0 EC01002A */ fadds f0, f1, f0
/* 0000C4A4 D01D003C */ stfs f0, 0x3c(r29)
lbl_0000C4A8:
/* 0000C4A8 7FB8CA14 */ add r29, r24, r25
/* 0000C4AC 387D0034 */ addi r3, r29, 0x34
/* 0000C4B0 4BFF3C85 */ bl mathutil_vec_normalize_len
/* 0000C4B4 C0210010 */ lfs f1, 0x10(r1)
/* 0000C4B8 C01C008C */ lfs f0, 0x8c(r28)
/* 0000C4BC FC010040 */ fcmpo cr0, f1, f0
/* 0000C4C0 408000D0 */ bge lbl_0000C590
/* 0000C4C4 C03D0060 */ lfs f1, 0x60(r29)
/* 0000C4C8 C81C0090 */ lfd f0, 0x90(r28)
/* 0000C4CC FC200A10 */ fabs f1, f1
/* 0000C4D0 FC010040 */ fcmpo cr0, f1, f0
/* 0000C4D4 408100BC */ ble lbl_0000C590
/* 0000C4D8 C01C0024 */ lfs f0, 0x24(r28)
/* 0000C4DC 7F400775 */ extsb. r0, r26
/* 0000C4E0 D01D0034 */ stfs f0, 0x34(r29)
/* 0000C4E4 C01C0024 */ lfs f0, 0x24(r28)
/* 0000C4E8 D01D0038 */ stfs f0, 0x38(r29)
/* 0000C4EC C01C0024 */ lfs f0, 0x24(r28)
/* 0000C4F0 D01D003C */ stfs f0, 0x3c(r29)
/* 0000C4F4 C01C0024 */ lfs f0, 0x24(r28)
/* 0000C4F8 D01D0054 */ stfs f0, 0x54(r29)
/* 0000C4FC C01C0024 */ lfs f0, 0x24(r28)
/* 0000C500 D01D0058 */ stfs f0, 0x58(r29)
/* 0000C504 C01C0024 */ lfs f0, 0x24(r28)
/* 0000C508 D01D005C */ stfs f0, 0x5c(r29)
/* 0000C50C C01C003C */ lfs f0, 0x3c(r28)
/* 0000C510 D01D0060 */ stfs f0, 0x60(r29)
/* 0000C514 4182012C */ beq lbl_0000C640
/* 0000C518 2C1B0000 */ cmpwi r27, 0
/* 0000C51C 41820124 */ beq lbl_0000C640
/* 0000C520 881D0000 */ lbz r0, 0(r29)
/* 0000C524 2C000001 */ cmpwi r0, 1
/* 0000C528 40820118 */ bne lbl_0000C640
/* 0000C52C 88180000 */ lbz r0, 0(r24)
/* 0000C530 2C000001 */ cmpwi r0, 1
/* 0000C534 4082010C */ bne lbl_0000C640
/* 0000C538 881803A8 */ lbz r0, 0x3a8(r24)
/* 0000C53C 2C000001 */ cmpwi r0, 1
/* 0000C540 40820100 */ bne lbl_0000C640
/* 0000C544 887E0000 */ lbz r3, 0(r30)
/* 0000C548 881F0000 */ lbz r0, 0(r31)
/* 0000C54C 7C630774 */ extsb r3, r3
/* 0000C550 7C000774 */ extsb r0, r0
/* 0000C554 7C030000 */ cmpw r3, r0
/* 0000C558 408200E8 */ bne lbl_0000C640
/* 0000C55C C03D0010 */ lfs f1, 0x10(r29)
/* 0000C560 C81C0098 */ lfd f0, 0x98(r28)
/* 0000C564 FC200A10 */ fabs f1, f1
/* 0000C568 FC010040 */ fcmpo cr0, f1, f0
/* 0000C56C 41810018 */ bgt lbl_0000C584
/* 0000C570 C03D0018 */ lfs f1, 0x18(r29)
/* 0000C574 C81C00A0 */ lfd f0, 0xa0(r28)
/* 0000C578 FC200A10 */ fabs f1, f1
/* 0000C57C FC010040 */ fcmpo cr0, f1, f0
/* 0000C580 408100C0 */ ble lbl_0000C640
lbl_0000C584:
/* 0000C584 3860008A */ li r3, 0x8a
/* 0000C588 4BFF3BAD */ bl u_play_sound_0
/* 0000C58C 480000B4 */ b lbl_0000C640
lbl_0000C590:
/* 0000C590 C03C00A8 */ lfs f1, 0xa8(r28)
/* 0000C594 C01C00AC */ lfs f0, 0xac(r28)
/* 0000C598 EC4107F2 */ fmuls f2, f1, f31
/* 0000C59C FC020040 */ fcmpo cr0, f2, f0
/* 0000C5A0 40810008 */ ble lbl_0000C5A8
/* 0000C5A4 FC400090 */ fmr f2, f0
lbl_0000C5A8:
/* 0000C5A8 C01C003C */ lfs f0, 0x3c(r28)
/* 0000C5AC 7C78CA14 */ add r3, r24, r25
/* 0000C5B0 C0210010 */ lfs f1, 0x10(r1)
/* 0000C5B4 EC001028 */ fsubs f0, f0, f2
/* 0000C5B8 EFE100B2 */ fmuls f31, f1, f2
/* 0000C5BC EC010032 */ fmuls f0, f1, f0
/* 0000C5C0 D0010010 */ stfs f0, 0x10(r1)
/* 0000C5C4 C0230034 */ lfs f1, 0x34(r3)
/* 0000C5C8 C0010010 */ lfs f0, 0x10(r1)
/* 0000C5CC EC010032 */ fmuls f0, f1, f0
/* 0000C5D0 D0030034 */ stfs f0, 0x34(r3)
/* 0000C5D4 C0230038 */ lfs f1, 0x38(r3)
/* 0000C5D8 C0010010 */ lfs f0, 0x10(r1)
/* 0000C5DC EC010032 */ fmuls f0, f1, f0
/* 0000C5E0 D0030038 */ stfs f0, 0x38(r3)
/* 0000C5E4 C023003C */ lfs f1, 0x3c(r3)
/* 0000C5E8 C0010010 */ lfs f0, 0x10(r1)
/* 0000C5EC EC010032 */ fmuls f0, f1, f0
/* 0000C5F0 D003003C */ stfs f0, 0x3c(r3)
/* 0000C5F4 C0230060 */ lfs f1, 0x60(r3)
/* 0000C5F8 C81C0030 */ lfd f0, 0x30(r28)
/* 0000C5FC FC200A10 */ fabs f1, f1
/* 0000C600 FC010040 */ fcmpo cr0, f1, f0
/* 0000C604 4080003C */ bge lbl_0000C640
/* 0000C608 38630054 */ addi r3, r3, 0x54
/* 0000C60C 38810014 */ addi r4, r1, 0x14
/* 0000C610 4BFF3B25 */ bl mathutil_quat_to_axis_angle
/* 0000C614 C05C00B0 */ lfs f2, 0xb0(r28)
/* 0000C618 C81C00B8 */ lfd f0, 0xb8(r28)
/* 0000C61C EFE207F2 */ fmuls f31, f2, f31
/* 0000C620 FC21F828 */ fsub f1, f1, f31
/* 0000C624 FC010040 */ fcmpo cr0, f1, f0
/* 0000C628 40800008 */ bge lbl_0000C630
/* 0000C62C FC200090 */ fmr f1, f0
lbl_0000C630:
/* 0000C630 7C78CA14 */ add r3, r24, r25
/* 0000C634 38630054 */ addi r3, r3, 0x54
/* 0000C638 38810014 */ addi r4, r1, 0x14
/* 0000C63C 4BFF3AF9 */ bl u_math_unk9_smth_w_quats
lbl_0000C640:
/* 0000C640 C01C0024 */ lfs f0, 0x24(r28)
/* 0000C644 7C78CA14 */ add r3, r24, r25
/* 0000C648 D0030040 */ stfs f0, 0x40(r3)
/* 0000C64C C0030010 */ lfs f0, 0x10(r3)
/* 0000C650 D003001C */ stfs f0, 0x1c(r3)
/* 0000C654 C0030014 */ lfs f0, 0x14(r3)
/* 0000C658 D0030020 */ stfs f0, 0x20(r3)
/* 0000C65C C0030018 */ lfs f0, 0x18(r3)
/* 0000C660 D0030024 */ stfs f0, 0x24(r3)
/* 0000C664 C0230010 */ lfs f1, 0x10(r3)
/* 0000C668 C0030034 */ lfs f0, 0x34(r3)
/* 0000C66C EC01002A */ fadds f0, f1, f0
/* 0000C670 D0030010 */ stfs f0, 0x10(r3)
/* 0000C674 C0230018 */ lfs f1, 0x18(r3)
/* 0000C678 C003003C */ lfs f0, 0x3c(r3)
/* 0000C67C EC01002A */ fadds f0, f1, f0
/* 0000C680 D0030018 */ stfs f0, 0x18(r3)
/* 0000C684 88030000 */ lbz r0, 0(r3)
/* 0000C688 2C000001 */ cmpwi r0, 1
/* 0000C68C 4182018C */ beq lbl_0000C818
/* 0000C690 C0230038 */ lfs f1, 0x38(r3)
/* 0000C694 C01C00C0 */ lfs f0, 0xc0(r28)
/* 0000C698 EC010028 */ fsubs f0, f1, f0
/* 0000C69C D0030038 */ stfs f0, 0x38(r3)
/* 0000C6A0 C0230014 */ lfs f1, 0x14(r3)
/* 0000C6A4 C0030038 */ lfs f0, 0x38(r3)
/* 0000C6A8 EC01002A */ fadds f0, f1, f0
/* 0000C6AC D0030014 */ stfs f0, 0x14(r3)
/* 0000C6B0 C0230014 */ lfs f1, 0x14(r3)
/* 0000C6B4 C01C00C4 */ lfs f0, 0xc4(r28)
/* 0000C6B8 FC010040 */ fcmpo cr0, f1, f0
/* 0000C6BC 40800010 */ bge lbl_0000C6CC
/* 0000C6C0 D0030014 */ stfs f0, 0x14(r3)
/* 0000C6C4 C01C0024 */ lfs f0, 0x24(r28)
/* 0000C6C8 D0030038 */ stfs f0, 0x38(r3)
lbl_0000C6CC:
/* 0000C6CC 7C78CA14 */ add r3, r24, r25
/* 0000C6D0 C01C0024 */ lfs f0, 0x24(r28)
/* 0000C6D4 C0230014 */ lfs f1, 0x14(r3)
/* 0000C6D8 FC010040 */ fcmpo cr0, f1, f0
/* 0000C6DC 4080000C */ bge lbl_0000C6E8
/* 0000C6E0 C3FC0038 */ lfs f31, 0x38(r28)
/* 0000C6E4 48000018 */ b lbl_0000C6FC
lbl_0000C6E8:
/* 0000C6E8 EC010072 */ fmuls f0, f1, f1
/* 0000C6EC C03C00C8 */ lfs f1, 0xc8(r28)
/* 0000C6F0 EC21002A */ fadds f1, f1, f0
/* 0000C6F4 4BFF3A41 */ bl mathutil_sqrt
/* 0000C6F8 FFE00890 */ fmr f31, f1
lbl_0000C6FC:
/* 0000C6FC 38000002 */ li r0, 2
/* 0000C700 7C0903A6 */ mtctr r0
/* 0000C704 7C98CA14 */ add r4, r24, r25
/* 0000C708 38C00000 */ li r6, 0
/* 0000C70C 38600000 */ li r3, 0
lbl_0000C710:
/* 0000C710 7CB71A14 */ add r5, r23, r3
/* 0000C714 C0A40010 */ lfs f5, 0x10(r4)
/* 0000C718 C3850000 */ lfs f28, 0(r5)
/* 0000C71C C3650008 */ lfs f27, 8(r5)
/* 0000C720 C0840018 */ lfs f4, 0x18(r4)
/* 0000C724 EFC5E028 */ fsubs f30, f5, f28
/* 0000C728 C345000C */ lfs f26, 0xc(r5)
/* 0000C72C EFA4D828 */ fsubs f29, f4, f27
/* 0000C730 C05C00CC */ lfs f2, 0xcc(r28)
/* 0000C734 EC7E07B2 */ fmuls f3, f30, f30
/* 0000C738 EC02D02A */ fadds f0, f2, f26
/* 0000C73C EC3D0772 */ fmuls f1, f29, f29
/* 0000C740 EC000032 */ fmuls f0, f0, f0
/* 0000C744 EC23082A */ fadds f1, f3, f1
/* 0000C748 FC010040 */ fcmpo cr0, f1, f0
/* 0000C74C 41800088 */ blt lbl_0000C7D4
/* 0000C750 38630018 */ addi r3, r3, 0x18
/* 0000C754 7CB71A14 */ add r5, r23, r3
/* 0000C758 C3850000 */ lfs f28, 0(r5)
/* 0000C75C 38C60001 */ addi r6, r6, 1
/* 0000C760 C3650008 */ lfs f27, 8(r5)
/* 0000C764 EFC5E028 */ fsubs f30, f5, f28
/* 0000C768 C345000C */ lfs f26, 0xc(r5)
/* 0000C76C EFA4D828 */ fsubs f29, f4, f27
/* 0000C770 EC02D02A */ fadds f0, f2, f26
/* 0000C774 EC7E07B2 */ fmuls f3, f30, f30
/* 0000C778 EC3D0772 */ fmuls f1, f29, f29
/* 0000C77C EC000032 */ fmuls f0, f0, f0
/* 0000C780 EC23082A */ fadds f1, f3, f1
/* 0000C784 FC010040 */ fcmpo cr0, f1, f0
/* 0000C788 4180004C */ blt lbl_0000C7D4
/* 0000C78C 38630018 */ addi r3, r3, 0x18
/* 0000C790 7CB71A14 */ add r5, r23, r3
/* 0000C794 C3850000 */ lfs f28, 0(r5)
/* 0000C798 38C60001 */ addi r6, r6, 1
/* 0000C79C C3650008 */ lfs f27, 8(r5)
/* 0000C7A0 EFC5E028 */ fsubs f30, f5, f28
/* 0000C7A4 C345000C */ lfs f26, 0xc(r5)
/* 0000C7A8 EFA4D828 */ fsubs f29, f4, f27
/* 0000C7AC EC02D02A */ fadds f0, f2, f26
/* 0000C7B0 EC7E07B2 */ fmuls f3, f30, f30
/* 0000C7B4 EC3D0772 */ fmuls f1, f29, f29
/* 0000C7B8 EC000032 */ fmuls f0, f0, f0
/* 0000C7BC EC23082A */ fadds f1, f3, f1
/* 0000C7C0 FC010040 */ fcmpo cr0, f1, f0
/* 0000C7C4 41800010 */ blt lbl_0000C7D4
/* 0000C7C8 38C60001 */ addi r6, r6, 1
/* 0000C7CC 38630018 */ addi r3, r3, 0x18
/* 0000C7D0 4200FF40 */ bdnz lbl_0000C710
lbl_0000C7D4:
/* 0000C7D4 2C060006 */ cmpwi r6, 6
/* 0000C7D8 40800048 */ bge lbl_0000C820
/* 0000C7DC 3861000C */ addi r3, r1, 0xc
/* 0000C7E0 4BFF3955 */ bl func_8000716C
/* 0000C7E4 EC5AF828 */ fsubs f2, f26, f31
/* 0000C7E8 C001000C */ lfs f0, 0xc(r1)
/* 0000C7EC FC001040 */ fcmpo cr0, f0, f2
/* 0000C7F0 40810030 */ ble lbl_0000C820
/* 0000C7F4 EC420072 */ fmuls f2, f2, f1
/* 0000C7F8 7C78CA14 */ add r3, r24, r25
/* 0000C7FC EC3E00B2 */ fmuls f1, f30, f2
/* 0000C800 EC1D00B2 */ fmuls f0, f29, f2
/* 0000C804 EC3C082A */ fadds f1, f28, f1
/* 0000C808 EC1B002A */ fadds f0, f27, f0
/* 0000C80C D0230010 */ stfs f1, 0x10(r3)
/* 0000C810 D0030018 */ stfs f0, 0x18(r3)
/* 0000C814 4800000C */ b lbl_0000C820
lbl_0000C818:
/* 0000C818 C01C0038 */ lfs f0, 0x38(r28)
/* 0000C81C D0030014 */ stfs f0, 0x14(r3)
lbl_0000C820:
/* 0000C820 3B7B0001 */ addi r27, r27, 1
/* 0000C824 2C1B000A */ cmpwi r27, 0xa
/* 0000C828 3B390068 */ addi r25, r25, 0x68
/* 0000C82C 4180F954 */ blt lbl_0000C180
/* 0000C830 BAE1008C */ lmw r23, 0x8c(r1)
/* 0000C834 800100E4 */ lwz r0, 0xe4(r1)
/* 0000C838 CBE100D8 */ lfd f31, 0xd8(r1)
/* 0000C83C CBC100D0 */ lfd f30, 0xd0(r1)
/* 0000C840 7C0803A6 */ mtlr r0
/* 0000C844 CBA100C8 */ lfd f29, 0xc8(r1)
/* 0000C848 CB8100C0 */ lfd f28, 0xc0(r1)
/* 0000C84C CB6100B8 */ lfd f27, 0xb8(r1)
/* 0000C850 CB4100B0 */ lfd f26, 0xb0(r1)
/* 0000C854 382100E0 */ addi r1, r1, 0xe0
/* 0000C858 4E800020 */ blr 
