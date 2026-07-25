/* 00009454 7C0802A6 */ mflr r0
/* 00009458 7C651B78 */ mr r5, r3
/* 0000945C 90010004 */ stw r0, 4(r1)
/* 00009460 3C800000 */ lis r4, lbl_0000C8F0@ha
/* 00009464 9421FF00 */ stwu r1, -0x100(r1)
/* 00009468 BF2100E4 */ stmw r25, 0xe4(r1)
/* 0000946C 3BA40000 */ addi r29, r4, lbl_0000C8F0@l
/* 00009470 3C800000 */ lis r4, lbl_0000C370@ha
/* 00009474 3BE40000 */ addi r31, r4, lbl_0000C370@l
/* 00009478 8863000F */ lbz r3, 0xf(r3)
/* 0000947C 8385002C */ lwz r28, 0x2c(r5)
/* 00009480 7C630774 */ extsb r3, r3
/* 00009484 4BFFAAE9 */ bl lbl_00003F6C
/* 00009488 28030000 */ cmplwi r3, 0
/* 0000948C 41820040 */ beq lbl_000094CC
/* 00009490 C05F0000 */ lfs f2, 0(r31)
/* 00009494 C0230004 */ lfs f1, 4(r3)
/* 00009498 C0030008 */ lfs f0, 8(r3)
/* 0000949C FC601090 */ fmr f3, f2
/* 000094A0 EC21002A */ fadds f1, f1, f0
/* 000094A4 4BFF6D09 */ bl mathutil_mtxA_from_translate_xyz
/* 000094A8 3C600000 */ lis r3, lbl_10000000@ha
/* 000094AC 38630000 */ addi r3, r3, lbl_10000000@l
/* 000094B0 38630184 */ addi r3, r3, 0x184
/* 000094B4 4BFF6CF9 */ bl mathutil_mtxA_to_mtx
/* 000094B8 3C600000 */ lis r3, mathutilData@ha
/* 000094BC 38630000 */ addi r3, r3, mathutilData@l
/* 000094C0 80630000 */ lwz r3, 0(r3)
/* 000094C4 38800000 */ li r4, 0
/* 000094C8 4BFF6CE5 */ bl GXLoadPosMtxImm
lbl_000094CC:
/* 000094CC 7FA3EB78 */ mr r3, r29
/* 000094D0 4BFF6CDD */ bl nlSprPut
/* 000094D4 C01F0088 */ lfs f0, 0x88(r31)
/* 000094D8 3BC100A0 */ addi r30, r1, 0xa0
/* 000094DC 388000B3 */ li r4, 0xb3
/* 000094E0 D0010060 */ stfs f0, 0x60(r1)
/* 000094E4 3B200000 */ li r25, 0
/* 000094E8 3C000020 */ lis r0, 0x20
/* 000094EC C01F0060 */ lfs f0, 0x60(r31)
/* 000094F0 7FC3F378 */ mr r3, r30
/* 000094F4 D0010054 */ stfs f0, 0x54(r1)
/* 000094F8 C01F0060 */ lfs f0, 0x60(r31)
/* 000094FC D0010058 */ stfs f0, 0x58(r1)
/* 00009500 98810015 */ stb r4, 0x15(r1)
/* 00009504 389D11AC */ addi r4, r29, 0x11ac
/* 00009508 9B210084 */ stb r25, 0x84(r1)
/* 0000950C 9B210085 */ stb r25, 0x85(r1)
/* 00009510 9B210086 */ stb r25, 0x86(r1)
/* 00009514 90010088 */ stw r0, 0x88(r1)
/* 00009518 4BFF6C95 */ bl strcpy
/* 0000951C 4BFF6C91 */ bl reset_text_draw_settings
/* 00009520 88610015 */ lbz r3, 0x15(r1)
/* 00009524 4BFF6C89 */ bl set_text_font
/* 00009528 C0210054 */ lfs f1, 0x54(r1)
/* 0000952C C0410058 */ lfs f2, 0x58(r1)
/* 00009530 4BFF6C7D */ bl set_text_scale
/* 00009534 80610088 */ lwz r3, 0x88(r1)
/* 00009538 4BFF6C75 */ bl func_80071B50
/* 0000953C C0210060 */ lfs f1, 0x60(r1)
/* 00009540 4BFF6C6D */ bl func_80071B1C
/* 00009544 88010021 */ lbz r0, 0x21(r1)
/* 00009548 88610020 */ lbz r3, 0x20(r1)
/* 0000954C 5400402E */ slwi r0, r0, 8
/* 00009550 88810022 */ lbz r4, 0x22(r1)
/* 00009554 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00009558 7C830378 */ or r3, r4, r0
/* 0000955C 4BFF6C51 */ bl set_text_mul_color
/* 00009560 88010085 */ lbz r0, 0x85(r1)
/* 00009564 88610084 */ lbz r3, 0x84(r1)
/* 00009568 5400402E */ slwi r0, r0, 8
/* 0000956C 88810086 */ lbz r4, 0x86(r1)
/* 00009570 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00009574 7C830378 */ or r3, r4, r0
/* 00009578 4BFF6C35 */ bl set_text_add_color
/* 0000957C 7FC3F378 */ mr r3, r30
/* 00009580 4BFF6C2D */ bl u_get_text_width
/* 00009584 C81F0058 */ lfd f0, 0x58(r31)
/* 00009588 380000FF */ li r0, 0xff
/* 0000958C C85F00A8 */ lfd f2, 0xa8(r31)
/* 00009590 FC000072 */ fmul f0, f0, f1
/* 00009594 FC020028 */ fsub f0, f2, f0
/* 00009598 FC000018 */ frsp f0, f0
/* 0000959C D0010018 */ stfs f0, 0x18(r1)
/* 000095A0 C01F0090 */ lfs f0, 0x90(r31)
/* 000095A4 D001001C */ stfs f0, 0x1c(r1)
/* 000095A8 98010020 */ stb r0, 0x20(r1)
/* 000095AC 98010021 */ stb r0, 0x21(r1)
/* 000095B0 9B210022 */ stb r25, 0x22(r1)
/* 000095B4 4BFF6BF9 */ bl reset_text_draw_settings
/* 000095B8 88610015 */ lbz r3, 0x15(r1)
/* 000095BC 4BFF6BF1 */ bl set_text_font
/* 000095C0 C0210054 */ lfs f1, 0x54(r1)
/* 000095C4 C0410058 */ lfs f2, 0x58(r1)
/* 000095C8 4BFF6BE5 */ bl set_text_scale
/* 000095CC 80610088 */ lwz r3, 0x88(r1)
/* 000095D0 4BFF6BDD */ bl func_80071B50
/* 000095D4 C83F0028 */ lfd f1, 0x28(r31)
/* 000095D8 C0010060 */ lfs f0, 0x60(r1)
/* 000095DC FC21002A */ fadd f1, f1, f0
/* 000095E0 FC200818 */ frsp f1, f1
/* 000095E4 4BFF6BC9 */ bl func_80071B1C
/* 000095E8 38600000 */ li r3, 0
/* 000095EC 4BFF6BC1 */ bl set_text_mul_color
/* 000095F0 88010085 */ lbz r0, 0x85(r1)
/* 000095F4 88610084 */ lbz r3, 0x84(r1)
/* 000095F8 5400402E */ slwi r0, r0, 8
/* 000095FC 88810086 */ lbz r4, 0x86(r1)
/* 00009600 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00009604 7C830378 */ or r3, r4, r0
/* 00009608 4BFF6BA5 */ bl set_text_add_color
/* 0000960C C85F0030 */ lfd f2, 0x30(r31)
/* 00009610 C0210018 */ lfs f1, 0x18(r1)
/* 00009614 C001001C */ lfs f0, 0x1c(r1)
/* 00009618 FC22082A */ fadd f1, f2, f1
/* 0000961C FC42002A */ fadd f2, f2, f0
/* 00009620 FC200818 */ frsp f1, f1
/* 00009624 FC401018 */ frsp f2, f2
/* 00009628 4BFF6B85 */ bl set_text_pos
/* 0000962C 7FC3F378 */ mr r3, r30
/* 00009630 4BFF6B7D */ bl sprite_puts
/* 00009634 C0210060 */ lfs f1, 0x60(r1)
/* 00009638 4BFF6B75 */ bl func_80071B1C
/* 0000963C 88010021 */ lbz r0, 0x21(r1)
/* 00009640 88610020 */ lbz r3, 0x20(r1)
/* 00009644 5400402E */ slwi r0, r0, 8
/* 00009648 88810022 */ lbz r4, 0x22(r1)
/* 0000964C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00009650 7C830378 */ or r3, r4, r0
/* 00009654 4BFF6B59 */ bl set_text_mul_color
/* 00009658 88010085 */ lbz r0, 0x85(r1)
/* 0000965C 88610084 */ lbz r3, 0x84(r1)
/* 00009660 5400402E */ slwi r0, r0, 8
/* 00009664 88810086 */ lbz r4, 0x86(r1)
/* 00009668 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000966C 7C830378 */ or r3, r4, r0
/* 00009670 4BFF6B3D */ bl set_text_add_color
/* 00009674 C0210018 */ lfs f1, 0x18(r1)
/* 00009678 C041001C */ lfs f2, 0x1c(r1)
/* 0000967C 4BFF6B31 */ bl set_text_pos
/* 00009680 7FC3F378 */ mr r3, r30
/* 00009684 4BFF6B29 */ bl sprite_puts
/* 00009688 C01F01F8 */ lfs f0, 0x1f8(r31)
/* 0000968C 3C800000 */ lis r4, lbl_10000000@ha
/* 00009690 38840000 */ addi r4, r4, lbl_10000000@l
/* 00009694 D01D0054 */ stfs f0, 0x54(r29)
/* 00009698 387D0050 */ addi r3, r29, 0x50
/* 0000969C C0040108 */ lfs f0, 0x108(r4)
/* 000096A0 D01D0058 */ stfs f0, 0x58(r29)
/* 000096A4 4BFF6B09 */ bl nlSprPut
/* 000096A8 C03F0148 */ lfs f1, 0x148(r31)
/* 000096AC 387D1058 */ addi r3, r29, 0x1058
/* 000096B0 C05F009C */ lfs f2, 0x9c(r31)
/* 000096B4 4BFFAC09 */ bl lbl_000042BC
/* 000096B8 3B200000 */ li r25, 0
/* 000096BC 5720103A */ slwi r0, r25, 2
/* 000096C0 7F5D0214 */ add r26, r29, r0
/* 000096C4 3F604330 */ lis r27, 0x4330
/* 000096C8 3B5A11A4 */ addi r26, r26, 0x11a4
lbl_000096CC:
/* 000096CC 6F208000 */ xoris r0, r25, 0x8000
/* 000096D0 C01F01FC */ lfs f0, 0x1fc(r31)
/* 000096D4 900100DC */ stw r0, 0xdc(r1)
/* 000096D8 3C600000 */ lis r3, lbl_0000C380@ha
/* 000096DC D0010018 */ stfs f0, 0x18(r1)
/* 000096E0 936100D8 */ stw r27, 0xd8(r1)
/* 000096E4 C8230000 */ lfd f1, lbl_0000C380@l(r3)
/* 000096E8 C80100D8 */ lfd f0, 0xd8(r1)
/* 000096EC C85F0080 */ lfd f2, 0x80(r31)
/* 000096F0 FC000828 */ fsub f0, f0, f1
/* 000096F4 C83F0200 */ lfd f1, 0x200(r31)
/* 000096F8 FC020032 */ fmul f0, f2, f0
/* 000096FC FC01002A */ fadd f0, f1, f0
/* 00009700 FC000018 */ frsp f0, f0
/* 00009704 D001001C */ stfs f0, 0x1c(r1)
/* 00009708 801C0018 */ lwz r0, 0x18(r28)
/* 0000970C 7C190000 */ cmpw r25, r0
/* 00009710 4082001C */ bne lbl_0000972C
/* 00009714 386000FF */ li r3, 0xff
/* 00009718 98610020 */ stb r3, 0x20(r1)
/* 0000971C 38000000 */ li r0, 0
/* 00009720 98610021 */ stb r3, 0x21(r1)
/* 00009724 98010022 */ stb r0, 0x22(r1)
/* 00009728 48000018 */ b lbl_00009740
lbl_0000972C:
/* 0000972C 3860008F */ li r3, 0x8f
/* 00009730 98610020 */ stb r3, 0x20(r1)
/* 00009734 38000000 */ li r0, 0
/* 00009738 98610021 */ stb r3, 0x21(r1)
/* 0000973C 98010022 */ stb r0, 0x22(r1)
lbl_00009740:
/* 00009740 7FC3F378 */ mr r3, r30
/* 00009744 809A0000 */ lwz r4, 0(r26)
/* 00009748 4BFF6A65 */ bl strcpy
/* 0000974C 4BFF6A61 */ bl reset_text_draw_settings
/* 00009750 88610015 */ lbz r3, 0x15(r1)
/* 00009754 4BFF6A59 */ bl set_text_font
/* 00009758 C0210054 */ lfs f1, 0x54(r1)
/* 0000975C C0410058 */ lfs f2, 0x58(r1)
/* 00009760 4BFF6A4D */ bl set_text_scale
/* 00009764 80610088 */ lwz r3, 0x88(r1)
/* 00009768 4BFF6A45 */ bl func_80071B50
/* 0000976C C83F0028 */ lfd f1, 0x28(r31)
/* 00009770 C0010060 */ lfs f0, 0x60(r1)
/* 00009774 FC21002A */ fadd f1, f1, f0
/* 00009778 FC200818 */ frsp f1, f1
/* 0000977C 4BFF6A31 */ bl func_80071B1C
/* 00009780 38600000 */ li r3, 0
/* 00009784 4BFF6A29 */ bl set_text_mul_color
/* 00009788 88010085 */ lbz r0, 0x85(r1)
/* 0000978C 88610084 */ lbz r3, 0x84(r1)
/* 00009790 5400402E */ slwi r0, r0, 8
/* 00009794 88810086 */ lbz r4, 0x86(r1)
/* 00009798 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000979C 7C830378 */ or r3, r4, r0
/* 000097A0 4BFF6A0D */ bl set_text_add_color
/* 000097A4 C85F0030 */ lfd f2, 0x30(r31)
/* 000097A8 C0210018 */ lfs f1, 0x18(r1)
/* 000097AC C001001C */ lfs f0, 0x1c(r1)
/* 000097B0 FC22082A */ fadd f1, f2, f1
/* 000097B4 FC42002A */ fadd f2, f2, f0
/* 000097B8 FC200818 */ frsp f1, f1
/* 000097BC FC401018 */ frsp f2, f2
/* 000097C0 4BFF69ED */ bl set_text_pos
/* 000097C4 7FC3F378 */ mr r3, r30
/* 000097C8 4BFF69E5 */ bl sprite_puts
/* 000097CC C0210060 */ lfs f1, 0x60(r1)
/* 000097D0 4BFF69DD */ bl func_80071B1C
/* 000097D4 88010021 */ lbz r0, 0x21(r1)
/* 000097D8 88610020 */ lbz r3, 0x20(r1)
/* 000097DC 5400402E */ slwi r0, r0, 8
/* 000097E0 88810022 */ lbz r4, 0x22(r1)
/* 000097E4 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000097E8 7C830378 */ or r3, r4, r0
/* 000097EC 4BFF69C1 */ bl set_text_mul_color
/* 000097F0 88010085 */ lbz r0, 0x85(r1)
/* 000097F4 88610084 */ lbz r3, 0x84(r1)
/* 000097F8 5400402E */ slwi r0, r0, 8
/* 000097FC 88810086 */ lbz r4, 0x86(r1)
/* 00009800 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00009804 7C830378 */ or r3, r4, r0
/* 00009808 4BFF69A5 */ bl set_text_add_color
/* 0000980C C0210018 */ lfs f1, 0x18(r1)
/* 00009810 C041001C */ lfs f2, 0x1c(r1)
/* 00009814 4BFF6999 */ bl set_text_pos
/* 00009818 7FC3F378 */ mr r3, r30
/* 0000981C 4BFF6991 */ bl sprite_puts
/* 00009820 3B390001 */ addi r25, r25, 1
/* 00009824 28190002 */ cmplwi r25, 2
/* 00009828 3B5A0004 */ addi r26, r26, 4
/* 0000982C 4180FEA0 */ blt lbl_000096CC
/* 00009830 387D00F0 */ addi r3, r29, 0xf0
/* 00009834 4BFF6979 */ bl nlSprPut
/* 00009838 380000FF */ li r0, 0xff
/* 0000983C 98010020 */ stb r0, 0x20(r1)
/* 00009840 3B200000 */ li r25, 0
/* 00009844 573A1838 */ slwi r26, r25, 3
/* 00009848 98010021 */ stb r0, 0x21(r1)
/* 0000984C 3F604330 */ lis r27, 0x4330
/* 00009850 9B210022 */ stb r25, 0x22(r1)
/* 00009854 C01F01C8 */ lfs f0, 0x1c8(r31)
/* 00009858 D0010054 */ stfs f0, 0x54(r1)
/* 0000985C 801C0018 */ lwz r0, 0x18(r28)
/* 00009860 54001838 */ slwi r0, r0, 3
/* 00009864 7F9D0214 */ add r28, r29, r0
/* 00009868 3B9C1164 */ addi r28, r28, 0x1164
/* 0000986C 480001D4 */ b lbl_00009A40
lbl_00009870:
/* 00009870 809C0000 */ lwz r4, 0(r28)
/* 00009874 7FC3F378 */ mr r3, r30
/* 00009878 7C84D02E */ lwzx r4, r4, r26
/* 0000987C 4BFF6931 */ bl strcpy
/* 00009880 4BFF692D */ bl reset_text_draw_settings
/* 00009884 88610015 */ lbz r3, 0x15(r1)
/* 00009888 4BFF6925 */ bl set_text_font
/* 0000988C C0210054 */ lfs f1, 0x54(r1)
/* 00009890 C0410058 */ lfs f2, 0x58(r1)
/* 00009894 4BFF6919 */ bl set_text_scale
/* 00009898 80610088 */ lwz r3, 0x88(r1)
/* 0000989C 4BFF6911 */ bl func_80071B50
/* 000098A0 C0210060 */ lfs f1, 0x60(r1)
/* 000098A4 4BFF6909 */ bl func_80071B1C
/* 000098A8 88010021 */ lbz r0, 0x21(r1)
/* 000098AC 88610020 */ lbz r3, 0x20(r1)
/* 000098B0 5400402E */ slwi r0, r0, 8
/* 000098B4 88810022 */ lbz r4, 0x22(r1)
/* 000098B8 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000098BC 7C830378 */ or r3, r4, r0
/* 000098C0 4BFF68ED */ bl set_text_mul_color
/* 000098C4 88010085 */ lbz r0, 0x85(r1)
/* 000098C8 88610084 */ lbz r3, 0x84(r1)
/* 000098CC 5400402E */ slwi r0, r0, 8
/* 000098D0 88810086 */ lbz r4, 0x86(r1)
/* 000098D4 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000098D8 7C830378 */ or r3, r4, r0
/* 000098DC 4BFF68D1 */ bl set_text_add_color
/* 000098E0 7FC3F378 */ mr r3, r30
/* 000098E4 4BFF68C9 */ bl u_get_text_width
/* 000098E8 C81F0058 */ lfd f0, 0x58(r31)
/* 000098EC 6F208000 */ xoris r0, r25, 0x8000
/* 000098F0 900100D4 */ stw r0, 0xd4(r1)
/* 000098F4 3C600000 */ lis r3, lbl_0000C380@ha
/* 000098F8 FC000072 */ fmul f0, f0, f1
/* 000098FC C83F00A8 */ lfd f1, 0xa8(r31)
/* 00009900 3C800000 */ lis r4, lbl_0000C380@ha
/* 00009904 936100D0 */ stw r27, 0xd0(r1)
/* 00009908 FC210028 */ fsub f1, f1, f0
/* 0000990C C80100D0 */ lfd f0, 0xd0(r1)
/* 00009910 FC200818 */ frsp f1, f1
/* 00009914 D0210018 */ stfs f1, 0x18(r1)
/* 00009918 80BC0004 */ lwz r5, 4(r28)
/* 0000991C C8230000 */ lfd f1, lbl_0000C380@l(r3)
/* 00009920 3805FFFF */ addi r0, r5, -1
/* 00009924 C8440000 */ lfd f2, lbl_0000C380@l(r4)
/* 00009928 6C008000 */ xoris r0, r0, 0x8000
/* 0000992C FC000828 */ fsub f0, f0, f1
/* 00009930 900100DC */ stw r0, 0xdc(r1)
/* 00009934 C83F0080 */ lfd f1, 0x80(r31)
/* 00009938 936100D8 */ stw r27, 0xd8(r1)
/* 0000993C FC010032 */ fmul f0, f1, f0
/* 00009940 C87F00B8 */ lfd f3, 0xb8(r31)
/* 00009944 C82100D8 */ lfd f1, 0xd8(r1)
/* 00009948 C89F00B0 */ lfd f4, 0xb0(r31)
/* 0000994C FC211028 */ fsub f1, f1, f2
/* 00009950 FC230072 */ fmul f1, f3, f1
/* 00009954 FC240828 */ fsub f1, f4, f1
/* 00009958 FC01002A */ fadd f0, f1, f0
/* 0000995C FC000018 */ frsp f0, f0
/* 00009960 D001001C */ stfs f0, 0x1c(r1)
/* 00009964 4BFF6849 */ bl reset_text_draw_settings
/* 00009968 88610015 */ lbz r3, 0x15(r1)
/* 0000996C 4BFF6841 */ bl set_text_font
/* 00009970 C0210054 */ lfs f1, 0x54(r1)
/* 00009974 C0410058 */ lfs f2, 0x58(r1)
/* 00009978 4BFF6835 */ bl set_text_scale
/* 0000997C 80610088 */ lwz r3, 0x88(r1)
/* 00009980 4BFF682D */ bl func_80071B50
/* 00009984 C83F0028 */ lfd f1, 0x28(r31)
/* 00009988 C0010060 */ lfs f0, 0x60(r1)
/* 0000998C FC21002A */ fadd f1, f1, f0
/* 00009990 FC200818 */ frsp f1, f1
/* 00009994 4BFF6819 */ bl func_80071B1C
/* 00009998 38600000 */ li r3, 0
/* 0000999C 4BFF6811 */ bl set_text_mul_color
/* 000099A0 88010085 */ lbz r0, 0x85(r1)
/* 000099A4 88610084 */ lbz r3, 0x84(r1)
/* 000099A8 5400402E */ slwi r0, r0, 8
/* 000099AC 88810086 */ lbz r4, 0x86(r1)
/* 000099B0 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000099B4 7C830378 */ or r3, r4, r0
/* 000099B8 4BFF67F5 */ bl set_text_add_color
/* 000099BC C85F0030 */ lfd f2, 0x30(r31)
/* 000099C0 C0210018 */ lfs f1, 0x18(r1)
/* 000099C4 C001001C */ lfs f0, 0x1c(r1)
/* 000099C8 FC22082A */ fadd f1, f2, f1
/* 000099CC FC42002A */ fadd f2, f2, f0
/* 000099D0 FC200818 */ frsp f1, f1
/* 000099D4 FC401018 */ frsp f2, f2
/* 000099D8 4BFF67D5 */ bl set_text_pos
/* 000099DC 7FC3F378 */ mr r3, r30
/* 000099E0 4BFF67CD */ bl sprite_puts
/* 000099E4 C0210060 */ lfs f1, 0x60(r1)
/* 000099E8 4BFF67C5 */ bl func_80071B1C
/* 000099EC 88010021 */ lbz r0, 0x21(r1)
/* 000099F0 88610020 */ lbz r3, 0x20(r1)
/* 000099F4 5400402E */ slwi r0, r0, 8
/* 000099F8 88810022 */ lbz r4, 0x22(r1)
/* 000099FC 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00009A00 7C830378 */ or r3, r4, r0
/* 00009A04 4BFF67A9 */ bl set_text_mul_color
/* 00009A08 88010085 */ lbz r0, 0x85(r1)
/* 00009A0C 88610084 */ lbz r3, 0x84(r1)
/* 00009A10 5400402E */ slwi r0, r0, 8
/* 00009A14 88810086 */ lbz r4, 0x86(r1)
/* 00009A18 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00009A1C 7C830378 */ or r3, r4, r0
/* 00009A20 4BFF678D */ bl set_text_add_color
/* 00009A24 C0210018 */ lfs f1, 0x18(r1)
/* 00009A28 C041001C */ lfs f2, 0x1c(r1)
/* 00009A2C 4BFF6781 */ bl set_text_pos
/* 00009A30 7FC3F378 */ mr r3, r30
/* 00009A34 4BFF6779 */ bl sprite_puts
/* 00009A38 3B5A0008 */ addi r26, r26, 8
/* 00009A3C 3B390001 */ addi r25, r25, 1
lbl_00009A40:
/* 00009A40 801C0004 */ lwz r0, 4(r28)
/* 00009A44 7C190000 */ cmpw r25, r0
/* 00009A48 4180FE28 */ blt lbl_00009870
/* 00009A4C 4BFF6761 */ bl mathutil_mtxA_from_identity
/* 00009A50 3C600000 */ lis r3, mathutilData@ha
/* 00009A54 38630000 */ addi r3, r3, mathutilData@l
/* 00009A58 80630000 */ lwz r3, 0(r3)
/* 00009A5C 38800000 */ li r4, 0
/* 00009A60 4BFF674D */ bl GXLoadPosMtxImm
/* 00009A64 BB2100E4 */ lmw r25, 0xe4(r1)
/* 00009A68 80010104 */ lwz r0, 0x104(r1)
/* 00009A6C 38210100 */ addi r1, r1, 0x100
/* 00009A70 7C0803A6 */ mtlr r0
/* 00009A74 4E800020 */ blr 
