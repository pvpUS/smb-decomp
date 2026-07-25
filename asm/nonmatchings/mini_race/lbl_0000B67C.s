/* 0000B67C 7C0802A6 */ mflr r0
/* 0000B680 3C600000 */ lis r3, currentBall@ha
/* 0000B684 90010004 */ stw r0, 4(r1)
/* 0000B688 3CA00000 */ lis r5, cameraInfo@ha
/* 0000B68C 3C800000 */ lis r4, ballInfo@ha
/* 0000B690 9421FFC8 */ stwu r1, -0x38(r1)
/* 0000B694 BEC10010 */ stmw r22, 0x10(r1)
/* 0000B698 3BA30000 */ addi r29, r3, currentBall@l
/* 0000B69C 3C600000 */ lis r3, eventInfo@ha
/* 0000B6A0 3BE30000 */ addi r31, r3, eventInfo@l
/* 0000B6A4 3B650000 */ addi r27, r5, cameraInfo@l
/* 0000B6A8 3B440000 */ addi r26, r4, ballInfo@l
/* 0000B6AC 3CA00000 */ lis r5, lbl_00013BD0@ha
/* 0000B6B0 3C600000 */ lis r3, backgroundInfo@ha
/* 0000B6B4 3C800000 */ lis r4, g_poolInfo@ha
/* 0000B6B8 3B850000 */ addi r28, r5, lbl_00013BD0@l
/* 0000B6BC 3B3F01E0 */ addi r25, r31, 0x1e0
/* 0000B6C0 3AC30000 */ addi r22, r3, backgroundInfo@l
/* 0000B6C4 3BC40000 */ addi r30, r4, g_poolInfo@l
/* 0000B6C8 82FD0000 */ lwz r23, 0(r29)
/* 0000B6CC 3B000000 */ li r24, 0
lbl_0000B6D0:
/* 0000B6D0 C01B0048 */ lfs f0, 0x48(r27)
/* 0000B6D4 C03C0000 */ lfs f1, 0(r28)
/* 0000B6D8 FC000840 */ fcmpo cr0, f0, f1
/* 0000B6DC 40810124 */ ble lbl_0000B800
/* 0000B6E0 C01B004C */ lfs f0, 0x4c(r27)
/* 0000B6E4 FC000840 */ fcmpo cr0, f0, f1
/* 0000B6E8 40810118 */ ble lbl_0000B800
/* 0000B6EC 807E000C */ lwz r3, 0xc(r30)
/* 0000B6F0 7C63C0AE */ lbzx r3, r3, r24
/* 0000B6F4 7C600775 */ extsb. r0, r3
/* 0000B6F8 41820108 */ beq lbl_0000B800
/* 0000B6FC 7C600774 */ extsb r0, r3
/* 0000B700 2C000004 */ cmpwi r0, 4
/* 0000B704 418200FC */ beq lbl_0000B800
/* 0000B708 935D0000 */ stw r26, 0(r29)
/* 0000B70C 7F03C378 */ mr r3, r24
/* 0000B710 4BFF4A6D */ bl change_current_camera
/* 0000B714 4BFF4A69 */ bl u_draw_ball_shadow
/* 0000B718 4BFF4A65 */ bl background_light_assign
/* 0000B71C 7F03C378 */ mr r3, r24
/* 0000B720 4BFF4A5D */ bl reset_light_group
/* 0000B724 88190000 */ lbz r0, 0(r25)
/* 0000B728 2C000002 */ cmpwi r0, 2
/* 0000B72C 4082000C */ bne lbl_0000B738
/* 0000B730 38600004 */ li r3, 4
/* 0000B734 4BFF4A49 */ bl rend_efc_draw
lbl_0000B738:
/* 0000B738 4BFF4A45 */ bl func_8009CD5C
/* 0000B73C 881F0018 */ lbz r0, 0x18(r31)
/* 0000B740 7C000774 */ extsb r0, r0
/* 0000B744 2C000002 */ cmpwi r0, 2
/* 0000B748 4182000C */ beq lbl_0000B754
/* 0000B74C 2C000004 */ cmpwi r0, 4
/* 0000B750 40820008 */ bne lbl_0000B758
lbl_0000B754:
/* 0000B754 4BFF4A29 */ bl stage_draw
lbl_0000B758:
/* 0000B758 4BFF4A25 */ bl poly_shadow_draw
/* 0000B75C 881F01C8 */ lbz r0, 0x1c8(r31)
/* 0000B760 2C000002 */ cmpwi r0, 2
/* 0000B764 40820018 */ bne lbl_0000B77C
/* 0000B768 C03C0004 */ lfs f1, 4(r28)
/* 0000B76C 4BFF4A11 */ bl ord_tbl_set_depth_offset
/* 0000B770 4BFF4A0D */ bl background_draw
/* 0000B774 C03C0000 */ lfs f1, 0(r28)
/* 0000B778 4BFF4A05 */ bl ord_tbl_set_depth_offset
lbl_0000B77C:
/* 0000B77C 88190000 */ lbz r0, 0(r25)
/* 0000B780 2C000002 */ cmpwi r0, 2
/* 0000B784 4082000C */ bne lbl_0000B790
/* 0000B788 38600010 */ li r3, 0x10
/* 0000B78C 4BFF49F1 */ bl rend_efc_draw
lbl_0000B790:
/* 0000B790 881F0078 */ lbz r0, 0x78(r31)
/* 0000B794 2C000002 */ cmpwi r0, 2
/* 0000B798 40820008 */ bne lbl_0000B7A0
/* 0000B79C 4BFF49E1 */ bl item_draw
lbl_0000B7A0:
/* 0000B7A0 881F0060 */ lbz r0, 0x60(r31)
/* 0000B7A4 2C000002 */ cmpwi r0, 2
/* 0000B7A8 40820008 */ bne lbl_0000B7B0
/* 0000B7AC 4BFF49D1 */ bl stobj_draw
lbl_0000B7B0:
/* 0000B7B0 881F0138 */ lbz r0, 0x138(r31)
/* 0000B7B4 2C000002 */ cmpwi r0, 2
/* 0000B7B8 40820008 */ bne lbl_0000B7C0
/* 0000B7BC 4BFF49C1 */ bl effect_draw
lbl_0000B7C0:
/* 0000B7C0 881F0048 */ lbz r0, 0x48(r31)
/* 0000B7C4 2C000002 */ cmpwi r0, 2
/* 0000B7C8 40820008 */ bne lbl_0000B7D0
/* 0000B7CC 4BFF49B1 */ bl ball_draw
lbl_0000B7D0:
/* 0000B7D0 4BFF49AD */ bl draw_test_camera_target
/* 0000B7D4 4BFF49A9 */ bl ord_tbl_draw_nodes
/* 0000B7D8 80160008 */ lwz r0, 8(r22)
/* 0000B7DC 540007FF */ clrlwi. r0, r0, 0x1f
/* 0000B7E0 4182000C */ beq lbl_0000B7EC
/* 0000B7E4 7F03C378 */ mr r3, r24
/* 0000B7E8 4BFF4995 */ bl lens_flare_draw
lbl_0000B7EC:
/* 0000B7EC 88190000 */ lbz r0, 0(r25)
/* 0000B7F0 2C000002 */ cmpwi r0, 2
/* 0000B7F4 4082000C */ bne lbl_0000B800
/* 0000B7F8 38600008 */ li r3, 8
/* 0000B7FC 4BFF4981 */ bl rend_efc_draw
lbl_0000B800:
/* 0000B800 3B180001 */ addi r24, r24, 1
/* 0000B804 2C180004 */ cmpwi r24, 4
/* 0000B808 3B7B0284 */ addi r27, r27, 0x284
/* 0000B80C 3B5A01A4 */ addi r26, r26, 0x1a4
/* 0000B810 4180FEC0 */ blt lbl_0000B6D0
/* 0000B814 3C600000 */ lis r3, currentBall@ha
/* 0000B818 92E30000 */ stw r23, currentBall@l(r3)
/* 0000B81C 4BFF4961 */ bl default_camera_env
/* 0000B820 BAC10010 */ lmw r22, 0x10(r1)
/* 0000B824 8001003C */ lwz r0, 0x3c(r1)
/* 0000B828 38210038 */ addi r1, r1, 0x38
/* 0000B82C 7C0803A6 */ mtlr r0
/* 0000B830 4E800020 */ blr 
