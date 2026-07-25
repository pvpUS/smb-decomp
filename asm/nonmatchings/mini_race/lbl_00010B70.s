/* 00010B70 7C0802A6 */ mflr r0
/* 00010B74 38A00005 */ li r5, 5
/* 00010B78 90010004 */ stw r0, 4(r1)
/* 00010B7C 9421FFE8 */ stwu r1, -0x18(r1)
/* 00010B80 93E10014 */ stw r31, 0x14(r1)
/* 00010B84 3BE30000 */ addi r31, r3, 0
/* 00010B88 3C600000 */ lis r3, lbl_00010BC8@ha
/* 00010B8C 809F00FC */ lwz r4, 0xfc(r31)
/* 00010B90 38630000 */ addi r3, r3, lbl_00010BC8@l
/* 00010B94 4BFEF5E9 */ bl thread_create
/* 00010B98 88BF002E */ lbz r5, 0x2e(r31)
/* 00010B9C 3C800000 */ lis r4, apeThreadNo@ha
/* 00010BA0 38040000 */ addi r0, r4, apeThreadNo@l
/* 00010BA4 7CA40774 */ extsb r4, r5
/* 00010BA8 5484103A */ slwi r4, r4, 2
/* 00010BAC 7C802214 */ add r4, r0, r4
/* 00010BB0 90640000 */ stw r3, 0(r4)
/* 00010BB4 8001001C */ lwz r0, 0x1c(r1)
/* 00010BB8 83E10014 */ lwz r31, 0x14(r1)
/* 00010BBC 38210018 */ addi r1, r1, 0x18
/* 00010BC0 7C0803A6 */ mtlr r0
/* 00010BC4 4E800020 */ blr 
