/* 000025B0 7C0802A6 */ mflr r0
/* 000025B4 90010004 */ stw r0, 4(r1)
/* 000025B8 9421FFF8 */ stwu r1, -8(r1)
/* 000025BC 480098FD */ bl lbl_0000BEB8
/* 000025C0 4BFFDB9D */ bl event_finish_all
/* 000025C4 4BFFDB99 */ bl func_80044920
/* 000025C8 3C600000 */ lis r3, loadingStageIdRequest@ha
/* 000025CC 38630000 */ addi r3, r3, loadingStageIdRequest@l
/* 000025D0 A8630000 */ lha r3, 0(r3)
/* 000025D4 4BFFDB89 */ bl load_stage
/* 000025D8 38600001 */ li r3, 1
/* 000025DC 4BFFDB81 */ bl event_start
/* 000025E0 38600002 */ li r3, 2
/* 000025E4 4BFFDB79 */ bl event_start
/* 000025E8 38600003 */ li r3, 3
/* 000025EC 4BFFDB71 */ bl event_start
/* 000025F0 38600004 */ li r3, 4
/* 000025F4 4BFFDB69 */ bl event_start
/* 000025F8 38600009 */ li r3, 9
/* 000025FC 4BFFDB61 */ bl event_start
/* 00002600 38600005 */ li r3, 5
/* 00002604 4BFFDB59 */ bl event_start
/* 00002608 38600007 */ li r3, 7
/* 0000260C 4BFFDB51 */ bl event_start
/* 00002610 3860000F */ li r3, 0xf
/* 00002614 4BFFDB49 */ bl event_start
/* 00002618 38600010 */ li r3, 0x10
/* 0000261C 4BFFDB41 */ bl event_start
/* 00002620 38600012 */ li r3, 0x12
/* 00002624 4BFFDB39 */ bl event_start
/* 00002628 3860000D */ li r3, 0xd
/* 0000262C 4BFFDB31 */ bl event_start
/* 00002630 38600014 */ li r3, 0x14
/* 00002634 4BFFDB29 */ bl event_start
/* 00002638 38600013 */ li r3, 0x13
/* 0000263C 4BFFDB21 */ bl event_start
/* 00002640 38600002 */ li r3, 2
/* 00002644 4BFFDB19 */ bl camera_set_state_all
/* 00002648 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 0000264C 3800006E */ li r0, 0x6e
/* 00002650 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00002654 8001000C */ lwz r0, 0xc(r1)
/* 00002658 38210008 */ addi r1, r1, 8
/* 0000265C 7C0803A6 */ mtlr r0
/* 00002660 4E800020 */ blr 
