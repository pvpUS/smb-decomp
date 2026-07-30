lbl_00006A40:
/* 00006A40 7C0802A6 */ mflr r0
/* 00006A44 3C800000 */ lis r4, polyDisp@ha
/* 00006A48 90010004 */ stw r0, 4(r1)
/* 00006A4C 9421FF98 */ stwu r1, -0x68(r1)
/* 00006A50 DBE10060 */ stfd f31, 0x60(r1)
/* 00006A54 DBC10058 */ stfd f30, 0x58(r1)
/* 00006A58 BF010038 */ stmw r24, 0x38(r1)
/* 00006A5C 3B830000 */ addi r28, r3, 0
/* 00006A60 3C600000 */ lis r3, lbl_0001C068@ha
/* 00006A64 3BE30000 */ addi r31, r3, lbl_0001C068@l
/* 00006A68 80040000 */ lwz r0, polyDisp@l(r4)
/* 00006A6C 83DC00A4 */ lwz r30, 0xa4(r28)
/* 00006A70 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00006A74 41820028 */ beq lbl_00006A9C
/* 00006A78 C01C0034 */ lfs f0, 0x34(r28)
/* 00006A7C C03C005C */ lfs f1, 0x5c(r28)
/* 00006A80 FC000050 */ fneg f0, f0
/* 00006A84 FC010040 */ fcmpo cr0, f1, f0
/* 00006A88 418004A0 */ blt lbl_00006F28
/* 00006A8C 3C600000 */ lis r3, lbl_10000000@ha
/* 00006A90 38030000 */ addi r0, r3, lbl_10000000@l
/* 00006A94 7C1D0378 */ mr r29, r0
/* 00006A98 48000010 */ b lbl_00006AA8
lbl_00006A9C:
/* 00006A9C 3C600000 */ lis r3, lbl_1000008C@ha
/* 00006AA0 38030000 */ addi r0, r3, lbl_1000008C@l
/* 00006AA4 7C1D0378 */ mr r29, r0
lbl_00006AA8:
/* 00006AA8 C03C0058 */ lfs f1, 0x58(r28)
/* 00006AAC C05C005C */ lfs f2, 0x5c(r28)
/* 00006AB0 C07C0060 */ lfs f3, 0x60(r28)
/* 00006AB4 4BFF96B1 */ bl mathutil_mtxA_from_mtxB_translate_xyz
/* 00006AB8 A87C0072 */ lha r3, 0x72(r28)
/* 00006ABC 4BFF96A9 */ bl mathutil_mtxA_rotate_y
/* 00006AC0 A87C0070 */ lha r3, 0x70(r28)
/* 00006AC4 4BFF96A1 */ bl mathutil_mtxA_rotate_x
/* 00006AC8 A87C0074 */ lha r3, 0x74(r28)
/* 00006ACC 4BFF9699 */ bl mathutil_mtxA_rotate_z
/* 00006AD0 807C0054 */ lwz r3, 0x54(r28)
/* 00006AD4 C0230014 */ lfs f1, 0x14(r3)
/* 00006AD8 38630008 */ addi r3, r3, 8
/* 00006ADC 4BFF9689 */ bl test_sphere_in_frustum
/* 00006AE0 2C030000 */ cmpwi r3, 0
/* 00006AE4 41820444 */ beq lbl_00006F28
/* 00006AE8 3C800000 */ lis r4, mathutilData@ha
/* 00006AEC 807C0054 */ lwz r3, 0x54(r28)
/* 00006AF0 38840000 */ addi r4, r4, mathutilData@l
/* 00006AF4 C01F0000 */ lfs f0, 0(r31)
/* 00006AF8 80840000 */ lwz r4, 0(r4)
/* 00006AFC C0230014 */ lfs f1, 0x14(r3)
/* 00006B00 C044002C */ lfs f2, 0x2c(r4)
/* 00006B04 C3DE0090 */ lfs f30, 0x90(r30)
/* 00006B08 EC42082A */ fadds f2, f2, f1
/* 00006B0C FC020040 */ fcmpo cr0, f2, f0
/* 00006B10 4081000C */ ble lbl_00006B1C
/* 00006B14 FFC00090 */ fmr f30, f0
/* 00006B18 48000018 */ b lbl_00006B30
lbl_00006B1C:
/* 00006B1C C01F0064 */ lfs f0, 0x64(r31)
/* 00006B20 FC020040 */ fcmpo cr0, f2, f0
/* 00006B24 4081000C */ ble lbl_00006B30
/* 00006B28 FC001050 */ fneg f0, f2
/* 00006B2C EFDE0032 */ fmuls f30, f30, f0
lbl_00006B30:
/* 00006B30 C01F0000 */ lfs f0, 0(r31)
/* 00006B34 FC1E0040 */ fcmpo cr0, f30, f0
/* 00006B38 4C401382 */ cror 2, 0, 2
/* 00006B3C 418203EC */ beq lbl_00006F28
/* 00006B40 A07E0094 */ lhz r3, 0x94(r30)
/* 00006B44 546007BD */ rlwinm. r0, r3, 0, 0x1e, 0x1e
/* 00006B48 418200E0 */ beq lbl_00006C28
/* 00006B4C 54600739 */ rlwinm. r0, r3, 0, 0x1c, 0x1c
/* 00006B50 408200D8 */ bne lbl_00006C28
/* 00006B54 4BFF9611 */ bl mathutil_mtxA_push
/* 00006B58 4BFF960D */ bl mathutil_mtxA_sq_from_identity
/* 00006B5C C01E00A0 */ lfs f0, 0xa0(r30)
/* 00006B60 FC00001E */ fctiwz f0, f0
/* 00006B64 D8010030 */ stfd f0, 0x30(r1)
/* 00006B68 80010034 */ lwz r0, 0x34(r1)
/* 00006B6C 7C030734 */ extsh r3, r0
/* 00006B70 4BFF95F5 */ bl mathutil_mtxA_rotate_y
/* 00006B74 C01E009C */ lfs f0, 0x9c(r30)
/* 00006B78 FC00001E */ fctiwz f0, f0
/* 00006B7C D8010028 */ stfd f0, 0x28(r1)
/* 00006B80 8001002C */ lwz r0, 0x2c(r1)
/* 00006B84 7C030734 */ extsh r3, r0
/* 00006B88 4BFF95DD */ bl mathutil_mtxA_rotate_x
/* 00006B8C C03F0088 */ lfs f1, 0x88(r31)
/* 00006B90 C01E0098 */ lfs f0, 0x98(r30)
/* 00006B94 C05E00A4 */ lfs f2, 0xa4(r30)
/* 00006B98 EC010032 */ fmuls f0, f1, f0
/* 00006B9C EC02002A */ fadds f0, f2, f0
/* 00006BA0 FC00001E */ fctiwz f0, f0
/* 00006BA4 D8010020 */ stfd f0, 0x20(r1)
/* 00006BA8 80010024 */ lwz r0, 0x24(r1)
/* 00006BAC 7C030734 */ extsh r3, r0
/* 00006BB0 4BFF95B5 */ bl mathutil_mtxA_rotate_z
/* 00006BB4 C03E0098 */ lfs f1, 0x98(r30)
/* 00006BB8 4BFF95AD */ bl mathutil_mtxA_scale_s
/* 00006BBC C01F0008 */ lfs f0, 8(r31)
/* 00006BC0 FC1E0040 */ fcmpo cr0, f30, f0
/* 00006BC4 40800028 */ bge lbl_00006BEC
/* 00006BC8 FC20F090 */ fmr f1, f30
/* 00006BCC 4BFF9599 */ bl avdisp_set_alpha
/* 00006BD0 3C600000 */ lis r3, minigameGma@ha
/* 00006BD4 38630000 */ addi r3, r3, minigameGma@l
/* 00006BD8 80630000 */ lwz r3, 0(r3)
/* 00006BDC 80630008 */ lwz r3, 8(r3)
/* 00006BE0 806301D0 */ lwz r3, 0x1d0(r3)
/* 00006BE4 4BFF9581 */ bl avdisp_draw_model_culled_sort_all
/* 00006BE8 4800003C */ b lbl_00006C24
lbl_00006BEC:
/* 00006BEC 3C600000 */ lis r3, mathutilData@ha
/* 00006BF0 3B630000 */ addi r27, r3, mathutilData@l
/* 00006BF4 807B0000 */ lwz r3, 0(r27)
/* 00006BF8 38800000 */ li r4, 0
/* 00006BFC 4BFF9569 */ bl GXLoadPosMtxImm
/* 00006C00 807B0000 */ lwz r3, 0(r27)
/* 00006C04 38800000 */ li r4, 0
/* 00006C08 4BFF955D */ bl GXLoadNrmMtxImm
/* 00006C0C 3C600000 */ lis r3, minigameGma@ha
/* 00006C10 38630000 */ addi r3, r3, minigameGma@l
/* 00006C14 80630000 */ lwz r3, 0(r3)
/* 00006C18 80630008 */ lwz r3, 8(r3)
/* 00006C1C 806301D0 */ lwz r3, 0x1d0(r3)
/* 00006C20 4BFF9545 */ bl avdisp_draw_model_culled_sort_translucent
lbl_00006C24:
/* 00006C24 4BFF9541 */ bl mathutil_mtxA_pop
lbl_00006C28:
/* 00006C28 C03E008C */ lfs f1, 0x8c(r30)
/* 00006C2C C01F0000 */ lfs f0, 0(r31)
/* 00006C30 FFE00890 */ fmr f31, f1
/* 00006C34 FC010040 */ fcmpo cr0, f1, f0
/* 00006C38 40810050 */ ble lbl_00006C88
/* 00006C3C C01F0008 */ lfs f0, 8(r31)
/* 00006C40 FC20F890 */ fmr f1, f31
/* 00006C44 C05F008C */ lfs f2, 0x8c(r31)
/* 00006C48 C07F0020 */ lfs f3, 0x20(r31)
/* 00006C4C FC1F0040 */ fcmpo cr0, f31, f0
/* 00006C50 EC4207F2 */ fmuls f2, f2, f31
/* 00006C54 EC6307F2 */ fmuls f3, f3, f31
/* 00006C58 40810008 */ ble lbl_00006C60
/* 00006C5C FC200090 */ fmr f1, f0
lbl_00006C60:
/* 00006C60 C01F0008 */ lfs f0, 8(r31)
/* 00006C64 FC020040 */ fcmpo cr0, f2, f0
/* 00006C68 40810008 */ ble lbl_00006C70
/* 00006C6C FC400090 */ fmr f2, f0
lbl_00006C70:
/* 00006C70 C01F0008 */ lfs f0, 8(r31)
/* 00006C74 FC030040 */ fcmpo cr0, f3, f0
/* 00006C78 40810008 */ ble lbl_00006C80
/* 00006C7C FC600090 */ fmr f3, f0
lbl_00006C80:
/* 00006C80 C09F0000 */ lfs f4, 0(r31)
/* 00006C84 4BFF94E1 */ bl avdisp_set_post_add_color
lbl_00006C88:
/* 00006C88 A01E0094 */ lhz r0, 0x94(r30)
/* 00006C8C 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00006C90 40820050 */ bne lbl_00006CE0
/* 00006C94 C01F0008 */ lfs f0, 8(r31)
/* 00006C98 FC1E0040 */ fcmpo cr0, f30, f0
/* 00006C9C 40800018 */ bge lbl_00006CB4
/* 00006CA0 FC20F090 */ fmr f1, f30
/* 00006CA4 4BFF94C1 */ bl avdisp_set_alpha
/* 00006CA8 807C0054 */ lwz r3, 0x54(r28)
/* 00006CAC 4BFF94B9 */ bl avdisp_draw_model_culled_sort_all
/* 00006CB0 4800025C */ b lbl_00006F0C
lbl_00006CB4:
/* 00006CB4 3C600000 */ lis r3, mathutilData@ha
/* 00006CB8 3B630000 */ addi r27, r3, mathutilData@l
/* 00006CBC 807B0000 */ lwz r3, 0(r27)
/* 00006CC0 38800000 */ li r4, 0
/* 00006CC4 4BFF94A1 */ bl GXLoadPosMtxImm
/* 00006CC8 807B0000 */ lwz r3, 0(r27)
/* 00006CCC 38800000 */ li r4, 0
/* 00006CD0 4BFF9495 */ bl GXLoadNrmMtxImm
/* 00006CD4 807C0054 */ lwz r3, 0x54(r28)
/* 00006CD8 4BFF948D */ bl avdisp_draw_model_unculled_sort_translucent
/* 00006CDC 48000230 */ b lbl_00006F0C
lbl_00006CE0:
/* 00006CE0 C01F0008 */ lfs f0, 8(r31)
/* 00006CE4 3B9E00B8 */ addi r28, r30, 0xb8
/* 00006CE8 83DE00B4 */ lwz r30, 0xb4(r30)
/* 00006CEC 3B000000 */ li r24, 0
/* 00006CF0 FC1E0040 */ fcmpo cr0, f30, f0
/* 00006CF4 408000F4 */ bge lbl_00006DE8
/* 00006CF8 480000E4 */ b lbl_00006DDC
lbl_00006CFC:
/* 00006CFC 801C0000 */ lwz r0, 0(r28)
/* 00006D00 2C000000 */ cmpwi r0, 0
/* 00006D04 418000D0 */ blt lbl_00006DD4
/* 00006D08 C03F0000 */ lfs f1, 0(r31)
/* 00006D0C 3BDEFFFF */ addi r30, r30, -1
/* 00006D10 C05C0004 */ lfs f2, 4(r28)
/* 00006D14 FC011000 */ fcmpu cr0, f1, f2
/* 00006D18 4082001C */ bne lbl_00006D34
/* 00006D1C C01C0008 */ lfs f0, 8(r28)
/* 00006D20 FC010000 */ fcmpu cr0, f1, f0
/* 00006D24 40820010 */ bne lbl_00006D34
/* 00006D28 C01C000C */ lfs f0, 0xc(r28)
/* 00006D2C FC010000 */ fcmpu cr0, f1, f0
/* 00006D30 41820094 */ beq lbl_00006DC4
lbl_00006D34:
/* 00006D34 C07F0090 */ lfs f3, 0x90(r31)
/* 00006D38 C03C0008 */ lfs f1, 8(r28)
/* 00006D3C C01C000C */ lfs f0, 0xc(r28)
/* 00006D40 EC4300B2 */ fmuls f2, f3, f2
/* 00006D44 EC230072 */ fmuls f1, f3, f1
/* 00006D48 EC030032 */ fmuls f0, f3, f0
/* 00006D4C FC40101E */ fctiwz f2, f2
/* 00006D50 FC20081E */ fctiwz f1, f1
/* 00006D54 FC00001E */ fctiwz f0, f0
/* 00006D58 D8410020 */ stfd f2, 0x20(r1)
/* 00006D5C D8210028 */ stfd f1, 0x28(r1)
/* 00006D60 83610024 */ lwz r27, 0x24(r1)
/* 00006D64 D8010030 */ stfd f0, 0x30(r1)
/* 00006D68 8341002C */ lwz r26, 0x2c(r1)
/* 00006D6C 83210034 */ lwz r25, 0x34(r1)
/* 00006D70 4BFF93F5 */ bl mathutil_mtxA_push
/* 00006D74 387C0004 */ addi r3, r28, 4
/* 00006D78 4BFF93ED */ bl mathutil_mtxA_translate
/* 00006D7C 807D0000 */ lwz r3, 0(r29)
/* 00006D80 38630008 */ addi r3, r3, 8
/* 00006D84 4BFF93E1 */ bl mathutil_mtxA_translate
/* 00006D88 7F430734 */ extsh r3, r26
/* 00006D8C 4BFF93D9 */ bl mathutil_mtxA_rotate_y
/* 00006D90 7F630734 */ extsh r3, r27
/* 00006D94 4BFF93D1 */ bl mathutil_mtxA_rotate_x
/* 00006D98 7F230734 */ extsh r3, r25
/* 00006D9C 4BFF93C9 */ bl mathutil_mtxA_rotate_z
/* 00006DA0 807D0000 */ lwz r3, 0(r29)
/* 00006DA4 38630008 */ addi r3, r3, 8
/* 00006DA8 4BFF93BD */ bl mathutil_mtxA_translate_neg
/* 00006DAC FC20F090 */ fmr f1, f30
/* 00006DB0 4BFF93B5 */ bl avdisp_set_alpha
/* 00006DB4 807D0000 */ lwz r3, 0(r29)
/* 00006DB8 4BFF93AD */ bl avdisp_draw_model_unculled_sort_all
/* 00006DBC 4BFF93A9 */ bl mathutil_mtxA_pop
/* 00006DC0 48000014 */ b lbl_00006DD4
lbl_00006DC4:
/* 00006DC4 FC20F090 */ fmr f1, f30
/* 00006DC8 4BFF939D */ bl avdisp_set_alpha
/* 00006DCC 807D0000 */ lwz r3, 0(r29)
/* 00006DD0 4BFF9395 */ bl avdisp_draw_model_unculled_sort_all
lbl_00006DD4:
/* 00006DD4 3B9C0010 */ addi r28, r28, 0x10
/* 00006DD8 3BBD0004 */ addi r29, r29, 4
lbl_00006DDC:
/* 00006DDC 2C1E0000 */ cmpwi r30, 0
/* 00006DE0 4181FF1C */ bgt lbl_00006CFC
/* 00006DE4 48000128 */ b lbl_00006F0C
lbl_00006DE8:
/* 00006DE8 3C600000 */ lis r3, mathutilData@ha
/* 00006DEC 3B630000 */ addi r27, r3, mathutilData@l
/* 00006DF0 48000114 */ b lbl_00006F04
lbl_00006DF4:
/* 00006DF4 801C0000 */ lwz r0, 0(r28)
/* 00006DF8 2C000000 */ cmpwi r0, 0
/* 00006DFC 41800100 */ blt lbl_00006EFC
/* 00006E00 C03F0000 */ lfs f1, 0(r31)
/* 00006E04 3BDEFFFF */ addi r30, r30, -1
/* 00006E08 C05C0004 */ lfs f2, 4(r28)
/* 00006E0C FC011000 */ fcmpu cr0, f1, f2
/* 00006E10 4082001C */ bne lbl_00006E2C
/* 00006E14 C01C0008 */ lfs f0, 8(r28)
/* 00006E18 FC010000 */ fcmpu cr0, f1, f0
/* 00006E1C 40820010 */ bne lbl_00006E2C
/* 00006E20 C01C000C */ lfs f0, 0xc(r28)
/* 00006E24 FC010000 */ fcmpu cr0, f1, f0
/* 00006E28 418200A8 */ beq lbl_00006ED0
lbl_00006E2C:
/* 00006E2C C07F0090 */ lfs f3, 0x90(r31)
/* 00006E30 C03C0008 */ lfs f1, 8(r28)
/* 00006E34 C01C000C */ lfs f0, 0xc(r28)
/* 00006E38 EC4300B2 */ fmuls f2, f3, f2
/* 00006E3C EC230072 */ fmuls f1, f3, f1
/* 00006E40 EC030032 */ fmuls f0, f3, f0
/* 00006E44 FC40101E */ fctiwz f2, f2
/* 00006E48 FC20081E */ fctiwz f1, f1
/* 00006E4C FC00001E */ fctiwz f0, f0
/* 00006E50 D8410020 */ stfd f2, 0x20(r1)
/* 00006E54 D8210028 */ stfd f1, 0x28(r1)
/* 00006E58 83210024 */ lwz r25, 0x24(r1)
/* 00006E5C D8010030 */ stfd f0, 0x30(r1)
/* 00006E60 8341002C */ lwz r26, 0x2c(r1)
/* 00006E64 83010034 */ lwz r24, 0x34(r1)
/* 00006E68 4BFF92FD */ bl mathutil_mtxA_push
/* 00006E6C 387C0004 */ addi r3, r28, 4
/* 00006E70 4BFF92F5 */ bl mathutil_mtxA_translate
/* 00006E74 807D0000 */ lwz r3, 0(r29)
/* 00006E78 38630008 */ addi r3, r3, 8
/* 00006E7C 4BFF92E9 */ bl mathutil_mtxA_translate
/* 00006E80 7F430734 */ extsh r3, r26
/* 00006E84 4BFF92E1 */ bl mathutil_mtxA_rotate_y
/* 00006E88 7F230734 */ extsh r3, r25
/* 00006E8C 4BFF92D9 */ bl mathutil_mtxA_rotate_x
/* 00006E90 7F030734 */ extsh r3, r24
/* 00006E94 4BFF92D1 */ bl mathutil_mtxA_rotate_z
/* 00006E98 807D0000 */ lwz r3, 0(r29)
/* 00006E9C 38630008 */ addi r3, r3, 8
/* 00006EA0 4BFF92C5 */ bl mathutil_mtxA_translate_neg
/* 00006EA4 807B0000 */ lwz r3, 0(r27)
/* 00006EA8 3B000000 */ li r24, 0
/* 00006EAC 38800000 */ li r4, 0
/* 00006EB0 4BFF92B5 */ bl GXLoadPosMtxImm
/* 00006EB4 807B0000 */ lwz r3, 0(r27)
/* 00006EB8 38800000 */ li r4, 0
/* 00006EBC 4BFF92A9 */ bl GXLoadNrmMtxImm
/* 00006EC0 807D0000 */ lwz r3, 0(r29)
/* 00006EC4 4BFF92A1 */ bl avdisp_draw_model_unculled_sort_translucent
/* 00006EC8 4BFF929D */ bl mathutil_mtxA_pop
/* 00006ECC 48000030 */ b lbl_00006EFC
lbl_00006ED0:
/* 00006ED0 2C180000 */ cmpwi r24, 0
/* 00006ED4 40820020 */ bne lbl_00006EF4
/* 00006ED8 807B0000 */ lwz r3, 0(r27)
/* 00006EDC 3B000001 */ li r24, 1
/* 00006EE0 38800000 */ li r4, 0
/* 00006EE4 4BFF9281 */ bl GXLoadPosMtxImm
/* 00006EE8 807B0000 */ lwz r3, 0(r27)
/* 00006EEC 38800000 */ li r4, 0
/* 00006EF0 4BFF9275 */ bl GXLoadNrmMtxImm
lbl_00006EF4:
/* 00006EF4 807D0000 */ lwz r3, 0(r29)
/* 00006EF8 4BFF926D */ bl avdisp_draw_model_unculled_sort_translucent
lbl_00006EFC:
/* 00006EFC 3B9C0010 */ addi r28, r28, 0x10
/* 00006F00 3BBD0004 */ addi r29, r29, 4
lbl_00006F04:
/* 00006F04 2C1E0000 */ cmpwi r30, 0
/* 00006F08 4181FEEC */ bgt lbl_00006DF4
lbl_00006F0C:
/* 00006F0C C03F0000 */ lfs f1, 0(r31)
/* 00006F10 FC1F0840 */ fcmpo cr0, f31, f1
/* 00006F14 40810014 */ ble lbl_00006F28
/* 00006F18 FC400890 */ fmr f2, f1
/* 00006F1C FC600890 */ fmr f3, f1
/* 00006F20 FC800890 */ fmr f4, f1
/* 00006F24 4BFF9241 */ bl avdisp_set_post_add_color
lbl_00006F28:
/* 00006F28 BB010038 */ lmw r24, 0x38(r1)
/* 00006F2C 8001006C */ lwz r0, 0x6c(r1)
/* 00006F30 CBE10060 */ lfd f31, 0x60(r1)
/* 00006F34 CBC10058 */ lfd f30, 0x58(r1)
/* 00006F38 7C0803A6 */ mtlr r0
/* 00006F3C 38210068 */ addi r1, r1, 0x68
/* 00006F40 4E800020 */ blr 
