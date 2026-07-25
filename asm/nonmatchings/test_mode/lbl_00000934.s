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
lbl_00000A8C:
/* 00000A8C 3C600000 */ lis r3, lbl_10000008@ha
/* 00000A90 38830000 */ addi r4, r3, lbl_10000008@l
/* 00000A94 38000000 */ li r0, 0
/* 00000A98 90040000 */ stw r0, 0(r4)
/* 00000A9C 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00000AA0 38000062 */ li r0, 0x62
/* 00000AA4 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00000AA8 4E800020 */ blr 
lbl_00000AAC:
/* 00000AAC 7C0802A6 */ mflr r0
/* 00000AB0 3C600000 */ lis r3, controllerInfo@ha
/* 00000AB4 90010004 */ stw r0, 4(r1)
/* 00000AB8 3C800000 */ lis r4, lbl_10000008@ha
/* 00000ABC 9421FFE8 */ stwu r1, -0x18(r1)
/* 00000AC0 93E10014 */ stw r31, 0x14(r1)
/* 00000AC4 93C10010 */ stw r30, 0x10(r1)
/* 00000AC8 93A1000C */ stw r29, 0xc(r1)
/* 00000ACC 93810008 */ stw r28, 8(r1)
/* 00000AD0 A4030000 */ lhzu r0, controllerInfo@l(r3)
/* 00000AD4 83840000 */ lwz r28, lbl_10000008@l(r4)
/* 00000AD8 3C800000 */ lis r4, lbl_000102B0@ha
/* 00000ADC 54000673 */ rlwinm. r0, r0, 0, 0x19, 0x19
/* 00000AE0 3BE40000 */ addi r31, r4, lbl_000102B0@l
/* 00000AE4 41820034 */ beq lbl_00000B18
/* 00000AE8 A0630018 */ lhz r3, 0x18(r3)
/* 00000AEC 546007FF */ clrlwi. r0, r3, 0x1f
/* 00000AF0 41820010 */ beq lbl_00000B00
/* 00000AF4 379CFFFF */ addic. r28, r28, -1
/* 00000AF8 40800008 */ bge lbl_00000B00
/* 00000AFC 3B800000 */ li r28, 0
lbl_00000B00:
/* 00000B00 546007BD */ rlwinm. r0, r3, 0, 0x1e, 0x1e
/* 00000B04 41820014 */ beq lbl_00000B18
/* 00000B08 3B9C0001 */ addi r28, r28, 1
/* 00000B0C 2C1C0004 */ cmpwi r28, 4
/* 00000B10 41800008 */ blt lbl_00000B18
/* 00000B14 3B800003 */ li r28, 3
lbl_00000B18:
/* 00000B18 3C600000 */ lis r3, lbl_10000008@ha
/* 00000B1C 93830000 */ stw r28, lbl_10000008@l(r3)
/* 00000B20 38600001 */ li r3, 1
/* 00000B24 38800001 */ li r4, 1
/* 00000B28 4BFFF635 */ bl window_set_cursor_pos
/* 00000B2C 387F0424 */ addi r3, r31, 0x424
/* 00000B30 4CC63182 */ crclr 6
/* 00000B34 4BFFF629 */ bl window_printf_2
/* 00000B38 38600003 */ li r3, 3
/* 00000B3C 38800003 */ li r4, 3
/* 00000B40 4BFFF61D */ bl window_set_cursor_pos
/* 00000B44 38600002 */ li r3, 2
/* 00000B48 4BFFF615 */ bl window_set_text_color
/* 00000B4C 389C0000 */ addi r4, r28, 0
/* 00000B50 4CC63182 */ crclr 6
/* 00000B54 387F0430 */ addi r3, r31, 0x430
/* 00000B58 4BFFF605 */ bl window_printf_2
/* 00000B5C 38600000 */ li r3, 0
/* 00000B60 4BFFF5FD */ bl window_set_text_color
/* 00000B64 387F0140 */ addi r3, r31, 0x140
/* 00000B68 4CC63182 */ crclr 6
/* 00000B6C 4BFFF5F1 */ bl window_printf_2
/* 00000B70 1FBC003C */ mulli r29, r28, 0x3c
/* 00000B74 3C600000 */ lis r3, controllerInfo@ha
/* 00000B78 38030000 */ addi r0, r3, controllerInfo@l
/* 00000B7C 7FC0EA14 */ add r30, r0, r29
/* 00000B80 A01E0000 */ lhz r0, 0(r30)
/* 00000B84 540007FF */ clrlwi. r0, r0, 0x1f
/* 00000B88 4182000C */ beq lbl_00000B94
/* 00000B8C 389F0444 */ addi r4, r31, 0x444
/* 00000B90 48000008 */ b lbl_00000B98
lbl_00000B94:
/* 00000B94 389F0414 */ addi r4, r31, 0x414
lbl_00000B98:
/* 00000B98 4CC63182 */ crclr 6
/* 00000B9C 387F0448 */ addi r3, r31, 0x448
/* 00000BA0 4BFFF5BD */ bl window_printf_2
/* 00000BA4 A01E0000 */ lhz r0, 0(r30)
/* 00000BA8 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00000BAC 4182000C */ beq lbl_00000BB8
/* 00000BB0 389F0444 */ addi r4, r31, 0x444
/* 00000BB4 48000008 */ b lbl_00000BBC
lbl_00000BB8:
/* 00000BB8 389F0414 */ addi r4, r31, 0x414
lbl_00000BBC:
/* 00000BBC 4CC63182 */ crclr 6
/* 00000BC0 387F045C */ addi r3, r31, 0x45c
/* 00000BC4 4BFFF599 */ bl window_printf_2
/* 00000BC8 A01E0000 */ lhz r0, 0(r30)
/* 00000BCC 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00000BD0 4182000C */ beq lbl_00000BDC
/* 00000BD4 389F0444 */ addi r4, r31, 0x444
/* 00000BD8 48000008 */ b lbl_00000BE0
lbl_00000BDC:
/* 00000BDC 389F0414 */ addi r4, r31, 0x414
lbl_00000BE0:
/* 00000BE0 4CC63182 */ crclr 6
/* 00000BE4 387F0470 */ addi r3, r31, 0x470
/* 00000BE8 4BFFF575 */ bl window_printf_2
/* 00000BEC A01E0000 */ lhz r0, 0(r30)
/* 00000BF0 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 00000BF4 4182000C */ beq lbl_00000C00
/* 00000BF8 389F0444 */ addi r4, r31, 0x444
/* 00000BFC 48000008 */ b lbl_00000C04
lbl_00000C00:
/* 00000C00 389F0414 */ addi r4, r31, 0x414
lbl_00000C04:
/* 00000C04 4CC63182 */ crclr 6
/* 00000C08 387F0484 */ addi r3, r31, 0x484
/* 00000C0C 4BFFF551 */ bl window_printf_2
/* 00000C10 A01E0000 */ lhz r0, 0(r30)
/* 00000C14 540006F7 */ rlwinm. r0, r0, 0, 0x1b, 0x1b
/* 00000C18 4182000C */ beq lbl_00000C24
/* 00000C1C 389F0444 */ addi r4, r31, 0x444
/* 00000C20 48000008 */ b lbl_00000C28
lbl_00000C24:
/* 00000C24 389F0414 */ addi r4, r31, 0x414
lbl_00000C28:
/* 00000C28 4CC63182 */ crclr 6
/* 00000C2C 387F0498 */ addi r3, r31, 0x498
/* 00000C30 4BFFF52D */ bl window_printf_2
/* 00000C34 A01E0000 */ lhz r0, 0(r30)
/* 00000C38 54000673 */ rlwinm. r0, r0, 0, 0x19, 0x19
/* 00000C3C 4182000C */ beq lbl_00000C48
/* 00000C40 389F0444 */ addi r4, r31, 0x444
/* 00000C44 48000008 */ b lbl_00000C4C
lbl_00000C48:
/* 00000C48 389F0414 */ addi r4, r31, 0x414
lbl_00000C4C:
/* 00000C4C 4CC63182 */ crclr 6
/* 00000C50 387F04AC */ addi r3, r31, 0x4ac
/* 00000C54 4BFFF509 */ bl window_printf_2
/* 00000C58 A01E0000 */ lhz r0, 0(r30)
/* 00000C5C 540006B5 */ rlwinm. r0, r0, 0, 0x1a, 0x1a
/* 00000C60 4182000C */ beq lbl_00000C6C
/* 00000C64 389F0444 */ addi r4, r31, 0x444
/* 00000C68 48000008 */ b lbl_00000C70
lbl_00000C6C:
/* 00000C6C 389F0414 */ addi r4, r31, 0x414
lbl_00000C70:
/* 00000C70 4CC63182 */ crclr 6
/* 00000C74 387F04C0 */ addi r3, r31, 0x4c0
/* 00000C78 4BFFF4E5 */ bl window_printf_2
/* 00000C7C A01E0000 */ lhz r0, 0(r30)
/* 00000C80 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00000C84 4182000C */ beq lbl_00000C90
/* 00000C88 389F0444 */ addi r4, r31, 0x444
/* 00000C8C 48000008 */ b lbl_00000C94
lbl_00000C90:
/* 00000C90 389F0414 */ addi r4, r31, 0x414
lbl_00000C94:
/* 00000C94 4CC63182 */ crclr 6
/* 00000C98 387F04D4 */ addi r3, r31, 0x4d4
/* 00000C9C 4BFFF4C1 */ bl window_printf_2
/* 00000CA0 A01E0000 */ lhz r0, 0(r30)
/* 00000CA4 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00000CA8 4182000C */ beq lbl_00000CB4
/* 00000CAC 389F0444 */ addi r4, r31, 0x444
/* 00000CB0 48000008 */ b lbl_00000CB8
lbl_00000CB4:
/* 00000CB4 389F0414 */ addi r4, r31, 0x414
lbl_00000CB8:
/* 00000CB8 4CC63182 */ crclr 6
/* 00000CBC 387F04E8 */ addi r3, r31, 0x4e8
/* 00000CC0 4BFFF49D */ bl window_printf_2
/* 00000CC4 A01E0000 */ lhz r0, 0(r30)
/* 00000CC8 5400056B */ rlwinm. r0, r0, 0, 0x15, 0x15
/* 00000CCC 4182000C */ beq lbl_00000CD8
/* 00000CD0 389F0444 */ addi r4, r31, 0x444
/* 00000CD4 48000008 */ b lbl_00000CDC
lbl_00000CD8:
/* 00000CD8 389F0414 */ addi r4, r31, 0x414
lbl_00000CDC:
/* 00000CDC 4CC63182 */ crclr 6
/* 00000CE0 387F04FC */ addi r3, r31, 0x4fc
/* 00000CE4 4BFFF479 */ bl window_printf_2
/* 00000CE8 A01E0000 */ lhz r0, 0(r30)
/* 00000CEC 54000529 */ rlwinm. r0, r0, 0, 0x14, 0x14
/* 00000CF0 4182000C */ beq lbl_00000CFC
/* 00000CF4 389F0444 */ addi r4, r31, 0x444
/* 00000CF8 48000008 */ b lbl_00000D00
lbl_00000CFC:
/* 00000CFC 389F0414 */ addi r4, r31, 0x414
lbl_00000D00:
/* 00000D00 4CC63182 */ crclr 6
/* 00000D04 387F0510 */ addi r3, r31, 0x510
/* 00000D08 4BFFF455 */ bl window_printf_2
/* 00000D0C A01E0000 */ lhz r0, 0(r30)
/* 00000D10 540004E7 */ rlwinm. r0, r0, 0, 0x13, 0x13
/* 00000D14 4182000C */ beq lbl_00000D20
/* 00000D18 389F0444 */ addi r4, r31, 0x444
/* 00000D1C 48000008 */ b lbl_00000D24
lbl_00000D20:
/* 00000D20 389F0414 */ addi r4, r31, 0x414
lbl_00000D24:
/* 00000D24 4CC63182 */ crclr 6
/* 00000D28 387F0524 */ addi r3, r31, 0x524
/* 00000D2C 4BFFF431 */ bl window_printf_2
/* 00000D30 387F0140 */ addi r3, r31, 0x140
/* 00000D34 4CC63182 */ crclr 6
/* 00000D38 4BFFF425 */ bl window_printf_2
/* 00000D3C 3C600000 */ lis r3, controllerInfo@ha
/* 00000D40 4CC63182 */ crclr 6
/* 00000D44 38030000 */ addi r0, r3, controllerInfo@l
/* 00000D48 7FA0EA14 */ add r29, r0, r29
/* 00000D4C 889D0002 */ lbz r4, 2(r29)
/* 00000D50 387F0538 */ addi r3, r31, 0x538
/* 00000D54 7C840774 */ extsb r4, r4
/* 00000D58 4BFFF405 */ bl window_printf_2
/* 00000D5C 889D0003 */ lbz r4, 3(r29)
/* 00000D60 387F054C */ addi r3, r31, 0x54c
/* 00000D64 4CC63182 */ crclr 6
/* 00000D68 7C840774 */ extsb r4, r4
/* 00000D6C 4BFFF3F1 */ bl window_printf_2
/* 00000D70 889D0004 */ lbz r4, 4(r29)
/* 00000D74 387F0560 */ addi r3, r31, 0x560
/* 00000D78 4CC63182 */ crclr 6
/* 00000D7C 7C840774 */ extsb r4, r4
/* 00000D80 4BFFF3DD */ bl window_printf_2
/* 00000D84 889D0005 */ lbz r4, 5(r29)
/* 00000D88 387F0574 */ addi r3, r31, 0x574
/* 00000D8C 4CC63182 */ crclr 6
/* 00000D90 7C840774 */ extsb r4, r4
/* 00000D94 4BFFF3C9 */ bl window_printf_2
/* 00000D98 889D0006 */ lbz r4, 6(r29)
/* 00000D9C 387F0588 */ addi r3, r31, 0x588
/* 00000DA0 4CC63182 */ crclr 6
/* 00000DA4 4BFFF3B9 */ bl window_printf_2
/* 00000DA8 889D0007 */ lbz r4, 7(r29)
/* 00000DAC 387F059C */ addi r3, r31, 0x59c
/* 00000DB0 4CC63182 */ crclr 6
/* 00000DB4 4BFFF3A9 */ bl window_printf_2
/* 00000DB8 889D0008 */ lbz r4, 8(r29)
/* 00000DBC 387F05B0 */ addi r3, r31, 0x5b0
/* 00000DC0 4CC63182 */ crclr 6
/* 00000DC4 4BFFF399 */ bl window_printf_2
/* 00000DC8 889D0009 */ lbz r4, 9(r29)
/* 00000DCC 387F05C4 */ addi r3, r31, 0x5c4
/* 00000DD0 4CC63182 */ crclr 6
/* 00000DD4 4BFFF389 */ bl window_printf_2
/* 00000DD8 889D000A */ lbz r4, 0xa(r29)
/* 00000DDC 387F05D8 */ addi r3, r31, 0x5d8
/* 00000DE0 4CC63182 */ crclr 6
/* 00000DE4 7C840774 */ extsb r4, r4
/* 00000DE8 4BFFF375 */ bl window_printf_2
/* 00000DEC 38600017 */ li r3, 0x17
/* 00000DF0 38800003 */ li r4, 3
/* 00000DF4 4BFFF369 */ bl window_set_cursor_pos
/* 00000DF8 387F05EC */ addi r3, r31, 0x5ec
/* 00000DFC 4CC63182 */ crclr 6
/* 00000E00 4BFFF35D */ bl window_printf_2
/* 00000E04 387F0140 */ addi r3, r31, 0x140
/* 00000E08 4CC63182 */ crclr 6
/* 00000E0C 4BFFF351 */ bl window_printf_2
/* 00000E10 1C9C000A */ mulli r4, r28, 0xa
/* 00000E14 3C600000 */ lis r3, analogInputs@ha
/* 00000E18 38030000 */ addi r0, r3, analogInputs@l
/* 00000E1C 7FA02214 */ add r29, r0, r4
/* 00000E20 A01D0000 */ lhz r0, 0(r29)
/* 00000E24 540007FF */ clrlwi. r0, r0, 0x1f
/* 00000E28 4182000C */ beq lbl_00000E34
/* 00000E2C 389F0444 */ addi r4, r31, 0x444
/* 00000E30 48000008 */ b lbl_00000E38
lbl_00000E34:
/* 00000E34 389F0414 */ addi r4, r31, 0x414
lbl_00000E38:
/* 00000E38 4CC63182 */ crclr 6
/* 00000E3C 387F05F8 */ addi r3, r31, 0x5f8
/* 00000E40 4BFFF31D */ bl window_printf_2
/* 00000E44 A01D0000 */ lhz r0, 0(r29)
/* 00000E48 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00000E4C 4182000C */ beq lbl_00000E58
/* 00000E50 389F0444 */ addi r4, r31, 0x444
/* 00000E54 48000008 */ b lbl_00000E5C
lbl_00000E58:
/* 00000E58 389F0414 */ addi r4, r31, 0x414
lbl_00000E5C:
/* 00000E5C 4CC63182 */ crclr 6
/* 00000E60 387F060C */ addi r3, r31, 0x60c
/* 00000E64 4BFFF2F9 */ bl window_printf_2
/* 00000E68 A01D0000 */ lhz r0, 0(r29)
/* 00000E6C 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00000E70 4182000C */ beq lbl_00000E7C
/* 00000E74 389F0444 */ addi r4, r31, 0x444
/* 00000E78 48000008 */ b lbl_00000E80
lbl_00000E7C:
/* 00000E7C 389F0414 */ addi r4, r31, 0x414
lbl_00000E80:
/* 00000E80 4CC63182 */ crclr 6
/* 00000E84 387F0620 */ addi r3, r31, 0x620
/* 00000E88 4BFFF2D5 */ bl window_printf_2
/* 00000E8C A01D0000 */ lhz r0, 0(r29)
/* 00000E90 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 00000E94 4182000C */ beq lbl_00000EA0
/* 00000E98 389F0444 */ addi r4, r31, 0x444
/* 00000E9C 48000008 */ b lbl_00000EA4
lbl_00000EA0:
/* 00000EA0 389F0414 */ addi r4, r31, 0x414
lbl_00000EA4:
/* 00000EA4 4CC63182 */ crclr 6
/* 00000EA8 387F0634 */ addi r3, r31, 0x634
/* 00000EAC 4BFFF2B1 */ bl window_printf_2
/* 00000EB0 A01D0000 */ lhz r0, 0(r29)
/* 00000EB4 540006F7 */ rlwinm. r0, r0, 0, 0x1b, 0x1b
/* 00000EB8 4182000C */ beq lbl_00000EC4
/* 00000EBC 389F0444 */ addi r4, r31, 0x444
/* 00000EC0 48000008 */ b lbl_00000EC8
lbl_00000EC4:
/* 00000EC4 389F0414 */ addi r4, r31, 0x414
lbl_00000EC8:
/* 00000EC8 4CC63182 */ crclr 6
/* 00000ECC 387F0648 */ addi r3, r31, 0x648
/* 00000ED0 4BFFF28D */ bl window_printf_2
/* 00000ED4 A01D0000 */ lhz r0, 0(r29)
/* 00000ED8 540006B5 */ rlwinm. r0, r0, 0, 0x1a, 0x1a
/* 00000EDC 4182000C */ beq lbl_00000EE8
/* 00000EE0 389F0444 */ addi r4, r31, 0x444
/* 00000EE4 48000008 */ b lbl_00000EEC
lbl_00000EE8:
/* 00000EE8 389F0414 */ addi r4, r31, 0x414
lbl_00000EEC:
/* 00000EEC 4CC63182 */ crclr 6
/* 00000EF0 387F065C */ addi r3, r31, 0x65c
/* 00000EF4 4BFFF269 */ bl window_printf_2
/* 00000EF8 A01D0000 */ lhz r0, 0(r29)
/* 00000EFC 54000673 */ rlwinm. r0, r0, 0, 0x19, 0x19
/* 00000F00 4182000C */ beq lbl_00000F0C
/* 00000F04 389F0444 */ addi r4, r31, 0x444
/* 00000F08 48000008 */ b lbl_00000F10
lbl_00000F0C:
/* 00000F0C 389F0414 */ addi r4, r31, 0x414
lbl_00000F10:
/* 00000F10 4CC63182 */ crclr 6
/* 00000F14 387F0670 */ addi r3, r31, 0x670
/* 00000F18 4BFFF245 */ bl window_printf_2
/* 00000F1C A01D0000 */ lhz r0, 0(r29)
/* 00000F20 54000631 */ rlwinm. r0, r0, 0, 0x18, 0x18
/* 00000F24 4182000C */ beq lbl_00000F30
/* 00000F28 389F0444 */ addi r4, r31, 0x444
/* 00000F2C 48000008 */ b lbl_00000F34
lbl_00000F30:
/* 00000F30 389F0414 */ addi r4, r31, 0x414
lbl_00000F34:
/* 00000F34 4CC63182 */ crclr 6
/* 00000F38 387F0684 */ addi r3, r31, 0x684
/* 00000F3C 4BFFF221 */ bl window_printf_2
/* 00000F40 A01D0000 */ lhz r0, 0(r29)
/* 00000F44 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00000F48 4182000C */ beq lbl_00000F54
/* 00000F4C 389F0444 */ addi r4, r31, 0x444
/* 00000F50 48000008 */ b lbl_00000F58
lbl_00000F54:
/* 00000F54 389F0414 */ addi r4, r31, 0x414
lbl_00000F58:
/* 00000F58 4CC63182 */ crclr 6
/* 00000F5C 387F04AC */ addi r3, r31, 0x4ac
/* 00000F60 4BFFF1FD */ bl window_printf_2
/* 00000F64 A01D0000 */ lhz r0, 0(r29)
/* 00000F68 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00000F6C 4182000C */ beq lbl_00000F78
/* 00000F70 389F0444 */ addi r4, r31, 0x444
/* 00000F74 48000008 */ b lbl_00000F7C
lbl_00000F78:
/* 00000F78 389F0414 */ addi r4, r31, 0x414
lbl_00000F7C:
/* 00000F7C 4CC63182 */ crclr 6
/* 00000F80 387F04C0 */ addi r3, r31, 0x4c0
/* 00000F84 4BFFF1D9 */ bl window_printf_2
/* 00000F88 38600016 */ li r3, 0x16
/* 00000F8C 38800012 */ li r4, 0x12
/* 00000F90 4BFFF1CD */ bl window_set_cursor_pos
/* 00000F94 387F0698 */ addi r3, r31, 0x698
/* 00000F98 4CC63182 */ crclr 6
/* 00000F9C 4BFFF1C1 */ bl window_printf_2
/* 00000FA0 387F0140 */ addi r3, r31, 0x140
/* 00000FA4 4CC63182 */ crclr 6
/* 00000FA8 4BFFF1B5 */ bl window_printf_2
/* 00000FAC 387F06A8 */ addi r3, r31, 0x6a8
/* 00000FB0 4CC63182 */ crclr 6
/* 00000FB4 4BFFF1A9 */ bl window_printf_2
/* 00000FB8 387F06B8 */ addi r3, r31, 0x6b8
/* 00000FBC 4CC63182 */ crclr 6
/* 00000FC0 4BFFF19D */ bl window_printf_2
/* 00000FC4 387F06C4 */ addi r3, r31, 0x6c4
/* 00000FC8 4CC63182 */ crclr 6
/* 00000FCC 4BFFF191 */ bl window_printf_2
/* 00000FD0 387F06D8 */ addi r3, r31, 0x6d8
/* 00000FD4 4CC63182 */ crclr 6
/* 00000FD8 4BFFF185 */ bl window_printf_2
/* 00000FDC 387F06E4 */ addi r3, r31, 0x6e4
/* 00000FE0 4CC63182 */ crclr 6
/* 00000FE4 4BFFF179 */ bl window_printf_2
/* 00000FE8 8001001C */ lwz r0, 0x1c(r1)
/* 00000FEC 83E10014 */ lwz r31, 0x14(r1)
/* 00000FF0 83C10010 */ lwz r30, 0x10(r1)
/* 00000FF4 7C0803A6 */ mtlr r0
/* 00000FF8 83A1000C */ lwz r29, 0xc(r1)
/* 00000FFC 83810008 */ lwz r28, 8(r1)
/* 00001000 38210018 */ addi r1, r1, 0x18
/* 00001004 4E800020 */ blr 
lbl_00001008:
/* 00001008 7C0802A6 */ mflr r0
/* 0000100C 3C600000 */ lis r3, lbl_10000000@ha
/* 00001010 90010004 */ stw r0, 4(r1)
/* 00001014 9421FFF0 */ stwu r1, -0x10(r1)
/* 00001018 93E1000C */ stw r31, 0xc(r1)
/* 0000101C 3BE30000 */ addi r31, r3, lbl_10000000@l
/* 00001020 38600012 */ li r3, 0x12
/* 00001024 4BFFF139 */ bl event_start
/* 00001028 38600001 */ li r3, 1
/* 0000102C 38800003 */ li r4, 3
/* 00001030 4BFFF12D */ bl u_play_music
/* 00001034 38000001 */ li r0, 1
/* 00001038 901F000C */ stw r0, 0xc(r31)
/* 0000103C 38E00000 */ li r7, 0
/* 00001040 3C600000 */ lis r3, g_soundGroupDesc@ha
/* 00001044 90FF0010 */ stw r7, 0x10(r31)
/* 00001048 38830000 */ addi r4, r3, g_soundGroupDesc@l
/* 0000104C 3800007F */ li r0, 0x7f
/* 00001050 80840004 */ lwz r4, 4(r4)
/* 00001054 38C02000 */ li r6, 0x2000
/* 00001058 38A00100 */ li r5, 0x100
/* 0000105C 38840001 */ addi r4, r4, 1
/* 00001060 909F0014 */ stw r4, 0x14(r31)
/* 00001064 388000FF */ li r4, 0xff
/* 00001068 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 0000106C 981F0018 */ stb r0, 0x18(r31)
/* 00001070 38000066 */ li r0, 0x66
/* 00001074 98FF0019 */ stb r7, 0x19(r31)
/* 00001078 98FF001A */ stb r7, 0x1a(r31)
/* 0000107C B0DF001C */ sth r6, 0x1c(r31)
/* 00001080 B0DF001E */ sth r6, 0x1e(r31)
/* 00001084 B0FF0020 */ sth r7, 0x20(r31)
/* 00001088 98FF0022 */ stb r7, 0x22(r31)
/* 0000108C 98FF0023 */ stb r7, 0x23(r31)
/* 00001090 90FF0024 */ stw r7, 0x24(r31)
/* 00001094 98FF0028 */ stb r7, 0x28(r31)
/* 00001098 90FF002C */ stw r7, 0x2c(r31)
/* 0000109C B0BF0030 */ sth r5, 0x30(r31)
/* 000010A0 90FF0034 */ stw r7, 0x34(r31)
/* 000010A4 909F0038 */ stw r4, 0x38(r31)
/* 000010A8 90FF003C */ stw r7, 0x3c(r31)
/* 000010AC B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 000010B0 80010014 */ lwz r0, 0x14(r1)
/* 000010B4 83E1000C */ lwz r31, 0xc(r1)
/* 000010B8 38210010 */ addi r1, r1, 0x10
/* 000010BC 7C0803A6 */ mtlr r0
/* 000010C0 4E800020 */ blr 
lbl_000010C4:
/* 000010C4 7C0802A6 */ mflr r0
/* 000010C8 3C600000 */ lis r3, debugFlags@ha
/* 000010CC 90010004 */ stw r0, 4(r1)
/* 000010D0 3C800000 */ lis r4, lbl_0000FE78@ha
/* 000010D4 9421FF90 */ stwu r1, -0x70(r1)
/* 000010D8 BF61005C */ stmw r27, 0x5c(r1)
/* 000010DC 3B840000 */ addi r28, r4, lbl_0000FE78@l
/* 000010E0 80030000 */ lwz r0, debugFlags@l(r3)
/* 000010E4 3C600000 */ lis r3, lbl_10000000@ha
/* 000010E8 3BA30000 */ addi r29, r3, lbl_10000000@l
/* 000010EC 7000000A */ andi. r0, r0, 0xa
/* 000010F0 40820A74 */ bne lbl_00001B64
/* 000010F4 3C600000 */ lis r3, controllerInfo@ha
/* 000010F8 38630000 */ addi r3, r3, controllerInfo@l
/* 000010FC A0830018 */ lhz r4, 0x18(r3)
/* 00001100 3B630018 */ addi r27, r3, 0x18
/* 00001104 5480077B */ rlwinm. r0, r4, 0, 0x1d, 0x1d
/* 00001108 40820010 */ bne lbl_00001118
/* 0000110C A0030030 */ lhz r0, 0x30(r3)
/* 00001110 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00001114 41820020 */ beq lbl_00001134
lbl_00001118:
/* 00001118 807D000C */ lwz r3, 0xc(r29)
/* 0000111C 38030001 */ addi r0, r3, 1
/* 00001120 2C000006 */ cmpwi r0, 6
/* 00001124 901D000C */ stw r0, 0xc(r29)
/* 00001128 4081000C */ ble lbl_00001134
/* 0000112C 38000000 */ li r0, 0
/* 00001130 901D000C */ stw r0, 0xc(r29)
lbl_00001134:
/* 00001134 54800739 */ rlwinm. r0, r4, 0, 0x1c, 0x1c
/* 00001138 40820018 */ bne lbl_00001150
/* 0000113C 3C600000 */ lis r3, controllerInfo@ha
/* 00001140 38630000 */ addi r3, r3, controllerInfo@l
/* 00001144 A0030030 */ lhz r0, 0x30(r3)
/* 00001148 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 0000114C 4182001C */ beq lbl_00001168
lbl_00001150:
/* 00001150 807D000C */ lwz r3, 0xc(r29)
/* 00001154 3403FFFF */ addic. r0, r3, -1
/* 00001158 901D000C */ stw r0, 0xc(r29)
/* 0000115C 4080000C */ bge lbl_00001168
/* 00001160 38000006 */ li r0, 6
/* 00001164 901D000C */ stw r0, 0xc(r29)
lbl_00001168:
/* 00001168 54800529 */ rlwinm. r0, r4, 0, 0x14, 0x14
/* 0000116C 41820008 */ beq lbl_00001174
/* 00001170 4BFFEFED */ bl ev_sound_dest
lbl_00001174:
/* 00001174 801D000C */ lwz r0, 0xc(r29)
/* 00001178 28000006 */ cmplwi r0, 6
/* 0000117C 418109E8 */ bgt lbl_00001B64
/* 00001180 3C600000 */ lis r3, lbl_000109A8@ha
/* 00001184 38630000 */ addi r3, r3, lbl_000109A8@l
/* 00001188 5400103A */ slwi r0, r0, 2
/* 0000118C 7C03002E */ lwzx r0, r3, r0
/* 00001190 7C0903A6 */ mtctr r0
/* 00001194 4E800420 */ bctr 
lbl_00001198:
/* 00001198 A01B0000 */ lhz r0, 0(r27)
/* 0000119C 540307BD */ rlwinm. r3, r0, 0, 0x1e, 0x1e
/* 000011A0 4082002C */ bne lbl_000011CC
/* 000011A4 3C800000 */ lis r4, controllerInfo@ha
/* 000011A8 38A40000 */ addi r5, r4, controllerInfo@l
/* 000011AC A0850030 */ lhz r4, 0x30(r5)
/* 000011B0 548407BD */ rlwinm. r4, r4, 0, 0x1e, 0x1e
/* 000011B4 40820018 */ bne lbl_000011CC
/* 000011B8 A0A50000 */ lhz r5, 0(r5)
/* 000011BC 54A407BD */ rlwinm. r4, r5, 0, 0x1e, 0x1e
/* 000011C0 41820028 */ beq lbl_000011E8
/* 000011C4 54A4056B */ rlwinm. r4, r5, 0, 0x15, 0x15
/* 000011C8 41820020 */ beq lbl_000011E8
lbl_000011CC:
/* 000011CC 809D0010 */ lwz r4, 0x10(r29)
/* 000011D0 38840001 */ addi r4, r4, 1
/* 000011D4 2C040011 */ cmpwi r4, 0x11
/* 000011D8 909D0010 */ stw r4, 0x10(r29)
/* 000011DC 4180000C */ blt lbl_000011E8
/* 000011E0 38800000 */ li r4, 0
/* 000011E4 909D0010 */ stw r4, 0x10(r29)
lbl_000011E8:
/* 000011E8 540607FF */ clrlwi. r6, r0, 0x1f
/* 000011EC 4082002C */ bne lbl_00001218
/* 000011F0 3C800000 */ lis r4, controllerInfo@ha
/* 000011F4 38A40000 */ addi r5, r4, controllerInfo@l
/* 000011F8 A0850030 */ lhz r4, 0x30(r5)
/* 000011FC 548407FF */ clrlwi. r4, r4, 0x1f
/* 00001200 40820018 */ bne lbl_00001218
/* 00001204 A0A50000 */ lhz r5, 0(r5)
/* 00001208 54A407FF */ clrlwi. r4, r5, 0x1f
/* 0000120C 41820024 */ beq lbl_00001230
/* 00001210 54A4056B */ rlwinm. r4, r5, 0, 0x15, 0x15
/* 00001214 4182001C */ beq lbl_00001230
lbl_00001218:
/* 00001218 809D0010 */ lwz r4, 0x10(r29)
/* 0000121C 3484FFFF */ addic. r4, r4, -1
/* 00001220 909D0010 */ stw r4, 0x10(r29)
/* 00001224 4080000C */ bge lbl_00001230
/* 00001228 38800010 */ li r4, 0x10
/* 0000122C 909D0010 */ stw r4, 0x10(r29)
lbl_00001230:
/* 00001230 2C060000 */ cmpwi r6, 0
/* 00001234 38A00001 */ li r5, 1
/* 00001238 38C50000 */ addi r6, r5, 0
/* 0000123C 4082001C */ bne lbl_00001258
/* 00001240 3C800000 */ lis r4, controllerInfo@ha
/* 00001244 38840000 */ addi r4, r4, controllerInfo@l
/* 00001248 A0840030 */ lhz r4, 0x30(r4)
/* 0000124C 548407FF */ clrlwi. r4, r4, 0x1f
/* 00001250 40820008 */ bne lbl_00001258
/* 00001254 38C00000 */ li r6, 0
lbl_00001258:
/* 00001258 2C060000 */ cmpwi r6, 0
/* 0000125C 40820030 */ bne lbl_0000128C
/* 00001260 3C800000 */ lis r4, controllerInfo@ha
/* 00001264 A0E40000 */ lhz r7, controllerInfo@l(r4)
/* 00001268 38C00000 */ li r6, 0
/* 0000126C 54E407FF */ clrlwi. r4, r7, 0x1f
/* 00001270 41820010 */ beq lbl_00001280
/* 00001274 54E4056B */ rlwinm. r4, r7, 0, 0x15, 0x15
/* 00001278 41820008 */ beq lbl_00001280
/* 0000127C 38C00001 */ li r6, 1
lbl_00001280:
/* 00001280 2C060000 */ cmpwi r6, 0
/* 00001284 40820008 */ bne lbl_0000128C
/* 00001288 38A00000 */ li r5, 0
lbl_0000128C:
/* 0000128C 2C030000 */ cmpwi r3, 0
/* 00001290 38800001 */ li r4, 1
/* 00001294 38C40000 */ addi r6, r4, 0
/* 00001298 4082001C */ bne lbl_000012B4
/* 0000129C 3C600000 */ lis r3, controllerInfo@ha
/* 000012A0 38630000 */ addi r3, r3, controllerInfo@l
/* 000012A4 A0630030 */ lhz r3, 0x30(r3)
/* 000012A8 546307BD */ rlwinm. r3, r3, 0, 0x1e, 0x1e
/* 000012AC 40820008 */ bne lbl_000012B4
/* 000012B0 38C00000 */ li r6, 0
lbl_000012B4:
/* 000012B4 2C060000 */ cmpwi r6, 0
/* 000012B8 40820030 */ bne lbl_000012E8
/* 000012BC 3C600000 */ lis r3, controllerInfo@ha
/* 000012C0 A0E30000 */ lhz r7, controllerInfo@l(r3)
/* 000012C4 38C00000 */ li r6, 0
/* 000012C8 54E307BD */ rlwinm. r3, r7, 0, 0x1e, 0x1e
/* 000012CC 41820010 */ beq lbl_000012DC
/* 000012D0 54E3056B */ rlwinm. r3, r7, 0, 0x15, 0x15
/* 000012D4 41820008 */ beq lbl_000012DC
/* 000012D8 38C00001 */ li r6, 1
lbl_000012DC:
/* 000012DC 2C060000 */ cmpwi r6, 0
/* 000012E0 40820008 */ bne lbl_000012E8
/* 000012E4 38800000 */ li r4, 0
lbl_000012E8:
/* 000012E8 7C832B79 */ or. r3, r4, r5
/* 000012EC 41820024 */ beq lbl_00001310
/* 000012F0 807D0010 */ lwz r3, 0x10(r29)
/* 000012F4 3C800000 */ lis r4, g_soundGroupDesc@ha
/* 000012F8 38840000 */ addi r4, r4, g_soundGroupDesc@l
/* 000012FC 1C630014 */ mulli r3, r3, 0x14
/* 00001300 7C641A14 */ add r3, r4, r3
/* 00001304 80630004 */ lwz r3, 4(r3)
/* 00001308 38630001 */ addi r3, r3, 1
/* 0000130C 907D0014 */ stw r3, 0x14(r29)
lbl_00001310:
/* 00001310 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00001314 41820008 */ beq lbl_0000131C
/* 00001318 4BFFEE45 */ bl SoundGroupFree
lbl_0000131C:
/* 0000131C A01B0000 */ lhz r0, 0(r27)
/* 00001320 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00001324 41820840 */ beq lbl_00001B64
/* 00001328 807D0010 */ lwz r3, 0x10(r29)
/* 0000132C 4BFFEE31 */ bl SoundGroupLoad
/* 00001330 48000834 */ b lbl_00001B64
lbl_00001334:
/* 00001334 A09B0000 */ lhz r4, 0(r27)
/* 00001338 548007BD */ rlwinm. r0, r4, 0, 0x1e, 0x1e
/* 0000133C 4082002C */ bne lbl_00001368
/* 00001340 3C600000 */ lis r3, controllerInfo@ha
/* 00001344 38630000 */ addi r3, r3, controllerInfo@l
/* 00001348 A0030030 */ lhz r0, 0x30(r3)
/* 0000134C 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00001350 40820018 */ bne lbl_00001368
/* 00001354 A0630000 */ lhz r3, 0(r3)
/* 00001358 546007BD */ rlwinm. r0, r3, 0, 0x1e, 0x1e
/* 0000135C 41820018 */ beq lbl_00001374
/* 00001360 5460056B */ rlwinm. r0, r3, 0, 0x15, 0x15
/* 00001364 41820010 */ beq lbl_00001374
lbl_00001368:
/* 00001368 807D0014 */ lwz r3, 0x14(r29)
/* 0000136C 38030001 */ addi r0, r3, 1
/* 00001370 901D0014 */ stw r0, 0x14(r29)
lbl_00001374:
/* 00001374 548007FF */ clrlwi. r0, r4, 0x1f
/* 00001378 4082002C */ bne lbl_000013A4
/* 0000137C 3C600000 */ lis r3, controllerInfo@ha
/* 00001380 38630000 */ addi r3, r3, controllerInfo@l
/* 00001384 A0030030 */ lhz r0, 0x30(r3)
/* 00001388 540007FF */ clrlwi. r0, r0, 0x1f
/* 0000138C 40820018 */ bne lbl_000013A4
/* 00001390 A0630000 */ lhz r3, 0(r3)
/* 00001394 546007FF */ clrlwi. r0, r3, 0x1f
/* 00001398 41820018 */ beq lbl_000013B0
/* 0000139C 5460056B */ rlwinm. r0, r3, 0, 0x15, 0x15
/* 000013A0 41820010 */ beq lbl_000013B0
lbl_000013A4:
/* 000013A4 807D0014 */ lwz r3, 0x14(r29)
/* 000013A8 3803FFFF */ addi r0, r3, -1
/* 000013AC 901D0014 */ stw r0, 0x14(r29)
lbl_000013B0:
/* 000013B0 809D0014 */ lwz r4, 0x14(r29)
/* 000013B4 3C600000 */ lis r3, g_soundDesc@ha
/* 000013B8 38630000 */ addi r3, r3, g_soundDesc@l
/* 000013BC 54802036 */ slwi r0, r4, 4
/* 000013C0 7C630214 */ add r3, r3, r0
/* 000013C4 88030008 */ lbz r0, 8(r3)
/* 000013C8 2C000001 */ cmpwi r0, 1
/* 000013CC 4082003C */ bne lbl_00001408
/* 000013D0 801D0010 */ lwz r0, 0x10(r29)
/* 000013D4 3C600000 */ lis r3, g_soundGroupDesc@ha
/* 000013D8 38630000 */ addi r3, r3, g_soundGroupDesc@l
/* 000013DC 1C000014 */ mulli r0, r0, 0x14
/* 000013E0 7C630214 */ add r3, r3, r0
/* 000013E4 80A30004 */ lwz r5, 4(r3)
/* 000013E8 7C042800 */ cmpw r4, r5
/* 000013EC 40820014 */ bne lbl_00001400
/* 000013F0 80630018 */ lwz r3, 0x18(r3)
/* 000013F4 3803FFFF */ addi r0, r3, -1
/* 000013F8 901D0014 */ stw r0, 0x14(r29)
/* 000013FC 4800000C */ b lbl_00001408
lbl_00001400:
/* 00001400 38050001 */ addi r0, r5, 1
/* 00001404 901D0014 */ stw r0, 0x14(r29)
lbl_00001408:
/* 00001408 3C600000 */ lis r3, controllerInfo@ha
/* 0000140C C85C0008 */ lfd f2, 8(r28)
/* 00001410 3BC30000 */ addi r30, r3, controllerInfo@l
/* 00001414 C87C0000 */ lfd f3, 0(r28)
/* 00001418 881E0006 */ lbz r0, 6(r30)
/* 0000141C 3C600000 */ lis r3, lbl_0000FEC8@ha
/* 00001420 3FE04330 */ lis r31, 0x4330
/* 00001424 C8230000 */ lfd f1, lbl_0000FEC8@l(r3)
/* 00001428 90010054 */ stw r0, 0x54(r1)
/* 0000142C 93E10050 */ stw r31, 0x50(r1)
/* 00001430 C8010050 */ lfd f0, 0x50(r1)
/* 00001434 FC000828 */ fsub f0, f0, f1
/* 00001438 FC020032 */ fmul f0, f2, f0
/* 0000143C FC030028 */ fsub f0, f3, f0
/* 00001440 FC00001E */ fctiwz f0, f0
/* 00001444 D8010048 */ stfd f0, 0x48(r1)
/* 00001448 8001004C */ lwz r0, 0x4c(r1)
/* 0000144C 981D0018 */ stb r0, 0x18(r29)
/* 00001450 801D0014 */ lwz r0, 0x14(r29)
/* 00001454 889D0018 */ lbz r4, 0x18(r29)
/* 00001458 5403043E */ clrlwi r3, r0, 0x10
/* 0000145C 4BFFED01 */ bl SoundVol
/* 00001460 881E0004 */ lbz r0, 4(r30)
/* 00001464 3C600000 */ lis r3, lbl_0000FED0@ha
/* 00001468 C8230000 */ lfd f1, lbl_0000FED0@l(r3)
/* 0000146C 3C600000 */ lis r3, lbl_0000FED0@ha
/* 00001470 7C000774 */ extsb r0, r0
/* 00001474 6C008000 */ xoris r0, r0, 0x8000
/* 00001478 C85C0010 */ lfd f2, 0x10(r28)
/* 0000147C 90010044 */ stw r0, 0x44(r1)
/* 00001480 93E10040 */ stw r31, 0x40(r1)
/* 00001484 C8010040 */ lfd f0, 0x40(r1)
/* 00001488 FC000828 */ fsub f0, f0, f1
/* 0000148C FC020032 */ fmul f0, f2, f0
/* 00001490 FC00001E */ fctiwz f0, f0
/* 00001494 D8010038 */ stfd f0, 0x38(r1)
/* 00001498 8001003C */ lwz r0, 0x3c(r1)
/* 0000149C 981D0019 */ stb r0, 0x19(r29)
/* 000014A0 881E0005 */ lbz r0, 5(r30)
/* 000014A4 C8230000 */ lfd f1, lbl_0000FED0@l(r3)
/* 000014A8 7C000774 */ extsb r0, r0
/* 000014AC C85C0010 */ lfd f2, 0x10(r28)
/* 000014B0 6C008000 */ xoris r0, r0, 0x8000
/* 000014B4 90010034 */ stw r0, 0x34(r1)
/* 000014B8 93E10030 */ stw r31, 0x30(r1)
/* 000014BC C8010030 */ lfd f0, 0x30(r1)
/* 000014C0 FC000828 */ fsub f0, f0, f1
/* 000014C4 FC020032 */ fmul f0, f2, f0
/* 000014C8 FC00001E */ fctiwz f0, f0
/* 000014CC D8010028 */ stfd f0, 0x28(r1)
/* 000014D0 8001002C */ lwz r0, 0x2c(r1)
/* 000014D4 981D001A */ stb r0, 0x1a(r29)
/* 000014D8 801D0014 */ lwz r0, 0x14(r29)
/* 000014DC 889D0019 */ lbz r4, 0x19(r29)
/* 000014E0 88BD001A */ lbz r5, 0x1a(r29)
/* 000014E4 5403043E */ clrlwi r3, r0, 0x10
/* 000014E8 4BFFEC75 */ bl SoundPan
/* 000014EC 881E0002 */ lbz r0, 2(r30)
/* 000014F0 3C600000 */ lis r3, lbl_0000FED0@ha
/* 000014F4 C8230000 */ lfd f1, lbl_0000FED0@l(r3)
/* 000014F8 7C000774 */ extsb r0, r0
/* 000014FC C85C0020 */ lfd f2, 0x20(r28)
/* 00001500 6C008000 */ xoris r0, r0, 0x8000
/* 00001504 C87C0018 */ lfd f3, 0x18(r28)
/* 00001508 90010024 */ stw r0, 0x24(r1)
/* 0000150C 93E10020 */ stw r31, 0x20(r1)
/* 00001510 C8010020 */ lfd f0, 0x20(r1)
/* 00001514 FC000828 */ fsub f0, f0, f1
/* 00001518 FC020032 */ fmul f0, f2, f0
/* 0000151C FC03002A */ fadd f0, f3, f0
/* 00001520 FC00001E */ fctiwz f0, f0
/* 00001524 D8010018 */ stfd f0, 0x18(r1)
/* 00001528 8001001C */ lwz r0, 0x1c(r1)
/* 0000152C B01D001C */ sth r0, 0x1c(r29)
/* 00001530 801D0014 */ lwz r0, 0x14(r29)
/* 00001534 A09D001C */ lhz r4, 0x1c(r29)
/* 00001538 5403043E */ clrlwi r3, r0, 0x10
/* 0000153C 4BFFEC21 */ bl SoundPitch
/* 00001540 881E0003 */ lbz r0, 3(r30)
/* 00001544 3C600000 */ lis r3, lbl_0000FED0@ha
/* 00001548 C8230000 */ lfd f1, lbl_0000FED0@l(r3)
/* 0000154C 7C000774 */ extsb r0, r0
/* 00001550 C85C0020 */ lfd f2, 0x20(r28)
/* 00001554 6C008000 */ xoris r0, r0, 0x8000
/* 00001558 C87C0018 */ lfd f3, 0x18(r28)
/* 0000155C 90010014 */ stw r0, 0x14(r1)
/* 00001560 93E10010 */ stw r31, 0x10(r1)
/* 00001564 C8010010 */ lfd f0, 0x10(r1)
/* 00001568 FC000828 */ fsub f0, f0, f1
/* 0000156C FC020032 */ fmul f0, f2, f0
/* 00001570 FC03002A */ fadd f0, f3, f0
/* 00001574 FC00001E */ fctiwz f0, f0
/* 00001578 D8010008 */ stfd f0, 8(r1)
/* 0000157C 8001000C */ lwz r0, 0xc(r1)
/* 00001580 B01D001E */ sth r0, 0x1e(r29)
/* 00001584 801D0014 */ lwz r0, 0x14(r29)
/* 00001588 A09D001E */ lhz r4, 0x1e(r29)
/* 0000158C 5403043E */ clrlwi r3, r0, 0x10
/* 00001590 4BFFEBCD */ bl SoundDop
/* 00001594 A01E0000 */ lhz r0, 0(r30)
/* 00001598 5400056B */ rlwinm. r0, r0, 0, 0x15, 0x15
/* 0000159C 4082004C */ bne lbl_000015E8
/* 000015A0 881E0007 */ lbz r0, 7(r30)
/* 000015A4 3C600000 */ lis r3, lbl_0000FEC8@ha
/* 000015A8 C8230000 */ lfd f1, lbl_0000FEC8@l(r3)
/* 000015AC 9001000C */ stw r0, 0xc(r1)
/* 000015B0 C85C0028 */ lfd f2, 0x28(r28)
/* 000015B4 93E10008 */ stw r31, 8(r1)
/* 000015B8 C8010008 */ lfd f0, 8(r1)
/* 000015BC FC000828 */ fsub f0, f0, f1
/* 000015C0 FC020032 */ fmul f0, f2, f0
/* 000015C4 FC00001E */ fctiwz f0, f0
/* 000015C8 D8010010 */ stfd f0, 0x10(r1)
/* 000015CC 80010014 */ lwz r0, 0x14(r1)
/* 000015D0 981D0022 */ stb r0, 0x22(r29)
/* 000015D4 801D0014 */ lwz r0, 0x14(r29)
/* 000015D8 889D0022 */ lbz r4, 0x22(r29)
/* 000015DC 5403043E */ clrlwi r3, r0, 0x10
/* 000015E0 4BFFEB7D */ bl SoundRev
/* 000015E4 48000048 */ b lbl_0000162C
lbl_000015E8:
/* 000015E8 881E0007 */ lbz r0, 7(r30)
/* 000015EC 3C600000 */ lis r3, lbl_0000FEC8@ha
/* 000015F0 C8230000 */ lfd f1, lbl_0000FEC8@l(r3)
/* 000015F4 9001000C */ stw r0, 0xc(r1)
/* 000015F8 C85C0028 */ lfd f2, 0x28(r28)
/* 000015FC 93E10008 */ stw r31, 8(r1)
/* 00001600 C8010008 */ lfd f0, 8(r1)
/* 00001604 FC000828 */ fsub f0, f0, f1
/* 00001608 FC020032 */ fmul f0, f2, f0
/* 0000160C FC00001E */ fctiwz f0, f0
/* 00001610 D8010010 */ stfd f0, 0x10(r1)
/* 00001614 80010014 */ lwz r0, 0x14(r1)
/* 00001618 981D0023 */ stb r0, 0x23(r29)
/* 0000161C 801D0014 */ lwz r0, 0x14(r29)
/* 00001620 889D0023 */ lbz r4, 0x23(r29)
/* 00001624 5403043E */ clrlwi r3, r0, 0x10
/* 00001628 4BFFEB35 */ bl SoundCho
lbl_0000162C:
/* 0000162C 3C600000 */ lis r3, u_somePlayerId@ha
/* 00001630 38000000 */ li r0, 0
/* 00001634 90030000 */ stw r0, u_somePlayerId@l(r3)
/* 00001638 A01B0000 */ lhz r0, 0(r27)
/* 0000163C 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00001640 41820038 */ beq lbl_00001678
/* 00001644 881D0018 */ lbz r0, 0x18(r29)
/* 00001648 889D0019 */ lbz r4, 0x19(r29)
/* 0000164C 7C030774 */ extsb r3, r0
/* 00001650 88BD001A */ lbz r5, 0x1a(r29)
/* 00001654 3803FF81 */ addi r0, r3, -127
/* 00001658 807D0014 */ lwz r3, 0x14(r29)
/* 0000165C 54005BA8 */ rlwinm r0, r0, 0xb, 0xe, 0x14
/* 00001660 7C600378 */ or r0, r3, r0
/* 00001664 548491DA */ rlwinm r4, r4, 0x12, 7, 0xd
/* 00001668 54A3C80C */ slwi r3, r5, 0x19
/* 0000166C 7C800378 */ or r0, r4, r0
/* 00001670 7C630378 */ or r3, r3, r0
/* 00001674 4BFFEAE9 */ bl SoundReqDirect
lbl_00001678:
/* 00001678 A01B0000 */ lhz r0, 0(r27)
/* 0000167C 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00001680 418204E4 */ beq lbl_00001B64
/* 00001684 801D0014 */ lwz r0, 0x14(r29)
/* 00001688 5403043E */ clrlwi r3, r0, 0x10
/* 0000168C 4BFFEAD1 */ bl SoundOff
/* 00001690 480004D4 */ b lbl_00001B64
lbl_00001694:
/* 00001694 3C600000 */ lis r3, controllerInfo@ha
/* 00001698 C85C0030 */ lfd f2, 0x30(r28)
/* 0000169C 38E30000 */ addi r7, r3, controllerInfo@l
/* 000016A0 88070007 */ lbz r0, 7(r7)
/* 000016A4 3C600000 */ lis r3, lbl_0000FEC8@ha
/* 000016A8 C8230000 */ lfd f1, lbl_0000FEC8@l(r3)
/* 000016AC 3CC04330 */ lis r6, 0x4330
/* 000016B0 9001000C */ stw r0, 0xc(r1)
/* 000016B4 3CA00000 */ lis r5, lbl_0000FEC8@ha
/* 000016B8 90C10008 */ stw r6, 8(r1)
/* 000016BC 3C800000 */ lis r4, lbl_0000FED0@ha
/* 000016C0 3C600000 */ lis r3, lbl_0000FED0@ha
/* 000016C4 C8010008 */ lfd f0, 8(r1)
/* 000016C8 FC000828 */ fsub f0, f0, f1
/* 000016CC FC020032 */ fmul f0, f2, f0
/* 000016D0 FC00001E */ fctiwz f0, f0
/* 000016D4 D8010010 */ stfd f0, 0x10(r1)
/* 000016D8 80010014 */ lwz r0, 0x14(r1)
/* 000016DC 981D0028 */ stb r0, 0x28(r29)
/* 000016E0 88070006 */ lbz r0, 6(r7)
/* 000016E4 C8250000 */ lfd f1, lbl_0000FEC8@l(r5)
/* 000016E8 9001001C */ stw r0, 0x1c(r1)
/* 000016EC C85C0030 */ lfd f2, 0x30(r28)
/* 000016F0 90C10018 */ stw r6, 0x18(r1)
/* 000016F4 C87C0000 */ lfd f3, 0(r28)
/* 000016F8 C8010018 */ lfd f0, 0x18(r1)
/* 000016FC FC000828 */ fsub f0, f0, f1
/* 00001700 FC020032 */ fmul f0, f2, f0
/* 00001704 FC030028 */ fsub f0, f3, f0
/* 00001708 FC00001E */ fctiwz f0, f0
/* 0000170C D8010020 */ stfd f0, 0x20(r1)
/* 00001710 80010024 */ lwz r0, 0x24(r1)
/* 00001714 981D0018 */ stb r0, 0x18(r29)
/* 00001718 88070004 */ lbz r0, 4(r7)
/* 0000171C C8240000 */ lfd f1, lbl_0000FED0@l(r4)
/* 00001720 7C000774 */ extsb r0, r0
/* 00001724 C85C0038 */ lfd f2, 0x38(r28)
/* 00001728 6C008000 */ xoris r0, r0, 0x8000
/* 0000172C 9001002C */ stw r0, 0x2c(r1)
/* 00001730 90C10028 */ stw r6, 0x28(r1)
/* 00001734 C8010028 */ lfd f0, 0x28(r1)
/* 00001738 FC000828 */ fsub f0, f0, f1
/* 0000173C FC020032 */ fmul f0, f2, f0
/* 00001740 FC00001E */ fctiwz f0, f0
/* 00001744 D8010030 */ stfd f0, 0x30(r1)
/* 00001748 80010034 */ lwz r0, 0x34(r1)
/* 0000174C 981D0019 */ stb r0, 0x19(r29)
/* 00001750 88070005 */ lbz r0, 5(r7)
/* 00001754 C8230000 */ lfd f1, lbl_0000FED0@l(r3)
/* 00001758 7C000774 */ extsb r0, r0
/* 0000175C C85C0038 */ lfd f2, 0x38(r28)
/* 00001760 6C008000 */ xoris r0, r0, 0x8000
/* 00001764 9001003C */ stw r0, 0x3c(r1)
/* 00001768 90C10038 */ stw r6, 0x38(r1)
/* 0000176C C8010038 */ lfd f0, 0x38(r1)
/* 00001770 FC000828 */ fsub f0, f0, f1
/* 00001774 FC020032 */ fmul f0, f2, f0
/* 00001778 FC00001E */ fctiwz f0, f0
/* 0000177C D8010040 */ stfd f0, 0x40(r1)
/* 00001780 80010044 */ lwz r0, 0x44(r1)
/* 00001784 981D001A */ stb r0, 0x1a(r29)
/* 00001788 881D0019 */ lbz r0, 0x19(r29)
/* 0000178C 889D001A */ lbz r4, 0x1a(r29)
/* 00001790 807D0024 */ lwz r3, 0x24(r29)
/* 00001794 540091DA */ rlwinm r0, r0, 0x12, 7, 0xd
/* 00001798 7C860774 */ extsb r6, r4
/* 0000179C 889D0028 */ lbz r4, 0x28(r29)
/* 000017A0 88BD0018 */ lbz r5, 0x18(r29)
/* 000017A4 54C6C80C */ slwi r6, r6, 0x19
/* 000017A8 7C600378 */ or r0, r3, r0
/* 000017AC 7CC30378 */ or r3, r6, r0
/* 000017B0 4BFFE9AD */ bl SoundIcsReq
/* 000017B4 480003B0 */ b lbl_00001B64
lbl_000017B8:
/* 000017B8 A09B0000 */ lhz r4, 0(r27)
/* 000017BC 548007BD */ rlwinm. r0, r4, 0, 0x1e, 0x1e
/* 000017C0 4082002C */ bne lbl_000017EC
/* 000017C4 3C600000 */ lis r3, controllerInfo@ha
/* 000017C8 38630000 */ addi r3, r3, controllerInfo@l
/* 000017CC A0030030 */ lhz r0, 0x30(r3)
/* 000017D0 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 000017D4 40820018 */ bne lbl_000017EC
/* 000017D8 A0630000 */ lhz r3, 0(r3)
/* 000017DC 546007BD */ rlwinm. r0, r3, 0, 0x1e, 0x1e
/* 000017E0 41820028 */ beq lbl_00001808
/* 000017E4 5460056B */ rlwinm. r0, r3, 0, 0x15, 0x15
/* 000017E8 41820020 */ beq lbl_00001808
lbl_000017EC:
/* 000017EC 807D002C */ lwz r3, 0x2c(r29)
/* 000017F0 38030001 */ addi r0, r3, 1
/* 000017F4 2C000006 */ cmpwi r0, 6
/* 000017F8 901D002C */ stw r0, 0x2c(r29)
/* 000017FC 4180000C */ blt lbl_00001808
/* 00001800 38000000 */ li r0, 0
/* 00001804 901D002C */ stw r0, 0x2c(r29)
lbl_00001808:
/* 00001808 548007FF */ clrlwi. r0, r4, 0x1f
/* 0000180C 4082002C */ bne lbl_00001838
/* 00001810 3C600000 */ lis r3, controllerInfo@ha
/* 00001814 38630000 */ addi r3, r3, controllerInfo@l
/* 00001818 A0030030 */ lhz r0, 0x30(r3)
/* 0000181C 540007FF */ clrlwi. r0, r0, 0x1f
/* 00001820 40820018 */ bne lbl_00001838
/* 00001824 A0630000 */ lhz r3, 0(r3)
/* 00001828 546007FF */ clrlwi. r0, r3, 0x1f
/* 0000182C 41820024 */ beq lbl_00001850
/* 00001830 5460056B */ rlwinm. r0, r3, 0, 0x15, 0x15
/* 00001834 4182001C */ beq lbl_00001850
lbl_00001838:
/* 00001838 807D002C */ lwz r3, 0x2c(r29)
/* 0000183C 3403FFFF */ addic. r0, r3, -1
/* 00001840 901D002C */ stw r0, 0x2c(r29)
/* 00001844 4080000C */ bge lbl_00001850
/* 00001848 38000005 */ li r0, 5
/* 0000184C 901D002C */ stw r0, 0x2c(r29)
lbl_00001850:
/* 00001850 3C600000 */ lis r3, controllerInfo@ha
/* 00001854 C85C0048 */ lfd f2, 0x48(r28)
/* 00001858 38630000 */ addi r3, r3, controllerInfo@l
/* 0000185C C87C0040 */ lfd f3, 0x40(r28)
/* 00001860 88030002 */ lbz r0, 2(r3)
/* 00001864 3C600000 */ lis r3, lbl_0000FED0@ha
/* 00001868 C8230000 */ lfd f1, lbl_0000FED0@l(r3)
/* 0000186C 7C000774 */ extsb r0, r0
/* 00001870 6C008000 */ xoris r0, r0, 0x8000
/* 00001874 9001000C */ stw r0, 0xc(r1)
/* 00001878 3C004330 */ lis r0, 0x4330
/* 0000187C 90010008 */ stw r0, 8(r1)
/* 00001880 C8010008 */ lfd f0, 8(r1)
/* 00001884 FC000828 */ fsub f0, f0, f1
/* 00001888 FC020032 */ fmul f0, f2, f0
/* 0000188C FC03002A */ fadd f0, f3, f0
/* 00001890 FC00001E */ fctiwz f0, f0
/* 00001894 D8010010 */ stfd f0, 0x10(r1)
/* 00001898 80010014 */ lwz r0, 0x14(r1)
/* 0000189C B01D0030 */ sth r0, 0x30(r29)
/* 000018A0 801D002C */ lwz r0, 0x2c(r29)
/* 000018A4 A09D0030 */ lhz r4, 0x30(r29)
/* 000018A8 5403043E */ clrlwi r3, r0, 0x10
/* 000018AC 4BFFE8B1 */ bl func_8002CEB4
/* 000018B0 A01B0000 */ lhz r0, 0(r27)
/* 000018B4 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 000018B8 41820010 */ beq lbl_000018C8
/* 000018BC 801D002C */ lwz r0, 0x2c(r29)
/* 000018C0 5403043E */ clrlwi r3, r0, 0x10
/* 000018C4 4BFFE899 */ bl func_8002CEAC
lbl_000018C8:
/* 000018C8 A01B0000 */ lhz r0, 0(r27)
/* 000018CC 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 000018D0 41820294 */ beq lbl_00001B64
/* 000018D4 801D002C */ lwz r0, 0x2c(r29)
/* 000018D8 5403043E */ clrlwi r3, r0, 0x10
/* 000018DC 4BFFE881 */ bl func_8002CEB0
/* 000018E0 48000284 */ b lbl_00001B64
lbl_000018E4:
/* 000018E4 A09B0000 */ lhz r4, 0(r27)
/* 000018E8 548007BD */ rlwinm. r0, r4, 0, 0x1e, 0x1e
/* 000018EC 4082002C */ bne lbl_00001918
/* 000018F0 3C600000 */ lis r3, controllerInfo@ha
/* 000018F4 38630000 */ addi r3, r3, controllerInfo@l
/* 000018F8 A0030030 */ lhz r0, 0x30(r3)
/* 000018FC 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00001900 40820018 */ bne lbl_00001918
/* 00001904 A0630000 */ lhz r3, 0(r3)
/* 00001908 546007BD */ rlwinm. r0, r3, 0, 0x1e, 0x1e
/* 0000190C 41820028 */ beq lbl_00001934
/* 00001910 5460056B */ rlwinm. r0, r3, 0, 0x15, 0x15
/* 00001914 41820020 */ beq lbl_00001934
lbl_00001918:
/* 00001918 807D0034 */ lwz r3, 0x34(r29)
/* 0000191C 38030001 */ addi r0, r3, 1
/* 00001920 2C00004A */ cmpwi r0, 0x4a
/* 00001924 901D0034 */ stw r0, 0x34(r29)
/* 00001928 4180000C */ blt lbl_00001934
/* 0000192C 38000000 */ li r0, 0
/* 00001930 901D0034 */ stw r0, 0x34(r29)
lbl_00001934:
/* 00001934 548007FF */ clrlwi. r0, r4, 0x1f
/* 00001938 4082002C */ bne lbl_00001964
/* 0000193C 3C600000 */ lis r3, controllerInfo@ha
/* 00001940 38630000 */ addi r3, r3, controllerInfo@l
/* 00001944 A0030030 */ lhz r0, 0x30(r3)
/* 00001948 540007FF */ clrlwi. r0, r0, 0x1f
/* 0000194C 40820018 */ bne lbl_00001964
/* 00001950 A0630000 */ lhz r3, 0(r3)
/* 00001954 546007FF */ clrlwi. r0, r3, 0x1f
/* 00001958 41820024 */ beq lbl_0000197C
/* 0000195C 5460056B */ rlwinm. r0, r3, 0, 0x15, 0x15
/* 00001960 4182001C */ beq lbl_0000197C
lbl_00001964:
/* 00001964 807D0034 */ lwz r3, 0x34(r29)
/* 00001968 3403FFFF */ addic. r0, r3, -1
/* 0000196C 901D0034 */ stw r0, 0x34(r29)
/* 00001970 4080000C */ bge lbl_0000197C
/* 00001974 38000049 */ li r0, 0x49
/* 00001978 901D0034 */ stw r0, 0x34(r29)
lbl_0000197C:
/* 0000197C 5480056B */ rlwinm. r0, r4, 0, 0x15, 0x15
/* 00001980 41820014 */ beq lbl_00001994
/* 00001984 3C600000 */ lis r3, g_soundMuted@ha
/* 00001988 84030000 */ lwzu r0, g_soundMuted@l(r3)
/* 0000198C 68000001 */ xori r0, r0, 1
/* 00001990 90030000 */ stw r0, 0(r3)
lbl_00001994:
/* 00001994 54800529 */ rlwinm. r0, r4, 0, 0x14, 0x14
/* 00001998 41820010 */ beq lbl_000019A8
/* 0000199C 3860FFFF */ li r3, -1
/* 000019A0 38800005 */ li r4, 5
/* 000019A4 4BFFE7B9 */ bl u_play_music
lbl_000019A8:
/* 000019A8 A01B0000 */ lhz r0, 0(r27)
/* 000019AC 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 000019B0 41820010 */ beq lbl_000019C0
/* 000019B4 807D0034 */ lwz r3, 0x34(r29)
/* 000019B8 38800000 */ li r4, 0
/* 000019BC 4BFFE7A1 */ bl u_play_music
lbl_000019C0:
/* 000019C0 A01B0000 */ lhz r0, 0(r27)
/* 000019C4 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 000019C8 4182019C */ beq lbl_00001B64
/* 000019CC 3860FFFF */ li r3, -1
/* 000019D0 38800001 */ li r4, 1
/* 000019D4 4BFFE789 */ bl u_play_music
/* 000019D8 4800018C */ b lbl_00001B64
lbl_000019DC:
/* 000019DC A01B0000 */ lhz r0, 0(r27)
/* 000019E0 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 000019E4 41820008 */ beq lbl_000019EC
/* 000019E8 4BFFE775 */ bl SoundStreamStart
lbl_000019EC:
/* 000019EC A01B0000 */ lhz r0, 0(r27)
/* 000019F0 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 000019F4 41820170 */ beq lbl_00001B64
/* 000019F8 4BFFE765 */ bl SoundStreamEnd
/* 000019FC 48000168 */ b lbl_00001B64
lbl_00001A00:
/* 00001A00 3C600000 */ lis r3, analogInputs@ha
/* 00001A04 38630000 */ addi r3, r3, analogInputs@l
/* 00001A08 A0830008 */ lhz r4, 8(r3)
/* 00001A0C 54800673 */ rlwinm. r0, r4, 0, 0x19, 0x19
/* 00001A10 41820020 */ beq lbl_00001A30
/* 00001A14 807D003C */ lwz r3, 0x3c(r29)
/* 00001A18 38030001 */ addi r0, r3, 1
/* 00001A1C 2C000002 */ cmpwi r0, 2
/* 00001A20 901D003C */ stw r0, 0x3c(r29)
/* 00001A24 4081000C */ ble lbl_00001A30
/* 00001A28 38000000 */ li r0, 0
/* 00001A2C 901D003C */ stw r0, 0x3c(r29)
lbl_00001A30:
/* 00001A30 54800631 */ rlwinm. r0, r4, 0, 0x18, 0x18
/* 00001A34 4182001C */ beq lbl_00001A50
/* 00001A38 807D003C */ lwz r3, 0x3c(r29)
/* 00001A3C 3403FFFF */ addic. r0, r3, -1
/* 00001A40 901D003C */ stw r0, 0x3c(r29)
/* 00001A44 4080000C */ bge lbl_00001A50
/* 00001A48 38000002 */ li r0, 2
/* 00001A4C 901D003C */ stw r0, 0x3c(r29)
lbl_00001A50:
/* 00001A50 801D003C */ lwz r0, 0x3c(r29)
/* 00001A54 2C000001 */ cmpwi r0, 1
/* 00001A58 41820068 */ beq lbl_00001AC0
/* 00001A5C 40800010 */ bge lbl_00001A6C
/* 00001A60 2C000000 */ cmpwi r0, 0
/* 00001A64 40800014 */ bge lbl_00001A78
/* 00001A68 480000FC */ b lbl_00001B64
lbl_00001A6C:
/* 00001A6C 2C000003 */ cmpwi r0, 3
/* 00001A70 408000F4 */ bge lbl_00001B64
/* 00001A74 480000A0 */ b lbl_00001B14
lbl_00001A78:
/* 00001A78 3C600000 */ lis r3, analogInputs@ha
/* 00001A7C 38630000 */ addi r3, r3, analogInputs@l
/* 00001A80 A0630004 */ lhz r3, 4(r3)
/* 00001A84 38800000 */ li r4, 0
/* 00001A88 546006F7 */ rlwinm. r0, r3, 0, 0x1b, 0x1b
/* 00001A8C 41820010 */ beq lbl_00001A9C
/* 00001A90 3BC00000 */ li r30, 0
/* 00001A94 38800001 */ li r4, 1
/* 00001A98 48000014 */ b lbl_00001AAC
lbl_00001A9C:
/* 00001A9C 546006B5 */ rlwinm. r0, r3, 0, 0x1a, 0x1a
/* 00001AA0 4182000C */ beq lbl_00001AAC
/* 00001AA4 3BC00001 */ li r30, 1
/* 00001AA8 38800001 */ li r4, 1
lbl_00001AAC:
/* 00001AAC 2C040000 */ cmpwi r4, 0
/* 00001AB0 418200B4 */ beq lbl_00001B64
/* 00001AB4 7FC3F378 */ mr r3, r30
/* 00001AB8 4BFFE6A5 */ bl u_change_sound_mode
/* 00001ABC 480000A8 */ b lbl_00001B64
lbl_00001AC0:
/* 00001AC0 3C600000 */ lis r3, g_soundSEVol@ha
/* 00001AC4 38630000 */ addi r3, r3, g_soundSEVol@l
/* 00001AC8 88630000 */ lbz r3, 0(r3)
/* 00001ACC 548006B5 */ rlwinm. r0, r4, 0, 0x1a, 0x1a
/* 00001AD0 38A30000 */ addi r5, r3, 0
/* 00001AD4 41820008 */ beq lbl_00001ADC
/* 00001AD8 38A50005 */ addi r5, r5, 5
lbl_00001ADC:
/* 00001ADC 548006F7 */ rlwinm. r0, r4, 0, 0x1b, 0x1b
/* 00001AE0 41820008 */ beq lbl_00001AE8
/* 00001AE4 38A5FFFB */ addi r5, r5, -5
lbl_00001AE8:
/* 00001AE8 2C050064 */ cmpwi r5, 0x64
/* 00001AEC 40810008 */ ble lbl_00001AF4
/* 00001AF0 38A00064 */ li r5, 0x64
lbl_00001AF4:
/* 00001AF4 2C050000 */ cmpwi r5, 0
/* 00001AF8 40800008 */ bge lbl_00001B00
/* 00001AFC 38A00000 */ li r5, 0
lbl_00001B00:
/* 00001B00 7C051800 */ cmpw r5, r3
/* 00001B04 41820060 */ beq lbl_00001B64
/* 00001B08 3C600000 */ lis r3, g_soundSEVol@ha
/* 00001B0C 98A30000 */ stb r5, g_soundSEVol@l(r3)
/* 00001B10 48000054 */ b lbl_00001B64
lbl_00001B14:
/* 00001B14 3C600000 */ lis r3, g_soundBGMVol@ha
/* 00001B18 38630000 */ addi r3, r3, g_soundBGMVol@l
/* 00001B1C 88630000 */ lbz r3, 0(r3)
/* 00001B20 548006B5 */ rlwinm. r0, r4, 0, 0x1a, 0x1a
/* 00001B24 38A30000 */ addi r5, r3, 0
/* 00001B28 41820008 */ beq lbl_00001B30
/* 00001B2C 38A50005 */ addi r5, r5, 5
lbl_00001B30:
/* 00001B30 548006F7 */ rlwinm. r0, r4, 0, 0x1b, 0x1b
/* 00001B34 41820008 */ beq lbl_00001B3C
/* 00001B38 38A5FFFB */ addi r5, r5, -5
lbl_00001B3C:
/* 00001B3C 2C050064 */ cmpwi r5, 0x64
/* 00001B40 40810008 */ ble lbl_00001B48
/* 00001B44 38A00064 */ li r5, 0x64
lbl_00001B48:
/* 00001B48 2C050000 */ cmpwi r5, 0
/* 00001B4C 40800008 */ bge lbl_00001B54
/* 00001B50 38A00000 */ li r5, 0
lbl_00001B54:
/* 00001B54 7C051800 */ cmpw r5, r3
/* 00001B58 4182000C */ beq lbl_00001B64
/* 00001B5C 3C600000 */ lis r3, g_soundBGMVol@ha
/* 00001B60 98A30000 */ stb r5, g_soundBGMVol@l(r3)
lbl_00001B64:
/* 00001B64 BB61005C */ lmw r27, 0x5c(r1)
/* 00001B68 80010074 */ lwz r0, 0x74(r1)
/* 00001B6C 38210070 */ addi r1, r1, 0x70
/* 00001B70 7C0803A6 */ mtlr r0
/* 00001B74 4E800020 */ blr 
