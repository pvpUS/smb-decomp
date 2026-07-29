/* 000024FC 7C0802A6 */ mflr r0
/* 00002500 90010004 */ stw r0, 4(r1)
/* 00002504 9421FFF8 */ stwu r1, -8(r1)
/* 00002508 48006E31 */ bl lbl_00009338
/* 0000250C 4BFFDC51 */ bl event_finish_all
/* 00002510 3860000F */ li r3, 0xf
/* 00002514 4BFFDC49 */ bl event_start
/* 00002518 38600002 */ li r3, 2
/* 0000251C 4BFFDC41 */ bl camera_set_state_all
/* 00002520 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00002524 3800006A */ li r0, 0x6a
/* 00002528 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 0000252C 8001000C */ lwz r0, 0xc(r1)
/* 00002530 38210008 */ addi r1, r1, 8
/* 00002534 7C0803A6 */ mtlr r0
/* 00002538 4E800020 */ blr 
