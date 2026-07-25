/* 0000AD6C 7C0802A6 */ mflr r0
/* 0000AD70 90010004 */ stw r0, 4(r1)
/* 0000AD74 9421FF38 */ stwu r1, -0xc8(r1)
/* 0000AD78 DBE100C0 */ stfd f31, 0xc0(r1)
/* 0000AD7C DBC100B8 */ stfd f30, 0xb8(r1)
/* 0000AD80 93E100B4 */ stw r31, 0xb4(r1)
/* 0000AD84 93C100B0 */ stw r30, 0xb0(r1)
/* 0000AD88 93A100AC */ stw r29, 0xac(r1)
/* 0000AD8C 40860024 */ bne cr1, lbl_0000ADB0
/* 0000AD90 D8210028 */ stfd f1, 0x28(r1)
/* 0000AD94 D8410030 */ stfd f2, 0x30(r1)
/* 0000AD98 D8610038 */ stfd f3, 0x38(r1)
/* 0000AD9C D8810040 */ stfd f4, 0x40(r1)
/* 0000ADA0 D8A10048 */ stfd f5, 0x48(r1)
/* 0000ADA4 D8C10050 */ stfd f6, 0x50(r1)
/* 0000ADA8 D8E10058 */ stfd f7, 0x58(r1)
/* 0000ADAC D9010060 */ stfd f8, 0x60(r1)
lbl_0000ADB0:
/* 0000ADB0 90610008 */ stw r3, 8(r1)
/* 0000ADB4 3BA30000 */ addi r29, r3, 0
/* 0000ADB8 3C000302 */ lis r0, 0x302
/* 0000ADBC FFC00890 */ fmr f30, f1
/* 0000ADC0 9081000C */ stw r4, 0xc(r1)
/* 0000ADC4 3BC40000 */ addi r30, r4, 0
/* 0000ADC8 FFE01090 */ fmr f31, f2
/* 0000ADCC 90A10010 */ stw r5, 0x10(r1)
/* 0000ADD0 38850000 */ addi r4, r5, 0
/* 0000ADD4 90C10014 */ stw r6, 0x14(r1)
/* 0000ADD8 38C1009C */ addi r6, r1, 0x9c
/* 0000ADDC 38A60000 */ addi r5, r6, 0
/* 0000ADE0 90E10018 */ stw r7, 0x18(r1)
/* 0000ADE4 3CE00000 */ lis r7, lbl_0000C360@ha
/* 0000ADE8 3BE70000 */ addi r31, r7, lbl_0000C360@l
/* 0000ADEC 9101001C */ stw r8, 0x1c(r1)
/* 0000ADF0 3861007C */ addi r3, r1, 0x7c
/* 0000ADF4 91210020 */ stw r9, 0x20(r1)
/* 0000ADF8 91410024 */ stw r10, 0x24(r1)
/* 0000ADFC 9001009C */ stw r0, 0x9c(r1)
/* 0000AE00 380100D0 */ addi r0, r1, 0xd0
/* 0000AE04 900100A0 */ stw r0, 0xa0(r1)
/* 0000AE08 38010008 */ addi r0, r1, 8
/* 0000AE0C 900100A4 */ stw r0, 0xa4(r1)
/* 0000AE10 4BFF533D */ bl vsprintf
/* 0000AE14 3C60FF00 */ lis r3, 0xff00
/* 0000AE18 4BFF5335 */ bl set_text_mul_color
/* 0000AE1C C81F00D0 */ lfd f0, 0xd0(r31)
/* 0000AE20 FC20F02A */ fadd f1, f0, f30
/* 0000AE24 FC40F82A */ fadd f2, f0, f31
/* 0000AE28 FC200818 */ frsp f1, f1
/* 0000AE2C FC401018 */ frsp f2, f2
/* 0000AE30 4BFF531D */ bl set_text_pos
/* 0000AE34 C03F0008 */ lfs f1, 8(r31)
/* 0000AE38 4BFF5315 */ bl func_80071B1C
/* 0000AE3C 3861007C */ addi r3, r1, 0x7c
/* 0000AE40 4BFF530D */ bl sprite_puts
/* 0000AE44 7FA3EB78 */ mr r3, r29
/* 0000AE48 4BFF5305 */ bl set_text_mul_color
/* 0000AE4C 7FC3F378 */ mr r3, r30
/* 0000AE50 4BFF52FD */ bl set_text_add_color
/* 0000AE54 FC20F090 */ fmr f1, f30
/* 0000AE58 FC40F890 */ fmr f2, f31
/* 0000AE5C 4BFF52F1 */ bl set_text_pos
/* 0000AE60 C03F009C */ lfs f1, 0x9c(r31)
/* 0000AE64 4BFF52E9 */ bl func_80071B1C
/* 0000AE68 3861007C */ addi r3, r1, 0x7c
/* 0000AE6C 4BFF52E1 */ bl sprite_puts
/* 0000AE70 800100CC */ lwz r0, 0xcc(r1)
/* 0000AE74 CBE100C0 */ lfd f31, 0xc0(r1)
/* 0000AE78 CBC100B8 */ lfd f30, 0xb8(r1)
/* 0000AE7C 7C0803A6 */ mtlr r0
/* 0000AE80 83E100B4 */ lwz r31, 0xb4(r1)
/* 0000AE84 83C100B0 */ lwz r30, 0xb0(r1)
/* 0000AE88 83A100AC */ lwz r29, 0xac(r1)
/* 0000AE8C 382100C8 */ addi r1, r1, 0xc8
/* 0000AE90 4E800020 */ blr 
