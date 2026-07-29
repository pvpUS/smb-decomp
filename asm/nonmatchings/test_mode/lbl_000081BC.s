/* 000081BC 7C0802A6 */ mflr r0
/* 000081C0 3C600000 */ lis r3, globalAnimTimer@ha
/* 000081C4 90010004 */ stw r0, 4(r1)
/* 000081C8 3C800000 */ lis r4, lbl_10000000@ha
/* 000081CC 9421FFE0 */ stwu r1, -0x20(r1)
/* 000081D0 BF61000C */ stmw r27, 0xc(r1)
/* 000081D4 3BC00000 */ li r30, 0
/* 000081D8 3B840000 */ addi r28, r4, lbl_10000000@l
/* 000081DC 3BE00001 */ li r31, 1
/* 000081E0 93C30000 */ stw r30, globalAnimTimer@l(r3)
/* 000081E4 3C600000 */ lis r3, lbl_000102B0@ha
/* 000081E8 3BA30000 */ addi r29, r3, lbl_000102B0@l
/* 000081EC B3FC0D62 */ sth r31, 0xd62(r28)
/* 000081F0 A87C0D62 */ lha r3, 0xd62(r28)
/* 000081F4 4BFF7F69 */ bl background_set_random_seed
/* 000081F8 A87C0D62 */ lha r3, 0xd62(r28)
/* 000081FC 4BFF7F61 */ bl load_stage
/* 00008200 3C600000 */ lis r3, modeCtrl@ha
/* 00008204 38630000 */ addi r3, r3, modeCtrl@l
/* 00008208 93C30028 */ stw r30, 0x28(r3)
/* 0000820C 93E30030 */ stw r31, 0x30(r3)
/* 00008210 4BFF7F4D */ bl event_finish_all
/* 00008214 38600001 */ li r3, 1
/* 00008218 4BFF7F45 */ bl event_start
/* 0000821C 38600004 */ li r3, 4
/* 00008220 4BFF7F3D */ bl event_start
/* 00008224 3860000D */ li r3, 0xd
/* 00008228 4BFF7F35 */ bl event_start
/* 0000822C 38600013 */ li r3, 0x13
/* 00008230 4BFF7F2D */ bl event_start
/* 00008234 3860000F */ li r3, 0xf
/* 00008238 4BFF7F25 */ bl event_start
/* 0000823C 38600005 */ li r3, 5
/* 00008240 4BFF7F1D */ bl event_start
/* 00008244 38600010 */ li r3, 0x10
/* 00008248 4BFF7F15 */ bl event_start
/* 0000824C 3860000C */ li r3, 0xc
/* 00008250 4BFF7F0D */ bl camera_set_state_all
/* 00008254 3C600000 */ lis r3, g_poolInfo@ha
/* 00008258 38630000 */ addi r3, r3, g_poolInfo@l
/* 0000825C 3883000C */ addi r4, r3, 0xc
/* 00008260 8063000C */ lwz r3, 0xc(r3)
/* 00008264 38000002 */ li r0, 2
/* 00008268 3BFD4464 */ addi r31, r29, 0x4464
/* 0000826C 98030000 */ stb r0, 0(r3)
/* 00008270 3B600000 */ li r27, 0
/* 00008274 80640000 */ lwz r3, 0(r4)
/* 00008278 9BC30001 */ stb r30, 1(r3)
/* 0000827C 80640000 */ lwz r3, 0(r4)
/* 00008280 9BC30002 */ stb r30, 2(r3)
/* 00008284 80640000 */ lwz r3, 0(r4)
/* 00008288 9BC30003 */ stb r30, 3(r3)
/* 0000828C 93DC0D68 */ stw r30, 0xd68(r28)
lbl_00008290:
/* 00008290 A07F0004 */ lhz r3, 4(r31)
/* 00008294 38A00005 */ li r5, 5
/* 00008298 A09F0006 */ lhz r4, 6(r31)
/* 0000829C 38C00000 */ li r6, 0
/* 000082A0 38E00000 */ li r7, 0
/* 000082A4 4BFF7EB9 */ bl GXGetTexBufferSize
/* 000082A8 801C0D68 */ lwz r0, 0xd68(r28)
/* 000082AC 7C030000 */ cmpw r3, r0
/* 000082B0 40810008 */ ble lbl_000082B8
/* 000082B4 907C0D68 */ stw r3, 0xd68(r28)
lbl_000082B8:
/* 000082B8 3B7B0001 */ addi r27, r27, 1
/* 000082BC 281B0009 */ cmplwi r27, 9
/* 000082C0 3BFF000C */ addi r31, r31, 0xc
/* 000082C4 4180FFCC */ blt lbl_00008290
/* 000082C8 3C600000 */ lis r3, __OSCurrHeap@ha
/* 000082CC 809C0D68 */ lwz r4, 0xd68(r28)
/* 000082D0 38630000 */ addi r3, r3, __OSCurrHeap@l
/* 000082D4 80630000 */ lwz r3, 0(r3)
/* 000082D8 4BFF7E85 */ bl OSAllocFromHeap
/* 000082DC 907C0D64 */ stw r3, 0xd64(r28)
/* 000082E0 801C0D64 */ lwz r0, 0xd64(r28)
/* 000082E4 28000000 */ cmplwi r0, 0
/* 000082E8 40820018 */ bne lbl_00008300
/* 000082EC 387D0134 */ addi r3, r29, 0x134
/* 000082F0 4CC63182 */ crclr 6
/* 000082F4 38BD44D0 */ addi r5, r29, 0x44d0
/* 000082F8 3880150A */ li r4, 0x150a
/* 000082FC 4BFF7E61 */ bl OSPanic
lbl_00008300:
/* 00008300 3C600000 */ lis r3, modeCtrl@ha
/* 00008304 38C30000 */ addi r6, r3, modeCtrl@l
/* 00008308 38000000 */ li r0, 0
/* 0000830C 90060000 */ stw r0, 0(r6)
/* 00008310 3CA00000 */ lis r5, lbl_00008808@ha
/* 00008314 3C800000 */ lis r4, submodeFinishFunc@ha
/* 00008318 90060010 */ stw r0, 0x10(r6)
/* 0000831C 38A50000 */ addi r5, r5, lbl_00008808@l
/* 00008320 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00008324 80060008 */ lwz r0, 8(r6)
/* 00008328 540007B8 */ rlwinm r0, r0, 0, 0x1e, 0x1c
/* 0000832C 90060008 */ stw r0, 8(r6)
/* 00008330 38000083 */ li r0, 0x83
/* 00008334 90A40000 */ stw r5, submodeFinishFunc@l(r4)
/* 00008338 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 0000833C BB61000C */ lmw r27, 0xc(r1)
/* 00008340 80010024 */ lwz r0, 0x24(r1)
/* 00008344 38210020 */ addi r1, r1, 0x20
/* 00008348 7C0803A6 */ mtlr r0
/* 0000834C 4E800020 */ blr 
