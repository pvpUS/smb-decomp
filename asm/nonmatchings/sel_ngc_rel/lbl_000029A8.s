/* 000029A8 7C0802A6 */ mflr r0
/* 000029AC 38600001 */ li r3, 1
/* 000029B0 90010004 */ stw r0, 4(r1)
/* 000029B4 9421FFF0 */ stwu r1, -0x10(r1)
/* 000029B8 93E1000C */ stw r31, 0xc(r1)
/* 000029BC 4BFFD7CD */ bl event_finish
/* 000029C0 38600004 */ li r3, 4
/* 000029C4 4BFFD7C5 */ bl event_finish
/* 000029C8 38600005 */ li r3, 5
/* 000029CC 4BFFD7BD */ bl event_finish
/* 000029D0 3860000D */ li r3, 0xd
/* 000029D4 4BFFD7B5 */ bl event_finish
/* 000029D8 38600013 */ li r3, 0x13
/* 000029DC 4BFFD7AD */ bl event_finish
/* 000029E0 3C600000 */ lis r3, lbl_1000003C@ha
/* 000029E4 3BE30000 */ addi r31, r3, lbl_1000003C@l
/* 000029E8 807F0000 */ lwz r3, 0(r31)
/* 000029EC 4BFFD79D */ bl background_set_random_seed
/* 000029F0 807F0000 */ lwz r3, 0(r31)
/* 000029F4 4BFFD795 */ bl load_stage
/* 000029F8 38600001 */ li r3, 1
/* 000029FC 4BFFD78D */ bl event_start
/* 00002A00 38600004 */ li r3, 4
/* 00002A04 4BFFD785 */ bl event_start
/* 00002A08 38600005 */ li r3, 5
/* 00002A0C 4BFFD77D */ bl event_start
/* 00002A10 3860000D */ li r3, 0xd
/* 00002A14 4BFFD775 */ bl event_start
/* 00002A18 38600013 */ li r3, 0x13
/* 00002A1C 4BFFD76D */ bl event_start
/* 00002A20 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00002A24 84030000 */ lwzu r0, lbl_801EEDA8@l(r3)
/* 00002A28 2C000014 */ cmpwi r0, 0x14
/* 00002A2C 41810040 */ bgt lbl_00002A6C
/* 00002A30 80630004 */ lwz r3, 4(r3)
/* 00002A34 2C03001A */ cmpwi r3, 0x1a
/* 00002A38 41820034 */ beq lbl_00002A6C
/* 00002A3C 2C03001B */ cmpwi r3, 0x1b
/* 00002A40 4182002C */ beq lbl_00002A6C
/* 00002A44 3803FFE0 */ addi r0, r3, -32
/* 00002A48 28000001 */ cmplwi r0, 1
/* 00002A4C 40810020 */ ble lbl_00002A6C
/* 00002A50 3803FFDB */ addi r0, r3, -37
/* 00002A54 28000001 */ cmplwi r0, 1
/* 00002A58 40810014 */ ble lbl_00002A6C
/* 00002A5C 2C030033 */ cmpwi r3, 0x33
/* 00002A60 4182000C */ beq lbl_00002A6C
/* 00002A64 2C030036 */ cmpwi r3, 0x36
/* 00002A68 40820020 */ bne lbl_00002A88
lbl_00002A6C:
/* 00002A6C 3860000C */ li r3, 0xc
/* 00002A70 4BFFD719 */ bl camera_set_state_all
/* 00002A74 3C600000 */ lis r3, currStageId@ha
/* 00002A78 38630000 */ addi r3, r3, currStageId@l
/* 00002A7C A8630000 */ lha r3, 0(r3)
/* 00002A80 4BFFD709 */ bl light_init
/* 00002A84 4800000C */ b lbl_00002A90
lbl_00002A88:
/* 00002A88 38600000 */ li r3, 0
/* 00002A8C 4BFFD6FD */ bl light_init
lbl_00002A90:
/* 00002A90 80010014 */ lwz r0, 0x14(r1)
/* 00002A94 83E1000C */ lwz r31, 0xc(r1)
/* 00002A98 38210010 */ addi r1, r1, 0x10
/* 00002A9C 7C0803A6 */ mtlr r0
/* 00002AA0 4E800020 */ blr 
