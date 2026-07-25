/* 0000ABE8 7C0802A6 */ mflr r0
/* 0000ABEC 3C600000 */ lis r3, currentBall@ha
/* 0000ABF0 90010004 */ stw r0, 4(r1)
/* 0000ABF4 3CA00000 */ lis r5, cameraInfo@ha
/* 0000ABF8 3C800000 */ lis r4, ballInfo@ha
/* 0000ABFC 9421FFD0 */ stwu r1, -0x30(r1)
/* 0000AC00 BEC10008 */ stmw r22, 8(r1)
/* 0000AC04 3BA30000 */ addi r29, r3, currentBall@l
/* 0000AC08 3C600000 */ lis r3, eventInfo@ha
/* 0000AC0C 3BE30000 */ addi r31, r3, eventInfo@l
/* 0000AC10 3B650000 */ addi r27, r5, cameraInfo@l
/* 0000AC14 3B440000 */ addi r26, r4, ballInfo@l
/* 0000AC18 3CA00000 */ lis r5, lbl_0001C238@ha
/* 0000AC1C 3C600000 */ lis r3, backgroundInfo@ha
/* 0000AC20 3C800000 */ lis r4, g_poolInfo@ha
/* 0000AC24 3B850000 */ addi r28, r5, lbl_0001C238@l
/* 0000AC28 3B3F01E0 */ addi r25, r31, 0x1e0
/* 0000AC2C 3AC30000 */ addi r22, r3, backgroundInfo@l
/* 0000AC30 3BC40000 */ addi r30, r4, g_poolInfo@l
/* 0000AC34 82FD0000 */ lwz r23, 0(r29)
/* 0000AC38 3B000000 */ li r24, 0
lbl_0000AC3C:
/* 0000AC3C C01B0048 */ lfs f0, 0x48(r27)
/* 0000AC40 C03C000C */ lfs f1, 0xc(r28)
/* 0000AC44 FC000840 */ fcmpo cr0, f0, f1
/* 0000AC48 40810120 */ ble lbl_0000AD68
/* 0000AC4C C01B004C */ lfs f0, 0x4c(r27)
/* 0000AC50 FC000840 */ fcmpo cr0, f0, f1
/* 0000AC54 40810114 */ ble lbl_0000AD68
/* 0000AC58 807E000C */ lwz r3, 0xc(r30)
/* 0000AC5C 7C63C0AE */ lbzx r3, r3, r24
/* 0000AC60 7C600775 */ extsb. r0, r3
/* 0000AC64 41820104 */ beq lbl_0000AD68
/* 0000AC68 7C600774 */ extsb r0, r3
/* 0000AC6C 2C000004 */ cmpwi r0, 4
/* 0000AC70 418200F8 */ beq lbl_0000AD68
/* 0000AC74 935D0000 */ stw r26, 0(r29)
/* 0000AC78 7F03C378 */ mr r3, r24
/* 0000AC7C 4BFF54E9 */ bl change_current_camera
/* 0000AC80 4BFF54E5 */ bl u_draw_ball_shadow
/* 0000AC84 4BFF54E1 */ bl background_light_assign
/* 0000AC88 88190000 */ lbz r0, 0(r25)
/* 0000AC8C 2C000002 */ cmpwi r0, 2
/* 0000AC90 4082000C */ bne lbl_0000AC9C
/* 0000AC94 38600004 */ li r3, 4
/* 0000AC98 4BFF54CD */ bl rend_efc_draw
lbl_0000AC9C:
/* 0000AC9C 4BFF54C9 */ bl draw_monkey
/* 0000ACA0 881F0018 */ lbz r0, 0x18(r31)
/* 0000ACA4 7C000774 */ extsb r0, r0
/* 0000ACA8 2C000002 */ cmpwi r0, 2
/* 0000ACAC 4182000C */ beq lbl_0000ACB8
/* 0000ACB0 2C000004 */ cmpwi r0, 4
/* 0000ACB4 40820008 */ bne lbl_0000ACBC
lbl_0000ACB8:
/* 0000ACB8 4BFF54AD */ bl stage_draw
lbl_0000ACBC:
/* 0000ACBC 88190000 */ lbz r0, 0(r25)
/* 0000ACC0 2C000002 */ cmpwi r0, 2
/* 0000ACC4 4082000C */ bne lbl_0000ACD0
/* 0000ACC8 38600010 */ li r3, 0x10
/* 0000ACCC 4BFF5499 */ bl rend_efc_draw
lbl_0000ACD0:
/* 0000ACD0 4BFF5495 */ bl poly_shadow_draw
/* 0000ACD4 881F01C8 */ lbz r0, 0x1c8(r31)
/* 0000ACD8 2C000002 */ cmpwi r0, 2
/* 0000ACDC 40820018 */ bne lbl_0000ACF4
/* 0000ACE0 C03C0024 */ lfs f1, 0x24(r28)
/* 0000ACE4 4BFF5481 */ bl ord_tbl_set_depth_offset
/* 0000ACE8 4BFF547D */ bl background_draw
/* 0000ACEC C03C000C */ lfs f1, 0xc(r28)
/* 0000ACF0 4BFF5475 */ bl ord_tbl_set_depth_offset
lbl_0000ACF4:
/* 0000ACF4 881F0078 */ lbz r0, 0x78(r31)
/* 0000ACF8 2C000002 */ cmpwi r0, 2
/* 0000ACFC 40820008 */ bne lbl_0000AD04
/* 0000AD00 4BFF5465 */ bl item_draw
lbl_0000AD04:
/* 0000AD04 881F0060 */ lbz r0, 0x60(r31)
/* 0000AD08 2C000002 */ cmpwi r0, 2
/* 0000AD0C 40820008 */ bne lbl_0000AD14
/* 0000AD10 4BFF5455 */ bl stobj_draw
lbl_0000AD14:
/* 0000AD14 881F0138 */ lbz r0, 0x138(r31)
/* 0000AD18 2C000002 */ cmpwi r0, 2
/* 0000AD1C 40820008 */ bne lbl_0000AD24
/* 0000AD20 4BFF5445 */ bl effect_draw
lbl_0000AD24:
/* 0000AD24 881F0048 */ lbz r0, 0x48(r31)
/* 0000AD28 2C000002 */ cmpwi r0, 2
/* 0000AD2C 40820008 */ bne lbl_0000AD34
/* 0000AD30 4BFF5435 */ bl ball_draw
lbl_0000AD34:
/* 0000AD34 480025C5 */ bl lbl_0000D2F8
/* 0000AD38 48003CD9 */ bl lbl_0000EA10
/* 0000AD3C 4BFF5429 */ bl ord_tbl_draw_nodes
/* 0000AD40 80160008 */ lwz r0, 8(r22)
/* 0000AD44 540007FF */ clrlwi. r0, r0, 0x1f
/* 0000AD48 4182000C */ beq lbl_0000AD54
/* 0000AD4C 7F03C378 */ mr r3, r24
/* 0000AD50 4BFF5415 */ bl lens_flare_draw
lbl_0000AD54:
/* 0000AD54 88190000 */ lbz r0, 0(r25)
/* 0000AD58 2C000002 */ cmpwi r0, 2
/* 0000AD5C 4082000C */ bne lbl_0000AD68
/* 0000AD60 38600008 */ li r3, 8
/* 0000AD64 4BFF5401 */ bl rend_efc_draw
lbl_0000AD68:
/* 0000AD68 3B180001 */ addi r24, r24, 1
/* 0000AD6C 2C180004 */ cmpwi r24, 4
/* 0000AD70 3B7B0284 */ addi r27, r27, 0x284
/* 0000AD74 3B5A01A4 */ addi r26, r26, 0x1a4
/* 0000AD78 4180FEC4 */ blt lbl_0000AC3C
/* 0000AD7C 3C600000 */ lis r3, currentBall@ha
/* 0000AD80 92E30000 */ stw r23, currentBall@l(r3)
/* 0000AD84 4BFF53E1 */ bl default_camera_env
/* 0000AD88 BAC10008 */ lmw r22, 8(r1)
/* 0000AD8C 80010034 */ lwz r0, 0x34(r1)
/* 0000AD90 38210030 */ addi r1, r1, 0x30
/* 0000AD94 7C0803A6 */ mtlr r0
/* 0000AD98 4E800020 */ blr 
