/* 0000B218 7C0802A6 */ mflr r0
/* 0000B21C 3C800000 */ lis r4, lbl_0000C8F0@ha
/* 0000B220 90010004 */ stw r0, 4(r1)
/* 0000B224 9421FED8 */ stwu r1, -0x128(r1)
/* 0000B228 BEC10100 */ stmw r22, 0x100(r1)
/* 0000B22C 3BA40000 */ addi r29, r4, lbl_0000C8F0@l
/* 0000B230 3C800000 */ lis r4, lbl_0000C370@ha
/* 0000B234 3BE40000 */ addi r31, r4, lbl_0000C370@l
/* 0000B238 8863000F */ lbz r3, 0xf(r3)
/* 0000B23C 7C630774 */ extsb r3, r3
/* 0000B240 4BFF8D2D */ bl lbl_00003F6C
/* 0000B244 28030000 */ cmplwi r3, 0
/* 0000B248 41820040 */ beq lbl_0000B288
/* 0000B24C C05F0000 */ lfs f2, 0(r31)
/* 0000B250 C0230004 */ lfs f1, 4(r3)
/* 0000B254 C0030008 */ lfs f0, 8(r3)
/* 0000B258 FC601090 */ fmr f3, f2
/* 0000B25C EC21002A */ fadds f1, f1, f0
/* 0000B260 4BFF4F4D */ bl mathutil_mtxA_from_translate_xyz
/* 0000B264 3C600000 */ lis r3, lbl_10000000@ha
/* 0000B268 38630000 */ addi r3, r3, lbl_10000000@l
/* 0000B26C 38630184 */ addi r3, r3, 0x184
/* 0000B270 4BFF4F3D */ bl mathutil_mtxA_to_mtx
/* 0000B274 3C600000 */ lis r3, mathutilData@ha
/* 0000B278 38630000 */ addi r3, r3, mathutilData@l
/* 0000B27C 80630000 */ lwz r3, 0(r3)
/* 0000B280 38800000 */ li r4, 0
/* 0000B284 4BFF4F29 */ bl GXLoadPosMtxImm
lbl_0000B288:
/* 0000B288 7FA3EB78 */ mr r3, r29
/* 0000B28C 4BFF4F21 */ bl nlSprPut
/* 0000B290 C01F0088 */ lfs f0, 0x88(r31)
/* 0000B294 3BC100A4 */ addi r30, r1, 0xa4
/* 0000B298 388000B3 */ li r4, 0xb3
/* 0000B29C D0010064 */ stfs f0, 0x64(r1)
/* 0000B2A0 3AC00000 */ li r22, 0
/* 0000B2A4 3C000020 */ lis r0, 0x20
/* 0000B2A8 C01F0060 */ lfs f0, 0x60(r31)
/* 0000B2AC 7FC3F378 */ mr r3, r30
/* 0000B2B0 D0010058 */ stfs f0, 0x58(r1)
/* 0000B2B4 C01F0060 */ lfs f0, 0x60(r31)
/* 0000B2B8 D001005C */ stfs f0, 0x5c(r1)
/* 0000B2BC 98810019 */ stb r4, 0x19(r1)
/* 0000B2C0 389D1918 */ addi r4, r29, 0x1918
/* 0000B2C4 9AC10088 */ stb r22, 0x88(r1)
/* 0000B2C8 9AC10089 */ stb r22, 0x89(r1)
/* 0000B2CC 9AC1008A */ stb r22, 0x8a(r1)
/* 0000B2D0 9001008C */ stw r0, 0x8c(r1)
/* 0000B2D4 4BFF4ED9 */ bl strcpy
/* 0000B2D8 4BFF4ED5 */ bl reset_text_draw_settings
/* 0000B2DC 88610019 */ lbz r3, 0x19(r1)
/* 0000B2E0 4BFF4ECD */ bl set_text_font
/* 0000B2E4 C0210058 */ lfs f1, 0x58(r1)
/* 0000B2E8 C041005C */ lfs f2, 0x5c(r1)
/* 0000B2EC 4BFF4EC1 */ bl set_text_scale
/* 0000B2F0 8061008C */ lwz r3, 0x8c(r1)
/* 0000B2F4 4BFF4EB9 */ bl func_80071B50
/* 0000B2F8 C0210064 */ lfs f1, 0x64(r1)
/* 0000B2FC 4BFF4EB1 */ bl func_80071B1C
/* 0000B300 88010025 */ lbz r0, 0x25(r1)
/* 0000B304 88610024 */ lbz r3, 0x24(r1)
/* 0000B308 5400402E */ slwi r0, r0, 8
/* 0000B30C 88810026 */ lbz r4, 0x26(r1)
/* 0000B310 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000B314 7C830378 */ or r3, r4, r0
/* 0000B318 4BFF4E95 */ bl set_text_mul_color
/* 0000B31C 88010089 */ lbz r0, 0x89(r1)
/* 0000B320 88610088 */ lbz r3, 0x88(r1)
/* 0000B324 5400402E */ slwi r0, r0, 8
/* 0000B328 8881008A */ lbz r4, 0x8a(r1)
/* 0000B32C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000B330 7C830378 */ or r3, r4, r0
/* 0000B334 4BFF4E79 */ bl set_text_add_color
/* 0000B338 7FC3F378 */ mr r3, r30
/* 0000B33C 4BFF4E71 */ bl u_get_text_width
/* 0000B340 C81F0058 */ lfd f0, 0x58(r31)
/* 0000B344 380000FF */ li r0, 0xff
/* 0000B348 C85F00A8 */ lfd f2, 0xa8(r31)
/* 0000B34C FC000072 */ fmul f0, f0, f1
/* 0000B350 FC020028 */ fsub f0, f2, f0
/* 0000B354 FC000018 */ frsp f0, f0
/* 0000B358 D001001C */ stfs f0, 0x1c(r1)
/* 0000B35C C01F0090 */ lfs f0, 0x90(r31)
/* 0000B360 D0010020 */ stfs f0, 0x20(r1)
/* 0000B364 98010024 */ stb r0, 0x24(r1)
/* 0000B368 98010025 */ stb r0, 0x25(r1)
/* 0000B36C 9AC10026 */ stb r22, 0x26(r1)
/* 0000B370 4BFF4E3D */ bl reset_text_draw_settings
/* 0000B374 88610019 */ lbz r3, 0x19(r1)
/* 0000B378 4BFF4E35 */ bl set_text_font
/* 0000B37C C0210058 */ lfs f1, 0x58(r1)
/* 0000B380 C041005C */ lfs f2, 0x5c(r1)
/* 0000B384 4BFF4E29 */ bl set_text_scale
/* 0000B388 8061008C */ lwz r3, 0x8c(r1)
/* 0000B38C 4BFF4E21 */ bl func_80071B50
/* 0000B390 C83F0028 */ lfd f1, 0x28(r31)
/* 0000B394 C0010064 */ lfs f0, 0x64(r1)
/* 0000B398 FC21002A */ fadd f1, f1, f0
/* 0000B39C FC200818 */ frsp f1, f1
/* 0000B3A0 4BFF4E0D */ bl func_80071B1C
/* 0000B3A4 38600000 */ li r3, 0
/* 0000B3A8 4BFF4E05 */ bl set_text_mul_color
/* 0000B3AC 88010089 */ lbz r0, 0x89(r1)
/* 0000B3B0 88610088 */ lbz r3, 0x88(r1)
/* 0000B3B4 5400402E */ slwi r0, r0, 8
/* 0000B3B8 8881008A */ lbz r4, 0x8a(r1)
/* 0000B3BC 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000B3C0 7C830378 */ or r3, r4, r0
/* 0000B3C4 4BFF4DE9 */ bl set_text_add_color
/* 0000B3C8 C85F0030 */ lfd f2, 0x30(r31)
/* 0000B3CC C021001C */ lfs f1, 0x1c(r1)
/* 0000B3D0 C0010020 */ lfs f0, 0x20(r1)
/* 0000B3D4 FC22082A */ fadd f1, f2, f1
/* 0000B3D8 FC42002A */ fadd f2, f2, f0
/* 0000B3DC FC200818 */ frsp f1, f1
/* 0000B3E0 FC401018 */ frsp f2, f2
/* 0000B3E4 4BFF4DC9 */ bl set_text_pos
/* 0000B3E8 7FC3F378 */ mr r3, r30
/* 0000B3EC 4BFF4DC1 */ bl sprite_puts
/* 0000B3F0 C0210064 */ lfs f1, 0x64(r1)
/* 0000B3F4 4BFF4DB9 */ bl func_80071B1C
/* 0000B3F8 88010025 */ lbz r0, 0x25(r1)
/* 0000B3FC 88610024 */ lbz r3, 0x24(r1)
/* 0000B400 5400402E */ slwi r0, r0, 8
/* 0000B404 88810026 */ lbz r4, 0x26(r1)
/* 0000B408 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000B40C 7C830378 */ or r3, r4, r0
/* 0000B410 4BFF4D9D */ bl set_text_mul_color
/* 0000B414 88010089 */ lbz r0, 0x89(r1)
/* 0000B418 88610088 */ lbz r3, 0x88(r1)
/* 0000B41C 5400402E */ slwi r0, r0, 8
/* 0000B420 8881008A */ lbz r4, 0x8a(r1)
/* 0000B424 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000B428 7C830378 */ or r3, r4, r0
/* 0000B42C 4BFF4D81 */ bl set_text_add_color
/* 0000B430 C021001C */ lfs f1, 0x1c(r1)
/* 0000B434 C0410020 */ lfs f2, 0x20(r1)
/* 0000B438 4BFF4D75 */ bl set_text_pos
/* 0000B43C 7FC3F378 */ mr r3, r30
/* 0000B440 4BFF4D6D */ bl sprite_puts
/* 0000B444 C01F0064 */ lfs f0, 0x64(r31)
/* 0000B448 387D150C */ addi r3, r29, 0x150c
/* 0000B44C D01D1510 */ stfs f0, 0x1510(r29)
/* 0000B450 C01F021C */ lfs f0, 0x21c(r31)
/* 0000B454 D01D1514 */ stfs f0, 0x1514(r29)
/* 0000B458 C01F0060 */ lfs f0, 0x60(r31)
/* 0000B45C D01D151C */ stfs f0, 0x151c(r29)
/* 0000B460 C03F0148 */ lfs f1, 0x148(r31)
/* 0000B464 C05F009C */ lfs f2, 0x9c(r31)
/* 0000B468 4BFF8E55 */ bl lbl_000042BC
/* 0000B46C C01F0218 */ lfs f0, 0x218(r31)
/* 0000B470 3C800000 */ lis r4, lbl_10000000@ha
/* 0000B474 3AE40000 */ addi r23, r4, lbl_10000000@l
/* 0000B478 D01D0054 */ stfs f0, 0x54(r29)
/* 0000B47C 387D0050 */ addi r3, r29, 0x50
/* 0000B480 C0170128 */ lfs f0, 0x128(r23)
/* 0000B484 D01D0058 */ stfs f0, 0x58(r29)
/* 0000B488 4BFF4D25 */ bl nlSprPut
/* 0000B48C 3AC00000 */ li r22, 0
/* 0000B490 56C0103A */ slwi r0, r22, 2
/* 0000B494 7F7D0214 */ add r27, r29, r0
/* 0000B498 3B370130 */ addi r25, r23, 0x130
/* 0000B49C 3F404330 */ lis r26, 0x4330
/* 0000B4A0 3B7B167C */ addi r27, r27, 0x167c
lbl_0000B4A4:
/* 0000B4A4 6EC08000 */ xoris r0, r22, 0x8000
/* 0000B4A8 C01F021C */ lfs f0, 0x21c(r31)
/* 0000B4AC 900100FC */ stw r0, 0xfc(r1)
/* 0000B4B0 3C600000 */ lis r3, lbl_0000C380@ha
/* 0000B4B4 D001001C */ stfs f0, 0x1c(r1)
/* 0000B4B8 934100F8 */ stw r26, 0xf8(r1)
/* 0000B4BC C8230000 */ lfd f1, lbl_0000C380@l(r3)
/* 0000B4C0 C80100F8 */ lfd f0, 0xf8(r1)
/* 0000B4C4 C85F0080 */ lfd f2, 0x80(r31)
/* 0000B4C8 FC000828 */ fsub f0, f0, f1
/* 0000B4CC C83F0270 */ lfd f1, 0x270(r31)
/* 0000B4D0 FC020032 */ fmul f0, f2, f0
/* 0000B4D4 FC01002A */ fadd f0, f1, f0
/* 0000B4D8 FC000018 */ frsp f0, f0
/* 0000B4DC D0010020 */ stfs f0, 0x20(r1)
/* 0000B4E0 80190000 */ lwz r0, 0(r25)
/* 0000B4E4 7C160000 */ cmpw r22, r0
/* 0000B4E8 41820014 */ beq lbl_0000B4FC
/* 0000B4EC 2C160003 */ cmpwi r22, 3
/* 0000B4F0 40820024 */ bne lbl_0000B514
/* 0000B4F4 2C000003 */ cmpwi r0, 3
/* 0000B4F8 4081001C */ ble lbl_0000B514
lbl_0000B4FC:
/* 0000B4FC 386000FF */ li r3, 0xff
/* 0000B500 98610024 */ stb r3, 0x24(r1)
/* 0000B504 38000000 */ li r0, 0
/* 0000B508 98610025 */ stb r3, 0x25(r1)
/* 0000B50C 98010026 */ stb r0, 0x26(r1)
/* 0000B510 48000018 */ b lbl_0000B528
lbl_0000B514:
/* 0000B514 3860008F */ li r3, 0x8f
/* 0000B518 98610024 */ stb r3, 0x24(r1)
/* 0000B51C 38000000 */ li r0, 0
/* 0000B520 98610025 */ stb r3, 0x25(r1)
/* 0000B524 98010026 */ stb r0, 0x26(r1)
lbl_0000B528:
/* 0000B528 7FC3F378 */ mr r3, r30
/* 0000B52C 809B0000 */ lwz r4, 0(r27)
/* 0000B530 4BFF4C7D */ bl strcpy
/* 0000B534 4BFF4C79 */ bl reset_text_draw_settings
/* 0000B538 88610019 */ lbz r3, 0x19(r1)
/* 0000B53C 4BFF4C71 */ bl set_text_font
/* 0000B540 C0210058 */ lfs f1, 0x58(r1)
/* 0000B544 C041005C */ lfs f2, 0x5c(r1)
/* 0000B548 4BFF4C65 */ bl set_text_scale
/* 0000B54C 8061008C */ lwz r3, 0x8c(r1)
/* 0000B550 4BFF4C5D */ bl func_80071B50
/* 0000B554 C83F0028 */ lfd f1, 0x28(r31)
/* 0000B558 C0010064 */ lfs f0, 0x64(r1)
/* 0000B55C FC21002A */ fadd f1, f1, f0
/* 0000B560 FC200818 */ frsp f1, f1
/* 0000B564 4BFF4C49 */ bl func_80071B1C
/* 0000B568 38600000 */ li r3, 0
/* 0000B56C 4BFF4C41 */ bl set_text_mul_color
/* 0000B570 88010089 */ lbz r0, 0x89(r1)
/* 0000B574 88610088 */ lbz r3, 0x88(r1)
/* 0000B578 5400402E */ slwi r0, r0, 8
/* 0000B57C 8881008A */ lbz r4, 0x8a(r1)
/* 0000B580 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000B584 7C830378 */ or r3, r4, r0
/* 0000B588 4BFF4C25 */ bl set_text_add_color
/* 0000B58C C85F0030 */ lfd f2, 0x30(r31)
/* 0000B590 C021001C */ lfs f1, 0x1c(r1)
/* 0000B594 C0010020 */ lfs f0, 0x20(r1)
/* 0000B598 FC22082A */ fadd f1, f2, f1
/* 0000B59C FC42002A */ fadd f2, f2, f0
/* 0000B5A0 FC200818 */ frsp f1, f1
/* 0000B5A4 FC401018 */ frsp f2, f2
/* 0000B5A8 4BFF4C05 */ bl set_text_pos
/* 0000B5AC 7FC3F378 */ mr r3, r30
/* 0000B5B0 4BFF4BFD */ bl sprite_puts
/* 0000B5B4 C0210064 */ lfs f1, 0x64(r1)
/* 0000B5B8 4BFF4BF5 */ bl func_80071B1C
/* 0000B5BC 88010025 */ lbz r0, 0x25(r1)
/* 0000B5C0 88610024 */ lbz r3, 0x24(r1)
/* 0000B5C4 5400402E */ slwi r0, r0, 8
/* 0000B5C8 88810026 */ lbz r4, 0x26(r1)
/* 0000B5CC 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000B5D0 7C830378 */ or r3, r4, r0
/* 0000B5D4 4BFF4BD9 */ bl set_text_mul_color
/* 0000B5D8 88010089 */ lbz r0, 0x89(r1)
/* 0000B5DC 88610088 */ lbz r3, 0x88(r1)
/* 0000B5E0 5400402E */ slwi r0, r0, 8
/* 0000B5E4 8881008A */ lbz r4, 0x8a(r1)
/* 0000B5E8 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000B5EC 7C830378 */ or r3, r4, r0
/* 0000B5F0 4BFF4BBD */ bl set_text_add_color
/* 0000B5F4 C021001C */ lfs f1, 0x1c(r1)
/* 0000B5F8 C0410020 */ lfs f2, 0x20(r1)
/* 0000B5FC 4BFF4BB1 */ bl set_text_pos
/* 0000B600 7FC3F378 */ mr r3, r30
/* 0000B604 4BFF4BA9 */ bl sprite_puts
/* 0000B608 3AD60001 */ addi r22, r22, 1
/* 0000B60C 28160004 */ cmplwi r22, 4
/* 0000B610 3B7B0004 */ addi r27, r27, 4
/* 0000B614 4180FE90 */ blt lbl_0000B4A4
/* 0000B618 380000B0 */ li r0, 0xb0
/* 0000B61C 3C600000 */ lis r3, lbl_10000000@ha
/* 0000B620 98010019 */ stb r0, 0x19(r1)
/* 0000B624 38630000 */ addi r3, r3, lbl_10000000@l
/* 0000B628 3B830130 */ addi r28, r3, 0x130
/* 0000B62C 80030130 */ lwz r0, 0x130(r3)
/* 0000B630 2C000002 */ cmpwi r0, 2
/* 0000B634 40820120 */ bne lbl_0000B754
/* 0000B638 387D155C */ addi r3, r29, 0x155c
/* 0000B63C 4BFF4B71 */ bl nlSprPut
/* 0000B640 388000FF */ li r4, 0xff
/* 0000B644 98810024 */ stb r4, 0x24(r1)
/* 0000B648 38000000 */ li r0, 0
/* 0000B64C 387E0000 */ addi r3, r30, 0
/* 0000B650 98810025 */ stb r4, 0x25(r1)
/* 0000B654 389D1924 */ addi r4, r29, 0x1924
/* 0000B658 98010026 */ stb r0, 0x26(r1)
/* 0000B65C C01F0278 */ lfs f0, 0x278(r31)
/* 0000B660 D001001C */ stfs f0, 0x1c(r1)
/* 0000B664 C01F027C */ lfs f0, 0x27c(r31)
/* 0000B668 D0010020 */ stfs f0, 0x20(r1)
/* 0000B66C C01F0158 */ lfs f0, 0x158(r31)
/* 0000B670 D0010058 */ stfs f0, 0x58(r1)
/* 0000B674 4BFF4B39 */ bl strcpy
/* 0000B678 4BFF4B35 */ bl reset_text_draw_settings
/* 0000B67C 88610019 */ lbz r3, 0x19(r1)
/* 0000B680 4BFF4B2D */ bl set_text_font
/* 0000B684 C0210058 */ lfs f1, 0x58(r1)
/* 0000B688 C041005C */ lfs f2, 0x5c(r1)
/* 0000B68C 4BFF4B21 */ bl set_text_scale
/* 0000B690 8061008C */ lwz r3, 0x8c(r1)
/* 0000B694 4BFF4B19 */ bl func_80071B50
/* 0000B698 C83F0028 */ lfd f1, 0x28(r31)
/* 0000B69C C0010064 */ lfs f0, 0x64(r1)
/* 0000B6A0 FC21002A */ fadd f1, f1, f0
/* 0000B6A4 FC200818 */ frsp f1, f1
/* 0000B6A8 4BFF4B05 */ bl func_80071B1C
/* 0000B6AC 38600000 */ li r3, 0
/* 0000B6B0 4BFF4AFD */ bl set_text_mul_color
/* 0000B6B4 88010089 */ lbz r0, 0x89(r1)
/* 0000B6B8 88610088 */ lbz r3, 0x88(r1)
/* 0000B6BC 5400402E */ slwi r0, r0, 8
/* 0000B6C0 8881008A */ lbz r4, 0x8a(r1)
/* 0000B6C4 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000B6C8 7C830378 */ or r3, r4, r0
/* 0000B6CC 4BFF4AE1 */ bl set_text_add_color
/* 0000B6D0 C85F0030 */ lfd f2, 0x30(r31)
/* 0000B6D4 C021001C */ lfs f1, 0x1c(r1)
/* 0000B6D8 C0010020 */ lfs f0, 0x20(r1)
/* 0000B6DC FC22082A */ fadd f1, f2, f1
/* 0000B6E0 FC42002A */ fadd f2, f2, f0
/* 0000B6E4 FC200818 */ frsp f1, f1
/* 0000B6E8 FC401018 */ frsp f2, f2
/* 0000B6EC 4BFF4AC1 */ bl set_text_pos
/* 0000B6F0 7FC3F378 */ mr r3, r30
/* 0000B6F4 4BFF4AB9 */ bl sprite_puts
/* 0000B6F8 C0210064 */ lfs f1, 0x64(r1)
/* 0000B6FC 4BFF4AB1 */ bl func_80071B1C
/* 0000B700 88010025 */ lbz r0, 0x25(r1)
/* 0000B704 88610024 */ lbz r3, 0x24(r1)
/* 0000B708 5400402E */ slwi r0, r0, 8
/* 0000B70C 88810026 */ lbz r4, 0x26(r1)
/* 0000B710 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000B714 7C830378 */ or r3, r4, r0
/* 0000B718 4BFF4A95 */ bl set_text_mul_color
/* 0000B71C 88010089 */ lbz r0, 0x89(r1)
/* 0000B720 88610088 */ lbz r3, 0x88(r1)
/* 0000B724 5400402E */ slwi r0, r0, 8
/* 0000B728 8881008A */ lbz r4, 0x8a(r1)
/* 0000B72C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000B730 7C830378 */ or r3, r4, r0
/* 0000B734 4BFF4A79 */ bl set_text_add_color
/* 0000B738 C021001C */ lfs f1, 0x1c(r1)
/* 0000B73C C0410020 */ lfs f2, 0x20(r1)
/* 0000B740 4BFF4A6D */ bl set_text_pos
/* 0000B744 7FC3F378 */ mr r3, r30
/* 0000B748 4BFF4A65 */ bl sprite_puts
/* 0000B74C C01F0060 */ lfs f0, 0x60(r31)
/* 0000B750 D0010058 */ stfs f0, 0x58(r1)
lbl_0000B754:
/* 0000B754 801C0000 */ lwz r0, 0(r28)
/* 0000B758 2C000002 */ cmpwi r0, 2
/* 0000B75C 4082001C */ bne lbl_0000B778
/* 0000B760 386000FF */ li r3, 0xff
/* 0000B764 98610024 */ stb r3, 0x24(r1)
/* 0000B768 38000000 */ li r0, 0
/* 0000B76C 98610025 */ stb r3, 0x25(r1)
/* 0000B770 98010026 */ stb r0, 0x26(r1)
/* 0000B774 48000018 */ b lbl_0000B78C
lbl_0000B778:
/* 0000B778 3860008F */ li r3, 0x8f
/* 0000B77C 98610024 */ stb r3, 0x24(r1)
/* 0000B780 38000000 */ li r0, 0
/* 0000B784 98610025 */ stb r3, 0x25(r1)
/* 0000B788 98010026 */ stb r0, 0x26(r1)
lbl_0000B78C:
/* 0000B78C 4BFF4A21 */ bl func_8009F4C4
/* 0000B790 5460063E */ clrlwi r0, r3, 0x18
/* 0000B794 28000001 */ cmplwi r0, 1
/* 0000B798 40820024 */ bne lbl_0000B7BC
/* 0000B79C C01F00DC */ lfs f0, 0xdc(r31)
/* 0000B7A0 387E0000 */ addi r3, r30, 0
/* 0000B7A4 389D1948 */ addi r4, r29, 0x1948
/* 0000B7A8 D001001C */ stfs f0, 0x1c(r1)
/* 0000B7AC C01F027C */ lfs f0, 0x27c(r31)
/* 0000B7B0 D0010020 */ stfs f0, 0x20(r1)
/* 0000B7B4 4BFF49F9 */ bl strcpy
/* 0000B7B8 48000020 */ b lbl_0000B7D8
lbl_0000B7BC:
/* 0000B7BC C01F0280 */ lfs f0, 0x280(r31)
/* 0000B7C0 387E0000 */ addi r3, r30, 0
/* 0000B7C4 389D194C */ addi r4, r29, 0x194c
/* 0000B7C8 D001001C */ stfs f0, 0x1c(r1)
/* 0000B7CC C01F027C */ lfs f0, 0x27c(r31)
/* 0000B7D0 D0010020 */ stfs f0, 0x20(r1)
/* 0000B7D4 4BFF49D9 */ bl strcpy
lbl_0000B7D8:
/* 0000B7D8 4BFF49D5 */ bl reset_text_draw_settings
/* 0000B7DC 88610019 */ lbz r3, 0x19(r1)
/* 0000B7E0 4BFF49CD */ bl set_text_font
/* 0000B7E4 C0210058 */ lfs f1, 0x58(r1)
/* 0000B7E8 C041005C */ lfs f2, 0x5c(r1)
/* 0000B7EC 4BFF49C1 */ bl set_text_scale
/* 0000B7F0 8061008C */ lwz r3, 0x8c(r1)
/* 0000B7F4 4BFF49B9 */ bl func_80071B50
/* 0000B7F8 C83F0028 */ lfd f1, 0x28(r31)
/* 0000B7FC C0010064 */ lfs f0, 0x64(r1)
/* 0000B800 FC21002A */ fadd f1, f1, f0
/* 0000B804 FC200818 */ frsp f1, f1
/* 0000B808 4BFF49A5 */ bl func_80071B1C
/* 0000B80C 38600000 */ li r3, 0
/* 0000B810 4BFF499D */ bl set_text_mul_color
/* 0000B814 88010089 */ lbz r0, 0x89(r1)
/* 0000B818 88610088 */ lbz r3, 0x88(r1)
/* 0000B81C 5400402E */ slwi r0, r0, 8
/* 0000B820 8881008A */ lbz r4, 0x8a(r1)
/* 0000B824 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000B828 7C830378 */ or r3, r4, r0
/* 0000B82C 4BFF4981 */ bl set_text_add_color
/* 0000B830 C85F0030 */ lfd f2, 0x30(r31)
/* 0000B834 C021001C */ lfs f1, 0x1c(r1)
/* 0000B838 C0010020 */ lfs f0, 0x20(r1)
/* 0000B83C FC22082A */ fadd f1, f2, f1
/* 0000B840 FC42002A */ fadd f2, f2, f0
/* 0000B844 FC200818 */ frsp f1, f1
/* 0000B848 FC401018 */ frsp f2, f2
/* 0000B84C 4BFF4961 */ bl set_text_pos
/* 0000B850 7FC3F378 */ mr r3, r30
/* 0000B854 4BFF4959 */ bl sprite_puts
/* 0000B858 C0210064 */ lfs f1, 0x64(r1)
/* 0000B85C 4BFF4951 */ bl func_80071B1C
/* 0000B860 88010025 */ lbz r0, 0x25(r1)
/* 0000B864 88610024 */ lbz r3, 0x24(r1)
/* 0000B868 5400402E */ slwi r0, r0, 8
/* 0000B86C 88810026 */ lbz r4, 0x26(r1)
/* 0000B870 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000B874 7C830378 */ or r3, r4, r0
/* 0000B878 4BFF4935 */ bl set_text_mul_color
/* 0000B87C 88010089 */ lbz r0, 0x89(r1)
/* 0000B880 88610088 */ lbz r3, 0x88(r1)
/* 0000B884 5400402E */ slwi r0, r0, 8
/* 0000B888 8881008A */ lbz r4, 0x8a(r1)
/* 0000B88C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000B890 7C830378 */ or r3, r4, r0
/* 0000B894 4BFF4919 */ bl set_text_add_color
/* 0000B898 C021001C */ lfs f1, 0x1c(r1)
/* 0000B89C C0410020 */ lfs f2, 0x20(r1)
/* 0000B8A0 4BFF490D */ bl set_text_pos
/* 0000B8A4 7FC3F378 */ mr r3, r30
/* 0000B8A8 4BFF4905 */ bl sprite_puts
/* 0000B8AC 380000B3 */ li r0, 0xb3
/* 0000B8B0 98010019 */ stb r0, 0x19(r1)
/* 0000B8B4 387D15AC */ addi r3, r29, 0x15ac
/* 0000B8B8 C01F0284 */ lfs f0, 0x284(r31)
/* 0000B8BC D01D15B4 */ stfs f0, 0x15b4(r29)
/* 0000B8C0 C01F0288 */ lfs f0, 0x288(r31)
/* 0000B8C4 D01D15C0 */ stfs f0, 0x15c0(r29)
/* 0000B8C8 C03F028C */ lfs f1, 0x28c(r31)
/* 0000B8CC C05F0290 */ lfs f2, 0x290(r31)
/* 0000B8D0 4BFF89ED */ bl lbl_000042BC
/* 0000B8D4 C01F0294 */ lfs f0, 0x294(r31)
/* 0000B8D8 386000FF */ li r3, 0xff
/* 0000B8DC 38000000 */ li r0, 0
/* 0000B8E0 D0010058 */ stfs f0, 0x58(r1)
/* 0000B8E4 98610024 */ stb r3, 0x24(r1)
/* 0000B8E8 98610025 */ stb r3, 0x25(r1)
/* 0000B8EC 98010026 */ stb r0, 0x26(r1)
/* 0000B8F0 801C0000 */ lwz r0, 0(r28)
/* 0000B8F4 2C000003 */ cmpwi r0, 3
/* 0000B8F8 40800008 */ bge lbl_0000B900
/* 0000B8FC 48000008 */ b lbl_0000B904
lbl_0000B900:
/* 0000B900 38000003 */ li r0, 3
lbl_0000B904:
/* 0000B904 54001838 */ slwi r0, r0, 3
/* 0000B908 7EDD0214 */ add r22, r29, r0
/* 0000B90C 3AE00000 */ li r23, 0
/* 0000B910 56FB1838 */ slwi r27, r23, 3
/* 0000B914 3F404330 */ lis r26, 0x4330
/* 0000B918 3AD618E8 */ addi r22, r22, 0x18e8
/* 0000B91C 480001D4 */ b lbl_0000BAF0
lbl_0000B920:
/* 0000B920 80960000 */ lwz r4, 0(r22)
/* 0000B924 7FC3F378 */ mr r3, r30
/* 0000B928 7C84D82E */ lwzx r4, r4, r27
/* 0000B92C 4BFF4881 */ bl strcpy
/* 0000B930 4BFF487D */ bl reset_text_draw_settings
/* 0000B934 88610019 */ lbz r3, 0x19(r1)
/* 0000B938 4BFF4875 */ bl set_text_font
/* 0000B93C C0210058 */ lfs f1, 0x58(r1)
/* 0000B940 C041005C */ lfs f2, 0x5c(r1)
/* 0000B944 4BFF4869 */ bl set_text_scale
/* 0000B948 8061008C */ lwz r3, 0x8c(r1)
/* 0000B94C 4BFF4861 */ bl func_80071B50
/* 0000B950 C0210064 */ lfs f1, 0x64(r1)
/* 0000B954 4BFF4859 */ bl func_80071B1C
/* 0000B958 88010025 */ lbz r0, 0x25(r1)
/* 0000B95C 88610024 */ lbz r3, 0x24(r1)
/* 0000B960 5400402E */ slwi r0, r0, 8
/* 0000B964 88810026 */ lbz r4, 0x26(r1)
/* 0000B968 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000B96C 7C830378 */ or r3, r4, r0
/* 0000B970 4BFF483D */ bl set_text_mul_color
/* 0000B974 88010089 */ lbz r0, 0x89(r1)
/* 0000B978 88610088 */ lbz r3, 0x88(r1)
/* 0000B97C 5400402E */ slwi r0, r0, 8
/* 0000B980 8881008A */ lbz r4, 0x8a(r1)
/* 0000B984 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000B988 7C830378 */ or r3, r4, r0
/* 0000B98C 4BFF4821 */ bl set_text_add_color
/* 0000B990 7FC3F378 */ mr r3, r30
/* 0000B994 4BFF4819 */ bl u_get_text_width
/* 0000B998 C81F0058 */ lfd f0, 0x58(r31)
/* 0000B99C 6EE08000 */ xoris r0, r23, 0x8000
/* 0000B9A0 900100F4 */ stw r0, 0xf4(r1)
/* 0000B9A4 3C600000 */ lis r3, lbl_0000C380@ha
/* 0000B9A8 FC000072 */ fmul f0, f0, f1
/* 0000B9AC C83F00A8 */ lfd f1, 0xa8(r31)
/* 0000B9B0 3C800000 */ lis r4, lbl_0000C380@ha
/* 0000B9B4 934100F0 */ stw r26, 0xf0(r1)
/* 0000B9B8 FC210028 */ fsub f1, f1, f0
/* 0000B9BC C80100F0 */ lfd f0, 0xf0(r1)
/* 0000B9C0 FC200818 */ frsp f1, f1
/* 0000B9C4 D021001C */ stfs f1, 0x1c(r1)
/* 0000B9C8 80B60004 */ lwz r5, 4(r22)
/* 0000B9CC C8230000 */ lfd f1, lbl_0000C380@l(r3)
/* 0000B9D0 3805FFFF */ addi r0, r5, -1
/* 0000B9D4 C8440000 */ lfd f2, lbl_0000C380@l(r4)
/* 0000B9D8 6C008000 */ xoris r0, r0, 0x8000
/* 0000B9DC FC000828 */ fsub f0, f0, f1
/* 0000B9E0 900100FC */ stw r0, 0xfc(r1)
/* 0000B9E4 C83F0080 */ lfd f1, 0x80(r31)
/* 0000B9E8 934100F8 */ stw r26, 0xf8(r1)
/* 0000B9EC FC010032 */ fmul f0, f1, f0
/* 0000B9F0 C87F00B8 */ lfd f3, 0xb8(r31)
/* 0000B9F4 C82100F8 */ lfd f1, 0xf8(r1)
/* 0000B9F8 C89F0298 */ lfd f4, 0x298(r31)
/* 0000B9FC FC211028 */ fsub f1, f1, f2
/* 0000BA00 FC230072 */ fmul f1, f3, f1
/* 0000BA04 FC240828 */ fsub f1, f4, f1
/* 0000BA08 FC01002A */ fadd f0, f1, f0
/* 0000BA0C FC000018 */ frsp f0, f0
/* 0000BA10 D0010020 */ stfs f0, 0x20(r1)
/* 0000BA14 4BFF4799 */ bl reset_text_draw_settings
/* 0000BA18 88610019 */ lbz r3, 0x19(r1)
/* 0000BA1C 4BFF4791 */ bl set_text_font
/* 0000BA20 C0210058 */ lfs f1, 0x58(r1)
/* 0000BA24 C041005C */ lfs f2, 0x5c(r1)
/* 0000BA28 4BFF4785 */ bl set_text_scale
/* 0000BA2C 8061008C */ lwz r3, 0x8c(r1)
/* 0000BA30 4BFF477D */ bl func_80071B50
/* 0000BA34 C83F0028 */ lfd f1, 0x28(r31)
/* 0000BA38 C0010064 */ lfs f0, 0x64(r1)
/* 0000BA3C FC21002A */ fadd f1, f1, f0
/* 0000BA40 FC200818 */ frsp f1, f1
/* 0000BA44 4BFF4769 */ bl func_80071B1C
/* 0000BA48 38600000 */ li r3, 0
/* 0000BA4C 4BFF4761 */ bl set_text_mul_color
/* 0000BA50 88010089 */ lbz r0, 0x89(r1)
/* 0000BA54 88610088 */ lbz r3, 0x88(r1)
/* 0000BA58 5400402E */ slwi r0, r0, 8
/* 0000BA5C 8881008A */ lbz r4, 0x8a(r1)
/* 0000BA60 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000BA64 7C830378 */ or r3, r4, r0
/* 0000BA68 4BFF4745 */ bl set_text_add_color
/* 0000BA6C C85F0030 */ lfd f2, 0x30(r31)
/* 0000BA70 C021001C */ lfs f1, 0x1c(r1)
/* 0000BA74 C0010020 */ lfs f0, 0x20(r1)
/* 0000BA78 FC22082A */ fadd f1, f2, f1
/* 0000BA7C FC42002A */ fadd f2, f2, f0
/* 0000BA80 FC200818 */ frsp f1, f1
/* 0000BA84 FC401018 */ frsp f2, f2
/* 0000BA88 4BFF4725 */ bl set_text_pos
/* 0000BA8C 7FC3F378 */ mr r3, r30
/* 0000BA90 4BFF471D */ bl sprite_puts
/* 0000BA94 C0210064 */ lfs f1, 0x64(r1)
/* 0000BA98 4BFF4715 */ bl func_80071B1C
/* 0000BA9C 88010025 */ lbz r0, 0x25(r1)
/* 0000BAA0 88610024 */ lbz r3, 0x24(r1)
/* 0000BAA4 5400402E */ slwi r0, r0, 8
/* 0000BAA8 88810026 */ lbz r4, 0x26(r1)
/* 0000BAAC 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000BAB0 7C830378 */ or r3, r4, r0
/* 0000BAB4 4BFF46F9 */ bl set_text_mul_color
/* 0000BAB8 88010089 */ lbz r0, 0x89(r1)
/* 0000BABC 88610088 */ lbz r3, 0x88(r1)
/* 0000BAC0 5400402E */ slwi r0, r0, 8
/* 0000BAC4 8881008A */ lbz r4, 0x8a(r1)
/* 0000BAC8 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000BACC 7C830378 */ or r3, r4, r0
/* 0000BAD0 4BFF46DD */ bl set_text_add_color
/* 0000BAD4 C021001C */ lfs f1, 0x1c(r1)
/* 0000BAD8 C0410020 */ lfs f2, 0x20(r1)
/* 0000BADC 4BFF46D1 */ bl set_text_pos
/* 0000BAE0 7FC3F378 */ mr r3, r30
/* 0000BAE4 4BFF46C9 */ bl sprite_puts
/* 0000BAE8 3B7B0008 */ addi r27, r27, 8
/* 0000BAEC 3AF70001 */ addi r23, r23, 1
lbl_0000BAF0:
/* 0000BAF0 80160004 */ lwz r0, 4(r22)
/* 0000BAF4 7C170000 */ cmpw r23, r0
/* 0000BAF8 4180FE28 */ blt lbl_0000B920
/* 0000BAFC 3C600000 */ lis r3, lbl_10000000@ha
/* 0000BB00 3AC30000 */ addi r22, r3, lbl_10000000@l
/* 0000BB04 C0160018 */ lfs f0, 0x18(r22)
/* 0000BB08 3B760018 */ addi r27, r22, 0x18
/* 0000BB0C 387D15FC */ addi r3, r29, 0x15fc
/* 0000BB10 D01D1600 */ stfs f0, 0x1600(r29)
/* 0000BB14 C01F02A0 */ lfs f0, 0x2a0(r31)
/* 0000BB18 D01D160C */ stfs f0, 0x160c(r29)
/* 0000BB1C C03F028C */ lfs f1, 0x28c(r31)
/* 0000BB20 C05F0290 */ lfs f2, 0x290(r31)
/* 0000BB24 4BFF8799 */ bl lbl_000042BC
/* 0000BB28 3800008F */ li r0, 0x8f
/* 0000BB2C 98010024 */ stb r0, 0x24(r1)
/* 0000BB30 3AE00000 */ li r23, 0
/* 0000BB34 3B16012C */ addi r24, r22, 0x12c
/* 0000BB38 98010025 */ stb r0, 0x25(r1)
/* 0000BB3C 380000FF */ li r0, 0xff
/* 0000BB40 56F91838 */ slwi r25, r23, 3
/* 0000BB44 9AE10026 */ stb r23, 0x26(r1)
/* 0000BB48 3F404330 */ lis r26, 0x4330
/* 0000BB4C 9AE10088 */ stb r23, 0x88(r1)
/* 0000BB50 9AE10089 */ stb r23, 0x89(r1)
/* 0000BB54 9AE1008A */ stb r23, 0x8a(r1)
/* 0000BB58 C01F00A4 */ lfs f0, 0xa4(r31)
/* 0000BB5C D0010058 */ stfs f0, 0x58(r1)
/* 0000BB60 98010024 */ stb r0, 0x24(r1)
/* 0000BB64 98010025 */ stb r0, 0x25(r1)
/* 0000BB68 9AE10026 */ stb r23, 0x26(r1)
/* 0000BB6C 8016012C */ lwz r0, 0x12c(r22)
/* 0000BB70 54001838 */ slwi r0, r0, 3
/* 0000BB74 7EDD0214 */ add r22, r29, r0
/* 0000BB78 3AD618E8 */ addi r22, r22, 0x18e8
/* 0000BB7C 4800021C */ b lbl_0000BD98
lbl_0000BB80:
/* 0000BB80 80180000 */ lwz r0, 0(r24)
/* 0000BB84 2C000004 */ cmpwi r0, 4
/* 0000BB88 40820020 */ bne lbl_0000BBA8
/* 0000BB8C 380000EF */ li r0, 0xef
/* 0000BB90 98010024 */ stb r0, 0x24(r1)
/* 0000BB94 3860009A */ li r3, 0x9a
/* 0000BB98 38000000 */ li r0, 0
/* 0000BB9C 98610025 */ stb r3, 0x25(r1)
/* 0000BBA0 98010026 */ stb r0, 0x26(r1)
/* 0000BBA4 48000018 */ b lbl_0000BBBC
lbl_0000BBA8:
/* 0000BBA8 386000FF */ li r3, 0xff
/* 0000BBAC 98610024 */ stb r3, 0x24(r1)
/* 0000BBB0 38000000 */ li r0, 0
/* 0000BBB4 98610025 */ stb r3, 0x25(r1)
/* 0000BBB8 98010026 */ stb r0, 0x26(r1)
lbl_0000BBBC:
/* 0000BBBC 80960000 */ lwz r4, 0(r22)
/* 0000BBC0 7FC3F378 */ mr r3, r30
/* 0000BBC4 7C84C82E */ lwzx r4, r4, r25
/* 0000BBC8 4BFF45E5 */ bl strcpy
/* 0000BBCC 4BFF45E1 */ bl reset_text_draw_settings
/* 0000BBD0 88610019 */ lbz r3, 0x19(r1)
/* 0000BBD4 4BFF45D9 */ bl set_text_font
/* 0000BBD8 C0210058 */ lfs f1, 0x58(r1)
/* 0000BBDC C041005C */ lfs f2, 0x5c(r1)
/* 0000BBE0 4BFF45CD */ bl set_text_scale
/* 0000BBE4 8061008C */ lwz r3, 0x8c(r1)
/* 0000BBE8 4BFF45C5 */ bl func_80071B50
/* 0000BBEC C0210064 */ lfs f1, 0x64(r1)
/* 0000BBF0 4BFF45BD */ bl func_80071B1C
/* 0000BBF4 88010025 */ lbz r0, 0x25(r1)
/* 0000BBF8 88610024 */ lbz r3, 0x24(r1)
/* 0000BBFC 5400402E */ slwi r0, r0, 8
/* 0000BC00 88810026 */ lbz r4, 0x26(r1)
/* 0000BC04 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000BC08 7C830378 */ or r3, r4, r0
/* 0000BC0C 4BFF45A1 */ bl set_text_mul_color
/* 0000BC10 88010089 */ lbz r0, 0x89(r1)
/* 0000BC14 88610088 */ lbz r3, 0x88(r1)
/* 0000BC18 5400402E */ slwi r0, r0, 8
/* 0000BC1C 8881008A */ lbz r4, 0x8a(r1)
/* 0000BC20 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000BC24 7C830378 */ or r3, r4, r0
/* 0000BC28 4BFF4585 */ bl set_text_add_color
/* 0000BC2C 7FC3F378 */ mr r3, r30
/* 0000BC30 4BFF457D */ bl u_get_text_width
/* 0000BC34 C81F0058 */ lfd f0, 0x58(r31)
/* 0000BC38 6EE08000 */ xoris r0, r23, 0x8000
/* 0000BC3C 900100FC */ stw r0, 0xfc(r1)
/* 0000BC40 3C600000 */ lis r3, lbl_0000C380@ha
/* 0000BC44 FC000072 */ fmul f0, f0, f1
/* 0000BC48 C85F00A8 */ lfd f2, 0xa8(r31)
/* 0000BC4C 3C800000 */ lis r4, lbl_0000C380@ha
/* 0000BC50 C07B0000 */ lfs f3, 0(r27)
/* 0000BC54 934100F8 */ stw r26, 0xf8(r1)
/* 0000BC58 FC220028 */ fsub f1, f2, f0
/* 0000BC5C C80100F8 */ lfd f0, 0xf8(r1)
/* 0000BC60 FC23082A */ fadd f1, f3, f1
/* 0000BC64 FC211028 */ fsub f1, f1, f2
/* 0000BC68 FC200818 */ frsp f1, f1
/* 0000BC6C D021001C */ stfs f1, 0x1c(r1)
/* 0000BC70 80B60004 */ lwz r5, 4(r22)
/* 0000BC74 C8230000 */ lfd f1, lbl_0000C380@l(r3)
/* 0000BC78 3805FFFF */ addi r0, r5, -1
/* 0000BC7C C8440000 */ lfd f2, lbl_0000C380@l(r4)
/* 0000BC80 6C008000 */ xoris r0, r0, 0x8000
/* 0000BC84 FC000828 */ fsub f0, f0, f1
/* 0000BC88 900100F4 */ stw r0, 0xf4(r1)
/* 0000BC8C C83F0080 */ lfd f1, 0x80(r31)
/* 0000BC90 934100F0 */ stw r26, 0xf0(r1)
/* 0000BC94 FC010032 */ fmul f0, f1, f0
/* 0000BC98 C87F00B8 */ lfd f3, 0xb8(r31)
/* 0000BC9C C82100F0 */ lfd f1, 0xf0(r1)
/* 0000BCA0 C89F02A8 */ lfd f4, 0x2a8(r31)
/* 0000BCA4 FC211028 */ fsub f1, f1, f2
/* 0000BCA8 FC230072 */ fmul f1, f3, f1
/* 0000BCAC FC240828 */ fsub f1, f4, f1
/* 0000BCB0 FC01002A */ fadd f0, f1, f0
/* 0000BCB4 FC000018 */ frsp f0, f0
/* 0000BCB8 D0010020 */ stfs f0, 0x20(r1)
/* 0000BCBC 4BFF44F1 */ bl reset_text_draw_settings
/* 0000BCC0 88610019 */ lbz r3, 0x19(r1)
/* 0000BCC4 4BFF44E9 */ bl set_text_font
/* 0000BCC8 C0210058 */ lfs f1, 0x58(r1)
/* 0000BCCC C041005C */ lfs f2, 0x5c(r1)
/* 0000BCD0 4BFF44DD */ bl set_text_scale
/* 0000BCD4 8061008C */ lwz r3, 0x8c(r1)
/* 0000BCD8 4BFF44D5 */ bl func_80071B50
/* 0000BCDC C83F0028 */ lfd f1, 0x28(r31)
/* 0000BCE0 C0010064 */ lfs f0, 0x64(r1)
/* 0000BCE4 FC21002A */ fadd f1, f1, f0
/* 0000BCE8 FC200818 */ frsp f1, f1
/* 0000BCEC 4BFF44C1 */ bl func_80071B1C
/* 0000BCF0 38600000 */ li r3, 0
/* 0000BCF4 4BFF44B9 */ bl set_text_mul_color
/* 0000BCF8 88010089 */ lbz r0, 0x89(r1)
/* 0000BCFC 88610088 */ lbz r3, 0x88(r1)
/* 0000BD00 5400402E */ slwi r0, r0, 8
/* 0000BD04 8881008A */ lbz r4, 0x8a(r1)
/* 0000BD08 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000BD0C 7C830378 */ or r3, r4, r0
/* 0000BD10 4BFF449D */ bl set_text_add_color
/* 0000BD14 C85F0030 */ lfd f2, 0x30(r31)
/* 0000BD18 C021001C */ lfs f1, 0x1c(r1)
/* 0000BD1C C0010020 */ lfs f0, 0x20(r1)
/* 0000BD20 FC22082A */ fadd f1, f2, f1
/* 0000BD24 FC42002A */ fadd f2, f2, f0
/* 0000BD28 FC200818 */ frsp f1, f1
/* 0000BD2C FC401018 */ frsp f2, f2
/* 0000BD30 4BFF447D */ bl set_text_pos
/* 0000BD34 7FC3F378 */ mr r3, r30
/* 0000BD38 4BFF4475 */ bl sprite_puts
/* 0000BD3C C0210064 */ lfs f1, 0x64(r1)
/* 0000BD40 4BFF446D */ bl func_80071B1C
/* 0000BD44 88010025 */ lbz r0, 0x25(r1)
/* 0000BD48 88610024 */ lbz r3, 0x24(r1)
/* 0000BD4C 5400402E */ slwi r0, r0, 8
/* 0000BD50 88810026 */ lbz r4, 0x26(r1)
/* 0000BD54 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000BD58 7C830378 */ or r3, r4, r0
/* 0000BD5C 4BFF4451 */ bl set_text_mul_color
/* 0000BD60 88010089 */ lbz r0, 0x89(r1)
/* 0000BD64 88610088 */ lbz r3, 0x88(r1)
/* 0000BD68 5400402E */ slwi r0, r0, 8
/* 0000BD6C 8881008A */ lbz r4, 0x8a(r1)
/* 0000BD70 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000BD74 7C830378 */ or r3, r4, r0
/* 0000BD78 4BFF4435 */ bl set_text_add_color
/* 0000BD7C C021001C */ lfs f1, 0x1c(r1)
/* 0000BD80 C0410020 */ lfs f2, 0x20(r1)
/* 0000BD84 4BFF4429 */ bl set_text_pos
/* 0000BD88 7FC3F378 */ mr r3, r30
/* 0000BD8C 4BFF4421 */ bl sprite_puts
/* 0000BD90 3B390008 */ addi r25, r25, 8
/* 0000BD94 3AF70001 */ addi r23, r23, 1
lbl_0000BD98:
/* 0000BD98 80160004 */ lwz r0, 4(r22)
/* 0000BD9C 7C170000 */ cmpw r23, r0
/* 0000BDA0 4180FDE0 */ blt lbl_0000BB80
/* 0000BDA4 801C0000 */ lwz r0, 0(r28)
/* 0000BDA8 2C000004 */ cmpwi r0, 4
/* 0000BDAC 40820370 */ bne lbl_0000C11C
/* 0000BDB0 3C600000 */ lis r3, globalAnimTimer@ha
/* 0000BDB4 C85F0250 */ lfd f2, 0x250(r31)
/* 0000BDB8 38830000 */ addi r4, r3, globalAnimTimer@l
/* 0000BDBC C89F0248 */ lfd f4, 0x248(r31)
/* 0000BDC0 3C608889 */ lis r3, 0x8889
/* 0000BDC4 80840000 */ lwz r4, 0(r4)
/* 0000BDC8 38038889 */ addi r0, r3, -30583
/* 0000BDCC 7C002016 */ mulhwu r0, r0, r4
/* 0000BDD0 5400D97E */ srwi r0, r0, 5
/* 0000BDD4 1C00003C */ mulli r0, r0, 0x3c
/* 0000BDD8 7C002050 */ subf r0, r0, r4
/* 0000BDDC 900100F4 */ stw r0, 0xf4(r1)
/* 0000BDE0 3CA04330 */ lis r5, 0x4330
/* 0000BDE4 3C600000 */ lis r3, lbl_0000C4B0@ha
/* 0000BDE8 90A100F0 */ stw r5, 0xf0(r1)
/* 0000BDEC 3C800000 */ lis r4, lbl_0000C380@ha
/* 0000BDF0 C8230000 */ lfd f1, lbl_0000C4B0@l(r3)
/* 0000BDF4 3C600000 */ lis r3, lbl_0000C380@ha
/* 0000BDF8 C80100F0 */ lfd f0, 0xf0(r1)
/* 0000BDFC C8640000 */ lfd f3, lbl_0000C380@l(r4)
/* 0000BE00 EC000828 */ fsubs f0, f0, f1
/* 0000BE04 C8230000 */ lfd f1, lbl_0000C380@l(r3)
/* 0000BE08 FC00001E */ fctiwz f0, f0
/* 0000BE0C D80100F8 */ stfd f0, 0xf8(r1)
/* 0000BE10 800100FC */ lwz r0, 0xfc(r1)
/* 0000BE14 6C008000 */ xoris r0, r0, 0x8000
/* 0000BE18 900100EC */ stw r0, 0xec(r1)
/* 0000BE1C 90A100E8 */ stw r5, 0xe8(r1)
/* 0000BE20 C80100E8 */ lfd f0, 0xe8(r1)
/* 0000BE24 FC001828 */ fsub f0, f0, f3
/* 0000BE28 FC001028 */ fsub f0, f0, f2
/* 0000BE2C FC00001E */ fctiwz f0, f0
/* 0000BE30 D80100E0 */ stfd f0, 0xe0(r1)
/* 0000BE34 800100E4 */ lwz r0, 0xe4(r1)
/* 0000BE38 7C03FE70 */ srawi r3, r0, 0x1f
/* 0000BE3C 7C600278 */ xor r0, r3, r0
/* 0000BE40 7C030050 */ subf r0, r3, r0
/* 0000BE44 6C008000 */ xoris r0, r0, 0x8000
/* 0000BE48 900100DC */ stw r0, 0xdc(r1)
/* 0000BE4C 90A100D8 */ stw r5, 0xd8(r1)
/* 0000BE50 C80100D8 */ lfd f0, 0xd8(r1)
/* 0000BE54 EC000828 */ fsubs f0, f0, f1
/* 0000BE58 FC001024 */ fdiv f0, f0, f2
/* 0000BE5C FC240032 */ fmul f1, f4, f0
/* 0000BE60 4BFF434D */ bl __cvt_fp2unsigned
/* 0000BE64 C85F02B0 */ lfd f2, 0x2b0(r31)
/* 0000BE68 3C800000 */ lis r4, lbl_10000000@ha
/* 0000BE6C C03B0000 */ lfs f1, 0(r27)
/* 0000BE70 38840000 */ addi r4, r4, lbl_10000000@l
/* 0000BE74 C81F00A8 */ lfd f0, 0xa8(r31)
/* 0000BE78 FC22082A */ fadd f1, f2, f1
/* 0000BE7C 3B040138 */ addi r24, r4, 0x138
/* 0000BE80 3B830000 */ addi r28, r3, 0
/* 0000BE84 FC010028 */ fsub f0, f1, f0
/* 0000BE88 FC000018 */ frsp f0, f0
/* 0000BE8C D001001C */ stfs f0, 0x1c(r1)
/* 0000BE90 C01F02B8 */ lfs f0, 0x2b8(r31)
/* 0000BE94 D0010020 */ stfs f0, 0x20(r1)
/* 0000BE98 80040138 */ lwz r0, 0x138(r4)
/* 0000BE9C 2C000000 */ cmpwi r0, 0
/* 0000BEA0 40820028 */ bne lbl_0000BEC8
/* 0000BEA4 3860008F */ li r3, 0x8f
/* 0000BEA8 98610024 */ stb r3, 0x24(r1)
/* 0000BEAC 38000000 */ li r0, 0
/* 0000BEB0 98610025 */ stb r3, 0x25(r1)
/* 0000BEB4 98010026 */ stb r0, 0x26(r1)
/* 0000BEB8 98010088 */ stb r0, 0x88(r1)
/* 0000BEBC 98010089 */ stb r0, 0x89(r1)
/* 0000BEC0 9801008A */ stb r0, 0x8a(r1)
/* 0000BEC4 48000024 */ b lbl_0000BEE8
lbl_0000BEC8:
/* 0000BEC8 386000FF */ li r3, 0xff
/* 0000BECC 98610024 */ stb r3, 0x24(r1)
/* 0000BED0 38000000 */ li r0, 0
/* 0000BED4 98610025 */ stb r3, 0x25(r1)
/* 0000BED8 98010026 */ stb r0, 0x26(r1)
/* 0000BEDC 9B810088 */ stb r28, 0x88(r1)
/* 0000BEE0 9B810089 */ stb r28, 0x89(r1)
/* 0000BEE4 9B81008A */ stb r28, 0x8a(r1)
lbl_0000BEE8:
/* 0000BEE8 387E0000 */ addi r3, r30, 0
/* 0000BEEC 389D03C8 */ addi r4, r29, 0x3c8
/* 0000BEF0 4BFF42BD */ bl strcpy
/* 0000BEF4 4BFF42B9 */ bl reset_text_draw_settings
/* 0000BEF8 88610019 */ lbz r3, 0x19(r1)
/* 0000BEFC 4BFF42B1 */ bl set_text_font
/* 0000BF00 C0210058 */ lfs f1, 0x58(r1)
/* 0000BF04 C041005C */ lfs f2, 0x5c(r1)
/* 0000BF08 4BFF42A5 */ bl set_text_scale
/* 0000BF0C 8061008C */ lwz r3, 0x8c(r1)
/* 0000BF10 4BFF429D */ bl func_80071B50
/* 0000BF14 C83F0028 */ lfd f1, 0x28(r31)
/* 0000BF18 C0010064 */ lfs f0, 0x64(r1)
/* 0000BF1C FC21002A */ fadd f1, f1, f0
/* 0000BF20 FC200818 */ frsp f1, f1
/* 0000BF24 4BFF4289 */ bl func_80071B1C
/* 0000BF28 38600000 */ li r3, 0
/* 0000BF2C 4BFF4281 */ bl set_text_mul_color
/* 0000BF30 88010089 */ lbz r0, 0x89(r1)
/* 0000BF34 88610088 */ lbz r3, 0x88(r1)
/* 0000BF38 5400402E */ slwi r0, r0, 8
/* 0000BF3C 8881008A */ lbz r4, 0x8a(r1)
/* 0000BF40 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000BF44 7C830378 */ or r3, r4, r0
/* 0000BF48 4BFF4265 */ bl set_text_add_color
/* 0000BF4C C85F0030 */ lfd f2, 0x30(r31)
/* 0000BF50 C021001C */ lfs f1, 0x1c(r1)
/* 0000BF54 C0010020 */ lfs f0, 0x20(r1)
/* 0000BF58 FC22082A */ fadd f1, f2, f1
/* 0000BF5C FC42002A */ fadd f2, f2, f0
/* 0000BF60 FC200818 */ frsp f1, f1
/* 0000BF64 FC401018 */ frsp f2, f2
/* 0000BF68 4BFF4245 */ bl set_text_pos
/* 0000BF6C 7FC3F378 */ mr r3, r30
/* 0000BF70 4BFF423D */ bl sprite_puts
/* 0000BF74 C0210064 */ lfs f1, 0x64(r1)
/* 0000BF78 4BFF4235 */ bl func_80071B1C
/* 0000BF7C 88010025 */ lbz r0, 0x25(r1)
/* 0000BF80 88610024 */ lbz r3, 0x24(r1)
/* 0000BF84 5400402E */ slwi r0, r0, 8
/* 0000BF88 88810026 */ lbz r4, 0x26(r1)
/* 0000BF8C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000BF90 7C830378 */ or r3, r4, r0
/* 0000BF94 4BFF4219 */ bl set_text_mul_color
/* 0000BF98 88010089 */ lbz r0, 0x89(r1)
/* 0000BF9C 88610088 */ lbz r3, 0x88(r1)
/* 0000BFA0 5400402E */ slwi r0, r0, 8
/* 0000BFA4 8881008A */ lbz r4, 0x8a(r1)
/* 0000BFA8 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000BFAC 7C830378 */ or r3, r4, r0
/* 0000BFB0 4BFF41FD */ bl set_text_add_color
/* 0000BFB4 C021001C */ lfs f1, 0x1c(r1)
/* 0000BFB8 C0410020 */ lfs f2, 0x20(r1)
/* 0000BFBC 4BFF41F1 */ bl set_text_pos
/* 0000BFC0 7FC3F378 */ mr r3, r30
/* 0000BFC4 4BFF41E9 */ bl sprite_puts
/* 0000BFC8 C85F02C0 */ lfd f2, 0x2c0(r31)
/* 0000BFCC C03B0000 */ lfs f1, 0(r27)
/* 0000BFD0 C81F00A8 */ lfd f0, 0xa8(r31)
/* 0000BFD4 FC22082A */ fadd f1, f2, f1
/* 0000BFD8 FC010028 */ fsub f0, f1, f0
/* 0000BFDC FC000018 */ frsp f0, f0
/* 0000BFE0 D001001C */ stfs f0, 0x1c(r1)
/* 0000BFE4 C01F02B8 */ lfs f0, 0x2b8(r31)
/* 0000BFE8 D0010020 */ stfs f0, 0x20(r1)
/* 0000BFEC 80180000 */ lwz r0, 0(r24)
/* 0000BFF0 2C000000 */ cmpwi r0, 0
/* 0000BFF4 40820028 */ bne lbl_0000C01C
/* 0000BFF8 386000FF */ li r3, 0xff
/* 0000BFFC 98610024 */ stb r3, 0x24(r1)
/* 0000C000 38000000 */ li r0, 0
/* 0000C004 98610025 */ stb r3, 0x25(r1)
/* 0000C008 98010026 */ stb r0, 0x26(r1)
/* 0000C00C 9B810088 */ stb r28, 0x88(r1)
/* 0000C010 9B810089 */ stb r28, 0x89(r1)
/* 0000C014 9B81008A */ stb r28, 0x8a(r1)
/* 0000C018 48000024 */ b lbl_0000C03C
lbl_0000C01C:
/* 0000C01C 3860008F */ li r3, 0x8f
/* 0000C020 98610024 */ stb r3, 0x24(r1)
/* 0000C024 38000000 */ li r0, 0
/* 0000C028 98610025 */ stb r3, 0x25(r1)
/* 0000C02C 98010026 */ stb r0, 0x26(r1)
/* 0000C030 98010088 */ stb r0, 0x88(r1)
/* 0000C034 98010089 */ stb r0, 0x89(r1)
/* 0000C038 9801008A */ stb r0, 0x8a(r1)
lbl_0000C03C:
/* 0000C03C 387E0000 */ addi r3, r30, 0
/* 0000C040 389D03D0 */ addi r4, r29, 0x3d0
/* 0000C044 4BFF4169 */ bl strcpy
/* 0000C048 4BFF4165 */ bl reset_text_draw_settings
/* 0000C04C 88610019 */ lbz r3, 0x19(r1)
/* 0000C050 4BFF415D */ bl set_text_font
/* 0000C054 C0210058 */ lfs f1, 0x58(r1)
/* 0000C058 C041005C */ lfs f2, 0x5c(r1)
/* 0000C05C 4BFF4151 */ bl set_text_scale
/* 0000C060 8061008C */ lwz r3, 0x8c(r1)
/* 0000C064 4BFF4149 */ bl func_80071B50
/* 0000C068 C83F0028 */ lfd f1, 0x28(r31)
/* 0000C06C C0010064 */ lfs f0, 0x64(r1)
/* 0000C070 FC21002A */ fadd f1, f1, f0
/* 0000C074 FC200818 */ frsp f1, f1
/* 0000C078 4BFF4135 */ bl func_80071B1C
/* 0000C07C 38600000 */ li r3, 0
/* 0000C080 4BFF412D */ bl set_text_mul_color
/* 0000C084 88010089 */ lbz r0, 0x89(r1)
/* 0000C088 88610088 */ lbz r3, 0x88(r1)
/* 0000C08C 5400402E */ slwi r0, r0, 8
/* 0000C090 8881008A */ lbz r4, 0x8a(r1)
/* 0000C094 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000C098 7C830378 */ or r3, r4, r0
/* 0000C09C 4BFF4111 */ bl set_text_add_color
/* 0000C0A0 C85F0030 */ lfd f2, 0x30(r31)
/* 0000C0A4 C021001C */ lfs f1, 0x1c(r1)
/* 0000C0A8 C0010020 */ lfs f0, 0x20(r1)
/* 0000C0AC FC22082A */ fadd f1, f2, f1
/* 0000C0B0 FC42002A */ fadd f2, f2, f0
/* 0000C0B4 FC200818 */ frsp f1, f1
/* 0000C0B8 FC401018 */ frsp f2, f2
/* 0000C0BC 4BFF40F1 */ bl set_text_pos
/* 0000C0C0 7FC3F378 */ mr r3, r30
/* 0000C0C4 4BFF40E9 */ bl sprite_puts
/* 0000C0C8 C0210064 */ lfs f1, 0x64(r1)
/* 0000C0CC 4BFF40E1 */ bl func_80071B1C
/* 0000C0D0 88010025 */ lbz r0, 0x25(r1)
/* 0000C0D4 88610024 */ lbz r3, 0x24(r1)
/* 0000C0D8 5400402E */ slwi r0, r0, 8
/* 0000C0DC 88810026 */ lbz r4, 0x26(r1)
/* 0000C0E0 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000C0E4 7C830378 */ or r3, r4, r0
/* 0000C0E8 4BFF40C5 */ bl set_text_mul_color
/* 0000C0EC 88010089 */ lbz r0, 0x89(r1)
/* 0000C0F0 88610088 */ lbz r3, 0x88(r1)
/* 0000C0F4 5400402E */ slwi r0, r0, 8
/* 0000C0F8 8881008A */ lbz r4, 0x8a(r1)
/* 0000C0FC 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000C100 7C830378 */ or r3, r4, r0
/* 0000C104 4BFF40A9 */ bl set_text_add_color
/* 0000C108 C021001C */ lfs f1, 0x1c(r1)
/* 0000C10C C0410020 */ lfs f2, 0x20(r1)
/* 0000C110 4BFF409D */ bl set_text_pos
/* 0000C114 7FC3F378 */ mr r3, r30
/* 0000C118 4BFF4095 */ bl sprite_puts
lbl_0000C11C:
/* 0000C11C 4BFF4091 */ bl mathutil_mtxA_from_identity
/* 0000C120 3C600000 */ lis r3, mathutilData@ha
/* 0000C124 38630000 */ addi r3, r3, mathutilData@l
/* 0000C128 80630000 */ lwz r3, 0(r3)
/* 0000C12C 38800000 */ li r4, 0
/* 0000C130 4BFF407D */ bl GXLoadPosMtxImm
/* 0000C134 BAC10100 */ lmw r22, 0x100(r1)
/* 0000C138 8001012C */ lwz r0, 0x12c(r1)
/* 0000C13C 38210128 */ addi r1, r1, 0x128
/* 0000C140 7C0803A6 */ mtlr r0
/* 0000C144 4E800020 */ blr 
