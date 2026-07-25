/* 00002CEC 3C600000 */ lis r3, modeCtrl@ha
/* 00002CF0 38830000 */ addi r4, r3, modeCtrl@l
/* 00002CF4 80640000 */ lwz r3, 0(r4)
/* 00002CF8 2C030000 */ cmpwi r3, 0
/* 00002CFC 4081000C */ ble lbl_00002D08
/* 00002D00 3803FFFF */ addi r0, r3, -1
/* 00002D04 90040000 */ stw r0, 0(r4)
lbl_00002D08:
/* 00002D08 3C600000 */ lis r3, modeCtrl@ha
/* 00002D0C 38C30000 */ addi r6, r3, modeCtrl@l
/* 00002D10 80860008 */ lwz r4, 8(r6)
/* 00002D14 38A60008 */ addi r5, r6, 8
/* 00002D18 5480077B */ rlwinm. r0, r4, 0, 0x1d, 0x1d
/* 00002D1C 40820020 */ bne lbl_00002D3C
/* 00002D20 3C600000 */ lis r3, eventInfo@ha
/* 00002D24 88030000 */ lbz r0, eventInfo@l(r3)
/* 00002D28 2C000002 */ cmpwi r0, 2
/* 00002D2C 4D820020 */ beqlr 
/* 00002D30 60800004 */ ori r0, r4, 4
/* 00002D34 90050000 */ stw r0, 0(r5)
/* 00002D38 4E800020 */ blr 
lbl_00002D3C:
/* 00002D3C 80060000 */ lwz r0, 0(r6)
/* 00002D40 2C000000 */ cmpwi r0, 0
/* 00002D44 4D810020 */ bgtlr 
/* 00002D48 38A00000 */ li r5, 0
/* 00002D4C 90A60000 */ stw r5, 0(r6)
/* 00002D50 38000003 */ li r0, 3
/* 00002D54 3C800000 */ lis r4, gameModeRequest@ha
/* 00002D58 90060020 */ stw r0, 0x20(r6)
/* 00002D5C 38000001 */ li r0, 1
/* 00002D60 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00002D64 90060010 */ stw r0, 0x10(r6)
/* 00002D68 38000015 */ li r0, 0x15
/* 00002D6C B0A40000 */ sth r5, gameModeRequest@l(r4)
/* 00002D70 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00002D74 4E800020 */ blr 
