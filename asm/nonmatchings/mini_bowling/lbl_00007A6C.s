/* 00007A6C 7C0802A6 */ mflr r0
/* 00007A70 3CA00000 */ lis r5, lbl_000153E0@ha
/* 00007A74 90010004 */ stw r0, 4(r1)
/* 00007A78 3C800000 */ lis r4, lbl_00011258@ha
/* 00007A7C 9421FFC8 */ stwu r1, -0x38(r1)
/* 00007A80 93E10034 */ stw r31, 0x34(r1)
/* 00007A84 3BE40000 */ addi r31, r4, lbl_00011258@l
/* 00007A88 93C10030 */ stw r30, 0x30(r1)
/* 00007A8C 3BC50000 */ addi r30, r5, lbl_000153E0@l
/* 00007A90 93A1002C */ stw r29, 0x2c(r1)
/* 00007A94 3BA30000 */ addi r29, r3, 0
/* 00007A98 4BFF86C9 */ bl u_ball_init_2
/* 00007A9C C01F0014 */ lfs f0, 0x14(r31)
/* 00007AA0 38600000 */ li r3, 0
/* 00007AA4 3800BFDF */ li r0, -16417
/* 00007AA8 D01D0004 */ stfs f0, 4(r29)
/* 00007AAC C01F0018 */ lfs f0, 0x18(r31)
/* 00007AB0 D01D0008 */ stfs f0, 8(r29)
/* 00007AB4 C01F0014 */ lfs f0, 0x14(r31)
/* 00007AB8 D01D000C */ stfs f0, 0xc(r29)
/* 00007ABC C01F0014 */ lfs f0, 0x14(r31)
/* 00007AC0 D01D0010 */ stfs f0, 0x10(r29)
/* 00007AC4 C01F0018 */ lfs f0, 0x18(r31)
/* 00007AC8 D01D0014 */ stfs f0, 0x14(r29)
/* 00007ACC C01F0014 */ lfs f0, 0x14(r31)
/* 00007AD0 D01D0018 */ stfs f0, 0x18(r29)
/* 00007AD4 C01F0014 */ lfs f0, 0x14(r31)
/* 00007AD8 D01D001C */ stfs f0, 0x1c(r29)
/* 00007ADC C01F0014 */ lfs f0, 0x14(r31)
/* 00007AE0 D01D0020 */ stfs f0, 0x20(r29)
/* 00007AE4 C01F0014 */ lfs f0, 0x14(r31)
/* 00007AE8 D01D0024 */ stfs f0, 0x24(r29)
/* 00007AEC B07D0028 */ sth r3, 0x28(r29)
/* 00007AF0 B07D002A */ sth r3, 0x2a(r29)
/* 00007AF4 B07D002C */ sth r3, 0x2c(r29)
/* 00007AF8 B07D0060 */ sth r3, 0x60(r29)
/* 00007AFC B07D0062 */ sth r3, 0x62(r29)
/* 00007B00 B07D0064 */ sth r3, 0x64(r29)
/* 00007B04 807D0094 */ lwz r3, 0x94(r29)
/* 00007B08 54630734 */ rlwinm r3, r3, 0, 0x1c, 0x1a
/* 00007B0C 907D0094 */ stw r3, 0x94(r29)
/* 00007B10 809D00FC */ lwz r4, 0xfc(r29)
/* 00007B14 80640014 */ lwz r3, 0x14(r4)
/* 00007B18 7C600038 */ and r0, r3, r0
/* 00007B1C 90040014 */ stw r0, 0x14(r4)
/* 00007B20 C01F0014 */ lfs f0, 0x14(r31)
/* 00007B24 D01D00F8 */ stfs f0, 0xf8(r29)
/* 00007B28 C01F0014 */ lfs f0, 0x14(r31)
/* 00007B2C D01D00C4 */ stfs f0, 0xc4(r29)
/* 00007B30 807F0008 */ lwz r3, 8(r31)
/* 00007B34 801F000C */ lwz r0, 0xc(r31)
/* 00007B38 90610010 */ stw r3, 0x10(r1)
/* 00007B3C 90010014 */ stw r0, 0x14(r1)
/* 00007B40 801F0010 */ lwz r0, 0x10(r31)
/* 00007B44 90010018 */ stw r0, 0x18(r1)
/* 00007B48 80610010 */ lwz r3, 0x10(r1)
/* 00007B4C 80010014 */ lwz r0, 0x14(r1)
/* 00007B50 907D00B8 */ stw r3, 0xb8(r29)
/* 00007B54 901D00BC */ stw r0, 0xbc(r29)
/* 00007B58 80010018 */ lwz r0, 0x18(r1)
/* 00007B5C 901D00C0 */ stw r0, 0xc0(r29)
/* 00007B60 4BFF8601 */ bl mathutil_mtxA_from_identity
/* 00007B64 387D0098 */ addi r3, r29, 0x98
/* 00007B68 4BFF85F9 */ bl mathutil_mtxA_to_quat
/* 00007B6C A87D002C */ lha r3, 0x2c(r29)
/* 00007B70 4BFF85F1 */ bl mathutil_mtxA_rotate_z
/* 00007B74 A87D002A */ lha r3, 0x2a(r29)
/* 00007B78 4BFF85E9 */ bl mathutil_mtxA_rotate_y
/* 00007B7C A87D0028 */ lha r3, 0x28(r29)
/* 00007B80 4BFF85E1 */ bl mathutil_mtxA_rotate_x
/* 00007B84 387D0030 */ addi r3, r29, 0x30
/* 00007B88 4BFF85D9 */ bl mathutil_mtxA_to_mtx
/* 00007B8C 387D00C8 */ addi r3, r29, 0xc8
/* 00007B90 4BFF85D1 */ bl mathutil_mtxA_to_mtx
/* 00007B94 387D00A8 */ addi r3, r29, 0xa8
/* 00007B98 4BFF85C9 */ bl mathutil_mtxA_to_quat
/* 00007B9C 3C600000 */ lis r3, modeCtrl@ha
/* 00007BA0 38630000 */ addi r3, r3, modeCtrl@l
/* 00007BA4 80030024 */ lwz r0, 0x24(r3)
/* 00007BA8 2C000001 */ cmpwi r0, 1
/* 00007BAC 40820010 */ bne lbl_00007BBC
/* 00007BB0 38000003 */ li r0, 3
/* 00007BB4 981D014A */ stb r0, 0x14a(r29)
/* 00007BB8 4800000C */ b lbl_00007BC4
lbl_00007BBC:
/* 00007BBC 881D002E */ lbz r0, 0x2e(r29)
/* 00007BC0 981D014A */ stb r0, 0x14a(r29)
lbl_00007BC4:
/* 00007BC4 C01F0014 */ lfs f0, 0x14(r31)
/* 00007BC8 3881001C */ addi r4, r1, 0x1c
/* 00007BCC D001001C */ stfs f0, 0x1c(r1)
/* 00007BD0 C01F0014 */ lfs f0, 0x14(r31)
/* 00007BD4 D0010020 */ stfs f0, 0x20(r1)
/* 00007BD8 C01F001C */ lfs f0, 0x1c(r31)
/* 00007BDC D0010024 */ stfs f0, 0x24(r1)
/* 00007BE0 807D00FC */ lwz r3, 0xfc(r29)
/* 00007BE4 4BFF857D */ bl mot_ape_set_quat_from_vec
/* 00007BE8 801E0000 */ lwz r0, 0(r30)
/* 00007BEC 2C00FFFF */ cmpwi r0, -1
/* 00007BF0 41820014 */ beq lbl_00007C04
/* 00007BF4 5403043E */ clrlwi r3, r0, 0x10
/* 00007BF8 4BFF8569 */ bl SoundOff
/* 00007BFC 3800FFFF */ li r0, -1
/* 00007C00 901E0000 */ stw r0, 0(r30)
lbl_00007C04:
/* 00007C04 801E0004 */ lwz r0, 4(r30)
/* 00007C08 2C00FFFF */ cmpwi r0, -1
/* 00007C0C 41820014 */ beq lbl_00007C20
/* 00007C10 5403043E */ clrlwi r3, r0, 0x10
/* 00007C14 4BFF854D */ bl SoundOff
/* 00007C18 3800FFFF */ li r0, -1
/* 00007C1C 901E0004 */ stw r0, 4(r30)
lbl_00007C20:
/* 00007C20 38000000 */ li r0, 0
/* 00007C24 901D0080 */ stw r0, 0x80(r29)
/* 00007C28 38600019 */ li r3, 0x19
/* 00007C2C 38000002 */ li r0, 2
/* 00007C30 987D0003 */ stb r3, 3(r29)
/* 00007C34 981D0148 */ stb r0, 0x148(r29)
/* 00007C38 8001003C */ lwz r0, 0x3c(r1)
/* 00007C3C 83E10034 */ lwz r31, 0x34(r1)
/* 00007C40 83C10030 */ lwz r30, 0x30(r1)
/* 00007C44 83A1002C */ lwz r29, 0x2c(r1)
/* 00007C48 38210038 */ addi r1, r1, 0x38
/* 00007C4C 7C0803A6 */ mtlr r0
/* 00007C50 4E800020 */ blr 
