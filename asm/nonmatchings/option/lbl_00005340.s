/* 00005340 7C0802A6 */ mflr r0
/* 00005344 7C651B78 */ mr r5, r3
/* 00005348 90010004 */ stw r0, 4(r1)
/* 0000534C 3C800000 */ lis r4, lbl_0000C8F0@ha
/* 00005350 9421FE90 */ stwu r1, -0x170(r1)
/* 00005354 DBE10168 */ stfd f31, 0x168(r1)
/* 00005358 BDC10120 */ stmw r14, 0x120(r1)
/* 0000535C 3BA40000 */ addi r29, r4, lbl_0000C8F0@l
/* 00005360 3C800000 */ lis r4, lbl_0000C370@ha
/* 00005364 3BE40000 */ addi r31, r4, lbl_0000C370@l
/* 00005368 8863000F */ lbz r3, 0xf(r3)
/* 0000536C 8265002C */ lwz r19, 0x2c(r5)
/* 00005370 7C630774 */ extsb r3, r3
/* 00005374 4BFFEBF9 */ bl lbl_00003F6C
/* 00005378 28030000 */ cmplwi r3, 0
/* 0000537C 41820040 */ beq lbl_000053BC
/* 00005380 C05F0000 */ lfs f2, 0(r31)
/* 00005384 C0230004 */ lfs f1, 4(r3)
/* 00005388 C0030008 */ lfs f0, 8(r3)
/* 0000538C FC601090 */ fmr f3, f2
/* 00005390 EC21002A */ fadds f1, f1, f0
/* 00005394 4BFFAE19 */ bl mathutil_mtxA_from_translate_xyz
/* 00005398 3C600000 */ lis r3, lbl_10000000@ha
/* 0000539C 38630000 */ addi r3, r3, lbl_10000000@l
/* 000053A0 38630184 */ addi r3, r3, 0x184
/* 000053A4 4BFFAE09 */ bl mathutil_mtxA_to_mtx
/* 000053A8 3C600000 */ lis r3, mathutilData@ha
/* 000053AC 38630000 */ addi r3, r3, mathutilData@l
/* 000053B0 80630000 */ lwz r3, 0(r3)
/* 000053B4 38800000 */ li r4, 0
/* 000053B8 4BFFADF5 */ bl GXLoadPosMtxImm
lbl_000053BC:
/* 000053BC 7FA3EB78 */ mr r3, r29
/* 000053C0 4BFFADED */ bl nlSprPut
/* 000053C4 3C600000 */ lis r3, lbl_10000000@ha
/* 000053C8 39E30000 */ addi r15, r3, lbl_10000000@l
/* 000053CC 3A0F000C */ addi r16, r15, 0xc
/* 000053D0 C00F000C */ lfs f0, 0xc(r15)
/* 000053D4 387D03E8 */ addi r3, r29, 0x3e8
/* 000053D8 D01D03EC */ stfs f0, 0x3ec(r29)
/* 000053DC C03F0094 */ lfs f1, 0x94(r31)
/* 000053E0 C05F0098 */ lfs f2, 0x98(r31)
/* 000053E4 4BFFEED9 */ bl lbl_000042BC
/* 000053E8 387D00F0 */ addi r3, r29, 0xf0
/* 000053EC 4BFFADC1 */ bl nlSprPut
/* 000053F0 C01F0088 */ lfs f0, 0x88(r31)
/* 000053F4 3BC100B0 */ addi r30, r1, 0xb0
/* 000053F8 388000B3 */ li r4, 0xb3
/* 000053FC D0010070 */ stfs f0, 0x70(r1)
/* 00005400 3A200000 */ li r17, 0
/* 00005404 3C000020 */ lis r0, 0x20
/* 00005408 C01F0060 */ lfs f0, 0x60(r31)
/* 0000540C 7FC3F378 */ mr r3, r30
/* 00005410 D0010064 */ stfs f0, 0x64(r1)
/* 00005414 C01F0060 */ lfs f0, 0x60(r31)
/* 00005418 D0010068 */ stfs f0, 0x68(r1)
/* 0000541C 98810025 */ stb r4, 0x25(r1)
/* 00005420 389D0530 */ addi r4, r29, 0x530
/* 00005424 9A210094 */ stb r17, 0x94(r1)
/* 00005428 9A210095 */ stb r17, 0x95(r1)
/* 0000542C 9A210096 */ stb r17, 0x96(r1)
/* 00005430 90010098 */ stw r0, 0x98(r1)
/* 00005434 4BFFAD79 */ bl strcpy
/* 00005438 4BFFAD75 */ bl reset_text_draw_settings
/* 0000543C 88610025 */ lbz r3, 0x25(r1)
/* 00005440 4BFFAD6D */ bl set_text_font
/* 00005444 C0210064 */ lfs f1, 0x64(r1)
/* 00005448 C0410068 */ lfs f2, 0x68(r1)
/* 0000544C 4BFFAD61 */ bl set_text_scale
/* 00005450 80610098 */ lwz r3, 0x98(r1)
/* 00005454 4BFFAD59 */ bl func_80071B50
/* 00005458 C0210070 */ lfs f1, 0x70(r1)
/* 0000545C 4BFFAD51 */ bl func_80071B1C
/* 00005460 88010031 */ lbz r0, 0x31(r1)
/* 00005464 88610030 */ lbz r3, 0x30(r1)
/* 00005468 5400402E */ slwi r0, r0, 8
/* 0000546C 88810032 */ lbz r4, 0x32(r1)
/* 00005470 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00005474 7C830378 */ or r3, r4, r0
/* 00005478 4BFFAD35 */ bl set_text_mul_color
/* 0000547C 88010095 */ lbz r0, 0x95(r1)
/* 00005480 88610094 */ lbz r3, 0x94(r1)
/* 00005484 5400402E */ slwi r0, r0, 8
/* 00005488 88810096 */ lbz r4, 0x96(r1)
/* 0000548C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00005490 7C830378 */ or r3, r4, r0
/* 00005494 4BFFAD19 */ bl set_text_add_color
/* 00005498 7FC3F378 */ mr r3, r30
/* 0000549C 4BFFAD11 */ bl u_get_text_width
/* 000054A0 C81F0058 */ lfd f0, 0x58(r31)
/* 000054A4 39C000FF */ li r14, 0xff
/* 000054A8 C85F00A8 */ lfd f2, 0xa8(r31)
/* 000054AC FC000072 */ fmul f0, f0, f1
/* 000054B0 FC020028 */ fsub f0, f2, f0
/* 000054B4 FC000018 */ frsp f0, f0
/* 000054B8 D0010028 */ stfs f0, 0x28(r1)
/* 000054BC C01F0090 */ lfs f0, 0x90(r31)
/* 000054C0 D001002C */ stfs f0, 0x2c(r1)
/* 000054C4 99C10030 */ stb r14, 0x30(r1)
/* 000054C8 99C10031 */ stb r14, 0x31(r1)
/* 000054CC 9A210032 */ stb r17, 0x32(r1)
/* 000054D0 4BFFACDD */ bl reset_text_draw_settings
/* 000054D4 88610025 */ lbz r3, 0x25(r1)
/* 000054D8 4BFFACD5 */ bl set_text_font
/* 000054DC C0210064 */ lfs f1, 0x64(r1)
/* 000054E0 C0410068 */ lfs f2, 0x68(r1)
/* 000054E4 4BFFACC9 */ bl set_text_scale
/* 000054E8 80610098 */ lwz r3, 0x98(r1)
/* 000054EC 4BFFACC1 */ bl func_80071B50
/* 000054F0 C83F0028 */ lfd f1, 0x28(r31)
/* 000054F4 C0010070 */ lfs f0, 0x70(r1)
/* 000054F8 FC21002A */ fadd f1, f1, f0
/* 000054FC FC200818 */ frsp f1, f1
/* 00005500 4BFFACAD */ bl func_80071B1C
/* 00005504 38600000 */ li r3, 0
/* 00005508 4BFFACA5 */ bl set_text_mul_color
/* 0000550C 88010095 */ lbz r0, 0x95(r1)
/* 00005510 88610094 */ lbz r3, 0x94(r1)
/* 00005514 5400402E */ slwi r0, r0, 8
/* 00005518 88810096 */ lbz r4, 0x96(r1)
/* 0000551C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00005520 7C830378 */ or r3, r4, r0
/* 00005524 4BFFAC89 */ bl set_text_add_color
/* 00005528 C85F0030 */ lfd f2, 0x30(r31)
/* 0000552C C0210028 */ lfs f1, 0x28(r1)
/* 00005530 C001002C */ lfs f0, 0x2c(r1)
/* 00005534 FC22082A */ fadd f1, f2, f1
/* 00005538 FC42002A */ fadd f2, f2, f0
/* 0000553C FC200818 */ frsp f1, f1
/* 00005540 FC401018 */ frsp f2, f2
/* 00005544 4BFFAC69 */ bl set_text_pos
/* 00005548 7FC3F378 */ mr r3, r30
/* 0000554C 4BFFAC61 */ bl sprite_puts
/* 00005550 C0210070 */ lfs f1, 0x70(r1)
/* 00005554 4BFFAC59 */ bl func_80071B1C
/* 00005558 88010031 */ lbz r0, 0x31(r1)
/* 0000555C 88610030 */ lbz r3, 0x30(r1)
/* 00005560 5400402E */ slwi r0, r0, 8
/* 00005564 88810032 */ lbz r4, 0x32(r1)
/* 00005568 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000556C 7C830378 */ or r3, r4, r0
/* 00005570 4BFFAC3D */ bl set_text_mul_color
/* 00005574 88010095 */ lbz r0, 0x95(r1)
/* 00005578 88610094 */ lbz r3, 0x94(r1)
/* 0000557C 5400402E */ slwi r0, r0, 8
/* 00005580 88810096 */ lbz r4, 0x96(r1)
/* 00005584 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00005588 7C830378 */ or r3, r4, r0
/* 0000558C 4BFFAC21 */ bl set_text_add_color
/* 00005590 C0210028 */ lfs f1, 0x28(r1)
/* 00005594 C041002C */ lfs f2, 0x2c(r1)
/* 00005598 4BFFAC15 */ bl set_text_pos
/* 0000559C 7FC3F378 */ mr r3, r30
/* 000055A0 4BFFAC0D */ bl sprite_puts
/* 000055A4 C01F00E0 */ lfs f0, 0xe0(r31)
/* 000055A8 3C600000 */ lis r3, lbl_1000629C@ha
/* 000055AC 3AA30000 */ addi r21, r3, lbl_1000629C@l
/* 000055B0 D0010070 */ stfs f0, 0x70(r1)
/* 000055B4 380000B1 */ li r0, 0xb1
/* 000055B8 7EA3AB78 */ mr r3, r21
/* 000055BC 99C10030 */ stb r14, 0x30(r1)
/* 000055C0 38A00000 */ li r5, 0
/* 000055C4 38800000 */ li r4, 0
/* 000055C8 99C10031 */ stb r14, 0x31(r1)
/* 000055CC 9A210032 */ stb r17, 0x32(r1)
/* 000055D0 98010025 */ stb r0, 0x25(r1)
/* 000055D4 C0300000 */ lfs f1, 0(r16)
/* 000055D8 C81F0048 */ lfd f0, 0x48(r31)
/* 000055DC FC010028 */ fsub f0, f1, f0
/* 000055E0 FC000018 */ frsp f0, f0
/* 000055E4 D0010028 */ stfs f0, 0x28(r1)
/* 000055E8 AC0F001C */ lhau r0, 0x1c(r15)
/* 000055EC 2C000000 */ cmpwi r0, 0
/* 000055F0 7C0903A6 */ mtctr r0
/* 000055F4 40810024 */ ble lbl_00005618
lbl_000055F8:
/* 000055F8 88030014 */ lbz r0, 0x14(r3)
/* 000055FC 7C000774 */ extsb r0, r0
/* 00005600 2C00FFFE */ cmpwi r0, -2
/* 00005604 40820008 */ bne lbl_0000560C
/* 00005608 38A50001 */ addi r5, r5, 1
lbl_0000560C:
/* 0000560C 38630018 */ addi r3, r3, 0x18
/* 00005610 38840001 */ addi r4, r4, 1
/* 00005614 4200FFE4 */ bdnz lbl_000055F8
lbl_00005618:
/* 00005618 7C042800 */ cmpw r4, r5
/* 0000561C 40810138 */ ble lbl_00005754
/* 00005620 3C600000 */ lis r3, globalAnimTimer@ha
/* 00005624 C85F00E8 */ lfd f2, 0xe8(r31)
/* 00005628 38830000 */ addi r4, r3, globalAnimTimer@l
/* 0000562C 3C608889 */ lis r3, 0x8889
/* 00005630 80840000 */ lwz r4, 0(r4)
/* 00005634 38038889 */ addi r0, r3, -30583
/* 00005638 7C002016 */ mulhwu r0, r0, r4
/* 0000563C 5400E13E */ srwi r0, r0, 4
/* 00005640 1C00001E */ mulli r0, r0, 0x1e
/* 00005644 7C002050 */ subf r0, r0, r4
/* 00005648 5400F87E */ srwi r0, r0, 1
/* 0000564C 9001011C */ stw r0, 0x11c(r1)
/* 00005650 3C004330 */ lis r0, 0x4330
/* 00005654 3C600000 */ lis r3, lbl_0000C4B0@ha
/* 00005658 90010118 */ stw r0, 0x118(r1)
/* 0000565C 389D053C */ addi r4, r29, 0x53c
/* 00005660 C8230000 */ lfd f1, lbl_0000C4B0@l(r3)
/* 00005664 7FC3F378 */ mr r3, r30
/* 00005668 C8010118 */ lfd f0, 0x118(r1)
/* 0000566C EC000828 */ fsubs f0, f0, f1
/* 00005670 FC020028 */ fsub f0, f2, f0
/* 00005674 FC000018 */ frsp f0, f0
/* 00005678 D001002C */ stfs f0, 0x2c(r1)
/* 0000567C 4BFFAB31 */ bl strcpy
/* 00005680 4BFFAB2D */ bl reset_text_draw_settings
/* 00005684 88610025 */ lbz r3, 0x25(r1)
/* 00005688 4BFFAB25 */ bl set_text_font
/* 0000568C C0210064 */ lfs f1, 0x64(r1)
/* 00005690 C0410068 */ lfs f2, 0x68(r1)
/* 00005694 4BFFAB19 */ bl set_text_scale
/* 00005698 80610098 */ lwz r3, 0x98(r1)
/* 0000569C 4BFFAB11 */ bl func_80071B50
/* 000056A0 C83F0028 */ lfd f1, 0x28(r31)
/* 000056A4 C0010070 */ lfs f0, 0x70(r1)
/* 000056A8 FC21002A */ fadd f1, f1, f0
/* 000056AC FC200818 */ frsp f1, f1
/* 000056B0 4BFFAAFD */ bl func_80071B1C
/* 000056B4 38600000 */ li r3, 0
/* 000056B8 4BFFAAF5 */ bl set_text_mul_color
/* 000056BC 88010095 */ lbz r0, 0x95(r1)
/* 000056C0 88610094 */ lbz r3, 0x94(r1)
/* 000056C4 5400402E */ slwi r0, r0, 8
/* 000056C8 88810096 */ lbz r4, 0x96(r1)
/* 000056CC 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000056D0 7C830378 */ or r3, r4, r0
/* 000056D4 4BFFAAD9 */ bl set_text_add_color
/* 000056D8 C85F0030 */ lfd f2, 0x30(r31)
/* 000056DC C0210028 */ lfs f1, 0x28(r1)
/* 000056E0 C001002C */ lfs f0, 0x2c(r1)
/* 000056E4 FC22082A */ fadd f1, f2, f1
/* 000056E8 FC42002A */ fadd f2, f2, f0
/* 000056EC FC200818 */ frsp f1, f1
/* 000056F0 FC401018 */ frsp f2, f2
/* 000056F4 4BFFAAB9 */ bl set_text_pos
/* 000056F8 7FC3F378 */ mr r3, r30
/* 000056FC 4BFFAAB1 */ bl sprite_puts
/* 00005700 C0210070 */ lfs f1, 0x70(r1)
/* 00005704 4BFFAAA9 */ bl func_80071B1C
/* 00005708 88010031 */ lbz r0, 0x31(r1)
/* 0000570C 88610030 */ lbz r3, 0x30(r1)
/* 00005710 5400402E */ slwi r0, r0, 8
/* 00005714 88810032 */ lbz r4, 0x32(r1)
/* 00005718 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000571C 7C830378 */ or r3, r4, r0
/* 00005720 4BFFAA8D */ bl set_text_mul_color
/* 00005724 88010095 */ lbz r0, 0x95(r1)
/* 00005728 88610094 */ lbz r3, 0x94(r1)
/* 0000572C 5400402E */ slwi r0, r0, 8
/* 00005730 88810096 */ lbz r4, 0x96(r1)
/* 00005734 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00005738 7C830378 */ or r3, r4, r0
/* 0000573C 4BFFAA71 */ bl set_text_add_color
/* 00005740 C0210028 */ lfs f1, 0x28(r1)
/* 00005744 C041002C */ lfs f2, 0x2c(r1)
/* 00005748 4BFFAA65 */ bl set_text_pos
/* 0000574C 7FC3F378 */ mr r3, r30
/* 00005750 4BFFAA5D */ bl sprite_puts
lbl_00005754:
/* 00005754 A80F0000 */ lha r0, 0(r15)
/* 00005758 38C00000 */ li r6, 0
/* 0000575C 3C800000 */ lis r4, lbl_1000629C@ha
/* 00005760 1C600018 */ mulli r3, r0, 0x18
/* 00005764 38E60000 */ addi r7, r6, 0
/* 00005768 38A40000 */ addi r5, r4, lbl_1000629C@l
/* 0000576C 4800001C */ b lbl_00005788
lbl_00005770:
/* 00005770 7C800774 */ extsb r0, r4
/* 00005774 2C00FFFE */ cmpwi r0, -2
/* 00005778 40820008 */ bne lbl_00005780
/* 0000577C 38C60001 */ addi r6, r6, 1
lbl_00005780:
/* 00005780 38630018 */ addi r3, r3, 0x18
/* 00005784 38E70001 */ addi r7, r7, 1
lbl_00005788:
/* 00005788 7C851A14 */ add r4, r5, r3
/* 0000578C 88840014 */ lbz r4, 0x14(r4)
/* 00005790 7C800774 */ extsb r0, r4
/* 00005794 2C00FFFF */ cmpwi r0, -1
/* 00005798 4182000C */ beq lbl_000057A4
/* 0000579C 2C07007F */ cmpwi r7, 0x7f
/* 000057A0 4180FFD0 */ blt lbl_00005770
lbl_000057A4:
/* 000057A4 7C063850 */ subf r0, r6, r7
/* 000057A8 2C000007 */ cmpwi r0, 7
/* 000057AC 40810138 */ ble lbl_000058E4
/* 000057B0 3C600000 */ lis r3, globalAnimTimer@ha
/* 000057B4 C85F00F0 */ lfd f2, 0xf0(r31)
/* 000057B8 38830000 */ addi r4, r3, globalAnimTimer@l
/* 000057BC 3C608889 */ lis r3, 0x8889
/* 000057C0 80840000 */ lwz r4, 0(r4)
/* 000057C4 38038889 */ addi r0, r3, -30583
/* 000057C8 7C002016 */ mulhwu r0, r0, r4
/* 000057CC 5400E13E */ srwi r0, r0, 4
/* 000057D0 1C00001E */ mulli r0, r0, 0x1e
/* 000057D4 7C002050 */ subf r0, r0, r4
/* 000057D8 5400F87E */ srwi r0, r0, 1
/* 000057DC 9001011C */ stw r0, 0x11c(r1)
/* 000057E0 3C004330 */ lis r0, 0x4330
/* 000057E4 3C600000 */ lis r3, lbl_0000C4B0@ha
/* 000057E8 90010118 */ stw r0, 0x118(r1)
/* 000057EC 389D054C */ addi r4, r29, 0x54c
/* 000057F0 C8230000 */ lfd f1, lbl_0000C4B0@l(r3)
/* 000057F4 7FC3F378 */ mr r3, r30
/* 000057F8 C8010118 */ lfd f0, 0x118(r1)
/* 000057FC EC000828 */ fsubs f0, f0, f1
/* 00005800 FC02002A */ fadd f0, f2, f0
/* 00005804 FC000018 */ frsp f0, f0
/* 00005808 D001002C */ stfs f0, 0x2c(r1)
/* 0000580C 4BFFA9A1 */ bl strcpy
/* 00005810 4BFFA99D */ bl reset_text_draw_settings
/* 00005814 88610025 */ lbz r3, 0x25(r1)
/* 00005818 4BFFA995 */ bl set_text_font
/* 0000581C C0210064 */ lfs f1, 0x64(r1)
/* 00005820 C0410068 */ lfs f2, 0x68(r1)
/* 00005824 4BFFA989 */ bl set_text_scale
/* 00005828 80610098 */ lwz r3, 0x98(r1)
/* 0000582C 4BFFA981 */ bl func_80071B50
/* 00005830 C83F0028 */ lfd f1, 0x28(r31)
/* 00005834 C0010070 */ lfs f0, 0x70(r1)
/* 00005838 FC21002A */ fadd f1, f1, f0
/* 0000583C FC200818 */ frsp f1, f1
/* 00005840 4BFFA96D */ bl func_80071B1C
/* 00005844 38600000 */ li r3, 0
/* 00005848 4BFFA965 */ bl set_text_mul_color
/* 0000584C 88010095 */ lbz r0, 0x95(r1)
/* 00005850 88610094 */ lbz r3, 0x94(r1)
/* 00005854 5400402E */ slwi r0, r0, 8
/* 00005858 88810096 */ lbz r4, 0x96(r1)
/* 0000585C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00005860 7C830378 */ or r3, r4, r0
/* 00005864 4BFFA949 */ bl set_text_add_color
/* 00005868 C85F0030 */ lfd f2, 0x30(r31)
/* 0000586C C0210028 */ lfs f1, 0x28(r1)
/* 00005870 C001002C */ lfs f0, 0x2c(r1)
/* 00005874 FC22082A */ fadd f1, f2, f1
/* 00005878 FC42002A */ fadd f2, f2, f0
/* 0000587C FC200818 */ frsp f1, f1
/* 00005880 FC401018 */ frsp f2, f2
/* 00005884 4BFFA929 */ bl set_text_pos
/* 00005888 7FC3F378 */ mr r3, r30
/* 0000588C 4BFFA921 */ bl sprite_puts
/* 00005890 C0210070 */ lfs f1, 0x70(r1)
/* 00005894 4BFFA919 */ bl func_80071B1C
/* 00005898 88010031 */ lbz r0, 0x31(r1)
/* 0000589C 88610030 */ lbz r3, 0x30(r1)
/* 000058A0 5400402E */ slwi r0, r0, 8
/* 000058A4 88810032 */ lbz r4, 0x32(r1)
/* 000058A8 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000058AC 7C830378 */ or r3, r4, r0
/* 000058B0 4BFFA8FD */ bl set_text_mul_color
/* 000058B4 88010095 */ lbz r0, 0x95(r1)
/* 000058B8 88610094 */ lbz r3, 0x94(r1)
/* 000058BC 5400402E */ slwi r0, r0, 8
/* 000058C0 88810096 */ lbz r4, 0x96(r1)
/* 000058C4 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000058C8 7C830378 */ or r3, r4, r0
/* 000058CC 4BFFA8E1 */ bl set_text_add_color
/* 000058D0 C0210028 */ lfs f1, 0x28(r1)
/* 000058D4 C041002C */ lfs f2, 0x2c(r1)
/* 000058D8 4BFFA8D5 */ bl set_text_pos
/* 000058DC 7FC3F378 */ mr r3, r30
/* 000058E0 4BFFA8CD */ bl sprite_puts
lbl_000058E4:
/* 000058E4 3C600000 */ lis r3, debugFlags@ha
/* 000058E8 80030000 */ lwz r0, debugFlags@l(r3)
/* 000058EC 7000000A */ andi. r0, r0, 0xa
/* 000058F0 40820024 */ bne lbl_00005914
/* 000058F4 3C600000 */ lis r3, lbl_10000000@ha
/* 000058F8 38630000 */ addi r3, r3, lbl_10000000@l
/* 000058FC 3883003B */ addi r4, r3, 0x3b
/* 00005900 8863003B */ lbz r3, 0x3b(r3)
/* 00005904 7C600775 */ extsb. r0, r3
/* 00005908 4081000C */ ble lbl_00005914
/* 0000590C 3803FFFF */ addi r0, r3, -1
/* 00005910 98040000 */ stb r0, 0(r4)
lbl_00005914:
/* 00005914 C01F00E0 */ lfs f0, 0xe0(r31)
/* 00005918 386000FF */ li r3, 0xff
/* 0000591C 3B400000 */ li r26, 0
/* 00005920 D0010070 */ stfs f0, 0x70(r1)
/* 00005924 380000B3 */ li r0, 0xb3
/* 00005928 98610030 */ stb r3, 0x30(r1)
/* 0000592C 98610031 */ stb r3, 0x31(r1)
/* 00005930 9B410032 */ stb r26, 0x32(r1)
/* 00005934 98010025 */ stb r0, 0x25(r1)
/* 00005938 80130010 */ lwz r0, 0x10(r19)
/* 0000593C 2C000007 */ cmpwi r0, 7
/* 00005940 40800494 */ bge lbl_00005DD4
/* 00005944 2C000001 */ cmpwi r0, 1
/* 00005948 40800008 */ bge lbl_00005950
/* 0000594C 48000488 */ b lbl_00005DD4
lbl_00005950:
/* 00005950 3C600000 */ lis r3, lbl_10000000@ha
/* 00005954 3A830000 */ addi r20, r3, lbl_10000000@l
/* 00005958 3C800000 */ lis r4, lbl_1000629C@ha
/* 0000595C 3C60FF90 */ lis r3, 0xff90
/* 00005960 3B3A0000 */ addi r25, r26, 0
/* 00005964 3B640000 */ addi r27, r4, lbl_1000629C@l
/* 00005968 3B1D0438 */ addi r24, r29, 0x438
/* 0000596C 39C38F8F */ addi r14, r3, -28785
/* 00005970 3A34003A */ addi r17, r20, 0x3a
/* 00005974 3A54001E */ addi r18, r20, 0x1e
/* 00005978 3F804330 */ lis r28, 0x4330
/* 0000597C 48000440 */ b lbl_00005DBC
lbl_00005980:
/* 00005980 A80F0000 */ lha r0, 0(r15)
/* 00005984 38600000 */ li r3, 0
/* 00005988 7C990214 */ add r4, r25, r0
/* 0000598C 7EDA2214 */ add r22, r26, r4
/* 00005990 4800000C */ b lbl_0000599C
lbl_00005994:
/* 00005994 3B5A0001 */ addi r26, r26, 1
/* 00005998 7EDA2214 */ add r22, r26, r4
lbl_0000599C:
/* 0000599C 1C160018 */ mulli r0, r22, 0x18
/* 000059A0 7EFB0214 */ add r23, r27, r0
/* 000059A4 88170014 */ lbz r0, 0x14(r23)
/* 000059A8 7C000774 */ extsb r0, r0
/* 000059AC 2C00FFFE */ cmpwi r0, -2
/* 000059B0 4182FFE4 */ beq lbl_00005994
/* 000059B4 2C00FFFF */ cmpwi r0, -1
/* 000059B8 4182041C */ beq lbl_00005DD4
/* 000059BC C0300000 */ lfs f1, 0(r16)
/* 000059C0 C81F00F8 */ lfd f0, 0xf8(r31)
/* 000059C4 FC010028 */ fsub f0, f1, f0
/* 000059C8 FC000018 */ frsp f0, f0
/* 000059CC D0010028 */ stfs f0, 0x28(r1)
/* 000059D0 88110000 */ lbz r0, 0(r17)
/* 000059D4 7C000774 */ extsb r0, r0
/* 000059D8 7C160000 */ cmpw r22, r0
/* 000059DC 40810010 */ ble lbl_000059EC
/* 000059E0 88D4003B */ lbz r6, 0x3b(r20)
/* 000059E4 7CC60774 */ extsb r6, r6
/* 000059E8 48000008 */ b lbl_000059F0
lbl_000059EC:
/* 000059EC 38C00000 */ li r6, 0
lbl_000059F0:
/* 000059F0 6F248000 */ xoris r4, r25, 0x8000
/* 000059F4 A8120000 */ lha r0, 0(r18)
/* 000059F8 9081011C */ stw r4, 0x11c(r1)
/* 000059FC 3CA00000 */ lis r5, lbl_0000C380@ha
/* 00005A00 6C048000 */ xoris r4, r0, 0x8000
/* 00005A04 C8250000 */ lfd f1, lbl_0000C380@l(r5)
/* 00005A08 93810118 */ stw r28, 0x118(r1)
/* 00005A0C 6CC08000 */ xoris r0, r6, 0x8000
/* 00005A10 C85F0080 */ lfd f2, 0x80(r31)
/* 00005A14 C8010118 */ lfd f0, 0x118(r1)
/* 00005A18 3CA00000 */ lis r5, lbl_0000C380@ha
/* 00005A1C 90810114 */ stw r4, 0x114(r1)
/* 00005A20 3C800000 */ lis r4, lbl_0000C380@ha
/* 00005A24 FC000828 */ fsub f0, f0, f1
/* 00005A28 9001010C */ stw r0, 0x10c(r1)
/* 00005A2C C87F0078 */ lfd f3, 0x78(r31)
/* 00005A30 FC420032 */ fmul f2, f2, f0
/* 00005A34 93810110 */ stw r28, 0x110(r1)
/* 00005A38 C8250000 */ lfd f1, lbl_0000C380@l(r5)
/* 00005A3C C8010110 */ lfd f0, 0x110(r1)
/* 00005A40 93810108 */ stw r28, 0x108(r1)
/* 00005A44 FFE3102A */ fadd f31, f3, f2
/* 00005A48 FC400828 */ fsub f2, f0, f1
/* 00005A4C C8240000 */ lfd f1, lbl_0000C380@l(r4)
/* 00005A50 C8010108 */ lfd f0, 0x108(r1)
/* 00005A54 FC5F102A */ fadd f2, f31, f2
/* 00005A58 FC000828 */ fsub f0, f0, f1
/* 00005A5C FC02002A */ fadd f0, f2, f0
/* 00005A60 FC000018 */ frsp f0, f0
/* 00005A64 D001002C */ stfs f0, 0x2c(r1)
/* 00005A68 A0170002 */ lhz r0, 2(r23)
/* 00005A6C 540405EF */ rlwinm. r4, r0, 0, 0x17, 0x17
/* 00005A70 41820124 */ beq lbl_00005B94
/* 00005A74 80130014 */ lwz r0, 0x14(r19)
/* 00005A78 7C160000 */ cmpw r22, r0
/* 00005A7C 4082001C */ bne lbl_00005A98
/* 00005A80 380000FF */ li r0, 0xff
/* 00005A84 98010030 */ stb r0, 0x30(r1)
/* 00005A88 38000000 */ li r0, 0
/* 00005A8C 98010031 */ stb r0, 0x31(r1)
/* 00005A90 98010032 */ stb r0, 0x32(r1)
/* 00005A94 48000018 */ b lbl_00005AAC
lbl_00005A98:
/* 00005A98 3800008F */ li r0, 0x8f
/* 00005A9C 98010030 */ stb r0, 0x30(r1)
/* 00005AA0 38000000 */ li r0, 0
/* 00005AA4 98010031 */ stb r0, 0x31(r1)
/* 00005AA8 98010032 */ stb r0, 0x32(r1)
lbl_00005AAC:
/* 00005AAC 387E0000 */ addi r3, r30, 0
/* 00005AB0 4CC63182 */ crclr 6
/* 00005AB4 389D055C */ addi r4, r29, 0x55c
/* 00005AB8 4BFFA6F5 */ bl sprintf
/* 00005ABC 4BFFA6F1 */ bl reset_text_draw_settings
/* 00005AC0 88610025 */ lbz r3, 0x25(r1)
/* 00005AC4 4BFFA6E9 */ bl set_text_font
/* 00005AC8 C0210064 */ lfs f1, 0x64(r1)
/* 00005ACC C0410068 */ lfs f2, 0x68(r1)
/* 00005AD0 4BFFA6DD */ bl set_text_scale
/* 00005AD4 80610098 */ lwz r3, 0x98(r1)
/* 00005AD8 4BFFA6D5 */ bl func_80071B50
/* 00005ADC C83F0028 */ lfd f1, 0x28(r31)
/* 00005AE0 C0010070 */ lfs f0, 0x70(r1)
/* 00005AE4 FC21002A */ fadd f1, f1, f0
/* 00005AE8 FC200818 */ frsp f1, f1
/* 00005AEC 4BFFA6C1 */ bl func_80071B1C
/* 00005AF0 38600000 */ li r3, 0
/* 00005AF4 4BFFA6B9 */ bl set_text_mul_color
/* 00005AF8 88010095 */ lbz r0, 0x95(r1)
/* 00005AFC 88610094 */ lbz r3, 0x94(r1)
/* 00005B00 5400402E */ slwi r0, r0, 8
/* 00005B04 88810096 */ lbz r4, 0x96(r1)
/* 00005B08 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00005B0C 7C830378 */ or r3, r4, r0
/* 00005B10 4BFFA69D */ bl set_text_add_color
/* 00005B14 C85F0030 */ lfd f2, 0x30(r31)
/* 00005B18 C0210028 */ lfs f1, 0x28(r1)
/* 00005B1C C001002C */ lfs f0, 0x2c(r1)
/* 00005B20 FC22082A */ fadd f1, f2, f1
/* 00005B24 FC42002A */ fadd f2, f2, f0
/* 00005B28 FC200818 */ frsp f1, f1
/* 00005B2C FC401018 */ frsp f2, f2
/* 00005B30 4BFFA67D */ bl set_text_pos
/* 00005B34 7FC3F378 */ mr r3, r30
/* 00005B38 4BFFA675 */ bl sprite_puts
/* 00005B3C C0210070 */ lfs f1, 0x70(r1)
/* 00005B40 4BFFA66D */ bl func_80071B1C
/* 00005B44 88010031 */ lbz r0, 0x31(r1)
/* 00005B48 88610030 */ lbz r3, 0x30(r1)
/* 00005B4C 5400402E */ slwi r0, r0, 8
/* 00005B50 88810032 */ lbz r4, 0x32(r1)
/* 00005B54 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00005B58 7C830378 */ or r3, r4, r0
/* 00005B5C 4BFFA651 */ bl set_text_mul_color
/* 00005B60 88010095 */ lbz r0, 0x95(r1)
/* 00005B64 88610094 */ lbz r3, 0x94(r1)
/* 00005B68 5400402E */ slwi r0, r0, 8
/* 00005B6C 88810096 */ lbz r4, 0x96(r1)
/* 00005B70 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00005B74 7C830378 */ or r3, r4, r0
/* 00005B78 4BFFA635 */ bl set_text_add_color
/* 00005B7C C0210028 */ lfs f1, 0x28(r1)
/* 00005B80 C041002C */ lfs f2, 0x2c(r1)
/* 00005B84 4BFFA629 */ bl set_text_pos
/* 00005B88 7FC3F378 */ mr r3, r30
/* 00005B8C 4BFFA621 */ bl sprite_puts
/* 00005B90 48000224 */ b lbl_00005DB4
lbl_00005B94:
/* 00005B94 80930014 */ lwz r4, 0x14(r19)
/* 00005B98 7C162000 */ cmpw r22, r4
/* 00005B9C 4082001C */ bne lbl_00005BB8
/* 00005BA0 38A000FF */ li r5, 0xff
/* 00005BA4 98A10030 */ stb r5, 0x30(r1)
/* 00005BA8 38800000 */ li r4, 0
/* 00005BAC 98A10031 */ stb r5, 0x31(r1)
/* 00005BB0 98810032 */ stb r4, 0x32(r1)
/* 00005BB4 48000018 */ b lbl_00005BCC
lbl_00005BB8:
/* 00005BB8 38A0008F */ li r5, 0x8f
/* 00005BBC 98A10030 */ stb r5, 0x30(r1)
/* 00005BC0 38800000 */ li r4, 0
/* 00005BC4 98A10031 */ stb r5, 0x31(r1)
/* 00005BC8 98810032 */ stb r4, 0x32(r1)
lbl_00005BCC:
/* 00005BCC 540406B5 */ rlwinm. r4, r0, 0, 0x1a, 0x1a
/* 00005BD0 38DD056C */ addi r6, r29, 0x56c
/* 00005BD4 41820008 */ beq lbl_00005BDC
/* 00005BD8 38DD0574 */ addi r6, r29, 0x574
lbl_00005BDC:
/* 00005BDC 54000673 */ rlwinm. r0, r0, 0, 0x19, 0x19
/* 00005BE0 4182000C */ beq lbl_00005BEC
/* 00005BE4 38DD057C */ addi r6, r29, 0x57c
/* 00005BE8 38600001 */ li r3, 1
lbl_00005BEC:
/* 00005BEC 2C030000 */ cmpwi r3, 0
/* 00005BF0 4182000C */ beq lbl_00005BFC
/* 00005BF4 38BD0584 */ addi r5, r29, 0x584
/* 00005BF8 48000014 */ b lbl_00005C0C
lbl_00005BFC:
/* 00005BFC 88170005 */ lbz r0, 5(r23)
/* 00005C00 5400103A */ slwi r0, r0, 2
/* 00005C04 7C7D0214 */ add r3, r29, r0
/* 00005C08 80A303A0 */ lwz r5, 0x3a0(r3)
lbl_00005C0C:
/* 00005C0C 88F70006 */ lbz r7, 6(r23)
/* 00005C10 387E0000 */ addi r3, r30, 0
/* 00005C14 4CC63182 */ crclr 6
/* 00005C18 389D0588 */ addi r4, r29, 0x588
/* 00005C1C 4BFFA591 */ bl sprintf
/* 00005C20 4BFFA58D */ bl reset_text_draw_settings
/* 00005C24 88610025 */ lbz r3, 0x25(r1)
/* 00005C28 4BFFA585 */ bl set_text_font
/* 00005C2C C0210064 */ lfs f1, 0x64(r1)
/* 00005C30 C0410068 */ lfs f2, 0x68(r1)
/* 00005C34 4BFFA579 */ bl set_text_scale
/* 00005C38 80610098 */ lwz r3, 0x98(r1)
/* 00005C3C 4BFFA571 */ bl func_80071B50
/* 00005C40 C83F0028 */ lfd f1, 0x28(r31)
/* 00005C44 C0010070 */ lfs f0, 0x70(r1)
/* 00005C48 FC21002A */ fadd f1, f1, f0
/* 00005C4C FC200818 */ frsp f1, f1
/* 00005C50 4BFFA55D */ bl func_80071B1C
/* 00005C54 38600000 */ li r3, 0
/* 00005C58 4BFFA555 */ bl set_text_mul_color
/* 00005C5C 88010095 */ lbz r0, 0x95(r1)
/* 00005C60 88610094 */ lbz r3, 0x94(r1)
/* 00005C64 5400402E */ slwi r0, r0, 8
/* 00005C68 88810096 */ lbz r4, 0x96(r1)
/* 00005C6C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00005C70 7C830378 */ or r3, r4, r0
/* 00005C74 4BFFA539 */ bl set_text_add_color
/* 00005C78 C85F0030 */ lfd f2, 0x30(r31)
/* 00005C7C C0210028 */ lfs f1, 0x28(r1)
/* 00005C80 C001002C */ lfs f0, 0x2c(r1)
/* 00005C84 FC22082A */ fadd f1, f2, f1
/* 00005C88 FC42002A */ fadd f2, f2, f0
/* 00005C8C FC200818 */ frsp f1, f1
/* 00005C90 FC401018 */ frsp f2, f2
/* 00005C94 4BFFA519 */ bl set_text_pos
/* 00005C98 7FC3F378 */ mr r3, r30
/* 00005C9C 4BFFA511 */ bl sprite_puts
/* 00005CA0 C0210070 */ lfs f1, 0x70(r1)
/* 00005CA4 4BFFA509 */ bl func_80071B1C
/* 00005CA8 88010031 */ lbz r0, 0x31(r1)
/* 00005CAC 88610030 */ lbz r3, 0x30(r1)
/* 00005CB0 5400402E */ slwi r0, r0, 8
/* 00005CB4 88810032 */ lbz r4, 0x32(r1)
/* 00005CB8 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00005CBC 7C830378 */ or r3, r4, r0
/* 00005CC0 4BFFA4ED */ bl set_text_mul_color
/* 00005CC4 88010095 */ lbz r0, 0x95(r1)
/* 00005CC8 88610094 */ lbz r3, 0x94(r1)
/* 00005CCC 5400402E */ slwi r0, r0, 8
/* 00005CD0 88810096 */ lbz r4, 0x96(r1)
/* 00005CD4 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00005CD8 7C830378 */ or r3, r4, r0
/* 00005CDC 4BFFA4D1 */ bl set_text_add_color
/* 00005CE0 C0210028 */ lfs f1, 0x28(r1)
/* 00005CE4 C041002C */ lfs f2, 0x2c(r1)
/* 00005CE8 4BFFA4C5 */ bl set_text_pos
/* 00005CEC 7FC3F378 */ mr r3, r30
/* 00005CF0 4BFFA4BD */ bl sprite_puts
/* 00005CF4 88170007 */ lbz r0, 7(r23)
/* 00005CF8 5400083C */ slwi r0, r0, 1
/* 00005CFC 7C7D0214 */ add r3, r29, r0
/* 00005D00 A8030488 */ lha r0, 0x488(r3)
/* 00005D04 901D0438 */ stw r0, 0x438(r29)
/* 00005D08 C0300000 */ lfs f1, 0(r16)
/* 00005D0C C81F0100 */ lfd f0, 0x100(r31)
/* 00005D10 FC010028 */ fsub f0, f1, f0
/* 00005D14 FC000018 */ frsp f0, f0
/* 00005D18 D01D043C */ stfs f0, 0x43c(r29)
/* 00005D1C 88110000 */ lbz r0, 0(r17)
/* 00005D20 7C000774 */ extsb r0, r0
/* 00005D24 7C160000 */ cmpw r22, r0
/* 00005D28 40810010 */ ble lbl_00005D38
/* 00005D2C 8814003B */ lbz r0, 0x3b(r20)
/* 00005D30 7C000774 */ extsb r0, r0
/* 00005D34 48000008 */ b lbl_00005D3C
lbl_00005D38:
/* 00005D38 38000000 */ li r0, 0
lbl_00005D3C:
/* 00005D3C A8720000 */ lha r3, 0(r18)
/* 00005D40 6C008000 */ xoris r0, r0, 0x8000
/* 00005D44 90010114 */ stw r0, 0x114(r1)
/* 00005D48 3C800000 */ lis r4, lbl_0000C380@ha
/* 00005D4C 6C608000 */ xoris r0, r3, 0x8000
/* 00005D50 9001010C */ stw r0, 0x10c(r1)
/* 00005D54 3C600000 */ lis r3, lbl_0000C380@ha
/* 00005D58 C85F0108 */ lfd f2, 0x108(r31)
/* 00005D5C 93810108 */ stw r28, 0x108(r1)
/* 00005D60 C8240000 */ lfd f1, lbl_0000C380@l(r4)
/* 00005D64 FC62F82A */ fadd f3, f2, f31
/* 00005D68 C8010108 */ lfd f0, 0x108(r1)
/* 00005D6C 93810110 */ stw r28, 0x110(r1)
/* 00005D70 FC400828 */ fsub f2, f0, f1
/* 00005D74 C8230000 */ lfd f1, lbl_0000C380@l(r3)
/* 00005D78 C8010110 */ lfd f0, 0x110(r1)
/* 00005D7C FC43102A */ fadd f2, f3, f2
/* 00005D80 FC000828 */ fsub f0, f0, f1
/* 00005D84 FC02002A */ fadd f0, f2, f0
/* 00005D88 FC000018 */ frsp f0, f0
/* 00005D8C D0180008 */ stfs f0, 8(r24)
/* 00005D90 80130014 */ lwz r0, 0x14(r19)
/* 00005D94 7C160000 */ cmpw r22, r0
/* 00005D98 40820010 */ bne lbl_00005DA8
/* 00005D9C 3800FFFF */ li r0, -1
/* 00005DA0 90180038 */ stw r0, 0x38(r24)
/* 00005DA4 48000008 */ b lbl_00005DAC
lbl_00005DA8:
/* 00005DA8 91D80038 */ stw r14, 0x38(r24)
lbl_00005DAC:
/* 00005DAC 7F03C378 */ mr r3, r24
/* 00005DB0 4BFFA3FD */ bl nlSprPut
lbl_00005DB4:
/* 00005DB4 3AB50018 */ addi r21, r21, 0x18
/* 00005DB8 3B390001 */ addi r25, r25, 1
lbl_00005DBC:
/* 00005DBC 2C190007 */ cmpwi r25, 7
/* 00005DC0 40800014 */ bge lbl_00005DD4
/* 00005DC4 88150014 */ lbz r0, 0x14(r21)
/* 00005DC8 7C000774 */ extsb r0, r0
/* 00005DCC 2C00FFFF */ cmpwi r0, -1
/* 00005DD0 4082FBB0 */ bne lbl_00005980
lbl_00005DD4:
/* 00005DD4 C01F0088 */ lfs f0, 0x88(r31)
/* 00005DD8 3C600000 */ lis r3, lbl_10000000@ha
/* 00005DDC 38630000 */ addi r3, r3, lbl_10000000@l
/* 00005DE0 D0010070 */ stfs f0, 0x70(r1)
/* 00005DE4 3A030010 */ addi r16, r3, 0x10
/* 00005DE8 387D0490 */ addi r3, r29, 0x490
/* 00005DEC C0100000 */ lfs f0, 0(r16)
/* 00005DF0 D01D0494 */ stfs f0, 0x494(r29)
/* 00005DF4 4BFFA3B9 */ bl nlSprPut
/* 00005DF8 3A200000 */ li r17, 0
/* 00005DFC 5620103A */ slwi r0, r17, 2
/* 00005E00 7DFD0214 */ add r15, r29, r0
/* 00005E04 3DC04330 */ lis r14, 0x4330
/* 00005E08 39EF03C0 */ addi r15, r15, 0x3c0
lbl_00005E0C:
/* 00005E0C 80130018 */ lwz r0, 0x18(r19)
/* 00005E10 7C110000 */ cmpw r17, r0
/* 00005E14 4082001C */ bne lbl_00005E30
/* 00005E18 386000FF */ li r3, 0xff
/* 00005E1C 98610030 */ stb r3, 0x30(r1)
/* 00005E20 38000000 */ li r0, 0
/* 00005E24 98610031 */ stb r3, 0x31(r1)
/* 00005E28 98010032 */ stb r0, 0x32(r1)
/* 00005E2C 48000018 */ b lbl_00005E44
lbl_00005E30:
/* 00005E30 3860008F */ li r3, 0x8f
/* 00005E34 98610030 */ stb r3, 0x30(r1)
/* 00005E38 38000000 */ li r0, 0
/* 00005E3C 98610031 */ stb r3, 0x31(r1)
/* 00005E40 98010032 */ stb r0, 0x32(r1)
lbl_00005E44:
/* 00005E44 7FC3F378 */ mr r3, r30
/* 00005E48 808F0000 */ lwz r4, 0(r15)
/* 00005E4C 4BFFA361 */ bl strcpy
/* 00005E50 4BFFA35D */ bl reset_text_draw_settings
/* 00005E54 88610025 */ lbz r3, 0x25(r1)
/* 00005E58 4BFFA355 */ bl set_text_font
/* 00005E5C C0210064 */ lfs f1, 0x64(r1)
/* 00005E60 C0410068 */ lfs f2, 0x68(r1)
/* 00005E64 4BFFA349 */ bl set_text_scale
/* 00005E68 80610098 */ lwz r3, 0x98(r1)
/* 00005E6C 4BFFA341 */ bl func_80071B50
/* 00005E70 C0210070 */ lfs f1, 0x70(r1)
/* 00005E74 4BFFA339 */ bl func_80071B1C
/* 00005E78 88010031 */ lbz r0, 0x31(r1)
/* 00005E7C 88610030 */ lbz r3, 0x30(r1)
/* 00005E80 5400402E */ slwi r0, r0, 8
/* 00005E84 88810032 */ lbz r4, 0x32(r1)
/* 00005E88 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00005E8C 7C830378 */ or r3, r4, r0
/* 00005E90 4BFFA31D */ bl set_text_mul_color
/* 00005E94 88010095 */ lbz r0, 0x95(r1)
/* 00005E98 88610094 */ lbz r3, 0x94(r1)
/* 00005E9C 5400402E */ slwi r0, r0, 8
/* 00005EA0 88810096 */ lbz r4, 0x96(r1)
/* 00005EA4 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00005EA8 7C830378 */ or r3, r4, r0
/* 00005EAC 4BFFA301 */ bl set_text_add_color
/* 00005EB0 7FC3F378 */ mr r3, r30
/* 00005EB4 4BFFA2F9 */ bl u_get_text_width
/* 00005EB8 C81F0058 */ lfd f0, 0x58(r31)
/* 00005EBC 6E208000 */ xoris r0, r17, 0x8000
/* 00005EC0 9001010C */ stw r0, 0x10c(r1)
/* 00005EC4 3C600000 */ lis r3, lbl_0000C380@ha
/* 00005EC8 FC000072 */ fmul f0, f0, f1
/* 00005ECC C0300000 */ lfs f1, 0(r16)
/* 00005ED0 91C10108 */ stw r14, 0x108(r1)
/* 00005ED4 FC210028 */ fsub f1, f1, f0
/* 00005ED8 C8010108 */ lfd f0, 0x108(r1)
/* 00005EDC FC200818 */ frsp f1, f1
/* 00005EE0 D0210028 */ stfs f1, 0x28(r1)
/* 00005EE4 C8230000 */ lfd f1, lbl_0000C380@l(r3)
/* 00005EE8 C85F0080 */ lfd f2, 0x80(r31)
/* 00005EEC FC000828 */ fsub f0, f0, f1
/* 00005EF0 C83F0110 */ lfd f1, 0x110(r31)
/* 00005EF4 FC020032 */ fmul f0, f2, f0
/* 00005EF8 FC01002A */ fadd f0, f1, f0
/* 00005EFC FC000018 */ frsp f0, f0
/* 00005F00 D001002C */ stfs f0, 0x2c(r1)
/* 00005F04 4BFFA2A9 */ bl reset_text_draw_settings
/* 00005F08 88610025 */ lbz r3, 0x25(r1)
/* 00005F0C 4BFFA2A1 */ bl set_text_font
/* 00005F10 C0210064 */ lfs f1, 0x64(r1)
/* 00005F14 C0410068 */ lfs f2, 0x68(r1)
/* 00005F18 4BFFA295 */ bl set_text_scale
/* 00005F1C 80610098 */ lwz r3, 0x98(r1)
/* 00005F20 4BFFA28D */ bl func_80071B50
/* 00005F24 C83F0028 */ lfd f1, 0x28(r31)
/* 00005F28 C0010070 */ lfs f0, 0x70(r1)
/* 00005F2C FC21002A */ fadd f1, f1, f0
/* 00005F30 FC200818 */ frsp f1, f1
/* 00005F34 4BFFA279 */ bl func_80071B1C
/* 00005F38 38600000 */ li r3, 0
/* 00005F3C 4BFFA271 */ bl set_text_mul_color
/* 00005F40 88010095 */ lbz r0, 0x95(r1)
/* 00005F44 88610094 */ lbz r3, 0x94(r1)
/* 00005F48 5400402E */ slwi r0, r0, 8
/* 00005F4C 88810096 */ lbz r4, 0x96(r1)
/* 00005F50 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00005F54 7C830378 */ or r3, r4, r0
/* 00005F58 4BFFA255 */ bl set_text_add_color
/* 00005F5C C85F0030 */ lfd f2, 0x30(r31)
/* 00005F60 C0210028 */ lfs f1, 0x28(r1)
/* 00005F64 C001002C */ lfs f0, 0x2c(r1)
/* 00005F68 FC22082A */ fadd f1, f2, f1
/* 00005F6C FC42002A */ fadd f2, f2, f0
/* 00005F70 FC200818 */ frsp f1, f1
/* 00005F74 FC401018 */ frsp f2, f2
/* 00005F78 4BFFA235 */ bl set_text_pos
/* 00005F7C 7FC3F378 */ mr r3, r30
/* 00005F80 4BFFA22D */ bl sprite_puts
/* 00005F84 C0210070 */ lfs f1, 0x70(r1)
/* 00005F88 4BFFA225 */ bl func_80071B1C
/* 00005F8C 88010031 */ lbz r0, 0x31(r1)
/* 00005F90 88610030 */ lbz r3, 0x30(r1)
/* 00005F94 5400402E */ slwi r0, r0, 8
/* 00005F98 88810032 */ lbz r4, 0x32(r1)
/* 00005F9C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00005FA0 7C830378 */ or r3, r4, r0
/* 00005FA4 4BFFA209 */ bl set_text_mul_color
/* 00005FA8 88010095 */ lbz r0, 0x95(r1)
/* 00005FAC 88610094 */ lbz r3, 0x94(r1)
/* 00005FB0 5400402E */ slwi r0, r0, 8
/* 00005FB4 88810096 */ lbz r4, 0x96(r1)
/* 00005FB8 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00005FBC 7C830378 */ or r3, r4, r0
/* 00005FC0 4BFFA1ED */ bl set_text_add_color
/* 00005FC4 C0210028 */ lfs f1, 0x28(r1)
/* 00005FC8 C041002C */ lfs f2, 0x2c(r1)
/* 00005FCC 4BFFA1E1 */ bl set_text_pos
/* 00005FD0 7FC3F378 */ mr r3, r30
/* 00005FD4 4BFFA1D9 */ bl sprite_puts
/* 00005FD8 3A310001 */ addi r17, r17, 1
/* 00005FDC 28110002 */ cmplwi r17, 2
/* 00005FE0 39EF0004 */ addi r15, r15, 4
/* 00005FE4 4180FE28 */ blt lbl_00005E0C
/* 00005FE8 3C600000 */ lis r3, lbl_10000000@ha
/* 00005FEC 3A430000 */ addi r18, r3, lbl_10000000@l
/* 00005FF0 C0120014 */ lfs f0, 0x14(r18)
/* 00005FF4 3A120014 */ addi r16, r18, 0x14
/* 00005FF8 387D04E0 */ addi r3, r29, 0x4e0
/* 00005FFC D01D04E4 */ stfs f0, 0x4e4(r29)
/* 00006000 4BFFA1AD */ bl nlSprPut
/* 00006004 380000EF */ li r0, 0xef
/* 00006008 98010030 */ stb r0, 0x30(r1)
/* 0000600C 3800009A */ li r0, 0x9a
/* 00006010 3A200000 */ li r17, 0
/* 00006014 98010031 */ stb r0, 0x31(r1)
/* 00006018 387E0000 */ addi r3, r30, 0
/* 0000601C 389D0594 */ addi r4, r29, 0x594
/* 00006020 9A210032 */ stb r17, 0x32(r1)
/* 00006024 4BFFA189 */ bl strcpy
/* 00006028 4BFFA185 */ bl reset_text_draw_settings
/* 0000602C 88610025 */ lbz r3, 0x25(r1)
/* 00006030 4BFFA17D */ bl set_text_font
/* 00006034 C0210064 */ lfs f1, 0x64(r1)
/* 00006038 C0410068 */ lfs f2, 0x68(r1)
/* 0000603C 4BFFA171 */ bl set_text_scale
/* 00006040 80610098 */ lwz r3, 0x98(r1)
/* 00006044 4BFFA169 */ bl func_80071B50
/* 00006048 C0210070 */ lfs f1, 0x70(r1)
/* 0000604C 4BFFA161 */ bl func_80071B1C
/* 00006050 88010031 */ lbz r0, 0x31(r1)
/* 00006054 88610030 */ lbz r3, 0x30(r1)
/* 00006058 5400402E */ slwi r0, r0, 8
/* 0000605C 88810032 */ lbz r4, 0x32(r1)
/* 00006060 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00006064 7C830378 */ or r3, r4, r0
/* 00006068 4BFFA145 */ bl set_text_mul_color
/* 0000606C 88010095 */ lbz r0, 0x95(r1)
/* 00006070 88610094 */ lbz r3, 0x94(r1)
/* 00006074 5400402E */ slwi r0, r0, 8
/* 00006078 88810096 */ lbz r4, 0x96(r1)
/* 0000607C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00006080 7C830378 */ or r3, r4, r0
/* 00006084 4BFFA129 */ bl set_text_add_color
/* 00006088 7FC3F378 */ mr r3, r30
/* 0000608C 4BFFA121 */ bl u_get_text_width
/* 00006090 C81F0058 */ lfd f0, 0x58(r31)
/* 00006094 C0500000 */ lfs f2, 0(r16)
/* 00006098 FC000072 */ fmul f0, f0, f1
/* 0000609C FC020028 */ fsub f0, f2, f0
/* 000060A0 FC000018 */ frsp f0, f0
/* 000060A4 D0010028 */ stfs f0, 0x28(r1)
/* 000060A8 C01F00C8 */ lfs f0, 0xc8(r31)
/* 000060AC D001002C */ stfs f0, 0x2c(r1)
/* 000060B0 4BFFA0FD */ bl reset_text_draw_settings
/* 000060B4 88610025 */ lbz r3, 0x25(r1)
/* 000060B8 4BFFA0F5 */ bl set_text_font
/* 000060BC C0210064 */ lfs f1, 0x64(r1)
/* 000060C0 C0410068 */ lfs f2, 0x68(r1)
/* 000060C4 4BFFA0E9 */ bl set_text_scale
/* 000060C8 80610098 */ lwz r3, 0x98(r1)
/* 000060CC 4BFFA0E1 */ bl func_80071B50
/* 000060D0 C83F0028 */ lfd f1, 0x28(r31)
/* 000060D4 C0010070 */ lfs f0, 0x70(r1)
/* 000060D8 FC21002A */ fadd f1, f1, f0
/* 000060DC FC200818 */ frsp f1, f1
/* 000060E0 4BFFA0CD */ bl func_80071B1C
/* 000060E4 38600000 */ li r3, 0
/* 000060E8 4BFFA0C5 */ bl set_text_mul_color
/* 000060EC 88010095 */ lbz r0, 0x95(r1)
/* 000060F0 88610094 */ lbz r3, 0x94(r1)
/* 000060F4 5400402E */ slwi r0, r0, 8
/* 000060F8 88810096 */ lbz r4, 0x96(r1)
/* 000060FC 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00006100 7C830378 */ or r3, r4, r0
/* 00006104 4BFFA0A9 */ bl set_text_add_color
/* 00006108 C85F0030 */ lfd f2, 0x30(r31)
/* 0000610C C0210028 */ lfs f1, 0x28(r1)
/* 00006110 C001002C */ lfs f0, 0x2c(r1)
/* 00006114 FC22082A */ fadd f1, f2, f1
/* 00006118 FC42002A */ fadd f2, f2, f0
/* 0000611C FC200818 */ frsp f1, f1
/* 00006120 FC401018 */ frsp f2, f2
/* 00006124 4BFFA089 */ bl set_text_pos
/* 00006128 7FC3F378 */ mr r3, r30
/* 0000612C 4BFFA081 */ bl sprite_puts
/* 00006130 C0210070 */ lfs f1, 0x70(r1)
/* 00006134 4BFFA079 */ bl func_80071B1C
/* 00006138 88010031 */ lbz r0, 0x31(r1)
/* 0000613C 88610030 */ lbz r3, 0x30(r1)
/* 00006140 5400402E */ slwi r0, r0, 8
/* 00006144 88810032 */ lbz r4, 0x32(r1)
/* 00006148 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000614C 7C830378 */ or r3, r4, r0
/* 00006150 4BFFA05D */ bl set_text_mul_color
/* 00006154 88010095 */ lbz r0, 0x95(r1)
/* 00006158 88610094 */ lbz r3, 0x94(r1)
/* 0000615C 5400402E */ slwi r0, r0, 8
/* 00006160 88810096 */ lbz r4, 0x96(r1)
/* 00006164 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00006168 7C830378 */ or r3, r4, r0
/* 0000616C 4BFFA041 */ bl set_text_add_color
/* 00006170 C0210028 */ lfs f1, 0x28(r1)
/* 00006174 C041002C */ lfs f2, 0x2c(r1)
/* 00006178 4BFFA035 */ bl set_text_pos
/* 0000617C 7FC3F378 */ mr r3, r30
/* 00006180 4BFFA02D */ bl sprite_puts
/* 00006184 56201838 */ slwi r0, r17, 3
/* 00006188 7DFD0214 */ add r15, r29, r0
/* 0000618C 3DC04330 */ lis r14, 0x4330
/* 00006190 39EF03D8 */ addi r15, r15, 0x3d8
lbl_00006194:
/* 00006194 80120004 */ lwz r0, 4(r18)
/* 00006198 7C110000 */ cmpw r17, r0
/* 0000619C 4082001C */ bne lbl_000061B8
/* 000061A0 386000FF */ li r3, 0xff
/* 000061A4 98610030 */ stb r3, 0x30(r1)
/* 000061A8 38000000 */ li r0, 0
/* 000061AC 98610031 */ stb r3, 0x31(r1)
/* 000061B0 98010032 */ stb r0, 0x32(r1)
/* 000061B4 48000018 */ b lbl_000061CC
lbl_000061B8:
/* 000061B8 3860008F */ li r3, 0x8f
/* 000061BC 98610030 */ stb r3, 0x30(r1)
/* 000061C0 38000000 */ li r0, 0
/* 000061C4 98610031 */ stb r3, 0x31(r1)
/* 000061C8 98010032 */ stb r0, 0x32(r1)
lbl_000061CC:
/* 000061CC 7FC3F378 */ mr r3, r30
/* 000061D0 808F0000 */ lwz r4, 0(r15)
/* 000061D4 4BFF9FD9 */ bl strcpy
/* 000061D8 4BFF9FD5 */ bl reset_text_draw_settings
/* 000061DC 88610025 */ lbz r3, 0x25(r1)
/* 000061E0 4BFF9FCD */ bl set_text_font
/* 000061E4 C0210064 */ lfs f1, 0x64(r1)
/* 000061E8 C0410068 */ lfs f2, 0x68(r1)
/* 000061EC 4BFF9FC1 */ bl set_text_scale
/* 000061F0 80610098 */ lwz r3, 0x98(r1)
/* 000061F4 4BFF9FB9 */ bl func_80071B50
/* 000061F8 C0210070 */ lfs f1, 0x70(r1)
/* 000061FC 4BFF9FB1 */ bl func_80071B1C
/* 00006200 88010031 */ lbz r0, 0x31(r1)
/* 00006204 88610030 */ lbz r3, 0x30(r1)
/* 00006208 5400402E */ slwi r0, r0, 8
/* 0000620C 88810032 */ lbz r4, 0x32(r1)
/* 00006210 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00006214 7C830378 */ or r3, r4, r0
/* 00006218 4BFF9F95 */ bl set_text_mul_color
/* 0000621C 88010095 */ lbz r0, 0x95(r1)
/* 00006220 88610094 */ lbz r3, 0x94(r1)
/* 00006224 5400402E */ slwi r0, r0, 8
/* 00006228 88810096 */ lbz r4, 0x96(r1)
/* 0000622C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00006230 7C830378 */ or r3, r4, r0
/* 00006234 4BFF9F79 */ bl set_text_add_color
/* 00006238 7FC3F378 */ mr r3, r30
/* 0000623C 4BFF9F71 */ bl u_get_text_width
/* 00006240 C81F0058 */ lfd f0, 0x58(r31)
/* 00006244 6E208000 */ xoris r0, r17, 0x8000
/* 00006248 9001010C */ stw r0, 0x10c(r1)
/* 0000624C 3C600000 */ lis r3, lbl_0000C380@ha
/* 00006250 FC000072 */ fmul f0, f0, f1
/* 00006254 C0300000 */ lfs f1, 0(r16)
/* 00006258 91C10108 */ stw r14, 0x108(r1)
/* 0000625C FC210028 */ fsub f1, f1, f0
/* 00006260 C8010108 */ lfd f0, 0x108(r1)
/* 00006264 FC200818 */ frsp f1, f1
/* 00006268 D0210028 */ stfs f1, 0x28(r1)
/* 0000626C C8230000 */ lfd f1, lbl_0000C380@l(r3)
/* 00006270 C85F0080 */ lfd f2, 0x80(r31)
/* 00006274 FC000828 */ fsub f0, f0, f1
/* 00006278 C83F0118 */ lfd f1, 0x118(r31)
/* 0000627C FC020032 */ fmul f0, f2, f0
/* 00006280 FC01002A */ fadd f0, f1, f0
/* 00006284 FC000018 */ frsp f0, f0
/* 00006288 D001002C */ stfs f0, 0x2c(r1)
/* 0000628C 4BFF9F21 */ bl reset_text_draw_settings
/* 00006290 88610025 */ lbz r3, 0x25(r1)
/* 00006294 4BFF9F19 */ bl set_text_font
/* 00006298 C0210064 */ lfs f1, 0x64(r1)
/* 0000629C C0410068 */ lfs f2, 0x68(r1)
/* 000062A0 4BFF9F0D */ bl set_text_scale
/* 000062A4 80610098 */ lwz r3, 0x98(r1)
/* 000062A8 4BFF9F05 */ bl func_80071B50
/* 000062AC C83F0028 */ lfd f1, 0x28(r31)
/* 000062B0 C0010070 */ lfs f0, 0x70(r1)
/* 000062B4 FC21002A */ fadd f1, f1, f0
/* 000062B8 FC200818 */ frsp f1, f1
/* 000062BC 4BFF9EF1 */ bl func_80071B1C
/* 000062C0 38600000 */ li r3, 0
/* 000062C4 4BFF9EE9 */ bl set_text_mul_color
/* 000062C8 88010095 */ lbz r0, 0x95(r1)
/* 000062CC 88610094 */ lbz r3, 0x94(r1)
/* 000062D0 5400402E */ slwi r0, r0, 8
/* 000062D4 88810096 */ lbz r4, 0x96(r1)
/* 000062D8 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000062DC 7C830378 */ or r3, r4, r0
/* 000062E0 4BFF9ECD */ bl set_text_add_color
/* 000062E4 C85F0030 */ lfd f2, 0x30(r31)
/* 000062E8 C0210028 */ lfs f1, 0x28(r1)
/* 000062EC C001002C */ lfs f0, 0x2c(r1)
/* 000062F0 FC22082A */ fadd f1, f2, f1
/* 000062F4 FC42002A */ fadd f2, f2, f0
/* 000062F8 FC200818 */ frsp f1, f1
/* 000062FC FC401018 */ frsp f2, f2
/* 00006300 4BFF9EAD */ bl set_text_pos
/* 00006304 7FC3F378 */ mr r3, r30
/* 00006308 4BFF9EA5 */ bl sprite_puts
/* 0000630C C0210070 */ lfs f1, 0x70(r1)
/* 00006310 4BFF9E9D */ bl func_80071B1C
/* 00006314 88010031 */ lbz r0, 0x31(r1)
/* 00006318 88610030 */ lbz r3, 0x30(r1)
/* 0000631C 5400402E */ slwi r0, r0, 8
/* 00006320 88810032 */ lbz r4, 0x32(r1)
/* 00006324 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00006328 7C830378 */ or r3, r4, r0
/* 0000632C 4BFF9E81 */ bl set_text_mul_color
/* 00006330 88010095 */ lbz r0, 0x95(r1)
/* 00006334 88610094 */ lbz r3, 0x94(r1)
/* 00006338 5400402E */ slwi r0, r0, 8
/* 0000633C 88810096 */ lbz r4, 0x96(r1)
/* 00006340 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00006344 7C830378 */ or r3, r4, r0
/* 00006348 4BFF9E65 */ bl set_text_add_color
/* 0000634C C0210028 */ lfs f1, 0x28(r1)
/* 00006350 C041002C */ lfs f2, 0x2c(r1)
/* 00006354 4BFF9E59 */ bl set_text_pos
/* 00006358 7FC3F378 */ mr r3, r30
/* 0000635C 4BFF9E51 */ bl sprite_puts
/* 00006360 3A310001 */ addi r17, r17, 1
/* 00006364 28110002 */ cmplwi r17, 2
/* 00006368 39EF0008 */ addi r15, r15, 8
/* 0000636C 4180FE28 */ blt lbl_00006194
/* 00006370 80130014 */ lwz r0, 0x14(r19)
/* 00006374 3C600000 */ lis r3, lbl_1000629C@ha
/* 00006378 39C30000 */ addi r14, r3, lbl_1000629C@l
/* 0000637C 1C000018 */ mulli r0, r0, 0x18
/* 00006380 7C6E0214 */ add r3, r14, r0
/* 00006384 A0030002 */ lhz r0, 2(r3)
/* 00006388 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 0000638C 41820300 */ beq lbl_0000668C
/* 00006390 380000FF */ li r0, 0xff
/* 00006394 4CC63182 */ crclr 6
/* 00006398 98010030 */ stb r0, 0x30(r1)
/* 0000639C 387E0000 */ addi r3, r30, 0
/* 000063A0 389D05A4 */ addi r4, r29, 0x5a4
/* 000063A4 98010031 */ stb r0, 0x31(r1)
/* 000063A8 98010032 */ stb r0, 0x32(r1)
/* 000063AC C01F00A4 */ lfs f0, 0xa4(r31)
/* 000063B0 D0010064 */ stfs f0, 0x64(r1)
/* 000063B4 4BFF9DF9 */ bl sprintf
/* 000063B8 4BFF9DF5 */ bl reset_text_draw_settings
/* 000063BC 88610025 */ lbz r3, 0x25(r1)
/* 000063C0 4BFF9DED */ bl set_text_font
/* 000063C4 C0210064 */ lfs f1, 0x64(r1)
/* 000063C8 C0410068 */ lfs f2, 0x68(r1)
/* 000063CC 4BFF9DE1 */ bl set_text_scale
/* 000063D0 80610098 */ lwz r3, 0x98(r1)
/* 000063D4 4BFF9DD9 */ bl func_80071B50
/* 000063D8 C0210070 */ lfs f1, 0x70(r1)
/* 000063DC 4BFF9DD1 */ bl func_80071B1C
/* 000063E0 88010031 */ lbz r0, 0x31(r1)
/* 000063E4 88610030 */ lbz r3, 0x30(r1)
/* 000063E8 5400402E */ slwi r0, r0, 8
/* 000063EC 88810032 */ lbz r4, 0x32(r1)
/* 000063F0 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000063F4 7C830378 */ or r3, r4, r0
/* 000063F8 4BFF9DB5 */ bl set_text_mul_color
/* 000063FC 88010095 */ lbz r0, 0x95(r1)
/* 00006400 88610094 */ lbz r3, 0x94(r1)
/* 00006404 5400402E */ slwi r0, r0, 8
/* 00006408 88810096 */ lbz r4, 0x96(r1)
/* 0000640C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00006410 7C830378 */ or r3, r4, r0
/* 00006414 4BFF9D99 */ bl set_text_add_color
/* 00006418 7FC3F378 */ mr r3, r30
/* 0000641C 4BFF9D91 */ bl u_get_text_width
/* 00006420 C81F0058 */ lfd f0, 0x58(r31)
/* 00006424 C85F00A8 */ lfd f2, 0xa8(r31)
/* 00006428 FC000072 */ fmul f0, f0, f1
/* 0000642C FC020028 */ fsub f0, f2, f0
/* 00006430 FC000018 */ frsp f0, f0
/* 00006434 D0010028 */ stfs f0, 0x28(r1)
/* 00006438 C01F0120 */ lfs f0, 0x120(r31)
/* 0000643C D001002C */ stfs f0, 0x2c(r1)
/* 00006440 4BFF9D6D */ bl reset_text_draw_settings
/* 00006444 88610025 */ lbz r3, 0x25(r1)
/* 00006448 4BFF9D65 */ bl set_text_font
/* 0000644C C0210064 */ lfs f1, 0x64(r1)
/* 00006450 C0410068 */ lfs f2, 0x68(r1)
/* 00006454 4BFF9D59 */ bl set_text_scale
/* 00006458 80610098 */ lwz r3, 0x98(r1)
/* 0000645C 4BFF9D51 */ bl func_80071B50
/* 00006460 C83F0028 */ lfd f1, 0x28(r31)
/* 00006464 C0010070 */ lfs f0, 0x70(r1)
/* 00006468 FC21002A */ fadd f1, f1, f0
/* 0000646C FC200818 */ frsp f1, f1
/* 00006470 4BFF9D3D */ bl func_80071B1C
/* 00006474 38600000 */ li r3, 0
/* 00006478 4BFF9D35 */ bl set_text_mul_color
/* 0000647C 88010095 */ lbz r0, 0x95(r1)
/* 00006480 88610094 */ lbz r3, 0x94(r1)
/* 00006484 5400402E */ slwi r0, r0, 8
/* 00006488 88810096 */ lbz r4, 0x96(r1)
/* 0000648C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00006490 7C830378 */ or r3, r4, r0
/* 00006494 4BFF9D19 */ bl set_text_add_color
/* 00006498 C85F0030 */ lfd f2, 0x30(r31)
/* 0000649C C0210028 */ lfs f1, 0x28(r1)
/* 000064A0 C001002C */ lfs f0, 0x2c(r1)
/* 000064A4 FC22082A */ fadd f1, f2, f1
/* 000064A8 FC42002A */ fadd f2, f2, f0
/* 000064AC FC200818 */ frsp f1, f1
/* 000064B0 FC401018 */ frsp f2, f2
/* 000064B4 4BFF9CF9 */ bl set_text_pos
/* 000064B8 7FC3F378 */ mr r3, r30
/* 000064BC 4BFF9CF1 */ bl sprite_puts
/* 000064C0 C0210070 */ lfs f1, 0x70(r1)
/* 000064C4 4BFF9CE9 */ bl func_80071B1C
/* 000064C8 88010031 */ lbz r0, 0x31(r1)
/* 000064CC 88610030 */ lbz r3, 0x30(r1)
/* 000064D0 5400402E */ slwi r0, r0, 8
/* 000064D4 88810032 */ lbz r4, 0x32(r1)
/* 000064D8 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000064DC 7C830378 */ or r3, r4, r0
/* 000064E0 4BFF9CCD */ bl set_text_mul_color
/* 000064E4 88010095 */ lbz r0, 0x95(r1)
/* 000064E8 88610094 */ lbz r3, 0x94(r1)
/* 000064EC 5400402E */ slwi r0, r0, 8
/* 000064F0 88810096 */ lbz r4, 0x96(r1)
/* 000064F4 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000064F8 7C830378 */ or r3, r4, r0
/* 000064FC 4BFF9CB1 */ bl set_text_add_color
/* 00006500 C0210028 */ lfs f1, 0x28(r1)
/* 00006504 C041002C */ lfs f2, 0x2c(r1)
/* 00006508 4BFF9CA5 */ bl set_text_pos
/* 0000650C 7FC3F378 */ mr r3, r30
/* 00006510 4BFF9C9D */ bl sprite_puts
/* 00006514 387E0000 */ addi r3, r30, 0
/* 00006518 4CC63182 */ crclr 6
/* 0000651C 389D05CC */ addi r4, r29, 0x5cc
/* 00006520 4BFF9C8D */ bl sprintf
/* 00006524 4BFF9C89 */ bl reset_text_draw_settings
/* 00006528 88610025 */ lbz r3, 0x25(r1)
/* 0000652C 4BFF9C81 */ bl set_text_font
/* 00006530 C0210064 */ lfs f1, 0x64(r1)
/* 00006534 C0410068 */ lfs f2, 0x68(r1)
/* 00006538 4BFF9C75 */ bl set_text_scale
/* 0000653C 80610098 */ lwz r3, 0x98(r1)
/* 00006540 4BFF9C6D */ bl func_80071B50
/* 00006544 C0210070 */ lfs f1, 0x70(r1)
/* 00006548 4BFF9C65 */ bl func_80071B1C
/* 0000654C 88010031 */ lbz r0, 0x31(r1)
/* 00006550 88610030 */ lbz r3, 0x30(r1)
/* 00006554 5400402E */ slwi r0, r0, 8
/* 00006558 88810032 */ lbz r4, 0x32(r1)
/* 0000655C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00006560 7C830378 */ or r3, r4, r0
/* 00006564 4BFF9C49 */ bl set_text_mul_color
/* 00006568 88010095 */ lbz r0, 0x95(r1)
/* 0000656C 88610094 */ lbz r3, 0x94(r1)
/* 00006570 5400402E */ slwi r0, r0, 8
/* 00006574 88810096 */ lbz r4, 0x96(r1)
/* 00006578 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000657C 7C830378 */ or r3, r4, r0
/* 00006580 4BFF9C2D */ bl set_text_add_color
/* 00006584 7FC3F378 */ mr r3, r30
/* 00006588 4BFF9C25 */ bl u_get_text_width
/* 0000658C C81F0058 */ lfd f0, 0x58(r31)
/* 00006590 C85F00A8 */ lfd f2, 0xa8(r31)
/* 00006594 FC000072 */ fmul f0, f0, f1
/* 00006598 FC020028 */ fsub f0, f2, f0
/* 0000659C FC000018 */ frsp f0, f0
/* 000065A0 D0010028 */ stfs f0, 0x28(r1)
/* 000065A4 C01F0124 */ lfs f0, 0x124(r31)
/* 000065A8 D001002C */ stfs f0, 0x2c(r1)
/* 000065AC 4BFF9C01 */ bl reset_text_draw_settings
/* 000065B0 88610025 */ lbz r3, 0x25(r1)
/* 000065B4 4BFF9BF9 */ bl set_text_font
/* 000065B8 C0210064 */ lfs f1, 0x64(r1)
/* 000065BC C0410068 */ lfs f2, 0x68(r1)
/* 000065C0 4BFF9BED */ bl set_text_scale
/* 000065C4 80610098 */ lwz r3, 0x98(r1)
/* 000065C8 4BFF9BE5 */ bl func_80071B50
/* 000065CC C83F0028 */ lfd f1, 0x28(r31)
/* 000065D0 C0010070 */ lfs f0, 0x70(r1)
/* 000065D4 FC21002A */ fadd f1, f1, f0
/* 000065D8 FC200818 */ frsp f1, f1
/* 000065DC 4BFF9BD1 */ bl func_80071B1C
/* 000065E0 38600000 */ li r3, 0
/* 000065E4 4BFF9BC9 */ bl set_text_mul_color
/* 000065E8 88010095 */ lbz r0, 0x95(r1)
/* 000065EC 88610094 */ lbz r3, 0x94(r1)
/* 000065F0 5400402E */ slwi r0, r0, 8
/* 000065F4 88810096 */ lbz r4, 0x96(r1)
/* 000065F8 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000065FC 7C830378 */ or r3, r4, r0
/* 00006600 4BFF9BAD */ bl set_text_add_color
/* 00006604 C85F0030 */ lfd f2, 0x30(r31)
/* 00006608 C0210028 */ lfs f1, 0x28(r1)
/* 0000660C C001002C */ lfs f0, 0x2c(r1)
/* 00006610 FC22082A */ fadd f1, f2, f1
/* 00006614 FC42002A */ fadd f2, f2, f0
/* 00006618 FC200818 */ frsp f1, f1
/* 0000661C FC401018 */ frsp f2, f2
/* 00006620 4BFF9B8D */ bl set_text_pos
/* 00006624 7FC3F378 */ mr r3, r30
/* 00006628 4BFF9B85 */ bl sprite_puts
/* 0000662C C0210070 */ lfs f1, 0x70(r1)
/* 00006630 4BFF9B7D */ bl func_80071B1C
/* 00006634 88010031 */ lbz r0, 0x31(r1)
/* 00006638 88610030 */ lbz r3, 0x30(r1)
/* 0000663C 5400402E */ slwi r0, r0, 8
/* 00006640 88810032 */ lbz r4, 0x32(r1)
/* 00006644 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00006648 7C830378 */ or r3, r4, r0
/* 0000664C 4BFF9B61 */ bl set_text_mul_color
/* 00006650 88010095 */ lbz r0, 0x95(r1)
/* 00006654 88610094 */ lbz r3, 0x94(r1)
/* 00006658 5400402E */ slwi r0, r0, 8
/* 0000665C 88810096 */ lbz r4, 0x96(r1)
/* 00006660 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00006664 7C830378 */ or r3, r4, r0
/* 00006668 4BFF9B45 */ bl set_text_add_color
/* 0000666C C0210028 */ lfs f1, 0x28(r1)
/* 00006670 C041002C */ lfs f2, 0x2c(r1)
/* 00006674 4BFF9B39 */ bl set_text_pos
/* 00006678 7FC3F378 */ mr r3, r30
/* 0000667C 4BFF9B31 */ bl sprite_puts
/* 00006680 C01F0060 */ lfs f0, 0x60(r31)
/* 00006684 D0010064 */ stfs f0, 0x64(r1)
/* 00006688 480003F0 */ b lbl_00006A78
lbl_0000668C:
/* 0000668C 380000FF */ li r0, 0xff
/* 00006690 4CC63182 */ crclr 6
/* 00006694 98010030 */ stb r0, 0x30(r1)
/* 00006698 387E0000 */ addi r3, r30, 0
/* 0000669C 389D05E8 */ addi r4, r29, 0x5e8
/* 000066A0 98010031 */ stb r0, 0x31(r1)
/* 000066A4 98010032 */ stb r0, 0x32(r1)
/* 000066A8 C01F0128 */ lfs f0, 0x128(r31)
/* 000066AC D0010028 */ stfs f0, 0x28(r1)
/* 000066B0 C01F0120 */ lfs f0, 0x120(r31)
/* 000066B4 D001002C */ stfs f0, 0x2c(r1)
/* 000066B8 80130014 */ lwz r0, 0x14(r19)
/* 000066BC 1C000018 */ mulli r0, r0, 0x18
/* 000066C0 7CAE0214 */ add r5, r14, r0
/* 000066C4 80A50008 */ lwz r5, 8(r5)
/* 000066C8 4BFF9AE5 */ bl sprintf
/* 000066CC 4BFF9AE1 */ bl reset_text_draw_settings
/* 000066D0 88610025 */ lbz r3, 0x25(r1)
/* 000066D4 4BFF9AD9 */ bl set_text_font
/* 000066D8 C0210064 */ lfs f1, 0x64(r1)
/* 000066DC C0410068 */ lfs f2, 0x68(r1)
/* 000066E0 4BFF9ACD */ bl set_text_scale
/* 000066E4 80610098 */ lwz r3, 0x98(r1)
/* 000066E8 4BFF9AC5 */ bl func_80071B50
/* 000066EC C83F0028 */ lfd f1, 0x28(r31)
/* 000066F0 C0010070 */ lfs f0, 0x70(r1)
/* 000066F4 FC21002A */ fadd f1, f1, f0
/* 000066F8 FC200818 */ frsp f1, f1
/* 000066FC 4BFF9AB1 */ bl func_80071B1C
/* 00006700 38600000 */ li r3, 0
/* 00006704 4BFF9AA9 */ bl set_text_mul_color
/* 00006708 88010095 */ lbz r0, 0x95(r1)
/* 0000670C 88610094 */ lbz r3, 0x94(r1)
/* 00006710 5400402E */ slwi r0, r0, 8
/* 00006714 88810096 */ lbz r4, 0x96(r1)
/* 00006718 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000671C 7C830378 */ or r3, r4, r0
/* 00006720 4BFF9A8D */ bl set_text_add_color
/* 00006724 C85F0030 */ lfd f2, 0x30(r31)
/* 00006728 C0210028 */ lfs f1, 0x28(r1)
/* 0000672C C001002C */ lfs f0, 0x2c(r1)
/* 00006730 FC22082A */ fadd f1, f2, f1
/* 00006734 FC42002A */ fadd f2, f2, f0
/* 00006738 FC200818 */ frsp f1, f1
/* 0000673C FC401018 */ frsp f2, f2
/* 00006740 4BFF9A6D */ bl set_text_pos
/* 00006744 7FC3F378 */ mr r3, r30
/* 00006748 4BFF9A65 */ bl sprite_puts
/* 0000674C C0210070 */ lfs f1, 0x70(r1)
/* 00006750 4BFF9A5D */ bl func_80071B1C
/* 00006754 88010031 */ lbz r0, 0x31(r1)
/* 00006758 88610030 */ lbz r3, 0x30(r1)
/* 0000675C 5400402E */ slwi r0, r0, 8
/* 00006760 88810032 */ lbz r4, 0x32(r1)
/* 00006764 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00006768 7C830378 */ or r3, r4, r0
/* 0000676C 4BFF9A41 */ bl set_text_mul_color
/* 00006770 88010095 */ lbz r0, 0x95(r1)
/* 00006774 88610094 */ lbz r3, 0x94(r1)
/* 00006778 5400402E */ slwi r0, r0, 8
/* 0000677C 88810096 */ lbz r4, 0x96(r1)
/* 00006780 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00006784 7C830378 */ or r3, r4, r0
/* 00006788 4BFF9A25 */ bl set_text_add_color
/* 0000678C C0210028 */ lfs f1, 0x28(r1)
/* 00006790 C041002C */ lfs f2, 0x2c(r1)
/* 00006794 4BFF9A19 */ bl set_text_pos
/* 00006798 7FC3F378 */ mr r3, r30
/* 0000679C 4BFF9A11 */ bl sprite_puts
/* 000067A0 C01F0124 */ lfs f0, 0x124(r31)
/* 000067A4 D0010028 */ stfs f0, 0x28(r1)
/* 000067A8 C01F0120 */ lfs f0, 0x120(r31)
/* 000067AC D001002C */ stfs f0, 0x2c(r1)
/* 000067B0 80130014 */ lwz r0, 0x14(r19)
/* 000067B4 1C000018 */ mulli r0, r0, 0x18
/* 000067B8 7C6E0214 */ add r3, r14, r0
/* 000067BC 80030010 */ lwz r0, 0x10(r3)
/* 000067C0 54059B7E */ srwi r5, r0, 0xd
/* 000067C4 2C050001 */ cmpwi r5, 1
/* 000067C8 4082000C */ bne lbl_000067D4
/* 000067CC 38DD0584 */ addi r6, r29, 0x584
/* 000067D0 48000008 */ b lbl_000067D8
lbl_000067D4:
/* 000067D4 38DD05F0 */ addi r6, r29, 0x5f0
lbl_000067D8:
/* 000067D8 387E0000 */ addi r3, r30, 0
/* 000067DC 4CC63182 */ crclr 6
/* 000067E0 389D05F4 */ addi r4, r29, 0x5f4
/* 000067E4 4BFF99C9 */ bl sprintf
/* 000067E8 4BFF99C5 */ bl reset_text_draw_settings
/* 000067EC 88610025 */ lbz r3, 0x25(r1)
/* 000067F0 4BFF99BD */ bl set_text_font
/* 000067F4 C0210064 */ lfs f1, 0x64(r1)
/* 000067F8 C0410068 */ lfs f2, 0x68(r1)
/* 000067FC 4BFF99B1 */ bl set_text_scale
/* 00006800 80610098 */ lwz r3, 0x98(r1)
/* 00006804 4BFF99A9 */ bl func_80071B50
/* 00006808 C83F0028 */ lfd f1, 0x28(r31)
/* 0000680C C0010070 */ lfs f0, 0x70(r1)
/* 00006810 FC21002A */ fadd f1, f1, f0
/* 00006814 FC200818 */ frsp f1, f1
/* 00006818 4BFF9995 */ bl func_80071B1C
/* 0000681C 38600000 */ li r3, 0
/* 00006820 4BFF998D */ bl set_text_mul_color
/* 00006824 88010095 */ lbz r0, 0x95(r1)
/* 00006828 88610094 */ lbz r3, 0x94(r1)
/* 0000682C 5400402E */ slwi r0, r0, 8
/* 00006830 88810096 */ lbz r4, 0x96(r1)
/* 00006834 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00006838 7C830378 */ or r3, r4, r0
/* 0000683C 4BFF9971 */ bl set_text_add_color
/* 00006840 C85F0030 */ lfd f2, 0x30(r31)
/* 00006844 C0210028 */ lfs f1, 0x28(r1)
/* 00006848 C001002C */ lfs f0, 0x2c(r1)
/* 0000684C FC22082A */ fadd f1, f2, f1
/* 00006850 FC42002A */ fadd f2, f2, f0
/* 00006854 FC200818 */ frsp f1, f1
/* 00006858 FC401018 */ frsp f2, f2
/* 0000685C 4BFF9951 */ bl set_text_pos
/* 00006860 7FC3F378 */ mr r3, r30
/* 00006864 4BFF9949 */ bl sprite_puts
/* 00006868 C0210070 */ lfs f1, 0x70(r1)
/* 0000686C 4BFF9941 */ bl func_80071B1C
/* 00006870 88010031 */ lbz r0, 0x31(r1)
/* 00006874 88610030 */ lbz r3, 0x30(r1)
/* 00006878 5400402E */ slwi r0, r0, 8
/* 0000687C 88810032 */ lbz r4, 0x32(r1)
/* 00006880 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00006884 7C830378 */ or r3, r4, r0
/* 00006888 4BFF9925 */ bl set_text_mul_color
/* 0000688C 88010095 */ lbz r0, 0x95(r1)
/* 00006890 88610094 */ lbz r3, 0x94(r1)
/* 00006894 5400402E */ slwi r0, r0, 8
/* 00006898 88810096 */ lbz r4, 0x96(r1)
/* 0000689C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000068A0 7C830378 */ or r3, r4, r0
/* 000068A4 4BFF9909 */ bl set_text_add_color
/* 000068A8 C0210028 */ lfs f1, 0x28(r1)
/* 000068AC C041002C */ lfs f2, 0x2c(r1)
/* 000068B0 4BFF98FD */ bl set_text_pos
/* 000068B4 7FC3F378 */ mr r3, r30
/* 000068B8 4BFF98F5 */ bl sprite_puts
/* 000068BC C01F012C */ lfs f0, 0x12c(r31)
/* 000068C0 3C600000 */ lis r3, lbl_1000629C@ha
/* 000068C4 3C808000 */ lis r4, 0x8000
/* 000068C8 D0010028 */ stfs f0, 0x28(r1)
/* 000068CC 390000B1 */ li r8, 0xb1
/* 000068D0 800400F8 */ lwz r0, 0xf8(r4)
/* 000068D4 39C30000 */ addi r14, r3, lbl_1000629C@l
/* 000068D8 C01F0124 */ lfs f0, 0x124(r31)
/* 000068DC 5407F0BE */ srwi r7, r0, 2
/* 000068E0 D001002C */ stfs f0, 0x2c(r1)
/* 000068E4 38C00000 */ li r6, 0
/* 000068E8 38A100E0 */ addi r5, r1, 0xe0
/* 000068EC 99010025 */ stb r8, 0x25(r1)
/* 000068F0 80130014 */ lwz r0, 0x14(r19)
/* 000068F4 1C000018 */ mulli r0, r0, 0x18
/* 000068F8 7C6E0214 */ add r3, r14, r0
/* 000068FC 8083000C */ lwz r4, 0xc(r3)
/* 00006900 7C6621D6 */ mullw r3, r6, r4
/* 00006904 7C072016 */ mulhwu r0, r7, r4
/* 00006908 7C630214 */ add r3, r3, r0
/* 0000690C 7C0731D6 */ mullw r0, r7, r6
/* 00006910 7C8721D6 */ mullw r4, r7, r4
/* 00006914 7C630214 */ add r3, r3, r0
/* 00006918 4BFF9895 */ bl OSTicksToCalendarTime
/* 0000691C 3C6051EC */ lis r3, 0x51ec
/* 00006920 80A100F4 */ lwz r5, 0xf4(r1)
/* 00006924 3803851F */ addi r0, r3, -31457
/* 00006928 80C100F0 */ lwz r6, 0xf0(r1)
/* 0000692C 7C002896 */ mulhw r0, r0, r5
/* 00006930 80E100EC */ lwz r7, 0xec(r1)
/* 00006934 810100E8 */ lwz r8, 0xe8(r1)
/* 00006938 4CC63182 */ crclr 6
/* 0000693C 812100E4 */ lwz r9, 0xe4(r1)
/* 00006940 7C002E70 */ srawi r0, r0, 5
/* 00006944 54030FFE */ srwi r3, r0, 0x1f
/* 00006948 7C001A14 */ add r0, r0, r3
/* 0000694C 1C000064 */ mulli r0, r0, 0x64
/* 00006950 387E0000 */ addi r3, r30, 0
/* 00006954 389D0604 */ addi r4, r29, 0x604
/* 00006958 7CA02850 */ subf r5, r0, r5
/* 0000695C 38C60001 */ addi r6, r6, 1
/* 00006960 4BFF984D */ bl sprintf
/* 00006964 4BFF9849 */ bl reset_text_draw_settings
/* 00006968 88610025 */ lbz r3, 0x25(r1)
/* 0000696C 4BFF9841 */ bl set_text_font
/* 00006970 C0210064 */ lfs f1, 0x64(r1)
/* 00006974 C0410068 */ lfs f2, 0x68(r1)
/* 00006978 4BFF9835 */ bl set_text_scale
/* 0000697C 80610098 */ lwz r3, 0x98(r1)
/* 00006980 4BFF982D */ bl func_80071B50
/* 00006984 C83F0028 */ lfd f1, 0x28(r31)
/* 00006988 C0010070 */ lfs f0, 0x70(r1)
/* 0000698C FC21002A */ fadd f1, f1, f0
/* 00006990 FC200818 */ frsp f1, f1
/* 00006994 4BFF9819 */ bl func_80071B1C
/* 00006998 38600000 */ li r3, 0
/* 0000699C 4BFF9811 */ bl set_text_mul_color
/* 000069A0 88010095 */ lbz r0, 0x95(r1)
/* 000069A4 88610094 */ lbz r3, 0x94(r1)
/* 000069A8 5400402E */ slwi r0, r0, 8
/* 000069AC 88810096 */ lbz r4, 0x96(r1)
/* 000069B0 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000069B4 7C830378 */ or r3, r4, r0
/* 000069B8 4BFF97F5 */ bl set_text_add_color
/* 000069BC C85F0030 */ lfd f2, 0x30(r31)
/* 000069C0 C0210028 */ lfs f1, 0x28(r1)
/* 000069C4 C001002C */ lfs f0, 0x2c(r1)
/* 000069C8 FC22082A */ fadd f1, f2, f1
/* 000069CC FC42002A */ fadd f2, f2, f0
/* 000069D0 FC200818 */ frsp f1, f1
/* 000069D4 FC401018 */ frsp f2, f2
/* 000069D8 4BFF97D5 */ bl set_text_pos
/* 000069DC 7FC3F378 */ mr r3, r30
/* 000069E0 4BFF97CD */ bl sprite_puts
/* 000069E4 C0210070 */ lfs f1, 0x70(r1)
/* 000069E8 4BFF97C5 */ bl func_80071B1C
/* 000069EC 88010031 */ lbz r0, 0x31(r1)
/* 000069F0 88610030 */ lbz r3, 0x30(r1)
/* 000069F4 5400402E */ slwi r0, r0, 8
/* 000069F8 88810032 */ lbz r4, 0x32(r1)
/* 000069FC 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00006A00 7C830378 */ or r3, r4, r0
/* 00006A04 4BFF97A9 */ bl set_text_mul_color
/* 00006A08 88010095 */ lbz r0, 0x95(r1)
/* 00006A0C 88610094 */ lbz r3, 0x94(r1)
/* 00006A10 5400402E */ slwi r0, r0, 8
/* 00006A14 88810096 */ lbz r4, 0x96(r1)
/* 00006A18 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00006A1C 7C830378 */ or r3, r4, r0
/* 00006A20 4BFF978D */ bl set_text_add_color
/* 00006A24 C0210028 */ lfs f1, 0x28(r1)
/* 00006A28 C041002C */ lfs f2, 0x2c(r1)
/* 00006A2C 4BFF9781 */ bl set_text_pos
/* 00006A30 7FC3F378 */ mr r3, r30
/* 00006A34 4BFF9779 */ bl sprite_puts
/* 00006A38 80130014 */ lwz r0, 0x14(r19)
/* 00006A3C 1C000018 */ mulli r0, r0, 0x18
/* 00006A40 7C6E0214 */ add r3, r14, r0
/* 00006A44 88030014 */ lbz r0, 0x14(r3)
/* 00006A48 7C000775 */ extsb. r0, r0
/* 00006A4C 4180002C */ blt lbl_00006A78
/* 00006A50 3C600000 */ lis r3, lbl_10006EC8@ha
/* 00006A54 C03F0130 */ lfs f1, 0x130(r31)
/* 00006A58 C05F0134 */ lfs f2, 0x134(r31)
/* 00006A5C 38630000 */ addi r3, r3, lbl_10006EC8@l
/* 00006A60 C07F0060 */ lfs f3, 0x60(r31)
/* 00006A64 3880FFFF */ li r4, -1
/* 00006A68 C09F0138 */ lfs f4, 0x138(r31)
/* 00006A6C C0BF013C */ lfs f5, 0x13c(r31)
/* 00006A70 38A00000 */ li r5, 0
/* 00006A74 4BFF9739 */ bl preview_draw
lbl_00006A78:
/* 00006A78 4BFF9735 */ bl mathutil_mtxA_from_identity
/* 00006A7C 3C600000 */ lis r3, mathutilData@ha
/* 00006A80 38630000 */ addi r3, r3, mathutilData@l
/* 00006A84 80630000 */ lwz r3, 0(r3)
/* 00006A88 38800000 */ li r4, 0
/* 00006A8C 4BFF9721 */ bl GXLoadPosMtxImm
/* 00006A90 B9C10120 */ lmw r14, 0x120(r1)
/* 00006A94 80010174 */ lwz r0, 0x174(r1)
/* 00006A98 CBE10168 */ lfd f31, 0x168(r1)
/* 00006A9C 38210170 */ addi r1, r1, 0x170
/* 00006AA0 7C0803A6 */ mtlr r0
/* 00006AA4 4E800020 */ blr 
