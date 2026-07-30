/* 00013268 7C0802A6 */ mflr r0
/* 0001326C 90010004 */ stw r0, 4(r1)
/* 00013270 9421FFE8 */ stwu r1, -0x18(r1)
/* 00013274 93E10014 */ stw r31, 0x14(r1)
/* 00013278 93C10010 */ stw r30, 0x10(r1)
/* 0001327C 3BC30000 */ addi r30, r3, 0
/* 00013280 3C600000 */ lis r3, lbl_00014060@ha
/* 00013284 3BE30000 */ addi r31, r3, lbl_00014060@l
/* 00013288 387E0034 */ addi r3, r30, 0x34
/* 0001328C 4BFECEF1 */ bl mathutil_mtxA_from_mtxB_translate
/* 00013290 A87E004E */ lha r3, 0x4e(r30)
/* 00013294 4BFECEE9 */ bl mathutil_mtxA_rotate_y
/* 00013298 A87E004C */ lha r3, 0x4c(r30)
/* 0001329C 4BFECEE1 */ bl mathutil_mtxA_rotate_x
/* 000132A0 38600001 */ li r3, 1
/* 000132A4 38800003 */ li r4, 3
/* 000132A8 38A00000 */ li r5, 0
/* 000132AC 4BFECED1 */ bl avdisp_set_z_mode
/* 000132B0 C03E0024 */ lfs f1, 0x24(r30)
/* 000132B4 4BFECEC9 */ bl mathutil_mtxA_scale_s
/* 000132B8 C03E0024 */ lfs f1, 0x24(r30)
/* 000132BC 4BFECEC1 */ bl avdisp_set_bound_sphere_scale
/* 000132C0 C03F004C */ lfs f1, 0x4c(r31)
/* 000132C4 C07F0064 */ lfs f3, 0x64(r31)
/* 000132C8 FC400890 */ fmr f2, f1
/* 000132CC FC800890 */ fmr f4, f1
/* 000132D0 4BFECEAD */ bl avdisp_set_post_mult_color
/* 000132D4 3C600000 */ lis r3, commonGma@ha
/* 000132D8 38630000 */ addi r3, r3, commonGma@l
/* 000132DC 80630000 */ lwz r3, 0(r3)
/* 000132E0 80630008 */ lwz r3, 8(r3)
/* 000132E4 806302D0 */ lwz r3, 0x2d0(r3)
/* 000132E8 4BFECE95 */ bl avdisp_draw_model_unculled_sort_translucent
/* 000132EC 4BFECE91 */ bl fade_color_base_default
/* 000132F0 38600001 */ li r3, 1
/* 000132F4 38800003 */ li r4, 3
/* 000132F8 38A00001 */ li r5, 1
/* 000132FC 4BFECE81 */ bl avdisp_set_z_mode
/* 00013300 8001001C */ lwz r0, 0x1c(r1)
/* 00013304 83E10014 */ lwz r31, 0x14(r1)
/* 00013308 83C10010 */ lwz r30, 0x10(r1)
/* 0001330C 7C0803A6 */ mtlr r0
/* 00013310 38210018 */ addi r1, r1, 0x18
/* 00013314 4E800020 */ blr 
