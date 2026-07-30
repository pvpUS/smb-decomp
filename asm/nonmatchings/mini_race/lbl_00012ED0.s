/* 00012ED0 80830010 */ lwz r4, 0x10(r3)
/* 00012ED4 38040001 */ addi r0, r4, 1
/* 00012ED8 90030010 */ stw r0, 0x10(r3)
/* 00012EDC 80030010 */ lwz r0, 0x10(r3)
/* 00012EE0 28000027 */ cmplwi r0, 0x27
/* 00012EE4 40800034 */ bge lbl_00012F18
/* 00012EE8 3CA00000 */ lis r5, minigameGma@ha
/* 00012EEC 80C50000 */ lwz r6, minigameGma@l(r5)
/* 00012EF0 3C800000 */ lis r4, lbl_00015F50@ha
/* 00012EF4 5405083C */ slwi r5, r0, 1
/* 00012EF8 38040000 */ addi r0, r4, lbl_00015F50@l
/* 00012EFC 7C802A14 */ add r4, r0, r5
/* 00012F00 80A60008 */ lwz r5, 8(r6)
/* 00012F04 A8040000 */ lha r0, 0(r4)
/* 00012F08 54001838 */ slwi r0, r0, 3
/* 00012F0C 7C05002E */ lwzx r0, r5, r0
/* 00012F10 90030030 */ stw r0, 0x30(r3)
/* 00012F14 4E800020 */ blr 
lbl_00012F18:
/* 00012F18 3C800000 */ lis r4, g_poolInfo@ha
/* 00012F1C A8030000 */ lha r0, 0(r3)
/* 00012F20 38640000 */ addi r3, r4, g_poolInfo@l
/* 00012F24 8063004C */ lwz r3, 0x4c(r3)
/* 00012F28 38800003 */ li r4, 3
/* 00012F2C 7C8301AE */ stbx r4, r3, r0
/* 00012F30 4E800020 */ blr 
