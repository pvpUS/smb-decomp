/* 0000EF90 7C0802A6 */ mflr r0
/* 0000EF94 3C600000 */ lis r3, lbl_100188E8@ha
/* 0000EF98 90010004 */ stw r0, 4(r1)
/* 0000EF9C 38630000 */ addi r3, r3, lbl_100188E8@l
/* 0000EFA0 38800000 */ li r4, 0
/* 0000EFA4 9421FFF0 */ stwu r1, -0x10(r1)
/* 0000EFA8 38A009F4 */ li r5, 0x9f4
/* 0000EFAC 93E1000C */ stw r31, 0xc(r1)
/* 0000EFB0 83E30014 */ lwz r31, 0x14(r3)
/* 0000EFB4 387F0000 */ addi r3, r31, 0
/* 0000EFB8 4BFF11AD */ bl memset
/* 0000EFBC 3C600000 */ lis r3, decodedStageLzPtr@ha
/* 0000EFC0 80A30000 */ lwz r5, decodedStageLzPtr@l(r3)
/* 0000EFC4 3C600000 */ lis r3, lbl_8020AB88@ha
/* 0000EFC8 3C800000 */ lis r4, animGroups@ha
/* 0000EFCC 80C50008 */ lwz r6, 8(r5)
/* 0000EFD0 391F0000 */ addi r8, r31, 0
/* 0000EFD4 38A40000 */ addi r5, r4, animGroups@l
/* 0000EFD8 38C6FFFF */ addi r6, r6, -1
/* 0000EFDC 38630000 */ addi r3, r3, lbl_8020AB88@l
/* 0000EFE0 38E00000 */ li r7, 0
lbl_0000EFE4:
/* 0000EFE4 7C0733D6 */ divw r0, r7, r6
/* 0000EFE8 98E80000 */ stb r7, 0(r8)
/* 0000EFEC 7C0031D6 */ mullw r0, r0, r6
/* 0000EFF0 7C803850 */ subf r4, r0, r7
/* 0000EFF4 39240001 */ addi r9, r4, 1
/* 0000EFF8 1C090084 */ mulli r0, r9, 0x84
/* 0000EFFC 7D240734 */ extsh r4, r9
/* 0000F000 B0880006 */ sth r4, 6(r8)
/* 0000F004 7C850214 */ add r4, r5, r0
/* 0000F008 55201838 */ slwi r0, r9, 3
/* 0000F00C 90880030 */ stw r4, 0x30(r8)
/* 0000F010 38800000 */ li r4, 0
/* 0000F014 7D230214 */ add r9, r3, r0
/* 0000F018 9088002C */ stw r4, 0x2c(r8)
/* 0000F01C 80090004 */ lwz r0, 4(r9)
/* 0000F020 80890000 */ lwz r4, 0(r9)
/* 0000F024 2C000000 */ cmpwi r0, 0
/* 0000F028 7C0903A6 */ mtctr r0
/* 0000F02C 40810020 */ ble lbl_0000F04C
lbl_0000F030:
/* 0000F030 80040000 */ lwz r0, 0(r4)
/* 0000F034 28000001 */ cmplwi r0, 1
/* 0000F038 4082000C */ bne lbl_0000F044
/* 0000F03C 80040004 */ lwz r0, 4(r4)
/* 0000F040 9008002C */ stw r0, 0x2c(r8)
lbl_0000F044:
/* 0000F044 3884000C */ addi r4, r4, 0xc
/* 0000F048 4200FFE8 */ bdnz lbl_0000F030
lbl_0000F04C:
/* 0000F04C 38E70001 */ addi r7, r7, 1
/* 0000F050 2C070031 */ cmpwi r7, 0x31
/* 0000F054 39080034 */ addi r8, r8, 0x34
/* 0000F058 4180FF8C */ blt lbl_0000EFE4
/* 0000F05C 38600000 */ li r3, 0
/* 0000F060 48000269 */ bl lbl_0000F2C8
/* 0000F064 80010014 */ lwz r0, 0x14(r1)
/* 0000F068 83E1000C */ lwz r31, 0xc(r1)
/* 0000F06C 38210010 */ addi r1, r1, 0x10
/* 0000F070 7C0803A6 */ mtlr r0
/* 0000F074 4E800020 */ blr 
