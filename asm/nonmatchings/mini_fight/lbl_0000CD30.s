/* 0000CD30 7C0802A6 */ mflr r0
/* 0000CD34 3C600000 */ lis r3, debugFlags@ha
/* 0000CD38 90010004 */ stw r0, 4(r1)
/* 0000CD3C 9421FFF0 */ stwu r1, -0x10(r1)
/* 0000CD40 93E1000C */ stw r31, 0xc(r1)
/* 0000CD44 80030000 */ lwz r0, debugFlags@l(r3)
/* 0000CD48 7000000A */ andi. r0, r0, 0xa
/* 0000CD4C 408200C4 */ bne lbl_0000CE10
/* 0000CD50 3C600000 */ lis r3, modeCtrl@ha
/* 0000CD54 3BE30000 */ addi r31, r3, modeCtrl@l
/* 0000CD58 807F0000 */ lwz r3, 0(r31)
/* 0000CD5C 3803FFFF */ addi r0, r3, -1
/* 0000CD60 901F0000 */ stw r0, 0(r31)
/* 0000CD64 801F0000 */ lwz r0, 0(r31)
/* 0000CD68 2C00003C */ cmpwi r0, 0x3c
/* 0000CD6C 4081002C */ ble lbl_0000CD98
/* 0000CD70 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 0000CD74 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 0000CD78 A0030004 */ lhz r0, 4(r3)
/* 0000CD7C 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 0000CD80 41820018 */ beq lbl_0000CD98
/* 0000CD84 4BFF33E1 */ bl func_8009D794
/* 0000CD88 2C030000 */ cmpwi r3, 0
/* 0000CD8C 4182000C */ beq lbl_0000CD98
/* 0000CD90 3800003C */ li r0, 0x3c
/* 0000CD94 901F0000 */ stw r0, 0(r31)
lbl_0000CD98:
/* 0000CD98 3C600000 */ lis r3, modeCtrl@ha
/* 0000CD9C 80030000 */ lwz r0, modeCtrl@l(r3)
/* 0000CDA0 2C00003C */ cmpwi r0, 0x3c
/* 0000CDA4 40820024 */ bne lbl_0000CDC8
/* 0000CDA8 3C600100 */ lis r3, 0x100
/* 0000CDAC 3883FFFF */ addi r4, r3, -1
/* 0000CDB0 38600101 */ li r3, 0x101
/* 0000CDB4 38A0003C */ li r5, 0x3c
/* 0000CDB8 4BFF33AD */ bl start_screen_fade
/* 0000CDBC 3860003C */ li r3, 0x3c
/* 0000CDC0 38800002 */ li r4, 2
/* 0000CDC4 4BFF33A1 */ bl u_play_music
lbl_0000CDC8:
/* 0000CDC8 3C600000 */ lis r3, modeCtrl@ha
/* 0000CDCC 84030000 */ lwzu r0, modeCtrl@l(r3)
/* 0000CDD0 2C000000 */ cmpwi r0, 0
/* 0000CDD4 4080003C */ bge lbl_0000CE10
/* 0000CDD8 80630028 */ lwz r3, 0x28(r3)
/* 0000CDDC 4BFF3389 */ bl func_80012434
/* 0000CDE0 3C600000 */ lis r3, stageHeap@ha
/* 0000CDE4 38630000 */ addi r3, r3, stageHeap@l
/* 0000CDE8 80630000 */ lwz r3, 0(r3)
/* 0000CDEC 4BFF3379 */ bl OSSetCurrentHeap
/* 0000CDF0 7C7F1B78 */ mr r31, r3
/* 0000CDF4 4BFF3371 */ bl mini_commend_free_data
/* 0000CDF8 7FE3FB78 */ mr r3, r31
/* 0000CDFC 4BFF3369 */ bl OSSetCurrentHeap
/* 0000CE00 3C600000 */ lis r3, lbl_10018CFC@ha
/* 0000CE04 84030000 */ lwzu r0, lbl_10018CFC@l(r3)
/* 0000CE08 5400003C */ rlwinm r0, r0, 0, 0, 0x1e
/* 0000CE0C 90030000 */ stw r0, 0(r3)
lbl_0000CE10:
/* 0000CE10 80010014 */ lwz r0, 0x14(r1)
/* 0000CE14 83E1000C */ lwz r31, 0xc(r1)
/* 0000CE18 38210010 */ addi r1, r1, 0x10
/* 0000CE1C 7C0803A6 */ mtlr r0
/* 0000CE20 4E800020 */ blr 
lbl_0000CE24:
/* 0000CE24 4E800020 */ blr 
