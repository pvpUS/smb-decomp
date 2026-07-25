/* 000080D4 7C0802A6 */ mflr r0
/* 000080D8 90010004 */ stw r0, 4(r1)
/* 000080DC 9421FFB8 */ stwu r1, -0x48(r1)
/* 000080E0 DBE10040 */ stfd f31, 0x40(r1)
/* 000080E4 DBC10038 */ stfd f30, 0x38(r1)
/* 000080E8 BEE10014 */ stmw r23, 0x14(r1)
/* 000080EC 3BE30000 */ addi r31, r3, 0
/* 000080F0 3C600000 */ lis r3, lbl_0001C108@ha
/* 000080F4 3BA30000 */ addi r29, r3, lbl_0001C108@l
/* 000080F8 387F0034 */ addi r3, r31, 0x34
/* 000080FC 4BFF8069 */ bl mathutil_mtxA_from_mtxB_translate
/* 00008100 A87F004E */ lha r3, 0x4e(r31)
/* 00008104 4BFF8061 */ bl mathutil_mtxA_rotate_y
/* 00008108 A87F004C */ lha r3, 0x4c(r31)
/* 0000810C 4BFF8059 */ bl mathutil_mtxA_rotate_x
/* 00008110 A87F0050 */ lha r3, 0x50(r31)
/* 00008114 4BFF8051 */ bl mathutil_mtxA_rotate_z
/* 00008118 A81F004E */ lha r0, 0x4e(r31)
/* 0000811C 3B200000 */ li r25, 0
/* 00008120 A89F00A2 */ lha r4, 0xa2(r31)
/* 00008124 3C600000 */ lis r3, mathutilData@ha
/* 00008128 5400103A */ slwi r0, r0, 2
/* 0000812C A8FF00A0 */ lha r7, 0xa0(r31)
/* 00008130 7D040214 */ add r8, r4, r0
/* 00008134 A8DF004C */ lha r6, 0x4c(r31)
/* 00008138 5720103A */ slwi r0, r25, 2
/* 0000813C A8BF00A4 */ lha r5, 0xa4(r31)
/* 00008140 A89F0050 */ lha r4, 0x50(r31)
/* 00008144 7F073214 */ add r24, r7, r6
/* 00008148 835F0030 */ lwz r26, 0x30(r31)
/* 0000814C 7F804214 */ add r28, r0, r8
/* 00008150 C3DF0088 */ lfs f30, 0x88(r31)
/* 00008154 7EE52214 */ add r23, r5, r4
/* 00008158 3BC30000 */ addi r30, r3, mathutilData@l
/* 0000815C 3B60000C */ li r27, 0xc
lbl_00008160:
/* 00008160 4BFF8005 */ bl mathutil_mtxA_push
/* 00008164 7F23CB78 */ mr r3, r25
/* 00008168 4BFF7FFD */ bl mathutil_mtxA_rotate_y
/* 0000816C C03D0000 */ lfs f1, 0(r29)
/* 00008170 FC60F090 */ fmr f3, f30
/* 00008174 FC400890 */ fmr f2, f1
/* 00008178 4BFF7FED */ bl mathutil_mtxA_translate_xyz
/* 0000817C 576007FF */ clrlwi. r0, r27, 0x1f
/* 00008180 41820014 */ beq lbl_00008194
/* 00008184 C03D0068 */ lfs f1, 0x68(r29)
/* 00008188 C01F00A8 */ lfs f0, 0xa8(r31)
/* 0000818C EFE10032 */ fmuls f31, f1, f0
/* 00008190 48000010 */ b lbl_000081A0
lbl_00008194:
/* 00008194 C03D006C */ lfs f1, 0x6c(r29)
/* 00008198 C01F00A8 */ lfs f0, 0xa8(r31)
/* 0000819C EFE10032 */ fmuls f31, f1, f0
lbl_000081A0:
/* 000081A0 FC20F890 */ fmr f1, f31
/* 000081A4 4BFF7FC1 */ bl mathutil_mtxA_scale_s
/* 000081A8 FC40F890 */ fmr f2, f31
/* 000081AC C03A0014 */ lfs f1, 0x14(r26)
/* 000081B0 387A0008 */ addi r3, r26, 8
/* 000081B4 4BFF7FB1 */ bl test_scaled_sphere_in_frustum
/* 000081B8 2C030000 */ cmpwi r3, 0
/* 000081BC 4082000C */ bne lbl_000081C8
/* 000081C0 4BFF7FA5 */ bl mathutil_mtxA_pop
/* 000081C4 48000048 */ b lbl_0000820C
lbl_000081C8:
/* 000081C8 7F83E378 */ mr r3, r28
/* 000081CC 4BFF7F99 */ bl mathutil_mtxA_rotate_y
/* 000081D0 7F03C378 */ mr r3, r24
/* 000081D4 4BFF7F91 */ bl mathutil_mtxA_rotate_x
/* 000081D8 7C79BA14 */ add r3, r25, r23
/* 000081DC 4BFF7F89 */ bl mathutil_mtxA_rotate_z
/* 000081E0 FC20F890 */ fmr f1, f31
/* 000081E4 4BFF7F81 */ bl avdisp_set_bound_sphere_scale
/* 000081E8 807E0000 */ lwz r3, 0(r30)
/* 000081EC 38800000 */ li r4, 0
/* 000081F0 4BFF7F75 */ bl GXLoadPosMtxImm
/* 000081F4 807E0000 */ lwz r3, 0(r30)
/* 000081F8 38800000 */ li r4, 0
/* 000081FC 4BFF7F69 */ bl GXLoadNrmMtxImm
/* 00008200 7F43D378 */ mr r3, r26
/* 00008204 4BFF7F61 */ bl avdisp_draw_model_unculled_sort_translucent
/* 00008208 4BFF7F5D */ bl mathutil_mtxA_pop
lbl_0000820C:
/* 0000820C 377BFFFF */ addic. r27, r27, -1
/* 00008210 3B9C5554 */ addi r28, r28, 0x5554
/* 00008214 3B391555 */ addi r25, r25, 0x1555
/* 00008218 4181FF48 */ bgt lbl_00008160
/* 0000821C BAE10014 */ lmw r23, 0x14(r1)
/* 00008220 8001004C */ lwz r0, 0x4c(r1)
/* 00008224 CBE10040 */ lfd f31, 0x40(r1)
/* 00008228 CBC10038 */ lfd f30, 0x38(r1)
/* 0000822C 7C0803A6 */ mtlr r0
/* 00008230 38210048 */ addi r1, r1, 0x48
/* 00008234 4E800020 */ blr 
lbl_00008238:
/* 00008238 4E800020 */ blr 
lbl_0000823C:
/* 0000823C A8030014 */ lha r0, 0x14(r3)
/* 00008240 3C800000 */ lis r4, lbl_100188E8@ha
/* 00008244 38840000 */ addi r4, r4, lbl_100188E8@l
/* 00008248 1C000034 */ mulli r0, r0, 0x34
/* 0000824C 80840014 */ lwz r4, 0x14(r4)
/* 00008250 7D440214 */ add r10, r4, r0
/* 00008254 812A002C */ lwz r9, 0x2c(r10)
/* 00008258 3CA00000 */ lis r5, commonGma@ha
/* 0000825C 3C800000 */ lis r4, lbl_0001CBD0@ha
/* 00008260 81090008 */ lwz r8, 8(r9)
/* 00008264 3CE00000 */ lis r7, lbl_0001C178@ha
/* 00008268 8009000C */ lwz r0, 0xc(r9)
/* 0000826C 3CC00000 */ lis r6, lbl_0001C108@ha
/* 00008270 38A50000 */ addi r5, r5, commonGma@l
/* 00008274 91030088 */ stw r8, 0x88(r3)
/* 00008278 9003008C */ stw r0, 0x8c(r3)
/* 0000827C 38040000 */ addi r0, r4, lbl_0001CBD0@l
/* 00008280 80890010 */ lwz r4, 0x10(r9)
/* 00008284 90830090 */ stw r4, 0x90(r3)
/* 00008288 C023008C */ lfs f1, 0x8c(r3)
/* 0000828C C0070000 */ lfs f0, lbl_0001C178@l(r7)
/* 00008290 EC01002A */ fadds f0, f1, f0
/* 00008294 D003008C */ stfs f0, 0x8c(r3)
/* 00008298 80E30088 */ lwz r7, 0x88(r3)
/* 0000829C 8083008C */ lwz r4, 0x8c(r3)
/* 000082A0 90E30034 */ stw r7, 0x34(r3)
/* 000082A4 90830038 */ stw r4, 0x38(r3)
/* 000082A8 80830090 */ lwz r4, 0x90(r3)
/* 000082AC 9083003C */ stw r4, 0x3c(r3)
/* 000082B0 888A0001 */ lbz r4, 1(r10)
/* 000082B4 B083000A */ sth r4, 0xa(r3)
/* 000082B8 C0060000 */ lfs f0, lbl_0001C108@l(r6)
/* 000082BC D00300A8 */ stfs f0, 0xa8(r3)
/* 000082C0 888A0001 */ lbz r4, 1(r10)
/* 000082C4 80A50000 */ lwz r5, 0(r5)
/* 000082C8 5484083C */ slwi r4, r4, 1
/* 000082CC 7C802214 */ add r4, r0, r4
/* 000082D0 80A50008 */ lwz r5, 8(r5)
/* 000082D4 A0040000 */ lhz r0, 0(r4)
/* 000082D8 54001838 */ slwi r0, r0, 3
/* 000082DC 7C05002E */ lwzx r0, r5, r0
/* 000082E0 90030030 */ stw r0, 0x30(r3)
/* 000082E4 4E800020 */ blr 
lbl_000082E8:
/* 000082E8 7C0802A6 */ mflr r0
/* 000082EC 3C800000 */ lis r4, lbl_100188E8@ha
/* 000082F0 90010004 */ stw r0, 4(r1)
/* 000082F4 3CC00000 */ lis r6, lbl_0001C108@ha
/* 000082F8 9421FEE8 */ stwu r1, -0x118(r1)
/* 000082FC DBE10110 */ stfd f31, 0x110(r1)
/* 00008300 DBC10108 */ stfd f30, 0x108(r1)
/* 00008304 DBA10100 */ stfd f29, 0x100(r1)
/* 00008308 DB8100F8 */ stfd f28, 0xf8(r1)
/* 0000830C BF4100E0 */ stmw r26, 0xe0(r1)
/* 00008310 3B430000 */ addi r26, r3, 0
/* 00008314 38640000 */ addi r3, r4, lbl_100188E8@l
/* 00008318 3BC60000 */ addi r30, r6, lbl_0001C108@l
/* 0000831C A81A0014 */ lha r0, 0x14(r26)
/* 00008320 80A30014 */ lwz r5, 0x14(r3)
/* 00008324 1C800034 */ mulli r4, r0, 0x34
/* 00008328 807A0088 */ lwz r3, 0x88(r26)
/* 0000832C 801A008C */ lwz r0, 0x8c(r26)
/* 00008330 907A0034 */ stw r3, 0x34(r26)
/* 00008334 7C852214 */ add r4, r5, r4
/* 00008338 901A0038 */ stw r0, 0x38(r26)
/* 0000833C 801A0090 */ lwz r0, 0x90(r26)
/* 00008340 901A003C */ stw r0, 0x3c(r26)
/* 00008344 C024000C */ lfs f1, 0xc(r4)
/* 00008348 C01E0000 */ lfs f0, 0(r30)
/* 0000834C FC010040 */ fcmpo cr0, f1, f0
/* 00008350 40810010 */ ble lbl_00008360
/* 00008354 C01A0038 */ lfs f0, 0x38(r26)
/* 00008358 EC00082A */ fadds f0, f0, f1
/* 0000835C D01A0038 */ stfs f0, 0x38(r26)
lbl_00008360:
/* 00008360 A81A000A */ lha r0, 0xa(r26)
/* 00008364 2C000005 */ cmpwi r0, 5
/* 00008368 4082004C */ bne lbl_000083B4
/* 0000836C C05A00A8 */ lfs f2, 0xa8(r26)
/* 00008370 C01E0074 */ lfs f0, 0x74(r30)
/* 00008374 C03E001C */ lfs f1, 0x1c(r30)
/* 00008378 EC001028 */ fsubs f0, f0, f2
/* 0000837C EC010032 */ fmuls f0, f1, f0
/* 00008380 EC02002A */ fadds f0, f2, f0
/* 00008384 D01A00A8 */ stfs f0, 0xa8(r26)
/* 00008388 C03A00A8 */ lfs f1, 0xa8(r26)
/* 0000838C C01E0000 */ lfs f0, 0(r30)
/* 00008390 FC010040 */ fcmpo cr0, f1, f0
/* 00008394 40800570 */ bge lbl_00008904
/* 00008398 3C600000 */ lis r3, g_poolInfo@ha
/* 0000839C A81A0000 */ lha r0, 0(r26)
/* 000083A0 38630000 */ addi r3, r3, g_poolInfo@l
/* 000083A4 8063004C */ lwz r3, 0x4c(r3)
/* 000083A8 38800003 */ li r4, 3
/* 000083AC 7C8301AE */ stbx r4, r3, r0
/* 000083B0 48000554 */ b lbl_00008904
lbl_000083B4:
/* 000083B4 C05A00A8 */ lfs f2, 0xa8(r26)
/* 000083B8 C01E0004 */ lfs f0, 4(r30)
/* 000083BC C03E004C */ lfs f1, 0x4c(r30)
/* 000083C0 EC001028 */ fsubs f0, f0, f2
/* 000083C4 EC010032 */ fmuls f0, f1, f0
/* 000083C8 EC02002A */ fadds f0, f2, f0
/* 000083CC D01A00A8 */ stfs f0, 0xa8(r26)
/* 000083D0 88640001 */ lbz r3, 1(r4)
/* 000083D4 A81A000A */ lha r0, 0xa(r26)
/* 000083D8 7C030000 */ cmpw r3, r0
/* 000083DC 4182000C */ beq lbl_000083E8
/* 000083E0 38000005 */ li r0, 5
/* 000083E4 B01A000A */ sth r0, 0xa(r26)
lbl_000083E8:
/* 000083E8 A81A000A */ lha r0, 0xa(r26)
/* 000083EC 2C000002 */ cmpwi r0, 2
/* 000083F0 41820020 */ beq lbl_00008410
/* 000083F4 40800010 */ bge lbl_00008404
/* 000083F8 2C000000 */ cmpwi r0, 0
/* 000083FC 40800270 */ bge lbl_0000866C
/* 00008400 48000504 */ b lbl_00008904
lbl_00008404:
/* 00008404 2C000005 */ cmpwi r0, 5
/* 00008408 408004FC */ bge lbl_00008904
/* 0000840C 480004E4 */ b lbl_000088F0
lbl_00008410:
/* 00008410 A8040002 */ lha r0, 2(r4)
/* 00008414 2C000003 */ cmpwi r0, 3
/* 00008418 408204EC */ bne lbl_00008904
/* 0000841C 38000005 */ li r0, 5
/* 00008420 B01A000A */ sth r0, 0xa(r26)
/* 00008424 3C600000 */ lis r3, g_poolInfo@ha
/* 00008428 38630000 */ addi r3, r3, g_poolInfo@l
/* 0000842C 80A3004C */ lwz r5, 0x4c(r3)
/* 00008430 38C00003 */ li r6, 3
/* 00008434 A81A0000 */ lha r0, 0(r26)
/* 00008438 3861000C */ addi r3, r1, 0xc
/* 0000843C 38800000 */ li r4, 0
/* 00008440 7CC501AE */ stbx r6, r5, r0
/* 00008444 38A000AC */ li r5, 0xac
/* 00008448 4BFF7D1D */ bl memset
/* 0000844C 38000000 */ li r0, 0
/* 00008450 B0010014 */ sth r0, 0x14(r1)
/* 00008454 801A0030 */ lwz r0, 0x30(r26)
/* 00008458 9001003C */ stw r0, 0x3c(r1)
/* 0000845C C01A0038 */ lfs f0, 0x38(r26)
/* 00008460 D0010044 */ stfs f0, 0x44(r1)
/* 00008464 4BFF7D01 */ bl rand
/* 00008468 546307BE */ clrlwi r3, r3, 0x1e
/* 0000846C C03E0078 */ lfs f1, 0x78(r30)
/* 00008470 3BA30002 */ addi r29, r3, 2
/* 00008474 C01A00A8 */ lfs f0, 0xa8(r26)
/* 00008478 6FA08000 */ xoris r0, r29, 0x8000
/* 0000847C 900100DC */ stw r0, 0xdc(r1)
/* 00008480 3FE04330 */ lis r31, 0x4330
/* 00008484 381DFFFF */ addi r0, r29, -1
/* 00008488 EC410032 */ fmuls f2, f1, f0
/* 0000848C 93E100D8 */ stw r31, 0xd8(r1)
/* 00008490 3C600000 */ lis r3, lbl_0001C138@ha
/* 00008494 C8230000 */ lfd f1, lbl_0001C138@l(r3)
/* 00008498 6C008000 */ xoris r0, r0, 0x8000
/* 0000849C C80100D8 */ lfd f0, 0xd8(r1)
/* 000084A0 3C800000 */ lis r4, lbl_0001C138@ha
/* 000084A4 900100D4 */ stw r0, 0xd4(r1)
/* 000084A8 EC000828 */ fsubs f0, f0, f1
/* 000084AC 3C600000 */ lis r3, lbl_0001C138@ha
/* 000084B0 900100CC */ stw r0, 0xcc(r1)
/* 000084B4 7FBCEB78 */ mr r28, r29
/* 000084B8 EC020024 */ fdivs f0, f2, f0
/* 000084BC 93E100D0 */ stw r31, 0xd0(r1)
/* 000084C0 93E100C8 */ stw r31, 0xc8(r1)
/* 000084C4 D0010030 */ stfs f0, 0x30(r1)
/* 000084C8 C80100D0 */ lfd f0, 0xd0(r1)
/* 000084CC C8240000 */ lfd f1, lbl_0001C138@l(r4)
/* 000084D0 C09E004C */ lfs f4, 0x4c(r30)
/* 000084D4 EC400828 */ fsubs f2, f0, f1
/* 000084D8 C0610030 */ lfs f3, 0x30(r1)
/* 000084DC C8230000 */ lfd f1, lbl_0001C138@l(r3)
/* 000084E0 C80100C8 */ lfd f0, 0xc8(r1)
/* 000084E4 EFC400F2 */ fmuls f30, f4, f3
/* 000084E8 EC000828 */ fsubs f0, f0, f1
/* 000084EC C07E0010 */ lfs f3, 0x10(r30)
/* 000084F0 EC2207B2 */ fmuls f1, f2, f30
/* 000084F4 EC0007B2 */ fmuls f0, f0, f30
/* 000084F8 FC200850 */ fneg f1, f1
/* 000084FC FC000050 */ fneg f0, f0
/* 00008500 EF830072 */ fmuls f28, f3, f1
/* 00008504 EFE30032 */ fmuls f31, f3, f0
/* 00008508 48000158 */ b lbl_00008660
lbl_0000850C:
/* 0000850C FFA0F890 */ fmr f29, f31
/* 00008510 7FBBEB78 */ mr r27, r29
/* 00008514 4800013C */ b lbl_00008650
lbl_00008518:
/* 00008518 C01A0034 */ lfs f0, 0x34(r26)
/* 0000851C EC00E82A */ fadds f0, f0, f29
/* 00008520 D0010040 */ stfs f0, 0x40(r1)
/* 00008524 C01A003C */ lfs f0, 0x3c(r26)
/* 00008528 EC00E02A */ fadds f0, f0, f28
/* 0000852C D0010048 */ stfs f0, 0x48(r1)
/* 00008530 4BFF7C35 */ bl rand
/* 00008534 6C608000 */ xoris r0, r3, 0x8000
/* 00008538 C05E0018 */ lfs f2, 0x18(r30)
/* 0000853C 900100CC */ stw r0, 0xcc(r1)
/* 00008540 3C600000 */ lis r3, lbl_0001C138@ha
/* 00008544 C8830000 */ lfd f4, lbl_0001C138@l(r3)
/* 00008548 93E100C8 */ stw r31, 0xc8(r1)
/* 0000854C C03E0010 */ lfs f1, 0x10(r30)
/* 00008550 C86100C8 */ lfd f3, 0xc8(r1)
/* 00008554 C01E0040 */ lfs f0, 0x40(r30)
/* 00008558 EC632028 */ fsubs f3, f3, f4
/* 0000855C EC431024 */ fdivs f2, f3, f2
/* 00008560 EC220828 */ fsubs f1, f2, f1
/* 00008564 EC000072 */ fmuls f0, f0, f1
/* 00008568 D001004C */ stfs f0, 0x4c(r1)
/* 0000856C 4BFF7BF9 */ bl rand
/* 00008570 6C608000 */ xoris r0, r3, 0x8000
/* 00008574 C03E0018 */ lfs f1, 0x18(r30)
/* 00008578 900100D4 */ stw r0, 0xd4(r1)
/* 0000857C 3C600000 */ lis r3, lbl_0001C138@ha
/* 00008580 C8630000 */ lfd f3, lbl_0001C138@l(r3)
/* 00008584 93E100D0 */ stw r31, 0xd0(r1)
/* 00008588 C01E007C */ lfs f0, 0x7c(r30)
/* 0000858C C84100D0 */ lfd f2, 0xd0(r1)
/* 00008590 EC421828 */ fsubs f2, f2, f3
/* 00008594 EC220824 */ fdivs f1, f2, f1
/* 00008598 EC000072 */ fmuls f0, f0, f1
/* 0000859C D0010050 */ stfs f0, 0x50(r1)
/* 000085A0 4BFF7BC5 */ bl rand
/* 000085A4 6C608000 */ xoris r0, r3, 0x8000
/* 000085A8 C05E0018 */ lfs f2, 0x18(r30)
/* 000085AC 900100DC */ stw r0, 0xdc(r1)
/* 000085B0 3C600000 */ lis r3, lbl_0001C138@ha
/* 000085B4 C8830000 */ lfd f4, lbl_0001C138@l(r3)
/* 000085B8 93E100D8 */ stw r31, 0xd8(r1)
/* 000085BC C03E0010 */ lfs f1, 0x10(r30)
/* 000085C0 C86100D8 */ lfd f3, 0xd8(r1)
/* 000085C4 C01E0040 */ lfs f0, 0x40(r30)
/* 000085C8 EC632028 */ fsubs f3, f3, f4
/* 000085CC EC431024 */ fdivs f2, f3, f2
/* 000085D0 EC220828 */ fsubs f1, f2, f1
/* 000085D4 EC000072 */ fmuls f0, f0, f1
/* 000085D8 D0010054 */ stfs f0, 0x54(r1)
/* 000085DC 4BFF7B89 */ bl rand
/* 000085E0 54607422 */ rlwinm r0, r3, 0xe, 0x10, 0x11
/* 000085E4 7C000734 */ extsh r0, r0
/* 000085E8 B001005A */ sth r0, 0x5a(r1)
/* 000085EC 4BFF7B79 */ bl rand
/* 000085F0 6C608000 */ xoris r0, r3, 0x8000
/* 000085F4 C07E0018 */ lfs f3, 0x18(r30)
/* 000085F8 900100C4 */ stw r0, 0xc4(r1)
/* 000085FC 3C600000 */ lis r3, lbl_0001C138@ha
/* 00008600 C8830000 */ lfd f4, lbl_0001C138@l(r3)
/* 00008604 3861000C */ addi r3, r1, 0xc
/* 00008608 93E100C0 */ stw r31, 0xc0(r1)
/* 0000860C C05E0084 */ lfs f2, 0x84(r30)
/* 00008610 C80100C0 */ lfd f0, 0xc0(r1)
/* 00008614 C03E0080 */ lfs f1, 0x80(r30)
/* 00008618 EC802028 */ fsubs f4, f0, f4
/* 0000861C C0010030 */ lfs f0, 0x30(r1)
/* 00008620 EC641824 */ fdivs f3, f4, f3
/* 00008624 EC4200F2 */ fmuls f2, f2, f3
/* 00008628 EC21102A */ fadds f1, f1, f2
/* 0000862C EC010024 */ fdivs f0, f1, f0
/* 00008630 FC00001E */ fctiwz f0, f0
/* 00008634 D80100B8 */ stfd f0, 0xb8(r1)
/* 00008638 808100BC */ lwz r4, 0xbc(r1)
/* 0000863C 38040001 */ addi r0, r4, 1
/* 00008640 90010018 */ stw r0, 0x18(r1)
/* 00008644 4BFF7B21 */ bl spawn_effect
/* 00008648 EFBDF02A */ fadds f29, f29, f30
/* 0000864C 3B7BFFFF */ addi r27, r27, -1
lbl_00008650:
/* 00008650 2C1B0000 */ cmpwi r27, 0
/* 00008654 4181FEC4 */ bgt lbl_00008518
/* 00008658 EF9CF02A */ fadds f28, f28, f30
/* 0000865C 3B9CFFFF */ addi r28, r28, -1
lbl_00008660:
/* 00008660 2C1C0000 */ cmpwi r28, 0
/* 00008664 4181FEA8 */ bgt lbl_0000850C
/* 00008668 4800029C */ b lbl_00008904
lbl_0000866C:
/* 0000866C A8040002 */ lha r0, 2(r4)
/* 00008670 2C000003 */ cmpwi r0, 3
/* 00008674 40820290 */ bne lbl_00008904
/* 00008678 38000005 */ li r0, 5
/* 0000867C B01A000A */ sth r0, 0xa(r26)
/* 00008680 3C600000 */ lis r3, g_poolInfo@ha
/* 00008684 38630000 */ addi r3, r3, g_poolInfo@l
/* 00008688 80A3004C */ lwz r5, 0x4c(r3)
/* 0000868C 38C00003 */ li r6, 3
/* 00008690 A81A0000 */ lha r0, 0(r26)
/* 00008694 3861000C */ addi r3, r1, 0xc
/* 00008698 38800000 */ li r4, 0
/* 0000869C 7CC501AE */ stbx r6, r5, r0
/* 000086A0 38A000AC */ li r5, 0xac
/* 000086A4 4BFF7AC1 */ bl memset
/* 000086A8 38000000 */ li r0, 0
/* 000086AC B0010014 */ sth r0, 0x14(r1)
/* 000086B0 801A0030 */ lwz r0, 0x30(r26)
/* 000086B4 9001003C */ stw r0, 0x3c(r1)
/* 000086B8 C01A0038 */ lfs f0, 0x38(r26)
/* 000086BC D0010044 */ stfs f0, 0x44(r1)
/* 000086C0 4BFF7AA5 */ bl rand
/* 000086C4 546307BE */ clrlwi r3, r3, 0x1e
/* 000086C8 C03E0078 */ lfs f1, 0x78(r30)
/* 000086CC 3B630002 */ addi r27, r3, 2
/* 000086D0 C01A00A8 */ lfs f0, 0xa8(r26)
/* 000086D4 6F608000 */ xoris r0, r27, 0x8000
/* 000086D8 900100BC */ stw r0, 0xbc(r1)
/* 000086DC 3FE04330 */ lis r31, 0x4330
/* 000086E0 381BFFFF */ addi r0, r27, -1
/* 000086E4 EC410032 */ fmuls f2, f1, f0
/* 000086E8 93E100B8 */ stw r31, 0xb8(r1)
/* 000086EC 3C600000 */ lis r3, lbl_0001C138@ha
/* 000086F0 C8230000 */ lfd f1, lbl_0001C138@l(r3)
/* 000086F4 6C008000 */ xoris r0, r0, 0x8000
/* 000086F8 C80100B8 */ lfd f0, 0xb8(r1)
/* 000086FC 3C800000 */ lis r4, lbl_0001C138@ha
/* 00008700 900100C4 */ stw r0, 0xc4(r1)
/* 00008704 EC000828 */ fsubs f0, f0, f1
/* 00008708 3C600000 */ lis r3, lbl_0001C138@ha
/* 0000870C 900100CC */ stw r0, 0xcc(r1)
/* 00008710 7F7CDB78 */ mr r28, r27
/* 00008714 EC020024 */ fdivs f0, f2, f0
/* 00008718 93E100C0 */ stw r31, 0xc0(r1)
/* 0000871C 93E100C8 */ stw r31, 0xc8(r1)
/* 00008720 D0010030 */ stfs f0, 0x30(r1)
/* 00008724 C80100C0 */ lfd f0, 0xc0(r1)
/* 00008728 C8240000 */ lfd f1, lbl_0001C138@l(r4)
/* 0000872C C09E004C */ lfs f4, 0x4c(r30)
/* 00008730 EC400828 */ fsubs f2, f0, f1
/* 00008734 C0610030 */ lfs f3, 0x30(r1)
/* 00008738 C8230000 */ lfd f1, lbl_0001C138@l(r3)
/* 0000873C C80100C8 */ lfd f0, 0xc8(r1)
/* 00008740 EFC400F2 */ fmuls f30, f4, f3
/* 00008744 EC000828 */ fsubs f0, f0, f1
/* 00008748 C07E0010 */ lfs f3, 0x10(r30)
/* 0000874C EC2207B2 */ fmuls f1, f2, f30
/* 00008750 EC0007B2 */ fmuls f0, f0, f30
/* 00008754 FC200850 */ fneg f1, f1
/* 00008758 FC000050 */ fneg f0, f0
/* 0000875C EFA30072 */ fmuls f29, f3, f1
/* 00008760 EFE30032 */ fmuls f31, f3, f0
/* 00008764 48000180 */ b lbl_000088E4
lbl_00008768:
/* 00008768 FF80F890 */ fmr f28, f31
/* 0000876C 7F7DDB78 */ mr r29, r27
/* 00008770 48000164 */ b lbl_000088D4
lbl_00008774:
/* 00008774 C01A0034 */ lfs f0, 0x34(r26)
/* 00008778 EC00E02A */ fadds f0, f0, f28
/* 0000877C D0010040 */ stfs f0, 0x40(r1)
/* 00008780 C01A003C */ lfs f0, 0x3c(r26)
/* 00008784 EC00E82A */ fadds f0, f0, f29
/* 00008788 D0010048 */ stfs f0, 0x48(r1)
/* 0000878C 4BFF79D9 */ bl rand
/* 00008790 6C608000 */ xoris r0, r3, 0x8000
/* 00008794 C05E0018 */ lfs f2, 0x18(r30)
/* 00008798 900100BC */ stw r0, 0xbc(r1)
/* 0000879C 3C600000 */ lis r3, lbl_0001C138@ha
/* 000087A0 C8830000 */ lfd f4, lbl_0001C138@l(r3)
/* 000087A4 93E100B8 */ stw r31, 0xb8(r1)
/* 000087A8 C03E0010 */ lfs f1, 0x10(r30)
/* 000087AC C86100B8 */ lfd f3, 0xb8(r1)
/* 000087B0 C01E0040 */ lfs f0, 0x40(r30)
/* 000087B4 EC632028 */ fsubs f3, f3, f4
/* 000087B8 EC431024 */ fdivs f2, f3, f2
/* 000087BC EC220828 */ fsubs f1, f2, f1
/* 000087C0 EC000072 */ fmuls f0, f0, f1
/* 000087C4 D001004C */ stfs f0, 0x4c(r1)
/* 000087C8 4BFF799D */ bl rand
/* 000087CC 6C608000 */ xoris r0, r3, 0x8000
/* 000087D0 C05E0018 */ lfs f2, 0x18(r30)
/* 000087D4 900100C4 */ stw r0, 0xc4(r1)
/* 000087D8 3C600000 */ lis r3, lbl_0001C138@ha
/* 000087DC C8830000 */ lfd f4, lbl_0001C138@l(r3)
/* 000087E0 93E100C0 */ stw r31, 0xc0(r1)
/* 000087E4 C03E000C */ lfs f1, 0xc(r30)
/* 000087E8 C86100C0 */ lfd f3, 0xc0(r1)
/* 000087EC C01E0004 */ lfs f0, 4(r30)
/* 000087F0 EC632028 */ fsubs f3, f3, f4
/* 000087F4 EC431024 */ fdivs f2, f3, f2
/* 000087F8 EC2100B2 */ fmuls f1, f1, f2
/* 000087FC EC00082A */ fadds f0, f0, f1
/* 00008800 D0010050 */ stfs f0, 0x50(r1)
/* 00008804 4BFF7961 */ bl rand
/* 00008808 6C608000 */ xoris r0, r3, 0x8000
/* 0000880C C05E0018 */ lfs f2, 0x18(r30)
/* 00008810 900100CC */ stw r0, 0xcc(r1)
/* 00008814 3C600000 */ lis r3, lbl_0001C138@ha
/* 00008818 C8830000 */ lfd f4, lbl_0001C138@l(r3)
/* 0000881C 93E100C8 */ stw r31, 0xc8(r1)
/* 00008820 C03E0010 */ lfs f1, 0x10(r30)
/* 00008824 C86100C8 */ lfd f3, 0xc8(r1)
/* 00008828 C01E0040 */ lfs f0, 0x40(r30)
/* 0000882C EC632028 */ fsubs f3, f3, f4
/* 00008830 EC431024 */ fdivs f2, f3, f2
/* 00008834 EC220828 */ fsubs f1, f2, f1
/* 00008838 EC000072 */ fmuls f0, f0, f1
/* 0000883C D0010054 */ stfs f0, 0x54(r1)
/* 00008840 4BFF7925 */ bl rand
/* 00008844 546305FE */ clrlwi r3, r3, 0x17
/* 00008848 3803FF80 */ addi r0, r3, -128
/* 0000884C B0010058 */ sth r0, 0x58(r1)
/* 00008850 4BFF7915 */ bl rand
/* 00008854 54607422 */ rlwinm r0, r3, 0xe, 0x10, 0x11
/* 00008858 7C000734 */ extsh r0, r0
/* 0000885C B001005A */ sth r0, 0x5a(r1)
/* 00008860 4BFF7905 */ bl rand
/* 00008864 546305FE */ clrlwi r3, r3, 0x17
/* 00008868 3803FF80 */ addi r0, r3, -128
/* 0000886C B001005C */ sth r0, 0x5c(r1)
/* 00008870 4BFF78F5 */ bl rand
/* 00008874 6C608000 */ xoris r0, r3, 0x8000
/* 00008878 C07E0018 */ lfs f3, 0x18(r30)
/* 0000887C 900100D4 */ stw r0, 0xd4(r1)
/* 00008880 3C600000 */ lis r3, lbl_0001C138@ha
/* 00008884 C8830000 */ lfd f4, lbl_0001C138@l(r3)
/* 00008888 3861000C */ addi r3, r1, 0xc
/* 0000888C 93E100D0 */ stw r31, 0xd0(r1)
/* 00008890 C05E0084 */ lfs f2, 0x84(r30)
/* 00008894 C80100D0 */ lfd f0, 0xd0(r1)
/* 00008898 C03E0080 */ lfs f1, 0x80(r30)
/* 0000889C EC802028 */ fsubs f4, f0, f4
/* 000088A0 C0010030 */ lfs f0, 0x30(r1)
/* 000088A4 EC641824 */ fdivs f3, f4, f3
/* 000088A8 EC4200F2 */ fmuls f2, f2, f3
/* 000088AC EC21102A */ fadds f1, f1, f2
/* 000088B0 EC010024 */ fdivs f0, f1, f0
/* 000088B4 FC00001E */ fctiwz f0, f0
/* 000088B8 D80100D8 */ stfd f0, 0xd8(r1)
/* 000088BC 808100DC */ lwz r4, 0xdc(r1)
/* 000088C0 38040001 */ addi r0, r4, 1
/* 000088C4 90010018 */ stw r0, 0x18(r1)
/* 000088C8 4BFF789D */ bl spawn_effect
/* 000088CC EF9CF02A */ fadds f28, f28, f30
/* 000088D0 3BBDFFFF */ addi r29, r29, -1
lbl_000088D4:
/* 000088D4 2C1D0000 */ cmpwi r29, 0
/* 000088D8 4181FE9C */ bgt lbl_00008774
/* 000088DC EFBDF02A */ fadds f29, f29, f30
/* 000088E0 3B9CFFFF */ addi r28, r28, -1
lbl_000088E4:
/* 000088E4 2C1C0000 */ cmpwi r28, 0
/* 000088E8 4181FE80 */ bgt lbl_00008768
/* 000088EC 48000018 */ b lbl_00008904
lbl_000088F0:
/* 000088F0 A8040002 */ lha r0, 2(r4)
/* 000088F4 2C000003 */ cmpwi r0, 3
/* 000088F8 4082000C */ bne lbl_00008904
/* 000088FC 38000005 */ li r0, 5
/* 00008900 B01A000A */ sth r0, 0xa(r26)
lbl_00008904:
/* 00008904 BB4100E0 */ lmw r26, 0xe0(r1)
/* 00008908 8001011C */ lwz r0, 0x11c(r1)
/* 0000890C CBE10110 */ lfd f31, 0x110(r1)
/* 00008910 CBC10108 */ lfd f30, 0x108(r1)
/* 00008914 7C0803A6 */ mtlr r0
/* 00008918 CBA10100 */ lfd f29, 0x100(r1)
/* 0000891C CB8100F8 */ lfd f28, 0xf8(r1)
/* 00008920 38210118 */ addi r1, r1, 0x118
/* 00008924 4E800020 */ blr 
lbl_00008928:
/* 00008928 7C0802A6 */ mflr r0
/* 0000892C 3C800000 */ lis r4, lbl_0001C108@ha
/* 00008930 90010004 */ stw r0, 4(r1)
/* 00008934 9421FFD8 */ stwu r1, -0x28(r1)
/* 00008938 DBE10020 */ stfd f31, 0x20(r1)
/* 0000893C 93E1001C */ stw r31, 0x1c(r1)
/* 00008940 3BE40000 */ addi r31, r4, lbl_0001C108@l
/* 00008944 93C10018 */ stw r30, 0x18(r1)
/* 00008948 3BC30000 */ addi r30, r3, 0
/* 0000894C C00300A8 */ lfs f0, 0xa8(r3)
/* 00008950 387E0034 */ addi r3, r30, 0x34
/* 00008954 C03F0078 */ lfs f1, 0x78(r31)
/* 00008958 EFE10032 */ fmuls f31, f1, f0
/* 0000895C 4BFF7809 */ bl mathutil_mtxA_from_mtxB_translate
/* 00008960 C03F0078 */ lfs f1, 0x78(r31)
/* 00008964 C01E00A8 */ lfs f0, 0xa8(r30)
/* 00008968 EC210032 */ fmuls f1, f1, f0
/* 0000896C 4BFF77F9 */ bl mathutil_mtxA_scale_s
/* 00008970 C03F0088 */ lfs f1, 0x88(r31)
/* 00008974 C01E00A8 */ lfs f0, 0xa8(r30)
/* 00008978 EC010032 */ fmuls f0, f1, f0
/* 0000897C FC00001E */ fctiwz f0, f0
/* 00008980 D8010010 */ stfd f0, 0x10(r1)
/* 00008984 80610014 */ lwz r3, 0x14(r1)
/* 00008988 4BFF77DD */ bl mathutil_mtxA_rotate_y
/* 0000898C 3C600000 */ lis r3, mathutilData@ha
/* 00008990 3BE30000 */ addi r31, r3, mathutilData@l
/* 00008994 807F0000 */ lwz r3, 0(r31)
/* 00008998 38800000 */ li r4, 0
/* 0000899C 4BFF77C9 */ bl GXLoadPosMtxImm
/* 000089A0 807F0000 */ lwz r3, 0(r31)
/* 000089A4 38800000 */ li r4, 0
/* 000089A8 4BFF77BD */ bl GXLoadNrmMtxImm
/* 000089AC FC20F890 */ fmr f1, f31
/* 000089B0 4BFF77B5 */ bl avdisp_set_bound_sphere_scale
/* 000089B4 807E0030 */ lwz r3, 0x30(r30)
/* 000089B8 4BFF77AD */ bl avdisp_draw_model_culled_sort_translucent
/* 000089BC 8001002C */ lwz r0, 0x2c(r1)
/* 000089C0 CBE10020 */ lfd f31, 0x20(r1)
/* 000089C4 83E1001C */ lwz r31, 0x1c(r1)
/* 000089C8 7C0803A6 */ mtlr r0
/* 000089CC 83C10018 */ lwz r30, 0x18(r1)
/* 000089D0 38210028 */ addi r1, r1, 0x28
/* 000089D4 4E800020 */ blr 
lbl_000089D8:
/* 000089D8 4E800020 */ blr 
lbl_000089DC:
/* 000089DC 7C0802A6 */ mflr r0
/* 000089E0 3C800001 */ lis r4, 1
/* 000089E4 90010004 */ stw r0, 4(r1)
/* 000089E8 3CA00000 */ lis r5, cameraInfo@ha
/* 000089EC 3804FFFF */ addi r0, r4, -1
/* 000089F0 9421FFB0 */ stwu r1, -0x50(r1)
/* 000089F4 3CC00000 */ lis r6, lbl_0001C108@ha
/* 000089F8 93E1004C */ stw r31, 0x4c(r1)
/* 000089FC 3BE30000 */ addi r31, r3, 0
/* 00008A00 93C10048 */ stw r30, 0x48(r1)
/* 00008A04 3BC50000 */ addi r30, r5, cameraInfo@l
/* 00008A08 93A10044 */ stw r29, 0x44(r1)
/* 00008A0C 3BA60000 */ addi r29, r6, lbl_0001C108@l
/* 00008A10 B0030016 */ sth r0, 0x16(r3)
/* 00008A14 387E0144 */ addi r3, r30, 0x144
/* 00008A18 4BFF774D */ bl mathutil_mtxA_from_mtx
/* 00008A1C 387F0034 */ addi r3, r31, 0x34
/* 00008A20 38830000 */ addi r4, r3, 0
/* 00008A24 4BFF7741 */ bl mathutil_mtxA_tf_point
/* 00008A28 387F0040 */ addi r3, r31, 0x40
/* 00008A2C 38830000 */ addi r4, r3, 0
/* 00008A30 4BFF7735 */ bl mathutil_mtxA_tf_vec
/* 00008A34 C85D0090 */ lfd f2, 0x90(r29)
/* 00008A38 C03F003C */ lfs f1, 0x3c(r31)
/* 00008A3C C01F0034 */ lfs f0, 0x34(r31)
/* 00008A40 FC820824 */ fdiv f4, f2, f1
/* 00008A44 FC802018 */ frsp f4, f4
/* 00008A48 EC000132 */ fmuls f0, f0, f4
/* 00008A4C D01F0034 */ stfs f0, 0x34(r31)
/* 00008A50 C01F0038 */ lfs f0, 0x38(r31)
/* 00008A54 EC000132 */ fmuls f0, f0, f4
/* 00008A58 D01F0038 */ stfs f0, 0x38(r31)
/* 00008A5C C01D007C */ lfs f0, 0x7c(r29)
/* 00008A60 D01F003C */ stfs f0, 0x3c(r31)
/* 00008A64 C01F0040 */ lfs f0, 0x40(r31)
/* 00008A68 EC000132 */ fmuls f0, f0, f4
/* 00008A6C D01F0040 */ stfs f0, 0x40(r31)
/* 00008A70 C01F0044 */ lfs f0, 0x44(r31)
/* 00008A74 EC000132 */ fmuls f0, f0, f4
/* 00008A78 D01F0044 */ stfs f0, 0x44(r31)
/* 00008A7C C01D0000 */ lfs f0, 0(r29)
/* 00008A80 D01F0048 */ stfs f0, 0x48(r31)
/* 00008A84 C01F0024 */ lfs f0, 0x24(r31)
/* 00008A88 EC000132 */ fmuls f0, f0, f4
/* 00008A8C D01F0024 */ stfs f0, 0x24(r31)
/* 00008A90 C01F0028 */ lfs f0, 0x28(r31)
/* 00008A94 EC000132 */ fmuls f0, f0, f4
/* 00008A98 D01F0028 */ stfs f0, 0x28(r31)
/* 00008A9C C01F002C */ lfs f0, 0x2c(r31)
/* 00008AA0 EC000132 */ fmuls f0, f0, f4
/* 00008AA4 D01F002C */ stfs f0, 0x2c(r31)
/* 00008AA8 A87F004E */ lha r3, 0x4e(r31)
/* 00008AAC 4BFF76B9 */ bl mathutil_mtxA_rotate_y
/* 00008AB0 A87F004C */ lha r3, 0x4c(r31)
/* 00008AB4 4BFF76B1 */ bl mathutil_mtxA_rotate_x
/* 00008AB8 A87F0050 */ lha r3, 0x50(r31)
/* 00008ABC 4BFF76A9 */ bl mathutil_mtxA_rotate_z
/* 00008AC0 387F004E */ addi r3, r31, 0x4e
/* 00008AC4 389F004C */ addi r4, r31, 0x4c
/* 00008AC8 38BF0050 */ addi r5, r31, 0x50
/* 00008ACC 4BFF7699 */ bl mathutil_mtxA_to_euler_yxz
/* 00008AD0 A81F0014 */ lha r0, 0x14(r31)
/* 00008AD4 3C600000 */ lis r3, modeCtrl@ha
/* 00008AD8 3CA00000 */ lis r5, lbl_0001C138@ha
/* 00008ADC C05D0010 */ lfs f2, 0x10(r29)
/* 00008AE0 6C008000 */ xoris r0, r0, 0x8000
/* 00008AE4 9001003C */ stw r0, 0x3c(r1)
/* 00008AE8 3C804330 */ lis r4, 0x4330
/* 00008AEC 38630000 */ addi r3, r3, modeCtrl@l
/* 00008AF0 C8250000 */ lfd f1, lbl_0001C138@l(r5)
/* 00008AF4 90810038 */ stw r4, 0x38(r1)
/* 00008AF8 80030024 */ lwz r0, 0x24(r3)
/* 00008AFC 3C600000 */ lis r3, lbl_0001C138@ha
/* 00008B00 C8010038 */ lfd f0, 0x38(r1)
/* 00008B04 6C008000 */ xoris r0, r0, 0x8000
/* 00008B08 C07D009C */ lfs f3, 0x9c(r29)
/* 00008B0C EC000828 */ fsubs f0, f0, f1
/* 00008B10 90010034 */ stw r0, 0x34(r1)
/* 00008B14 C8230000 */ lfd f1, lbl_0001C138@l(r3)
/* 00008B18 90810030 */ stw r4, 0x30(r1)
/* 00008B1C 389F0034 */ addi r4, r31, 0x34
/* 00008B20 EC42002A */ fadds f2, f2, f0
/* 00008B24 C8010030 */ lfd f0, 0x30(r1)
/* 00008B28 C09D0098 */ lfs f4, 0x98(r29)
/* 00008B2C EC000828 */ fsubs f0, f0, f1
/* 00008B30 EC2300B2 */ fmuls f1, f3, f2
/* 00008B34 EC010024 */ fdivs f0, f1, f0
/* 00008B38 EC04002A */ fadds f0, f4, f0
/* 00008B3C D01F0088 */ stfs f0, 0x88(r31)
/* 00008B40 C01D00A0 */ lfs f0, 0xa0(r29)
/* 00008B44 D01F008C */ stfs f0, 0x8c(r31)
/* 00008B48 C01D007C */ lfs f0, 0x7c(r29)
/* 00008B4C D01F0090 */ stfs f0, 0x90(r31)
/* 00008B50 807F0088 */ lwz r3, 0x88(r31)
/* 00008B54 801F008C */ lwz r0, 0x8c(r31)
/* 00008B58 9061000C */ stw r3, 0xc(r1)
/* 00008B5C 90010010 */ stw r0, 0x10(r1)
/* 00008B60 801F0090 */ lwz r0, 0x90(r31)
/* 00008B64 90010014 */ stw r0, 0x14(r1)
/* 00008B68 C0010014 */ lfs f0, 0x14(r1)
/* 00008B6C C061000C */ lfs f3, 0xc(r1)
/* 00008B70 D0010020 */ stfs f0, 0x20(r1)
/* 00008B74 FC800050 */ fneg f4, f0
/* 00008B78 C0210010 */ lfs f1, 0x10(r1)
/* 00008B7C C81D00A8 */ lfd f0, 0xa8(r29)
/* 00008B80 C85D00B0 */ lfd f2, 0xb0(r29)
/* 00008B84 FC630028 */ fsub f3, f3, f0
/* 00008B88 C0BE0038 */ lfs f5, 0x38(r30)
/* 00008B8C C01E0028 */ lfs f0, 0x28(r30)
/* 00008B90 EC850132 */ fmuls f4, f5, f4
/* 00008B94 FC431024 */ fdiv f2, f3, f2
/* 00008B98 FC020028 */ fsub f0, f2, f0
/* 00008B9C FC040032 */ fmul f0, f4, f0
/* 00008BA0 FC000018 */ frsp f0, f0
/* 00008BA4 D0010018 */ stfs f0, 0x18(r1)
/* 00008BA8 C85D00B0 */ lfd f2, 0xb0(r29)
/* 00008BAC C01E002C */ lfs f0, 0x2c(r30)
/* 00008BB0 FC211028 */ fsub f1, f1, f2
/* 00008BB4 FC200850 */ fneg f1, f1
/* 00008BB8 FC211024 */ fdiv f1, f1, f2
/* 00008BBC FC010028 */ fsub f0, f1, f0
/* 00008BC0 FC040032 */ fmul f0, f4, f0
/* 00008BC4 FC000018 */ frsp f0, f0
/* 00008BC8 D001001C */ stfs f0, 0x1c(r1)
/* 00008BCC C0A10018 */ lfs f5, 0x18(r1)
/* 00008BD0 C0440000 */ lfs f2, 0(r4)
/* 00008BD4 C081001C */ lfs f4, 0x1c(r1)
/* 00008BD8 C0240004 */ lfs f1, 4(r4)
/* 00008BDC C0610020 */ lfs f3, 0x20(r1)
/* 00008BE0 C0040008 */ lfs f0, 8(r4)
/* 00008BE4 ECA51028 */ fsubs f5, f5, f2
/* 00008BE8 EC840828 */ fsubs f4, f4, f1
/* 00008BEC EC630028 */ fsubs f3, f3, f0
/* 00008BF0 EC250172 */ fmuls f1, f5, f5
/* 00008BF4 EC24093A */ fmadds f1, f4, f4, f1
/* 00008BF8 EC2308FA */ fmadds f1, f3, f3, f1
/* 00008BFC 4BFF7569 */ bl mathutil_sqrt
/* 00008C00 C01D00BC */ lfs f0, 0xbc(r29)
/* 00008C04 C05D00B8 */ lfs f2, 0xb8(r29)
/* 00008C08 EC010024 */ fdivs f0, f1, f0
/* 00008C0C EC02002A */ fadds f0, f2, f0
/* 00008C10 FC00001E */ fctiwz f0, f0
/* 00008C14 D8010028 */ stfd f0, 0x28(r1)
/* 00008C18 8001002C */ lwz r0, 0x2c(r1)
/* 00008C1C 901F000C */ stw r0, 0xc(r31)
/* 00008C20 80010054 */ lwz r0, 0x54(r1)
/* 00008C24 83E1004C */ lwz r31, 0x4c(r1)
/* 00008C28 83C10048 */ lwz r30, 0x48(r1)
/* 00008C2C 83A10044 */ lwz r29, 0x44(r1)
/* 00008C30 38210050 */ addi r1, r1, 0x50
/* 00008C34 7C0803A6 */ mtlr r0
/* 00008C38 4E800020 */ blr 
lbl_00008C3C:
/* 00008C3C 9421FFC8 */ stwu r1, -0x38(r1)
/* 00008C40 3CE00000 */ lis r7, lbl_0001C108@ha
/* 00008C44 3C800000 */ lis r4, cameraInfo@ha
/* 00008C48 80030088 */ lwz r0, 0x88(r3)
/* 00008C4C 38E70000 */ addi r7, r7, lbl_0001C108@l
/* 00008C50 80C3008C */ lwz r6, 0x8c(r3)
/* 00008C54 3CA00000 */ lis r5, lbl_0001C138@ha
/* 00008C58 90010010 */ stw r0, 0x10(r1)
/* 00008C5C 3C004330 */ lis r0, 0x4330
/* 00008C60 90C10014 */ stw r6, 0x14(r1)
/* 00008C64 38C40000 */ addi r6, r4, cameraInfo@l
/* 00008C68 80830090 */ lwz r4, 0x90(r3)
/* 00008C6C 90810018 */ stw r4, 0x18(r1)
/* 00008C70 C0210010 */ lfs f1, 0x10(r1)
/* 00008C74 C80700A8 */ lfd f0, 0xa8(r7)
/* 00008C78 8083000C */ lwz r4, 0xc(r3)
/* 00008C7C FC010028 */ fsub f0, f1, f0
/* 00008C80 C90700B0 */ lfd f8, 0xb0(r7)
/* 00008C84 C0410014 */ lfs f2, 0x14(r1)
/* 00008C88 6C848000 */ xoris r4, r4, 0x8000
/* 00008C8C 90810034 */ stw r4, 0x34(r1)
/* 00008C90 FC624028 */ fsub f3, f2, f8
/* 00008C94 90010030 */ stw r0, 0x30(r1)
/* 00008C98 FCE04024 */ fdiv f7, f0, f8
/* 00008C9C C1610018 */ lfs f11, 0x18(r1)
/* 00008CA0 C8250000 */ lfd f1, lbl_0001C138@l(r5)
/* 00008CA4 C8010030 */ lfd f0, 0x30(r1)
/* 00008CA8 C84700C8 */ lfd f2, 0xc8(r7)
/* 00008CAC FCA01850 */ fneg f5, f3
/* 00008CB0 C0C60028 */ lfs f6, 0x28(r6)
/* 00008CB4 EC000828 */ fsubs f0, f0, f1
/* 00008CB8 C1460038 */ lfs f10, 0x38(r6)
/* 00008CBC FD205850 */ fneg f9, f11
/* 00008CC0 FCA54024 */ fdiv f5, f5, f8
/* 00008CC4 C086002C */ lfs f4, 0x2c(r6)
/* 00008CC8 C0230034 */ lfs f1, 0x34(r3)
/* 00008CCC 80830030 */ lwz r4, 0x30(r3)
/* 00008CD0 C86700C0 */ lfd f3, 0xc0(r7)
/* 00008CD4 FC020024 */ fdiv f0, f2, f0
/* 00008CD8 C0440014 */ lfs f2, 0x14(r4)
/* 00008CDC ED0A0272 */ fmuls f8, f10, f9
/* 00008CE0 FC852028 */ fsub f4, f5, f4
/* 00008CE4 FCC73028 */ fsub f6, f7, f6
/* 00008CE8 FC630232 */ fmul f3, f3, f8
/* 00008CEC FCA801B2 */ fmul f5, f8, f6
/* 00008CF0 FC880132 */ fmul f4, f8, f4
/* 00008CF4 FCA02818 */ frsp f5, f5
/* 00008CF8 FC631024 */ fdiv f3, f3, f2
/* 00008CFC FC000018 */ frsp f0, f0
/* 00008D00 EC250828 */ fsubs f1, f5, f1
/* 00008D04 FC802018 */ frsp f4, f4
/* 00008D08 FC601818 */ frsp f3, f3
/* 00008D0C EC200072 */ fmuls f1, f0, f1
/* 00008D10 D0230040 */ stfs f1, 0x40(r3)
/* 00008D14 C0230038 */ lfs f1, 0x38(r3)
/* 00008D18 EC240828 */ fsubs f1, f4, f1
/* 00008D1C EC200072 */ fmuls f1, f0, f1
/* 00008D20 D0230044 */ stfs f1, 0x44(r3)
/* 00008D24 C023003C */ lfs f1, 0x3c(r3)
/* 00008D28 EC2B0828 */ fsubs f1, f11, f1
/* 00008D2C EC200072 */ fmuls f1, f0, f1
/* 00008D30 D0230048 */ stfs f1, 0x48(r3)
/* 00008D34 C0430034 */ lfs f2, 0x34(r3)
/* 00008D38 C0230040 */ lfs f1, 0x40(r3)
/* 00008D3C EC22082A */ fadds f1, f2, f1
/* 00008D40 D0230034 */ stfs f1, 0x34(r3)
/* 00008D44 C0430038 */ lfs f2, 0x38(r3)
/* 00008D48 C0230044 */ lfs f1, 0x44(r3)
/* 00008D4C EC22082A */ fadds f1, f2, f1
/* 00008D50 D0230038 */ stfs f1, 0x38(r3)
/* 00008D54 C043003C */ lfs f2, 0x3c(r3)
/* 00008D58 C0230048 */ lfs f1, 0x48(r3)
/* 00008D5C EC22082A */ fadds f1, f2, f1
/* 00008D60 D023003C */ stfs f1, 0x3c(r3)
/* 00008D64 C0430024 */ lfs f2, 0x24(r3)
/* 00008D68 EC231028 */ fsubs f1, f3, f2
/* 00008D6C EC000072 */ fmuls f0, f0, f1
/* 00008D70 EC02002A */ fadds f0, f2, f0
/* 00008D74 D0030024 */ stfs f0, 0x24(r3)
/* 00008D78 C0030024 */ lfs f0, 0x24(r3)
/* 00008D7C D0030028 */ stfs f0, 0x28(r3)
/* 00008D80 C0030024 */ lfs f0, 0x24(r3)
/* 00008D84 D003002C */ stfs f0, 0x2c(r3)
/* 00008D88 A8830054 */ lha r4, 0x54(r3)
/* 00008D8C 7C803E70 */ srawi r0, r4, 7
/* 00008D90 7C002050 */ subf r0, r0, r4
/* 00008D94 B0030054 */ sth r0, 0x54(r3)
/* 00008D98 A883004C */ lha r4, 0x4c(r3)
/* 00008D9C A8030052 */ lha r0, 0x52(r3)
/* 00008DA0 7C040214 */ add r0, r4, r0
/* 00008DA4 B003004C */ sth r0, 0x4c(r3)
/* 00008DA8 A883004E */ lha r4, 0x4e(r3)
/* 00008DAC A8030054 */ lha r0, 0x54(r3)
/* 00008DB0 7C040214 */ add r0, r4, r0
/* 00008DB4 B003004E */ sth r0, 0x4e(r3)
/* 00008DB8 A8830050 */ lha r4, 0x50(r3)
/* 00008DBC A8030056 */ lha r0, 0x56(r3)
/* 00008DC0 7C040214 */ add r0, r4, r0
/* 00008DC4 B0030050 */ sth r0, 0x50(r3)
/* 00008DC8 38210038 */ addi r1, r1, 0x38
/* 00008DCC 4E800020 */ blr 
lbl_00008DD0:
/* 00008DD0 7C0802A6 */ mflr r0
/* 00008DD4 90010004 */ stw r0, 4(r1)
/* 00008DD8 9421FFE8 */ stwu r1, -0x18(r1)
/* 00008DDC 93E10014 */ stw r31, 0x14(r1)
/* 00008DE0 93C10010 */ stw r30, 0x10(r1)
/* 00008DE4 3BC30000 */ addi r30, r3, 0
/* 00008DE8 387E0034 */ addi r3, r30, 0x34
/* 00008DEC 4BFF7379 */ bl mathutil_mtxA_from_translate
/* 00008DF0 A87E004E */ lha r3, 0x4e(r30)
/* 00008DF4 4BFF7371 */ bl mathutil_mtxA_rotate_y
/* 00008DF8 A87E004C */ lha r3, 0x4c(r30)
/* 00008DFC 4BFF7369 */ bl mathutil_mtxA_rotate_x
/* 00008E00 A87E0050 */ lha r3, 0x50(r30)
/* 00008E04 4BFF7361 */ bl mathutil_mtxA_rotate_z
/* 00008E08 C03E0024 */ lfs f1, 0x24(r30)
/* 00008E0C C05E0028 */ lfs f2, 0x28(r30)
/* 00008E10 C07E002C */ lfs f3, 0x2c(r30)
/* 00008E14 4BFF7351 */ bl mathutil_mtxA_scale_xyz
/* 00008E18 3C600000 */ lis r3, mathutilData@ha
/* 00008E1C 3BE30000 */ addi r31, r3, mathutilData@l
/* 00008E20 807F0000 */ lwz r3, 0(r31)
/* 00008E24 38800000 */ li r4, 0
/* 00008E28 4BFF733D */ bl GXLoadPosMtxImm
/* 00008E2C 807F0000 */ lwz r3, 0(r31)
/* 00008E30 38800000 */ li r4, 0
/* 00008E34 4BFF7331 */ bl GXLoadNrmMtxImm
/* 00008E38 C03E0024 */ lfs f1, 0x24(r30)
/* 00008E3C 4BFF7329 */ bl avdisp_set_bound_sphere_scale
/* 00008E40 807E0030 */ lwz r3, 0x30(r30)
/* 00008E44 4BFF7321 */ bl avdisp_draw_model_culled_sort_none
/* 00008E48 8001001C */ lwz r0, 0x1c(r1)
/* 00008E4C 83E10014 */ lwz r31, 0x14(r1)
/* 00008E50 83C10010 */ lwz r30, 0x10(r1)
/* 00008E54 7C0803A6 */ mtlr r0
/* 00008E58 38210018 */ addi r1, r1, 0x18
/* 00008E5C 4E800020 */ blr 
lbl_00008E60:
/* 00008E60 4E800020 */ blr 
lbl_00008E64:
/* 00008E64 7C0802A6 */ mflr r0
/* 00008E68 3C800001 */ lis r4, 1
/* 00008E6C 90010004 */ stw r0, 4(r1)
/* 00008E70 3804FFFF */ addi r0, r4, -1
/* 00008E74 9421FFC0 */ stwu r1, -0x40(r1)
/* 00008E78 93E1003C */ stw r31, 0x3c(r1)
/* 00008E7C 3BE30000 */ addi r31, r3, 0
/* 00008E80 3C600000 */ lis r3, lbl_0001C108@ha
/* 00008E84 93C10038 */ stw r30, 0x38(r1)
/* 00008E88 3BC30000 */ addi r30, r3, lbl_0001C108@l
/* 00008E8C B01F0016 */ sth r0, 0x16(r31)
/* 00008E90 4BFF72D5 */ bl rand
/* 00008E94 6C608000 */ xoris r0, r3, 0x8000
/* 00008E98 C07E0018 */ lfs f3, 0x18(r30)
/* 00008E9C 90010034 */ stw r0, 0x34(r1)
/* 00008EA0 3C004330 */ lis r0, 0x4330
/* 00008EA4 3C600000 */ lis r3, lbl_0001C138@ha
/* 00008EA8 C05E00D0 */ lfs f2, 0xd0(r30)
/* 00008EAC 90010030 */ stw r0, 0x30(r1)
/* 00008EB0 C8A30000 */ lfd f5, lbl_0001C138@l(r3)
/* 00008EB4 389F00A0 */ addi r4, r31, 0xa0
/* 00008EB8 C8810030 */ lfd f4, 0x30(r1)
/* 00008EBC 38BF00A2 */ addi r5, r31, 0xa2
/* 00008EC0 C03E0014 */ lfs f1, 0x14(r30)
/* 00008EC4 EC842828 */ fsubs f4, f4, f5
/* 00008EC8 C01E0080 */ lfs f0, 0x80(r30)
/* 00008ECC EC641824 */ fdivs f3, f4, f3
/* 00008ED0 EC4200F2 */ fmuls f2, f2, f3
/* 00008ED4 EC21102A */ fadds f1, f1, f2
/* 00008ED8 EC000072 */ fmuls f0, f0, f1
/* 00008EDC FC00001E */ fctiwz f0, f0
/* 00008EE0 D8010028 */ stfd f0, 0x28(r1)
/* 00008EE4 8001002C */ lwz r0, 0x2c(r1)
/* 00008EE8 901F000C */ stw r0, 0xc(r31)
/* 00008EEC 807F0030 */ lwz r3, 0x30(r31)
/* 00008EF0 C0030014 */ lfs f0, 0x14(r3)
/* 00008EF4 D01F00A8 */ stfs f0, 0xa8(r31)
/* 00008EF8 C01E0004 */ lfs f0, 4(r30)
/* 00008EFC D01F0024 */ stfs f0, 0x24(r31)
/* 00008F00 807F0030 */ lwz r3, 0x30(r31)
/* 00008F04 38630008 */ addi r3, r3, 8
/* 00008F08 4BFF725D */ bl mathutil_vec_to_euler_xy
/* 00008F0C 387F0034 */ addi r3, r31, 0x34
/* 00008F10 3881000C */ addi r4, r1, 0xc
/* 00008F14 38BF007C */ addi r5, r31, 0x7c
/* 00008F18 4BFF724D */ bl raycast_stage_down
/* 00008F1C 28030000 */ cmplwi r3, 0
/* 00008F20 40820010 */ bne lbl_00008F30
/* 00008F24 38000000 */ li r0, 0
/* 00008F28 B01F000A */ sth r0, 0xa(r31)
/* 00008F2C 4800003C */ b lbl_00008F68
lbl_00008F30:
/* 00008F30 38000001 */ li r0, 1
/* 00008F34 B01F000A */ sth r0, 0xa(r31)
/* 00008F38 80610010 */ lwz r3, 0x10(r1)
/* 00008F3C 80010014 */ lwz r0, 0x14(r1)
/* 00008F40 907F0064 */ stw r3, 0x64(r31)
/* 00008F44 901F0068 */ stw r0, 0x68(r31)
/* 00008F48 80010018 */ lwz r0, 0x18(r1)
/* 00008F4C 901F006C */ stw r0, 0x6c(r31)
/* 00008F50 8061001C */ lwz r3, 0x1c(r1)
/* 00008F54 80010020 */ lwz r0, 0x20(r1)
/* 00008F58 907F0070 */ stw r3, 0x70(r31)
/* 00008F5C 901F0074 */ stw r0, 0x74(r31)
/* 00008F60 80010024 */ lwz r0, 0x24(r1)
/* 00008F64 901F0078 */ stw r0, 0x78(r31)
lbl_00008F68:
/* 00008F68 80010044 */ lwz r0, 0x44(r1)
/* 00008F6C 83E1003C */ lwz r31, 0x3c(r1)
/* 00008F70 83C10038 */ lwz r30, 0x38(r1)
/* 00008F74 7C0803A6 */ mtlr r0
/* 00008F78 38210040 */ addi r1, r1, 0x40
/* 00008F7C 4E800020 */ blr 
lbl_00008F80:
/* 00008F80 7C0802A6 */ mflr r0
/* 00008F84 90010004 */ stw r0, 4(r1)
/* 00008F88 9421FF68 */ stwu r1, -0x98(r1)
/* 00008F8C DBE10090 */ stfd f31, 0x90(r1)
/* 00008F90 93E1008C */ stw r31, 0x8c(r1)
/* 00008F94 93C10088 */ stw r30, 0x88(r1)
/* 00008F98 3C800000 */ lis r4, lbl_0001C108@ha
/* 00008F9C C0030044 */ lfs f0, 0x44(r3)
/* 00008FA0 3BE40000 */ addi r31, r4, lbl_0001C108@l
/* 00008FA4 A8E30052 */ lha r7, 0x52(r3)
/* 00008FA8 C03F00D4 */ lfs f1, 0xd4(r31)
/* 00008FAC 3BC30000 */ addi r30, r3, 0
/* 00008FB0 3CA04330 */ lis r5, 0x4330
/* 00008FB4 EC010032 */ fmuls f0, f1, f0
/* 00008FB8 3CC00000 */ lis r6, lbl_0001C138@ha
/* 00008FBC 3C800000 */ lis r4, lbl_0001C138@ha
/* 00008FC0 3C600000 */ lis r3, lbl_0001C138@ha
/* 00008FC4 FC00001E */ fctiwz f0, f0
/* 00008FC8 D8010080 */ stfd f0, 0x80(r1)
/* 00008FCC 80010084 */ lwz r0, 0x84(r1)
/* 00008FD0 7C070214 */ add r0, r7, r0
/* 00008FD4 B01E0052 */ sth r0, 0x52(r30)
/* 00008FD8 C03F00D8 */ lfs f1, 0xd8(r31)
/* 00008FDC C01E0048 */ lfs f0, 0x48(r30)
/* 00008FE0 A8FE0054 */ lha r7, 0x54(r30)
/* 00008FE4 EC010032 */ fmuls f0, f1, f0
/* 00008FE8 FC00001E */ fctiwz f0, f0
/* 00008FEC D8010078 */ stfd f0, 0x78(r1)
/* 00008FF0 8001007C */ lwz r0, 0x7c(r1)
/* 00008FF4 7C070214 */ add r0, r7, r0
/* 00008FF8 B01E0054 */ sth r0, 0x54(r30)
/* 00008FFC C03F00D8 */ lfs f1, 0xd8(r31)
/* 00009000 C01E0040 */ lfs f0, 0x40(r30)
/* 00009004 A8FE0056 */ lha r7, 0x56(r30)
/* 00009008 EC010032 */ fmuls f0, f1, f0
/* 0000900C FC00001E */ fctiwz f0, f0
/* 00009010 D8010070 */ stfd f0, 0x70(r1)
/* 00009014 80010074 */ lwz r0, 0x74(r1)
/* 00009018 7C070214 */ add r0, r7, r0
/* 0000901C B01E0056 */ sth r0, 0x56(r30)
/* 00009020 A81E0052 */ lha r0, 0x52(r30)
/* 00009024 C03F00DC */ lfs f1, 0xdc(r31)
/* 00009028 6C008000 */ xoris r0, r0, 0x8000
/* 0000902C C01E00A8 */ lfs f0, 0xa8(r30)
/* 00009030 9001006C */ stw r0, 0x6c(r1)
/* 00009034 EC410032 */ fmuls f2, f1, f0
/* 00009038 C07F0004 */ lfs f3, 4(r31)
/* 0000903C 90A10068 */ stw r5, 0x68(r1)
/* 00009040 C8260000 */ lfd f1, lbl_0001C138@l(r6)
/* 00009044 C8010068 */ lfd f0, 0x68(r1)
/* 00009048 EFE31028 */ fsubs f31, f3, f2
/* 0000904C EC000828 */ fsubs f0, f0, f1
/* 00009050 EC0007F2 */ fmuls f0, f0, f31
/* 00009054 FC00001E */ fctiwz f0, f0
/* 00009058 D8010060 */ stfd f0, 0x60(r1)
/* 0000905C 80010064 */ lwz r0, 0x64(r1)
/* 00009060 B01E0052 */ sth r0, 0x52(r30)
/* 00009064 A81E0054 */ lha r0, 0x54(r30)
/* 00009068 C8240000 */ lfd f1, lbl_0001C138@l(r4)
/* 0000906C 6C008000 */ xoris r0, r0, 0x8000
/* 00009070 9001005C */ stw r0, 0x5c(r1)
/* 00009074 90A10058 */ stw r5, 0x58(r1)
/* 00009078 C8010058 */ lfd f0, 0x58(r1)
/* 0000907C EC000828 */ fsubs f0, f0, f1
/* 00009080 EC0007F2 */ fmuls f0, f0, f31
/* 00009084 FC00001E */ fctiwz f0, f0
/* 00009088 D8010050 */ stfd f0, 0x50(r1)
/* 0000908C 80010054 */ lwz r0, 0x54(r1)
/* 00009090 B01E0054 */ sth r0, 0x54(r30)
/* 00009094 A81E0056 */ lha r0, 0x56(r30)
/* 00009098 C8230000 */ lfd f1, lbl_0001C138@l(r3)
/* 0000909C 6C008000 */ xoris r0, r0, 0x8000
/* 000090A0 9001004C */ stw r0, 0x4c(r1)
/* 000090A4 90A10048 */ stw r5, 0x48(r1)
/* 000090A8 C8010048 */ lfd f0, 0x48(r1)
/* 000090AC EC000828 */ fsubs f0, f0, f1
/* 000090B0 EC0007F2 */ fmuls f0, f0, f31
/* 000090B4 FC00001E */ fctiwz f0, f0
/* 000090B8 D8010040 */ stfd f0, 0x40(r1)
/* 000090BC 80010044 */ lwz r0, 0x44(r1)
/* 000090C0 B01E0056 */ sth r0, 0x56(r30)
/* 000090C4 A87E004C */ lha r3, 0x4c(r30)
/* 000090C8 A81E0052 */ lha r0, 0x52(r30)
/* 000090CC 7C030214 */ add r0, r3, r0
/* 000090D0 B01E004C */ sth r0, 0x4c(r30)
/* 000090D4 A87E004E */ lha r3, 0x4e(r30)
/* 000090D8 A81E0054 */ lha r0, 0x54(r30)
/* 000090DC 7C030214 */ add r0, r3, r0
/* 000090E0 B01E004E */ sth r0, 0x4e(r30)
/* 000090E4 A87E0050 */ lha r3, 0x50(r30)
/* 000090E8 A81E0056 */ lha r0, 0x56(r30)
/* 000090EC 7C030214 */ add r0, r3, r0
/* 000090F0 B01E0050 */ sth r0, 0x50(r30)
/* 000090F4 C03F00E0 */ lfs f1, 0xe0(r31)
/* 000090F8 C01E00A8 */ lfs f0, 0xa8(r30)
/* 000090FC C05F0004 */ lfs f2, 4(r31)
/* 00009100 EC010032 */ fmuls f0, f1, f0
/* 00009104 A87E004E */ lha r3, 0x4e(r30)
/* 00009108 EFE20028 */ fsubs f31, f2, f0
/* 0000910C 4BFF7059 */ bl mathutil_mtxA_from_rotate_y
/* 00009110 A87E004C */ lha r3, 0x4c(r30)
/* 00009114 4BFF7051 */ bl mathutil_mtxA_rotate_x
/* 00009118 A87E0050 */ lha r3, 0x50(r30)
/* 0000911C 4BFF7049 */ bl mathutil_mtxA_rotate_z
/* 00009120 A87E00A2 */ lha r3, 0xa2(r30)
/* 00009124 4BFF7041 */ bl mathutil_mtxA_rotate_y
/* 00009128 A87E00A0 */ lha r3, 0xa0(r30)
/* 0000912C 4BFF7039 */ bl mathutil_mtxA_rotate_x
/* 00009130 80BE0040 */ lwz r5, 0x40(r30)
/* 00009134 38610034 */ addi r3, r1, 0x34
/* 00009138 801E0044 */ lwz r0, 0x44(r30)
/* 0000913C 7C641B78 */ mr r4, r3
/* 00009140 90A10034 */ stw r5, 0x34(r1)
/* 00009144 90010038 */ stw r0, 0x38(r1)
/* 00009148 801E0048 */ lwz r0, 0x48(r30)
/* 0000914C 9001003C */ stw r0, 0x3c(r1)
/* 00009150 4BFF7015 */ bl mathutil_mtxA_rigid_inv_tf_vec
/* 00009154 C0010034 */ lfs f0, 0x34(r1)
/* 00009158 38610034 */ addi r3, r1, 0x34
/* 0000915C 38830000 */ addi r4, r3, 0
/* 00009160 EC0007F2 */ fmuls f0, f0, f31
/* 00009164 D0010034 */ stfs f0, 0x34(r1)
/* 00009168 C0010038 */ lfs f0, 0x38(r1)
/* 0000916C EC0007F2 */ fmuls f0, f0, f31
/* 00009170 D0010038 */ stfs f0, 0x38(r1)
/* 00009174 C01F00E4 */ lfs f0, 0xe4(r31)
/* 00009178 C021003C */ lfs f1, 0x3c(r1)
/* 0000917C EC0007F2 */ fmuls f0, f0, f31
/* 00009180 EC010032 */ fmuls f0, f1, f0
/* 00009184 D001003C */ stfs f0, 0x3c(r1)
/* 00009188 4BFF6FDD */ bl mathutil_mtxA_tf_vec
/* 0000918C 80610034 */ lwz r3, 0x34(r1)
/* 00009190 80010038 */ lwz r0, 0x38(r1)
/* 00009194 907E0040 */ stw r3, 0x40(r30)
/* 00009198 901E0044 */ stw r0, 0x44(r30)
/* 0000919C 8001003C */ lwz r0, 0x3c(r1)
/* 000091A0 901E0048 */ stw r0, 0x48(r30)
/* 000091A4 C03E0044 */ lfs f1, 0x44(r30)
/* 000091A8 C01F0054 */ lfs f0, 0x54(r31)
/* 000091AC EC01002A */ fadds f0, f1, f0
/* 000091B0 D01E0044 */ stfs f0, 0x44(r30)
/* 000091B4 C03E0034 */ lfs f1, 0x34(r30)
/* 000091B8 C01E0040 */ lfs f0, 0x40(r30)
/* 000091BC EC01002A */ fadds f0, f1, f0
/* 000091C0 D01E0034 */ stfs f0, 0x34(r30)
/* 000091C4 C03E0038 */ lfs f1, 0x38(r30)
/* 000091C8 C01E0044 */ lfs f0, 0x44(r30)
/* 000091CC EC01002A */ fadds f0, f1, f0
/* 000091D0 D01E0038 */ stfs f0, 0x38(r30)
/* 000091D4 C03E003C */ lfs f1, 0x3c(r30)
/* 000091D8 C01E0048 */ lfs f0, 0x48(r30)
/* 000091DC EC01002A */ fadds f0, f1, f0
/* 000091E0 D01E003C */ stfs f0, 0x3c(r30)
/* 000091E4 801E000C */ lwz r0, 0xc(r30)
/* 000091E8 540007BF */ clrlwi. r0, r0, 0x1e
/* 000091EC 40820060 */ bne lbl_0000924C
/* 000091F0 387E0034 */ addi r3, r30, 0x34
/* 000091F4 38810018 */ addi r4, r1, 0x18
/* 000091F8 38BE007C */ addi r5, r30, 0x7c
/* 000091FC 4BFF6F69 */ bl raycast_stage_down
/* 00009200 28030000 */ cmplwi r3, 0
/* 00009204 40820010 */ bne lbl_00009214
/* 00009208 38000000 */ li r0, 0
/* 0000920C B01E000A */ sth r0, 0xa(r30)
/* 00009210 4800003C */ b lbl_0000924C
lbl_00009214:
/* 00009214 38000001 */ li r0, 1
/* 00009218 B01E000A */ sth r0, 0xa(r30)
/* 0000921C 8061001C */ lwz r3, 0x1c(r1)
/* 00009220 80010020 */ lwz r0, 0x20(r1)
/* 00009224 907E0064 */ stw r3, 0x64(r30)
/* 00009228 901E0068 */ stw r0, 0x68(r30)
/* 0000922C 80010024 */ lwz r0, 0x24(r1)
/* 00009230 901E006C */ stw r0, 0x6c(r30)
/* 00009234 80610028 */ lwz r3, 0x28(r1)
/* 00009238 8001002C */ lwz r0, 0x2c(r1)
/* 0000923C 907E0070 */ stw r3, 0x70(r30)
/* 00009240 901E0074 */ stw r0, 0x74(r30)
/* 00009244 80010030 */ lwz r0, 0x30(r1)
/* 00009248 901E0078 */ stw r0, 0x78(r30)
lbl_0000924C:
/* 0000924C A81E000A */ lha r0, 0xa(r30)
/* 00009250 2C000001 */ cmpwi r0, 1
/* 00009254 40820224 */ bne lbl_00009478
/* 00009258 C03E0034 */ lfs f1, 0x34(r30)
/* 0000925C C01E0064 */ lfs f0, 0x64(r30)
/* 00009260 EC010028 */ fsubs f0, f1, f0
/* 00009264 D0010034 */ stfs f0, 0x34(r1)
/* 00009268 C03E0038 */ lfs f1, 0x38(r30)
/* 0000926C C01E0068 */ lfs f0, 0x68(r30)
/* 00009270 EC010028 */ fsubs f0, f1, f0
/* 00009274 D0010038 */ stfs f0, 0x38(r1)
/* 00009278 C03E003C */ lfs f1, 0x3c(r30)
/* 0000927C C01E006C */ lfs f0, 0x6c(r30)
/* 00009280 EC010028 */ fsubs f0, f1, f0
/* 00009284 D001003C */ stfs f0, 0x3c(r1)
/* 00009288 807E0070 */ lwz r3, 0x70(r30)
/* 0000928C 801E0074 */ lwz r0, 0x74(r30)
/* 00009290 9061000C */ stw r3, 0xc(r1)
/* 00009294 90010010 */ stw r0, 0x10(r1)
/* 00009298 801E0078 */ lwz r0, 0x78(r30)
/* 0000929C 90010014 */ stw r0, 0x14(r1)
/* 000092A0 C0A1000C */ lfs f5, 0xc(r1)
/* 000092A4 C0410034 */ lfs f2, 0x34(r1)
/* 000092A8 C0810010 */ lfs f4, 0x10(r1)
/* 000092AC C0210038 */ lfs f1, 0x38(r1)
/* 000092B0 C0610014 */ lfs f3, 0x14(r1)
/* 000092B4 C001003C */ lfs f0, 0x3c(r1)
/* 000092B8 EC4500B2 */ fmuls f2, f5, f2
/* 000092BC EC44107A */ fmadds f2, f4, f1, f2
/* 000092C0 EC43103A */ fmadds f2, f3, f0, f2
/* 000092C4 C03E00A8 */ lfs f1, 0xa8(r30)
/* 000092C8 C01E0024 */ lfs f0, 0x24(r30)
/* 000092CC EC010032 */ fmuls f0, f1, f0
/* 000092D0 FC020040 */ fcmpo cr0, f2, f0
/* 000092D4 408001A4 */ bge lbl_00009478
/* 000092D8 EC001028 */ fsubs f0, f0, f2
/* 000092DC C021000C */ lfs f1, 0xc(r1)
/* 000092E0 C05E0034 */ lfs f2, 0x34(r30)
/* 000092E4 EC200072 */ fmuls f1, f0, f1
/* 000092E8 EC22082A */ fadds f1, f2, f1
/* 000092EC D03E0034 */ stfs f1, 0x34(r30)
/* 000092F0 C0210010 */ lfs f1, 0x10(r1)
/* 000092F4 C05E0038 */ lfs f2, 0x38(r30)
/* 000092F8 EC200072 */ fmuls f1, f0, f1
/* 000092FC EC22082A */ fadds f1, f2, f1
/* 00009300 D03E0038 */ stfs f1, 0x38(r30)
/* 00009304 C0210014 */ lfs f1, 0x14(r1)
/* 00009308 C05E003C */ lfs f2, 0x3c(r30)
/* 0000930C EC000072 */ fmuls f0, f0, f1
/* 00009310 EC02002A */ fadds f0, f2, f0
/* 00009314 D01E003C */ stfs f0, 0x3c(r30)
/* 00009318 A87E004C */ lha r3, 0x4c(r30)
/* 0000931C 7C602E70 */ srawi r0, r3, 5
/* 00009320 7C001850 */ subf r0, r0, r3
/* 00009324 B01E004C */ sth r0, 0x4c(r30)
/* 00009328 A87E004E */ lha r3, 0x4e(r30)
/* 0000932C 7C602E70 */ srawi r0, r3, 5
/* 00009330 7C001850 */ subf r0, r0, r3
/* 00009334 B01E004E */ sth r0, 0x4e(r30)
/* 00009338 A87E0050 */ lha r3, 0x50(r30)
/* 0000933C 7C602E70 */ srawi r0, r3, 5
/* 00009340 7C001850 */ subf r0, r0, r3
/* 00009344 B01E0050 */ sth r0, 0x50(r30)
/* 00009348 807E0040 */ lwz r3, 0x40(r30)
/* 0000934C 801E0044 */ lwz r0, 0x44(r30)
/* 00009350 90610034 */ stw r3, 0x34(r1)
/* 00009354 90010038 */ stw r0, 0x38(r1)
/* 00009358 801E0048 */ lwz r0, 0x48(r30)
/* 0000935C 9001003C */ stw r0, 0x3c(r1)
/* 00009360 C0A1000C */ lfs f5, 0xc(r1)
/* 00009364 C0410034 */ lfs f2, 0x34(r1)
/* 00009368 C0810010 */ lfs f4, 0x10(r1)
/* 0000936C C0210038 */ lfs f1, 0x38(r1)
/* 00009370 C0610014 */ lfs f3, 0x14(r1)
/* 00009374 C001003C */ lfs f0, 0x3c(r1)
/* 00009378 EC4500B2 */ fmuls f2, f5, f2
/* 0000937C EC44107A */ fmadds f2, f4, f1, f2
/* 00009380 EC43103A */ fmadds f2, f3, f0, f2
/* 00009384 C01F0000 */ lfs f0, 0(r31)
/* 00009388 FC020040 */ fcmpo cr0, f2, f0
/* 0000938C 408000EC */ bge lbl_00009478
/* 00009390 C01F00E8 */ lfs f0, 0xe8(r31)
/* 00009394 C0C1000C */ lfs f6, 0xc(r1)
/* 00009398 EC020032 */ fmuls f0, f2, f0
/* 0000939C C0A10010 */ lfs f5, 0x10(r1)
/* 000093A0 C0810014 */ lfs f4, 0x14(r1)
/* 000093A4 C0E10034 */ lfs f7, 0x34(r1)
/* 000093A8 EC6001B2 */ fmuls f3, f0, f6
/* 000093AC EC400172 */ fmuls f2, f0, f5
/* 000093B0 EC200132 */ fmuls f1, f0, f4
/* 000093B4 EC67182A */ fadds f3, f7, f3
/* 000093B8 D0610034 */ stfs f3, 0x34(r1)
/* 000093BC C0610038 */ lfs f3, 0x38(r1)
/* 000093C0 EC43102A */ fadds f2, f3, f2
/* 000093C4 D0410038 */ stfs f2, 0x38(r1)
/* 000093C8 C041003C */ lfs f2, 0x3c(r1)
/* 000093CC EC22082A */ fadds f1, f2, f1
/* 000093D0 D021003C */ stfs f1, 0x3c(r1)
/* 000093D4 C0610034 */ lfs f3, 0x34(r1)
/* 000093D8 C03E007C */ lfs f1, 0x7c(r30)
/* 000093DC C05F001C */ lfs f2, 0x1c(r31)
/* 000093E0 EC211828 */ fsubs f1, f1, f3
/* 000093E4 EC220072 */ fmuls f1, f2, f1
/* 000093E8 EC23082A */ fadds f1, f3, f1
/* 000093EC D0210034 */ stfs f1, 0x34(r1)
/* 000093F0 C0610038 */ lfs f3, 0x38(r1)
/* 000093F4 C03E0080 */ lfs f1, 0x80(r30)
/* 000093F8 C05F001C */ lfs f2, 0x1c(r31)
/* 000093FC EC211828 */ fsubs f1, f1, f3
/* 00009400 EC220072 */ fmuls f1, f2, f1
/* 00009404 EC23082A */ fadds f1, f3, f1
/* 00009408 D0210038 */ stfs f1, 0x38(r1)
/* 0000940C C061003C */ lfs f3, 0x3c(r1)
/* 00009410 C03E0084 */ lfs f1, 0x84(r30)
/* 00009414 C05F001C */ lfs f2, 0x1c(r31)
/* 00009418 EC211828 */ fsubs f1, f1, f3
/* 0000941C EC220072 */ fmuls f1, f2, f1
/* 00009420 EC23082A */ fadds f1, f3, f1
/* 00009424 D021003C */ stfs f1, 0x3c(r1)
/* 00009428 C03F0060 */ lfs f1, 0x60(r31)
/* 0000942C C0610034 */ lfs f3, 0x34(r1)
/* 00009430 EC000072 */ fmuls f0, f0, f1
/* 00009434 EC4001B2 */ fmuls f2, f0, f6
/* 00009438 EC200172 */ fmuls f1, f0, f5
/* 0000943C EC000132 */ fmuls f0, f0, f4
/* 00009440 EC43102A */ fadds f2, f3, f2
/* 00009444 D0410034 */ stfs f2, 0x34(r1)
/* 00009448 C0410038 */ lfs f2, 0x38(r1)
/* 0000944C EC22082A */ fadds f1, f2, f1
/* 00009450 D0210038 */ stfs f1, 0x38(r1)
/* 00009454 C021003C */ lfs f1, 0x3c(r1)
/* 00009458 EC01002A */ fadds f0, f1, f0
/* 0000945C D001003C */ stfs f0, 0x3c(r1)
/* 00009460 80610034 */ lwz r3, 0x34(r1)
/* 00009464 80010038 */ lwz r0, 0x38(r1)
/* 00009468 907E0040 */ stw r3, 0x40(r30)
/* 0000946C 901E0044 */ stw r0, 0x44(r30)
/* 00009470 8001003C */ lwz r0, 0x3c(r1)
/* 00009474 901E0048 */ stw r0, 0x48(r30)
lbl_00009478:
/* 00009478 807E000C */ lwz r3, 0xc(r30)
/* 0000947C 2C03001E */ cmpwi r3, 0x1e
/* 00009480 40800054 */ bge lbl_000094D4
/* 00009484 38030001 */ addi r0, r3, 1
/* 00009488 C01E0024 */ lfs f0, 0x24(r30)
/* 0000948C 6C638000 */ xoris r3, r3, 0x8000
/* 00009490 6C008000 */ xoris r0, r0, 0x8000
/* 00009494 90610044 */ stw r3, 0x44(r1)
/* 00009498 3C804330 */ lis r4, 0x4330
/* 0000949C 9001004C */ stw r0, 0x4c(r1)
/* 000094A0 3CA00000 */ lis r5, lbl_0001C138@ha
/* 000094A4 3C600000 */ lis r3, lbl_0001C138@ha
/* 000094A8 C8850000 */ lfd f4, lbl_0001C138@l(r5)
/* 000094AC 90810040 */ stw r4, 0x40(r1)
/* 000094B0 C8430000 */ lfd f2, lbl_0001C138@l(r3)
/* 000094B4 90810048 */ stw r4, 0x48(r1)
/* 000094B8 C8610040 */ lfd f3, 0x40(r1)
/* 000094BC C8210048 */ lfd f1, 0x48(r1)
/* 000094C0 EC632028 */ fsubs f3, f3, f4
/* 000094C4 EC211028 */ fsubs f1, f1, f2
/* 000094C8 EC230824 */ fdivs f1, f3, f1
/* 000094CC EC000072 */ fmuls f0, f0, f1
/* 000094D0 D01E0024 */ stfs f0, 0x24(r30)
lbl_000094D4:
/* 000094D4 8001009C */ lwz r0, 0x9c(r1)
/* 000094D8 CBE10090 */ lfd f31, 0x90(r1)
/* 000094DC 83E1008C */ lwz r31, 0x8c(r1)
/* 000094E0 7C0803A6 */ mtlr r0
/* 000094E4 83C10088 */ lwz r30, 0x88(r1)
/* 000094E8 38210098 */ addi r1, r1, 0x98
/* 000094EC 4E800020 */ blr 
lbl_000094F0:
/* 000094F0 7C0802A6 */ mflr r0
/* 000094F4 3C800000 */ lis r4, polyDisp@ha
/* 000094F8 90010004 */ stw r0, 4(r1)
/* 000094FC 9421FFE0 */ stwu r1, -0x20(r1)
/* 00009500 93E1001C */ stw r31, 0x1c(r1)
/* 00009504 93C10018 */ stw r30, 0x18(r1)
/* 00009508 93A10014 */ stw r29, 0x14(r1)
/* 0000950C 7C7D1B78 */ mr r29, r3
/* 00009510 80040000 */ lwz r0, polyDisp@l(r4)
/* 00009514 83C30030 */ lwz r30, 0x30(r3)
/* 00009518 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 0000951C 41820030 */ beq lbl_0000954C
/* 00009520 C01E0014 */ lfs f0, 0x14(r30)
/* 00009524 C03D0038 */ lfs f1, 0x38(r29)
/* 00009528 FC000050 */ fneg f0, f0
/* 0000952C FC010040 */ fcmpo cr0, f1, f0
/* 00009530 418000A0 */ blt lbl_000095D0
/* 00009534 A89D00A4 */ lha r4, 0xa4(r29)
/* 00009538 3C600000 */ lis r3, lbl_10000000@ha
/* 0000953C 38030000 */ addi r0, r3, lbl_10000000@l
/* 00009540 5483103A */ slwi r3, r4, 2
/* 00009544 7C601A14 */ add r3, r0, r3
/* 00009548 83C30000 */ lwz r30, 0(r3)
lbl_0000954C:
/* 0000954C C03D0034 */ lfs f1, 0x34(r29)
/* 00009550 C05D0038 */ lfs f2, 0x38(r29)
/* 00009554 C07D003C */ lfs f3, 0x3c(r29)
/* 00009558 4BFF6C0D */ bl mathutil_mtxA_from_mtxB_translate_xyz
/* 0000955C A87D004E */ lha r3, 0x4e(r29)
/* 00009560 4BFF6C05 */ bl mathutil_mtxA_rotate_y
/* 00009564 A87D004C */ lha r3, 0x4c(r29)
/* 00009568 4BFF6BFD */ bl mathutil_mtxA_rotate_x
/* 0000956C A87D0050 */ lha r3, 0x50(r29)
/* 00009570 4BFF6BF5 */ bl mathutil_mtxA_rotate_z
/* 00009574 C03D0024 */ lfs f1, 0x24(r29)
/* 00009578 4BFF6BED */ bl mathutil_mtxA_scale_s
/* 0000957C 387E0008 */ addi r3, r30, 8
/* 00009580 4BFF6BE5 */ bl mathutil_mtxA_translate_neg
/* 00009584 3C600000 */ lis r3, lbl_0001C10C@ha
/* 00009588 C03E0014 */ lfs f1, 0x14(r30)
/* 0000958C C0430000 */ lfs f2, lbl_0001C10C@l(r3)
/* 00009590 387E0008 */ addi r3, r30, 8
/* 00009594 4BFF6BD1 */ bl test_scaled_sphere_in_frustum
/* 00009598 2C030000 */ cmpwi r3, 0
/* 0000959C 41820034 */ beq lbl_000095D0
/* 000095A0 3C600000 */ lis r3, mathutilData@ha
/* 000095A4 3BE30000 */ addi r31, r3, mathutilData@l
/* 000095A8 807F0000 */ lwz r3, 0(r31)
/* 000095AC 38800000 */ li r4, 0
/* 000095B0 4BFF6BB5 */ bl GXLoadPosMtxImm
/* 000095B4 807F0000 */ lwz r3, 0(r31)
/* 000095B8 38800000 */ li r4, 0
/* 000095BC 4BFF6BA9 */ bl GXLoadNrmMtxImm
/* 000095C0 C03D0024 */ lfs f1, 0x24(r29)
/* 000095C4 4BFF6BA1 */ bl avdisp_set_bound_sphere_scale
/* 000095C8 7FC3F378 */ mr r3, r30
/* 000095CC 4BFF6B99 */ bl avdisp_draw_model_unculled_sort_translucent
lbl_000095D0:
/* 000095D0 80010024 */ lwz r0, 0x24(r1)
/* 000095D4 83E1001C */ lwz r31, 0x1c(r1)
/* 000095D8 83C10018 */ lwz r30, 0x18(r1)
/* 000095DC 7C0803A6 */ mtlr r0
/* 000095E0 83A10014 */ lwz r29, 0x14(r1)
/* 000095E4 38210020 */ addi r1, r1, 0x20
/* 000095E8 4E800020 */ blr 
lbl_000095EC:
/* 000095EC 4E800020 */ blr 
lbl_000095F0:
/* 000095F0 7C0802A6 */ mflr r0
/* 000095F4 3C800000 */ lis r4, lbl_0001C108@ha
/* 000095F8 90010004 */ stw r0, 4(r1)
/* 000095FC 3800003C */ li r0, 0x3c
/* 00009600 9421FFE0 */ stwu r1, -0x20(r1)
/* 00009604 93E1001C */ stw r31, 0x1c(r1)
/* 00009608 3BE40000 */ addi r31, r4, lbl_0001C108@l
/* 0000960C 93C10018 */ stw r30, 0x18(r1)
/* 00009610 3BC30000 */ addi r30, r3, 0
/* 00009614 3C600000 */ lis r3, cameraInfo@ha
/* 00009618 901E000C */ stw r0, 0xc(r30)
/* 0000961C 38000001 */ li r0, 1
/* 00009620 38630000 */ addi r3, r3, cameraInfo@l
/* 00009624 B01E0016 */ sth r0, 0x16(r30)
/* 00009628 38630144 */ addi r3, r3, 0x144
/* 0000962C 4BFF6B39 */ bl mathutil_mtxA_from_mtx
/* 00009630 387E0034 */ addi r3, r30, 0x34
/* 00009634 38830000 */ addi r4, r3, 0
/* 00009638 4BFF6B2D */ bl mathutil_mtxA_tf_point
/* 0000963C C05F00EC */ lfs f2, 0xec(r31)
/* 00009640 3C800000 */ lis r4, lbl_0001C138@ha
/* 00009644 C03E003C */ lfs f1, 0x3c(r30)
/* 00009648 3C004330 */ lis r0, 0x4330
/* 0000964C C01E0034 */ lfs f0, 0x34(r30)
/* 00009650 EC220824 */ fdivs f1, f2, f1
/* 00009654 3C600000 */ lis r3, globalAnimTimer@ha
/* 00009658 EC000072 */ fmuls f0, f0, f1
/* 0000965C D01E0034 */ stfs f0, 0x34(r30)
/* 00009660 C01E0038 */ lfs f0, 0x38(r30)
/* 00009664 EC000072 */ fmuls f0, f0, f1
/* 00009668 D01E0038 */ stfs f0, 0x38(r30)
/* 0000966C C01F00EC */ lfs f0, 0xec(r31)
/* 00009670 D01E003C */ stfs f0, 0x3c(r30)
/* 00009674 C01E0024 */ lfs f0, 0x24(r30)
/* 00009678 EC000072 */ fmuls f0, f0, f1
/* 0000967C D01E0024 */ stfs f0, 0x24(r30)
/* 00009680 A8BE0050 */ lha r5, 0x50(r30)
/* 00009684 C8240000 */ lfd f1, lbl_0001C138@l(r4)
/* 00009688 6CA48000 */ xoris r4, r5, 0x8000
/* 0000968C 90810014 */ stw r4, 0x14(r1)
/* 00009690 90010010 */ stw r0, 0x10(r1)
/* 00009694 C8010010 */ lfd f0, 0x10(r1)
/* 00009698 EC000828 */ fsubs f0, f0, f1
/* 0000969C D01E0090 */ stfs f0, 0x90(r30)
/* 000096A0 C01F00F0 */ lfs f0, 0xf0(r31)
/* 000096A4 D01E009C */ stfs f0, 0x9c(r30)
/* 000096A8 80030000 */ lwz r0, globalAnimTimer@l(r3)
/* 000096AC 540007FF */ clrlwi. r0, r0, 0x1f
/* 000096B0 41820010 */ beq lbl_000096C0
/* 000096B4 C01E009C */ lfs f0, 0x9c(r30)
/* 000096B8 FC000050 */ fneg f0, f0
/* 000096BC D01E009C */ stfs f0, 0x9c(r30)
lbl_000096C0:
/* 000096C0 C01F0020 */ lfs f0, 0x20(r31)
/* 000096C4 D01E00A8 */ stfs f0, 0xa8(r30)
/* 000096C8 80010024 */ lwz r0, 0x24(r1)
/* 000096CC 83E1001C */ lwz r31, 0x1c(r1)
/* 000096D0 83C10018 */ lwz r30, 0x18(r1)
/* 000096D4 7C0803A6 */ mtlr r0
/* 000096D8 38210020 */ addi r1, r1, 0x20
/* 000096DC 4E800020 */ blr 
lbl_000096E0:
/* 000096E0 7C0802A6 */ mflr r0
/* 000096E4 3C800000 */ lis r4, ballInfo@ha
/* 000096E8 90010004 */ stw r0, 4(r1)
/* 000096EC 9421FFB0 */ stwu r1, -0x50(r1)
/* 000096F0 DBE10048 */ stfd f31, 0x48(r1)
/* 000096F4 93E10044 */ stw r31, 0x44(r1)
/* 000096F8 7C7F1B78 */ mr r31, r3
/* 000096FC 93C10040 */ stw r30, 0x40(r1)
/* 00009700 93A1003C */ stw r29, 0x3c(r1)
/* 00009704 93810038 */ stw r28, 0x38(r1)
/* 00009708 A8030014 */ lha r0, 0x14(r3)
/* 0000970C 3C600000 */ lis r3, cameraInfo@ha
/* 00009710 3BC30000 */ addi r30, r3, cameraInfo@l
/* 00009714 1CA001A4 */ mulli r5, r0, 0x1a4
/* 00009718 38040000 */ addi r0, r4, ballInfo@l
/* 0000971C 3C600000 */ lis r3, lbl_0001C108@ha
/* 00009720 3BA30000 */ addi r29, r3, lbl_0001C108@l
/* 00009724 7F802A14 */ add r28, r0, r5
/* 00009728 387E0144 */ addi r3, r30, 0x144
/* 0000972C 4BFF6A39 */ bl mathutil_mtxA_from_mtx
/* 00009730 387C0004 */ addi r3, r28, 4
/* 00009734 3881001C */ addi r4, r1, 0x1c
/* 00009738 4BFF6A2D */ bl mathutil_mtxA_tf_point
/* 0000973C C05D00EC */ lfs f2, 0xec(r29)
/* 00009740 3CA04330 */ lis r5, 0x4330
/* 00009744 C0210024 */ lfs f1, 0x24(r1)
/* 00009748 3C600000 */ lis r3, lbl_0001C138@ha
/* 0000974C C001001C */ lfs f0, 0x1c(r1)
/* 00009750 ECC20824 */ fdivs f6, f2, f1
/* 00009754 EC0001B2 */ fmuls f0, f0, f6
/* 00009758 D001001C */ stfs f0, 0x1c(r1)
/* 0000975C C0010020 */ lfs f0, 0x20(r1)
/* 00009760 EC0001B2 */ fmuls f0, f0, f6
/* 00009764 D0010020 */ stfs f0, 0x20(r1)
/* 00009768 C01D00EC */ lfs f0, 0xec(r29)
/* 0000976C D0010024 */ stfs f0, 0x24(r1)
/* 00009770 809F0030 */ lwz r4, 0x30(r31)
/* 00009774 C05D00F4 */ lfs f2, 0xf4(r29)
/* 00009778 C03E0038 */ lfs f1, 0x38(r30)
/* 0000977C C0040014 */ lfs f0, 0x14(r4)
/* 00009780 ECA20072 */ fmuls f5, f2, f1
/* 00009784 801F000C */ lwz r0, 0xc(r31)
/* 00009788 C09C0068 */ lfs f4, 0x68(r28)
/* 0000978C 6C008000 */ xoris r0, r0, 0x8000
/* 00009790 C8430000 */ lfd f2, lbl_0001C138@l(r3)
/* 00009794 EFE50024 */ fdivs f31, f5, f0
/* 00009798 90010034 */ stw r0, 0x34(r1)
/* 0000979C C07D00D0 */ lfs f3, 0xd0(r29)
/* 000097A0 90A10030 */ stw r5, 0x30(r1)
/* 000097A4 C01D00F8 */ lfs f0, 0xf8(r29)
/* 000097A8 C8210030 */ lfd f1, 0x30(r1)
/* 000097AC EC8401B2 */ fmuls f4, f4, f6
/* 000097B0 ECA30172 */ fmuls f5, f3, f5
/* 000097B4 EC211028 */ fsubs f1, f1, f2
/* 000097B8 FC010040 */ fcmpo cr0, f1, f0
/* 000097BC 408000E8 */ bge lbl_000098A4
/* 000097C0 C05F0034 */ lfs f2, 0x34(r31)
/* 000097C4 3C600000 */ lis r3, lbl_0001C138@ha
/* 000097C8 C001001C */ lfs f0, 0x1c(r1)
/* 000097CC 3C800000 */ lis r4, lbl_0001C138@ha
/* 000097D0 C03D0010 */ lfs f1, 0x10(r29)
/* 000097D4 EC001028 */ fsubs f0, f0, f2
/* 000097D8 C0610020 */ lfs f3, 0x20(r1)
/* 000097DC C0810024 */ lfs f4, 0x24(r1)
/* 000097E0 EC010032 */ fmuls f0, f1, f0
/* 000097E4 EC02002A */ fadds f0, f2, f0
/* 000097E8 D01F0034 */ stfs f0, 0x34(r31)
/* 000097EC C05F0038 */ lfs f2, 0x38(r31)
/* 000097F0 C03D004C */ lfs f1, 0x4c(r29)
/* 000097F4 EC031028 */ fsubs f0, f3, f2
/* 000097F8 EC010032 */ fmuls f0, f1, f0
/* 000097FC EC02002A */ fadds f0, f2, f0
/* 00009800 D01F0038 */ stfs f0, 0x38(r31)
/* 00009804 C05F003C */ lfs f2, 0x3c(r31)
/* 00009808 C03D0010 */ lfs f1, 0x10(r29)
/* 0000980C EC041028 */ fsubs f0, f4, f2
/* 00009810 EC010032 */ fmuls f0, f1, f0
/* 00009814 EC02002A */ fadds f0, f2, f0
/* 00009818 D01F003C */ stfs f0, 0x3c(r31)
/* 0000981C C03F009C */ lfs f1, 0x9c(r31)
/* 00009820 C01D00FC */ lfs f0, 0xfc(r29)
/* 00009824 EC010028 */ fsubs f0, f1, f0
/* 00009828 D01F009C */ stfs f0, 0x9c(r31)
/* 0000982C C03F0090 */ lfs f1, 0x90(r31)
/* 00009830 C01F009C */ lfs f0, 0x9c(r31)
/* 00009834 EC01002A */ fadds f0, f1, f0
/* 00009838 D01F0090 */ stfs f0, 0x90(r31)
/* 0000983C 80DF000C */ lwz r6, 0xc(r31)
/* 00009840 C8230000 */ lfd f1, lbl_0001C138@l(r3)
/* 00009844 38060001 */ addi r0, r6, 1
/* 00009848 C8640000 */ lfd f3, lbl_0001C138@l(r4)
/* 0000984C 6CC38000 */ xoris r3, r6, 0x8000
/* 00009850 C09F0024 */ lfs f4, 0x24(r31)
/* 00009854 6C008000 */ xoris r0, r0, 0x8000
/* 00009858 90610034 */ stw r3, 0x34(r1)
/* 0000985C 9001002C */ stw r0, 0x2c(r1)
/* 00009860 90A10030 */ stw r5, 0x30(r1)
/* 00009864 90A10028 */ stw r5, 0x28(r1)
/* 00009868 C8410030 */ lfd f2, 0x30(r1)
/* 0000986C C8010028 */ lfd f0, 0x28(r1)
/* 00009870 EC421828 */ fsubs f2, f2, f3
/* 00009874 EC000828 */ fsubs f0, f0, f1
/* 00009878 EC020024 */ fdivs f0, f2, f0
/* 0000987C EC040032 */ fmuls f0, f4, f0
/* 00009880 D01F0024 */ stfs f0, 0x24(r31)
/* 00009884 C05F00A8 */ lfs f2, 0xa8(r31)
/* 00009888 C01D0020 */ lfs f0, 0x20(r29)
/* 0000988C C03D004C */ lfs f1, 0x4c(r29)
/* 00009890 EC001028 */ fsubs f0, f0, f2
/* 00009894 EC010032 */ fmuls f0, f1, f0
/* 00009898 EC02002A */ fadds f0, f2, f0
/* 0000989C D01F00A8 */ stfs f0, 0xa8(r31)
/* 000098A0 480001A4 */ b lbl_00009A44
lbl_000098A4:
/* 000098A4 9001002C */ stw r0, 0x2c(r1)
/* 000098A8 3C600000 */ lis r3, lbl_0001C138@ha
/* 000098AC C8430000 */ lfd f2, lbl_0001C138@l(r3)
/* 000098B0 90A10028 */ stw r5, 0x28(r1)
/* 000098B4 C01D0100 */ lfs f0, 0x100(r29)
/* 000098B8 C8210028 */ lfd f1, 0x28(r1)
/* 000098BC EC211028 */ fsubs f1, f1, f2
/* 000098C0 FC010040 */ fcmpo cr0, f1, f0
/* 000098C4 408000E0 */ bge lbl_000099A4
/* 000098C8 C05F0034 */ lfs f2, 0x34(r31)
/* 000098CC C001001C */ lfs f0, 0x1c(r1)
/* 000098D0 C0610020 */ lfs f3, 0x20(r1)
/* 000098D4 EC001028 */ fsubs f0, f0, f2
/* 000098D8 C03D0014 */ lfs f1, 0x14(r29)
/* 000098DC EC63202A */ fadds f3, f3, f4
/* 000098E0 C0810024 */ lfs f4, 0x24(r1)
/* 000098E4 EC010032 */ fmuls f0, f1, f0
/* 000098E8 EC65182A */ fadds f3, f5, f3
/* 000098EC EC02002A */ fadds f0, f2, f0
/* 000098F0 D01F0034 */ stfs f0, 0x34(r31)
/* 000098F4 C05F0038 */ lfs f2, 0x38(r31)
/* 000098F8 C03D004C */ lfs f1, 0x4c(r29)
/* 000098FC EC031028 */ fsubs f0, f3, f2
/* 00009900 EC010032 */ fmuls f0, f1, f0
/* 00009904 EC02002A */ fadds f0, f2, f0
/* 00009908 D01F0038 */ stfs f0, 0x38(r31)
/* 0000990C C05F003C */ lfs f2, 0x3c(r31)
/* 00009910 C03D0014 */ lfs f1, 0x14(r29)
/* 00009914 EC041028 */ fsubs f0, f4, f2
/* 00009918 EC010032 */ fmuls f0, f1, f0
/* 0000991C EC02002A */ fadds f0, f2, f0
/* 00009920 D01F003C */ stfs f0, 0x3c(r31)
/* 00009924 C03F009C */ lfs f1, 0x9c(r31)
/* 00009928 C01D0104 */ lfs f0, 0x104(r29)
/* 0000992C EC010032 */ fmuls f0, f1, f0
/* 00009930 D01F009C */ stfs f0, 0x9c(r31)
/* 00009934 C01F0090 */ lfs f0, 0x90(r31)
/* 00009938 FC00001E */ fctiwz f0, f0
/* 0000993C D8010028 */ stfd f0, 0x28(r1)
/* 00009940 8061002C */ lwz r3, 0x2c(r1)
/* 00009944 4BFF6821 */ bl mathutil_sin
/* 00009948 C05D0108 */ lfs f2, 0x108(r29)
/* 0000994C C01F009C */ lfs f0, 0x9c(r31)
/* 00009950 EC220072 */ fmuls f1, f2, f1
/* 00009954 EC00082A */ fadds f0, f0, f1
/* 00009958 D01F009C */ stfs f0, 0x9c(r31)
/* 0000995C C03F0090 */ lfs f1, 0x90(r31)
/* 00009960 C01F009C */ lfs f0, 0x9c(r31)
/* 00009964 EC01002A */ fadds f0, f1, f0
/* 00009968 D01F0090 */ stfs f0, 0x90(r31)
/* 0000996C C05F0024 */ lfs f2, 0x24(r31)
/* 00009970 C03D004C */ lfs f1, 0x4c(r29)
/* 00009974 EC1F1028 */ fsubs f0, f31, f2
/* 00009978 EC010032 */ fmuls f0, f1, f0
/* 0000997C EC02002A */ fadds f0, f2, f0
/* 00009980 D01F0024 */ stfs f0, 0x24(r31)
/* 00009984 C05F00A8 */ lfs f2, 0xa8(r31)
/* 00009988 C01D005C */ lfs f0, 0x5c(r29)
/* 0000998C C03D001C */ lfs f1, 0x1c(r29)
/* 00009990 EC001028 */ fsubs f0, f0, f2
/* 00009994 EC010032 */ fmuls f0, f1, f0
/* 00009998 EC02002A */ fadds f0, f2, f0
/* 0000999C D01F00A8 */ stfs f0, 0xa8(r31)
/* 000099A0 480000A4 */ b lbl_00009A44
lbl_000099A4:
/* 000099A4 C05F0034 */ lfs f2, 0x34(r31)
/* 000099A8 C001001C */ lfs f0, 0x1c(r1)
/* 000099AC C0610020 */ lfs f3, 0x20(r1)
/* 000099B0 EC001028 */ fsubs f0, f0, f2
/* 000099B4 C03D004C */ lfs f1, 0x4c(r29)
/* 000099B8 EC63202A */ fadds f3, f3, f4
/* 000099BC C0810024 */ lfs f4, 0x24(r1)
/* 000099C0 EC010032 */ fmuls f0, f1, f0
/* 000099C4 EC65182A */ fadds f3, f5, f3
/* 000099C8 EC02002A */ fadds f0, f2, f0
/* 000099CC D01F0034 */ stfs f0, 0x34(r31)
/* 000099D0 C05F0038 */ lfs f2, 0x38(r31)
/* 000099D4 C03D004C */ lfs f1, 0x4c(r29)
/* 000099D8 EC031028 */ fsubs f0, f3, f2
/* 000099DC EC010032 */ fmuls f0, f1, f0
/* 000099E0 EC02002A */ fadds f0, f2, f0
/* 000099E4 D01F0038 */ stfs f0, 0x38(r31)
/* 000099E8 C05F003C */ lfs f2, 0x3c(r31)
/* 000099EC C03D004C */ lfs f1, 0x4c(r29)
/* 000099F0 EC041028 */ fsubs f0, f4, f2
/* 000099F4 EC010032 */ fmuls f0, f1, f0
/* 000099F8 EC02002A */ fadds f0, f2, f0
/* 000099FC D01F003C */ stfs f0, 0x3c(r31)
/* 00009A00 C03F0090 */ lfs f1, 0x90(r31)
/* 00009A04 C01F009C */ lfs f0, 0x9c(r31)
/* 00009A08 EC01002A */ fadds f0, f1, f0
/* 00009A0C D01F0090 */ stfs f0, 0x90(r31)
/* 00009A10 C05F0024 */ lfs f2, 0x24(r31)
/* 00009A14 C03D00E0 */ lfs f1, 0xe0(r29)
/* 00009A18 EC1F1028 */ fsubs f0, f31, f2
/* 00009A1C EC010032 */ fmuls f0, f1, f0
/* 00009A20 EC02002A */ fadds f0, f2, f0
/* 00009A24 D01F0024 */ stfs f0, 0x24(r31)
/* 00009A28 C05F00A8 */ lfs f2, 0xa8(r31)
/* 00009A2C C01D005C */ lfs f0, 0x5c(r29)
/* 00009A30 C03D004C */ lfs f1, 0x4c(r29)
/* 00009A34 EC001028 */ fsubs f0, f0, f2
/* 00009A38 EC010032 */ fmuls f0, f1, f0
/* 00009A3C EC02002A */ fadds f0, f2, f0
/* 00009A40 D01F00A8 */ stfs f0, 0xa8(r31)
lbl_00009A44:
/* 00009A44 80010054 */ lwz r0, 0x54(r1)
/* 00009A48 CBE10048 */ lfd f31, 0x48(r1)
/* 00009A4C 83E10044 */ lwz r31, 0x44(r1)
/* 00009A50 7C0803A6 */ mtlr r0
/* 00009A54 83C10040 */ lwz r30, 0x40(r1)
/* 00009A58 83A1003C */ lwz r29, 0x3c(r1)
/* 00009A5C 83810038 */ lwz r28, 0x38(r1)
/* 00009A60 38210050 */ addi r1, r1, 0x50
/* 00009A64 4E800020 */ blr 
lbl_00009A68:
/* 00009A68 7C0802A6 */ mflr r0
/* 00009A6C 3C800000 */ lis r4, polyDisp@ha
/* 00009A70 90010004 */ stw r0, 4(r1)
/* 00009A74 9421FFC8 */ stwu r1, -0x38(r1)
/* 00009A78 DBE10030 */ stfd f31, 0x30(r1)
/* 00009A7C 93E1002C */ stw r31, 0x2c(r1)
/* 00009A80 93C10028 */ stw r30, 0x28(r1)
/* 00009A84 93A10024 */ stw r29, 0x24(r1)
/* 00009A88 3BA30000 */ addi r29, r3, 0
/* 00009A8C 80040000 */ lwz r0, polyDisp@l(r4)
/* 00009A90 3C800000 */ lis r4, lbl_0001C108@ha
/* 00009A94 3BC40000 */ addi r30, r4, lbl_0001C108@l
/* 00009A98 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00009A9C 408200D8 */ bne lbl_00009B74
/* 00009AA0 387D0034 */ addi r3, r29, 0x34
/* 00009AA4 4BFF66C1 */ bl mathutil_mtxA_from_translate
/* 00009AA8 C01D0090 */ lfs f0, 0x90(r29)
/* 00009AAC FC00001E */ fctiwz f0, f0
/* 00009AB0 D8010018 */ stfd f0, 0x18(r1)
/* 00009AB4 8001001C */ lwz r0, 0x1c(r1)
/* 00009AB8 7C030734 */ extsh r3, r0
/* 00009ABC 4BFF66A9 */ bl mathutil_mtxA_rotate_z
/* 00009AC0 C03D0024 */ lfs f1, 0x24(r29)
/* 00009AC4 4BFF66A1 */ bl mathutil_mtxA_scale_s
/* 00009AC8 3C600000 */ lis r3, mathutilData@ha
/* 00009ACC 3BE30000 */ addi r31, r3, mathutilData@l
/* 00009AD0 807F0000 */ lwz r3, 0(r31)
/* 00009AD4 38800000 */ li r4, 0
/* 00009AD8 4BFF668D */ bl GXLoadPosMtxImm
/* 00009ADC 807F0000 */ lwz r3, 0(r31)
/* 00009AE0 38800000 */ li r4, 0
/* 00009AE4 4BFF6681 */ bl GXLoadNrmMtxImm
/* 00009AE8 C03D0024 */ lfs f1, 0x24(r29)
/* 00009AEC 4BFF6679 */ bl avdisp_set_bound_sphere_scale
/* 00009AF0 C3FD00A8 */ lfs f31, 0xa8(r29)
/* 00009AF4 C01E0000 */ lfs f0, 0(r30)
/* 00009AF8 FC1F0040 */ fcmpo cr0, f31, f0
/* 00009AFC 40810054 */ ble lbl_00009B50
/* 00009B00 C01D0018 */ lfs f0, 0x18(r29)
/* 00009B04 C05D001C */ lfs f2, 0x1c(r29)
/* 00009B08 EC2007F2 */ fmuls f1, f0, f31
/* 00009B0C C01E0004 */ lfs f0, 4(r30)
/* 00009B10 C07D0020 */ lfs f3, 0x20(r29)
/* 00009B14 EC4207F2 */ fmuls f2, f2, f31
/* 00009B18 FC010040 */ fcmpo cr0, f1, f0
/* 00009B1C EC6307F2 */ fmuls f3, f3, f31
/* 00009B20 40810008 */ ble lbl_00009B28
/* 00009B24 FC200090 */ fmr f1, f0
lbl_00009B28:
/* 00009B28 C01E0004 */ lfs f0, 4(r30)
/* 00009B2C FC020040 */ fcmpo cr0, f2, f0
/* 00009B30 40810008 */ ble lbl_00009B38
/* 00009B34 FC400090 */ fmr f2, f0
lbl_00009B38:
/* 00009B38 C01E0004 */ lfs f0, 4(r30)
/* 00009B3C FC030040 */ fcmpo cr0, f3, f0
/* 00009B40 40810008 */ ble lbl_00009B48
/* 00009B44 FC600090 */ fmr f3, f0
lbl_00009B48:
/* 00009B48 C09E0000 */ lfs f4, 0(r30)
/* 00009B4C 4BFF6619 */ bl avdisp_set_post_add_color
lbl_00009B50:
/* 00009B50 807D0030 */ lwz r3, 0x30(r29)
/* 00009B54 4BFF6611 */ bl avdisp_draw_model_culled_sort_translucent
/* 00009B58 C03E0000 */ lfs f1, 0(r30)
/* 00009B5C FC1F0840 */ fcmpo cr0, f31, f1
/* 00009B60 40810014 */ ble lbl_00009B74
/* 00009B64 FC400890 */ fmr f2, f1
/* 00009B68 FC600890 */ fmr f3, f1
/* 00009B6C FC800890 */ fmr f4, f1
/* 00009B70 4BFF65F5 */ bl avdisp_set_post_add_color
lbl_00009B74:
/* 00009B74 8001003C */ lwz r0, 0x3c(r1)
/* 00009B78 CBE10030 */ lfd f31, 0x30(r1)
/* 00009B7C 83E1002C */ lwz r31, 0x2c(r1)
/* 00009B80 7C0803A6 */ mtlr r0
/* 00009B84 83C10028 */ lwz r30, 0x28(r1)
/* 00009B88 83A10024 */ lwz r29, 0x24(r1)
/* 00009B8C 38210038 */ addi r1, r1, 0x38
/* 00009B90 4E800020 */ blr 
lbl_00009B94:
/* 00009B94 4E800020 */ blr 
lbl_00009B98:
/* 00009B98 4E800020 */ blr 
lbl_00009B9C:
/* 00009B9C 4E800020 */ blr 
lbl_00009BA0:
/* 00009BA0 7C0802A6 */ mflr r0
/* 00009BA4 90010004 */ stw r0, 4(r1)
/* 00009BA8 9421FFE0 */ stwu r1, -0x20(r1)
/* 00009BAC DBE10018 */ stfd f31, 0x18(r1)
/* 00009BB0 A8830014 */ lha r4, 0x14(r3)
/* 00009BB4 3C600000 */ lis r3, lbl_10017664@ha
/* 00009BB8 38030000 */ addi r0, r3, lbl_10017664@l
/* 00009BBC 1C640018 */ mulli r3, r4, 0x18
/* 00009BC0 7C601A14 */ add r3, r0, r3
/* 00009BC4 A803000E */ lha r0, 0xe(r3)
/* 00009BC8 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 00009BCC 418200C0 */ beq lbl_00009C8C
/* 00009BD0 1C8401A4 */ mulli r4, r4, 0x1a4
/* 00009BD4 3C600000 */ lis r3, ballInfo@ha
/* 00009BD8 38030000 */ addi r0, r3, ballInfo@l
/* 00009BDC 7C602214 */ add r3, r0, r4
/* 00009BE0 C3E30068 */ lfs f31, 0x68(r3)
/* 00009BE4 38630004 */ addi r3, r3, 4
/* 00009BE8 4BFF657D */ bl mathutil_mtxA_from_mtxB_translate
/* 00009BEC 3861000C */ addi r3, r1, 0xc
/* 00009BF0 38A30004 */ addi r5, r3, 4
/* 00009BF4 38830008 */ addi r4, r3, 8
/* 00009BF8 3CC0E000 */ lis r6, 0xe000
/* 00009BFC C046000C */ lfs f2, 0xc(r6)
/* 00009C00 C026001C */ lfs f1, 0x1c(r6)
/* 00009C04 C006002C */ lfs f0, 0x2c(r6)
/* 00009C08 D041000C */ stfs f2, 0xc(r1)
/* 00009C0C D0250000 */ stfs f1, 0(r5)
/* 00009C10 D0040000 */ stfs f0, 0(r4)
/* 00009C14 FC00F850 */ fneg f0, f31
/* 00009C18 C0410014 */ lfs f2, 0x14(r1)
/* 00009C1C FC020040 */ fcmpo cr0, f2, f0
/* 00009C20 4080006C */ bge lbl_00009C8C
/* 00009C24 EC22F82A */ fadds f1, f2, f31
/* 00009C28 C001000C */ lfs f0, 0xc(r1)
/* 00009C2C EC211024 */ fdivs f1, f1, f2
/* 00009C30 EC000072 */ fmuls f0, f0, f1
/* 00009C34 D001000C */ stfs f0, 0xc(r1)
/* 00009C38 C0010010 */ lfs f0, 0x10(r1)
/* 00009C3C EC000072 */ fmuls f0, f0, f1
/* 00009C40 D0010010 */ stfs f0, 0x10(r1)
/* 00009C44 C0010014 */ lfs f0, 0x14(r1)
/* 00009C48 EC00F82A */ fadds f0, f0, f31
/* 00009C4C D0010014 */ stfs f0, 0x14(r1)
/* 00009C50 4BFF6515 */ bl mathutil_mtxA_from_translate
/* 00009C54 3C600000 */ lis r3, lbl_0001C128@ha
/* 00009C58 C0230000 */ lfs f1, lbl_0001C128@l(r3)
/* 00009C5C 4BFF6509 */ bl mathutil_mtxA_scale_s
/* 00009C60 3C600000 */ lis r3, mathutilData@ha
/* 00009C64 38630000 */ addi r3, r3, mathutilData@l
/* 00009C68 80630000 */ lwz r3, 0(r3)
/* 00009C6C 38800000 */ li r4, 0
/* 00009C70 4BFF64F5 */ bl GXLoadPosMtxImm
/* 00009C74 3C600000 */ lis r3, commonGma@ha
/* 00009C78 38630000 */ addi r3, r3, commonGma@l
/* 00009C7C 80630000 */ lwz r3, 0(r3)
/* 00009C80 80630008 */ lwz r3, 8(r3)
/* 00009C84 806302D0 */ lwz r3, 0x2d0(r3)
/* 00009C88 4BFF64DD */ bl avdisp_draw_model_culled_sort_translucent
lbl_00009C8C:
/* 00009C8C 80010024 */ lwz r0, 0x24(r1)
/* 00009C90 CBE10018 */ lfd f31, 0x18(r1)
/* 00009C94 38210020 */ addi r1, r1, 0x20
/* 00009C98 7C0803A6 */ mtlr r0
/* 00009C9C 4E800020 */ blr 
lbl_00009CA0:
/* 00009CA0 4E800020 */ blr 
lbl_00009CA4:
/* 00009CA4 7C0802A6 */ mflr r0
/* 00009CA8 3C800000 */ lis r4, lbl_0001C108@ha
/* 00009CAC 90010004 */ stw r0, 4(r1)
/* 00009CB0 9421FFD8 */ stwu r1, -0x28(r1)
/* 00009CB4 93E10024 */ stw r31, 0x24(r1)
/* 00009CB8 3BE40000 */ addi r31, r4, lbl_0001C108@l
/* 00009CBC 93C10020 */ stw r30, 0x20(r1)
/* 00009CC0 3BC30000 */ addi r30, r3, 0
/* 00009CC4 4BFF64A1 */ bl rand
/* 00009CC8 6C608000 */ xoris r0, r3, 0x8000
/* 00009CCC C05F0018 */ lfs f2, 0x18(r31)
/* 00009CD0 9001001C */ stw r0, 0x1c(r1)
/* 00009CD4 3C004330 */ lis r0, 0x4330
/* 00009CD8 3C600000 */ lis r3, lbl_0001C138@ha
/* 00009CDC C03F004C */ lfs f1, 0x4c(r31)
/* 00009CE0 90010018 */ stw r0, 0x18(r1)
/* 00009CE4 C8830000 */ lfd f4, lbl_0001C138@l(r3)
/* 00009CE8 3C600000 */ lis r3, g_commonNlObj@ha
/* 00009CEC C8610018 */ lfd f3, 0x18(r1)
/* 00009CF0 38630000 */ addi r3, r3, g_commonNlObj@l
/* 00009CF4 C01F010C */ lfs f0, 0x10c(r31)
/* 00009CF8 EC632028 */ fsubs f3, f3, f4
/* 00009CFC EC431024 */ fdivs f2, f3, f2
/* 00009D00 EC21102A */ fadds f1, f1, f2
/* 00009D04 EC000072 */ fmuls f0, f0, f1
/* 00009D08 FC00001E */ fctiwz f0, f0
/* 00009D0C D8010010 */ stfd f0, 0x10(r1)
/* 00009D10 80010014 */ lwz r0, 0x14(r1)
/* 00009D14 901E000C */ stw r0, 0xc(r30)
/* 00009D18 80630000 */ lwz r3, 0(r3)
/* 00009D1C 800300D8 */ lwz r0, 0xd8(r3)
/* 00009D20 901E0030 */ stw r0, 0x30(r30)
/* 00009D24 4BFF6441 */ bl rand
/* 00009D28 5460047E */ clrlwi r0, r3, 0x11
/* 00009D2C B01E00A4 */ sth r0, 0xa4(r30)
/* 00009D30 8001002C */ lwz r0, 0x2c(r1)
/* 00009D34 83E10024 */ lwz r31, 0x24(r1)
/* 00009D38 83C10020 */ lwz r30, 0x20(r1)
/* 00009D3C 7C0803A6 */ mtlr r0
/* 00009D40 38210028 */ addi r1, r1, 0x28
/* 00009D44 4E800020 */ blr 
lbl_00009D48:
/* 00009D48 9421FFE0 */ stwu r1, -0x20(r1)
/* 00009D4C 3C800000 */ lis r4, lbl_0001C108@ha
/* 00009D50 38A40000 */ addi r5, r4, lbl_0001C108@l
/* 00009D54 C0230040 */ lfs f1, 0x40(r3)
/* 00009D58 3C800000 */ lis r4, lbl_0001C138@ha
/* 00009D5C C0050058 */ lfs f0, 0x58(r5)
/* 00009D60 3CC04330 */ lis r6, 0x4330
/* 00009D64 EC010032 */ fmuls f0, f1, f0
/* 00009D68 D0030040 */ stfs f0, 0x40(r3)
/* 00009D6C C0230044 */ lfs f1, 0x44(r3)
/* 00009D70 C0050058 */ lfs f0, 0x58(r5)
/* 00009D74 EC010032 */ fmuls f0, f1, f0
/* 00009D78 D0030044 */ stfs f0, 0x44(r3)
/* 00009D7C C0230048 */ lfs f1, 0x48(r3)
/* 00009D80 C0050058 */ lfs f0, 0x58(r5)
/* 00009D84 EC010032 */ fmuls f0, f1, f0
/* 00009D88 D0030048 */ stfs f0, 0x48(r3)
/* 00009D8C C0230034 */ lfs f1, 0x34(r3)
/* 00009D90 C0030040 */ lfs f0, 0x40(r3)
/* 00009D94 EC01002A */ fadds f0, f1, f0
/* 00009D98 D0030034 */ stfs f0, 0x34(r3)
/* 00009D9C C0230038 */ lfs f1, 0x38(r3)
/* 00009DA0 C0030044 */ lfs f0, 0x44(r3)
/* 00009DA4 EC01002A */ fadds f0, f1, f0
/* 00009DA8 D0030038 */ stfs f0, 0x38(r3)
/* 00009DAC C023003C */ lfs f1, 0x3c(r3)
/* 00009DB0 C0030048 */ lfs f0, 0x48(r3)
/* 00009DB4 EC01002A */ fadds f0, f1, f0
/* 00009DB8 D003003C */ stfs f0, 0x3c(r3)
/* 00009DBC C0430018 */ lfs f2, 0x18(r3)
/* 00009DC0 C0050004 */ lfs f0, 4(r5)
/* 00009DC4 C025004C */ lfs f1, 0x4c(r5)
/* 00009DC8 EC001028 */ fsubs f0, f0, f2
/* 00009DCC EC010032 */ fmuls f0, f1, f0
/* 00009DD0 EC02002A */ fadds f0, f2, f0
/* 00009DD4 D0030018 */ stfs f0, 0x18(r3)
/* 00009DD8 C043001C */ lfs f2, 0x1c(r3)
/* 00009DDC C0050004 */ lfs f0, 4(r5)
/* 00009DE0 C025004C */ lfs f1, 0x4c(r5)
/* 00009DE4 EC001028 */ fsubs f0, f0, f2
/* 00009DE8 EC010032 */ fmuls f0, f1, f0
/* 00009DEC EC02002A */ fadds f0, f2, f0
/* 00009DF0 D003001C */ stfs f0, 0x1c(r3)
/* 00009DF4 C0430020 */ lfs f2, 0x20(r3)
/* 00009DF8 C0050004 */ lfs f0, 4(r5)
/* 00009DFC C025004C */ lfs f1, 0x4c(r5)
/* 00009E00 EC001028 */ fsubs f0, f0, f2
/* 00009E04 EC010032 */ fmuls f0, f1, f0
/* 00009E08 EC02002A */ fadds f0, f2, f0
/* 00009E0C D0030020 */ stfs f0, 0x20(r3)
/* 00009E10 80E3000C */ lwz r7, 0xc(r3)
/* 00009E14 C8440000 */ lfd f2, lbl_0001C138@l(r4)
/* 00009E18 6CE48000 */ xoris r4, r7, 0x8000
/* 00009E1C C00500F8 */ lfs f0, 0xf8(r5)
/* 00009E20 9081001C */ stw r4, 0x1c(r1)
/* 00009E24 90C10018 */ stw r6, 0x18(r1)
/* 00009E28 C8210018 */ lfd f1, 0x18(r1)
/* 00009E2C EC211028 */ fsubs f1, f1, f2
/* 00009E30 FC010040 */ fcmpo cr0, f1, f0
/* 00009E34 4080004C */ bge lbl_00009E80
/* 00009E38 38070001 */ addi r0, r7, 1
/* 00009E3C 9081001C */ stw r4, 0x1c(r1)
/* 00009E40 6C008000 */ xoris r0, r0, 0x8000
/* 00009E44 C0830024 */ lfs f4, 0x24(r3)
/* 00009E48 90010014 */ stw r0, 0x14(r1)
/* 00009E4C 3CA00000 */ lis r5, lbl_0001C138@ha
/* 00009E50 3C800000 */ lis r4, lbl_0001C138@ha
/* 00009E54 C8650000 */ lfd f3, lbl_0001C138@l(r5)
/* 00009E58 90C10018 */ stw r6, 0x18(r1)
/* 00009E5C C8240000 */ lfd f1, lbl_0001C138@l(r4)
/* 00009E60 90C10010 */ stw r6, 0x10(r1)
/* 00009E64 C8410018 */ lfd f2, 0x18(r1)
/* 00009E68 C8010010 */ lfd f0, 0x10(r1)
/* 00009E6C EC421828 */ fsubs f2, f2, f3
/* 00009E70 EC000828 */ fsubs f0, f0, f1
/* 00009E74 EC020024 */ fdivs f0, f2, f0
/* 00009E78 EC040032 */ fmuls f0, f4, f0
/* 00009E7C D0030024 */ stfs f0, 0x24(r3)
lbl_00009E80:
/* 00009E80 38210020 */ addi r1, r1, 0x20
/* 00009E84 4E800020 */ blr 
lbl_00009E88:
/* 00009E88 7C0802A6 */ mflr r0
/* 00009E8C 3C800000 */ lis r4, polyDisp@ha
/* 00009E90 90010004 */ stw r0, 4(r1)
/* 00009E94 9421FFE0 */ stwu r1, -0x20(r1)
/* 00009E98 93E1001C */ stw r31, 0x1c(r1)
/* 00009E9C 3BE30000 */ addi r31, r3, 0
/* 00009EA0 80040000 */ lwz r0, polyDisp@l(r4)
/* 00009EA4 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00009EA8 41820028 */ beq lbl_00009ED0
/* 00009EAC 3C600000 */ lis r3, lbl_0001C108@ha
/* 00009EB0 C03F0038 */ lfs f1, 0x38(r31)
/* 00009EB4 C0030000 */ lfs f0, lbl_0001C108@l(r3)
/* 00009EB8 FC010040 */ fcmpo cr0, f1, f0
/* 00009EBC 41800094 */ blt lbl_00009F50
/* 00009EC0 A81F0000 */ lha r0, 0(r31)
/* 00009EC4 540007FF */ clrlwi. r0, r0, 0x1f
/* 00009EC8 41820008 */ beq lbl_00009ED0
/* 00009ECC 48000084 */ b lbl_00009F50
lbl_00009ED0:
/* 00009ED0 387F0034 */ addi r3, r31, 0x34
/* 00009ED4 4BFF6291 */ bl mathutil_mtxA_from_mtxB_translate
/* 00009ED8 4BFF628D */ bl mathutil_mtxA_sq_from_identity
/* 00009EDC 3C600000 */ lis r3, mathutilData@ha
/* 00009EE0 A89F00A4 */ lha r4, 0xa4(r31)
/* 00009EE4 80A30000 */ lwz r5, mathutilData@l(r3)
/* 00009EE8 3C600000 */ lis r3, lbl_0001C218@ha
/* 00009EEC C0430000 */ lfs f2, lbl_0001C218@l(r3)
/* 00009EF0 C025000C */ lfs f1, 0xc(r5)
/* 00009EF4 C005001C */ lfs f0, 0x1c(r5)
/* 00009EF8 EC01002A */ fadds f0, f1, f0
/* 00009EFC EC020032 */ fmuls f0, f2, f0
/* 00009F00 FC00001E */ fctiwz f0, f0
/* 00009F04 D8010010 */ stfd f0, 0x10(r1)
/* 00009F08 80010014 */ lwz r0, 0x14(r1)
/* 00009F0C 7C000734 */ extsh r0, r0
/* 00009F10 7C640214 */ add r3, r4, r0
/* 00009F14 4BFF6251 */ bl mathutil_mtxA_rotate_z
/* 00009F18 C03F0024 */ lfs f1, 0x24(r31)
/* 00009F1C 4BFF6249 */ bl mathutil_mtxA_scale_s
/* 00009F20 C03F0018 */ lfs f1, 0x18(r31)
/* 00009F24 C05F001C */ lfs f2, 0x1c(r31)
/* 00009F28 C07F0020 */ lfs f3, 0x20(r31)
/* 00009F2C 4BFF6239 */ bl nlObjPutSetFadeColorBase
/* 00009F30 C03F0024 */ lfs f1, 0x24(r31)
/* 00009F34 4BFF6231 */ bl nlSetScaleFactor
/* 00009F38 3C600000 */ lis r3, g_commonNlObj@ha
/* 00009F3C 38630000 */ addi r3, r3, g_commonNlObj@l
/* 00009F40 80630000 */ lwz r3, 0(r3)
/* 00009F44 806300D8 */ lwz r3, 0xd8(r3)
/* 00009F48 4BFF621D */ bl nlObjPut
/* 00009F4C 4BFF6219 */ bl fade_color_base_default
lbl_00009F50:
/* 00009F50 80010024 */ lwz r0, 0x24(r1)
/* 00009F54 83E1001C */ lwz r31, 0x1c(r1)
/* 00009F58 38210020 */ addi r1, r1, 0x20
/* 00009F5C 7C0803A6 */ mtlr r0
/* 00009F60 4E800020 */ blr 
lbl_00009F64:
/* 00009F64 4E800020 */ blr 
lbl_00009F68:
/* 00009F68 7C0802A6 */ mflr r0
/* 00009F6C 3C800000 */ lis r4, lbl_0001C108@ha
/* 00009F70 90010004 */ stw r0, 4(r1)
/* 00009F74 9421FFD8 */ stwu r1, -0x28(r1)
/* 00009F78 93E10024 */ stw r31, 0x24(r1)
/* 00009F7C 3BE30000 */ addi r31, r3, 0
/* 00009F80 93C10020 */ stw r30, 0x20(r1)
/* 00009F84 3BC40000 */ addi r30, r4, lbl_0001C108@l
/* 00009F88 4BFF61DD */ bl rand
/* 00009F8C 6C608000 */ xoris r0, r3, 0x8000
/* 00009F90 C07E0018 */ lfs f3, 0x18(r30)
/* 00009F94 9001001C */ stw r0, 0x1c(r1)
/* 00009F98 3C004330 */ lis r0, 0x4330
/* 00009F9C 3C600000 */ lis r3, lbl_0001C138@ha
/* 00009FA0 C05E0114 */ lfs f2, 0x114(r30)
/* 00009FA4 90010018 */ stw r0, 0x18(r1)
/* 00009FA8 C8A30000 */ lfd f5, lbl_0001C138@l(r3)
/* 00009FAC 3C600000 */ lis r3, commonGma@ha
/* 00009FB0 C8810018 */ lfd f4, 0x18(r1)
/* 00009FB4 38630000 */ addi r3, r3, commonGma@l
/* 00009FB8 C03E0040 */ lfs f1, 0x40(r30)
/* 00009FBC EC842828 */ fsubs f4, f4, f5
/* 00009FC0 C01E0080 */ lfs f0, 0x80(r30)
/* 00009FC4 EC641824 */ fdivs f3, f4, f3
/* 00009FC8 EC4200F2 */ fmuls f2, f2, f3
/* 00009FCC EC21102A */ fadds f1, f1, f2
/* 00009FD0 EC000072 */ fmuls f0, f0, f1
/* 00009FD4 FC00001E */ fctiwz f0, f0
/* 00009FD8 D8010010 */ stfd f0, 0x10(r1)
/* 00009FDC 80010014 */ lwz r0, 0x14(r1)
/* 00009FE0 901F000C */ stw r0, 0xc(r31)
/* 00009FE4 80630000 */ lwz r3, 0(r3)
/* 00009FE8 80630008 */ lwz r3, 8(r3)
/* 00009FEC 800302D8 */ lwz r0, 0x2d8(r3)
/* 00009FF0 901F0030 */ stw r0, 0x30(r31)
/* 00009FF4 C03E0118 */ lfs f1, 0x118(r30)
/* 00009FF8 C01F00A8 */ lfs f0, 0xa8(r31)
/* 00009FFC EC010032 */ fmuls f0, f1, f0
/* 0000A000 FC200210 */ fabs f1, f0
/* 0000A004 FC200818 */ frsp f1, f1
/* 0000A008 4BFF615D */ bl mathutil_sqrt
/* 0000A00C C05E0010 */ lfs f2, 0x10(r30)
/* 0000A010 3C600000 */ lis r3, backgroundInfo@ha
/* 0000A014 C01E0114 */ lfs f0, 0x114(r30)
/* 0000A018 EC22082A */ fadds f1, f2, f1
/* 0000A01C EC000072 */ fmuls f0, f0, f1
/* 0000A020 D01F0024 */ stfs f0, 0x24(r31)
/* 0000A024 D03F0028 */ stfs f1, 0x28(r31)
/* 0000A028 A8030000 */ lha r0, backgroundInfo@l(r3)
/* 0000A02C 2C000013 */ cmpwi r0, 0x13
/* 0000A030 41820008 */ beq lbl_0000A038
/* 0000A034 48000010 */ b lbl_0000A044
lbl_0000A038:
/* 0000A038 C01E002C */ lfs f0, 0x2c(r30)
/* 0000A03C D01F0018 */ stfs f0, 0x18(r31)
/* 0000A040 4800000C */ b lbl_0000A04C
lbl_0000A044:
/* 0000A044 C01E0004 */ lfs f0, 4(r30)
/* 0000A048 D01F0018 */ stfs f0, 0x18(r31)
lbl_0000A04C:
/* 0000A04C A81F0014 */ lha r0, 0x14(r31)
/* 0000A050 38800001 */ li r4, 1
/* 0000A054 387F0088 */ addi r3, r31, 0x88
/* 0000A058 7C800030 */ slw r0, r4, r0
/* 0000A05C B01F0016 */ sth r0, 0x16(r31)
/* 0000A060 389F004C */ addi r4, r31, 0x4c
/* 0000A064 38BF004E */ addi r5, r31, 0x4e
/* 0000A068 4BFF60FD */ bl mathutil_vec_to_euler_xy
/* 0000A06C A87F004C */ lha r3, 0x4c(r31)
/* 0000A070 3C630001 */ addis r3, r3, 1
/* 0000A074 38038000 */ addi r0, r3, -32768
/* 0000A078 B01F004C */ sth r0, 0x4c(r31)
/* 0000A07C 8001002C */ lwz r0, 0x2c(r1)
/* 0000A080 83E10024 */ lwz r31, 0x24(r1)
/* 0000A084 83C10020 */ lwz r30, 0x20(r1)
/* 0000A088 38210028 */ addi r1, r1, 0x28
/* 0000A08C 7C0803A6 */ mtlr r0
/* 0000A090 4E800020 */ blr 
lbl_0000A094:
/* 0000A094 9421FFE8 */ stwu r1, -0x18(r1)
/* 0000A098 3C800000 */ lis r4, lbl_0001C108@ha
/* 0000A09C 38A40000 */ addi r5, r4, lbl_0001C108@l
/* 0000A0A0 C0230040 */ lfs f1, 0x40(r3)
/* 0000A0A4 3C800000 */ lis r4, lbl_0001C138@ha
/* 0000A0A8 C00500E4 */ lfs f0, 0xe4(r5)
/* 0000A0AC 3C004330 */ lis r0, 0x4330
/* 0000A0B0 EC010032 */ fmuls f0, f1, f0
/* 0000A0B4 D0030040 */ stfs f0, 0x40(r3)
/* 0000A0B8 C0230044 */ lfs f1, 0x44(r3)
/* 0000A0BC C00500E4 */ lfs f0, 0xe4(r5)
/* 0000A0C0 EC010032 */ fmuls f0, f1, f0
/* 0000A0C4 D0030044 */ stfs f0, 0x44(r3)
/* 0000A0C8 C0230048 */ lfs f1, 0x48(r3)
/* 0000A0CC C00500E4 */ lfs f0, 0xe4(r5)
/* 0000A0D0 EC010032 */ fmuls f0, f1, f0
/* 0000A0D4 D0030048 */ stfs f0, 0x48(r3)
/* 0000A0D8 C0230034 */ lfs f1, 0x34(r3)
/* 0000A0DC C0030040 */ lfs f0, 0x40(r3)
/* 0000A0E0 EC01002A */ fadds f0, f1, f0
/* 0000A0E4 D0030034 */ stfs f0, 0x34(r3)
/* 0000A0E8 C0230038 */ lfs f1, 0x38(r3)
/* 0000A0EC C0030044 */ lfs f0, 0x44(r3)
/* 0000A0F0 EC01002A */ fadds f0, f1, f0
/* 0000A0F4 D0030038 */ stfs f0, 0x38(r3)
/* 0000A0F8 C023003C */ lfs f1, 0x3c(r3)
/* 0000A0FC C0030048 */ lfs f0, 0x48(r3)
/* 0000A100 EC01002A */ fadds f0, f1, f0
/* 0000A104 D003003C */ stfs f0, 0x3c(r3)
/* 0000A108 C0430024 */ lfs f2, 0x24(r3)
/* 0000A10C C0030028 */ lfs f0, 0x28(r3)
/* 0000A110 C0250040 */ lfs f1, 0x40(r5)
/* 0000A114 EC001028 */ fsubs f0, f0, f2
/* 0000A118 EC010032 */ fmuls f0, f1, f0
/* 0000A11C EC02002A */ fadds f0, f2, f0
/* 0000A120 D0030024 */ stfs f0, 0x24(r3)
/* 0000A124 80C3000C */ lwz r6, 0xc(r3)
/* 0000A128 C8440000 */ lfd f2, lbl_0001C138@l(r4)
/* 0000A12C 6CC48000 */ xoris r4, r6, 0x8000
/* 0000A130 C005011C */ lfs f0, 0x11c(r5)
/* 0000A134 90810014 */ stw r4, 0x14(r1)
/* 0000A138 90010010 */ stw r0, 0x10(r1)
/* 0000A13C C8210010 */ lfd f1, 0x10(r1)
/* 0000A140 EC211028 */ fsubs f1, f1, f2
/* 0000A144 FC010040 */ fcmpo cr0, f1, f0
/* 0000A148 40800034 */ bge lbl_0000A17C
/* 0000A14C 90810014 */ stw r4, 0x14(r1)
/* 0000A150 3C800000 */ lis r4, lbl_0001C138@ha
/* 0000A154 C8640000 */ lfd f3, lbl_0001C138@l(r4)
/* 0000A158 90010010 */ stw r0, 0x10(r1)
/* 0000A15C C0250004 */ lfs f1, 4(r5)
/* 0000A160 C8410010 */ lfd f2, 0x10(r1)
/* 0000A164 C0030018 */ lfs f0, 0x18(r3)
/* 0000A168 EC421828 */ fsubs f2, f2, f3
/* 0000A16C EC220828 */ fsubs f1, f2, f1
/* 0000A170 EC211024 */ fdivs f1, f1, f2
/* 0000A174 EC000072 */ fmuls f0, f0, f1
/* 0000A178 D0030018 */ stfs f0, 0x18(r3)
lbl_0000A17C:
/* 0000A17C 38210018 */ addi r1, r1, 0x18
/* 0000A180 4E800020 */ blr 
lbl_0000A184:
/* 0000A184 7C0802A6 */ mflr r0
/* 0000A188 3C800000 */ lis r4, polyDisp@ha
/* 0000A18C 90010004 */ stw r0, 4(r1)
/* 0000A190 9421FFD0 */ stwu r1, -0x30(r1)
/* 0000A194 DBE10028 */ stfd f31, 0x28(r1)
/* 0000A198 93E10024 */ stw r31, 0x24(r1)
/* 0000A19C 93C10020 */ stw r30, 0x20(r1)
/* 0000A1A0 93A1001C */ stw r29, 0x1c(r1)
/* 0000A1A4 3BA30000 */ addi r29, r3, 0
/* 0000A1A8 80040000 */ lwz r0, polyDisp@l(r4)
/* 0000A1AC 3C800000 */ lis r4, lbl_0001C108@ha
/* 0000A1B0 3BE40000 */ addi r31, r4, lbl_0001C108@l
/* 0000A1B4 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 0000A1B8 40820148 */ bne lbl_0000A300
/* 0000A1BC 83DD0030 */ lwz r30, 0x30(r29)
/* 0000A1C0 387D0034 */ addi r3, r29, 0x34
/* 0000A1C4 C3FD0024 */ lfs f31, 0x24(r29)
/* 0000A1C8 4BFF5F9D */ bl mathutil_mtxA_from_mtxB_translate
/* 0000A1CC A87D004E */ lha r3, 0x4e(r29)
/* 0000A1D0 4BFF5F95 */ bl mathutil_mtxA_rotate_y
/* 0000A1D4 A87D004C */ lha r3, 0x4c(r29)
/* 0000A1D8 4BFF5F8D */ bl mathutil_mtxA_rotate_x
/* 0000A1DC A87D0050 */ lha r3, 0x50(r29)
/* 0000A1E0 4BFF5F85 */ bl mathutil_mtxA_rotate_z
/* 0000A1E4 3861000C */ addi r3, r1, 0xc
/* 0000A1E8 4BFF5F7D */ bl mathutil_mtxA_rigid_inv_tf_tl
/* 0000A1EC C0210014 */ lfs f1, 0x14(r1)
/* 0000A1F0 C01F0000 */ lfs f0, 0(r31)
/* 0000A1F4 FC010040 */ fcmpo cr0, f1, f0
/* 0000A1F8 40800010 */ bge lbl_0000A208
/* 0000A1FC 3C600001 */ lis r3, 1
/* 0000A200 38638000 */ addi r3, r3, -32768
/* 0000A204 4BFF5F61 */ bl mathutil_mtxA_rotate_y
lbl_0000A208:
/* 0000A208 3861000C */ addi r3, r1, 0xc
/* 0000A20C 38830004 */ addi r4, r3, 4
/* 0000A210 38630008 */ addi r3, r3, 8
/* 0000A214 3CA0E000 */ lis r5, 0xe000
/* 0000A218 C045000C */ lfs f2, 0xc(r5)
/* 0000A21C C025001C */ lfs f1, 0x1c(r5)
/* 0000A220 C005002C */ lfs f0, 0x2c(r5)
/* 0000A224 D041000C */ stfs f2, 0xc(r1)
/* 0000A228 D0240000 */ stfs f1, 0(r4)
/* 0000A22C D0030000 */ stfs f0, 0(r3)
/* 0000A230 FC00F850 */ fneg f0, f31
/* 0000A234 C0410014 */ lfs f2, 0x14(r1)
/* 0000A238 FC020040 */ fcmpo cr0, f2, f0
/* 0000A23C 4C411382 */ cror 2, 1, 2
/* 0000A240 418200C0 */ beq lbl_0000A300
/* 0000A244 EC22F82A */ fadds f1, f2, f31
/* 0000A248 C001000C */ lfs f0, 0xc(r1)
/* 0000A24C EC211024 */ fdivs f1, f1, f2
/* 0000A250 EC000072 */ fmuls f0, f0, f1
/* 0000A254 EFFF0072 */ fmuls f31, f31, f1
/* 0000A258 D001000C */ stfs f0, 0xc(r1)
/* 0000A25C C0010010 */ lfs f0, 0x10(r1)
/* 0000A260 EC000072 */ fmuls f0, f0, f1
/* 0000A264 D0010010 */ stfs f0, 0x10(r1)
/* 0000A268 C0010014 */ lfs f0, 0x14(r1)
/* 0000A26C EC000072 */ fmuls f0, f0, f1
/* 0000A270 D0010014 */ stfs f0, 0x14(r1)
/* 0000A274 C041000C */ lfs f2, 0xc(r1)
/* 0000A278 C0210010 */ lfs f1, 0x10(r1)
/* 0000A27C C0010014 */ lfs f0, 0x14(r1)
/* 0000A280 D045000C */ stfs f2, 0xc(r5)
/* 0000A284 D025001C */ stfs f1, 0x1c(r5)
/* 0000A288 D005002C */ stfs f0, 0x2c(r5)
/* 0000A28C FC20F890 */ fmr f1, f31
/* 0000A290 4BFF5ED5 */ bl mathutil_mtxA_scale_s
/* 0000A294 C03D0018 */ lfs f1, 0x18(r29)
/* 0000A298 C09F0004 */ lfs f4, 4(r31)
/* 0000A29C FC400890 */ fmr f2, f1
/* 0000A2A0 FC600890 */ fmr f3, f1
/* 0000A2A4 4BFF5EC1 */ bl avdisp_set_post_mult_color
/* 0000A2A8 38600001 */ li r3, 1
/* 0000A2AC 38800003 */ li r4, 3
/* 0000A2B0 38A00000 */ li r5, 0
/* 0000A2B4 4BFF5EB1 */ bl avdisp_set_z_mode
/* 0000A2B8 FC20F890 */ fmr f1, f31
/* 0000A2BC 4BFF5EA9 */ bl avdisp_set_bound_sphere_scale
/* 0000A2C0 7FC3F378 */ mr r3, r30
/* 0000A2C4 4BFF5EA1 */ bl avdisp_draw_model_culled_sort_translucent
/* 0000A2C8 4BFF5E9D */ bl mathutil_mtxA_sq_from_identity
/* 0000A2CC C01F0120 */ lfs f0, 0x120(r31)
/* 0000A2D0 EC2007F2 */ fmuls f1, f0, f31
/* 0000A2D4 4BFF5E91 */ bl mathutil_mtxA_scale_s
/* 0000A2D8 C01F0120 */ lfs f0, 0x120(r31)
/* 0000A2DC EC2007F2 */ fmuls f1, f0, f31
/* 0000A2E0 4BFF5E85 */ bl avdisp_set_bound_sphere_scale
/* 0000A2E4 7FC3F378 */ mr r3, r30
/* 0000A2E8 4BFF5E7D */ bl avdisp_draw_model_culled_sort_translucent
/* 0000A2EC 4BFF5E79 */ bl fade_color_base_default
/* 0000A2F0 38600001 */ li r3, 1
/* 0000A2F4 38800003 */ li r4, 3
/* 0000A2F8 38A00001 */ li r5, 1
/* 0000A2FC 4BFF5E69 */ bl avdisp_set_z_mode
lbl_0000A300:
/* 0000A300 80010034 */ lwz r0, 0x34(r1)
/* 0000A304 CBE10028 */ lfd f31, 0x28(r1)
/* 0000A308 83E10024 */ lwz r31, 0x24(r1)
/* 0000A30C 7C0803A6 */ mtlr r0
/* 0000A310 83C10020 */ lwz r30, 0x20(r1)
/* 0000A314 83A1001C */ lwz r29, 0x1c(r1)
/* 0000A318 38210030 */ addi r1, r1, 0x30
/* 0000A31C 4E800020 */ blr 
lbl_0000A320:
/* 0000A320 4E800020 */ blr 
lbl_0000A324:
/* 0000A324 7C0802A6 */ mflr r0
/* 0000A328 3C800000 */ lis r4, lbl_0001C108@ha
/* 0000A32C 90010004 */ stw r0, 4(r1)
/* 0000A330 9421FFB0 */ stwu r1, -0x50(r1)
/* 0000A334 93E1004C */ stw r31, 0x4c(r1)
/* 0000A338 3BE40000 */ addi r31, r4, lbl_0001C108@l
/* 0000A33C 93C10048 */ stw r30, 0x48(r1)
/* 0000A340 3BC30000 */ addi r30, r3, 0
/* 0000A344 93A10044 */ stw r29, 0x44(r1)
/* 0000A348 4BFF5E1D */ bl rand
/* 0000A34C 6C608000 */ xoris r0, r3, 0x8000
/* 0000A350 C07F0018 */ lfs f3, 0x18(r31)
/* 0000A354 9001003C */ stw r0, 0x3c(r1)
/* 0000A358 3FA04330 */ lis r29, 0x4330
/* 0000A35C 3C600000 */ lis r3, lbl_0001C138@ha
/* 0000A360 C05F0010 */ lfs f2, 0x10(r31)
/* 0000A364 93A10038 */ stw r29, 0x38(r1)
/* 0000A368 C8A30000 */ lfd f5, lbl_0001C138@l(r3)
/* 0000A36C 3C600000 */ lis r3, minigameGma@ha
/* 0000A370 C8810038 */ lfd f4, 0x38(r1)
/* 0000A374 38630000 */ addi r3, r3, minigameGma@l
/* 0000A378 C03F0014 */ lfs f1, 0x14(r31)
/* 0000A37C EC842828 */ fsubs f4, f4, f5
/* 0000A380 C01F0080 */ lfs f0, 0x80(r31)
/* 0000A384 EC641824 */ fdivs f3, f4, f3
/* 0000A388 EC4200F2 */ fmuls f2, f2, f3
/* 0000A38C EC21102A */ fadds f1, f1, f2
/* 0000A390 EC000072 */ fmuls f0, f0, f1
/* 0000A394 FC00001E */ fctiwz f0, f0
/* 0000A398 D8010030 */ stfd f0, 0x30(r1)
/* 0000A39C 80010034 */ lwz r0, 0x34(r1)
/* 0000A3A0 901E000C */ stw r0, 0xc(r30)
/* 0000A3A4 80630000 */ lwz r3, 0(r3)
/* 0000A3A8 80630008 */ lwz r3, 8(r3)
/* 0000A3AC 80030528 */ lwz r0, 0x528(r3)
/* 0000A3B0 901E0030 */ stw r0, 0x30(r30)
/* 0000A3B4 4BFF5DB1 */ bl rand
/* 0000A3B8 6C608000 */ xoris r0, r3, 0x8000
/* 0000A3BC C07F0018 */ lfs f3, 0x18(r31)
/* 0000A3C0 9001002C */ stw r0, 0x2c(r1)
/* 0000A3C4 3C600000 */ lis r3, lbl_0001C138@ha
/* 0000A3C8 C8830000 */ lfd f4, lbl_0001C138@l(r3)
/* 0000A3CC 93A10028 */ stw r29, 0x28(r1)
/* 0000A3D0 C05F0124 */ lfs f2, 0x124(r31)
/* 0000A3D4 C8010028 */ lfd f0, 0x28(r1)
/* 0000A3D8 C03F004C */ lfs f1, 0x4c(r31)
/* 0000A3DC EC802028 */ fsubs f4, f0, f4
/* 0000A3E0 C01F0010 */ lfs f0, 0x10(r31)
/* 0000A3E4 EC641824 */ fdivs f3, f4, f3
/* 0000A3E8 EC4200F2 */ fmuls f2, f2, f3
/* 0000A3EC EC21102A */ fadds f1, f1, f2
/* 0000A3F0 EC000072 */ fmuls f0, f0, f1
/* 0000A3F4 D01E0024 */ stfs f0, 0x24(r30)
/* 0000A3F8 D03E0028 */ stfs f1, 0x28(r30)
/* 0000A3FC 4BFF5D69 */ bl rand
/* 0000A400 6C608000 */ xoris r0, r3, 0x8000
/* 0000A404 C05F0018 */ lfs f2, 0x18(r31)
/* 0000A408 90010024 */ stw r0, 0x24(r1)
/* 0000A40C 3C600000 */ lis r3, lbl_0001C138@ha
/* 0000A410 C8830000 */ lfd f4, lbl_0001C138@l(r3)
/* 0000A414 93A10020 */ stw r29, 0x20(r1)
/* 0000A418 C03F004C */ lfs f1, 0x4c(r31)
/* 0000A41C C8610020 */ lfd f3, 0x20(r1)
/* 0000A420 C01F0128 */ lfs f0, 0x128(r31)
/* 0000A424 EC632028 */ fsubs f3, f3, f4
/* 0000A428 EC431024 */ fdivs f2, f3, f2
/* 0000A42C EC2100B2 */ fmuls f1, f1, f2
/* 0000A430 EC000828 */ fsubs f0, f0, f1
/* 0000A434 D01E0088 */ stfs f0, 0x88(r30)
/* 0000A438 4BFF5D2D */ bl rand
/* 0000A43C 6C608000 */ xoris r0, r3, 0x8000
/* 0000A440 C05F0018 */ lfs f2, 0x18(r31)
/* 0000A444 9001001C */ stw r0, 0x1c(r1)
/* 0000A448 3C600000 */ lis r3, lbl_0001C138@ha
/* 0000A44C C8830000 */ lfd f4, lbl_0001C138@l(r3)
/* 0000A450 93A10018 */ stw r29, 0x18(r1)
/* 0000A454 C03F004C */ lfs f1, 0x4c(r31)
/* 0000A458 C8610018 */ lfd f3, 0x18(r1)
/* 0000A45C C01F0128 */ lfs f0, 0x128(r31)
/* 0000A460 EC632028 */ fsubs f3, f3, f4
/* 0000A464 EC431024 */ fdivs f2, f3, f2
/* 0000A468 EC2100B2 */ fmuls f1, f1, f2
/* 0000A46C EC000828 */ fsubs f0, f0, f1
/* 0000A470 D01E008C */ stfs f0, 0x8c(r30)
/* 0000A474 4BFF5CF1 */ bl rand
/* 0000A478 6C608000 */ xoris r0, r3, 0x8000
/* 0000A47C C05F0018 */ lfs f2, 0x18(r31)
/* 0000A480 90010014 */ stw r0, 0x14(r1)
/* 0000A484 3C600000 */ lis r3, lbl_0001C138@ha
/* 0000A488 C8830000 */ lfd f4, lbl_0001C138@l(r3)
/* 0000A48C 38600001 */ li r3, 1
/* 0000A490 93A10010 */ stw r29, 0x10(r1)
/* 0000A494 C03F004C */ lfs f1, 0x4c(r31)
/* 0000A498 C8610010 */ lfd f3, 0x10(r1)
/* 0000A49C C01F0128 */ lfs f0, 0x128(r31)
/* 0000A4A0 EC632028 */ fsubs f3, f3, f4
/* 0000A4A4 EC431024 */ fdivs f2, f3, f2
/* 0000A4A8 EC2100B2 */ fmuls f1, f1, f2
/* 0000A4AC EC000828 */ fsubs f0, f0, f1
/* 0000A4B0 D01E0090 */ stfs f0, 0x90(r30)
/* 0000A4B4 A81E0014 */ lha r0, 0x14(r30)
/* 0000A4B8 7C600030 */ slw r0, r3, r0
/* 0000A4BC B01E0016 */ sth r0, 0x16(r30)
/* 0000A4C0 80010054 */ lwz r0, 0x54(r1)
/* 0000A4C4 83E1004C */ lwz r31, 0x4c(r1)
/* 0000A4C8 83C10048 */ lwz r30, 0x48(r1)
/* 0000A4CC 7C0803A6 */ mtlr r0
/* 0000A4D0 83A10044 */ lwz r29, 0x44(r1)
/* 0000A4D4 38210050 */ addi r1, r1, 0x50
/* 0000A4D8 4E800020 */ blr 
lbl_0000A4DC:
/* 0000A4DC 9421FFE8 */ stwu r1, -0x18(r1)
/* 0000A4E0 3CA00000 */ lis r5, lbl_0001C108@ha
/* 0000A4E4 3C800000 */ lis r4, lbl_0001C138@ha
/* 0000A4E8 C0230040 */ lfs f1, 0x40(r3)
/* 0000A4EC 3C004330 */ lis r0, 0x4330
/* 0000A4F0 C0030088 */ lfs f0, 0x88(r3)
/* 0000A4F4 38A50000 */ addi r5, r5, lbl_0001C108@l
/* 0000A4F8 EC010032 */ fmuls f0, f1, f0
/* 0000A4FC D0030040 */ stfs f0, 0x40(r3)
/* 0000A500 C0230044 */ lfs f1, 0x44(r3)
/* 0000A504 C003008C */ lfs f0, 0x8c(r3)
/* 0000A508 EC010032 */ fmuls f0, f1, f0
/* 0000A50C D0030044 */ stfs f0, 0x44(r3)
/* 0000A510 C0230048 */ lfs f1, 0x48(r3)
/* 0000A514 C0030090 */ lfs f0, 0x90(r3)
/* 0000A518 EC010032 */ fmuls f0, f1, f0
/* 0000A51C D0030048 */ stfs f0, 0x48(r3)
/* 0000A520 C0230034 */ lfs f1, 0x34(r3)
/* 0000A524 C0030040 */ lfs f0, 0x40(r3)
/* 0000A528 EC01002A */ fadds f0, f1, f0
/* 0000A52C D0030034 */ stfs f0, 0x34(r3)
/* 0000A530 C0230038 */ lfs f1, 0x38(r3)
/* 0000A534 C0030044 */ lfs f0, 0x44(r3)
/* 0000A538 EC01002A */ fadds f0, f1, f0
/* 0000A53C D0030038 */ stfs f0, 0x38(r3)
/* 0000A540 C023003C */ lfs f1, 0x3c(r3)
/* 0000A544 C0030048 */ lfs f0, 0x48(r3)
/* 0000A548 EC01002A */ fadds f0, f1, f0
/* 0000A54C D003003C */ stfs f0, 0x3c(r3)
/* 0000A550 80C3000C */ lwz r6, 0xc(r3)
/* 0000A554 C8440000 */ lfd f2, lbl_0001C138@l(r4)
/* 0000A558 6CC48000 */ xoris r4, r6, 0x8000
/* 0000A55C C005011C */ lfs f0, 0x11c(r5)
/* 0000A560 90810014 */ stw r4, 0x14(r1)
/* 0000A564 90010010 */ stw r0, 0x10(r1)
/* 0000A568 C8210010 */ lfd f1, 0x10(r1)
/* 0000A56C EC211028 */ fsubs f1, f1, f2
/* 0000A570 FC010040 */ fcmpo cr0, f1, f0
/* 0000A574 40800038 */ bge lbl_0000A5AC
/* 0000A578 90810014 */ stw r4, 0x14(r1)
/* 0000A57C 3C800000 */ lis r4, lbl_0001C138@ha
/* 0000A580 C8640000 */ lfd f3, lbl_0001C138@l(r4)
/* 0000A584 90010010 */ stw r0, 0x10(r1)
/* 0000A588 C0250004 */ lfs f1, 4(r5)
/* 0000A58C C8410010 */ lfd f2, 0x10(r1)
/* 0000A590 C0030024 */ lfs f0, 0x24(r3)
/* 0000A594 EC421828 */ fsubs f2, f2, f3
/* 0000A598 EC220828 */ fsubs f1, f2, f1
/* 0000A59C EC211024 */ fdivs f1, f1, f2
/* 0000A5A0 EC000072 */ fmuls f0, f0, f1
/* 0000A5A4 D0030024 */ stfs f0, 0x24(r3)
/* 0000A5A8 48000020 */ b lbl_0000A5C8
lbl_0000A5AC:
/* 0000A5AC C0430024 */ lfs f2, 0x24(r3)
/* 0000A5B0 C0030028 */ lfs f0, 0x28(r3)
/* 0000A5B4 C025012C */ lfs f1, 0x12c(r5)
/* 0000A5B8 EC001028 */ fsubs f0, f0, f2
/* 0000A5BC EC010032 */ fmuls f0, f1, f0
/* 0000A5C0 EC02002A */ fadds f0, f2, f0
/* 0000A5C4 D0030024 */ stfs f0, 0x24(r3)
lbl_0000A5C8:
/* 0000A5C8 38210018 */ addi r1, r1, 0x18
/* 0000A5CC 4E800020 */ blr 
lbl_0000A5D0:
/* 0000A5D0 7C0802A6 */ mflr r0
/* 0000A5D4 3C800000 */ lis r4, polyDisp@ha
/* 0000A5D8 90010004 */ stw r0, 4(r1)
/* 0000A5DC 9421FFE0 */ stwu r1, -0x20(r1)
/* 0000A5E0 DBE10018 */ stfd f31, 0x18(r1)
/* 0000A5E4 93E10014 */ stw r31, 0x14(r1)
/* 0000A5E8 93C10010 */ stw r30, 0x10(r1)
/* 0000A5EC 3BC30000 */ addi r30, r3, 0
/* 0000A5F0 80040000 */ lwz r0, polyDisp@l(r4)
/* 0000A5F4 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 0000A5F8 40820078 */ bne lbl_0000A670
/* 0000A5FC 83FE0030 */ lwz r31, 0x30(r30)
/* 0000A600 387E0034 */ addi r3, r30, 0x34
/* 0000A604 C3FE0024 */ lfs f31, 0x24(r30)
/* 0000A608 4BFF5B5D */ bl mathutil_mtxA_from_mtxB_translate
/* 0000A60C 4BFF5B59 */ bl mathutil_mtxA_sq_from_identity
/* 0000A610 3C600001 */ lis r3, 1
/* 0000A614 38638000 */ addi r3, r3, -32768
/* 0000A618 4BFF5B4D */ bl mathutil_mtxA_rotate_y
/* 0000A61C FC20F890 */ fmr f1, f31
/* 0000A620 4BFF5B45 */ bl mathutil_mtxA_scale_s
/* 0000A624 3C600000 */ lis r3, lbl_0001C10C@ha
/* 0000A628 C03E0018 */ lfs f1, 0x18(r30)
/* 0000A62C C05E001C */ lfs f2, 0x1c(r30)
/* 0000A630 C07E0020 */ lfs f3, 0x20(r30)
/* 0000A634 C0830000 */ lfs f4, lbl_0001C10C@l(r3)
/* 0000A638 4BFF5B2D */ bl avdisp_set_post_mult_color
/* 0000A63C 38600001 */ li r3, 1
/* 0000A640 38800003 */ li r4, 3
/* 0000A644 38A00000 */ li r5, 0
/* 0000A648 4BFF5B1D */ bl avdisp_set_z_mode
/* 0000A64C FC20F890 */ fmr f1, f31
/* 0000A650 4BFF5B15 */ bl avdisp_set_bound_sphere_scale
/* 0000A654 7FE3FB78 */ mr r3, r31
/* 0000A658 4BFF5B0D */ bl avdisp_draw_model_culled_sort_all
/* 0000A65C 4BFF5B09 */ bl fade_color_base_default
/* 0000A660 38600001 */ li r3, 1
/* 0000A664 38800003 */ li r4, 3
/* 0000A668 38A00001 */ li r5, 1
/* 0000A66C 4BFF5AF9 */ bl avdisp_set_z_mode
lbl_0000A670:
/* 0000A670 80010024 */ lwz r0, 0x24(r1)
/* 0000A674 CBE10018 */ lfd f31, 0x18(r1)
/* 0000A678 83E10014 */ lwz r31, 0x14(r1)
/* 0000A67C 7C0803A6 */ mtlr r0
/* 0000A680 83C10010 */ lwz r30, 0x10(r1)
/* 0000A684 38210020 */ addi r1, r1, 0x20
/* 0000A688 4E800020 */ blr 
lbl_0000A68C:
/* 0000A68C 4E800020 */ blr 
