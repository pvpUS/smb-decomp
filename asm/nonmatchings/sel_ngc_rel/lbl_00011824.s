/* 00011824 7C0802A6 */ mflr r0
/* 00011828 3C800000 */ lis r4, lbl_00011CB0@ha
/* 0001182C 90010004 */ stw r0, 4(r1)
/* 00011830 9421FFE8 */ stwu r1, -0x18(r1)
/* 00011834 93E10014 */ stw r31, 0x14(r1)
/* 00011838 3BE40000 */ addi r31, r4, lbl_00011CB0@l
/* 0001183C 93C10010 */ stw r30, 0x10(r1)
/* 00011840 3BC30000 */ addi r30, r3, 0
/* 00011844 4BFEE945 */ bl reset_text_draw_settings
/* 00011848 C03E006C */ lfs f1, 0x6c(r30)
/* 0001184C 4BFEE93D */ bl set_text_opacity
/* 00011850 386000B1 */ li r3, 0xb1
/* 00011854 4BFEE935 */ bl set_text_font
/* 00011858 38600000 */ li r3, 0
/* 0001185C 4BFEE92D */ bl set_text_mul_color
/* 00011860 C03E0040 */ lfs f1, 0x40(r30)
/* 00011864 C05E0044 */ lfs f2, 0x44(r30)
/* 00011868 4BFEE921 */ bl set_text_scale
/* 0001186C C03E0004 */ lfs f1, 4(r30)
/* 00011870 C05E0008 */ lfs f2, 8(r30)
/* 00011874 4BFEE915 */ bl set_text_pos
/* 00011878 387E008C */ addi r3, r30, 0x8c
/* 0001187C 4BFEE90D */ bl sprite_puts
/* 00011880 38600001 */ li r3, 1
/* 00011884 4BFEE905 */ bl set_text_font
/* 00011888 3C600100 */ lis r3, 0x100
/* 0001188C 3863FF00 */ addi r3, r3, -256
/* 00011890 4BFEE8F9 */ bl set_text_mul_color
/* 00011894 C03F04A4 */ lfs f1, 0x4a4(r31)
/* 00011898 FC400890 */ fmr f2, f1
/* 0001189C 4BFEE8ED */ bl set_text_scale
/* 000118A0 C03F04A8 */ lfs f1, 0x4a8(r31)
/* 000118A4 C01E0004 */ lfs f0, 4(r30)
/* 000118A8 C05E0008 */ lfs f2, 8(r30)
/* 000118AC EC21002A */ fadds f1, f1, f0
/* 000118B0 4BFEE8D9 */ bl set_text_pos
/* 000118B4 3C600000 */ lis r3, g_totalPlayPoints@ha
/* 000118B8 4CC63182 */ crclr 6
/* 000118BC 3CA00000 */ lis r5, lbl_00017490@ha
/* 000118C0 80830000 */ lwz r4, g_totalPlayPoints@l(r3)
/* 000118C4 38650000 */ addi r3, r5, lbl_00017490@l
/* 000118C8 4BFEE8C1 */ bl sprite_printf
/* 000118CC 8001001C */ lwz r0, 0x1c(r1)
/* 000118D0 83E10014 */ lwz r31, 0x14(r1)
/* 000118D4 83C10010 */ lwz r30, 0x10(r1)
/* 000118D8 7C0803A6 */ mtlr r0
/* 000118DC 38210018 */ addi r1, r1, 0x18
/* 000118E0 4E800020 */ blr 
