/* 0000C1D0 7C0802A6 */ mflr r0
/* 0000C1D4 3CA00000 */ lis r5, lbl_00014800@ha
/* 0000C1D8 90010004 */ stw r0, 4(r1)
/* 0000C1DC 9421FE88 */ stwu r1, -0x178(r1)
/* 0000C1E0 DBE10170 */ stfd f31, 0x170(r1)
/* 0000C1E4 DBC10168 */ stfd f30, 0x168(r1)
/* 0000C1E8 DBA10160 */ stfd f29, 0x160(r1)
/* 0000C1EC DB810158 */ stfd f28, 0x158(r1)
/* 0000C1F0 DB610150 */ stfd f27, 0x150(r1)
/* 0000C1F4 BE61011C */ stmw r19, 0x11c(r1)
/* 0000C1F8 3B240000 */ addi r25, r4, 0
/* 0000C1FC 3BE50000 */ addi r31, r5, lbl_00014800@l
/* 0000C200 7C781B78 */ mr r24, r3
/* 0000C204 3BD90004 */ addi r30, r25, 4
/* 0000C208 3AD90010 */ addi r22, r25, 0x10
/* 0000C20C 3BB9001C */ addi r29, r25, 0x1c
/* 0000C210 3A980004 */ addi r20, r24, 4
/* 0000C214 3A780094 */ addi r19, r24, 0x94
/* 0000C218 3AA00000 */ li r21, 0
/* 0000C21C 3AE00000 */ li r23, 0
/* 0000C220 C3640068 */ lfs f27, 0x68(r4)
/* 0000C224 C3FF04FC */ lfs f31, 0x4fc(r31)
/* 0000C228 C3DF03E8 */ lfs f30, 0x3e8(r31)
/* 0000C22C 48000058 */ b lbl_0000C284
lbl_0000C230:
/* 0000C230 801F03A8 */ lwz r0, 0x3a8(r31)
/* 0000C234 FC40D890 */ fmr f2, f27
/* 0000C238 38930000 */ addi r4, r19, 0
/* 0000C23C 7C60BA14 */ add r3, r0, r23
/* 0000C240 C023000C */ lfs f1, 0xc(r3)
/* 0000C244 38B40000 */ addi r5, r20, 0
/* 0000C248 38D60000 */ addi r6, r22, 0
/* 0000C24C 38FE0000 */ addi r7, r30, 0
/* 0000C250 386100F8 */ addi r3, r1, 0xf8
/* 0000C254 48001345 */ bl lbl_0000D598
/* 0000C258 C00100F8 */ lfs f0, 0xf8(r1)
/* 0000C25C FC00F040 */ fcmpo cr0, f0, f30
/* 0000C260 40810014 */ ble lbl_0000C274
/* 0000C264 FFC00090 */ fmr f30, f0
/* 0000C268 3B950000 */ addi r28, r21, 0
/* 0000C26C 3B740000 */ addi r27, r20, 0
/* 0000C270 3B530000 */ addi r26, r19, 0
lbl_0000C274:
/* 0000C274 3AB50001 */ addi r21, r21, 1
/* 0000C278 3AF70014 */ addi r23, r23, 0x14
/* 0000C27C 3A94000C */ addi r20, r20, 0xc
/* 0000C280 3A73000C */ addi r19, r19, 0xc
lbl_0000C284:
/* 0000C284 881F03AC */ lbz r0, 0x3ac(r31)
/* 0000C288 7C150000 */ cmpw r21, r0
/* 0000C28C 4180FFA4 */ blt lbl_0000C230
/* 0000C290 C81F0400 */ lfd f0, 0x400(r31)
/* 0000C294 FC00F000 */ fcmpu cr0, f0, f30
/* 0000C298 418207E8 */ beq lbl_0000CA80
/* 0000C29C 80780000 */ lwz r3, 0(r24)
/* 0000C2A0 1C1C0014 */ mulli r0, r28, 0x14
/* 0000C2A4 FC20D890 */ fmr f1, f27
/* 0000C2A8 546307FA */ rlwinm r3, r3, 0, 0x1f, 0x1d
/* 0000C2AC 90780000 */ stw r3, 0(r24)
/* 0000C2B0 38760000 */ addi r3, r22, 0
/* 0000C2B4 38BA0000 */ addi r5, r26, 0
/* 0000C2B8 80F80000 */ lwz r7, 0(r24)
/* 0000C2BC 38810098 */ addi r4, r1, 0x98
/* 0000C2C0 38C1008C */ addi r6, r1, 0x8c
/* 0000C2C4 60E70004 */ ori r7, r7, 4
/* 0000C2C8 90F80000 */ stw r7, 0(r24)
/* 0000C2CC C85F0500 */ lfd f2, 0x500(r31)
/* 0000C2D0 C01F0394 */ lfs f0, 0x394(r31)
/* 0000C2D4 C39F0398 */ lfs f28, 0x398(r31)
/* 0000C2D8 811E0000 */ lwz r8, 0(r30)
/* 0000C2DC FFA20032 */ fmul f29, f2, f0
/* 0000C2E0 80FE0004 */ lwz r7, 4(r30)
/* 0000C2E4 91010098 */ stw r8, 0x98(r1)
/* 0000C2E8 FFA0E818 */ frsp f29, f29
/* 0000C2EC 90E1009C */ stw r7, 0x9c(r1)
/* 0000C2F0 80FE0008 */ lwz r7, 8(r30)
/* 0000C2F4 90E100A0 */ stw r7, 0xa0(r1)
/* 0000C2F8 811B0000 */ lwz r8, 0(r27)
/* 0000C2FC 80FB0004 */ lwz r7, 4(r27)
/* 0000C300 9101008C */ stw r8, 0x8c(r1)
/* 0000C304 90E10090 */ stw r7, 0x90(r1)
/* 0000C308 80FB0008 */ lwz r7, 8(r27)
/* 0000C30C 90E10094 */ stw r7, 0x94(r1)
/* 0000C310 80FF03A8 */ lwz r7, 0x3a8(r31)
/* 0000C314 7CE70214 */ add r7, r7, r0
/* 0000C318 C047000C */ lfs f2, 0xc(r7)
/* 0000C31C 4BFF3E45 */ bl func_8006AAEC
/* 0000C320 C021008C */ lfs f1, 0x8c(r1)
/* 0000C324 38610080 */ addi r3, r1, 0x80
/* 0000C328 C0010098 */ lfs f0, 0x98(r1)
/* 0000C32C C0610090 */ lfs f3, 0x90(r1)
/* 0000C330 EC810028 */ fsubs f4, f1, f0
/* 0000C334 C041009C */ lfs f2, 0x9c(r1)
/* 0000C338 C0210094 */ lfs f1, 0x94(r1)
/* 0000C33C C00100A0 */ lfs f0, 0xa0(r1)
/* 0000C340 EC431028 */ fsubs f2, f3, f2
/* 0000C344 D0810080 */ stfs f4, 0x80(r1)
/* 0000C348 EC010028 */ fsubs f0, f1, f0
/* 0000C34C D0410084 */ stfs f2, 0x84(r1)
/* 0000C350 D0010088 */ stfs f0, 0x88(r1)
/* 0000C354 4BFF3E0D */ bl mathutil_vec_normalize_len
/* 0000C358 C01F0508 */ lfs f0, 0x508(r31)
/* 0000C35C FC010040 */ fcmpo cr0, f1, f0
/* 0000C360 4C401382 */ cror 2, 0, 2
/* 0000C364 4082001C */ bne lbl_0000C380
/* 0000C368 C01F03E8 */ lfs f0, 0x3e8(r31)
/* 0000C36C D0010080 */ stfs f0, 0x80(r1)
/* 0000C370 C01F03E8 */ lfs f0, 0x3e8(r31)
/* 0000C374 D0010084 */ stfs f0, 0x84(r1)
/* 0000C378 C01F050C */ lfs f0, 0x50c(r31)
/* 0000C37C D0010088 */ stfs f0, 0x88(r1)
lbl_0000C380:
/* 0000C380 C0210098 */ lfs f1, 0x98(r1)
/* 0000C384 38610074 */ addi r3, r1, 0x74
/* 0000C388 C001008C */ lfs f0, 0x8c(r1)
/* 0000C38C C061009C */ lfs f3, 0x9c(r1)
/* 0000C390 EC810028 */ fsubs f4, f1, f0
/* 0000C394 C0410090 */ lfs f2, 0x90(r1)
/* 0000C398 C02100A0 */ lfs f1, 0xa0(r1)
/* 0000C39C C0010094 */ lfs f0, 0x94(r1)
/* 0000C3A0 EC431028 */ fsubs f2, f3, f2
/* 0000C3A4 D0810074 */ stfs f4, 0x74(r1)
/* 0000C3A8 EC010028 */ fsubs f0, f1, f0
/* 0000C3AC D0410078 */ stfs f2, 0x78(r1)
/* 0000C3B0 D001007C */ stfs f0, 0x7c(r1)
/* 0000C3B4 4BFF3DAD */ bl mathutil_vec_normalize_len
/* 0000C3B8 C0390068 */ lfs f1, 0x68(r25)
/* 0000C3BC 387900A8 */ addi r3, r25, 0xa8
/* 0000C3C0 38810068 */ addi r4, r1, 0x68
/* 0000C3C4 38A10074 */ addi r5, r1, 0x74
/* 0000C3C8 4BFF3D99 */ bl u_math_unk7
/* 0000C3CC C83F0498 */ lfd f1, 0x498(r31)
/* 0000C3D0 C0010068 */ lfs f0, 0x68(r1)
/* 0000C3D4 FC010032 */ fmul f0, f1, f0
/* 0000C3D8 FC000018 */ frsp f0, f0
/* 0000C3DC D0010068 */ stfs f0, 0x68(r1)
/* 0000C3E0 C83F0498 */ lfd f1, 0x498(r31)
/* 0000C3E4 C001006C */ lfs f0, 0x6c(r1)
/* 0000C3E8 FC010032 */ fmul f0, f1, f0
/* 0000C3EC FC000018 */ frsp f0, f0
/* 0000C3F0 D001006C */ stfs f0, 0x6c(r1)
/* 0000C3F4 C83F0498 */ lfd f1, 0x498(r31)
/* 0000C3F8 C0010070 */ lfs f0, 0x70(r1)
/* 0000C3FC FC010032 */ fmul f0, f1, f0
/* 0000C400 FC000018 */ frsp f0, f0
/* 0000C404 D0010070 */ stfs f0, 0x70(r1)
/* 0000C408 C05D0000 */ lfs f2, 0(r29)
/* 0000C40C C0010068 */ lfs f0, 0x68(r1)
/* 0000C410 C021006C */ lfs f1, 0x6c(r1)
/* 0000C414 EC42002A */ fadds f2, f2, f0
/* 0000C418 C0010070 */ lfs f0, 0x70(r1)
/* 0000C41C D04100FC */ stfs f2, 0xfc(r1)
/* 0000C420 C05D0004 */ lfs f2, 4(r29)
/* 0000C424 EC22082A */ fadds f1, f2, f1
/* 0000C428 D0210100 */ stfs f1, 0x100(r1)
/* 0000C42C C03D0008 */ lfs f1, 8(r29)
/* 0000C430 EC01002A */ fadds f0, f1, f0
/* 0000C434 D0010104 */ stfs f0, 0x104(r1)
/* 0000C438 C0A10080 */ lfs f5, 0x80(r1)
/* 0000C43C C04100FC */ lfs f2, 0xfc(r1)
/* 0000C440 C0810084 */ lfs f4, 0x84(r1)
/* 0000C444 C0210100 */ lfs f1, 0x100(r1)
/* 0000C448 C0610088 */ lfs f3, 0x88(r1)
/* 0000C44C C0010104 */ lfs f0, 0x104(r1)
/* 0000C450 ECA500B2 */ fmuls f5, f5, f2
/* 0000C454 ECA4287A */ fmadds f5, f4, f1, f5
/* 0000C458 ECA3283A */ fmadds f5, f3, f0, f5
/* 0000C45C C0810080 */ lfs f4, 0x80(r1)
/* 0000C460 C0410084 */ lfs f2, 0x84(r1)
/* 0000C464 C0C10088 */ lfs f6, 0x88(r1)
/* 0000C468 EC640172 */ fmuls f3, f4, f5
/* 0000C46C EC220172 */ fmuls f1, f2, f5
/* 0000C470 EC060172 */ fmuls f0, f6, f5
/* 0000C474 D06100EC */ stfs f3, 0xec(r1)
/* 0000C478 D02100F0 */ stfs f1, 0xf0(r1)
/* 0000C47C D00100F4 */ stfs f0, 0xf4(r1)
/* 0000C480 C03B0000 */ lfs f1, 0(r27)
/* 0000C484 C01A0000 */ lfs f0, 0(r26)
/* 0000C488 EC010028 */ fsubs f0, f1, f0
/* 0000C48C D00100E0 */ stfs f0, 0xe0(r1)
/* 0000C490 C03B0004 */ lfs f1, 4(r27)
/* 0000C494 C01A0004 */ lfs f0, 4(r26)
/* 0000C498 EC010028 */ fsubs f0, f1, f0
/* 0000C49C D00100E4 */ stfs f0, 0xe4(r1)
/* 0000C4A0 C03B0008 */ lfs f1, 8(r27)
/* 0000C4A4 C01A0008 */ lfs f0, 8(r26)
/* 0000C4A8 EC010028 */ fsubs f0, f1, f0
/* 0000C4AC D00100E8 */ stfs f0, 0xe8(r1)
/* 0000C4B0 C1010080 */ lfs f8, 0x80(r1)
/* 0000C4B4 C06100E0 */ lfs f3, 0xe0(r1)
/* 0000C4B8 C0E10084 */ lfs f7, 0x84(r1)
/* 0000C4BC C02100E4 */ lfs f1, 0xe4(r1)
/* 0000C4C0 C0A10088 */ lfs f5, 0x88(r1)
/* 0000C4C4 C00100E8 */ lfs f0, 0xe8(r1)
/* 0000C4C8 ED0800F2 */ fmuls f8, f8, f3
/* 0000C4CC ED07407A */ fmadds f8, f7, f1, f8
/* 0000C4D0 ED05403A */ fmadds f8, f5, f0, f8
/* 0000C4D4 C00100EC */ lfs f0, 0xec(r1)
/* 0000C4D8 C0A100F0 */ lfs f5, 0xf0(r1)
/* 0000C4DC ECFFE82A */ fadds f7, f31, f29
/* 0000C4E0 C06100F4 */ lfs f3, 0xf4(r1)
/* 0000C4E4 EC840232 */ fmuls f4, f4, f8
/* 0000C4E8 EC420232 */ fmuls f2, f2, f8
/* 0000C4EC EC260232 */ fmuls f1, f6, f8
/* 0000C4F0 D08100E0 */ stfs f4, 0xe0(r1)
/* 0000C4F4 ECDF0032 */ fmuls f6, f31, f0
/* 0000C4F8 EC9F0172 */ fmuls f4, f31, f5
/* 0000C4FC D04100E4 */ stfs f2, 0xe4(r1)
/* 0000C500 EC5F00F2 */ fmuls f2, f31, f3
/* 0000C504 D02100E8 */ stfs f1, 0xe8(r1)
/* 0000C508 C16100E0 */ lfs f11, 0xe0(r1)
/* 0000C50C C14100E4 */ lfs f10, 0xe4(r1)
/* 0000C510 ED005828 */ fsubs f8, f0, f11
/* 0000C514 C02100E8 */ lfs f1, 0xe8(r1)
/* 0000C518 ED255028 */ fsubs f9, f5, f10
/* 0000C51C ECBD02F2 */ fmuls f5, f29, f11
/* 0000C520 D10100BC */ stfs f8, 0xbc(r1)
/* 0000C524 ED030828 */ fsubs f8, f3, f1
/* 0000C528 D12100C0 */ stfs f9, 0xc0(r1)
/* 0000C52C EC7D02B2 */ fmuls f3, f29, f10
/* 0000C530 EC3D0072 */ fmuls f1, f29, f1
/* 0000C534 D10100C4 */ stfs f8, 0xc4(r1)
/* 0000C538 ECC6282A */ fadds f6, f6, f5
/* 0000C53C C91F04A0 */ lfd f8, 0x4a0(r31)
/* 0000C540 ECA4182A */ fadds f5, f4, f3
/* 0000C544 C06100BC */ lfs f3, 0xbc(r1)
/* 0000C548 EC82082A */ fadds f4, f2, f1
/* 0000C54C FF683824 */ fdiv f27, f8, f7
/* 0000C550 C04100C0 */ lfs f2, 0xc0(r1)
/* 0000C554 C02100C4 */ lfs f1, 0xc4(r1)
/* 0000C558 FF60D818 */ frsp f27, f27
/* 0000C55C EC7C00F2 */ fmuls f3, f28, f3
/* 0000C560 EC5C00B2 */ fmuls f2, f28, f2
/* 0000C564 EC3C0072 */ fmuls f1, f28, f1
/* 0000C568 EC7B00F2 */ fmuls f3, f27, f3
/* 0000C56C ECFB01B2 */ fmuls f7, f27, f6
/* 0000C570 EC5B00B2 */ fmuls f2, f27, f2
/* 0000C574 D06100A4 */ stfs f3, 0xa4(r1)
/* 0000C578 EC3B0072 */ fmuls f1, f27, f1
/* 0000C57C ED1B0172 */ fmuls f8, f27, f5
/* 0000C580 D04100A8 */ stfs f2, 0xa8(r1)
/* 0000C584 ECDB0132 */ fmuls f6, f27, f4
/* 0000C588 D02100AC */ stfs f1, 0xac(r1)
/* 0000C58C C06100A4 */ lfs f3, 0xa4(r1)
/* 0000C590 C04100A8 */ lfs f2, 0xa8(r1)
/* 0000C594 C02100AC */ lfs f1, 0xac(r1)
/* 0000C598 EC830772 */ fmuls f4, f3, f29
/* 0000C59C D0E100B0 */ stfs f7, 0xb0(r1)
/* 0000C5A0 ECE20772 */ fmuls f7, f2, f29
/* 0000C5A4 ECA10772 */ fmuls f5, f1, f29
/* 0000C5A8 D10100B4 */ stfs f8, 0xb4(r1)
/* 0000C5AC EC6307F2 */ fmuls f3, f3, f31
/* 0000C5B0 D0C100B8 */ stfs f6, 0xb8(r1)
/* 0000C5B4 EC4207F2 */ fmuls f2, f2, f31
/* 0000C5B8 EC2107F2 */ fmuls f1, f1, f31
/* 0000C5BC C14100B0 */ lfs f10, 0xb0(r1)
/* 0000C5C0 C10100B4 */ lfs f8, 0xb4(r1)
/* 0000C5C4 C0C100B8 */ lfs f6, 0xb8(r1)
/* 0000C5C8 ED2A2028 */ fsubs f9, f10, f4
/* 0000C5CC EC8A182A */ fadds f4, f10, f3
/* 0000C5D0 ECE83828 */ fsubs f7, f8, f7
/* 0000C5D4 D12100D4 */ stfs f9, 0xd4(r1)
/* 0000C5D8 ECA62828 */ fsubs f5, f6, f5
/* 0000C5DC EC68102A */ fadds f3, f8, f2
/* 0000C5E0 D0E100D8 */ stfs f7, 0xd8(r1)
/* 0000C5E4 EC46082A */ fadds f2, f6, f1
/* 0000C5E8 D0A100DC */ stfs f5, 0xdc(r1)
/* 0000C5EC D08100C8 */ stfs f4, 0xc8(r1)
/* 0000C5F0 C02100D4 */ lfs f1, 0xd4(r1)
/* 0000C5F4 C89F03C8 */ lfd f4, 0x3c8(r31)
/* 0000C5F8 EC010028 */ fsubs f0, f1, f0
/* 0000C5FC FC24182A */ fadd f1, f4, f3
/* 0000C600 FC200818 */ frsp f1, f1
/* 0000C604 D02100CC */ stfs f1, 0xcc(r1)
/* 0000C608 D04100D0 */ stfs f2, 0xd0(r1)
/* 0000C60C C03D0000 */ lfs f1, 0(r29)
/* 0000C610 EC01002A */ fadds f0, f1, f0
/* 0000C614 D01D0000 */ stfs f0, 0(r29)
/* 0000C618 C02100D8 */ lfs f1, 0xd8(r1)
/* 0000C61C 1C1C000C */ mulli r0, r28, 0xc
/* 0000C620 C00100F0 */ lfs f0, 0xf0(r1)
/* 0000C624 C05D0004 */ lfs f2, 4(r29)
/* 0000C628 EC010028 */ fsubs f0, f1, f0
/* 0000C62C 7CD80214 */ add r6, r24, r0
/* 0000C630 3861001C */ addi r3, r1, 0x1c
/* 0000C634 388100BC */ addi r4, r1, 0xbc
/* 0000C638 EC02002A */ fadds f0, f2, f0
/* 0000C63C 38A10010 */ addi r5, r1, 0x10
/* 0000C640 D01D0004 */ stfs f0, 4(r29)
/* 0000C644 C02100DC */ lfs f1, 0xdc(r1)
/* 0000C648 C00100F4 */ lfs f0, 0xf4(r1)
/* 0000C64C C05D0008 */ lfs f2, 8(r29)
/* 0000C650 EC010028 */ fsubs f0, f1, f0
/* 0000C654 EC02002A */ fadds f0, f2, f0
/* 0000C658 D01D0008 */ stfs f0, 8(r29)
/* 0000C65C C02100C8 */ lfs f1, 0xc8(r1)
/* 0000C660 C00100E0 */ lfs f0, 0xe0(r1)
/* 0000C664 C0580130 */ lfs f2, 0x130(r24)
/* 0000C668 EC010028 */ fsubs f0, f1, f0
/* 0000C66C EC02002A */ fadds f0, f2, f0
/* 0000C670 D0180130 */ stfs f0, 0x130(r24)
/* 0000C674 C02100CC */ lfs f1, 0xcc(r1)
/* 0000C678 C00100E4 */ lfs f0, 0xe4(r1)
/* 0000C67C C0580134 */ lfs f2, 0x134(r24)
/* 0000C680 EC010028 */ fsubs f0, f1, f0
/* 0000C684 EC02002A */ fadds f0, f2, f0
/* 0000C688 D0180134 */ stfs f0, 0x134(r24)
/* 0000C68C C02100D0 */ lfs f1, 0xd0(r1)
/* 0000C690 C00100E8 */ lfs f0, 0xe8(r1)
/* 0000C694 C0580138 */ lfs f2, 0x138(r24)
/* 0000C698 EC010028 */ fsubs f0, f1, f0
/* 0000C69C EC02002A */ fadds f0, f2, f0
/* 0000C6A0 D0180138 */ stfs f0, 0x138(r24)
/* 0000C6A4 C83F0510 */ lfd f1, 0x510(r31)
/* 0000C6A8 C00100BC */ lfs f0, 0xbc(r1)
/* 0000C6AC FC010032 */ fmul f0, f1, f0
/* 0000C6B0 FC000018 */ frsp f0, f0
/* 0000C6B4 D00100BC */ stfs f0, 0xbc(r1)
/* 0000C6B8 C83F0510 */ lfd f1, 0x510(r31)
/* 0000C6BC C00100C0 */ lfs f0, 0xc0(r1)
/* 0000C6C0 FC010032 */ fmul f0, f1, f0
/* 0000C6C4 FC000018 */ frsp f0, f0
/* 0000C6C8 D00100C0 */ stfs f0, 0xc0(r1)
/* 0000C6CC C83F0510 */ lfd f1, 0x510(r31)
/* 0000C6D0 C00100C4 */ lfs f0, 0xc4(r1)
/* 0000C6D4 FC010032 */ fmul f0, f1, f0
/* 0000C6D8 FC000018 */ frsp f0, f0
/* 0000C6DC D00100C4 */ stfs f0, 0xc4(r1)
/* 0000C6E0 C0260004 */ lfs f1, 4(r6)
/* 0000C6E4 C0180124 */ lfs f0, 0x124(r24)
/* 0000C6E8 EC010028 */ fsubs f0, f1, f0
/* 0000C6EC D001001C */ stfs f0, 0x1c(r1)
/* 0000C6F0 C0260008 */ lfs f1, 8(r6)
/* 0000C6F4 C0180128 */ lfs f0, 0x128(r24)
/* 0000C6F8 EC010028 */ fsubs f0, f1, f0
/* 0000C6FC D0010020 */ stfs f0, 0x20(r1)
/* 0000C700 C026000C */ lfs f1, 0xc(r6)
/* 0000C704 C018012C */ lfs f0, 0x12c(r24)
/* 0000C708 EC010028 */ fsubs f0, f1, f0
/* 0000C70C D0010024 */ stfs f0, 0x24(r1)
/* 0000C710 480011BD */ bl lbl_0000D8CC
/* 0000C714 1C1C0014 */ mulli r0, r28, 0x14
/* 0000C718 807F03A8 */ lwz r3, 0x3a8(r31)
/* 0000C71C EC1F06F2 */ fmuls f0, f31, f27
/* 0000C720 C8BF04D0 */ lfd f5, 0x4d0(r31)
/* 0000C724 EC3D06F2 */ fmuls f1, f29, f27
/* 0000C728 7C630214 */ add r3, r3, r0
/* 0000C72C EC5E0032 */ fmuls f2, f30, f0
/* 0000C730 C0830010 */ lfs f4, 0x10(r3)
/* 0000C734 EC7E0072 */ fmuls f3, f30, f1
/* 0000C738 C8DF04C8 */ lfd f6, 0x4c8(r31)
/* 0000C73C FC052024 */ fdiv f0, f5, f4
/* 0000C740 C03F0388 */ lfs f1, 0x388(r31)
/* 0000C744 C0810010 */ lfs f4, 0x10(r1)
/* 0000C748 FCA6002A */ fadd f5, f6, f0
/* 0000C74C FCA02818 */ frsp f5, f5
/* 0000C750 EC010172 */ fmuls f0, f1, f5
/* 0000C754 EC040032 */ fmuls f0, f4, f0
/* 0000C758 D0010010 */ stfs f0, 0x10(r1)
/* 0000C75C C01F038C */ lfs f0, 0x38c(r31)
/* 0000C760 C0210014 */ lfs f1, 0x14(r1)
/* 0000C764 EC000172 */ fmuls f0, f0, f5
/* 0000C768 EC010032 */ fmuls f0, f1, f0
/* 0000C76C D0010014 */ stfs f0, 0x14(r1)
/* 0000C770 C01F0390 */ lfs f0, 0x390(r31)
/* 0000C774 C0210018 */ lfs f1, 0x18(r1)
/* 0000C778 EC000172 */ fmuls f0, f0, f5
/* 0000C77C EC010032 */ fmuls f0, f1, f0
/* 0000C780 D0010018 */ stfs f0, 0x18(r1)
/* 0000C784 80010010 */ lwz r0, 0x10(r1)
/* 0000C788 80610014 */ lwz r3, 0x14(r1)
/* 0000C78C 9001005C */ stw r0, 0x5c(r1)
/* 0000C790 80010018 */ lwz r0, 0x18(r1)
/* 0000C794 90610060 */ stw r3, 0x60(r1)
/* 0000C798 90010064 */ stw r0, 0x64(r1)
/* 0000C79C C021005C */ lfs f1, 0x5c(r1)
/* 0000C7A0 C018013C */ lfs f0, 0x13c(r24)
/* 0000C7A4 EC01002A */ fadds f0, f1, f0
/* 0000C7A8 D018013C */ stfs f0, 0x13c(r24)
/* 0000C7AC C0210060 */ lfs f1, 0x60(r1)
/* 0000C7B0 C0180140 */ lfs f0, 0x140(r24)
/* 0000C7B4 EC01002A */ fadds f0, f1, f0
/* 0000C7B8 D0180140 */ stfs f0, 0x140(r24)
/* 0000C7BC C0210064 */ lfs f1, 0x64(r1)
/* 0000C7C0 C0180144 */ lfs f0, 0x144(r24)
/* 0000C7C4 EC01002A */ fadds f0, f1, f0
/* 0000C7C8 D0180144 */ stfs f0, 0x144(r24)
/* 0000C7CC 807F04D8 */ lwz r3, 0x4d8(r31)
/* 0000C7D0 801F04DC */ lwz r0, 0x4dc(r31)
/* 0000C7D4 90610044 */ stw r3, 0x44(r1)
/* 0000C7D8 90010048 */ stw r0, 0x48(r1)
/* 0000C7DC 801F04E0 */ lwz r0, 0x4e0(r31)
/* 0000C7E0 9001004C */ stw r0, 0x4c(r1)
/* 0000C7E4 C89F04B0 */ lfd f4, 0x4b0(r31)
/* 0000C7E8 C0380124 */ lfs f1, 0x124(r24)
/* 0000C7EC C01E0000 */ lfs f0, 0(r30)
/* 0000C7F0 FF6400F2 */ fmul f27, f4, f3
/* 0000C7F4 EC010028 */ fsubs f0, f1, f0
/* 0000C7F8 FF8400B2 */ fmul f28, f4, f2
/* 0000C7FC D0010050 */ stfs f0, 0x50(r1)
/* 0000C800 FF60D818 */ frsp f27, f27
/* 0000C804 C01F03E8 */ lfs f0, 0x3e8(r31)
/* 0000C808 FF80E018 */ frsp f28, f28
/* 0000C80C D0010054 */ stfs f0, 0x54(r1)
/* 0000C810 C038012C */ lfs f1, 0x12c(r24)
/* 0000C814 C01E0008 */ lfs f0, 8(r30)
/* 0000C818 EC010028 */ fsubs f0, f1, f0
/* 0000C81C D0010058 */ stfs f0, 0x58(r1)
/* 0000C820 C0410050 */ lfs f2, 0x50(r1)
/* 0000C824 C0210054 */ lfs f1, 0x54(r1)
/* 0000C828 C0010058 */ lfs f0, 0x58(r1)
/* 0000C82C EC4200B2 */ fmuls f2, f2, f2
/* 0000C830 EC41107A */ fmadds f2, f1, f1, f2
/* 0000C834 EC40103A */ fmadds f2, f0, f0, f2
/* 0000C838 C01F0458 */ lfs f0, 0x458(r31)
/* 0000C83C FC201090 */ fmr f1, f2
/* 0000C840 FC010040 */ fcmpo cr0, f1, f0
/* 0000C844 40810048 */ ble lbl_0000C88C
/* 0000C848 4BFF3919 */ bl mathutil_rsqrt
/* 0000C84C FC00E050 */ fneg f0, f28
/* 0000C850 C0610050 */ lfs f3, 0x50(r1)
/* 0000C854 EC9B0072 */ fmuls f4, f27, f1
/* 0000C858 C0410044 */ lfs f2, 0x44(r1)
/* 0000C85C EC200072 */ fmuls f1, f0, f1
/* 0000C860 EC630132 */ fmuls f3, f3, f4
/* 0000C864 EC020072 */ fmuls f0, f2, f1
/* 0000C868 D0610050 */ stfs f3, 0x50(r1)
/* 0000C86C D0010044 */ stfs f0, 0x44(r1)
/* 0000C870 C0410058 */ lfs f2, 0x58(r1)
/* 0000C874 C001004C */ lfs f0, 0x4c(r1)
/* 0000C878 EC420132 */ fmuls f2, f2, f4
/* 0000C87C EC000072 */ fmuls f0, f0, f1
/* 0000C880 D0410058 */ stfs f2, 0x58(r1)
/* 0000C884 D001004C */ stfs f0, 0x4c(r1)
/* 0000C888 48000020 */ b lbl_0000C8A8
lbl_0000C88C:
/* 0000C88C C03F03E8 */ lfs f1, 0x3e8(r31)
/* 0000C890 FC00E050 */ fneg f0, f28
/* 0000C894 D0210050 */ stfs f1, 0x50(r1)
/* 0000C898 D3610058 */ stfs f27, 0x58(r1)
/* 0000C89C C03F03E8 */ lfs f1, 0x3e8(r31)
/* 0000C8A0 D0210044 */ stfs f1, 0x44(r1)
/* 0000C8A4 D001004C */ stfs f0, 0x4c(r1)
lbl_0000C8A8:
/* 0000C8A8 38780000 */ addi r3, r24, 0
/* 0000C8AC 38810050 */ addi r4, r1, 0x50
/* 0000C8B0 48000C25 */ bl lbl_0000D4D4
/* 0000C8B4 C0210044 */ lfs f1, 0x44(r1)
/* 0000C8B8 C01E0000 */ lfs f0, 0(r30)
/* 0000C8BC EC01002A */ fadds f0, f1, f0
/* 0000C8C0 D01E0000 */ stfs f0, 0(r30)
/* 0000C8C4 C0210048 */ lfs f1, 0x48(r1)
/* 0000C8C8 C01E0004 */ lfs f0, 4(r30)
/* 0000C8CC EC01002A */ fadds f0, f1, f0
/* 0000C8D0 D01E0004 */ stfs f0, 4(r30)
/* 0000C8D4 C021004C */ lfs f1, 0x4c(r1)
/* 0000C8D8 C01E0008 */ lfs f0, 8(r30)
/* 0000C8DC EC01002A */ fadds f0, f1, f0
/* 0000C8E0 D01E0008 */ stfs f0, 8(r30)
/* 0000C8E4 C02100BC */ lfs f1, 0xbc(r1)
/* 0000C8E8 C04100C0 */ lfs f2, 0xc0(r1)
/* 0000C8EC C00100C4 */ lfs f0, 0xc4(r1)
/* 0000C8F0 EC210072 */ fmuls f1, f1, f1
/* 0000C8F4 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000C8F8 EC20083A */ fmadds f1, f0, f0, f1
/* 0000C8FC 4BFF3865 */ bl mathutil_sqrt
/* 0000C900 C81F0498 */ lfd f0, 0x498(r31)
/* 0000C904 FC010040 */ fcmpo cr0, f1, f0
/* 0000C908 40810178 */ ble lbl_0000CA80
/* 0000C90C 807F04E4 */ lwz r3, 0x4e4(r31)
/* 0000C910 801F04E8 */ lwz r0, 0x4e8(r31)
/* 0000C914 90610038 */ stw r3, 0x38(r1)
/* 0000C918 9001003C */ stw r0, 0x3c(r1)
/* 0000C91C 801F04EC */ lwz r0, 0x4ec(r31)
/* 0000C920 90010040 */ stw r0, 0x40(r1)
/* 0000C924 807F04F0 */ lwz r3, 0x4f0(r31)
/* 0000C928 801F04F4 */ lwz r0, 0x4f4(r31)
/* 0000C92C 9061002C */ stw r3, 0x2c(r1)
/* 0000C930 90010030 */ stw r0, 0x30(r1)
/* 0000C934 801F04F8 */ lwz r0, 0x4f8(r31)
/* 0000C938 90010034 */ stw r0, 0x34(r1)
/* 0000C93C C85F0518 */ lfd f2, 0x518(r31)
/* 0000C940 C81F03C0 */ lfd f0, 0x3c0(r31)
/* 0000C944 FC220072 */ fmul f1, f2, f1
/* 0000C948 FC010040 */ fcmpo cr0, f1, f0
/* 0000C94C 40800008 */ bge lbl_0000C954
/* 0000C950 48000008 */ b lbl_0000C958
lbl_0000C954:
/* 0000C954 FC200090 */ fmr f1, f0
lbl_0000C958:
/* 0000C958 FF600818 */ frsp f27, f1
/* 0000C95C C05F0478 */ lfs f2, 0x478(r31)
/* 0000C960 C01F0480 */ lfs f0, 0x480(r31)
/* 0000C964 38610038 */ addi r3, r1, 0x38
/* 0000C968 C03F047C */ lfs f1, 0x47c(r31)
/* 0000C96C EC4206F2 */ fmuls f2, f2, f27
/* 0000C970 EC0006F2 */ fmuls f0, f0, f27
/* 0000C974 EC220828 */ fsubs f1, f2, f1
/* 0000C978 FC00001E */ fctiwz f0, f0
/* 0000C97C FC20081E */ fctiwz f1, f1
/* 0000C980 D8010108 */ stfd f0, 0x108(r1)
/* 0000C984 8341010C */ lwz r26, 0x10c(r1)
/* 0000C988 D8210110 */ stfd f1, 0x110(r1)
/* 0000C98C 7F400774 */ extsb r0, r26
/* 0000C990 5400103A */ slwi r0, r0, 2
/* 0000C994 80810114 */ lwz r4, 0x114(r1)
/* 0000C998 7C03002E */ lwzx r0, r3, r0
/* 0000C99C 54835BA8 */ rlwinm r3, r4, 0xb, 0xe, 0x14
/* 0000C9A0 7C630378 */ or r3, r3, r0
/* 0000C9A4 4BFF37BD */ bl u_play_sound_1_dupe
/* 0000C9A8 3AE30000 */ addi r23, r3, 0
/* 0000C9AC 2C17FFFF */ cmpwi r23, -1
/* 0000C9B0 4182005C */ beq lbl_0000CA0C
/* 0000C9B4 4BFF37AD */ bl rand
/* 0000C9B8 5464053E */ clrlwi r4, r3, 0x14
/* 0000C9BC 56E3043E */ clrlwi r3, r23, 0x10
/* 0000C9C0 38841800 */ addi r4, r4, 0x1800
/* 0000C9C4 4BFF379D */ bl SoundDop
/* 0000C9C8 3C600000 */ lis r3, modeCtrl@ha
/* 0000C9CC 38630000 */ addi r3, r3, modeCtrl@l
/* 0000C9D0 8003002C */ lwz r0, 0x2c(r3)
/* 0000C9D4 3C600000 */ lis r3, cameraInfo@ha
/* 0000C9D8 38630000 */ addi r3, r3, cameraInfo@l
/* 0000C9DC 1C000284 */ mulli r0, r0, 0x284
/* 0000C9E0 7C630214 */ add r3, r3, r0
/* 0000C9E4 A8A3001A */ lha r5, 0x1a(r3)
/* 0000C9E8 38780124 */ addi r3, r24, 0x124
/* 0000C9EC 389F03B0 */ addi r4, r31, 0x3b0
/* 0000C9F0 38C10029 */ addi r6, r1, 0x29
/* 0000C9F4 38E10028 */ addi r7, r1, 0x28
/* 0000C9F8 48000E01 */ bl lbl_0000D7F8
/* 0000C9FC 88810029 */ lbz r4, 0x29(r1)
/* 0000CA00 56E3043E */ clrlwi r3, r23, 0x10
/* 0000CA04 88A10028 */ lbz r5, 0x28(r1)
/* 0000CA08 4BFF3759 */ bl SoundPan
lbl_0000CA0C:
/* 0000CA0C 7F400774 */ extsb r0, r26
/* 0000CA10 5400103A */ slwi r0, r0, 2
/* 0000CA14 3861002C */ addi r3, r1, 0x2c
/* 0000CA18 7C63002E */ lwzx r3, r3, r0
/* 0000CA1C 4BFF3745 */ bl u_play_sound_0
/* 0000CA20 C05F0520 */ lfs f2, 0x520(r31)
/* 0000CA24 C03F0524 */ lfs f1, 0x524(r31)
/* 0000CA28 EC0206F2 */ fmuls f0, f2, f27
/* 0000CA2C FC000840 */ fcmpo cr0, f0, f1
/* 0000CA30 40800008 */ bge lbl_0000CA38
/* 0000CA34 48000018 */ b lbl_0000CA4C
lbl_0000CA38:
/* 0000CA38 FC001040 */ fcmpo cr0, f0, f2
/* 0000CA3C 40810008 */ ble lbl_0000CA44
/* 0000CA40 48000008 */ b lbl_0000CA48
lbl_0000CA44:
/* 0000CA44 FC400090 */ fmr f2, f0
lbl_0000CA48:
/* 0000CA48 FC201090 */ fmr f1, f2
lbl_0000CA4C:
/* 0000CA4C 3C600000 */ lis r3, modeCtrl@ha
/* 0000CA50 FC00081E */ fctiwz f0, f1
/* 0000CA54 38630000 */ addi r3, r3, modeCtrl@l
/* 0000CA58 8003002C */ lwz r0, 0x2c(r3)
/* 0000CA5C 3C600000 */ lis r3, playerControllerIDs@ha
/* 0000CA60 D8010108 */ stfd f0, 0x108(r1)
/* 0000CA64 5404103A */ slwi r4, r0, 2
/* 0000CA68 38030000 */ addi r0, r3, playerControllerIDs@l
/* 0000CA6C 80A1010C */ lwz r5, 0x10c(r1)
/* 0000CA70 7C602214 */ add r3, r0, r4
/* 0000CA74 80630000 */ lwz r3, 0(r3)
/* 0000CA78 38800001 */ li r4, 1
/* 0000CA7C 4BFF36E5 */ bl vibration_control
lbl_0000CA80:
/* 0000CA80 BA61011C */ lmw r19, 0x11c(r1)
/* 0000CA84 8001017C */ lwz r0, 0x17c(r1)
/* 0000CA88 CBE10170 */ lfd f31, 0x170(r1)
/* 0000CA8C CBC10168 */ lfd f30, 0x168(r1)
/* 0000CA90 7C0803A6 */ mtlr r0
/* 0000CA94 CBA10160 */ lfd f29, 0x160(r1)
/* 0000CA98 CB810158 */ lfd f28, 0x158(r1)
/* 0000CA9C CB610150 */ lfd f27, 0x150(r1)
/* 0000CAA0 38210178 */ addi r1, r1, 0x178
/* 0000CAA4 4E800020 */ blr 
