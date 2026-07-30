/* 00003298 7C0802A6 */ mflr r0
/* 0000329C 3C600000 */ lis r3, lbl_10000000@ha
/* 000032A0 90010004 */ stw r0, 4(r1)
/* 000032A4 9421FFE0 */ stwu r1, -0x20(r1)
/* 000032A8 93E1001C */ stw r31, 0x1c(r1)
/* 000032AC 93C10018 */ stw r30, 0x18(r1)
/* 000032B0 3BC30000 */ addi r30, r3, lbl_10000000@l
/* 000032B4 4BFFCE99 */ bl event_finish_all
/* 000032B8 38600001 */ li r3, 1
/* 000032BC 4BFFCE91 */ bl event_start
/* 000032C0 38600004 */ li r3, 4
/* 000032C4 4BFFCE89 */ bl event_start
/* 000032C8 3860000F */ li r3, 0xf
/* 000032CC 4BFFCE81 */ bl event_start
/* 000032D0 38600010 */ li r3, 0x10
/* 000032D4 4BFFCE79 */ bl event_start
/* 000032D8 38600012 */ li r3, 0x12
/* 000032DC 4BFFCE71 */ bl event_start
/* 000032E0 38600014 */ li r3, 0x14
/* 000032E4 4BFFCE69 */ bl event_start
/* 000032E8 38600013 */ li r3, 0x13
/* 000032EC 4BFFCE61 */ bl event_start
/* 000032F0 38600043 */ li r3, 0x43
/* 000032F4 4BFFCE59 */ bl camera_set_state_all
/* 000032F8 3C600000 */ lis r3, cameraInfo@ha
/* 000032FC 38630000 */ addi r3, r3, cameraInfo@l
/* 00003300 38000004 */ li r0, 4
/* 00003304 9803001F */ stb r0, 0x1f(r3)
/* 00003308 3BE00000 */ li r31, 0
/* 0000330C B3FE0018 */ sth r31, 0x18(r30)
/* 00003310 93FE0098 */ stw r31, 0x98(r30)
/* 00003314 93FE009C */ stw r31, 0x9c(r30)
/* 00003318 93FE00A0 */ stw r31, 0xa0(r30)
/* 0000331C 93FE00A4 */ stw r31, 0xa4(r30)
/* 00003320 4800737D */ bl lbl_0000A69C
/* 00003324 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 00003328 93E30000 */ stw r31, lbl_802F1FF0@l(r3)
/* 0000332C 3C600000 */ lis r3, lbl_0000C748@ha
/* 00003330 3CA00000 */ lis r5, lbl_802F1FF6@ha
/* 00003334 93FE008C */ stw r31, 0x8c(r30)
/* 00003338 38000018 */ li r0, 0x18
/* 0000333C 3C800000 */ lis r4, lbl_802F1FF4@ha
/* 00003340 B0050000 */ sth r0, lbl_802F1FF6@l(r5)
/* 00003344 3800FFFF */ li r0, -1
/* 00003348 38630000 */ addi r3, r3, lbl_0000C748@l
/* 0000334C B0040000 */ sth r0, lbl_802F1FF4@l(r4)
/* 00003350 81830060 */ lwz r12, 0x60(r3)
/* 00003354 7D8803A6 */ mtlr r12
/* 00003358 4E800021 */ blrl 
/* 0000335C 80010024 */ lwz r0, 0x24(r1)
/* 00003360 83E1001C */ lwz r31, 0x1c(r1)
/* 00003364 83C10018 */ lwz r30, 0x18(r1)
/* 00003368 7C0803A6 */ mtlr r0
/* 0000336C 38210020 */ addi r1, r1, 0x20
/* 00003370 4E800020 */ blr 
