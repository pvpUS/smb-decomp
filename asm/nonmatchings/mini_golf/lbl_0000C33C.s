/* 0000C33C 7C0802A6 */ mflr r0
/* 0000C340 3C800000 */ lis r4, modeCtrl@ha
/* 0000C344 90010004 */ stw r0, 4(r1)
/* 0000C348 3CA00000 */ lis r5, controllerInfo@ha
/* 0000C34C 3CE00000 */ lis r7, lbl_00026378@ha
/* 0000C350 9421FF60 */ stwu r1, -0xa0(r1)
/* 0000C354 3CC00000 */ lis r6, lbl_10000130@ha
/* 0000C358 DBE10098 */ stfd f31, 0x98(r1)
/* 0000C35C BF21007C */ stmw r25, 0x7c(r1)
/* 0000C360 7C7D1B78 */ mr r29, r3
/* 0000C364 3B640000 */ addi r27, r4, modeCtrl@l
/* 0000C368 3B850000 */ addi r28, r5, controllerInfo@l
/* 0000C36C 3BC70000 */ addi r30, r7, lbl_00026378@l
/* 0000C370 3BE60000 */ addi r31, r6, lbl_10000130@l
/* 0000C374 C0030000 */ lfs f0, 0(r3)
/* 0000C378 3C600000 */ lis r3, playerControllerIDs@ha
/* 0000C37C 3B430000 */ addi r26, r3, playerControllerIDs@l
/* 0000C380 D0010044 */ stfs f0, 0x44(r1)
/* 0000C384 C01D0004 */ lfs f0, 4(r29)
/* 0000C388 D0010048 */ stfs f0, 0x48(r1)
/* 0000C38C C01D0008 */ lfs f0, 8(r29)
/* 0000C390 D001004C */ stfs f0, 0x4c(r1)
/* 0000C394 801B002C */ lwz r0, 0x2c(r27)
/* 0000C398 5400103A */ slwi r0, r0, 2
/* 0000C39C 7C7A0214 */ add r3, r26, r0
/* 0000C3A0 80030000 */ lwz r0, 0(r3)
/* 0000C3A4 1C00003C */ mulli r0, r0, 0x3c
/* 0000C3A8 7C9C0214 */ add r4, r28, r0
/* 0000C3AC A0640018 */ lhz r3, 0x18(r4)
/* 0000C3B0 546005AD */ rlwinm. r0, r3, 0, 0x16, 0x16
/* 0000C3B4 41820064 */ beq lbl_0000C418
/* 0000C3B8 807F002C */ lwz r3, 0x2c(r31)
/* 0000C3BC 4BFF3E15 */ bl mathutil_sin
/* 0000C3C0 FC000850 */ fneg f0, f1
/* 0000C3C4 D0010010 */ stfs f0, 0x10(r1)
/* 0000C3C8 C01E0018 */ lfs f0, 0x18(r30)
/* 0000C3CC D0010014 */ stfs f0, 0x14(r1)
/* 0000C3D0 807F002C */ lwz r3, 0x2c(r31)
/* 0000C3D4 38634000 */ addi r3, r3, 0x4000
/* 0000C3D8 4BFF3DF9 */ bl mathutil_sin
/* 0000C3DC FC000850 */ fneg f0, f1
/* 0000C3E0 3C600000 */ lis r3, ballInfo@ha
/* 0000C3E4 38630000 */ addi r3, r3, ballInfo@l
/* 0000C3E8 38810010 */ addi r4, r1, 0x10
/* 0000C3EC D0010018 */ stfs f0, 0x18(r1)
/* 0000C3F0 801B002C */ lwz r0, 0x2c(r27)
/* 0000C3F4 1C0001A4 */ mulli r0, r0, 0x1a4
/* 0000C3F8 7C630214 */ add r3, r3, r0
/* 0000C3FC 806300FC */ lwz r3, 0xfc(r3)
/* 0000C400 4BFF3DD1 */ bl mot_ape_set_quat_from_vec
/* 0000C404 3860010D */ li r3, 0x10d
/* 0000C408 4BFF3DC9 */ bl u_play_sound_0
/* 0000C40C 38000002 */ li r0, 2
/* 0000C410 981D001F */ stb r0, 0x1f(r29)
/* 0000C414 48001220 */ b lbl_0000D634
lbl_0000C418:
/* 0000C418 546005EF */ rlwinm. r0, r3, 0, 0x17, 0x17
/* 0000C41C 41820018 */ beq lbl_0000C434
/* 0000C420 38600010 */ li r3, 0x10
/* 0000C424 4BFF3DAD */ bl u_play_sound_0
/* 0000C428 38000002 */ li r0, 2
/* 0000C42C 981D001F */ stb r0, 0x1f(r29)
/* 0000C430 48001204 */ b lbl_0000D634
lbl_0000C434:
/* 0000C434 801F0024 */ lwz r0, 0x24(r31)
/* 0000C438 3C600000 */ lis r3, lbl_00026380@ha
/* 0000C43C 3F204330 */ lis r25, 0x4330
/* 0000C440 C8430000 */ lfd f2, lbl_00026380@l(r3)
/* 0000C444 90010074 */ stw r0, 0x74(r1)
/* 0000C448 C81E0060 */ lfd f0, 0x60(r30)
/* 0000C44C 93210070 */ stw r25, 0x70(r1)
/* 0000C450 C8210070 */ lfd f1, 0x70(r1)
/* 0000C454 FC211028 */ fsub f1, f1, f2
/* 0000C458 FC010040 */ fcmpo cr0, f1, f0
/* 0000C45C 40810CE8 */ ble lbl_0000D144
/* 0000C460 88040002 */ lbz r0, 2(r4)
/* 0000C464 7C000775 */ extsb. r0, r0
/* 0000C468 418200D4 */ beq lbl_0000C53C
/* 0000C46C 4BFF3D65 */ bl mathutil_mtxA_from_identity
/* 0000C470 C03D000C */ lfs f1, 0xc(r29)
/* 0000C474 C05D0010 */ lfs f2, 0x10(r29)
/* 0000C478 C07D0014 */ lfs f3, 0x14(r29)
/* 0000C47C 4BFF3D55 */ bl mathutil_mtxA_translate_xyz
/* 0000C480 801B002C */ lwz r0, 0x2c(r27)
/* 0000C484 3C600000 */ lis r3, lbl_000263B0@ha
/* 0000C488 C8430000 */ lfd f2, lbl_000263B0@l(r3)
/* 0000C48C 5400103A */ slwi r0, r0, 2
/* 0000C490 C81E0068 */ lfd f0, 0x68(r30)
/* 0000C494 7C9A0214 */ add r4, r26, r0
/* 0000C498 80040000 */ lwz r0, 0(r4)
/* 0000C49C 1C00003C */ mulli r0, r0, 0x3c
/* 0000C4A0 7C7C0214 */ add r3, r28, r0
/* 0000C4A4 88030002 */ lbz r0, 2(r3)
/* 0000C4A8 7C000774 */ extsb r0, r0
/* 0000C4AC 5400402E */ slwi r0, r0, 8
/* 0000C4B0 6C008000 */ xoris r0, r0, 0x8000
/* 0000C4B4 90010074 */ stw r0, 0x74(r1)
/* 0000C4B8 93210070 */ stw r25, 0x70(r1)
/* 0000C4BC C8210070 */ lfd f1, 0x70(r1)
/* 0000C4C0 FC211028 */ fsub f1, f1, f2
/* 0000C4C4 FC010024 */ fdiv f0, f1, f0
/* 0000C4C8 FC00001E */ fctiwz f0, f0
/* 0000C4CC D8010068 */ stfd f0, 0x68(r1)
/* 0000C4D0 8061006C */ lwz r3, 0x6c(r1)
/* 0000C4D4 4BFF3CFD */ bl mathutil_mtxA_rotate_y
/* 0000C4D8 C03D000C */ lfs f1, 0xc(r29)
/* 0000C4DC C05D0010 */ lfs f2, 0x10(r29)
/* 0000C4E0 C01D0014 */ lfs f0, 0x14(r29)
/* 0000C4E4 FC200850 */ fneg f1, f1
/* 0000C4E8 FC401050 */ fneg f2, f2
/* 0000C4EC FC600050 */ fneg f3, f0
/* 0000C4F0 4BFF3CE1 */ bl mathutil_mtxA_translate_xyz
/* 0000C4F4 387D0000 */ addi r3, r29, 0
/* 0000C4F8 389D0000 */ addi r4, r29, 0
/* 0000C4FC 4BFF3CD5 */ bl mathutil_mtxA_tf_point
/* 0000C500 C07D0014 */ lfs f3, 0x14(r29)
/* 0000C504 C05D0008 */ lfs f2, 8(r29)
/* 0000C508 C03D000C */ lfs f1, 0xc(r29)
/* 0000C50C C01D0000 */ lfs f0, 0(r29)
/* 0000C510 EC431028 */ fsubs f2, f3, f2
/* 0000C514 EC210028 */ fsubs f1, f1, f0
/* 0000C518 EC210072 */ fmuls f1, f1, f1
/* 0000C51C EC2208BA */ fmadds f1, f2, f2, f1
/* 0000C520 4BFF3CB1 */ bl mathutil_sqrt
/* 0000C524 C07D0010 */ lfs f3, 0x10(r29)
/* 0000C528 FC400890 */ fmr f2, f1
/* 0000C52C C01D0004 */ lfs f0, 4(r29)
/* 0000C530 EC230028 */ fsubs f1, f3, f0
/* 0000C534 4BFF3C9D */ bl mathutil_atan2
/* 0000C538 B07D0018 */ sth r3, 0x18(r29)
lbl_0000C53C:
/* 0000C53C 3C600000 */ lis r3, modeCtrl@ha
/* 0000C540 3B630000 */ addi r27, r3, modeCtrl@l
/* 0000C544 801B002C */ lwz r0, 0x2c(r27)
/* 0000C548 3C600000 */ lis r3, playerControllerIDs@ha
/* 0000C54C 3C800000 */ lis r4, controllerInfo@ha
/* 0000C550 5400103A */ slwi r0, r0, 2
/* 0000C554 3B430000 */ addi r26, r3, playerControllerIDs@l
/* 0000C558 7C7A0214 */ add r3, r26, r0
/* 0000C55C 80030000 */ lwz r0, 0(r3)
/* 0000C560 3B840000 */ addi r28, r4, controllerInfo@l
/* 0000C564 1C00003C */ mulli r0, r0, 0x3c
/* 0000C568 7C7C0214 */ add r3, r28, r0
/* 0000C56C 88030003 */ lbz r0, 3(r3)
/* 0000C570 7C000775 */ extsb. r0, r0
/* 0000C574 41820248 */ beq lbl_0000C7BC
/* 0000C578 C03D000C */ lfs f1, 0xc(r29)
/* 0000C57C C01D0000 */ lfs f0, 0(r29)
/* 0000C580 EC010028 */ fsubs f0, f1, f0
/* 0000C584 D0010050 */ stfs f0, 0x50(r1)
/* 0000C588 C01E0018 */ lfs f0, 0x18(r30)
/* 0000C58C D0010054 */ stfs f0, 0x54(r1)
/* 0000C590 C03D0014 */ lfs f1, 0x14(r29)
/* 0000C594 C01D0008 */ lfs f0, 8(r29)
/* 0000C598 EC010028 */ fsubs f0, f1, f0
/* 0000C59C D0010058 */ stfs f0, 0x58(r1)
/* 0000C5A0 80010050 */ lwz r0, 0x50(r1)
/* 0000C5A4 80610054 */ lwz r3, 0x54(r1)
/* 0000C5A8 9001005C */ stw r0, 0x5c(r1)
/* 0000C5AC 80010058 */ lwz r0, 0x58(r1)
/* 0000C5B0 90610060 */ stw r3, 0x60(r1)
/* 0000C5B4 90010064 */ stw r0, 0x64(r1)
/* 0000C5B8 C021005C */ lfs f1, 0x5c(r1)
/* 0000C5BC C0410060 */ lfs f2, 0x60(r1)
/* 0000C5C0 C0010064 */ lfs f0, 0x64(r1)
/* 0000C5C4 EC210072 */ fmuls f1, f1, f1
/* 0000C5C8 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000C5CC EC20083A */ fmadds f1, f0, f0, f1
/* 0000C5D0 4BFF3C01 */ bl mathutil_sqrt
/* 0000C5D4 801B002C */ lwz r0, 0x2c(r27)
/* 0000C5D8 3C600000 */ lis r3, lbl_000263B0@ha
/* 0000C5DC C001005C */ lfs f0, 0x5c(r1)
/* 0000C5E0 3F204330 */ lis r25, 0x4330
/* 0000C5E4 5400103A */ slwi r0, r0, 2
/* 0000C5E8 EC000824 */ fdivs f0, f0, f1
/* 0000C5EC 7C9A0214 */ add r4, r26, r0
/* 0000C5F0 80040000 */ lwz r0, 0(r4)
/* 0000C5F4 C83E0070 */ lfd f1, 0x70(r30)
/* 0000C5F8 1C00003C */ mulli r0, r0, 0x3c
/* 0000C5FC FC410032 */ fmul f2, f1, f0
/* 0000C600 7C9C0214 */ add r4, r28, r0
/* 0000C604 88040003 */ lbz r0, 3(r4)
/* 0000C608 C8830000 */ lfd f4, lbl_000263B0@l(r3)
/* 0000C60C 7C000774 */ extsb r0, r0
/* 0000C610 7C0000D0 */ neg r0, r0
/* 0000C614 C83E0068 */ lfd f1, 0x68(r30)
/* 0000C618 6C008000 */ xoris r0, r0, 0x8000
/* 0000C61C C81E0078 */ lfd f0, 0x78(r30)
/* 0000C620 9001006C */ stw r0, 0x6c(r1)
/* 0000C624 93210068 */ stw r25, 0x68(r1)
/* 0000C628 C8610068 */ lfd f3, 0x68(r1)
/* 0000C62C FC632028 */ fsub f3, f3, f4
/* 0000C630 FC4300B2 */ fmul f2, f3, f2
/* 0000C634 FC220824 */ fdiv f1, f2, f1
/* 0000C638 FC010032 */ fmul f0, f1, f0
/* 0000C63C FC000018 */ frsp f0, f0
/* 0000C640 D0010050 */ stfs f0, 0x50(r1)
/* 0000C644 C021005C */ lfs f1, 0x5c(r1)
/* 0000C648 C0410060 */ lfs f2, 0x60(r1)
/* 0000C64C C0010064 */ lfs f0, 0x64(r1)
/* 0000C650 EC210072 */ fmuls f1, f1, f1
/* 0000C654 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000C658 EC20083A */ fmadds f1, f0, f0, f1
/* 0000C65C 4BFF3B75 */ bl mathutil_sqrt
/* 0000C660 801B002C */ lwz r0, 0x2c(r27)
/* 0000C664 3C600000 */ lis r3, lbl_000263B0@ha
/* 0000C668 C0010064 */ lfs f0, 0x64(r1)
/* 0000C66C 5400103A */ slwi r0, r0, 2
/* 0000C670 C8830000 */ lfd f4, lbl_000263B0@l(r3)
/* 0000C674 EC000824 */ fdivs f0, f0, f1
/* 0000C678 7C9A0214 */ add r4, r26, r0
/* 0000C67C 80040000 */ lwz r0, 0(r4)
/* 0000C680 C83E0070 */ lfd f1, 0x70(r30)
/* 0000C684 1C00003C */ mulli r0, r0, 0x3c
/* 0000C688 FC410032 */ fmul f2, f1, f0
/* 0000C68C 7C7C0214 */ add r3, r28, r0
/* 0000C690 88030003 */ lbz r0, 3(r3)
/* 0000C694 C83E0068 */ lfd f1, 0x68(r30)
/* 0000C698 7C000774 */ extsb r0, r0
/* 0000C69C 7C0000D0 */ neg r0, r0
/* 0000C6A0 C81E0078 */ lfd f0, 0x78(r30)
/* 0000C6A4 6C008000 */ xoris r0, r0, 0x8000
/* 0000C6A8 90010074 */ stw r0, 0x74(r1)
/* 0000C6AC 93210070 */ stw r25, 0x70(r1)
/* 0000C6B0 C8610070 */ lfd f3, 0x70(r1)
/* 0000C6B4 FC632028 */ fsub f3, f3, f4
/* 0000C6B8 FC4300B2 */ fmul f2, f3, f2
/* 0000C6BC FC220824 */ fdiv f1, f2, f1
/* 0000C6C0 FC010032 */ fmul f0, f1, f0
/* 0000C6C4 FC000018 */ frsp f0, f0
/* 0000C6C8 D0010058 */ stfs f0, 0x58(r1)
/* 0000C6CC C03D0000 */ lfs f1, 0(r29)
/* 0000C6D0 C0010050 */ lfs f0, 0x50(r1)
/* 0000C6D4 EC010028 */ fsubs f0, f1, f0
/* 0000C6D8 D01D0000 */ stfs f0, 0(r29)
/* 0000C6DC C03D0008 */ lfs f1, 8(r29)
/* 0000C6E0 C0010058 */ lfs f0, 0x58(r1)
/* 0000C6E4 EC010028 */ fsubs f0, f1, f0
/* 0000C6E8 D01D0008 */ stfs f0, 8(r29)
/* 0000C6EC C03D000C */ lfs f1, 0xc(r29)
/* 0000C6F0 C01D0000 */ lfs f0, 0(r29)
/* 0000C6F4 FC200850 */ fneg f1, f1
/* 0000C6F8 EC01002A */ fadds f0, f1, f0
/* 0000C6FC D001005C */ stfs f0, 0x5c(r1)
/* 0000C700 C01E0018 */ lfs f0, 0x18(r30)
/* 0000C704 D0010060 */ stfs f0, 0x60(r1)
/* 0000C708 C03D0014 */ lfs f1, 0x14(r29)
/* 0000C70C C01D0008 */ lfs f0, 8(r29)
/* 0000C710 FC200850 */ fneg f1, f1
/* 0000C714 EC01002A */ fadds f0, f1, f0
/* 0000C718 D0010064 */ stfs f0, 0x64(r1)
/* 0000C71C C021005C */ lfs f1, 0x5c(r1)
/* 0000C720 C0410060 */ lfs f2, 0x60(r1)
/* 0000C724 C0010064 */ lfs f0, 0x64(r1)
/* 0000C728 EC210072 */ fmuls f1, f1, f1
/* 0000C72C EC2208BA */ fmadds f1, f2, f2, f1
/* 0000C730 EC20083A */ fmadds f1, f0, f0, f1
/* 0000C734 4BFF3A9D */ bl mathutil_sqrt
/* 0000C738 C81E0080 */ lfd f0, 0x80(r30)
/* 0000C73C FC010040 */ fcmpo cr0, f1, f0
/* 0000C740 4080007C */ bge lbl_0000C7BC
/* 0000C744 C021005C */ lfs f1, 0x5c(r1)
/* 0000C748 C0410060 */ lfs f2, 0x60(r1)
/* 0000C74C C0010064 */ lfs f0, 0x64(r1)
/* 0000C750 EC210072 */ fmuls f1, f1, f1
/* 0000C754 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000C758 EC20083A */ fmadds f1, f0, f0, f1
/* 0000C75C 4BFF3A75 */ bl mathutil_sqrt
/* 0000C760 C85E0080 */ lfd f2, 0x80(r30)
/* 0000C764 C001005C */ lfs f0, 0x5c(r1)
/* 0000C768 C07D000C */ lfs f3, 0xc(r29)
/* 0000C76C FC020032 */ fmul f0, f2, f0
/* 0000C770 FC000824 */ fdiv f0, f0, f1
/* 0000C774 FC03002A */ fadd f0, f3, f0
/* 0000C778 FC000018 */ frsp f0, f0
/* 0000C77C D01D0000 */ stfs f0, 0(r29)
/* 0000C780 C021005C */ lfs f1, 0x5c(r1)
/* 0000C784 C0410060 */ lfs f2, 0x60(r1)
/* 0000C788 C0010064 */ lfs f0, 0x64(r1)
/* 0000C78C EC210072 */ fmuls f1, f1, f1
/* 0000C790 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000C794 EC20083A */ fmadds f1, f0, f0, f1
/* 0000C798 4BFF3A39 */ bl mathutil_sqrt
/* 0000C79C C85E0080 */ lfd f2, 0x80(r30)
/* 0000C7A0 C0010064 */ lfs f0, 0x64(r1)
/* 0000C7A4 C07D0014 */ lfs f3, 0x14(r29)
/* 0000C7A8 FC020032 */ fmul f0, f2, f0
/* 0000C7AC FC000824 */ fdiv f0, f0, f1
/* 0000C7B0 FC03002A */ fadd f0, f3, f0
/* 0000C7B4 FC000018 */ frsp f0, f0
/* 0000C7B8 D01D0008 */ stfs f0, 8(r29)
lbl_0000C7BC:
/* 0000C7BC 3C600000 */ lis r3, modeCtrl@ha
/* 0000C7C0 38630000 */ addi r3, r3, modeCtrl@l
/* 0000C7C4 8003002C */ lwz r0, 0x2c(r3)
/* 0000C7C8 3C600000 */ lis r3, playerControllerIDs@ha
/* 0000C7CC 3CA00000 */ lis r5, controllerInfo@ha
/* 0000C7D0 5404103A */ slwi r4, r0, 2
/* 0000C7D4 38030000 */ addi r0, r3, playerControllerIDs@l
/* 0000C7D8 7C602214 */ add r3, r0, r4
/* 0000C7DC 80030000 */ lwz r0, 0(r3)
/* 0000C7E0 38650000 */ addi r3, r5, controllerInfo@l
/* 0000C7E4 1C00003C */ mulli r0, r0, 0x3c
/* 0000C7E8 7C630214 */ add r3, r3, r0
/* 0000C7EC 88030002 */ lbz r0, 2(r3)
/* 0000C7F0 7C000775 */ extsb. r0, r0
/* 0000C7F4 40820010 */ bne lbl_0000C804
/* 0000C7F8 88030003 */ lbz r0, 3(r3)
/* 0000C7FC 7C000775 */ extsb. r0, r0
/* 0000C800 4182006C */ beq lbl_0000C86C
lbl_0000C804:
/* 0000C804 C07D000C */ lfs f3, 0xc(r29)
/* 0000C808 C03D0000 */ lfs f1, 0(r29)
/* 0000C80C C05D0014 */ lfs f2, 0x14(r29)
/* 0000C810 C01D0008 */ lfs f0, 8(r29)
/* 0000C814 EC230828 */ fsubs f1, f3, f1
/* 0000C818 EC420028 */ fsubs f2, f2, f0
/* 0000C81C 4BFF39B5 */ bl mathutil_atan2
/* 0000C820 38038000 */ addi r0, r3, -32768
/* 0000C824 B01D001A */ sth r0, 0x1a(r29)
/* 0000C828 C07D0014 */ lfs f3, 0x14(r29)
/* 0000C82C C05D0008 */ lfs f2, 8(r29)
/* 0000C830 C03D000C */ lfs f1, 0xc(r29)
/* 0000C834 C01D0000 */ lfs f0, 0(r29)
/* 0000C838 EC431028 */ fsubs f2, f3, f2
/* 0000C83C EC210028 */ fsubs f1, f1, f0
/* 0000C840 EC210072 */ fmuls f1, f1, f1
/* 0000C844 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000C848 4BFF3989 */ bl mathutil_sqrt
/* 0000C84C C07D0010 */ lfs f3, 0x10(r29)
/* 0000C850 FC400890 */ fmr f2, f1
/* 0000C854 C01D0004 */ lfs f0, 4(r29)
/* 0000C858 EC230028 */ fsubs f1, f3, f0
/* 0000C85C 4BFF3975 */ bl mathutil_atan2
/* 0000C860 B07D0018 */ sth r3, 0x18(r29)
/* 0000C864 38000000 */ li r0, 0
/* 0000C868 B01D001C */ sth r0, 0x1c(r29)
lbl_0000C86C:
/* 0000C86C 3C600000 */ lis r3, modeCtrl@ha
/* 0000C870 3B630000 */ addi r27, r3, modeCtrl@l
/* 0000C874 801B002C */ lwz r0, 0x2c(r27)
/* 0000C878 3C600000 */ lis r3, playerControllerIDs@ha
/* 0000C87C 3C800000 */ lis r4, controllerInfo@ha
/* 0000C880 5400103A */ slwi r0, r0, 2
/* 0000C884 3B430000 */ addi r26, r3, playerControllerIDs@l
/* 0000C888 7C7A0214 */ add r3, r26, r0
/* 0000C88C 80030000 */ lwz r0, 0(r3)
/* 0000C890 3B840000 */ addi r28, r4, controllerInfo@l
/* 0000C894 1C00003C */ mulli r0, r0, 0x3c
/* 0000C898 7C7C0214 */ add r3, r28, r0
/* 0000C89C 88030004 */ lbz r0, 4(r3)
/* 0000C8A0 7C000775 */ extsb. r0, r0
/* 0000C8A4 41820298 */ beq lbl_0000CB3C
/* 0000C8A8 C03D000C */ lfs f1, 0xc(r29)
/* 0000C8AC C01D0000 */ lfs f0, 0(r29)
/* 0000C8B0 EC010028 */ fsubs f0, f1, f0
/* 0000C8B4 D001005C */ stfs f0, 0x5c(r1)
/* 0000C8B8 C03D0014 */ lfs f1, 0x14(r29)
/* 0000C8BC C01D0008 */ lfs f0, 8(r29)
/* 0000C8C0 EC010028 */ fsubs f0, f1, f0
/* 0000C8C4 D0010064 */ stfs f0, 0x64(r1)
/* 0000C8C8 C0210064 */ lfs f1, 0x64(r1)
/* 0000C8CC C001005C */ lfs f0, 0x5c(r1)
/* 0000C8D0 FC200850 */ fneg f1, f1
/* 0000C8D4 D0210050 */ stfs f1, 0x50(r1)
/* 0000C8D8 C03E0018 */ lfs f1, 0x18(r30)
/* 0000C8DC D0210054 */ stfs f1, 0x54(r1)
/* 0000C8E0 D0010058 */ stfs f0, 0x58(r1)
/* 0000C8E4 80010050 */ lwz r0, 0x50(r1)
/* 0000C8E8 80610054 */ lwz r3, 0x54(r1)
/* 0000C8EC 9001005C */ stw r0, 0x5c(r1)
/* 0000C8F0 80010058 */ lwz r0, 0x58(r1)
/* 0000C8F4 90610060 */ stw r3, 0x60(r1)
/* 0000C8F8 90010064 */ stw r0, 0x64(r1)
/* 0000C8FC C021005C */ lfs f1, 0x5c(r1)
/* 0000C900 C0410060 */ lfs f2, 0x60(r1)
/* 0000C904 C0010064 */ lfs f0, 0x64(r1)
/* 0000C908 EC210072 */ fmuls f1, f1, f1
/* 0000C90C EC2208BA */ fmadds f1, f2, f2, f1
/* 0000C910 EC20083A */ fmadds f1, f0, f0, f1
/* 0000C914 4BFF38BD */ bl mathutil_sqrt
/* 0000C918 801B002C */ lwz r0, 0x2c(r27)
/* 0000C91C 3C600000 */ lis r3, lbl_000263B0@ha
/* 0000C920 C001005C */ lfs f0, 0x5c(r1)
/* 0000C924 3F204330 */ lis r25, 0x4330
/* 0000C928 5400103A */ slwi r0, r0, 2
/* 0000C92C EC000824 */ fdivs f0, f0, f1
/* 0000C930 7C9A0214 */ add r4, r26, r0
/* 0000C934 80040000 */ lwz r0, 0(r4)
/* 0000C938 C83E0070 */ lfd f1, 0x70(r30)
/* 0000C93C 1C00003C */ mulli r0, r0, 0x3c
/* 0000C940 FC410032 */ fmul f2, f1, f0
/* 0000C944 7C9C0214 */ add r4, r28, r0
/* 0000C948 88040004 */ lbz r0, 4(r4)
/* 0000C94C C8830000 */ lfd f4, lbl_000263B0@l(r3)
/* 0000C950 7C000774 */ extsb r0, r0
/* 0000C954 7C0000D0 */ neg r0, r0
/* 0000C958 C83E0068 */ lfd f1, 0x68(r30)
/* 0000C95C 6C008000 */ xoris r0, r0, 0x8000
/* 0000C960 C81E0078 */ lfd f0, 0x78(r30)
/* 0000C964 9001006C */ stw r0, 0x6c(r1)
/* 0000C968 93210068 */ stw r25, 0x68(r1)
/* 0000C96C C8610068 */ lfd f3, 0x68(r1)
/* 0000C970 FC632028 */ fsub f3, f3, f4
/* 0000C974 FC4300B2 */ fmul f2, f3, f2
/* 0000C978 FC220824 */ fdiv f1, f2, f1
/* 0000C97C FC010032 */ fmul f0, f1, f0
/* 0000C980 FC000018 */ frsp f0, f0
/* 0000C984 D0010050 */ stfs f0, 0x50(r1)
/* 0000C988 C021005C */ lfs f1, 0x5c(r1)
/* 0000C98C C0410060 */ lfs f2, 0x60(r1)
/* 0000C990 C0010064 */ lfs f0, 0x64(r1)
/* 0000C994 EC210072 */ fmuls f1, f1, f1
/* 0000C998 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000C99C EC20083A */ fmadds f1, f0, f0, f1
/* 0000C9A0 4BFF3831 */ bl mathutil_sqrt
/* 0000C9A4 801B002C */ lwz r0, 0x2c(r27)
/* 0000C9A8 3CA00000 */ lis r5, lbl_000263B0@ha
/* 0000C9AC C0010064 */ lfs f0, 0x64(r1)
/* 0000C9B0 3881001C */ addi r4, r1, 0x1c
/* 0000C9B4 5400103A */ slwi r0, r0, 2
/* 0000C9B8 EC000824 */ fdivs f0, f0, f1
/* 0000C9BC 7C7A0214 */ add r3, r26, r0
/* 0000C9C0 80030000 */ lwz r0, 0(r3)
/* 0000C9C4 387D000C */ addi r3, r29, 0xc
/* 0000C9C8 C83E0070 */ lfd f1, 0x70(r30)
/* 0000C9CC FC410032 */ fmul f2, f1, f0
/* 0000C9D0 1C00003C */ mulli r0, r0, 0x3c
/* 0000C9D4 C8850000 */ lfd f4, lbl_000263B0@l(r5)
/* 0000C9D8 C83E0068 */ lfd f1, 0x68(r30)
/* 0000C9DC 7CBC0214 */ add r5, r28, r0
/* 0000C9E0 88050004 */ lbz r0, 4(r5)
/* 0000C9E4 38A00000 */ li r5, 0
/* 0000C9E8 C81E0078 */ lfd f0, 0x78(r30)
/* 0000C9EC 7C000774 */ extsb r0, r0
/* 0000C9F0 7C0000D0 */ neg r0, r0
/* 0000C9F4 6C008000 */ xoris r0, r0, 0x8000
/* 0000C9F8 90010074 */ stw r0, 0x74(r1)
/* 0000C9FC 93210070 */ stw r25, 0x70(r1)
/* 0000CA00 C8610070 */ lfd f3, 0x70(r1)
/* 0000CA04 FC632028 */ fsub f3, f3, f4
/* 0000CA08 FC4300B2 */ fmul f2, f3, f2
/* 0000CA0C FC220824 */ fdiv f1, f2, f1
/* 0000CA10 FC010032 */ fmul f0, f1, f0
/* 0000CA14 FC000018 */ frsp f0, f0
/* 0000CA18 D0010058 */ stfs f0, 0x58(r1)
/* 0000CA1C C05D0000 */ lfs f2, 0(r29)
/* 0000CA20 C03D000C */ lfs f1, 0xc(r29)
/* 0000CA24 C0010050 */ lfs f0, 0x50(r1)
/* 0000CA28 EC220828 */ fsubs f1, f2, f1
/* 0000CA2C D021005C */ stfs f1, 0x5c(r1)
/* 0000CA30 C05D0004 */ lfs f2, 4(r29)
/* 0000CA34 C03D0010 */ lfs f1, 0x10(r29)
/* 0000CA38 EC220828 */ fsubs f1, f2, f1
/* 0000CA3C D0210060 */ stfs f1, 0x60(r1)
/* 0000CA40 C05D0008 */ lfs f2, 8(r29)
/* 0000CA44 C03D0014 */ lfs f1, 0x14(r29)
/* 0000CA48 EC220828 */ fsubs f1, f2, f1
/* 0000CA4C D0210064 */ stfs f1, 0x64(r1)
/* 0000CA50 C03D000C */ lfs f1, 0xc(r29)
/* 0000CA54 C3FD0010 */ lfs f31, 0x10(r29)
/* 0000CA58 EC010028 */ fsubs f0, f1, f0
/* 0000CA5C D01D000C */ stfs f0, 0xc(r29)
/* 0000CA60 C03D0014 */ lfs f1, 0x14(r29)
/* 0000CA64 C0010058 */ lfs f0, 0x58(r1)
/* 0000CA68 EC010028 */ fsubs f0, f1, f0
/* 0000CA6C D01D0014 */ stfs f0, 0x14(r29)
/* 0000CA70 C01E0000 */ lfs f0, 0(r30)
/* 0000CA74 D01D0010 */ stfs f0, 0x10(r29)
/* 0000CA78 4BFF3759 */ bl raycast_stage_down
/* 0000CA7C 8001001C */ lwz r0, 0x1c(r1)
/* 0000CA80 28000000 */ cmplwi r0, 0
/* 0000CA84 41820068 */ beq lbl_0000CAEC
/* 0000CA88 C83E0088 */ lfd f1, 0x88(r30)
/* 0000CA8C C0010024 */ lfs f0, 0x24(r1)
/* 0000CA90 FC01002A */ fadd f0, f1, f0
/* 0000CA94 FC000018 */ frsp f0, f0
/* 0000CA98 D01F0028 */ stfs f0, 0x28(r31)
/* 0000CA9C C03F0028 */ lfs f1, 0x28(r31)
/* 0000CAA0 C81E0090 */ lfd f0, 0x90(r30)
/* 0000CAA4 EC21F828 */ fsubs f1, f1, f31
/* 0000CAA8 FC010024 */ fdiv f0, f1, f0
/* 0000CAAC FC1F002A */ fadd f0, f31, f0
/* 0000CAB0 FC000018 */ frsp f0, f0
/* 0000CAB4 D01D0010 */ stfs f0, 0x10(r29)
/* 0000CAB8 C021005C */ lfs f1, 0x5c(r1)
/* 0000CABC C01D000C */ lfs f0, 0xc(r29)
/* 0000CAC0 EC01002A */ fadds f0, f1, f0
/* 0000CAC4 D01D0000 */ stfs f0, 0(r29)
/* 0000CAC8 C0210060 */ lfs f1, 0x60(r1)
/* 0000CACC C01D0010 */ lfs f0, 0x10(r29)
/* 0000CAD0 EC01002A */ fadds f0, f1, f0
/* 0000CAD4 D01D0004 */ stfs f0, 4(r29)
/* 0000CAD8 C0210064 */ lfs f1, 0x64(r1)
/* 0000CADC C01D0014 */ lfs f0, 0x14(r29)
/* 0000CAE0 EC01002A */ fadds f0, f1, f0
/* 0000CAE4 D01D0008 */ stfs f0, 8(r29)
/* 0000CAE8 48000054 */ b lbl_0000CB3C
lbl_0000CAEC:
/* 0000CAEC C03D0000 */ lfs f1, 0(r29)
/* 0000CAF0 C0010050 */ lfs f0, 0x50(r1)
/* 0000CAF4 EC010028 */ fsubs f0, f1, f0
/* 0000CAF8 D01D0000 */ stfs f0, 0(r29)
/* 0000CAFC C03D0008 */ lfs f1, 8(r29)
/* 0000CB00 C0010058 */ lfs f0, 0x58(r1)
/* 0000CB04 EC010028 */ fsubs f0, f1, f0
/* 0000CB08 D01D0008 */ stfs f0, 8(r29)
/* 0000CB0C C03D0000 */ lfs f1, 0(r29)
/* 0000CB10 C001005C */ lfs f0, 0x5c(r1)
/* 0000CB14 EC010028 */ fsubs f0, f1, f0
/* 0000CB18 D01D000C */ stfs f0, 0xc(r29)
/* 0000CB1C C03D0004 */ lfs f1, 4(r29)
/* 0000CB20 C0010060 */ lfs f0, 0x60(r1)
/* 0000CB24 EC010028 */ fsubs f0, f1, f0
/* 0000CB28 D01D0010 */ stfs f0, 0x10(r29)
/* 0000CB2C C03D0008 */ lfs f1, 8(r29)
/* 0000CB30 C0010064 */ lfs f0, 0x64(r1)
/* 0000CB34 EC010028 */ fsubs f0, f1, f0
/* 0000CB38 D01D0014 */ stfs f0, 0x14(r29)
lbl_0000CB3C:
/* 0000CB3C 3C600000 */ lis r3, modeCtrl@ha
/* 0000CB40 3B430000 */ addi r26, r3, modeCtrl@l
/* 0000CB44 801A002C */ lwz r0, 0x2c(r26)
/* 0000CB48 3C600000 */ lis r3, playerControllerIDs@ha
/* 0000CB4C 3C800000 */ lis r4, controllerInfo@ha
/* 0000CB50 5400103A */ slwi r0, r0, 2
/* 0000CB54 3B630000 */ addi r27, r3, playerControllerIDs@l
/* 0000CB58 7C7B0214 */ add r3, r27, r0
/* 0000CB5C 80030000 */ lwz r0, 0(r3)
/* 0000CB60 3B240000 */ addi r25, r4, controllerInfo@l
/* 0000CB64 1C00003C */ mulli r0, r0, 0x3c
/* 0000CB68 7C790214 */ add r3, r25, r0
/* 0000CB6C 88030005 */ lbz r0, 5(r3)
/* 0000CB70 7C000775 */ extsb. r0, r0
/* 0000CB74 41820284 */ beq lbl_0000CDF8
/* 0000CB78 C03D000C */ lfs f1, 0xc(r29)
/* 0000CB7C C01D0000 */ lfs f0, 0(r29)
/* 0000CB80 EC010028 */ fsubs f0, f1, f0
/* 0000CB84 D0010050 */ stfs f0, 0x50(r1)
/* 0000CB88 C01E0018 */ lfs f0, 0x18(r30)
/* 0000CB8C D0010054 */ stfs f0, 0x54(r1)
/* 0000CB90 C03D0014 */ lfs f1, 0x14(r29)
/* 0000CB94 C01D0008 */ lfs f0, 8(r29)
/* 0000CB98 EC010028 */ fsubs f0, f1, f0
/* 0000CB9C D0010058 */ stfs f0, 0x58(r1)
/* 0000CBA0 80010050 */ lwz r0, 0x50(r1)
/* 0000CBA4 80610054 */ lwz r3, 0x54(r1)
/* 0000CBA8 9001005C */ stw r0, 0x5c(r1)
/* 0000CBAC 80010058 */ lwz r0, 0x58(r1)
/* 0000CBB0 90610060 */ stw r3, 0x60(r1)
/* 0000CBB4 90010064 */ stw r0, 0x64(r1)
/* 0000CBB8 C021005C */ lfs f1, 0x5c(r1)
/* 0000CBBC C0410060 */ lfs f2, 0x60(r1)
/* 0000CBC0 C0010064 */ lfs f0, 0x64(r1)
/* 0000CBC4 EC210072 */ fmuls f1, f1, f1
/* 0000CBC8 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000CBCC EC20083A */ fmadds f1, f0, f0, f1
/* 0000CBD0 4BFF3601 */ bl mathutil_sqrt
/* 0000CBD4 801A002C */ lwz r0, 0x2c(r26)
/* 0000CBD8 3C600000 */ lis r3, lbl_000263B0@ha
/* 0000CBDC C001005C */ lfs f0, 0x5c(r1)
/* 0000CBE0 3F804330 */ lis r28, 0x4330
/* 0000CBE4 5400103A */ slwi r0, r0, 2
/* 0000CBE8 EC000824 */ fdivs f0, f0, f1
/* 0000CBEC 7C9B0214 */ add r4, r27, r0
/* 0000CBF0 80040000 */ lwz r0, 0(r4)
/* 0000CBF4 C83E0070 */ lfd f1, 0x70(r30)
/* 0000CBF8 1C00003C */ mulli r0, r0, 0x3c
/* 0000CBFC FC410032 */ fmul f2, f1, f0
/* 0000CC00 7C990214 */ add r4, r25, r0
/* 0000CC04 88040005 */ lbz r0, 5(r4)
/* 0000CC08 C8830000 */ lfd f4, lbl_000263B0@l(r3)
/* 0000CC0C 7C000774 */ extsb r0, r0
/* 0000CC10 7C0000D0 */ neg r0, r0
/* 0000CC14 C83E0068 */ lfd f1, 0x68(r30)
/* 0000CC18 6C008000 */ xoris r0, r0, 0x8000
/* 0000CC1C C81E0078 */ lfd f0, 0x78(r30)
/* 0000CC20 9001006C */ stw r0, 0x6c(r1)
/* 0000CC24 93810068 */ stw r28, 0x68(r1)
/* 0000CC28 C8610068 */ lfd f3, 0x68(r1)
/* 0000CC2C FC632028 */ fsub f3, f3, f4
/* 0000CC30 FC4300B2 */ fmul f2, f3, f2
/* 0000CC34 FC220824 */ fdiv f1, f2, f1
/* 0000CC38 FC010032 */ fmul f0, f1, f0
/* 0000CC3C FC000018 */ frsp f0, f0
/* 0000CC40 D0010050 */ stfs f0, 0x50(r1)
/* 0000CC44 C021005C */ lfs f1, 0x5c(r1)
/* 0000CC48 C0410060 */ lfs f2, 0x60(r1)
/* 0000CC4C C0010064 */ lfs f0, 0x64(r1)
/* 0000CC50 EC210072 */ fmuls f1, f1, f1
/* 0000CC54 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000CC58 EC20083A */ fmadds f1, f0, f0, f1
/* 0000CC5C 4BFF3575 */ bl mathutil_sqrt
/* 0000CC60 801A002C */ lwz r0, 0x2c(r26)
/* 0000CC64 3CA00000 */ lis r5, lbl_000263B0@ha
/* 0000CC68 C0010064 */ lfs f0, 0x64(r1)
/* 0000CC6C 3881001C */ addi r4, r1, 0x1c
/* 0000CC70 5400103A */ slwi r0, r0, 2
/* 0000CC74 EC000824 */ fdivs f0, f0, f1
/* 0000CC78 7C7B0214 */ add r3, r27, r0
/* 0000CC7C 80030000 */ lwz r0, 0(r3)
/* 0000CC80 387D000C */ addi r3, r29, 0xc
/* 0000CC84 C83E0070 */ lfd f1, 0x70(r30)
/* 0000CC88 FC410032 */ fmul f2, f1, f0
/* 0000CC8C 1C00003C */ mulli r0, r0, 0x3c
/* 0000CC90 C8850000 */ lfd f4, lbl_000263B0@l(r5)
/* 0000CC94 C83E0068 */ lfd f1, 0x68(r30)
/* 0000CC98 7CB90214 */ add r5, r25, r0
/* 0000CC9C 88050005 */ lbz r0, 5(r5)
/* 0000CCA0 38A00000 */ li r5, 0
/* 0000CCA4 C81E0078 */ lfd f0, 0x78(r30)
/* 0000CCA8 7C000774 */ extsb r0, r0
/* 0000CCAC 7C0000D0 */ neg r0, r0
/* 0000CCB0 6C008000 */ xoris r0, r0, 0x8000
/* 0000CCB4 90010074 */ stw r0, 0x74(r1)
/* 0000CCB8 93810070 */ stw r28, 0x70(r1)
/* 0000CCBC C8610070 */ lfd f3, 0x70(r1)
/* 0000CCC0 FC632028 */ fsub f3, f3, f4
/* 0000CCC4 FC4300B2 */ fmul f2, f3, f2
/* 0000CCC8 FC220824 */ fdiv f1, f2, f1
/* 0000CCCC FC010032 */ fmul f0, f1, f0
/* 0000CCD0 FC000018 */ frsp f0, f0
/* 0000CCD4 D0010058 */ stfs f0, 0x58(r1)
/* 0000CCD8 C05D0000 */ lfs f2, 0(r29)
/* 0000CCDC C03D000C */ lfs f1, 0xc(r29)
/* 0000CCE0 C0010050 */ lfs f0, 0x50(r1)
/* 0000CCE4 EC220828 */ fsubs f1, f2, f1
/* 0000CCE8 D021005C */ stfs f1, 0x5c(r1)
/* 0000CCEC C05D0004 */ lfs f2, 4(r29)
/* 0000CCF0 C03D0010 */ lfs f1, 0x10(r29)
/* 0000CCF4 EC220828 */ fsubs f1, f2, f1
/* 0000CCF8 D0210060 */ stfs f1, 0x60(r1)
/* 0000CCFC C05D0008 */ lfs f2, 8(r29)
/* 0000CD00 C03D0014 */ lfs f1, 0x14(r29)
/* 0000CD04 EC220828 */ fsubs f1, f2, f1
/* 0000CD08 D0210064 */ stfs f1, 0x64(r1)
/* 0000CD0C C03D000C */ lfs f1, 0xc(r29)
/* 0000CD10 C3FD0010 */ lfs f31, 0x10(r29)
/* 0000CD14 EC010028 */ fsubs f0, f1, f0
/* 0000CD18 D01D000C */ stfs f0, 0xc(r29)
/* 0000CD1C C03D0014 */ lfs f1, 0x14(r29)
/* 0000CD20 C0010058 */ lfs f0, 0x58(r1)
/* 0000CD24 EC010028 */ fsubs f0, f1, f0
/* 0000CD28 D01D0014 */ stfs f0, 0x14(r29)
/* 0000CD2C C01E0000 */ lfs f0, 0(r30)
/* 0000CD30 D01D0010 */ stfs f0, 0x10(r29)
/* 0000CD34 4BFF349D */ bl raycast_stage_down
/* 0000CD38 8001001C */ lwz r0, 0x1c(r1)
/* 0000CD3C 28000000 */ cmplwi r0, 0
/* 0000CD40 41820068 */ beq lbl_0000CDA8
/* 0000CD44 C83E0088 */ lfd f1, 0x88(r30)
/* 0000CD48 C0010024 */ lfs f0, 0x24(r1)
/* 0000CD4C FC01002A */ fadd f0, f1, f0
/* 0000CD50 FC000018 */ frsp f0, f0
/* 0000CD54 D01F0028 */ stfs f0, 0x28(r31)
/* 0000CD58 C03F0028 */ lfs f1, 0x28(r31)
/* 0000CD5C C81E0090 */ lfd f0, 0x90(r30)
/* 0000CD60 EC21F828 */ fsubs f1, f1, f31
/* 0000CD64 FC010024 */ fdiv f0, f1, f0
/* 0000CD68 FC1F002A */ fadd f0, f31, f0
/* 0000CD6C FC000018 */ frsp f0, f0
/* 0000CD70 D01D0010 */ stfs f0, 0x10(r29)
/* 0000CD74 C021005C */ lfs f1, 0x5c(r1)
/* 0000CD78 C01D000C */ lfs f0, 0xc(r29)
/* 0000CD7C EC01002A */ fadds f0, f1, f0
/* 0000CD80 D01D0000 */ stfs f0, 0(r29)
/* 0000CD84 C0210060 */ lfs f1, 0x60(r1)
/* 0000CD88 C01D0010 */ lfs f0, 0x10(r29)
/* 0000CD8C EC01002A */ fadds f0, f1, f0
/* 0000CD90 D01D0004 */ stfs f0, 4(r29)
/* 0000CD94 C0210064 */ lfs f1, 0x64(r1)
/* 0000CD98 C01D0014 */ lfs f0, 0x14(r29)
/* 0000CD9C EC01002A */ fadds f0, f1, f0
/* 0000CDA0 D01D0008 */ stfs f0, 8(r29)
/* 0000CDA4 48000054 */ b lbl_0000CDF8
lbl_0000CDA8:
/* 0000CDA8 C03D0000 */ lfs f1, 0(r29)
/* 0000CDAC C0010050 */ lfs f0, 0x50(r1)
/* 0000CDB0 EC010028 */ fsubs f0, f1, f0
/* 0000CDB4 D01D0000 */ stfs f0, 0(r29)
/* 0000CDB8 C03D0008 */ lfs f1, 8(r29)
/* 0000CDBC C0010058 */ lfs f0, 0x58(r1)
/* 0000CDC0 EC010028 */ fsubs f0, f1, f0
/* 0000CDC4 D01D0008 */ stfs f0, 8(r29)
/* 0000CDC8 C03D0000 */ lfs f1, 0(r29)
/* 0000CDCC C001005C */ lfs f0, 0x5c(r1)
/* 0000CDD0 EC010028 */ fsubs f0, f1, f0
/* 0000CDD4 D01D000C */ stfs f0, 0xc(r29)
/* 0000CDD8 C03D0004 */ lfs f1, 4(r29)
/* 0000CDDC C0010060 */ lfs f0, 0x60(r1)
/* 0000CDE0 EC010028 */ fsubs f0, f1, f0
/* 0000CDE4 D01D0010 */ stfs f0, 0x10(r29)
/* 0000CDE8 C03D0008 */ lfs f1, 8(r29)
/* 0000CDEC C0010064 */ lfs f0, 0x64(r1)
/* 0000CDF0 EC010028 */ fsubs f0, f1, f0
/* 0000CDF4 D01D0014 */ stfs f0, 0x14(r29)
lbl_0000CDF8:
/* 0000CDF8 C03D000C */ lfs f1, 0xc(r29)
/* 0000CDFC 3C600000 */ lis r3, playerControllerIDs@ha
/* 0000CE00 C01D0000 */ lfs f0, 0(r29)
/* 0000CE04 3C800000 */ lis r4, modeCtrl@ha
/* 0000CE08 3CA00000 */ lis r5, controllerInfo@ha
/* 0000CE0C EC010028 */ fsubs f0, f1, f0
/* 0000CE10 38030000 */ addi r0, r3, playerControllerIDs@l
/* 0000CE14 38840000 */ addi r4, r4, modeCtrl@l
/* 0000CE18 38A50000 */ addi r5, r5, controllerInfo@l
/* 0000CE1C D001005C */ stfs f0, 0x5c(r1)
/* 0000CE20 C03D0010 */ lfs f1, 0x10(r29)
/* 0000CE24 C01D0004 */ lfs f0, 4(r29)
/* 0000CE28 EC010028 */ fsubs f0, f1, f0
/* 0000CE2C D0010060 */ stfs f0, 0x60(r1)
/* 0000CE30 C03D0014 */ lfs f1, 0x14(r29)
/* 0000CE34 C01D0008 */ lfs f0, 8(r29)
/* 0000CE38 EC010028 */ fsubs f0, f1, f0
/* 0000CE3C D0010064 */ stfs f0, 0x64(r1)
/* 0000CE40 C05D0010 */ lfs f2, 0x10(r29)
/* 0000CE44 C03F0028 */ lfs f1, 0x28(r31)
/* 0000CE48 C81E0090 */ lfd f0, 0x90(r30)
/* 0000CE4C EC211028 */ fsubs f1, f1, f2
/* 0000CE50 FC010024 */ fdiv f0, f1, f0
/* 0000CE54 FC02002A */ fadd f0, f2, f0
/* 0000CE58 FC000018 */ frsp f0, f0
/* 0000CE5C D01D0010 */ stfs f0, 0x10(r29)
/* 0000CE60 C03D000C */ lfs f1, 0xc(r29)
/* 0000CE64 C001005C */ lfs f0, 0x5c(r1)
/* 0000CE68 EC010028 */ fsubs f0, f1, f0
/* 0000CE6C D01D0000 */ stfs f0, 0(r29)
/* 0000CE70 C03D0010 */ lfs f1, 0x10(r29)
/* 0000CE74 C0010060 */ lfs f0, 0x60(r1)
/* 0000CE78 EC010028 */ fsubs f0, f1, f0
/* 0000CE7C D01D0004 */ stfs f0, 4(r29)
/* 0000CE80 C03D0014 */ lfs f1, 0x14(r29)
/* 0000CE84 C0010064 */ lfs f0, 0x64(r1)
/* 0000CE88 EC010028 */ fsubs f0, f1, f0
/* 0000CE8C D01D0008 */ stfs f0, 8(r29)
/* 0000CE90 807F0030 */ lwz r3, 0x30(r31)
/* 0000CE94 38630001 */ addi r3, r3, 1
/* 0000CE98 907F0030 */ stw r3, 0x30(r31)
/* 0000CE9C 8064002C */ lwz r3, 0x2c(r4)
/* 0000CEA0 5463103A */ slwi r3, r3, 2
/* 0000CEA4 7C601A14 */ add r3, r0, r3
/* 0000CEA8 80030000 */ lwz r0, 0(r3)
/* 0000CEAC 1C00003C */ mulli r0, r0, 0x3c
/* 0000CEB0 7C650214 */ add r3, r5, r0
/* 0000CEB4 A0030018 */ lhz r0, 0x18(r3)
/* 0000CEB8 54000529 */ rlwinm. r0, r0, 0, 0x14, 0x14
/* 0000CEBC 41820014 */ beq lbl_0000CED0
/* 0000CEC0 3860010C */ li r3, 0x10c
/* 0000CEC4 4BFF330D */ bl u_play_sound_0
/* 0000CEC8 38000000 */ li r0, 0
/* 0000CECC 901F0030 */ stw r0, 0x30(r31)
lbl_0000CED0:
/* 0000CED0 3C600000 */ lis r3, modeCtrl@ha
/* 0000CED4 38630000 */ addi r3, r3, modeCtrl@l
/* 0000CED8 8003002C */ lwz r0, 0x2c(r3)
/* 0000CEDC 3C600000 */ lis r3, playerControllerIDs@ha
/* 0000CEE0 3CA00000 */ lis r5, controllerInfo@ha
/* 0000CEE4 5404103A */ slwi r4, r0, 2
/* 0000CEE8 38030000 */ addi r0, r3, playerControllerIDs@l
/* 0000CEEC 7C602214 */ add r3, r0, r4
/* 0000CEF0 80030000 */ lwz r0, 0(r3)
/* 0000CEF4 38650000 */ addi r3, r5, controllerInfo@l
/* 0000CEF8 1C00003C */ mulli r0, r0, 0x3c
/* 0000CEFC 7C630214 */ add r3, r3, r0
/* 0000CF00 A0030018 */ lhz r0, 0x18(r3)
/* 0000CF04 5400056B */ rlwinm. r0, r0, 0, 0x15, 0x15
/* 0000CF08 41820014 */ beq lbl_0000CF1C
/* 0000CF0C 3860010D */ li r3, 0x10d
/* 0000CF10 4BFF32C1 */ bl u_play_sound_0
/* 0000CF14 38000000 */ li r0, 0
/* 0000CF18 901F0030 */ stw r0, 0x30(r31)
lbl_0000CF1C:
/* 0000CF1C 3C600000 */ lis r3, modeCtrl@ha
/* 0000CF20 38630000 */ addi r3, r3, modeCtrl@l
/* 0000CF24 8003002C */ lwz r0, 0x2c(r3)
/* 0000CF28 3C800000 */ lis r4, playerControllerIDs@ha
/* 0000CF2C 3C600000 */ lis r3, controllerInfo@ha
/* 0000CF30 5405103A */ slwi r5, r0, 2
/* 0000CF34 38040000 */ addi r0, r4, playerControllerIDs@l
/* 0000CF38 7C802A14 */ add r4, r0, r5
/* 0000CF3C 80840000 */ lwz r4, 0(r4)
/* 0000CF40 38030000 */ addi r0, r3, controllerInfo@l
/* 0000CF44 1C64003C */ mulli r3, r4, 0x3c
/* 0000CF48 7C601A14 */ add r3, r0, r3
/* 0000CF4C A0030000 */ lhz r0, 0(r3)
/* 0000CF50 54000529 */ rlwinm. r0, r0, 0, 0x14, 0x14
/* 0000CF54 41820098 */ beq lbl_0000CFEC
/* 0000CF58 C03D0004 */ lfs f1, 4(r29)
/* 0000CF5C C81E0030 */ lfd f0, 0x30(r30)
/* 0000CF60 FC01002A */ fadd f0, f1, f0
/* 0000CF64 FC000018 */ frsp f0, f0
/* 0000CF68 D01D0004 */ stfs f0, 4(r29)
/* 0000CF6C C83E0098 */ lfd f1, 0x98(r30)
/* 0000CF70 C01D0010 */ lfs f0, 0x10(r29)
/* 0000CF74 C05D0004 */ lfs f2, 4(r29)
/* 0000CF78 FC01002A */ fadd f0, f1, f0
/* 0000CF7C FC020040 */ fcmpo cr0, f2, f0
/* 0000CF80 4081000C */ ble lbl_0000CF8C
/* 0000CF84 FC000018 */ frsp f0, f0
/* 0000CF88 D01D0004 */ stfs f0, 4(r29)
lbl_0000CF8C:
/* 0000CF8C C07D000C */ lfs f3, 0xc(r29)
/* 0000CF90 C03D0000 */ lfs f1, 0(r29)
/* 0000CF94 C05D0014 */ lfs f2, 0x14(r29)
/* 0000CF98 C01D0008 */ lfs f0, 8(r29)
/* 0000CF9C EC230828 */ fsubs f1, f3, f1
/* 0000CFA0 EC420028 */ fsubs f2, f2, f0
/* 0000CFA4 4BFF322D */ bl mathutil_atan2
/* 0000CFA8 38038000 */ addi r0, r3, -32768
/* 0000CFAC B01D001A */ sth r0, 0x1a(r29)
/* 0000CFB0 C07D0014 */ lfs f3, 0x14(r29)
/* 0000CFB4 C05D0008 */ lfs f2, 8(r29)
/* 0000CFB8 C03D000C */ lfs f1, 0xc(r29)
/* 0000CFBC C01D0000 */ lfs f0, 0(r29)
/* 0000CFC0 EC431028 */ fsubs f2, f3, f2
/* 0000CFC4 EC210028 */ fsubs f1, f1, f0
/* 0000CFC8 EC210072 */ fmuls f1, f1, f1
/* 0000CFCC EC2208BA */ fmadds f1, f2, f2, f1
/* 0000CFD0 4BFF3201 */ bl mathutil_sqrt
/* 0000CFD4 C07D0010 */ lfs f3, 0x10(r29)
/* 0000CFD8 FC400890 */ fmr f2, f1
/* 0000CFDC C01D0004 */ lfs f0, 4(r29)
/* 0000CFE0 EC230028 */ fsubs f1, f3, f0
/* 0000CFE4 4BFF31ED */ bl mathutil_atan2
/* 0000CFE8 B07D0018 */ sth r3, 0x18(r29)
lbl_0000CFEC:
/* 0000CFEC 3C600000 */ lis r3, modeCtrl@ha
/* 0000CFF0 38630000 */ addi r3, r3, modeCtrl@l
/* 0000CFF4 8003002C */ lwz r0, 0x2c(r3)
/* 0000CFF8 3C800000 */ lis r4, playerControllerIDs@ha
/* 0000CFFC 3C600000 */ lis r3, controllerInfo@ha
/* 0000D000 5405103A */ slwi r5, r0, 2
/* 0000D004 38040000 */ addi r0, r4, playerControllerIDs@l
/* 0000D008 7C802A14 */ add r4, r0, r5
/* 0000D00C 80840000 */ lwz r4, 0(r4)
/* 0000D010 38030000 */ addi r0, r3, controllerInfo@l
/* 0000D014 1C64003C */ mulli r3, r4, 0x3c
/* 0000D018 7C601A14 */ add r3, r0, r3
/* 0000D01C A0030000 */ lhz r0, 0(r3)
/* 0000D020 5400056B */ rlwinm. r0, r0, 0, 0x15, 0x15
/* 0000D024 41820098 */ beq lbl_0000D0BC
/* 0000D028 C03D0004 */ lfs f1, 4(r29)
/* 0000D02C C81E0030 */ lfd f0, 0x30(r30)
/* 0000D030 FC010028 */ fsub f0, f1, f0
/* 0000D034 FC000018 */ frsp f0, f0
/* 0000D038 D01D0004 */ stfs f0, 4(r29)
/* 0000D03C C83E0088 */ lfd f1, 0x88(r30)
/* 0000D040 C01D0010 */ lfs f0, 0x10(r29)
/* 0000D044 C05D0004 */ lfs f2, 4(r29)
/* 0000D048 FC01002A */ fadd f0, f1, f0
/* 0000D04C FC020040 */ fcmpo cr0, f2, f0
/* 0000D050 4080000C */ bge lbl_0000D05C
/* 0000D054 FC000018 */ frsp f0, f0
/* 0000D058 D01D0004 */ stfs f0, 4(r29)
lbl_0000D05C:
/* 0000D05C C07D000C */ lfs f3, 0xc(r29)
/* 0000D060 C03D0000 */ lfs f1, 0(r29)
/* 0000D064 C05D0014 */ lfs f2, 0x14(r29)
/* 0000D068 C01D0008 */ lfs f0, 8(r29)
/* 0000D06C EC230828 */ fsubs f1, f3, f1
/* 0000D070 EC420028 */ fsubs f2, f2, f0
/* 0000D074 4BFF315D */ bl mathutil_atan2
/* 0000D078 38038000 */ addi r0, r3, -32768
/* 0000D07C B01D001A */ sth r0, 0x1a(r29)
/* 0000D080 C07D0014 */ lfs f3, 0x14(r29)
/* 0000D084 C05D0008 */ lfs f2, 8(r29)
/* 0000D088 C03D000C */ lfs f1, 0xc(r29)
/* 0000D08C C01D0000 */ lfs f0, 0(r29)
/* 0000D090 EC431028 */ fsubs f2, f3, f2
/* 0000D094 EC210028 */ fsubs f1, f1, f0
/* 0000D098 EC210072 */ fmuls f1, f1, f1
/* 0000D09C EC2208BA */ fmadds f1, f2, f2, f1
/* 0000D0A0 4BFF3131 */ bl mathutil_sqrt
/* 0000D0A4 C07D0010 */ lfs f3, 0x10(r29)
/* 0000D0A8 FC400890 */ fmr f2, f1
/* 0000D0AC C01D0004 */ lfs f0, 4(r29)
/* 0000D0B0 EC230028 */ fsubs f1, f3, f0
/* 0000D0B4 4BFF311D */ bl mathutil_atan2
/* 0000D0B8 B07D0018 */ sth r3, 0x18(r29)
lbl_0000D0BC:
/* 0000D0BC C03D0004 */ lfs f1, 4(r29)
/* 0000D0C0 C85E0088 */ lfd f2, 0x88(r30)
/* 0000D0C4 C01D0010 */ lfs f0, 0x10(r29)
/* 0000D0C8 FC211028 */ fsub f1, f1, f2
/* 0000D0CC FC010040 */ fcmpo cr0, f1, f0
/* 0000D0D0 40800164 */ bge lbl_0000D234
/* 0000D0D4 FC02002A */ fadd f0, f2, f0
/* 0000D0D8 FC000018 */ frsp f0, f0
/* 0000D0DC D01D0004 */ stfs f0, 4(r29)
/* 0000D0E0 C07D000C */ lfs f3, 0xc(r29)
/* 0000D0E4 C03D0000 */ lfs f1, 0(r29)
/* 0000D0E8 C05D0014 */ lfs f2, 0x14(r29)
/* 0000D0EC C01D0008 */ lfs f0, 8(r29)
/* 0000D0F0 EC230828 */ fsubs f1, f3, f1
/* 0000D0F4 EC420028 */ fsubs f2, f2, f0
/* 0000D0F8 4BFF30D9 */ bl mathutil_atan2
/* 0000D0FC 38038000 */ addi r0, r3, -32768
/* 0000D100 B01D001A */ sth r0, 0x1a(r29)
/* 0000D104 C07D0014 */ lfs f3, 0x14(r29)
/* 0000D108 C05D0008 */ lfs f2, 8(r29)
/* 0000D10C C03D000C */ lfs f1, 0xc(r29)
/* 0000D110 C01D0000 */ lfs f0, 0(r29)
/* 0000D114 EC431028 */ fsubs f2, f3, f2
/* 0000D118 EC210028 */ fsubs f1, f1, f0
/* 0000D11C EC210072 */ fmuls f1, f1, f1
/* 0000D120 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000D124 4BFF30AD */ bl mathutil_sqrt
/* 0000D128 C07D0010 */ lfs f3, 0x10(r29)
/* 0000D12C FC400890 */ fmr f2, f1
/* 0000D130 C01D0004 */ lfs f0, 4(r29)
/* 0000D134 EC230028 */ fsubs f1, f3, f0
/* 0000D138 4BFF3099 */ bl mathutil_atan2
/* 0000D13C B07D0018 */ sth r3, 0x18(r29)
/* 0000D140 480000F4 */ b lbl_0000D234
lbl_0000D144:
/* 0000D144 C01D0010 */ lfs f0, 0x10(r29)
/* 0000D148 3C600000 */ lis r3, ballInfo@ha
/* 0000D14C 3B230000 */ addi r25, r3, ballInfo@l
/* 0000D150 D01F0028 */ stfs f0, 0x28(r31)
/* 0000D154 801B002C */ lwz r0, 0x2c(r27)
/* 0000D158 1C0001A4 */ mulli r0, r0, 0x1a4
/* 0000D15C 7C790214 */ add r3, r25, r0
/* 0000D160 A8630092 */ lha r3, 0x92(r3)
/* 0000D164 4BFF306D */ bl mathutil_sin
/* 0000D168 FC000850 */ fneg f0, f1
/* 0000D16C D0010038 */ stfs f0, 0x38(r1)
/* 0000D170 C01E0018 */ lfs f0, 0x18(r30)
/* 0000D174 D001003C */ stfs f0, 0x3c(r1)
/* 0000D178 801B002C */ lwz r0, 0x2c(r27)
/* 0000D17C 1C0001A4 */ mulli r0, r0, 0x1a4
/* 0000D180 7C790214 */ add r3, r25, r0
/* 0000D184 A8630092 */ lha r3, 0x92(r3)
/* 0000D188 38634000 */ addi r3, r3, 0x4000
/* 0000D18C 4BFF3045 */ bl mathutil_sin
/* 0000D190 FC000850 */ fneg f0, f1
/* 0000D194 D0010040 */ stfs f0, 0x40(r1)
/* 0000D198 C0210038 */ lfs f1, 0x38(r1)
/* 0000D19C C041003C */ lfs f2, 0x3c(r1)
/* 0000D1A0 C0010040 */ lfs f0, 0x40(r1)
/* 0000D1A4 EC210072 */ fmuls f1, f1, f1
/* 0000D1A8 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000D1AC EC20083A */ fmadds f1, f0, f0, f1
/* 0000D1B0 4BFF3021 */ bl mathutil_sqrt
/* 0000D1B4 C85E00A0 */ lfd f2, 0xa0(r30)
/* 0000D1B8 C0010038 */ lfs f0, 0x38(r1)
/* 0000D1BC 801B002C */ lwz r0, 0x2c(r27)
/* 0000D1C0 FC020032 */ fmul f0, f2, f0
/* 0000D1C4 1C0001A4 */ mulli r0, r0, 0x1a4
/* 0000D1C8 FC000824 */ fdiv f0, f0, f1
/* 0000D1CC 7C790214 */ add r3, r25, r0
/* 0000D1D0 C0230004 */ lfs f1, 4(r3)
/* 0000D1D4 FC01002A */ fadd f0, f1, f0
/* 0000D1D8 FC000018 */ frsp f0, f0
/* 0000D1DC D01D000C */ stfs f0, 0xc(r29)
/* 0000D1E0 C0210038 */ lfs f1, 0x38(r1)
/* 0000D1E4 C041003C */ lfs f2, 0x3c(r1)
/* 0000D1E8 C0010040 */ lfs f0, 0x40(r1)
/* 0000D1EC EC210072 */ fmuls f1, f1, f1
/* 0000D1F0 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000D1F4 EC20083A */ fmadds f1, f0, f0, f1
/* 0000D1F8 4BFF2FD9 */ bl mathutil_sqrt
/* 0000D1FC C85E00A0 */ lfd f2, 0xa0(r30)
/* 0000D200 C0010040 */ lfs f0, 0x40(r1)
/* 0000D204 801B002C */ lwz r0, 0x2c(r27)
/* 0000D208 FC020032 */ fmul f0, f2, f0
/* 0000D20C 1C0001A4 */ mulli r0, r0, 0x1a4
/* 0000D210 FC000824 */ fdiv f0, f0, f1
/* 0000D214 7C790214 */ add r3, r25, r0
/* 0000D218 C023000C */ lfs f1, 0xc(r3)
/* 0000D21C FC01002A */ fadd f0, f1, f0
/* 0000D220 FC000018 */ frsp f0, f0
/* 0000D224 D01D0014 */ stfs f0, 0x14(r29)
/* 0000D228 807F0024 */ lwz r3, 0x24(r31)
/* 0000D22C 38030001 */ addi r0, r3, 1
/* 0000D230 901F0024 */ stw r0, 0x24(r31)
lbl_0000D234:
/* 0000D234 C03D0000 */ lfs f1, 0(r29)
/* 0000D238 3C600000 */ lis r3, stageBoundSphere@ha
/* 0000D23C C01D000C */ lfs f0, 0xc(r29)
/* 0000D240 3B230000 */ addi r25, r3, stageBoundSphere@l
/* 0000D244 EC010028 */ fsubs f0, f1, f0
/* 0000D248 D0010050 */ stfs f0, 0x50(r1)
/* 0000D24C C03D0004 */ lfs f1, 4(r29)
/* 0000D250 C01D0010 */ lfs f0, 0x10(r29)
/* 0000D254 EC010028 */ fsubs f0, f1, f0
/* 0000D258 D0010054 */ stfs f0, 0x54(r1)
/* 0000D25C C03D0008 */ lfs f1, 8(r29)
/* 0000D260 C01D0014 */ lfs f0, 0x14(r29)
/* 0000D264 EC010028 */ fsubs f0, f1, f0
/* 0000D268 D0010058 */ stfs f0, 0x58(r1)
/* 0000D26C C03D000C */ lfs f1, 0xc(r29)
/* 0000D270 C0190000 */ lfs f0, 0(r25)
/* 0000D274 EC010028 */ fsubs f0, f1, f0
/* 0000D278 D001005C */ stfs f0, 0x5c(r1)
/* 0000D27C C03D0010 */ lfs f1, 0x10(r29)
/* 0000D280 C0190004 */ lfs f0, 4(r25)
/* 0000D284 EC010028 */ fsubs f0, f1, f0
/* 0000D288 D0010060 */ stfs f0, 0x60(r1)
/* 0000D28C C03D0014 */ lfs f1, 0x14(r29)
/* 0000D290 C0190008 */ lfs f0, 8(r25)
/* 0000D294 EC010028 */ fsubs f0, f1, f0
/* 0000D298 D0010064 */ stfs f0, 0x64(r1)
/* 0000D29C C021005C */ lfs f1, 0x5c(r1)
/* 0000D2A0 C0410060 */ lfs f2, 0x60(r1)
/* 0000D2A4 C0010064 */ lfs f0, 0x64(r1)
/* 0000D2A8 EC210072 */ fmuls f1, f1, f1
/* 0000D2AC EC2208BA */ fmadds f1, f2, f2, f1
/* 0000D2B0 EC20083A */ fmadds f1, f0, f0, f1
/* 0000D2B4 4BFF2F1D */ bl mathutil_sqrt
/* 0000D2B8 C059000C */ lfs f2, 0xc(r25)
/* 0000D2BC C01E00B0 */ lfs f0, 0xb0(r30)
/* 0000D2C0 C87E00A8 */ lfd f3, 0xa8(r30)
/* 0000D2C4 EC020032 */ fmuls f0, f2, f0
/* 0000D2C8 FC030032 */ fmul f0, f3, f0
/* 0000D2CC FC010040 */ fcmpo cr0, f1, f0
/* 0000D2D0 40810118 */ ble lbl_0000D3E8
/* 0000D2D4 C021005C */ lfs f1, 0x5c(r1)
/* 0000D2D8 C0410060 */ lfs f2, 0x60(r1)
/* 0000D2DC C0010064 */ lfs f0, 0x64(r1)
/* 0000D2E0 EC210072 */ fmuls f1, f1, f1
/* 0000D2E4 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000D2E8 EC20083A */ fmadds f1, f0, f0, f1
/* 0000D2EC 4BFF2EE5 */ bl mathutil_sqrt
/* 0000D2F0 C059000C */ lfs f2, 0xc(r25)
/* 0000D2F4 C01E00B0 */ lfs f0, 0xb0(r30)
/* 0000D2F8 C87E00A8 */ lfd f3, 0xa8(r30)
/* 0000D2FC EC020032 */ fmuls f0, f2, f0
/* 0000D300 C041005C */ lfs f2, 0x5c(r1)
/* 0000D304 C0990000 */ lfs f4, 0(r25)
/* 0000D308 FC030032 */ fmul f0, f3, f0
/* 0000D30C FC000824 */ fdiv f0, f0, f1
/* 0000D310 FC020032 */ fmul f0, f2, f0
/* 0000D314 FC04002A */ fadd f0, f4, f0
/* 0000D318 FC000018 */ frsp f0, f0
/* 0000D31C D01D000C */ stfs f0, 0xc(r29)
/* 0000D320 C021005C */ lfs f1, 0x5c(r1)
/* 0000D324 C0410060 */ lfs f2, 0x60(r1)
/* 0000D328 C0010064 */ lfs f0, 0x64(r1)
/* 0000D32C EC210072 */ fmuls f1, f1, f1
/* 0000D330 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000D334 EC20083A */ fmadds f1, f0, f0, f1
/* 0000D338 4BFF2E99 */ bl mathutil_sqrt
/* 0000D33C C059000C */ lfs f2, 0xc(r25)
/* 0000D340 C01E00B0 */ lfs f0, 0xb0(r30)
/* 0000D344 C87E00A8 */ lfd f3, 0xa8(r30)
/* 0000D348 EC020032 */ fmuls f0, f2, f0
/* 0000D34C C0410060 */ lfs f2, 0x60(r1)
/* 0000D350 C0990004 */ lfs f4, 4(r25)
/* 0000D354 FC030032 */ fmul f0, f3, f0
/* 0000D358 FC000824 */ fdiv f0, f0, f1
/* 0000D35C FC020032 */ fmul f0, f2, f0
/* 0000D360 FC04002A */ fadd f0, f4, f0
/* 0000D364 FC000018 */ frsp f0, f0
/* 0000D368 D01D0010 */ stfs f0, 0x10(r29)
/* 0000D36C C021005C */ lfs f1, 0x5c(r1)
/* 0000D370 C0410060 */ lfs f2, 0x60(r1)
/* 0000D374 C0010064 */ lfs f0, 0x64(r1)
/* 0000D378 EC210072 */ fmuls f1, f1, f1
/* 0000D37C EC2208BA */ fmadds f1, f2, f2, f1
/* 0000D380 EC20083A */ fmadds f1, f0, f0, f1
/* 0000D384 4BFF2E4D */ bl mathutil_sqrt
/* 0000D388 C059000C */ lfs f2, 0xc(r25)
/* 0000D38C C01E00B0 */ lfs f0, 0xb0(r30)
/* 0000D390 C87E00A8 */ lfd f3, 0xa8(r30)
/* 0000D394 EC020032 */ fmuls f0, f2, f0
/* 0000D398 C0410064 */ lfs f2, 0x64(r1)
/* 0000D39C C0990008 */ lfs f4, 8(r25)
/* 0000D3A0 FC030032 */ fmul f0, f3, f0
/* 0000D3A4 FC000824 */ fdiv f0, f0, f1
/* 0000D3A8 FC020032 */ fmul f0, f2, f0
/* 0000D3AC FC04002A */ fadd f0, f4, f0
/* 0000D3B0 FC000018 */ frsp f0, f0
/* 0000D3B4 D01D0014 */ stfs f0, 0x14(r29)
/* 0000D3B8 C0210050 */ lfs f1, 0x50(r1)
/* 0000D3BC C01D000C */ lfs f0, 0xc(r29)
/* 0000D3C0 EC01002A */ fadds f0, f1, f0
/* 0000D3C4 D01D0000 */ stfs f0, 0(r29)
/* 0000D3C8 C0210054 */ lfs f1, 0x54(r1)
/* 0000D3CC C01D0010 */ lfs f0, 0x10(r29)
/* 0000D3D0 EC01002A */ fadds f0, f1, f0
/* 0000D3D4 D01D0004 */ stfs f0, 4(r29)
/* 0000D3D8 C0210058 */ lfs f1, 0x58(r1)
/* 0000D3DC C01D0014 */ lfs f0, 0x14(r29)
/* 0000D3E0 EC01002A */ fadds f0, f1, f0
/* 0000D3E4 D01D0008 */ stfs f0, 8(r29)
lbl_0000D3E8:
/* 0000D3E8 C03D0000 */ lfs f1, 0(r29)
/* 0000D3EC 3C600000 */ lis r3, stageBoundSphere@ha
/* 0000D3F0 C01D000C */ lfs f0, 0xc(r29)
/* 0000D3F4 3B230000 */ addi r25, r3, stageBoundSphere@l
/* 0000D3F8 EC010028 */ fsubs f0, f1, f0
/* 0000D3FC D0010050 */ stfs f0, 0x50(r1)
/* 0000D400 C03D0004 */ lfs f1, 4(r29)
/* 0000D404 C01D0010 */ lfs f0, 0x10(r29)
/* 0000D408 EC010028 */ fsubs f0, f1, f0
/* 0000D40C D0010054 */ stfs f0, 0x54(r1)
/* 0000D410 C03D0008 */ lfs f1, 8(r29)
/* 0000D414 C01D0014 */ lfs f0, 0x14(r29)
/* 0000D418 EC010028 */ fsubs f0, f1, f0
/* 0000D41C D0010058 */ stfs f0, 0x58(r1)
/* 0000D420 C03D0000 */ lfs f1, 0(r29)
/* 0000D424 C0190000 */ lfs f0, 0(r25)
/* 0000D428 EC010028 */ fsubs f0, f1, f0
/* 0000D42C D001005C */ stfs f0, 0x5c(r1)
/* 0000D430 C03D0004 */ lfs f1, 4(r29)
/* 0000D434 C0190004 */ lfs f0, 4(r25)
/* 0000D438 EC010028 */ fsubs f0, f1, f0
/* 0000D43C D0010060 */ stfs f0, 0x60(r1)
/* 0000D440 C03D0008 */ lfs f1, 8(r29)
/* 0000D444 C0190008 */ lfs f0, 8(r25)
/* 0000D448 EC010028 */ fsubs f0, f1, f0
/* 0000D44C D0010064 */ stfs f0, 0x64(r1)
/* 0000D450 C021005C */ lfs f1, 0x5c(r1)
/* 0000D454 C0410060 */ lfs f2, 0x60(r1)
/* 0000D458 C0010064 */ lfs f0, 0x64(r1)
/* 0000D45C EC210072 */ fmuls f1, f1, f1
/* 0000D460 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000D464 EC20083A */ fmadds f1, f0, f0, f1
/* 0000D468 4BFF2D69 */ bl mathutil_sqrt
/* 0000D46C C059000C */ lfs f2, 0xc(r25)
/* 0000D470 C01E00B0 */ lfs f0, 0xb0(r30)
/* 0000D474 C87E00B8 */ lfd f3, 0xb8(r30)
/* 0000D478 EC020032 */ fmuls f0, f2, f0
/* 0000D47C FC030032 */ fmul f0, f3, f0
/* 0000D480 FC010040 */ fcmpo cr0, f1, f0
/* 0000D484 40810148 */ ble lbl_0000D5CC
/* 0000D488 C021005C */ lfs f1, 0x5c(r1)
/* 0000D48C C0410060 */ lfs f2, 0x60(r1)
/* 0000D490 C0010064 */ lfs f0, 0x64(r1)
/* 0000D494 EC210072 */ fmuls f1, f1, f1
/* 0000D498 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000D49C EC20083A */ fmadds f1, f0, f0, f1
/* 0000D4A0 4BFF2D31 */ bl mathutil_sqrt
/* 0000D4A4 C059000C */ lfs f2, 0xc(r25)
/* 0000D4A8 C01E00B0 */ lfs f0, 0xb0(r30)
/* 0000D4AC C87E00B8 */ lfd f3, 0xb8(r30)
/* 0000D4B0 EC020032 */ fmuls f0, f2, f0
/* 0000D4B4 C041005C */ lfs f2, 0x5c(r1)
/* 0000D4B8 C0990000 */ lfs f4, 0(r25)
/* 0000D4BC FC030032 */ fmul f0, f3, f0
/* 0000D4C0 FC000824 */ fdiv f0, f0, f1
/* 0000D4C4 FC020032 */ fmul f0, f2, f0
/* 0000D4C8 FC04002A */ fadd f0, f4, f0
/* 0000D4CC FC000018 */ frsp f0, f0
/* 0000D4D0 D01D0000 */ stfs f0, 0(r29)
/* 0000D4D4 C021005C */ lfs f1, 0x5c(r1)
/* 0000D4D8 C0410060 */ lfs f2, 0x60(r1)
/* 0000D4DC C0010064 */ lfs f0, 0x64(r1)
/* 0000D4E0 EC210072 */ fmuls f1, f1, f1
/* 0000D4E4 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000D4E8 EC20083A */ fmadds f1, f0, f0, f1
/* 0000D4EC 4BFF2CE5 */ bl mathutil_sqrt
/* 0000D4F0 C059000C */ lfs f2, 0xc(r25)
/* 0000D4F4 C01E00B0 */ lfs f0, 0xb0(r30)
/* 0000D4F8 C87E00B8 */ lfd f3, 0xb8(r30)
/* 0000D4FC EC020032 */ fmuls f0, f2, f0
/* 0000D500 C0410060 */ lfs f2, 0x60(r1)
/* 0000D504 C0990004 */ lfs f4, 4(r25)
/* 0000D508 FC030032 */ fmul f0, f3, f0
/* 0000D50C FC000824 */ fdiv f0, f0, f1
/* 0000D510 FC020032 */ fmul f0, f2, f0
/* 0000D514 FC04002A */ fadd f0, f4, f0
/* 0000D518 FC000018 */ frsp f0, f0
/* 0000D51C D01D0004 */ stfs f0, 4(r29)
/* 0000D520 C021005C */ lfs f1, 0x5c(r1)
/* 0000D524 C0410060 */ lfs f2, 0x60(r1)
/* 0000D528 C0010064 */ lfs f0, 0x64(r1)
/* 0000D52C EC210072 */ fmuls f1, f1, f1
/* 0000D530 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000D534 EC20083A */ fmadds f1, f0, f0, f1
/* 0000D538 4BFF2C99 */ bl mathutil_sqrt
/* 0000D53C C059000C */ lfs f2, 0xc(r25)
/* 0000D540 C01E00B0 */ lfs f0, 0xb0(r30)
/* 0000D544 C87E00B8 */ lfd f3, 0xb8(r30)
/* 0000D548 EC020032 */ fmuls f0, f2, f0
/* 0000D54C C0410064 */ lfs f2, 0x64(r1)
/* 0000D550 C0990008 */ lfs f4, 8(r25)
/* 0000D554 FC030032 */ fmul f0, f3, f0
/* 0000D558 FC000824 */ fdiv f0, f0, f1
/* 0000D55C FC020032 */ fmul f0, f2, f0
/* 0000D560 FC04002A */ fadd f0, f4, f0
/* 0000D564 FC000018 */ frsp f0, f0
/* 0000D568 D01D0008 */ stfs f0, 8(r29)
/* 0000D56C C07D000C */ lfs f3, 0xc(r29)
/* 0000D570 C03D0000 */ lfs f1, 0(r29)
/* 0000D574 C05D0014 */ lfs f2, 0x14(r29)
/* 0000D578 C01D0008 */ lfs f0, 8(r29)
/* 0000D57C EC230828 */ fsubs f1, f3, f1
/* 0000D580 EC420028 */ fsubs f2, f2, f0
/* 0000D584 4BFF2C4D */ bl mathutil_atan2
/* 0000D588 38038000 */ addi r0, r3, -32768
/* 0000D58C B01D001A */ sth r0, 0x1a(r29)
/* 0000D590 C07D0014 */ lfs f3, 0x14(r29)
/* 0000D594 C05D0008 */ lfs f2, 8(r29)
/* 0000D598 C03D000C */ lfs f1, 0xc(r29)
/* 0000D59C C01D0000 */ lfs f0, 0(r29)
/* 0000D5A0 EC431028 */ fsubs f2, f3, f2
/* 0000D5A4 EC210028 */ fsubs f1, f1, f0
/* 0000D5A8 EC210072 */ fmuls f1, f1, f1
/* 0000D5AC EC2208BA */ fmadds f1, f2, f2, f1
/* 0000D5B0 4BFF2C21 */ bl mathutil_sqrt
/* 0000D5B4 C07D0010 */ lfs f3, 0x10(r29)
/* 0000D5B8 FC400890 */ fmr f2, f1
/* 0000D5BC C01D0004 */ lfs f0, 4(r29)
/* 0000D5C0 EC230028 */ fsubs f1, f3, f0
/* 0000D5C4 4BFF2C0D */ bl mathutil_atan2
/* 0000D5C8 B07D0018 */ sth r3, 0x18(r29)
lbl_0000D5CC:
/* 0000D5CC 3C600000 */ lis r3, modeCtrl@ha
/* 0000D5D0 C03D000C */ lfs f1, 0xc(r29)
/* 0000D5D4 38A30000 */ addi r5, r3, modeCtrl@l
/* 0000D5D8 8005002C */ lwz r0, 0x2c(r5)
/* 0000D5DC 3C600000 */ lis r3, ballInfo@ha
/* 0000D5E0 38C30000 */ addi r6, r3, ballInfo@l
/* 0000D5E4 1C0001A4 */ mulli r0, r0, 0x1a4
/* 0000D5E8 7C660214 */ add r3, r6, r0
/* 0000D5EC C0030004 */ lfs f0, 4(r3)
/* 0000D5F0 3881005C */ addi r4, r1, 0x5c
/* 0000D5F4 EC010028 */ fsubs f0, f1, f0
/* 0000D5F8 D001005C */ stfs f0, 0x5c(r1)
/* 0000D5FC C01E0018 */ lfs f0, 0x18(r30)
/* 0000D600 D0010060 */ stfs f0, 0x60(r1)
/* 0000D604 8005002C */ lwz r0, 0x2c(r5)
/* 0000D608 C03D0014 */ lfs f1, 0x14(r29)
/* 0000D60C 1C0001A4 */ mulli r0, r0, 0x1a4
/* 0000D610 7C660214 */ add r3, r6, r0
/* 0000D614 C003000C */ lfs f0, 0xc(r3)
/* 0000D618 EC010028 */ fsubs f0, f1, f0
/* 0000D61C D0010064 */ stfs f0, 0x64(r1)
/* 0000D620 8005002C */ lwz r0, 0x2c(r5)
/* 0000D624 1C0001A4 */ mulli r0, r0, 0x1a4
/* 0000D628 7C660214 */ add r3, r6, r0
/* 0000D62C 806300FC */ lwz r3, 0xfc(r3)
/* 0000D630 4BFF2BA1 */ bl mot_ape_set_quat_from_vec
lbl_0000D634:
/* 0000D634 BB21007C */ lmw r25, 0x7c(r1)
/* 0000D638 800100A4 */ lwz r0, 0xa4(r1)
/* 0000D63C CBE10098 */ lfd f31, 0x98(r1)
/* 0000D640 382100A0 */ addi r1, r1, 0xa0
/* 0000D644 7C0803A6 */ mtlr r0
/* 0000D648 4E800020 */ blr 
