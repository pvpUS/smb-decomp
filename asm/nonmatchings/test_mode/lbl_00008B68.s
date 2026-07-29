/* 00008B68 7C0802A6 */ mflr r0
/* 00008B6C 38600010 */ li r3, 0x10
/* 00008B70 90010004 */ stw r0, 4(r1)
/* 00008B74 9421FFF8 */ stwu r1, -8(r1)
/* 00008B78 4BFF75E5 */ bl event_start
/* 00008B7C 3C600000 */ lis r3, modeCtrl@ha
/* 00008B80 38A30000 */ addi r5, r3, modeCtrl@l
/* 00008B84 38000000 */ li r0, 0
/* 00008B88 90050010 */ stw r0, 0x10(r5)
/* 00008B8C 38000001 */ li r0, 1
/* 00008B90 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00008B94 90050044 */ stw r0, 0x44(r5)
/* 00008B98 38000085 */ li r0, 0x85
/* 00008B9C 80850008 */ lwz r4, 8(r5)
/* 00008BA0 548407B8 */ rlwinm r4, r4, 0, 0x1e, 0x1c
/* 00008BA4 90850008 */ stw r4, 8(r5)
/* 00008BA8 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00008BAC 8001000C */ lwz r0, 0xc(r1)
/* 00008BB0 38210008 */ addi r1, r1, 8
/* 00008BB4 7C0803A6 */ mtlr r0
/* 00008BB8 4E800020 */ blr 
