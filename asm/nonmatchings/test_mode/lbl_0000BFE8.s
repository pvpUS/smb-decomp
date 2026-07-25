/* 0000BFE8 7C0802A6 */ mflr r0
/* 0000BFEC 90010004 */ stw r0, 4(r1)
/* 0000BFF0 9421FFF8 */ stwu r1, -8(r1)
/* 0000BFF4 4800024D */ bl lbl_0000C240
/* 0000BFF8 4BFF4165 */ bl u_replay_test_main
/* 0000BFFC 8001000C */ lwz r0, 0xc(r1)
/* 0000C000 38210008 */ addi r1, r1, 8
/* 0000C004 7C0803A6 */ mtlr r0
/* 0000C008 4E800020 */ blr 
