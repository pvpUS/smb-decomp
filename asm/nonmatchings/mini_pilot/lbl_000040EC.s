/* 000040EC 7C0802A6 */ mflr r0
/* 000040F0 3C800000 */ lis r4, lbl_0000BE80@ha
/* 000040F4 90010004 */ stw r0, 4(r1)
/* 000040F8 3CA00000 */ lis r5, lbl_802F1FDC@ha
/* 000040FC 9421FF80 */ stwu r1, -0x80(r1)
/* 00004100 DBE10078 */ stfd f31, 0x78(r1)
/* 00004104 DBC10070 */ stfd f30, 0x70(r1)
/* 00004108 BF61005C */ stmw r27, 0x5c(r1)
/* 0000410C 3BC40000 */ addi r30, r4, lbl_0000BE80@l
/* 00004110 3C800000 */ lis r4, ballInfo@ha
/* 00004114 801E01E0 */ lwz r0, 0x1e0(r30)
/* 00004118 80DE01E4 */ lwz r6, 0x1e4(r30)
/* 0000411C 90010034 */ stw r0, 0x34(r1)
/* 00004120 38040000 */ addi r0, r4, ballInfo@l
/* 00004124 90C10038 */ stw r6, 0x38(r1)
/* 00004128 80DE01E8 */ lwz r6, 0x1e8(r30)
/* 0000412C 809E01EC */ lwz r4, 0x1ec(r30)
/* 00004130 90C1003C */ stw r6, 0x3c(r1)
/* 00004134 90810040 */ stw r4, 0x40(r1)
/* 00004138 809E01F0 */ lwz r4, 0x1f0(r30)
/* 0000413C 90810044 */ stw r4, 0x44(r1)
/* 00004140 80DE01F4 */ lwz r6, 0x1f4(r30)
/* 00004144 809E01F8 */ lwz r4, 0x1f8(r30)
/* 00004148 90C10020 */ stw r6, 0x20(r1)
/* 0000414C 90810024 */ stw r4, 0x24(r1)
/* 00004150 80DE01FC */ lwz r6, 0x1fc(r30)
/* 00004154 809E0200 */ lwz r4, 0x200(r30)
/* 00004158 90C10028 */ stw r6, 0x28(r1)
/* 0000415C 9081002C */ stw r4, 0x2c(r1)
/* 00004160 809E0204 */ lwz r4, 0x204(r30)
/* 00004164 90810030 */ stw r4, 0x30(r1)
/* 00004168 80DE0208 */ lwz r6, 0x208(r30)
/* 0000416C 809E020C */ lwz r4, 0x20c(r30)
/* 00004170 90C1000C */ stw r6, 0xc(r1)
/* 00004174 90810010 */ stw r4, 0x10(r1)
/* 00004178 80DE0210 */ lwz r6, 0x210(r30)
/* 0000417C 809E0214 */ lwz r4, 0x214(r30)
/* 00004180 90C10014 */ stw r6, 0x14(r1)
/* 00004184 90810018 */ stw r4, 0x18(r1)
/* 00004188 809E0218 */ lwz r4, 0x218(r30)
/* 0000418C 9081001C */ stw r4, 0x1c(r1)
/* 00004190 8083000C */ lwz r4, 0xc(r3)
/* 00004194 C3C50000 */ lfs f30, lbl_802F1FDC@l(r5)
/* 00004198 1C8401A4 */ mulli r4, r4, 0x1a4
/* 0000419C 80630008 */ lwz r3, 8(r3)
/* 000041A0 7FA02214 */ add r29, r0, r4
/* 000041A4 4BFFBFA9 */ bl load_light_group_cached
/* 000041A8 3C600000 */ lis r3, lbl_10000000@ha
/* 000041AC C83E0220 */ lfd f1, 0x220(r30)
/* 000041B0 C0030000 */ lfs f0, lbl_10000000@l(r3)
/* 000041B4 FC010032 */ fmul f0, f1, f0
/* 000041B8 FC00001E */ fctiwz f0, f0
/* 000041BC D8010048 */ stfd f0, 0x48(r1)
/* 000041C0 8001004C */ lwz r0, 0x4c(r1)
/* 000041C4 D8010050 */ stfd f0, 0x50(r1)
/* 000041C8 7C000734 */ extsh r0, r0
/* 000041CC 2C000600 */ cmpwi r0, 0x600
/* 000041D0 80610054 */ lwz r3, 0x54(r1)
/* 000041D4 4081000C */ ble lbl_000041E0
/* 000041D8 38600600 */ li r3, 0x600
/* 000041DC 48000014 */ b lbl_000041F0
lbl_000041E0:
/* 000041E0 7C600734 */ extsh r0, r3
/* 000041E4 2C00FE80 */ cmpwi r0, -384
/* 000041E8 40800008 */ bge lbl_000041F0
/* 000041EC 3860FE80 */ li r3, -384
lbl_000041F0:
/* 000041F0 7C630734 */ extsh r3, r3
/* 000041F4 C81E0198 */ lfd f0, 0x198(r30)
/* 000041F8 38034A00 */ addi r0, r3, 0x4a00
/* 000041FC 6C008000 */ xoris r0, r0, 0x8000
/* 00004200 9001004C */ stw r0, 0x4c(r1)
/* 00004204 3C004330 */ lis r0, 0x4330
/* 00004208 3C600000 */ lis r3, lbl_0000BEE0@ha
/* 0000420C 90010048 */ stw r0, 0x48(r1)
/* 00004210 3C800000 */ lis r4, lbl_802F1FDC@ha
/* 00004214 C8430000 */ lfd f2, lbl_0000BEE0@l(r3)
/* 00004218 3C600000 */ lis r3, lbl_802F1FD0@ha
/* 0000421C C8210048 */ lfd f1, 0x48(r1)
/* 00004220 80030000 */ lwz r0, lbl_802F1FD0@l(r3)
/* 00004224 FC211028 */ fsub f1, f1, f2
/* 00004228 C0840000 */ lfs f4, lbl_802F1FDC@l(r4)
/* 0000422C 540006B5 */ rlwinm. r0, r0, 0, 0x1a, 0x1a
/* 00004230 FC240072 */ fmul f1, f4, f1
/* 00004234 FC010024 */ fdiv f0, f1, f0
/* 00004238 FC00001E */ fctiwz f0, f0
/* 0000423C D8010050 */ stfd f0, 0x50(r1)
/* 00004240 83E10054 */ lwz r31, 0x54(r1)
/* 00004244 41820008 */ beq lbl_0000424C
/* 00004248 C3DE0228 */ lfs f30, 0x228(r30)
lbl_0000424C:
/* 0000424C C81E0198 */ lfd f0, 0x198(r30)
/* 00004250 3C600000 */ lis r3, currentCamera@ha
/* 00004254 38630000 */ addi r3, r3, currentCamera@l
/* 00004258 C87E0068 */ lfd f3, 0x68(r30)
/* 0000425C FC3E0024 */ fdiv f1, f30, f0
/* 00004260 80630000 */ lwz r3, 0(r3)
/* 00004264 C85E0238 */ lfd f2, 0x238(r30)
/* 00004268 80030204 */ lwz r0, 0x204(r3)
/* 0000426C C8BE0230 */ lfd f5, 0x230(r30)
/* 00004270 FC840024 */ fdiv f4, f4, f0
/* 00004274 5400103A */ slwi r0, r0, 2
/* 00004278 7C7D0214 */ add r3, r29, r0
/* 0000427C C003015C */ lfs f0, 0x15c(r3)
/* 00004280 FC220072 */ fmul f1, f2, f1
/* 00004284 FC030032 */ fmul f0, f3, f0
/* 00004288 FFE50132 */ fmul f31, f5, f4
/* 0000428C FFC30828 */ fsub f30, f3, f1
/* 00004290 FC23002A */ fadd f1, f3, f0
/* 00004294 FFE0F818 */ frsp f31, f31
/* 00004298 FFC0F018 */ frsp f30, f30
/* 0000429C FC200818 */ frsp f1, f1
/* 000042A0 4BFFBEAD */ bl polydisp_set_some_color_based_on_curr_mode
/* 000042A4 38600001 */ li r3, 1
/* 000042A8 38800003 */ li r4, 3
/* 000042AC 38A00000 */ li r5, 0
/* 000042B0 4BFFBE9D */ bl avdisp_set_z_mode
/* 000042B4 4BFFBE99 */ bl mathutil_mtxA_from_mtxB
/* 000042B8 387D0030 */ addi r3, r29, 0x30
/* 000042BC 4BFFBE91 */ bl mathutil_mtxA_mult_right
/* 000042C0 C03E0030 */ lfs f1, 0x30(r30)
/* 000042C4 FC40F090 */ fmr f2, f30
/* 000042C8 FC600890 */ fmr f3, f1
/* 000042CC 4BFFBE81 */ bl mathutil_mtxA_translate_xyz
/* 000042D0 4BFFBE7D */ bl mathutil_mtxA_push
/* 000042D4 C05E0030 */ lfs f2, 0x30(r30)
/* 000042D8 FC20F850 */ fneg f1, f31
/* 000042DC FC601090 */ fmr f3, f2
/* 000042E0 4BFFBE6D */ bl mathutil_mtxA_translate_xyz
/* 000042E4 7FE00734 */ extsh r0, r31
/* 000042E8 7C6000D0 */ neg r3, r0
/* 000042EC 4BFFBE61 */ bl mathutil_mtxA_rotate_z
/* 000042F0 3C600000 */ lis r3, mathutilData@ha
/* 000042F4 3B630000 */ addi r27, r3, mathutilData@l
/* 000042F8 807B0000 */ lwz r3, 0(r27)
/* 000042FC 38800000 */ li r4, 0
/* 00004300 4BFFBE4D */ bl gxutil_load_pos_nrm_matrix
/* 00004304 3C600000 */ lis r3, minigameGma@ha
/* 00004308 3B830000 */ addi r28, r3, minigameGma@l
/* 0000430C 807C0000 */ lwz r3, 0(r28)
/* 00004310 80630008 */ lwz r3, 8(r3)
/* 00004314 80630000 */ lwz r3, 0(r3)
/* 00004318 4BFFBE35 */ bl avdisp_draw_model_unculled_sort_none
/* 0000431C 807C0000 */ lwz r3, 0(r28)
/* 00004320 80630008 */ lwz r3, 8(r3)
/* 00004324 80630008 */ lwz r3, 8(r3)
/* 00004328 4BFFBE25 */ bl avdisp_draw_model_unculled_sort_none
/* 0000432C 3C600000 */ lis r3, lbl_802F1FDC@ha
/* 00004330 C81E01B0 */ lfd f0, 0x1b0(r30)
/* 00004334 C0230000 */ lfs f1, lbl_802F1FDC@l(r3)
/* 00004338 FC010040 */ fcmpo cr0, f1, f0
/* 0000433C 4081002C */ ble lbl_00004368
/* 00004340 3C600001 */ lis r3, 1
/* 00004344 38638000 */ addi r3, r3, -32768
/* 00004348 4BFFBE05 */ bl mathutil_mtxA_rotate_y
/* 0000434C 807B0000 */ lwz r3, 0(r27)
/* 00004350 38800000 */ li r4, 0
/* 00004354 4BFFBDF9 */ bl gxutil_load_pos_nrm_matrix
/* 00004358 807C0000 */ lwz r3, 0(r28)
/* 0000435C 80630008 */ lwz r3, 8(r3)
/* 00004360 806300E0 */ lwz r3, 0xe0(r3)
/* 00004364 4BFFBDE9 */ bl avdisp_draw_model_unculled_sort_none
lbl_00004368:
/* 00004368 4BFFBDE5 */ bl mathutil_mtxA_pop
/* 0000436C C05E0030 */ lfs f2, 0x30(r30)
/* 00004370 FC20F890 */ fmr f1, f31
/* 00004374 FC601090 */ fmr f3, f2
/* 00004378 4BFFBDD5 */ bl mathutil_mtxA_translate_xyz
/* 0000437C 7FE30734 */ extsh r3, r31
/* 00004380 4BFFBDCD */ bl mathutil_mtxA_rotate_z
/* 00004384 3C600000 */ lis r3, mathutilData@ha
/* 00004388 38630000 */ addi r3, r3, mathutilData@l
/* 0000438C 80630000 */ lwz r3, 0(r3)
/* 00004390 38800000 */ li r4, 0
/* 00004394 4BFFBDB9 */ bl gxutil_load_pos_nrm_matrix
/* 00004398 881D014A */ lbz r0, 0x14a(r29)
/* 0000439C 3C600000 */ lis r3, minigameGma@ha
/* 000043A0 3BE30000 */ addi r31, r3, minigameGma@l
/* 000043A4 809F0000 */ lwz r4, 0(r31)
/* 000043A8 5400083C */ slwi r0, r0, 1
/* 000043AC 38610020 */ addi r3, r1, 0x20
/* 000043B0 7C0302AE */ lhax r0, r3, r0
/* 000043B4 80640008 */ lwz r3, 8(r4)
/* 000043B8 54001838 */ slwi r0, r0, 3
/* 000043BC 7C63002E */ lwzx r3, r3, r0
/* 000043C0 4BFFBD8D */ bl avdisp_draw_model_unculled_sort_none
/* 000043C4 881D014A */ lbz r0, 0x14a(r29)
/* 000043C8 38610034 */ addi r3, r1, 0x34
/* 000043CC 809F0000 */ lwz r4, 0(r31)
/* 000043D0 5400083C */ slwi r0, r0, 1
/* 000043D4 7C0302AE */ lhax r0, r3, r0
/* 000043D8 80640008 */ lwz r3, 8(r4)
/* 000043DC 54001838 */ slwi r0, r0, 3
/* 000043E0 7C63002E */ lwzx r3, r3, r0
/* 000043E4 4BFFBD69 */ bl avdisp_draw_model_unculled_sort_none
/* 000043E8 3C600000 */ lis r3, lbl_802F1FDC@ha
/* 000043EC C81E01B0 */ lfd f0, 0x1b0(r30)
/* 000043F0 C0230000 */ lfs f1, lbl_802F1FDC@l(r3)
/* 000043F4 FC010040 */ fcmpo cr0, f1, f0
/* 000043F8 40810028 */ ble lbl_00004420
/* 000043FC 881D014A */ lbz r0, 0x14a(r29)
/* 00004400 3861000C */ addi r3, r1, 0xc
/* 00004404 809F0000 */ lwz r4, 0(r31)
/* 00004408 5400083C */ slwi r0, r0, 1
/* 0000440C 7C0302AE */ lhax r0, r3, r0
/* 00004410 80640008 */ lwz r3, 8(r4)
/* 00004414 54001838 */ slwi r0, r0, 3
/* 00004418 7C63002E */ lwzx r3, r3, r0
/* 0000441C 4BFFBD31 */ bl avdisp_draw_model_unculled_sort_none
lbl_00004420:
/* 00004420 4BFFBD2D */ bl fade_color_base_default
/* 00004424 38600001 */ li r3, 1
/* 00004428 38800003 */ li r4, 3
/* 0000442C 38A00001 */ li r5, 1
/* 00004430 4BFFBD1D */ bl avdisp_set_z_mode
/* 00004434 BB61005C */ lmw r27, 0x5c(r1)
/* 00004438 80010084 */ lwz r0, 0x84(r1)
/* 0000443C CBE10078 */ lfd f31, 0x78(r1)
/* 00004440 CBC10070 */ lfd f30, 0x70(r1)
/* 00004444 7C0803A6 */ mtlr r0
/* 00004448 38210080 */ addi r1, r1, 0x80
/* 0000444C 4E800020 */ blr 
