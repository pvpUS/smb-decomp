/* 00002158 7C0802A6 */ mflr r0
/* 0000215C 3C600000 */ lis r3, lbl_10000000@ha
/* 00002160 90010004 */ stw r0, 4(r1)
/* 00002164 38630000 */ addi r3, r3, lbl_10000000@l
/* 00002168 9421FFF0 */ stwu r1, -0x10(r1)
/* 0000216C 93E1000C */ stw r31, 0xc(r1)
/* 00002170 3BE3009C */ addi r31, r3, 0x9c
/* 00002174 4BFFE039 */ bl func_800AB414
/* 00002178 38600042 */ li r3, 0x42
/* 0000217C 38800000 */ li r4, 0
/* 00002180 4BFFE02D */ bl u_play_music
/* 00002184 480070D9 */ bl lbl_0000925C
/* 00002188 38000000 */ li r0, 0
/* 0000218C 901F0014 */ stw r0, 0x14(r31)
/* 00002190 3C600000 */ lis r3, modeCtrl@ha
/* 00002194 38E30000 */ addi r7, r3, modeCtrl@l
/* 00002198 901F0018 */ stw r0, 0x18(r31)
/* 0000219C 3CA00000 */ lis r5, lbl_0000266C@ha
/* 000021A0 38050000 */ addi r0, r5, lbl_0000266C@l
/* 000021A4 80C70008 */ lwz r6, 8(r7)
/* 000021A8 3C800000 */ lis r4, submodeFinishFunc@ha
/* 000021AC 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 000021B0 54C507B8 */ rlwinm r5, r6, 0, 0x1e, 0x1c
/* 000021B4 90A70008 */ stw r5, 8(r7)
/* 000021B8 90040000 */ stw r0, submodeFinishFunc@l(r4)
/* 000021BC 380000B9 */ li r0, 0xb9
/* 000021C0 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 000021C4 80010014 */ lwz r0, 0x14(r1)
/* 000021C8 83E1000C */ lwz r31, 0xc(r1)
/* 000021CC 38210010 */ addi r1, r1, 0x10
/* 000021D0 7C0803A6 */ mtlr r0
/* 000021D4 4E800020 */ blr 
