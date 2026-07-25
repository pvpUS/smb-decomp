/* 000026A0 7C0802A6 */ mflr r0
/* 000026A4 3C600000 */ lis r3, lbl_10000000@ha
/* 000026A8 90010004 */ stw r0, 4(r1)
/* 000026AC 38A30000 */ addi r5, r3, lbl_10000000@l
/* 000026B0 38800000 */ li r4, 0
/* 000026B4 9421FFF8 */ stwu r1, -8(r1)
/* 000026B8 3800FFFF */ li r0, -1
/* 000026BC 3865629C */ addi r3, r5, 0x629c
/* 000026C0 90850070 */ stw r4, 0x70(r5)
/* 000026C4 9085006C */ stw r4, 0x6c(r5)
/* 000026C8 980562B0 */ stb r0, 0x62b0(r5)
/* 000026CC B085001C */ sth r4, 0x1c(r5)
/* 000026D0 80850070 */ lwz r4, 0x70(r5)
/* 000026D4 4BFFDAD9 */ bl func_8009F4B8
/* 000026D8 38600006 */ li r3, 6
/* 000026DC 4BFFDAD1 */ bl memcard_set_mode
/* 000026E0 38600000 */ li r3, 0
/* 000026E4 4BFFDAC9 */ bl event_start
/* 000026E8 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 000026EC 380000BD */ li r0, 0xbd
/* 000026F0 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 000026F4 8001000C */ lwz r0, 0xc(r1)
/* 000026F8 38210008 */ addi r1, r1, 8
/* 000026FC 7C0803A6 */ mtlr r0
/* 00002700 4E800020 */ blr 
