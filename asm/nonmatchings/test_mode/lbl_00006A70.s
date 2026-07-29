/* 00006A70 7C0802A6 */ mflr r0
/* 00006A74 3C600000 */ lis r3, debugFlags@ha
/* 00006A78 90010004 */ stw r0, 4(r1)
/* 00006A7C 3C800000 */ lis r4, lbl_0000FE78@ha
/* 00006A80 9421FFD8 */ stwu r1, -0x28(r1)
/* 00006A84 93E10024 */ stw r31, 0x24(r1)
/* 00006A88 93C10020 */ stw r30, 0x20(r1)
/* 00006A8C 93A1001C */ stw r29, 0x1c(r1)
/* 00006A90 3BA40000 */ addi r29, r4, lbl_0000FE78@l
/* 00006A94 80030000 */ lwz r0, debugFlags@l(r3)
/* 00006A98 3C600000 */ lis r3, lbl_10000000@ha
/* 00006A9C 3BC30000 */ addi r30, r3, lbl_10000000@l
/* 00006AA0 7000000A */ andi. r0, r0, 0xa
/* 00006AA4 408200D8 */ bne lbl_00006B7C
/* 00006AA8 3BE00000 */ li r31, 0
/* 00006AAC 93FE05A8 */ stw r31, 0x5a8(r30)
/* 00006AB0 3C600000 */ lis r3, lbl_00013A1C@ha
/* 00006AB4 38630000 */ addi r3, r3, lbl_00013A1C@l
/* 00006AB8 93FE05AC */ stw r31, 0x5ac(r30)
/* 00006ABC 38630004 */ addi r3, r3, 4
/* 00006AC0 B3FE0D40 */ sth r31, 0xd40(r30)
/* 00006AC4 B3FE0D42 */ sth r31, 0xd42(r30)
/* 00006AC8 4BFFEB21 */ bl lbl_000055E8
/* 00006ACC 3860000F */ li r3, 0xf
/* 00006AD0 4BFF968D */ bl event_start
/* 00006AD4 38600002 */ li r3, 2
/* 00006AD8 4BFF9685 */ bl camera_set_state_all
/* 00006ADC 3C600000 */ lis r3, currentCamera@ha
/* 00006AE0 C01D0060 */ lfs f0, 0x60(r29)
/* 00006AE4 39030000 */ addi r8, r3, currentCamera@l
/* 00006AE8 80680000 */ lwz r3, 0(r8)
/* 00006AEC 3CA00000 */ lis r5, lbl_00006974@ha
/* 00006AF0 38C00001 */ li r6, 1
/* 00006AF4 D0030000 */ stfs f0, 0(r3)
/* 00006AF8 3C800000 */ lis r4, submodeFinishFunc@ha
/* 00006AFC 38A50000 */ addi r5, r5, lbl_00006974@l
/* 00006B00 C01D01C4 */ lfs f0, 0x1c4(r29)
/* 00006B04 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00006B08 80E80000 */ lwz r7, 0(r8)
/* 00006B0C 3800007D */ li r0, 0x7d
/* 00006B10 D0070004 */ stfs f0, 4(r7)
/* 00006B14 C01D0178 */ lfs f0, 0x178(r29)
/* 00006B18 80E80000 */ lwz r7, 0(r8)
/* 00006B1C D0070008 */ stfs f0, 8(r7)
/* 00006B20 C01D0060 */ lfs f0, 0x60(r29)
/* 00006B24 80E80000 */ lwz r7, 0(r8)
/* 00006B28 D007000C */ stfs f0, 0xc(r7)
/* 00006B2C C01D0060 */ lfs f0, 0x60(r29)
/* 00006B30 80E80000 */ lwz r7, 0(r8)
/* 00006B34 D0070010 */ stfs f0, 0x10(r7)
/* 00006B38 C01D0060 */ lfs f0, 0x60(r29)
/* 00006B3C 80E80000 */ lwz r7, 0(r8)
/* 00006B40 D0070014 */ stfs f0, 0x14(r7)
/* 00006B44 B3FE0D48 */ sth r31, 0xd48(r30)
/* 00006B48 B3FE0D54 */ sth r31, 0xd54(r30)
/* 00006B4C B3FE0D4A */ sth r31, 0xd4a(r30)
/* 00006B50 B3FE0D56 */ sth r31, 0xd56(r30)
/* 00006B54 B3FE0D4C */ sth r31, 0xd4c(r30)
/* 00006B58 B3FE0D58 */ sth r31, 0xd58(r30)
/* 00006B5C B3FE0D44 */ sth r31, 0xd44(r30)
/* 00006B60 98DE0D5A */ stb r6, 0xd5a(r30)
/* 00006B64 98DE0D5B */ stb r6, 0xd5b(r30)
/* 00006B68 9BFE0D4E */ stb r31, 0xd4e(r30)
/* 00006B6C C01D0060 */ lfs f0, 0x60(r29)
/* 00006B70 D01E0D50 */ stfs f0, 0xd50(r30)
/* 00006B74 90A40000 */ stw r5, submodeFinishFunc@l(r4)
/* 00006B78 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
lbl_00006B7C:
/* 00006B7C 8001002C */ lwz r0, 0x2c(r1)
/* 00006B80 83E10024 */ lwz r31, 0x24(r1)
/* 00006B84 83C10020 */ lwz r30, 0x20(r1)
/* 00006B88 7C0803A6 */ mtlr r0
/* 00006B8C 83A1001C */ lwz r29, 0x1c(r1)
/* 00006B90 38210028 */ addi r1, r1, 0x28
/* 00006B94 4E800020 */ blr 
