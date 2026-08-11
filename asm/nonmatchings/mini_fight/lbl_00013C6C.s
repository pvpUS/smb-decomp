/* 00013C6C 7C0802A6 */ mflr r0
/* 00013C70 38600001 */ li r3, 1
/* 00013C74 90010004 */ stw r0, 4(r1)
/* 00013C78 38800000 */ li r4, 0
/* 00013C7C 9421FFF8 */ stwu r1, -8(r1)
/* 00013C80 4BFEC4E5 */ bl item_replace_type_funcs
/* 00013C84 38600003 */ li r3, 3
/* 00013C88 38800000 */ li r4, 0
/* 00013C8C 4BFEC4D9 */ bl item_replace_type_funcs
/* 00013C90 38600004 */ li r3, 4
/* 00013C94 38800000 */ li r4, 0
/* 00013C98 4BFEC4CD */ bl item_replace_type_funcs
/* 00013C9C 8001000C */ lwz r0, 0xc(r1)
/* 00013CA0 38210008 */ addi r1, r1, 8
/* 00013CA4 7C0803A6 */ mtlr r0
/* 00013CA8 4E800020 */ blr 
