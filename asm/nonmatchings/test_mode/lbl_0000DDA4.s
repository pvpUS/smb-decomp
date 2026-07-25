/* 0000DDA4 7C0802A6 */ mflr r0
/* 0000DDA8 3C800000 */ lis r4, lbl_000101FC@ha
/* 0000DDAC 90010004 */ stw r0, 4(r1)
/* 0000DDB0 38A40000 */ addi r5, r4, lbl_000101FC@l
/* 0000DDB4 3CC00000 */ lis r6, lbl_10003BF8@ha
/* 0000DDB8 9421FFC0 */ stwu r1, -0x40(r1)
/* 0000DDBC 3CE00000 */ lis r7, lbl_000148E8@ha
/* 0000DDC0 BF61002C */ stmw r27, 0x2c(r1)
/* 0000DDC4 3B830000 */ addi r28, r3, 0
/* 0000DDC8 3BE60000 */ addi r31, r6, lbl_10003BF8@l
/* 0000DDCC 3BA10010 */ addi r29, r1, 0x10
/* 0000DDD0 3BC70000 */ addi r30, r7, lbl_000148E8@l
/* 0000DDD4 80850000 */ lwz r4, 0(r5)
/* 0000DDD8 80050004 */ lwz r0, 4(r5)
/* 0000DDDC 90810010 */ stw r4, 0x10(r1)
/* 0000DDE0 90010014 */ stw r0, 0x14(r1)
/* 0000DDE4 80650008 */ lwz r3, 8(r5)
/* 0000DDE8 8005000C */ lwz r0, 0xc(r5)
/* 0000DDEC 90610018 */ stw r3, 0x18(r1)
/* 0000DDF0 9001001C */ stw r0, 0x1c(r1)
/* 0000DDF4 80650010 */ lwz r3, 0x10(r5)
/* 0000DDF8 80050014 */ lwz r0, 0x14(r5)
/* 0000DDFC 90610020 */ stw r3, 0x20(r1)
/* 0000DE00 90010024 */ stw r0, 0x24(r1)
/* 0000DE04 807F0078 */ lwz r3, 0x78(r31)
/* 0000DE08 801F007C */ lwz r0, 0x7c(r31)
/* 0000DE0C 7C030050 */ subf r0, r3, r0
/* 0000DE10 7C000034 */ cntlzw r0, r0
/* 0000DE14 5400D97E */ srwi r0, r0, 5
/* 0000DE18 1F60000C */ mulli r27, r0, 0xc
/* 0000DE1C 7FBDDA14 */ add r29, r29, r27
/* 0000DE20 801D0000 */ lwz r0, 0(r29)
/* 0000DE24 5403063E */ clrlwi r3, r0, 0x18
/* 0000DE28 4BFF2335 */ bl window_set_text_color
/* 0000DE2C 807F0078 */ lwz r3, 0x78(r31)
/* 0000DE30 801F007C */ lwz r0, 0x7c(r31)
/* 0000DE34 7C030000 */ cmpw r3, r0
/* 0000DE38 40820010 */ bne lbl_0000DE48
/* 0000DE3C 387E0EB0 */ addi r3, r30, 0xeb0
/* 0000DE40 4BFF231D */ bl u_debug_print
/* 0000DE44 4800000C */ b lbl_0000DE50
lbl_0000DE48:
/* 0000DE48 387E0EB4 */ addi r3, r30, 0xeb4
/* 0000DE4C 4BFF2311 */ bl u_debug_print
lbl_0000DE50:
/* 0000DE50 809C0004 */ lwz r4, 4(r28)
/* 0000DE54 387E0EB8 */ addi r3, r30, 0xeb8
/* 0000DE58 4CC63182 */ crclr 6
/* 0000DE5C 4BFF2301 */ bl window_printf_2
/* 0000DE60 80BC0010 */ lwz r5, 0x10(r28)
/* 0000DE64 38000003 */ li r0, 3
/* 0000DE68 54040FFE */ srwi r4, r0, 0x1f
/* 0000DE6C 7CA3FE70 */ srawi r3, r5, 0x1f
/* 0000DE70 7C002810 */ subfc r0, r0, r5
/* 0000DE74 7C032114 */ adde r0, r3, r4
/* 0000DE78 5400103A */ slwi r0, r0, 2
/* 0000DE7C 38610014 */ addi r3, r1, 0x14
/* 0000DE80 7C1B0214 */ add r0, r27, r0
/* 0000DE84 7C03002E */ lwzx r0, r3, r0
/* 0000DE88 5403063E */ clrlwi r3, r0, 0x18
/* 0000DE8C 4BFF22D1 */ bl window_set_text_color
/* 0000DE90 809C0010 */ lwz r4, 0x10(r28)
/* 0000DE94 3C600000 */ lis r3, lbl_801C6470@ha
/* 0000DE98 38030000 */ addi r0, r3, lbl_801C6470@l
/* 0000DE9C 4CC63182 */ crclr 6
/* 0000DEA0 5483103A */ slwi r3, r4, 2
/* 0000DEA4 7C601A14 */ add r3, r0, r3
/* 0000DEA8 80830000 */ lwz r4, 0(r3)
/* 0000DEAC 387E0EBC */ addi r3, r30, 0xebc
/* 0000DEB0 4BFF22AD */ bl window_printf_2
/* 0000DEB4 801D0000 */ lwz r0, 0(r29)
/* 0000DEB8 5403063E */ clrlwi r3, r0, 0x18
/* 0000DEBC 4BFF22A1 */ bl window_set_text_color
/* 0000DEC0 801C0000 */ lwz r0, 0(r28)
/* 0000DEC4 2C000008 */ cmpwi r0, 8
/* 0000DEC8 4080001C */ bge lbl_0000DEE4
/* 0000DECC 3C600000 */ lis r3, lbl_801C6420@ha
/* 0000DED0 5404103A */ slwi r4, r0, 2
/* 0000DED4 38030000 */ addi r0, r3, lbl_801C6420@l
/* 0000DED8 7C602214 */ add r3, r0, r4
/* 0000DEDC 80830000 */ lwz r4, 0(r3)
/* 0000DEE0 48000008 */ b lbl_0000DEE8
lbl_0000DEE4:
/* 0000DEE4 389E0EC4 */ addi r4, r30, 0xec4
lbl_0000DEE8:
/* 0000DEE8 80BC0008 */ lwz r5, 8(r28)
/* 0000DEEC 387E0ED0 */ addi r3, r30, 0xed0
/* 0000DEF0 4CC63182 */ crclr 6
/* 0000DEF4 4BFF2269 */ bl window_printf_2
/* 0000DEF8 809F007C */ lwz r4, 0x7c(r31)
/* 0000DEFC 38600000 */ li r3, 0
/* 0000DF00 38040001 */ addi r0, r4, 1
/* 0000DF04 901F007C */ stw r0, 0x7c(r31)
/* 0000DF08 4BFF2255 */ bl window_set_text_color
/* 0000DF0C 387E0EAC */ addi r3, r30, 0xeac
/* 0000DF10 4BFF224D */ bl u_debug_print
/* 0000DF14 BB61002C */ lmw r27, 0x2c(r1)
/* 0000DF18 80010044 */ lwz r0, 0x44(r1)
/* 0000DF1C 38210040 */ addi r1, r1, 0x40
/* 0000DF20 7C0803A6 */ mtlr r0
/* 0000DF24 4E800020 */ blr 
