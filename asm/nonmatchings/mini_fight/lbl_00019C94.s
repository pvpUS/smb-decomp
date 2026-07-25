/* 00019C94 7C0802A6 */ mflr r0
/* 00019C98 3C600000 */ lis r3, minigameGma@ha
/* 00019C9C 90010004 */ stw r0, 4(r1)
/* 00019CA0 3CA00000 */ lis r5, lbl_0001C7D8@ha
/* 00019CA4 3C800000 */ lis r4, lbl_10018FD0@ha
/* 00019CA8 9421FFB8 */ stwu r1, -0x48(r1)
/* 00019CAC BF610034 */ stmw r27, 0x34(r1)
/* 00019CB0 3BC30000 */ addi r30, r3, minigameGma@l
/* 00019CB4 3B850000 */ addi r28, r5, lbl_0001C7D8@l
/* 00019CB8 3BA40000 */ addi r29, r4, lbl_10018FD0@l
/* 00019CBC 807E0000 */ lwz r3, 0(r30)
/* 00019CC0 80630008 */ lwz r3, 8(r3)
/* 00019CC4 836301E8 */ lwz r27, 0x1e8(r3)
/* 00019CC8 4BFE649D */ bl mathutil_mtxA_from_mtxB
/* 00019CCC 387D001C */ addi r3, r29, 0x1c
/* 00019CD0 C0430000 */ lfs f2, 0(r3)
/* 00019CD4 C0230004 */ lfs f1, 4(r3)
/* 00019CD8 C0030008 */ lfs f0, 8(r3)
/* 00019CDC 3C60E000 */ lis r3, 0xe000
/* 00019CE0 D043000C */ stfs f2, 0xc(r3)
/* 00019CE4 D023001C */ stfs f1, 0x1c(r3)
/* 00019CE8 D003002C */ stfs f0, 0x2c(r3)
/* 00019CEC 3C600001 */ lis r3, 1
/* 00019CF0 38638000 */ addi r3, r3, -32768
/* 00019CF4 4BFE6471 */ bl mathutil_mtxA_rotate_y
/* 00019CF8 3C600000 */ lis r3, mathutilData@ha
/* 00019CFC 3BE30000 */ addi r31, r3, mathutilData@l
/* 00019D00 807F0000 */ lwz r3, 0(r31)
/* 00019D04 38800000 */ li r4, 0
/* 00019D08 4BFE645D */ bl GXLoadPosMtxImm
/* 00019D0C 807F0000 */ lwz r3, 0(r31)
/* 00019D10 38800000 */ li r4, 0
/* 00019D14 4BFE6451 */ bl GXLoadNrmMtxImm
/* 00019D18 7F63DB78 */ mr r3, r27
/* 00019D1C 4BFE6449 */ bl avdisp_draw_model_unculled_sort_translucent
/* 00019D20 4BFE6445 */ bl mathutil_mtxA_push
/* 00019D24 C01D0038 */ lfs f0, 0x38(r29)
/* 00019D28 FC00001E */ fctiwz f0, f0
/* 00019D2C D8010028 */ stfd f0, 0x28(r1)
/* 00019D30 8061002C */ lwz r3, 0x2c(r1)
/* 00019D34 4BFE6431 */ bl mathutil_mtxA_rotate_y
/* 00019D38 C01D0034 */ lfs f0, 0x34(r29)
/* 00019D3C FC00001E */ fctiwz f0, f0
/* 00019D40 D8010020 */ stfd f0, 0x20(r1)
/* 00019D44 80610024 */ lwz r3, 0x24(r1)
/* 00019D48 4BFE641D */ bl mathutil_mtxA_rotate_x
/* 00019D4C C01D003C */ lfs f0, 0x3c(r29)
/* 00019D50 FC00001E */ fctiwz f0, f0
/* 00019D54 D8010018 */ stfd f0, 0x18(r1)
/* 00019D58 8061001C */ lwz r3, 0x1c(r1)
/* 00019D5C 4BFE6409 */ bl mathutil_mtxA_rotate_z
/* 00019D60 807F0000 */ lwz r3, 0(r31)
/* 00019D64 38800000 */ li r4, 0
/* 00019D68 4BFE63FD */ bl GXLoadPosMtxImm
/* 00019D6C 807F0000 */ lwz r3, 0(r31)
/* 00019D70 38800000 */ li r4, 0
/* 00019D74 4BFE63F1 */ bl GXLoadNrmMtxImm
/* 00019D78 807E0000 */ lwz r3, 0(r30)
/* 00019D7C 80630008 */ lwz r3, 8(r3)
/* 00019D80 806301F8 */ lwz r3, 0x1f8(r3)
/* 00019D84 4BFE63E1 */ bl avdisp_draw_model_unculled_sort_translucent
/* 00019D88 4BFE63DD */ bl mathutil_mtxA_pop
/* 00019D8C C03C008C */ lfs f1, 0x8c(r28)
/* 00019D90 C01D0068 */ lfs f0, 0x68(r29)
/* 00019D94 EC01002A */ fadds f0, f1, f0
/* 00019D98 FC00001E */ fctiwz f0, f0
/* 00019D9C D8010010 */ stfd f0, 0x10(r1)
/* 00019DA0 80610014 */ lwz r3, 0x14(r1)
/* 00019DA4 4BFE63C1 */ bl mathutil_sin
/* 00019DA8 C01C0018 */ lfs f0, 0x18(r28)
/* 00019DAC C05C0088 */ lfs f2, 0x88(r28)
/* 00019DB0 EC810028 */ fsubs f4, f1, f0
/* 00019DB4 C07D0058 */ lfs f3, 0x58(r29)
/* 00019DB8 C03C0084 */ lfs f1, 0x84(r28)
/* 00019DBC C01D0050 */ lfs f0, 0x50(r29)
/* 00019DC0 EC820132 */ fmuls f4, f2, f4
/* 00019DC4 EC21002A */ fadds f1, f1, f0
/* 00019DC8 C05D0054 */ lfs f2, 0x54(r29)
/* 00019DCC EC63202A */ fadds f3, f3, f4
/* 00019DD0 4BFE6395 */ bl mathutil_mtxA_translate_xyz
/* 00019DD4 C01D0068 */ lfs f0, 0x68(r29)
/* 00019DD8 FC000050 */ fneg f0, f0
/* 00019DDC FC00001E */ fctiwz f0, f0
/* 00019DE0 D8010008 */ stfd f0, 8(r1)
/* 00019DE4 8001000C */ lwz r0, 0xc(r1)
/* 00019DE8 7C030734 */ extsh r3, r0
/* 00019DEC 4BFE6379 */ bl mathutil_mtxA_rotate_y
/* 00019DF0 807F0000 */ lwz r3, 0(r31)
/* 00019DF4 38800000 */ li r4, 0
/* 00019DF8 4BFE636D */ bl GXLoadPosMtxImm
/* 00019DFC 807F0000 */ lwz r3, 0(r31)
/* 00019E00 38800000 */ li r4, 0
/* 00019E04 4BFE6361 */ bl GXLoadNrmMtxImm
/* 00019E08 807E0000 */ lwz r3, 0(r30)
/* 00019E0C 80630008 */ lwz r3, 8(r3)
/* 00019E10 806301F0 */ lwz r3, 0x1f0(r3)
/* 00019E14 4BFE6351 */ bl avdisp_draw_model_unculled_sort_translucent
/* 00019E18 BB610034 */ lmw r27, 0x34(r1)
/* 00019E1C 8001004C */ lwz r0, 0x4c(r1)
/* 00019E20 38210048 */ addi r1, r1, 0x48
/* 00019E24 7C0803A6 */ mtlr r0
/* 00019E28 4E800020 */ blr 
