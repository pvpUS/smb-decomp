/* 00004A80 7C0802A6 */ mflr r0
/* 00004A84 3C600000 */ lis r3, currentBall@ha
/* 00004A88 90010004 */ stw r0, 4(r1)
/* 00004A8C 9421FFF8 */ stwu r1, -8(r1)
/* 00004A90 80830000 */ lwz r4, currentBall@l(r3)
/* 00004A94 38600001 */ li r3, 1
/* 00004A98 48002F51 */ bl lbl_000079E8
/* 00004A9C 38600001 */ li r3, 1
/* 00004AA0 48006BB5 */ bl lbl_0000B654
/* 00004AA4 3C600000 */ lis r3, lbl_1000013F@ha
/* 00004AA8 38630000 */ addi r3, r3, lbl_1000013F@l
/* 00004AAC 88630000 */ lbz r3, 0(r3)
/* 00004AB0 7C600775 */ extsb. r0, r3
/* 00004AB4 40820050 */ bne lbl_00004B04
/* 00004AB8 3C600000 */ lis r3, currentCamera@ha
/* 00004ABC 38830000 */ addi r4, r3, currentCamera@l
/* 00004AC0 3C600000 */ lis r3, cameraInfo@ha
/* 00004AC4 80C40000 */ lwz r6, 0(r4)
/* 00004AC8 38630000 */ addi r3, r3, cameraInfo@l
/* 00004ACC 90640000 */ stw r3, 0(r4)
/* 00004AD0 38000008 */ li r0, 8
/* 00004AD4 38A30284 */ addi r5, r3, 0x284
/* 00004AD8 9803001F */ stb r0, 0x1f(r3)
/* 00004ADC 90A40000 */ stw r5, 0(r4)
/* 00004AE0 38A50284 */ addi r5, r5, 0x284
/* 00004AE4 980302A3 */ stb r0, 0x2a3(r3)
/* 00004AE8 90A40000 */ stw r5, 0(r4)
/* 00004AEC 9805001F */ stb r0, 0x1f(r5)
/* 00004AF0 38A50284 */ addi r5, r5, 0x284
/* 00004AF4 90A40000 */ stw r5, 0(r4)
/* 00004AF8 9805001F */ stb r0, 0x1f(r5)
/* 00004AFC 90C40000 */ stw r6, 0(r4)
/* 00004B00 480000A4 */ b lbl_00004BA4
lbl_00004B04:
/* 00004B04 7C600774 */ extsb r0, r3
/* 00004B08 2C000001 */ cmpwi r0, 1
/* 00004B0C 40820050 */ bne lbl_00004B5C
/* 00004B10 3C600000 */ lis r3, currentCamera@ha
/* 00004B14 38830000 */ addi r4, r3, currentCamera@l
/* 00004B18 3C600000 */ lis r3, cameraInfo@ha
/* 00004B1C 80C40000 */ lwz r6, 0(r4)
/* 00004B20 38630000 */ addi r3, r3, cameraInfo@l
/* 00004B24 90640000 */ stw r3, 0(r4)
/* 00004B28 38000009 */ li r0, 9
/* 00004B2C 38A30284 */ addi r5, r3, 0x284
/* 00004B30 9803001F */ stb r0, 0x1f(r3)
/* 00004B34 90A40000 */ stw r5, 0(r4)
/* 00004B38 38A50284 */ addi r5, r5, 0x284
/* 00004B3C 980302A3 */ stb r0, 0x2a3(r3)
/* 00004B40 90A40000 */ stw r5, 0(r4)
/* 00004B44 9805001F */ stb r0, 0x1f(r5)
/* 00004B48 38A50284 */ addi r5, r5, 0x284
/* 00004B4C 90A40000 */ stw r5, 0(r4)
/* 00004B50 9805001F */ stb r0, 0x1f(r5)
/* 00004B54 90C40000 */ stw r6, 0(r4)
/* 00004B58 4800004C */ b lbl_00004BA4
lbl_00004B5C:
/* 00004B5C 3C600000 */ lis r3, currentCamera@ha
/* 00004B60 38830000 */ addi r4, r3, currentCamera@l
/* 00004B64 3C600000 */ lis r3, cameraInfo@ha
/* 00004B68 80C40000 */ lwz r6, 0(r4)
/* 00004B6C 38630000 */ addi r3, r3, cameraInfo@l
/* 00004B70 90640000 */ stw r3, 0(r4)
/* 00004B74 38000001 */ li r0, 1
/* 00004B78 38A30284 */ addi r5, r3, 0x284
/* 00004B7C 9803001F */ stb r0, 0x1f(r3)
/* 00004B80 90A40000 */ stw r5, 0(r4)
/* 00004B84 38A50284 */ addi r5, r5, 0x284
/* 00004B88 980302A3 */ stb r0, 0x2a3(r3)
/* 00004B8C 90A40000 */ stw r5, 0(r4)
/* 00004B90 9805001F */ stb r0, 0x1f(r5)
/* 00004B94 38A50284 */ addi r5, r5, 0x284
/* 00004B98 90A40000 */ stw r5, 0(r4)
/* 00004B9C 9805001F */ stb r0, 0x1f(r5)
/* 00004BA0 90C40000 */ stw r6, 0(r4)
lbl_00004BA4:
/* 00004BA4 3C600000 */ lis r3, lbl_10000000@ha
/* 00004BA8 3800012C */ li r0, 0x12c
/* 00004BAC 90030000 */ stw r0, lbl_10000000@l(r3)
/* 00004BB0 3C800000 */ lis r4, lbl_00014F20@ha
/* 00004BB4 38004000 */ li r0, 0x4000
/* 00004BB8 90040000 */ stw r0, lbl_00014F20@l(r4)
/* 00004BBC 3C600000 */ lis r3, lbl_00014F24@ha
/* 00004BC0 3C000004 */ lis r0, 4
/* 00004BC4 90030000 */ stw r0, lbl_00014F24@l(r3)
/* 00004BC8 8001000C */ lwz r0, 0xc(r1)
/* 00004BCC 38210008 */ addi r1, r1, 8
/* 00004BD0 7C0803A6 */ mtlr r0
/* 00004BD4 4E800020 */ blr 
