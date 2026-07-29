/* 00001F54 7C0802A6 */ mflr r0
/* 00001F58 3C600000 */ lis r3, lbl_10000000@ha
/* 00001F5C 90010004 */ stw r0, 4(r1)
/* 00001F60 38000000 */ li r0, 0
/* 00001F64 388001E0 */ li r4, 0x1e0
/* 00001F68 9421FFF0 */ stwu r1, -0x10(r1)
/* 00001F6C 38A00006 */ li r5, 6
/* 00001F70 38C00000 */ li r6, 0
/* 00001F74 93E1000C */ stw r31, 0xc(r1)
/* 00001F78 3BE30000 */ addi r31, r3, lbl_10000000@l
/* 00001F7C 38600280 */ li r3, 0x280
/* 00001F80 93C10008 */ stw r30, 8(r1)
/* 00001F84 38E00000 */ li r7, 0
/* 00001F88 901F0040 */ stw r0, 0x40(r31)
/* 00001F8C 380000C0 */ li r0, 0xc0
/* 00001F90 901F0044 */ stw r0, 0x44(r31)
/* 00001F94 4BFFE1C9 */ bl GXGetTexBufferSize
/* 00001F98 801F0068 */ lwz r0, 0x68(r31)
/* 00001F9C 3BDF0068 */ addi r30, r31, 0x68
/* 00001FA0 38830000 */ addi r4, r3, 0
/* 00001FA4 28000000 */ cmplwi r0, 0
/* 00001FA8 40820018 */ bne lbl_00001FC0
/* 00001FAC 3C600000 */ lis r3, __OSCurrHeap@ha
/* 00001FB0 38630000 */ addi r3, r3, __OSCurrHeap@l
/* 00001FB4 80630000 */ lwz r3, 0(r3)
/* 00001FB8 4BFFE1A5 */ bl OSAllocFromHeap
/* 00001FBC 907E0000 */ stw r3, 0(r30)
lbl_00001FC0:
/* 00001FC0 809E0000 */ lwz r4, 0(r30)
/* 00001FC4 28040000 */ cmplwi r4, 0
/* 00001FC8 40820014 */ bne lbl_00001FDC
/* 00001FCC 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00001FD0 3800005F */ li r0, 0x5f
/* 00001FD4 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00001FD8 48000058 */ b lbl_00002030
lbl_00001FDC:
/* 00001FDC 801F0040 */ lwz r0, 0x40(r31)
/* 00001FE0 3C600000 */ lis r3, currRenderMode@ha
/* 00001FE4 80E30000 */ lwz r7, currRenderMode@l(r3)
/* 00001FE8 3C600000 */ lis r3, lbl_00010BEC@ha
/* 00001FEC 54061838 */ slwi r6, r0, 3
/* 00001FF0 38030000 */ addi r0, r3, lbl_00010BEC@l
/* 00001FF4 A0A70004 */ lhz r5, 4(r7)
/* 00001FF8 7C603214 */ add r3, r0, r6
/* 00001FFC A0C70006 */ lhz r6, 6(r7)
/* 00002000 80E30000 */ lwz r7, 0(r3)
/* 00002004 387F0048 */ addi r3, r31, 0x48
/* 00002008 39000000 */ li r8, 0
/* 0000200C 39200000 */ li r9, 0
/* 00002010 39400000 */ li r10, 0
/* 00002014 4BFFE149 */ bl GXInitTexObj
/* 00002018 4BFFE145 */ bl u_replay_test_init
/* 0000201C 38600002 */ li r3, 2
/* 00002020 4BFFE13D */ bl camera_set_state_all
/* 00002024 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00002028 38000068 */ li r0, 0x68
/* 0000202C B0030000 */ sth r0, gameSubmodeRequest@l(r3)
lbl_00002030:
/* 00002030 80010014 */ lwz r0, 0x14(r1)
/* 00002034 83E1000C */ lwz r31, 0xc(r1)
/* 00002038 83C10008 */ lwz r30, 8(r1)
/* 0000203C 7C0803A6 */ mtlr r0
/* 00002040 38210010 */ addi r1, r1, 0x10
/* 00002044 4E800020 */ blr 
