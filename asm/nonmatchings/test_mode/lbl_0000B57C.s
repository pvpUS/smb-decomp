/* 0000B57C 7C0802A6 */ mflr r0
/* 0000B580 3C600000 */ lis r3, lbl_000148A8@ha
/* 0000B584 90010004 */ stw r0, 4(r1)
/* 0000B588 38800008 */ li r4, 8
/* 0000B58C 9421FFE0 */ stwu r1, -0x20(r1)
/* 0000B590 93E1001C */ stw r31, 0x1c(r1)
/* 0000B594 93C10018 */ stw r30, 0x18(r1)
/* 0000B598 93A10014 */ stw r29, 0x14(r1)
/* 0000B59C 3BA30000 */ addi r29, r3, lbl_000148A8@l
/* 0000B5A0 3C600000 */ lis r3, lbl_00010118@ha
/* 0000B5A4 3BC30000 */ addi r30, r3, lbl_00010118@l
/* 0000B5A8 38600008 */ li r3, 8
/* 0000B5AC 4BFF4BB1 */ bl window_set_cursor_pos
/* 0000B5B0 387D0000 */ addi r3, r29, 0
/* 0000B5B4 4CC63182 */ crclr 6
/* 0000B5B8 4BFF4BA5 */ bl window_printf_2
/* 0000B5BC 3C600000 */ lis r3, lbl_10000F70@ha
/* 0000B5C0 4CC63182 */ crclr 6
/* 0000B5C4 3BE30000 */ addi r31, r3, lbl_10000F70@l
/* 0000B5C8 809F0008 */ lwz r4, 8(r31)
/* 0000B5CC 387D000C */ addi r3, r29, 0xc
/* 0000B5D0 4BFF4B8D */ bl window_printf_2
/* 0000B5D4 C03F000C */ lfs f1, 0xc(r31)
/* 0000B5D8 387D001C */ addi r3, r29, 0x1c
/* 0000B5DC 4CC63242 */ crset 6
/* 0000B5E0 4BFF4B7D */ bl window_printf_2
/* 0000B5E4 480008B5 */ bl lbl_0000BE98
/* 0000B5E8 38600000 */ li r3, 0
/* 0000B5EC 4BFF4B71 */ bl change_current_camera
/* 0000B5F0 480000C1 */ bl lbl_0000B6B0
/* 0000B5F4 4BFF4B69 */ bl default_camera_env
/* 0000B5F8 38600000 */ li r3, 0
/* 0000B5FC 38800001 */ li r4, 1
/* 0000B600 38A00000 */ li r5, 0
/* 0000B604 38C00000 */ li r6, 0
/* 0000B608 4BFF4B55 */ bl GXSetBlendMode_cached
/* 0000B60C 3C600000 */ lis r3, gxCache@ha
/* 0000B610 38630000 */ addi r3, r3, gxCache@l
/* 0000B614 80630000 */ lwz r3, 0(r3)
/* 0000B618 88030008 */ lbz r0, 8(r3)
/* 0000B61C 28000001 */ cmplwi r0, 1
/* 0000B620 4082001C */ bne lbl_0000B63C
/* 0000B624 80030004 */ lwz r0, 4(r3)
/* 0000B628 2C000001 */ cmpwi r0, 1
/* 0000B62C 40820010 */ bne lbl_0000B63C
/* 0000B630 88030000 */ lbz r0, 0(r3)
/* 0000B634 28000001 */ cmplwi r0, 1
/* 0000B638 41820038 */ beq lbl_0000B670
lbl_0000B63C:
/* 0000B63C 38600001 */ li r3, 1
/* 0000B640 38800001 */ li r4, 1
/* 0000B644 38A00001 */ li r5, 1
/* 0000B648 4BFF4B15 */ bl GXSetZMode
/* 0000B64C 3C600000 */ lis r3, gxCache@ha
/* 0000B650 38830000 */ addi r4, r3, gxCache@l
/* 0000B654 80640000 */ lwz r3, 0(r4)
/* 0000B658 38000001 */ li r0, 1
/* 0000B65C 98030000 */ stb r0, 0(r3)
/* 0000B660 80640000 */ lwz r3, 0(r4)
/* 0000B664 90030004 */ stw r0, 4(r3)
/* 0000B668 80640000 */ lwz r3, 0(r4)
/* 0000B66C 98030008 */ stb r0, 8(r3)
lbl_0000B670:
/* 0000B670 801E0010 */ lwz r0, 0x10(r30)
/* 0000B674 38810008 */ addi r4, r1, 8
/* 0000B678 38600000 */ li r3, 0
/* 0000B67C 90010008 */ stw r0, 8(r1)
/* 0000B680 C03E0014 */ lfs f1, 0x14(r30)
/* 0000B684 C05E0004 */ lfs f2, 4(r30)
/* 0000B688 C07E0018 */ lfs f3, 0x18(r30)
/* 0000B68C C09E001C */ lfs f4, 0x1c(r30)
/* 0000B690 4BFF4ACD */ bl GXSetFog_cached
/* 0000B694 80010024 */ lwz r0, 0x24(r1)
/* 0000B698 83E1001C */ lwz r31, 0x1c(r1)
/* 0000B69C 83C10018 */ lwz r30, 0x18(r1)
/* 0000B6A0 7C0803A6 */ mtlr r0
/* 0000B6A4 83A10014 */ lwz r29, 0x14(r1)
/* 0000B6A8 38210020 */ addi r1, r1, 0x20
/* 0000B6AC 4E800020 */ blr 
