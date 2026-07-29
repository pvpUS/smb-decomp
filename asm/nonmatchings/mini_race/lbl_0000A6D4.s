/* 0000A6D4 7C0802A6 */ mflr r0
/* 0000A6D8 3CA00000 */ lis r5, debugFlags@ha
/* 0000A6DC 90010004 */ stw r0, 4(r1)
/* 0000A6E0 9421FFB8 */ stwu r1, -0x48(r1)
/* 0000A6E4 93E10044 */ stw r31, 0x44(r1)
/* 0000A6E8 3BE30000 */ addi r31, r3, 0
/* 0000A6EC 93C10040 */ stw r30, 0x40(r1)
/* 0000A6F0 93A1003C */ stw r29, 0x3c(r1)
/* 0000A6F4 3BA40000 */ addi r29, r4, 0
/* 0000A6F8 80050000 */ lwz r0, debugFlags@l(r5)
/* 0000A6FC 3CA00000 */ lis r5, lbl_00013AA0@ha
/* 0000A700 3BC50000 */ addi r30, r5, lbl_00013AA0@l
/* 0000A704 7000000A */ andi. r0, r0, 0xa
/* 0000A708 408202A0 */ bne lbl_0000A9A8
/* 0000A70C 3C600000 */ lis r3, lbl_10001B24@ha
/* 0000A710 38630000 */ addi r3, r3, lbl_10001B24@l
/* 0000A714 80630000 */ lwz r3, 0(r3)
/* 0000A718 A8030002 */ lha r0, 2(r3)
/* 0000A71C B01F0030 */ sth r0, 0x30(r31)
/* 0000A720 C03D0004 */ lfs f1, 4(r29)
/* 0000A724 C01F000C */ lfs f0, 0xc(r31)
/* 0000A728 EC010028 */ fsubs f0, f1, f0
/* 0000A72C D001001C */ stfs f0, 0x1c(r1)
/* 0000A730 C03D0008 */ lfs f1, 8(r29)
/* 0000A734 C01F0010 */ lfs f0, 0x10(r31)
/* 0000A738 EC010028 */ fsubs f0, f1, f0
/* 0000A73C D0010020 */ stfs f0, 0x20(r1)
/* 0000A740 C03D000C */ lfs f1, 0xc(r29)
/* 0000A744 C01F0014 */ lfs f0, 0x14(r31)
/* 0000A748 EC010028 */ fsubs f0, f1, f0
/* 0000A74C D0010024 */ stfs f0, 0x24(r1)
/* 0000A750 C021001C */ lfs f1, 0x1c(r1)
/* 0000A754 C0410020 */ lfs f2, 0x20(r1)
/* 0000A758 C0010024 */ lfs f0, 0x24(r1)
/* 0000A75C EC210072 */ fmuls f1, f1, f1
/* 0000A760 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000A764 EC20083A */ fmadds f1, f0, f0, f1
/* 0000A768 4BFF5A15 */ bl mathutil_sqrt
/* 0000A76C C01E009C */ lfs f0, 0x9c(r30)
/* 0000A770 FC010040 */ fcmpo cr0, f1, f0
/* 0000A774 40810074 */ ble lbl_0000A7E8
/* 0000A778 C85E00E0 */ lfd f2, 0xe0(r30)
/* 0000A77C C81E00E8 */ lfd f0, 0xe8(r30)
/* 0000A780 FC211024 */ fdiv f1, f1, f2
/* 0000A784 FC200818 */ frsp f1, f1
/* 0000A788 FC010040 */ fcmpo cr0, f1, f0
/* 0000A78C 40810008 */ ble lbl_0000A794
/* 0000A790 C03E00F0 */ lfs f1, 0xf0(r30)
lbl_0000A794:
/* 0000A794 C001001C */ lfs f0, 0x1c(r1)
/* 0000A798 EC000072 */ fmuls f0, f0, f1
/* 0000A79C D001001C */ stfs f0, 0x1c(r1)
/* 0000A7A0 C0010020 */ lfs f0, 0x20(r1)
/* 0000A7A4 EC000072 */ fmuls f0, f0, f1
/* 0000A7A8 D0010020 */ stfs f0, 0x20(r1)
/* 0000A7AC C0010024 */ lfs f0, 0x24(r1)
/* 0000A7B0 EC000072 */ fmuls f0, f0, f1
/* 0000A7B4 D0010024 */ stfs f0, 0x24(r1)
/* 0000A7B8 C03F000C */ lfs f1, 0xc(r31)
/* 0000A7BC C001001C */ lfs f0, 0x1c(r1)
/* 0000A7C0 EC01002A */ fadds f0, f1, f0
/* 0000A7C4 D01F000C */ stfs f0, 0xc(r31)
/* 0000A7C8 C03F0010 */ lfs f1, 0x10(r31)
/* 0000A7CC C0010020 */ lfs f0, 0x20(r1)
/* 0000A7D0 EC01002A */ fadds f0, f1, f0
/* 0000A7D4 D01F0010 */ stfs f0, 0x10(r31)
/* 0000A7D8 C03F0014 */ lfs f1, 0x14(r31)
/* 0000A7DC C0010024 */ lfs f0, 0x24(r1)
/* 0000A7E0 EC01002A */ fadds f0, f1, f0
/* 0000A7E4 D01F0014 */ stfs f0, 0x14(r31)
lbl_0000A7E8:
/* 0000A7E8 807E0124 */ lwz r3, 0x124(r30)
/* 0000A7EC 801E0128 */ lwz r0, 0x128(r30)
/* 0000A7F0 90610010 */ stw r3, 0x10(r1)
/* 0000A7F4 90010014 */ stw r0, 0x14(r1)
/* 0000A7F8 801E012C */ lwz r0, 0x12c(r30)
/* 0000A7FC 90010018 */ stw r0, 0x18(r1)
/* 0000A800 80610010 */ lwz r3, 0x10(r1)
/* 0000A804 80010014 */ lwz r0, 0x14(r1)
/* 0000A808 90610028 */ stw r3, 0x28(r1)
/* 0000A80C 9001002C */ stw r0, 0x2c(r1)
/* 0000A810 80010018 */ lwz r0, 0x18(r1)
/* 0000A814 90010030 */ stw r0, 0x30(r1)
/* 0000A818 807D00FC */ lwz r3, 0xfc(r29)
/* 0000A81C 38630060 */ addi r3, r3, 0x60
/* 0000A820 4BFF595D */ bl mathutil_mtxA_from_quat
/* 0000A824 38610028 */ addi r3, r1, 0x28
/* 0000A828 38830000 */ addi r4, r3, 0
/* 0000A82C 4BFF5951 */ bl mathutil_mtxA_tf_vec
/* 0000A830 C0210028 */ lfs f1, 0x28(r1)
/* 0000A834 C01D0004 */ lfs f0, 4(r29)
/* 0000A838 EC01002A */ fadds f0, f1, f0
/* 0000A83C D0010028 */ stfs f0, 0x28(r1)
/* 0000A840 C021002C */ lfs f1, 0x2c(r1)
/* 0000A844 C01D0008 */ lfs f0, 8(r29)
/* 0000A848 EC01002A */ fadds f0, f1, f0
/* 0000A84C D001002C */ stfs f0, 0x2c(r1)
/* 0000A850 C0210030 */ lfs f1, 0x30(r1)
/* 0000A854 C01D000C */ lfs f0, 0xc(r29)
/* 0000A858 EC01002A */ fadds f0, f1, f0
/* 0000A85C D0010030 */ stfs f0, 0x30(r1)
/* 0000A860 C021002C */ lfs f1, 0x2c(r1)
/* 0000A864 C01E0068 */ lfs f0, 0x68(r30)
/* 0000A868 EC01002A */ fadds f0, f1, f0
/* 0000A86C D001002C */ stfs f0, 0x2c(r1)
/* 0000A870 C0210028 */ lfs f1, 0x28(r1)
/* 0000A874 C01F0000 */ lfs f0, 0(r31)
/* 0000A878 C041002C */ lfs f2, 0x2c(r1)
/* 0000A87C EC010028 */ fsubs f0, f1, f0
/* 0000A880 C0210030 */ lfs f1, 0x30(r1)
/* 0000A884 D001001C */ stfs f0, 0x1c(r1)
/* 0000A888 C01F0004 */ lfs f0, 4(r31)
/* 0000A88C EC020028 */ fsubs f0, f2, f0
/* 0000A890 D0010020 */ stfs f0, 0x20(r1)
/* 0000A894 C01F0008 */ lfs f0, 8(r31)
/* 0000A898 EC010028 */ fsubs f0, f1, f0
/* 0000A89C D0010024 */ stfs f0, 0x24(r1)
/* 0000A8A0 C021001C */ lfs f1, 0x1c(r1)
/* 0000A8A4 C0410020 */ lfs f2, 0x20(r1)
/* 0000A8A8 C0010024 */ lfs f0, 0x24(r1)
/* 0000A8AC EC210072 */ fmuls f1, f1, f1
/* 0000A8B0 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000A8B4 EC20083A */ fmadds f1, f0, f0, f1
/* 0000A8B8 4BFF58C5 */ bl mathutil_sqrt
/* 0000A8BC C01E009C */ lfs f0, 0x9c(r30)
/* 0000A8C0 FC010040 */ fcmpo cr0, f1, f0
/* 0000A8C4 40810074 */ ble lbl_0000A938
/* 0000A8C8 C85E00E0 */ lfd f2, 0xe0(r30)
/* 0000A8CC C81E00E8 */ lfd f0, 0xe8(r30)
/* 0000A8D0 FC211024 */ fdiv f1, f1, f2
/* 0000A8D4 FC200818 */ frsp f1, f1
/* 0000A8D8 FC010040 */ fcmpo cr0, f1, f0
/* 0000A8DC 40810008 */ ble lbl_0000A8E4
/* 0000A8E0 C03E00F0 */ lfs f1, 0xf0(r30)
lbl_0000A8E4:
/* 0000A8E4 C001001C */ lfs f0, 0x1c(r1)
/* 0000A8E8 EC000072 */ fmuls f0, f0, f1
/* 0000A8EC D001001C */ stfs f0, 0x1c(r1)
/* 0000A8F0 C0010020 */ lfs f0, 0x20(r1)
/* 0000A8F4 EC000072 */ fmuls f0, f0, f1
/* 0000A8F8 D0010020 */ stfs f0, 0x20(r1)
/* 0000A8FC C0010024 */ lfs f0, 0x24(r1)
/* 0000A900 EC000072 */ fmuls f0, f0, f1
/* 0000A904 D0010024 */ stfs f0, 0x24(r1)
/* 0000A908 C03F0000 */ lfs f1, 0(r31)
/* 0000A90C C001001C */ lfs f0, 0x1c(r1)
/* 0000A910 EC01002A */ fadds f0, f1, f0
/* 0000A914 D01F0000 */ stfs f0, 0(r31)
/* 0000A918 C03F0004 */ lfs f1, 4(r31)
/* 0000A91C C0010020 */ lfs f0, 0x20(r1)
/* 0000A920 EC01002A */ fadds f0, f1, f0
/* 0000A924 D01F0004 */ stfs f0, 4(r31)
/* 0000A928 C03F0008 */ lfs f1, 8(r31)
/* 0000A92C C0010024 */ lfs f0, 0x24(r1)
/* 0000A930 EC01002A */ fadds f0, f1, f0
/* 0000A934 D01F0008 */ stfs f0, 8(r31)
lbl_0000A938:
/* 0000A938 C03F000C */ lfs f1, 0xc(r31)
/* 0000A93C C01F0000 */ lfs f0, 0(r31)
/* 0000A940 EC010028 */ fsubs f0, f1, f0
/* 0000A944 D001001C */ stfs f0, 0x1c(r1)
/* 0000A948 C03F0010 */ lfs f1, 0x10(r31)
/* 0000A94C C01F0004 */ lfs f0, 4(r31)
/* 0000A950 EC010028 */ fsubs f0, f1, f0
/* 0000A954 D0010020 */ stfs f0, 0x20(r1)
/* 0000A958 C03F0014 */ lfs f1, 0x14(r31)
/* 0000A95C C01F0008 */ lfs f0, 8(r31)
/* 0000A960 EC010028 */ fsubs f0, f1, f0
/* 0000A964 D0010024 */ stfs f0, 0x24(r1)
/* 0000A968 C021001C */ lfs f1, 0x1c(r1)
/* 0000A96C C0410024 */ lfs f2, 0x24(r1)
/* 0000A970 4BFF580D */ bl mathutil_atan2
/* 0000A974 38038000 */ addi r0, r3, -32768
/* 0000A978 B01F001A */ sth r0, 0x1a(r31)
/* 0000A97C C0010024 */ lfs f0, 0x24(r1)
/* 0000A980 C021001C */ lfs f1, 0x1c(r1)
/* 0000A984 EC210072 */ fmuls f1, f1, f1
/* 0000A988 EC20083A */ fmadds f1, f0, f0, f1
/* 0000A98C 4BFF57F1 */ bl mathutil_sqrt
/* 0000A990 FC400890 */ fmr f2, f1
/* 0000A994 C0210020 */ lfs f1, 0x20(r1)
/* 0000A998 4BFF57E5 */ bl mathutil_atan2
/* 0000A99C B07F0018 */ sth r3, 0x18(r31)
/* 0000A9A0 38000000 */ li r0, 0
/* 0000A9A4 B01F001C */ sth r0, 0x1c(r31)
lbl_0000A9A8:
/* 0000A9A8 8001004C */ lwz r0, 0x4c(r1)
/* 0000A9AC 83E10044 */ lwz r31, 0x44(r1)
/* 0000A9B0 83C10040 */ lwz r30, 0x40(r1)
/* 0000A9B4 7C0803A6 */ mtlr r0
/* 0000A9B8 83A1003C */ lwz r29, 0x3c(r1)
/* 0000A9BC 38210048 */ addi r1, r1, 0x48
/* 0000A9C0 4E800020 */ blr 
