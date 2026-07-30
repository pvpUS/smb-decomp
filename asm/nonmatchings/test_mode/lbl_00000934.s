/* 00000934 7C0802A6 */ mflr r0
/* 00000938 3C800000 */ lis r4, lbl_10000000@ha
/* 0000093C 90010004 */ stw r0, 4(r1)
/* 00000940 3C600000 */ lis r3, lbl_000102B0@ha
/* 00000944 9421FFD8 */ stwu r1, -0x28(r1)
/* 00000948 BF21000C */ stmw r25, 0xc(r1)
/* 0000094C 3BC40000 */ addi r30, r4, lbl_10000000@l
/* 00000950 3BE30000 */ addi r31, r3, lbl_000102B0@l
/* 00000954 38600001 */ li r3, 1
/* 00000958 38800001 */ li r4, 1
/* 0000095C 4BFFF801 */ bl window_set_cursor_pos
/* 00000960 387F0270 */ addi r3, r31, 0x270
/* 00000964 4CC63182 */ crclr 6
/* 00000968 4BFFF7F5 */ bl window_printf_2
/* 0000096C 807E0004 */ lwz r3, 4(r30)
/* 00000970 3403FFF6 */ addic. r0, r3, -10
/* 00000974 4080000C */ bge lbl_00000980
/* 00000978 38E00000 */ li r7, 0
/* 0000097C 48000018 */ b lbl_00000994
lbl_00000980:
/* 00000980 2C00000E */ cmpwi r0, 0xe
/* 00000984 4081000C */ ble lbl_00000990
/* 00000988 38E0000E */ li r7, 0xe
/* 0000098C 48000008 */ b lbl_00000994
lbl_00000990:
/* 00000990 38E3FFF6 */ addi r7, r3, -10
lbl_00000994:
/* 00000994 3B600000 */ li r27, 0
/* 00000998 3CA00000 */ lis r5, dipSwitchNames@ha
/* 0000099C 3C800000 */ lis r4, dipSwitches@ha
/* 000009A0 3C600000 */ lis r3, lbl_802F0980@ha
/* 000009A4 5766103A */ slwi r6, r27, 2
/* 000009A8 38050000 */ addi r0, r5, dipSwitchNames@l
/* 000009AC 7FA03214 */ add r29, r0, r6
/* 000009B0 23870003 */ subfic r28, r7, 3
/* 000009B4 3B240000 */ addi r25, r4, dipSwitches@l
/* 000009B8 3B430000 */ addi r26, r3, lbl_802F0980@l
/* 000009BC 4800007C */ b lbl_00000A38
lbl_000009C0:
/* 000009C0 7F601670 */ srawi r0, r27, 2
/* 000009C4 7C000194 */ addze r0, r0
/* 000009C8 7C9B0214 */ add r4, r27, r0
/* 000009CC 7C9C2214 */ add r4, r28, r4
/* 000009D0 3860000C */ li r3, 0xc
/* 000009D4 4BFFF789 */ bl window_set_cursor_pos
/* 000009D8 801E0004 */ lwz r0, 4(r30)
/* 000009DC 7C1B0000 */ cmpw r27, r0
/* 000009E0 4082000C */ bne lbl_000009EC
/* 000009E4 38600002 */ li r3, 2
/* 000009E8 4BFFF775 */ bl window_set_text_color
lbl_000009EC:
/* 000009EC 38000001 */ li r0, 1
/* 000009F0 80790000 */ lwz r3, 0(r25)
/* 000009F4 7C00D830 */ slw r0, r0, r27
/* 000009F8 7C600039 */ and. r0, r3, r0
/* 000009FC 4182000C */ beq lbl_00000A08
/* 00000A00 38BF0410 */ addi r5, r31, 0x410
/* 00000A04 48000008 */ b lbl_00000A0C
lbl_00000A08:
/* 00000A08 38BF0414 */ addi r5, r31, 0x414
lbl_00000A0C:
/* 00000A0C 809D0000 */ lwz r4, 0(r29)
/* 00000A10 387F0418 */ addi r3, r31, 0x418
/* 00000A14 4CC63182 */ crclr 6
/* 00000A18 4BFFF745 */ bl window_printf_2
/* 00000A1C 801E0004 */ lwz r0, 4(r30)
/* 00000A20 7C1B0000 */ cmpw r27, r0
/* 00000A24 4082000C */ bne lbl_00000A30
/* 00000A28 38600000 */ li r3, 0
/* 00000A2C 4BFFF731 */ bl window_set_text_color
lbl_00000A30:
/* 00000A30 3BBD0004 */ addi r29, r29, 4
/* 00000A34 3B7B0001 */ addi r27, r27, 1
lbl_00000A38:
/* 00000A38 801A0000 */ lwz r0, 0(r26)
/* 00000A3C 7C1B0000 */ cmpw r27, r0
/* 00000A40 4180FF80 */ blt lbl_000009C0
/* 00000A44 809E0004 */ lwz r4, 4(r30)
/* 00000A48 3860000A */ li r3, 0xa
/* 00000A4C 7C801670 */ srawi r0, r4, 2
/* 00000A50 7C000194 */ addze r0, r0
/* 00000A54 7C840214 */ add r4, r4, r0
/* 00000A58 7C9C2214 */ add r4, r28, r4
/* 00000A5C 4BFFF701 */ bl window_set_cursor_pos
/* 00000A60 38600001 */ li r3, 1
/* 00000A64 4BFFF6F9 */ bl window_set_text_color
/* 00000A68 387F0400 */ addi r3, r31, 0x400
/* 00000A6C 4BFFF6F1 */ bl u_debug_print
/* 00000A70 38600000 */ li r3, 0
/* 00000A74 4BFFF6E9 */ bl window_set_text_color
/* 00000A78 BB21000C */ lmw r25, 0xc(r1)
/* 00000A7C 8001002C */ lwz r0, 0x2c(r1)
/* 00000A80 38210028 */ addi r1, r1, 0x28
/* 00000A84 7C0803A6 */ mtlr r0
/* 00000A88 4E800020 */ blr 
