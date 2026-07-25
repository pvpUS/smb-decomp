/* 0000884C 7C0802A6 */ mflr r0
/* 00008850 3C800000 */ lis r4, lbl_0000FE78@ha
/* 00008854 90010004 */ stw r0, 4(r1)
/* 00008858 3C600000 */ lis r3, lbl_000102B0@ha
/* 0000885C 9421FFD0 */ stwu r1, -0x30(r1)
/* 00008860 BF61001C */ stmw r27, 0x1c(r1)
/* 00008864 3BE40000 */ addi r31, r4, lbl_0000FE78@l
/* 00008868 3BA30000 */ addi r29, r3, lbl_000102B0@l
/* 0000886C 38600001 */ li r3, 1
/* 00008870 38800001 */ li r4, 1
/* 00008874 4BFF78E9 */ bl window_set_cursor_pos
/* 00008878 387D4520 */ addi r3, r29, 0x4520
/* 0000887C 4BFF78E1 */ bl u_debug_print
/* 00008880 3C600000 */ lis r3, modeCtrl@ha
/* 00008884 3B9D4464 */ addi r28, r29, 0x4464
/* 00008888 3BC30000 */ addi r30, r3, modeCtrl@l
/* 0000888C 3B600000 */ li r27, 0
lbl_00008890:
/* 00008890 801E0010 */ lwz r0, 0x10(r30)
/* 00008894 7C1B0000 */ cmpw r27, r0
/* 00008898 40820028 */ bne lbl_000088C0
/* 0000889C 38600002 */ li r3, 2
/* 000088A0 389B0003 */ addi r4, r27, 3
/* 000088A4 4BFF78B9 */ bl window_set_cursor_pos
/* 000088A8 38600002 */ li r3, 2
/* 000088AC 4BFF78B1 */ bl window_set_text_color
/* 000088B0 387D0400 */ addi r3, r29, 0x400
/* 000088B4 4BFF78A9 */ bl u_debug_print
/* 000088B8 38600000 */ li r3, 0
/* 000088BC 4BFF78A1 */ bl window_set_text_color
lbl_000088C0:
/* 000088C0 38600003 */ li r3, 3
/* 000088C4 389B0003 */ addi r4, r27, 3
/* 000088C8 4BFF7895 */ bl window_set_cursor_pos
/* 000088CC A09C0004 */ lhz r4, 4(r28)
/* 000088D0 387D452C */ addi r3, r29, 0x452c
/* 000088D4 A0BC0006 */ lhz r5, 6(r28)
/* 000088D8 4CC63182 */ crclr 6
/* 000088DC 80DC0000 */ lwz r6, 0(r28)
/* 000088E0 4BFF787D */ bl window_printf_2
/* 000088E4 3B7B0001 */ addi r27, r27, 1
/* 000088E8 281B0009 */ cmplwi r27, 9
/* 000088EC 3B9C000C */ addi r28, r28, 0xc
/* 000088F0 4180FFA0 */ blt lbl_00008890
/* 000088F4 3C600000 */ lis r3, modeCtrl@ha
/* 000088F8 38630000 */ addi r3, r3, modeCtrl@l
/* 000088FC 80030008 */ lwz r0, 8(r3)
/* 00008900 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00008904 418201C0 */ beq lbl_00008AC4
/* 00008908 80030010 */ lwz r0, 0x10(r3)
/* 0000890C 1C00000C */ mulli r0, r0, 0xc
/* 00008910 7FDD0214 */ add r30, r29, r0
/* 00008914 801E446C */ lwz r0, 0x446c(r30)
/* 00008918 3BDE4464 */ addi r30, r30, 0x4464
/* 0000891C 540007FF */ clrlwi. r0, r0, 0x1f
/* 00008920 41820034 */ beq lbl_00008954
/* 00008924 801F01F0 */ lwz r0, 0x1f0(r31)
/* 00008928 38600001 */ li r3, 1
/* 0000892C 38800000 */ li r4, 0
/* 00008930 90010010 */ stw r0, 0x10(r1)
/* 00008934 4BFF7829 */ bl GXSetPixelFmt
/* 00008938 80010010 */ lwz r0, 0x10(r1)
/* 0000893C 3C800100 */ lis r4, 0x100
/* 00008940 3861000C */ addi r3, r1, 0xc
/* 00008944 9001000C */ stw r0, 0xc(r1)
/* 00008948 3884FFFF */ addi r4, r4, -1
/* 0000894C 4BFF7811 */ bl GXSetCopyClear
/* 00008950 48000030 */ b lbl_00008980
lbl_00008954:
/* 00008954 38600000 */ li r3, 0
/* 00008958 38800000 */ li r4, 0
/* 0000895C 4BFF7801 */ bl GXSetPixelFmt
/* 00008960 3C600000 */ lis r3, backgroundInfo@ha
/* 00008964 38630000 */ addi r3, r3, backgroundInfo@l
/* 00008968 8003000C */ lwz r0, 0xc(r3)
/* 0000896C 3C800100 */ lis r4, 0x100
/* 00008970 38610008 */ addi r3, r1, 8
/* 00008974 90010008 */ stw r0, 8(r1)
/* 00008978 3884FFFF */ addi r4, r4, -1
/* 0000897C 4BFF77E1 */ bl GXSetCopyClear
lbl_00008980:
/* 00008980 38600000 */ li r3, 0
/* 00008984 4BFF77D9 */ bl change_current_camera
/* 00008988 4BFF77D5 */ bl u_draw_ball_shadow
/* 0000898C 4BFF77D1 */ bl background_light_assign
/* 00008990 38600000 */ li r3, 0
/* 00008994 4BFF77C9 */ bl reset_light_group
/* 00008998 3C600000 */ lis r3, eventInfo@ha
/* 0000899C 38630000 */ addi r3, r3, eventInfo@l
/* 000089A0 88030018 */ lbz r0, 0x18(r3)
/* 000089A4 7C000774 */ extsb r0, r0
/* 000089A8 2C000002 */ cmpwi r0, 2
/* 000089AC 4182000C */ beq lbl_000089B8
/* 000089B0 2C000004 */ cmpwi r0, 4
/* 000089B4 40820008 */ bne lbl_000089BC
lbl_000089B8:
/* 000089B8 4BFF77A5 */ bl stage_draw
lbl_000089BC:
/* 000089BC 3C600000 */ lis r3, currStageId@ha
/* 000089C0 A8030000 */ lha r0, currStageId@l(r3)
/* 000089C4 2C000092 */ cmpwi r0, 0x92
/* 000089C8 4080000C */ bge lbl_000089D4
/* 000089CC 2C00008F */ cmpwi r0, 0x8f
/* 000089D0 40800040 */ bge lbl_00008A10
lbl_000089D4:
/* 000089D4 4BFF7789 */ bl mathutil_mtxA_from_mtxB
/* 000089D8 3C600000 */ lis r3, decodedStageLzPtr@ha
/* 000089DC 38630000 */ addi r3, r3, decodedStageLzPtr@l
/* 000089E0 80630000 */ lwz r3, 0(r3)
/* 000089E4 80630010 */ lwz r3, 0x10(r3)
/* 000089E8 4BFF7775 */ bl mathutil_mtxA_translate
/* 000089EC 3C600000 */ lis r3, globalAnimTimer@ha
/* 000089F0 80030000 */ lwz r0, globalAnimTimer@l(r3)
/* 000089F4 5403482C */ slwi r3, r0, 9
/* 000089F8 4BFF7765 */ bl mathutil_mtxA_rotate_y
/* 000089FC 3C600000 */ lis r3, g_commonNlObj@ha
/* 00008A00 38630000 */ addi r3, r3, g_commonNlObj@l
/* 00008A04 80630000 */ lwz r3, 0(r3)
/* 00008A08 8063002C */ lwz r3, 0x2c(r3)
/* 00008A0C 4BFF7751 */ bl nl2ngc_draw_model_sort_translucent_alt2
lbl_00008A10:
/* 00008A10 4BFF774D */ bl poly_shadow_draw
/* 00008A14 3C600000 */ lis r3, eventInfo@ha
/* 00008A18 38630000 */ addi r3, r3, eventInfo@l
/* 00008A1C 880301C8 */ lbz r0, 0x1c8(r3)
/* 00008A20 2C000002 */ cmpwi r0, 2
/* 00008A24 40820018 */ bne lbl_00008A3C
/* 00008A28 C03F01F4 */ lfs f1, 0x1f4(r31)
/* 00008A2C 4BFF7731 */ bl ord_tbl_set_depth_offset
/* 00008A30 4BFF772D */ bl background_draw
/* 00008A34 C03F0060 */ lfs f1, 0x60(r31)
/* 00008A38 4BFF7725 */ bl ord_tbl_set_depth_offset
lbl_00008A3C:
/* 00008A3C 3C600000 */ lis r3, eventInfo@ha
/* 00008A40 38630000 */ addi r3, r3, eventInfo@l
/* 00008A44 88030078 */ lbz r0, 0x78(r3)
/* 00008A48 2C000002 */ cmpwi r0, 2
/* 00008A4C 40820008 */ bne lbl_00008A54
/* 00008A50 4BFF770D */ bl item_draw
lbl_00008A54:
/* 00008A54 3C600000 */ lis r3, eventInfo@ha
/* 00008A58 38630000 */ addi r3, r3, eventInfo@l
/* 00008A5C 88030060 */ lbz r0, 0x60(r3)
/* 00008A60 2C000002 */ cmpwi r0, 2
/* 00008A64 40820008 */ bne lbl_00008A6C
/* 00008A68 4BFF76F5 */ bl stobj_draw
lbl_00008A6C:
/* 00008A6C 3C600000 */ lis r3, eventInfo@ha
/* 00008A70 38630000 */ addi r3, r3, eventInfo@l
/* 00008A74 88030138 */ lbz r0, 0x138(r3)
/* 00008A78 2C000002 */ cmpwi r0, 2
/* 00008A7C 40820008 */ bne lbl_00008A84
/* 00008A80 4BFF76DD */ bl effect_draw
lbl_00008A84:
/* 00008A84 4BFF76D9 */ bl ord_tbl_draw_nodes
/* 00008A88 A0BE0004 */ lhz r5, 4(r30)
/* 00008A8C A0DE0006 */ lhz r6, 6(r30)
/* 00008A90 20650270 */ subfic r3, r5, 0x270
/* 00008A94 208601B0 */ subfic r4, r6, 0x1b0
/* 00008A98 4BFF76C5 */ bl GXSetTexCopySrc
/* 00008A9C A07E0004 */ lhz r3, 4(r30)
/* 00008AA0 38A00005 */ li r5, 5
/* 00008AA4 A09E0006 */ lhz r4, 6(r30)
/* 00008AA8 38C00000 */ li r6, 0
/* 00008AAC 4BFF76B1 */ bl GXSetTexCopyDst
/* 00008AB0 3C600000 */ lis r3, lbl_10000D64@ha
/* 00008AB4 38630000 */ addi r3, r3, lbl_10000D64@l
/* 00008AB8 80630000 */ lwz r3, 0(r3)
/* 00008ABC 38800000 */ li r4, 0
/* 00008AC0 4BFF769D */ bl GXCopyTex
lbl_00008AC4:
/* 00008AC4 4BFF7699 */ bl default_camera_env
/* 00008AC8 BB61001C */ lmw r27, 0x1c(r1)
/* 00008ACC 80010034 */ lwz r0, 0x34(r1)
/* 00008AD0 38210030 */ addi r1, r1, 0x30
/* 00008AD4 7C0803A6 */ mtlr r0
/* 00008AD8 4E800020 */ blr 
