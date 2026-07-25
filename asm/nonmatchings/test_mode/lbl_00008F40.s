/* 00008F40 7C0802A6 */ mflr r0
/* 00008F44 3C600000 */ lis r3, lbl_000102B0@ha
/* 00008F48 90010004 */ stw r0, 4(r1)
/* 00008F4C 38800001 */ li r4, 1
/* 00008F50 9421FFE0 */ stwu r1, -0x20(r1)
/* 00008F54 BF61000C */ stmw r27, 0xc(r1)
/* 00008F58 3BC30000 */ addi r30, r3, lbl_000102B0@l
/* 00008F5C 38600001 */ li r3, 1
/* 00008F60 4BFF71FD */ bl window_set_cursor_pos
/* 00008F64 387E01F8 */ addi r3, r30, 0x1f8
/* 00008F68 4BFF71F5 */ bl u_debug_print
/* 00008F6C 3C600000 */ lis r3, modeCtrl@ha
/* 00008F70 3BE30000 */ addi r31, r3, modeCtrl@l
/* 00008F74 3B9E4464 */ addi r28, r30, 0x4464
/* 00008F78 3BBF0010 */ addi r29, r31, 0x10
/* 00008F7C 3B600000 */ li r27, 0
lbl_00008F80:
/* 00008F80 801D0000 */ lwz r0, 0(r29)
/* 00008F84 7C1B0000 */ cmpw r27, r0
/* 00008F88 40820028 */ bne lbl_00008FB0
/* 00008F8C 38600002 */ li r3, 2
/* 00008F90 389B0003 */ addi r4, r27, 3
/* 00008F94 4BFF71C9 */ bl window_set_cursor_pos
/* 00008F98 38600002 */ li r3, 2
/* 00008F9C 4BFF71C1 */ bl window_set_text_color
/* 00008FA0 387E0400 */ addi r3, r30, 0x400
/* 00008FA4 4BFF71B9 */ bl u_debug_print
/* 00008FA8 38600000 */ li r3, 0
/* 00008FAC 4BFF71B1 */ bl window_set_text_color
lbl_00008FB0:
/* 00008FB0 801F0008 */ lwz r0, 8(r31)
/* 00008FB4 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00008FB8 4082002C */ bne lbl_00008FE4
/* 00008FBC 38600003 */ li r3, 3
/* 00008FC0 389B0003 */ addi r4, r27, 3
/* 00008FC4 4BFF7199 */ bl window_set_cursor_pos
/* 00008FC8 A09C0004 */ lhz r4, 4(r28)
/* 00008FCC 387E452C */ addi r3, r30, 0x452c
/* 00008FD0 A0BC0006 */ lhz r5, 6(r28)
/* 00008FD4 4CC63182 */ crclr 6
/* 00008FD8 80DC0000 */ lwz r6, 0(r28)
/* 00008FDC 4BFF7181 */ bl window_printf_2
/* 00008FE0 48000038 */ b lbl_00009018
lbl_00008FE4:
/* 00008FE4 801D0000 */ lwz r0, 0(r29)
/* 00008FE8 7C1B0000 */ cmpw r27, r0
/* 00008FEC 4082002C */ bne lbl_00009018
/* 00008FF0 38600003 */ li r3, 3
/* 00008FF4 389B0003 */ addi r4, r27, 3
/* 00008FF8 4BFF7165 */ bl window_set_cursor_pos
/* 00008FFC A09C0004 */ lhz r4, 4(r28)
/* 00009000 387E452C */ addi r3, r30, 0x452c
/* 00009004 A0BC0006 */ lhz r5, 6(r28)
/* 00009008 4CC63182 */ crclr 6
/* 0000900C 80DC0000 */ lwz r6, 0(r28)
/* 00009010 4BFF714D */ bl window_printf_2
/* 00009014 48000014 */ b lbl_00009028
lbl_00009018:
/* 00009018 3B7B0001 */ addi r27, r27, 1
/* 0000901C 281B0009 */ cmplwi r27, 9
/* 00009020 3B9C000C */ addi r28, r28, 0xc
/* 00009024 4180FF5C */ blt lbl_00008F80
lbl_00009028:
/* 00009028 3C600000 */ lis r3, modeCtrl@ha
/* 0000902C 38630000 */ addi r3, r3, modeCtrl@l
/* 00009030 80030008 */ lwz r0, 8(r3)
/* 00009034 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00009038 41820014 */ beq lbl_0000904C
/* 0000903C 80830044 */ lwz r4, 0x44(r3)
/* 00009040 387E4550 */ addi r3, r30, 0x4550
/* 00009044 4CC63182 */ crclr 6
/* 00009048 4BFF7115 */ bl window_printf_2
lbl_0000904C:
/* 0000904C BB61000C */ lmw r27, 0xc(r1)
/* 00009050 80010024 */ lwz r0, 0x24(r1)
/* 00009054 38210020 */ addi r1, r1, 0x20
/* 00009058 7C0803A6 */ mtlr r0
/* 0000905C 4E800020 */ blr 
