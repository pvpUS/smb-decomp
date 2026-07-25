/* 0000DB70 7C0802A6 */ mflr r0
/* 0000DB74 3C800000 */ lis r4, lbl_00013C48@ha
/* 0000DB78 90010004 */ stw r0, 4(r1)
/* 0000DB7C 9421FF88 */ stwu r1, -0x78(r1)
/* 0000DB80 DBE10070 */ stfd f31, 0x70(r1)
/* 0000DB84 BEC10048 */ stmw r22, 0x48(r1)
/* 0000DB88 3BC40000 */ addi r30, r4, lbl_00013C48@l
/* 0000DB8C 3C800000 */ lis r4, ballInfo@ha
/* 0000DB90 3BE40000 */ addi r31, r4, ballInfo@l
/* 0000DB94 3B430000 */ addi r26, r3, 0
/* 0000DB98 80BE0184 */ lwz r5, 0x184(r30)
/* 0000DB9C 801E0188 */ lwz r0, 0x188(r30)
/* 0000DBA0 90A10040 */ stw r5, 0x40(r1)
/* 0000DBA4 90010044 */ stw r0, 0x44(r1)
/* 0000DBA8 A8030014 */ lha r0, 0x14(r3)
/* 0000DBAC 1C0001A4 */ mulli r0, r0, 0x1a4
/* 0000DBB0 7C7F0214 */ add r3, r31, r0
/* 0000DBB4 88030148 */ lbz r0, 0x148(r3)
/* 0000DBB8 28000010 */ cmplwi r0, 0x10
/* 0000DBBC 41820288 */ beq lbl_0000DE44
/* 0000DBC0 28000012 */ cmplwi r0, 0x12
/* 0000DBC4 40820008 */ bne lbl_0000DBCC
/* 0000DBC8 4800027C */ b lbl_0000DE44
lbl_0000DBCC:
/* 0000DBCC 4BFF25B1 */ bl mathutil_mtxA_from_identity
/* 0000DBD0 807A0008 */ lwz r3, 8(r26)
/* 0000DBD4 4BFF25A9 */ bl mathutil_mtxA_translate
/* 0000DBD8 A07A0002 */ lhz r3, 2(r26)
/* 0000DBDC 4BFF25A1 */ bl mathutil_mtxA_rotate_z
/* 0000DBE0 38604000 */ li r3, 0x4000
/* 0000DBE4 4BFF2599 */ bl mathutil_mtxA_rotate_x
/* 0000DBE8 C03A0004 */ lfs f1, 4(r26)
/* 0000DBEC 4BFF2591 */ bl mathutil_mtxA_scale_s
/* 0000DBF0 C03A0004 */ lfs f1, 4(r26)
/* 0000DBF4 4BFF2589 */ bl avdisp_set_bound_sphere_scale
/* 0000DBF8 4BFF2585 */ bl mathutil_mtxA_push
/* 0000DBFC C03A000C */ lfs f1, 0xc(r26)
/* 0000DC00 4BFF257D */ bl avdisp_set_alpha
/* 0000DC04 3C600000 */ lis r3, mathutilData@ha
/* 0000DC08 38630000 */ addi r3, r3, mathutilData@l
/* 0000DC0C 80630000 */ lwz r3, 0(r3)
/* 0000DC10 38800000 */ li r4, 0
/* 0000DC14 4BFF2569 */ bl gxutil_load_pos_nrm_matrix
/* 0000DC18 3C600000 */ lis r3, decodedStageGmaPtr@ha
/* 0000DC1C A81A0000 */ lha r0, 0(r26)
/* 0000DC20 38630000 */ addi r3, r3, decodedStageGmaPtr@l
/* 0000DC24 80630000 */ lwz r3, 0(r3)
/* 0000DC28 54001838 */ slwi r0, r0, 3
/* 0000DC2C 80630008 */ lwz r3, 8(r3)
/* 0000DC30 7C63002E */ lwzx r3, r3, r0
/* 0000DC34 4BFF2549 */ bl avdisp_draw_model_unculled_sort_none
/* 0000DC38 38610030 */ addi r3, r1, 0x30
/* 0000DC3C 3B600000 */ li r27, 0
/* 0000DC40 4800001C */ b lbl_0000DC5C
lbl_0000DC44:
/* 0000DC44 7F650734 */ extsh r5, r27
/* 0000DC48 1C0501A4 */ mulli r0, r5, 0x1a4
/* 0000DC4C 7C9F0214 */ add r4, r31, r0
/* 0000DC50 54A0103A */ slwi r0, r5, 2
/* 0000DC54 7C83012E */ stwx r4, r3, r0
/* 0000DC58 3B7B0001 */ addi r27, r27, 1
lbl_0000DC5C:
/* 0000DC5C 7F600734 */ extsh r0, r27
/* 0000DC60 2C000004 */ cmpwi r0, 4
/* 0000DC64 4180FFE0 */ blt lbl_0000DC44
/* 0000DC68 A81A0014 */ lha r0, 0x14(r26)
/* 0000DC6C 3C800000 */ lis r4, mathutilData@ha
/* 0000DC70 3C600000 */ lis r3, ballInfo@ha
/* 0000DC74 80C1003C */ lwz r6, 0x3c(r1)
/* 0000DC78 1CA001A4 */ mulli r5, r0, 0x1a4
/* 0000DC7C 38030000 */ addi r0, r3, ballInfo@l
/* 0000DC80 7C002A14 */ add r0, r0, r5
/* 0000DC84 9001003C */ stw r0, 0x3c(r1)
/* 0000DC88 3C600000 */ lis r3, minigameGma@ha
/* 0000DC8C 3BE10030 */ addi r31, r1, 0x30
/* 0000DC90 A81A0014 */ lha r0, 0x14(r26)
/* 0000DC94 3BA10018 */ addi r29, r1, 0x18
/* 0000DC98 3AE40000 */ addi r23, r4, mathutilData@l
/* 0000DC9C 5400103A */ slwi r0, r0, 2
/* 0000DCA0 7CDF012E */ stwx r6, r31, r0
/* 0000DCA4 3B030000 */ addi r24, r3, minigameGma@l
/* 0000DCA8 3B210040 */ addi r25, r1, 0x40
/* 0000DCAC 3B600000 */ li r27, 0
/* 0000DCB0 48000184 */ b lbl_0000DE34
lbl_0000DCB4:
/* 0000DCB4 7F600734 */ extsh r0, r27
/* 0000DCB8 5400103A */ slwi r0, r0, 2
/* 0000DCBC 7F9F002E */ lwzx r28, r31, r0
/* 0000DCC0 881C0000 */ lbz r0, 0(r28)
/* 0000DCC4 2C000002 */ cmpwi r0, 2
/* 0000DCC8 40820168 */ bne lbl_0000DE30
/* 0000DCCC 807C0144 */ lwz r3, 0x144(r28)
/* 0000DCD0 80030014 */ lwz r0, 0x14(r3)
/* 0000DCD4 54000673 */ rlwinm. r0, r0, 0, 0x19, 0x19
/* 0000DCD8 40820158 */ bne lbl_0000DE30
/* 0000DCDC 807C0004 */ lwz r3, 4(r28)
/* 0000DCE0 801C0008 */ lwz r0, 8(r28)
/* 0000DCE4 90610024 */ stw r3, 0x24(r1)
/* 0000DCE8 90010028 */ stw r0, 0x28(r1)
/* 0000DCEC 801C000C */ lwz r0, 0xc(r28)
/* 0000DCF0 9001002C */ stw r0, 0x2c(r1)
/* 0000DCF4 C01E0018 */ lfs f0, 0x18(r30)
/* 0000DCF8 D0010028 */ stfs f0, 0x28(r1)
/* 0000DCFC C03C0004 */ lfs f1, 4(r28)
/* 0000DD00 C01C0010 */ lfs f0, 0x10(r28)
/* 0000DD04 EC010028 */ fsubs f0, f1, f0
/* 0000DD08 D0010018 */ stfs f0, 0x18(r1)
/* 0000DD0C C03C0008 */ lfs f1, 8(r28)
/* 0000DD10 C01C0014 */ lfs f0, 0x14(r28)
/* 0000DD14 EC010028 */ fsubs f0, f1, f0
/* 0000DD18 D001001C */ stfs f0, 0x1c(r1)
/* 0000DD1C C03C000C */ lfs f1, 0xc(r28)
/* 0000DD20 C01C0018 */ lfs f0, 0x18(r28)
/* 0000DD24 EC010028 */ fsubs f0, f1, f0
/* 0000DD28 D0010020 */ stfs f0, 0x20(r1)
/* 0000DD2C C0410018 */ lfs f2, 0x18(r1)
/* 0000DD30 C021001C */ lfs f1, 0x1c(r1)
/* 0000DD34 C0010020 */ lfs f0, 0x20(r1)
/* 0000DD38 EC4200B2 */ fmuls f2, f2, f2
/* 0000DD3C EC41107A */ fmadds f2, f1, f1, f2
/* 0000DD40 EC40103A */ fmadds f2, f0, f0, f2
/* 0000DD44 C01E0198 */ lfs f0, 0x198(r30)
/* 0000DD48 FC020040 */ fcmpo cr0, f2, f0
/* 0000DD4C 4080004C */ bge lbl_0000DD98
/* 0000DD50 807C00FC */ lwz r3, 0xfc(r28)
/* 0000DD54 38630060 */ addi r3, r3, 0x60
/* 0000DD58 4BFF2425 */ bl mathutil_mtxA_from_quat
/* 0000DD5C 80BE018C */ lwz r5, 0x18c(r30)
/* 0000DD60 7FA3EB78 */ mr r3, r29
/* 0000DD64 801E0190 */ lwz r0, 0x190(r30)
/* 0000DD68 7FA4EB78 */ mr r4, r29
/* 0000DD6C 90A1000C */ stw r5, 0xc(r1)
/* 0000DD70 90010010 */ stw r0, 0x10(r1)
/* 0000DD74 801E0194 */ lwz r0, 0x194(r30)
/* 0000DD78 90010014 */ stw r0, 0x14(r1)
/* 0000DD7C 80A1000C */ lwz r5, 0xc(r1)
/* 0000DD80 80010010 */ lwz r0, 0x10(r1)
/* 0000DD84 90A10018 */ stw r5, 0x18(r1)
/* 0000DD88 9001001C */ stw r0, 0x1c(r1)
/* 0000DD8C 80010014 */ lwz r0, 0x14(r1)
/* 0000DD90 90010020 */ stw r0, 0x20(r1)
/* 0000DD94 4BFF23E9 */ bl mathutil_mtxA_tf_vec
lbl_0000DD98:
/* 0000DD98 C0210018 */ lfs f1, 0x18(r1)
/* 0000DD9C C0410020 */ lfs f2, 0x20(r1)
/* 0000DDA0 4BFF23DD */ bl mathutil_atan2
/* 0000DDA4 3EC30001 */ addis r22, r3, 1
/* 0000DDA8 3AD6C000 */ addi r22, r22, -16384
/* 0000DDAC 4BFF23D1 */ bl mathutil_mtxA_peek
/* 0000DDB0 38610024 */ addi r3, r1, 0x24
/* 0000DDB4 4BFF23C9 */ bl mathutil_mtxA_translate
/* 0000DDB8 56C3043E */ clrlwi r3, r22, 0x10
/* 0000DDBC 4BFF23C1 */ bl mathutil_mtxA_rotate_y
/* 0000DDC0 7F600734 */ extsh r0, r27
/* 0000DDC4 2C000003 */ cmpwi r0, 3
/* 0000DDC8 4082000C */ bne lbl_0000DDD4
/* 0000DDCC C3FE00E4 */ lfs f31, 0xe4(r30)
/* 0000DDD0 48000008 */ b lbl_0000DDD8
lbl_0000DDD4:
/* 0000DDD4 C3FE019C */ lfs f31, 0x19c(r30)
lbl_0000DDD8:
/* 0000DDD8 C03E01A0 */ lfs f1, 0x1a0(r30)
/* 0000DDDC C01A0004 */ lfs f0, 4(r26)
/* 0000DDE0 EC2107F2 */ fmuls f1, f1, f31
/* 0000DDE4 EFE10024 */ fdivs f31, f1, f0
/* 0000DDE8 FC20F890 */ fmr f1, f31
/* 0000DDEC 4BFF2391 */ bl mathutil_mtxA_scale_s
/* 0000DDF0 C01A0004 */ lfs f0, 4(r26)
/* 0000DDF4 EC3F0032 */ fmuls f1, f31, f0
/* 0000DDF8 4BFF2385 */ bl avdisp_set_bound_sphere_scale
/* 0000DDFC C03A0010 */ lfs f1, 0x10(r26)
/* 0000DE00 4BFF237D */ bl avdisp_set_alpha
/* 0000DE04 80770000 */ lwz r3, 0(r23)
/* 0000DE08 38800000 */ li r4, 0
/* 0000DE0C 4BFF2371 */ bl gxutil_load_pos_nrm_matrix
/* 0000DE10 881C014A */ lbz r0, 0x14a(r28)
/* 0000DE14 80780000 */ lwz r3, 0(r24)
/* 0000DE18 5400083C */ slwi r0, r0, 1
/* 0000DE1C 7C1902AE */ lhax r0, r25, r0
/* 0000DE20 80630008 */ lwz r3, 8(r3)
/* 0000DE24 54001838 */ slwi r0, r0, 3
/* 0000DE28 7C63002E */ lwzx r3, r3, r0
/* 0000DE2C 4BFF2351 */ bl avdisp_draw_model_unculled_sort_none
lbl_0000DE30:
/* 0000DE30 3B7B0001 */ addi r27, r27, 1
lbl_0000DE34:
/* 0000DE34 7F600734 */ extsh r0, r27
/* 0000DE38 2C000004 */ cmpwi r0, 4
/* 0000DE3C 4180FE78 */ blt lbl_0000DCB4
/* 0000DE40 4BFF233D */ bl mathutil_incr_mtx_stack
lbl_0000DE44:
/* 0000DE44 BAC10048 */ lmw r22, 0x48(r1)
/* 0000DE48 8001007C */ lwz r0, 0x7c(r1)
/* 0000DE4C CBE10070 */ lfd f31, 0x70(r1)
/* 0000DE50 38210078 */ addi r1, r1, 0x78
/* 0000DE54 7C0803A6 */ mtlr r0
/* 0000DE58 4E800020 */ blr 
