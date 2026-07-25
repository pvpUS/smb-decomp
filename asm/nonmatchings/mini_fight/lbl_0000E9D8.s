/* 0000E9D8 7C0802A6 */ mflr r0
/* 0000E9DC 3C600000 */ lis r3, g_commonNlObj@ha
/* 0000E9E0 90010004 */ stw r0, 4(r1)
/* 0000E9E4 9421FFF8 */ stwu r1, -8(r1)
/* 0000E9E8 80A30000 */ lwz r5, g_commonNlObj@l(r3)
/* 0000E9EC 3C601C00 */ lis r3, 0x1c00
/* 0000E9F0 3883FFFF */ addi r4, r3, -1
/* 0000E9F4 80650030 */ lwz r3, 0x30(r5)
/* 0000E9F8 3CA02400 */ lis r5, 0x2400
/* 0000E9FC 4BFF1769 */ bl MTEfcChangeAttributeITI
/* 0000EA00 8001000C */ lwz r0, 0xc(r1)
/* 0000EA04 38210008 */ addi r1, r1, 8
/* 0000EA08 7C0803A6 */ mtlr r0
/* 0000EA0C 4E800020 */ blr 
