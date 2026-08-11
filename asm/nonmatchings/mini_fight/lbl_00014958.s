lbl_00014958:
/* 00014958 7C0802A6 */ mflr r0
/* 0001495C 3CA00000 */ lis r5, lbl_0001C540@ha
/* 00014960 90010004 */ stw r0, 4(r1)
/* 00014964 9421FF30 */ stwu r1, -0xd0(r1)
/* 00014968 93E100CC */ stw r31, 0xcc(r1)
/* 0001496C 3BE50000 */ addi r31, r5, lbl_0001C540@l
/* 00014970 93C100C8 */ stw r30, 0xc8(r1)
/* 00014974 3BC40000 */ addi r30, r4, 0
/* 00014978 93A100C4 */ stw r29, 0xc4(r1)
/* 0001497C 7C7D1B78 */ mr r29, r3
/* 00014980 80030008 */ lwz r0, 8(r3)
/* 00014984 3C600000 */ lis r3, infoWork@ha
/* 00014988 38630000 */ addi r3, r3, infoWork@l
/* 0001498C 540007FA */ rlwinm r0, r0, 0, 0x1f, 0x1d
/* 00014990 901D0008 */ stw r0, 8(r29)
/* 00014994 38000004 */ li r0, 4
/* 00014998 B01D000E */ sth r0, 0xe(r29)
/* 0001499C 38000002 */ li r0, 2
/* 000149A0 C83F0060 */ lfd f1, 0x60(r31)
/* 000149A4 C01D0014 */ lfs f0, 0x14(r29)
/* 000149A8 FC010032 */ fmul f0, f1, f0
/* 000149AC FC000018 */ frsp f0, f0
/* 000149B0 D01D0030 */ stfs f0, 0x30(r29)
/* 000149B4 A89D0040 */ lha r4, 0x40(r29)
/* 000149B8 7C800030 */ slw r0, r4, r0
/* 000149BC 7C000734 */ extsh r0, r0
/* 000149C0 B01D0040 */ sth r0, 0x40(r29)
/* 000149C4 C83F0068 */ lfd f1, 0x68(r31)
/* 000149C8 C01E001C */ lfs f0, 0x1c(r30)
/* 000149CC C05D002C */ lfs f2, 0x2c(r29)
/* 000149D0 FC010032 */ fmul f0, f1, f0
/* 000149D4 FC02002A */ fadd f0, f2, f0
/* 000149D8 FC000018 */ frsp f0, f0
/* 000149DC D01D002C */ stfs f0, 0x2c(r29)
/* 000149E0 C83F0068 */ lfd f1, 0x68(r31)
/* 000149E4 C01E0020 */ lfs f0, 0x20(r30)
/* 000149E8 C05D0030 */ lfs f2, 0x30(r29)
/* 000149EC FC010032 */ fmul f0, f1, f0
/* 000149F0 FC02002A */ fadd f0, f2, f0
/* 000149F4 FC000018 */ frsp f0, f0
/* 000149F8 D01D0030 */ stfs f0, 0x30(r29)
/* 000149FC C83F0068 */ lfd f1, 0x68(r31)
/* 00014A00 C01E0024 */ lfs f0, 0x24(r30)
/* 00014A04 C05D0034 */ lfs f2, 0x34(r29)
/* 00014A08 FC010032 */ fmul f0, f1, f0
/* 00014A0C FC02002A */ fadd f0, f2, f0
/* 00014A10 FC000018 */ frsp f0, f0
/* 00014A14 D01D0034 */ stfs f0, 0x34(r29)
/* 00014A18 80630000 */ lwz r3, 0(r3)
/* 00014A1C 546006F7 */ rlwinm. r0, r3, 0, 0x1b, 0x1b
/* 00014A20 4182000C */ beq lbl_00014A2C
/* 00014A24 54600529 */ rlwinm. r0, r3, 0, 0x14, 0x14
/* 00014A28 41820114 */ beq lbl_00014B3C
lbl_00014A2C:
/* 00014A2C A81D0006 */ lha r0, 6(r29)
/* 00014A30 3C600000 */ lis r3, lbl_0001D838@ha
/* 00014A34 38630000 */ addi r3, r3, lbl_0001D838@l
/* 00014A38 54002036 */ slwi r0, r0, 4
/* 00014A3C 7C630214 */ add r3, r3, r0
/* 00014A40 A8630008 */ lha r3, 8(r3)
/* 00014A44 4BFEB721 */ bl give_bananas
/* 00014A48 3C800000 */ lis r4, g_poolInfo@ha
/* 00014A4C A87D0000 */ lha r3, 0(r29)
/* 00014A50 38840000 */ addi r4, r4, g_poolInfo@l
/* 00014A54 8084001C */ lwz r4, 0x1c(r4)
/* 00014A58 38A00003 */ li r5, 3
/* 00014A5C 38000000 */ li r0, 0
/* 00014A60 7CA419AE */ stbx r5, r4, r3
/* 00014A64 38610010 */ addi r3, r1, 0x10
/* 00014A68 38800000 */ li r4, 0
/* 00014A6C B01D000E */ sth r0, 0xe(r29)
/* 00014A70 38A000AC */ li r5, 0xac
/* 00014A74 801D0008 */ lwz r0, 8(r29)
/* 00014A78 60000001 */ ori r0, r0, 1
/* 00014A7C 901D0008 */ stw r0, 8(r29)
/* 00014A80 801D0008 */ lwz r0, 8(r29)
/* 00014A84 540007FA */ rlwinm r0, r0, 0, 0x1f, 0x1d
/* 00014A88 901D0008 */ stw r0, 8(r29)
/* 00014A8C 4BFEB6D9 */ bl memset
/* 00014A90 38000008 */ li r0, 8
/* 00014A94 B0010018 */ sth r0, 0x18(r1)
/* 00014A98 3C600000 */ lis r3, currentBall@ha
/* 00014A9C 80830000 */ lwz r4, currentBall@l(r3)
/* 00014AA0 3C600000 */ lis r3, animGroups@ha
/* 00014AA4 38030000 */ addi r0, r3, animGroups@l
/* 00014AA8 8864002E */ lbz r3, 0x2e(r4)
/* 00014AAC 7C630774 */ extsb r3, r3
/* 00014AB0 B0610024 */ sth r3, 0x24(r1)
/* 00014AB4 807E0058 */ lwz r3, 0x58(r30)
/* 00014AB8 1C630084 */ mulli r3, r3, 0x84
/* 00014ABC 7C601A14 */ add r3, r0, r3
/* 00014AC0 38630024 */ addi r3, r3, 0x24
/* 00014AC4 4BFEB6A1 */ bl mathutil_mtxA_from_mtx
/* 00014AC8 387D0020 */ addi r3, r29, 0x20
/* 00014ACC 38810044 */ addi r4, r1, 0x44
/* 00014AD0 4BFEB695 */ bl mathutil_mtxA_tf_point
/* 00014AD4 387D002C */ addi r3, r29, 0x2c
/* 00014AD8 38810050 */ addi r4, r1, 0x50
/* 00014ADC 4BFEB689 */ bl mathutil_mtxA_tf_vec
/* 00014AE0 A81D0038 */ lha r0, 0x38(r29)
/* 00014AE4 B001005C */ sth r0, 0x5c(r1)
/* 00014AE8 A81D003A */ lha r0, 0x3a(r29)
/* 00014AEC B001005E */ sth r0, 0x5e(r1)
/* 00014AF0 A81D003C */ lha r0, 0x3c(r29)
/* 00014AF4 B0010060 */ sth r0, 0x60(r1)
/* 00014AF8 807D001C */ lwz r3, 0x1c(r29)
/* 00014AFC 4BFEB669 */ bl get_lod
/* 00014B00 90610040 */ stw r3, 0x40(r1)
/* 00014B04 38610010 */ addi r3, r1, 0x10
/* 00014B08 80810040 */ lwz r4, 0x40(r1)
/* 00014B0C C03D0014 */ lfs f1, 0x14(r29)
/* 00014B10 C0040014 */ lfs f0, 0x14(r4)
/* 00014B14 C85F0050 */ lfd f2, 0x50(r31)
/* 00014B18 EC010024 */ fdivs f0, f1, f0
/* 00014B1C FC020032 */ fmul f0, f2, f0
/* 00014B20 FC000018 */ frsp f0, f0
/* 00014B24 D0010034 */ stfs f0, 0x34(r1)
/* 00014B28 C0010034 */ lfs f0, 0x34(r1)
/* 00014B2C D0010038 */ stfs f0, 0x38(r1)
/* 00014B30 C0010038 */ lfs f0, 0x38(r1)
/* 00014B34 D001003C */ stfs f0, 0x3c(r1)
/* 00014B38 4BFEB62D */ bl spawn_effect
lbl_00014B3C:
/* 00014B3C A81D0006 */ lha r0, 6(r29)
/* 00014B40 2C000001 */ cmpwi r0, 1
/* 00014B44 41820044 */ beq lbl_00014B88
/* 00014B48 4080006C */ bge lbl_00014BB4
/* 00014B4C 2C000000 */ cmpwi r0, 0
/* 00014B50 40800008 */ bge lbl_00014B58
/* 00014B54 48000060 */ b lbl_00014BB4
lbl_00014B58:
/* 00014B58 38600039 */ li r3, 0x39
/* 00014B5C 4BFEB609 */ bl u_play_sound_0
/* 00014B60 3C600000 */ lis r3, infoWork@ha
/* 00014B64 38630000 */ addi r3, r3, infoWork@l
/* 00014B68 80630000 */ lwz r3, 0(r3)
/* 00014B6C 54600529 */ rlwinm. r0, r3, 0, 0x14, 0x14
/* 00014B70 4082000C */ bne lbl_00014B7C
/* 00014B74 546006F7 */ rlwinm. r0, r3, 0, 0x1b, 0x1b
/* 00014B78 4082003C */ bne lbl_00014BB4
lbl_00014B7C:
/* 00014B7C 38602820 */ li r3, 0x2820
/* 00014B80 4BFEB5E5 */ bl u_play_sound_0
/* 00014B84 48000030 */ b lbl_00014BB4
lbl_00014B88:
/* 00014B88 38600003 */ li r3, 3
/* 00014B8C 4BFEB5D9 */ bl u_play_sound_0
/* 00014B90 3C600000 */ lis r3, infoWork@ha
/* 00014B94 38630000 */ addi r3, r3, infoWork@l
/* 00014B98 80630000 */ lwz r3, 0(r3)
/* 00014B9C 54600529 */ rlwinm. r0, r3, 0, 0x14, 0x14
/* 00014BA0 4082000C */ bne lbl_00014BAC
/* 00014BA4 546006F7 */ rlwinm. r0, r3, 0, 0x1b, 0x1b
/* 00014BA8 4082000C */ bne lbl_00014BB4
lbl_00014BAC:
/* 00014BAC 38602820 */ li r3, 0x2820
/* 00014BB0 4BFEB5B5 */ bl u_play_sound_0
lbl_00014BB4:
/* 00014BB4 800100D4 */ lwz r0, 0xd4(r1)
/* 00014BB8 83E100CC */ lwz r31, 0xcc(r1)
/* 00014BBC 83C100C8 */ lwz r30, 0xc8(r1)
/* 00014BC0 7C0803A6 */ mtlr r0
/* 00014BC4 83A100C4 */ lwz r29, 0xc4(r1)
/* 00014BC8 382100D0 */ addi r1, r1, 0xd0
/* 00014BCC 4E800020 */ blr 
