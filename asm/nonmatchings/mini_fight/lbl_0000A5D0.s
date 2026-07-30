/* 0000A5D0 7C0802A6 */ mflr r0
/* 0000A5D4 3C800000 */ lis r4, polyDisp@ha
/* 0000A5D8 90010004 */ stw r0, 4(r1)
/* 0000A5DC 9421FFE0 */ stwu r1, -0x20(r1)
/* 0000A5E0 DBE10018 */ stfd f31, 0x18(r1)
/* 0000A5E4 93E10014 */ stw r31, 0x14(r1)
/* 0000A5E8 93C10010 */ stw r30, 0x10(r1)
/* 0000A5EC 3BC30000 */ addi r30, r3, 0
/* 0000A5F0 80040000 */ lwz r0, polyDisp@l(r4)
/* 0000A5F4 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 0000A5F8 40820078 */ bne lbl_0000A670
/* 0000A5FC 83FE0030 */ lwz r31, 0x30(r30)
/* 0000A600 387E0034 */ addi r3, r30, 0x34
/* 0000A604 C3FE0024 */ lfs f31, 0x24(r30)
/* 0000A608 4BFF5B5D */ bl mathutil_mtxA_from_mtxB_translate
/* 0000A60C 4BFF5B59 */ bl mathutil_mtxA_sq_from_identity
/* 0000A610 3C600001 */ lis r3, 1
/* 0000A614 38638000 */ addi r3, r3, -32768
/* 0000A618 4BFF5B4D */ bl mathutil_mtxA_rotate_y
/* 0000A61C FC20F890 */ fmr f1, f31
/* 0000A620 4BFF5B45 */ bl mathutil_mtxA_scale_s
/* 0000A624 3C600000 */ lis r3, lbl_0001C10C@ha
/* 0000A628 C03E0018 */ lfs f1, 0x18(r30)
/* 0000A62C C05E001C */ lfs f2, 0x1c(r30)
/* 0000A630 C07E0020 */ lfs f3, 0x20(r30)
/* 0000A634 C0830000 */ lfs f4, lbl_0001C10C@l(r3)
/* 0000A638 4BFF5B2D */ bl avdisp_set_post_mult_color
/* 0000A63C 38600001 */ li r3, 1
/* 0000A640 38800003 */ li r4, 3
/* 0000A644 38A00000 */ li r5, 0
/* 0000A648 4BFF5B1D */ bl avdisp_set_z_mode
/* 0000A64C FC20F890 */ fmr f1, f31
/* 0000A650 4BFF5B15 */ bl avdisp_set_bound_sphere_scale
/* 0000A654 7FE3FB78 */ mr r3, r31
/* 0000A658 4BFF5B0D */ bl avdisp_draw_model_culled_sort_all
/* 0000A65C 4BFF5B09 */ bl fade_color_base_default
/* 0000A660 38600001 */ li r3, 1
/* 0000A664 38800003 */ li r4, 3
/* 0000A668 38A00001 */ li r5, 1
/* 0000A66C 4BFF5AF9 */ bl avdisp_set_z_mode
lbl_0000A670:
/* 0000A670 80010024 */ lwz r0, 0x24(r1)
/* 0000A674 CBE10018 */ lfd f31, 0x18(r1)
/* 0000A678 83E10014 */ lwz r31, 0x14(r1)
/* 0000A67C 7C0803A6 */ mtlr r0
/* 0000A680 83C10010 */ lwz r30, 0x10(r1)
/* 0000A684 38210020 */ addi r1, r1, 0x20
/* 0000A688 4E800020 */ blr 
