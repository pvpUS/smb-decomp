lbl_00003774:
/* 00003774 3C600000 */ lis r3, debugFlags@ha
/* 00003778 80030000 */ lwz r0, debugFlags@l(r3)
/* 0000377C 7000000A */ andi. r0, r0, 0xa
/* 00003780 4C820020 */ bnelr 
/* 00003784 3C600000 */ lis r3, lbl_100000B4@ha
/* 00003788 38830000 */ addi r4, r3, lbl_100000B4@l
/* 0000378C 38000000 */ li r0, 0
/* 00003790 3C600000 */ lis r3, lbl_100000B8@ha
/* 00003794 90040000 */ stw r0, 0(r4)
/* 00003798 38830000 */ addi r4, r3, lbl_100000B8@l
/* 0000379C 90040000 */ stw r0, 0(r4)
/* 000037A0 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 000037A4 38000074 */ li r0, 0x74
/* 000037A8 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 000037AC 4E800020 */ blr 
