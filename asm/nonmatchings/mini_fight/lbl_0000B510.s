/* 0000B510 7C0802A6 */ mflr r0
/* 0000B514 3C600000 */ lis r3, lbl_10017664@ha
/* 0000B518 90010004 */ stw r0, 4(r1)
/* 0000B51C 38000007 */ li r0, 7
/* 0000B520 9421FFE8 */ stwu r1, -0x18(r1)
/* 0000B524 93E10014 */ stw r31, 0x14(r1)
/* 0000B528 93C10010 */ stw r30, 0x10(r1)
/* 0000B52C 93A1000C */ stw r29, 0xc(r1)
/* 0000B530 3BA30000 */ addi r29, r3, lbl_10017664@l
/* 0000B534 3C600000 */ lis r3, modeCtrl@ha
/* 0000B538 B01D0002 */ sth r0, 2(r29)
/* 0000B53C 3BC30000 */ addi r30, r3, modeCtrl@l
/* 0000B540 380000B4 */ li r0, 0xb4
/* 0000B544 901E0000 */ stw r0, 0(r30)
/* 0000B548 480018E1 */ bl lbl_0000CE28
/* 0000B54C 3C600000 */ lis r3, currentCamera@ha
/* 0000B550 38830000 */ addi r4, r3, currentCamera@l
/* 0000B554 3C600000 */ lis r3, cameraInfo@ha
/* 0000B558 80040000 */ lwz r0, 0(r4)
/* 0000B55C 38630000 */ addi r3, r3, cameraInfo@l
/* 0000B560 90640000 */ stw r3, 0(r4)
/* 0000B564 3BE00000 */ li r31, 0
/* 0000B568 38A30284 */ addi r5, r3, 0x284
/* 0000B56C 9BE3001F */ stb r31, 0x1f(r3)
/* 0000B570 90A40000 */ stw r5, 0(r4)
/* 0000B574 38A50284 */ addi r5, r5, 0x284
/* 0000B578 9BE302A3 */ stb r31, 0x2a3(r3)
/* 0000B57C 90A40000 */ stw r5, 0(r4)
/* 0000B580 9BE5001F */ stb r31, 0x1f(r5)
/* 0000B584 38A50284 */ addi r5, r5, 0x284
/* 0000B588 90A40000 */ stw r5, 0(r4)
/* 0000B58C 9BE5001F */ stb r31, 0x1f(r5)
/* 0000B590 90040000 */ stw r0, 0(r4)
/* 0000B594 4800270D */ bl lbl_0000DCA0
/* 0000B598 93FD0738 */ stw r31, 0x738(r29)
/* 0000B59C 3C600000 */ lis r3, lbl_10018CFC@ha
/* 0000B5A0 84030000 */ lwzu r0, lbl_10018CFC@l(r3)
/* 0000B5A4 540007B8 */ rlwinm r0, r0, 0, 0x1e, 0x1c
/* 0000B5A8 90030000 */ stw r0, 0(r3)
/* 0000B5AC 4800B5E1 */ bl lbl_00016B8C
/* 0000B5B0 807E0000 */ lwz r3, 0(r30)
/* 0000B5B4 4800ED7D */ bl lbl_0001A330
/* 0000B5B8 8001001C */ lwz r0, 0x1c(r1)
/* 0000B5BC 83E10014 */ lwz r31, 0x14(r1)
/* 0000B5C0 83C10010 */ lwz r30, 0x10(r1)
/* 0000B5C4 7C0803A6 */ mtlr r0
/* 0000B5C8 83A1000C */ lwz r29, 0xc(r1)
/* 0000B5CC 38210018 */ addi r1, r1, 0x18
/* 0000B5D0 4E800020 */ blr 
