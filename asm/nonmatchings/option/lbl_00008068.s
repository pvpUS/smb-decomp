/* 00008068 7C0802A6 */ mflr r0
/* 0000806C 3C800000 */ lis r4, lbl_0000C8F0@ha
/* 00008070 90010004 */ stw r0, 4(r1)
/* 00008074 9421FEB0 */ stwu r1, -0x150(r1)
/* 00008078 BE810120 */ stmw r20, 0x120(r1)
/* 0000807C 3BC40000 */ addi r30, r4, lbl_0000C8F0@l
/* 00008080 3C800000 */ lis r4, lbl_0000C370@ha
/* 00008084 3BE40000 */ addi r31, r4, lbl_0000C370@l
/* 00008088 8863000F */ lbz r3, 0xf(r3)
/* 0000808C 7C630774 */ extsb r3, r3
/* 00008090 4BFFBEDD */ bl lbl_00003F6C
/* 00008094 28030000 */ cmplwi r3, 0
/* 00008098 41820040 */ beq lbl_000080D8
/* 0000809C C05F0000 */ lfs f2, 0(r31)
/* 000080A0 C0230004 */ lfs f1, 4(r3)
/* 000080A4 C0030008 */ lfs f0, 8(r3)
/* 000080A8 FC601090 */ fmr f3, f2
/* 000080AC EC21002A */ fadds f1, f1, f0
/* 000080B0 4BFF80FD */ bl mathutil_mtxA_from_translate_xyz
/* 000080B4 3C600000 */ lis r3, lbl_10000000@ha
/* 000080B8 38630000 */ addi r3, r3, lbl_10000000@l
/* 000080BC 38630184 */ addi r3, r3, 0x184
/* 000080C0 4BFF80ED */ bl mathutil_mtxA_to_mtx
/* 000080C4 3C600000 */ lis r3, mathutilData@ha
/* 000080C8 38630000 */ addi r3, r3, mathutilData@l
/* 000080CC 80630000 */ lwz r3, 0(r3)
/* 000080D0 38800000 */ li r4, 0
/* 000080D4 4BFF80D9 */ bl GXLoadPosMtxImm
lbl_000080D8:
/* 000080D8 7FC3F378 */ mr r3, r30
/* 000080DC 4BFF80D1 */ bl nlSprPut
/* 000080E0 C01F0088 */ lfs f0, 0x88(r31)
/* 000080E4 3AA100AC */ addi r21, r1, 0xac
/* 000080E8 388000B3 */ li r4, 0xb3
/* 000080EC D001006C */ stfs f0, 0x6c(r1)
/* 000080F0 3A800000 */ li r20, 0
/* 000080F4 3C000020 */ lis r0, 0x20
/* 000080F8 C01F0060 */ lfs f0, 0x60(r31)
/* 000080FC 7EA3AB78 */ mr r3, r21
/* 00008100 D0010060 */ stfs f0, 0x60(r1)
/* 00008104 C01F0060 */ lfs f0, 0x60(r31)
/* 00008108 D0010064 */ stfs f0, 0x64(r1)
/* 0000810C 98810021 */ stb r4, 0x21(r1)
/* 00008110 389E0D38 */ addi r4, r30, 0xd38
/* 00008114 9A810090 */ stb r20, 0x90(r1)
/* 00008118 9A810091 */ stb r20, 0x91(r1)
/* 0000811C 9A810092 */ stb r20, 0x92(r1)
/* 00008120 90010094 */ stw r0, 0x94(r1)
/* 00008124 C01F0060 */ lfs f0, 0x60(r31)
/* 00008128 D0010060 */ stfs f0, 0x60(r1)
/* 0000812C 4BFF8081 */ bl strcpy
/* 00008130 4BFF807D */ bl reset_text_draw_settings
/* 00008134 88610021 */ lbz r3, 0x21(r1)
/* 00008138 4BFF8075 */ bl set_text_font
/* 0000813C C0210060 */ lfs f1, 0x60(r1)
/* 00008140 C0410064 */ lfs f2, 0x64(r1)
/* 00008144 4BFF8069 */ bl set_text_scale
/* 00008148 80610094 */ lwz r3, 0x94(r1)
/* 0000814C 4BFF8061 */ bl func_80071B50
/* 00008150 C021006C */ lfs f1, 0x6c(r1)
/* 00008154 4BFF8059 */ bl func_80071B1C
/* 00008158 8801002D */ lbz r0, 0x2d(r1)
/* 0000815C 8861002C */ lbz r3, 0x2c(r1)
/* 00008160 5400402E */ slwi r0, r0, 8
/* 00008164 8881002E */ lbz r4, 0x2e(r1)
/* 00008168 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000816C 7C830378 */ or r3, r4, r0
/* 00008170 4BFF803D */ bl set_text_mul_color
/* 00008174 88010091 */ lbz r0, 0x91(r1)
/* 00008178 88610090 */ lbz r3, 0x90(r1)
/* 0000817C 5400402E */ slwi r0, r0, 8
/* 00008180 88810092 */ lbz r4, 0x92(r1)
/* 00008184 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00008188 7C830378 */ or r3, r4, r0
/* 0000818C 4BFF8021 */ bl set_text_add_color
/* 00008190 7EA3AB78 */ mr r3, r21
/* 00008194 4BFF8019 */ bl u_get_text_width
/* 00008198 C81F0058 */ lfd f0, 0x58(r31)
/* 0000819C 380000FF */ li r0, 0xff
/* 000081A0 C85F00A8 */ lfd f2, 0xa8(r31)
/* 000081A4 FC000072 */ fmul f0, f0, f1
/* 000081A8 FC020028 */ fsub f0, f2, f0
/* 000081AC FC000018 */ frsp f0, f0
/* 000081B0 D0010024 */ stfs f0, 0x24(r1)
/* 000081B4 C01F0090 */ lfs f0, 0x90(r31)
/* 000081B8 D0010028 */ stfs f0, 0x28(r1)
/* 000081BC 9801002C */ stb r0, 0x2c(r1)
/* 000081C0 9801002D */ stb r0, 0x2d(r1)
/* 000081C4 9A81002E */ stb r20, 0x2e(r1)
/* 000081C8 4BFF7FE5 */ bl reset_text_draw_settings
/* 000081CC 88610021 */ lbz r3, 0x21(r1)
/* 000081D0 4BFF7FDD */ bl set_text_font
/* 000081D4 C0210060 */ lfs f1, 0x60(r1)
/* 000081D8 C0410064 */ lfs f2, 0x64(r1)
/* 000081DC 4BFF7FD1 */ bl set_text_scale
/* 000081E0 80610094 */ lwz r3, 0x94(r1)
/* 000081E4 4BFF7FC9 */ bl func_80071B50
/* 000081E8 C83F0028 */ lfd f1, 0x28(r31)
/* 000081EC C001006C */ lfs f0, 0x6c(r1)
/* 000081F0 FC21002A */ fadd f1, f1, f0
/* 000081F4 FC200818 */ frsp f1, f1
/* 000081F8 4BFF7FB5 */ bl func_80071B1C
/* 000081FC 38600000 */ li r3, 0
/* 00008200 4BFF7FAD */ bl set_text_mul_color
/* 00008204 88010091 */ lbz r0, 0x91(r1)
/* 00008208 88610090 */ lbz r3, 0x90(r1)
/* 0000820C 5400402E */ slwi r0, r0, 8
/* 00008210 88810092 */ lbz r4, 0x92(r1)
/* 00008214 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00008218 7C830378 */ or r3, r4, r0
/* 0000821C 4BFF7F91 */ bl set_text_add_color
/* 00008220 C85F0030 */ lfd f2, 0x30(r31)
/* 00008224 C0210024 */ lfs f1, 0x24(r1)
/* 00008228 C0010028 */ lfs f0, 0x28(r1)
/* 0000822C FC22082A */ fadd f1, f2, f1
/* 00008230 FC42002A */ fadd f2, f2, f0
/* 00008234 FC200818 */ frsp f1, f1
/* 00008238 FC401018 */ frsp f2, f2
/* 0000823C 4BFF7F71 */ bl set_text_pos
/* 00008240 7EA3AB78 */ mr r3, r21
/* 00008244 4BFF7F69 */ bl sprite_puts
/* 00008248 C021006C */ lfs f1, 0x6c(r1)
/* 0000824C 4BFF7F61 */ bl func_80071B1C
/* 00008250 8801002D */ lbz r0, 0x2d(r1)
/* 00008254 8861002C */ lbz r3, 0x2c(r1)
/* 00008258 5400402E */ slwi r0, r0, 8
/* 0000825C 8881002E */ lbz r4, 0x2e(r1)
/* 00008260 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00008264 7C830378 */ or r3, r4, r0
/* 00008268 4BFF7F45 */ bl set_text_mul_color
/* 0000826C 88010091 */ lbz r0, 0x91(r1)
/* 00008270 88610090 */ lbz r3, 0x90(r1)
/* 00008274 5400402E */ slwi r0, r0, 8
/* 00008278 88810092 */ lbz r4, 0x92(r1)
/* 0000827C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00008280 7C830378 */ or r3, r4, r0
/* 00008284 4BFF7F29 */ bl set_text_add_color
/* 00008288 C0210024 */ lfs f1, 0x24(r1)
/* 0000828C C0410028 */ lfs f2, 0x28(r1)
/* 00008290 4BFF7F1D */ bl set_text_pos
/* 00008294 7EA3AB78 */ mr r3, r21
/* 00008298 4BFF7F15 */ bl sprite_puts
/* 0000829C C01F0060 */ lfs f0, 0x60(r31)
/* 000082A0 3C600000 */ lis r3, modeCtrl@ha
/* 000082A4 38630000 */ addi r3, r3, modeCtrl@l
/* 000082A8 D0010060 */ stfs f0, 0x60(r1)
/* 000082AC 380000B1 */ li r0, 0xb1
/* 000082B0 3B150000 */ addi r24, r21, 0
/* 000082B4 98010021 */ stb r0, 0x21(r1)
/* 000082B8 3BBE0CD8 */ addi r29, r30, 0xcd8
/* 000082BC 3B7E0A7C */ addi r27, r30, 0xa7c
/* 000082C0 3A9E0A2C */ addi r20, r30, 0xa2c
/* 000082C4 3B830042 */ addi r28, r3, 0x42
/* 000082C8 3B400000 */ li r26, 0
/* 000082CC 3F204330 */ lis r25, 0x4330
lbl_000082D0:
/* 000082D0 C01D0000 */ lfs f0, 0(r29)
/* 000082D4 7E83A378 */ mr r3, r20
/* 000082D8 D01E0A30 */ stfs f0, 0xa30(r30)
/* 000082DC C01D0004 */ lfs f0, 4(r29)
/* 000082E0 D01E0A34 */ stfs f0, 0xa34(r30)
/* 000082E4 4BFF7EC9 */ bl nlSprPut
/* 000082E8 881C0000 */ lbz r0, 0(r28)
/* 000082EC 7C1A0000 */ cmpw r26, r0
/* 000082F0 4082001C */ bne lbl_0000830C
/* 000082F4 386000FF */ li r3, 0xff
/* 000082F8 9861002C */ stb r3, 0x2c(r1)
/* 000082FC 38000000 */ li r0, 0
/* 00008300 9861002D */ stb r3, 0x2d(r1)
/* 00008304 9801002E */ stb r0, 0x2e(r1)
/* 00008308 48000018 */ b lbl_00008320
lbl_0000830C:
/* 0000830C 3860008F */ li r3, 0x8f
/* 00008310 9861002C */ stb r3, 0x2c(r1)
/* 00008314 38000000 */ li r0, 0
/* 00008318 9861002D */ stb r3, 0x2d(r1)
/* 0000831C 9801002E */ stb r0, 0x2e(r1)
lbl_00008320:
/* 00008320 C03D0000 */ lfs f1, 0(r29)
/* 00008324 7EA3AB78 */ mr r3, r21
/* 00008328 C01D0014 */ lfs f0, 0x14(r29)
/* 0000832C EC01002A */ fadds f0, f1, f0
/* 00008330 D0010024 */ stfs f0, 0x24(r1)
/* 00008334 C03D0004 */ lfs f1, 4(r29)
/* 00008338 C81F0048 */ lfd f0, 0x48(r31)
/* 0000833C FC010028 */ fsub f0, f1, f0
/* 00008340 FC000018 */ frsp f0, f0
/* 00008344 D0010028 */ stfs f0, 0x28(r1)
/* 00008348 809D0010 */ lwz r4, 0x10(r29)
/* 0000834C 4BFF7E61 */ bl strcpy
/* 00008350 4BFF7E5D */ bl reset_text_draw_settings
/* 00008354 88610021 */ lbz r3, 0x21(r1)
/* 00008358 4BFF7E55 */ bl set_text_font
/* 0000835C C0210060 */ lfs f1, 0x60(r1)
/* 00008360 C0410064 */ lfs f2, 0x64(r1)
/* 00008364 4BFF7E49 */ bl set_text_scale
/* 00008368 80610094 */ lwz r3, 0x94(r1)
/* 0000836C 4BFF7E41 */ bl func_80071B50
/* 00008370 C83F0028 */ lfd f1, 0x28(r31)
/* 00008374 C001006C */ lfs f0, 0x6c(r1)
/* 00008378 FC21002A */ fadd f1, f1, f0
/* 0000837C FC200818 */ frsp f1, f1
/* 00008380 4BFF7E2D */ bl func_80071B1C
/* 00008384 38600000 */ li r3, 0
/* 00008388 4BFF7E25 */ bl set_text_mul_color
/* 0000838C 88010091 */ lbz r0, 0x91(r1)
/* 00008390 88610090 */ lbz r3, 0x90(r1)
/* 00008394 5400402E */ slwi r0, r0, 8
/* 00008398 88810092 */ lbz r4, 0x92(r1)
/* 0000839C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000083A0 7C830378 */ or r3, r4, r0
/* 000083A4 4BFF7E09 */ bl set_text_add_color
/* 000083A8 C85F0030 */ lfd f2, 0x30(r31)
/* 000083AC C0210024 */ lfs f1, 0x24(r1)
/* 000083B0 C0010028 */ lfs f0, 0x28(r1)
/* 000083B4 FC22082A */ fadd f1, f2, f1
/* 000083B8 FC42002A */ fadd f2, f2, f0
/* 000083BC FC200818 */ frsp f1, f1
/* 000083C0 FC401018 */ frsp f2, f2
/* 000083C4 4BFF7DE9 */ bl set_text_pos
/* 000083C8 7EA3AB78 */ mr r3, r21
/* 000083CC 4BFF7DE1 */ bl sprite_puts
/* 000083D0 C021006C */ lfs f1, 0x6c(r1)
/* 000083D4 4BFF7DD9 */ bl func_80071B1C
/* 000083D8 8801002D */ lbz r0, 0x2d(r1)
/* 000083DC 8861002C */ lbz r3, 0x2c(r1)
/* 000083E0 5400402E */ slwi r0, r0, 8
/* 000083E4 8881002E */ lbz r4, 0x2e(r1)
/* 000083E8 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000083EC 7C830378 */ or r3, r4, r0
/* 000083F0 4BFF7DBD */ bl set_text_mul_color
/* 000083F4 88010091 */ lbz r0, 0x91(r1)
/* 000083F8 88610090 */ lbz r3, 0x90(r1)
/* 000083FC 5400402E */ slwi r0, r0, 8
/* 00008400 88810092 */ lbz r4, 0x92(r1)
/* 00008404 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00008408 7C830378 */ or r3, r4, r0
/* 0000840C 4BFF7DA1 */ bl set_text_add_color
/* 00008410 C0210024 */ lfs f1, 0x24(r1)
/* 00008414 C0410028 */ lfs f2, 0x28(r1)
/* 00008418 4BFF7D95 */ bl set_text_pos
/* 0000841C 7EA3AB78 */ mr r3, r21
/* 00008420 4BFF7D8D */ bl sprite_puts
/* 00008424 82FD0008 */ lwz r23, 8(r29)
/* 00008428 3AC00000 */ li r22, 0
/* 0000842C 480002C4 */ b lbl_000086F0
lbl_00008430:
/* 00008430 C83F0058 */ lfd f1, 0x58(r31)
/* 00008434 C0170008 */ lfs f0, 8(r23)
/* 00008438 C0570000 */ lfs f2, 0(r23)
/* 0000843C FC010032 */ fmul f0, f1, f0
/* 00008440 C87F01B0 */ lfd f3, 0x1b0(r31)
/* 00008444 C09D0000 */ lfs f4, 0(r29)
/* 00008448 FC02002A */ fadd f0, f2, f0
/* 0000844C FC000828 */ fsub f0, f0, f1
/* 00008450 FC030032 */ fmul f0, f3, f0
/* 00008454 FC04002A */ fadd f0, f4, f0
/* 00008458 FC000018 */ frsp f0, f0
/* 0000845C D01E0A80 */ stfs f0, 0xa80(r30)
/* 00008460 C83F0058 */ lfd f1, 0x58(r31)
/* 00008464 C017000C */ lfs f0, 0xc(r23)
/* 00008468 C0570004 */ lfs f2, 4(r23)
/* 0000846C FC010032 */ fmul f0, f1, f0
/* 00008470 C87F01B8 */ lfd f3, 0x1b8(r31)
/* 00008474 C09D0004 */ lfs f4, 4(r29)
/* 00008478 FC02002A */ fadd f0, f2, f0
/* 0000847C FC000828 */ fsub f0, f0, f1
/* 00008480 FC030032 */ fmul f0, f3, f0
/* 00008484 FC04002A */ fadd f0, f4, f0
/* 00008488 FC000018 */ frsp f0, f0
/* 0000848C D01E0A84 */ stfs f0, 0xa84(r30)
/* 00008490 C85F01B0 */ lfd f2, 0x1b0(r31)
/* 00008494 C0370008 */ lfs f1, 8(r23)
/* 00008498 C81F01C0 */ lfd f0, 0x1c0(r31)
/* 0000849C FC220072 */ fmul f1, f2, f1
/* 000084A0 FC010032 */ fmul f0, f1, f0
/* 000084A4 FC000018 */ frsp f0, f0
/* 000084A8 D01E0A8C */ stfs f0, 0xa8c(r30)
/* 000084AC C85F01B8 */ lfd f2, 0x1b8(r31)
/* 000084B0 C037000C */ lfs f1, 0xc(r23)
/* 000084B4 C81F01C0 */ lfd f0, 0x1c0(r31)
/* 000084B8 FC220072 */ fmul f1, f2, f1
/* 000084BC FC010032 */ fmul f0, f1, f0
/* 000084C0 FC000018 */ frsp f0, f0
/* 000084C4 D01E0A90 */ stfs f0, 0xa90(r30)
/* 000084C8 881C0000 */ lbz r0, 0(r28)
/* 000084CC 7C1A0000 */ cmpw r26, r0
/* 000084D0 40820010 */ bne lbl_000084E0
/* 000084D4 80170010 */ lwz r0, 0x10(r23)
/* 000084D8 901B0038 */ stw r0, 0x38(r27)
/* 000084DC 480000D0 */ b lbl_000085AC
lbl_000084E0:
/* 000084E0 80D70010 */ lwz r6, 0x10(r23)
/* 000084E4 3CA00000 */ lis r5, lbl_0000C4B0@ha
/* 000084E8 3C600000 */ lis r3, lbl_0000C4B0@ha
/* 000084EC C8650000 */ lfd f3, lbl_0000C4B0@l(r5)
/* 000084F0 54C7463E */ srwi r7, r6, 0x18
/* 000084F4 54C0863E */ rlwinm r0, r6, 0x10, 0x18, 0x1f
/* 000084F8 90E1011C */ stw r7, 0x11c(r1)
/* 000084FC 54C4C63E */ rlwinm r4, r6, 0x18, 0x18, 0x1f
/* 00008500 C8230000 */ lfd f1, lbl_0000C4B0@l(r3)
/* 00008504 9001010C */ stw r0, 0x10c(r1)
/* 00008508 54C6063E */ clrlwi r6, r6, 0x18
/* 0000850C C0BF0158 */ lfs f5, 0x158(r31)
/* 00008510 3C600000 */ lis r3, lbl_0000C4B0@ha
/* 00008514 908100FC */ stw r4, 0xfc(r1)
/* 00008518 3C800000 */ lis r4, lbl_0000C4B0@ha
/* 0000851C 93210118 */ stw r25, 0x118(r1)
/* 00008520 93210108 */ stw r25, 0x108(r1)
/* 00008524 C8410118 */ lfd f2, 0x118(r1)
/* 00008528 90C100EC */ stw r6, 0xec(r1)
/* 0000852C EC421828 */ fsubs f2, f2, f3
/* 00008530 C8010108 */ lfd f0, 0x108(r1)
/* 00008534 932100F8 */ stw r25, 0xf8(r1)
/* 00008538 EC600828 */ fsubs f3, f0, f1
/* 0000853C C8240000 */ lfd f1, lbl_0000C4B0@l(r4)
/* 00008540 EC820172 */ fmuls f4, f2, f5
/* 00008544 C80100F8 */ lfd f0, 0xf8(r1)
/* 00008548 932100E8 */ stw r25, 0xe8(r1)
/* 0000854C EC400828 */ fsubs f2, f0, f1
/* 00008550 C8230000 */ lfd f1, lbl_0000C4B0@l(r3)
/* 00008554 C80100E8 */ lfd f0, 0xe8(r1)
/* 00008558 FC80201E */ fctiwz f4, f4
/* 0000855C EC630172 */ fmuls f3, f3, f5
/* 00008560 EC000828 */ fsubs f0, f0, f1
/* 00008564 EC220172 */ fmuls f1, f2, f5
/* 00008568 D8810110 */ stfd f4, 0x110(r1)
/* 0000856C FC40181E */ fctiwz f2, f3
/* 00008570 EC000172 */ fmuls f0, f0, f5
/* 00008574 FC20081E */ fctiwz f1, f1
/* 00008578 D8410100 */ stfd f2, 0x100(r1)
/* 0000857C FC00001E */ fctiwz f0, f0
/* 00008580 80E10114 */ lwz r7, 0x114(r1)
/* 00008584 D82100F0 */ stfd f1, 0xf0(r1)
/* 00008588 80010104 */ lwz r0, 0x104(r1)
/* 0000858C D80100E0 */ stfd f0, 0xe0(r1)
/* 00008590 5400821E */ rlwinm r0, r0, 0x10, 8, 0xf
/* 00008594 808100F4 */ lwz r4, 0xf4(r1)
/* 00008598 50E0C00E */ rlwimi r0, r7, 0x18, 0, 7
/* 0000859C 80C100E4 */ lwz r6, 0xe4(r1)
/* 000085A0 5080442E */ rlwimi r0, r4, 8, 0x10, 0x17
/* 000085A4 50C0063E */ rlwimi r0, r6, 0, 0x18, 0x1f
/* 000085A8 901B0038 */ stw r0, 0x38(r27)
lbl_000085AC:
/* 000085AC 7F63DB78 */ mr r3, r27
/* 000085B0 4BFF7BFD */ bl nlSprPut
/* 000085B4 C03B0004 */ lfs f1, 4(r27)
/* 000085B8 7F03C378 */ mr r3, r24
/* 000085BC C0170018 */ lfs f0, 0x18(r23)
/* 000085C0 EC010028 */ fsubs f0, f1, f0
/* 000085C4 D0010024 */ stfs f0, 0x24(r1)
/* 000085C8 C03B0008 */ lfs f1, 8(r27)
/* 000085CC C81F0048 */ lfd f0, 0x48(r31)
/* 000085D0 FC010028 */ fsub f0, f1, f0
/* 000085D4 FC000018 */ frsp f0, f0
/* 000085D8 D0010028 */ stfs f0, 0x28(r1)
/* 000085DC 80970014 */ lwz r4, 0x14(r23)
/* 000085E0 4BFF7BCD */ bl strcpy
/* 000085E4 881C0000 */ lbz r0, 0(r28)
/* 000085E8 7C1A0000 */ cmpw r26, r0
/* 000085EC 40820018 */ bne lbl_00008604
/* 000085F0 380000FF */ li r0, 0xff
/* 000085F4 9801002C */ stb r0, 0x2c(r1)
/* 000085F8 9801002D */ stb r0, 0x2d(r1)
/* 000085FC 9801002E */ stb r0, 0x2e(r1)
/* 00008600 48000014 */ b lbl_00008614
lbl_00008604:
/* 00008604 3800008F */ li r0, 0x8f
/* 00008608 9801002C */ stb r0, 0x2c(r1)
/* 0000860C 9801002D */ stb r0, 0x2d(r1)
/* 00008610 9801002E */ stb r0, 0x2e(r1)
lbl_00008614:
/* 00008614 4BFF7B99 */ bl reset_text_draw_settings
/* 00008618 88610021 */ lbz r3, 0x21(r1)
/* 0000861C 4BFF7B91 */ bl set_text_font
/* 00008620 C0210060 */ lfs f1, 0x60(r1)
/* 00008624 C0410064 */ lfs f2, 0x64(r1)
/* 00008628 4BFF7B85 */ bl set_text_scale
/* 0000862C 80610094 */ lwz r3, 0x94(r1)
/* 00008630 4BFF7B7D */ bl func_80071B50
/* 00008634 C83F0028 */ lfd f1, 0x28(r31)
/* 00008638 C001006C */ lfs f0, 0x6c(r1)
/* 0000863C FC21002A */ fadd f1, f1, f0
/* 00008640 FC200818 */ frsp f1, f1
/* 00008644 4BFF7B69 */ bl func_80071B1C
/* 00008648 38600000 */ li r3, 0
/* 0000864C 4BFF7B61 */ bl set_text_mul_color
/* 00008650 88010091 */ lbz r0, 0x91(r1)
/* 00008654 88610090 */ lbz r3, 0x90(r1)
/* 00008658 5400402E */ slwi r0, r0, 8
/* 0000865C 88810092 */ lbz r4, 0x92(r1)
/* 00008660 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00008664 7C830378 */ or r3, r4, r0
/* 00008668 4BFF7B45 */ bl set_text_add_color
/* 0000866C C85F0030 */ lfd f2, 0x30(r31)
/* 00008670 C0210024 */ lfs f1, 0x24(r1)
/* 00008674 C0010028 */ lfs f0, 0x28(r1)
/* 00008678 FC22082A */ fadd f1, f2, f1
/* 0000867C FC42002A */ fadd f2, f2, f0
/* 00008680 FC200818 */ frsp f1, f1
/* 00008684 FC401018 */ frsp f2, f2
/* 00008688 4BFF7B25 */ bl set_text_pos
/* 0000868C 7F03C378 */ mr r3, r24
/* 00008690 4BFF7B1D */ bl sprite_puts
/* 00008694 C021006C */ lfs f1, 0x6c(r1)
/* 00008698 4BFF7B15 */ bl func_80071B1C
/* 0000869C 8801002D */ lbz r0, 0x2d(r1)
/* 000086A0 8861002C */ lbz r3, 0x2c(r1)
/* 000086A4 5400402E */ slwi r0, r0, 8
/* 000086A8 8881002E */ lbz r4, 0x2e(r1)
/* 000086AC 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000086B0 7C830378 */ or r3, r4, r0
/* 000086B4 4BFF7AF9 */ bl set_text_mul_color
/* 000086B8 88010091 */ lbz r0, 0x91(r1)
/* 000086BC 88610090 */ lbz r3, 0x90(r1)
/* 000086C0 5400402E */ slwi r0, r0, 8
/* 000086C4 88810092 */ lbz r4, 0x92(r1)
/* 000086C8 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000086CC 7C830378 */ or r3, r4, r0
/* 000086D0 4BFF7ADD */ bl set_text_add_color
/* 000086D4 C0210024 */ lfs f1, 0x24(r1)
/* 000086D8 C0410028 */ lfs f2, 0x28(r1)
/* 000086DC 4BFF7AD1 */ bl set_text_pos
/* 000086E0 7F03C378 */ mr r3, r24
/* 000086E4 4BFF7AC9 */ bl sprite_puts
/* 000086E8 3AD60001 */ addi r22, r22, 1
/* 000086EC 3AF7001C */ addi r23, r23, 0x1c
lbl_000086F0:
/* 000086F0 801D000C */ lwz r0, 0xc(r29)
/* 000086F4 7C160000 */ cmpw r22, r0
/* 000086F8 4180FD38 */ blt lbl_00008430
/* 000086FC 3B5A0001 */ addi r26, r26, 1
/* 00008700 281A0004 */ cmplwi r26, 4
/* 00008704 3BBD0018 */ addi r29, r29, 0x18
/* 00008708 4180FBC8 */ blt lbl_000082D0
/* 0000870C 387E00F0 */ addi r3, r30, 0xf0
/* 00008710 4BFF7A9D */ bl nlSprPut
/* 00008714 380000B3 */ li r0, 0xb3
/* 00008718 98010021 */ stb r0, 0x21(r1)
/* 0000871C 38A000FF */ li r5, 0xff
/* 00008720 38000000 */ li r0, 0
/* 00008724 98A1002C */ stb r5, 0x2c(r1)
/* 00008728 38750000 */ addi r3, r21, 0
/* 0000872C 389E0D50 */ addi r4, r30, 0xd50
/* 00008730 98A1002D */ stb r5, 0x2d(r1)
/* 00008734 9801002E */ stb r0, 0x2e(r1)
/* 00008738 C01F01C8 */ lfs f0, 0x1c8(r31)
/* 0000873C D0010060 */ stfs f0, 0x60(r1)
/* 00008740 4BFF7A6D */ bl strcpy
/* 00008744 4BFF7A69 */ bl reset_text_draw_settings
/* 00008748 88610021 */ lbz r3, 0x21(r1)
/* 0000874C 4BFF7A61 */ bl set_text_font
/* 00008750 C0210060 */ lfs f1, 0x60(r1)
/* 00008754 C0410064 */ lfs f2, 0x64(r1)
/* 00008758 4BFF7A55 */ bl set_text_scale
/* 0000875C 80610094 */ lwz r3, 0x94(r1)
/* 00008760 4BFF7A4D */ bl func_80071B50
/* 00008764 C021006C */ lfs f1, 0x6c(r1)
/* 00008768 4BFF7A45 */ bl func_80071B1C
/* 0000876C 8801002D */ lbz r0, 0x2d(r1)
/* 00008770 8861002C */ lbz r3, 0x2c(r1)
/* 00008774 5400402E */ slwi r0, r0, 8
/* 00008778 8881002E */ lbz r4, 0x2e(r1)
/* 0000877C 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00008780 7C830378 */ or r3, r4, r0
/* 00008784 4BFF7A29 */ bl set_text_mul_color
/* 00008788 88010091 */ lbz r0, 0x91(r1)
/* 0000878C 88610090 */ lbz r3, 0x90(r1)
/* 00008790 5400402E */ slwi r0, r0, 8
/* 00008794 88810092 */ lbz r4, 0x92(r1)
/* 00008798 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000879C 7C830378 */ or r3, r4, r0
/* 000087A0 4BFF7A0D */ bl set_text_add_color
/* 000087A4 7EA3AB78 */ mr r3, r21
/* 000087A8 4BFF7A05 */ bl u_get_text_width
/* 000087AC C81F0058 */ lfd f0, 0x58(r31)
/* 000087B0 C85F00A8 */ lfd f2, 0xa8(r31)
/* 000087B4 FC000072 */ fmul f0, f0, f1
/* 000087B8 FC020028 */ fsub f0, f2, f0
/* 000087BC FC000018 */ frsp f0, f0
/* 000087C0 D0010024 */ stfs f0, 0x24(r1)
/* 000087C4 C01F0120 */ lfs f0, 0x120(r31)
/* 000087C8 D0010028 */ stfs f0, 0x28(r1)
/* 000087CC 4BFF79E1 */ bl reset_text_draw_settings
/* 000087D0 88610021 */ lbz r3, 0x21(r1)
/* 000087D4 4BFF79D9 */ bl set_text_font
/* 000087D8 C0210060 */ lfs f1, 0x60(r1)
/* 000087DC C0410064 */ lfs f2, 0x64(r1)
/* 000087E0 4BFF79CD */ bl set_text_scale
/* 000087E4 80610094 */ lwz r3, 0x94(r1)
/* 000087E8 4BFF79C5 */ bl func_80071B50
/* 000087EC C83F0028 */ lfd f1, 0x28(r31)
/* 000087F0 C001006C */ lfs f0, 0x6c(r1)
/* 000087F4 FC21002A */ fadd f1, f1, f0
/* 000087F8 FC200818 */ frsp f1, f1
/* 000087FC 4BFF79B1 */ bl func_80071B1C
/* 00008800 38600000 */ li r3, 0
/* 00008804 4BFF79A9 */ bl set_text_mul_color
/* 00008808 88010091 */ lbz r0, 0x91(r1)
/* 0000880C 88610090 */ lbz r3, 0x90(r1)
/* 00008810 5400402E */ slwi r0, r0, 8
/* 00008814 88810092 */ lbz r4, 0x92(r1)
/* 00008818 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000881C 7C830378 */ or r3, r4, r0
/* 00008820 4BFF798D */ bl set_text_add_color
/* 00008824 C85F0030 */ lfd f2, 0x30(r31)
/* 00008828 C0210024 */ lfs f1, 0x24(r1)
/* 0000882C C0010028 */ lfs f0, 0x28(r1)
/* 00008830 FC22082A */ fadd f1, f2, f1
/* 00008834 FC42002A */ fadd f2, f2, f0
/* 00008838 FC200818 */ frsp f1, f1
/* 0000883C FC401018 */ frsp f2, f2
/* 00008840 4BFF796D */ bl set_text_pos
/* 00008844 7EA3AB78 */ mr r3, r21
/* 00008848 4BFF7965 */ bl sprite_puts
/* 0000884C C021006C */ lfs f1, 0x6c(r1)
/* 00008850 4BFF795D */ bl func_80071B1C
/* 00008854 8801002D */ lbz r0, 0x2d(r1)
/* 00008858 8861002C */ lbz r3, 0x2c(r1)
/* 0000885C 5400402E */ slwi r0, r0, 8
/* 00008860 8881002E */ lbz r4, 0x2e(r1)
/* 00008864 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00008868 7C830378 */ or r3, r4, r0
/* 0000886C 4BFF7941 */ bl set_text_mul_color
/* 00008870 88010091 */ lbz r0, 0x91(r1)
/* 00008874 88610090 */ lbz r3, 0x90(r1)
/* 00008878 5400402E */ slwi r0, r0, 8
/* 0000887C 88810092 */ lbz r4, 0x92(r1)
/* 00008880 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00008884 7C830378 */ or r3, r4, r0
/* 00008888 4BFF7925 */ bl set_text_add_color
/* 0000888C C0210024 */ lfs f1, 0x24(r1)
/* 00008890 C0410028 */ lfs f2, 0x28(r1)
/* 00008894 4BFF7919 */ bl set_text_pos
/* 00008898 7EA3AB78 */ mr r3, r21
/* 0000889C 4BFF7911 */ bl sprite_puts
/* 000088A0 38750000 */ addi r3, r21, 0
/* 000088A4 389E0D80 */ addi r4, r30, 0xd80
/* 000088A8 4BFF7905 */ bl strcpy
/* 000088AC 4BFF7901 */ bl reset_text_draw_settings
/* 000088B0 88610021 */ lbz r3, 0x21(r1)
/* 000088B4 4BFF78F9 */ bl set_text_font
/* 000088B8 C0210060 */ lfs f1, 0x60(r1)
/* 000088BC C0410064 */ lfs f2, 0x64(r1)
/* 000088C0 4BFF78ED */ bl set_text_scale
/* 000088C4 80610094 */ lwz r3, 0x94(r1)
/* 000088C8 4BFF78E5 */ bl func_80071B50
/* 000088CC C021006C */ lfs f1, 0x6c(r1)
/* 000088D0 4BFF78DD */ bl func_80071B1C
/* 000088D4 8801002D */ lbz r0, 0x2d(r1)
/* 000088D8 8861002C */ lbz r3, 0x2c(r1)
/* 000088DC 5400402E */ slwi r0, r0, 8
/* 000088E0 8881002E */ lbz r4, 0x2e(r1)
/* 000088E4 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000088E8 7C830378 */ or r3, r4, r0
/* 000088EC 4BFF78C1 */ bl set_text_mul_color
/* 000088F0 88010091 */ lbz r0, 0x91(r1)
/* 000088F4 88610090 */ lbz r3, 0x90(r1)
/* 000088F8 5400402E */ slwi r0, r0, 8
/* 000088FC 88810092 */ lbz r4, 0x92(r1)
/* 00008900 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00008904 7C830378 */ or r3, r4, r0
/* 00008908 4BFF78A5 */ bl set_text_add_color
/* 0000890C 7EA3AB78 */ mr r3, r21
/* 00008910 4BFF789D */ bl u_get_text_width
/* 00008914 C81F0058 */ lfd f0, 0x58(r31)
/* 00008918 C85F00A8 */ lfd f2, 0xa8(r31)
/* 0000891C FC000072 */ fmul f0, f0, f1
/* 00008920 FC020028 */ fsub f0, f2, f0
/* 00008924 FC000018 */ frsp f0, f0
/* 00008928 D0010024 */ stfs f0, 0x24(r1)
/* 0000892C C01F01CC */ lfs f0, 0x1cc(r31)
/* 00008930 D0010028 */ stfs f0, 0x28(r1)
/* 00008934 4BFF7879 */ bl reset_text_draw_settings
/* 00008938 88610021 */ lbz r3, 0x21(r1)
/* 0000893C 4BFF7871 */ bl set_text_font
/* 00008940 C0210060 */ lfs f1, 0x60(r1)
/* 00008944 C0410064 */ lfs f2, 0x64(r1)
/* 00008948 4BFF7865 */ bl set_text_scale
/* 0000894C 80610094 */ lwz r3, 0x94(r1)
/* 00008950 4BFF785D */ bl func_80071B50
/* 00008954 C83F0028 */ lfd f1, 0x28(r31)
/* 00008958 C001006C */ lfs f0, 0x6c(r1)
/* 0000895C FC21002A */ fadd f1, f1, f0
/* 00008960 FC200818 */ frsp f1, f1
/* 00008964 4BFF7849 */ bl func_80071B1C
/* 00008968 38600000 */ li r3, 0
/* 0000896C 4BFF7841 */ bl set_text_mul_color
/* 00008970 88010091 */ lbz r0, 0x91(r1)
/* 00008974 88610090 */ lbz r3, 0x90(r1)
/* 00008978 5400402E */ slwi r0, r0, 8
/* 0000897C 88810092 */ lbz r4, 0x92(r1)
/* 00008980 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 00008984 7C830378 */ or r3, r4, r0
/* 00008988 4BFF7825 */ bl set_text_add_color
/* 0000898C C85F0030 */ lfd f2, 0x30(r31)
/* 00008990 C0210024 */ lfs f1, 0x24(r1)
/* 00008994 C0010028 */ lfs f0, 0x28(r1)
/* 00008998 FC22082A */ fadd f1, f2, f1
/* 0000899C FC42002A */ fadd f2, f2, f0
/* 000089A0 FC200818 */ frsp f1, f1
/* 000089A4 FC401018 */ frsp f2, f2
/* 000089A8 4BFF7805 */ bl set_text_pos
/* 000089AC 7EA3AB78 */ mr r3, r21
/* 000089B0 4BFF77FD */ bl sprite_puts
/* 000089B4 C021006C */ lfs f1, 0x6c(r1)
/* 000089B8 4BFF77F5 */ bl func_80071B1C
/* 000089BC 8801002D */ lbz r0, 0x2d(r1)
/* 000089C0 8861002C */ lbz r3, 0x2c(r1)
/* 000089C4 5400402E */ slwi r0, r0, 8
/* 000089C8 8881002E */ lbz r4, 0x2e(r1)
/* 000089CC 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000089D0 7C830378 */ or r3, r4, r0
/* 000089D4 4BFF77D9 */ bl set_text_mul_color
/* 000089D8 88010091 */ lbz r0, 0x91(r1)
/* 000089DC 88610090 */ lbz r3, 0x90(r1)
/* 000089E0 5400402E */ slwi r0, r0, 8
/* 000089E4 88810092 */ lbz r4, 0x92(r1)
/* 000089E8 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 000089EC 7C830378 */ or r3, r4, r0
/* 000089F0 4BFF77BD */ bl set_text_add_color
/* 000089F4 C0210024 */ lfs f1, 0x24(r1)
/* 000089F8 C0410028 */ lfs f2, 0x28(r1)
/* 000089FC 4BFF77B1 */ bl set_text_pos
/* 00008A00 7EA3AB78 */ mr r3, r21
/* 00008A04 4BFF77A9 */ bl sprite_puts
/* 00008A08 4BFF77A5 */ bl mathutil_mtxA_from_identity
/* 00008A0C 3C600000 */ lis r3, mathutilData@ha
/* 00008A10 38630000 */ addi r3, r3, mathutilData@l
/* 00008A14 80630000 */ lwz r3, 0(r3)
/* 00008A18 38800000 */ li r4, 0
/* 00008A1C 4BFF7791 */ bl GXLoadPosMtxImm
/* 00008A20 BA810120 */ lmw r20, 0x120(r1)
/* 00008A24 80010154 */ lwz r0, 0x154(r1)
/* 00008A28 38210150 */ addi r1, r1, 0x150
/* 00008A2C 7C0803A6 */ mtlr r0
/* 00008A30 4E800020 */ blr 
