/* 0000E4D4 7C0802A6 */ mflr r0
/* 0000E4D8 3CA00000 */ lis r5, lbl_10017664@ha
/* 0000E4DC 90010004 */ stw r0, 4(r1)
/* 0000E4E0 3C600000 */ lis r3, commonGma@ha
/* 0000E4E4 3CC00000 */ lis r6, lbl_0001C238@ha
/* 0000E4E8 9421FF28 */ stwu r1, -0xd8(r1)
/* 0000E4EC 38A50000 */ addi r5, r5, lbl_10017664@l
/* 0000E4F0 DBE100D0 */ stfd f31, 0xd0(r1)
/* 0000E4F4 BEC100A8 */ stmw r22, 0xa8(r1)
/* 0000E4F8 3B860000 */ addi r28, r6, lbl_0001C238@l
/* 0000E4FC 3B610020 */ addi r27, r1, 0x20
/* 0000E500 3B410068 */ addi r26, r1, 0x68
/* 0000E504 3AE50068 */ addi r23, r5, 0x68
/* 0000E508 80830000 */ lwz r4, commonGma@l(r3)
/* 0000E50C 3C600000 */ lis r3, g_poolInfo@ha
/* 0000E510 38630000 */ addi r3, r3, g_poolInfo@l
/* 0000E514 80840008 */ lwz r4, 8(r4)
/* 0000E518 3B23000C */ addi r25, r3, 0xc
/* 0000E51C 3B030008 */ addi r24, r3, 8
/* 0000E520 80040270 */ lwz r0, 0x270(r4)
/* 0000E524 3C800000 */ lis r4, ballInfo@ha
/* 0000E528 9001003C */ stw r0, 0x3c(r1)
/* 0000E52C 38040000 */ addi r0, r4, ballInfo@l
/* 0000E530 7C160378 */ mr r22, r0
/* 0000E534 C01C00A8 */ lfs f0, 0xa8(r28)
/* 0000E538 D0010034 */ stfs f0, 0x34(r1)
/* 0000E53C C01C00AC */ lfs f0, 0xac(r28)
/* 0000E540 D0010038 */ stfs f0, 0x38(r1)
/* 0000E544 83E3000C */ lwz r31, 0xc(r3)
/* 0000E548 83C30008 */ lwz r30, 8(r3)
/* 0000E54C 48000104 */ b lbl_0000E650
lbl_0000E550:
/* 0000E550 83B70024 */ lwz r29, 0x24(r23)
/* 0000E554 281D0000 */ cmplwi r29, 0
/* 0000E558 418200E8 */ beq lbl_0000E640
/* 0000E55C 881F0000 */ lbz r0, 0(r31)
/* 0000E560 7C000775 */ extsb. r0, r0
/* 0000E564 418200DC */ beq lbl_0000E640
/* 0000E568 80160094 */ lwz r0, 0x94(r22)
/* 0000E56C 540006F7 */ rlwinm. r0, r0, 0, 0x1b, 0x1b
/* 0000E570 408200D0 */ bne lbl_0000E640
/* 0000E574 387D001C */ addi r3, r29, 0x1c
/* 0000E578 38810058 */ addi r4, r1, 0x58
/* 0000E57C 38A1004C */ addi r5, r1, 0x4c
/* 0000E580 4BFF1BE5 */ bl raycast_stage_down
/* 0000E584 2C030000 */ cmpwi r3, 0
/* 0000E588 418200B8 */ beq lbl_0000E640
/* 0000E58C C03D005C */ lfs f1, 0x5c(r29)
/* 0000E590 C0010060 */ lfs f0, 0x60(r1)
/* 0000E594 C05C0004 */ lfs f2, 4(r28)
/* 0000E598 EC210028 */ fsubs f1, f1, f0
/* 0000E59C C01C0000 */ lfs f0, 0(r28)
/* 0000E5A0 EFE20072 */ fmuls f31, f2, f1
/* 0000E5A4 FC1F0040 */ fcmpo cr0, f31, f0
/* 0000E5A8 40800098 */ bge lbl_0000E640
/* 0000E5AC 387A0000 */ addi r3, r26, 0
/* 0000E5B0 389B0000 */ addi r4, r27, 0
/* 0000E5B4 4BFF1BB1 */ bl mathutil_vec_to_euler
/* 0000E5B8 8001005C */ lwz r0, 0x5c(r1)
/* 0000E5BC 38610014 */ addi r3, r1, 0x14
/* 0000E5C0 80810060 */ lwz r4, 0x60(r1)
/* 0000E5C4 90010014 */ stw r0, 0x14(r1)
/* 0000E5C8 80010064 */ lwz r0, 0x64(r1)
/* 0000E5CC 90810018 */ stw r4, 0x18(r1)
/* 0000E5D0 9001001C */ stw r0, 0x1c(r1)
/* 0000E5D4 C01C00B0 */ lfs f0, 0xb0(r28)
/* 0000E5D8 C03D0034 */ lfs f1, 0x34(r29)
/* 0000E5DC EC00F82A */ fadds f0, f0, f31
/* 0000E5E0 EC010032 */ fmuls f0, f1, f0
/* 0000E5E4 D0010028 */ stfs f0, 0x28(r1)
/* 0000E5E8 C0010028 */ lfs f0, 0x28(r1)
/* 0000E5EC D001002C */ stfs f0, 0x2c(r1)
/* 0000E5F0 C0010028 */ lfs f0, 0x28(r1)
/* 0000E5F4 D0010030 */ stfs f0, 0x30(r1)
/* 0000E5F8 C03C0000 */ lfs f1, 0(r28)
/* 0000E5FC C01C00B4 */ lfs f0, 0xb4(r28)
/* 0000E600 EC21F828 */ fsubs f1, f1, f31
/* 0000E604 EC000072 */ fmuls f0, f0, f1
/* 0000E608 FC00001E */ fctiwz f0, f0
/* 0000E60C D80100A0 */ stfd f0, 0xa0(r1)
/* 0000E610 800100A4 */ lwz r0, 0xa4(r1)
/* 0000E614 98010040 */ stb r0, 0x40(r1)
/* 0000E618 C01C0090 */ lfs f0, 0x90(r28)
/* 0000E61C EC000072 */ fmuls f0, f0, f1
/* 0000E620 FC00001E */ fctiwz f0, f0
/* 0000E624 D8010098 */ stfd f0, 0x98(r1)
/* 0000E628 D8010090 */ stfd f0, 0x90(r1)
/* 0000E62C 8081009C */ lwz r4, 0x9c(r1)
/* 0000E630 80010094 */ lwz r0, 0x94(r1)
/* 0000E634 98810041 */ stb r4, 0x41(r1)
/* 0000E638 98010042 */ stb r0, 0x42(r1)
/* 0000E63C 4BFF1B29 */ bl set_poly_shadow
lbl_0000E640:
/* 0000E640 3BDEFFFF */ addi r30, r30, -1
/* 0000E644 3BFF0001 */ addi r31, r31, 1
/* 0000E648 3AF701B4 */ addi r23, r23, 0x1b4
/* 0000E64C 3AD601A4 */ addi r22, r22, 0x1a4
lbl_0000E650:
/* 0000E650 2C1E0000 */ cmpwi r30, 0
/* 0000E654 4181FEFC */ bgt lbl_0000E550
/* 0000E658 3C600000 */ lis r3, commonGma@ha
/* 0000E65C 80A30000 */ lwz r5, commonGma@l(r3)
/* 0000E660 3C800000 */ lis r4, lbl_10000118@ha
/* 0000E664 38040000 */ addi r0, r4, lbl_10000118@l
/* 0000E668 80A50008 */ lwz r5, 8(r5)
/* 0000E66C 3C600000 */ lis r3, g_poolInfo@ha
/* 0000E670 38630000 */ addi r3, r3, g_poolInfo@l
/* 0000E674 80850270 */ lwz r4, 0x270(r5)
/* 0000E678 7C160378 */ mr r22, r0
/* 0000E67C 3EE04330 */ lis r23, 0x4330
/* 0000E680 9081003C */ stw r4, 0x3c(r1)
/* 0000E684 C01C00A8 */ lfs f0, 0xa8(r28)
/* 0000E688 D0010034 */ stfs f0, 0x34(r1)
/* 0000E68C C01C00AC */ lfs f0, 0xac(r28)
/* 0000E690 D0010038 */ stfs f0, 0x38(r1)
/* 0000E694 83A30028 */ lwz r29, 0x28(r3)
/* 0000E698 48000148 */ b lbl_0000E7E0
lbl_0000E69C:
/* 0000E69C 83D60000 */ lwz r30, 0(r22)
/* 0000E6A0 281E0000 */ cmplwi r30, 0
/* 0000E6A4 41820134 */ beq lbl_0000E7D8
/* 0000E6A8 C03E0020 */ lfs f1, 0x20(r30)
/* 0000E6AC C01C000C */ lfs f0, 0xc(r28)
/* 0000E6B0 FC010040 */ fcmpo cr0, f1, f0
/* 0000E6B4 41800124 */ blt lbl_0000E7D8
/* 0000E6B8 C01E001C */ lfs f0, 0x1c(r30)
/* 0000E6BC 38610008 */ addi r3, r1, 8
/* 0000E6C0 38810058 */ addi r4, r1, 0x58
/* 0000E6C4 D0010008 */ stfs f0, 8(r1)
/* 0000E6C8 38A1004C */ addi r5, r1, 0x4c
/* 0000E6CC C01C0000 */ lfs f0, 0(r28)
/* 0000E6D0 D001000C */ stfs f0, 0xc(r1)
/* 0000E6D4 C01E0024 */ lfs f0, 0x24(r30)
/* 0000E6D8 D0010010 */ stfs f0, 0x10(r1)
/* 0000E6DC 4BFF1A89 */ bl raycast_stage_down
/* 0000E6E0 2C030000 */ cmpwi r3, 0
/* 0000E6E4 418200F4 */ beq lbl_0000E7D8
/* 0000E6E8 C03E005C */ lfs f1, 0x5c(r30)
/* 0000E6EC C0010060 */ lfs f0, 0x60(r1)
/* 0000E6F0 C05C006C */ lfs f2, 0x6c(r28)
/* 0000E6F4 EC210028 */ fsubs f1, f1, f0
/* 0000E6F8 C01C0000 */ lfs f0, 0(r28)
/* 0000E6FC EFE20072 */ fmuls f31, f2, f1
/* 0000E700 FC1F0040 */ fcmpo cr0, f31, f0
/* 0000E704 408000D4 */ bge lbl_0000E7D8
/* 0000E708 387A0000 */ addi r3, r26, 0
/* 0000E70C 389B0000 */ addi r4, r27, 0
/* 0000E710 4BFF1A55 */ bl mathutil_vec_to_euler
/* 0000E714 8001005C */ lwz r0, 0x5c(r1)
/* 0000E718 3C800000 */ lis r4, lbl_0001C270@ha
/* 0000E71C 80A10060 */ lwz r5, 0x60(r1)
/* 0000E720 38610014 */ addi r3, r1, 0x14
/* 0000E724 90010014 */ stw r0, 0x14(r1)
/* 0000E728 80010064 */ lwz r0, 0x64(r1)
/* 0000E72C 90A10018 */ stw r5, 0x18(r1)
/* 0000E730 9001001C */ stw r0, 0x1c(r1)
/* 0000E734 C01C00B8 */ lfs f0, 0xb8(r28)
/* 0000E738 C03C0020 */ lfs f1, 0x20(r28)
/* 0000E73C EC0007F2 */ fmuls f0, f0, f31
/* 0000E740 C05E0034 */ lfs f2, 0x34(r30)
/* 0000E744 EC01002A */ fadds f0, f1, f0
/* 0000E748 EC020032 */ fmuls f0, f2, f0
/* 0000E74C D0010028 */ stfs f0, 0x28(r1)
/* 0000E750 C0010028 */ lfs f0, 0x28(r1)
/* 0000E754 D001002C */ stfs f0, 0x2c(r1)
/* 0000E758 C0010028 */ lfs f0, 0x28(r1)
/* 0000E75C D0010030 */ stfs f0, 0x30(r1)
/* 0000E760 801600B4 */ lwz r0, 0xb4(r22)
/* 0000E764 C01C0000 */ lfs f0, 0(r28)
/* 0000E768 6C008000 */ xoris r0, r0, 0x8000
/* 0000E76C C8840000 */ lfd f4, lbl_0001C270@l(r4)
/* 0000E770 90010094 */ stw r0, 0x94(r1)
/* 0000E774 EC00F828 */ fsubs f0, f0, f31
/* 0000E778 C0360090 */ lfs f1, 0x90(r22)
/* 0000E77C 92E10090 */ stw r23, 0x90(r1)
/* 0000E780 EC210032 */ fmuls f1, f1, f0
/* 0000E784 C05C00BC */ lfs f2, 0xbc(r28)
/* 0000E788 C8610090 */ lfd f3, 0x90(r1)
/* 0000E78C C01C00C0 */ lfs f0, 0xc0(r28)
/* 0000E790 EC632028 */ fsubs f3, f3, f4
/* 0000E794 EC431024 */ fdivs f2, f3, f2
/* 0000E798 EC220072 */ fmuls f1, f2, f1
/* 0000E79C EC000072 */ fmuls f0, f0, f1
/* 0000E7A0 FC00001E */ fctiwz f0, f0
/* 0000E7A4 D8010098 */ stfd f0, 0x98(r1)
/* 0000E7A8 8001009C */ lwz r0, 0x9c(r1)
/* 0000E7AC D8010088 */ stfd f0, 0x88(r1)
/* 0000E7B0 98010040 */ stb r0, 0x40(r1)
/* 0000E7B4 8001008C */ lwz r0, 0x8c(r1)
/* 0000E7B8 C01C0090 */ lfs f0, 0x90(r28)
/* 0000E7BC EC000072 */ fmuls f0, f0, f1
/* 0000E7C0 FC00001E */ fctiwz f0, f0
/* 0000E7C4 D80100A0 */ stfd f0, 0xa0(r1)
/* 0000E7C8 808100A4 */ lwz r4, 0xa4(r1)
/* 0000E7CC 98810041 */ stb r4, 0x41(r1)
/* 0000E7D0 98010042 */ stb r0, 0x42(r1)
/* 0000E7D4 4BFF1991 */ bl set_poly_shadow
lbl_0000E7D8:
/* 0000E7D8 3BBDFFFF */ addi r29, r29, -1
/* 0000E7DC 3AD602E8 */ addi r22, r22, 0x2e8
lbl_0000E7E0:
/* 0000E7E0 2C1D0000 */ cmpwi r29, 0
/* 0000E7E4 4181FEB8 */ bgt lbl_0000E69C
/* 0000E7E8 3C600000 */ lis r3, backgroundInfo@ha
/* 0000E7EC A8030000 */ lha r0, backgroundInfo@l(r3)
/* 0000E7F0 2C000011 */ cmpwi r0, 0x11
/* 0000E7F4 408201CC */ bne lbl_0000E9C0
/* 0000E7F8 3C600000 */ lis r3, minigameGma@ha
/* 0000E7FC 80830000 */ lwz r4, minigameGma@l(r3)
/* 0000E800 3C600000 */ lis r3, ballInfo@ha
/* 0000E804 3BA30000 */ addi r29, r3, ballInfo@l
/* 0000E808 80840008 */ lwz r4, 8(r4)
/* 0000E80C 3C600000 */ lis r3, lbl_0001DB4C@ha
/* 0000E810 3ADD0000 */ addi r22, r29, 0
/* 0000E814 80040528 */ lwz r0, 0x528(r4)
/* 0000E818 3BC30000 */ addi r30, r3, lbl_0001DB4C@l
/* 0000E81C 3FE04330 */ lis r31, 0x4330
/* 0000E820 9001003C */ stw r0, 0x3c(r1)
/* 0000E824 C01C00A8 */ lfs f0, 0xa8(r28)
/* 0000E828 D0010034 */ stfs f0, 0x34(r1)
/* 0000E82C C01C00AC */ lfs f0, 0xac(r28)
/* 0000E830 D0010038 */ stfs f0, 0x38(r1)
/* 0000E834 83390000 */ lwz r25, 0(r25)
/* 0000E838 83180000 */ lwz r24, 0(r24)
/* 0000E83C 4800017C */ b lbl_0000E9B8
lbl_0000E840:
/* 0000E840 88190000 */ lbz r0, 0(r25)
/* 0000E844 7C000775 */ extsb. r0, r0
/* 0000E848 41820164 */ beq lbl_0000E9AC
/* 0000E84C 80160094 */ lwz r0, 0x94(r22)
/* 0000E850 540006F7 */ rlwinm. r0, r0, 0, 0x1b, 0x1b
/* 0000E854 40820158 */ bne lbl_0000E9AC
/* 0000E858 38760004 */ addi r3, r22, 4
/* 0000E85C 38810058 */ addi r4, r1, 0x58
/* 0000E860 38A1004C */ addi r5, r1, 0x4c
/* 0000E864 4BFF1901 */ bl raycast_stage_down
/* 0000E868 2C030000 */ cmpwi r3, 0
/* 0000E86C 41820140 */ beq lbl_0000E9AC
/* 0000E870 C0360008 */ lfs f1, 8(r22)
/* 0000E874 C0010060 */ lfs f0, 0x60(r1)
/* 0000E878 C05C00C4 */ lfs f2, 0xc4(r28)
/* 0000E87C EC210028 */ fsubs f1, f1, f0
/* 0000E880 C01C0000 */ lfs f0, 0(r28)
/* 0000E884 EFE20072 */ fmuls f31, f2, f1
/* 0000E888 FC1F0040 */ fcmpo cr0, f31, f0
/* 0000E88C 40800120 */ bge lbl_0000E9AC
/* 0000E890 387A0000 */ addi r3, r26, 0
/* 0000E894 389B0000 */ addi r4, r27, 0
/* 0000E898 4BFF18CD */ bl mathutil_vec_to_euler
/* 0000E89C 8001005C */ lwz r0, 0x5c(r1)
/* 0000E8A0 3CC00000 */ lis r6, lbl_0001C2D8@ha
/* 0000E8A4 80610060 */ lwz r3, 0x60(r1)
/* 0000E8A8 3CA00000 */ lis r5, lbl_0001C2D8@ha
/* 0000E8AC 90010014 */ stw r0, 0x14(r1)
/* 0000E8B0 80010064 */ lwz r0, 0x64(r1)
/* 0000E8B4 3C800000 */ lis r4, lbl_0001C2D8@ha
/* 0000E8B8 90610018 */ stw r3, 0x18(r1)
/* 0000E8BC 38610014 */ addi r3, r1, 0x14
/* 0000E8C0 9001001C */ stw r0, 0x1c(r1)
/* 0000E8C4 C01C00B0 */ lfs f0, 0xb0(r28)
/* 0000E8C8 C03D0068 */ lfs f1, 0x68(r29)
/* 0000E8CC EC00F82A */ fadds f0, f0, f31
/* 0000E8D0 EC010032 */ fmuls f0, f1, f0
/* 0000E8D4 D0010028 */ stfs f0, 0x28(r1)
/* 0000E8D8 C0010028 */ lfs f0, 0x28(r1)
/* 0000E8DC D001002C */ stfs f0, 0x2c(r1)
/* 0000E8E0 C0010028 */ lfs f0, 0x28(r1)
/* 0000E8E4 D0010030 */ stfs f0, 0x30(r1)
/* 0000E8E8 8816014A */ lbz r0, 0x14a(r22)
/* 0000E8EC C01C0000 */ lfs f0, 0(r28)
/* 0000E8F0 5400103A */ slwi r0, r0, 2
/* 0000E8F4 C03C0084 */ lfs f1, 0x84(r28)
/* 0000E8F8 7CFE0214 */ add r7, r30, r0
/* 0000E8FC EC00F828 */ fsubs f0, f0, f31
/* 0000E900 80070000 */ lwz r0, 0(r7)
/* 0000E904 90010040 */ stw r0, 0x40(r1)
/* 0000E908 EC610032 */ fmuls f3, f1, f0
/* 0000E90C 88010040 */ lbz r0, 0x40(r1)
/* 0000E910 C8260000 */ lfd f1, lbl_0001C2D8@l(r6)
/* 0000E914 9001008C */ stw r0, 0x8c(r1)
/* 0000E918 C05C00C8 */ lfs f2, 0xc8(r28)
/* 0000E91C 93E10088 */ stw r31, 0x88(r1)
/* 0000E920 C8010088 */ lfd f0, 0x88(r1)
/* 0000E924 EC000828 */ fsubs f0, f0, f1
/* 0000E928 EC02002A */ fadds f0, f2, f0
/* 0000E92C EC0000F2 */ fmuls f0, f0, f3
/* 0000E930 FC00001E */ fctiwz f0, f0
/* 0000E934 D8010090 */ stfd f0, 0x90(r1)
/* 0000E938 80010094 */ lwz r0, 0x94(r1)
/* 0000E93C 98010040 */ stb r0, 0x40(r1)
/* 0000E940 88010041 */ lbz r0, 0x41(r1)
/* 0000E944 C8250000 */ lfd f1, lbl_0001C2D8@l(r5)
/* 0000E948 9001009C */ stw r0, 0x9c(r1)
/* 0000E94C C05C00C8 */ lfs f2, 0xc8(r28)
/* 0000E950 93E10098 */ stw r31, 0x98(r1)
/* 0000E954 C8010098 */ lfd f0, 0x98(r1)
/* 0000E958 EC000828 */ fsubs f0, f0, f1
/* 0000E95C EC02002A */ fadds f0, f2, f0
/* 0000E960 EC0000F2 */ fmuls f0, f0, f3
/* 0000E964 FC00001E */ fctiwz f0, f0
/* 0000E968 D80100A0 */ stfd f0, 0xa0(r1)
/* 0000E96C 800100A4 */ lwz r0, 0xa4(r1)
/* 0000E970 98010041 */ stb r0, 0x41(r1)
/* 0000E974 88010042 */ lbz r0, 0x42(r1)
/* 0000E978 C8240000 */ lfd f1, lbl_0001C2D8@l(r4)
/* 0000E97C 90010084 */ stw r0, 0x84(r1)
/* 0000E980 C05C00C8 */ lfs f2, 0xc8(r28)
/* 0000E984 93E10080 */ stw r31, 0x80(r1)
/* 0000E988 C8010080 */ lfd f0, 0x80(r1)
/* 0000E98C EC000828 */ fsubs f0, f0, f1
/* 0000E990 EC02002A */ fadds f0, f2, f0
/* 0000E994 EC0000F2 */ fmuls f0, f0, f3
/* 0000E998 FC00001E */ fctiwz f0, f0
/* 0000E99C D8010078 */ stfd f0, 0x78(r1)
/* 0000E9A0 8001007C */ lwz r0, 0x7c(r1)
/* 0000E9A4 98010042 */ stb r0, 0x42(r1)
/* 0000E9A8 4BFF17BD */ bl set_poly_shadow
lbl_0000E9AC:
/* 0000E9AC 3B18FFFF */ addi r24, r24, -1
/* 0000E9B0 3B390001 */ addi r25, r25, 1
/* 0000E9B4 3AD601A4 */ addi r22, r22, 0x1a4
lbl_0000E9B8:
/* 0000E9B8 2C180000 */ cmpwi r24, 0
/* 0000E9BC 4181FE84 */ bgt lbl_0000E840
lbl_0000E9C0:
/* 0000E9C0 BAC100A8 */ lmw r22, 0xa8(r1)
/* 0000E9C4 800100DC */ lwz r0, 0xdc(r1)
/* 0000E9C8 CBE100D0 */ lfd f31, 0xd0(r1)
/* 0000E9CC 382100D8 */ addi r1, r1, 0xd8
/* 0000E9D0 7C0803A6 */ mtlr r0
/* 0000E9D4 4E800020 */ blr 
