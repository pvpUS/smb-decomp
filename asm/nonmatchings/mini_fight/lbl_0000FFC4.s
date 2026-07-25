/* 0000FFC4 80830094 */ lwz r4, 0x94(r3)
/* 0000FFC8 54800253 */ rlwinm. r0, r4, 0, 9, 9
/* 0000FFCC 40820034 */ bne lbl_00010000
/* 0000FFD0 64800040 */ oris r0, r4, 0x40
/* 0000FFD4 90030094 */ stw r0, 0x94(r3)
/* 0000FFD8 38000025 */ li r0, 0x25
/* 0000FFDC 3C800000 */ lis r4, worldInfo@ha
/* 0000FFE0 98030148 */ stb r0, 0x148(r3)
/* 0000FFE4 38840000 */ addi r4, r4, worldInfo@l
/* 0000FFE8 38C00006 */ li r6, 6
/* 0000FFEC 8803002E */ lbz r0, 0x2e(r3)
/* 0000FFF0 7C000774 */ extsb r0, r0
/* 0000FFF4 54003032 */ slwi r0, r0, 6
/* 0000FFF8 7C840214 */ add r4, r4, r0
/* 0000FFFC 98C40008 */ stb r6, 8(r4)
lbl_00010000:
/* 00010000 A803014C */ lha r0, 0x14c(r3)
/* 00010004 7C002800 */ cmpw r0, r5
/* 00010008 4C800020 */ bgelr 
/* 0001000C 7CA00734 */ extsh r0, r5
/* 00010010 B003014C */ sth r0, 0x14c(r3)
/* 00010014 4E800020 */ blr 
