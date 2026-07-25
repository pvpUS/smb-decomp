/* 0000A9EC 7C0802A6 */ mflr r0
/* 0000A9F0 3C600000 */ lis r3, currentBall@ha
/* 0000A9F4 90010004 */ stw r0, 4(r1)
/* 0000A9F8 3CA00000 */ lis r5, cameraInfo@ha
/* 0000A9FC 3C800000 */ lis r4, ballInfo@ha
/* 0000AA00 9421FFC0 */ stwu r1, -0x40(r1)
/* 0000AA04 3CE00000 */ lis r7, lbl_00013BD0@ha
/* 0000AA08 3CC00000 */ lis r6, g_poolInfo@ha
/* 0000AA0C BE61000C */ stmw r19, 0xc(r1)
/* 0000AA10 3B630000 */ addi r27, r3, currentBall@l
/* 0000AA14 3C600000 */ lis r3, eventInfo@ha
/* 0000AA18 3BC30000 */ addi r30, r3, eventInfo@l
/* 0000AA1C 3B250000 */ addi r25, r5, cameraInfo@l
/* 0000AA20 3B040000 */ addi r24, r4, ballInfo@l
/* 0000AA24 3C800000 */ lis r4, decodedStageLzPtr@ha
/* 0000AA28 3C600000 */ lis r3, backgroundInfo@ha
/* 0000AA2C 3CA00000 */ lis r5, modeCtrl@ha
/* 0000AA30 3B470000 */ addi r26, r7, lbl_00013BD0@l
/* 0000AA34 3ADE01E0 */ addi r22, r30, 0x1e0
/* 0000AA38 3BE40000 */ addi r31, r4, decodedStageLzPtr@l
/* 0000AA3C 3A630000 */ addi r19, r3, backgroundInfo@l
/* 0000AA40 3B860000 */ addi r28, r6, g_poolInfo@l
/* 0000AA44 3BA50000 */ addi r29, r5, modeCtrl@l
/* 0000AA48 3AA00000 */ li r21, 0
/* 0000AA4C 829B0000 */ lwz r20, 0(r27)
lbl_0000AA50:
/* 0000AA50 C0190048 */ lfs f0, 0x48(r25)
/* 0000AA54 C03A0000 */ lfs f1, 0(r26)
/* 0000AA58 FC000840 */ fcmpo cr0, f0, f1
/* 0000AA5C 408101A0 */ ble lbl_0000ABFC
/* 0000AA60 C019004C */ lfs f0, 0x4c(r25)
/* 0000AA64 FC000840 */ fcmpo cr0, f0, f1
/* 0000AA68 40810194 */ ble lbl_0000ABFC
/* 0000AA6C 807C000C */ lwz r3, 0xc(r28)
/* 0000AA70 7C63A8AE */ lbzx r3, r3, r21
/* 0000AA74 7C600775 */ extsb. r0, r3
/* 0000AA78 41820184 */ beq lbl_0000ABFC
/* 0000AA7C 7C600774 */ extsb r0, r3
/* 0000AA80 2C000004 */ cmpwi r0, 4
/* 0000AA84 41820178 */ beq lbl_0000ABFC
/* 0000AA88 931B0000 */ stw r24, 0(r27)
/* 0000AA8C 88180000 */ lbz r0, 0(r24)
/* 0000AA90 2C000002 */ cmpwi r0, 2
/* 0000AA94 40820168 */ bne lbl_0000ABFC
/* 0000AA98 82F80144 */ lwz r23, 0x144(r24)
/* 0000AA9C 80170014 */ lwz r0, 0x14(r23)
/* 0000AAA0 540006B5 */ rlwinm. r0, r0, 0, 0x1a, 0x1a
/* 0000AAA4 4182001C */ beq lbl_0000AAC0
/* 0000AAA8 801D0030 */ lwz r0, 0x30(r29)
/* 0000AAAC 2C000003 */ cmpwi r0, 3
/* 0000AAB0 4082014C */ bne lbl_0000ABFC
/* 0000AAB4 881D0042 */ lbz r0, 0x42(r29)
/* 0000AAB8 28000003 */ cmplwi r0, 3
/* 0000AABC 40820140 */ bne lbl_0000ABFC
lbl_0000AAC0:
/* 0000AAC0 7EA3AB78 */ mr r3, r21
/* 0000AAC4 4BFF56B9 */ bl change_current_camera
/* 0000AAC8 4BFF56B5 */ bl u_draw_ball_shadow
/* 0000AACC 4BFF56B1 */ bl background_light_assign
/* 0000AAD0 7EA3AB78 */ mr r3, r21
/* 0000AAD4 4BFF56A9 */ bl reset_light_group
/* 0000AAD8 88160000 */ lbz r0, 0(r22)
/* 0000AADC 2C000002 */ cmpwi r0, 2
/* 0000AAE0 4082000C */ bne lbl_0000AAEC
/* 0000AAE4 38600004 */ li r3, 4
/* 0000AAE8 4BFF5695 */ bl rend_efc_draw
lbl_0000AAEC:
/* 0000AAEC 4BFF5691 */ bl draw_monkey
/* 0000AAF0 881E0018 */ lbz r0, 0x18(r30)
/* 0000AAF4 7C000774 */ extsb r0, r0
/* 0000AAF8 2C000002 */ cmpwi r0, 2
/* 0000AAFC 4182000C */ beq lbl_0000AB08
/* 0000AB00 2C000004 */ cmpwi r0, 4
/* 0000AB04 4082001C */ bne lbl_0000AB20
lbl_0000AB08:
/* 0000AB08 4BFF5675 */ bl stage_draw
/* 0000AB0C 807F0000 */ lwz r3, 0(r31)
/* 0000AB10 80030078 */ lwz r0, 0x78(r3)
/* 0000AB14 28000000 */ cmplwi r0, 0
/* 0000AB18 41820008 */ beq lbl_0000AB20
/* 0000AB1C 480004DD */ bl lbl_0000AFF8
lbl_0000AB20:
/* 0000AB20 4BFF565D */ bl poly_shadow_draw
/* 0000AB24 881E01C8 */ lbz r0, 0x1c8(r30)
/* 0000AB28 2C000002 */ cmpwi r0, 2
/* 0000AB2C 40820018 */ bne lbl_0000AB44
/* 0000AB30 C03A0004 */ lfs f1, 4(r26)
/* 0000AB34 4BFF5649 */ bl ord_tbl_set_depth_offset
/* 0000AB38 4BFF5645 */ bl background_draw
/* 0000AB3C C03A0000 */ lfs f1, 0(r26)
/* 0000AB40 4BFF563D */ bl ord_tbl_set_depth_offset
lbl_0000AB44:
/* 0000AB44 88160000 */ lbz r0, 0(r22)
/* 0000AB48 2C000002 */ cmpwi r0, 2
/* 0000AB4C 4082000C */ bne lbl_0000AB58
/* 0000AB50 38600010 */ li r3, 0x10
/* 0000AB54 4BFF5629 */ bl rend_efc_draw
lbl_0000AB58:
/* 0000AB58 881E0078 */ lbz r0, 0x78(r30)
/* 0000AB5C 2C000002 */ cmpwi r0, 2
/* 0000AB60 40820008 */ bne lbl_0000AB68
/* 0000AB64 4BFF5619 */ bl item_draw
lbl_0000AB68:
/* 0000AB68 881E0060 */ lbz r0, 0x60(r30)
/* 0000AB6C 2C000002 */ cmpwi r0, 2
/* 0000AB70 40820008 */ bne lbl_0000AB78
/* 0000AB74 4BFF5609 */ bl stobj_draw
lbl_0000AB78:
/* 0000AB78 881E0138 */ lbz r0, 0x138(r30)
/* 0000AB7C 2C000002 */ cmpwi r0, 2
/* 0000AB80 40820008 */ bne lbl_0000AB88
/* 0000AB84 4BFF55F9 */ bl effect_draw
lbl_0000AB88:
/* 0000AB88 881E0048 */ lbz r0, 0x48(r30)
/* 0000AB8C 2C000002 */ cmpwi r0, 2
/* 0000AB90 4082003C */ bne lbl_0000ABCC
/* 0000AB94 4BFF55E9 */ bl ball_draw
/* 0000AB98 48000099 */ bl lbl_0000AC30
/* 0000AB9C 48000241 */ bl lbl_0000ADDC
/* 0000ABA0 807B0000 */ lwz r3, 0(r27)
/* 0000ABA4 4800074D */ bl lbl_0000B2F0
/* 0000ABA8 80770014 */ lwz r3, 0x14(r23)
/* 0000ABAC 546006B5 */ rlwinm. r0, r3, 0, 0x1a, 0x1a
/* 0000ABB0 4082001C */ bne lbl_0000ABCC
/* 0000ABB4 546007BD */ rlwinm. r0, r3, 0, 0x1e, 0x1e
/* 0000ABB8 40820014 */ bne lbl_0000ABCC
/* 0000ABBC 54600463 */ rlwinm. r0, r3, 0, 0x11, 0x11
/* 0000ABC0 4182000C */ beq lbl_0000ABCC
/* 0000ABC4 807B0000 */ lwz r3, 0(r27)
/* 0000ABC8 48000999 */ bl lbl_0000B560
lbl_0000ABCC:
/* 0000ABCC 4BFF55B1 */ bl draw_test_camera_target
/* 0000ABD0 4BFF55AD */ bl ord_tbl_draw_nodes
/* 0000ABD4 80130008 */ lwz r0, 8(r19)
/* 0000ABD8 540007FF */ clrlwi. r0, r0, 0x1f
/* 0000ABDC 4182000C */ beq lbl_0000ABE8
/* 0000ABE0 7EA3AB78 */ mr r3, r21
/* 0000ABE4 4BFF5599 */ bl lens_flare_draw
lbl_0000ABE8:
/* 0000ABE8 88160000 */ lbz r0, 0(r22)
/* 0000ABEC 2C000002 */ cmpwi r0, 2
/* 0000ABF0 4082000C */ bne lbl_0000ABFC
/* 0000ABF4 38600008 */ li r3, 8
/* 0000ABF8 4BFF5585 */ bl rend_efc_draw
lbl_0000ABFC:
/* 0000ABFC 3AB50001 */ addi r21, r21, 1
/* 0000AC00 2C150004 */ cmpwi r21, 4
/* 0000AC04 3B390284 */ addi r25, r25, 0x284
/* 0000AC08 3B1801A4 */ addi r24, r24, 0x1a4
/* 0000AC0C 4180FE44 */ blt lbl_0000AA50
/* 0000AC10 3C600000 */ lis r3, currentBall@ha
/* 0000AC14 92830000 */ stw r20, currentBall@l(r3)
/* 0000AC18 4BFF5565 */ bl default_camera_env
/* 0000AC1C BA61000C */ lmw r19, 0xc(r1)
/* 0000AC20 80010044 */ lwz r0, 0x44(r1)
/* 0000AC24 38210040 */ addi r1, r1, 0x40
/* 0000AC28 7C0803A6 */ mtlr r0
/* 0000AC2C 4E800020 */ blr 
