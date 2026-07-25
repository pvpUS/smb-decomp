/* 00003BDC 7C0802A6 */ mflr r0
/* 00003BE0 3C600000 */ lis r3, currentBall@ha
/* 00003BE4 90010004 */ stw r0, 4(r1)
/* 00003BE8 3C800000 */ lis r4, lbl_1000003C@ha
/* 00003BEC 3CC00000 */ lis r6, lbl_10000038@ha
/* 00003BF0 9421FF68 */ stwu r1, -0x98(r1)
/* 00003BF4 3D400000 */ lis r10, ballInfo@ha
/* 00003BF8 3D200000 */ lis r9, eventInfo@ha
/* 00003BFC BDE10054 */ stmw r15, 0x54(r1)
/* 00003C00 3AA30000 */ addi r21, r3, currentBall@l
/* 00003C04 3DE00000 */ lis r15, lbl_0000BE80@ha
/* 00003C08 3C600000 */ lis r3, globalAnimTimer@ha
/* 00003C0C 3D000000 */ lis r8, currentCamera@ha
/* 00003C10 3CE00000 */ lis r7, lbl_802F1FF6@ha
/* 00003C14 3CA00000 */ lis r5, backgroundInfo@ha
/* 00003C18 3D800000 */ lis r12, cameraInfo@ha
/* 00003C1C 3D600000 */ lis r11, g_poolInfo@ha
/* 00003C20 3A8F0000 */ addi r20, r15, lbl_0000BE80@l
/* 00003C24 3BC40000 */ addi r30, r4, lbl_1000003C@l
/* 00003C28 3A610018 */ addi r19, r1, 0x18
/* 00003C2C 3BE30000 */ addi r31, r3, globalAnimTimer@l
/* 00003C30 3B860000 */ addi r28, r6, lbl_10000038@l
/* 00003C34 3B0A0000 */ addi r24, r10, ballInfo@l
/* 00003C38 3B290000 */ addi r25, r9, eventInfo@l
/* 00003C3C 3B480000 */ addi r26, r8, currentCamera@l
/* 00003C40 3B670000 */ addi r27, r7, lbl_802F1FF6@l
/* 00003C44 3BA50000 */ addi r29, r5, backgroundInfo@l
/* 00003C48 3ACC0000 */ addi r22, r12, cameraInfo@l
/* 00003C4C 82350000 */ lwz r17, 0(r21)
/* 00003C50 3AEB0000 */ addi r23, r11, g_poolInfo@l
/* 00003C54 3A400000 */ li r18, 0
/* 00003C58 3A000000 */ li r16, 0
/* 00003C5C 39E00000 */ li r15, 0
lbl_00003C60:
/* 00003C60 7C767A14 */ add r3, r22, r15
/* 00003C64 C0340030 */ lfs f1, 0x30(r20)
/* 00003C68 C0030048 */ lfs f0, 0x48(r3)
/* 00003C6C FC000840 */ fcmpo cr0, f0, f1
/* 00003C70 40810380 */ ble lbl_00003FF0
/* 00003C74 C003004C */ lfs f0, 0x4c(r3)
/* 00003C78 FC000840 */ fcmpo cr0, f0, f1
/* 00003C7C 40810374 */ ble lbl_00003FF0
/* 00003C80 8077000C */ lwz r3, 0xc(r23)
/* 00003C84 7C6390AE */ lbzx r3, r3, r18
/* 00003C88 7C600775 */ extsb. r0, r3
/* 00003C8C 41820364 */ beq lbl_00003FF0
/* 00003C90 7C600774 */ extsb r0, r3
/* 00003C94 2C000004 */ cmpwi r0, 4
/* 00003C98 41820358 */ beq lbl_00003FF0
/* 00003C9C 7C188214 */ add r0, r24, r16
/* 00003CA0 90150000 */ stw r0, 0(r21)
/* 00003CA4 7E439378 */ mr r3, r18
/* 00003CA8 4BFFC4A5 */ bl change_current_camera
/* 00003CAC 4BFFC4A1 */ bl u_draw_ball_shadow
/* 00003CB0 4BFFC49D */ bl background_light_assign
/* 00003CB4 7E439378 */ mr r3, r18
/* 00003CB8 4BFFC495 */ bl reset_light_group
/* 00003CBC 881901E0 */ lbz r0, 0x1e0(r25)
/* 00003CC0 2C000002 */ cmpwi r0, 2
/* 00003CC4 4082000C */ bne lbl_00003CD0
/* 00003CC8 38600004 */ li r3, 4
/* 00003CCC 4BFFC481 */ bl rend_efc_draw
lbl_00003CD0:
/* 00003CD0 807A0000 */ lwz r3, 0(r26)
/* 00003CD4 C0140030 */ lfs f0, 0x30(r20)
/* 00003CD8 C0230004 */ lfs f1, 4(r3)
/* 00003CDC FC010040 */ fcmpo cr0, f1, f0
/* 00003CE0 4080002C */ bge lbl_00003D0C
/* 00003CE4 C03401C0 */ lfs f1, 0x1c0(r20)
/* 00003CE8 38600002 */ li r3, 2
/* 00003CEC C05401C4 */ lfs f2, 0x1c4(r20)
/* 00003CF0 4BFFC45D */ bl avdisp_set_fog_params
/* 00003CF4 38600000 */ li r3, 0
/* 00003CF8 38800064 */ li r4, 0x64
/* 00003CFC 38A00096 */ li r5, 0x96
/* 00003D00 4BFFC44D */ bl avdisp_set_fog_color
/* 00003D04 38600001 */ li r3, 1
/* 00003D08 4BFFC445 */ bl u_gxutil_set_fog_enabled
lbl_00003D0C:
/* 00003D0C 88790018 */ lbz r3, 0x18(r25)
/* 00003D10 7C600774 */ extsb r0, r3
/* 00003D14 2C000002 */ cmpwi r0, 2
/* 00003D18 4182000C */ beq lbl_00003D24
/* 00003D1C 2C000004 */ cmpwi r0, 4
/* 00003D20 40820008 */ bne lbl_00003D28
lbl_00003D24:
/* 00003D24 4BFFC429 */ bl stage_draw
lbl_00003D28:
/* 00003D28 4BFFC425 */ bl poly_shadow_draw
/* 00003D2C 881901C8 */ lbz r0, 0x1c8(r25)
/* 00003D30 2C000002 */ cmpwi r0, 2
/* 00003D34 40820018 */ bne lbl_00003D4C
/* 00003D38 C03401C8 */ lfs f1, 0x1c8(r20)
/* 00003D3C 4BFFC411 */ bl ord_tbl_set_depth_offset
/* 00003D40 4BFFC40D */ bl background_draw
/* 00003D44 C0340030 */ lfs f1, 0x30(r20)
/* 00003D48 4BFFC405 */ bl ord_tbl_set_depth_offset
lbl_00003D4C:
/* 00003D4C A81B0000 */ lha r0, 0(r27)
/* 00003D50 2C00001A */ cmpwi r0, 0x1a
/* 00003D54 4182002C */ beq lbl_00003D80
/* 00003D58 40800010 */ bge lbl_00003D68
/* 00003D5C 2C000018 */ cmpwi r0, 0x18
/* 00003D60 41820020 */ beq lbl_00003D80
/* 00003D64 4800000C */ b lbl_00003D70
lbl_00003D68:
/* 00003D68 2C00001C */ cmpwi r0, 0x1c
/* 00003D6C 41820014 */ beq lbl_00003D80
lbl_00003D70:
/* 00003D70 480006E1 */ bl lbl_00004450
/* 00003D74 480007FD */ bl lbl_00004570
/* 00003D78 480002AD */ bl lbl_00004024
/* 00003D7C 48000B45 */ bl lbl_000048C0
lbl_00003D80:
/* 00003D80 4BFFC3CD */ bl draw_monkey
/* 00003D84 881901E0 */ lbz r0, 0x1e0(r25)
/* 00003D88 2C000002 */ cmpwi r0, 2
/* 00003D8C 4082000C */ bne lbl_00003D98
/* 00003D90 38600010 */ li r3, 0x10
/* 00003D94 4BFFC3B9 */ bl rend_efc_draw
lbl_00003D98:
/* 00003D98 88190078 */ lbz r0, 0x78(r25)
/* 00003D9C 2C000002 */ cmpwi r0, 2
/* 00003DA0 40820008 */ bne lbl_00003DA8
/* 00003DA4 4BFFC3A9 */ bl item_draw
lbl_00003DA8:
/* 00003DA8 88190048 */ lbz r0, 0x48(r25)
/* 00003DAC 2C000002 */ cmpwi r0, 2
/* 00003DB0 408200B0 */ bne lbl_00003E60
/* 00003DB4 4BFFC399 */ bl ball_draw
/* 00003DB8 80750000 */ lwz r3, 0(r21)
/* 00003DBC C0140030 */ lfs f0, 0x30(r20)
/* 00003DC0 C0230008 */ lfs f1, 8(r3)
/* 00003DC4 FC010040 */ fcmpo cr0, f1, f0
/* 00003DC8 40800098 */ bge lbl_00003E60
/* 00003DCC 4BFFC381 */ bl mathutil_mtxA_push
/* 00003DD0 80750000 */ lwz r3, 0(r21)
/* 00003DD4 806300FC */ lwz r3, 0xfc(r3)
/* 00003DD8 38630060 */ addi r3, r3, 0x60
/* 00003DDC 4BFFC371 */ bl mathutil_mtxA_from_quat
/* 00003DE0 80750000 */ lwz r3, 0(r21)
/* 00003DE4 806300FC */ lwz r3, 0xfc(r3)
/* 00003DE8 80630000 */ lwz r3, 0(r3)
/* 00003DEC 3C630001 */ addis r3, r3, 1
/* 00003DF0 38638EC8 */ addi r3, r3, -28984
/* 00003DF4 4BFFC359 */ bl mathutil_mtxA_mult_right
/* 00003DF8 C03401CC */ lfs f1, 0x1cc(r20)
/* 00003DFC 38610040 */ addi r3, r1, 0x40
/* 00003E00 C0540030 */ lfs f2, 0x30(r20)
/* 00003E04 C07401D0 */ lfs f3, 0x1d0(r20)
/* 00003E08 4BFFC345 */ bl mathutil_mtxA_tf_point_xyz
/* 00003E0C 80950000 */ lwz r4, 0(r21)
/* 00003E10 38610040 */ addi r3, r1, 0x40
/* 00003E14 C0210040 */ lfs f1, 0x40(r1)
/* 00003E18 C0040004 */ lfs f0, 4(r4)
/* 00003E1C EC01002A */ fadds f0, f1, f0
/* 00003E20 D0010040 */ stfs f0, 0x40(r1)
/* 00003E24 80950000 */ lwz r4, 0(r21)
/* 00003E28 C0210044 */ lfs f1, 0x44(r1)
/* 00003E2C C0040008 */ lfs f0, 8(r4)
/* 00003E30 EC01002A */ fadds f0, f1, f0
/* 00003E34 D0010044 */ stfs f0, 0x44(r1)
/* 00003E38 80950000 */ lwz r4, 0(r21)
/* 00003E3C C0210048 */ lfs f1, 0x48(r1)
/* 00003E40 C004000C */ lfs f0, 0xc(r4)
/* 00003E44 EC01002A */ fadds f0, f1, f0
/* 00003E48 D0010048 */ stfs f0, 0x48(r1)
/* 00003E4C 80950000 */ lwz r4, 0(r21)
/* 00003E50 80BC0000 */ lwz r5, 0(r28)
/* 00003E54 3884001C */ addi r4, r4, 0x1c
/* 00003E58 480072D9 */ bl lbl_0000B130
/* 00003E5C 4BFFC2F1 */ bl mathutil_mtxA_pop
lbl_00003E60:
/* 00003E60 88190060 */ lbz r0, 0x60(r25)
/* 00003E64 2C000002 */ cmpwi r0, 2
/* 00003E68 40820008 */ bne lbl_00003E70
/* 00003E6C 4BFFC2E1 */ bl stobj_draw
lbl_00003E70:
/* 00003E70 88190138 */ lbz r0, 0x138(r25)
/* 00003E74 2C000002 */ cmpwi r0, 2
/* 00003E78 40820008 */ bne lbl_00003E80
/* 00003E7C 4BFFC2D1 */ bl effect_draw
lbl_00003E80:
/* 00003E80 801D0008 */ lwz r0, 8(r29)
/* 00003E84 540007FF */ clrlwi. r0, r0, 0x1f
/* 00003E88 4182000C */ beq lbl_00003E94
/* 00003E8C 7E439378 */ mr r3, r18
/* 00003E90 4BFFC2BD */ bl lens_flare_draw_mask
lbl_00003E94:
/* 00003E94 4BFFC2B9 */ bl draw_test_camera_target
/* 00003E98 4BFFC2B5 */ bl ord_tbl_draw_nodes
/* 00003E9C 88190048 */ lbz r0, 0x48(r25)
/* 00003EA0 2C000002 */ cmpwi r0, 2
/* 00003EA4 40820120 */ bne lbl_00003FC4
/* 00003EA8 80750000 */ lwz r3, 0(r21)
/* 00003EAC C01401D4 */ lfs f0, 0x1d4(r20)
/* 00003EB0 C0230008 */ lfs f1, 8(r3)
/* 00003EB4 FC010040 */ fcmpo cr0, f1, f0
/* 00003EB8 4080010C */ bge lbl_00003FC4
/* 00003EBC C0140030 */ lfs f0, 0x30(r20)
/* 00003EC0 FC010040 */ fcmpo cr0, f1, f0
/* 00003EC4 40810100 */ ble lbl_00003FC4
/* 00003EC8 3863001C */ addi r3, r3, 0x1c
/* 00003ECC C0230000 */ lfs f1, 0(r3)
/* 00003ED0 C0430004 */ lfs f2, 4(r3)
/* 00003ED4 C0030008 */ lfs f0, 8(r3)
/* 00003ED8 EC210072 */ fmuls f1, f1, f1
/* 00003EDC EC2208BA */ fmadds f1, f2, f2, f1
/* 00003EE0 EC20083A */ fmadds f1, f0, f0, f1
/* 00003EE4 4BFFC269 */ bl mathutil_sqrt
/* 00003EE8 C81401D8 */ lfd f0, 0x1d8(r20)
/* 00003EEC FC010040 */ fcmpo cr0, f1, f0
/* 00003EF0 408100D4 */ ble lbl_00003FC4
/* 00003EF4 80750000 */ lwz r3, 0(r21)
/* 00003EF8 38810024 */ addi r4, r1, 0x24
/* 00003EFC 38A00000 */ li r5, 0
/* 00003F00 38630004 */ addi r3, r3, 4
/* 00003F04 4BFFC249 */ bl raycast_stage_down
/* 00003F08 28030000 */ cmplwi r3, 0
/* 00003F0C 408200B8 */ bne lbl_00003FC4
/* 00003F10 80750000 */ lwz r3, 0(r21)
/* 00003F14 C0030004 */ lfs f0, 4(r3)
/* 00003F18 D0010018 */ stfs f0, 0x18(r1)
/* 00003F1C C0140030 */ lfs f0, 0x30(r20)
/* 00003F20 D001001C */ stfs f0, 0x1c(r1)
/* 00003F24 4BFFC229 */ bl mathutil_mtxA_push
/* 00003F28 80950000 */ lwz r4, 0(r21)
/* 00003F2C 38610018 */ addi r3, r1, 0x18
/* 00003F30 C004000C */ lfs f0, 0xc(r4)
/* 00003F34 D0010020 */ stfs f0, 0x20(r1)
/* 00003F38 80950000 */ lwz r4, 0(r21)
/* 00003F3C 80BE0000 */ lwz r5, 0(r30)
/* 00003F40 3884001C */ addi r4, r4, 0x1c
/* 00003F44 480076E1 */ bl lbl_0000B624
/* 00003F48 80950000 */ lwz r4, 0(r21)
/* 00003F4C 38610008 */ addi r3, r1, 8
/* 00003F50 80A400FC */ lwz r5, 0xfc(r4)
/* 00003F54 80850060 */ lwz r4, 0x60(r5)
/* 00003F58 80050064 */ lwz r0, 0x64(r5)
/* 00003F5C 90810008 */ stw r4, 8(r1)
/* 00003F60 9001000C */ stw r0, 0xc(r1)
/* 00003F64 80850068 */ lwz r4, 0x68(r5)
/* 00003F68 8005006C */ lwz r0, 0x6c(r5)
/* 00003F6C 90810010 */ stw r4, 0x10(r1)
/* 00003F70 90010014 */ stw r0, 0x14(r1)
/* 00003F74 C0140030 */ lfs f0, 0x30(r20)
/* 00003F78 D0010008 */ stfs f0, 8(r1)
/* 00003F7C C0140030 */ lfs f0, 0x30(r20)
/* 00003F80 D0010010 */ stfs f0, 0x10(r1)
/* 00003F84 4BFFC1C9 */ bl mathutil_quat_normalize
/* 00003F88 38610008 */ addi r3, r1, 8
/* 00003F8C 4BFFC1C1 */ bl mathutil_mtxA_from_quat
/* 00003F90 C0410018 */ lfs f2, 0x18(r1)
/* 00003F94 C021001C */ lfs f1, 0x1c(r1)
/* 00003F98 C0010020 */ lfs f0, 0x20(r1)
/* 00003F9C 3C60E000 */ lis r3, 0xe000
/* 00003FA0 D043000C */ stfs f2, 0xc(r3)
/* 00003FA4 D023001C */ stfs f1, 0x1c(r3)
/* 00003FA8 D003002C */ stfs f0, 0x2c(r3)
/* 00003FAC 7E639B78 */ mr r3, r19
/* 00003FB0 80950000 */ lwz r4, 0(r21)
/* 00003FB4 80BF0000 */ lwz r5, 0(r31)
/* 00003FB8 3884001C */ addi r4, r4, 0x1c
/* 00003FBC 48007B11 */ bl lbl_0000BACC
/* 00003FC0 4BFFC18D */ bl mathutil_mtxA_pop
lbl_00003FC4:
/* 00003FC4 4BFFC189 */ bl u_gxutil_fog_something_2
/* 00003FC8 801D0008 */ lwz r0, 8(r29)
/* 00003FCC 540007FF */ clrlwi. r0, r0, 0x1f
/* 00003FD0 4182000C */ beq lbl_00003FDC
/* 00003FD4 7E439378 */ mr r3, r18
/* 00003FD8 4BFFC175 */ bl lens_flare_draw
lbl_00003FDC:
/* 00003FDC 881901E0 */ lbz r0, 0x1e0(r25)
/* 00003FE0 2C000002 */ cmpwi r0, 2
/* 00003FE4 4082000C */ bne lbl_00003FF0
/* 00003FE8 38600008 */ li r3, 8
/* 00003FEC 4BFFC161 */ bl rend_efc_draw
lbl_00003FF0:
/* 00003FF0 3A520001 */ addi r18, r18, 1
/* 00003FF4 2C120004 */ cmpwi r18, 4
/* 00003FF8 3A1001A4 */ addi r16, r16, 0x1a4
/* 00003FFC 39EF0284 */ addi r15, r15, 0x284
/* 00004000 4180FC60 */ blt lbl_00003C60
/* 00004004 3C600000 */ lis r3, currentBall@ha
/* 00004008 92230000 */ stw r17, currentBall@l(r3)
/* 0000400C 4BFFC141 */ bl default_camera_env
/* 00004010 B9E10054 */ lmw r15, 0x54(r1)
/* 00004014 8001009C */ lwz r0, 0x9c(r1)
/* 00004018 38210098 */ addi r1, r1, 0x98
/* 0000401C 7C0803A6 */ mtlr r0
/* 00004020 4E800020 */ blr 
