/* 0000A688 7C0802A6 */ mflr r0
/* 0000A68C 3C800000 */ lis r4, lbl_0000C8F0@ha
/* 0000A690 90010004 */ stw r0, 4(r1)
/* 0000A694 9421FEE8 */ stwu r1, -0x118(r1)
/* 0000A698 BF0100F8 */ stmw r24, 0xf8(r1)
/* 0000A69C 3BA40000 */ addi r29, r4, lbl_0000C8F0@l
/* 0000A6A0 3C800000 */ lis r4, lbl_0000C370@ha
/* 0000A6A4 3BE40000 */ addi r31, r4, lbl_0000C370@l
/* 0000A6A8 8863000F */ lbz r3, 0xf(r3)
/* 0000A6AC 7C630774 */ extsb r3, r3
/* 0000A6B0 4BFF98BD */ bl lbl_00003F6C
/* 0000A6B4 28030000 */ cmplwi r3, 0
/* 0000A6B8 41820040 */ beq lbl_0000A6F8
/* 0000A6BC C05F0000 */ lfs f2, 0(r31)
/* 0000A6C0 C0230004 */ lfs f1, 4(r3)
/* 0000A6C4 C0030008 */ lfs f0, 8(r3)
/* 0000A6C8 FC601090 */ fmr f3, f2
/* 0000A6CC EC21002A */ fadds f1, f1, f0
/* 0000A6D0 4BFF5ADD */ bl mathutil_mtxA_from_translate_xyz
/* 0000A6D4 3C600000 */ lis r3, lbl_10000000@ha
/* 0000A6D8 38630000 */ addi r3, r3, lbl_10000000@l
/* 0000A6DC 38630184 */ addi r3, r3, 0x184
/* 0000A6E0 4BFF5ACD */ bl mathutil_mtxA_to_mtx
/* 0000A6E4 3C600000 */ lis r3, mathutilData@ha
/* 0000A6E8 38630000 */ addi r3, r3, mathutilData@l
/* 0000A6EC 80630000 */ lwz r3, 0(r3)
/* 0000A6F0 38800000 */ li r4, 0
/* 0000A6F4 4BFF5AB9 */ bl GXLoadPosMtxImm
lbl_0000A6F8:
/* 0000A6F8 7FA3EB78 */ mr r3, r29
/* 0000A6FC 4BFF5AB1 */ bl nlSprPut
/* 0000A700 C01F0088 */ lfs f0, 0x88(r31)
/* 0000A704 3BC100A0 */ addi r30, r1, 0xa0
/* 0000A708 388000B3 */ li r4, 0xb3
/* 0000A70C D0010060 */ stfs f0, 0x60(r1)
/* 0000A710 3B400000 */ li r26, 0
/* 0000A714 3C000020 */ lis r0, 0x20
/* 0000A718 C01F0060 */ lfs f0, 0x60(r31)
/* 0000A71C 7FC3F378 */ mr r3, r30
/* 0000A720 D0010054 */ stfs f0, 0x54(r1)
/* 0000A724 C01F0060 */ lfs f0, 0x60(r31)
/* 0000A728 D0010058 */ stfs f0, 0x58(r1)
/* 0000A72C 98810015 */ stb r4, 0x15(r1)
/* 0000A730 389D1174 */ addi r4, r29, 0x1174
/* 0000A734 9B410084 */ stb r26, 0x84(r1)
/* 0000A738 9B410085 */ stb r26, 0x85(r1)
/* 0000A73C 9B410086 */ stb r26, 0x86(r1)
/* 0000A740 90010088 */ stw r0, 0x88(r1)
/* 0000A744 4BFF5A69 */ bl strcpy
/* 0000A748 4BFF5A65 */ bl reset_text_draw_settings
/* 0000A74C 88610015 */ lbz r3, 0x15(r1)
/* 0000A750 4BFF5A5D */ bl set_text_font
/* 0000A754 C0210054 */ lfs f1, 0x54(r1)
/* 0000A758 C0410058 */ lfs f2, 0x58(r1)
/* 0000A75C 4BFF5A51 */ bl set_text_scale
/* 0000A760 80610088 */ lwz r3, 0x88(r1)
/* 0000A764 4BFF5A49 */ bl func_80071B50
/* 0000A768 C0210060 */ lfs f1, 0x60(r1)
/* 0000A76C 4BFF5A41 */ bl func_80071B1C
/* 0000A770 88010021 */ lbz r0, 0x21(r1)
/* 0000A774 88610020 */ lbz r3, 0x20(r1)
/* 0000A778 5400402E */ slwi r0, r0, 8
/* 0000A77C 88810022 */ lbz r4, 0x22(r1)
/* 0000A780 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000A784 7C830378 */ or r3, r4, r0
/* 0000A788 4BFF5A25 */ bl set_text_mul_color
/* 0000A78C 88010085 */ lbz r0, 0x85(r1)
/* 0000A790 88610084 */ lbz r3, 0x84(r1)
/* 0000A794 5400402E */ slwi r0, r0, 8
/* 0000A798 88810086 */ lbz r4, 0x86(r1)
/* 0000A79C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000A7A0 7C830378 */ or r3, r4, r0
/* 0000A7A4 4BFF5A09 */ bl set_text_add_color
/* 0000A7A8 7FC3F378 */ mr r3, r30
/* 0000A7AC 4BFF5A01 */ bl u_get_text_width
/* 0000A7B0 C81F0058 */ lfd f0, 0x58(r31)
/* 0000A7B4 3B6000FF */ li r27, 0xff
/* 0000A7B8 C85F00A8 */ lfd f2, 0xa8(r31)
/* 0000A7BC FC000072 */ fmul f0, f0, f1
/* 0000A7C0 FC020028 */ fsub f0, f2, f0
/* 0000A7C4 FC000018 */ frsp f0, f0
/* 0000A7C8 D0010018 */ stfs f0, 0x18(r1)
/* 0000A7CC C01F0090 */ lfs f0, 0x90(r31)
/* 0000A7D0 D001001C */ stfs f0, 0x1c(r1)
/* 0000A7D4 9B610020 */ stb r27, 0x20(r1)
/* 0000A7D8 9B610021 */ stb r27, 0x21(r1)
/* 0000A7DC 9B410022 */ stb r26, 0x22(r1)
/* 0000A7E0 4BFF59CD */ bl reset_text_draw_settings
/* 0000A7E4 88610015 */ lbz r3, 0x15(r1)
/* 0000A7E8 4BFF59C5 */ bl set_text_font
/* 0000A7EC C0210054 */ lfs f1, 0x54(r1)
/* 0000A7F0 C0410058 */ lfs f2, 0x58(r1)
/* 0000A7F4 4BFF59B9 */ bl set_text_scale
/* 0000A7F8 80610088 */ lwz r3, 0x88(r1)
/* 0000A7FC 4BFF59B1 */ bl func_80071B50
/* 0000A800 C83F0028 */ lfd f1, 0x28(r31)
/* 0000A804 C0010060 */ lfs f0, 0x60(r1)
/* 0000A808 FC21002A */ fadd f1, f1, f0
/* 0000A80C FC200818 */ frsp f1, f1
/* 0000A810 4BFF599D */ bl func_80071B1C
/* 0000A814 38600000 */ li r3, 0
/* 0000A818 4BFF5995 */ bl set_text_mul_color
/* 0000A81C 88010085 */ lbz r0, 0x85(r1)
/* 0000A820 88610084 */ lbz r3, 0x84(r1)
/* 0000A824 5400402E */ slwi r0, r0, 8
/* 0000A828 88810086 */ lbz r4, 0x86(r1)
/* 0000A82C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000A830 7C830378 */ or r3, r4, r0
/* 0000A834 4BFF5979 */ bl set_text_add_color
/* 0000A838 C85F0030 */ lfd f2, 0x30(r31)
/* 0000A83C C0210018 */ lfs f1, 0x18(r1)
/* 0000A840 C001001C */ lfs f0, 0x1c(r1)
/* 0000A844 FC22082A */ fadd f1, f2, f1
/* 0000A848 FC42002A */ fadd f2, f2, f0
/* 0000A84C FC200818 */ frsp f1, f1
/* 0000A850 FC401018 */ frsp f2, f2
/* 0000A854 4BFF5959 */ bl set_text_pos
/* 0000A858 7FC3F378 */ mr r3, r30
/* 0000A85C 4BFF5951 */ bl sprite_puts
/* 0000A860 C0210060 */ lfs f1, 0x60(r1)
/* 0000A864 4BFF5949 */ bl func_80071B1C
/* 0000A868 88010021 */ lbz r0, 0x21(r1)
/* 0000A86C 88610020 */ lbz r3, 0x20(r1)
/* 0000A870 5400402E */ slwi r0, r0, 8
/* 0000A874 88810022 */ lbz r4, 0x22(r1)
/* 0000A878 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000A87C 7C830378 */ or r3, r4, r0
/* 0000A880 4BFF592D */ bl set_text_mul_color
/* 0000A884 88010085 */ lbz r0, 0x85(r1)
/* 0000A888 88610084 */ lbz r3, 0x84(r1)
/* 0000A88C 5400402E */ slwi r0, r0, 8
/* 0000A890 88810086 */ lbz r4, 0x86(r1)
/* 0000A894 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000A898 7C830378 */ or r3, r4, r0
/* 0000A89C 4BFF5911 */ bl set_text_add_color
/* 0000A8A0 C0210018 */ lfs f1, 0x18(r1)
/* 0000A8A4 C041001C */ lfs f2, 0x1c(r1)
/* 0000A8A8 4BFF5905 */ bl set_text_pos
/* 0000A8AC 7FC3F378 */ mr r3, r30
/* 0000A8B0 4BFF58FD */ bl sprite_puts
/* 0000A8B4 C01F0064 */ lfs f0, 0x64(r31)
/* 0000A8B8 387D128C */ addi r3, r29, 0x128c
/* 0000A8BC D01D1290 */ stfs f0, 0x1290(r29)
/* 0000A8C0 C01F0238 */ lfs f0, 0x238(r31)
/* 0000A8C4 D01D1294 */ stfs f0, 0x1294(r29)
/* 0000A8C8 C01F023C */ lfs f0, 0x23c(r31)
/* 0000A8CC D01D129C */ stfs f0, 0x129c(r29)
/* 0000A8D0 C01F015C */ lfs f0, 0x15c(r31)
/* 0000A8D4 D01D12A0 */ stfs f0, 0x12a0(r29)
/* 0000A8D8 C03F0148 */ lfs f1, 0x148(r31)
/* 0000A8DC C05F009C */ lfs f2, 0x9c(r31)
/* 0000A8E0 4BFF99DD */ bl lbl_000042BC
/* 0000A8E4 3C600000 */ lis r3, lbl_10000000@ha
/* 0000A8E8 38630000 */ addi r3, r3, lbl_10000000@l
/* 0000A8EC 3B830178 */ addi r28, r3, 0x178
/* 0000A8F0 80030178 */ lwz r0, 0x178(r3)
/* 0000A8F4 2C000001 */ cmpwi r0, 1
/* 0000A8F8 4082001C */ bne lbl_0000A914
/* 0000A8FC 380000EF */ li r0, 0xef
/* 0000A900 98010020 */ stb r0, 0x20(r1)
/* 0000A904 3800009A */ li r0, 0x9a
/* 0000A908 98010021 */ stb r0, 0x21(r1)
/* 0000A90C 9B410022 */ stb r26, 0x22(r1)
/* 0000A910 48000010 */ b lbl_0000A920
lbl_0000A914:
/* 0000A914 9B610020 */ stb r27, 0x20(r1)
/* 0000A918 9B610021 */ stb r27, 0x21(r1)
/* 0000A91C 9B410022 */ stb r26, 0x22(r1)
lbl_0000A920:
/* 0000A920 C01F00A4 */ lfs f0, 0xa4(r31)
/* 0000A924 3B200000 */ li r25, 0
/* 0000A928 573A1838 */ slwi r26, r25, 3
/* 0000A92C D0010054 */ stfs f0, 0x54(r1)
/* 0000A930 3F604330 */ lis r27, 0x4330
/* 0000A934 801C0000 */ lwz r0, 0(r28)
/* 0000A938 54001838 */ slwi r0, r0, 3
/* 0000A93C 7F1D0214 */ add r24, r29, r0
/* 0000A940 3B1814E4 */ addi r24, r24, 0x14e4
/* 0000A944 480001D4 */ b lbl_0000AB18
lbl_0000A948:
/* 0000A948 80980000 */ lwz r4, 0(r24)
/* 0000A94C 7FC3F378 */ mr r3, r30
/* 0000A950 7C84D02E */ lwzx r4, r4, r26
/* 0000A954 4BFF5859 */ bl strcpy
/* 0000A958 4BFF5855 */ bl reset_text_draw_settings
/* 0000A95C 88610015 */ lbz r3, 0x15(r1)
/* 0000A960 4BFF584D */ bl set_text_font
/* 0000A964 C0210054 */ lfs f1, 0x54(r1)
/* 0000A968 C0410058 */ lfs f2, 0x58(r1)
/* 0000A96C 4BFF5841 */ bl set_text_scale
/* 0000A970 80610088 */ lwz r3, 0x88(r1)
/* 0000A974 4BFF5839 */ bl func_80071B50
/* 0000A978 C0210060 */ lfs f1, 0x60(r1)
/* 0000A97C 4BFF5831 */ bl func_80071B1C
/* 0000A980 88010021 */ lbz r0, 0x21(r1)
/* 0000A984 88610020 */ lbz r3, 0x20(r1)
/* 0000A988 5400402E */ slwi r0, r0, 8
/* 0000A98C 88810022 */ lbz r4, 0x22(r1)
/* 0000A990 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000A994 7C830378 */ or r3, r4, r0
/* 0000A998 4BFF5815 */ bl set_text_mul_color
/* 0000A99C 88010085 */ lbz r0, 0x85(r1)
/* 0000A9A0 88610084 */ lbz r3, 0x84(r1)
/* 0000A9A4 5400402E */ slwi r0, r0, 8
/* 0000A9A8 88810086 */ lbz r4, 0x86(r1)
/* 0000A9AC 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000A9B0 7C830378 */ or r3, r4, r0
/* 0000A9B4 4BFF57F9 */ bl set_text_add_color
/* 0000A9B8 7FC3F378 */ mr r3, r30
/* 0000A9BC 4BFF57F1 */ bl u_get_text_width
/* 0000A9C0 C81F0058 */ lfd f0, 0x58(r31)
/* 0000A9C4 6F208000 */ xoris r0, r25, 0x8000
/* 0000A9C8 900100EC */ stw r0, 0xec(r1)
/* 0000A9CC 3C600000 */ lis r3, lbl_0000C380@ha
/* 0000A9D0 FC000072 */ fmul f0, f0, f1
/* 0000A9D4 C83F00A8 */ lfd f1, 0xa8(r31)
/* 0000A9D8 3C800000 */ lis r4, lbl_0000C380@ha
/* 0000A9DC 936100E8 */ stw r27, 0xe8(r1)
/* 0000A9E0 FC210028 */ fsub f1, f1, f0
/* 0000A9E4 C80100E8 */ lfd f0, 0xe8(r1)
/* 0000A9E8 FC200818 */ frsp f1, f1
/* 0000A9EC D0210018 */ stfs f1, 0x18(r1)
/* 0000A9F0 80B80004 */ lwz r5, 4(r24)
/* 0000A9F4 C8230000 */ lfd f1, lbl_0000C380@l(r3)
/* 0000A9F8 3805FFFF */ addi r0, r5, -1
/* 0000A9FC C8440000 */ lfd f2, lbl_0000C380@l(r4)
/* 0000AA00 6C008000 */ xoris r0, r0, 0x8000
/* 0000AA04 FC000828 */ fsub f0, f0, f1
/* 0000AA08 900100F4 */ stw r0, 0xf4(r1)
/* 0000AA0C C83F0080 */ lfd f1, 0x80(r31)
/* 0000AA10 936100F0 */ stw r27, 0xf0(r1)
/* 0000AA14 FC010032 */ fmul f0, f1, f0
/* 0000AA18 C87F00B8 */ lfd f3, 0xb8(r31)
/* 0000AA1C C82100F0 */ lfd f1, 0xf0(r1)
/* 0000AA20 C89F00B0 */ lfd f4, 0xb0(r31)
/* 0000AA24 FC211028 */ fsub f1, f1, f2
/* 0000AA28 FC230072 */ fmul f1, f3, f1
/* 0000AA2C FC240828 */ fsub f1, f4, f1
/* 0000AA30 FC01002A */ fadd f0, f1, f0
/* 0000AA34 FC000018 */ frsp f0, f0
/* 0000AA38 D001001C */ stfs f0, 0x1c(r1)
/* 0000AA3C 4BFF5771 */ bl reset_text_draw_settings
/* 0000AA40 88610015 */ lbz r3, 0x15(r1)
/* 0000AA44 4BFF5769 */ bl set_text_font
/* 0000AA48 C0210054 */ lfs f1, 0x54(r1)
/* 0000AA4C C0410058 */ lfs f2, 0x58(r1)
/* 0000AA50 4BFF575D */ bl set_text_scale
/* 0000AA54 80610088 */ lwz r3, 0x88(r1)
/* 0000AA58 4BFF5755 */ bl func_80071B50
/* 0000AA5C C83F0028 */ lfd f1, 0x28(r31)
/* 0000AA60 C0010060 */ lfs f0, 0x60(r1)
/* 0000AA64 FC21002A */ fadd f1, f1, f0
/* 0000AA68 FC200818 */ frsp f1, f1
/* 0000AA6C 4BFF5741 */ bl func_80071B1C
/* 0000AA70 38600000 */ li r3, 0
/* 0000AA74 4BFF5739 */ bl set_text_mul_color
/* 0000AA78 88010085 */ lbz r0, 0x85(r1)
/* 0000AA7C 88610084 */ lbz r3, 0x84(r1)
/* 0000AA80 5400402E */ slwi r0, r0, 8
/* 0000AA84 88810086 */ lbz r4, 0x86(r1)
/* 0000AA88 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000AA8C 7C830378 */ or r3, r4, r0
/* 0000AA90 4BFF571D */ bl set_text_add_color
/* 0000AA94 C85F0030 */ lfd f2, 0x30(r31)
/* 0000AA98 C0210018 */ lfs f1, 0x18(r1)
/* 0000AA9C C001001C */ lfs f0, 0x1c(r1)
/* 0000AAA0 FC22082A */ fadd f1, f2, f1
/* 0000AAA4 FC42002A */ fadd f2, f2, f0
/* 0000AAA8 FC200818 */ frsp f1, f1
/* 0000AAAC FC401018 */ frsp f2, f2
/* 0000AAB0 4BFF56FD */ bl set_text_pos
/* 0000AAB4 7FC3F378 */ mr r3, r30
/* 0000AAB8 4BFF56F5 */ bl sprite_puts
/* 0000AABC C0210060 */ lfs f1, 0x60(r1)
/* 0000AAC0 4BFF56ED */ bl func_80071B1C
/* 0000AAC4 88010021 */ lbz r0, 0x21(r1)
/* 0000AAC8 88610020 */ lbz r3, 0x20(r1)
/* 0000AACC 5400402E */ slwi r0, r0, 8
/* 0000AAD0 88810022 */ lbz r4, 0x22(r1)
/* 0000AAD4 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000AAD8 7C830378 */ or r3, r4, r0
/* 0000AADC 4BFF56D1 */ bl set_text_mul_color
/* 0000AAE0 88010085 */ lbz r0, 0x85(r1)
/* 0000AAE4 88610084 */ lbz r3, 0x84(r1)
/* 0000AAE8 5400402E */ slwi r0, r0, 8
/* 0000AAEC 88810086 */ lbz r4, 0x86(r1)
/* 0000AAF0 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000AAF4 7C830378 */ or r3, r4, r0
/* 0000AAF8 4BFF56B5 */ bl set_text_add_color
/* 0000AAFC C0210018 */ lfs f1, 0x18(r1)
/* 0000AB00 C041001C */ lfs f2, 0x1c(r1)
/* 0000AB04 4BFF56A9 */ bl set_text_pos
/* 0000AB08 7FC3F378 */ mr r3, r30
/* 0000AB0C 4BFF56A1 */ bl sprite_puts
/* 0000AB10 3B5A0008 */ addi r26, r26, 8
/* 0000AB14 3B390001 */ addi r25, r25, 1
lbl_0000AB18:
/* 0000AB18 80180004 */ lwz r0, 4(r24)
/* 0000AB1C 7C190000 */ cmpw r25, r0
/* 0000AB20 4180FE28 */ blt lbl_0000A948
/* 0000AB24 80780000 */ lwz r3, 0(r24)
/* 0000AB28 381D135C */ addi r0, r29, 0x135c
/* 0000AB2C 7C030040 */ cmplw r3, r0
/* 0000AB30 4082018C */ bne lbl_0000ACBC
/* 0000AB34 380000FF */ li r0, 0xff
/* 0000AB38 98010020 */ stb r0, 0x20(r1)
/* 0000AB3C 3B000000 */ li r24, 0
/* 0000AB40 3B3D1398 */ addi r25, r29, 0x1398
/* 0000AB44 98010021 */ stb r0, 0x21(r1)
/* 0000AB48 571A1838 */ slwi r26, r24, 3
/* 0000AB4C 3F604330 */ lis r27, 0x4330
/* 0000AB50 98010022 */ stb r0, 0x22(r1)
/* 0000AB54 4800015C */ b lbl_0000ACB0
lbl_0000AB58:
/* 0000AB58 C01F0240 */ lfs f0, 0x240(r31)
/* 0000AB5C 6F008000 */ xoris r0, r24, 0x8000
/* 0000AB60 900100F4 */ stw r0, 0xf4(r1)
/* 0000AB64 3CA00000 */ lis r5, lbl_0000C380@ha
/* 0000AB68 3C800000 */ lis r4, lbl_0000C380@ha
/* 0000AB6C D0010018 */ stfs f0, 0x18(r1)
/* 0000AB70 7FC3F378 */ mr r3, r30
/* 0000AB74 80D90004 */ lwz r6, 4(r25)
/* 0000AB78 936100F0 */ stw r27, 0xf0(r1)
/* 0000AB7C 3806FFFF */ addi r0, r6, -1
/* 0000AB80 C8650000 */ lfd f3, lbl_0000C380@l(r5)
/* 0000AB84 6C008000 */ xoris r0, r0, 0x8000
/* 0000AB88 C8240000 */ lfd f1, lbl_0000C380@l(r4)
/* 0000AB8C 900100EC */ stw r0, 0xec(r1)
/* 0000AB90 C80100F0 */ lfd f0, 0xf0(r1)
/* 0000AB94 936100E8 */ stw r27, 0xe8(r1)
/* 0000AB98 FC000828 */ fsub f0, f0, f1
/* 0000AB9C C83F0080 */ lfd f1, 0x80(r31)
/* 0000ABA0 C84100E8 */ lfd f2, 0xe8(r1)
/* 0000ABA4 C89F00B8 */ lfd f4, 0xb8(r31)
/* 0000ABA8 FC421828 */ fsub f2, f2, f3
/* 0000ABAC FC010032 */ fmul f0, f1, f0
/* 0000ABB0 C87F00B0 */ lfd f3, 0xb0(r31)
/* 0000ABB4 FC2400B2 */ fmul f1, f4, f2
/* 0000ABB8 FC230828 */ fsub f1, f3, f1
/* 0000ABBC FC01002A */ fadd f0, f1, f0
/* 0000ABC0 FC000018 */ frsp f0, f0
/* 0000ABC4 D001001C */ stfs f0, 0x1c(r1)
/* 0000ABC8 80990000 */ lwz r4, 0(r25)
/* 0000ABCC 7C84D02E */ lwzx r4, r4, r26
/* 0000ABD0 4BFF55DD */ bl strcpy
/* 0000ABD4 4BFF55D9 */ bl reset_text_draw_settings
/* 0000ABD8 88610015 */ lbz r3, 0x15(r1)
/* 0000ABDC 4BFF55D1 */ bl set_text_font
/* 0000ABE0 C0210054 */ lfs f1, 0x54(r1)
/* 0000ABE4 C0410058 */ lfs f2, 0x58(r1)
/* 0000ABE8 4BFF55C5 */ bl set_text_scale
/* 0000ABEC 80610088 */ lwz r3, 0x88(r1)
/* 0000ABF0 4BFF55BD */ bl func_80071B50
/* 0000ABF4 C83F0028 */ lfd f1, 0x28(r31)
/* 0000ABF8 C0010060 */ lfs f0, 0x60(r1)
/* 0000ABFC FC21002A */ fadd f1, f1, f0
/* 0000AC00 FC200818 */ frsp f1, f1
/* 0000AC04 4BFF55A9 */ bl func_80071B1C
/* 0000AC08 38600000 */ li r3, 0
/* 0000AC0C 4BFF55A1 */ bl set_text_mul_color
/* 0000AC10 88010085 */ lbz r0, 0x85(r1)
/* 0000AC14 88610084 */ lbz r3, 0x84(r1)
/* 0000AC18 5400402E */ slwi r0, r0, 8
/* 0000AC1C 88810086 */ lbz r4, 0x86(r1)
/* 0000AC20 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000AC24 7C830378 */ or r3, r4, r0
/* 0000AC28 4BFF5585 */ bl set_text_add_color
/* 0000AC2C C85F0030 */ lfd f2, 0x30(r31)
/* 0000AC30 C0210018 */ lfs f1, 0x18(r1)
/* 0000AC34 C001001C */ lfs f0, 0x1c(r1)
/* 0000AC38 FC22082A */ fadd f1, f2, f1
/* 0000AC3C FC42002A */ fadd f2, f2, f0
/* 0000AC40 FC200818 */ frsp f1, f1
/* 0000AC44 FC401018 */ frsp f2, f2
/* 0000AC48 4BFF5565 */ bl set_text_pos
/* 0000AC4C 7FC3F378 */ mr r3, r30
/* 0000AC50 4BFF555D */ bl sprite_puts
/* 0000AC54 C0210060 */ lfs f1, 0x60(r1)
/* 0000AC58 4BFF5555 */ bl func_80071B1C
/* 0000AC5C 88010021 */ lbz r0, 0x21(r1)
/* 0000AC60 88610020 */ lbz r3, 0x20(r1)
/* 0000AC64 5400402E */ slwi r0, r0, 8
/* 0000AC68 88810022 */ lbz r4, 0x22(r1)
/* 0000AC6C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000AC70 7C830378 */ or r3, r4, r0
/* 0000AC74 4BFF5539 */ bl set_text_mul_color
/* 0000AC78 88010085 */ lbz r0, 0x85(r1)
/* 0000AC7C 88610084 */ lbz r3, 0x84(r1)
/* 0000AC80 5400402E */ slwi r0, r0, 8
/* 0000AC84 88810086 */ lbz r4, 0x86(r1)
/* 0000AC88 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000AC8C 7C830378 */ or r3, r4, r0
/* 0000AC90 4BFF551D */ bl set_text_add_color
/* 0000AC94 C0210018 */ lfs f1, 0x18(r1)
/* 0000AC98 C041001C */ lfs f2, 0x1c(r1)
/* 0000AC9C 4BFF5511 */ bl set_text_pos
/* 0000ACA0 7FC3F378 */ mr r3, r30
/* 0000ACA4 4BFF5509 */ bl sprite_puts
/* 0000ACA8 3B5A0008 */ addi r26, r26, 8
/* 0000ACAC 3B180001 */ addi r24, r24, 1
lbl_0000ACB0:
/* 0000ACB0 80190004 */ lwz r0, 4(r25)
/* 0000ACB4 7C180000 */ cmpw r24, r0
/* 0000ACB8 4180FEA0 */ blt lbl_0000AB58
lbl_0000ACBC:
/* 0000ACBC C01F0060 */ lfs f0, 0x60(r31)
/* 0000ACC0 D0010054 */ stfs f0, 0x54(r1)
/* 0000ACC4 801C0000 */ lwz r0, 0(r28)
/* 0000ACC8 2C000001 */ cmpwi r0, 1
/* 0000ACCC 40820348 */ bne lbl_0000B014
/* 0000ACD0 3C600000 */ lis r3, globalAnimTimer@ha
/* 0000ACD4 C85F0250 */ lfd f2, 0x250(r31)
/* 0000ACD8 38830000 */ addi r4, r3, globalAnimTimer@l
/* 0000ACDC C89F0248 */ lfd f4, 0x248(r31)
/* 0000ACE0 3C608889 */ lis r3, 0x8889
/* 0000ACE4 80840000 */ lwz r4, 0(r4)
/* 0000ACE8 38038889 */ addi r0, r3, -30583
/* 0000ACEC 7C002016 */ mulhwu r0, r0, r4
/* 0000ACF0 5400D97E */ srwi r0, r0, 5
/* 0000ACF4 1C00003C */ mulli r0, r0, 0x3c
/* 0000ACF8 7C002050 */ subf r0, r0, r4
/* 0000ACFC 900100EC */ stw r0, 0xec(r1)
/* 0000AD00 3CA04330 */ lis r5, 0x4330
/* 0000AD04 3C600000 */ lis r3, lbl_0000C4B0@ha
/* 0000AD08 90A100E8 */ stw r5, 0xe8(r1)
/* 0000AD0C 3C800000 */ lis r4, lbl_0000C380@ha
/* 0000AD10 C8230000 */ lfd f1, lbl_0000C4B0@l(r3)
/* 0000AD14 3C600000 */ lis r3, lbl_0000C380@ha
/* 0000AD18 C80100E8 */ lfd f0, 0xe8(r1)
/* 0000AD1C C8640000 */ lfd f3, lbl_0000C380@l(r4)
/* 0000AD20 EC000828 */ fsubs f0, f0, f1
/* 0000AD24 C8230000 */ lfd f1, lbl_0000C380@l(r3)
/* 0000AD28 FC00001E */ fctiwz f0, f0
/* 0000AD2C D80100F0 */ stfd f0, 0xf0(r1)
/* 0000AD30 800100F4 */ lwz r0, 0xf4(r1)
/* 0000AD34 6C008000 */ xoris r0, r0, 0x8000
/* 0000AD38 900100E4 */ stw r0, 0xe4(r1)
/* 0000AD3C 90A100E0 */ stw r5, 0xe0(r1)
/* 0000AD40 C80100E0 */ lfd f0, 0xe0(r1)
/* 0000AD44 FC001828 */ fsub f0, f0, f3
/* 0000AD48 FC001028 */ fsub f0, f0, f2
/* 0000AD4C FC00001E */ fctiwz f0, f0
/* 0000AD50 D80100D8 */ stfd f0, 0xd8(r1)
/* 0000AD54 800100DC */ lwz r0, 0xdc(r1)
/* 0000AD58 7C03FE70 */ srawi r3, r0, 0x1f
/* 0000AD5C 7C600278 */ xor r0, r3, r0
/* 0000AD60 7C030050 */ subf r0, r3, r0
/* 0000AD64 6C008000 */ xoris r0, r0, 0x8000
/* 0000AD68 900100D4 */ stw r0, 0xd4(r1)
/* 0000AD6C 90A100D0 */ stw r5, 0xd0(r1)
/* 0000AD70 C80100D0 */ lfd f0, 0xd0(r1)
/* 0000AD74 EC000828 */ fsubs f0, f0, f1
/* 0000AD78 FC001024 */ fdiv f0, f0, f2
/* 0000AD7C FC240032 */ fmul f1, f4, f0
/* 0000AD80 4BFF542D */ bl __cvt_fp2unsigned
/* 0000AD84 C01F0258 */ lfs f0, 0x258(r31)
/* 0000AD88 3C800000 */ lis r4, lbl_10000000@ha
/* 0000AD8C 38840000 */ addi r4, r4, lbl_10000000@l
/* 0000AD90 D0010018 */ stfs f0, 0x18(r1)
/* 0000AD94 3B440174 */ addi r26, r4, 0x174
/* 0000AD98 3B830000 */ addi r28, r3, 0
/* 0000AD9C C01F01CC */ lfs f0, 0x1cc(r31)
/* 0000ADA0 D001001C */ stfs f0, 0x1c(r1)
/* 0000ADA4 80040174 */ lwz r0, 0x174(r4)
/* 0000ADA8 2C000000 */ cmpwi r0, 0
/* 0000ADAC 40820028 */ bne lbl_0000ADD4
/* 0000ADB0 3860008F */ li r3, 0x8f
/* 0000ADB4 98610020 */ stb r3, 0x20(r1)
/* 0000ADB8 38000000 */ li r0, 0
/* 0000ADBC 98610021 */ stb r3, 0x21(r1)
/* 0000ADC0 98010022 */ stb r0, 0x22(r1)
/* 0000ADC4 98010084 */ stb r0, 0x84(r1)
/* 0000ADC8 98010085 */ stb r0, 0x85(r1)
/* 0000ADCC 98010086 */ stb r0, 0x86(r1)
/* 0000ADD0 48000024 */ b lbl_0000ADF4
lbl_0000ADD4:
/* 0000ADD4 386000FF */ li r3, 0xff
/* 0000ADD8 98610020 */ stb r3, 0x20(r1)
/* 0000ADDC 38000000 */ li r0, 0
/* 0000ADE0 98610021 */ stb r3, 0x21(r1)
/* 0000ADE4 98010022 */ stb r0, 0x22(r1)
/* 0000ADE8 9B810084 */ stb r28, 0x84(r1)
/* 0000ADEC 9B810085 */ stb r28, 0x85(r1)
/* 0000ADF0 9B810086 */ stb r28, 0x86(r1)
lbl_0000ADF4:
/* 0000ADF4 387E0000 */ addi r3, r30, 0
/* 0000ADF8 389D03C8 */ addi r4, r29, 0x3c8
/* 0000ADFC 4BFF53B1 */ bl strcpy
/* 0000AE00 4BFF53AD */ bl reset_text_draw_settings
/* 0000AE04 88610015 */ lbz r3, 0x15(r1)
/* 0000AE08 4BFF53A5 */ bl set_text_font
/* 0000AE0C C0210054 */ lfs f1, 0x54(r1)
/* 0000AE10 C0410058 */ lfs f2, 0x58(r1)
/* 0000AE14 4BFF5399 */ bl set_text_scale
/* 0000AE18 80610088 */ lwz r3, 0x88(r1)
/* 0000AE1C 4BFF5391 */ bl func_80071B50
/* 0000AE20 C83F0028 */ lfd f1, 0x28(r31)
/* 0000AE24 C0010060 */ lfs f0, 0x60(r1)
/* 0000AE28 FC21002A */ fadd f1, f1, f0
/* 0000AE2C FC200818 */ frsp f1, f1
/* 0000AE30 4BFF537D */ bl func_80071B1C
/* 0000AE34 38600000 */ li r3, 0
/* 0000AE38 4BFF5375 */ bl set_text_mul_color
/* 0000AE3C 88010085 */ lbz r0, 0x85(r1)
/* 0000AE40 88610084 */ lbz r3, 0x84(r1)
/* 0000AE44 5400402E */ slwi r0, r0, 8
/* 0000AE48 88810086 */ lbz r4, 0x86(r1)
/* 0000AE4C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000AE50 7C830378 */ or r3, r4, r0
/* 0000AE54 4BFF5359 */ bl set_text_add_color
/* 0000AE58 C85F0030 */ lfd f2, 0x30(r31)
/* 0000AE5C C0210018 */ lfs f1, 0x18(r1)
/* 0000AE60 C001001C */ lfs f0, 0x1c(r1)
/* 0000AE64 FC22082A */ fadd f1, f2, f1
/* 0000AE68 FC42002A */ fadd f2, f2, f0
/* 0000AE6C FC200818 */ frsp f1, f1
/* 0000AE70 FC401018 */ frsp f2, f2
/* 0000AE74 4BFF5339 */ bl set_text_pos
/* 0000AE78 7FC3F378 */ mr r3, r30
/* 0000AE7C 4BFF5331 */ bl sprite_puts
/* 0000AE80 C0210060 */ lfs f1, 0x60(r1)
/* 0000AE84 4BFF5329 */ bl func_80071B1C
/* 0000AE88 88010021 */ lbz r0, 0x21(r1)
/* 0000AE8C 88610020 */ lbz r3, 0x20(r1)
/* 0000AE90 5400402E */ slwi r0, r0, 8
/* 0000AE94 88810022 */ lbz r4, 0x22(r1)
/* 0000AE98 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000AE9C 7C830378 */ or r3, r4, r0
/* 0000AEA0 4BFF530D */ bl set_text_mul_color
/* 0000AEA4 88010085 */ lbz r0, 0x85(r1)
/* 0000AEA8 88610084 */ lbz r3, 0x84(r1)
/* 0000AEAC 5400402E */ slwi r0, r0, 8
/* 0000AEB0 88810086 */ lbz r4, 0x86(r1)
/* 0000AEB4 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000AEB8 7C830378 */ or r3, r4, r0
/* 0000AEBC 4BFF52F1 */ bl set_text_add_color
/* 0000AEC0 C0210018 */ lfs f1, 0x18(r1)
/* 0000AEC4 C041001C */ lfs f2, 0x1c(r1)
/* 0000AEC8 4BFF52E5 */ bl set_text_pos
/* 0000AECC 7FC3F378 */ mr r3, r30
/* 0000AED0 4BFF52DD */ bl sprite_puts
/* 0000AED4 C01F025C */ lfs f0, 0x25c(r31)
/* 0000AED8 D0010018 */ stfs f0, 0x18(r1)
/* 0000AEDC C01F01CC */ lfs f0, 0x1cc(r31)
/* 0000AEE0 D001001C */ stfs f0, 0x1c(r1)
/* 0000AEE4 801A0000 */ lwz r0, 0(r26)
/* 0000AEE8 2C000000 */ cmpwi r0, 0
/* 0000AEEC 40820028 */ bne lbl_0000AF14
/* 0000AEF0 386000FF */ li r3, 0xff
/* 0000AEF4 98610020 */ stb r3, 0x20(r1)
/* 0000AEF8 38000000 */ li r0, 0
/* 0000AEFC 98610021 */ stb r3, 0x21(r1)
/* 0000AF00 98010022 */ stb r0, 0x22(r1)
/* 0000AF04 9B810084 */ stb r28, 0x84(r1)
/* 0000AF08 9B810085 */ stb r28, 0x85(r1)
/* 0000AF0C 9B810086 */ stb r28, 0x86(r1)
/* 0000AF10 48000024 */ b lbl_0000AF34
lbl_0000AF14:
/* 0000AF14 3860008F */ li r3, 0x8f
/* 0000AF18 98610020 */ stb r3, 0x20(r1)
/* 0000AF1C 38000000 */ li r0, 0
/* 0000AF20 98610021 */ stb r3, 0x21(r1)
/* 0000AF24 98010022 */ stb r0, 0x22(r1)
/* 0000AF28 98010084 */ stb r0, 0x84(r1)
/* 0000AF2C 98010085 */ stb r0, 0x85(r1)
/* 0000AF30 98010086 */ stb r0, 0x86(r1)
lbl_0000AF34:
/* 0000AF34 387E0000 */ addi r3, r30, 0
/* 0000AF38 389D03D0 */ addi r4, r29, 0x3d0
/* 0000AF3C 4BFF5271 */ bl strcpy
/* 0000AF40 4BFF526D */ bl reset_text_draw_settings
/* 0000AF44 88610015 */ lbz r3, 0x15(r1)
/* 0000AF48 4BFF5265 */ bl set_text_font
/* 0000AF4C C0210054 */ lfs f1, 0x54(r1)
/* 0000AF50 C0410058 */ lfs f2, 0x58(r1)
/* 0000AF54 4BFF5259 */ bl set_text_scale
/* 0000AF58 80610088 */ lwz r3, 0x88(r1)
/* 0000AF5C 4BFF5251 */ bl func_80071B50
/* 0000AF60 C83F0028 */ lfd f1, 0x28(r31)
/* 0000AF64 C0010060 */ lfs f0, 0x60(r1)
/* 0000AF68 FC21002A */ fadd f1, f1, f0
/* 0000AF6C FC200818 */ frsp f1, f1
/* 0000AF70 4BFF523D */ bl func_80071B1C
/* 0000AF74 38600000 */ li r3, 0
/* 0000AF78 4BFF5235 */ bl set_text_mul_color
/* 0000AF7C 88010085 */ lbz r0, 0x85(r1)
/* 0000AF80 88610084 */ lbz r3, 0x84(r1)
/* 0000AF84 5400402E */ slwi r0, r0, 8
/* 0000AF88 88810086 */ lbz r4, 0x86(r1)
/* 0000AF8C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000AF90 7C830378 */ or r3, r4, r0
/* 0000AF94 4BFF5219 */ bl set_text_add_color
/* 0000AF98 C85F0030 */ lfd f2, 0x30(r31)
/* 0000AF9C C0210018 */ lfs f1, 0x18(r1)
/* 0000AFA0 C001001C */ lfs f0, 0x1c(r1)
/* 0000AFA4 FC22082A */ fadd f1, f2, f1
/* 0000AFA8 FC42002A */ fadd f2, f2, f0
/* 0000AFAC FC200818 */ frsp f1, f1
/* 0000AFB0 FC401018 */ frsp f2, f2
/* 0000AFB4 4BFF51F9 */ bl set_text_pos
/* 0000AFB8 7FC3F378 */ mr r3, r30
/* 0000AFBC 4BFF51F1 */ bl sprite_puts
/* 0000AFC0 C0210060 */ lfs f1, 0x60(r1)
/* 0000AFC4 4BFF51E9 */ bl func_80071B1C
/* 0000AFC8 88010021 */ lbz r0, 0x21(r1)
/* 0000AFCC 88610020 */ lbz r3, 0x20(r1)
/* 0000AFD0 5400402E */ slwi r0, r0, 8
/* 0000AFD4 88810022 */ lbz r4, 0x22(r1)
/* 0000AFD8 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000AFDC 7C830378 */ or r3, r4, r0
/* 0000AFE0 4BFF51CD */ bl set_text_mul_color
/* 0000AFE4 88010085 */ lbz r0, 0x85(r1)
/* 0000AFE8 88610084 */ lbz r3, 0x84(r1)
/* 0000AFEC 5400402E */ slwi r0, r0, 8
/* 0000AFF0 88810086 */ lbz r4, 0x86(r1)
/* 0000AFF4 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000AFF8 7C830378 */ or r3, r4, r0
/* 0000AFFC 4BFF51B1 */ bl set_text_add_color
/* 0000B000 C0210018 */ lfs f1, 0x18(r1)
/* 0000B004 C041001C */ lfs f2, 0x1c(r1)
/* 0000B008 4BFF51A5 */ bl set_text_pos
/* 0000B00C 7FC3F378 */ mr r3, r30
/* 0000B010 4BFF519D */ bl sprite_puts
lbl_0000B014:
/* 0000B014 4BFF5199 */ bl mathutil_mtxA_from_identity
/* 0000B018 3C600000 */ lis r3, mathutilData@ha
/* 0000B01C 38630000 */ addi r3, r3, mathutilData@l
/* 0000B020 80630000 */ lwz r3, 0(r3)
/* 0000B024 38800000 */ li r4, 0
/* 0000B028 4BFF5185 */ bl GXLoadPosMtxImm
/* 0000B02C BB0100F8 */ lmw r24, 0xf8(r1)
/* 0000B030 8001011C */ lwz r0, 0x11c(r1)
/* 0000B034 38210118 */ addi r1, r1, 0x118
/* 0000B038 7C0803A6 */ mtlr r0
/* 0000B03C 4E800020 */ blr 
