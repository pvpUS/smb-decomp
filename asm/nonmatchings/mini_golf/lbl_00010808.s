/* 00010808 7C0802A6 */ mflr r0
/* 0001080C 3C600000 */ lis r3, lbl_10000190@ha
/* 00010810 90010004 */ stw r0, 4(r1)
/* 00010814 9421FFE0 */ stwu r1, -0x20(r1)
/* 00010818 BF61000C */ stmw r27, 0xc(r1)
/* 0001081C 3BC30000 */ addi r30, r3, lbl_10000190@l
/* 00010820 3C600000 */ lis r3, decodedStageLzPtr@ha
/* 00010824 3B830000 */ addi r28, r3, decodedStageLzPtr@l
/* 00010828 88DE0004 */ lbz r6, 4(r30)
/* 0001082C A81E0000 */ lha r0, 0(r30)
/* 00010830 807C0000 */ lwz r3, 0(r28)
/* 00010834 1C860084 */ mulli r4, r6, 0x84
/* 00010838 80A3000C */ lwz r5, 0xc(r3)
/* 0001083C 5400801E */ slwi r0, r0, 0x10
/* 00010840 3C600000 */ lis r3, animGroups@ha
/* 00010844 7C003670 */ srawi r0, r0, 6
/* 00010848 3BE30000 */ addi r31, r3, animGroups@l
/* 0001084C 7FBF2214 */ add r29, r31, r4
/* 00010850 7C000194 */ addze r0, r0
/* 00010854 7C000734 */ extsh r0, r0
/* 00010858 B01D001A */ sth r0, 0x1a(r29)
/* 0001085C 1C8600C4 */ mulli r4, r6, 0xc4
/* 00010860 B01D0020 */ sth r0, 0x20(r29)
/* 00010864 387D0000 */ addi r3, r29, 0
/* 00010868 7F652214 */ add r27, r5, r4
/* 0001086C 4BFEF965 */ bl mathutil_mtxA_from_translate
/* 00010870 A87D001C */ lha r3, 0x1c(r29)
/* 00010874 4BFEF95D */ bl mathutil_mtxA_rotate_z
/* 00010878 A87D001A */ lha r3, 0x1a(r29)
/* 0001087C 4BFEF955 */ bl mathutil_mtxA_rotate_y
/* 00010880 A87B000C */ lha r3, 0xc(r27)
/* 00010884 A81D0018 */ lha r0, 0x18(r29)
/* 00010888 7C630050 */ subf r3, r3, r0
/* 0001088C 4BFEF945 */ bl mathutil_mtxA_rotate_x
/* 00010890 A81B000E */ lha r0, 0xe(r27)
/* 00010894 7C6000D0 */ neg r3, r0
/* 00010898 4BFEF939 */ bl mathutil_mtxA_rotate_y
/* 0001089C A81B0010 */ lha r0, 0x10(r27)
/* 000108A0 7C6000D0 */ neg r3, r0
/* 000108A4 4BFEF92D */ bl mathutil_mtxA_rotate_z
/* 000108A8 7F63DB78 */ mr r3, r27
/* 000108AC 4BFEF925 */ bl mathutil_mtxA_translate_neg
/* 000108B0 387D0024 */ addi r3, r29, 0x24
/* 000108B4 4BFEF91D */ bl mathutil_mtxA_to_mtx
/* 000108B8 387D0054 */ addi r3, r29, 0x54
/* 000108BC 4BFEF915 */ bl mathutil_mtxA_to_mtx
/* 000108C0 7FA3EB78 */ mr r3, r29
/* 000108C4 4BFEF90D */ bl mathutil_mtxA_from_translate
/* 000108C8 A87D001C */ lha r3, 0x1c(r29)
/* 000108CC 4BFEF905 */ bl mathutil_mtxA_rotate_z
/* 000108D0 A87D001A */ lha r3, 0x1a(r29)
/* 000108D4 4BFEF8FD */ bl mathutil_mtxA_rotate_y
/* 000108D8 A87D0018 */ lha r3, 0x18(r29)
/* 000108DC 4BFEF8F5 */ bl mathutil_mtxA_rotate_x
/* 000108E0 387E0008 */ addi r3, r30, 8
/* 000108E4 4BFEF8ED */ bl mathutil_mtxA_mult_right
/* 000108E8 889E0005 */ lbz r4, 5(r30)
/* 000108EC 807C0000 */ lwz r3, 0(r28)
/* 000108F0 A81E0002 */ lha r0, 2(r30)
/* 000108F4 1CC40084 */ mulli r6, r4, 0x84
/* 000108F8 80A3000C */ lwz r5, 0xc(r3)
/* 000108FC 1C8400C4 */ mulli r4, r4, 0xc4
/* 00010900 5400801E */ slwi r0, r0, 0x10
/* 00010904 7C033670 */ srawi r3, r0, 6
/* 00010908 7FBF3214 */ add r29, r31, r6
/* 0001090C 7F652214 */ add r27, r5, r4
/* 00010910 7C630194 */ addze r3, r3
/* 00010914 4BFEF8BD */ bl mathutil_mtxA_rotate_y
/* 00010918 389D0004 */ addi r4, r29, 4
/* 0001091C 387D0008 */ addi r3, r29, 8
/* 00010920 3CA0E000 */ lis r5, 0xe000
/* 00010924 C045000C */ lfs f2, 0xc(r5)
/* 00010928 C025001C */ lfs f1, 0x1c(r5)
/* 0001092C C005002C */ lfs f0, 0x2c(r5)
/* 00010930 D05D0000 */ stfs f2, 0(r29)
/* 00010934 D0240000 */ stfs f1, 0(r4)
/* 00010938 D0030000 */ stfs f0, 0(r3)
/* 0001093C 387D001C */ addi r3, r29, 0x1c
/* 00010940 389D001A */ addi r4, r29, 0x1a
/* 00010944 38BD0018 */ addi r5, r29, 0x18
/* 00010948 4BFEF889 */ bl u_math_unk14
/* 0001094C C01D0000 */ lfs f0, 0(r29)
/* 00010950 D01D000C */ stfs f0, 0xc(r29)
/* 00010954 C01D0004 */ lfs f0, 4(r29)
/* 00010958 D01D0010 */ stfs f0, 0x10(r29)
/* 0001095C C01D0008 */ lfs f0, 8(r29)
/* 00010960 D01D0014 */ stfs f0, 0x14(r29)
/* 00010964 A81D0018 */ lha r0, 0x18(r29)
/* 00010968 B01D001E */ sth r0, 0x1e(r29)
/* 0001096C A81D001A */ lha r0, 0x1a(r29)
/* 00010970 B01D0020 */ sth r0, 0x20(r29)
/* 00010974 A81D001C */ lha r0, 0x1c(r29)
/* 00010978 B01D0022 */ sth r0, 0x22(r29)
/* 0001097C A81B000C */ lha r0, 0xc(r27)
/* 00010980 7C6000D0 */ neg r3, r0
/* 00010984 4BFEF84D */ bl mathutil_mtxA_rotate_x
/* 00010988 A81B000E */ lha r0, 0xe(r27)
/* 0001098C 7C6000D0 */ neg r3, r0
/* 00010990 4BFEF841 */ bl mathutil_mtxA_rotate_y
/* 00010994 A81B0010 */ lha r0, 0x10(r27)
/* 00010998 7C6000D0 */ neg r3, r0
/* 0001099C 4BFEF835 */ bl mathutil_mtxA_rotate_z
/* 000109A0 7F63DB78 */ mr r3, r27
/* 000109A4 4BFEF82D */ bl mathutil_mtxA_translate_neg
/* 000109A8 387D0024 */ addi r3, r29, 0x24
/* 000109AC 4BFEF825 */ bl mathutil_mtxA_to_mtx
/* 000109B0 387D0054 */ addi r3, r29, 0x54
/* 000109B4 4BFEF81D */ bl mathutil_mtxA_to_mtx
/* 000109B8 BB61000C */ lmw r27, 0xc(r1)
/* 000109BC 80010024 */ lwz r0, 0x24(r1)
/* 000109C0 38210020 */ addi r1, r1, 0x20
/* 000109C4 7C0803A6 */ mtlr r0
/* 000109C8 4E800020 */ blr 
