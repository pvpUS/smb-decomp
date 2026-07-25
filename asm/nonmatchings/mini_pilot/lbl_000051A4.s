/* 000051A4 7C0802A6 */ mflr r0
/* 000051A8 2C040003 */ cmpwi r4, 3
/* 000051AC 90010004 */ stw r0, 4(r1)
/* 000051B0 3CC00000 */ lis r6, lbl_0000BE80@ha
/* 000051B4 9421FFB8 */ stwu r1, -0x48(r1)
/* 000051B8 DBE10040 */ stfd f31, 0x40(r1)
/* 000051BC 93E1003C */ stw r31, 0x3c(r1)
/* 000051C0 3BE60000 */ addi r31, r6, lbl_0000BE80@l
/* 000051C4 93C10038 */ stw r30, 0x38(r1)
/* 000051C8 93A10034 */ stw r29, 0x34(r1)
/* 000051CC 7C7D1B78 */ mr r29, r3
/* 000051D0 93810030 */ stw r28, 0x30(r1)
/* 000051D4 880300C0 */ lbz r0, 0xc0(r3)
/* 000051D8 3C600000 */ lis r3, ballInfo@ha
/* 000051DC 7C000774 */ extsb r0, r0
/* 000051E0 1CA001A4 */ mulli r5, r0, 0x1a4
/* 000051E4 38030000 */ addi r0, r3, ballInfo@l
/* 000051E8 7FC02A14 */ add r30, r0, r5
/* 000051EC 41820008 */ beq lbl_000051F4
/* 000051F0 48000010 */ b lbl_00005200
lbl_000051F4:
/* 000051F4 7FA3EB78 */ mr r3, r29
/* 000051F8 4BFFAF55 */ bl ape_destroy
/* 000051FC 480001F4 */ b lbl_000053F0
lbl_00005200:
/* 00005200 3C600000 */ lis r3, debugFlags@ha
/* 00005204 80030000 */ lwz r0, debugFlags@l(r3)
/* 00005208 7000000A */ andi. r0, r0, 0xa
/* 0000520C 408201E4 */ bne lbl_000053F0
/* 00005210 3C600000 */ lis r3, currentBall@ha
/* 00005214 80030000 */ lwz r0, currentBall@l(r3)
/* 00005218 7C1E0040 */ cmplw r30, r0
/* 0000521C 408201D4 */ bne lbl_000053F0
/* 00005220 387E0004 */ addi r3, r30, 4
/* 00005224 38810010 */ addi r4, r1, 0x10
/* 00005228 38A00000 */ li r5, 0
/* 0000522C 4BFFAF21 */ bl raycast_stage_down
/* 00005230 807D0014 */ lwz r3, 0x14(r29)
/* 00005234 3800FFEC */ li r0, -20
/* 00005238 7C600038 */ and r0, r3, r0
/* 0000523C 901D0014 */ stw r0, 0x14(r29)
/* 00005240 80010010 */ lwz r0, 0x10(r1)
/* 00005244 540007FF */ clrlwi. r0, r0, 0x1f
/* 00005248 40820014 */ bne lbl_0000525C
/* 0000524C C03E0020 */ lfs f1, 0x20(r30)
/* 00005250 C01F0310 */ lfs f0, 0x310(r31)
/* 00005254 FC010040 */ fcmpo cr0, f1, f0
/* 00005258 41800028 */ blt lbl_00005280
lbl_0000525C:
/* 0000525C 3C600000 */ lis r3, lbl_802F1FDC@ha
/* 00005260 C83F01B0 */ lfd f1, 0x1b0(r31)
/* 00005264 C0030000 */ lfs f0, lbl_802F1FDC@l(r3)
/* 00005268 FC010000 */ fcmpu cr0, f1, f0
/* 0000526C 40820024 */ bne lbl_00005290
/* 00005270 3C600000 */ lis r3, lbl_10000018@ha
/* 00005274 A8030000 */ lha r0, lbl_10000018@l(r3)
/* 00005278 2C000000 */ cmpwi r0, 0
/* 0000527C 41820014 */ beq lbl_00005290
lbl_00005280:
/* 00005280 801D0014 */ lwz r0, 0x14(r29)
/* 00005284 60000002 */ ori r0, r0, 2
/* 00005288 901D0014 */ stw r0, 0x14(r29)
/* 0000528C 4800003C */ b lbl_000052C8
lbl_00005290:
/* 00005290 387E00B8 */ addi r3, r30, 0xb8
/* 00005294 C0230000 */ lfs f1, 0(r3)
/* 00005298 C0430004 */ lfs f2, 4(r3)
/* 0000529C C0030008 */ lfs f0, 8(r3)
/* 000052A0 EC210072 */ fmuls f1, f1, f1
/* 000052A4 EC2208BA */ fmadds f1, f2, f2, f1
/* 000052A8 EC20083A */ fmadds f1, f0, f0, f1
/* 000052AC 4BFFAEA1 */ bl mathutil_sqrt
/* 000052B0 C01F0314 */ lfs f0, 0x314(r31)
/* 000052B4 FC010040 */ fcmpo cr0, f1, f0
/* 000052B8 40800010 */ bge lbl_000052C8
/* 000052BC 801D0014 */ lwz r0, 0x14(r29)
/* 000052C0 60000001 */ ori r0, r0, 1
/* 000052C4 901D0014 */ stw r0, 0x14(r29)
lbl_000052C8:
/* 000052C8 3C600000 */ lis r3, lbl_802F1FDC@ha
/* 000052CC C81F01B0 */ lfd f0, 0x1b0(r31)
/* 000052D0 C0230000 */ lfs f1, lbl_802F1FDC@l(r3)
/* 000052D4 FC010040 */ fcmpo cr0, f1, f0
/* 000052D8 40810020 */ ble lbl_000052F8
/* 000052DC 387E0030 */ addi r3, r30, 0x30
/* 000052E0 4BFFAE6D */ bl mathutil_mtxA_from_mtx
/* 000052E4 3860C000 */ li r3, -16384
/* 000052E8 4BFFAE65 */ bl mathutil_mtxA_rotate_y
/* 000052EC 387D0060 */ addi r3, r29, 0x60
/* 000052F0 4BFFAE5D */ bl mathutil_mtxA_to_quat
/* 000052F4 48000058 */ b lbl_0000534C
lbl_000052F8:
/* 000052F8 801D0014 */ lwz r0, 0x14(r29)
/* 000052FC 387D0000 */ addi r3, r29, 0
/* 00005300 540007BE */ clrlwi r0, r0, 0x1e
/* 00005304 7C000034 */ cntlzw r0, r0
/* 00005308 541CD97E */ srwi r28, r0, 5
/* 0000530C 4BFFAE41 */ bl u_ball_something_with_ape_rotation
/* 00005310 2C1C0000 */ cmpwi r28, 0
/* 00005314 41820014 */ beq lbl_00005328
/* 00005318 7FA3EB78 */ mr r3, r29
/* 0000531C 4BFFAE31 */ bl u_ball_something_with_walking_speed
/* 00005320 FFE00890 */ fmr f31, f1
/* 00005324 48000028 */ b lbl_0000534C
lbl_00005328:
/* 00005328 C3FF0030 */ lfs f31, 0x30(r31)
/* 0000532C 387D0060 */ addi r3, r29, 0x60
/* 00005330 4BFFAE1D */ bl mathutil_mtxA_from_quat
/* 00005334 4BFFAE19 */ bl mathutil_mtxA_normalize_basis
/* 00005338 801D0014 */ lwz r0, 0x14(r29)
/* 0000533C 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00005340 4182000C */ beq lbl_0000534C
/* 00005344 7FA3EB78 */ mr r3, r29
/* 00005348 4BFFAE05 */ bl func_80037718
lbl_0000534C:
/* 0000534C 801E0094 */ lwz r0, 0x94(r30)
/* 00005350 540006B5 */ rlwinm. r0, r0, 0, 0x1a, 0x1a
/* 00005354 41820028 */ beq lbl_0000537C
/* 00005358 387E001C */ addi r3, r30, 0x1c
/* 0000535C C0230000 */ lfs f1, 0(r3)
/* 00005360 C0430004 */ lfs f2, 4(r3)
/* 00005364 C0030008 */ lfs f0, 8(r3)
/* 00005368 EC210072 */ fmuls f1, f1, f1
/* 0000536C EC2208BA */ fmadds f1, f2, f2, f1
/* 00005370 EC20083A */ fmadds f1, f0, f0, f1
/* 00005374 4BFFADD9 */ bl mathutil_sqrt
/* 00005378 FFE00890 */ fmr f31, f1
lbl_0000537C:
/* 0000537C 3C600000 */ lis r3, lbl_802F1FF6@ha
/* 00005380 A8030000 */ lha r0, lbl_802F1FF6@l(r3)
/* 00005384 2C00000C */ cmpwi r0, 0xc
/* 00005388 40820010 */ bne lbl_00005398
/* 0000538C 7FA3EB78 */ mr r3, r29
/* 00005390 4BFFADBD */ bl check_ball_teeter
/* 00005394 48000010 */ b lbl_000053A4
lbl_00005398:
/* 00005398 801E0094 */ lwz r0, 0x94(r30)
/* 0000539C 540007FA */ rlwinm r0, r0, 0, 0x1f, 0x1d
/* 000053A0 901E0094 */ stw r0, 0x94(r30)
lbl_000053A4:
/* 000053A4 387D0060 */ addi r3, r29, 0x60
/* 000053A8 4BFFADA5 */ bl mathutil_mtxA_to_quat
/* 000053AC 7FA3EB78 */ mr r3, r29
/* 000053B0 FC20F890 */ fmr f1, f31
/* 000053B4 48000061 */ bl lbl_00005414
/* 000053B8 7FA3EB78 */ mr r3, r29
/* 000053BC 4BFFAD91 */ bl ape_skel_anim_main
/* 000053C0 801D0014 */ lwz r0, 0x14(r29)
/* 000053C4 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 000053C8 4082000C */ bne lbl_000053D4
/* 000053CC 7FA3EB78 */ mr r3, r29
/* 000053D0 4BFFAD7D */ bl func_8003765C
lbl_000053D4:
/* 000053D4 387D0000 */ addi r3, r29, 0
/* 000053D8 389E0104 */ addi r4, r30, 0x104
/* 000053DC 4BFFAD71 */ bl ape_face_dir
/* 000053E0 38000000 */ li r0, 0
/* 000053E4 901E0100 */ stw r0, 0x100(r30)
/* 000053E8 C01F0030 */ lfs f0, 0x30(r31)
/* 000053EC D01E0110 */ stfs f0, 0x110(r30)
lbl_000053F0:
/* 000053F0 8001004C */ lwz r0, 0x4c(r1)
/* 000053F4 CBE10040 */ lfd f31, 0x40(r1)
/* 000053F8 83E1003C */ lwz r31, 0x3c(r1)
/* 000053FC 7C0803A6 */ mtlr r0
/* 00005400 83C10038 */ lwz r30, 0x38(r1)
/* 00005404 83A10034 */ lwz r29, 0x34(r1)
/* 00005408 83810030 */ lwz r28, 0x30(r1)
/* 0000540C 38210048 */ addi r1, r1, 0x48
/* 00005410 4E800020 */ blr 
