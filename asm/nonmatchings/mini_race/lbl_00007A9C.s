/* 00007A9C 7C0802A6 */ mflr r0
/* 00007AA0 3C800000 */ lis r4, minigameGma@ha
/* 00007AA4 90010004 */ stw r0, 4(r1)
/* 00007AA8 3CA00000 */ lis r5, lbl_00013740@ha
/* 00007AAC 9421FF78 */ stwu r1, -0x88(r1)
/* 00007AB0 DBE10080 */ stfd f31, 0x80(r1)
/* 00007AB4 DBC10078 */ stfd f30, 0x78(r1)
/* 00007AB8 BF010058 */ stmw r24, 0x58(r1)
/* 00007ABC 3B040000 */ addi r24, r4, minigameGma@l
/* 00007AC0 3B430000 */ addi r26, r3, 0
/* 00007AC4 3BA50000 */ addi r29, r5, lbl_00013740@l
/* 00007AC8 80980000 */ lwz r4, 0(r24)
/* 00007ACC 83830144 */ lwz r28, 0x144(r3)
/* 00007AD0 80640008 */ lwz r3, 8(r4)
/* 00007AD4 806300A8 */ lwz r3, 0xa8(r3)
/* 00007AD8 4BFF86A5 */ bl avdisp_get_eff_vtxinfo
/* 00007ADC 80980000 */ lwz r4, 0(r24)
/* 00007AE0 7C7E1B78 */ mr r30, r3
/* 00007AE4 80640008 */ lwz r3, 8(r4)
/* 00007AE8 806300A8 */ lwz r3, 0xa8(r3)
/* 00007AEC 4BFF8691 */ bl avdisp_get_eff_vertices
/* 00007AF0 C3FD0070 */ lfs f31, 0x70(r29)
/* 00007AF4 3BE30000 */ addi r31, r3, 0
/* 00007AF8 387A0030 */ addi r3, r26, 0x30
/* 00007AFC FFC0F890 */ fmr f30, f31
/* 00007B00 4BFF867D */ bl mathutil_mtxA_from_mtx
/* 00007B04 C03A0074 */ lfs f1, 0x74(r26)
/* 00007B08 4BFF8675 */ bl mathutil_mtxA_scale_s
/* 00007B0C 3B210034 */ addi r25, r1, 0x34
/* 00007B10 3B600000 */ li r27, 0
/* 00007B14 48000190 */ b lbl_00007CA4
lbl_00007B18:
/* 00007B18 7F780734 */ extsh r24, r27
/* 00007B1C 57003032 */ slwi r0, r24, 6
/* 00007B20 7C7F0214 */ add r3, r31, r0
/* 00007B24 38810030 */ addi r4, r1, 0x30
/* 00007B28 4BFF8655 */ bl mathutil_mtxA_tf_vec
/* 00007B2C 38180001 */ addi r0, r24, 1
/* 00007B30 54003032 */ slwi r0, r0, 6
/* 00007B34 7C7F0214 */ add r3, r31, r0
/* 00007B38 3881003C */ addi r4, r1, 0x3c
/* 00007B3C 4BFF8641 */ bl mathutil_mtxA_tf_vec
/* 00007B40 38180002 */ addi r0, r24, 2
/* 00007B44 54003032 */ slwi r0, r0, 6
/* 00007B48 7C7F0214 */ add r3, r31, r0
/* 00007B4C 38810048 */ addi r4, r1, 0x48
/* 00007B50 4BFF862D */ bl mathutil_mtxA_tf_vec
/* 00007B54 C0810034 */ lfs f4, 0x34(r1)
/* 00007B58 C05D0008 */ lfs f2, 8(r29)
/* 00007B5C FC041040 */ fcmpo cr0, f4, f2
/* 00007B60 41810140 */ bgt lbl_00007CA0
/* 00007B64 C0210040 */ lfs f1, 0x40(r1)
/* 00007B68 FC011040 */ fcmpo cr0, f1, f2
/* 00007B6C 41810134 */ bgt lbl_00007CA0
/* 00007B70 C001004C */ lfs f0, 0x4c(r1)
/* 00007B74 FC001040 */ fcmpo cr0, f0, f2
/* 00007B78 41810128 */ bgt lbl_00007CA0
/* 00007B7C C061003C */ lfs f3, 0x3c(r1)
/* 00007B80 ECA12028 */ fsubs f5, f1, f4
/* 00007B84 C0410030 */ lfs f2, 0x30(r1)
/* 00007B88 EC202028 */ fsubs f1, f0, f4
/* 00007B8C C0010048 */ lfs f0, 0x48(r1)
/* 00007B90 ECC31028 */ fsubs f6, f3, f2
/* 00007B94 EC401028 */ fsubs f2, f0, f2
/* 00007B98 C0610044 */ lfs f3, 0x44(r1)
/* 00007B9C C0810038 */ lfs f4, 0x38(r1)
/* 00007BA0 38610024 */ addi r3, r1, 0x24
/* 00007BA4 C0010050 */ lfs f0, 0x50(r1)
/* 00007BA8 D0C10024 */ stfs f6, 0x24(r1)
/* 00007BAC EC632028 */ fsubs f3, f3, f4
/* 00007BB0 EC002028 */ fsubs f0, f0, f4
/* 00007BB4 D0410018 */ stfs f2, 0x18(r1)
/* 00007BB8 D0A10028 */ stfs f5, 0x28(r1)
/* 00007BBC D021001C */ stfs f1, 0x1c(r1)
/* 00007BC0 D061002C */ stfs f3, 0x2c(r1)
/* 00007BC4 D0010020 */ stfs f0, 0x20(r1)
/* 00007BC8 4BFF85B5 */ bl mathutil_vec_normalize_len
/* 00007BCC 38610018 */ addi r3, r1, 0x18
/* 00007BD0 4BFF85AD */ bl mathutil_vec_normalize_len
/* 00007BD4 C0E10028 */ lfs f7, 0x28(r1)
/* 00007BD8 C0610020 */ lfs f3, 0x20(r1)
/* 00007BDC C0C1002C */ lfs f6, 0x2c(r1)
/* 00007BE0 C0A10018 */ lfs f5, 0x18(r1)
/* 00007BE4 C1010024 */ lfs f8, 0x24(r1)
/* 00007BE8 C081001C */ lfs f4, 0x1c(r1)
/* 00007BEC EC4700F2 */ fmuls f2, f7, f3
/* 00007BF0 EC260172 */ fmuls f1, f6, f5
/* 00007BF4 EC080132 */ fmuls f0, f8, f4
/* 00007BF8 EC46113C */ fnmsubs f2, f6, f4, f2
/* 00007BFC D041000C */ stfs f2, 0xc(r1)
/* 00007C00 EC2808FC */ fnmsubs f1, f8, f3, f1
/* 00007C04 D0210010 */ stfs f1, 0x10(r1)
/* 00007C08 EC07017C */ fnmsubs f0, f7, f5, f0
/* 00007C0C D0010014 */ stfs f0, 0x14(r1)
/* 00007C10 C0BD0008 */ lfs f5, 8(r29)
/* 00007C14 C0810010 */ lfs f4, 0x10(r1)
/* 00007C18 FC052000 */ fcmpu cr0, f5, f4
/* 00007C1C 41820084 */ beq lbl_00007CA0
/* 00007C20 C061000C */ lfs f3, 0xc(r1)
/* 00007C24 FC1F2840 */ fcmpo cr0, f31, f5
/* 00007C28 C0410030 */ lfs f2, 0x30(r1)
/* 00007C2C C0210014 */ lfs f1, 0x14(r1)
/* 00007C30 C0010038 */ lfs f0, 0x38(r1)
/* 00007C34 EC4300B2 */ fmuls f2, f3, f2
/* 00007C38 C0610034 */ lfs f3, 0x34(r1)
/* 00007C3C EC010032 */ fmuls f0, f1, f0
/* 00007C40 EC02002A */ fadds f0, f2, f0
/* 00007C44 EC002024 */ fdivs f0, f0, f4
/* 00007C48 EC03002A */ fadds f0, f3, f0
/* 00007C4C FC200050 */ fneg f1, f0
/* 00007C50 41800014 */ blt lbl_00007C64
/* 00007C54 FC012840 */ fcmpo cr0, f1, f5
/* 00007C58 40810048 */ ble lbl_00007CA0
/* 00007C5C FC1F0840 */ fcmpo cr0, f31, f1
/* 00007C60 40810040 */ ble lbl_00007CA0
lbl_00007C64:
/* 00007C64 FFE00890 */ fmr f31, f1
/* 00007C68 C0210034 */ lfs f1, 0x34(r1)
/* 00007C6C 38600001 */ li r3, 1
/* 00007C70 48000020 */ b lbl_00007C90
lbl_00007C74:
/* 00007C74 7C600734 */ extsh r0, r3
/* 00007C78 1C00000C */ mulli r0, r0, 0xc
/* 00007C7C 7C19042E */ lfsx f0, r25, r0
/* 00007C80 FC000840 */ fcmpo cr0, f0, f1
/* 00007C84 40800008 */ bge lbl_00007C8C
/* 00007C88 FC200090 */ fmr f1, f0
lbl_00007C8C:
/* 00007C8C 38630001 */ addi r3, r3, 1
lbl_00007C90:
/* 00007C90 7C600734 */ extsh r0, r3
/* 00007C94 2C000003 */ cmpwi r0, 3
/* 00007C98 4180FFDC */ blt lbl_00007C74
/* 00007C9C FFC00850 */ fneg f30, f1
lbl_00007CA0:
/* 00007CA0 3B7B0003 */ addi r27, r27, 3
lbl_00007CA4:
/* 00007CA4 801E0000 */ lwz r0, 0(r30)
/* 00007CA8 7F630734 */ extsh r3, r27
/* 00007CAC 7C030040 */ cmplw r3, r0
/* 00007CB0 4180FE68 */ blt lbl_00007B18
/* 00007CB4 C01D0008 */ lfs f0, 8(r29)
/* 00007CB8 FC1F0040 */ fcmpo cr0, f31, f0
/* 00007CBC 4C401382 */ cror 2, 0, 2
/* 00007CC0 41820070 */ beq lbl_00007D30
/* 00007CC4 C01A0068 */ lfs f0, 0x68(r26)
/* 00007CC8 A81C01CE */ lha r0, 0x1ce(r28)
/* 00007CCC EFFE0028 */ fsubs f31, f30, f0
/* 00007CD0 2C000001 */ cmpwi r0, 1
/* 00007CD4 4082000C */ bne lbl_00007CE0
/* 00007CD8 38600133 */ li r3, 0x133
/* 00007CDC 4BFF84A1 */ bl u_play_sound_0
lbl_00007CE0:
/* 00007CE0 A81C01CE */ lha r0, 0x1ce(r28)
/* 00007CE4 2C000005 */ cmpwi r0, 5
/* 00007CE8 40810038 */ ble lbl_00007D20
/* 00007CEC C01D0008 */ lfs f0, 8(r29)
/* 00007CF0 FC1F0040 */ fcmpo cr0, f31, f0
/* 00007CF4 4081001C */ ble lbl_00007D10
/* 00007CF8 C01D02E4 */ lfs f0, 0x2e4(r29)
/* 00007CFC C03A0008 */ lfs f1, 8(r26)
/* 00007D00 EC0007F2 */ fmuls f0, f0, f31
/* 00007D04 EC01002A */ fadds f0, f1, f0
/* 00007D08 D01A0008 */ stfs f0, 8(r26)
/* 00007D0C 48000020 */ b lbl_00007D2C
lbl_00007D10:
/* 00007D10 C01A0008 */ lfs f0, 8(r26)
/* 00007D14 EC00F82A */ fadds f0, f0, f31
/* 00007D18 D01A0008 */ stfs f0, 8(r26)
/* 00007D1C 48000010 */ b lbl_00007D2C
lbl_00007D20:
/* 00007D20 C01A0008 */ lfs f0, 8(r26)
/* 00007D24 EC00F82A */ fadds f0, f0, f31
/* 00007D28 D01A0008 */ stfs f0, 8(r26)
lbl_00007D2C:
/* 00007D2C D3DA0068 */ stfs f30, 0x68(r26)
lbl_00007D30:
/* 00007D30 BB010058 */ lmw r24, 0x58(r1)
/* 00007D34 8001008C */ lwz r0, 0x8c(r1)
/* 00007D38 CBE10080 */ lfd f31, 0x80(r1)
/* 00007D3C CBC10078 */ lfd f30, 0x78(r1)
/* 00007D40 7C0803A6 */ mtlr r0
/* 00007D44 38210088 */ addi r1, r1, 0x88
/* 00007D48 4E800020 */ blr 
