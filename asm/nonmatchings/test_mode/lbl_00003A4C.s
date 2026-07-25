/* 00003A4C 7C0802A6 */ mflr r0
/* 00003A50 3CA00000 */ lis r5, lbl_0000FE78@ha
/* 00003A54 90010004 */ stw r0, 4(r1)
/* 00003A58 3C800000 */ lis r4, lbl_10000000@ha
/* 00003A5C 3C600000 */ lis r3, lbl_000102B0@ha
/* 00003A60 9421FF90 */ stwu r1, -0x70(r1)
/* 00003A64 BF410058 */ stmw r26, 0x58(r1)
/* 00003A68 3BC40000 */ addi r30, r4, lbl_10000000@l
/* 00003A6C 3BE30000 */ addi r31, r3, lbl_000102B0@l
/* 00003A70 3BA50000 */ addi r29, r5, lbl_0000FE78@l
/* 00003A74 38600002 */ li r3, 2
/* 00003A78 38800002 */ li r4, 2
/* 00003A7C 4BFFC6E1 */ bl window_set_cursor_pos
/* 00003A80 801E00B8 */ lwz r0, 0xb8(r30)
/* 00003A84 1C00000C */ mulli r0, r0, 0xc
/* 00003A88 7C7F0214 */ add r3, r31, r0
/* 00003A8C 80632C6C */ lwz r3, 0x2c6c(r3)
/* 00003A90 4BFFC6CD */ bl u_debug_print
/* 00003A94 4BFFC6C9 */ bl reset_text_draw_settings
/* 00003A98 801E00B8 */ lwz r0, 0xb8(r30)
/* 00003A9C 3C600000 */ lis r3, fontStrArray@ha
/* 00003AA0 3B830000 */ addi r28, r3, fontStrArray@l
/* 00003AA4 1C00000C */ mulli r0, r0, 0xc
/* 00003AA8 7C7F0214 */ add r3, r31, r0
/* 00003AAC 83632C68 */ lwz r27, 0x2c68(r3)
/* 00003AB0 3B400000 */ li r26, 0
/* 00003AB4 4800007C */ b lbl_00003B30
lbl_00003AB8:
/* 00003AB8 801E00B4 */ lwz r0, 0xb4(r30)
/* 00003ABC 7C1A0000 */ cmpw r26, r0
/* 00003AC0 40820040 */ bne lbl_00003B00
/* 00003AC4 38600002 */ li r3, 2
/* 00003AC8 4BFFC695 */ bl window_set_text_color
/* 00003ACC 38600001 */ li r3, 1
/* 00003AD0 389A0004 */ addi r4, r26, 4
/* 00003AD4 4BFFC689 */ bl window_set_cursor_pos
/* 00003AD8 801B0000 */ lwz r0, 0(r27)
/* 00003ADC 387F2CBC */ addi r3, r31, 0x2cbc
/* 00003AE0 4CC63182 */ crclr 6
/* 00003AE4 5400103A */ slwi r0, r0, 2
/* 00003AE8 7C9C0214 */ add r4, r28, r0
/* 00003AEC 80840000 */ lwz r4, 0(r4)
/* 00003AF0 4BFFC66D */ bl window_printf_2
/* 00003AF4 38600000 */ li r3, 0
/* 00003AF8 4BFFC665 */ bl window_set_text_color
/* 00003AFC 4800002C */ b lbl_00003B28
lbl_00003B00:
/* 00003B00 38600001 */ li r3, 1
/* 00003B04 389A0004 */ addi r4, r26, 4
/* 00003B08 4BFFC655 */ bl window_set_cursor_pos
/* 00003B0C 801B0000 */ lwz r0, 0(r27)
/* 00003B10 387F2CC4 */ addi r3, r31, 0x2cc4
/* 00003B14 4CC63182 */ crclr 6
/* 00003B18 5400103A */ slwi r0, r0, 2
/* 00003B1C 7C9C0214 */ add r4, r28, r0
/* 00003B20 80840000 */ lwz r4, 0(r4)
/* 00003B24 4BFFC639 */ bl window_printf_2
lbl_00003B28:
/* 00003B28 3B7B0008 */ addi r27, r27, 8
/* 00003B2C 3B5A0001 */ addi r26, r26, 1
lbl_00003B30:
/* 00003B30 801B0000 */ lwz r0, 0(r27)
/* 00003B34 2C000000 */ cmpwi r0, 0
/* 00003B38 4080FF80 */ bge lbl_00003AB8
/* 00003B3C 807E00B8 */ lwz r3, 0xb8(r30)
/* 00003B40 801E00B4 */ lwz r0, 0xb4(r30)
/* 00003B44 1C63000C */ mulli r3, r3, 0xc
/* 00003B48 7C7F1A14 */ add r3, r31, r3
/* 00003B4C 80632C68 */ lwz r3, 0x2c68(r3)
/* 00003B50 54001838 */ slwi r0, r0, 3
/* 00003B54 7F830214 */ add r28, r3, r0
/* 00003B58 807C0000 */ lwz r3, 0(r28)
/* 00003B5C 4BFFC601 */ bl set_text_font
/* 00003B60 C03D00F0 */ lfs f1, 0xf0(r29)
/* 00003B64 C05D00F4 */ lfs f2, 0xf4(r29)
/* 00003B68 4BFFC5F5 */ bl set_text_pos
/* 00003B6C 807C0004 */ lwz r3, 4(r28)
/* 00003B70 4BFFC5ED */ bl sprite_puts
/* 00003B74 3C600000 */ lis r3, controllerInfo@ha
/* 00003B78 A0030000 */ lhz r0, controllerInfo@l(r3)
/* 00003B7C 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00003B80 408200A0 */ bne lbl_00003C20
/* 00003B84 807E00B8 */ lwz r3, 0xb8(r30)
/* 00003B88 801E00B4 */ lwz r0, 0xb4(r30)
/* 00003B8C 1C63000C */ mulli r3, r3, 0xc
/* 00003B90 7C7F1A14 */ add r3, r31, r3
/* 00003B94 80632C68 */ lwz r3, 0x2c68(r3)
/* 00003B98 54001838 */ slwi r0, r0, 3
/* 00003B9C 7C63002E */ lwzx r3, r3, r0
/* 00003BA0 4BFFC5BD */ bl get_font_bitmap_id
/* 00003BA4 90610008 */ stw r3, 8(r1)
/* 00003BA8 38A00000 */ li r5, 0
/* 00003BAC 3880FFFF */ li r4, -1
/* 00003BB0 C01D00F8 */ lfs f0, 0xf8(r29)
/* 00003BB4 3800000A */ li r0, 0xa
/* 00003BB8 38610008 */ addi r3, r1, 8
/* 00003BBC D001000C */ stfs f0, 0xc(r1)
/* 00003BC0 C01D00FC */ lfs f0, 0xfc(r29)
/* 00003BC4 D0010010 */ stfs f0, 0x10(r1)
/* 00003BC8 C01D00B8 */ lfs f0, 0xb8(r29)
/* 00003BCC D0010014 */ stfs f0, 0x14(r1)
/* 00003BD0 C01D00B8 */ lfs f0, 0xb8(r29)
/* 00003BD4 D0010018 */ stfs f0, 0x18(r1)
/* 00003BD8 C01D00B8 */ lfs f0, 0xb8(r29)
/* 00003BDC D001001C */ stfs f0, 0x1c(r1)
/* 00003BE0 C01D0060 */ lfs f0, 0x60(r29)
/* 00003BE4 D0010020 */ stfs f0, 0x20(r1)
/* 00003BE8 C01D0060 */ lfs f0, 0x60(r29)
/* 00003BEC D0010024 */ stfs f0, 0x24(r1)
/* 00003BF0 C01D00B8 */ lfs f0, 0xb8(r29)
/* 00003BF4 D0010028 */ stfs f0, 0x28(r1)
/* 00003BF8 C01D00B8 */ lfs f0, 0xb8(r29)
/* 00003BFC D001002C */ stfs f0, 0x2c(r1)
/* 00003C00 90A10030 */ stw r5, 0x30(r1)
/* 00003C04 C01D00B8 */ lfs f0, 0xb8(r29)
/* 00003C08 D0010034 */ stfs f0, 0x34(r1)
/* 00003C0C 90810038 */ stw r4, 0x38(r1)
/* 00003C10 9001003C */ stw r0, 0x3c(r1)
/* 00003C14 90810040 */ stw r4, 0x40(r1)
/* 00003C18 90A10044 */ stw r5, 0x44(r1)
/* 00003C1C 4BFFC541 */ bl nlSprPut
lbl_00003C20:
/* 00003C20 BB410058 */ lmw r26, 0x58(r1)
/* 00003C24 80010074 */ lwz r0, 0x74(r1)
/* 00003C28 38210070 */ addi r1, r1, 0x70
/* 00003C2C 7C0803A6 */ mtlr r0
/* 00003C30 4E800020 */ blr 
