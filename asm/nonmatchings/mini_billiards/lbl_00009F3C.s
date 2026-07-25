/* 00009F3C 3C600000 */ lis r3, lbl_802F1C32@ha
/* 00009F40 88030000 */ lbz r0, lbl_802F1C32@l(r3)
/* 00009F44 3C600000 */ lis r3, lbl_10000000@ha
/* 00009F48 38630000 */ addi r3, r3, lbl_10000000@l
/* 00009F4C 7C080774 */ extsb r8, r0
/* 00009F50 1C080006 */ mulli r0, r8, 6
/* 00009F54 7C830214 */ add r4, r3, r0
/* 00009F58 88840A66 */ lbz r4, 0xa66(r4)
/* 00009F5C 7C840775 */ extsb. r4, r4
/* 00009F60 40820028 */ bne lbl_00009F88
/* 00009F64 88A3000A */ lbz r5, 0xa(r3)
/* 00009F68 3885FFF6 */ addi r4, r5, -10
/* 00009F6C 5484063E */ clrlwi r4, r4, 0x18
/* 00009F70 28040001 */ cmplwi r4, 1
/* 00009F74 40810014 */ ble lbl_00009F88
/* 00009F78 3885FFF9 */ addi r4, r5, -7
/* 00009F7C 5484063E */ clrlwi r4, r4, 0x18
/* 00009F80 28040001 */ cmplwi r4, 1
/* 00009F84 41810028 */ bgt lbl_00009FAC
lbl_00009F88:
/* 00009F88 3C800000 */ lis r4, pauseMenuState@ha
/* 00009F8C 38A40000 */ addi r5, r4, pauseMenuState@l
/* 00009F90 38C0FFFF */ li r6, -1
/* 00009F94 B0C50016 */ sth r6, 0x16(r5)
/* 00009F98 38A00001 */ li r5, 1
/* 00009F9C 3C800000 */ lis r4, lbl_802F0310@ha
/* 00009FA0 9CA40000 */ stbu r5, lbl_802F0310@l(r4)
/* 00009FA4 98A40001 */ stb r5, 1(r4)
/* 00009FA8 4800004C */ b lbl_00009FF4
lbl_00009FAC:
/* 00009FAC 3C800000 */ lis r4, playerControllerIDs@ha
/* 00009FB0 5505103A */ slwi r5, r8, 2
/* 00009FB4 38840000 */ addi r4, r4, playerControllerIDs@l
/* 00009FB8 7C842A14 */ add r4, r4, r5
/* 00009FBC 80E40000 */ lwz r7, 0(r4)
/* 00009FC0 3CA00000 */ lis r5, pauseMenuState@ha
/* 00009FC4 3C800000 */ lis r4, lbl_802F0310@ha
/* 00009FC8 38C40000 */ addi r6, r4, lbl_802F0310@l
/* 00009FCC 7CE70734 */ extsh r7, r7
/* 00009FD0 38A50000 */ addi r5, r5, pauseMenuState@l
/* 00009FD4 20880001 */ subfic r4, r8, 1
/* 00009FD8 B0E50016 */ sth r7, 0x16(r5)
/* 00009FDC 7CA64214 */ add r5, r6, r8
/* 00009FE0 38E00001 */ li r7, 1
/* 00009FE4 98E50000 */ stb r7, 0(r5)
/* 00009FE8 7C862214 */ add r4, r6, r4
/* 00009FEC 38A00000 */ li r5, 0
/* 00009FF0 98A40000 */ stb r5, 0(r4)
lbl_00009FF4:
/* 00009FF4 3C800000 */ lis r4, pauseMenuState@ha
/* 00009FF8 38840000 */ addi r4, r4, pauseMenuState@l
/* 00009FFC 80A40004 */ lwz r5, 4(r4)
/* 0000A000 38C40004 */ addi r6, r4, 4
/* 0000A004 54A406F7 */ rlwinm. r4, r5, 0, 0x1b, 0x1b
/* 0000A008 4182001C */ beq lbl_0000A024
/* 0000A00C 54A40734 */ rlwinm r4, r5, 0, 0x1c, 0x1a
/* 0000A010 90860000 */ stw r4, 0(r6)
/* 0000A014 7CA30214 */ add r5, r3, r0
/* 0000A018 88850A67 */ lbz r4, 0xa67(r5)
/* 0000A01C 68840001 */ xori r4, r4, 1
/* 0000A020 98850A67 */ stb r4, 0xa67(r5)
lbl_0000A024:
/* 0000A024 7C630214 */ add r3, r3, r0
/* 0000A028 88030A67 */ lbz r0, 0xa67(r3)
/* 0000A02C 7C000775 */ extsb. r0, r0
/* 0000A030 41820014 */ beq lbl_0000A044
/* 0000A034 80060000 */ lwz r0, 0(r6)
/* 0000A038 60000008 */ ori r0, r0, 8
/* 0000A03C 90060000 */ stw r0, 0(r6)
/* 0000A040 4E800020 */ blr 
lbl_0000A044:
/* 0000A044 80060000 */ lwz r0, 0(r6)
/* 0000A048 54000776 */ rlwinm r0, r0, 0, 0x1d, 0x1b
/* 0000A04C 90060000 */ stw r0, 0(r6)
/* 0000A050 4E800020 */ blr 
