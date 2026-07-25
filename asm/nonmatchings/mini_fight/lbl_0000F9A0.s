/* 0000F9A0 7C0802A6 */ mflr r0
/* 0000F9A4 90010004 */ stw r0, 4(r1)
/* 0000F9A8 9421FFF8 */ stwu r1, -8(r1)
/* 0000F9AC 4BFF07B9 */ bl rand
/* 0000F9B0 5464047E */ clrlwi r4, r3, 0x11
/* 0000F9B4 7C800E70 */ srawi r0, r4, 1
/* 0000F9B8 7C000194 */ addze r0, r0
/* 0000F9BC 5400083C */ slwi r0, r0, 1
/* 0000F9C0 3C600000 */ lis r3, lbl_100188E0@ha
/* 0000F9C4 7C002010 */ subfc r0, r0, r4
/* 0000F9C8 90030000 */ stw r0, lbl_100188E0@l(r3)
/* 0000F9CC 8001000C */ lwz r0, 0xc(r1)
/* 0000F9D0 38210008 */ addi r1, r1, 8
/* 0000F9D4 7C0803A6 */ mtlr r0
/* 0000F9D8 4E800020 */ blr 
