/* 0000C8A8 7C0802A6 */ mflr r0
/* 0000C8AC 3C600000 */ lis r3, lbl_10017520@ha
/* 0000C8B0 90010004 */ stw r0, 4(r1)
/* 0000C8B4 38C30000 */ addi r6, r3, lbl_10017520@l
/* 0000C8B8 9421FFF8 */ stwu r1, -8(r1)
/* 0000C8BC 8006088C */ lwz r0, 0x88c(r6)
/* 0000C8C0 540007FF */ clrlwi. r0, r0, 0x1f
/* 0000C8C4 40820028 */ bne lbl_0000C8EC
/* 0000C8C8 38000004 */ li r0, 4
/* 0000C8CC B0060146 */ sth r0, 0x146(r6)
/* 0000C8D0 3860003C */ li r3, 0x3c
/* 0000C8D4 38800002 */ li r4, 2
/* 0000C8D8 A8A60148 */ lha r5, 0x148(r6)
/* 0000C8DC 38050001 */ addi r0, r5, 1
/* 0000C8E0 B0060148 */ sth r0, 0x148(r6)
/* 0000C8E4 4BFF3881 */ bl u_play_music
/* 0000C8E8 48000020 */ b lbl_0000C908
lbl_0000C8EC:
/* 0000C8EC 3C600000 */ lis r3, pauseMenuState@ha
/* 0000C8F0 38830000 */ addi r4, r3, pauseMenuState@l
/* 0000C8F4 80640004 */ lwz r3, 4(r4)
/* 0000C8F8 3800000E */ li r0, 0xe
/* 0000C8FC 60630002 */ ori r3, r3, 2
/* 0000C900 90640004 */ stw r3, 4(r4)
/* 0000C904 B0060146 */ sth r0, 0x146(r6)
lbl_0000C908:
/* 0000C908 3860003C */ li r3, 0x3c
/* 0000C90C 38800002 */ li r4, 2
/* 0000C910 4BFF3855 */ bl u_play_music
/* 0000C914 8001000C */ lwz r0, 0xc(r1)
/* 0000C918 38210008 */ addi r1, r1, 8
/* 0000C91C 7C0803A6 */ mtlr r0
/* 0000C920 4E800020 */ blr 
