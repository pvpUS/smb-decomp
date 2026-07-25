/* 00025B70 7C0802A6 */ mflr r0
/* 00025B74 3C800000 */ lis r4, lbl_000260C0@ha
/* 00025B78 90010004 */ stw r0, 4(r1)
/* 00025B7C 38040000 */ addi r0, r4, lbl_000260C0@l
/* 00025B80 9421FFE8 */ stwu r1, -0x18(r1)
/* 00025B84 93E10014 */ stw r31, 0x14(r1)
/* 00025B88 93C10010 */ stw r30, 0x10(r1)
/* 00025B8C 3BC30000 */ addi r30, r3, 0
/* 00025B90 7C030378 */ mr r3, r0
/* 00025B94 4BFDA63D */ bl u_avdisp_set_some_func_2
/* 00025B98 281E0000 */ cmplwi r30, 0
/* 00025B9C 3BE30000 */ addi r31, r3, 0
/* 00025BA0 41820010 */ beq lbl_00025BB0
/* 00025BA4 399E0000 */ addi r12, r30, 0
/* 00025BA8 7D8803A6 */ mtlr r12
/* 00025BAC 4E800021 */ blrl 
lbl_00025BB0:
/* 00025BB0 7FE3FB78 */ mr r3, r31
/* 00025BB4 4BFDA61D */ bl u_avdisp_set_some_func_2
/* 00025BB8 8001001C */ lwz r0, 0x1c(r1)
/* 00025BBC 83E10014 */ lwz r31, 0x14(r1)
/* 00025BC0 83C10010 */ lwz r30, 0x10(r1)
/* 00025BC4 7C0803A6 */ mtlr r0
/* 00025BC8 38210018 */ addi r1, r1, 0x18
/* 00025BCC 4E800020 */ blr 
