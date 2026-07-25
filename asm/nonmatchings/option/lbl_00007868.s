/* 00007868 7C0802A6 */ mflr r0
/* 0000786C 3C800000 */ lis r4, lbl_0000C8F0@ha
/* 00007870 90010004 */ stw r0, 4(r1)
/* 00007874 9421FF18 */ stwu r1, -0xe8(r1)
/* 00007878 BF6100D4 */ stmw r27, 0xd4(r1)
/* 0000787C 3BA40000 */ addi r29, r4, lbl_0000C8F0@l
/* 00007880 3C800000 */ lis r4, lbl_0000C370@ha
/* 00007884 3BE40000 */ addi r31, r4, lbl_0000C370@l
/* 00007888 8863000F */ lbz r3, 0xf(r3)
/* 0000788C 7C630774 */ extsb r3, r3
/* 00007890 4BFFC6DD */ bl lbl_00003F6C
/* 00007894 28030000 */ cmplwi r3, 0
/* 00007898 41820040 */ beq lbl_000078D8
/* 0000789C C05F0000 */ lfs f2, 0(r31)
/* 000078A0 C0230004 */ lfs f1, 4(r3)
/* 000078A4 C0030008 */ lfs f0, 8(r3)
/* 000078A8 FC601090 */ fmr f3, f2
/* 000078AC EC21002A */ fadds f1, f1, f0
/* 000078B0 4BFF88FD */ bl mathutil_mtxA_from_translate_xyz
/* 000078B4 3C600000 */ lis r3, lbl_10000000@ha
/* 000078B8 38630000 */ addi r3, r3, lbl_10000000@l
/* 000078BC 38630184 */ addi r3, r3, 0x184
/* 000078C0 4BFF88ED */ bl mathutil_mtxA_to_mtx
/* 000078C4 3C600000 */ lis r3, mathutilData@ha
/* 000078C8 38630000 */ addi r3, r3, mathutilData@l
/* 000078CC 80630000 */ lwz r3, 0(r3)
/* 000078D0 38800000 */ li r4, 0
/* 000078D4 4BFF88D9 */ bl GXLoadPosMtxImm
lbl_000078D8:
/* 000078D8 7FA3EB78 */ mr r3, r29
/* 000078DC 4BFF88D1 */ bl nlSprPut
/* 000078E0 C01F0088 */ lfs f0, 0x88(r31)
/* 000078E4 3BC100A0 */ addi r30, r1, 0xa0
/* 000078E8 3B6000B3 */ li r27, 0xb3
/* 000078EC D0010060 */ stfs f0, 0x60(r1)
/* 000078F0 3B800000 */ li r28, 0
/* 000078F4 3C000020 */ lis r0, 0x20
/* 000078F8 C01F0060 */ lfs f0, 0x60(r31)
/* 000078FC 7FC3F378 */ mr r3, r30
/* 00007900 389D09B0 */ addi r4, r29, 0x9b0
/* 00007904 D0010054 */ stfs f0, 0x54(r1)
/* 00007908 C01F0060 */ lfs f0, 0x60(r31)
/* 0000790C D0010058 */ stfs f0, 0x58(r1)
/* 00007910 9B610015 */ stb r27, 0x15(r1)
/* 00007914 9B810084 */ stb r28, 0x84(r1)
/* 00007918 9B810085 */ stb r28, 0x85(r1)
/* 0000791C 9B810086 */ stb r28, 0x86(r1)
/* 00007920 90010088 */ stw r0, 0x88(r1)
/* 00007924 4BFF8889 */ bl strcpy
/* 00007928 4BFF8885 */ bl reset_text_draw_settings
/* 0000792C 88610015 */ lbz r3, 0x15(r1)
/* 00007930 4BFF887D */ bl set_text_font
/* 00007934 C0210054 */ lfs f1, 0x54(r1)
/* 00007938 C0410058 */ lfs f2, 0x58(r1)
/* 0000793C 4BFF8871 */ bl set_text_scale
/* 00007940 80610088 */ lwz r3, 0x88(r1)
/* 00007944 4BFF8869 */ bl func_80071B50
/* 00007948 C0210060 */ lfs f1, 0x60(r1)
/* 0000794C 4BFF8861 */ bl func_80071B1C
/* 00007950 88010021 */ lbz r0, 0x21(r1)
/* 00007954 88610020 */ lbz r3, 0x20(r1)
/* 00007958 5400402E */ slwi r0, r0, 8
/* 0000795C 88810022 */ lbz r4, 0x22(r1)
/* 00007960 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007964 7C830378 */ or r3, r4, r0
/* 00007968 4BFF8845 */ bl set_text_mul_color
/* 0000796C 88010085 */ lbz r0, 0x85(r1)
/* 00007970 88610084 */ lbz r3, 0x84(r1)
/* 00007974 5400402E */ slwi r0, r0, 8
/* 00007978 88810086 */ lbz r4, 0x86(r1)
/* 0000797C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007980 7C830378 */ or r3, r4, r0
/* 00007984 4BFF8829 */ bl set_text_add_color
/* 00007988 7FC3F378 */ mr r3, r30
/* 0000798C 4BFF8821 */ bl u_get_text_width
/* 00007990 C81F0058 */ lfd f0, 0x58(r31)
/* 00007994 380000FF */ li r0, 0xff
/* 00007998 C85F00A8 */ lfd f2, 0xa8(r31)
/* 0000799C FC000072 */ fmul f0, f0, f1
/* 000079A0 FC020028 */ fsub f0, f2, f0
/* 000079A4 FC000018 */ frsp f0, f0
/* 000079A8 D0010018 */ stfs f0, 0x18(r1)
/* 000079AC C01F0090 */ lfs f0, 0x90(r31)
/* 000079B0 D001001C */ stfs f0, 0x1c(r1)
/* 000079B4 98010020 */ stb r0, 0x20(r1)
/* 000079B8 98010021 */ stb r0, 0x21(r1)
/* 000079BC 9B810022 */ stb r28, 0x22(r1)
/* 000079C0 4BFF87ED */ bl reset_text_draw_settings
/* 000079C4 88610015 */ lbz r3, 0x15(r1)
/* 000079C8 4BFF87E5 */ bl set_text_font
/* 000079CC C0210054 */ lfs f1, 0x54(r1)
/* 000079D0 C0410058 */ lfs f2, 0x58(r1)
/* 000079D4 4BFF87D9 */ bl set_text_scale
/* 000079D8 80610088 */ lwz r3, 0x88(r1)
/* 000079DC 4BFF87D1 */ bl func_80071B50
/* 000079E0 C83F0028 */ lfd f1, 0x28(r31)
/* 000079E4 C0010060 */ lfs f0, 0x60(r1)
/* 000079E8 FC21002A */ fadd f1, f1, f0
/* 000079EC FC200818 */ frsp f1, f1
/* 000079F0 4BFF87BD */ bl func_80071B1C
/* 000079F4 38600000 */ li r3, 0
/* 000079F8 4BFF87B5 */ bl set_text_mul_color
/* 000079FC 88010085 */ lbz r0, 0x85(r1)
/* 00007A00 88610084 */ lbz r3, 0x84(r1)
/* 00007A04 5400402E */ slwi r0, r0, 8
/* 00007A08 88810086 */ lbz r4, 0x86(r1)
/* 00007A0C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007A10 7C830378 */ or r3, r4, r0
/* 00007A14 4BFF8799 */ bl set_text_add_color
/* 00007A18 C85F0030 */ lfd f2, 0x30(r31)
/* 00007A1C C0210018 */ lfs f1, 0x18(r1)
/* 00007A20 C001001C */ lfs f0, 0x1c(r1)
/* 00007A24 FC22082A */ fadd f1, f2, f1
/* 00007A28 FC42002A */ fadd f2, f2, f0
/* 00007A2C FC200818 */ frsp f1, f1
/* 00007A30 FC401018 */ frsp f2, f2
/* 00007A34 4BFF8779 */ bl set_text_pos
/* 00007A38 7FC3F378 */ mr r3, r30
/* 00007A3C 4BFF8771 */ bl sprite_puts
/* 00007A40 C0210060 */ lfs f1, 0x60(r1)
/* 00007A44 4BFF8769 */ bl func_80071B1C
/* 00007A48 88010021 */ lbz r0, 0x21(r1)
/* 00007A4C 88610020 */ lbz r3, 0x20(r1)
/* 00007A50 5400402E */ slwi r0, r0, 8
/* 00007A54 88810022 */ lbz r4, 0x22(r1)
/* 00007A58 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007A5C 7C830378 */ or r3, r4, r0
/* 00007A60 4BFF874D */ bl set_text_mul_color
/* 00007A64 88010085 */ lbz r0, 0x85(r1)
/* 00007A68 88610084 */ lbz r3, 0x84(r1)
/* 00007A6C 5400402E */ slwi r0, r0, 8
/* 00007A70 88810086 */ lbz r4, 0x86(r1)
/* 00007A74 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007A78 7C830378 */ or r3, r4, r0
/* 00007A7C 4BFF8731 */ bl set_text_add_color
/* 00007A80 C0210018 */ lfs f1, 0x18(r1)
/* 00007A84 C041001C */ lfs f2, 0x1c(r1)
/* 00007A88 4BFF8725 */ bl set_text_pos
/* 00007A8C 7FC3F378 */ mr r3, r30
/* 00007A90 4BFF871D */ bl sprite_puts
/* 00007A94 C03F0148 */ lfs f1, 0x148(r31)
/* 00007A98 387D07D0 */ addi r3, r29, 0x7d0
/* 00007A9C C05F009C */ lfs f2, 0x9c(r31)
/* 00007AA0 4BFFC81D */ bl lbl_000042BC
/* 00007AA4 C01F0194 */ lfs f0, 0x194(r31)
/* 00007AA8 387E0000 */ addi r3, r30, 0
/* 00007AAC 389D09B8 */ addi r4, r29, 0x9b8
/* 00007AB0 D0010018 */ stfs f0, 0x18(r1)
/* 00007AB4 C01F0198 */ lfs f0, 0x198(r31)
/* 00007AB8 D001001C */ stfs f0, 0x1c(r1)
/* 00007ABC 4BFF86F1 */ bl strcpy
/* 00007AC0 4BFF86ED */ bl reset_text_draw_settings
/* 00007AC4 88610015 */ lbz r3, 0x15(r1)
/* 00007AC8 4BFF86E5 */ bl set_text_font
/* 00007ACC C0210054 */ lfs f1, 0x54(r1)
/* 00007AD0 C0410058 */ lfs f2, 0x58(r1)
/* 00007AD4 4BFF86D9 */ bl set_text_scale
/* 00007AD8 80610088 */ lwz r3, 0x88(r1)
/* 00007ADC 4BFF86D1 */ bl func_80071B50
/* 00007AE0 C83F0028 */ lfd f1, 0x28(r31)
/* 00007AE4 C0010060 */ lfs f0, 0x60(r1)
/* 00007AE8 FC21002A */ fadd f1, f1, f0
/* 00007AEC FC200818 */ frsp f1, f1
/* 00007AF0 4BFF86BD */ bl func_80071B1C
/* 00007AF4 38600000 */ li r3, 0
/* 00007AF8 4BFF86B5 */ bl set_text_mul_color
/* 00007AFC 88010085 */ lbz r0, 0x85(r1)
/* 00007B00 88610084 */ lbz r3, 0x84(r1)
/* 00007B04 5400402E */ slwi r0, r0, 8
/* 00007B08 88810086 */ lbz r4, 0x86(r1)
/* 00007B0C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007B10 7C830378 */ or r3, r4, r0
/* 00007B14 4BFF8699 */ bl set_text_add_color
/* 00007B18 C85F0030 */ lfd f2, 0x30(r31)
/* 00007B1C C0210018 */ lfs f1, 0x18(r1)
/* 00007B20 C001001C */ lfs f0, 0x1c(r1)
/* 00007B24 FC22082A */ fadd f1, f2, f1
/* 00007B28 FC42002A */ fadd f2, f2, f0
/* 00007B2C FC200818 */ frsp f1, f1
/* 00007B30 FC401018 */ frsp f2, f2
/* 00007B34 4BFF8679 */ bl set_text_pos
/* 00007B38 7FC3F378 */ mr r3, r30
/* 00007B3C 4BFF8671 */ bl sprite_puts
/* 00007B40 C0210060 */ lfs f1, 0x60(r1)
/* 00007B44 4BFF8669 */ bl func_80071B1C
/* 00007B48 88010021 */ lbz r0, 0x21(r1)
/* 00007B4C 88610020 */ lbz r3, 0x20(r1)
/* 00007B50 5400402E */ slwi r0, r0, 8
/* 00007B54 88810022 */ lbz r4, 0x22(r1)
/* 00007B58 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007B5C 7C830378 */ or r3, r4, r0
/* 00007B60 4BFF864D */ bl set_text_mul_color
/* 00007B64 88010085 */ lbz r0, 0x85(r1)
/* 00007B68 88610084 */ lbz r3, 0x84(r1)
/* 00007B6C 5400402E */ slwi r0, r0, 8
/* 00007B70 88810086 */ lbz r4, 0x86(r1)
/* 00007B74 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007B78 7C830378 */ or r3, r4, r0
/* 00007B7C 4BFF8631 */ bl set_text_add_color
/* 00007B80 C0210018 */ lfs f1, 0x18(r1)
/* 00007B84 C041001C */ lfs f2, 0x1c(r1)
/* 00007B88 4BFF8625 */ bl set_text_pos
/* 00007B8C 7FC3F378 */ mr r3, r30
/* 00007B90 4BFF861D */ bl sprite_puts
/* 00007B94 4BFF8619 */ bl OSGetSoundMode
/* 00007B98 C01F019C */ lfs f0, 0x19c(r31)
/* 00007B9C 3B830000 */ addi r28, r3, 0
/* 00007BA0 380000B0 */ li r0, 0xb0
/* 00007BA4 D0010018 */ stfs f0, 0x18(r1)
/* 00007BA8 387E0000 */ addi r3, r30, 0
/* 00007BAC 389D09C8 */ addi r4, r29, 0x9c8
/* 00007BB0 C01F0198 */ lfs f0, 0x198(r31)
/* 00007BB4 D001001C */ stfs f0, 0x1c(r1)
/* 00007BB8 C01F0158 */ lfs f0, 0x158(r31)
/* 00007BBC D0010054 */ stfs f0, 0x54(r1)
/* 00007BC0 98010015 */ stb r0, 0x15(r1)
/* 00007BC4 4BFF85E9 */ bl strcpy
/* 00007BC8 4BFF85E5 */ bl reset_text_draw_settings
/* 00007BCC 88610015 */ lbz r3, 0x15(r1)
/* 00007BD0 4BFF85DD */ bl set_text_font
/* 00007BD4 C0210054 */ lfs f1, 0x54(r1)
/* 00007BD8 C0410058 */ lfs f2, 0x58(r1)
/* 00007BDC 4BFF85D1 */ bl set_text_scale
/* 00007BE0 80610088 */ lwz r3, 0x88(r1)
/* 00007BE4 4BFF85C9 */ bl func_80071B50
/* 00007BE8 C83F0028 */ lfd f1, 0x28(r31)
/* 00007BEC C0010060 */ lfs f0, 0x60(r1)
/* 00007BF0 FC21002A */ fadd f1, f1, f0
/* 00007BF4 FC200818 */ frsp f1, f1
/* 00007BF8 4BFF85B5 */ bl func_80071B1C
/* 00007BFC 38600000 */ li r3, 0
/* 00007C00 4BFF85AD */ bl set_text_mul_color
/* 00007C04 88010085 */ lbz r0, 0x85(r1)
/* 00007C08 88610084 */ lbz r3, 0x84(r1)
/* 00007C0C 5400402E */ slwi r0, r0, 8
/* 00007C10 88810086 */ lbz r4, 0x86(r1)
/* 00007C14 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007C18 7C830378 */ or r3, r4, r0
/* 00007C1C 4BFF8591 */ bl set_text_add_color
/* 00007C20 C85F0030 */ lfd f2, 0x30(r31)
/* 00007C24 C0210018 */ lfs f1, 0x18(r1)
/* 00007C28 C001001C */ lfs f0, 0x1c(r1)
/* 00007C2C FC22082A */ fadd f1, f2, f1
/* 00007C30 FC42002A */ fadd f2, f2, f0
/* 00007C34 FC200818 */ frsp f1, f1
/* 00007C38 FC401018 */ frsp f2, f2
/* 00007C3C 4BFF8571 */ bl set_text_pos
/* 00007C40 7FC3F378 */ mr r3, r30
/* 00007C44 4BFF8569 */ bl sprite_puts
/* 00007C48 C0210060 */ lfs f1, 0x60(r1)
/* 00007C4C 4BFF8561 */ bl func_80071B1C
/* 00007C50 88010021 */ lbz r0, 0x21(r1)
/* 00007C54 88610020 */ lbz r3, 0x20(r1)
/* 00007C58 5400402E */ slwi r0, r0, 8
/* 00007C5C 88810022 */ lbz r4, 0x22(r1)
/* 00007C60 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007C64 7C830378 */ or r3, r4, r0
/* 00007C68 4BFF8545 */ bl set_text_mul_color
/* 00007C6C 88010085 */ lbz r0, 0x85(r1)
/* 00007C70 88610084 */ lbz r3, 0x84(r1)
/* 00007C74 5400402E */ slwi r0, r0, 8
/* 00007C78 88810086 */ lbz r4, 0x86(r1)
/* 00007C7C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007C80 7C830378 */ or r3, r4, r0
/* 00007C84 4BFF8529 */ bl set_text_add_color
/* 00007C88 C0210018 */ lfs f1, 0x18(r1)
/* 00007C8C C041001C */ lfs f2, 0x1c(r1)
/* 00007C90 4BFF851D */ bl set_text_pos
/* 00007C94 7FC3F378 */ mr r3, r30
/* 00007C98 4BFF8515 */ bl sprite_puts
/* 00007C9C 9B610015 */ stb r27, 0x15(r1)
/* 00007CA0 387D0960 */ addi r3, r29, 0x960
/* 00007CA4 C01F0060 */ lfs f0, 0x60(r31)
/* 00007CA8 D0010054 */ stfs f0, 0x54(r1)
/* 00007CAC C01F01A0 */ lfs f0, 0x1a0(r31)
/* 00007CB0 D01D0964 */ stfs f0, 0x964(r29)
/* 00007CB4 C01F00C8 */ lfs f0, 0xc8(r31)
/* 00007CB8 D01D0968 */ stfs f0, 0x968(r29)
/* 00007CBC C01F01A4 */ lfs f0, 0x1a4(r31)
/* 00007CC0 D01D0970 */ stfs f0, 0x970(r29)
/* 00007CC4 C01F01A8 */ lfs f0, 0x1a8(r31)
/* 00007CC8 D01D0974 */ stfs f0, 0x974(r29)
/* 00007CCC 4BFF84E1 */ bl nlSprPut
/* 00007CD0 C01F01AC */ lfs f0, 0x1ac(r31)
/* 00007CD4 281C0001 */ cmplwi r28, 1
/* 00007CD8 D0010018 */ stfs f0, 0x18(r1)
/* 00007CDC C01F0198 */ lfs f0, 0x198(r31)
/* 00007CE0 D001001C */ stfs f0, 0x1c(r1)
/* 00007CE4 40820014 */ bne lbl_00007CF8
/* 00007CE8 387E0000 */ addi r3, r30, 0
/* 00007CEC 389D09EC */ addi r4, r29, 0x9ec
/* 00007CF0 4BFF84BD */ bl strcpy
/* 00007CF4 48000010 */ b lbl_00007D04
lbl_00007CF8:
/* 00007CF8 387E0000 */ addi r3, r30, 0
/* 00007CFC 389D09F8 */ addi r4, r29, 0x9f8
/* 00007D00 4BFF84AD */ bl strcpy
lbl_00007D04:
/* 00007D04 4BFF84A9 */ bl reset_text_draw_settings
/* 00007D08 88610015 */ lbz r3, 0x15(r1)
/* 00007D0C 4BFF84A1 */ bl set_text_font
/* 00007D10 C0210054 */ lfs f1, 0x54(r1)
/* 00007D14 C0410058 */ lfs f2, 0x58(r1)
/* 00007D18 4BFF8495 */ bl set_text_scale
/* 00007D1C 80610088 */ lwz r3, 0x88(r1)
/* 00007D20 4BFF848D */ bl func_80071B50
/* 00007D24 C83F0028 */ lfd f1, 0x28(r31)
/* 00007D28 C0010060 */ lfs f0, 0x60(r1)
/* 00007D2C FC21002A */ fadd f1, f1, f0
/* 00007D30 FC200818 */ frsp f1, f1
/* 00007D34 4BFF8479 */ bl func_80071B1C
/* 00007D38 38600000 */ li r3, 0
/* 00007D3C 4BFF8471 */ bl set_text_mul_color
/* 00007D40 88010085 */ lbz r0, 0x85(r1)
/* 00007D44 88610084 */ lbz r3, 0x84(r1)
/* 00007D48 5400402E */ slwi r0, r0, 8
/* 00007D4C 88810086 */ lbz r4, 0x86(r1)
/* 00007D50 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007D54 7C830378 */ or r3, r4, r0
/* 00007D58 4BFF8455 */ bl set_text_add_color
/* 00007D5C C85F0030 */ lfd f2, 0x30(r31)
/* 00007D60 C0210018 */ lfs f1, 0x18(r1)
/* 00007D64 C001001C */ lfs f0, 0x1c(r1)
/* 00007D68 FC22082A */ fadd f1, f2, f1
/* 00007D6C FC42002A */ fadd f2, f2, f0
/* 00007D70 FC200818 */ frsp f1, f1
/* 00007D74 FC401018 */ frsp f2, f2
/* 00007D78 4BFF8435 */ bl set_text_pos
/* 00007D7C 7FC3F378 */ mr r3, r30
/* 00007D80 4BFF842D */ bl sprite_puts
/* 00007D84 C0210060 */ lfs f1, 0x60(r1)
/* 00007D88 4BFF8425 */ bl func_80071B1C
/* 00007D8C 88010021 */ lbz r0, 0x21(r1)
/* 00007D90 88610020 */ lbz r3, 0x20(r1)
/* 00007D94 5400402E */ slwi r0, r0, 8
/* 00007D98 88810022 */ lbz r4, 0x22(r1)
/* 00007D9C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007DA0 7C830378 */ or r3, r4, r0
/* 00007DA4 4BFF8409 */ bl set_text_mul_color
/* 00007DA8 88010085 */ lbz r0, 0x85(r1)
/* 00007DAC 88610084 */ lbz r3, 0x84(r1)
/* 00007DB0 5400402E */ slwi r0, r0, 8
/* 00007DB4 88810086 */ lbz r4, 0x86(r1)
/* 00007DB8 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007DBC 7C830378 */ or r3, r4, r0
/* 00007DC0 4BFF83ED */ bl set_text_add_color
/* 00007DC4 C0210018 */ lfs f1, 0x18(r1)
/* 00007DC8 C041001C */ lfs f2, 0x1c(r1)
/* 00007DCC 4BFF83E1 */ bl set_text_pos
/* 00007DD0 7FC3F378 */ mr r3, r30
/* 00007DD4 4BFF83D9 */ bl sprite_puts
/* 00007DD8 387D00F0 */ addi r3, r29, 0xf0
/* 00007DDC 4BFF83D1 */ bl nlSprPut
/* 00007DE0 387E0000 */ addi r3, r30, 0
/* 00007DE4 389D0A00 */ addi r4, r29, 0xa00
/* 00007DE8 4BFF83C5 */ bl strcpy
/* 00007DEC 386000FF */ li r3, 0xff
/* 00007DF0 98610020 */ stb r3, 0x20(r1)
/* 00007DF4 38000000 */ li r0, 0
/* 00007DF8 98610021 */ stb r3, 0x21(r1)
/* 00007DFC 98010022 */ stb r0, 0x22(r1)
/* 00007E00 C01F00A4 */ lfs f0, 0xa4(r31)
/* 00007E04 D0010054 */ stfs f0, 0x54(r1)
/* 00007E08 4BFF83A5 */ bl reset_text_draw_settings
/* 00007E0C 88610015 */ lbz r3, 0x15(r1)
/* 00007E10 4BFF839D */ bl set_text_font
/* 00007E14 C0210054 */ lfs f1, 0x54(r1)
/* 00007E18 C0410058 */ lfs f2, 0x58(r1)
/* 00007E1C 4BFF8391 */ bl set_text_scale
/* 00007E20 80610088 */ lwz r3, 0x88(r1)
/* 00007E24 4BFF8389 */ bl func_80071B50
/* 00007E28 C0210060 */ lfs f1, 0x60(r1)
/* 00007E2C 4BFF8381 */ bl func_80071B1C
/* 00007E30 88010021 */ lbz r0, 0x21(r1)
/* 00007E34 88610020 */ lbz r3, 0x20(r1)
/* 00007E38 5400402E */ slwi r0, r0, 8
/* 00007E3C 88810022 */ lbz r4, 0x22(r1)
/* 00007E40 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007E44 7C830378 */ or r3, r4, r0
/* 00007E48 4BFF8365 */ bl set_text_mul_color
/* 00007E4C 88010085 */ lbz r0, 0x85(r1)
/* 00007E50 88610084 */ lbz r3, 0x84(r1)
/* 00007E54 5400402E */ slwi r0, r0, 8
/* 00007E58 88810086 */ lbz r4, 0x86(r1)
/* 00007E5C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007E60 7C830378 */ or r3, r4, r0
/* 00007E64 4BFF8349 */ bl set_text_add_color
/* 00007E68 7FC3F378 */ mr r3, r30
/* 00007E6C 4BFF8341 */ bl u_get_text_width
/* 00007E70 C81F0058 */ lfd f0, 0x58(r31)
/* 00007E74 C85F00A8 */ lfd f2, 0xa8(r31)
/* 00007E78 FC000072 */ fmul f0, f0, f1
/* 00007E7C FC020028 */ fsub f0, f2, f0
/* 00007E80 FC000018 */ frsp f0, f0
/* 00007E84 D0010018 */ stfs f0, 0x18(r1)
/* 00007E88 C01F0190 */ lfs f0, 0x190(r31)
/* 00007E8C D001001C */ stfs f0, 0x1c(r1)
/* 00007E90 4BFF831D */ bl reset_text_draw_settings
/* 00007E94 88610015 */ lbz r3, 0x15(r1)
/* 00007E98 4BFF8315 */ bl set_text_font
/* 00007E9C C0210054 */ lfs f1, 0x54(r1)
/* 00007EA0 C0410058 */ lfs f2, 0x58(r1)
/* 00007EA4 4BFF8309 */ bl set_text_scale
/* 00007EA8 80610088 */ lwz r3, 0x88(r1)
/* 00007EAC 4BFF8301 */ bl func_80071B50
/* 00007EB0 C83F0028 */ lfd f1, 0x28(r31)
/* 00007EB4 C0010060 */ lfs f0, 0x60(r1)
/* 00007EB8 FC21002A */ fadd f1, f1, f0
/* 00007EBC FC200818 */ frsp f1, f1
/* 00007EC0 4BFF82ED */ bl func_80071B1C
/* 00007EC4 38600000 */ li r3, 0
/* 00007EC8 4BFF82E5 */ bl set_text_mul_color
/* 00007ECC 88010085 */ lbz r0, 0x85(r1)
/* 00007ED0 88610084 */ lbz r3, 0x84(r1)
/* 00007ED4 5400402E */ slwi r0, r0, 8
/* 00007ED8 88810086 */ lbz r4, 0x86(r1)
/* 00007EDC 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007EE0 7C830378 */ or r3, r4, r0
/* 00007EE4 4BFF82C9 */ bl set_text_add_color
/* 00007EE8 C85F0030 */ lfd f2, 0x30(r31)
/* 00007EEC C0210018 */ lfs f1, 0x18(r1)
/* 00007EF0 C001001C */ lfs f0, 0x1c(r1)
/* 00007EF4 FC22082A */ fadd f1, f2, f1
/* 00007EF8 FC42002A */ fadd f2, f2, f0
/* 00007EFC FC200818 */ frsp f1, f1
/* 00007F00 FC401018 */ frsp f2, f2
/* 00007F04 4BFF82A9 */ bl set_text_pos
/* 00007F08 7FC3F378 */ mr r3, r30
/* 00007F0C 4BFF82A1 */ bl sprite_puts
/* 00007F10 C0210060 */ lfs f1, 0x60(r1)
/* 00007F14 4BFF8299 */ bl func_80071B1C
/* 00007F18 88010021 */ lbz r0, 0x21(r1)
/* 00007F1C 88610020 */ lbz r3, 0x20(r1)
/* 00007F20 5400402E */ slwi r0, r0, 8
/* 00007F24 88810022 */ lbz r4, 0x22(r1)
/* 00007F28 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007F2C 7C830378 */ or r3, r4, r0
/* 00007F30 4BFF827D */ bl set_text_mul_color
/* 00007F34 88010085 */ lbz r0, 0x85(r1)
/* 00007F38 88610084 */ lbz r3, 0x84(r1)
/* 00007F3C 5400402E */ slwi r0, r0, 8
/* 00007F40 88810086 */ lbz r4, 0x86(r1)
/* 00007F44 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00007F48 7C830378 */ or r3, r4, r0
/* 00007F4C 4BFF8261 */ bl set_text_add_color
/* 00007F50 C0210018 */ lfs f1, 0x18(r1)
/* 00007F54 C041001C */ lfs f2, 0x1c(r1)
/* 00007F58 4BFF8255 */ bl set_text_pos
/* 00007F5C 7FC3F378 */ mr r3, r30
/* 00007F60 4BFF824D */ bl sprite_puts
/* 00007F64 4BFF8249 */ bl mathutil_mtxA_from_identity
/* 00007F68 3C600000 */ lis r3, mathutilData@ha
/* 00007F6C 38630000 */ addi r3, r3, mathutilData@l
/* 00007F70 80630000 */ lwz r3, 0(r3)
/* 00007F74 38800000 */ li r4, 0
/* 00007F78 4BFF8235 */ bl GXLoadPosMtxImm
/* 00007F7C BB6100D4 */ lmw r27, 0xd4(r1)
/* 00007F80 800100EC */ lwz r0, 0xec(r1)
/* 00007F84 382100E8 */ addi r1, r1, 0xe8
/* 00007F88 7C0803A6 */ mtlr r0
/* 00007F8C 4E800020 */ blr 
