/* 00025B10 7C0802A6 */ mflr r0
/* 00025B14 3C800000 */ lis r4, lbl_0002609C@ha
/* 00025B18 90010004 */ stw r0, 4(r1)
/* 00025B1C 38040000 */ addi r0, r4, lbl_0002609C@l
/* 00025B20 9421FFE8 */ stwu r1, -0x18(r1)
/* 00025B24 93E10014 */ stw r31, 0x14(r1)
/* 00025B28 93C10010 */ stw r30, 0x10(r1)
/* 00025B2C 3BC30000 */ addi r30, r3, 0
/* 00025B30 7C030378 */ mr r3, r0
/* 00025B34 4BFDA69D */ bl u_avdisp_set_some_func_2
/* 00025B38 281E0000 */ cmplwi r30, 0
/* 00025B3C 3BE30000 */ addi r31, r3, 0
/* 00025B40 41820010 */ beq lbl_00025B50
/* 00025B44 399E0000 */ addi r12, r30, 0
/* 00025B48 7D8803A6 */ mtlr r12
/* 00025B4C 4E800021 */ blrl 
lbl_00025B50:
/* 00025B50 7FE3FB78 */ mr r3, r31
/* 00025B54 4BFDA67D */ bl u_avdisp_set_some_func_2
/* 00025B58 8001001C */ lwz r0, 0x1c(r1)
/* 00025B5C 83E10014 */ lwz r31, 0x14(r1)
/* 00025B60 83C10010 */ lwz r30, 0x10(r1)
/* 00025B64 7C0803A6 */ mtlr r0
/* 00025B68 38210018 */ addi r1, r1, 0x18
/* 00025B6C 4E800020 */ blr 
