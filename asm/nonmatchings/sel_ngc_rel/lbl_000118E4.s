/* 000118E4 7C0802A6 */ mflr r0
/* 000118E8 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 000118EC 90010004 */ stw r0, 4(r1)
/* 000118F0 3C800000 */ lis r4, lbl_00012160@ha
/* 000118F4 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 000118F8 9421FFD8 */ stwu r1, -0x28(r1)
/* 000118FC DBE10020 */ stfd f31, 0x20(r1)
/* 00011900 DBC10018 */ stfd f30, 0x18(r1)
/* 00011904 93E10014 */ stw r31, 0x14(r1)
/* 00011908 3BE40000 */ addi r31, r4, lbl_00012160@l
/* 0001190C 93C10010 */ stw r30, 0x10(r1)
/* 00011910 93A1000C */ stw r29, 0xc(r1)
/* 00011914 C81F0000 */ lfd f0, 0(r31)
/* 00011918 C02300F8 */ lfs f1, 0xf8(r3)
/* 0001191C FC010040 */ fcmpo cr0, f1, f0
/* 00011920 40800008 */ bge lbl_00011928
/* 00011924 48000008 */ b lbl_0001192C
lbl_00011928:
/* 00011928 FC200090 */ fmr f1, f0
lbl_0001192C:
/* 0001192C FFE00818 */ frsp f31, f1
/* 00011930 C01F0008 */ lfs f0, 8(r31)
/* 00011934 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00011938 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 0001193C FC1F0040 */ fcmpo cr0, f31, f0
/* 00011940 C3C30100 */ lfs f30, 0x100(r3)
/* 00011944 40800030 */ bge lbl_00011974
/* 00011948 EC3EF82A */ fadds f1, f30, f31
/* 0001194C FC010040 */ fcmpo cr0, f1, f0
/* 00011950 40800008 */ bge lbl_00011958
/* 00011954 48000018 */ b lbl_0001196C
lbl_00011958:
/* 00011958 C01F000C */ lfs f0, 0xc(r31)
/* 0001195C FC010040 */ fcmpo cr0, f1, f0
/* 00011960 40810008 */ ble lbl_00011968
/* 00011964 48000008 */ b lbl_0001196C
lbl_00011968:
/* 00011968 FC000890 */ fmr f0, f1
lbl_0001196C:
/* 0001196C FFC00090 */ fmr f30, f0
/* 00011970 C3FF0008 */ lfs f31, 8(r31)
lbl_00011974:
/* 00011974 4BFEE815 */ bl is_load_queue_not_empty
/* 00011978 2C030000 */ cmpwi r3, 0
/* 0001197C 41820008 */ beq lbl_00011984
/* 00011980 C3DF0008 */ lfs f30, 8(r31)
lbl_00011984:
/* 00011984 C03F0008 */ lfs f1, 8(r31)
/* 00011988 FC01F000 */ fcmpu cr0, f1, f30
/* 0001198C 40820024 */ bne lbl_000119B0
/* 00011990 C07F0010 */ lfs f3, 0x10(r31)
/* 00011994 FC400890 */ fmr f2, f1
/* 00011998 38600000 */ li r3, 0
/* 0001199C FC801890 */ fmr f4, f3
/* 000119A0 4BFEE7E9 */ bl setup_camera_viewport
/* 000119A4 38600000 */ li r3, 0
/* 000119A8 4BFEE7E1 */ bl set_current_camera
/* 000119AC 48000190 */ b lbl_00011B3C
lbl_000119B0:
/* 000119B0 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 000119B4 C07F000C */ lfs f3, 0xc(r31)
/* 000119B8 38630000 */ addi r3, r3, lbl_801EEDA8@l
/* 000119BC C09F0014 */ lfs f4, 0x14(r31)
/* 000119C0 C04300FC */ lfs f2, 0xfc(r3)
/* 000119C4 EC3F1824 */ fdivs f1, f31, f3
/* 000119C8 C0030104 */ lfs f0, 0x104(r3)
/* 000119CC 38600000 */ li r3, 0
/* 000119D0 EC422024 */ fdivs f2, f2, f4
/* 000119D4 EC7E1824 */ fdivs f3, f30, f3
/* 000119D8 EC802024 */ fdivs f4, f0, f4
/* 000119DC 4BFEE7AD */ bl setup_camera_viewport
/* 000119E0 38600000 */ li r3, 0
/* 000119E4 4BFEE7A5 */ bl set_current_camera
/* 000119E8 4BFEE7A1 */ bl background_light_assign
/* 000119EC 3C600000 */ lis r3, modeCtrl@ha
/* 000119F0 38630000 */ addi r3, r3, modeCtrl@l
/* 000119F4 80030028 */ lwz r0, 0x28(r3)
/* 000119F8 2C000004 */ cmpwi r0, 4
/* 000119FC 41820040 */ beq lbl_00011A3C
/* 00011A00 4BFEE789 */ bl mathutil_mtxA_from_mtxB
/* 00011A04 3C600000 */ lis r3, decodedStageLzPtr@ha
/* 00011A08 38630000 */ addi r3, r3, decodedStageLzPtr@l
/* 00011A0C 80630000 */ lwz r3, 0(r3)
/* 00011A10 80630010 */ lwz r3, 0x10(r3)
/* 00011A14 4BFEE775 */ bl mathutil_mtxA_translate
/* 00011A18 3C600000 */ lis r3, stageInfo@ha
/* 00011A1C 80030000 */ lwz r0, stageInfo@l(r3)
/* 00011A20 5403482C */ slwi r3, r0, 9
/* 00011A24 4BFEE765 */ bl mathutil_mtxA_rotate_y
/* 00011A28 3C600000 */ lis r3, g_commonNlObj@ha
/* 00011A2C 38630000 */ addi r3, r3, g_commonNlObj@l
/* 00011A30 80630000 */ lwz r3, 0(r3)
/* 00011A34 8063002C */ lwz r3, 0x2c(r3)
/* 00011A38 4BFEE751 */ bl nl2ngc_draw_model_sort_translucent_alt2
lbl_00011A3C:
/* 00011A3C 4BFEE74D */ bl stage_draw
/* 00011A40 3C600000 */ lis r3, eventInfo@ha
/* 00011A44 38630000 */ addi r3, r3, eventInfo@l
/* 00011A48 880301C8 */ lbz r0, 0x1c8(r3)
/* 00011A4C 2C000002 */ cmpwi r0, 2
/* 00011A50 40820018 */ bne lbl_00011A68
/* 00011A54 C03F0018 */ lfs f1, 0x18(r31)
/* 00011A58 4BFEE731 */ bl ord_tbl_set_depth_offset
/* 00011A5C 4BFEE72D */ bl background_draw
/* 00011A60 C03F0008 */ lfs f1, 8(r31)
/* 00011A64 4BFEE725 */ bl ord_tbl_set_depth_offset
lbl_00011A68:
/* 00011A68 3C600000 */ lis r3, eventInfo@ha
/* 00011A6C 38630000 */ addi r3, r3, eventInfo@l
/* 00011A70 880301E0 */ lbz r0, 0x1e0(r3)
/* 00011A74 3BC301E0 */ addi r30, r3, 0x1e0
/* 00011A78 2C000002 */ cmpwi r0, 2
/* 00011A7C 4082000C */ bne lbl_00011A88
/* 00011A80 38600010 */ li r3, 0x10
/* 00011A84 4BFEE705 */ bl rend_efc_draw
lbl_00011A88:
/* 00011A88 3C600000 */ lis r3, eventInfo@ha
/* 00011A8C 38630000 */ addi r3, r3, eventInfo@l
/* 00011A90 88030078 */ lbz r0, 0x78(r3)
/* 00011A94 2C000002 */ cmpwi r0, 2
/* 00011A98 40820008 */ bne lbl_00011AA0
/* 00011A9C 4BFEE6ED */ bl item_draw
lbl_00011AA0:
/* 00011AA0 3C600000 */ lis r3, eventInfo@ha
/* 00011AA4 38630000 */ addi r3, r3, eventInfo@l
/* 00011AA8 88030060 */ lbz r0, 0x60(r3)
/* 00011AAC 2C000002 */ cmpwi r0, 2
/* 00011AB0 40820008 */ bne lbl_00011AB8
/* 00011AB4 4BFEE6D5 */ bl stobj_draw
lbl_00011AB8:
/* 00011AB8 3C600000 */ lis r3, eventInfo@ha
/* 00011ABC 38630000 */ addi r3, r3, eventInfo@l
/* 00011AC0 88030138 */ lbz r0, 0x138(r3)
/* 00011AC4 2C000002 */ cmpwi r0, 2
/* 00011AC8 40820008 */ bne lbl_00011AD0
/* 00011ACC 4BFEE6BD */ bl effect_draw
lbl_00011AD0:
/* 00011AD0 3C600000 */ lis r3, backgroundInfo@ha
/* 00011AD4 38630000 */ addi r3, r3, backgroundInfo@l
/* 00011AD8 80030008 */ lwz r0, 8(r3)
/* 00011ADC 3BA30008 */ addi r29, r3, 8
/* 00011AE0 540007FF */ clrlwi. r0, r0, 0x1f
/* 00011AE4 4182000C */ beq lbl_00011AF0
/* 00011AE8 38600000 */ li r3, 0
/* 00011AEC 4BFEE69D */ bl lens_flare_draw_mask
lbl_00011AF0:
/* 00011AF0 4BFEE699 */ bl ord_tbl_draw_nodes
/* 00011AF4 801D0000 */ lwz r0, 0(r29)
/* 00011AF8 540007FF */ clrlwi. r0, r0, 0x1f
/* 00011AFC 4182000C */ beq lbl_00011B08
/* 00011B00 38600000 */ li r3, 0
/* 00011B04 4BFEE685 */ bl lens_flare_draw
lbl_00011B08:
/* 00011B08 881E0000 */ lbz r0, 0(r30)
/* 00011B0C 2C000002 */ cmpwi r0, 2
/* 00011B10 4082000C */ bne lbl_00011B1C
/* 00011B14 38600008 */ li r3, 8
/* 00011B18 4BFEE671 */ bl rend_efc_draw
lbl_00011B1C:
/* 00011B1C C03F0008 */ lfs f1, 8(r31)
/* 00011B20 38600000 */ li r3, 0
/* 00011B24 C07F0010 */ lfs f3, 0x10(r31)
/* 00011B28 FC400890 */ fmr f2, f1
/* 00011B2C FC801890 */ fmr f4, f3
/* 00011B30 4BFEE659 */ bl setup_camera_viewport
/* 00011B34 38600000 */ li r3, 0
/* 00011B38 4BFEE651 */ bl set_current_camera
lbl_00011B3C:
/* 00011B3C 8001002C */ lwz r0, 0x2c(r1)
/* 00011B40 CBE10020 */ lfd f31, 0x20(r1)
/* 00011B44 CBC10018 */ lfd f30, 0x18(r1)
/* 00011B48 7C0803A6 */ mtlr r0
/* 00011B4C 83E10014 */ lwz r31, 0x14(r1)
/* 00011B50 83C10010 */ lwz r30, 0x10(r1)
/* 00011B54 83A1000C */ lwz r29, 0xc(r1)
/* 00011B58 38210028 */ addi r1, r1, 0x28
/* 00011B5C 4E800020 */ blr 
