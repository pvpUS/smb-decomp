/* 0000AD9C 7C0802A6 */ mflr r0
/* 0000ADA0 90010004 */ stw r0, 4(r1)
/* 0000ADA4 9421FFF0 */ stwu r1, -0x10(r1)
/* 0000ADA8 93E1000C */ stw r31, 0xc(r1)
/* 0000ADAC 4BFF53B9 */ bl u_draw_ball_shadow
/* 0000ADB0 4BFF53B5 */ bl background_light_assign
/* 0000ADB4 3C600000 */ lis r3, eventInfo@ha
/* 0000ADB8 38630000 */ addi r3, r3, eventInfo@l
/* 0000ADBC 880301E0 */ lbz r0, 0x1e0(r3)
/* 0000ADC0 3BE301E0 */ addi r31, r3, 0x1e0
/* 0000ADC4 2C000002 */ cmpwi r0, 2
/* 0000ADC8 4082000C */ bne lbl_0000ADD4
/* 0000ADCC 38600004 */ li r3, 4
/* 0000ADD0 4BFF5395 */ bl rend_efc_draw
lbl_0000ADD4:
/* 0000ADD4 3C600000 */ lis r3, eventInfo@ha
/* 0000ADD8 38630000 */ addi r3, r3, eventInfo@l
/* 0000ADDC 88030018 */ lbz r0, 0x18(r3)
/* 0000ADE0 7C000774 */ extsb r0, r0
/* 0000ADE4 2C000002 */ cmpwi r0, 2
/* 0000ADE8 4182000C */ beq lbl_0000ADF4
/* 0000ADEC 2C000004 */ cmpwi r0, 4
/* 0000ADF0 40820008 */ bne lbl_0000ADF8
lbl_0000ADF4:
/* 0000ADF4 4BFF5371 */ bl stage_draw
lbl_0000ADF8:
/* 0000ADF8 4BFF536D */ bl poly_shadow_draw
/* 0000ADFC 3C600000 */ lis r3, eventInfo@ha
/* 0000AE00 38630000 */ addi r3, r3, eventInfo@l
/* 0000AE04 880301C8 */ lbz r0, 0x1c8(r3)
/* 0000AE08 2C000002 */ cmpwi r0, 2
/* 0000AE0C 40820020 */ bne lbl_0000AE2C
/* 0000AE10 3C600000 */ lis r3, lbl_0001C25C@ha
/* 0000AE14 C0230000 */ lfs f1, lbl_0001C25C@l(r3)
/* 0000AE18 4BFF534D */ bl ord_tbl_set_depth_offset
/* 0000AE1C 4BFF5349 */ bl background_draw
/* 0000AE20 3C600000 */ lis r3, lbl_0001C244@ha
/* 0000AE24 C0230000 */ lfs f1, lbl_0001C244@l(r3)
/* 0000AE28 4BFF533D */ bl ord_tbl_set_depth_offset
lbl_0000AE2C:
/* 0000AE2C 881F0000 */ lbz r0, 0(r31)
/* 0000AE30 2C000002 */ cmpwi r0, 2
/* 0000AE34 4082000C */ bne lbl_0000AE40
/* 0000AE38 38600010 */ li r3, 0x10
/* 0000AE3C 4BFF5329 */ bl rend_efc_draw
lbl_0000AE40:
/* 0000AE40 3C600000 */ lis r3, eventInfo@ha
/* 0000AE44 38630000 */ addi r3, r3, eventInfo@l
/* 0000AE48 88030078 */ lbz r0, 0x78(r3)
/* 0000AE4C 2C000002 */ cmpwi r0, 2
/* 0000AE50 40820008 */ bne lbl_0000AE58
/* 0000AE54 4BFF5311 */ bl item_draw
lbl_0000AE58:
/* 0000AE58 3C600000 */ lis r3, eventInfo@ha
/* 0000AE5C 38630000 */ addi r3, r3, eventInfo@l
/* 0000AE60 88030060 */ lbz r0, 0x60(r3)
/* 0000AE64 2C000002 */ cmpwi r0, 2
/* 0000AE68 40820008 */ bne lbl_0000AE70
/* 0000AE6C 4BFF52F9 */ bl stobj_draw
lbl_0000AE70:
/* 0000AE70 3C600000 */ lis r3, eventInfo@ha
/* 0000AE74 38630000 */ addi r3, r3, eventInfo@l
/* 0000AE78 88030138 */ lbz r0, 0x138(r3)
/* 0000AE7C 2C000002 */ cmpwi r0, 2
/* 0000AE80 40820008 */ bne lbl_0000AE88
/* 0000AE84 4BFF52E1 */ bl effect_draw
lbl_0000AE88:
/* 0000AE88 3C600000 */ lis r3, eventInfo@ha
/* 0000AE8C 38630000 */ addi r3, r3, eventInfo@l
/* 0000AE90 88030048 */ lbz r0, 0x48(r3)
/* 0000AE94 2C000002 */ cmpwi r0, 2
/* 0000AE98 40820008 */ bne lbl_0000AEA0
/* 0000AE9C 4BFF52C9 */ bl ball_draw
lbl_0000AEA0:
/* 0000AEA0 4BFF52C5 */ bl func_8009CD5C
/* 0000AEA4 4BFF52C1 */ bl ord_tbl_draw_nodes
/* 0000AEA8 3C600000 */ lis r3, backgroundInfo@ha
/* 0000AEAC 38630000 */ addi r3, r3, backgroundInfo@l
/* 0000AEB0 80030008 */ lwz r0, 8(r3)
/* 0000AEB4 540007FF */ clrlwi. r0, r0, 0x1f
/* 0000AEB8 4182000C */ beq lbl_0000AEC4
/* 0000AEBC 38600000 */ li r3, 0
/* 0000AEC0 4BFF52A5 */ bl lens_flare_draw
lbl_0000AEC4:
/* 0000AEC4 881F0000 */ lbz r0, 0(r31)
/* 0000AEC8 2C000002 */ cmpwi r0, 2
/* 0000AECC 4082000C */ bne lbl_0000AED8
/* 0000AED0 38600008 */ li r3, 8
/* 0000AED4 4BFF5291 */ bl rend_efc_draw
lbl_0000AED8:
/* 0000AED8 80010014 */ lwz r0, 0x14(r1)
/* 0000AEDC 83E1000C */ lwz r31, 0xc(r1)
/* 0000AEE0 38210010 */ addi r1, r1, 0x10
/* 0000AEE4 7C0803A6 */ mtlr r0
/* 0000AEE8 4E800020 */ blr 
