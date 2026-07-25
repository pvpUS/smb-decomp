/* 00004FA8 7C0802A6 */ mflr r0
/* 00004FAC 38A00000 */ li r5, 0
/* 00004FB0 90010004 */ stw r0, 4(r1)
/* 00004FB4 9421FF90 */ stwu r1, -0x70(r1)
/* 00004FB8 93E1006C */ stw r31, 0x6c(r1)
/* 00004FBC 3BE30000 */ addi r31, r3, 0
/* 00004FC0 3881000C */ addi r4, r1, 0xc
/* 00004FC4 48001161 */ bl lbl_00006124
/* 00004FC8 387F0000 */ addi r3, r31, 0
/* 00004FCC 3881000C */ addi r4, r1, 0xc
/* 00004FD0 38A00000 */ li r5, 0
/* 00004FD4 4BFFB179 */ bl handle_ball_rotational_kinematics
/* 00004FD8 387F0000 */ addi r3, r31, 0
/* 00004FDC 3881000C */ addi r4, r1, 0xc
/* 00004FE0 38A00000 */ li r5, 0
/* 00004FE4 4BFFB169 */ bl update_ball_ape_transform
/* 00004FE8 807F0080 */ lwz r3, 0x80(r31)
/* 00004FEC 38030001 */ addi r0, r3, 1
/* 00004FF0 901F0080 */ stw r0, 0x80(r31)
/* 00004FF4 80010074 */ lwz r0, 0x74(r1)
/* 00004FF8 83E1006C */ lwz r31, 0x6c(r1)
/* 00004FFC 38210070 */ addi r1, r1, 0x70
/* 00005000 7C0803A6 */ mtlr r0
/* 00005004 4E800020 */ blr 
