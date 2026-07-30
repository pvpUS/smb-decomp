/* 0001356C 7C0802A6 */ mflr r0
/* 00013570 90010004 */ stw r0, 4(r1)
/* 00013574 9421FFE8 */ stwu r1, -0x18(r1)
/* 00013578 93E10014 */ stw r31, 0x14(r1)
/* 0001357C 93C10010 */ stw r30, 0x10(r1)
/* 00013580 3BC30000 */ addi r30, r3, 0
/* 00013584 3C600000 */ lis r3, lbl_00014060@ha
/* 00013588 3BE30000 */ addi r31, r3, lbl_00014060@l
/* 0001358C 387E0034 */ addi r3, r30, 0x34
/* 00013590 4BFECBED */ bl mathutil_mtxA_from_mtxB_translate
/* 00013594 C03F0054 */ lfs f1, 0x54(r31)
/* 00013598 C05F00A0 */ lfs f2, 0xa0(r31)
/* 0001359C FC600890 */ fmr f3, f1
/* 000135A0 4BFECBDD */ bl mathutil_mtxA_translate_xyz
/* 000135A4 A87E004E */ lha r3, 0x4e(r30)
/* 000135A8 4BFECBD5 */ bl mathutil_mtxA_rotate_y
/* 000135AC A87E004C */ lha r3, 0x4c(r30)
/* 000135B0 4BFECBCD */ bl mathutil_mtxA_rotate_x
/* 000135B4 A87E0050 */ lha r3, 0x50(r30)
/* 000135B8 4BFECBC5 */ bl mathutil_mtxA_rotate_z
/* 000135BC 38600001 */ li r3, 1
/* 000135C0 38800003 */ li r4, 3
/* 000135C4 38A00000 */ li r5, 0
/* 000135C8 4BFECBB5 */ bl avdisp_set_z_mode
/* 000135CC 387E0024 */ addi r3, r30, 0x24
/* 000135D0 4BFECBAD */ bl mathutil_mtxA_scale
/* 000135D4 C05E0028 */ lfs f2, 0x28(r30)
/* 000135D8 C07E002C */ lfs f3, 0x2c(r30)
/* 000135DC FC021840 */ fcmpo cr0, f2, f3
/* 000135E0 4081000C */ ble lbl_000135EC
/* 000135E4 FC001090 */ fmr f0, f2
/* 000135E8 48000008 */ b lbl_000135F0
lbl_000135EC:
/* 000135EC FC001890 */ fmr f0, f3
lbl_000135F0:
/* 000135F0 C03E0024 */ lfs f1, 0x24(r30)
/* 000135F4 FC010040 */ fcmpo cr0, f1, f0
/* 000135F8 40810008 */ ble lbl_00013600
/* 000135FC 48000018 */ b lbl_00013614
lbl_00013600:
/* 00013600 FC021840 */ fcmpo cr0, f2, f3
/* 00013604 40810008 */ ble lbl_0001360C
/* 00013608 48000008 */ b lbl_00013610
lbl_0001360C:
/* 0001360C FC401890 */ fmr f2, f3
lbl_00013610:
/* 00013610 FC201090 */ fmr f1, f2
lbl_00013614:
/* 00013614 4BFECB69 */ bl avdisp_set_bound_sphere_scale
/* 00013618 C03F004C */ lfs f1, 0x4c(r31)
/* 0001361C C07F0064 */ lfs f3, 0x64(r31)
/* 00013620 FC400890 */ fmr f2, f1
/* 00013624 FC800890 */ fmr f4, f1
/* 00013628 4BFECB55 */ bl avdisp_set_post_mult_color
/* 0001362C 3C600000 */ lis r3, commonGma@ha
/* 00013630 38630000 */ addi r3, r3, commonGma@l
/* 00013634 80630000 */ lwz r3, 0(r3)
/* 00013638 80630008 */ lwz r3, 8(r3)
/* 0001363C 806302D0 */ lwz r3, 0x2d0(r3)
/* 00013640 4BFECB3D */ bl avdisp_draw_model_unculled_sort_translucent
/* 00013644 4BFECB39 */ bl fade_color_base_default
/* 00013648 38600001 */ li r3, 1
/* 0001364C 38800003 */ li r4, 3
/* 00013650 38A00001 */ li r5, 1
/* 00013654 4BFECB29 */ bl avdisp_set_z_mode
/* 00013658 8001001C */ lwz r0, 0x1c(r1)
/* 0001365C 83E10014 */ lwz r31, 0x14(r1)
/* 00013660 83C10010 */ lwz r30, 0x10(r1)
/* 00013664 7C0803A6 */ mtlr r0
/* 00013668 38210018 */ addi r1, r1, 0x18
/* 0001366C 4E800020 */ blr 
