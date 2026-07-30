lbl_00000A8C:
/* 00000A8C 3C600000 */ lis r3, lbl_10000008@ha
/* 00000A90 38830000 */ addi r4, r3, lbl_10000008@l
/* 00000A94 38000000 */ li r0, 0
/* 00000A98 90040000 */ stw r0, 0(r4)
/* 00000A9C 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00000AA0 38000062 */ li r0, 0x62
/* 00000AA4 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00000AA8 4E800020 */ blr 
