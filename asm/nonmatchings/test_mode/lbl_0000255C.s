/* 0000255C 7C0802A6 */ mflr r0
/* 00002560 90010004 */ stw r0, 4(r1)
/* 00002564 9421FFF8 */ stwu r1, -8(r1)
/* 00002568 48008DFD */ bl lbl_0000B364
/* 0000256C 38600002 */ li r3, 2
/* 00002570 4BFFDBED */ bl camera_set_state_all
/* 00002574 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00002578 3800006C */ li r0, 0x6c
/* 0000257C B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00002580 8001000C */ lwz r0, 0xc(r1)
/* 00002584 38210008 */ addi r1, r1, 8
/* 00002588 7C0803A6 */ mtlr r0
/* 0000258C 4E800020 */ blr 
