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
