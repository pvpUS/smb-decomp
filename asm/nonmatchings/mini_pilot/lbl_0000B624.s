/* 0000B624 7C0802A6 */ mflr r0
/* 0000B628 3CC00000 */ lis r6, lbl_0000C690@ha
/* 0000B62C 90010004 */ stw r0, 4(r1)
/* 0000B630 9421FF68 */ stwu r1, -0x98(r1)
/* 0000B634 DBE10090 */ stfd f31, 0x90(r1)
/* 0000B638 BEA10064 */ stmw r21, 0x64(r1)
/* 0000B63C 3BA60000 */ addi r29, r6, lbl_0000C690@l
/* 0000B640 7CBA2B78 */ mr r26, r5
/* 0000B644 3B030000 */ addi r24, r3, 0
/* 0000B648 3B240000 */ addi r25, r4, 0
/* 0000B64C 3B7A000C */ addi r27, r26, 0xc
/* 0000B650 38610030 */ addi r3, r1, 0x30
/* 0000B654 80DD005C */ lwz r6, 0x5c(r29)
/* 0000B658 801D0060 */ lwz r0, 0x60(r29)
/* 0000B65C 90C1003C */ stw r6, 0x3c(r1)
/* 0000B660 90010040 */ stw r0, 0x40(r1)
/* 0000B664 801D0064 */ lwz r0, 0x64(r29)
/* 0000B668 90010044 */ stw r0, 0x44(r1)
/* 0000B66C 80840000 */ lwz r4, 0(r4)
/* 0000B670 80190004 */ lwz r0, 4(r25)
/* 0000B674 90810030 */ stw r4, 0x30(r1)
/* 0000B678 90010034 */ stw r0, 0x34(r1)
/* 0000B67C 80190008 */ lwz r0, 8(r25)
/* 0000B680 90010038 */ stw r0, 0x38(r1)
/* 0000B684 4BFF4AC9 */ bl mathutil_vec_normalize_len
/* 0000B688 38610020 */ addi r3, r1, 0x20
/* 0000B68C 3881003C */ addi r4, r1, 0x3c
/* 0000B690 38A10030 */ addi r5, r1, 0x30
/* 0000B694 4BFF4AB9 */ bl mathutil_quat_from_dirs
/* 0000B698 38610020 */ addi r3, r1, 0x20
/* 0000B69C 4BFF4AB1 */ bl mathutil_mtxA_from_quat
/* 0000B6A0 4BFF4AAD */ bl mathutil_mtxA_normalize_basis
/* 0000B6A4 C0390000 */ lfs f1, 0(r25)
/* 0000B6A8 C0590004 */ lfs f2, 4(r25)
/* 0000B6AC C0190008 */ lfs f0, 8(r25)
/* 0000B6B0 EC210072 */ fmuls f1, f1, f1
/* 0000B6B4 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000B6B8 EC20083A */ fmadds f1, f0, f0, f1
/* 0000B6BC 4BFF4A91 */ bl mathutil_sqrt
/* 0000B6C0 C05D0068 */ lfs f2, 0x68(r29)
/* 0000B6C4 38600014 */ li r3, 0x14
/* 0000B6C8 C01A0008 */ lfs f0, 8(r26)
/* 0000B6CC EC220072 */ fmuls f1, f2, f1
/* 0000B6D0 EC00082A */ fadds f0, f0, f1
/* 0000B6D4 D01A0008 */ stfs f0, 8(r26)
/* 0000B6D8 4BFF4A75 */ bl gxutil_set_line_width
/* 0000B6DC 38600001 */ li r3, 1
/* 0000B6E0 38800002 */ li r4, 2
/* 0000B6E4 38A00001 */ li r5, 1
/* 0000B6E8 38C0000F */ li r6, 0xf
/* 0000B6EC 4BFF4A61 */ bl gxutil_set_line_blend_params
/* 0000B6F0 3C600000 */ lis r3, debugFlags@ha
/* 0000B6F4 3BC30000 */ addi r30, r3, debugFlags@l
/* 0000B6F8 3B800000 */ li r28, 0
/* 0000B6FC 3AE00000 */ li r23, 0
/* 0000B700 3EC04330 */ lis r22, 0x4330
/* 0000B704 480003A4 */ b lbl_0000BAA8
lbl_0000B708:
/* 0000B708 7FFBBA14 */ add r31, r27, r23
/* 0000B70C C01D0000 */ lfs f0, 0(r29)
/* 0000B710 C03F0020 */ lfs f1, 0x20(r31)
/* 0000B714 FC010040 */ fcmpo cr0, f1, f0
/* 0000B718 40810018 */ ble lbl_0000B730
/* 0000B71C 4BFF4A31 */ bl mathutil_mtxA_push
/* 0000B720 7FE3FB78 */ mr r3, r31
/* 0000B724 4BFFFD31 */ bl lbl_0000B454
/* 0000B728 4BFF4A25 */ bl mathutil_mtxA_pop
/* 0000B72C 48000374 */ b lbl_0000BAA0
lbl_0000B730:
/* 0000B730 C03A0008 */ lfs f1, 8(r26)
/* 0000B734 C01D0020 */ lfs f0, 0x20(r29)
/* 0000B738 FC010040 */ fcmpo cr0, f1, f0
/* 0000B73C 40810364 */ ble lbl_0000BAA0
/* 0000B740 4BFF4A0D */ bl rand
/* 0000B744 6C608000 */ xoris r0, r3, 0x8000
/* 0000B748 C03D0034 */ lfs f1, 0x34(r29)
/* 0000B74C 9001005C */ stw r0, 0x5c(r1)
/* 0000B750 3C600000 */ lis r3, lbl_0000C6D8@ha
/* 0000B754 C8630000 */ lfd f3, lbl_0000C6D8@l(r3)
/* 0000B758 38000000 */ li r0, 0
/* 0000B75C 92C10058 */ stw r22, 0x58(r1)
/* 0000B760 C01D0040 */ lfs f0, 0x40(r29)
/* 0000B764 C8410058 */ lfd f2, 0x58(r1)
/* 0000B768 901F0024 */ stw r0, 0x24(r31)
/* 0000B76C EC421828 */ fsubs f2, f2, f3
/* 0000B770 801E0000 */ lwz r0, 0(r30)
/* 0000B774 EC220824 */ fdivs f1, f2, f1
/* 0000B778 7000000A */ andi. r0, r0, 0xa
/* 0000B77C EFE10028 */ fsubs f31, f1, f0
/* 0000B780 40820044 */ bne lbl_0000B7C4
/* 0000B784 4BFF49C9 */ bl rand
/* 0000B788 6C608000 */ xoris r0, r3, 0x8000
/* 0000B78C C03D0034 */ lfs f1, 0x34(r29)
/* 0000B790 9001005C */ stw r0, 0x5c(r1)
/* 0000B794 3C600000 */ lis r3, lbl_0000C6D8@ha
/* 0000B798 C8830000 */ lfd f4, lbl_0000C6D8@l(r3)
/* 0000B79C 92C10058 */ stw r22, 0x58(r1)
/* 0000B7A0 C05D0018 */ lfs f2, 0x18(r29)
/* 0000B7A4 C8610058 */ lfd f3, 0x58(r1)
/* 0000B7A8 C01D0030 */ lfs f0, 0x30(r29)
/* 0000B7AC EC632028 */ fsubs f3, f3, f4
/* 0000B7B0 EC230824 */ fdivs f1, f3, f1
/* 0000B7B4 EC220072 */ fmuls f1, f2, f1
/* 0000B7B8 EC000072 */ fmuls f0, f0, f1
/* 0000B7BC EC02002A */ fadds f0, f2, f0
/* 0000B7C0 D01F0020 */ stfs f0, 0x20(r31)
lbl_0000B7C4:
/* 0000B7C4 C01D0038 */ lfs f0, 0x38(r29)
/* 0000B7C8 7C7BBA14 */ add r3, r27, r23
/* 0000B7CC D0030018 */ stfs f0, 0x18(r3)
/* 0000B7D0 4BFF497D */ bl rand
/* 0000B7D4 6C608000 */ xoris r0, r3, 0x8000
/* 0000B7D8 C03D0034 */ lfs f1, 0x34(r29)
/* 0000B7DC 9001005C */ stw r0, 0x5c(r1)
/* 0000B7E0 3C600000 */ lis r3, lbl_0000C6D8@ha
/* 0000B7E4 C8630000 */ lfd f3, lbl_0000C6D8@l(r3)
/* 0000B7E8 92C10058 */ stw r22, 0x58(r1)
/* 0000B7EC C01D0038 */ lfs f0, 0x38(r29)
/* 0000B7F0 C8410058 */ lfd f2, 0x58(r1)
/* 0000B7F4 EC421828 */ fsubs f2, f2, f3
/* 0000B7F8 EC220824 */ fdivs f1, f2, f1
/* 0000B7FC FC010040 */ fcmpo cr0, f1, f0
/* 0000B800 7C000026 */ mfcr r0
/* 0000B804 541517FF */ rlwinm. r21, r0, 2, 0x1f, 0x1f
/* 0000B808 41820070 */ beq lbl_0000B878
/* 0000B80C C01D0000 */ lfs f0, 0(r29)
/* 0000B810 FC1F0040 */ fcmpo cr0, f31, f0
/* 0000B814 40800010 */ bge lbl_0000B824
/* 0000B818 C01D006C */ lfs f0, 0x6c(r29)
/* 0000B81C EFFF0028 */ fsubs f31, f31, f0
/* 0000B820 4800000C */ b lbl_0000B82C
lbl_0000B824:
/* 0000B824 C01D006C */ lfs f0, 0x6c(r29)
/* 0000B828 EFFF002A */ fadds f31, f31, f0
lbl_0000B82C:
/* 0000B82C D3E10014 */ stfs f31, 0x14(r1)
/* 0000B830 C01D0000 */ lfs f0, 0(r29)
/* 0000B834 D0010018 */ stfs f0, 0x18(r1)
/* 0000B838 4BFF4915 */ bl rand
/* 0000B83C 6C608000 */ xoris r0, r3, 0x8000
/* 0000B840 C05D0034 */ lfs f2, 0x34(r29)
/* 0000B844 9001005C */ stw r0, 0x5c(r1)
/* 0000B848 3C600000 */ lis r3, lbl_0000C6D8@ha
/* 0000B84C C8830000 */ lfd f4, lbl_0000C6D8@l(r3)
/* 0000B850 92C10058 */ stw r22, 0x58(r1)
/* 0000B854 C03D003C */ lfs f1, 0x3c(r29)
/* 0000B858 C8610058 */ lfd f3, 0x58(r1)
/* 0000B85C C01D0070 */ lfs f0, 0x70(r29)
/* 0000B860 EC632028 */ fsubs f3, f3, f4
/* 0000B864 EC431024 */ fdivs f2, f3, f2
/* 0000B868 EC220828 */ fsubs f1, f2, f1
/* 0000B86C EC000072 */ fmuls f0, f0, f1
/* 0000B870 D001001C */ stfs f0, 0x1c(r1)
/* 0000B874 48000054 */ b lbl_0000B8C8
lbl_0000B878:
/* 0000B878 4BFF48D5 */ bl rand
/* 0000B87C 6C608000 */ xoris r0, r3, 0x8000
/* 0000B880 C03D0034 */ lfs f1, 0x34(r29)
/* 0000B884 9001005C */ stw r0, 0x5c(r1)
/* 0000B888 3C600000 */ lis r3, lbl_0000C6D8@ha
/* 0000B88C C8630000 */ lfd f3, lbl_0000C6D8@l(r3)
/* 0000B890 92C10058 */ stw r22, 0x58(r1)
/* 0000B894 C01D0040 */ lfs f0, 0x40(r29)
/* 0000B898 C8410058 */ lfd f2, 0x58(r1)
/* 0000B89C EC421828 */ fsubs f2, f2, f3
/* 0000B8A0 EC220824 */ fdivs f1, f2, f1
/* 0000B8A4 EC010028 */ fsubs f0, f1, f0
/* 0000B8A8 D0010014 */ stfs f0, 0x14(r1)
/* 0000B8AC C01D0000 */ lfs f0, 0(r29)
/* 0000B8B0 D0010018 */ stfs f0, 0x18(r1)
/* 0000B8B4 C03D006C */ lfs f1, 0x6c(r29)
/* 0000B8B8 C01D0074 */ lfs f0, 0x74(r29)
/* 0000B8BC EC2107F2 */ fmuls f1, f1, f31
/* 0000B8C0 EC010028 */ fsubs f0, f1, f0
/* 0000B8C4 D001001C */ stfs f0, 0x1c(r1)
lbl_0000B8C8:
/* 0000B8C8 38610014 */ addi r3, r1, 0x14
/* 0000B8CC 38830000 */ addi r4, r3, 0
/* 0000B8D0 4BFF487D */ bl mathutil_mtxA_tf_vec
/* 0000B8D4 C0380000 */ lfs f1, 0(r24)
/* 0000B8D8 7FFBBA14 */ add r31, r27, r23
/* 0000B8DC C0010014 */ lfs f0, 0x14(r1)
/* 0000B8E0 2C150000 */ cmpwi r21, 0
/* 0000B8E4 EC01002A */ fadds f0, f1, f0
/* 0000B8E8 7C1BBD2E */ stfsx f0, r27, r23
/* 0000B8EC C01D0000 */ lfs f0, 0(r29)
/* 0000B8F0 D01F0004 */ stfs f0, 4(r31)
/* 0000B8F4 C0380008 */ lfs f1, 8(r24)
/* 0000B8F8 C001001C */ lfs f0, 0x1c(r1)
/* 0000B8FC EC01002A */ fadds f0, f1, f0
/* 0000B900 D01F0008 */ stfs f0, 8(r31)
/* 0000B904 4182009C */ beq lbl_0000B9A0
/* 0000B908 4BFF4845 */ bl rand
/* 0000B90C 6C608000 */ xoris r0, r3, 0x8000
/* 0000B910 C03D0034 */ lfs f1, 0x34(r29)
/* 0000B914 9001005C */ stw r0, 0x5c(r1)
/* 0000B918 3C600000 */ lis r3, lbl_0000C6D8@ha
/* 0000B91C C8630000 */ lfd f3, lbl_0000C6D8@l(r3)
/* 0000B920 92C10058 */ stw r22, 0x58(r1)
/* 0000B924 C01D0078 */ lfs f0, 0x78(r29)
/* 0000B928 C8410058 */ lfd f2, 0x58(r1)
/* 0000B92C EC421828 */ fsubs f2, f2, f3
/* 0000B930 EC220824 */ fdivs f1, f2, f1
/* 0000B934 EC000072 */ fmuls f0, f0, f1
/* 0000B938 EC1F0032 */ fmuls f0, f31, f0
/* 0000B93C D01F000C */ stfs f0, 0xc(r31)
/* 0000B940 4BFF480D */ bl rand
/* 0000B944 6C608000 */ xoris r0, r3, 0x8000
/* 0000B948 C03D0034 */ lfs f1, 0x34(r29)
/* 0000B94C 90010054 */ stw r0, 0x54(r1)
/* 0000B950 3C600000 */ lis r3, lbl_0000C6D8@ha
/* 0000B954 C8630000 */ lfd f3, lbl_0000C6D8@l(r3)
/* 0000B958 92C10050 */ stw r22, 0x50(r1)
/* 0000B95C C01D007C */ lfs f0, 0x7c(r29)
/* 0000B960 C8410050 */ lfd f2, 0x50(r1)
/* 0000B964 EC421828 */ fsubs f2, f2, f3
/* 0000B968 EC220824 */ fdivs f1, f2, f1
/* 0000B96C EC000072 */ fmuls f0, f0, f1
/* 0000B970 D01F0010 */ stfs f0, 0x10(r31)
/* 0000B974 C0390000 */ lfs f1, 0(r25)
/* 0000B978 C0590004 */ lfs f2, 4(r25)
/* 0000B97C C0190008 */ lfs f0, 8(r25)
/* 0000B980 EC210072 */ fmuls f1, f1, f1
/* 0000B984 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000B988 EC20083A */ fmadds f1, f0, f0, f1
/* 0000B98C 4BFF47C1 */ bl mathutil_sqrt
/* 0000B990 C01D0080 */ lfs f0, 0x80(r29)
/* 0000B994 EC000072 */ fmuls f0, f0, f1
/* 0000B998 D01F0014 */ stfs f0, 0x14(r31)
/* 0000B99C 480000D4 */ b lbl_0000BA70
lbl_0000B9A0:
/* 0000B9A0 4BFF47AD */ bl rand
/* 0000B9A4 6C608000 */ xoris r0, r3, 0x8000
/* 0000B9A8 C05D0034 */ lfs f2, 0x34(r29)
/* 0000B9AC 90010054 */ stw r0, 0x54(r1)
/* 0000B9B0 3C600000 */ lis r3, lbl_0000C6D8@ha
/* 0000B9B4 C8830000 */ lfd f4, lbl_0000C6D8@l(r3)
/* 0000B9B8 92C10050 */ stw r22, 0x50(r1)
/* 0000B9BC C03D0038 */ lfs f1, 0x38(r29)
/* 0000B9C0 C8610050 */ lfd f3, 0x50(r1)
/* 0000B9C4 C01D003C */ lfs f0, 0x3c(r29)
/* 0000B9C8 EC632028 */ fsubs f3, f3, f4
/* 0000B9CC EC431024 */ fdivs f2, f3, f2
/* 0000B9D0 EC2100B2 */ fmuls f1, f1, f2
/* 0000B9D4 EC010028 */ fsubs f0, f1, f0
/* 0000B9D8 D01F000C */ stfs f0, 0xc(r31)
/* 0000B9DC 4BFF4771 */ bl rand
/* 0000B9E0 6C608000 */ xoris r0, r3, 0x8000
/* 0000B9E4 C03D0034 */ lfs f1, 0x34(r29)
/* 0000B9E8 9001005C */ stw r0, 0x5c(r1)
/* 0000B9EC 3C600000 */ lis r3, lbl_0000C6D8@ha
/* 0000B9F0 C8630000 */ lfd f3, lbl_0000C6D8@l(r3)
/* 0000B9F4 92C10058 */ stw r22, 0x58(r1)
/* 0000B9F8 C01D0084 */ lfs f0, 0x84(r29)
/* 0000B9FC C8410058 */ lfd f2, 0x58(r1)
/* 0000BA00 EC421828 */ fsubs f2, f2, f3
/* 0000BA04 EC220824 */ fdivs f1, f2, f1
/* 0000BA08 EC000072 */ fmuls f0, f0, f1
/* 0000BA0C D01F0010 */ stfs f0, 0x10(r31)
/* 0000BA10 C0390000 */ lfs f1, 0(r25)
/* 0000BA14 C0590004 */ lfs f2, 4(r25)
/* 0000BA18 C0190008 */ lfs f0, 8(r25)
/* 0000BA1C EC210072 */ fmuls f1, f1, f1
/* 0000BA20 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000BA24 EC20083A */ fmadds f1, f0, f0, f1
/* 0000BA28 4BFF4725 */ bl mathutil_sqrt
/* 0000BA2C FFE00890 */ fmr f31, f1
/* 0000BA30 4BFF471D */ bl rand
/* 0000BA34 6C608000 */ xoris r0, r3, 0x8000
/* 0000BA38 C05D0034 */ lfs f2, 0x34(r29)
/* 0000BA3C 9001004C */ stw r0, 0x4c(r1)
/* 0000BA40 3C600000 */ lis r3, lbl_0000C6D8@ha
/* 0000BA44 C8830000 */ lfd f4, lbl_0000C6D8@l(r3)
/* 0000BA48 92C10048 */ stw r22, 0x48(r1)
/* 0000BA4C C03D0088 */ lfs f1, 0x88(r29)
/* 0000BA50 C8610048 */ lfd f3, 0x48(r1)
/* 0000BA54 C01D0074 */ lfs f0, 0x74(r29)
/* 0000BA58 EC632028 */ fsubs f3, f3, f4
/* 0000BA5C EC431024 */ fdivs f2, f3, f2
/* 0000BA60 EC2100B2 */ fmuls f1, f1, f2
/* 0000BA64 EC010028 */ fsubs f0, f1, f0
/* 0000BA68 EC1F0032 */ fmuls f0, f31, f0
/* 0000BA6C D01F0014 */ stfs f0, 0x14(r31)
lbl_0000BA70:
/* 0000BA70 3877000C */ addi r3, r23, 0xc
/* 0000BA74 3897000C */ addi r4, r23, 0xc
/* 0000BA78 7C7B1A14 */ add r3, r27, r3
/* 0000BA7C 7C9B2214 */ add r4, r27, r4
/* 0000BA80 4BFF46CD */ bl mathutil_mtxA_tf_vec
/* 0000BA84 C01D0020 */ lfs f0, 0x20(r29)
/* 0000BA88 7C7BBA14 */ add r3, r27, r23
/* 0000BA8C D003001C */ stfs f0, 0x1c(r3)
/* 0000BA90 C03A0008 */ lfs f1, 8(r26)
/* 0000BA94 C01D0020 */ lfs f0, 0x20(r29)
/* 0000BA98 EC010028 */ fsubs f0, f1, f0
/* 0000BA9C D01A0008 */ stfs f0, 8(r26)
lbl_0000BAA0:
/* 0000BAA0 3B9C0001 */ addi r28, r28, 1
/* 0000BAA4 3AF70028 */ addi r23, r23, 0x28
lbl_0000BAA8:
/* 0000BAA8 801A0000 */ lwz r0, 0(r26)
/* 0000BAAC 7C1C0040 */ cmplw r28, r0
/* 0000BAB0 4180FC58 */ blt lbl_0000B708
/* 0000BAB4 BAA10064 */ lmw r21, 0x64(r1)
/* 0000BAB8 8001009C */ lwz r0, 0x9c(r1)
/* 0000BABC CBE10090 */ lfd f31, 0x90(r1)
/* 0000BAC0 38210098 */ addi r1, r1, 0x98
/* 0000BAC4 7C0803A6 */ mtlr r0
/* 0000BAC8 4E800020 */ blr 
