/* 00010ADC 7C0802A6 */ mflr r0
/* 00010AE0 38A00000 */ li r5, 0
/* 00010AE4 90010004 */ stw r0, 4(r1)
/* 00010AE8 9421FF90 */ stwu r1, -0x70(r1)
/* 00010AEC 93E1006C */ stw r31, 0x6c(r1)
/* 00010AF0 3BE30000 */ addi r31, r3, 0
/* 00010AF4 3881000C */ addi r4, r1, 0xc
/* 00010AF8 4BFEF66D */ bl handle_ball_linear_kinematics
/* 00010AFC 387F0000 */ addi r3, r31, 0
/* 00010B00 3881000C */ addi r4, r1, 0xc
/* 00010B04 38A00000 */ li r5, 0
/* 00010B08 4BFEF65D */ bl handle_ball_rotational_kinematics
/* 00010B0C 387F0000 */ addi r3, r31, 0
/* 00010B10 3881000C */ addi r4, r1, 0xc
/* 00010B14 38A00000 */ li r5, 0
/* 00010B18 4BFEF64D */ bl update_ball_ape_transform
/* 00010B1C 807F0080 */ lwz r3, 0x80(r31)
/* 00010B20 38030001 */ addi r0, r3, 1
/* 00010B24 901F0080 */ stw r0, 0x80(r31)
/* 00010B28 A87F0124 */ lha r3, 0x124(r31)
/* 00010B2C 38030001 */ addi r0, r3, 1
/* 00010B30 B01F0124 */ sth r0, 0x124(r31)
/* 00010B34 80010074 */ lwz r0, 0x74(r1)
/* 00010B38 83E1006C */ lwz r31, 0x6c(r1)
/* 00010B3C 38210070 */ addi r1, r1, 0x70
/* 00010B40 7C0803A6 */ mtlr r0
/* 00010B44 4E800020 */ blr 
lbl_00010B48:
/* 00010B48 7C0802A6 */ mflr r0
/* 00010B4C 3C800000 */ lis r4, lbl_0001C348@ha
/* 00010B50 90010004 */ stw r0, 4(r1)
/* 00010B54 38A40000 */ addi r5, r4, lbl_0001C348@l
/* 00010B58 38800018 */ li r4, 0x18
/* 00010B5C 9421FFF8 */ stwu r1, -8(r1)
/* 00010B60 38000026 */ li r0, 0x26
/* 00010B64 C005001C */ lfs f0, 0x1c(r5)
/* 00010B68 D003001C */ stfs f0, 0x1c(r3)
/* 00010B6C C005001C */ lfs f0, 0x1c(r5)
/* 00010B70 D0030020 */ stfs f0, 0x20(r3)
/* 00010B74 C005001C */ lfs f0, 0x1c(r5)
/* 00010B78 D0030024 */ stfs f0, 0x24(r3)
/* 00010B7C 98830003 */ stb r4, 3(r3)
/* 00010B80 98030148 */ stb r0, 0x148(r3)
/* 00010B84 48000015 */ bl lbl_00010B98
/* 00010B88 8001000C */ lwz r0, 0xc(r1)
/* 00010B8C 38210008 */ addi r1, r1, 8
/* 00010B90 7C0803A6 */ mtlr r0
/* 00010B94 4E800020 */ blr 
