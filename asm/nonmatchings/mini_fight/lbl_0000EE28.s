/* 0000EE28 7C0802A6 */ mflr r0
/* 0000EE2C 3C600000 */ lis r3, debugFlags@ha
/* 0000EE30 90010004 */ stw r0, 4(r1)
/* 0000EE34 9421FFF8 */ stwu r1, -8(r1)
/* 0000EE38 80030000 */ lwz r0, debugFlags@l(r3)
/* 0000EE3C 7000000A */ andi. r0, r0, 0xa
/* 0000EE40 40820030 */ bne lbl_0000EE70
/* 0000EE44 3C600000 */ lis r3, lbl_100188E8@ha
/* 0000EE48 80030000 */ lwz r0, lbl_100188E8@l(r3)
/* 0000EE4C 2C000000 */ cmpwi r0, 0
/* 0000EE50 41820020 */ beq lbl_0000EE70
/* 0000EE54 1C00000C */ mulli r0, r0, 0xc
/* 0000EE58 3C600000 */ lis r3, lbl_10017E98@ha
/* 0000EE5C 38630000 */ addi r3, r3, lbl_10017E98@l
/* 0000EE60 7C630214 */ add r3, r3, r0
/* 0000EE64 81830004 */ lwz r12, 4(r3)
/* 0000EE68 7D8803A6 */ mtlr r12
/* 0000EE6C 4E800021 */ blrl 
lbl_0000EE70:
/* 0000EE70 8001000C */ lwz r0, 0xc(r1)
/* 0000EE74 38210008 */ addi r1, r1, 8
/* 0000EE78 7C0803A6 */ mtlr r0
/* 0000EE7C 4E800020 */ blr 
