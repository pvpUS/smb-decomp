/* 00004570 7C0802A6 */ mflr r0
/* 00004574 3C800000 */ lis r4, modeCtrl@ha
/* 00004578 90010004 */ stw r0, 4(r1)
/* 0000457C 3C600000 */ lis r3, lbl_0000BE80@ha
/* 00004580 38840000 */ addi r4, r4, modeCtrl@l
/* 00004584 9421FF58 */ stwu r1, -0xa8(r1)
/* 00004588 DBE100A0 */ stfd f31, 0xa0(r1)
/* 0000458C DBC10098 */ stfd f30, 0x98(r1)
/* 00004590 BE410060 */ stmw r18, 0x60(r1)
/* 00004594 3B230000 */ addi r25, r3, lbl_0000BE80@l
/* 00004598 3C600000 */ lis r3, lbl_80285A68@ha
/* 0000459C 80B90258 */ lwz r5, 0x258(r25)
/* 000045A0 8019025C */ lwz r0, 0x25c(r25)
/* 000045A4 90A1001C */ stw r5, 0x1c(r1)
/* 000045A8 3CA00000 */ lis r5, lbl_10000000@ha
/* 000045AC 3B050000 */ addi r24, r5, lbl_10000000@l
/* 000045B0 90010020 */ stw r0, 0x20(r1)
/* 000045B4 38030000 */ addi r0, r3, lbl_80285A68@l
/* 000045B8 80B90260 */ lwz r5, 0x260(r25)
/* 000045BC 80790264 */ lwz r3, 0x264(r25)
/* 000045C0 90A10024 */ stw r5, 0x24(r1)
/* 000045C4 90610028 */ stw r3, 0x28(r1)
/* 000045C8 80B90268 */ lwz r5, 0x268(r25)
/* 000045CC 8079026C */ lwz r3, 0x26c(r25)
/* 000045D0 90A1002C */ stw r5, 0x2c(r1)
/* 000045D4 90610030 */ stw r3, 0x30(r1)
/* 000045D8 80790270 */ lwz r3, 0x270(r25)
/* 000045DC 90610014 */ stw r3, 0x14(r1)
/* 000045E0 A0790274 */ lhz r3, 0x274(r25)
/* 000045E4 B0610018 */ sth r3, 0x18(r1)
/* 000045E8 8064002C */ lwz r3, 0x2c(r4)
/* 000045EC 1C630006 */ mulli r3, r3, 6
/* 000045F0 7C601A14 */ add r3, r0, r3
/* 000045F4 A8030000 */ lha r0, 0(r3)
/* 000045F8 2C000000 */ cmpwi r0, 0
/* 000045FC 418202A8 */ beq lbl_000048A4
/* 00004600 A8980036 */ lha r4, 0x36(r24)
/* 00004604 3C600000 */ lis r3, lbl_0000BEE0@ha
/* 00004608 C8430000 */ lfd f2, lbl_0000BEE0@l(r3)
/* 0000460C 6C808000 */ xoris r0, r4, 0x8000
/* 00004610 C8190278 */ lfd f0, 0x278(r25)
/* 00004614 9001005C */ stw r0, 0x5c(r1)
/* 00004618 3C004330 */ lis r0, 0x4330
/* 0000461C 90010058 */ stw r0, 0x58(r1)
/* 00004620 C8210058 */ lfd f1, 0x58(r1)
/* 00004624 FC211028 */ fsub f1, f1, f2
/* 00004628 FC010040 */ fcmpo cr0, f1, f0
/* 0000462C 4080000C */ bge lbl_00004638
/* 00004630 38040001 */ addi r0, r4, 1
/* 00004634 B0180036 */ sth r0, 0x36(r24)
lbl_00004638:
/* 00004638 A8180036 */ lha r0, 0x36(r24)
/* 0000463C 3C600000 */ lis r3, lbl_0000BEE0@ha
/* 00004640 3F404330 */ lis r26, 0x4330
/* 00004644 C8230000 */ lfd f1, lbl_0000BEE0@l(r3)
/* 00004648 6C008000 */ xoris r0, r0, 0x8000
/* 0000464C 9001005C */ stw r0, 0x5c(r1)
/* 00004650 C8590288 */ lfd f2, 0x288(r25)
/* 00004654 93410058 */ stw r26, 0x58(r1)
/* 00004658 C8010058 */ lfd f0, 0x58(r1)
/* 0000465C FC000828 */ fsub f0, f0, f1
/* 00004660 FC020032 */ fmul f0, f2, f0
/* 00004664 FC00001E */ fctiwz f0, f0
/* 00004668 D8010050 */ stfd f0, 0x50(r1)
/* 0000466C 80010054 */ lwz r0, 0x54(r1)
/* 00004670 7C030734 */ extsh r3, r0
/* 00004674 4BFFBAD9 */ bl mathutil_sin
/* 00004678 C8190280 */ lfd f0, 0x280(r25)
/* 0000467C 38600001 */ li r3, 1
/* 00004680 38800003 */ li r4, 3
/* 00004684 FFE00072 */ fmul f31, f0, f1
/* 00004688 38A00000 */ li r5, 0
/* 0000468C FFE0F818 */ frsp f31, f31
/* 00004690 4BFFBABD */ bl avdisp_set_z_mode
/* 00004694 3C600000 */ lis r3, mathutilData@ha
/* 00004698 3CA00000 */ lis r5, minigameGma@ha
/* 0000469C 3C80AAAB */ lis r4, 0xaaab
/* 000046A0 3CC00000 */ lis r6, currentCamera@ha
/* 000046A4 3A430000 */ addi r18, r3, mathutilData@l
/* 000046A8 3BA50000 */ addi r29, r5, minigameGma@l
/* 000046AC 3BC4AAAB */ addi r30, r4, -21845
/* 000046B0 3BE10014 */ addi r31, r1, 0x14
/* 000046B4 3AE10008 */ addi r23, r1, 8
/* 000046B8 3B61001C */ addi r27, r1, 0x1c
/* 000046BC 3B860000 */ addi r28, r6, currentCamera@l
/* 000046C0 3AC00000 */ li r22, 0
/* 000046C4 3A600000 */ li r19, 0
lbl_000046C8:
/* 000046C8 7C9B9A14 */ add r4, r27, r19
/* 000046CC 80640000 */ lwz r3, 0(r4)
/* 000046D0 80040004 */ lwz r0, 4(r4)
/* 000046D4 90610040 */ stw r3, 0x40(r1)
/* 000046D8 90010044 */ stw r0, 0x44(r1)
/* 000046DC 80040008 */ lwz r0, 8(r4)
/* 000046E0 90010048 */ stw r0, 0x48(r1)
/* 000046E4 807C0000 */ lwz r3, 0(r28)
/* 000046E8 C0210040 */ lfs f1, 0x40(r1)
/* 000046EC C0030000 */ lfs f0, 0(r3)
/* 000046F0 C0410044 */ lfs f2, 0x44(r1)
/* 000046F4 EC010028 */ fsubs f0, f1, f0
/* 000046F8 C0210048 */ lfs f1, 0x48(r1)
/* 000046FC D0010034 */ stfs f0, 0x34(r1)
/* 00004700 807C0000 */ lwz r3, 0(r28)
/* 00004704 C0030004 */ lfs f0, 4(r3)
/* 00004708 EC020028 */ fsubs f0, f2, f0
/* 0000470C D0010038 */ stfs f0, 0x38(r1)
/* 00004710 807C0000 */ lwz r3, 0(r28)
/* 00004714 C0030008 */ lfs f0, 8(r3)
/* 00004718 EC010028 */ fsubs f0, f1, f0
/* 0000471C D001003C */ stfs f0, 0x3c(r1)
/* 00004720 4BFFBA2D */ bl mathutil_mtxA_from_mtxB
/* 00004724 38610040 */ addi r3, r1, 0x40
/* 00004728 4BFFBA25 */ bl mathutil_mtxA_translate
/* 0000472C C0210034 */ lfs f1, 0x34(r1)
/* 00004730 C001003C */ lfs f0, 0x3c(r1)
/* 00004734 FC200850 */ fneg f1, f1
/* 00004738 FC400050 */ fneg f2, f0
/* 0000473C 4BFFBA11 */ bl mathutil_atan2
/* 00004740 7C630734 */ extsh r3, r3
/* 00004744 4BFFBA09 */ bl mathutil_mtxA_rotate_y
/* 00004748 C0390030 */ lfs f1, 0x30(r25)
/* 0000474C C0790290 */ lfs f3, 0x290(r25)
/* 00004750 FC400890 */ fmr f2, f1
/* 00004754 4BFFB9F9 */ bl mathutil_mtxA_translate_xyz
/* 00004758 3AA00000 */ li r21, 0
lbl_0000475C:
/* 0000475C 7C1EA816 */ mulhwu r0, r30, r21
/* 00004760 807D0000 */ lwz r3, 0(r29)
/* 00004764 C0390030 */ lfs f1, 0x30(r25)
/* 00004768 80630008 */ lwz r3, 8(r3)
/* 0000476C FC400890 */ fmr f2, f1
/* 00004770 5400F87E */ srwi r0, r0, 1
/* 00004774 C0790294 */ lfs f3, 0x294(r25)
/* 00004778 1C000003 */ mulli r0, r0, 3
/* 0000477C 7C00A850 */ subf r0, r0, r21
/* 00004780 5400083C */ slwi r0, r0, 1
/* 00004784 7C1F02AE */ lhax r0, r31, r0
/* 00004788 54001838 */ slwi r0, r0, 3
/* 0000478C 7E83002E */ lwzx r20, r3, r0
/* 00004790 4BFFB9BD */ bl mathutil_mtxA_translate_xyz
/* 00004794 4BFFB9B9 */ bl mathutil_mtxA_push
/* 00004798 38970004 */ addi r4, r23, 4
/* 0000479C 38770008 */ addi r3, r23, 8
/* 000047A0 3CA0E000 */ lis r5, 0xe000
/* 000047A4 C045000C */ lfs f2, 0xc(r5)
/* 000047A8 C025001C */ lfs f1, 0x1c(r5)
/* 000047AC C005002C */ lfs f0, 0x2c(r5)
/* 000047B0 D0410008 */ stfs f2, 8(r1)
/* 000047B4 D0240000 */ stfs f1, 0(r4)
/* 000047B8 D0030000 */ stfs f0, 0(r3)
/* 000047BC C0210008 */ lfs f1, 8(r1)
/* 000047C0 C041000C */ lfs f2, 0xc(r1)
/* 000047C4 C0010010 */ lfs f0, 0x10(r1)
/* 000047C8 EC210072 */ fmuls f1, f1, f1
/* 000047CC EC2208BA */ fmadds f1, f2, f2, f1
/* 000047D0 EC20083A */ fmadds f1, f0, f0, f1
/* 000047D4 4BFFB979 */ bl mathutil_sqrt
/* 000047D8 C01901D0 */ lfs f0, 0x1d0(r25)
/* 000047DC 3C600000 */ lis r3, lbl_0000BEE0@ha
/* 000047E0 A8180036 */ lha r0, 0x36(r24)
/* 000047E4 EC210028 */ fsubs f1, f1, f0
/* 000047E8 C8190130 */ lfd f0, 0x130(r25)
/* 000047EC 6C008000 */ xoris r0, r0, 0x8000
/* 000047F0 C8430000 */ lfd f2, lbl_0000BEE0@l(r3)
/* 000047F4 90010054 */ stw r0, 0x54(r1)
/* 000047F8 FC210028 */ fsub f1, f1, f0
/* 000047FC C8190198 */ lfd f0, 0x198(r25)
/* 00004800 93410050 */ stw r26, 0x50(r1)
/* 00004804 C8790298 */ lfd f3, 0x298(r25)
/* 00004808 FFC10024 */ fdiv f30, f1, f0
/* 0000480C C8210050 */ lfd f1, 0x50(r1)
/* 00004810 C81901B0 */ lfd f0, 0x1b0(r25)
/* 00004814 FC211028 */ fsub f1, f1, f2
/* 00004818 FFC0F018 */ frsp f30, f30
/* 0000481C FC230072 */ fmul f1, f3, f1
/* 00004820 FFDE0072 */ fmul f30, f30, f1
/* 00004824 FFC0F018 */ frsp f30, f30
/* 00004828 FC1E0040 */ fcmpo cr0, f30, f0
/* 0000482C 40810048 */ ble lbl_00004874
/* 00004830 FC20F890 */ fmr f1, f31
/* 00004834 4BFFB919 */ bl mathutil_mtxA_scale_s
/* 00004838 FC20F890 */ fmr f1, f31
/* 0000483C 4BFFB911 */ bl avdisp_set_bound_sphere_scale
/* 00004840 80720000 */ lwz r3, 0(r18)
/* 00004844 38800000 */ li r4, 0
/* 00004848 4BFFB905 */ bl gxutil_load_pos_nrm_matrix
/* 0000484C C81902A0 */ lfd f0, 0x2a0(r25)
/* 00004850 FC1E0040 */ fcmpo cr0, f30, f0
/* 00004854 40800018 */ bge lbl_0000486C
/* 00004858 FC20F090 */ fmr f1, f30
/* 0000485C 4BFFB8F1 */ bl avdisp_set_alpha
/* 00004860 7E83A378 */ mr r3, r20
/* 00004864 4BFFB8E9 */ bl avdisp_draw_model_unculled_sort_translucent
/* 00004868 4800000C */ b lbl_00004874
lbl_0000486C:
/* 0000486C 7E83A378 */ mr r3, r20
/* 00004870 4BFFB8DD */ bl avdisp_draw_model_unculled_sort_translucent
lbl_00004874:
/* 00004874 4BFFB8D9 */ bl mathutil_mtxA_pop
/* 00004878 3AB50001 */ addi r21, r21, 1
/* 0000487C 2C15000B */ cmpwi r21, 0xb
/* 00004880 4180FEDC */ blt lbl_0000475C
/* 00004884 3AD60001 */ addi r22, r22, 1
/* 00004888 28160002 */ cmplwi r22, 2
/* 0000488C 3A73000C */ addi r19, r19, 0xc
/* 00004890 4180FE38 */ blt lbl_000046C8
/* 00004894 38600001 */ li r3, 1
/* 00004898 38800003 */ li r4, 3
/* 0000489C 38A00001 */ li r5, 1
/* 000048A0 4BFFB8AD */ bl avdisp_set_z_mode
lbl_000048A4:
/* 000048A4 BA410060 */ lmw r18, 0x60(r1)
/* 000048A8 800100AC */ lwz r0, 0xac(r1)
/* 000048AC CBE100A0 */ lfd f31, 0xa0(r1)
/* 000048B0 CBC10098 */ lfd f30, 0x98(r1)
/* 000048B4 7C0803A6 */ mtlr r0
/* 000048B8 382100A8 */ addi r1, r1, 0xa8
/* 000048BC 4E800020 */ blr 
