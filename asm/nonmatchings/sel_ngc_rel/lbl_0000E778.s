/* 0000E778 7C0802A6 */ mflr r0
/* 0000E77C 3C800000 */ lis r4, lbl_00012730@ha
/* 0000E780 90010004 */ stw r0, 4(r1)
/* 0000E784 9421FFA0 */ stwu r1, -0x60(r1)
/* 0000E788 DBE10058 */ stfd f31, 0x58(r1)
/* 0000E78C DBC10050 */ stfd f30, 0x50(r1)
/* 0000E790 BF410038 */ stmw r26, 0x38(r1)
/* 0000E794 3BA40000 */ addi r29, r4, lbl_00012730@l
/* 0000E798 3C800000 */ lis r4, lbl_00011CB0@ha
/* 0000E79C 3B630000 */ addi r27, r3, 0
/* 0000E7A0 3BC40000 */ addi r30, r4, lbl_00011CB0@l
/* 0000E7A4 3B400001 */ li r26, 1
/* 0000E7A8 4BFF19E1 */ bl reset_text_draw_settings
/* 0000E7AC 887B0001 */ lbz r3, 1(r27)
/* 0000E7B0 4BFF19D9 */ bl set_text_font
/* 0000E7B4 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 0000E7B8 80030000 */ lwz r0, lbl_801EEDA8@l(r3)
/* 0000E7BC 2C000024 */ cmpwi r0, 0x24
/* 0000E7C0 40820010 */ bne lbl_0000E7D0
/* 0000E7C4 3C600100 */ lis r3, 0x100
/* 0000E7C8 3863FF00 */ addi r3, r3, -256
/* 0000E7CC 4800000C */ b lbl_0000E7D8
lbl_0000E7D0:
/* 0000E7D0 3C600081 */ lis r3, 0x81
/* 0000E7D4 38638000 */ addi r3, r3, -32768
lbl_0000E7D8:
/* 0000E7D8 4BFF19B1 */ bl set_text_mul_color
/* 0000E7DC C01E03A4 */ lfs f0, 0x3a4(r30)
/* 0000E7E0 D01B0040 */ stfs f0, 0x40(r27)
/* 0000E7E4 C01E0048 */ lfs f0, 0x48(r30)
/* 0000E7E8 D01B0044 */ stfs f0, 0x44(r27)
/* 0000E7EC C03B0040 */ lfs f1, 0x40(r27)
/* 0000E7F0 C05B0044 */ lfs f2, 0x44(r27)
/* 0000E7F4 4BFF1995 */ bl set_text_scale
/* 0000E7F8 3C600000 */ lis r3, lbl_801EED98@ha
/* 0000E7FC 38630000 */ addi r3, r3, lbl_801EED98@l
/* 0000E800 3B830005 */ addi r28, r3, 5
/* 0000E804 575F103A */ slwi r31, r26, 2
/* 0000E808 88030005 */ lbz r0, 5(r3)
/* 0000E80C 7C7DFA14 */ add r3, r29, r31
/* 0000E810 7C000774 */ extsb r0, r0
/* 0000E814 806341F4 */ lwz r3, 0x41f4(r3)
/* 0000E818 5400103A */ slwi r0, r0, 2
/* 0000E81C 7C83002E */ lwzx r4, r3, r0
/* 0000E820 387B008C */ addi r3, r27, 0x8c
/* 0000E824 4BFF1965 */ bl strcpy
/* 0000E828 387B008C */ addi r3, r27, 0x8c
/* 0000E82C 4BFF195D */ bl strlen
/* 0000E830 28030030 */ cmplwi r3, 0x30
/* 0000E834 40810020 */ ble lbl_0000E854
/* 0000E838 387D0000 */ addi r3, r29, 0
/* 0000E83C 4CC63182 */ crclr 6
/* 0000E840 389B008C */ addi r4, r27, 0x8c
/* 0000E844 4BFF1945 */ bl printf
/* 0000E848 387B008C */ addi r3, r27, 0x8c
/* 0000E84C 389D0020 */ addi r4, r29, 0x20
/* 0000E850 4BFF1939 */ bl strcpy
lbl_0000E854:
/* 0000E854 835B0038 */ lwz r26, 0x38(r27)
/* 0000E858 38000000 */ li r0, 0
/* 0000E85C 387B0000 */ addi r3, r27, 0
/* 0000E860 901B0038 */ stw r0, 0x38(r27)
/* 0000E864 389B0058 */ addi r4, r27, 0x58
/* 0000E868 38BB005C */ addi r5, r27, 0x5c
/* 0000E86C 38DB0060 */ addi r6, r27, 0x60
/* 0000E870 38FB0064 */ addi r7, r27, 0x64
/* 0000E874 4BFF1915 */ bl calc_sprite_bounds
/* 0000E878 935B0038 */ stw r26, 0x38(r27)
/* 0000E87C 3CA00000 */ lis r5, lbl_00011D00@ha
/* 0000E880 3C600000 */ lis r3, lbl_00011D00@ha
/* 0000E884 809B005C */ lwz r4, 0x5c(r27)
/* 0000E888 3F404330 */ lis r26, 0x4330
/* 0000E88C 80DB0058 */ lwz r6, 0x58(r27)
/* 0000E890 3804FFF6 */ addi r0, r4, -10
/* 0000E894 C8650000 */ lfd f3, lbl_00011D00@l(r5)
/* 0000E898 6CC48000 */ xoris r4, r6, 0x8000
/* 0000E89C C8430000 */ lfd f2, lbl_00011D00@l(r3)
/* 0000E8A0 6C008000 */ xoris r0, r0, 0x8000
/* 0000E8A4 90810034 */ stw r4, 0x34(r1)
/* 0000E8A8 9001002C */ stw r0, 0x2c(r1)
/* 0000E8AC 93410030 */ stw r26, 0x30(r1)
/* 0000E8B0 93410028 */ stw r26, 0x28(r1)
/* 0000E8B4 C8210030 */ lfd f1, 0x30(r1)
/* 0000E8B8 C8010028 */ lfd f0, 0x28(r1)
/* 0000E8BC EC211828 */ fsubs f1, f1, f3
/* 0000E8C0 EC401028 */ fsubs f2, f0, f2
/* 0000E8C4 4BFF18C5 */ bl set_text_pos
/* 0000E8C8 387B008C */ addi r3, r27, 0x8c
/* 0000E8CC 4BFF18BD */ bl sprite_puts
/* 0000E8D0 3C600020 */ lis r3, 0x20
/* 0000E8D4 38632000 */ addi r3, r3, 0x2000
/* 0000E8D8 4BFF18B1 */ bl set_text_mul_color
/* 0000E8DC 80DB0058 */ lwz r6, 0x58(r27)
/* 0000E8E0 3CA00000 */ lis r5, lbl_00011D00@ha
/* 0000E8E4 809B005C */ lwz r4, 0x5c(r27)
/* 0000E8E8 3C600000 */ lis r3, lbl_00011D00@ha
/* 0000E8EC 38C60003 */ addi r6, r6, 3
/* 0000E8F0 3804FFF9 */ addi r0, r4, -7
/* 0000E8F4 C8650000 */ lfd f3, lbl_00011D00@l(r5)
/* 0000E8F8 6CC48000 */ xoris r4, r6, 0x8000
/* 0000E8FC C8430000 */ lfd f2, lbl_00011D00@l(r3)
/* 0000E900 6C008000 */ xoris r0, r0, 0x8000
/* 0000E904 90810024 */ stw r4, 0x24(r1)
/* 0000E908 9001001C */ stw r0, 0x1c(r1)
/* 0000E90C 93410020 */ stw r26, 0x20(r1)
/* 0000E910 93410018 */ stw r26, 0x18(r1)
/* 0000E914 C8210020 */ lfd f1, 0x20(r1)
/* 0000E918 C8010018 */ lfd f0, 0x18(r1)
/* 0000E91C EC211828 */ fsubs f1, f1, f3
/* 0000E920 EC401028 */ fsubs f2, f0, f2
/* 0000E924 4BFF1865 */ bl set_text_pos
/* 0000E928 387B008C */ addi r3, r27, 0x8c
/* 0000E92C 4BFF185D */ bl sprite_puts
/* 0000E930 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 0000E934 80030000 */ lwz r0, lbl_801EEDA8@l(r3)
/* 0000E938 2C000024 */ cmpwi r0, 0x24
/* 0000E93C 40820010 */ bne lbl_0000E94C
/* 0000E940 3C600100 */ lis r3, 0x100
/* 0000E944 3863FFC0 */ addi r3, r3, -64
/* 0000E948 4800000C */ b lbl_0000E954
lbl_0000E94C:
/* 0000E94C 3C600081 */ lis r3, 0x81
/* 0000E950 38638060 */ addi r3, r3, -32672
lbl_0000E954:
/* 0000E954 4BFF1835 */ bl set_text_mul_color
/* 0000E958 C03B0040 */ lfs f1, 0x40(r27)
/* 0000E95C C81E03A8 */ lfd f0, 0x3a8(r30)
/* 0000E960 FC010032 */ fmul f0, f1, f0
/* 0000E964 FC000018 */ frsp f0, f0
/* 0000E968 D01B0040 */ stfs f0, 0x40(r27)
/* 0000E96C C03B0044 */ lfs f1, 0x44(r27)
/* 0000E970 C81E03A8 */ lfd f0, 0x3a8(r30)
/* 0000E974 FC010032 */ fmul f0, f1, f0
/* 0000E978 FC000018 */ frsp f0, f0
/* 0000E97C D01B0044 */ stfs f0, 0x44(r27)
/* 0000E980 C03B0040 */ lfs f1, 0x40(r27)
/* 0000E984 C05B0044 */ lfs f2, 0x44(r27)
/* 0000E988 4BFF1801 */ bl set_text_scale
/* 0000E98C 881C0000 */ lbz r0, 0(r28)
/* 0000E990 7C7DFA14 */ add r3, r29, r31
/* 0000E994 80834324 */ lwz r4, 0x4324(r3)
/* 0000E998 387B008C */ addi r3, r27, 0x8c
/* 0000E99C 7C000774 */ extsb r0, r0
/* 0000E9A0 5400103A */ slwi r0, r0, 2
/* 0000E9A4 7C84002E */ lwzx r4, r4, r0
/* 0000E9A8 4BFF17E1 */ bl strcpy
/* 0000E9AC 387B008C */ addi r3, r27, 0x8c
/* 0000E9B0 4BFF17D9 */ bl strlen
/* 0000E9B4 28030030 */ cmplwi r3, 0x30
/* 0000E9B8 40810020 */ ble lbl_0000E9D8
/* 0000E9BC 387D0000 */ addi r3, r29, 0
/* 0000E9C0 4CC63182 */ crclr 6
/* 0000E9C4 389B008C */ addi r4, r27, 0x8c
/* 0000E9C8 4BFF17C1 */ bl printf
/* 0000E9CC 387B008C */ addi r3, r27, 0x8c
/* 0000E9D0 389D0020 */ addi r4, r29, 0x20
/* 0000E9D4 4BFF17B5 */ bl strcpy
lbl_0000E9D8:
/* 0000E9D8 835B0038 */ lwz r26, 0x38(r27)
/* 0000E9DC 38000000 */ li r0, 0
/* 0000E9E0 387B0000 */ addi r3, r27, 0
/* 0000E9E4 901B0038 */ stw r0, 0x38(r27)
/* 0000E9E8 389B0058 */ addi r4, r27, 0x58
/* 0000E9EC 38BB005C */ addi r5, r27, 0x5c
/* 0000E9F0 38DB0060 */ addi r6, r27, 0x60
/* 0000E9F4 38FB0064 */ addi r7, r27, 0x64
/* 0000E9F8 4BFF1791 */ bl calc_sprite_bounds
/* 0000E9FC 935B0038 */ stw r26, 0x38(r27)
/* 0000EA00 3CA00000 */ lis r5, lbl_00011D00@ha
/* 0000EA04 3C600000 */ lis r3, lbl_00011D00@ha
/* 0000EA08 809B005C */ lwz r4, 0x5c(r27)
/* 0000EA0C 3FE04330 */ lis r31, 0x4330
/* 0000EA10 80DB0058 */ lwz r6, 0x58(r27)
/* 0000EA14 3804000F */ addi r0, r4, 0xf
/* 0000EA18 C8650000 */ lfd f3, lbl_00011D00@l(r5)
/* 0000EA1C 6CC48000 */ xoris r4, r6, 0x8000
/* 0000EA20 C8430000 */ lfd f2, lbl_00011D00@l(r3)
/* 0000EA24 6C008000 */ xoris r0, r0, 0x8000
/* 0000EA28 9081001C */ stw r4, 0x1c(r1)
/* 0000EA2C 90010024 */ stw r0, 0x24(r1)
/* 0000EA30 93E10018 */ stw r31, 0x18(r1)
/* 0000EA34 93E10020 */ stw r31, 0x20(r1)
/* 0000EA38 C8210018 */ lfd f1, 0x18(r1)
/* 0000EA3C C8010020 */ lfd f0, 0x20(r1)
/* 0000EA40 EC211828 */ fsubs f1, f1, f3
/* 0000EA44 EC401028 */ fsubs f2, f0, f2
/* 0000EA48 4BFF1741 */ bl set_text_pos
/* 0000EA4C 387B008C */ addi r3, r27, 0x8c
/* 0000EA50 4BFF1739 */ bl sprite_puts
/* 0000EA54 3C600020 */ lis r3, 0x20
/* 0000EA58 38632000 */ addi r3, r3, 0x2000
/* 0000EA5C 4BFF172D */ bl set_text_mul_color
/* 0000EA60 80DB0058 */ lwz r6, 0x58(r27)
/* 0000EA64 3CA00000 */ lis r5, lbl_00011D00@ha
/* 0000EA68 809B005C */ lwz r4, 0x5c(r27)
/* 0000EA6C 3C600000 */ lis r3, lbl_00011D00@ha
/* 0000EA70 38C60003 */ addi r6, r6, 3
/* 0000EA74 38040012 */ addi r0, r4, 0x12
/* 0000EA78 C8650000 */ lfd f3, lbl_00011D00@l(r5)
/* 0000EA7C 6CC48000 */ xoris r4, r6, 0x8000
/* 0000EA80 C8430000 */ lfd f2, lbl_00011D00@l(r3)
/* 0000EA84 6C008000 */ xoris r0, r0, 0x8000
/* 0000EA88 9081002C */ stw r4, 0x2c(r1)
/* 0000EA8C 90010034 */ stw r0, 0x34(r1)
/* 0000EA90 93E10028 */ stw r31, 0x28(r1)
/* 0000EA94 93E10030 */ stw r31, 0x30(r1)
/* 0000EA98 C8210028 */ lfd f1, 0x28(r1)
/* 0000EA9C C8010030 */ lfd f0, 0x30(r1)
/* 0000EAA0 EC211828 */ fsubs f1, f1, f3
/* 0000EAA4 EC401028 */ fsubs f2, f0, f2
/* 0000EAA8 4BFF16E1 */ bl set_text_pos
/* 0000EAAC 387B008C */ addi r3, r27, 0x8c
/* 0000EAB0 4BFF16D9 */ bl sprite_puts
/* 0000EAB4 C01E0048 */ lfs f0, 0x48(r30)
/* 0000EAB8 3C600000 */ lis r3, lbl_00011D00@ha
/* 0000EABC D01B0040 */ stfs f0, 0x40(r27)
/* 0000EAC0 C01E0048 */ lfs f0, 0x48(r30)
/* 0000EAC4 D01B0044 */ stfs f0, 0x44(r27)
/* 0000EAC8 881C0000 */ lbz r0, 0(r28)
/* 0000EACC C8230000 */ lfd f1, lbl_00011D00@l(r3)
/* 0000EAD0 7C000774 */ extsb r0, r0
/* 0000EAD4 C3FB0004 */ lfs f31, 4(r27)
/* 0000EAD8 1C6000B2 */ mulli r3, r0, 0xb2
/* 0000EADC C3DB0008 */ lfs f30, 8(r27)
/* 0000EAE0 3803FFD0 */ addi r0, r3, -48
/* 0000EAE4 6C008000 */ xoris r0, r0, 0x8000
/* 0000EAE8 90010014 */ stw r0, 0x14(r1)
/* 0000EAEC 93E10010 */ stw r31, 0x10(r1)
/* 0000EAF0 C8010010 */ lfd f0, 0x10(r1)
/* 0000EAF4 EC000828 */ fsubs f0, f0, f1
/* 0000EAF8 EC1F002A */ fadds f0, f31, f0
/* 0000EAFC D01B0004 */ stfs f0, 4(r27)
/* 0000EB00 C03B0008 */ lfs f1, 8(r27)
/* 0000EB04 C01E03B0 */ lfs f0, 0x3b0(r30)
/* 0000EB08 EC01002A */ fadds f0, f1, f0
/* 0000EB0C D01B0008 */ stfs f0, 8(r27)
/* 0000EB10 801B0048 */ lwz r0, 0x48(r27)
/* 0000EB14 2C000000 */ cmpwi r0, 0
/* 0000EB18 41820098 */ beq lbl_0000EBB0
/* 0000EB1C 4BFF166D */ bl reset_text_draw_settings
/* 0000EB20 3C600022 */ lis r3, 0x22
/* 0000EB24 4BFF1665 */ bl func_80071B50
/* 0000EB28 887B0001 */ lbz r3, 1(r27)
/* 0000EB2C 4BFF165D */ bl set_text_font
/* 0000EB30 C03E0040 */ lfs f1, 0x40(r30)
/* 0000EB34 FC400890 */ fmr f2, f1
/* 0000EB38 4BFF1651 */ bl set_text_scale
/* 0000EB3C C83E0190 */ lfd f1, 0x190(r30)
/* 0000EB40 C01B004C */ lfs f0, 0x4c(r27)
/* 0000EB44 FC21002A */ fadd f1, f1, f0
/* 0000EB48 FC200818 */ frsp f1, f1
/* 0000EB4C 4BFF163D */ bl func_80071B1C
/* 0000EB50 C03B0004 */ lfs f1, 4(r27)
/* 0000EB54 C01E0390 */ lfs f0, 0x390(r30)
/* 0000EB58 C07E0070 */ lfs f3, 0x70(r30)
/* 0000EB5C EC210028 */ fsubs f1, f1, f0
/* 0000EB60 C01B0008 */ lfs f0, 8(r27)
/* 0000EB64 EC43002A */ fadds f2, f3, f0
/* 0000EB68 EC23082A */ fadds f1, f3, f1
/* 0000EB6C 4BFF161D */ bl set_text_pos
/* 0000EB70 38600000 */ li r3, 0
/* 0000EB74 4BFF1615 */ bl set_text_mul_color
/* 0000EB78 387D3D10 */ addi r3, r29, 0x3d10
/* 0000EB7C 4BFF160D */ bl sprite_puts
/* 0000EB80 C03B004C */ lfs f1, 0x4c(r27)
/* 0000EB84 4BFF1605 */ bl func_80071B1C
/* 0000EB88 C03B0004 */ lfs f1, 4(r27)
/* 0000EB8C C01E0390 */ lfs f0, 0x390(r30)
/* 0000EB90 C05B0008 */ lfs f2, 8(r27)
/* 0000EB94 EC210028 */ fsubs f1, f1, f0
/* 0000EB98 4BFF15F1 */ bl set_text_pos
/* 0000EB9C 3C600100 */ lis r3, 0x100
/* 0000EBA0 3863FFFF */ addi r3, r3, -1
/* 0000EBA4 4BFF15E5 */ bl set_text_mul_color
/* 0000EBA8 387D3CF0 */ addi r3, r29, 0x3cf0
/* 0000EBAC 4BFF15DD */ bl sprite_puts
lbl_0000EBB0:
/* 0000EBB0 D3FB0004 */ stfs f31, 4(r27)
/* 0000EBB4 D3DB0008 */ stfs f30, 8(r27)
/* 0000EBB8 BB410038 */ lmw r26, 0x38(r1)
/* 0000EBBC 80010064 */ lwz r0, 0x64(r1)
/* 0000EBC0 CBE10058 */ lfd f31, 0x58(r1)
/* 0000EBC4 CBC10050 */ lfd f30, 0x50(r1)
/* 0000EBC8 7C0803A6 */ mtlr r0
/* 0000EBCC 38210060 */ addi r1, r1, 0x60
/* 0000EBD0 4E800020 */ blr 
