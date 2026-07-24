/* 00009D18 7C0802A6 */ mflr r0
/* 00009D1C 3C600000 */ lis r3, lbl_100004E0@ha
/* 00009D20 90010004 */ stw r0, 4(r1)
/* 00009D24 38000015 */ li r0, 0x15
/* 00009D28 3C800000 */ lis r4, lbl_00011490@ha
/* 00009D2C 7C0903A6 */ mtctr r0
/* 00009D30 9421FF20 */ stwu r1, -0xe0(r1)
/* 00009D34 38C30000 */ addi r6, r3, lbl_100004E0@l
/* 00009D38 DBE100D8 */ stfd f31, 0xd8(r1)
/* 00009D3C 38A10000 */ addi r5, r1, 0
/* 00009D40 BF0100B8 */ stmw r24, 0xb8(r1)
/* 00009D44 3BC40000 */ addi r30, r4, lbl_00011490@l
/* 00009D48 389E3230 */ addi r4, r30, 0x3230
lbl_00009D4C:
/* 00009D4C 84640008 */ lwzu r3, 8(r4)
/* 00009D50 80040004 */ lwz r0, 4(r4)
/* 00009D54 94650008 */ stwu r3, 8(r5)
/* 00009D58 90050004 */ stw r0, 4(r5)
/* 00009D5C 4200FFF0 */ bdnz lbl_00009D4C
/* 00009D60 3FE60001 */ addis r31, r6, 1
/* 00009D64 801F1CE0 */ lwz r0, 0x1ce0(r31)
/* 00009D68 3B600000 */ li r27, 0
/* 00009D6C 2C000000 */ cmpwi r0, 0
/* 00009D70 408101D8 */ ble lbl_00009F48
/* 00009D74 3C800000 */ lis r4, mathutilData@ha
/* 00009D78 3C600000 */ lis r3, commonGma@ha
/* 00009D7C 3B860000 */ addi r28, r6, 0
/* 00009D80 3B240000 */ addi r25, r4, mathutilData@l
/* 00009D84 3B430000 */ addi r26, r3, commonGma@l
/* 00009D88 3BA00000 */ li r29, 0
/* 00009D8C 3F004330 */ lis r24, 0x4330
lbl_00009D90:
/* 00009D90 801F1CE0 */ lwz r0, 0x1ce0(r31)
/* 00009D94 7C1B0000 */ cmpw r27, r0
/* 00009D98 408001B0 */ bge lbl_00009F48
/* 00009D9C A87C0018 */ lha r3, 0x18(r28)
/* 00009DA0 7C600735 */ extsh. r0, r3
/* 00009DA4 40810194 */ ble lbl_00009F38
/* 00009DA8 881C001A */ lbz r0, 0x1a(r28)
/* 00009DAC 3B7B0001 */ addi r27, r27, 1
/* 00009DB0 2C000006 */ cmpwi r0, 6
/* 00009DB4 41820020 */ beq lbl_00009DD4
/* 00009DB8 2C03003F */ cmpwi r3, 0x3f
/* 00009DBC 40800018 */ bge lbl_00009DD4
/* 00009DC0 4BFF63A1 */ bl rand
/* 00009DC4 A81C0018 */ lha r0, 0x18(r28)
/* 00009DC8 546306BE */ clrlwi r3, r3, 0x1a
/* 00009DCC 7C001800 */ cmpw r0, r3
/* 00009DD0 41800168 */ blt lbl_00009F38
lbl_00009DD4:
/* 00009DD4 A8BC0018 */ lha r5, 0x18(r28)
/* 00009DD8 2C05003C */ cmpwi r5, 0x3c
/* 00009DDC 40800038 */ bge lbl_00009E14
/* 00009DE0 6CA08000 */ xoris r0, r5, 0x8000
/* 00009DE4 C85E32E8 */ lfd f2, 0x32e8(r30)
/* 00009DE8 900100B4 */ stw r0, 0xb4(r1)
/* 00009DEC 3C600000 */ lis r3, lbl_000146A0@ha
/* 00009DF0 C8230000 */ lfd f1, lbl_000146A0@l(r3)
/* 00009DF4 930100B0 */ stw r24, 0xb0(r1)
/* 00009DF8 C87E32E0 */ lfd f3, 0x32e0(r30)
/* 00009DFC C80100B0 */ lfd f0, 0xb0(r1)
/* 00009E00 FC000828 */ fsub f0, f0, f1
/* 00009E04 FC020032 */ fmul f0, f2, f0
/* 00009E08 FFE30032 */ fmul f31, f3, f0
/* 00009E0C FFE0F818 */ frsp f31, f31
/* 00009E10 48000048 */ b lbl_00009E58
lbl_00009E14:
/* 00009E14 2C05005A */ cmpwi r5, 0x5a
/* 00009E18 4081003C */ ble lbl_00009E54
/* 00009E1C 20050078 */ subfic r0, r5, 0x78
/* 00009E20 C85E32E0 */ lfd f2, 0x32e0(r30)
/* 00009E24 6C008000 */ xoris r0, r0, 0x8000
/* 00009E28 C87E32F0 */ lfd f3, 0x32f0(r30)
/* 00009E2C 900100B4 */ stw r0, 0xb4(r1)
/* 00009E30 3C600000 */ lis r3, lbl_000146A0@ha
/* 00009E34 C8230000 */ lfd f1, lbl_000146A0@l(r3)
/* 00009E38 930100B0 */ stw r24, 0xb0(r1)
/* 00009E3C C80100B0 */ lfd f0, 0xb0(r1)
/* 00009E40 FC000828 */ fsub f0, f0, f1
/* 00009E44 FC020032 */ fmul f0, f2, f0
/* 00009E48 FFE30032 */ fmul f31, f3, f0
/* 00009E4C FFE0F818 */ frsp f31, f31
/* 00009E50 48000008 */ b lbl_00009E58
lbl_00009E54:
/* 00009E54 C3FE32F8 */ lfs f31, 0x32f8(r30)
lbl_00009E58:
/* 00009E58 881C001A */ lbz r0, 0x1a(r28)
/* 00009E5C 7C040774 */ extsb r4, r0
/* 00009E60 2C04FFFF */ cmpwi r4, -1
/* 00009E64 40810090 */ ble lbl_00009EF4
/* 00009E68 2C040007 */ cmpwi r4, 7
/* 00009E6C 40800088 */ bge lbl_00009EF4
/* 00009E70 6CA08000 */ xoris r0, r5, 0x8000
/* 00009E74 C05E3220 */ lfs f2, 0x3220(r30)
/* 00009E78 900100B4 */ stw r0, 0xb4(r1)
/* 00009E7C 3C600000 */ lis r3, lbl_000146A0@ha
/* 00009E80 C8230000 */ lfd f1, lbl_000146A0@l(r3)
/* 00009E84 1C040018 */ mulli r0, r4, 0x18
/* 00009E88 930100B0 */ stw r24, 0xb0(r1)
/* 00009E8C C8FE3218 */ lfd f7, 0x3218(r30)
/* 00009E90 C80100B0 */ lfd f0, 0xb0(r1)
/* 00009E94 38610008 */ addi r3, r1, 8
/* 00009E98 7C630214 */ add r3, r3, r0
/* 00009E9C C09E32FC */ lfs f4, 0x32fc(r30)
/* 00009EA0 EC000828 */ fsubs f0, f0, f1
/* 00009EA4 C0A30000 */ lfs f5, 0(r3)
/* 00009EA8 C0C3000C */ lfs f6, 0xc(r3)
/* 00009EAC EC020032 */ fmuls f0, f2, f0
/* 00009EB0 C0630004 */ lfs f3, 4(r3)
/* 00009EB4 C0230008 */ lfs f1, 8(r3)
/* 00009EB8 C0430010 */ lfs f2, 0x10(r3)
/* 00009EBC ED000032 */ fmuls f8, f0, f0
/* 00009EC0 C0030014 */ lfs f0, 0x14(r3)
/* 00009EC4 FD274028 */ fsub f9, f7, f8
/* 00009EC8 ECE80172 */ fmuls f7, f8, f5
/* 00009ECC ECA800F2 */ fmuls f5, f8, f3
/* 00009ED0 FD204818 */ frsp f9, f9
/* 00009ED4 EC680072 */ fmuls f3, f8, f1
/* 00009ED8 EC2901B2 */ fmuls f1, f9, f6
/* 00009EDC EC4900B2 */ fmuls f2, f9, f2
/* 00009EE0 EC090032 */ fmuls f0, f9, f0
/* 00009EE4 EC27082A */ fadds f1, f7, f1
/* 00009EE8 EC45102A */ fadds f2, f5, f2
/* 00009EEC EC63002A */ fadds f3, f3, f0
/* 00009EF0 4BFF6271 */ bl avdisp_set_post_mult_color
lbl_00009EF4:
/* 00009EF4 7F83E378 */ mr r3, r28
/* 00009EF8 4BFF6269 */ bl mathutil_mtxA_from_mtxB_translate
/* 00009EFC 4BFF6265 */ bl mathutil_mtxA_sq_from_identity
/* 00009F00 FC20F890 */ fmr f1, f31
/* 00009F04 C07E32FC */ lfs f3, 0x32fc(r30)
/* 00009F08 FC40F890 */ fmr f2, f31
/* 00009F0C 4BFF6255 */ bl mathutil_mtxA_scale_xyz
/* 00009F10 80790000 */ lwz r3, 0(r25)
/* 00009F14 38800000 */ li r4, 0
/* 00009F18 4BFF6249 */ bl GXLoadPosMtxImm
/* 00009F1C 80790000 */ lwz r3, 0(r25)
/* 00009F20 38800000 */ li r4, 0
/* 00009F24 4BFF623D */ bl GXLoadNrmMtxImm
/* 00009F28 807A0000 */ lwz r3, 0(r26)
/* 00009F2C 80630008 */ lwz r3, 8(r3)
/* 00009F30 806300D8 */ lwz r3, 0xd8(r3)
/* 00009F34 4BFF622D */ bl avdisp_draw_model_culled_sort_translucent
lbl_00009F38:
/* 00009F38 3BBD0001 */ addi r29, r29, 1
/* 00009F3C 2C1D0A28 */ cmpwi r29, 0xa28
/* 00009F40 3B9C001C */ addi r28, r28, 0x1c
/* 00009F44 4180FE4C */ blt lbl_00009D90
lbl_00009F48:
/* 00009F48 BB0100B8 */ lmw r24, 0xb8(r1)
/* 00009F4C 800100E4 */ lwz r0, 0xe4(r1)
/* 00009F50 CBE100D8 */ lfd f31, 0xd8(r1)
/* 00009F54 382100E0 */ addi r1, r1, 0xe0
/* 00009F58 7C0803A6 */ mtlr r0
/* 00009F5C 4E800020 */ blr 
