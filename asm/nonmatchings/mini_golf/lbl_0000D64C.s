/* 0000D64C 7C0802A6 */ mflr r0
/* 0000D650 3CA00000 */ lis r5, debugFlags@ha
/* 0000D654 90010004 */ stw r0, 4(r1)
/* 0000D658 3CC00000 */ lis r6, lbl_00026378@ha
/* 0000D65C 9421FF30 */ stwu r1, -0xd0(r1)
/* 0000D660 DBE100C8 */ stfd f31, 0xc8(r1)
/* 0000D664 DBC100C0 */ stfd f30, 0xc0(r1)
/* 0000D668 BF4100A8 */ stmw r26, 0xa8(r1)
/* 0000D66C 3B430000 */ addi r26, r3, 0
/* 0000D670 3B640000 */ addi r27, r4, 0
/* 0000D674 3BA60000 */ addi r29, r6, lbl_00026378@l
/* 0000D678 80050000 */ lwz r0, debugFlags@l(r5)
/* 0000D67C 3CA00000 */ lis r5, lbl_10000130@ha
/* 0000D680 3BC50000 */ addi r30, r5, lbl_10000130@l
/* 0000D684 7000000A */ andi. r0, r0, 0xa
/* 0000D688 40821208 */ bne lbl_0000E890
/* 0000D68C C01A0000 */ lfs f0, 0(r26)
/* 0000D690 387A000C */ addi r3, r26, 0xc
/* 0000D694 D0010074 */ stfs f0, 0x74(r1)
/* 0000D698 C01A0004 */ lfs f0, 4(r26)
/* 0000D69C D0010078 */ stfs f0, 0x78(r1)
/* 0000D6A0 C01A0008 */ lfs f0, 8(r26)
/* 0000D6A4 D001007C */ stfs f0, 0x7c(r1)
/* 0000D6A8 C01A000C */ lfs f0, 0xc(r26)
/* 0000D6AC D0010068 */ stfs f0, 0x68(r1)
/* 0000D6B0 C01A0010 */ lfs f0, 0x10(r26)
/* 0000D6B4 D001006C */ stfs f0, 0x6c(r1)
/* 0000D6B8 C01A0014 */ lfs f0, 0x14(r26)
/* 0000D6BC D0010070 */ stfs f0, 0x70(r1)
/* 0000D6C0 C01B0004 */ lfs f0, 4(r27)
/* 0000D6C4 D01A000C */ stfs f0, 0xc(r26)
/* 0000D6C8 C83D0010 */ lfd f1, 0x10(r29)
/* 0000D6CC C01B0008 */ lfs f0, 8(r27)
/* 0000D6D0 FC01002A */ fadd f0, f1, f0
/* 0000D6D4 FC000018 */ frsp f0, f0
/* 0000D6D8 D01A0010 */ stfs f0, 0x10(r26)
/* 0000D6DC C01B000C */ lfs f0, 0xc(r27)
/* 0000D6E0 D01A0014 */ stfs f0, 0x14(r26)
/* 0000D6E4 4BFF2AED */ bl mathutil_mtxA_from_translate
/* 0000D6E8 A87B0092 */ lha r3, 0x92(r27)
/* 0000D6EC 4BFF2AE5 */ bl mathutil_mtxA_rotate_y
/* 0000D6F0 C01D0018 */ lfs f0, 0x18(r29)
/* 0000D6F4 389A0000 */ addi r4, r26, 0
/* 0000D6F8 38610080 */ addi r3, r1, 0x80
/* 0000D6FC D0010080 */ stfs f0, 0x80(r1)
/* 0000D700 C01D001C */ lfs f0, 0x1c(r29)
/* 0000D704 D0010084 */ stfs f0, 0x84(r1)
/* 0000D708 C01D0020 */ lfs f0, 0x20(r29)
/* 0000D70C D0010088 */ stfs f0, 0x88(r1)
/* 0000D710 4BFF2AC1 */ bl mathutil_mtxA_tf_point
/* 0000D714 C01D0018 */ lfs f0, 0x18(r29)
/* 0000D718 38610080 */ addi r3, r1, 0x80
/* 0000D71C 389A00AC */ addi r4, r26, 0xac
/* 0000D720 D0010080 */ stfs f0, 0x80(r1)
/* 0000D724 C01D0018 */ lfs f0, 0x18(r29)
/* 0000D728 D0010084 */ stfs f0, 0x84(r1)
/* 0000D72C C01D0020 */ lfs f0, 0x20(r29)
/* 0000D730 D0010088 */ stfs f0, 0x88(r1)
/* 0000D734 4BFF2A9D */ bl mathutil_mtxA_tf_point
/* 0000D738 C05A00AC */ lfs f2, 0xac(r26)
/* 0000D73C C0010068 */ lfs f0, 0x68(r1)
/* 0000D740 C021006C */ lfs f1, 0x6c(r1)
/* 0000D744 EC420028 */ fsubs f2, f2, f0
/* 0000D748 C0010070 */ lfs f0, 0x70(r1)
/* 0000D74C D0410080 */ stfs f2, 0x80(r1)
/* 0000D750 C05A00B0 */ lfs f2, 0xb0(r26)
/* 0000D754 EC220828 */ fsubs f1, f2, f1
/* 0000D758 D0210084 */ stfs f1, 0x84(r1)
/* 0000D75C C03A00B4 */ lfs f1, 0xb4(r26)
/* 0000D760 EC010028 */ fsubs f0, f1, f0
/* 0000D764 D0010088 */ stfs f0, 0x88(r1)
/* 0000D768 C0410088 */ lfs f2, 0x88(r1)
/* 0000D76C C0010084 */ lfs f0, 0x84(r1)
/* 0000D770 C0210080 */ lfs f1, 0x80(r1)
/* 0000D774 EC210072 */ fmuls f1, f1, f1
/* 0000D778 EC20083A */ fmadds f1, f0, f0, f1
/* 0000D77C EC2208BA */ fmadds f1, f2, f2, f1
/* 0000D780 C01D0024 */ lfs f0, 0x24(r29)
/* 0000D784 FC010040 */ fcmpo cr0, f1, f0
/* 0000D788 40810030 */ ble lbl_0000D7B8
/* 0000D78C 4BFF2A45 */ bl mathutil_rsqrt
/* 0000D790 C0010080 */ lfs f0, 0x80(r1)
/* 0000D794 EC000072 */ fmuls f0, f0, f1
/* 0000D798 D0010080 */ stfs f0, 0x80(r1)
/* 0000D79C C0010084 */ lfs f0, 0x84(r1)
/* 0000D7A0 EC000072 */ fmuls f0, f0, f1
/* 0000D7A4 D0010084 */ stfs f0, 0x84(r1)
/* 0000D7A8 C0010088 */ lfs f0, 0x88(r1)
/* 0000D7AC EC000072 */ fmuls f0, f0, f1
/* 0000D7B0 D0010088 */ stfs f0, 0x88(r1)
/* 0000D7B4 4800001C */ b lbl_0000D7D0
lbl_0000D7B8:
/* 0000D7B8 C01D001C */ lfs f0, 0x1c(r29)
/* 0000D7BC D0010080 */ stfs f0, 0x80(r1)
/* 0000D7C0 C01D0018 */ lfs f0, 0x18(r29)
/* 0000D7C4 D0010084 */ stfs f0, 0x84(r1)
/* 0000D7C8 C01D0018 */ lfs f0, 0x18(r29)
/* 0000D7CC D0010088 */ stfs f0, 0x88(r1)
lbl_0000D7D0:
/* 0000D7D0 C83D0028 */ lfd f1, 0x28(r29)
/* 0000D7D4 C0010080 */ lfs f0, 0x80(r1)
/* 0000D7D8 C0410068 */ lfs f2, 0x68(r1)
/* 0000D7DC FC610032 */ fmul f3, f1, f0
/* 0000D7E0 C021006C */ lfs f1, 0x6c(r1)
/* 0000D7E4 C0010070 */ lfs f0, 0x70(r1)
/* 0000D7E8 FC43102A */ fadd f2, f3, f2
/* 0000D7EC FC401018 */ frsp f2, f2
/* 0000D7F0 D0410080 */ stfs f2, 0x80(r1)
/* 0000D7F4 C87D0028 */ lfd f3, 0x28(r29)
/* 0000D7F8 C0410084 */ lfs f2, 0x84(r1)
/* 0000D7FC FC4300B2 */ fmul f2, f3, f2
/* 0000D800 FC22082A */ fadd f1, f2, f1
/* 0000D804 FC200818 */ frsp f1, f1
/* 0000D808 D0210084 */ stfs f1, 0x84(r1)
/* 0000D80C C85D0028 */ lfd f2, 0x28(r29)
/* 0000D810 C0210088 */ lfs f1, 0x88(r1)
/* 0000D814 FC220072 */ fmul f1, f2, f1
/* 0000D818 FC01002A */ fadd f0, f1, f0
/* 0000D81C FC000018 */ frsp f0, f0
/* 0000D820 D0010088 */ stfs f0, 0x88(r1)
/* 0000D824 C01B0004 */ lfs f0, 4(r27)
/* 0000D828 D01A000C */ stfs f0, 0xc(r26)
/* 0000D82C C83D0010 */ lfd f1, 0x10(r29)
/* 0000D830 C01B0008 */ lfs f0, 8(r27)
/* 0000D834 FC01002A */ fadd f0, f1, f0
/* 0000D838 FC000018 */ frsp f0, f0
/* 0000D83C D01A0010 */ stfs f0, 0x10(r26)
/* 0000D840 C01B000C */ lfs f0, 0xc(r27)
/* 0000D844 D01A0014 */ stfs f0, 0x14(r26)
/* 0000D848 C03A000C */ lfs f1, 0xc(r26)
/* 0000D84C C0010080 */ lfs f0, 0x80(r1)
/* 0000D850 EC010028 */ fsubs f0, f1, f0
/* 0000D854 D0010080 */ stfs f0, 0x80(r1)
/* 0000D858 C03A0010 */ lfs f1, 0x10(r26)
/* 0000D85C C0010084 */ lfs f0, 0x84(r1)
/* 0000D860 EC010028 */ fsubs f0, f1, f0
/* 0000D864 D0010084 */ stfs f0, 0x84(r1)
/* 0000D868 C03A0014 */ lfs f1, 0x14(r26)
/* 0000D86C C0010088 */ lfs f0, 0x88(r1)
/* 0000D870 EC010028 */ fsubs f0, f1, f0
/* 0000D874 D0010088 */ stfs f0, 0x88(r1)
/* 0000D878 801B0080 */ lwz r0, 0x80(r27)
/* 0000D87C 2C00003C */ cmpwi r0, 0x3c
/* 0000D880 4080000C */ bge lbl_0000D88C
/* 0000D884 3BE00000 */ li r31, 0
/* 0000D888 48000028 */ b lbl_0000D8B0
lbl_0000D88C:
/* 0000D88C C0010088 */ lfs f0, 0x88(r1)
/* 0000D890 C0210080 */ lfs f1, 0x80(r1)
/* 0000D894 EC210072 */ fmuls f1, f1, f1
/* 0000D898 EC20083A */ fmadds f1, f0, f0, f1
/* 0000D89C 4BFF2935 */ bl mathutil_sqrt
/* 0000D8A0 FC400890 */ fmr f2, f1
/* 0000D8A4 C0210084 */ lfs f1, 0x84(r1)
/* 0000D8A8 4BFF2929 */ bl mathutil_atan2
/* 0000D8AC 7C7F1B78 */ mr r31, r3
lbl_0000D8B0:
/* 0000D8B0 C0210080 */ lfs f1, 0x80(r1)
/* 0000D8B4 C0410088 */ lfs f2, 0x88(r1)
/* 0000D8B8 4BFF2919 */ bl mathutil_atan2
/* 0000D8BC A81A001A */ lha r0, 0x1a(r26)
/* 0000D8C0 3B838000 */ addi r28, r3, -32768
/* 0000D8C4 7C00E050 */ subf r0, r0, r28
/* 0000D8C8 7C030734 */ extsh r3, r0
/* 0000D8CC 2C03FE00 */ cmpwi r3, -512
/* 0000D8D0 4080000C */ bge lbl_0000D8DC
/* 0000D8D4 3880FE00 */ li r4, -512
/* 0000D8D8 48000018 */ b lbl_0000D8F0
lbl_0000D8DC:
/* 0000D8DC 2C030200 */ cmpwi r3, 0x200
/* 0000D8E0 4081000C */ ble lbl_0000D8EC
/* 0000D8E4 38800200 */ li r4, 0x200
/* 0000D8E8 48000008 */ b lbl_0000D8F0
lbl_0000D8EC:
/* 0000D8EC 7C641B78 */ mr r4, r3
lbl_0000D8F0:
/* 0000D8F0 A81A0024 */ lha r0, 0x24(r26)
/* 0000D8F4 A87A001A */ lha r3, 0x1a(r26)
/* 0000D8F8 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 0000D8FC 7F832214 */ add r28, r3, r4
/* 0000D900 408201A0 */ bne lbl_0000DAA0
/* 0000D904 801B0094 */ lwz r0, 0x94(r27)
/* 0000D908 540004E7 */ rlwinm. r0, r0, 0, 0x13, 0x13
/* 0000D90C 40820194 */ bne lbl_0000DAA0
/* 0000D910 881A001F */ lbz r0, 0x1f(r26)
/* 0000D914 7C000774 */ extsb r0, r0
/* 0000D918 2C000007 */ cmpwi r0, 7
/* 0000D91C 4182000C */ beq lbl_0000D928
/* 0000D920 2C000013 */ cmpwi r0, 0x13
/* 0000D924 40820018 */ bne lbl_0000D93C
lbl_0000D928:
/* 0000D928 A81B0092 */ lha r0, 0x92(r27)
/* 0000D92C 7C7C0050 */ subf r3, r28, r0
/* 0000D930 38638000 */ addi r3, r3, -32768
/* 0000D934 7C630734 */ extsh r3, r3
/* 0000D938 48000010 */ b lbl_0000D948
lbl_0000D93C:
/* 0000D93C A81B0092 */ lha r0, 0x92(r27)
/* 0000D940 7C1C0050 */ subf r0, r28, r0
/* 0000D944 7C030734 */ extsh r3, r0
lbl_0000D948:
/* 0000D948 2C030800 */ cmpwi r3, 0x800
/* 0000D94C 4081000C */ ble lbl_0000D958
/* 0000D950 3863F800 */ addi r3, r3, -2048
/* 0000D954 48000018 */ b lbl_0000D96C
lbl_0000D958:
/* 0000D958 2C03F800 */ cmpwi r3, -2048
/* 0000D95C 4080000C */ bge lbl_0000D968
/* 0000D960 38630800 */ addi r3, r3, 0x800
/* 0000D964 48000008 */ b lbl_0000D96C
lbl_0000D968:
/* 0000D968 38600000 */ li r3, 0
lbl_0000D96C:
/* 0000D96C 7C633E71 */ srawi. r3, r3, 7
/* 0000D970 A89A010C */ lha r4, 0x10c(r26)
/* 0000D974 4082000C */ bne lbl_0000D980
/* 0000D978 38800000 */ li r4, 0
/* 0000D97C 48000068 */ b lbl_0000D9E4
lbl_0000D980:
/* 0000D980 2C040000 */ cmpwi r4, 0
/* 0000D984 4080000C */ bge lbl_0000D990
/* 0000D988 2C030000 */ cmpwi r3, 0
/* 0000D98C 41810014 */ bgt lbl_0000D9A0
lbl_0000D990:
/* 0000D990 2C040000 */ cmpwi r4, 0
/* 0000D994 40810014 */ ble lbl_0000D9A8
/* 0000D998 2C030000 */ cmpwi r3, 0
/* 0000D99C 4080000C */ bge lbl_0000D9A8
lbl_0000D9A0:
/* 0000D9A0 38800000 */ li r4, 0
/* 0000D9A4 48000040 */ b lbl_0000D9E4
lbl_0000D9A8:
/* 0000D9A8 2C030000 */ cmpwi r3, 0
/* 0000D9AC 40800020 */ bge lbl_0000D9CC
/* 0000D9B0 3804FFFC */ addi r0, r4, -4
/* 0000D9B4 7C030000 */ cmpw r3, r0
/* 0000D9B8 4080000C */ bge lbl_0000D9C4
/* 0000D9BC 3884FFFC */ addi r4, r4, -4
/* 0000D9C0 48000024 */ b lbl_0000D9E4
lbl_0000D9C4:
/* 0000D9C4 7C641B78 */ mr r4, r3
/* 0000D9C8 4800001C */ b lbl_0000D9E4
lbl_0000D9CC:
/* 0000D9CC 38040004 */ addi r0, r4, 4
/* 0000D9D0 7C030000 */ cmpw r3, r0
/* 0000D9D4 4081000C */ ble lbl_0000D9E0
/* 0000D9D8 38840004 */ addi r4, r4, 4
/* 0000D9DC 48000008 */ b lbl_0000D9E4
lbl_0000D9E0:
/* 0000D9E0 7C641B78 */ mr r4, r3
lbl_0000D9E4:
/* 0000D9E4 A81A001A */ lha r0, 0x1a(r26)
/* 0000D9E8 7F9C2214 */ add r28, r28, r4
/* 0000D9EC 7C00E050 */ subf r0, r0, r28
/* 0000D9F0 7C030734 */ extsh r3, r0
/* 0000D9F4 2C03FD00 */ cmpwi r3, -768
/* 0000D9F8 4080000C */ bge lbl_0000DA04
/* 0000D9FC 3880FD00 */ li r4, -768
/* 0000DA00 48000018 */ b lbl_0000DA18
lbl_0000DA04:
/* 0000DA04 2C030300 */ cmpwi r3, 0x300
/* 0000DA08 4081000C */ ble lbl_0000DA14
/* 0000DA0C 38800300 */ li r4, 0x300
/* 0000DA10 48000008 */ b lbl_0000DA18
lbl_0000DA14:
/* 0000DA14 7C641B78 */ mr r4, r3
lbl_0000DA18:
/* 0000DA18 881A001F */ lbz r0, 0x1f(r26)
/* 0000DA1C A87A001A */ lha r3, 0x1a(r26)
/* 0000DA20 2C000002 */ cmpwi r0, 2
/* 0000DA24 7F832214 */ add r28, r3, r4
/* 0000DA28 40820078 */ bne lbl_0000DAA0
/* 0000DA2C 4BFFB989 */ bl lbl_000093B4
/* 0000DA30 28030000 */ cmplwi r3, 0
/* 0000DA34 4082000C */ bne lbl_0000DA40
/* 0000DA38 AB9B0092 */ lha r28, 0x92(r27)
/* 0000DA3C 48000064 */ b lbl_0000DAA0
lbl_0000DA40:
/* 0000DA40 A81B0092 */ lha r0, 0x92(r27)
/* 0000DA44 7F840734 */ extsh r4, r28
/* 0000DA48 3C600000 */ lis r3, lbl_000263B0@ha
/* 0000DA4C C81D00C0 */ lfd f0, 0xc0(r29)
/* 0000DA50 7C040050 */ subf r0, r4, r0
/* 0000DA54 6C008000 */ xoris r0, r0, 0x8000
/* 0000DA58 C8430000 */ lfd f2, lbl_000263B0@l(r3)
/* 0000DA5C 9001009C */ stw r0, 0x9c(r1)
/* 0000DA60 3C004330 */ lis r0, 0x4330
/* 0000DA64 6C848000 */ xoris r4, r4, 0x8000
/* 0000DA68 90010098 */ stw r0, 0x98(r1)
/* 0000DA6C 3CA00000 */ lis r5, lbl_000263B0@ha
/* 0000DA70 C8210098 */ lfd f1, 0x98(r1)
/* 0000DA74 908100A4 */ stw r4, 0xa4(r1)
/* 0000DA78 FC211028 */ fsub f1, f1, f2
/* 0000DA7C C8450000 */ lfd f2, lbl_000263B0@l(r5)
/* 0000DA80 900100A0 */ stw r0, 0xa0(r1)
/* 0000DA84 FC010024 */ fdiv f0, f1, f0
/* 0000DA88 C82100A0 */ lfd f1, 0xa0(r1)
/* 0000DA8C FC211028 */ fsub f1, f1, f2
/* 0000DA90 FC01002A */ fadd f0, f1, f0
/* 0000DA94 FC00001E */ fctiwz f0, f0
/* 0000DA98 D8010090 */ stfd f0, 0x90(r1)
/* 0000DA9C 83810094 */ lwz r28, 0x94(r1)
lbl_0000DAA0:
/* 0000DAA0 881A001F */ lbz r0, 0x1f(r26)
/* 0000DAA4 7C000774 */ extsb r0, r0
/* 0000DAA8 2C000007 */ cmpwi r0, 7
/* 0000DAAC 4182000C */ beq lbl_0000DAB8
/* 0000DAB0 2C000013 */ cmpwi r0, 0x13
/* 0000DAB4 40820010 */ bne lbl_0000DAC4
lbl_0000DAB8:
/* 0000DAB8 A87B0092 */ lha r3, 0x92(r27)
/* 0000DABC 3F830001 */ addis r28, r3, 1
/* 0000DAC0 3B9C8000 */ addi r28, r28, -32768
lbl_0000DAC4:
/* 0000DAC4 7FE00734 */ extsh r0, r31
/* 0000DAC8 2C00E800 */ cmpwi r0, -6144
/* 0000DACC 4080000C */ bge lbl_0000DAD8
/* 0000DAD0 3BE0E800 */ li r31, -6144
/* 0000DAD4 48000010 */ b lbl_0000DAE4
lbl_0000DAD8:
/* 0000DAD8 2C001800 */ cmpwi r0, 0x1800
/* 0000DADC 40810008 */ ble lbl_0000DAE4
/* 0000DAE0 3BE01800 */ li r31, 0x1800
lbl_0000DAE4:
/* 0000DAE4 A89A00B8 */ lha r4, 0xb8(r26)
/* 0000DAE8 7FE00734 */ extsh r0, r31
/* 0000DAEC 3C600000 */ lis r3, lbl_000263B0@ha
/* 0000DAF0 C85D0030 */ lfd f2, 0x30(r29)
/* 0000DAF4 7C040050 */ subf r0, r4, r0
/* 0000DAF8 6C008000 */ xoris r0, r0, 0x8000
/* 0000DAFC C8230000 */ lfd f1, lbl_000263B0@l(r3)
/* 0000DB00 9001009C */ stw r0, 0x9c(r1)
/* 0000DB04 3C004330 */ lis r0, 0x4330
/* 0000DB08 6C848000 */ xoris r4, r4, 0x8000
/* 0000DB0C 90010098 */ stw r0, 0x98(r1)
/* 0000DB10 3CA00000 */ lis r5, lbl_000263B0@ha
/* 0000DB14 C8650000 */ lfd f3, lbl_000263B0@l(r5)
/* 0000DB18 387A000C */ addi r3, r26, 0xc
/* 0000DB1C 90810094 */ stw r4, 0x94(r1)
/* 0000DB20 C8010098 */ lfd f0, 0x98(r1)
/* 0000DB24 90010090 */ stw r0, 0x90(r1)
/* 0000DB28 FC000828 */ fsub f0, f0, f1
/* 0000DB2C C8210090 */ lfd f1, 0x90(r1)
/* 0000DB30 FC020032 */ fmul f0, f2, f0
/* 0000DB34 FC211828 */ fsub f1, f1, f3
/* 0000DB38 FC01002A */ fadd f0, f1, f0
/* 0000DB3C FC00001E */ fctiwz f0, f0
/* 0000DB40 D80100A0 */ stfd f0, 0xa0(r1)
/* 0000DB44 83E100A4 */ lwz r31, 0xa4(r1)
/* 0000DB48 B3FA00B8 */ sth r31, 0xb8(r26)
/* 0000DB4C 4BFF2685 */ bl mathutil_mtxA_from_translate
/* 0000DB50 7F830734 */ extsh r3, r28
/* 0000DB54 4BFF267D */ bl mathutil_mtxA_rotate_y
/* 0000DB58 7FE30734 */ extsh r3, r31
/* 0000DB5C 4BFF2675 */ bl mathutil_mtxA_rotate_x
/* 0000DB60 C01D0018 */ lfs f0, 0x18(r29)
/* 0000DB64 38610080 */ addi r3, r1, 0x80
/* 0000DB68 389A00AC */ addi r4, r26, 0xac
/* 0000DB6C D0010080 */ stfs f0, 0x80(r1)
/* 0000DB70 C01D0018 */ lfs f0, 0x18(r29)
/* 0000DB74 D0010084 */ stfs f0, 0x84(r1)
/* 0000DB78 C01D0020 */ lfs f0, 0x20(r29)
/* 0000DB7C D0010088 */ stfs f0, 0x88(r1)
/* 0000DB80 80BA00AC */ lwz r5, 0xac(r26)
/* 0000DB84 801A00B0 */ lwz r0, 0xb0(r26)
/* 0000DB88 90A10034 */ stw r5, 0x34(r1)
/* 0000DB8C 90010038 */ stw r0, 0x38(r1)
/* 0000DB90 801A00B4 */ lwz r0, 0xb4(r26)
/* 0000DB94 9001003C */ stw r0, 0x3c(r1)
/* 0000DB98 4BFF2639 */ bl mathutil_mtxA_tf_point
/* 0000DB9C A89A001A */ lha r4, 0x1a(r26)
/* 0000DBA0 3C7F0001 */ addis r3, r31, 1
/* 0000DBA4 3803F300 */ addi r0, r3, -3328
/* 0000DBA8 7C64E050 */ subf r3, r4, r28
/* 0000DBAC B07A010C */ sth r3, 0x10c(r26)
/* 0000DBB0 387A000C */ addi r3, r26, 0xc
/* 0000DBB4 B39A001A */ sth r28, 0x1a(r26)
/* 0000DBB8 B01A0018 */ sth r0, 0x18(r26)
/* 0000DBBC 4BFF2615 */ bl mathutil_mtxA_from_translate
/* 0000DBC0 A87A001A */ lha r3, 0x1a(r26)
/* 0000DBC4 4BFF260D */ bl mathutil_mtxA_rotate_y
/* 0000DBC8 A87A0018 */ lha r3, 0x18(r26)
/* 0000DBCC 4BFF2605 */ bl mathutil_mtxA_rotate_x
/* 0000DBD0 C01D0018 */ lfs f0, 0x18(r29)
/* 0000DBD4 D0010080 */ stfs f0, 0x80(r1)
/* 0000DBD8 C01D0018 */ lfs f0, 0x18(r29)
/* 0000DBDC D0010084 */ stfs f0, 0x84(r1)
/* 0000DBE0 C01D001C */ lfs f0, 0x1c(r29)
/* 0000DBE4 C03D0020 */ lfs f1, 0x20(r29)
/* 0000DBE8 EC210072 */ fmuls f1, f1, f1
/* 0000DBEC EC20083A */ fmadds f1, f0, f0, f1
/* 0000DBF0 4BFF25E1 */ bl mathutil_sqrt
/* 0000DBF4 D0210088 */ stfs f1, 0x88(r1)
/* 0000DBF8 389A0000 */ addi r4, r26, 0
/* 0000DBFC 38610080 */ addi r3, r1, 0x80
/* 0000DC00 4BFF25D1 */ bl mathutil_mtxA_tf_point
/* 0000DC04 881A001F */ lbz r0, 0x1f(r26)
/* 0000DC08 7C000774 */ extsb r0, r0
/* 0000DC0C 2C000003 */ cmpwi r0, 3
/* 0000DC10 4182000C */ beq lbl_0000DC1C
/* 0000DC14 2C000004 */ cmpwi r0, 4
/* 0000DC18 4082019C */ bne lbl_0000DDB4
lbl_0000DC1C:
/* 0000DC1C 3B9B001C */ addi r28, r27, 0x1c
/* 0000DC20 C03C0000 */ lfs f1, 0(r28)
/* 0000DC24 C05C0004 */ lfs f2, 4(r28)
/* 0000DC28 C01C0008 */ lfs f0, 8(r28)
/* 0000DC2C EC210072 */ fmuls f1, f1, f1
/* 0000DC30 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000DC34 EC20083A */ fmadds f1, f0, f0, f1
/* 0000DC38 4BFF2599 */ bl mathutil_sqrt
/* 0000DC3C C81D0088 */ lfd f0, 0x88(r29)
/* 0000DC40 FC010040 */ fcmpo cr0, f1, f0
/* 0000DC44 408000A0 */ bge lbl_0000DCE4
/* 0000DC48 C03C0000 */ lfs f1, 0(r28)
/* 0000DC4C C05C0004 */ lfs f2, 4(r28)
/* 0000DC50 C01C0008 */ lfs f0, 8(r28)
/* 0000DC54 EC210072 */ fmuls f1, f1, f1
/* 0000DC58 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000DC5C EC20083A */ fmadds f1, f0, f0, f1
/* 0000DC60 4BFF2571 */ bl mathutil_sqrt
/* 0000DC64 C0410074 */ lfs f2, 0x74(r1)
/* 0000DC68 C01A0000 */ lfs f0, 0(r26)
/* 0000DC6C EC001028 */ fsubs f0, f0, f2
/* 0000DC70 EC000072 */ fmuls f0, f0, f1
/* 0000DC74 EC02002A */ fadds f0, f2, f0
/* 0000DC78 D01A0000 */ stfs f0, 0(r26)
/* 0000DC7C C03C0000 */ lfs f1, 0(r28)
/* 0000DC80 C05C0004 */ lfs f2, 4(r28)
/* 0000DC84 C01C0008 */ lfs f0, 8(r28)
/* 0000DC88 EC210072 */ fmuls f1, f1, f1
/* 0000DC8C EC2208BA */ fmadds f1, f2, f2, f1
/* 0000DC90 EC20083A */ fmadds f1, f0, f0, f1
/* 0000DC94 4BFF253D */ bl mathutil_sqrt
/* 0000DC98 C0410078 */ lfs f2, 0x78(r1)
/* 0000DC9C C01A0004 */ lfs f0, 4(r26)
/* 0000DCA0 EC001028 */ fsubs f0, f0, f2
/* 0000DCA4 EC000072 */ fmuls f0, f0, f1
/* 0000DCA8 EC02002A */ fadds f0, f2, f0
/* 0000DCAC D01A0004 */ stfs f0, 4(r26)
/* 0000DCB0 C03C0000 */ lfs f1, 0(r28)
/* 0000DCB4 C05C0004 */ lfs f2, 4(r28)
/* 0000DCB8 C01C0008 */ lfs f0, 8(r28)
/* 0000DCBC EC210072 */ fmuls f1, f1, f1
/* 0000DCC0 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000DCC4 EC20083A */ fmadds f1, f0, f0, f1
/* 0000DCC8 4BFF2509 */ bl mathutil_sqrt
/* 0000DCCC C041007C */ lfs f2, 0x7c(r1)
/* 0000DCD0 C01A0008 */ lfs f0, 8(r26)
/* 0000DCD4 EC001028 */ fsubs f0, f0, f2
/* 0000DCD8 EC000072 */ fmuls f0, f0, f1
/* 0000DCDC EC02002A */ fadds f0, f2, f0
/* 0000DCE0 D01A0008 */ stfs f0, 8(r26)
lbl_0000DCE4:
/* 0000DCE4 80DA0000 */ lwz r6, 0(r26)
/* 0000DCE8 38610040 */ addi r3, r1, 0x40
/* 0000DCEC 801A0004 */ lwz r0, 4(r26)
/* 0000DCF0 3881004C */ addi r4, r1, 0x4c
/* 0000DCF4 38A00000 */ li r5, 0
/* 0000DCF8 90C10040 */ stw r6, 0x40(r1)
/* 0000DCFC 90010044 */ stw r0, 0x44(r1)
/* 0000DD00 801A0008 */ lwz r0, 8(r26)
/* 0000DD04 90010048 */ stw r0, 0x48(r1)
/* 0000DD08 C0210044 */ lfs f1, 0x44(r1)
/* 0000DD0C C01D0000 */ lfs f0, 0(r29)
/* 0000DD10 EC01002A */ fadds f0, f1, f0
/* 0000DD14 D0010044 */ stfs f0, 0x44(r1)
/* 0000DD18 4BFF24B9 */ bl raycast_stage_down
/* 0000DD1C 8001004C */ lwz r0, 0x4c(r1)
/* 0000DD20 28000000 */ cmplwi r0, 0
/* 0000DD24 41820024 */ beq lbl_0000DD48
/* 0000DD28 C85D0010 */ lfd f2, 0x10(r29)
/* 0000DD2C C0210054 */ lfs f1, 0x54(r1)
/* 0000DD30 C01A0004 */ lfs f0, 4(r26)
/* 0000DD34 FC22082A */ fadd f1, f2, f1
/* 0000DD38 FC010040 */ fcmpo cr0, f1, f0
/* 0000DD3C 4081000C */ ble lbl_0000DD48
/* 0000DD40 FC000818 */ frsp f0, f1
/* 0000DD44 D01A0004 */ stfs f0, 4(r26)
lbl_0000DD48:
/* 0000DD48 C07A000C */ lfs f3, 0xc(r26)
/* 0000DD4C C03A0000 */ lfs f1, 0(r26)
/* 0000DD50 C05A0014 */ lfs f2, 0x14(r26)
/* 0000DD54 C01A0008 */ lfs f0, 8(r26)
/* 0000DD58 EC230828 */ fsubs f1, f3, f1
/* 0000DD5C EC420028 */ fsubs f2, f2, f0
/* 0000DD60 4BFF2471 */ bl mathutil_atan2
/* 0000DD64 38038000 */ addi r0, r3, -32768
/* 0000DD68 B01A001A */ sth r0, 0x1a(r26)
/* 0000DD6C C07A0014 */ lfs f3, 0x14(r26)
/* 0000DD70 C05A0008 */ lfs f2, 8(r26)
/* 0000DD74 C03A000C */ lfs f1, 0xc(r26)
/* 0000DD78 C01A0000 */ lfs f0, 0(r26)
/* 0000DD7C EC431028 */ fsubs f2, f3, f2
/* 0000DD80 EC210028 */ fsubs f1, f1, f0
/* 0000DD84 EC210072 */ fmuls f1, f1, f1
/* 0000DD88 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000DD8C 4BFF2445 */ bl mathutil_sqrt
/* 0000DD90 C07A0010 */ lfs f3, 0x10(r26)
/* 0000DD94 FC400890 */ fmr f2, f1
/* 0000DD98 C01A0004 */ lfs f0, 4(r26)
/* 0000DD9C EC230028 */ fsubs f1, f3, f0
/* 0000DDA0 4BFF2431 */ bl mathutil_atan2
/* 0000DDA4 B07A0018 */ sth r3, 0x18(r26)
/* 0000DDA8 38000000 */ li r0, 0
/* 0000DDAC B01A001C */ sth r0, 0x1c(r26)
/* 0000DDB0 480000D4 */ b lbl_0000DE84
lbl_0000DDB4:
/* 0000DDB4 2C000002 */ cmpwi r0, 2
/* 0000DDB8 408200CC */ bne lbl_0000DE84
/* 0000DDBC C0410074 */ lfs f2, 0x74(r1)
/* 0000DDC0 C03A0000 */ lfs f1, 0(r26)
/* 0000DDC4 C81D0058 */ lfd f0, 0x58(r29)
/* 0000DDC8 EC211028 */ fsubs f1, f1, f2
/* 0000DDCC FC010024 */ fdiv f0, f1, f0
/* 0000DDD0 FC02002A */ fadd f0, f2, f0
/* 0000DDD4 FC000018 */ frsp f0, f0
/* 0000DDD8 D01A0000 */ stfs f0, 0(r26)
/* 0000DDDC C0410078 */ lfs f2, 0x78(r1)
/* 0000DDE0 C03A0004 */ lfs f1, 4(r26)
/* 0000DDE4 C81D0058 */ lfd f0, 0x58(r29)
/* 0000DDE8 EC211028 */ fsubs f1, f1, f2
/* 0000DDEC FC010024 */ fdiv f0, f1, f0
/* 0000DDF0 FC02002A */ fadd f0, f2, f0
/* 0000DDF4 FC000018 */ frsp f0, f0
/* 0000DDF8 D01A0004 */ stfs f0, 4(r26)
/* 0000DDFC C041007C */ lfs f2, 0x7c(r1)
/* 0000DE00 C03A0008 */ lfs f1, 8(r26)
/* 0000DE04 C81D0058 */ lfd f0, 0x58(r29)
/* 0000DE08 EC211028 */ fsubs f1, f1, f2
/* 0000DE0C FC010024 */ fdiv f0, f1, f0
/* 0000DE10 FC02002A */ fadd f0, f2, f0
/* 0000DE14 FC000018 */ frsp f0, f0
/* 0000DE18 D01A0008 */ stfs f0, 8(r26)
/* 0000DE1C C07A000C */ lfs f3, 0xc(r26)
/* 0000DE20 C03A0000 */ lfs f1, 0(r26)
/* 0000DE24 C05A0014 */ lfs f2, 0x14(r26)
/* 0000DE28 C01A0008 */ lfs f0, 8(r26)
/* 0000DE2C EC230828 */ fsubs f1, f3, f1
/* 0000DE30 EC420028 */ fsubs f2, f2, f0
/* 0000DE34 4BFF239D */ bl mathutil_atan2
/* 0000DE38 38038000 */ addi r0, r3, -32768
/* 0000DE3C B01A001A */ sth r0, 0x1a(r26)
/* 0000DE40 C07A0014 */ lfs f3, 0x14(r26)
/* 0000DE44 C05A0008 */ lfs f2, 8(r26)
/* 0000DE48 C03A000C */ lfs f1, 0xc(r26)
/* 0000DE4C C01A0000 */ lfs f0, 0(r26)
/* 0000DE50 EC431028 */ fsubs f2, f3, f2
/* 0000DE54 EC210028 */ fsubs f1, f1, f0
/* 0000DE58 EC210072 */ fmuls f1, f1, f1
/* 0000DE5C EC2208BA */ fmadds f1, f2, f2, f1
/* 0000DE60 4BFF2371 */ bl mathutil_sqrt
/* 0000DE64 C07A0010 */ lfs f3, 0x10(r26)
/* 0000DE68 FC400890 */ fmr f2, f1
/* 0000DE6C C01A0004 */ lfs f0, 4(r26)
/* 0000DE70 EC230028 */ fsubs f1, f3, f0
/* 0000DE74 4BFF235D */ bl mathutil_atan2
/* 0000DE78 B07A0018 */ sth r3, 0x18(r26)
/* 0000DE7C 38000000 */ li r0, 0
/* 0000DE80 B01A001C */ sth r0, 0x1c(r26)
lbl_0000DE84:
/* 0000DE84 C03A0000 */ lfs f1, 0(r26)
/* 0000DE88 38002AAA */ li r0, 0x2aaa
/* 0000DE8C C0010074 */ lfs f0, 0x74(r1)
/* 0000DE90 EC010028 */ fsubs f0, f1, f0
/* 0000DE94 D01A0094 */ stfs f0, 0x94(r26)
/* 0000DE98 C03A0004 */ lfs f1, 4(r26)
/* 0000DE9C C0010078 */ lfs f0, 0x78(r1)
/* 0000DEA0 EC010028 */ fsubs f0, f1, f0
/* 0000DEA4 D01A0098 */ stfs f0, 0x98(r26)
/* 0000DEA8 C03A0008 */ lfs f1, 8(r26)
/* 0000DEAC C001007C */ lfs f0, 0x7c(r1)
/* 0000DEB0 EC010028 */ fsubs f0, f1, f0
/* 0000DEB4 D01A009C */ stfs f0, 0x9c(r26)
/* 0000DEB8 C03A000C */ lfs f1, 0xc(r26)
/* 0000DEBC C0010068 */ lfs f0, 0x68(r1)
/* 0000DEC0 EC010028 */ fsubs f0, f1, f0
/* 0000DEC4 D01A00A0 */ stfs f0, 0xa0(r26)
/* 0000DEC8 C03A0010 */ lfs f1, 0x10(r26)
/* 0000DECC C001006C */ lfs f0, 0x6c(r1)
/* 0000DED0 EC010028 */ fsubs f0, f1, f0
/* 0000DED4 D01A00A4 */ stfs f0, 0xa4(r26)
/* 0000DED8 C03A0014 */ lfs f1, 0x14(r26)
/* 0000DEDC C0010070 */ lfs f0, 0x70(r1)
/* 0000DEE0 EC010028 */ fsubs f0, f1, f0
/* 0000DEE4 D01A00A8 */ stfs f0, 0xa8(r26)
/* 0000DEE8 B01A0030 */ sth r0, 0x30(r26)
/* 0000DEEC 881A001F */ lbz r0, 0x1f(r26)
/* 0000DEF0 7C000774 */ extsb r0, r0
/* 0000DEF4 28000013 */ cmplwi r0, 0x13
/* 0000DEF8 41810998 */ bgt lbl_0000E890
/* 0000DEFC 3C600000 */ lis r3, lbl_00026DA0@ha
/* 0000DF00 38630000 */ addi r3, r3, lbl_00026DA0@l
/* 0000DF04 5400103A */ slwi r0, r0, 2
/* 0000DF08 7C03002E */ lwzx r0, r3, r0
/* 0000DF0C 7C0903A6 */ mtctr r0
/* 0000DF10 4E800420 */ bctr 
lbl_0000DF14:
/* 0000DF14 4BFFB4F1 */ bl lbl_00009404
/* 0000DF18 3C800000 */ lis r4, modeCtrl@ha
/* 0000DF1C 3BE40000 */ addi r31, r4, modeCtrl@l
/* 0000DF20 5464063E */ clrlwi r4, r3, 0x18
/* 0000DF24 807F002C */ lwz r3, 0x2c(r31)
/* 0000DF28 4BFFB4AD */ bl lbl_000093D4
/* 0000DF2C 5460063E */ clrlwi r0, r3, 0x18
/* 0000DF30 28000003 */ cmplwi r0, 3
/* 0000DF34 418100A4 */ bgt lbl_0000DFD8
/* 0000DF38 881A001F */ lbz r0, 0x1f(r26)
/* 0000DF3C 2C000007 */ cmpwi r0, 7
/* 0000DF40 40820018 */ bne lbl_0000DF58
/* 0000DF44 C03A0010 */ lfs f1, 0x10(r26)
/* 0000DF48 C81D0010 */ lfd f0, 0x10(r29)
/* 0000DF4C FC010028 */ fsub f0, f1, f0
/* 0000DF50 FC000018 */ frsp f0, f0
/* 0000DF54 D01A0010 */ stfs f0, 0x10(r26)
lbl_0000DF58:
/* 0000DF58 C03A0004 */ lfs f1, 4(r26)
/* 0000DF5C C81D0010 */ lfd f0, 0x10(r29)
/* 0000DF60 FC01002A */ fadd f0, f1, f0
/* 0000DF64 FC000018 */ frsp f0, f0
/* 0000DF68 D01A0004 */ stfs f0, 4(r26)
/* 0000DF6C C07A000C */ lfs f3, 0xc(r26)
/* 0000DF70 C03A0000 */ lfs f1, 0(r26)
/* 0000DF74 C05A0014 */ lfs f2, 0x14(r26)
/* 0000DF78 C01A0008 */ lfs f0, 8(r26)
/* 0000DF7C EC230828 */ fsubs f1, f3, f1
/* 0000DF80 EC420028 */ fsubs f2, f2, f0
/* 0000DF84 4BFF224D */ bl mathutil_atan2
/* 0000DF88 38038000 */ addi r0, r3, -32768
/* 0000DF8C B01A001A */ sth r0, 0x1a(r26)
/* 0000DF90 C07A0014 */ lfs f3, 0x14(r26)
/* 0000DF94 C05A0008 */ lfs f2, 8(r26)
/* 0000DF98 C03A000C */ lfs f1, 0xc(r26)
/* 0000DF9C C01A0000 */ lfs f0, 0(r26)
/* 0000DFA0 EC431028 */ fsubs f2, f3, f2
/* 0000DFA4 EC210028 */ fsubs f1, f1, f0
/* 0000DFA8 EC210072 */ fmuls f1, f1, f1
/* 0000DFAC EC2208BA */ fmadds f1, f2, f2, f1
/* 0000DFB0 4BFF2221 */ bl mathutil_sqrt
/* 0000DFB4 C07A0010 */ lfs f3, 0x10(r26)
/* 0000DFB8 FC400890 */ fmr f2, f1
/* 0000DFBC C01A0004 */ lfs f0, 4(r26)
/* 0000DFC0 EC230028 */ fsubs f1, f3, f0
/* 0000DFC4 4BFF220D */ bl mathutil_atan2
/* 0000DFC8 B07A0018 */ sth r3, 0x18(r26)
/* 0000DFCC 38000000 */ li r0, 0
/* 0000DFD0 B01A001C */ sth r0, 0x1c(r26)
/* 0000DFD4 480008BC */ b lbl_0000E890
lbl_0000DFD8:
/* 0000DFD8 C01D0018 */ lfs f0, 0x18(r29)
/* 0000DFDC 3C600000 */ lis r3, globalAnimTimer@ha
/* 0000DFE0 3B830000 */ addi r28, r3, globalAnimTimer@l
/* 0000DFE4 D0010028 */ stfs f0, 0x28(r1)
/* 0000DFE8 807E0034 */ lwz r3, 0x34(r30)
/* 0000DFEC 801C0000 */ lwz r0, 0(r28)
/* 0000DFF0 7C030050 */ subf r0, r3, r0
/* 0000DFF4 54035828 */ slwi r3, r0, 0xb
/* 0000DFF8 4BFF21D9 */ bl mathutil_sin
/* 0000DFFC 809E0034 */ lwz r4, 0x34(r30)
/* 0000E000 3C600000 */ lis r3, lbl_00026380@ha
/* 0000E004 801C0000 */ lwz r0, 0(r28)
/* 0000E008 3F604330 */ lis r27, 0x4330
/* 0000E00C C8830000 */ lfd f4, lbl_00026380@l(r3)
/* 0000E010 7C040050 */ subf r0, r4, r0
/* 0000E014 C05D00C8 */ lfs f2, 0xc8(r29)
/* 0000E018 90010094 */ stw r0, 0x94(r1)
/* 0000E01C C81D0070 */ lfd f0, 0x70(r29)
/* 0000E020 93610090 */ stw r27, 0x90(r1)
/* 0000E024 C8610090 */ lfd f3, 0x90(r1)
/* 0000E028 EC632028 */ fsubs f3, f3, f4
/* 0000E02C EC431024 */ fdivs f2, f3, f2
/* 0000E030 FC211024 */ fdiv f1, f1, f2
/* 0000E034 FC00082A */ fadd f0, f0, f1
/* 0000E038 FC000018 */ frsp f0, f0
/* 0000E03C D001002C */ stfs f0, 0x2c(r1)
/* 0000E040 807E0034 */ lwz r3, 0x34(r30)
/* 0000E044 801C0000 */ lwz r0, 0(r28)
/* 0000E048 7C030050 */ subf r0, r3, r0
/* 0000E04C 54035828 */ slwi r3, r0, 0xb
/* 0000E050 4BFF2181 */ bl mathutil_sin
/* 0000E054 809E0034 */ lwz r4, 0x34(r30)
/* 0000E058 3C600000 */ lis r3, lbl_00026380@ha
/* 0000E05C 801C0000 */ lwz r0, 0(r28)
/* 0000E060 C81D0078 */ lfd f0, 0x78(r29)
/* 0000E064 7C040050 */ subf r0, r4, r0
/* 0000E068 C8630000 */ lfd f3, lbl_00026380@l(r3)
/* 0000E06C 9001009C */ stw r0, 0x9c(r1)
/* 0000E070 FC800072 */ fmul f4, f0, f1
/* 0000E074 C03D00C8 */ lfs f1, 0xc8(r29)
/* 0000E078 93610098 */ stw r27, 0x98(r1)
/* 0000E07C C81D0088 */ lfd f0, 0x88(r29)
/* 0000E080 C8410098 */ lfd f2, 0x98(r1)
/* 0000E084 EC421828 */ fsubs f2, f2, f3
/* 0000E088 EC220824 */ fdivs f1, f2, f1
/* 0000E08C FC240824 */ fdiv f1, f4, f1
/* 0000E090 FC00082A */ fadd f0, f0, f1
/* 0000E094 FC000018 */ frsp f0, f0
/* 0000E098 D0010030 */ stfs f0, 0x30(r1)
/* 0000E09C 4BFF2135 */ bl mathutil_mtxA_from_identity
/* 0000E0A0 801F002C */ lwz r0, 0x2c(r31)
/* 0000E0A4 3C600000 */ lis r3, ballInfo@ha
/* 0000E0A8 3B630000 */ addi r27, r3, ballInfo@l
/* 0000E0AC 1C0001A4 */ mulli r0, r0, 0x1a4
/* 0000E0B0 7C7B0214 */ add r3, r27, r0
/* 0000E0B4 38630004 */ addi r3, r3, 4
/* 0000E0B8 4BFF2119 */ bl mathutil_mtxA_translate
/* 0000E0BC 801F002C */ lwz r0, 0x2c(r31)
/* 0000E0C0 1C0001A4 */ mulli r0, r0, 0x1a4
/* 0000E0C4 7C7B0214 */ add r3, r27, r0
/* 0000E0C8 A8630092 */ lha r3, 0x92(r3)
/* 0000E0CC 3C630001 */ addis r3, r3, 1
/* 0000E0D0 38638000 */ addi r3, r3, -32768
/* 0000E0D4 4BFF20FD */ bl mathutil_mtxA_rotate_y
/* 0000E0D8 38610028 */ addi r3, r1, 0x28
/* 0000E0DC 38830000 */ addi r4, r3, 0
/* 0000E0E0 4BFF20F1 */ bl mathutil_mtxA_tf_point
/* 0000E0E4 80610028 */ lwz r3, 0x28(r1)
/* 0000E0E8 8001002C */ lwz r0, 0x2c(r1)
/* 0000E0EC 907A0000 */ stw r3, 0(r26)
/* 0000E0F0 901A0004 */ stw r0, 4(r26)
/* 0000E0F4 80010030 */ lwz r0, 0x30(r1)
/* 0000E0F8 901A0008 */ stw r0, 8(r26)
/* 0000E0FC C07A000C */ lfs f3, 0xc(r26)
/* 0000E100 C03A0000 */ lfs f1, 0(r26)
/* 0000E104 C05A0014 */ lfs f2, 0x14(r26)
/* 0000E108 C01A0008 */ lfs f0, 8(r26)
/* 0000E10C EC230828 */ fsubs f1, f3, f1
/* 0000E110 EC420028 */ fsubs f2, f2, f0
/* 0000E114 4BFF20BD */ bl mathutil_atan2
/* 0000E118 38038000 */ addi r0, r3, -32768
/* 0000E11C B01A001A */ sth r0, 0x1a(r26)
/* 0000E120 C07A0014 */ lfs f3, 0x14(r26)
/* 0000E124 C05A0008 */ lfs f2, 8(r26)
/* 0000E128 C03A000C */ lfs f1, 0xc(r26)
/* 0000E12C C01A0000 */ lfs f0, 0(r26)
/* 0000E130 EC431028 */ fsubs f2, f3, f2
/* 0000E134 EC210028 */ fsubs f1, f1, f0
/* 0000E138 EC210072 */ fmuls f1, f1, f1
/* 0000E13C EC2208BA */ fmadds f1, f2, f2, f1
/* 0000E140 4BFF2091 */ bl mathutil_sqrt
/* 0000E144 C07A0010 */ lfs f3, 0x10(r26)
/* 0000E148 FC400890 */ fmr f2, f1
/* 0000E14C C01A0004 */ lfs f0, 4(r26)
/* 0000E150 EC230028 */ fsubs f1, f3, f0
/* 0000E154 4BFF207D */ bl mathutil_atan2
/* 0000E158 B07A0018 */ sth r3, 0x18(r26)
/* 0000E15C 38000000 */ li r0, 0
/* 0000E160 B01A001C */ sth r0, 0x1c(r26)
/* 0000E164 4800072C */ b lbl_0000E890
lbl_0000E168:
/* 0000E168 38000000 */ li r0, 0
/* 0000E16C 981E0001 */ stb r0, 1(r30)
/* 0000E170 48000720 */ b lbl_0000E890
lbl_0000E174:
/* 0000E174 38000000 */ li r0, 0
/* 0000E178 981E0001 */ stb r0, 1(r30)
/* 0000E17C 3C600000 */ lis r3, modeCtrl@ha
/* 0000E180 38630000 */ addi r3, r3, modeCtrl@l
/* 0000E184 8003002C */ lwz r0, 0x2c(r3)
/* 0000E188 3C600000 */ lis r3, playerControllerIDs@ha
/* 0000E18C 3CA00000 */ lis r5, controllerInfo@ha
/* 0000E190 C85D00D0 */ lfd f2, 0xd0(r29)
/* 0000E194 5404103A */ slwi r4, r0, 2
/* 0000E198 38030000 */ addi r0, r3, playerControllerIDs@l
/* 0000E19C 7C602214 */ add r3, r0, r4
/* 0000E1A0 80030000 */ lwz r0, 0(r3)
/* 0000E1A4 3C600000 */ lis r3, lbl_000263B0@ha
/* 0000E1A8 C8230000 */ lfd f1, lbl_000263B0@l(r3)
/* 0000E1AC 38650000 */ addi r3, r5, controllerInfo@l
/* 0000E1B0 1C00003C */ mulli r0, r0, 0x3c
/* 0000E1B4 7CA30214 */ add r5, r3, r0
/* 0000E1B8 88050004 */ lbz r0, 4(r5)
/* 0000E1BC 3C804330 */ lis r4, 0x4330
/* 0000E1C0 7C000774 */ extsb r0, r0
/* 0000E1C4 6C008000 */ xoris r0, r0, 0x8000
/* 0000E1C8 90010094 */ stw r0, 0x94(r1)
/* 0000E1CC 90810090 */ stw r4, 0x90(r1)
/* 0000E1D0 C8010090 */ lfd f0, 0x90(r1)
/* 0000E1D4 FC000828 */ fsub f0, f0, f1
/* 0000E1D8 FC000210 */ fabs f0, f0
/* 0000E1DC FC001040 */ fcmpo cr0, f0, f2
/* 0000E1E0 41810040 */ bgt lbl_0000E220
/* 0000E1E4 88050005 */ lbz r0, 5(r5)
/* 0000E1E8 3C600000 */ lis r3, lbl_000263B0@ha
/* 0000E1EC C8230000 */ lfd f1, lbl_000263B0@l(r3)
/* 0000E1F0 7C000774 */ extsb r0, r0
/* 0000E1F4 6C008000 */ xoris r0, r0, 0x8000
/* 0000E1F8 90010094 */ stw r0, 0x94(r1)
/* 0000E1FC 90810090 */ stw r4, 0x90(r1)
/* 0000E200 C8010090 */ lfd f0, 0x90(r1)
/* 0000E204 FC000828 */ fsub f0, f0, f1
/* 0000E208 FC000210 */ fabs f0, f0
/* 0000E20C FC001040 */ fcmpo cr0, f0, f2
/* 0000E210 41810010 */ bgt lbl_0000E220
/* 0000E214 A0050018 */ lhz r0, 0x18(r5)
/* 0000E218 5400056B */ rlwinm. r0, r0, 0, 0x15, 0x15
/* 0000E21C 41820674 */ beq lbl_0000E890
lbl_0000E220:
/* 0000E220 4BFFB205 */ bl lbl_00009424
/* 0000E224 5460063F */ clrlwi. r0, r3, 0x18
/* 0000E228 41820668 */ beq lbl_0000E890
/* 0000E22C 4BFFB0D5 */ bl lbl_00009300
/* 0000E230 5460063F */ clrlwi. r0, r3, 0x18
/* 0000E234 4182065C */ beq lbl_0000E890
/* 0000E238 4BFFB0D9 */ bl lbl_00009310
/* 0000E23C 5460063F */ clrlwi. r0, r3, 0x18
/* 0000E240 40820650 */ bne lbl_0000E890
/* 0000E244 3860010C */ li r3, 0x10c
/* 0000E248 4BFF1F89 */ bl u_play_sound_0
/* 0000E24C 3800000C */ li r0, 0xc
/* 0000E250 3C600000 */ lis r3, modeCtrl@ha
/* 0000E254 981A001F */ stb r0, 0x1f(r26)
/* 0000E258 38630000 */ addi r3, r3, modeCtrl@l
/* 0000E25C 8003002C */ lwz r0, 0x2c(r3)
/* 0000E260 3C600000 */ lis r3, ballInfo@ha
/* 0000E264 38630000 */ addi r3, r3, ballInfo@l
/* 0000E268 1C0001A4 */ mulli r0, r0, 0x1a4
/* 0000E26C 7C630214 */ add r3, r3, r0
/* 0000E270 A8630092 */ lha r3, 0x92(r3)
/* 0000E274 38000000 */ li r0, 0
/* 0000E278 907E002C */ stw r3, 0x2c(r30)
/* 0000E27C 901E0024 */ stw r0, 0x24(r30)
/* 0000E280 48000610 */ b lbl_0000E890
lbl_0000E284:
/* 0000E284 38000000 */ li r0, 0
/* 0000E288 981A0026 */ stb r0, 0x26(r26)
/* 0000E28C 4BFFB039 */ bl lbl_000092C4
/* 0000E290 C05B0004 */ lfs f2, 4(r27)
/* 0000E294 C81D0010 */ lfd f0, 0x10(r29)
/* 0000E298 EC22082A */ fadds f1, f2, f1
/* 0000E29C FC010032 */ fmul f0, f1, f0
/* 0000E2A0 FC000018 */ frsp f0, f0
/* 0000E2A4 D01A000C */ stfs f0, 0xc(r26)
/* 0000E2A8 4BFFB029 */ bl lbl_000092D0
/* 0000E2AC C81D0040 */ lfd f0, 0x40(r29)
/* 0000E2B0 C05B0008 */ lfs f2, 8(r27)
/* 0000E2B4 FC20082A */ fadd f1, f0, f1
/* 0000E2B8 C81D0010 */ lfd f0, 0x10(r29)
/* 0000E2BC FC22082A */ fadd f1, f2, f1
/* 0000E2C0 FC010032 */ fmul f0, f1, f0
/* 0000E2C4 FC000018 */ frsp f0, f0
/* 0000E2C8 D01A0010 */ stfs f0, 0x10(r26)
/* 0000E2CC 4BFFB015 */ bl lbl_000092E0
/* 0000E2D0 C05B000C */ lfs f2, 0xc(r27)
/* 0000E2D4 C81D0010 */ lfd f0, 0x10(r29)
/* 0000E2D8 EC22082A */ fadds f1, f2, f1
/* 0000E2DC FC010032 */ fmul f0, f1, f0
/* 0000E2E0 FC000018 */ frsp f0, f0
/* 0000E2E4 D01A0014 */ stfs f0, 0x14(r26)
/* 0000E2E8 C03A0014 */ lfs f1, 0x14(r26)
/* 0000E2EC C01B000C */ lfs f0, 0xc(r27)
/* 0000E2F0 C07A0010 */ lfs f3, 0x10(r26)
/* 0000E2F4 C05B0008 */ lfs f2, 8(r27)
/* 0000E2F8 EC810028 */ fsubs f4, f1, f0
/* 0000E2FC C03A000C */ lfs f1, 0xc(r26)
/* 0000E300 C01B0004 */ lfs f0, 4(r27)
/* 0000E304 EC431028 */ fsubs f2, f3, f2
/* 0000E308 EC210028 */ fsubs f1, f1, f0
/* 0000E30C EC210072 */ fmuls f1, f1, f1
/* 0000E310 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000E314 EC24093A */ fmadds f1, f4, f4, f1
/* 0000E318 4BFF1EB9 */ bl mathutil_sqrt
/* 0000E31C FFC00890 */ fmr f30, f1
/* 0000E320 38601555 */ li r3, 0x1555
/* 0000E324 4BFF1EAD */ bl mathutil_tan
/* 0000E328 EFFE0824 */ fdivs f31, f30, f1
/* 0000E32C C81D0048 */ lfd f0, 0x48(r29)
/* 0000E330 FC1F0040 */ fcmpo cr0, f31, f0
/* 0000E334 40800008 */ bge lbl_0000E33C
/* 0000E338 C3FD0050 */ lfs f31, 0x50(r29)
lbl_0000E33C:
/* 0000E33C 881E0001 */ lbz r0, 1(r30)
/* 0000E340 28000000 */ cmplwi r0, 0
/* 0000E344 40820194 */ bne lbl_0000E4D8
/* 0000E348 4BFFAF7D */ bl lbl_000092C4
/* 0000E34C C01B0004 */ lfs f0, 4(r27)
/* 0000E350 EC010028 */ fsubs f0, f1, f0
/* 0000E354 D001001C */ stfs f0, 0x1c(r1)
/* 0000E358 C01D0018 */ lfs f0, 0x18(r29)
/* 0000E35C D0010020 */ stfs f0, 0x20(r1)
/* 0000E360 4BFFAF81 */ bl lbl_000092E0
/* 0000E364 C01B000C */ lfs f0, 0xc(r27)
/* 0000E368 3861001C */ addi r3, r1, 0x1c
/* 0000E36C EC010028 */ fsubs f0, f1, f0
/* 0000E370 D0010024 */ stfs f0, 0x24(r1)
/* 0000E374 4BFF1E5D */ bl mathutil_vec_normalize_len
/* 0000E378 4BFF1E59 */ bl mathutil_mtxA_from_identity
/* 0000E37C 4BFFB089 */ bl lbl_00009404
/* 0000E380 5460063E */ clrlwi r0, r3, 0x18
/* 0000E384 2800000F */ cmplwi r0, 0xf
/* 0000E388 40820028 */ bne lbl_0000E3B0
/* 0000E38C 4BFF1E45 */ bl rand
/* 0000E390 5460047E */ clrlwi r0, r3, 0x11
/* 0000E394 7C037E70 */ srawi r3, r0, 0xf
/* 0000E398 7C630194 */ addze r3, r3
/* 0000E39C 54637820 */ slwi r3, r3, 0xf
/* 0000E3A0 7C630010 */ subfc r3, r3, r0
/* 0000E3A4 38634000 */ addi r3, r3, 0x4000
/* 0000E3A8 4BFF1E29 */ bl mathutil_mtxA_rotate_y
/* 0000E3AC 48000058 */ b lbl_0000E404
lbl_0000E3B0:
/* 0000E3B0 4BFFB055 */ bl lbl_00009404
/* 0000E3B4 5460063E */ clrlwi r0, r3, 0x18
/* 0000E3B8 28000011 */ cmplwi r0, 0x11
/* 0000E3BC 40820028 */ bne lbl_0000E3E4
/* 0000E3C0 4BFF1E11 */ bl rand
/* 0000E3C4 5460047E */ clrlwi r0, r3, 0x11
/* 0000E3C8 7C036E70 */ srawi r3, r0, 0xd
/* 0000E3CC 7C630194 */ addze r3, r3
/* 0000E3D0 54636824 */ slwi r3, r3, 0xd
/* 0000E3D4 7C630010 */ subfc r3, r3, r0
/* 0000E3D8 38633000 */ addi r3, r3, 0x3000
/* 0000E3DC 4BFF1DF5 */ bl mathutil_mtxA_rotate_y
/* 0000E3E0 48000024 */ b lbl_0000E404
lbl_0000E3E4:
/* 0000E3E4 4BFF1DED */ bl rand
/* 0000E3E8 5463047E */ clrlwi r3, r3, 0x11
/* 0000E3EC 7C607E70 */ srawi r0, r3, 0xf
/* 0000E3F0 7C000194 */ addze r0, r0
/* 0000E3F4 54007820 */ slwi r0, r0, 0xf
/* 0000E3F8 7C001810 */ subfc r0, r0, r3
/* 0000E3FC 20604000 */ subfic r3, r0, 0x4000
/* 0000E400 4BFF1DD1 */ bl mathutil_mtxA_rotate_y
lbl_0000E404:
/* 0000E404 3861001C */ addi r3, r1, 0x1c
/* 0000E408 38830000 */ addi r4, r3, 0
/* 0000E40C 4BFF1DC5 */ bl mathutil_mtxA_tf_vec
/* 0000E410 3C600000 */ lis r3, decodedStageLzPtr@ha
/* 0000E414 38630000 */ addi r3, r3, decodedStageLzPtr@l
/* 0000E418 80630000 */ lwz r3, 0(r3)
/* 0000E41C 80030088 */ lwz r0, 0x88(r3)
/* 0000E420 28000000 */ cmplwi r0, 0
/* 0000E424 41820088 */ beq lbl_0000E4AC
/* 0000E428 C021001C */ lfs f1, 0x1c(r1)
/* 0000E42C C0410020 */ lfs f2, 0x20(r1)
/* 0000E430 C0010024 */ lfs f0, 0x24(r1)
/* 0000E434 EC210072 */ fmuls f1, f1, f1
/* 0000E438 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000E43C EC20083A */ fmadds f1, f0, f0, f1
/* 0000E440 4BFF1D91 */ bl mathutil_sqrt
/* 0000E444 FFC00890 */ fmr f30, f1
/* 0000E448 4BFFAE7D */ bl lbl_000092C4
/* 0000E44C C001001C */ lfs f0, 0x1c(r1)
/* 0000E450 EC00F024 */ fdivs f0, f0, f30
/* 0000E454 EC1F0032 */ fmuls f0, f31, f0
/* 0000E458 EC01002A */ fadds f0, f1, f0
/* 0000E45C D01A0000 */ stfs f0, 0(r26)
/* 0000E460 4BFFAE71 */ bl lbl_000092D0
/* 0000E464 C81D0058 */ lfd f0, 0x58(r29)
/* 0000E468 FC00082A */ fadd f0, f0, f1
/* 0000E46C FC000018 */ frsp f0, f0
/* 0000E470 D01A0004 */ stfs f0, 4(r26)
/* 0000E474 C021001C */ lfs f1, 0x1c(r1)
/* 0000E478 C0410020 */ lfs f2, 0x20(r1)
/* 0000E47C C0010024 */ lfs f0, 0x24(r1)
/* 0000E480 EC210072 */ fmuls f1, f1, f1
/* 0000E484 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000E488 EC20083A */ fmadds f1, f0, f0, f1
/* 0000E48C 4BFF1D45 */ bl mathutil_sqrt
/* 0000E490 FFC00890 */ fmr f30, f1
/* 0000E494 4BFFAE4D */ bl lbl_000092E0
/* 0000E498 C0010024 */ lfs f0, 0x24(r1)
/* 0000E49C EC00F024 */ fdivs f0, f0, f30
/* 0000E4A0 EC1F0032 */ fmuls f0, f31, f0
/* 0000E4A4 EC01002A */ fadds f0, f1, f0
/* 0000E4A8 D01A0008 */ stfs f0, 8(r26)
lbl_0000E4AC:
/* 0000E4AC 80A1001C */ lwz r5, 0x1c(r1)
/* 0000E4B0 38000001 */ li r0, 1
/* 0000E4B4 80810020 */ lwz r4, 0x20(r1)
/* 0000E4B8 38600002 */ li r3, 2
/* 0000E4BC 90BE0004 */ stw r5, 4(r30)
/* 0000E4C0 909E0008 */ stw r4, 8(r30)
/* 0000E4C4 80810024 */ lwz r4, 0x24(r1)
/* 0000E4C8 909E000C */ stw r4, 0xc(r30)
/* 0000E4CC 981E0001 */ stb r0, 1(r30)
/* 0000E4D0 4BFF1D01 */ bl erase_effect
/* 0000E4D4 4800008C */ b lbl_0000E560
lbl_0000E4D8:
/* 0000E4D8 3B7E0004 */ addi r27, r30, 4
/* 0000E4DC C03B0000 */ lfs f1, 0(r27)
/* 0000E4E0 C05B0004 */ lfs f2, 4(r27)
/* 0000E4E4 C01B0008 */ lfs f0, 8(r27)
/* 0000E4E8 EC210072 */ fmuls f1, f1, f1
/* 0000E4EC EC2208BA */ fmadds f1, f2, f2, f1
/* 0000E4F0 EC20083A */ fmadds f1, f0, f0, f1
/* 0000E4F4 4BFF1CDD */ bl mathutil_sqrt
/* 0000E4F8 FFC00890 */ fmr f30, f1
/* 0000E4FC 4BFFADC9 */ bl lbl_000092C4
/* 0000E500 C01E0004 */ lfs f0, 4(r30)
/* 0000E504 EC00F024 */ fdivs f0, f0, f30
/* 0000E508 EC1F0032 */ fmuls f0, f31, f0
/* 0000E50C EC01002A */ fadds f0, f1, f0
/* 0000E510 D01A0000 */ stfs f0, 0(r26)
/* 0000E514 4BFFADBD */ bl lbl_000092D0
/* 0000E518 C81D0058 */ lfd f0, 0x58(r29)
/* 0000E51C FC00082A */ fadd f0, f0, f1
/* 0000E520 FC000018 */ frsp f0, f0
/* 0000E524 D01A0004 */ stfs f0, 4(r26)
/* 0000E528 C03B0000 */ lfs f1, 0(r27)
/* 0000E52C C05B0004 */ lfs f2, 4(r27)
/* 0000E530 C01B0008 */ lfs f0, 8(r27)
/* 0000E534 EC210072 */ fmuls f1, f1, f1
/* 0000E538 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000E53C EC20083A */ fmadds f1, f0, f0, f1
/* 0000E540 4BFF1C91 */ bl mathutil_sqrt
/* 0000E544 FFC00890 */ fmr f30, f1
/* 0000E548 4BFFAD99 */ bl lbl_000092E0
/* 0000E54C C01E000C */ lfs f0, 0xc(r30)
/* 0000E550 EC00F024 */ fdivs f0, f0, f30
/* 0000E554 EC1F0032 */ fmuls f0, f31, f0
/* 0000E558 EC01002A */ fadds f0, f1, f0
/* 0000E55C D01A0008 */ stfs f0, 8(r26)
lbl_0000E560:
/* 0000E560 C07A0014 */ lfs f3, 0x14(r26)
/* 0000E564 C05A0008 */ lfs f2, 8(r26)
/* 0000E568 C03A000C */ lfs f1, 0xc(r26)
/* 0000E56C C01A0000 */ lfs f0, 0(r26)
/* 0000E570 EC431028 */ fsubs f2, f3, f2
/* 0000E574 EC210028 */ fsubs f1, f1, f0
/* 0000E578 EC210072 */ fmuls f1, f1, f1
/* 0000E57C EC2208BA */ fmadds f1, f2, f2, f1
/* 0000E580 4BFF1C51 */ bl mathutil_sqrt
/* 0000E584 C07A0010 */ lfs f3, 0x10(r26)
/* 0000E588 FC400890 */ fmr f2, f1
/* 0000E58C C01A0004 */ lfs f0, 4(r26)
/* 0000E590 EC230028 */ fsubs f1, f3, f0
/* 0000E594 4BFF1C3D */ bl mathutil_atan2
/* 0000E598 B07A0018 */ sth r3, 0x18(r26)
/* 0000E59C C07A000C */ lfs f3, 0xc(r26)
/* 0000E5A0 C03A0000 */ lfs f1, 0(r26)
/* 0000E5A4 C05A0014 */ lfs f2, 0x14(r26)
/* 0000E5A8 C01A0008 */ lfs f0, 8(r26)
/* 0000E5AC EC230828 */ fsubs f1, f3, f1
/* 0000E5B0 EC420028 */ fsubs f2, f2, f0
/* 0000E5B4 4BFF1C1D */ bl mathutil_atan2
/* 0000E5B8 38038000 */ addi r0, r3, -32768
/* 0000E5BC B01A001A */ sth r0, 0x1a(r26)
/* 0000E5C0 38000000 */ li r0, 0
/* 0000E5C4 B01A010C */ sth r0, 0x10c(r26)
/* 0000E5C8 480002C8 */ b lbl_0000E890
lbl_0000E5CC:
/* 0000E5CC C03E0020 */ lfs f1, 0x20(r30)
/* 0000E5D0 C81D0060 */ lfd f0, 0x60(r29)
/* 0000E5D4 FC010040 */ fcmpo cr0, f1, f0
/* 0000E5D8 408101F4 */ ble lbl_0000E7CC
/* 0000E5DC 4BFFACE9 */ bl lbl_000092C4
/* 0000E5E0 C01B0004 */ lfs f0, 4(r27)
/* 0000E5E4 EC010028 */ fsubs f0, f1, f0
/* 0000E5E8 D0010010 */ stfs f0, 0x10(r1)
/* 0000E5EC C01D0018 */ lfs f0, 0x18(r29)
/* 0000E5F0 D0010014 */ stfs f0, 0x14(r1)
/* 0000E5F4 4BFFACED */ bl lbl_000092E0
/* 0000E5F8 C01B000C */ lfs f0, 0xc(r27)
/* 0000E5FC 38610010 */ addi r3, r1, 0x10
/* 0000E600 EC010028 */ fsubs f0, f1, f0
/* 0000E604 D0010018 */ stfs f0, 0x18(r1)
/* 0000E608 4BFF1BC9 */ bl mathutil_vec_normalize_len
/* 0000E60C 4BFF1BC5 */ bl mathutil_mtxA_from_identity
/* 0000E610 4BFF1BC1 */ bl rand
/* 0000E614 5463047E */ clrlwi r3, r3, 0x11
/* 0000E618 7C600E70 */ srawi r0, r3, 1
/* 0000E61C 7C000194 */ addze r0, r0
/* 0000E620 5400083C */ slwi r0, r0, 1
/* 0000E624 7C001811 */ subfc. r0, r0, r3
/* 0000E628 40820074 */ bne lbl_0000E69C
/* 0000E62C 4BFF1BA5 */ bl rand
/* 0000E630 3C80B60B */ lis r4, 0xb60b
/* 0000E634 C03D00D8 */ lfs f1, 0xd8(r29)
/* 0000E638 5465047E */ clrlwi r5, r3, 0x11
/* 0000E63C C01D00DC */ lfs f0, 0xdc(r29)
/* 0000E640 380460B7 */ addi r0, r4, 0x60b7
/* 0000E644 7C002896 */ mulhw r0, r0, r5
/* 0000E648 7C002A14 */ add r0, r0, r5
/* 0000E64C 7C003670 */ srawi r0, r0, 6
/* 0000E650 54030FFE */ srwi r3, r0, 0x1f
/* 0000E654 7C001A14 */ add r0, r0, r3
/* 0000E658 1C00005A */ mulli r0, r0, 0x5a
/* 0000E65C 7C002850 */ subf r0, r0, r5
/* 0000E660 6C008000 */ xoris r0, r0, 0x8000
/* 0000E664 90010094 */ stw r0, 0x94(r1)
/* 0000E668 3C004330 */ lis r0, 0x4330
/* 0000E66C 3C600000 */ lis r3, lbl_000263B0@ha
/* 0000E670 90010090 */ stw r0, 0x90(r1)
/* 0000E674 C8630000 */ lfd f3, lbl_000263B0@l(r3)
/* 0000E678 C8410090 */ lfd f2, 0x90(r1)
/* 0000E67C EC421828 */ fsubs f2, f2, f3
/* 0000E680 EC2100B2 */ fmuls f1, f1, f2
/* 0000E684 EC010024 */ fdivs f0, f1, f0
/* 0000E688 FC00001E */ fctiwz f0, f0
/* 0000E68C D8010098 */ stfd f0, 0x98(r1)
/* 0000E690 8061009C */ lwz r3, 0x9c(r1)
/* 0000E694 4BFF1B3D */ bl mathutil_mtxA_rotate_y
/* 0000E698 48000070 */ b lbl_0000E708
lbl_0000E69C:
/* 0000E69C 4BFF1B35 */ bl rand
/* 0000E6A0 3C80B60B */ lis r4, 0xb60b
/* 0000E6A4 C03D00E0 */ lfs f1, 0xe0(r29)
/* 0000E6A8 5465047E */ clrlwi r5, r3, 0x11
/* 0000E6AC C01D00DC */ lfs f0, 0xdc(r29)
/* 0000E6B0 380460B7 */ addi r0, r4, 0x60b7
/* 0000E6B4 7C002896 */ mulhw r0, r0, r5
/* 0000E6B8 7C002A14 */ add r0, r0, r5
/* 0000E6BC 7C003670 */ srawi r0, r0, 6
/* 0000E6C0 54030FFE */ srwi r3, r0, 0x1f
/* 0000E6C4 7C001A14 */ add r0, r0, r3
/* 0000E6C8 1C00005A */ mulli r0, r0, 0x5a
/* 0000E6CC 7C002850 */ subf r0, r0, r5
/* 0000E6D0 6C008000 */ xoris r0, r0, 0x8000
/* 0000E6D4 90010094 */ stw r0, 0x94(r1)
/* 0000E6D8 3C004330 */ lis r0, 0x4330
/* 0000E6DC 3C600000 */ lis r3, lbl_000263B0@ha
/* 0000E6E0 90010090 */ stw r0, 0x90(r1)
/* 0000E6E4 C8630000 */ lfd f3, lbl_000263B0@l(r3)
/* 0000E6E8 C8410090 */ lfd f2, 0x90(r1)
/* 0000E6EC EC421828 */ fsubs f2, f2, f3
/* 0000E6F0 EC2100B2 */ fmuls f1, f1, f2
/* 0000E6F4 EC010024 */ fdivs f0, f1, f0
/* 0000E6F8 FC00001E */ fctiwz f0, f0
/* 0000E6FC D8010098 */ stfd f0, 0x98(r1)
/* 0000E700 8061009C */ lwz r3, 0x9c(r1)
/* 0000E704 4BFF1ACD */ bl mathutil_mtxA_rotate_y
lbl_0000E708:
/* 0000E708 38610010 */ addi r3, r1, 0x10
/* 0000E70C 38830000 */ addi r4, r3, 0
/* 0000E710 4BFF1AC1 */ bl mathutil_mtxA_tf_vec
/* 0000E714 C0210010 */ lfs f1, 0x10(r1)
/* 0000E718 C0410014 */ lfs f2, 0x14(r1)
/* 0000E71C C0010018 */ lfs f0, 0x18(r1)
/* 0000E720 EC210072 */ fmuls f1, f1, f1
/* 0000E724 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000E728 EC20083A */ fmadds f1, f0, f0, f1
/* 0000E72C 4BFF1AA5 */ bl mathutil_sqrt
/* 0000E730 C0010010 */ lfs f0, 0x10(r1)
/* 0000E734 C85D0098 */ lfd f2, 0x98(r29)
/* 0000E738 EC000824 */ fdivs f0, f0, f1
/* 0000E73C C03B0004 */ lfs f1, 4(r27)
/* 0000E740 FC020032 */ fmul f0, f2, f0
/* 0000E744 FC01002A */ fadd f0, f1, f0
/* 0000E748 FC000018 */ frsp f0, f0
/* 0000E74C D01A0000 */ stfs f0, 0(r26)
/* 0000E750 C83D0058 */ lfd f1, 0x58(r29)
/* 0000E754 C01B0008 */ lfs f0, 8(r27)
/* 0000E758 FC01002A */ fadd f0, f1, f0
/* 0000E75C FC000018 */ frsp f0, f0
/* 0000E760 D01A0004 */ stfs f0, 4(r26)
/* 0000E764 C0210010 */ lfs f1, 0x10(r1)
/* 0000E768 C0410014 */ lfs f2, 0x14(r1)
/* 0000E76C C0010018 */ lfs f0, 0x18(r1)
/* 0000E770 EC210072 */ fmuls f1, f1, f1
/* 0000E774 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000E778 EC20083A */ fmadds f1, f0, f0, f1
/* 0000E77C 4BFF1A55 */ bl mathutil_sqrt
/* 0000E780 C0010018 */ lfs f0, 0x18(r1)
/* 0000E784 38600002 */ li r3, 2
/* 0000E788 C85D0098 */ lfd f2, 0x98(r29)
/* 0000E78C EC000824 */ fdivs f0, f0, f1
/* 0000E790 C03B000C */ lfs f1, 0xc(r27)
/* 0000E794 FC020032 */ fmul f0, f2, f0
/* 0000E798 FC01002A */ fadd f0, f1, f0
/* 0000E79C FC000018 */ frsp f0, f0
/* 0000E7A0 D01A0008 */ stfs f0, 8(r26)
/* 0000E7A4 809A0000 */ lwz r4, 0(r26)
/* 0000E7A8 801A0004 */ lwz r0, 4(r26)
/* 0000E7AC 909E0004 */ stw r4, 4(r30)
/* 0000E7B0 901E0008 */ stw r0, 8(r30)
/* 0000E7B4 801A0008 */ lwz r0, 8(r26)
/* 0000E7B8 901E000C */ stw r0, 0xc(r30)
/* 0000E7BC C01D0018 */ lfs f0, 0x18(r29)
/* 0000E7C0 D01E0020 */ stfs f0, 0x20(r30)
/* 0000E7C4 4BFF1A0D */ bl erase_effect
/* 0000E7C8 48000048 */ b lbl_0000E810
lbl_0000E7CC:
/* 0000E7CC 807E0004 */ lwz r3, 4(r30)
/* 0000E7D0 389B001C */ addi r4, r27, 0x1c
/* 0000E7D4 801E0008 */ lwz r0, 8(r30)
/* 0000E7D8 907A0000 */ stw r3, 0(r26)
/* 0000E7DC 901A0004 */ stw r0, 4(r26)
/* 0000E7E0 801E000C */ lwz r0, 0xc(r30)
/* 0000E7E4 901A0008 */ stw r0, 8(r26)
/* 0000E7E8 C0240000 */ lfs f1, 0(r4)
/* 0000E7EC C0440004 */ lfs f2, 4(r4)
/* 0000E7F0 C0040008 */ lfs f0, 8(r4)
/* 0000E7F4 EC210072 */ fmuls f1, f1, f1
/* 0000E7F8 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000E7FC EC20083A */ fmadds f1, f0, f0, f1
/* 0000E800 4BFF19D1 */ bl mathutil_sqrt
/* 0000E804 C01E0020 */ lfs f0, 0x20(r30)
/* 0000E808 EC00082A */ fadds f0, f0, f1
/* 0000E80C D01E0020 */ stfs f0, 0x20(r30)
lbl_0000E810:
/* 0000E810 807B0004 */ lwz r3, 4(r27)
/* 0000E814 801B0008 */ lwz r0, 8(r27)
/* 0000E818 907A000C */ stw r3, 0xc(r26)
/* 0000E81C 901A0010 */ stw r0, 0x10(r26)
/* 0000E820 801B000C */ lwz r0, 0xc(r27)
/* 0000E824 901A0014 */ stw r0, 0x14(r26)
/* 0000E828 C07A0014 */ lfs f3, 0x14(r26)
/* 0000E82C C05A0008 */ lfs f2, 8(r26)
/* 0000E830 C03A000C */ lfs f1, 0xc(r26)
/* 0000E834 C01A0000 */ lfs f0, 0(r26)
/* 0000E838 EC431028 */ fsubs f2, f3, f2
/* 0000E83C EC210028 */ fsubs f1, f1, f0
/* 0000E840 EC210072 */ fmuls f1, f1, f1
/* 0000E844 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000E848 4BFF1989 */ bl mathutil_sqrt
/* 0000E84C C07A0010 */ lfs f3, 0x10(r26)
/* 0000E850 FC400890 */ fmr f2, f1
/* 0000E854 C01A0004 */ lfs f0, 4(r26)
/* 0000E858 EC230028 */ fsubs f1, f3, f0
/* 0000E85C 4BFF1975 */ bl mathutil_atan2
/* 0000E860 B07A0018 */ sth r3, 0x18(r26)
/* 0000E864 C07A000C */ lfs f3, 0xc(r26)
/* 0000E868 C03A0000 */ lfs f1, 0(r26)
/* 0000E86C C05A0014 */ lfs f2, 0x14(r26)
/* 0000E870 C01A0008 */ lfs f0, 8(r26)
/* 0000E874 EC230828 */ fsubs f1, f3, f1
/* 0000E878 EC420028 */ fsubs f2, f2, f0
/* 0000E87C 4BFF1955 */ bl mathutil_atan2
/* 0000E880 38038000 */ addi r0, r3, -32768
/* 0000E884 B01A001A */ sth r0, 0x1a(r26)
/* 0000E888 38000000 */ li r0, 0
/* 0000E88C 981E0001 */ stb r0, 1(r30)
lbl_0000E890:
/* 0000E890 BB4100A8 */ lmw r26, 0xa8(r1)
/* 0000E894 800100D4 */ lwz r0, 0xd4(r1)
/* 0000E898 CBE100C8 */ lfd f31, 0xc8(r1)
/* 0000E89C CBC100C0 */ lfd f30, 0xc0(r1)
/* 0000E8A0 7C0803A6 */ mtlr r0
/* 0000E8A4 382100D0 */ addi r1, r1, 0xd0
/* 0000E8A8 4E800020 */ blr 
