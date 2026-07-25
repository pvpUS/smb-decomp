/* 0000BE00 7C0802A6 */ mflr r0
/* 0000BE04 90010004 */ stw r0, 4(r1)
/* 0000BE08 9421FFF8 */ stwu r1, -8(r1)
/* 0000BE0C 4BFF4351 */ bl event_finish_all
/* 0000BE10 4BFF434D */ bl func_80044920
/* 0000BE14 3C600000 */ lis r3, loadingStageIdRequest@ha
/* 0000BE18 38630000 */ addi r3, r3, loadingStageIdRequest@l
/* 0000BE1C A8630000 */ lha r3, 0(r3)
/* 0000BE20 4BFF433D */ bl load_stage
/* 0000BE24 38600001 */ li r3, 1
/* 0000BE28 4BFF4335 */ bl event_start
/* 0000BE2C 38600002 */ li r3, 2
/* 0000BE30 4BFF432D */ bl event_start
/* 0000BE34 38600003 */ li r3, 3
/* 0000BE38 4BFF4325 */ bl event_start
/* 0000BE3C 38600004 */ li r3, 4
/* 0000BE40 4BFF431D */ bl event_start
/* 0000BE44 38600009 */ li r3, 9
/* 0000BE48 4BFF4315 */ bl event_start
/* 0000BE4C 38600005 */ li r3, 5
/* 0000BE50 4BFF430D */ bl event_start
/* 0000BE54 38600007 */ li r3, 7
/* 0000BE58 4BFF4305 */ bl event_start
/* 0000BE5C 3860000F */ li r3, 0xf
/* 0000BE60 4BFF42FD */ bl event_start
/* 0000BE64 38600010 */ li r3, 0x10
/* 0000BE68 4BFF42F5 */ bl event_start
/* 0000BE6C 38600012 */ li r3, 0x12
/* 0000BE70 4BFF42ED */ bl event_start
/* 0000BE74 3860000D */ li r3, 0xd
/* 0000BE78 4BFF42E5 */ bl event_start
/* 0000BE7C 38600013 */ li r3, 0x13
/* 0000BE80 4BFF42DD */ bl event_start
/* 0000BE84 8001000C */ lwz r0, 0xc(r1)
/* 0000BE88 38210008 */ addi r1, r1, 8
/* 0000BE8C 7C0803A6 */ mtlr r0
/* 0000BE90 4E800020 */ blr 
