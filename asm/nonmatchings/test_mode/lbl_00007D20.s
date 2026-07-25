/* 00007D20 7C0802A6 */ mflr r0
/* 00007D24 3C800000 */ lis r4, lbl_10000000@ha
/* 00007D28 90010004 */ stw r0, 4(r1)
/* 00007D2C 3C600000 */ lis r3, lbl_000102B0@ha
/* 00007D30 9421FFE0 */ stwu r1, -0x20(r1)
/* 00007D34 93E1001C */ stw r31, 0x1c(r1)
/* 00007D38 3BE40000 */ addi r31, r4, lbl_10000000@l
/* 00007D3C 38800001 */ li r4, 1
/* 00007D40 93C10018 */ stw r30, 0x18(r1)
/* 00007D44 3BC30000 */ addi r30, r3, lbl_000102B0@l
/* 00007D48 38600001 */ li r3, 1
/* 00007D4C 93A10014 */ stw r29, 0x14(r1)
/* 00007D50 93810010 */ stw r28, 0x10(r1)
/* 00007D54 4BFF8409 */ bl window_set_cursor_pos
/* 00007D58 387E0194 */ addi r3, r30, 0x194
/* 00007D5C 4CC63182 */ crclr 6
/* 00007D60 4BFF83FD */ bl window_printf_2
/* 00007D64 38600003 */ li r3, 3
/* 00007D68 38800003 */ li r4, 3
/* 00007D6C 4BFF83F1 */ bl window_set_cursor_pos
/* 00007D70 387E43C4 */ addi r3, r30, 0x43c4
/* 00007D74 4BFF83E9 */ bl u_debug_print
/* 00007D78 38600001 */ li r3, 1
/* 00007D7C 4BFF83E1 */ bl window_set_text_color
/* 00007D80 809F0D5C */ lwz r4, 0xd5c(r31)
/* 00007D84 387E43CC */ addi r3, r30, 0x43cc
/* 00007D88 4CC63182 */ crclr 6
/* 00007D8C 80840010 */ lwz r4, 0x10(r4)
/* 00007D90 4BFF83CD */ bl window_printf_2
/* 00007D94 38600000 */ li r3, 0
/* 00007D98 4BFF83C5 */ bl window_set_text_color
/* 00007D9C 38600003 */ li r3, 3
/* 00007DA0 38800005 */ li r4, 5
/* 00007DA4 4BFF83B9 */ bl window_set_cursor_pos
/* 00007DA8 3B800000 */ li r28, 0
/* 00007DAC 579D103A */ slwi r29, r28, 2
/* 00007DB0 48000068 */ b lbl_00007E18
lbl_00007DB4:
/* 00007DB4 8007000C */ lwz r0, 0xc(r7)
/* 00007DB8 7C1C0000 */ cmpw r28, r0
/* 00007DBC 40820028 */ bne lbl_00007DE4
/* 00007DC0 38600001 */ li r3, 1
/* 00007DC4 4BFF8399 */ bl window_set_text_color
/* 00007DC8 3860FFFF */ li r3, -1
/* 00007DCC 38800000 */ li r4, 0
/* 00007DD0 4BFF838D */ bl window_move_cursor
/* 00007DD4 387E0400 */ addi r3, r30, 0x400
/* 00007DD8 4BFF8385 */ bl u_debug_print
/* 00007DDC 38600000 */ li r3, 0
/* 00007DE0 4BFF837D */ bl window_set_text_color
lbl_00007DE4:
/* 00007DE4 80DF0D5C */ lwz r6, 0xd5c(r31)
/* 00007DE8 387E43D0 */ addi r3, r30, 0x43d0
/* 00007DEC 4CC63182 */ crclr 6
/* 00007DF0 80A60014 */ lwz r5, 0x14(r6)
/* 00007DF4 80860018 */ lwz r4, 0x18(r6)
/* 00007DF8 80C6001C */ lwz r6, 0x1c(r6)
/* 00007DFC 7CA5E82E */ lwzx r5, r5, r29
/* 00007E00 7C04E82E */ lwzx r0, r4, r29
/* 00007E04 7C86E82E */ lwzx r4, r6, r29
/* 00007E08 7CA50050 */ subf r5, r5, r0
/* 00007E0C 4BFF8351 */ bl window_printf_2
/* 00007E10 3BBD0004 */ addi r29, r29, 4
/* 00007E14 3B9C0001 */ addi r28, r28, 1
lbl_00007E18:
/* 00007E18 80FF0D5C */ lwz r7, 0xd5c(r31)
/* 00007E1C 80070008 */ lwz r0, 8(r7)
/* 00007E20 7C1C0000 */ cmpw r28, r0
/* 00007E24 4180FF90 */ blt lbl_00007DB4
/* 00007E28 3C800000 */ lis r4, globalAnimTimer@ha
/* 00007E2C 80670010 */ lwz r3, 0x10(r7)
/* 00007E30 38840000 */ addi r4, r4, globalAnimTimer@l
/* 00007E34 80A7000C */ lwz r5, 0xc(r7)
/* 00007E38 80840000 */ lwz r4, 0(r4)
/* 00007E3C 38030001 */ addi r0, r3, 1
/* 00007E40 80C70014 */ lwz r6, 0x14(r7)
/* 00007E44 54A5103A */ slwi r5, r5, 2
/* 00007E48 7C840396 */ divwu r4, r4, r0
/* 00007E4C 80670018 */ lwz r3, 0x18(r7)
/* 00007E50 7CC6282E */ lwzx r6, r6, r5
/* 00007E54 7C03282E */ lwzx r0, r3, r5
/* 00007E58 7C660050 */ subf r3, r6, r0
/* 00007E5C 7C041B96 */ divwu r0, r4, r3
/* 00007E60 7C0019D6 */ mullw r0, r0, r3
/* 00007E64 7C002050 */ subf r0, r0, r4
/* 00007E68 7FA60214 */ add r29, r6, r0
/* 00007E6C 38600001 */ li r3, 1
/* 00007E70 38800023 */ li r4, 0x23
/* 00007E74 4BFF82E9 */ bl window_set_cursor_pos
/* 00007E78 807F0D5C */ lwz r3, 0xd5c(r31)
/* 00007E7C 57BD1838 */ slwi r29, r29, 3
/* 00007E80 80630004 */ lwz r3, 4(r3)
/* 00007E84 80030008 */ lwz r0, 8(r3)
/* 00007E88 7C60EA14 */ add r3, r0, r29
/* 00007E8C 80630004 */ lwz r3, 4(r3)
/* 00007E90 4BFF82CD */ bl u_debug_print
/* 00007E94 4BFF82C9 */ bl mathutil_mtxA_from_mtxB
/* 00007E98 3C600000 */ lis r3, mathutilData@ha
/* 00007E9C 38630000 */ addi r3, r3, mathutilData@l
/* 00007EA0 80630000 */ lwz r3, 0(r3)
/* 00007EA4 38800000 */ li r4, 0
/* 00007EA8 4BFF82B5 */ bl gxutil_load_pos_nrm_matrix
/* 00007EAC 807F0D5C */ lwz r3, 0xd5c(r31)
/* 00007EB0 80630004 */ lwz r3, 4(r3)
/* 00007EB4 80630008 */ lwz r3, 8(r3)
/* 00007EB8 7C63E82E */ lwzx r3, r3, r29
/* 00007EBC 4BFF82A1 */ bl avdisp_draw_model_culled_sort_translucent
/* 00007EC0 80010024 */ lwz r0, 0x24(r1)
/* 00007EC4 83E1001C */ lwz r31, 0x1c(r1)
/* 00007EC8 83C10018 */ lwz r30, 0x18(r1)
/* 00007ECC 7C0803A6 */ mtlr r0
/* 00007ED0 83A10014 */ lwz r29, 0x14(r1)
/* 00007ED4 83810010 */ lwz r28, 0x10(r1)
/* 00007ED8 38210020 */ addi r1, r1, 0x20
/* 00007EDC 4E800020 */ blr 
lbl_00007EE0:
/* 00007EE0 7C0802A6 */ mflr r0
/* 00007EE4 90010004 */ stw r0, 4(r1)
/* 00007EE8 9421FFF8 */ stwu r1, -8(r1)
/* 00007EEC 4BFF8271 */ bl DEMOInitROMFont
/* 00007EF0 3CA00000 */ lis r5, lbl_00007FE8@ha
/* 00007EF4 3C800000 */ lis r4, submodeFinishFunc@ha
/* 00007EF8 38050000 */ addi r0, r5, lbl_00007FE8@l
/* 00007EFC 90040000 */ stw r0, submodeFinishFunc@l(r4)
/* 00007F00 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00007F04 38000081 */ li r0, 0x81
/* 00007F08 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00007F0C 8001000C */ lwz r0, 0xc(r1)
/* 00007F10 38210008 */ addi r1, r1, 8
/* 00007F14 7C0803A6 */ mtlr r0
/* 00007F18 4E800020 */ blr 
lbl_00007F1C:
/* 00007F1C 3C600000 */ lis r3, controllerInfo@ha
/* 00007F20 38A30000 */ addi r5, r3, controllerInfo@l
/* 00007F24 A0C50030 */ lhz r6, 0x30(r5)
/* 00007F28 3C600000 */ lis r3, lbl_10000D60@ha
/* 00007F2C 38630000 */ addi r3, r3, lbl_10000D60@l
/* 00007F30 54C0077B */ rlwinm. r0, r6, 0, 0x1d, 0x1d
/* 00007F34 A0630000 */ lhz r3, 0(r3)
/* 00007F38 40820040 */ bne lbl_00007F78
/* 00007F3C 3C800000 */ lis r4, analogInputs@ha
/* 00007F40 38840000 */ addi r4, r4, analogInputs@l
/* 00007F44 A0040008 */ lhz r0, 8(r4)
/* 00007F48 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00007F4C 4082002C */ bne lbl_00007F78
/* 00007F50 A0050000 */ lhz r0, 0(r5)
/* 00007F54 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00007F58 40820010 */ bne lbl_00007F68
/* 00007F5C A0040000 */ lhz r0, 0(r4)
/* 00007F60 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00007F64 41820024 */ beq lbl_00007F88
lbl_00007F68:
/* 00007F68 3C800000 */ lis r4, analogInputs@ha
/* 00007F6C A0040000 */ lhz r0, analogInputs@l(r4)
/* 00007F70 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00007F74 41820014 */ beq lbl_00007F88
lbl_00007F78:
/* 00007F78 38630001 */ addi r3, r3, 1
/* 00007F7C 28030018 */ cmplwi r3, 0x18
/* 00007F80 41800008 */ blt lbl_00007F88
/* 00007F84 38600000 */ li r3, 0
lbl_00007F88:
/* 00007F88 54C00739 */ rlwinm. r0, r6, 0, 0x1c, 0x1c
/* 00007F8C 40820044 */ bne lbl_00007FD0
/* 00007F90 3C800000 */ lis r4, analogInputs@ha
/* 00007F94 38A40000 */ addi r5, r4, analogInputs@l
/* 00007F98 A0050008 */ lhz r0, 8(r5)
/* 00007F9C 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 00007FA0 40820030 */ bne lbl_00007FD0
/* 00007FA4 3C800000 */ lis r4, controllerInfo@ha
/* 00007FA8 A0040000 */ lhz r0, controllerInfo@l(r4)
/* 00007FAC 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 00007FB0 40820010 */ bne lbl_00007FC0
/* 00007FB4 A0050000 */ lhz r0, 0(r5)
/* 00007FB8 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 00007FBC 41820020 */ beq lbl_00007FDC
lbl_00007FC0:
/* 00007FC0 3C800000 */ lis r4, analogInputs@ha
/* 00007FC4 A0040000 */ lhz r0, analogInputs@l(r4)
/* 00007FC8 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00007FCC 41820010 */ beq lbl_00007FDC
lbl_00007FD0:
/* 00007FD0 3463FFFF */ addic. r3, r3, -1
/* 00007FD4 40800008 */ bge lbl_00007FDC
/* 00007FD8 38600017 */ li r3, 0x17
lbl_00007FDC:
/* 00007FDC 3C800000 */ lis r4, lbl_10000D60@ha
/* 00007FE0 B0640000 */ sth r3, lbl_10000D60@l(r4)
/* 00007FE4 4E800020 */ blr 
