/* 00013C1C 7C0802A6 */ mflr r0
/* 00013C20 3C600000 */ lis r3, lbl_0001D790@ha
/* 00013C24 90010004 */ stw r0, 4(r1)
/* 00013C28 9421FFF0 */ stwu r1, -0x10(r1)
/* 00013C2C 93E1000C */ stw r31, 0xc(r1)
/* 00013C30 3BE30000 */ addi r31, r3, lbl_0001D790@l
/* 00013C34 389F0000 */ addi r4, r31, 0
/* 00013C38 38600001 */ li r3, 1
/* 00013C3C 4BFEC529 */ bl item_replace_type_funcs
/* 00013C40 38600003 */ li r3, 3
/* 00013C44 389F001C */ addi r4, r31, 0x1c
/* 00013C48 4BFEC51D */ bl item_replace_type_funcs
/* 00013C4C 38600004 */ li r3, 4
/* 00013C50 389F0038 */ addi r4, r31, 0x38
/* 00013C54 4BFEC511 */ bl item_replace_type_funcs
/* 00013C58 80010014 */ lwz r0, 0x14(r1)
/* 00013C5C 83E1000C */ lwz r31, 0xc(r1)
/* 00013C60 38210010 */ addi r1, r1, 0x10
/* 00013C64 7C0803A6 */ mtlr r0
/* 00013C68 4E800020 */ blr 
