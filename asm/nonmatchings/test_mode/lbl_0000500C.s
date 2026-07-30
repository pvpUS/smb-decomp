lbl_0000500C:
/* 0000500C 3C600000 */ lis r3, gameModeRequest@ha
/* 00005010 38830000 */ addi r4, r3, gameModeRequest@l
/* 00005014 38000000 */ li r0, 0
/* 00005018 B0040000 */ sth r0, 0(r4)
/* 0000501C 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00005020 3800000F */ li r0, 0xf
/* 00005024 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00005028 4E800020 */ blr 
