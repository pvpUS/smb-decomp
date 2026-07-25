/* 0000E8D0 7C0802A6 */ mflr r0
/* 0000E8D4 3C600000 */ lis r3, lbl_0001CFD0@ha
/* 0000E8D8 90010004 */ stw r0, 4(r1)
/* 0000E8DC 3800000D */ li r0, 0xd
/* 0000E8E0 7C0903A6 */ mtctr r0
/* 0000E8E4 9421FCF0 */ stwu r1, -0x310(r1)
/* 0000E8E8 DBE10308 */ stfd f31, 0x308(r1)
/* 0000E8EC 38A10240 */ addi r5, r1, 0x240
/* 0000E8F0 DBC10300 */ stfd f30, 0x300(r1)
/* 0000E8F4 BDC102B8 */ stmw r14, 0x2b8(r1)
/* 0000E8F8 3BE30000 */ addi r31, r3, lbl_0001CFD0@l
/* 0000E8FC 3C600000 */ lis r3, lbl_000210A8@ha
/* 0000E900 3A230000 */ addi r17, r3, lbl_000210A8@l
/* 0000E904 3C600000 */ lis r3, lbl_1000B360@ha
/* 0000E908 39C30000 */ addi r14, r3, lbl_1000B360@l
/* 0000E90C 389F3670 */ addi r4, r31, 0x3670
lbl_0000E910:
/* 0000E910 84640008 */ lwzu r3, 8(r4)
/* 0000E914 80040004 */ lwz r0, 4(r4)
/* 0000E918 94650008 */ stwu r3, 8(r5)
/* 0000E91C 90050004 */ stw r0, 4(r5)
/* 0000E920 4200FFF0 */ bdnz lbl_0000E910
/* 0000E924 809F36E0 */ lwz r4, 0x36e0(r31)
/* 0000E928 3800000D */ li r0, 0xd
/* 0000E92C 807F36E4 */ lwz r3, 0x36e4(r31)
/* 0000E930 7C0903A6 */ mtctr r0
/* 0000E934 38A101C0 */ addi r5, r1, 0x1c0
/* 0000E938 90810234 */ stw r4, 0x234(r1)
/* 0000E93C 389F36EC */ addi r4, r31, 0x36ec
/* 0000E940 90610238 */ stw r3, 0x238(r1)
/* 0000E944 807F36E8 */ lwz r3, 0x36e8(r31)
/* 0000E948 801F36EC */ lwz r0, 0x36ec(r31)
/* 0000E94C 9061023C */ stw r3, 0x23c(r1)
/* 0000E950 90010240 */ stw r0, 0x240(r1)
/* 0000E954 A01F36F0 */ lhz r0, 0x36f0(r31)
/* 0000E958 B0010244 */ sth r0, 0x244(r1)
lbl_0000E95C:
/* 0000E95C 84640008 */ lwzu r3, 8(r4)
/* 0000E960 80040004 */ lwz r0, 4(r4)
/* 0000E964 94650008 */ stwu r3, 8(r5)
/* 0000E968 90050004 */ stw r0, 4(r5)
/* 0000E96C 4200FFF0 */ bdnz lbl_0000E95C
/* 0000E970 80040008 */ lwz r0, 8(r4)
/* 0000E974 3C800100 */ lis r4, 0x100
/* 0000E978 38610008 */ addi r3, r1, 8
/* 0000E97C 90050008 */ stw r0, 8(r5)
/* 0000E980 3884FFFF */ addi r4, r4, -1
/* 0000E984 801F3760 */ lwz r0, 0x3760(r31)
/* 0000E988 9001017C */ stw r0, 0x17c(r1)
/* 0000E98C 8001017C */ lwz r0, 0x17c(r1)
/* 0000E990 90010008 */ stw r0, 8(r1)
/* 0000E994 4BFF17A1 */ bl GXSetCopyClear
/* 0000E998 3C600000 */ lis r3, dipSwitches@ha
/* 0000E99C 80030000 */ lwz r0, dipSwitches@l(r3)
/* 0000E9A0 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 0000E9A4 41820030 */ beq lbl_0000E9D4
/* 0000E9A8 3C600000 */ lis r3, controllerInfo@ha
/* 0000E9AC 38630000 */ addi r3, r3, controllerInfo@l
/* 0000E9B0 A003003C */ lhz r0, 0x3c(r3)
/* 0000E9B4 540006F7 */ rlwinm. r0, r0, 0, 0x1b, 0x1b
/* 0000E9B8 4182001C */ beq lbl_0000E9D4
/* 0000E9BC A0030018 */ lhz r0, 0x18(r3)
/* 0000E9C0 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 0000E9C4 41820010 */ beq lbl_0000E9D4
/* 0000E9C8 880E0000 */ lbz r0, 0(r14)
/* 0000E9CC 20000001 */ subfic r0, r0, 1
/* 0000E9D0 980E0000 */ stb r0, 0(r14)
lbl_0000E9D4:
/* 0000E9D4 3C600000 */ lis r3, dipSwitches@ha
/* 0000E9D8 80030000 */ lwz r0, dipSwitches@l(r3)
/* 0000E9DC 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 0000E9E0 41820030 */ beq lbl_0000EA10
/* 0000E9E4 3C600000 */ lis r3, controllerInfo@ha
/* 0000E9E8 38630000 */ addi r3, r3, controllerInfo@l
/* 0000E9EC A003003C */ lhz r0, 0x3c(r3)
/* 0000E9F0 540006F7 */ rlwinm. r0, r0, 0, 0x1b, 0x1b
/* 0000E9F4 4182001C */ beq lbl_0000EA10
/* 0000E9F8 A0030018 */ lhz r0, 0x18(r3)
/* 0000E9FC 5400056B */ rlwinm. r0, r0, 0, 0x15, 0x15
/* 0000EA00 41820010 */ beq lbl_0000EA10
/* 0000EA04 880E0001 */ lbz r0, 1(r14)
/* 0000EA08 20000001 */ subfic r0, r0, 1
/* 0000EA0C 980E0001 */ stb r0, 1(r14)
lbl_0000EA10:
/* 0000EA10 3C600000 */ lis r3, lbl_1000000A@ha
/* 0000EA14 88030000 */ lbz r0, lbl_1000000A@l(r3)
/* 0000EA18 7C000774 */ extsb r0, r0
/* 0000EA1C 2C000008 */ cmpwi r0, 8
/* 0000EA20 41820024 */ beq lbl_0000EA44
/* 0000EA24 2C000009 */ cmpwi r0, 9
/* 0000EA28 4182001C */ beq lbl_0000EA44
/* 0000EA2C 2C00000A */ cmpwi r0, 0xa
/* 0000EA30 41820014 */ beq lbl_0000EA44
/* 0000EA34 2C00000B */ cmpwi r0, 0xb
/* 0000EA38 4182000C */ beq lbl_0000EA44
/* 0000EA3C 2C000007 */ cmpwi r0, 7
/* 0000EA40 4082000C */ bne lbl_0000EA4C
lbl_0000EA44:
/* 0000EA44 3BC00001 */ li r30, 1
/* 0000EA48 48000008 */ b lbl_0000EA50
lbl_0000EA4C:
/* 0000EA4C 3BC00000 */ li r30, 0
lbl_0000EA50:
/* 0000EA50 3C600000 */ lis r3, lbl_1000000A@ha
/* 0000EA54 38630000 */ addi r3, r3, lbl_1000000A@l
/* 0000EA58 88630000 */ lbz r3, 0(r3)
/* 0000EA5C 7C600775 */ extsb. r0, r3
/* 0000EA60 41822554 */ beq lbl_00010FB4
/* 0000EA64 7C600774 */ extsb r0, r3
/* 0000EA68 2C000019 */ cmpwi r0, 0x19
/* 0000EA6C 40820020 */ bne lbl_0000EA8C
/* 0000EA70 4BFF16C5 */ bl func_8009CD5C
/* 0000EA74 3C600000 */ lis r3, eventInfo@ha
/* 0000EA78 38630000 */ addi r3, r3, eventInfo@l
/* 0000EA7C 88030138 */ lbz r0, 0x138(r3)
/* 0000EA80 2C000002 */ cmpwi r0, 2
/* 0000EA84 40820008 */ bne lbl_0000EA8C
/* 0000EA88 4BFF16AD */ bl effect_draw
lbl_0000EA8C:
/* 0000EA8C 880E0000 */ lbz r0, 0(r14)
/* 0000EA90 7C000775 */ extsb. r0, r0
/* 0000EA94 41820224 */ beq lbl_0000ECB8
/* 0000EA98 38600002 */ li r3, 2
/* 0000EA9C 38800014 */ li r4, 0x14
/* 0000EAA0 4BFF1695 */ bl window_set_cursor_pos
/* 0000EAA4 3C600000 */ lis r3, lbl_1000001E@ha
/* 0000EAA8 4CC63182 */ crclr 6
/* 0000EAAC 39E30000 */ addi r15, r3, lbl_1000001E@l
/* 0000EAB0 880F0000 */ lbz r0, 0(r15)
/* 0000EAB4 3C600000 */ lis r3, lbl_10009710@ha
/* 0000EAB8 3A030000 */ addi r16, r3, lbl_10009710@l
/* 0000EABC 7C000774 */ extsb r0, r0
/* 0000EAC0 1C000048 */ mulli r0, r0, 0x48
/* 0000EAC4 7CB00214 */ add r5, r16, r0
/* 0000EAC8 A8850006 */ lha r4, 6(r5)
/* 0000EACC 7E238B78 */ mr r3, r17
/* 0000EAD0 A8A5002A */ lha r5, 0x2a(r5)
/* 0000EAD4 4BFF1661 */ bl window_printf_2
/* 0000EAD8 38600002 */ li r3, 2
/* 0000EADC 38800015 */ li r4, 0x15
/* 0000EAE0 4BFF1655 */ bl window_set_cursor_pos
/* 0000EAE4 880F0000 */ lbz r0, 0(r15)
/* 0000EAE8 38710010 */ addi r3, r17, 0x10
/* 0000EAEC 4CC63182 */ crclr 6
/* 0000EAF0 7C000774 */ extsb r0, r0
/* 0000EAF4 1C000048 */ mulli r0, r0, 0x48
/* 0000EAF8 7CB00214 */ add r5, r16, r0
/* 0000EAFC A885000A */ lha r4, 0xa(r5)
/* 0000EB00 A8A5002E */ lha r5, 0x2e(r5)
/* 0000EB04 4BFF1631 */ bl window_printf_2
/* 0000EB08 38600002 */ li r3, 2
/* 0000EB0C 38800016 */ li r4, 0x16
/* 0000EB10 4BFF1625 */ bl window_set_cursor_pos
/* 0000EB14 880F0000 */ lbz r0, 0(r15)
/* 0000EB18 38710020 */ addi r3, r17, 0x20
/* 0000EB1C 4CC63182 */ crclr 6
/* 0000EB20 7C000774 */ extsb r0, r0
/* 0000EB24 1C000048 */ mulli r0, r0, 0x48
/* 0000EB28 7CB00214 */ add r5, r16, r0
/* 0000EB2C A885000C */ lha r4, 0xc(r5)
/* 0000EB30 A8A50030 */ lha r5, 0x30(r5)
/* 0000EB34 4BFF1601 */ bl window_printf_2
/* 0000EB38 38600002 */ li r3, 2
/* 0000EB3C 38800017 */ li r4, 0x17
/* 0000EB40 4BFF15F5 */ bl window_set_cursor_pos
/* 0000EB44 880F0000 */ lbz r0, 0(r15)
/* 0000EB48 38710030 */ addi r3, r17, 0x30
/* 0000EB4C 4CC63182 */ crclr 6
/* 0000EB50 7C000774 */ extsb r0, r0
/* 0000EB54 1C000048 */ mulli r0, r0, 0x48
/* 0000EB58 7CB00214 */ add r5, r16, r0
/* 0000EB5C A885000E */ lha r4, 0xe(r5)
/* 0000EB60 A8A50032 */ lha r5, 0x32(r5)
/* 0000EB64 4BFF15D1 */ bl window_printf_2
/* 0000EB68 38600002 */ li r3, 2
/* 0000EB6C 38800018 */ li r4, 0x18
/* 0000EB70 4BFF15C5 */ bl window_set_cursor_pos
/* 0000EB74 880F0000 */ lbz r0, 0(r15)
/* 0000EB78 38710040 */ addi r3, r17, 0x40
/* 0000EB7C 4CC63182 */ crclr 6
/* 0000EB80 7C000774 */ extsb r0, r0
/* 0000EB84 1C000048 */ mulli r0, r0, 0x48
/* 0000EB88 7CB00214 */ add r5, r16, r0
/* 0000EB8C A8850010 */ lha r4, 0x10(r5)
/* 0000EB90 A8A50034 */ lha r5, 0x34(r5)
/* 0000EB94 4BFF15A1 */ bl window_printf_2
/* 0000EB98 38600002 */ li r3, 2
/* 0000EB9C 38800019 */ li r4, 0x19
/* 0000EBA0 4BFF1595 */ bl window_set_cursor_pos
/* 0000EBA4 880F0000 */ lbz r0, 0(r15)
/* 0000EBA8 38710050 */ addi r3, r17, 0x50
/* 0000EBAC 4CC63182 */ crclr 6
/* 0000EBB0 7C000774 */ extsb r0, r0
/* 0000EBB4 1C000048 */ mulli r0, r0, 0x48
/* 0000EBB8 7CB00214 */ add r5, r16, r0
/* 0000EBBC A8850012 */ lha r4, 0x12(r5)
/* 0000EBC0 A8A50036 */ lha r5, 0x36(r5)
/* 0000EBC4 4BFF1571 */ bl window_printf_2
/* 0000EBC8 38600002 */ li r3, 2
/* 0000EBCC 3880001A */ li r4, 0x1a
/* 0000EBD0 4BFF1565 */ bl window_set_cursor_pos
/* 0000EBD4 880F0000 */ lbz r0, 0(r15)
/* 0000EBD8 38710060 */ addi r3, r17, 0x60
/* 0000EBDC 4CC63182 */ crclr 6
/* 0000EBE0 7C000774 */ extsb r0, r0
/* 0000EBE4 1C000048 */ mulli r0, r0, 0x48
/* 0000EBE8 7CB00214 */ add r5, r16, r0
/* 0000EBEC A8850014 */ lha r4, 0x14(r5)
/* 0000EBF0 A8A50038 */ lha r5, 0x38(r5)
/* 0000EBF4 4BFF1541 */ bl window_printf_2
/* 0000EBF8 38600002 */ li r3, 2
/* 0000EBFC 3880001B */ li r4, 0x1b
/* 0000EC00 4BFF1535 */ bl window_set_cursor_pos
/* 0000EC04 880F0000 */ lbz r0, 0(r15)
/* 0000EC08 38710070 */ addi r3, r17, 0x70
/* 0000EC0C 4CC63182 */ crclr 6
/* 0000EC10 7C000774 */ extsb r0, r0
/* 0000EC14 1C000048 */ mulli r0, r0, 0x48
/* 0000EC18 7CB00214 */ add r5, r16, r0
/* 0000EC1C A8850018 */ lha r4, 0x18(r5)
/* 0000EC20 A8A5003C */ lha r5, 0x3c(r5)
/* 0000EC24 4BFF1511 */ bl window_printf_2
/* 0000EC28 38600002 */ li r3, 2
/* 0000EC2C 3880001C */ li r4, 0x1c
/* 0000EC30 4BFF1505 */ bl window_set_cursor_pos
/* 0000EC34 880F0000 */ lbz r0, 0(r15)
/* 0000EC38 38710080 */ addi r3, r17, 0x80
/* 0000EC3C 4CC63182 */ crclr 6
/* 0000EC40 7C000774 */ extsb r0, r0
/* 0000EC44 1C000048 */ mulli r0, r0, 0x48
/* 0000EC48 7CB00214 */ add r5, r16, r0
/* 0000EC4C A8850016 */ lha r4, 0x16(r5)
/* 0000EC50 A8A5003A */ lha r5, 0x3a(r5)
/* 0000EC54 4BFF14E1 */ bl window_printf_2
/* 0000EC58 38600002 */ li r3, 2
/* 0000EC5C 3880001D */ li r4, 0x1d
/* 0000EC60 4BFF14D5 */ bl window_set_cursor_pos
/* 0000EC64 880F0000 */ lbz r0, 0(r15)
/* 0000EC68 38710090 */ addi r3, r17, 0x90
/* 0000EC6C 4CC63182 */ crclr 6
/* 0000EC70 7C000774 */ extsb r0, r0
/* 0000EC74 1C000048 */ mulli r0, r0, 0x48
/* 0000EC78 7CB00214 */ add r5, r16, r0
/* 0000EC7C 8085001C */ lwz r4, 0x1c(r5)
/* 0000EC80 80A50040 */ lwz r5, 0x40(r5)
/* 0000EC84 4BFF14B1 */ bl window_printf_2
/* 0000EC88 38600002 */ li r3, 2
/* 0000EC8C 3880001E */ li r4, 0x1e
/* 0000EC90 4BFF14A5 */ bl window_set_cursor_pos
/* 0000EC94 880F0000 */ lbz r0, 0(r15)
/* 0000EC98 387100A0 */ addi r3, r17, 0xa0
/* 0000EC9C 4CC63182 */ crclr 6
/* 0000ECA0 7C000774 */ extsb r0, r0
/* 0000ECA4 1C000048 */ mulli r0, r0, 0x48
/* 0000ECA8 7CB00214 */ add r5, r16, r0
/* 0000ECAC 80850020 */ lwz r4, 0x20(r5)
/* 0000ECB0 80A50044 */ lwz r5, 0x44(r5)
/* 0000ECB4 4BFF1481 */ bl window_printf_2
lbl_0000ECB8:
/* 0000ECB8 3C600000 */ lis r3, lbl_1000000A@ha
/* 0000ECBC 88030000 */ lbz r0, lbl_1000000A@l(r3)
/* 0000ECC0 7C000774 */ extsb r0, r0
/* 0000ECC4 2C000001 */ cmpwi r0, 1
/* 0000ECC8 40820080 */ bne lbl_0000ED48
/* 0000ECCC 3C600000 */ lis r3, lbl_802F1C32@ha
/* 0000ECD0 88030000 */ lbz r0, lbl_802F1C32@l(r3)
/* 0000ECD4 2C000001 */ cmpwi r0, 1
/* 0000ECD8 41820018 */ beq lbl_0000ECF0
/* 0000ECDC 3C600000 */ lis r3, lbl_10000020@ha
/* 0000ECE0 80030000 */ lwz r0, lbl_10000020@l(r3)
/* 0000ECE4 5400073E */ clrlwi r0, r0, 0x1c
/* 0000ECE8 2C000008 */ cmpwi r0, 8
/* 0000ECEC 4080001C */ bge lbl_0000ED08
lbl_0000ECF0:
/* 0000ECF0 38600009 */ li r3, 9
/* 0000ECF4 3880000F */ li r4, 0xf
/* 0000ECF8 4BFF143D */ bl window_set_cursor_pos
/* 0000ECFC 387100B0 */ addi r3, r17, 0xb0
/* 0000ED00 4CC63182 */ crclr 6
/* 0000ED04 4BFF1431 */ bl window_printf_2
lbl_0000ED08:
/* 0000ED08 3C600000 */ lis r3, lbl_802F1C32@ha
/* 0000ED0C 88030000 */ lbz r0, lbl_802F1C32@l(r3)
/* 0000ED10 7C000775 */ extsb. r0, r0
/* 0000ED14 41820018 */ beq lbl_0000ED2C
/* 0000ED18 3C600000 */ lis r3, lbl_10000020@ha
/* 0000ED1C 80030000 */ lwz r0, lbl_10000020@l(r3)
/* 0000ED20 5400073E */ clrlwi r0, r0, 0x1c
/* 0000ED24 2C000008 */ cmpwi r0, 8
/* 0000ED28 4080228C */ bge lbl_00010FB4
lbl_0000ED2C:
/* 0000ED2C 38600023 */ li r3, 0x23
/* 0000ED30 3880000F */ li r4, 0xf
/* 0000ED34 4BFF1401 */ bl window_set_cursor_pos
/* 0000ED38 387100B8 */ addi r3, r17, 0xb8
/* 0000ED3C 4CC63182 */ crclr 6
/* 0000ED40 4BFF13F5 */ bl window_printf_2
/* 0000ED44 48002270 */ b lbl_00010FB4
lbl_0000ED48:
/* 0000ED48 2C000002 */ cmpwi r0, 2
/* 0000ED4C 4182000C */ beq lbl_0000ED58
/* 0000ED50 2C000003 */ cmpwi r0, 3
/* 0000ED54 40820154 */ bne lbl_0000EEA8
lbl_0000ED58:
/* 0000ED58 3C600000 */ lis r3, lbl_1000000A@ha
/* 0000ED5C 88030000 */ lbz r0, lbl_1000000A@l(r3)
/* 0000ED60 38600016 */ li r3, 0x16
/* 0000ED64 3880000D */ li r4, 0xd
/* 0000ED68 7C050774 */ extsb r5, r0
/* 0000ED6C 39C5FFFE */ addi r14, r5, -2
/* 0000ED70 4BFF13C5 */ bl window_set_cursor_pos
/* 0000ED74 387100C4 */ addi r3, r17, 0xc4
/* 0000ED78 4CC63182 */ crclr 6
/* 0000ED7C 388E0001 */ addi r4, r14, 1
/* 0000ED80 4BFF13B5 */ bl window_printf_2
/* 0000ED84 1C0E0006 */ mulli r0, r14, 6
/* 0000ED88 3C600000 */ lis r3, lbl_10000A64@ha
/* 0000ED8C 38630000 */ addi r3, r3, lbl_10000A64@l
/* 0000ED90 7C630214 */ add r3, r3, r0
/* 0000ED94 88030001 */ lbz r0, 1(r3)
/* 0000ED98 7C000775 */ extsb. r0, r0
/* 0000ED9C 40820018 */ bne lbl_0000EDB4
/* 0000EDA0 3C600000 */ lis r3, lbl_10000020@ha
/* 0000EDA4 80030000 */ lwz r0, lbl_10000020@l(r3)
/* 0000EDA8 5400073E */ clrlwi r0, r0, 0x1c
/* 0000EDAC 2C000008 */ cmpwi r0, 8
/* 0000EDB0 4080001C */ bge lbl_0000EDCC
lbl_0000EDB4:
/* 0000EDB4 38600004 */ li r3, 4
/* 0000EDB8 3880000F */ li r4, 0xf
/* 0000EDBC 4BFF1379 */ bl window_set_cursor_pos
/* 0000EDC0 387100D0 */ addi r3, r17, 0xd0
/* 0000EDC4 4CC63182 */ crclr 6
/* 0000EDC8 4BFF136D */ bl window_printf_2
lbl_0000EDCC:
/* 0000EDCC 1C0E0006 */ mulli r0, r14, 6
/* 0000EDD0 3C600000 */ lis r3, lbl_10000A64@ha
/* 0000EDD4 38630000 */ addi r3, r3, lbl_10000A64@l
/* 0000EDD8 7C630214 */ add r3, r3, r0
/* 0000EDDC 88030001 */ lbz r0, 1(r3)
/* 0000EDE0 2C000001 */ cmpwi r0, 1
/* 0000EDE4 40820018 */ bne lbl_0000EDFC
/* 0000EDE8 3C600000 */ lis r3, lbl_10000020@ha
/* 0000EDEC 80030000 */ lwz r0, lbl_10000020@l(r3)
/* 0000EDF0 5400073E */ clrlwi r0, r0, 0x1c
/* 0000EDF4 2C000008 */ cmpwi r0, 8
/* 0000EDF8 4080001C */ bge lbl_0000EE14
lbl_0000EDFC:
/* 0000EDFC 38600011 */ li r3, 0x11
/* 0000EE00 3880000F */ li r4, 0xf
/* 0000EE04 4BFF1331 */ bl window_set_cursor_pos
/* 0000EE08 387100D8 */ addi r3, r17, 0xd8
/* 0000EE0C 4CC63182 */ crclr 6
/* 0000EE10 4BFF1325 */ bl window_printf_2
lbl_0000EE14:
/* 0000EE14 1C0E0006 */ mulli r0, r14, 6
/* 0000EE18 3C600000 */ lis r3, lbl_10000A64@ha
/* 0000EE1C 38630000 */ addi r3, r3, lbl_10000A64@l
/* 0000EE20 7C630214 */ add r3, r3, r0
/* 0000EE24 88030001 */ lbz r0, 1(r3)
/* 0000EE28 2C000002 */ cmpwi r0, 2
/* 0000EE2C 40820018 */ bne lbl_0000EE44
/* 0000EE30 3C600000 */ lis r3, lbl_10000020@ha
/* 0000EE34 80030000 */ lwz r0, lbl_10000020@l(r3)
/* 0000EE38 5400073E */ clrlwi r0, r0, 0x1c
/* 0000EE3C 2C000008 */ cmpwi r0, 8
/* 0000EE40 4080001C */ bge lbl_0000EE5C
lbl_0000EE44:
/* 0000EE44 3860001E */ li r3, 0x1e
/* 0000EE48 3880000F */ li r4, 0xf
/* 0000EE4C 4BFF12E9 */ bl window_set_cursor_pos
/* 0000EE50 387100E0 */ addi r3, r17, 0xe0
/* 0000EE54 4CC63182 */ crclr 6
/* 0000EE58 4BFF12DD */ bl window_printf_2
lbl_0000EE5C:
/* 0000EE5C 1C0E0006 */ mulli r0, r14, 6
/* 0000EE60 3C600000 */ lis r3, lbl_10000A64@ha
/* 0000EE64 38630000 */ addi r3, r3, lbl_10000A64@l
/* 0000EE68 7C630214 */ add r3, r3, r0
/* 0000EE6C 88030001 */ lbz r0, 1(r3)
/* 0000EE70 2C000003 */ cmpwi r0, 3
/* 0000EE74 40820018 */ bne lbl_0000EE8C
/* 0000EE78 3C600000 */ lis r3, lbl_10000020@ha
/* 0000EE7C 80030000 */ lwz r0, lbl_10000020@l(r3)
/* 0000EE80 5400073E */ clrlwi r0, r0, 0x1c
/* 0000EE84 2C000008 */ cmpwi r0, 8
/* 0000EE88 4080212C */ bge lbl_00010FB4
lbl_0000EE8C:
/* 0000EE8C 3860002B */ li r3, 0x2b
/* 0000EE90 3880000F */ li r4, 0xf
/* 0000EE94 4BFF12A1 */ bl window_set_cursor_pos
/* 0000EE98 387100E8 */ addi r3, r17, 0xe8
/* 0000EE9C 4CC63182 */ crclr 6
/* 0000EEA0 4BFF1295 */ bl window_printf_2
/* 0000EEA4 48002110 */ b lbl_00010FB4
lbl_0000EEA8:
/* 0000EEA8 2C000004 */ cmpwi r0, 4
/* 0000EEAC 408200F8 */ bne lbl_0000EFA4
/* 0000EEB0 3C600000 */ lis r3, lbl_10000011@ha
/* 0000EEB4 88030000 */ lbz r0, lbl_10000011@l(r3)
/* 0000EEB8 7C000775 */ extsb. r0, r0
/* 0000EEBC 40820018 */ bne lbl_0000EED4
/* 0000EEC0 3C600000 */ lis r3, lbl_10000020@ha
/* 0000EEC4 80030000 */ lwz r0, lbl_10000020@l(r3)
/* 0000EEC8 5400073E */ clrlwi r0, r0, 0x1c
/* 0000EECC 2C000008 */ cmpwi r0, 8
/* 0000EED0 4080001C */ bge lbl_0000EEEC
lbl_0000EED4:
/* 0000EED4 38600004 */ li r3, 4
/* 0000EED8 3880000F */ li r4, 0xf
/* 0000EEDC 4BFF1259 */ bl window_set_cursor_pos
/* 0000EEE0 387100F0 */ addi r3, r17, 0xf0
/* 0000EEE4 4CC63182 */ crclr 6
/* 0000EEE8 4BFF124D */ bl window_printf_2
lbl_0000EEEC:
/* 0000EEEC 3C600000 */ lis r3, lbl_10000011@ha
/* 0000EEF0 88030000 */ lbz r0, lbl_10000011@l(r3)
/* 0000EEF4 2C000001 */ cmpwi r0, 1
/* 0000EEF8 40820018 */ bne lbl_0000EF10
/* 0000EEFC 3C600000 */ lis r3, lbl_10000020@ha
/* 0000EF00 80030000 */ lwz r0, lbl_10000020@l(r3)
/* 0000EF04 5400073E */ clrlwi r0, r0, 0x1c
/* 0000EF08 2C000008 */ cmpwi r0, 8
/* 0000EF0C 4080001C */ bge lbl_0000EF28
lbl_0000EF10:
/* 0000EF10 38600011 */ li r3, 0x11
/* 0000EF14 3880000F */ li r4, 0xf
/* 0000EF18 4BFF121D */ bl window_set_cursor_pos
/* 0000EF1C 387100F8 */ addi r3, r17, 0xf8
/* 0000EF20 4CC63182 */ crclr 6
/* 0000EF24 4BFF1211 */ bl window_printf_2
lbl_0000EF28:
/* 0000EF28 3C600000 */ lis r3, lbl_10000011@ha
/* 0000EF2C 88030000 */ lbz r0, lbl_10000011@l(r3)
/* 0000EF30 2C000002 */ cmpwi r0, 2
/* 0000EF34 40820018 */ bne lbl_0000EF4C
/* 0000EF38 3C600000 */ lis r3, lbl_10000020@ha
/* 0000EF3C 80030000 */ lwz r0, lbl_10000020@l(r3)
/* 0000EF40 5400073E */ clrlwi r0, r0, 0x1c
/* 0000EF44 2C000008 */ cmpwi r0, 8
/* 0000EF48 4080001C */ bge lbl_0000EF64
lbl_0000EF4C:
/* 0000EF4C 3860001E */ li r3, 0x1e
/* 0000EF50 3880000F */ li r4, 0xf
/* 0000EF54 4BFF11E1 */ bl window_set_cursor_pos
/* 0000EF58 38710100 */ addi r3, r17, 0x100
/* 0000EF5C 4CC63182 */ crclr 6
/* 0000EF60 4BFF11D5 */ bl window_printf_2
lbl_0000EF64:
/* 0000EF64 3C600000 */ lis r3, lbl_10000011@ha
/* 0000EF68 88030000 */ lbz r0, lbl_10000011@l(r3)
/* 0000EF6C 2C000003 */ cmpwi r0, 3
/* 0000EF70 40820018 */ bne lbl_0000EF88
/* 0000EF74 3C600000 */ lis r3, lbl_10000020@ha
/* 0000EF78 80030000 */ lwz r0, lbl_10000020@l(r3)
/* 0000EF7C 5400073E */ clrlwi r0, r0, 0x1c
/* 0000EF80 2C000008 */ cmpwi r0, 8
/* 0000EF84 40802030 */ bge lbl_00010FB4
lbl_0000EF88:
/* 0000EF88 3860002B */ li r3, 0x2b
/* 0000EF8C 3880000F */ li r4, 0xf
/* 0000EF90 4BFF11A5 */ bl window_set_cursor_pos
/* 0000EF94 38710108 */ addi r3, r17, 0x108
/* 0000EF98 4CC63182 */ crclr 6
/* 0000EF9C 4BFF1199 */ bl window_printf_2
/* 0000EFA0 48002014 */ b lbl_00010FB4
lbl_0000EFA4:
/* 0000EFA4 2C000005 */ cmpwi r0, 5
/* 0000EFA8 40820134 */ bne lbl_0000F0DC
/* 0000EFAC 3C600000 */ lis r3, lbl_10000061@ha
/* 0000EFB0 88030000 */ lbz r0, lbl_10000061@l(r3)
/* 0000EFB4 7C000775 */ extsb. r0, r0
/* 0000EFB8 40820018 */ bne lbl_0000EFD0
/* 0000EFBC 3C600000 */ lis r3, lbl_10000020@ha
/* 0000EFC0 80030000 */ lwz r0, lbl_10000020@l(r3)
/* 0000EFC4 5400073E */ clrlwi r0, r0, 0x1c
/* 0000EFC8 2C000008 */ cmpwi r0, 8
/* 0000EFCC 4080001C */ bge lbl_0000EFE8
lbl_0000EFD0:
/* 0000EFD0 38600001 */ li r3, 1
/* 0000EFD4 3880000F */ li r4, 0xf
/* 0000EFD8 4BFF115D */ bl window_set_cursor_pos
/* 0000EFDC 38710110 */ addi r3, r17, 0x110
/* 0000EFE0 4CC63182 */ crclr 6
/* 0000EFE4 4BFF1151 */ bl window_printf_2
lbl_0000EFE8:
/* 0000EFE8 3C600000 */ lis r3, lbl_10000061@ha
/* 0000EFEC 88030000 */ lbz r0, lbl_10000061@l(r3)
/* 0000EFF0 2C000001 */ cmpwi r0, 1
/* 0000EFF4 40820018 */ bne lbl_0000F00C
/* 0000EFF8 3C600000 */ lis r3, lbl_10000020@ha
/* 0000EFFC 80030000 */ lwz r0, lbl_10000020@l(r3)
/* 0000F000 5400073E */ clrlwi r0, r0, 0x1c
/* 0000F004 2C000008 */ cmpwi r0, 8
/* 0000F008 4080001C */ bge lbl_0000F024
lbl_0000F00C:
/* 0000F00C 3860000B */ li r3, 0xb
/* 0000F010 3880000F */ li r4, 0xf
/* 0000F014 4BFF1121 */ bl window_set_cursor_pos
/* 0000F018 3871011C */ addi r3, r17, 0x11c
/* 0000F01C 4CC63182 */ crclr 6
/* 0000F020 4BFF1115 */ bl window_printf_2
lbl_0000F024:
/* 0000F024 3C600000 */ lis r3, lbl_10000061@ha
/* 0000F028 88030000 */ lbz r0, lbl_10000061@l(r3)
/* 0000F02C 2C000002 */ cmpwi r0, 2
/* 0000F030 40820018 */ bne lbl_0000F048
/* 0000F034 3C600000 */ lis r3, lbl_10000020@ha
/* 0000F038 80030000 */ lwz r0, lbl_10000020@l(r3)
/* 0000F03C 5400073E */ clrlwi r0, r0, 0x1c
/* 0000F040 2C000008 */ cmpwi r0, 8
/* 0000F044 4080001C */ bge lbl_0000F060
lbl_0000F048:
/* 0000F048 38600015 */ li r3, 0x15
/* 0000F04C 3880000F */ li r4, 0xf
/* 0000F050 4BFF10E5 */ bl window_set_cursor_pos
/* 0000F054 38710128 */ addi r3, r17, 0x128
/* 0000F058 4CC63182 */ crclr 6
/* 0000F05C 4BFF10D9 */ bl window_printf_2
lbl_0000F060:
/* 0000F060 3C600000 */ lis r3, lbl_10000061@ha
/* 0000F064 88030000 */ lbz r0, lbl_10000061@l(r3)
/* 0000F068 2C000003 */ cmpwi r0, 3
/* 0000F06C 40820018 */ bne lbl_0000F084
/* 0000F070 3C600000 */ lis r3, lbl_10000020@ha
/* 0000F074 80030000 */ lwz r0, lbl_10000020@l(r3)
/* 0000F078 5400073E */ clrlwi r0, r0, 0x1c
/* 0000F07C 2C000008 */ cmpwi r0, 8
/* 0000F080 4080001C */ bge lbl_0000F09C
lbl_0000F084:
/* 0000F084 3860001F */ li r3, 0x1f
/* 0000F088 3880000F */ li r4, 0xf
/* 0000F08C 4BFF10A9 */ bl window_set_cursor_pos
/* 0000F090 38710134 */ addi r3, r17, 0x134
/* 0000F094 4CC63182 */ crclr 6
/* 0000F098 4BFF109D */ bl window_printf_2
lbl_0000F09C:
/* 0000F09C 3C600000 */ lis r3, lbl_10000061@ha
/* 0000F0A0 88030000 */ lbz r0, lbl_10000061@l(r3)
/* 0000F0A4 2C000004 */ cmpwi r0, 4
/* 0000F0A8 40820018 */ bne lbl_0000F0C0
/* 0000F0AC 3C600000 */ lis r3, lbl_10000020@ha
/* 0000F0B0 80030000 */ lwz r0, lbl_10000020@l(r3)
/* 0000F0B4 5400073E */ clrlwi r0, r0, 0x1c
/* 0000F0B8 2C000008 */ cmpwi r0, 8
/* 0000F0BC 40801EF8 */ bge lbl_00010FB4
lbl_0000F0C0:
/* 0000F0C0 38600029 */ li r3, 0x29
/* 0000F0C4 3880000F */ li r4, 0xf
/* 0000F0C8 4BFF106D */ bl window_set_cursor_pos
/* 0000F0CC 38710140 */ addi r3, r17, 0x140
/* 0000F0D0 4CC63182 */ crclr 6
/* 0000F0D4 4BFF1061 */ bl window_printf_2
/* 0000F0D8 48001EDC */ b lbl_00010FB4
lbl_0000F0DC:
/* 0000F0DC 2C000006 */ cmpwi r0, 6
/* 0000F0E0 40820080 */ bne lbl_0000F160
/* 0000F0E4 3C600000 */ lis r3, lbl_1000001E@ha
/* 0000F0E8 88030000 */ lbz r0, lbl_1000001E@l(r3)
/* 0000F0EC 2C000001 */ cmpwi r0, 1
/* 0000F0F0 41820018 */ beq lbl_0000F108
/* 0000F0F4 3C600000 */ lis r3, lbl_10000020@ha
/* 0000F0F8 80030000 */ lwz r0, lbl_10000020@l(r3)
/* 0000F0FC 5400073E */ clrlwi r0, r0, 0x1c
/* 0000F100 2C000008 */ cmpwi r0, 8
/* 0000F104 4080001C */ bge lbl_0000F120
lbl_0000F108:
/* 0000F108 38600009 */ li r3, 9
/* 0000F10C 3880000F */ li r4, 0xf
/* 0000F110 4BFF1025 */ bl window_set_cursor_pos
/* 0000F114 3871014C */ addi r3, r17, 0x14c
/* 0000F118 4CC63182 */ crclr 6
/* 0000F11C 4BFF1019 */ bl window_printf_2
lbl_0000F120:
/* 0000F120 3C600000 */ lis r3, lbl_1000001E@ha
/* 0000F124 88030000 */ lbz r0, lbl_1000001E@l(r3)
/* 0000F128 7C000775 */ extsb. r0, r0
/* 0000F12C 41820018 */ beq lbl_0000F144
/* 0000F130 3C600000 */ lis r3, lbl_10000020@ha
/* 0000F134 80030000 */ lwz r0, lbl_10000020@l(r3)
/* 0000F138 5400073E */ clrlwi r0, r0, 0x1c
/* 0000F13C 2C000008 */ cmpwi r0, 8
/* 0000F140 40801E74 */ bge lbl_00010FB4
lbl_0000F144:
/* 0000F144 38600023 */ li r3, 0x23
/* 0000F148 3880000F */ li r4, 0xf
/* 0000F14C 4BFF0FE9 */ bl window_set_cursor_pos
/* 0000F150 38710154 */ addi r3, r17, 0x154
/* 0000F154 4CC63182 */ crclr 6
/* 0000F158 4BFF0FDD */ bl window_printf_2
/* 0000F15C 48001E58 */ b lbl_00010FB4
lbl_0000F160:
/* 0000F160 3C600000 */ lis r3, lbl_10009878@ha
/* 0000F164 3CC00000 */ lis r6, cameraInfo@ha
/* 0000F168 3CA00000 */ lis r5, lbl_10000054@ha
/* 0000F16C 3C800000 */ lis r4, lbl_10000004@ha
/* 0000F170 3CE00000 */ lis r7, lbl_10000064@ha
/* 0000F174 3A830000 */ addi r20, r3, lbl_10009878@l
/* 0000F178 39E60000 */ addi r15, r6, cameraInfo@l
/* 0000F17C 3AC50000 */ addi r22, r5, lbl_10000054@l
/* 0000F180 3AA40000 */ addi r21, r4, lbl_10000004@l
/* 0000F184 3A270000 */ addi r17, r7, lbl_10000064@l
/* 0000F188 3A000000 */ li r16, 0
/* 0000F18C 3A400000 */ li r18, 0
/* 0000F190 3A600000 */ li r19, 0
lbl_0000F194:
/* 0000F194 7EF49A14 */ add r23, r20, r19
/* 0000F198 88170000 */ lbz r0, 0(r23)
/* 0000F19C 7C000775 */ extsb. r0, r0
/* 0000F1A0 418200C0 */ beq lbl_0000F260
/* 0000F1A4 7C719214 */ add r3, r17, r18
/* 0000F1A8 80030000 */ lwz r0, 0(r3)
/* 0000F1AC 2C00FFFF */ cmpwi r0, -1
/* 0000F1B0 418200B0 */ beq lbl_0000F260
/* 0000F1B4 C02F0008 */ lfs f1, 8(r15)
/* 0000F1B8 C0170018 */ lfs f0, 0x18(r23)
/* 0000F1BC C06F0004 */ lfs f3, 4(r15)
/* 0000F1C0 C0570014 */ lfs f2, 0x14(r23)
/* 0000F1C4 EC810028 */ fsubs f4, f1, f0
/* 0000F1C8 C02F0000 */ lfs f1, 0(r15)
/* 0000F1CC C0170010 */ lfs f0, 0x10(r23)
/* 0000F1D0 EC431028 */ fsubs f2, f3, f2
/* 0000F1D4 EC210028 */ fsubs f1, f1, f0
/* 0000F1D8 EC210072 */ fmuls f1, f1, f1
/* 0000F1DC EC2208BA */ fmadds f1, f2, f2, f1
/* 0000F1E0 EC24093A */ fmadds f1, f4, f4, f1
/* 0000F1E4 4BFF0F51 */ bl mathutil_sqrt
/* 0000F1E8 C0560000 */ lfs f2, 0(r22)
/* 0000F1EC C01F3770 */ lfs f0, 0x3770(r31)
/* 0000F1F0 EC220072 */ fmuls f1, f2, f1
/* 0000F1F4 FC010040 */ fcmpo cr0, f1, f0
/* 0000F1F8 40800014 */ bge lbl_0000F20C
/* 0000F1FC 80770064 */ lwz r3, 0x64(r23)
/* 0000F200 38800000 */ li r4, 0
/* 0000F204 4BFF0F31 */ bl set_ape_model_lod
/* 0000F208 4800001C */ b lbl_0000F224
lbl_0000F20C:
/* 0000F20C C01F3774 */ lfs f0, 0x3774(r31)
/* 0000F210 FC010040 */ fcmpo cr0, f1, f0
/* 0000F214 40810010 */ ble lbl_0000F224
/* 0000F218 80770064 */ lwz r3, 0x64(r23)
/* 0000F21C 38800001 */ li r4, 1
/* 0000F220 4BFF0F15 */ bl set_ape_model_lod
lbl_0000F224:
/* 0000F224 88150000 */ lbz r0, 0(r21)
/* 0000F228 7C000775 */ extsb. r0, r0
/* 0000F22C 41820024 */ beq lbl_0000F250
/* 0000F230 7FC00775 */ extsb. r0, r30
/* 0000F234 4082000C */ bne lbl_0000F240
/* 0000F238 2C100000 */ cmpwi r16, 0
/* 0000F23C 41820014 */ beq lbl_0000F250
lbl_0000F240:
/* 0000F240 7FC00775 */ extsb. r0, r30
/* 0000F244 4182001C */ beq lbl_0000F260
/* 0000F248 2C100002 */ cmpwi r16, 2
/* 0000F24C 40800014 */ bge lbl_0000F260
lbl_0000F250:
/* 0000F250 7C749A14 */ add r3, r20, r19
/* 0000F254 80630064 */ lwz r3, 0x64(r3)
/* 0000F258 38800000 */ li r4, 0
/* 0000F25C 4BFF0ED9 */ bl mot_ape_thread
lbl_0000F260:
/* 0000F260 3A100001 */ addi r16, r16, 1
/* 0000F264 2C100009 */ cmpwi r16, 9
/* 0000F268 3A520004 */ addi r18, r18, 4
/* 0000F26C 3A730068 */ addi r19, r19, 0x68
/* 0000F270 4180FF24 */ blt lbl_0000F194
/* 0000F274 3C600000 */ lis r3, lbl_1000000A@ha
/* 0000F278 88030000 */ lbz r0, lbl_1000000A@l(r3)
/* 0000F27C 7C000774 */ extsb r0, r0
/* 0000F280 2C000012 */ cmpwi r0, 0x12
/* 0000F284 4182000C */ beq lbl_0000F290
/* 0000F288 2C000009 */ cmpwi r0, 9
/* 0000F28C 408201C0 */ bne lbl_0000F44C
lbl_0000F290:
/* 0000F290 3C600000 */ lis r3, lbl_1000000A@ha
/* 0000F294 88030000 */ lbz r0, lbl_1000000A@l(r3)
/* 0000F298 2C000009 */ cmpwi r0, 9
/* 0000F29C 4082000C */ bne lbl_0000F2A8
/* 0000F2A0 39E00002 */ li r15, 2
/* 0000F2A4 48000008 */ b lbl_0000F2AC
lbl_0000F2A8:
/* 0000F2A8 39E00001 */ li r15, 1
lbl_0000F2AC:
/* 0000F2AC 3D000000 */ lis r8, lbl_10009878@ha
/* 0000F2B0 3CE00000 */ lis r7, lbl_1000000A@ha
/* 0000F2B4 3CC00000 */ lis r6, lbl_10000A64@ha
/* 0000F2B8 3CA00000 */ lis r5, lbl_802F1C32@ha
/* 0000F2BC 3C800000 */ lis r4, mathutilData@ha
/* 0000F2C0 3C600000 */ lis r3, minigameGma@ha
/* 0000F2C4 3A880000 */ addi r20, r8, lbl_10009878@l
/* 0000F2C8 3A670000 */ addi r19, r7, lbl_1000000A@l
/* 0000F2CC 3A460000 */ addi r18, r6, lbl_10000A64@l
/* 0000F2D0 3A250000 */ addi r17, r5, lbl_802F1C32@l
/* 0000F2D4 3B240000 */ addi r25, r4, mathutilData@l
/* 0000F2D8 3B030000 */ addi r24, r3, minigameGma@l
/* 0000F2DC 3A000000 */ li r16, 0
/* 0000F2E0 3AC00000 */ li r22, 0
/* 0000F2E4 3AE00000 */ li r23, 0
/* 0000F2E8 4800015C */ b lbl_0000F444
lbl_0000F2EC:
/* 0000F2EC 7EB4BA14 */ add r21, r20, r23
/* 0000F2F0 80750064 */ lwz r3, 0x64(r21)
/* 0000F2F4 38630060 */ addi r3, r3, 0x60
/* 0000F2F8 4BFF0E3D */ bl mathutil_mtxA_from_quat
/* 0000F2FC 38610180 */ addi r3, r1, 0x180
/* 0000F300 4BFF0E35 */ bl mathutil_mtxA_to_mtx
/* 0000F304 4BFF0E31 */ bl mathutil_mtxA_from_mtxB
/* 0000F308 80750064 */ lwz r3, 0x64(r21)
/* 0000F30C 38630030 */ addi r3, r3, 0x30
/* 0000F310 4BFF0E25 */ bl mathutil_mtxA_translate
/* 0000F314 38610180 */ addi r3, r1, 0x180
/* 0000F318 4BFF0E1D */ bl mathutil_mtxA_mult_right
/* 0000F31C 88130000 */ lbz r0, 0(r19)
/* 0000F320 2C000009 */ cmpwi r0, 9
/* 0000F324 40820010 */ bne lbl_0000F334
/* 0000F328 7C72B214 */ add r3, r18, r22
/* 0000F32C 8AA30001 */ lbz r21, 1(r3)
/* 0000F330 48000018 */ b lbl_0000F348
lbl_0000F334:
/* 0000F334 88110000 */ lbz r0, 0(r17)
/* 0000F338 7C000774 */ extsb r0, r0
/* 0000F33C 1C000006 */ mulli r0, r0, 6
/* 0000F340 7C720214 */ add r3, r18, r0
/* 0000F344 8AA30001 */ lbz r21, 1(r3)
lbl_0000F348:
/* 0000F348 7EA00774 */ extsb r0, r21
/* 0000F34C 2C000003 */ cmpwi r0, 3
/* 0000F350 40820018 */ bne lbl_0000F368
/* 0000F354 C03F3778 */ lfs f1, 0x3778(r31)
/* 0000F358 C05F377C */ lfs f2, 0x377c(r31)
/* 0000F35C FC600890 */ fmr f3, f1
/* 0000F360 4BFF0DD5 */ bl mathutil_mtxA_translate_xyz
/* 0000F364 48000014 */ b lbl_0000F378
lbl_0000F368:
/* 0000F368 C03F3778 */ lfs f1, 0x3778(r31)
/* 0000F36C C05F3780 */ lfs f2, 0x3780(r31)
/* 0000F370 FC600890 */ fmr f3, f1
/* 0000F374 4BFF0DC1 */ bl mathutil_mtxA_translate_xyz
lbl_0000F378:
/* 0000F378 7C74BA14 */ add r3, r20, r23
/* 0000F37C 80630064 */ lwz r3, 0x64(r3)
/* 0000F380 80630000 */ lwz r3, 0(r3)
/* 0000F384 3C630001 */ addis r3, r3, 1
/* 0000F388 3863A4F8 */ addi r3, r3, -23304
/* 0000F38C 4BFF0DA9 */ bl mathutil_mtxA_mult_right
/* 0000F390 7EA00774 */ extsb r0, r21
/* 0000F394 2C000002 */ cmpwi r0, 2
/* 0000F398 41820034 */ beq lbl_0000F3CC
/* 0000F39C 40800010 */ bge lbl_0000F3AC
/* 0000F3A0 2C000000 */ cmpwi r0, 0
/* 0000F3A4 40800014 */ bge lbl_0000F3B8
/* 0000F3A8 48000048 */ b lbl_0000F3F0
lbl_0000F3AC:
/* 0000F3AC 2C000004 */ cmpwi r0, 4
/* 0000F3B0 40800040 */ bge lbl_0000F3F0
/* 0000F3B4 4800002C */ b lbl_0000F3E0
lbl_0000F3B8:
/* 0000F3B8 C03F3784 */ lfs f1, 0x3784(r31)
/* 0000F3BC C05F3788 */ lfs f2, 0x3788(r31)
/* 0000F3C0 C07F378C */ lfs f3, 0x378c(r31)
/* 0000F3C4 4BFF0D71 */ bl mathutil_mtxA_translate_xyz
/* 0000F3C8 48000028 */ b lbl_0000F3F0
lbl_0000F3CC:
/* 0000F3CC C03F3790 */ lfs f1, 0x3790(r31)
/* 0000F3D0 C05F3780 */ lfs f2, 0x3780(r31)
/* 0000F3D4 C07F3794 */ lfs f3, 0x3794(r31)
/* 0000F3D8 4BFF0D5D */ bl mathutil_mtxA_translate_xyz
/* 0000F3DC 48000014 */ b lbl_0000F3F0
lbl_0000F3E0:
/* 0000F3E0 C03F3798 */ lfs f1, 0x3798(r31)
/* 0000F3E4 C05F3790 */ lfs f2, 0x3790(r31)
/* 0000F3E8 C07F379C */ lfs f3, 0x379c(r31)
/* 0000F3EC 4BFF0D49 */ bl mathutil_mtxA_translate_xyz
lbl_0000F3F0:
/* 0000F3F0 C03F37A0 */ lfs f1, 0x37a0(r31)
/* 0000F3F4 4BFF0D41 */ bl mathutil_mtxA_scale_s
/* 0000F3F8 C03F37A4 */ lfs f1, 0x37a4(r31)
/* 0000F3FC C05F3778 */ lfs f2, 0x3778(r31)
/* 0000F400 4BFF0D35 */ bl mathutil_mtxA_rotate_y_sin_cos
/* 0000F404 C03F37A8 */ lfs f1, 0x37a8(r31)
/* 0000F408 C05F3778 */ lfs f2, 0x3778(r31)
/* 0000F40C 4BFF0D29 */ bl mathutil_mtxA_rotate_x_sin_cos
/* 0000F410 80790000 */ lwz r3, 0(r25)
/* 0000F414 38800000 */ li r4, 0
/* 0000F418 4BFF0D1D */ bl GXLoadPosMtxImm
/* 0000F41C 80790000 */ lwz r3, 0(r25)
/* 0000F420 38800000 */ li r4, 0
/* 0000F424 4BFF0D11 */ bl GXLoadNrmMtxImm
/* 0000F428 80780000 */ lwz r3, 0(r24)
/* 0000F42C 80630008 */ lwz r3, 8(r3)
/* 0000F430 80630000 */ lwz r3, 0(r3)
/* 0000F434 4BFF0D01 */ bl avdisp_draw_model_unculled_sort_translucent
/* 0000F438 3A100001 */ addi r16, r16, 1
/* 0000F43C 3AD60006 */ addi r22, r22, 6
/* 0000F440 3AF70068 */ addi r23, r23, 0x68
lbl_0000F444:
/* 0000F444 7C107800 */ cmpw r16, r15
/* 0000F448 4180FEA4 */ blt lbl_0000F2EC
lbl_0000F44C:
/* 0000F44C 4BFF0CE9 */ bl mathutil_mtxA_from_mtxB
/* 0000F450 3C600000 */ lis r3, mathutilData@ha
/* 0000F454 39E30000 */ addi r15, r3, mathutilData@l
/* 0000F458 806F0000 */ lwz r3, 0(r15)
/* 0000F45C 38800000 */ li r4, 0
/* 0000F460 4BFF0CD5 */ bl GXLoadPosMtxImm
/* 0000F464 806F0000 */ lwz r3, 0(r15)
/* 0000F468 38800000 */ li r4, 0
/* 0000F46C 4BFF0CC9 */ bl GXLoadNrmMtxImm
/* 0000F470 3C600000 */ lis r3, minigameGma@ha
/* 0000F474 38630000 */ addi r3, r3, minigameGma@l
/* 0000F478 80630000 */ lwz r3, 0(r3)
/* 0000F47C 80630008 */ lwz r3, 8(r3)
/* 0000F480 80630008 */ lwz r3, 8(r3)
/* 0000F484 4BFF0CB1 */ bl avdisp_draw_model_unculled_sort_translucent
/* 0000F488 3C600000 */ lis r3, lbl_10000060@ha
/* 0000F48C 88030000 */ lbz r0, lbl_10000060@l(r3)
/* 0000F490 7C000775 */ extsb. r0, r0
/* 0000F494 418201E8 */ beq lbl_0000F67C
/* 0000F498 4BFF0C9D */ bl mathutil_mtxA_from_mtxB
/* 0000F49C C03F37AC */ lfs f1, 0x37ac(r31)
/* 0000F4A0 C05F3778 */ lfs f2, 0x3778(r31)
/* 0000F4A4 C07F37B0 */ lfs f3, 0x37b0(r31)
/* 0000F4A8 4BFF0C8D */ bl mathutil_mtxA_translate_xyz
/* 0000F4AC C03F37B4 */ lfs f1, 0x37b4(r31)
/* 0000F4B0 4BFF0C85 */ bl mathutil_mtxA_scale_s
/* 0000F4B4 3C600000 */ lis r3, g_commonNlObj@ha
/* 0000F4B8 3AA30000 */ addi r21, r3, g_commonNlObj@l
/* 0000F4BC 80750000 */ lwz r3, 0(r21)
/* 0000F4C0 806300A8 */ lwz r3, 0xa8(r3)
/* 0000F4C4 4BFF0C71 */ bl nlObjPut
/* 0000F4C8 C03F37B8 */ lfs f1, 0x37b8(r31)
/* 0000F4CC 4BFF0C69 */ bl nlLineSetThickness
/* 0000F4D0 C01F3778 */ lfs f0, 0x3778(r31)
/* 0000F4D4 3C800000 */ lis r4, lbl_100000A4@ha
/* 0000F4D8 3C600000 */ lis r3, lbl_0001C2B8@ha
/* 0000F4DC D00101C4 */ stfs f0, 0x1c4(r1)
/* 0000F4E0 3A840000 */ addi r20, r4, lbl_100000A4@l
/* 0000F4E4 3A630000 */ addi r19, r3, lbl_0001C2B8@l
/* 0000F4E8 C01F3778 */ lfs f0, 0x3778(r31)
/* 0000F4EC 3A000000 */ li r16, 0
/* 0000F4F0 39E00000 */ li r15, 0
/* 0000F4F4 D00101B8 */ stfs f0, 0x1b8(r1)
/* 0000F4F8 3A200000 */ li r17, 0
lbl_0000F4FC:
/* 0000F4FC 807F3764 */ lwz r3, 0x3764(r31)
/* 0000F500 801F3768 */ lwz r0, 0x3768(r31)
/* 0000F504 90610170 */ stw r3, 0x170(r1)
/* 0000F508 90010174 */ stw r0, 0x174(r1)
/* 0000F50C 801F376C */ lwz r0, 0x376c(r31)
/* 0000F510 90010178 */ stw r0, 0x178(r1)
/* 0000F514 4BFF0C21 */ bl mathutil_mtxA_from_mtxB
/* 0000F518 7C748A14 */ add r3, r20, r17
/* 0000F51C 4BFF0C19 */ bl mathutil_mtxA_mult_right
/* 0000F520 7E537A14 */ add r18, r19, r15
/* 0000F524 C0120020 */ lfs f0, 0x20(r18)
/* 0000F528 386101BC */ addi r3, r1, 0x1bc
/* 0000F52C 388101B0 */ addi r4, r1, 0x1b0
/* 0000F530 FC000050 */ fneg f0, f0
/* 0000F534 38A0FFFF */ li r5, -1
/* 0000F538 D00101BC */ stfs f0, 0x1bc(r1)
/* 0000F53C C0120024 */ lfs f0, 0x24(r18)
/* 0000F540 FC000050 */ fneg f0, f0
/* 0000F544 D00101C0 */ stfs f0, 0x1c0(r1)
/* 0000F548 C0120020 */ lfs f0, 0x20(r18)
/* 0000F54C D00101B0 */ stfs f0, 0x1b0(r1)
/* 0000F550 C0120024 */ lfs f0, 0x24(r18)
/* 0000F554 FC000050 */ fneg f0, f0
/* 0000F558 D00101B4 */ stfs f0, 0x1b4(r1)
/* 0000F55C 4BFF0BD9 */ bl nlSingleLine
/* 0000F560 C0120020 */ lfs f0, 0x20(r18)
/* 0000F564 386101BC */ addi r3, r1, 0x1bc
/* 0000F568 388101B0 */ addi r4, r1, 0x1b0
/* 0000F56C FC000050 */ fneg f0, f0
/* 0000F570 38A0FFFF */ li r5, -1
/* 0000F574 D00101BC */ stfs f0, 0x1bc(r1)
/* 0000F578 C0120024 */ lfs f0, 0x24(r18)
/* 0000F57C D00101C0 */ stfs f0, 0x1c0(r1)
/* 0000F580 C0120020 */ lfs f0, 0x20(r18)
/* 0000F584 D00101B0 */ stfs f0, 0x1b0(r1)
/* 0000F588 C0120024 */ lfs f0, 0x24(r18)
/* 0000F58C D00101B4 */ stfs f0, 0x1b4(r1)
/* 0000F590 4BFF0BA5 */ bl nlSingleLine
/* 0000F594 C0120020 */ lfs f0, 0x20(r18)
/* 0000F598 386101BC */ addi r3, r1, 0x1bc
/* 0000F59C 388101B0 */ addi r4, r1, 0x1b0
/* 0000F5A0 FC000050 */ fneg f0, f0
/* 0000F5A4 38A0FFFF */ li r5, -1
/* 0000F5A8 D00101BC */ stfs f0, 0x1bc(r1)
/* 0000F5AC C0120024 */ lfs f0, 0x24(r18)
/* 0000F5B0 D00101C0 */ stfs f0, 0x1c0(r1)
/* 0000F5B4 C0120020 */ lfs f0, 0x20(r18)
/* 0000F5B8 FC000050 */ fneg f0, f0
/* 0000F5BC D00101B0 */ stfs f0, 0x1b0(r1)
/* 0000F5C0 C0120024 */ lfs f0, 0x24(r18)
/* 0000F5C4 FC000050 */ fneg f0, f0
/* 0000F5C8 D00101B4 */ stfs f0, 0x1b4(r1)
/* 0000F5CC 4BFF0B69 */ bl nlSingleLine
/* 0000F5D0 C0120020 */ lfs f0, 0x20(r18)
/* 0000F5D4 386101BC */ addi r3, r1, 0x1bc
/* 0000F5D8 388101B0 */ addi r4, r1, 0x1b0
/* 0000F5DC D00101BC */ stfs f0, 0x1bc(r1)
/* 0000F5E0 38A0FFFF */ li r5, -1
/* 0000F5E4 C0120024 */ lfs f0, 0x24(r18)
/* 0000F5E8 D00101C0 */ stfs f0, 0x1c0(r1)
/* 0000F5EC C0120020 */ lfs f0, 0x20(r18)
/* 0000F5F0 D00101B0 */ stfs f0, 0x1b0(r1)
/* 0000F5F4 C0120024 */ lfs f0, 0x24(r18)
/* 0000F5F8 FC000050 */ fneg f0, f0
/* 0000F5FC D00101B4 */ stfs f0, 0x1b4(r1)
/* 0000F600 4BFF0B35 */ bl nlSingleLine
/* 0000F604 80750000 */ lwz r3, 0(r21)
/* 0000F608 806300A8 */ lwz r3, 0xa8(r3)
/* 0000F60C 4BFF0B29 */ bl nlObjPut
/* 0000F610 3A100001 */ addi r16, r16, 1
/* 0000F614 2C100034 */ cmpwi r16, 0x34
/* 0000F618 39EF0028 */ addi r15, r15, 0x28
/* 0000F61C 3A310030 */ addi r17, r17, 0x30
/* 0000F620 4180FEDC */ blt lbl_0000F4FC
/* 0000F624 3C800000 */ lis r4, lbl_0001CAD8@ha
/* 0000F628 3C600000 */ lis r3, g_commonNlObj@ha
/* 0000F62C 3A440000 */ addi r18, r4, lbl_0001CAD8@l
/* 0000F630 3A230000 */ addi r17, r3, g_commonNlObj@l
/* 0000F634 3A000000 */ li r16, 0
/* 0000F638 39E00000 */ li r15, 0
lbl_0000F63C:
/* 0000F63C 4BFF0AF9 */ bl mathutil_mtxA_from_mtxB
/* 0000F640 7C727A14 */ add r3, r18, r15
/* 0000F644 4BFF0AF1 */ bl mathutil_mtxA_translate
/* 0000F648 7C727A14 */ add r3, r18, r15
/* 0000F64C C05F37B8 */ lfs f2, 0x37b8(r31)
/* 0000F650 C023000C */ lfs f1, 0xc(r3)
/* 0000F654 FC600890 */ fmr f3, f1
/* 0000F658 4BFF0ADD */ bl mathutil_mtxA_scale_xyz
/* 0000F65C 80710000 */ lwz r3, 0(r17)
/* 0000F660 C03F37BC */ lfs f1, 0x37bc(r31)
/* 0000F664 806300BC */ lwz r3, 0xbc(r3)
/* 0000F668 4BFF0ACD */ bl nlObjPutTrnsl
/* 0000F66C 3A100001 */ addi r16, r16, 1
/* 0000F670 2C100006 */ cmpwi r16, 6
/* 0000F674 39EF0018 */ addi r15, r15, 0x18
/* 0000F678 4180FFC4 */ blt lbl_0000F63C
lbl_0000F67C:
/* 0000F67C 3C600000 */ lis r3, minigameGma@ha
/* 0000F680 3C800000 */ lis r4, mathutilData@ha
/* 0000F684 3CA00000 */ lis r5, lbl_10009878@ha
/* 0000F688 3CC00000 */ lis r6, lbl_10000004@ha
/* 0000F68C 3AA30000 */ addi r21, r3, minigameGma@l
/* 0000F690 39E40000 */ addi r15, r4, mathutilData@l
/* 0000F694 3A250000 */ addi r17, r5, lbl_10009878@l
/* 0000F698 3A460000 */ addi r18, r6, lbl_10000004@l
/* 0000F69C 3A000000 */ li r16, 0
/* 0000F6A0 3A600000 */ li r19, 0
/* 0000F6A4 3A800000 */ li r20, 0
lbl_0000F6A8:
/* 0000F6A8 7C71A214 */ add r3, r17, r20
/* 0000F6AC 88030000 */ lbz r0, 0(r3)
/* 0000F6B0 7C000775 */ extsb. r0, r0
/* 0000F6B4 4182017C */ beq lbl_0000F830
/* 0000F6B8 88120000 */ lbz r0, 0(r18)
/* 0000F6BC 38600000 */ li r3, 0
/* 0000F6C0 38830000 */ addi r4, r3, 0
/* 0000F6C4 7C000775 */ extsb. r0, r0
/* 0000F6C8 41820058 */ beq lbl_0000F720
/* 0000F6CC 7FC00775 */ extsb. r0, r30
/* 0000F6D0 38030000 */ addi r0, r3, 0
/* 0000F6D4 38A00001 */ li r5, 1
/* 0000F6D8 40820010 */ bne lbl_0000F6E8
/* 0000F6DC 2C100000 */ cmpwi r16, 0
/* 0000F6E0 41820008 */ beq lbl_0000F6E8
/* 0000F6E4 7CA02B78 */ mr r0, r5
lbl_0000F6E8:
/* 0000F6E8 2C000000 */ cmpwi r0, 0
/* 0000F6EC 40820028 */ bne lbl_0000F714
/* 0000F6F0 7FC00775 */ extsb. r0, r30
/* 0000F6F4 38000000 */ li r0, 0
/* 0000F6F8 41820010 */ beq lbl_0000F708
/* 0000F6FC 2C100001 */ cmpwi r16, 1
/* 0000F700 40810008 */ ble lbl_0000F708
/* 0000F704 38000001 */ li r0, 1
lbl_0000F708:
/* 0000F708 2C000000 */ cmpwi r0, 0
/* 0000F70C 40820008 */ bne lbl_0000F714
/* 0000F710 38A00000 */ li r5, 0
lbl_0000F714:
/* 0000F714 2C050000 */ cmpwi r5, 0
/* 0000F718 41820008 */ beq lbl_0000F720
/* 0000F71C 38800001 */ li r4, 1
lbl_0000F720:
/* 0000F720 2C040000 */ cmpwi r4, 0
/* 0000F724 41820010 */ beq lbl_0000F734
/* 0000F728 2C100009 */ cmpwi r16, 9
/* 0000F72C 41820008 */ beq lbl_0000F734
/* 0000F730 38600001 */ li r3, 1
lbl_0000F734:
/* 0000F734 7C760774 */ extsb r22, r3
/* 0000F738 7EC00775 */ extsb. r0, r22
/* 0000F73C 4082001C */ bne lbl_0000F758
/* 0000F740 7C71A214 */ add r3, r17, r20
/* 0000F744 38630044 */ addi r3, r3, 0x44
/* 0000F748 4BFF09ED */ bl mathutil_mtxA_from_quat
/* 0000F74C 38610180 */ addi r3, r1, 0x180
/* 0000F750 4BFF09E5 */ bl mathutil_mtxA_to_mtx
/* 0000F754 48000028 */ b lbl_0000F77C
lbl_0000F758:
/* 0000F758 7C71A214 */ add r3, r17, r20
/* 0000F75C 80630064 */ lwz r3, 0x64(r3)
/* 0000F760 38630060 */ addi r3, r3, 0x60
/* 0000F764 4BFF09D1 */ bl mathutil_mtxA_from_quat
/* 0000F768 C03F37A4 */ lfs f1, 0x37a4(r31)
/* 0000F76C C05F3778 */ lfs f2, 0x3778(r31)
/* 0000F770 4BFF09C5 */ bl mathutil_mtxA_rotate_y_sin_cos
/* 0000F774 38610180 */ addi r3, r1, 0x180
/* 0000F778 4BFF09BD */ bl mathutil_mtxA_to_mtx
lbl_0000F77C:
/* 0000F77C 4BFF09B9 */ bl mathutil_mtxA_from_mtxB
/* 0000F780 7C71A214 */ add r3, r17, r20
/* 0000F784 38630010 */ addi r3, r3, 0x10
/* 0000F788 4BFF09AD */ bl mathutil_mtxA_translate
/* 0000F78C 38610180 */ addi r3, r1, 0x180
/* 0000F790 4BFF09A5 */ bl mathutil_mtxA_mult_right
/* 0000F794 C03F37A8 */ lfs f1, 0x37a8(r31)
/* 0000F798 4BFF099D */ bl mathutil_mtxA_scale_s
/* 0000F79C C03F3778 */ lfs f1, 0x3778(r31)
/* 0000F7A0 C05F37C0 */ lfs f2, 0x37c0(r31)
/* 0000F7A4 FC600890 */ fmr f3, f1
/* 0000F7A8 4BFF098D */ bl mathutil_mtxA_translate_xyz
/* 0000F7AC 7EC00775 */ extsb. r0, r22
/* 0000F7B0 41820020 */ beq lbl_0000F7D0
/* 0000F7B4 C03F37BC */ lfs f1, 0x37bc(r31)
/* 0000F7B8 4BFF097D */ bl mathutil_mtxA_scale_s
/* 0000F7BC 7FE3FB78 */ mr r3, r31
/* 0000F7C0 4BFF0975 */ bl nlObjPut_OpaqueList
/* 0000F7C4 387F1AA8 */ addi r3, r31, 0x1aa8
/* 0000F7C8 4BFF096D */ bl nlObjPut_OpaqueList
/* 0000F7CC 48000064 */ b lbl_0000F830
lbl_0000F7D0:
/* 0000F7D0 806F0000 */ lwz r3, 0(r15)
/* 0000F7D4 38800000 */ li r4, 0
/* 0000F7D8 4BFF095D */ bl GXLoadPosMtxImm
/* 0000F7DC 806F0000 */ lwz r3, 0(r15)
/* 0000F7E0 38800000 */ li r4, 0
/* 0000F7E4 4BFF0951 */ bl GXLoadNrmMtxImm
/* 0000F7E8 7FC00775 */ extsb. r0, r30
/* 0000F7EC 41820018 */ beq lbl_0000F804
/* 0000F7F0 80750000 */ lwz r3, 0(r21)
/* 0000F7F4 80630008 */ lwz r3, 8(r3)
/* 0000F7F8 80630238 */ lwz r3, 0x238(r3)
/* 0000F7FC 4BFF0939 */ bl avdisp_draw_model_unculled_sort_all
/* 0000F800 48000030 */ b lbl_0000F830
lbl_0000F804:
/* 0000F804 2C100000 */ cmpwi r16, 0
/* 0000F808 4081000C */ ble lbl_0000F814
/* 0000F80C C03F37BC */ lfs f1, 0x37bc(r31)
/* 0000F810 4BFF0925 */ bl avdisp_set_alpha
lbl_0000F814:
/* 0000F814 7C7F9A14 */ add r3, r31, r19
/* 0000F818 80950000 */ lwz r4, 0(r21)
/* 0000F81C A8033664 */ lha r0, 0x3664(r3)
/* 0000F820 80640008 */ lwz r3, 8(r4)
/* 0000F824 54001838 */ slwi r0, r0, 3
/* 0000F828 7C63002E */ lwzx r3, r3, r0
/* 0000F82C 4BFF0909 */ bl avdisp_draw_model_unculled_sort_all
lbl_0000F830:
/* 0000F830 3A100001 */ addi r16, r16, 1
/* 0000F834 2C10000A */ cmpwi r16, 0xa
/* 0000F838 3A730002 */ addi r19, r19, 2
/* 0000F83C 3A940068 */ addi r20, r20, 0x68
/* 0000F840 4180FE68 */ blt lbl_0000F6A8
/* 0000F844 3C600000 */ lis r3, lbl_10009878@ha
/* 0000F848 39E30000 */ addi r15, r3, lbl_10009878@l
/* 0000F84C 880F03A8 */ lbz r0, 0x3a8(r15)
/* 0000F850 7C000775 */ extsb. r0, r0
/* 0000F854 41820048 */ beq lbl_0000F89C
/* 0000F858 4BFF08DD */ bl mathutil_mtxA_from_mtxB
/* 0000F85C 386F03B8 */ addi r3, r15, 0x3b8
/* 0000F860 4BFF08D5 */ bl mathutil_mtxA_translate
/* 0000F864 3C600000 */ lis r3, mathutilData@ha
/* 0000F868 39E30000 */ addi r15, r3, mathutilData@l
/* 0000F86C 806F0000 */ lwz r3, 0(r15)
/* 0000F870 38800000 */ li r4, 0
/* 0000F874 4BFF08C1 */ bl GXLoadPosMtxImm
/* 0000F878 806F0000 */ lwz r3, 0(r15)
/* 0000F87C 38800000 */ li r4, 0
/* 0000F880 4BFF08B5 */ bl GXLoadNrmMtxImm
/* 0000F884 3C600000 */ lis r3, minigameGma@ha
/* 0000F888 38630000 */ addi r3, r3, minigameGma@l
/* 0000F88C 80630000 */ lwz r3, 0(r3)
/* 0000F890 80630008 */ lwz r3, 8(r3)
/* 0000F894 80630198 */ lwz r3, 0x198(r3)
/* 0000F898 4BFF089D */ bl avdisp_draw_model_unculled_sort_translucent
lbl_0000F89C:
/* 0000F89C 3C600000 */ lis r3, lbl_1000000A@ha
/* 0000F8A0 88030000 */ lbz r0, lbl_1000000A@l(r3)
/* 0000F8A4 2C000017 */ cmpwi r0, 0x17
/* 0000F8A8 408200CC */ bne lbl_0000F974
/* 0000F8AC 3CA00000 */ lis r5, lbl_10009CBC@ha
/* 0000F8B0 3C800000 */ lis r4, mathutilData@ha
/* 0000F8B4 3C600000 */ lis r3, minigameGma@ha
/* 0000F8B8 3CC00000 */ lis r6, cameraInfo@ha
/* 0000F8BC 3A650000 */ addi r19, r5, lbl_10009CBC@l
/* 0000F8C0 3A440000 */ addi r18, r4, mathutilData@l
/* 0000F8C4 3A230000 */ addi r17, r3, minigameGma@l
/* 0000F8C8 3A860000 */ addi r20, r6, cameraInfo@l
/* 0000F8CC 3A000000 */ li r16, 0
/* 0000F8D0 39E00000 */ li r15, 0
lbl_0000F8D4:
/* 0000F8D4 7EB37A14 */ add r21, r19, r15
/* 0000F8D8 88150000 */ lbz r0, 0(r21)
/* 0000F8DC 7C000775 */ extsb. r0, r0
/* 0000F8E0 41820084 */ beq lbl_0000F964
/* 0000F8E4 C035000C */ lfs f1, 0xc(r21)
/* 0000F8E8 C0140008 */ lfs f0, 8(r20)
/* 0000F8EC C0750008 */ lfs f3, 8(r21)
/* 0000F8F0 C0540004 */ lfs f2, 4(r20)
/* 0000F8F4 EC810028 */ fsubs f4, f1, f0
/* 0000F8F8 C0350004 */ lfs f1, 4(r21)
/* 0000F8FC C0140000 */ lfs f0, 0(r20)
/* 0000F900 EC431028 */ fsubs f2, f3, f2
/* 0000F904 EC210028 */ fsubs f1, f1, f0
/* 0000F908 EC210072 */ fmuls f1, f1, f1
/* 0000F90C EC2208BA */ fmadds f1, f2, f2, f1
/* 0000F910 EC24093A */ fmadds f1, f4, f4, f1
/* 0000F914 C01F37C4 */ lfs f0, 0x37c4(r31)
/* 0000F918 FC010040 */ fcmpo cr0, f1, f0
/* 0000F91C 40810048 */ ble lbl_0000F964
/* 0000F920 4BFF0815 */ bl mathutil_mtxA_from_mtxB
/* 0000F924 38750004 */ addi r3, r21, 4
/* 0000F928 4BFF080D */ bl mathutil_mtxA_translate
/* 0000F92C A875001E */ lha r3, 0x1e(r21)
/* 0000F930 4BFF0805 */ bl mathutil_mtxA_rotate_y
/* 0000F934 A875001C */ lha r3, 0x1c(r21)
/* 0000F938 4BFF07FD */ bl mathutil_mtxA_rotate_x
/* 0000F93C 80720000 */ lwz r3, 0(r18)
/* 0000F940 38800000 */ li r4, 0
/* 0000F944 4BFF07F1 */ bl GXLoadPosMtxImm
/* 0000F948 80720000 */ lwz r3, 0(r18)
/* 0000F94C 38800000 */ li r4, 0
/* 0000F950 4BFF07E5 */ bl GXLoadNrmMtxImm
/* 0000F954 80710000 */ lwz r3, 0(r17)
/* 0000F958 80630008 */ lwz r3, 8(r3)
/* 0000F95C 80630060 */ lwz r3, 0x60(r3)
/* 0000F960 4BFF07D5 */ bl avdisp_draw_model_unculled_sort_translucent
lbl_0000F964:
/* 0000F964 3A100001 */ addi r16, r16, 1
/* 0000F968 2C100040 */ cmpwi r16, 0x40
/* 0000F96C 39EF0024 */ addi r15, r15, 0x24
/* 0000F970 4180FF64 */ blt lbl_0000F8D4
lbl_0000F974:
/* 0000F974 3C600000 */ lis r3, lbl_1000000A@ha
/* 0000F978 88030000 */ lbz r0, lbl_1000000A@l(r3)
/* 0000F97C 7C000774 */ extsb r0, r0
/* 0000F980 2C000011 */ cmpwi r0, 0x11
/* 0000F984 4182001C */ beq lbl_0000F9A0
/* 0000F988 2C00000E */ cmpwi r0, 0xe
/* 0000F98C 41820014 */ beq lbl_0000F9A0
/* 0000F990 2C00000F */ cmpwi r0, 0xf
/* 0000F994 4182000C */ beq lbl_0000F9A0
/* 0000F998 2C000010 */ cmpwi r0, 0x10
/* 0000F99C 4082034C */ bne lbl_0000FCE8
lbl_0000F9A0:
/* 0000F9A0 3C600000 */ lis r3, lbl_10009878@ha
/* 0000F9A4 39E30000 */ addi r15, r3, lbl_10009878@l
/* 0000F9A8 C02F0018 */ lfs f1, 0x18(r15)
/* 0000F9AC 3C600000 */ lis r3, lbl_10009CA0@ha
/* 0000F9B0 C00F0010 */ lfs f0, 0x10(r15)
/* 0000F9B4 38630000 */ addi r3, r3, lbl_10009CA0@l
/* 0000F9B8 FC600850 */ fneg f3, f1
/* 0000F9BC C0430008 */ lfs f2, 8(r3)
/* 0000F9C0 FC200050 */ fneg f1, f0
/* 0000F9C4 C0030000 */ lfs f0, 0(r3)
/* 0000F9C8 EFE3102A */ fadds f31, f3, f2
/* 0000F9CC EFC1002A */ fadds f30, f1, f0
/* 0000F9D0 EC3E07B2 */ fmuls f1, f30, f30
/* 0000F9D4 EC3F0FFA */ fmadds f1, f31, f31, f1
/* 0000F9D8 C01F37C8 */ lfs f0, 0x37c8(r31)
/* 0000F9DC FC010040 */ fcmpo cr0, f1, f0
/* 0000F9E0 40800020 */ bge lbl_0000FA00
/* 0000F9E4 806F0010 */ lwz r3, 0x10(r15)
/* 0000F9E8 800F0014 */ lwz r0, 0x14(r15)
/* 0000F9EC 90610164 */ stw r3, 0x164(r1)
/* 0000F9F0 90010168 */ stw r0, 0x168(r1)
/* 0000F9F4 800F0018 */ lwz r0, 0x18(r15)
/* 0000F9F8 9001016C */ stw r0, 0x16c(r1)
/* 0000F9FC 48000038 */ b lbl_0000FA34
lbl_0000FA00:
/* 0000FA00 4BFF0735 */ bl mathutil_rsqrt
/* 0000FA04 C01F37BC */ lfs f0, 0x37bc(r31)
/* 0000FA08 C06F0010 */ lfs f3, 0x10(r15)
/* 0000FA0C EC200072 */ fmuls f1, f0, f1
/* 0000FA10 EC5E0072 */ fmuls f2, f30, f1
/* 0000FA14 EC1F0072 */ fmuls f0, f31, f1
/* 0000FA18 EC23102A */ fadds f1, f3, f2
/* 0000FA1C D0210164 */ stfs f1, 0x164(r1)
/* 0000FA20 C03F37BC */ lfs f1, 0x37bc(r31)
/* 0000FA24 D0210168 */ stfs f1, 0x168(r1)
/* 0000FA28 C02F0018 */ lfs f1, 0x18(r15)
/* 0000FA2C EC01002A */ fadds f0, f1, f0
/* 0000FA30 D001016C */ stfs f0, 0x16c(r1)
lbl_0000FA34:
/* 0000FA34 3C600000 */ lis r3, cameraInfo@ha
/* 0000FA38 3A030000 */ addi r16, r3, cameraInfo@l
/* 0000FA3C 3C600000 */ lis r3, lbl_10009878@ha
/* 0000FA40 C0900008 */ lfs f4, 8(r16)
/* 0000FA44 38630000 */ addi r3, r3, lbl_10009878@l
/* 0000FA48 C0700004 */ lfs f3, 4(r16)
/* 0000FA4C C0030018 */ lfs f0, 0x18(r3)
/* 0000FA50 C0430014 */ lfs f2, 0x14(r3)
/* 0000FA54 C0300000 */ lfs f1, 0(r16)
/* 0000FA58 EC840028 */ fsubs f4, f4, f0
/* 0000FA5C C0030010 */ lfs f0, 0x10(r3)
/* 0000FA60 EC431028 */ fsubs f2, f3, f2
/* 0000FA64 EC210028 */ fsubs f1, f1, f0
/* 0000FA68 EC210072 */ fmuls f1, f1, f1
/* 0000FA6C EC2208BA */ fmadds f1, f2, f2, f1
/* 0000FA70 EC24093A */ fmadds f1, f4, f4, f1
/* 0000FA74 4BFF06C1 */ bl mathutil_sqrt
/* 0000FA78 3C600000 */ lis r3, lbl_10000054@ha
/* 0000FA7C C0DF37CC */ lfs f6, 0x37cc(r31)
/* 0000FA80 39E30000 */ addi r15, r3, lbl_10000054@l
/* 0000FA84 C0B00008 */ lfs f5, 8(r16)
/* 0000FA88 C00F0000 */ lfs f0, 0(r15)
/* 0000FA8C 3C600000 */ lis r3, lbl_10009CA0@ha
/* 0000FA90 38630000 */ addi r3, r3, lbl_10009CA0@l
/* 0000FA94 C0700004 */ lfs f3, 4(r16)
/* 0000FA98 EC000072 */ fmuls f0, f0, f1
/* 0000FA9C C0830008 */ lfs f4, 8(r3)
/* 0000FAA0 C0430004 */ lfs f2, 4(r3)
/* 0000FAA4 C0300000 */ lfs f1, 0(r16)
/* 0000FAA8 EFE60032 */ fmuls f31, f6, f0
/* 0000FAAC C0030000 */ lfs f0, 0(r3)
/* 0000FAB0 EC852028 */ fsubs f4, f5, f4
/* 0000FAB4 EC431028 */ fsubs f2, f3, f2
/* 0000FAB8 EC210028 */ fsubs f1, f1, f0
/* 0000FABC EC210072 */ fmuls f1, f1, f1
/* 0000FAC0 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000FAC4 EC24093A */ fmadds f1, f4, f4, f1
/* 0000FAC8 4BFF066D */ bl mathutil_sqrt
/* 0000FACC C00F0000 */ lfs f0, 0(r15)
/* 0000FAD0 C05F37CC */ lfs f2, 0x37cc(r31)
/* 0000FAD4 EC000072 */ fmuls f0, f0, f1
/* 0000FAD8 EC020032 */ fmuls f0, f2, f0
/* 0000FADC FC00F840 */ fcmpo cr0, f0, f31
/* 0000FAE0 40800008 */ bge lbl_0000FAE8
/* 0000FAE4 FFE00090 */ fmr f31, f0
lbl_0000FAE8:
/* 0000FAE8 3C600000 */ lis r3, cameraInfo@ha
/* 0000FAEC 38830000 */ addi r4, r3, cameraInfo@l
/* 0000FAF0 3C600000 */ lis r3, lbl_10009CA0@ha
/* 0000FAF4 C0840008 */ lfs f4, 8(r4)
/* 0000FAF8 38630000 */ addi r3, r3, lbl_10009CA0@l
/* 0000FAFC C0640004 */ lfs f3, 4(r4)
/* 0000FB00 C0030014 */ lfs f0, 0x14(r3)
/* 0000FB04 C0430010 */ lfs f2, 0x10(r3)
/* 0000FB08 C0240000 */ lfs f1, 0(r4)
/* 0000FB0C EC840028 */ fsubs f4, f4, f0
/* 0000FB10 C003000C */ lfs f0, 0xc(r3)
/* 0000FB14 EC431028 */ fsubs f2, f3, f2
/* 0000FB18 EC210028 */ fsubs f1, f1, f0
/* 0000FB1C EC210072 */ fmuls f1, f1, f1
/* 0000FB20 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000FB24 EC24093A */ fmadds f1, f4, f4, f1
/* 0000FB28 4BFF060D */ bl mathutil_sqrt
/* 0000FB2C 3C600000 */ lis r3, lbl_10000054@ha
/* 0000FB30 C05F37CC */ lfs f2, 0x37cc(r31)
/* 0000FB34 C0030000 */ lfs f0, lbl_10000054@l(r3)
/* 0000FB38 EC000072 */ fmuls f0, f0, f1
/* 0000FB3C EC020032 */ fmuls f0, f2, f0
/* 0000FB40 FC00F840 */ fcmpo cr0, f0, f31
/* 0000FB44 40800008 */ bge lbl_0000FB4C
/* 0000FB48 FFE00090 */ fmr f31, f0
lbl_0000FB4C:
/* 0000FB4C C01F37A8 */ lfs f0, 0x37a8(r31)
/* 0000FB50 FC1F0040 */ fcmpo cr0, f31, f0
/* 0000FB54 4080000C */ bge lbl_0000FB60
/* 0000FB58 FFE00090 */ fmr f31, f0
/* 0000FB5C 48000014 */ b lbl_0000FB70
lbl_0000FB60:
/* 0000FB60 C01F37B4 */ lfs f0, 0x37b4(r31)
/* 0000FB64 FC1F0040 */ fcmpo cr0, f31, f0
/* 0000FB68 40810008 */ ble lbl_0000FB70
/* 0000FB6C FFE00090 */ fmr f31, f0
lbl_0000FB70:
/* 0000FB70 3C600000 */ lis r3, lbl_802F1C32@ha
/* 0000FB74 88030000 */ lbz r0, lbl_802F1C32@l(r3)
/* 0000FB78 3C600000 */ lis r3, lbl_10000A64@ha
/* 0000FB7C 38630000 */ addi r3, r3, lbl_10000A64@l
/* 0000FB80 7C000774 */ extsb r0, r0
/* 0000FB84 1C000006 */ mulli r0, r0, 6
/* 0000FB88 7C630214 */ add r3, r3, r0
/* 0000FB8C 88030003 */ lbz r0, 3(r3)
/* 0000FB90 7C000775 */ extsb. r0, r0
/* 0000FB94 4182007C */ beq lbl_0000FC10
/* 0000FB98 3C600000 */ lis r3, lbl_10009CA0@ha
/* 0000FB9C 39E30000 */ addi r15, r3, lbl_10009CA0@l
/* 0000FBA0 C06F0008 */ lfs f3, 8(r15)
/* 0000FBA4 C04F0014 */ lfs f2, 0x14(r15)
/* 0000FBA8 C02F0000 */ lfs f1, 0(r15)
/* 0000FBAC C00F000C */ lfs f0, 0xc(r15)
/* 0000FBB0 EC431028 */ fsubs f2, f3, f2
/* 0000FBB4 EC210028 */ fsubs f1, f1, f0
/* 0000FBB8 EC210072 */ fmuls f1, f1, f1
/* 0000FBBC EC2208BA */ fmadds f1, f2, f2, f1
/* 0000FBC0 C01F37D0 */ lfs f0, 0x37d0(r31)
/* 0000FBC4 FC010040 */ fcmpo cr0, f1, f0
/* 0000FBC8 4080001C */ bge lbl_0000FBE4
/* 0000FBCC FC20F890 */ fmr f1, f31
/* 0000FBD0 388F0000 */ addi r4, r15, 0
/* 0000FBD4 38610164 */ addi r3, r1, 0x164
/* 0000FBD8 38A00001 */ li r5, 1
/* 0000FBDC 480013F5 */ bl lbl_00010FD0
/* 0000FBE0 48000108 */ b lbl_0000FCE8
lbl_0000FBE4:
/* 0000FBE4 FC20F890 */ fmr f1, f31
/* 0000FBE8 388F0000 */ addi r4, r15, 0
/* 0000FBEC 38610164 */ addi r3, r1, 0x164
/* 0000FBF0 38A00000 */ li r5, 0
/* 0000FBF4 480013DD */ bl lbl_00010FD0
/* 0000FBF8 FC20F890 */ fmr f1, f31
/* 0000FBFC 386F0000 */ addi r3, r15, 0
/* 0000FC00 388F000C */ addi r4, r15, 0xc
/* 0000FC04 38A00001 */ li r5, 1
/* 0000FC08 480013C9 */ bl lbl_00010FD0
/* 0000FC0C 480000DC */ b lbl_0000FCE8
lbl_0000FC10:
/* 0000FC10 3C600000 */ lis r3, lbl_10009878@ha
/* 0000FC14 3A030000 */ addi r16, r3, lbl_10009878@l
/* 0000FC18 C0100010 */ lfs f0, 0x10(r16)
/* 0000FC1C 3C600000 */ lis r3, lbl_10009CA0@ha
/* 0000FC20 39E30000 */ addi r15, r3, lbl_10009CA0@l
/* 0000FC24 FC200050 */ fneg f1, f0
/* 0000FC28 C00F0000 */ lfs f0, 0(r15)
/* 0000FC2C EC01002A */ fadds f0, f1, f0
/* 0000FC30 D0010158 */ stfs f0, 0x158(r1)
/* 0000FC34 C01F3778 */ lfs f0, 0x3778(r31)
/* 0000FC38 D001015C */ stfs f0, 0x15c(r1)
/* 0000FC3C C0300018 */ lfs f1, 0x18(r16)
/* 0000FC40 C00F0008 */ lfs f0, 8(r15)
/* 0000FC44 FC200850 */ fneg f1, f1
/* 0000FC48 EC01002A */ fadds f0, f1, f0
/* 0000FC4C D0010160 */ stfs f0, 0x160(r1)
/* 0000FC50 C0210158 */ lfs f1, 0x158(r1)
/* 0000FC54 C0010160 */ lfs f0, 0x160(r1)
/* 0000FC58 EC210072 */ fmuls f1, f1, f1
/* 0000FC5C EC000032 */ fmuls f0, f0, f0
/* 0000FC60 EFC1002A */ fadds f30, f1, f0
/* 0000FC64 4BFF04D1 */ bl mathutil_mtxA_from_mtxB
/* 0000FC68 C03F37D4 */ lfs f1, 0x37d4(r31)
/* 0000FC6C 4BFF04C9 */ bl nlLineSetThickness
/* 0000FC70 C01F37D8 */ lfs f0, 0x37d8(r31)
/* 0000FC74 FC1E0040 */ fcmpo cr0, f30, f0
/* 0000FC78 4081005C */ ble lbl_0000FCD4
/* 0000FC7C FC20F090 */ fmr f1, f30
/* 0000FC80 4BFF04B5 */ bl mathutil_rsqrt
/* 0000FC84 C05F3774 */ lfs f2, 0x3774(r31)
/* 0000FC88 38610164 */ addi r3, r1, 0x164
/* 0000FC8C C0010158 */ lfs f0, 0x158(r1)
/* 0000FC90 38810158 */ addi r4, r1, 0x158
/* 0000FC94 EFC20072 */ fmuls f30, f2, f1
/* 0000FC98 C0500010 */ lfs f2, 0x10(r16)
/* 0000FC9C FC20F890 */ fmr f1, f31
/* 0000FCA0 38A00001 */ li r5, 1
/* 0000FCA4 EC0007B2 */ fmuls f0, f0, f30
/* 0000FCA8 EC02002A */ fadds f0, f2, f0
/* 0000FCAC D0010158 */ stfs f0, 0x158(r1)
/* 0000FCB0 C01F37BC */ lfs f0, 0x37bc(r31)
/* 0000FCB4 D001015C */ stfs f0, 0x15c(r1)
/* 0000FCB8 C0010160 */ lfs f0, 0x160(r1)
/* 0000FCBC C0500018 */ lfs f2, 0x18(r16)
/* 0000FCC0 EC0007B2 */ fmuls f0, f0, f30
/* 0000FCC4 EC02002A */ fadds f0, f2, f0
/* 0000FCC8 D0010160 */ stfs f0, 0x160(r1)
/* 0000FCCC 48001305 */ bl lbl_00010FD0
/* 0000FCD0 48000018 */ b lbl_0000FCE8
lbl_0000FCD4:
/* 0000FCD4 FC20F890 */ fmr f1, f31
/* 0000FCD8 388F0000 */ addi r4, r15, 0
/* 0000FCDC 38610164 */ addi r3, r1, 0x164
/* 0000FCE0 38A00001 */ li r5, 1
/* 0000FCE4 480012ED */ bl lbl_00010FD0
lbl_0000FCE8:
/* 0000FCE8 3C600000 */ lis r3, lbl_1000000A@ha
/* 0000FCEC 88030000 */ lbz r0, lbl_1000000A@l(r3)
/* 0000FCF0 7C000774 */ extsb r0, r0
/* 0000FCF4 2C000011 */ cmpwi r0, 0x11
/* 0000FCF8 4182001C */ beq lbl_0000FD14
/* 0000FCFC 2C00000E */ cmpwi r0, 0xe
/* 0000FD00 41820014 */ beq lbl_0000FD14
/* 0000FD04 2C00000F */ cmpwi r0, 0xf
/* 0000FD08 4182000C */ beq lbl_0000FD14
/* 0000FD0C 2C000010 */ cmpwi r0, 0x10
/* 0000FD10 408201C8 */ bne lbl_0000FED8
lbl_0000FD14:
/* 0000FD14 3C600000 */ lis r3, lbl_802F1C32@ha
/* 0000FD18 88030000 */ lbz r0, lbl_802F1C32@l(r3)
/* 0000FD1C 3C600000 */ lis r3, lbl_10000A64@ha
/* 0000FD20 38630000 */ addi r3, r3, lbl_10000A64@l
/* 0000FD24 7C000774 */ extsb r0, r0
/* 0000FD28 1C000006 */ mulli r0, r0, 6
/* 0000FD2C 7C630214 */ add r3, r3, r0
/* 0000FD30 88030003 */ lbz r0, 3(r3)
/* 0000FD34 7C000775 */ extsb. r0, r0
/* 0000FD38 418201A0 */ beq lbl_0000FED8
/* 0000FD3C 3C600000 */ lis r3, powerOnTimer@ha
/* 0000FD40 80030000 */ lwz r0, powerOnTimer@l(r3)
/* 0000FD44 540006BE */ clrlwi r0, r0, 0x1a
/* 0000FD48 28000020 */ cmplwi r0, 0x20
/* 0000FD4C 4080003C */ bge lbl_0000FD88
/* 0000FD50 900102B4 */ stw r0, 0x2b4(r1)
/* 0000FD54 3C004330 */ lis r0, 0x4330
/* 0000FD58 3C600000 */ lis r3, lbl_00020840@ha
/* 0000FD5C C05F37E0 */ lfs f2, 0x37e0(r31)
/* 0000FD60 900102B0 */ stw r0, 0x2b0(r1)
/* 0000FD64 C8230000 */ lfd f1, lbl_00020840@l(r3)
/* 0000FD68 C80102B0 */ lfd f0, 0x2b0(r1)
/* 0000FD6C C07F37DC */ lfs f3, 0x37dc(r31)
/* 0000FD70 EC000828 */ fsubs f0, f0, f1
/* 0000FD74 C09F37CC */ lfs f4, 0x37cc(r31)
/* 0000FD78 EC020032 */ fmuls f0, f2, f0
/* 0000FD7C EC030032 */ fmuls f0, f3, f0
/* 0000FD80 EFC4002A */ fadds f30, f4, f0
/* 0000FD84 48000040 */ b lbl_0000FDC4
lbl_0000FD88:
/* 0000FD88 20000040 */ subfic r0, r0, 0x40
/* 0000FD8C C05F37E0 */ lfs f2, 0x37e0(r31)
/* 0000FD90 6C008000 */ xoris r0, r0, 0x8000
/* 0000FD94 C07F37DC */ lfs f3, 0x37dc(r31)
/* 0000FD98 900102B4 */ stw r0, 0x2b4(r1)
/* 0000FD9C 3C004330 */ lis r0, 0x4330
/* 0000FDA0 3C600000 */ lis r3, lbl_00020848@ha
/* 0000FDA4 C09F37CC */ lfs f4, 0x37cc(r31)
/* 0000FDA8 900102B0 */ stw r0, 0x2b0(r1)
/* 0000FDAC C8230000 */ lfd f1, lbl_00020848@l(r3)
/* 0000FDB0 C80102B0 */ lfd f0, 0x2b0(r1)
/* 0000FDB4 EC000828 */ fsubs f0, f0, f1
/* 0000FDB8 EC020032 */ fmuls f0, f2, f0
/* 0000FDBC EC030032 */ fmuls f0, f3, f0
/* 0000FDC0 EFC4002A */ fadds f30, f4, f0
lbl_0000FDC4:
/* 0000FDC4 4BFF0371 */ bl mathutil_mtxA_from_mtxB
/* 0000FDC8 3C600000 */ lis r3, lbl_10009CA0@ha
/* 0000FDCC 39E30000 */ addi r15, r3, lbl_10009CA0@l
/* 0000FDD0 386F000C */ addi r3, r15, 0xc
/* 0000FDD4 4BFF0361 */ bl mathutil_mtxA_translate
/* 0000FDD8 3C600000 */ lis r3, lbl_1000000A@ha
/* 0000FDDC 88030000 */ lbz r0, lbl_1000000A@l(r3)
/* 0000FDE0 2C00000F */ cmpwi r0, 0xf
/* 0000FDE4 408200A0 */ bne lbl_0000FE84
/* 0000FDE8 3C600000 */ lis r3, cameraInfo@ha
/* 0000FDEC C00F000C */ lfs f0, 0xc(r15)
/* 0000FDF0 C4230000 */ lfsu f1, cameraInfo@l(r3)
/* 0000FDF4 EC010028 */ fsubs f0, f1, f0
/* 0000FDF8 D001014C */ stfs f0, 0x14c(r1)
/* 0000FDFC C0230004 */ lfs f1, 4(r3)
/* 0000FE00 C00F0010 */ lfs f0, 0x10(r15)
/* 0000FE04 EC010028 */ fsubs f0, f1, f0
/* 0000FE08 D0010150 */ stfs f0, 0x150(r1)
/* 0000FE0C C0230008 */ lfs f1, 8(r3)
/* 0000FE10 C00F0014 */ lfs f0, 0x14(r15)
/* 0000FE14 EC010028 */ fsubs f0, f1, f0
/* 0000FE18 D0010154 */ stfs f0, 0x154(r1)
/* 0000FE1C C021014C */ lfs f1, 0x14c(r1)
/* 0000FE20 C0010150 */ lfs f0, 0x150(r1)
/* 0000FE24 C0410154 */ lfs f2, 0x154(r1)
/* 0000FE28 EC210072 */ fmuls f1, f1, f1
/* 0000FE2C EC000032 */ fmuls f0, f0, f0
/* 0000FE30 EC4200B2 */ fmuls f2, f2, f2
/* 0000FE34 EC01002A */ fadds f0, f1, f0
/* 0000FE38 EC22002A */ fadds f1, f2, f0
/* 0000FE3C 4BFF02F9 */ bl mathutil_rsqrt
/* 0000FE40 C05F37E4 */ lfs f2, 0x37e4(r31)
/* 0000FE44 3861014C */ addi r3, r1, 0x14c
/* 0000FE48 C001014C */ lfs f0, 0x14c(r1)
/* 0000FE4C EFE20072 */ fmuls f31, f2, f1
/* 0000FE50 EC0007F2 */ fmuls f0, f0, f31
/* 0000FE54 D001014C */ stfs f0, 0x14c(r1)
/* 0000FE58 C0010150 */ lfs f0, 0x150(r1)
/* 0000FE5C EC0007F2 */ fmuls f0, f0, f31
/* 0000FE60 D0010150 */ stfs f0, 0x150(r1)
/* 0000FE64 C0010154 */ lfs f0, 0x154(r1)
/* 0000FE68 EC0007F2 */ fmuls f0, f0, f31
/* 0000FE6C D0010154 */ stfs f0, 0x154(r1)
/* 0000FE70 4BFF02C5 */ bl mathutil_mtxA_translate
/* 0000FE74 C01F37A8 */ lfs f0, 0x37a8(r31)
/* 0000FE78 EC20F828 */ fsubs f1, f0, f31
/* 0000FE7C 4BFF02B9 */ bl mathutil_mtxA_scale_s
/* 0000FE80 48000018 */ b lbl_0000FE98
lbl_0000FE84:
/* 0000FE84 4BFF02B1 */ bl mathutil_mtxA_sq_from_identity
/* 0000FE88 C03F37A8 */ lfs f1, 0x37a8(r31)
/* 0000FE8C C07F3778 */ lfs f3, 0x3778(r31)
/* 0000FE90 FC400890 */ fmr f2, f1
/* 0000FE94 4BFF02A1 */ bl mathutil_mtxA_scale_xyz
lbl_0000FE98:
/* 0000FE98 3C600000 */ lis r3, mathutilData@ha
/* 0000FE9C 39E30000 */ addi r15, r3, mathutilData@l
/* 0000FEA0 806F0000 */ lwz r3, 0(r15)
/* 0000FEA4 38800000 */ li r4, 0
/* 0000FEA8 4BFF028D */ bl GXLoadPosMtxImm
/* 0000FEAC 806F0000 */ lwz r3, 0(r15)
/* 0000FEB0 38800000 */ li r4, 0
/* 0000FEB4 4BFF0281 */ bl GXLoadNrmMtxImm
/* 0000FEB8 FC20F090 */ fmr f1, f30
/* 0000FEBC 4BFF0279 */ bl avdisp_set_alpha
/* 0000FEC0 3C600000 */ lis r3, commonGma@ha
/* 0000FEC4 38630000 */ addi r3, r3, commonGma@l
/* 0000FEC8 80630000 */ lwz r3, 0(r3)
/* 0000FECC 80630008 */ lwz r3, 8(r3)
/* 0000FED0 806300A0 */ lwz r3, 0xa0(r3)
/* 0000FED4 4BFF0261 */ bl avdisp_draw_model_unculled_sort_all
lbl_0000FED8:
/* 0000FED8 3C600000 */ lis r3, lbl_10000018@ha
/* 0000FEDC 88030000 */ lbz r0, lbl_10000018@l(r3)
/* 0000FEE0 7C000775 */ extsb. r0, r0
/* 0000FEE4 418201E0 */ beq lbl_000100C4
/* 0000FEE8 3CE00000 */ lis r7, cameraInfo@ha
/* 0000FEEC 3CC00000 */ lis r6, lbl_10009878@ha
/* 0000FEF0 3CA00000 */ lis r5, lbl_10000054@ha
/* 0000FEF4 3C800000 */ lis r4, mathutilData@ha
/* 0000FEF8 3C600000 */ lis r3, minigameGma@ha
/* 0000FEFC 3A470000 */ addi r18, r7, cameraInfo@l
/* 0000FF00 3A260000 */ addi r17, r6, lbl_10009878@l
/* 0000FF04 39E50000 */ addi r15, r5, lbl_10000054@l
/* 0000FF08 3AE40000 */ addi r23, r4, mathutilData@l
/* 0000FF0C 3AC30000 */ addi r22, r3, minigameGma@l
/* 0000FF10 3AA10232 */ addi r21, r1, 0x232
/* 0000FF14 3A000001 */ li r16, 1
/* 0000FF18 3A600002 */ li r19, 2
/* 0000FF1C 3A800068 */ li r20, 0x68
lbl_0000FF20:
/* 0000FF20 7F11A214 */ add r24, r17, r20
/* 0000FF24 88180000 */ lbz r0, 0(r24)
/* 0000FF28 2C000001 */ cmpwi r0, 1
/* 0000FF2C 40820184 */ bne lbl_000100B0
/* 0000FF30 4BFF0205 */ bl mathutil_mtxA_from_identity
/* 0000FF34 C0320000 */ lfs f1, 0(r18)
/* 0000FF38 3861013C */ addi r3, r1, 0x13c
/* 0000FF3C C0180010 */ lfs f0, 0x10(r24)
/* 0000FF40 EC010028 */ fsubs f0, f1, f0
/* 0000FF44 D0010140 */ stfs f0, 0x140(r1)
/* 0000FF48 C0320004 */ lfs f1, 4(r18)
/* 0000FF4C C0180014 */ lfs f0, 0x14(r24)
/* 0000FF50 EC010028 */ fsubs f0, f1, f0
/* 0000FF54 D0010144 */ stfs f0, 0x144(r1)
/* 0000FF58 C0320008 */ lfs f1, 8(r18)
/* 0000FF5C C0180018 */ lfs f0, 0x18(r24)
/* 0000FF60 EC010028 */ fsubs f0, f1, f0
/* 0000FF64 D0010148 */ stfs f0, 0x148(r1)
/* 0000FF68 C0210140 */ lfs f1, 0x140(r1)
/* 0000FF6C C0010144 */ lfs f0, 0x144(r1)
/* 0000FF70 C0410148 */ lfs f2, 0x148(r1)
/* 0000FF74 EC210072 */ fmuls f1, f1, f1
/* 0000FF78 EC000032 */ fmuls f0, f0, f0
/* 0000FF7C EC4200B2 */ fmuls f2, f2, f2
/* 0000FF80 EC01002A */ fadds f0, f1, f0
/* 0000FF84 EC22002A */ fadds f1, f2, f0
/* 0000FF88 4BFF01AD */ bl func_8000716C
/* 0000FF8C C05F37E8 */ lfs f2, 0x37e8(r31)
/* 0000FF90 38780010 */ addi r3, r24, 0x10
/* 0000FF94 C0010140 */ lfs f0, 0x140(r1)
/* 0000FF98 EC220072 */ fmuls f1, f2, f1
/* 0000FF9C EC000072 */ fmuls f0, f0, f1
/* 0000FFA0 D0010140 */ stfs f0, 0x140(r1)
/* 0000FFA4 C0010144 */ lfs f0, 0x144(r1)
/* 0000FFA8 EC000072 */ fmuls f0, f0, f1
/* 0000FFAC D0010144 */ stfs f0, 0x144(r1)
/* 0000FFB0 C0010148 */ lfs f0, 0x148(r1)
/* 0000FFB4 EC000072 */ fmuls f0, f0, f1
/* 0000FFB8 D0010148 */ stfs f0, 0x148(r1)
/* 0000FFBC 4BFF0179 */ bl mathutil_mtxA_translate
/* 0000FFC0 38610140 */ addi r3, r1, 0x140
/* 0000FFC4 4BFF0171 */ bl mathutil_mtxA_translate
/* 0000FFC8 C021013C */ lfs f1, 0x13c(r1)
/* 0000FFCC C00F0000 */ lfs f0, 0(r15)
/* 0000FFD0 EC010032 */ fmuls f0, f1, f0
/* 0000FFD4 D001013C */ stfs f0, 0x13c(r1)
/* 0000FFD8 C03F37EC */ lfs f1, 0x37ec(r31)
/* 0000FFDC C041013C */ lfs f2, 0x13c(r1)
/* 0000FFE0 C01F37F0 */ lfs f0, 0x37f0(r31)
/* 0000FFE4 EC211024 */ fdivs f1, f1, f2
/* 0000FFE8 FC010040 */ fcmpo cr0, f1, f0
/* 0000FFEC 40800014 */ bge lbl_00010000
/* 0000FFF0 EC0000B2 */ fmuls f0, f0, f2
/* 0000FFF4 C03F37F4 */ lfs f1, 0x37f4(r31)
/* 0000FFF8 EFC10032 */ fmuls f30, f1, f0
/* 0000FFFC 48000008 */ b lbl_00010004
lbl_00010000:
/* 00010000 C3DF37A8 */ lfs f30, 0x37a8(r31)
lbl_00010004:
/* 00010004 C03F37A8 */ lfs f1, 0x37a8(r31)
/* 00010008 4BFF012D */ bl mathutil_mtxA_scale_s
/* 0001000C FC20F090 */ fmr f1, f30
/* 00010010 4BFF0125 */ bl mathutil_mtxA_scale_s
/* 00010014 C03F3778 */ lfs f1, 0x3778(r31)
/* 00010018 38610130 */ addi r3, r1, 0x130
/* 0001001C C05F37F8 */ lfs f2, 0x37f8(r31)
/* 00010020 FC600890 */ fmr f3, f1
/* 00010024 4BFF0111 */ bl mathutil_mtxA_tf_point_xyz
/* 00010028 C0010134 */ lfs f0, 0x134(r1)
/* 0001002C C03F3778 */ lfs f1, 0x3778(r31)
/* 00010030 FC000840 */ fcmpo cr0, f0, f1
/* 00010034 40800014 */ bge lbl_00010048
/* 00010038 FC000050 */ fneg f0, f0
/* 0001003C FC600890 */ fmr f3, f1
/* 00010040 EC40F024 */ fdivs f2, f0, f30
/* 00010044 4BFF00F1 */ bl mathutil_mtxA_translate_xyz
lbl_00010048:
/* 00010048 38610100 */ addi r3, r1, 0x100
/* 0001004C 4BFF00E9 */ bl mathutil_mtxA_to_mtx
/* 00010050 4BFF00E5 */ bl mathutil_mtxA_from_mtxB
/* 00010054 38610100 */ addi r3, r1, 0x100
/* 00010058 4BFF00DD */ bl mathutil_mtxA_mult_right
/* 0001005C 4BFF00D9 */ bl mathutil_mtxA_sq_from_identity
/* 00010060 C03F37A8 */ lfs f1, 0x37a8(r31)
/* 00010064 4BFF00D1 */ bl mathutil_mtxA_scale_s
/* 00010068 FC20F090 */ fmr f1, f30
/* 0001006C 4BFF00C9 */ bl mathutil_mtxA_scale_s
/* 00010070 C03F3778 */ lfs f1, 0x3778(r31)
/* 00010074 C05F37FC */ lfs f2, 0x37fc(r31)
/* 00010078 FC600890 */ fmr f3, f1
/* 0001007C 4BFF00B9 */ bl mathutil_mtxA_translate_xyz
/* 00010080 80770000 */ lwz r3, 0(r23)
/* 00010084 38800000 */ li r4, 0
/* 00010088 4BFF00AD */ bl GXLoadPosMtxImm
/* 0001008C 80770000 */ lwz r3, 0(r23)
/* 00010090 38800000 */ li r4, 0
/* 00010094 4BFF00A1 */ bl GXLoadNrmMtxImm
/* 00010098 80760000 */ lwz r3, 0(r22)
/* 0001009C 7C159AAE */ lhax r0, r21, r19
/* 000100A0 80630008 */ lwz r3, 8(r3)
/* 000100A4 54001838 */ slwi r0, r0, 3
/* 000100A8 7C63002E */ lwzx r3, r3, r0
/* 000100AC 4BFF0089 */ bl avdisp_draw_model_unculled_sort_translucent
lbl_000100B0:
/* 000100B0 3A100001 */ addi r16, r16, 1
/* 000100B4 2C10000A */ cmpwi r16, 0xa
/* 000100B8 3A730002 */ addi r19, r19, 2
/* 000100BC 3A940068 */ addi r20, r20, 0x68
/* 000100C0 4180FE60 */ blt lbl_0000FF20
lbl_000100C4:
/* 000100C4 3C600000 */ lis r3, lbl_1000000A@ha
/* 000100C8 88030000 */ lbz r0, lbl_1000000A@l(r3)
/* 000100CC 7C000774 */ extsb r0, r0
/* 000100D0 2C000008 */ cmpwi r0, 8
/* 000100D4 4182002C */ beq lbl_00010100
/* 000100D8 2C00000A */ cmpwi r0, 0xa
/* 000100DC 41820024 */ beq lbl_00010100
/* 000100E0 2C000009 */ cmpwi r0, 9
/* 000100E4 4182001C */ beq lbl_00010100
/* 000100E8 2C00000B */ cmpwi r0, 0xb
/* 000100EC 41820014 */ beq lbl_00010100
/* 000100F0 2C00000C */ cmpwi r0, 0xc
/* 000100F4 4182000C */ beq lbl_00010100
/* 000100F8 2C000007 */ cmpwi r0, 7
/* 000100FC 40820350 */ bne lbl_0001044C
lbl_00010100:
/* 00010100 A86E0002 */ lha r3, 2(r14)
/* 00010104 38030400 */ addi r0, r3, 0x400
/* 00010108 B00E0002 */ sth r0, 2(r14)
/* 0001010C A80E0002 */ lha r0, 2(r14)
/* 00010110 2C004000 */ cmpwi r0, 0x4000
/* 00010114 4081000C */ ble lbl_00010120
/* 00010118 3800C000 */ li r0, -16384
/* 0001011C B00E0002 */ sth r0, 2(r14)
lbl_00010120:
/* 00010120 3C600000 */ lis r3, lbl_1000000A@ha
/* 00010124 88030000 */ lbz r0, lbl_1000000A@l(r3)
/* 00010128 2C00000C */ cmpwi r0, 0xc
/* 0001012C 4082000C */ bne lbl_00010138
/* 00010130 3AE00001 */ li r23, 1
/* 00010134 48000008 */ b lbl_0001013C
lbl_00010138:
/* 00010138 3AE00002 */ li r23, 2
lbl_0001013C:
/* 0001013C 3C600000 */ lis r3, minigameGma@ha
/* 00010140 3C800000 */ lis r4, lbl_10000A64@ha
/* 00010144 3D400000 */ lis r10, cameraInfo@ha
/* 00010148 3D200000 */ lis r9, lbl_10009878@ha
/* 0001014C 3D000000 */ lis r8, lbl_10000054@ha
/* 00010150 3CE00000 */ lis r7, lbl_1000000A@ha
/* 00010154 3CC00000 */ lis r6, mathutilData@ha
/* 00010158 3CA00000 */ lis r5, lbl_802F1C32@ha
/* 0001015C 3B430000 */ addi r26, r3, minigameGma@l
/* 00010160 39E40000 */ addi r15, r4, lbl_10000A64@l
/* 00010164 3ACA0000 */ addi r22, r10, cameraInfo@l
/* 00010168 3AA90000 */ addi r21, r9, lbl_10009878@l
/* 0001016C 3A880000 */ addi r20, r8, lbl_10000054@l
/* 00010170 3A670000 */ addi r19, r7, lbl_1000000A@l
/* 00010174 3A460000 */ addi r18, r6, mathutilData@l
/* 00010178 3A250000 */ addi r17, r5, lbl_802F1C32@l
/* 0001017C 3A000000 */ li r16, 0
/* 00010180 3B200000 */ li r25, 0
/* 00010184 480002C0 */ b lbl_00010444
lbl_00010188:
/* 00010188 7F15CA14 */ add r24, r21, r25
/* 0001018C 88180000 */ lbz r0, 0(r24)
/* 00010190 2C000001 */ cmpwi r0, 1
/* 00010194 408202A8 */ bne lbl_0001043C
/* 00010198 C03F37A8 */ lfs f1, 0x37a8(r31)
/* 0001019C FC400890 */ fmr f2, f1
/* 000101A0 FC600890 */ fmr f3, f1
/* 000101A4 4BFEFF91 */ bl set_render_ambient
/* 000101A8 4BFEFF8D */ bl mathutil_mtxA_from_mtxB
/* 000101AC C0360000 */ lfs f1, 0(r22)
/* 000101B0 386100F0 */ addi r3, r1, 0xf0
/* 000101B4 C0180010 */ lfs f0, 0x10(r24)
/* 000101B8 EC010028 */ fsubs f0, f1, f0
/* 000101BC D00100F4 */ stfs f0, 0xf4(r1)
/* 000101C0 C0360004 */ lfs f1, 4(r22)
/* 000101C4 C0180014 */ lfs f0, 0x14(r24)
/* 000101C8 EC010028 */ fsubs f0, f1, f0
/* 000101CC D00100F8 */ stfs f0, 0xf8(r1)
/* 000101D0 C0360008 */ lfs f1, 8(r22)
/* 000101D4 C0180018 */ lfs f0, 0x18(r24)
/* 000101D8 EC010028 */ fsubs f0, f1, f0
/* 000101DC D00100FC */ stfs f0, 0xfc(r1)
/* 000101E0 C02100F4 */ lfs f1, 0xf4(r1)
/* 000101E4 C00100F8 */ lfs f0, 0xf8(r1)
/* 000101E8 C04100FC */ lfs f2, 0xfc(r1)
/* 000101EC EC210072 */ fmuls f1, f1, f1
/* 000101F0 EC000032 */ fmuls f0, f0, f0
/* 000101F4 EC4200B2 */ fmuls f2, f2, f2
/* 000101F8 EC01002A */ fadds f0, f1, f0
/* 000101FC EC22002A */ fadds f1, f2, f0
/* 00010200 4BFEFF35 */ bl func_8000716C
/* 00010204 FFE00890 */ fmr f31, f1
/* 00010208 C00100F4 */ lfs f0, 0xf4(r1)
/* 0001020C 38780010 */ addi r3, r24, 0x10
/* 00010210 EC0007F2 */ fmuls f0, f0, f31
/* 00010214 D00100F4 */ stfs f0, 0xf4(r1)
/* 00010218 C00100F8 */ lfs f0, 0xf8(r1)
/* 0001021C EC0007F2 */ fmuls f0, f0, f31
/* 00010220 D00100F8 */ stfs f0, 0xf8(r1)
/* 00010224 C00100FC */ lfs f0, 0xfc(r1)
/* 00010228 EC0007F2 */ fmuls f0, f0, f31
/* 0001022C D00100FC */ stfs f0, 0xfc(r1)
/* 00010230 4BFEFF05 */ bl mathutil_mtxA_translate
/* 00010234 C02100F0 */ lfs f1, 0xf0(r1)
/* 00010238 C01F3774 */ lfs f0, 0x3774(r31)
/* 0001023C C0740000 */ lfs f3, 0(r20)
/* 00010240 EC810028 */ fsubs f4, f1, f0
/* 00010244 C02100F4 */ lfs f1, 0xf4(r1)
/* 00010248 C04100F8 */ lfs f2, 0xf8(r1)
/* 0001024C C00100FC */ lfs f0, 0xfc(r1)
/* 00010250 EC6400F2 */ fmuls f3, f4, f3
/* 00010254 D06100F0 */ stfs f3, 0xf0(r1)
/* 00010258 C0C100F0 */ lfs f6, 0xf0(r1)
/* 0001025C C09F37F0 */ lfs f4, 0x37f0(r31)
/* 00010260 C07F3774 */ lfs f3, 0x3774(r31)
/* 00010264 EC8401B2 */ fmuls f4, f4, f6
/* 00010268 C0BF37F4 */ lfs f5, 0x37f4(r31)
/* 0001026C EC230072 */ fmuls f1, f3, f1
/* 00010270 EC4300B2 */ fmuls f2, f3, f2
/* 00010274 EFC50132 */ fmuls f30, f5, f4
/* 00010278 EC630032 */ fmuls f3, f3, f0
/* 0001027C 4BFEFEB9 */ bl mathutil_mtxA_translate_xyz
/* 00010280 C01F3774 */ lfs f0, 0x3774(r31)
/* 00010284 C03F37A8 */ lfs f1, 0x37a8(r31)
/* 00010288 EC0007F2 */ fmuls f0, f0, f31
/* 0001028C EFE10028 */ fsubs f31, f1, f0
/* 00010290 FC20F890 */ fmr f1, f31
/* 00010294 4BFEFEA1 */ bl mathutil_mtxA_scale_s
/* 00010298 4BFEFE9D */ bl mathutil_mtxA_sq_from_identity
/* 0001029C C03F37A8 */ lfs f1, 0x37a8(r31)
/* 000102A0 4BFEFE95 */ bl mathutil_mtxA_scale_s
/* 000102A4 88130000 */ lbz r0, 0(r19)
/* 000102A8 2C000007 */ cmpwi r0, 7
/* 000102AC 41820010 */ beq lbl_000102BC
/* 000102B0 C03F37A8 */ lfs f1, 0x37a8(r31)
/* 000102B4 C05F3778 */ lfs f2, 0x3778(r31)
/* 000102B8 4BFEFE7D */ bl mathutil_mtxA_rotate_z_sin_cos
lbl_000102BC:
/* 000102BC C03F3778 */ lfs f1, 0x3778(r31)
/* 000102C0 C01F37BC */ lfs f0, 0x37bc(r31)
/* 000102C4 FC600890 */ fmr f3, f1
/* 000102C8 EC4007F2 */ fmuls f2, f0, f31
/* 000102CC 4BFEFE69 */ bl mathutil_mtxA_translate_xyz
/* 000102D0 FC20F090 */ fmr f1, f30
/* 000102D4 4BFEFE61 */ bl mathutil_mtxA_scale_s
/* 000102D8 4BFEFE5D */ bl mathutil_mtxA_push
/* 000102DC A86E0002 */ lha r3, 2(r14)
/* 000102E0 38634000 */ addi r3, r3, 0x4000
/* 000102E4 4BFEFE51 */ bl mathutil_sin
/* 000102E8 C05F37A8 */ lfs f2, 0x37a8(r31)
/* 000102EC FC601090 */ fmr f3, f2
/* 000102F0 4BFEFE45 */ bl mathutil_mtxA_scale_xyz
/* 000102F4 80720000 */ lwz r3, 0(r18)
/* 000102F8 38800000 */ li r4, 0
/* 000102FC 4BFEFE39 */ bl GXLoadPosMtxImm
/* 00010300 80720000 */ lwz r3, 0(r18)
/* 00010304 38800000 */ li r4, 0
/* 00010308 4BFEFE2D */ bl GXLoadNrmMtxImm
/* 0001030C 88130000 */ lbz r0, 0(r19)
/* 00010310 2C00000C */ cmpwi r0, 0xc
/* 00010314 40820010 */ bne lbl_00010324
/* 00010318 8B110000 */ lbz r24, 0(r17)
/* 0001031C 7F180774 */ extsb r24, r24
/* 00010320 48000008 */ b lbl_00010328
lbl_00010324:
/* 00010324 7E188378 */ mr r24, r16
lbl_00010328:
/* 00010328 1C180006 */ mulli r0, r24, 6
/* 0001032C 7C6F0214 */ add r3, r15, r0
/* 00010330 88030002 */ lbz r0, 2(r3)
/* 00010334 7C000775 */ extsb. r0, r0
/* 00010338 40820030 */ bne lbl_00010368
/* 0001033C 2C180000 */ cmpwi r24, 0
/* 00010340 40820018 */ bne lbl_00010358
/* 00010344 C05F3778 */ lfs f2, 0x3778(r31)
/* 00010348 C03F37A8 */ lfs f1, 0x37a8(r31)
/* 0001034C FC601090 */ fmr f3, f2
/* 00010350 4BFEFDE5 */ bl set_render_ambient
/* 00010354 48000014 */ b lbl_00010368
lbl_00010358:
/* 00010358 C03F3778 */ lfs f1, 0x3778(r31)
/* 0001035C C07F37A8 */ lfs f3, 0x37a8(r31)
/* 00010360 FC400890 */ fmr f2, f1
/* 00010364 4BFEFDD1 */ bl set_render_ambient
lbl_00010368:
/* 00010368 807A0000 */ lwz r3, 0(r26)
/* 0001036C 80630008 */ lwz r3, 8(r3)
/* 00010370 80630068 */ lwz r3, 0x68(r3)
/* 00010374 4BFEFDC1 */ bl avdisp_draw_model_unculled_sort_translucent
/* 00010378 4BFEFDBD */ bl mathutil_mtxA_pop
/* 0001037C 88130000 */ lbz r0, 0(r19)
/* 00010380 2C000007 */ cmpwi r0, 7
/* 00010384 41820048 */ beq lbl_000103CC
/* 00010388 C03F37A4 */ lfs f1, 0x37a4(r31)
/* 0001038C C05F3778 */ lfs f2, 0x3778(r31)
/* 00010390 4BFEFDA5 */ bl mathutil_mtxA_rotate_z_sin_cos
/* 00010394 1C180006 */ mulli r0, r24, 6
/* 00010398 7C6F0214 */ add r3, r15, r0
/* 0001039C 88030002 */ lbz r0, 2(r3)
/* 000103A0 7C000775 */ extsb. r0, r0
/* 000103A4 40820018 */ bne lbl_000103BC
/* 000103A8 C03F3800 */ lfs f1, 0x3800(r31)
/* 000103AC C07F3778 */ lfs f3, 0x3778(r31)
/* 000103B0 FC400890 */ fmr f2, f1
/* 000103B4 4BFEFD81 */ bl mathutil_mtxA_translate_xyz
/* 000103B8 48000014 */ b lbl_000103CC
lbl_000103BC:
/* 000103BC C03F3804 */ lfs f1, 0x3804(r31)
/* 000103C0 C05F3800 */ lfs f2, 0x3800(r31)
/* 000103C4 C07F3778 */ lfs f3, 0x3778(r31)
/* 000103C8 4BFEFD6D */ bl mathutil_mtxA_translate_xyz
lbl_000103CC:
/* 000103CC 4BFEFD69 */ bl apply_curr_light_group_ambient
/* 000103D0 80720000 */ lwz r3, 0(r18)
/* 000103D4 38800000 */ li r4, 0
/* 000103D8 4BFEFD5D */ bl GXLoadPosMtxImm
/* 000103DC 80720000 */ lwz r3, 0(r18)
/* 000103E0 38800000 */ li r4, 0
/* 000103E4 4BFEFD51 */ bl GXLoadNrmMtxImm
/* 000103E8 1C180006 */ mulli r0, r24, 6
/* 000103EC 7C6F0214 */ add r3, r15, r0
/* 000103F0 88030002 */ lbz r0, 2(r3)
/* 000103F4 7C000775 */ extsb. r0, r0
/* 000103F8 41820018 */ beq lbl_00010410
/* 000103FC 807A0000 */ lwz r3, 0(r26)
/* 00010400 80630008 */ lwz r3, 8(r3)
/* 00010404 80630180 */ lwz r3, 0x180(r3)
/* 00010408 4BFEFD2D */ bl avdisp_draw_model_unculled_sort_translucent
/* 0001040C 48000030 */ b lbl_0001043C
lbl_00010410:
/* 00010410 2C180000 */ cmpwi r24, 0
/* 00010414 40820018 */ bne lbl_0001042C
/* 00010418 807A0000 */ lwz r3, 0(r26)
/* 0001041C 80630008 */ lwz r3, 8(r3)
/* 00010420 80630160 */ lwz r3, 0x160(r3)
/* 00010424 4BFEFD11 */ bl avdisp_draw_model_unculled_sort_translucent
/* 00010428 48000014 */ b lbl_0001043C
lbl_0001042C:
/* 0001042C 807A0000 */ lwz r3, 0(r26)
/* 00010430 80630008 */ lwz r3, 8(r3)
/* 00010434 80630168 */ lwz r3, 0x168(r3)
/* 00010438 4BFEFCFD */ bl avdisp_draw_model_unculled_sort_translucent
lbl_0001043C:
/* 0001043C 3A100001 */ addi r16, r16, 1
/* 00010440 3B390068 */ addi r25, r25, 0x68
lbl_00010444:
/* 00010444 7C10B800 */ cmpw r16, r23
/* 00010448 4180FD40 */ blt lbl_00010188
lbl_0001044C:
/* 0001044C 4BFEFCE9 */ bl mathutil_mtxA_from_mtxB
/* 00010450 3C600000 */ lis r3, mathutilData@ha
/* 00010454 39C30000 */ addi r14, r3, mathutilData@l
/* 00010458 806E0000 */ lwz r3, 0(r14)
/* 0001045C 38800000 */ li r4, 0
/* 00010460 4BFEFCD5 */ bl GXLoadPosMtxImm
/* 00010464 806E0000 */ lwz r3, 0(r14)
/* 00010468 38800000 */ li r4, 0
/* 0001046C 4BFEFCC9 */ bl GXLoadNrmMtxImm
/* 00010470 3C600000 */ lis r3, cameraInfo@ha
/* 00010474 C01F3808 */ lfs f0, 0x3808(r31)
/* 00010478 38630000 */ addi r3, r3, cameraInfo@l
/* 0001047C C0230004 */ lfs f1, 4(r3)
/* 00010480 FC010040 */ fcmpo cr0, f1, f0
/* 00010484 4080001C */ bge lbl_000104A0
/* 00010488 3C600000 */ lis r3, minigameGma@ha
/* 0001048C 38630000 */ addi r3, r3, minigameGma@l
/* 00010490 80630000 */ lwz r3, 0(r3)
/* 00010494 80630008 */ lwz r3, 8(r3)
/* 00010498 806300E0 */ lwz r3, 0xe0(r3)
/* 0001049C 4BFEFC99 */ bl avdisp_draw_model_unculled_sort_translucent
lbl_000104A0:
/* 000104A0 3C600000 */ lis r3, cameraInfo@ha
/* 000104A4 38630000 */ addi r3, r3, cameraInfo@l
/* 000104A8 A003001A */ lhz r0, 0x1a(r3)
/* 000104AC 28008000 */ cmplwi r0, 0x8000
/* 000104B0 4180000C */ blt lbl_000104BC
/* 000104B4 2800C000 */ cmplwi r0, 0xc000
/* 000104B8 4081001C */ ble lbl_000104D4
lbl_000104BC:
/* 000104BC 3C600000 */ lis r3, minigameGma@ha
/* 000104C0 38630000 */ addi r3, r3, minigameGma@l
/* 000104C4 80630000 */ lwz r3, 0(r3)
/* 000104C8 80630008 */ lwz r3, 8(r3)
/* 000104CC 806300E8 */ lwz r3, 0xe8(r3)
/* 000104D0 4BFEFC65 */ bl avdisp_draw_model_unculled_sort_translucent
lbl_000104D4:
/* 000104D4 3C600000 */ lis r3, cameraInfo@ha
/* 000104D8 38630000 */ addi r3, r3, cameraInfo@l
/* 000104DC A003001A */ lhz r0, 0x1a(r3)
/* 000104E0 2800C000 */ cmplwi r0, 0xc000
/* 000104E4 4080001C */ bge lbl_00010500
/* 000104E8 3C600000 */ lis r3, minigameGma@ha
/* 000104EC 38630000 */ addi r3, r3, minigameGma@l
/* 000104F0 80630000 */ lwz r3, 0(r3)
/* 000104F4 80630008 */ lwz r3, 8(r3)
/* 000104F8 806300F8 */ lwz r3, 0xf8(r3)
/* 000104FC 4BFEFC39 */ bl avdisp_draw_model_unculled_sort_translucent
lbl_00010500:
/* 00010500 3C600000 */ lis r3, cameraInfo@ha
/* 00010504 38630000 */ addi r3, r3, cameraInfo@l
/* 00010508 A003001A */ lhz r0, 0x1a(r3)
/* 0001050C 28004000 */ cmplwi r0, 0x4000
/* 00010510 4081001C */ ble lbl_0001052C
/* 00010514 3C600000 */ lis r3, minigameGma@ha
/* 00010518 38630000 */ addi r3, r3, minigameGma@l
/* 0001051C 80630000 */ lwz r3, 0(r3)
/* 00010520 80630008 */ lwz r3, 8(r3)
/* 00010524 80630100 */ lwz r3, 0x100(r3)
/* 00010528 4BFEFC0D */ bl avdisp_draw_model_unculled_sort_translucent
lbl_0001052C:
/* 0001052C 3C600000 */ lis r3, cameraInfo@ha
/* 00010530 38630000 */ addi r3, r3, cameraInfo@l
/* 00010534 A003001A */ lhz r0, 0x1a(r3)
/* 00010538 28004000 */ cmplwi r0, 0x4000
/* 0001053C 4180000C */ blt lbl_00010548
/* 00010540 28008000 */ cmplwi r0, 0x8000
/* 00010544 4081001C */ ble lbl_00010560
lbl_00010548:
/* 00010548 3C600000 */ lis r3, minigameGma@ha
/* 0001054C 38630000 */ addi r3, r3, minigameGma@l
/* 00010550 80630000 */ lwz r3, 0(r3)
/* 00010554 80630008 */ lwz r3, 8(r3)
/* 00010558 80630108 */ lwz r3, 0x108(r3)
/* 0001055C 4BFEFBD9 */ bl avdisp_draw_model_unculled_sort_translucent
lbl_00010560:
/* 00010560 3C600000 */ lis r3, cameraInfo@ha
/* 00010564 38630000 */ addi r3, r3, cameraInfo@l
/* 00010568 A003001A */ lhz r0, 0x1a(r3)
/* 0001056C 28006000 */ cmplwi r0, 0x6000
/* 00010570 4180000C */ blt lbl_0001057C
/* 00010574 2800A000 */ cmplwi r0, 0xa000
/* 00010578 4081001C */ ble lbl_00010594
lbl_0001057C:
/* 0001057C 3C600000 */ lis r3, minigameGma@ha
/* 00010580 38630000 */ addi r3, r3, minigameGma@l
/* 00010584 80630000 */ lwz r3, 0(r3)
/* 00010588 80630008 */ lwz r3, 8(r3)
/* 0001058C 80630110 */ lwz r3, 0x110(r3)
/* 00010590 4BFEFBA5 */ bl avdisp_draw_model_unculled_sort_translucent
lbl_00010594:
/* 00010594 3C600000 */ lis r3, eventInfo@ha
/* 00010598 38630000 */ addi r3, r3, eventInfo@l
/* 0001059C 880301C8 */ lbz r0, 0x1c8(r3)
/* 000105A0 2C000002 */ cmpwi r0, 2
/* 000105A4 40820018 */ bne lbl_000105BC
/* 000105A8 C03F380C */ lfs f1, 0x380c(r31)
/* 000105AC 4BFEFB89 */ bl ord_tbl_set_depth_offset
/* 000105B0 4BFEFB85 */ bl background_draw
/* 000105B4 C03F3778 */ lfs f1, 0x3778(r31)
/* 000105B8 4BFEFB7D */ bl ord_tbl_set_depth_offset
lbl_000105BC:
/* 000105BC 7FC3F378 */ mr r3, r30
/* 000105C0 48000BF5 */ bl lbl_000111B4
/* 000105C4 4BFEFB71 */ bl ord_tbl_draw_nodes
/* 000105C8 4800102D */ bl lbl_000115F4
/* 000105CC 38600001 */ li r3, 1
/* 000105D0 4BFEFB65 */ bl change_current_camera
/* 000105D4 C03F37A8 */ lfs f1, 0x37a8(r31)
/* 000105D8 FC400890 */ fmr f2, f1
/* 000105DC FC600890 */ fmr f3, f1
/* 000105E0 4BFEFB55 */ bl set_render_ambient
/* 000105E4 38600000 */ li r3, 0
/* 000105E8 38800007 */ li r4, 7
/* 000105EC 38A00000 */ li r5, 0
/* 000105F0 4BFEFB45 */ bl avdisp_set_z_mode
/* 000105F4 3C600000 */ lis r3, lbl_10000013@ha
/* 000105F8 38630000 */ addi r3, r3, lbl_10000013@l
/* 000105FC 88630000 */ lbz r3, 0(r3)
/* 00010600 7C600775 */ extsb. r0, r3
/* 00010604 40810100 */ ble lbl_00010704
/* 00010608 7C600774 */ extsb r0, r3
/* 0001060C C05F3810 */ lfs f2, 0x3810(r31)
/* 00010610 2000001E */ subfic r0, r0, 0x1e
/* 00010614 6C008000 */ xoris r0, r0, 0x8000
/* 00010618 900102B4 */ stw r0, 0x2b4(r1)
/* 0001061C 3E804330 */ lis r20, 0x4330
/* 00010620 3C600000 */ lis r3, lbl_00020848@ha
/* 00010624 928102B0 */ stw r20, 0x2b0(r1)
/* 00010628 3C800000 */ lis r4, mathutilData@ha
/* 0001062C C8230000 */ lfd f1, lbl_00020848@l(r3)
/* 00010630 3C600000 */ lis r3, commonGma@ha
/* 00010634 C80102B0 */ lfd f0, 0x2b0(r1)
/* 00010638 3A610248 */ addi r19, r1, 0x248
/* 0001063C EC000828 */ fsubs f0, f0, f1
/* 00010640 3A440000 */ addi r18, r4, mathutilData@l
/* 00010644 3A230000 */ addi r17, r3, commonGma@l
/* 00010648 39E1024C */ addi r15, r1, 0x24c
/* 0001064C EFE20032 */ fmuls f31, f2, f0
/* 00010650 3A000000 */ li r16, 0
/* 00010654 39C00000 */ li r14, 0
lbl_00010658:
/* 00010658 6E008000 */ xoris r0, r16, 0x8000
/* 0001065C C05F3814 */ lfs f2, 0x3814(r31)
/* 00010660 900102B4 */ stw r0, 0x2b4(r1)
/* 00010664 3C600000 */ lis r3, lbl_00020848@ha
/* 00010668 C8230000 */ lfd f1, lbl_00020848@l(r3)
/* 0001066C 928102B0 */ stw r20, 0x2b0(r1)
/* 00010670 C80102B0 */ lfd f0, 0x2b0(r1)
/* 00010674 EC000828 */ fsubs f0, f0, f1
/* 00010678 EFC20032 */ fmuls f30, f2, f0
/* 0001067C 4BFEFAB9 */ bl mathutil_mtxA_from_identity
/* 00010680 EC1E07F2 */ fmuls f0, f30, f31
/* 00010684 C03F381C */ lfs f1, 0x381c(r31)
/* 00010688 C05F3820 */ lfs f2, 0x3820(r31)
/* 0001068C C09F3818 */ lfs f4, 0x3818(r31)
/* 00010690 EC210032 */ fmuls f1, f1, f0
/* 00010694 EC020032 */ fmuls f0, f2, f0
/* 00010698 C07F37A4 */ lfs f3, 0x37a4(r31)
/* 0001069C EC24082A */ fadds f1, f4, f1
/* 000106A0 EC420028 */ fsubs f2, f2, f0
/* 000106A4 4BFEFA91 */ bl mathutil_mtxA_translate_xyz
/* 000106A8 C03F3824 */ lfs f1, 0x3824(r31)
/* 000106AC 7C13742E */ lfsx f0, r19, r14
/* 000106B0 EC210032 */ fmuls f1, f1, f0
/* 000106B4 4BFEFA81 */ bl mathutil_mtxA_scale_s
/* 000106B8 C03F37C8 */ lfs f1, 0x37c8(r31)
/* 000106BC 4BFEFA79 */ bl avdisp_set_alpha
/* 000106C0 80720000 */ lwz r3, 0(r18)
/* 000106C4 38800000 */ li r4, 0
/* 000106C8 4BFEFA6D */ bl GXLoadPosMtxImm
/* 000106CC 80720000 */ lwz r3, 0(r18)
/* 000106D0 38800000 */ li r4, 0
/* 000106D4 4BFEFA61 */ bl GXLoadNrmMtxImm
/* 000106D8 80710000 */ lwz r3, 0(r17)
/* 000106DC 7C0F72AE */ lhax r0, r15, r14
/* 000106E0 80630008 */ lwz r3, 8(r3)
/* 000106E4 54001838 */ slwi r0, r0, 3
/* 000106E8 7C63002E */ lwzx r3, r3, r0
/* 000106EC 4BFEFA49 */ bl avdisp_draw_model_unculled_sort_none
/* 000106F0 3A100001 */ addi r16, r16, 1
/* 000106F4 2C10000D */ cmpwi r16, 0xd
/* 000106F8 39CE0008 */ addi r14, r14, 8
/* 000106FC 4180FF5C */ blt lbl_00010658
/* 00010700 48000110 */ b lbl_00010810
lbl_00010704:
/* 00010704 7C600775 */ extsb. r0, r3
/* 00010708 40800108 */ bge lbl_00010810
/* 0001070C 7C600774 */ extsb r0, r3
/* 00010710 C05F3810 */ lfs f2, 0x3810(r31)
/* 00010714 7C0000D0 */ neg r0, r0
/* 00010718 6C008000 */ xoris r0, r0, 0x8000
/* 0001071C 900102B4 */ stw r0, 0x2b4(r1)
/* 00010720 3DC04330 */ lis r14, 0x4330
/* 00010724 3C600000 */ lis r3, lbl_00020848@ha
/* 00010728 91C102B0 */ stw r14, 0x2b0(r1)
/* 0001072C 3C800000 */ lis r4, mathutilData@ha
/* 00010730 C8230000 */ lfd f1, lbl_00020848@l(r3)
/* 00010734 3C600000 */ lis r3, commonGma@ha
/* 00010738 C80102B0 */ lfd f0, 0x2b0(r1)
/* 0001073C 3A810248 */ addi r20, r1, 0x248
/* 00010740 EC000828 */ fsubs f0, f0, f1
/* 00010744 3A640000 */ addi r19, r4, mathutilData@l
/* 00010748 3A430000 */ addi r18, r3, commonGma@l
/* 0001074C 3A21024C */ addi r17, r1, 0x24c
/* 00010750 EFE20032 */ fmuls f31, f2, f0
/* 00010754 3A000000 */ li r16, 0
/* 00010758 39E00000 */ li r15, 0
lbl_0001075C:
/* 0001075C 3810FFFA */ addi r0, r16, -6
/* 00010760 C05F3828 */ lfs f2, 0x3828(r31)
/* 00010764 6C008000 */ xoris r0, r0, 0x8000
/* 00010768 900102B4 */ stw r0, 0x2b4(r1)
/* 0001076C 3C600000 */ lis r3, lbl_00020848@ha
/* 00010770 C8230000 */ lfd f1, lbl_00020848@l(r3)
/* 00010774 91C102B0 */ stw r14, 0x2b0(r1)
/* 00010778 C80102B0 */ lfd f0, 0x2b0(r1)
/* 0001077C EC000828 */ fsubs f0, f0, f1
/* 00010780 EFC20032 */ fmuls f30, f2, f0
/* 00010784 4BFEF9B1 */ bl mathutil_mtxA_from_identity
/* 00010788 EC3E07F2 */ fmuls f1, f30, f31
/* 0001078C C01F3820 */ lfs f0, 0x3820(r31)
/* 00010790 C07F381C */ lfs f3, 0x381c(r31)
/* 00010794 C05F37C8 */ lfs f2, 0x37c8(r31)
/* 00010798 EC000072 */ fmuls f0, f0, f1
/* 0001079C EC230072 */ fmuls f1, f3, f1
/* 000107A0 C07F37A4 */ lfs f3, 0x37a4(r31)
/* 000107A4 EC420032 */ fmuls f2, f2, f0
/* 000107A8 4BFEF98D */ bl mathutil_mtxA_translate_xyz
/* 000107AC C03F3824 */ lfs f1, 0x3824(r31)
/* 000107B0 7C147C2E */ lfsx f0, r20, r15
/* 000107B4 EC210032 */ fmuls f1, f1, f0
/* 000107B8 4BFEF97D */ bl mathutil_mtxA_scale_s
/* 000107BC C01F37A8 */ lfs f0, 0x37a8(r31)
/* 000107C0 C03F37C8 */ lfs f1, 0x37c8(r31)
/* 000107C4 EC00F828 */ fsubs f0, f0, f31
/* 000107C8 EC210032 */ fmuls f1, f1, f0
/* 000107CC 4BFEF969 */ bl avdisp_set_alpha
/* 000107D0 80730000 */ lwz r3, 0(r19)
/* 000107D4 38800000 */ li r4, 0
/* 000107D8 4BFEF95D */ bl GXLoadPosMtxImm
/* 000107DC 80730000 */ lwz r3, 0(r19)
/* 000107E0 38800000 */ li r4, 0
/* 000107E4 4BFEF951 */ bl GXLoadNrmMtxImm
/* 000107E8 80720000 */ lwz r3, 0(r18)
/* 000107EC 7C117AAE */ lhax r0, r17, r15
/* 000107F0 80630008 */ lwz r3, 8(r3)
/* 000107F4 54001838 */ slwi r0, r0, 3
/* 000107F8 7C63002E */ lwzx r3, r3, r0
/* 000107FC 4BFEF939 */ bl avdisp_draw_model_unculled_sort_none
/* 00010800 3A100001 */ addi r16, r16, 1
/* 00010804 2C10000D */ cmpwi r16, 0xd
/* 00010808 39EF0008 */ addi r15, r15, 8
/* 0001080C 4180FF50 */ blt lbl_0001075C
lbl_00010810:
/* 00010810 3C600000 */ lis r3, lbl_1000000A@ha
/* 00010814 88030000 */ lbz r0, lbl_1000000A@l(r3)
/* 00010818 7C000774 */ extsb r0, r0
/* 0001081C 2C000012 */ cmpwi r0, 0x12
/* 00010820 41820044 */ beq lbl_00010864
/* 00010824 2C000011 */ cmpwi r0, 0x11
/* 00010828 4182003C */ beq lbl_00010864
/* 0001082C 2C00000E */ cmpwi r0, 0xe
/* 00010830 41820034 */ beq lbl_00010864
/* 00010834 2C00000F */ cmpwi r0, 0xf
/* 00010838 4182002C */ beq lbl_00010864
/* 0001083C 2C000010 */ cmpwi r0, 0x10
/* 00010840 41820024 */ beq lbl_00010864
/* 00010844 2C000008 */ cmpwi r0, 8
/* 00010848 4182001C */ beq lbl_00010864
/* 0001084C 2C000009 */ cmpwi r0, 9
/* 00010850 41820014 */ beq lbl_00010864
/* 00010854 2C00000A */ cmpwi r0, 0xa
/* 00010858 4182000C */ beq lbl_00010864
/* 0001085C 2C00000B */ cmpwi r0, 0xb
/* 00010860 40820410 */ bne lbl_00010C70
lbl_00010864:
/* 00010864 3C600000 */ lis r3, lbl_1000000A@ha
/* 00010868 88030000 */ lbz r0, lbl_1000000A@l(r3)
/* 0001086C 7C000774 */ extsb r0, r0
/* 00010870 2C000011 */ cmpwi r0, 0x11
/* 00010874 4182001C */ beq lbl_00010890
/* 00010878 2C000012 */ cmpwi r0, 0x12
/* 0001087C 41820014 */ beq lbl_00010890
/* 00010880 2C000008 */ cmpwi r0, 8
/* 00010884 4182000C */ beq lbl_00010890
/* 00010888 2C000018 */ cmpwi r0, 0x18
/* 0001088C 408203E4 */ bne lbl_00010C70
lbl_00010890:
/* 00010890 3C600000 */ lis r3, lbl_1000000A@ha
/* 00010894 88030000 */ lbz r0, lbl_1000000A@l(r3)
/* 00010898 7C000774 */ extsb r0, r0
/* 0001089C 2C000008 */ cmpwi r0, 8
/* 000108A0 4182000C */ beq lbl_000108AC
/* 000108A4 2C000018 */ cmpwi r0, 0x18
/* 000108A8 4082000C */ bne lbl_000108B4
lbl_000108AC:
/* 000108AC 39E00002 */ li r15, 2
/* 000108B0 48000008 */ b lbl_000108B8
lbl_000108B4:
/* 000108B4 39E00001 */ li r15, 1
lbl_000108B8:
/* 000108B8 3CE00000 */ lis r7, powerOnTimer@ha
/* 000108BC 3CC00000 */ lis r6, lbl_10000058@ha
/* 000108C0 3CA00000 */ lis r5, lbl_1000005C@ha
/* 000108C4 3C800000 */ lis r4, mathutilData@ha
/* 000108C8 3C600000 */ lis r3, minigameGma@ha
/* 000108CC 3D200000 */ lis r9, lbl_10009878@ha
/* 000108D0 3D000000 */ lis r8, s_somethingLightRelated@ha
/* 000108D4 3D400000 */ lis r10, lbl_10000004@ha
/* 000108D8 3D800000 */ lis r12, lbl_1000000A@ha
/* 000108DC 3D600000 */ lis r11, lbl_10000064@ha
/* 000108E0 3AE70000 */ addi r23, r7, powerOnTimer@l
/* 000108E4 3B260000 */ addi r25, r6, lbl_10000058@l
/* 000108E8 39C50000 */ addi r14, r5, lbl_1000005C@l
/* 000108EC 3B440000 */ addi r26, r4, mathutilData@l
/* 000108F0 3B630000 */ addi r27, r3, minigameGma@l
/* 000108F4 3A890000 */ addi r20, r9, lbl_10009878@l
/* 000108F8 3AC80000 */ addi r22, r8, s_somethingLightRelated@l
/* 000108FC 3A6A0000 */ addi r19, r10, lbl_10000004@l
/* 00010900 3A2C0000 */ addi r17, r12, lbl_1000000A@l
/* 00010904 3A4B0000 */ addi r18, r11, lbl_10000064@l
/* 00010908 3A000000 */ li r16, 0
/* 0001090C 3BA00000 */ li r29, 0
/* 00010910 3B800000 */ li r28, 0
/* 00010914 3F004330 */ lis r24, 0x4330
/* 00010918 48000350 */ b lbl_00010C68
lbl_0001091C:
/* 0001091C 88110000 */ lbz r0, 0(r17)
/* 00010920 2C000008 */ cmpwi r0, 8
/* 00010924 40820014 */ bne lbl_00010938
/* 00010928 7C74E214 */ add r3, r20, r28
/* 0001092C 88030001 */ lbz r0, 1(r3)
/* 00010930 7C000775 */ extsb. r0, r0
/* 00010934 40820328 */ bne lbl_00010C5C
lbl_00010938:
/* 00010938 7C74E214 */ add r3, r20, r28
/* 0001093C 38630044 */ addi r3, r3, 0x44
/* 00010940 4BFEF7F5 */ bl mathutil_mtxA_from_quat
/* 00010944 386100C0 */ addi r3, r1, 0xc0
/* 00010948 4BFEF7ED */ bl mathutil_mtxA_to_mtx
/* 0001094C 4BFEF7E9 */ bl mathutil_mtxA_from_identity
/* 00010950 88110000 */ lbz r0, 0(r17)
/* 00010954 7C000774 */ extsb r0, r0
/* 00010958 2C000008 */ cmpwi r0, 8
/* 0001095C 40820034 */ bne lbl_00010990
/* 00010960 2C100000 */ cmpwi r16, 0
/* 00010964 40820018 */ bne lbl_0001097C
/* 00010968 C03F382C */ lfs f1, 0x382c(r31)
/* 0001096C C05F3830 */ lfs f2, 0x3830(r31)
/* 00010970 C07F3834 */ lfs f3, 0x3834(r31)
/* 00010974 4BFEF7C1 */ bl mathutil_mtxA_translate_xyz
/* 00010978 48000060 */ b lbl_000109D8
lbl_0001097C:
/* 0001097C C03F3838 */ lfs f1, 0x3838(r31)
/* 00010980 C05F3830 */ lfs f2, 0x3830(r31)
/* 00010984 C07F3834 */ lfs f3, 0x3834(r31)
/* 00010988 4BFEF7AD */ bl mathutil_mtxA_translate_xyz
/* 0001098C 4800004C */ b lbl_000109D8
lbl_00010990:
/* 00010990 2C000018 */ cmpwi r0, 0x18
/* 00010994 40820034 */ bne lbl_000109C8
/* 00010998 2C100000 */ cmpwi r16, 0
/* 0001099C 40820018 */ bne lbl_000109B4
/* 000109A0 C03F3794 */ lfs f1, 0x3794(r31)
/* 000109A4 C05F383C */ lfs f2, 0x383c(r31)
/* 000109A8 C07F3834 */ lfs f3, 0x3834(r31)
/* 000109AC 4BFEF789 */ bl mathutil_mtxA_translate_xyz
/* 000109B0 48000028 */ b lbl_000109D8
lbl_000109B4:
/* 000109B4 C03F3840 */ lfs f1, 0x3840(r31)
/* 000109B8 C05F383C */ lfs f2, 0x383c(r31)
/* 000109BC C07F3834 */ lfs f3, 0x3834(r31)
/* 000109C0 4BFEF775 */ bl mathutil_mtxA_translate_xyz
/* 000109C4 48000014 */ b lbl_000109D8
lbl_000109C8:
/* 000109C8 C03F3778 */ lfs f1, 0x3778(r31)
/* 000109CC C05F3830 */ lfs f2, 0x3830(r31)
/* 000109D0 C07F3834 */ lfs f3, 0x3834(r31)
/* 000109D4 4BFEF761 */ bl mathutil_mtxA_translate_xyz
lbl_000109D8:
/* 000109D8 C03F3844 */ lfs f1, 0x3844(r31)
/* 000109DC C07F3848 */ lfs f3, 0x3848(r31)
/* 000109E0 FC400890 */ fmr f2, f1
/* 000109E4 4BFEF751 */ bl mathutil_mtxA_scale_xyz
/* 000109E8 4BFEF74D */ bl mathutil_mtxA_push
/* 000109EC C03F37A8 */ lfs f1, 0x37a8(r31)
/* 000109F0 C05F3778 */ lfs f2, 0x3778(r31)
/* 000109F4 4BFEF741 */ bl mathutil_mtxA_rotate_y_sin_cos
/* 000109F8 7CB4E214 */ add r5, r20, r28
/* 000109FC 80850034 */ lwz r4, 0x34(r5)
/* 00010A00 386100B4 */ addi r3, r1, 0xb4
/* 00010A04 80050038 */ lwz r0, 0x38(r5)
/* 00010A08 908100B4 */ stw r4, 0xb4(r1)
/* 00010A0C 900100B8 */ stw r0, 0xb8(r1)
/* 00010A10 8005003C */ lwz r0, 0x3c(r5)
/* 00010A14 900100BC */ stw r0, 0xbc(r1)
/* 00010A18 4BFEF71D */ bl mathutil_vec_normalize_len
/* 00010A1C C02100BC */ lfs f1, 0xbc(r1)
/* 00010A20 C04100B4 */ lfs f2, 0xb4(r1)
/* 00010A24 4BFEF711 */ bl mathutil_mtxA_rotate_y_sin_cos
/* 00010A28 4BFEF70D */ bl mathutil_mtxA_push
/* 00010A2C 7C72EA14 */ add r3, r18, r29
/* 00010A30 80030000 */ lwz r0, 0(r3)
/* 00010A34 2C00FFFF */ cmpwi r0, -1
/* 00010A38 418200E0 */ beq lbl_00010B18
/* 00010A3C 88130000 */ lbz r0, 0(r19)
/* 00010A40 7C000775 */ extsb. r0, r0
/* 00010A44 41820024 */ beq lbl_00010A68
/* 00010A48 7FC00775 */ extsb. r0, r30
/* 00010A4C 4082000C */ bne lbl_00010A58
/* 00010A50 2C100000 */ cmpwi r16, 0
/* 00010A54 41820014 */ beq lbl_00010A68
lbl_00010A58:
/* 00010A58 7FC00775 */ extsb. r0, r30
/* 00010A5C 418200BC */ beq lbl_00010B18
/* 00010A60 2C100001 */ cmpwi r16, 1
/* 00010A64 418100B4 */ bgt lbl_00010B18
lbl_00010A68:
/* 00010A68 807A0000 */ lwz r3, 0(r26)
/* 00010A6C 38810078 */ addi r4, r1, 0x78
/* 00010A70 38630030 */ addi r3, r3, 0x30
/* 00010A74 4BFEF6C1 */ bl mathutil_mtx_copy
/* 00010A78 4BFEF6BD */ bl mathutil_mtxA_to_mtxB
/* 00010A7C 7EB4E214 */ add r21, r20, r28
/* 00010A80 80D50064 */ lwz r6, 0x64(r21)
/* 00010A84 38000001 */ li r0, 1
/* 00010A88 38800000 */ li r4, 0
/* 00010A8C 80A60030 */ lwz r5, 0x30(r6)
/* 00010A90 80660034 */ lwz r3, 0x34(r6)
/* 00010A94 90A100A8 */ stw r5, 0xa8(r1)
/* 00010A98 906100AC */ stw r3, 0xac(r1)
/* 00010A9C 80660038 */ lwz r3, 0x38(r6)
/* 00010AA0 906100B0 */ stw r3, 0xb0(r1)
/* 00010AA4 C01F3778 */ lfs f0, 0x3778(r31)
/* 00010AA8 80750064 */ lwz r3, 0x64(r21)
/* 00010AAC D0030030 */ stfs f0, 0x30(r3)
/* 00010AB0 C01F3778 */ lfs f0, 0x3778(r31)
/* 00010AB4 80750064 */ lwz r3, 0x64(r21)
/* 00010AB8 D0030034 */ stfs f0, 0x34(r3)
/* 00010ABC C01F3778 */ lfs f0, 0x3778(r31)
/* 00010AC0 80750064 */ lwz r3, 0x64(r21)
/* 00010AC4 D0030038 */ stfs f0, 0x38(r3)
/* 00010AC8 98160000 */ stb r0, 0(r22)
/* 00010ACC 80750064 */ lwz r3, 0x64(r21)
/* 00010AD0 4BFEF665 */ bl mot_ape_thread
/* 00010AD4 38000000 */ li r0, 0
/* 00010AD8 98160000 */ stb r0, 0(r22)
/* 00010ADC C03F37A8 */ lfs f1, 0x37a8(r31)
/* 00010AE0 FC400890 */ fmr f2, f1
/* 00010AE4 FC600890 */ fmr f3, f1
/* 00010AE8 4BFEF64D */ bl set_render_ambient
/* 00010AEC 80B50064 */ lwz r5, 0x64(r21)
/* 00010AF0 38610078 */ addi r3, r1, 0x78
/* 00010AF4 808100A8 */ lwz r4, 0xa8(r1)
/* 00010AF8 800100AC */ lwz r0, 0xac(r1)
/* 00010AFC 90850030 */ stw r4, 0x30(r5)
/* 00010B00 90050034 */ stw r0, 0x34(r5)
/* 00010B04 800100B0 */ lwz r0, 0xb0(r1)
/* 00010B08 90050038 */ stw r0, 0x38(r5)
/* 00010B0C 809A0000 */ lwz r4, 0(r26)
/* 00010B10 38840030 */ addi r4, r4, 0x30
/* 00010B14 4BFEF621 */ bl mathutil_mtx_copy
lbl_00010B18:
/* 00010B18 4BFEF61D */ bl mathutil_mtxA_pop
/* 00010B1C 386100C0 */ addi r3, r1, 0xc0
/* 00010B20 4BFEF615 */ bl mathutil_mtxA_mult_right
/* 00010B24 C03F3778 */ lfs f1, 0x3778(r31)
/* 00010B28 C05F37C0 */ lfs f2, 0x37c0(r31)
/* 00010B2C FC600890 */ fmr f3, f1
/* 00010B30 4BFEF605 */ bl mathutil_mtxA_translate_xyz
/* 00010B34 807A0000 */ lwz r3, 0(r26)
/* 00010B38 38800000 */ li r4, 0
/* 00010B3C 4BFEF5F9 */ bl GXLoadPosMtxImm
/* 00010B40 807A0000 */ lwz r3, 0(r26)
/* 00010B44 38800000 */ li r4, 0
/* 00010B48 4BFEF5ED */ bl GXLoadNrmMtxImm
/* 00010B4C C03F37A8 */ lfs f1, 0x37a8(r31)
/* 00010B50 FC400890 */ fmr f2, f1
/* 00010B54 FC600890 */ fmr f3, f1
/* 00010B58 4BFEF5DD */ bl set_render_ambient
/* 00010B5C 807B0000 */ lwz r3, 0(r27)
/* 00010B60 80630008 */ lwz r3, 8(r3)
/* 00010B64 80630058 */ lwz r3, 0x58(r3)
/* 00010B68 4BFEF5CD */ bl avdisp_draw_model_unculled_sort_none
/* 00010B6C 4BFEF5C9 */ bl mathutil_mtxA_pop
/* 00010B70 2C0F0001 */ cmpwi r15, 1
/* 00010B74 408200E8 */ bne lbl_00010C5C
/* 00010B78 80770000 */ lwz r3, 0(r23)
/* 00010B7C 5460077E */ clrlwi r0, r3, 0x1d
/* 00010B80 28000004 */ cmplwi r0, 4
/* 00010B84 40800034 */ bge lbl_00010BB8
/* 00010B88 546007BE */ clrlwi r0, r3, 0x1e
/* 00010B8C C05F384C */ lfs f2, 0x384c(r31)
/* 00010B90 900102B4 */ stw r0, 0x2b4(r1)
/* 00010B94 3C600000 */ lis r3, lbl_00020840@ha
/* 00010B98 C8230000 */ lfd f1, lbl_00020840@l(r3)
/* 00010B9C 930102B0 */ stw r24, 0x2b0(r1)
/* 00010BA0 C07F37A8 */ lfs f3, 0x37a8(r31)
/* 00010BA4 C80102B0 */ lfd f0, 0x2b0(r1)
/* 00010BA8 EC000828 */ fsubs f0, f0, f1
/* 00010BAC EC020032 */ fmuls f0, f2, f0
/* 00010BB0 EFC3002A */ fadds f30, f3, f0
/* 00010BB4 48000030 */ b lbl_00010BE4
lbl_00010BB8:
/* 00010BB8 20000008 */ subfic r0, r0, 8
/* 00010BBC C05F384C */ lfs f2, 0x384c(r31)
/* 00010BC0 900102B4 */ stw r0, 0x2b4(r1)
/* 00010BC4 3C600000 */ lis r3, lbl_00020840@ha
/* 00010BC8 C8230000 */ lfd f1, lbl_00020840@l(r3)
/* 00010BCC 930102B0 */ stw r24, 0x2b0(r1)
/* 00010BD0 C07F37A8 */ lfs f3, 0x37a8(r31)
/* 00010BD4 C80102B0 */ lfd f0, 0x2b0(r1)
/* 00010BD8 EC000828 */ fsubs f0, f0, f1
/* 00010BDC EC020032 */ fmuls f0, f2, f0
/* 00010BE0 EFC3002A */ fadds f30, f3, f0
lbl_00010BE4:
/* 00010BE4 4BFEF551 */ bl mathutil_mtxA_from_identity
/* 00010BE8 C03F3778 */ lfs f1, 0x3778(r31)
/* 00010BEC C05F3830 */ lfs f2, 0x3830(r31)
/* 00010BF0 C07F3834 */ lfs f3, 0x3834(r31)
/* 00010BF4 4BFEF541 */ bl mathutil_mtxA_translate_xyz
/* 00010BF8 C03F3844 */ lfs f1, 0x3844(r31)
/* 00010BFC C07F3848 */ lfs f3, 0x3848(r31)
/* 00010C00 FC400890 */ fmr f2, f1
/* 00010C04 4BFEF531 */ bl mathutil_mtxA_scale_xyz
/* 00010C08 C03F3778 */ lfs f1, 0x3778(r31)
/* 00010C0C C07F37BC */ lfs f3, 0x37bc(r31)
/* 00010C10 FC400890 */ fmr f2, f1
/* 00010C14 4BFEF521 */ bl mathutil_mtxA_translate_xyz
/* 00010C18 C0390000 */ lfs f1, 0(r25)
/* 00010C1C C04E0000 */ lfs f2, 0(r14)
/* 00010C20 C07F3778 */ lfs f3, 0x3778(r31)
/* 00010C24 4BFEF511 */ bl mathutil_mtxA_translate_xyz
/* 00010C28 C01F3850 */ lfs f0, 0x3850(r31)
/* 00010C2C EC2007B2 */ fmuls f1, f0, f30
/* 00010C30 4BFEF505 */ bl mathutil_mtxA_scale_s
/* 00010C34 807A0000 */ lwz r3, 0(r26)
/* 00010C38 38800000 */ li r4, 0
/* 00010C3C 4BFEF4F9 */ bl GXLoadPosMtxImm
/* 00010C40 807A0000 */ lwz r3, 0(r26)
/* 00010C44 38800000 */ li r4, 0
/* 00010C48 4BFEF4ED */ bl GXLoadNrmMtxImm
/* 00010C4C 807B0000 */ lwz r3, 0(r27)
/* 00010C50 80630008 */ lwz r3, 8(r3)
/* 00010C54 80630188 */ lwz r3, 0x188(r3)
/* 00010C58 4BFEF4DD */ bl avdisp_draw_model_unculled_sort_translucent
lbl_00010C5C:
/* 00010C5C 3A100001 */ addi r16, r16, 1
/* 00010C60 3BBD0004 */ addi r29, r29, 4
/* 00010C64 3B9C0068 */ addi r28, r28, 0x68
lbl_00010C68:
/* 00010C68 7C107800 */ cmpw r16, r15
/* 00010C6C 4180FCB0 */ blt lbl_0001091C
lbl_00010C70:
/* 00010C70 3C600000 */ lis r3, lbl_1000000A@ha
/* 00010C74 88030000 */ lbz r0, lbl_1000000A@l(r3)
/* 00010C78 7C000774 */ extsb r0, r0
/* 00010C7C 2C000013 */ cmpwi r0, 0x13
/* 00010C80 41820024 */ beq lbl_00010CA4
/* 00010C84 2C000014 */ cmpwi r0, 0x14
/* 00010C88 4182001C */ beq lbl_00010CA4
/* 00010C8C 2C00000D */ cmpwi r0, 0xd
/* 00010C90 4082020C */ bne lbl_00010E9C
/* 00010C94 3C600000 */ lis r3, lbl_10000010@ha
/* 00010C98 88030000 */ lbz r0, lbl_10000010@l(r3)
/* 00010C9C 7C000775 */ extsb. r0, r0
/* 00010CA0 408201FC */ bne lbl_00010E9C
lbl_00010CA4:
/* 00010CA4 4BFEF491 */ bl mathutil_mtxA_from_identity
/* 00010CA8 C03F37A8 */ lfs f1, 0x37a8(r31)
/* 00010CAC C05F3854 */ lfs f2, 0x3854(r31)
/* 00010CB0 C07F3858 */ lfs f3, 0x3858(r31)
/* 00010CB4 4BFEF481 */ bl mathutil_mtxA_translate_xyz
/* 00010CB8 C03F3788 */ lfs f1, 0x3788(r31)
/* 00010CBC FC400890 */ fmr f2, f1
/* 00010CC0 FC600890 */ fmr f3, f1
/* 00010CC4 4BFEF471 */ bl mathutil_mtxA_scale_xyz
/* 00010CC8 38604000 */ li r3, 0x4000
/* 00010CCC 4BFEF469 */ bl mathutil_mtxA_rotate_x
/* 00010CD0 4BFEF465 */ bl mathutil_mtxA_push
/* 00010CD4 3C600000 */ lis r3, mathutilData@ha
/* 00010CD8 3A830000 */ addi r20, r3, mathutilData@l
/* 00010CDC 80740000 */ lwz r3, 0(r20)
/* 00010CE0 38800000 */ li r4, 0
/* 00010CE4 4BFEF451 */ bl GXLoadPosMtxImm
/* 00010CE8 80740000 */ lwz r3, 0(r20)
/* 00010CEC 38800000 */ li r4, 0
/* 00010CF0 4BFEF445 */ bl GXLoadNrmMtxImm
/* 00010CF4 3C600000 */ lis r3, minigameGma@ha
/* 00010CF8 3A630000 */ addi r19, r3, minigameGma@l
/* 00010CFC 80730000 */ lwz r3, 0(r19)
/* 00010D00 80630008 */ lwz r3, 8(r3)
/* 00010D04 80630008 */ lwz r3, 8(r3)
/* 00010D08 4BFEF42D */ bl avdisp_draw_model_unculled_sort_translucent
/* 00010D0C 3C800000 */ lis r4, lbl_10009878@ha
/* 00010D10 3C600000 */ lis r3, s_somethingLightRelated@ha
/* 00010D14 3CA00000 */ lis r5, lbl_10000064@ha
/* 00010D18 39E40000 */ addi r15, r4, lbl_10009878@l
/* 00010D1C 39C30000 */ addi r14, r3, s_somethingLightRelated@l
/* 00010D20 3A250000 */ addi r17, r5, lbl_10000064@l
/* 00010D24 3A000000 */ li r16, 0
/* 00010D28 3AA00000 */ li r21, 0
/* 00010D2C 3AC00000 */ li r22, 0
/* 00010D30 3AE00000 */ li r23, 0
lbl_00010D34:
/* 00010D34 7E4FBA14 */ add r18, r15, r23
/* 00010D38 88120000 */ lbz r0, 0(r18)
/* 00010D3C 2C000001 */ cmpwi r0, 1
/* 00010D40 40820140 */ bne lbl_00010E80
/* 00010D44 38720044 */ addi r3, r18, 0x44
/* 00010D48 4BFEF3ED */ bl mathutil_mtxA_from_quat
/* 00010D4C 38610048 */ addi r3, r1, 0x48
/* 00010D50 4BFEF3E5 */ bl mathutil_mtxA_to_mtx
/* 00010D54 4BFEF3E1 */ bl mathutil_mtxA_peek
/* 00010D58 38720010 */ addi r3, r18, 0x10
/* 00010D5C 4BFEF3D9 */ bl mathutil_mtxA_translate
/* 00010D60 C03F37B8 */ lfs f1, 0x37b8(r31)
/* 00010D64 4BFEF3D1 */ bl mathutil_mtxA_scale_s
/* 00010D68 4BFEF3CD */ bl mathutil_mtxA_push
/* 00010D6C 2C100000 */ cmpwi r16, 0
/* 00010D70 408200C0 */ bne lbl_00010E30
/* 00010D74 7C71B214 */ add r3, r17, r22
/* 00010D78 80030000 */ lwz r0, 0(r3)
/* 00010D7C 2C00FFFF */ cmpwi r0, -1
/* 00010D80 418200B0 */ beq lbl_00010E30
/* 00010D84 80740000 */ lwz r3, 0(r20)
/* 00010D88 3881000C */ addi r4, r1, 0xc
/* 00010D8C 38630030 */ addi r3, r3, 0x30
/* 00010D90 4BFEF3A5 */ bl mathutil_mtx_copy
/* 00010D94 4BFEF3A1 */ bl mathutil_mtxA_to_mtxB
/* 00010D98 80D20064 */ lwz r6, 0x64(r18)
/* 00010D9C 38000001 */ li r0, 1
/* 00010DA0 38800000 */ li r4, 0
/* 00010DA4 80A60030 */ lwz r5, 0x30(r6)
/* 00010DA8 80660034 */ lwz r3, 0x34(r6)
/* 00010DAC 90A1003C */ stw r5, 0x3c(r1)
/* 00010DB0 90610040 */ stw r3, 0x40(r1)
/* 00010DB4 80660038 */ lwz r3, 0x38(r6)
/* 00010DB8 90610044 */ stw r3, 0x44(r1)
/* 00010DBC C01F3778 */ lfs f0, 0x3778(r31)
/* 00010DC0 80720064 */ lwz r3, 0x64(r18)
/* 00010DC4 D0030030 */ stfs f0, 0x30(r3)
/* 00010DC8 C01F3778 */ lfs f0, 0x3778(r31)
/* 00010DCC 80720064 */ lwz r3, 0x64(r18)
/* 00010DD0 D0030034 */ stfs f0, 0x34(r3)
/* 00010DD4 C01F3778 */ lfs f0, 0x3778(r31)
/* 00010DD8 80720064 */ lwz r3, 0x64(r18)
/* 00010DDC D0030038 */ stfs f0, 0x38(r3)
/* 00010DE0 980E0000 */ stb r0, 0(r14)
/* 00010DE4 80720064 */ lwz r3, 0x64(r18)
/* 00010DE8 4BFEF34D */ bl mot_ape_thread
/* 00010DEC 38000000 */ li r0, 0
/* 00010DF0 980E0000 */ stb r0, 0(r14)
/* 00010DF4 C03F37A8 */ lfs f1, 0x37a8(r31)
/* 00010DF8 FC400890 */ fmr f2, f1
/* 00010DFC FC600890 */ fmr f3, f1
/* 00010E00 4BFEF335 */ bl set_render_ambient
/* 00010E04 80B20064 */ lwz r5, 0x64(r18)
/* 00010E08 3861000C */ addi r3, r1, 0xc
/* 00010E0C 8081003C */ lwz r4, 0x3c(r1)
/* 00010E10 80010040 */ lwz r0, 0x40(r1)
/* 00010E14 90850030 */ stw r4, 0x30(r5)
/* 00010E18 90050034 */ stw r0, 0x34(r5)
/* 00010E1C 80010044 */ lwz r0, 0x44(r1)
/* 00010E20 90050038 */ stw r0, 0x38(r5)
/* 00010E24 80940000 */ lwz r4, 0(r20)
/* 00010E28 38840030 */ addi r4, r4, 0x30
/* 00010E2C 4BFEF309 */ bl mathutil_mtx_copy
lbl_00010E30:
/* 00010E30 4BFEF305 */ bl mathutil_mtxA_pop
/* 00010E34 38610048 */ addi r3, r1, 0x48
/* 00010E38 4BFEF2FD */ bl mathutil_mtxA_mult_right
/* 00010E3C C03F3778 */ lfs f1, 0x3778(r31)
/* 00010E40 C05F37C0 */ lfs f2, 0x37c0(r31)
/* 00010E44 FC600890 */ fmr f3, f1
/* 00010E48 4BFEF2ED */ bl mathutil_mtxA_translate_xyz
/* 00010E4C 80740000 */ lwz r3, 0(r20)
/* 00010E50 38800000 */ li r4, 0
/* 00010E54 4BFEF2E1 */ bl GXLoadPosMtxImm
/* 00010E58 80740000 */ lwz r3, 0(r20)
/* 00010E5C 38800000 */ li r4, 0
/* 00010E60 4BFEF2D5 */ bl GXLoadNrmMtxImm
/* 00010E64 7C7FAA14 */ add r3, r31, r21
/* 00010E68 80930000 */ lwz r4, 0(r19)
/* 00010E6C A8033650 */ lha r0, 0x3650(r3)
/* 00010E70 80640008 */ lwz r3, 8(r4)
/* 00010E74 54001838 */ slwi r0, r0, 3
/* 00010E78 7C63002E */ lwzx r3, r3, r0
/* 00010E7C 4BFEF2B9 */ bl avdisp_draw_model_unculled_sort_none
lbl_00010E80:
/* 00010E80 3A100001 */ addi r16, r16, 1
/* 00010E84 2C10000A */ cmpwi r16, 0xa
/* 00010E88 3AB50002 */ addi r21, r21, 2
/* 00010E8C 3AD60004 */ addi r22, r22, 4
/* 00010E90 3AF70068 */ addi r23, r23, 0x68
/* 00010E94 4180FEA0 */ blt lbl_00010D34
/* 00010E98 4BFEF29D */ bl mathutil_mtxA_pop
lbl_00010E9C:
/* 00010E9C 3C600000 */ lis r3, lbl_1000001E@ha
/* 00010EA0 39C30000 */ addi r14, r3, lbl_1000001E@l
/* 00010EA4 880E0000 */ lbz r0, 0(r14)
/* 00010EA8 3C600000 */ lis r3, lbl_10009710@ha
/* 00010EAC 39E30000 */ addi r15, r3, lbl_10009710@l
/* 00010EB0 7C000774 */ extsb r0, r0
/* 00010EB4 1C000048 */ mulli r0, r0, 0x48
/* 00010EB8 7C6F0214 */ add r3, r15, r0
/* 00010EBC 88030001 */ lbz r0, 1(r3)
/* 00010EC0 2C000002 */ cmpwi r0, 2
/* 00010EC4 408200D8 */ bne lbl_00010F9C
/* 00010EC8 A8030008 */ lha r0, 8(r3)
/* 00010ECC 2C000002 */ cmpwi r0, 2
/* 00010ED0 408100CC */ ble lbl_00010F9C
/* 00010ED4 4BFEF261 */ bl mathutil_mtxA_from_identity
/* 00010ED8 C03F385C */ lfs f1, 0x385c(r31)
/* 00010EDC C05F3860 */ lfs f2, 0x3860(r31)
/* 00010EE0 C07F3834 */ lfs f3, 0x3834(r31)
/* 00010EE4 4BFEF251 */ bl mathutil_mtxA_translate_xyz
/* 00010EE8 886E0000 */ lbz r3, 0(r14)
/* 00010EEC 3A000000 */ li r16, 0
/* 00010EF0 1C100024 */ mulli r0, r16, 0x24
/* 00010EF4 7C630774 */ extsb r3, r3
/* 00010EF8 1C630048 */ mulli r3, r3, 0x48
/* 00010EFC 7C6F1A14 */ add r3, r15, r3
/* 00010F00 7C630214 */ add r3, r3, r0
/* 00010F04 A8030008 */ lha r0, 8(r3)
/* 00010F08 2C00000A */ cmpwi r0, 0xa
/* 00010F0C 4081000C */ ble lbl_00010F18
/* 00010F10 C05F37A8 */ lfs f2, 0x37a8(r31)
/* 00010F14 48000034 */ b lbl_00010F48
lbl_00010F18:
/* 00010F18 6C008000 */ xoris r0, r0, 0x8000
/* 00010F1C C01F37B8 */ lfs f0, 0x37b8(r31)
/* 00010F20 900102B4 */ stw r0, 0x2b4(r1)
/* 00010F24 3C004330 */ lis r0, 0x4330
/* 00010F28 3C600000 */ lis r3, lbl_00020848@ha
/* 00010F2C C07F384C */ lfs f3, 0x384c(r31)
/* 00010F30 900102B0 */ stw r0, 0x2b0(r1)
/* 00010F34 C8430000 */ lfd f2, lbl_00020848@l(r3)
/* 00010F38 C82102B0 */ lfd f1, 0x2b0(r1)
/* 00010F3C EC211028 */ fsubs f1, f1, f2
/* 00010F40 EC010028 */ fsubs f0, f1, f0
/* 00010F44 EC430032 */ fmuls f2, f3, f0
lbl_00010F48:
/* 00010F48 C01F3868 */ lfs f0, 0x3868(r31)
/* 00010F4C C03F3864 */ lfs f1, 0x3864(r31)
/* 00010F50 EC4000B2 */ fmuls f2, f0, f2
/* 00010F54 C07F37A8 */ lfs f3, 0x37a8(r31)
/* 00010F58 4BFEF1DD */ bl mathutil_mtxA_scale_xyz
/* 00010F5C C03F37BC */ lfs f1, 0x37bc(r31)
/* 00010F60 4BFEF1D5 */ bl avdisp_set_alpha
/* 00010F64 3C600000 */ lis r3, mathutilData@ha
/* 00010F68 39C30000 */ addi r14, r3, mathutilData@l
/* 00010F6C 806E0000 */ lwz r3, 0(r14)
/* 00010F70 38800000 */ li r4, 0
/* 00010F74 4BFEF1C1 */ bl GXLoadPosMtxImm
/* 00010F78 806E0000 */ lwz r3, 0(r14)
/* 00010F7C 38800000 */ li r4, 0
/* 00010F80 4BFEF1B5 */ bl GXLoadNrmMtxImm
/* 00010F84 3C600000 */ lis r3, commonGma@ha
/* 00010F88 38630000 */ addi r3, r3, commonGma@l
/* 00010F8C 80630000 */ lwz r3, 0(r3)
/* 00010F90 80630008 */ lwz r3, 8(r3)
/* 00010F94 80630180 */ lwz r3, 0x180(r3)
/* 00010F98 4BFEF19D */ bl avdisp_draw_model_unculled_sort_none
lbl_00010F9C:
/* 00010F9C 4BFEF199 */ bl apply_curr_light_group_ambient
/* 00010FA0 4BFEF195 */ bl ord_tbl_draw_nodes
/* 00010FA4 38600001 */ li r3, 1
/* 00010FA8 38800003 */ li r4, 3
/* 00010FAC 38A00001 */ li r5, 1
/* 00010FB0 4BFEF185 */ bl avdisp_set_z_mode
lbl_00010FB4:
/* 00010FB4 B9C102B8 */ lmw r14, 0x2b8(r1)
/* 00010FB8 80010314 */ lwz r0, 0x314(r1)
/* 00010FBC CBE10308 */ lfd f31, 0x308(r1)
/* 00010FC0 CBC10300 */ lfd f30, 0x300(r1)
/* 00010FC4 7C0803A6 */ mtlr r0
/* 00010FC8 38210310 */ addi r1, r1, 0x310
/* 00010FCC 4E800020 */ blr 
