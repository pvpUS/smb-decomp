/* 0000A184 7C0802A6 */ mflr r0
/* 0000A188 3C800000 */ lis r4, polyDisp@ha
/* 0000A18C 90010004 */ stw r0, 4(r1)
/* 0000A190 9421FFD0 */ stwu r1, -0x30(r1)
/* 0000A194 DBE10028 */ stfd f31, 0x28(r1)
/* 0000A198 93E10024 */ stw r31, 0x24(r1)
/* 0000A19C 93C10020 */ stw r30, 0x20(r1)
/* 0000A1A0 93A1001C */ stw r29, 0x1c(r1)
/* 0000A1A4 3BA30000 */ addi r29, r3, 0
/* 0000A1A8 80040000 */ lwz r0, polyDisp@l(r4)
/* 0000A1AC 3C800000 */ lis r4, lbl_0001C108@ha
/* 0000A1B0 3BE40000 */ addi r31, r4, lbl_0001C108@l
/* 0000A1B4 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 0000A1B8 40820148 */ bne lbl_0000A300
/* 0000A1BC 83DD0030 */ lwz r30, 0x30(r29)
/* 0000A1C0 387D0034 */ addi r3, r29, 0x34
/* 0000A1C4 C3FD0024 */ lfs f31, 0x24(r29)
/* 0000A1C8 4BFF5F9D */ bl mathutil_mtxA_from_mtxB_translate
/* 0000A1CC A87D004E */ lha r3, 0x4e(r29)
/* 0000A1D0 4BFF5F95 */ bl mathutil_mtxA_rotate_y
/* 0000A1D4 A87D004C */ lha r3, 0x4c(r29)
/* 0000A1D8 4BFF5F8D */ bl mathutil_mtxA_rotate_x
/* 0000A1DC A87D0050 */ lha r3, 0x50(r29)
/* 0000A1E0 4BFF5F85 */ bl mathutil_mtxA_rotate_z
/* 0000A1E4 3861000C */ addi r3, r1, 0xc
/* 0000A1E8 4BFF5F7D */ bl mathutil_mtxA_rigid_inv_tf_tl
/* 0000A1EC C0210014 */ lfs f1, 0x14(r1)
/* 0000A1F0 C01F0000 */ lfs f0, 0(r31)
/* 0000A1F4 FC010040 */ fcmpo cr0, f1, f0
/* 0000A1F8 40800010 */ bge lbl_0000A208
/* 0000A1FC 3C600001 */ lis r3, 1
/* 0000A200 38638000 */ addi r3, r3, -32768
/* 0000A204 4BFF5F61 */ bl mathutil_mtxA_rotate_y
lbl_0000A208:
/* 0000A208 3861000C */ addi r3, r1, 0xc
/* 0000A20C 38830004 */ addi r4, r3, 4
/* 0000A210 38630008 */ addi r3, r3, 8
/* 0000A214 3CA0E000 */ lis r5, 0xe000
/* 0000A218 C045000C */ lfs f2, 0xc(r5)
/* 0000A21C C025001C */ lfs f1, 0x1c(r5)
/* 0000A220 C005002C */ lfs f0, 0x2c(r5)
/* 0000A224 D041000C */ stfs f2, 0xc(r1)
/* 0000A228 D0240000 */ stfs f1, 0(r4)
/* 0000A22C D0030000 */ stfs f0, 0(r3)
/* 0000A230 FC00F850 */ fneg f0, f31
/* 0000A234 C0410014 */ lfs f2, 0x14(r1)
/* 0000A238 FC020040 */ fcmpo cr0, f2, f0
/* 0000A23C 4C411382 */ cror 2, 1, 2
/* 0000A240 418200C0 */ beq lbl_0000A300
/* 0000A244 EC22F82A */ fadds f1, f2, f31
/* 0000A248 C001000C */ lfs f0, 0xc(r1)
/* 0000A24C EC211024 */ fdivs f1, f1, f2
/* 0000A250 EC000072 */ fmuls f0, f0, f1
/* 0000A254 EFFF0072 */ fmuls f31, f31, f1
/* 0000A258 D001000C */ stfs f0, 0xc(r1)
/* 0000A25C C0010010 */ lfs f0, 0x10(r1)
/* 0000A260 EC000072 */ fmuls f0, f0, f1
/* 0000A264 D0010010 */ stfs f0, 0x10(r1)
/* 0000A268 C0010014 */ lfs f0, 0x14(r1)
/* 0000A26C EC000072 */ fmuls f0, f0, f1
/* 0000A270 D0010014 */ stfs f0, 0x14(r1)
/* 0000A274 C041000C */ lfs f2, 0xc(r1)
/* 0000A278 C0210010 */ lfs f1, 0x10(r1)
/* 0000A27C C0010014 */ lfs f0, 0x14(r1)
/* 0000A280 D045000C */ stfs f2, 0xc(r5)
/* 0000A284 D025001C */ stfs f1, 0x1c(r5)
/* 0000A288 D005002C */ stfs f0, 0x2c(r5)
/* 0000A28C FC20F890 */ fmr f1, f31
/* 0000A290 4BFF5ED5 */ bl mathutil_mtxA_scale_s
/* 0000A294 C03D0018 */ lfs f1, 0x18(r29)
/* 0000A298 C09F0004 */ lfs f4, 4(r31)
/* 0000A29C FC400890 */ fmr f2, f1
/* 0000A2A0 FC600890 */ fmr f3, f1
/* 0000A2A4 4BFF5EC1 */ bl avdisp_set_post_mult_color
/* 0000A2A8 38600001 */ li r3, 1
/* 0000A2AC 38800003 */ li r4, 3
/* 0000A2B0 38A00000 */ li r5, 0
/* 0000A2B4 4BFF5EB1 */ bl avdisp_set_z_mode
/* 0000A2B8 FC20F890 */ fmr f1, f31
/* 0000A2BC 4BFF5EA9 */ bl avdisp_set_bound_sphere_scale
/* 0000A2C0 7FC3F378 */ mr r3, r30
/* 0000A2C4 4BFF5EA1 */ bl avdisp_draw_model_culled_sort_translucent
/* 0000A2C8 4BFF5E9D */ bl mathutil_mtxA_sq_from_identity
/* 0000A2CC C01F0120 */ lfs f0, 0x120(r31)
/* 0000A2D0 EC2007F2 */ fmuls f1, f0, f31
/* 0000A2D4 4BFF5E91 */ bl mathutil_mtxA_scale_s
/* 0000A2D8 C01F0120 */ lfs f0, 0x120(r31)
/* 0000A2DC EC2007F2 */ fmuls f1, f0, f31
/* 0000A2E0 4BFF5E85 */ bl avdisp_set_bound_sphere_scale
/* 0000A2E4 7FC3F378 */ mr r3, r30
/* 0000A2E8 4BFF5E7D */ bl avdisp_draw_model_culled_sort_translucent
/* 0000A2EC 4BFF5E79 */ bl fade_color_base_default
/* 0000A2F0 38600001 */ li r3, 1
/* 0000A2F4 38800003 */ li r4, 3
/* 0000A2F8 38A00001 */ li r5, 1
/* 0000A2FC 4BFF5E69 */ bl avdisp_set_z_mode
lbl_0000A300:
/* 0000A300 80010034 */ lwz r0, 0x34(r1)
/* 0000A304 CBE10028 */ lfd f31, 0x28(r1)
/* 0000A308 83E10024 */ lwz r31, 0x24(r1)
/* 0000A30C 7C0803A6 */ mtlr r0
/* 0000A310 83C10020 */ lwz r30, 0x20(r1)
/* 0000A314 83A1001C */ lwz r29, 0x1c(r1)
/* 0000A318 38210030 */ addi r1, r1, 0x30
/* 0000A31C 4E800020 */ blr 
