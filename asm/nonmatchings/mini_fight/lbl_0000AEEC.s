/* 0000AEEC 7C0802A6 */ mflr r0
/* 0000AEF0 3C600000 */ lis r3, lbl_10017520@ha
/* 0000AEF4 90010004 */ stw r0, 4(r1)
/* 0000AEF8 38830000 */ addi r4, r3, lbl_10017520@l
/* 0000AEFC 3C600000 */ lis r3, lbl_801EED98@ha
/* 0000AF00 9421FFF8 */ stwu r1, -8(r1)
/* 0000AF04 38000001 */ li r0, 1
/* 0000AF08 38630000 */ addi r3, r3, lbl_801EED98@l
/* 0000AF0C B0040146 */ sth r0, 0x146(r4)
/* 0000AF10 88030004 */ lbz r0, 4(r3)
/* 0000AF14 7C000774 */ extsb r0, r0
/* 0000AF18 90040890 */ stw r0, 0x890(r4)
/* 0000AF1C 88030006 */ lbz r0, 6(r3)
/* 0000AF20 98040054 */ stb r0, 0x54(r4)
/* 0000AF24 88030007 */ lbz r0, 7(r3)
/* 0000AF28 98040055 */ stb r0, 0x55(r4)
/* 0000AF2C 88030008 */ lbz r0, 8(r3)
/* 0000AF30 98040056 */ stb r0, 0x56(r4)
/* 0000AF34 4BFF5231 */ bl event_finish_all
/* 0000AF38 3860000F */ li r3, 0xf
/* 0000AF3C 4BFF5229 */ bl event_start
/* 0000AF40 38600003 */ li r3, 3
/* 0000AF44 4BFF5221 */ bl event_start
/* 0000AF48 3860003B */ li r3, 0x3b
/* 0000AF4C 4BFF5219 */ bl camera_set_state_all
/* 0000AF50 3C800000 */ lis r4, currentBall@ha
/* 0000AF54 3C600000 */ lis r3, g_poolInfo@ha
/* 0000AF58 38C40000 */ addi r6, r4, currentBall@l
/* 0000AF5C 38A30000 */ addi r5, r3, g_poolInfo@l
/* 0000AF60 81060000 */ lwz r8, 0(r6)
/* 0000AF64 3C600000 */ lis r3, ballInfo@ha
/* 0000AF68 8125000C */ lwz r9, 0xc(r5)
/* 0000AF6C 38030000 */ addi r0, r3, ballInfo@l
/* 0000AF70 7C070378 */ mr r7, r0
/* 0000AF74 39400000 */ li r10, 0
/* 0000AF78 38800018 */ li r4, 0x18
/* 0000AF7C 3860001D */ li r3, 0x1d
/* 0000AF80 48000028 */ b lbl_0000AFA8
lbl_0000AF84:
/* 0000AF84 88090000 */ lbz r0, 0(r9)
/* 0000AF88 2C000002 */ cmpwi r0, 2
/* 0000AF8C 40820010 */ bne lbl_0000AF9C
/* 0000AF90 90E60000 */ stw r7, 0(r6)
/* 0000AF94 98870003 */ stb r4, 3(r7)
/* 0000AF98 98670148 */ stb r3, 0x148(r7)
lbl_0000AF9C:
/* 0000AF9C 394A0001 */ addi r10, r10, 1
/* 0000AFA0 38E701A4 */ addi r7, r7, 0x1a4
/* 0000AFA4 39290001 */ addi r9, r9, 1
lbl_0000AFA8:
/* 0000AFA8 80050008 */ lwz r0, 8(r5)
/* 0000AFAC 7C0A0000 */ cmpw r10, r0
/* 0000AFB0 4180FFD4 */ blt lbl_0000AF84
/* 0000AFB4 3C600000 */ lis r3, currentBall@ha
/* 0000AFB8 91030000 */ stw r8, currentBall@l(r3)
/* 0000AFBC 8001000C */ lwz r0, 0xc(r1)
/* 0000AFC0 38210008 */ addi r1, r1, 8
/* 0000AFC4 7C0803A6 */ mtlr r0
/* 0000AFC8 4E800020 */ blr 
