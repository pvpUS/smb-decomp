lbl_00013FD0:
/* 00013FD0 7C0802A6 */ mflr r0
/* 00013FD4 90010004 */ stw r0, 4(r1)
/* 00013FD8 9421FFC0 */ stwu r1, -0x40(r1)
/* 00013FDC DBE10038 */ stfd f31, 0x38(r1)
/* 00013FE0 93E10034 */ stw r31, 0x34(r1)
/* 00013FE4 93C10030 */ stw r30, 0x30(r1)
/* 00013FE8 93A1002C */ stw r29, 0x2c(r1)
/* 00013FEC 93810028 */ stw r28, 0x28(r1)
/* 00013FF0 7C7C1B78 */ mr r28, r3
/* 00013FF4 ABE30012 */ lha r31, 0x12(r3)
/* 00013FF8 3C600000 */ lis r3, lbl_0001C4E8@ha
/* 00013FFC 3BC30000 */ addi r30, r3, lbl_0001C4E8@l
/* 00014000 2C1F003C */ cmpwi r31, 0x3c
/* 00014004 4080000C */ bge lbl_00014010
/* 00014008 57E0077B */ rlwinm. r0, r31, 0, 0x1d, 0x1d
/* 0001400C 4082012C */ bne lbl_00014138
lbl_00014010:
/* 00014010 C3FC0014 */ lfs f31, 0x14(r28)
/* 00014014 57E3482C */ slwi r3, r31, 9
/* 00014018 83BC001C */ lwz r29, 0x1c(r28)
/* 0001401C 4BFEC149 */ bl mathutil_sin
/* 00014020 C01E0008 */ lfs f0, 8(r30)
/* 00014024 C05E0030 */ lfs f2, 0x30(r30)
/* 00014028 EC80082A */ fadds f4, f0, f1
/* 0001402C C01C0024 */ lfs f0, 0x24(r28)
/* 00014030 C03C0020 */ lfs f1, 0x20(r28)
/* 00014034 C07C0028 */ lfs f3, 0x28(r28)
/* 00014038 EC420132 */ fmuls f2, f2, f4
/* 0001403C EC40102A */ fadds f2, f0, f2
/* 00014040 4BFEC125 */ bl mathutil_mtxA_from_mtxB_translate_xyz
/* 00014044 4BFEC121 */ bl mathutil_mtxA_sq_from_identity
/* 00014048 A81C0000 */ lha r0, 0(r28)
/* 0001404C 57E3502A */ slwi r3, r31, 0xa
/* 00014050 5400482C */ slwi r0, r0, 9
/* 00014054 7C630050 */ subf r3, r3, r0
/* 00014058 4BFEC10D */ bl mathutil_sin
/* 0001405C C05E0038 */ lfs f2, 0x38(r30)
/* 00014060 C01E0034 */ lfs f0, 0x34(r30)
/* 00014064 EC220072 */ fmuls f1, f2, f1
/* 00014068 EC0007F2 */ fmuls f0, f0, f31
/* 0001406C EC00082A */ fadds f0, f0, f1
/* 00014070 FC00001E */ fctiwz f0, f0
/* 00014074 D8010020 */ stfd f0, 0x20(r1)
/* 00014078 80010024 */ lwz r0, 0x24(r1)
/* 0001407C 7C030734 */ extsh r3, r0
/* 00014080 4BFEC0E5 */ bl mathutil_mtxA_rotate_z
/* 00014084 C03C0014 */ lfs f1, 0x14(r28)
/* 00014088 C01D0014 */ lfs f0, 0x14(r29)
/* 0001408C EC210024 */ fdivs f1, f1, f0
/* 00014090 4BFEC0D5 */ bl mathutil_mtxA_scale_s
/* 00014094 3C600000 */ lis r3, mathutilData@ha
/* 00014098 3BE30000 */ addi r31, r3, mathutilData@l
/* 0001409C 807F0000 */ lwz r3, 0(r31)
/* 000140A0 38800000 */ li r4, 0
/* 000140A4 4BFEC0C1 */ bl GXLoadPosMtxImm
/* 000140A8 807F0000 */ lwz r3, 0(r31)
/* 000140AC 38800000 */ li r4, 0
/* 000140B0 4BFEC0B5 */ bl GXLoadNrmMtxImm
/* 000140B4 C09E0008 */ lfs f4, 8(r30)
/* 000140B8 FC1F2040 */ fcmpo cr0, f31, f4
/* 000140BC 40800054 */ bge lbl_00014110
/* 000140C0 EC64F828 */ fsubs f3, f4, f31
/* 000140C4 C03E003C */ lfs f1, 0x3c(r30)
/* 000140C8 C05E0040 */ lfs f2, 0x40(r30)
/* 000140CC C01E0044 */ lfs f0, 0x44(r30)
/* 000140D0 EC2100F2 */ fmuls f1, f1, f3
/* 000140D4 EC4200F2 */ fmuls f2, f2, f3
/* 000140D8 EC6000F2 */ fmuls f3, f0, f3
/* 000140DC FC012040 */ fcmpo cr0, f1, f4
/* 000140E0 40810008 */ ble lbl_000140E8
/* 000140E4 FC202090 */ fmr f1, f4
lbl_000140E8:
/* 000140E8 C01E0008 */ lfs f0, 8(r30)
/* 000140EC FC020040 */ fcmpo cr0, f2, f0
/* 000140F0 40810008 */ ble lbl_000140F8
/* 000140F4 FC400090 */ fmr f2, f0
lbl_000140F8:
/* 000140F8 C01E0008 */ lfs f0, 8(r30)
/* 000140FC FC030040 */ fcmpo cr0, f3, f0
/* 00014100 40810008 */ ble lbl_00014108
/* 00014104 FC600090 */ fmr f3, f0
lbl_00014108:
/* 00014108 C09E0048 */ lfs f4, 0x48(r30)
/* 0001410C 4BFEC059 */ bl avdisp_set_post_add_color
lbl_00014110:
/* 00014110 7FA3EB78 */ mr r3, r29
/* 00014114 4BFEC051 */ bl avdisp_draw_model_culled_sort_translucent
/* 00014118 C01E0008 */ lfs f0, 8(r30)
/* 0001411C FC1F0040 */ fcmpo cr0, f31, f0
/* 00014120 40800018 */ bge lbl_00014138
/* 00014124 C03E0048 */ lfs f1, 0x48(r30)
/* 00014128 FC400890 */ fmr f2, f1
/* 0001412C FC600890 */ fmr f3, f1
/* 00014130 FC800890 */ fmr f4, f1
/* 00014134 4BFEC031 */ bl avdisp_set_post_add_color
lbl_00014138:
/* 00014138 80010044 */ lwz r0, 0x44(r1)
/* 0001413C CBE10038 */ lfd f31, 0x38(r1)
/* 00014140 83E10034 */ lwz r31, 0x34(r1)
/* 00014144 7C0803A6 */ mtlr r0
/* 00014148 83C10030 */ lwz r30, 0x30(r1)
/* 0001414C 83A1002C */ lwz r29, 0x2c(r1)
/* 00014150 83810028 */ lwz r28, 0x28(r1)
/* 00014154 38210040 */ addi r1, r1, 0x40
/* 00014158 4E800020 */ blr 
