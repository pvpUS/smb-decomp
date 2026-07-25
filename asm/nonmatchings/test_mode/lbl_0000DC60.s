/* 0000DC60 7C0802A6 */ mflr r0
/* 0000DC64 90010004 */ stw r0, 4(r1)
/* 0000DC68 9421FF20 */ stwu r1, -0xe0(r1)
/* 0000DC6C 93E100DC */ stw r31, 0xdc(r1)
/* 0000DC70 93C100D8 */ stw r30, 0xd8(r1)
/* 0000DC74 93A100D4 */ stw r29, 0xd4(r1)
/* 0000DC78 938100D0 */ stw r28, 0xd0(r1)
/* 0000DC7C 40860024 */ bne cr1, lbl_0000DCA0
/* 0000DC80 D8210028 */ stfd f1, 0x28(r1)
/* 0000DC84 D8410030 */ stfd f2, 0x30(r1)
/* 0000DC88 D8610038 */ stfd f3, 0x38(r1)
/* 0000DC8C D8810040 */ stfd f4, 0x40(r1)
/* 0000DC90 D8A10048 */ stfd f5, 0x48(r1)
/* 0000DC94 D8C10050 */ stfd f6, 0x50(r1)
/* 0000DC98 D8E10058 */ stfd f7, 0x58(r1)
/* 0000DC9C D9010060 */ stfd f8, 0x60(r1)
lbl_0000DCA0:
/* 0000DCA0 90610008 */ stw r3, 8(r1)
/* 0000DCA4 3B830000 */ addi r28, r3, 0
/* 0000DCA8 3BA40000 */ addi r29, r4, 0
/* 0000DCAC 9081000C */ stw r4, 0xc(r1)
/* 0000DCB0 90A10010 */ stw r5, 0x10(r1)
/* 0000DCB4 3CA00000 */ lis r5, lbl_10003BF8@ha
/* 0000DCB8 3BE50000 */ addi r31, r5, lbl_10003BF8@l
/* 0000DCBC 90C10014 */ stw r6, 0x14(r1)
/* 0000DCC0 3CC00000 */ lis r6, lbl_000148E8@ha
/* 0000DCC4 3BC60000 */ addi r30, r6, lbl_000148E8@l
/* 0000DCC8 90E10018 */ stw r7, 0x18(r1)
/* 0000DCCC 9101001C */ stw r8, 0x1c(r1)
/* 0000DCD0 91210020 */ stw r9, 0x20(r1)
/* 0000DCD4 91410024 */ stw r10, 0x24(r1)
/* 0000DCD8 80BF0078 */ lwz r5, 0x78(r31)
/* 0000DCDC 801F007C */ lwz r0, 0x7c(r31)
/* 0000DCE0 7C050000 */ cmpw r5, r0
/* 0000DCE4 40820018 */ bne lbl_0000DCFC
/* 0000DCE8 38600002 */ li r3, 2
/* 0000DCEC 4BFF2471 */ bl window_set_text_color
/* 0000DCF0 387E0E98 */ addi r3, r30, 0xe98
/* 0000DCF4 4BFF2469 */ bl u_debug_print
/* 0000DCF8 48000014 */ b lbl_0000DD0C
lbl_0000DCFC:
/* 0000DCFC 38600000 */ li r3, 0
/* 0000DD00 4BFF245D */ bl window_set_text_color
/* 0000DD04 387E0E9C */ addi r3, r30, 0xe9c
/* 0000DD08 4BFF2455 */ bl u_debug_print
lbl_0000DD0C:
/* 0000DD0C 7F83E378 */ mr r3, r28
/* 0000DD10 4BFF244D */ bl u_debug_print
/* 0000DD14 807F0078 */ lwz r3, 0x78(r31)
/* 0000DD18 801F007C */ lwz r0, 0x7c(r31)
/* 0000DD1C 7C030000 */ cmpw r3, r0
/* 0000DD20 40820010 */ bne lbl_0000DD30
/* 0000DD24 38600002 */ li r3, 2
/* 0000DD28 4BFF2435 */ bl window_set_text_color
/* 0000DD2C 4800000C */ b lbl_0000DD38
lbl_0000DD30:
/* 0000DD30 38600001 */ li r3, 1
/* 0000DD34 4BFF2429 */ bl window_set_text_color
lbl_0000DD38:
/* 0000DD38 3C000200 */ lis r0, 0x200
/* 0000DD3C 900100C0 */ stw r0, 0xc0(r1)
/* 0000DD40 380100E8 */ addi r0, r1, 0xe8
/* 0000DD44 38A100C0 */ addi r5, r1, 0xc0
/* 0000DD48 900100C4 */ stw r0, 0xc4(r1)
/* 0000DD4C 38010008 */ addi r0, r1, 8
/* 0000DD50 389D0000 */ addi r4, r29, 0
/* 0000DD54 900100C8 */ stw r0, 0xc8(r1)
/* 0000DD58 38610070 */ addi r3, r1, 0x70
/* 0000DD5C 4BFF2401 */ bl vsprintf
/* 0000DD60 38610070 */ addi r3, r1, 0x70
/* 0000DD64 4BFF23F9 */ bl u_debug_print
/* 0000DD68 809F007C */ lwz r4, 0x7c(r31)
/* 0000DD6C 38600000 */ li r3, 0
/* 0000DD70 38040001 */ addi r0, r4, 1
/* 0000DD74 901F007C */ stw r0, 0x7c(r31)
/* 0000DD78 4BFF23E5 */ bl window_set_text_color
/* 0000DD7C 387E0EAC */ addi r3, r30, 0xeac
/* 0000DD80 4BFF23DD */ bl u_debug_print
/* 0000DD84 800100E4 */ lwz r0, 0xe4(r1)
/* 0000DD88 83E100DC */ lwz r31, 0xdc(r1)
/* 0000DD8C 83C100D8 */ lwz r30, 0xd8(r1)
/* 0000DD90 7C0803A6 */ mtlr r0
/* 0000DD94 83A100D4 */ lwz r29, 0xd4(r1)
/* 0000DD98 838100D0 */ lwz r28, 0xd0(r1)
/* 0000DD9C 382100E0 */ addi r1, r1, 0xe0
/* 0000DDA0 4E800020 */ blr 
