/* 000009EC 7C0802A6 */ mflr r0
/* 000009F0 3C600000 */ lis r3, lbl_10000000@ha
/* 000009F4 90010004 */ stw r0, 4(r1)
/* 000009F8 3C800000 */ lis r4, lbl_0000F020@ha
/* 000009FC 9421FFA0 */ stwu r1, -0x60(r1)
/* 00000A00 BF410048 */ stmw r26, 0x48(r1)
/* 00000A04 3BA30000 */ addi r29, r3, lbl_10000000@l
/* 00000A08 3C600000 */ lis r3, lbl_00014F20@ha
/* 00000A0C 3BC40000 */ addi r30, r4, lbl_0000F020@l
/* 00000A10 3BE30000 */ addi r31, r3, lbl_00014F20@l
/* 00000A14 801D0144 */ lwz r0, 0x144(r29)
/* 00000A18 2C000000 */ cmpwi r0, 0
/* 00000A1C 4082000C */ bne lbl_00000A28
/* 00000A20 3B400000 */ li r26, 0
/* 00000A24 480000AC */ b lbl_00000AD0
lbl_00000A28:
/* 00000A28 2C00003C */ cmpwi r0, 0x3c
/* 00000A2C 4080003C */ bge lbl_00000A68
/* 00000A30 6C008000 */ xoris r0, r0, 0x8000
/* 00000A34 C05E1CB0 */ lfs f2, 0x1cb0(r30)
/* 00000A38 90010044 */ stw r0, 0x44(r1)
/* 00000A3C 3C004330 */ lis r0, 0x4330
/* 00000A40 3C600000 */ lis r3, lbl_00010D58@ha
/* 00000A44 90010040 */ stw r0, 0x40(r1)
/* 00000A48 C8230000 */ lfd f1, lbl_00010D58@l(r3)
/* 00000A4C C8010040 */ lfd f0, 0x40(r1)
/* 00000A50 EC000828 */ fsubs f0, f0, f1
/* 00000A54 EC020032 */ fmuls f0, f2, f0
/* 00000A58 FC00001E */ fctiwz f0, f0
/* 00000A5C D8010038 */ stfd f0, 0x38(r1)
/* 00000A60 8341003C */ lwz r26, 0x3c(r1)
/* 00000A64 4800006C */ b lbl_00000AD0
lbl_00000A68:
/* 00000A68 6C038000 */ xoris r3, r0, 0x8000
/* 00000A6C C81E1CB8 */ lfd f0, 0x1cb8(r30)
/* 00000A70 9061003C */ stw r3, 0x3c(r1)
/* 00000A74 3C004330 */ lis r0, 0x4330
/* 00000A78 3C800000 */ lis r4, lbl_00010D58@ha
/* 00000A7C 90010038 */ stw r0, 0x38(r1)
/* 00000A80 C8440000 */ lfd f2, lbl_00010D58@l(r4)
/* 00000A84 C8210038 */ lfd f1, 0x38(r1)
/* 00000A88 FC211028 */ fsub f1, f1, f2
/* 00000A8C FC010040 */ fcmpo cr0, f1, f0
/* 00000A90 4081003C */ ble lbl_00000ACC
/* 00000A94 9061003C */ stw r3, 0x3c(r1)
/* 00000A98 3C600000 */ lis r3, lbl_00010D58@ha
/* 00000A9C C8230000 */ lfd f1, lbl_00010D58@l(r3)
/* 00000AA0 90010038 */ stw r0, 0x38(r1)
/* 00000AA4 C85E1CC8 */ lfd f2, 0x1cc8(r30)
/* 00000AA8 C8010038 */ lfd f0, 0x38(r1)
/* 00000AAC C87E1CC0 */ lfd f3, 0x1cc0(r30)
/* 00000AB0 FC000828 */ fsub f0, f0, f1
/* 00000AB4 FC020028 */ fsub f0, f2, f0
/* 00000AB8 FC030032 */ fmul f0, f3, f0
/* 00000ABC FC00001E */ fctiwz f0, f0
/* 00000AC0 D8010040 */ stfd f0, 0x40(r1)
/* 00000AC4 83410044 */ lwz r26, 0x44(r1)
/* 00000AC8 48000008 */ b lbl_00000AD0
lbl_00000ACC:
/* 00000ACC 3B406000 */ li r26, 0x6000
lbl_00000AD0:
/* 00000AD0 4BFFF691 */ bl mathutil_mtxA_from_mtxB
/* 00000AD4 C03E1CD0 */ lfs f1, 0x1cd0(r30)
/* 00000AD8 C05E1CD4 */ lfs f2, 0x1cd4(r30)
/* 00000ADC C07E1CD8 */ lfs f3, 0x1cd8(r30)
/* 00000AE0 4BFFF681 */ bl mathutil_mtxA_translate_xyz
/* 00000AE4 7F5A0734 */ extsh r26, r26
/* 00000AE8 7C7A00D0 */ neg r3, r26
/* 00000AEC 4BFFF675 */ bl mathutil_mtxA_rotate_y
/* 00000AF0 3C600000 */ lis r3, mathutilData@ha
/* 00000AF4 3B630000 */ addi r27, r3, mathutilData@l
/* 00000AF8 807B0000 */ lwz r3, 0(r27)
/* 00000AFC 38800000 */ li r4, 0
/* 00000B00 4BFFF661 */ bl GXLoadPosMtxImm
/* 00000B04 807B0000 */ lwz r3, 0(r27)
/* 00000B08 38800000 */ li r4, 0
/* 00000B0C 4BFFF655 */ bl GXLoadNrmMtxImm
/* 00000B10 3C600000 */ lis r3, minigameGma@ha
/* 00000B14 3B830000 */ addi r28, r3, minigameGma@l
/* 00000B18 807C0000 */ lwz r3, 0(r28)
/* 00000B1C 80630008 */ lwz r3, 8(r3)
/* 00000B20 80630018 */ lwz r3, 0x18(r3)
/* 00000B24 4BFFF63D */ bl avdisp_draw_model_culled_sort_translucent
/* 00000B28 4BFFF639 */ bl mathutil_mtxA_from_mtxB
/* 00000B2C C03E1CDC */ lfs f1, 0x1cdc(r30)
/* 00000B30 C05E1CD4 */ lfs f2, 0x1cd4(r30)
/* 00000B34 C07E1CD8 */ lfs f3, 0x1cd8(r30)
/* 00000B38 4BFFF629 */ bl mathutil_mtxA_translate_xyz
/* 00000B3C 7F43D378 */ mr r3, r26
/* 00000B40 4BFFF621 */ bl mathutil_mtxA_rotate_y
/* 00000B44 807B0000 */ lwz r3, 0(r27)
/* 00000B48 38800000 */ li r4, 0
/* 00000B4C 4BFFF615 */ bl GXLoadPosMtxImm
/* 00000B50 807B0000 */ lwz r3, 0(r27)
/* 00000B54 38800000 */ li r4, 0
/* 00000B58 4BFFF609 */ bl GXLoadNrmMtxImm
/* 00000B5C 807C0000 */ lwz r3, 0(r28)
/* 00000B60 80630008 */ lwz r3, 8(r3)
/* 00000B64 80630020 */ lwz r3, 0x20(r3)
/* 00000B68 4BFFF5F9 */ bl avdisp_draw_model_culled_sort_translucent
/* 00000B6C 801F0004 */ lwz r0, 4(r31)
/* 00000B70 540004E7 */ rlwinm. r0, r0, 0, 0x13, 0x13
/* 00000B74 41820108 */ beq lbl_00000C7C
/* 00000B78 3C600000 */ lis r3, polyDisp@ha
/* 00000B7C 80030000 */ lwz r0, polyDisp@l(r3)
/* 00000B80 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00000B84 40820400 */ bne lbl_00000F84
/* 00000B88 3C600000 */ lis r3, cameraInfo@ha
/* 00000B8C C03E1C98 */ lfs f1, 0x1c98(r30)
/* 00000B90 38630000 */ addi r3, r3, cameraInfo@l
/* 00000B94 C0030048 */ lfs f0, 0x48(r3)
/* 00000B98 3C800000 */ lis r4, g_poolInfo@ha
/* 00000B9C 38840000 */ addi r4, r4, g_poolInfo@l
/* 00000BA0 FC000840 */ fcmpo cr0, f0, f1
/* 00000BA4 8084000C */ lwz r4, 0xc(r4)
/* 00000BA8 88840000 */ lbz r4, 0(r4)
/* 00000BAC 408100C8 */ ble lbl_00000C74
/* 00000BB0 C003004C */ lfs f0, 0x4c(r3)
/* 00000BB4 FC000840 */ fcmpo cr0, f0, f1
/* 00000BB8 408100BC */ ble lbl_00000C74
/* 00000BBC 7C800775 */ extsb. r0, r4
/* 00000BC0 418200B4 */ beq lbl_00000C74
/* 00000BC4 7C800774 */ extsb r0, r4
/* 00000BC8 2C000004 */ cmpwi r0, 4
/* 00000BCC 418200A8 */ beq lbl_00000C74
/* 00000BD0 38600000 */ li r3, 0
/* 00000BD4 4BFFF58D */ bl change_current_camera
/* 00000BD8 4BFFF589 */ bl u_draw_ball_shadow
/* 00000BDC 4BFFF585 */ bl background_light_assign
/* 00000BE0 38600000 */ li r3, 0
/* 00000BE4 4BFFF57D */ bl reset_light_group
/* 00000BE8 4BFFF579 */ bl func_8009CD5C
/* 00000BEC 3C600000 */ lis r3, eventInfo@ha
/* 00000BF0 38630000 */ addi r3, r3, eventInfo@l
/* 00000BF4 88030018 */ lbz r0, 0x18(r3)
/* 00000BF8 7C000774 */ extsb r0, r0
/* 00000BFC 2C000002 */ cmpwi r0, 2
/* 00000C00 4182000C */ beq lbl_00000C0C
/* 00000C04 2C000004 */ cmpwi r0, 4
/* 00000C08 40820008 */ bne lbl_00000C10
lbl_00000C0C:
/* 00000C0C 4BFFF555 */ bl stage_draw
lbl_00000C10:
/* 00000C10 3C600000 */ lis r3, eventInfo@ha
/* 00000C14 38630000 */ addi r3, r3, eventInfo@l
/* 00000C18 880301C8 */ lbz r0, 0x1c8(r3)
/* 00000C1C 2C000002 */ cmpwi r0, 2
/* 00000C20 40820018 */ bne lbl_00000C38
/* 00000C24 C03E1CE0 */ lfs f1, 0x1ce0(r30)
/* 00000C28 4BFFF539 */ bl ord_tbl_set_depth_offset
/* 00000C2C 4BFFF535 */ bl background_draw
/* 00000C30 C03E1C98 */ lfs f1, 0x1c98(r30)
/* 00000C34 4BFFF52D */ bl ord_tbl_set_depth_offset
lbl_00000C38:
/* 00000C38 3C600000 */ lis r3, eventInfo@ha
/* 00000C3C 38630000 */ addi r3, r3, eventInfo@l
/* 00000C40 880301E0 */ lbz r0, 0x1e0(r3)
/* 00000C44 3B4301E0 */ addi r26, r3, 0x1e0
/* 00000C48 2C000002 */ cmpwi r0, 2
/* 00000C4C 4082000C */ bne lbl_00000C58
/* 00000C50 38600010 */ li r3, 0x10
/* 00000C54 4BFFF50D */ bl rend_efc_draw
lbl_00000C58:
/* 00000C58 4BFFF509 */ bl draw_test_camera_target
/* 00000C5C 881A0000 */ lbz r0, 0(r26)
/* 00000C60 2C000002 */ cmpwi r0, 2
/* 00000C64 4082000C */ bne lbl_00000C70
/* 00000C68 38600008 */ li r3, 8
/* 00000C6C 4BFFF4F5 */ bl rend_efc_draw
lbl_00000C70:
/* 00000C70 480090A9 */ bl lbl_00009D18
lbl_00000C74:
/* 00000C74 4BFFF4ED */ bl default_camera_env
/* 00000C78 4800030C */ b lbl_00000F84
lbl_00000C7C:
/* 00000C7C 3C600000 */ lis r3, modeCtrl@ha
/* 00000C80 C03E1C98 */ lfs f1, 0x1c98(r30)
/* 00000C84 38630000 */ addi r3, r3, modeCtrl@l
/* 00000C88 8063002C */ lwz r3, 0x2c(r3)
/* 00000C8C 3C800000 */ lis r4, cameraInfo@ha
/* 00000C90 38040000 */ addi r0, r4, cameraInfo@l
/* 00000C94 1C830284 */ mulli r4, r3, 0x284
/* 00000C98 7C802214 */ add r4, r0, r4
/* 00000C9C C0040048 */ lfs f0, 0x48(r4)
/* 00000CA0 FC000840 */ fcmpo cr0, f0, f1
/* 00000CA4 408102E0 */ ble lbl_00000F84
/* 00000CA8 C004004C */ lfs f0, 0x4c(r4)
/* 00000CAC FC000840 */ fcmpo cr0, f0, f1
/* 00000CB0 41810008 */ bgt lbl_00000CB8
/* 00000CB4 480002D0 */ b lbl_00000F84
lbl_00000CB8:
/* 00000CB8 3C800000 */ lis r4, g_poolInfo@ha
/* 00000CBC 38840000 */ addi r4, r4, g_poolInfo@l
/* 00000CC0 8084000C */ lwz r4, 0xc(r4)
/* 00000CC4 7C8418AE */ lbzx r4, r4, r3
/* 00000CC8 7C800775 */ extsb. r0, r4
/* 00000CCC 418202B8 */ beq lbl_00000F84
/* 00000CD0 7C800774 */ extsb r0, r4
/* 00000CD4 2C000004 */ cmpwi r0, 4
/* 00000CD8 418202AC */ beq lbl_00000F84
/* 00000CDC 4BFFF485 */ bl change_current_camera
/* 00000CE0 801F0004 */ lwz r0, 4(r31)
/* 00000CE4 54000463 */ rlwinm. r0, r0, 0, 0x11, 0x11
/* 00000CE8 41820108 */ beq lbl_00000DF0
/* 00000CEC 3C600000 */ lis r3, currentBall@ha
/* 00000CF0 3B830000 */ addi r28, r3, currentBall@l
/* 00000CF4 807C0000 */ lwz r3, 0(r28)
/* 00000CF8 806300FC */ lwz r3, 0xfc(r3)
/* 00000CFC 38630060 */ addi r3, r3, 0x60
/* 00000D00 4BFFF461 */ bl mathutil_mtxA_from_quat
/* 00000D04 38610008 */ addi r3, r1, 8
/* 00000D08 4BFFF459 */ bl mathutil_mtxA_to_mtx
/* 00000D0C 4BFFF455 */ bl mathutil_mtxA_from_mtxB
/* 00000D10 807C0000 */ lwz r3, 0(r28)
/* 00000D14 806300FC */ lwz r3, 0xfc(r3)
/* 00000D18 38630030 */ addi r3, r3, 0x30
/* 00000D1C 4BFFF445 */ bl mathutil_mtxA_translate
/* 00000D20 38610008 */ addi r3, r1, 8
/* 00000D24 4BFFF43D */ bl mathutil_mtxA_mult_right
/* 00000D28 807C0000 */ lwz r3, 0(r28)
/* 00000D2C 806300FC */ lwz r3, 0xfc(r3)
/* 00000D30 80030010 */ lwz r0, 0x10(r3)
/* 00000D34 2C000003 */ cmpwi r0, 3
/* 00000D38 40820040 */ bne lbl_00000D78
/* 00000D3C C03E1C98 */ lfs f1, 0x1c98(r30)
/* 00000D40 C05E1CE4 */ lfs f2, 0x1ce4(r30)
/* 00000D44 FC600890 */ fmr f3, f1
/* 00000D48 4BFFF419 */ bl mathutil_mtxA_translate_xyz
/* 00000D4C 807C0000 */ lwz r3, 0(r28)
/* 00000D50 806300FC */ lwz r3, 0xfc(r3)
/* 00000D54 80630000 */ lwz r3, 0(r3)
/* 00000D58 3C630001 */ addis r3, r3, 1
/* 00000D5C 3863A4F8 */ addi r3, r3, -23304
/* 00000D60 4BFFF401 */ bl mathutil_mtxA_mult_right
/* 00000D64 C03E1CE8 */ lfs f1, 0x1ce8(r30)
/* 00000D68 C05E1CEC */ lfs f2, 0x1cec(r30)
/* 00000D6C C07E1CF0 */ lfs f3, 0x1cf0(r30)
/* 00000D70 4BFFF3F1 */ bl mathutil_mtxA_translate_xyz
/* 00000D74 4800003C */ b lbl_00000DB0
lbl_00000D78:
/* 00000D78 C03E1C98 */ lfs f1, 0x1c98(r30)
/* 00000D7C C05E1CF4 */ lfs f2, 0x1cf4(r30)
/* 00000D80 FC600890 */ fmr f3, f1
/* 00000D84 4BFFF3DD */ bl mathutil_mtxA_translate_xyz
/* 00000D88 807C0000 */ lwz r3, 0(r28)
/* 00000D8C 806300FC */ lwz r3, 0xfc(r3)
/* 00000D90 80630000 */ lwz r3, 0(r3)
/* 00000D94 3C630001 */ addis r3, r3, 1
/* 00000D98 3863A4F8 */ addi r3, r3, -23304
/* 00000D9C 4BFFF3C5 */ bl mathutil_mtxA_mult_right
/* 00000DA0 C03E1CF8 */ lfs f1, 0x1cf8(r30)
/* 00000DA4 C05E1CEC */ lfs f2, 0x1cec(r30)
/* 00000DA8 C07E1CF0 */ lfs f3, 0x1cf0(r30)
/* 00000DAC 4BFFF3B5 */ bl mathutil_mtxA_translate_xyz
lbl_00000DB0:
/* 00000DB0 C03E1CFC */ lfs f1, 0x1cfc(r30)
/* 00000DB4 4BFFF3AD */ bl mathutil_mtxA_scale_s
/* 00000DB8 3C600000 */ lis r3, mathutilData@ha
/* 00000DBC 3B830000 */ addi r28, r3, mathutilData@l
/* 00000DC0 807C0000 */ lwz r3, 0(r28)
/* 00000DC4 38800000 */ li r4, 0
/* 00000DC8 4BFFF399 */ bl GXLoadPosMtxImm
/* 00000DCC 807C0000 */ lwz r3, 0(r28)
/* 00000DD0 38800000 */ li r4, 0
/* 00000DD4 4BFFF38D */ bl GXLoadNrmMtxImm
/* 00000DD8 3C600000 */ lis r3, minigameGma@ha
/* 00000DDC 38630000 */ addi r3, r3, minigameGma@l
/* 00000DE0 80630000 */ lwz r3, 0(r3)
/* 00000DE4 80630008 */ lwz r3, 8(r3)
/* 00000DE8 80630008 */ lwz r3, 8(r3)
/* 00000DEC 4BFFF375 */ bl avdisp_draw_model_culled_sort_translucent
lbl_00000DF0:
/* 00000DF0 801F0004 */ lwz r0, 4(r31)
/* 00000DF4 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00000DF8 41820174 */ beq lbl_00000F6C
/* 00000DFC 4BFFF365 */ bl mathutil_mtxA_from_mtxB
/* 00000E00 3C600000 */ lis r3, currentBall@ha
/* 00000E04 C05E1C98 */ lfs f2, 0x1c98(r30)
/* 00000E08 38630000 */ addi r3, r3, currentBall@l
/* 00000E0C C07E1D00 */ lfs f3, 0x1d00(r30)
/* 00000E10 80630000 */ lwz r3, 0(r3)
/* 00000E14 C0230004 */ lfs f1, 4(r3)
/* 00000E18 4BFFF349 */ bl mathutil_mtxA_translate_xyz
/* 00000E1C C03E1D04 */ lfs f1, 0x1d04(r30)
/* 00000E20 4BFFF341 */ bl mathutil_mtxA_scale_s
/* 00000E24 C03E1D08 */ lfs f1, 0x1d08(r30)
/* 00000E28 C01D0168 */ lfs f0, 0x168(r29)
/* 00000E2C EC010032 */ fmuls f0, f1, f0
/* 00000E30 FC00001E */ fctiwz f0, f0
/* 00000E34 D8010038 */ stfd f0, 0x38(r1)
/* 00000E38 8061003C */ lwz r3, 0x3c(r1)
/* 00000E3C 4BFFF325 */ bl mathutil_mtxA_rotate_y
/* 00000E40 3C600000 */ lis r3, mathutilData@ha
/* 00000E44 3BE30000 */ addi r31, r3, mathutilData@l
/* 00000E48 807F0000 */ lwz r3, 0(r31)
/* 00000E4C 38800000 */ li r4, 0
/* 00000E50 4BFFF311 */ bl GXLoadPosMtxImm
/* 00000E54 807F0000 */ lwz r3, 0(r31)
/* 00000E58 38800000 */ li r4, 0
/* 00000E5C 4BFFF305 */ bl GXLoadNrmMtxImm
/* 00000E60 3C600000 */ lis r3, commonGma@ha
/* 00000E64 3B830000 */ addi r28, r3, commonGma@l
/* 00000E68 807C0000 */ lwz r3, 0(r28)
/* 00000E6C 80630008 */ lwz r3, 8(r3)
/* 00000E70 806305A8 */ lwz r3, 0x5a8(r3)
/* 00000E74 4BFFF2ED */ bl avdisp_draw_model_culled_sort_translucent
/* 00000E78 3C600000 */ lis r3, globalAnimTimer@ha
/* 00000E7C C03E1C98 */ lfs f1, 0x1c98(r30)
/* 00000E80 80030000 */ lwz r0, globalAnimTimer@l(r3)
/* 00000E84 3C600000 */ lis r3, lbl_00010D60@ha
/* 00000E88 3FA04330 */ lis r29, 0x4330
/* 00000E8C C8630000 */ lfd f3, lbl_00010D60@l(r3)
/* 00000E90 5400073E */ clrlwi r0, r0, 0x1c
/* 00000E94 90010044 */ stw r0, 0x44(r1)
/* 00000E98 FC400890 */ fmr f2, f1
/* 00000E9C C89E1D18 */ lfd f4, 0x1d18(r30)
/* 00000EA0 93A10040 */ stw r29, 0x40(r1)
/* 00000EA4 C8BE1D10 */ lfd f5, 0x1d10(r30)
/* 00000EA8 C8010040 */ lfd f0, 0x40(r1)
/* 00000EAC FC001828 */ fsub f0, f0, f3
/* 00000EB0 FC040032 */ fmul f0, f4, f0
/* 00000EB4 FC650028 */ fsub f3, f5, f0
/* 00000EB8 FC601818 */ frsp f3, f3
/* 00000EBC 4BFFF2A5 */ bl mathutil_mtxA_translate_xyz
/* 00000EC0 807F0000 */ lwz r3, 0(r31)
/* 00000EC4 38800000 */ li r4, 0
/* 00000EC8 4BFFF299 */ bl GXLoadPosMtxImm
/* 00000ECC 807F0000 */ lwz r3, 0(r31)
/* 00000ED0 38800000 */ li r4, 0
/* 00000ED4 4BFFF28D */ bl GXLoadNrmMtxImm
/* 00000ED8 C03E1C9C */ lfs f1, 0x1c9c(r30)
/* 00000EDC 4BFFF285 */ bl avdisp_set_alpha
/* 00000EE0 807C0000 */ lwz r3, 0(r28)
/* 00000EE4 80630008 */ lwz r3, 8(r3)
/* 00000EE8 806305F8 */ lwz r3, 0x5f8(r3)
/* 00000EEC 4BFFF275 */ bl avdisp_draw_model_culled_sort_translucent
/* 00000EF0 3B400001 */ li r26, 1
lbl_00000EF4:
/* 00000EF4 C03E1C98 */ lfs f1, 0x1c98(r30)
/* 00000EF8 C07E1D20 */ lfs f3, 0x1d20(r30)
/* 00000EFC FC400890 */ fmr f2, f1
/* 00000F00 4BFFF261 */ bl mathutil_mtxA_translate_xyz
/* 00000F04 807F0000 */ lwz r3, 0(r31)
/* 00000F08 38800000 */ li r4, 0
/* 00000F0C 4BFFF255 */ bl GXLoadPosMtxImm
/* 00000F10 807F0000 */ lwz r3, 0(r31)
/* 00000F14 38800000 */ li r4, 0
/* 00000F18 4BFFF249 */ bl GXLoadNrmMtxImm
/* 00000F1C 6F408000 */ xoris r0, r26, 0x8000
/* 00000F20 C85E1D30 */ lfd f2, 0x1d30(r30)
/* 00000F24 9001003C */ stw r0, 0x3c(r1)
/* 00000F28 3C600000 */ lis r3, lbl_00010D58@ha
/* 00000F2C C8230000 */ lfd f1, lbl_00010D58@l(r3)
/* 00000F30 93A10038 */ stw r29, 0x38(r1)
/* 00000F34 C87E1D28 */ lfd f3, 0x1d28(r30)
/* 00000F38 C8010038 */ lfd f0, 0x38(r1)
/* 00000F3C FC000828 */ fsub f0, f0, f1
/* 00000F40 FC020032 */ fmul f0, f2, f0
/* 00000F44 FC230028 */ fsub f1, f3, f0
/* 00000F48 FC200818 */ frsp f1, f1
/* 00000F4C 4BFFF215 */ bl avdisp_set_alpha
/* 00000F50 807C0000 */ lwz r3, 0(r28)
/* 00000F54 80630008 */ lwz r3, 8(r3)
/* 00000F58 806305F8 */ lwz r3, 0x5f8(r3)
/* 00000F5C 4BFFF205 */ bl avdisp_draw_model_culled_sort_translucent
/* 00000F60 3B5A0001 */ addi r26, r26, 1
/* 00000F64 2C1A0014 */ cmpwi r26, 0x14
/* 00000F68 4180FF8C */ blt lbl_00000EF4
lbl_00000F6C:
/* 00000F6C 48009B41 */ bl lbl_0000AAAC
/* 00000F70 3C600000 */ lis r3, polyDisp@ha
/* 00000F74 80030000 */ lwz r0, polyDisp@l(r3)
/* 00000F78 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00000F7C 40820008 */ bne lbl_00000F84
/* 00000F80 4BFFF1E1 */ bl draw_normal_game_scene
lbl_00000F84:
/* 00000F84 BB410048 */ lmw r26, 0x48(r1)
/* 00000F88 80010064 */ lwz r0, 0x64(r1)
/* 00000F8C 38210060 */ addi r1, r1, 0x60
/* 00000F90 7C0803A6 */ mtlr r0
/* 00000F94 4E800020 */ blr 
