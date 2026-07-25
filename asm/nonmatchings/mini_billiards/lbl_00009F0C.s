/* 00009F0C 3C600000 */ lis r3, pauseMenuState@ha
/* 00009F10 38630000 */ addi r3, r3, pauseMenuState@l
/* 00009F14 38830004 */ addi r4, r3, 4
/* 00009F18 80630004 */ lwz r3, 4(r3)
/* 00009F1C 546006B5 */ rlwinm. r0, r3, 0, 0x1a, 0x1a
/* 00009F20 4D820020 */ beqlr 
/* 00009F24 546006F2 */ rlwinm r0, r3, 0, 0x1b, 0x19
/* 00009F28 90040000 */ stw r0, 0(r4)
/* 00009F2C 3C600000 */ lis r3, lbl_1000000C@ha
/* 00009F30 38000003 */ li r0, 3
/* 00009F34 98030000 */ stb r0, lbl_1000000C@l(r3)
/* 00009F38 4E800020 */ blr 
