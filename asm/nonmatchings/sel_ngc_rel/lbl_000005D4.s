/* 000005D4 9421FFE8 */ stwu r1, -0x18(r1)
/* 000005D8 3C800000 */ lis r4, lbl_10000000@ha
/* 000005DC 28030008 */ cmplwi r3, 8
/* 000005E0 93E10014 */ stw r31, 0x14(r1)
/* 000005E4 38A40000 */ addi r5, r4, lbl_10000000@l
/* 000005E8 38C00000 */ li r6, 0
/* 000005EC 41811314 */ bgt lbl_00001900
/* 000005F0 3C800000 */ lis r4, lbl_00012238@ha
/* 000005F4 38840000 */ addi r4, r4, lbl_00012238@l
/* 000005F8 5460103A */ slwi r0, r3, 2
/* 000005FC 7C04002E */ lwzx r0, r4, r0
/* 00000600 7C0903A6 */ mtctr r0
/* 00000604 4E800420 */ bctr 
lbl_00000608:
/* 00000608 80C50004 */ lwz r6, 4(r5)
/* 0000060C 38000001 */ li r0, 1
/* 00000610 38600000 */ li r3, 0
/* 00000614 28060000 */ cmplwi r6, 0
/* 00000618 40820110 */ bne lbl_00000728
/* 0000061C 3C800000 */ lis r4, controllerInfo@ha
/* 00000620 39040000 */ addi r8, r4, controllerInfo@l
/* 00000624 A0E80030 */ lhz r7, 0x30(r8)
/* 00000628 7C040378 */ mr r4, r0
/* 0000062C 7C050378 */ mr r5, r0
/* 00000630 54E707FF */ clrlwi. r7, r7, 0x1f
/* 00000634 7C090378 */ mr r9, r0
/* 00000638 7C0A0378 */ mr r10, r0
/* 0000063C 7C0B0378 */ mr r11, r0
/* 00000640 7C0C0378 */ mr r12, r0
/* 00000644 7C1F0378 */ mr r31, r0
/* 00000648 40820014 */ bne lbl_0000065C
/* 0000064C A0E8006C */ lhz r7, 0x6c(r8)
/* 00000650 54E707FF */ clrlwi. r7, r7, 0x1f
/* 00000654 40820008 */ bne lbl_0000065C
/* 00000658 7C7F1B78 */ mr r31, r3
lbl_0000065C:
/* 0000065C 2C1F0000 */ cmpwi r31, 0
/* 00000660 4082001C */ bne lbl_0000067C
/* 00000664 3CE00000 */ lis r7, controllerInfo@ha
/* 00000668 38E70000 */ addi r7, r7, controllerInfo@l
/* 0000066C A0E700A8 */ lhz r7, 0xa8(r7)
/* 00000670 54E707FF */ clrlwi. r7, r7, 0x1f
/* 00000674 40820008 */ bne lbl_0000067C
/* 00000678 39800000 */ li r12, 0
lbl_0000067C:
/* 0000067C 2C0C0000 */ cmpwi r12, 0
/* 00000680 4082001C */ bne lbl_0000069C
/* 00000684 3CE00000 */ lis r7, controllerInfo@ha
/* 00000688 38E70000 */ addi r7, r7, controllerInfo@l
/* 0000068C A0E700E4 */ lhz r7, 0xe4(r7)
/* 00000690 54E707FF */ clrlwi. r7, r7, 0x1f
/* 00000694 40820008 */ bne lbl_0000069C
/* 00000698 39600000 */ li r11, 0
lbl_0000069C:
/* 0000069C 2C0B0000 */ cmpwi r11, 0
/* 000006A0 4082001C */ bne lbl_000006BC
/* 000006A4 3CE00000 */ lis r7, analogInputs@ha
/* 000006A8 38E70000 */ addi r7, r7, analogInputs@l
/* 000006AC A0E70008 */ lhz r7, 8(r7)
/* 000006B0 54E707FF */ clrlwi. r7, r7, 0x1f
/* 000006B4 40820008 */ bne lbl_000006BC
/* 000006B8 39400000 */ li r10, 0
lbl_000006BC:
/* 000006BC 2C0A0000 */ cmpwi r10, 0
/* 000006C0 4082001C */ bne lbl_000006DC
/* 000006C4 3CE00000 */ lis r7, analogInputs@ha
/* 000006C8 38E70000 */ addi r7, r7, analogInputs@l
/* 000006CC A0E70012 */ lhz r7, 0x12(r7)
/* 000006D0 54E707FF */ clrlwi. r7, r7, 0x1f
/* 000006D4 40820008 */ bne lbl_000006DC
/* 000006D8 39200000 */ li r9, 0
lbl_000006DC:
/* 000006DC 2C090000 */ cmpwi r9, 0
/* 000006E0 4082001C */ bne lbl_000006FC
/* 000006E4 3CE00000 */ lis r7, analogInputs@ha
/* 000006E8 38E70000 */ addi r7, r7, analogInputs@l
/* 000006EC A0E7001C */ lhz r7, 0x1c(r7)
/* 000006F0 54E707FF */ clrlwi. r7, r7, 0x1f
/* 000006F4 40820008 */ bne lbl_000006FC
/* 000006F8 38A00000 */ li r5, 0
lbl_000006FC:
/* 000006FC 2C050000 */ cmpwi r5, 0
/* 00000700 4082001C */ bne lbl_0000071C
/* 00000704 3CA00000 */ lis r5, analogInputs@ha
/* 00000708 38A50000 */ addi r5, r5, analogInputs@l
/* 0000070C A0A50026 */ lhz r5, 0x26(r5)
/* 00000710 54A507FF */ clrlwi. r5, r5, 0x1f
/* 00000714 40820008 */ bne lbl_0000071C
/* 00000718 38800000 */ li r4, 0
lbl_0000071C:
/* 0000071C 2C040000 */ cmpwi r4, 0
/* 00000720 41820008 */ beq lbl_00000728
/* 00000724 38600001 */ li r3, 1
lbl_00000728:
/* 00000728 2C030000 */ cmpwi r3, 0
/* 0000072C 40820190 */ bne lbl_000008BC
/* 00000730 28060000 */ cmplwi r6, 0
/* 00000734 38600000 */ li r3, 0
/* 00000738 41820178 */ beq lbl_000008B0
/* 0000073C 54C407FF */ clrlwi. r4, r6, 0x1f
/* 00000740 38800001 */ li r4, 1
/* 00000744 39230000 */ addi r9, r3, 0
/* 00000748 38A40000 */ addi r5, r4, 0
/* 0000074C 39040000 */ addi r8, r4, 0
/* 00000750 41820040 */ beq lbl_00000790
/* 00000754 3CE00000 */ lis r7, controllerInfo@ha
/* 00000758 38E70000 */ addi r7, r7, controllerInfo@l
/* 0000075C A0E70030 */ lhz r7, 0x30(r7)
/* 00000760 39440000 */ addi r10, r4, 0
/* 00000764 54E707FF */ clrlwi. r7, r7, 0x1f
/* 00000768 4082001C */ bne lbl_00000784
/* 0000076C 3CE00000 */ lis r7, analogInputs@ha
/* 00000770 38E70000 */ addi r7, r7, analogInputs@l
/* 00000774 A0E70008 */ lhz r7, 8(r7)
/* 00000778 54E707FF */ clrlwi. r7, r7, 0x1f
/* 0000077C 40820008 */ bne lbl_00000784
/* 00000780 7C6A1B78 */ mr r10, r3
lbl_00000784:
/* 00000784 2C0A0000 */ cmpwi r10, 0
/* 00000788 41820008 */ beq lbl_00000790
/* 0000078C 39200001 */ li r9, 1
lbl_00000790:
/* 00000790 2C090000 */ cmpwi r9, 0
/* 00000794 40820058 */ bne lbl_000007EC
/* 00000798 54C707BD */ rlwinm. r7, r6, 0, 0x1e, 0x1e
/* 0000079C 39200000 */ li r9, 0
/* 000007A0 41820040 */ beq lbl_000007E0
/* 000007A4 3CE00000 */ lis r7, controllerInfo@ha
/* 000007A8 38E70000 */ addi r7, r7, controllerInfo@l
/* 000007AC A0E7006C */ lhz r7, 0x6c(r7)
/* 000007B0 39400001 */ li r10, 1
/* 000007B4 54E707FF */ clrlwi. r7, r7, 0x1f
/* 000007B8 4082001C */ bne lbl_000007D4
/* 000007BC 3CE00000 */ lis r7, analogInputs@ha
/* 000007C0 38E70000 */ addi r7, r7, analogInputs@l
/* 000007C4 A0E70012 */ lhz r7, 0x12(r7)
/* 000007C8 54E707FF */ clrlwi. r7, r7, 0x1f
/* 000007CC 40820008 */ bne lbl_000007D4
/* 000007D0 7D2A4B78 */ mr r10, r9
lbl_000007D4:
/* 000007D4 2C0A0000 */ cmpwi r10, 0
/* 000007D8 41820008 */ beq lbl_000007E0
/* 000007DC 39200001 */ li r9, 1
lbl_000007E0:
/* 000007E0 2C090000 */ cmpwi r9, 0
/* 000007E4 40820008 */ bne lbl_000007EC
/* 000007E8 39000000 */ li r8, 0
lbl_000007EC:
/* 000007EC 2C080000 */ cmpwi r8, 0
/* 000007F0 40820058 */ bne lbl_00000848
/* 000007F4 54C7077B */ rlwinm. r7, r6, 0, 0x1d, 0x1d
/* 000007F8 39000000 */ li r8, 0
/* 000007FC 41820040 */ beq lbl_0000083C
/* 00000800 3CE00000 */ lis r7, controllerInfo@ha
/* 00000804 38E70000 */ addi r7, r7, controllerInfo@l
/* 00000808 A0E700A8 */ lhz r7, 0xa8(r7)
/* 0000080C 39200001 */ li r9, 1
/* 00000810 54E707FF */ clrlwi. r7, r7, 0x1f
/* 00000814 4082001C */ bne lbl_00000830
/* 00000818 3CE00000 */ lis r7, analogInputs@ha
/* 0000081C 38E70000 */ addi r7, r7, analogInputs@l
/* 00000820 A0E7001C */ lhz r7, 0x1c(r7)
/* 00000824 54E707FF */ clrlwi. r7, r7, 0x1f
/* 00000828 40820008 */ bne lbl_00000830
/* 0000082C 7D094378 */ mr r9, r8
lbl_00000830:
/* 00000830 2C090000 */ cmpwi r9, 0
/* 00000834 41820008 */ beq lbl_0000083C
/* 00000838 39000001 */ li r8, 1
lbl_0000083C:
/* 0000083C 2C080000 */ cmpwi r8, 0
/* 00000840 40820008 */ bne lbl_00000848
/* 00000844 38A00000 */ li r5, 0
lbl_00000848:
/* 00000848 2C050000 */ cmpwi r5, 0
/* 0000084C 40820058 */ bne lbl_000008A4
/* 00000850 54C50739 */ rlwinm. r5, r6, 0, 0x1c, 0x1c
/* 00000854 38C00000 */ li r6, 0
/* 00000858 41820040 */ beq lbl_00000898
/* 0000085C 3CA00000 */ lis r5, controllerInfo@ha
/* 00000860 38A50000 */ addi r5, r5, controllerInfo@l
/* 00000864 A0A500E4 */ lhz r5, 0xe4(r5)
/* 00000868 38E00001 */ li r7, 1
/* 0000086C 54A507FF */ clrlwi. r5, r5, 0x1f
/* 00000870 4082001C */ bne lbl_0000088C
/* 00000874 3CA00000 */ lis r5, analogInputs@ha
/* 00000878 38A50000 */ addi r5, r5, analogInputs@l
/* 0000087C A0A50026 */ lhz r5, 0x26(r5)
/* 00000880 54A507FF */ clrlwi. r5, r5, 0x1f
/* 00000884 40820008 */ bne lbl_0000088C
/* 00000888 7CC73378 */ mr r7, r6
lbl_0000088C:
/* 0000088C 2C070000 */ cmpwi r7, 0
/* 00000890 41820008 */ beq lbl_00000898
/* 00000894 38C00001 */ li r6, 1
lbl_00000898:
/* 00000898 2C060000 */ cmpwi r6, 0
/* 0000089C 40820008 */ bne lbl_000008A4
/* 000008A0 38800000 */ li r4, 0
lbl_000008A4:
/* 000008A4 2C040000 */ cmpwi r4, 0
/* 000008A8 41820008 */ beq lbl_000008B0
/* 000008AC 38600001 */ li r3, 1
lbl_000008B0:
/* 000008B0 2C030000 */ cmpwi r3, 0
/* 000008B4 40820008 */ bne lbl_000008BC
/* 000008B8 38000000 */ li r0, 0
lbl_000008BC:
/* 000008BC 7C060378 */ mr r6, r0
/* 000008C0 48001040 */ b lbl_00001900
lbl_000008C4:
/* 000008C4 80C50004 */ lwz r6, 4(r5)
/* 000008C8 38000001 */ li r0, 1
/* 000008CC 38600000 */ li r3, 0
/* 000008D0 28060000 */ cmplwi r6, 0
/* 000008D4 40820110 */ bne lbl_000009E4
/* 000008D8 3C800000 */ lis r4, controllerInfo@ha
/* 000008DC 39040000 */ addi r8, r4, controllerInfo@l
/* 000008E0 A0E80030 */ lhz r7, 0x30(r8)
/* 000008E4 7C040378 */ mr r4, r0
/* 000008E8 7C050378 */ mr r5, r0
/* 000008EC 54E707BD */ rlwinm. r7, r7, 0, 0x1e, 0x1e
/* 000008F0 7C090378 */ mr r9, r0
/* 000008F4 7C0A0378 */ mr r10, r0
/* 000008F8 7C0B0378 */ mr r11, r0
/* 000008FC 7C0C0378 */ mr r12, r0
/* 00000900 7C1F0378 */ mr r31, r0
/* 00000904 40820014 */ bne lbl_00000918
/* 00000908 A0E8006C */ lhz r7, 0x6c(r8)
/* 0000090C 54E707BD */ rlwinm. r7, r7, 0, 0x1e, 0x1e
/* 00000910 40820008 */ bne lbl_00000918
/* 00000914 7C7F1B78 */ mr r31, r3
lbl_00000918:
/* 00000918 2C1F0000 */ cmpwi r31, 0
/* 0000091C 4082001C */ bne lbl_00000938
/* 00000920 3CE00000 */ lis r7, controllerInfo@ha
/* 00000924 38E70000 */ addi r7, r7, controllerInfo@l
/* 00000928 A0E700A8 */ lhz r7, 0xa8(r7)
/* 0000092C 54E707BD */ rlwinm. r7, r7, 0, 0x1e, 0x1e
/* 00000930 40820008 */ bne lbl_00000938
/* 00000934 39800000 */ li r12, 0
lbl_00000938:
/* 00000938 2C0C0000 */ cmpwi r12, 0
/* 0000093C 4082001C */ bne lbl_00000958
/* 00000940 3CE00000 */ lis r7, controllerInfo@ha
/* 00000944 38E70000 */ addi r7, r7, controllerInfo@l
/* 00000948 A0E700E4 */ lhz r7, 0xe4(r7)
/* 0000094C 54E707BD */ rlwinm. r7, r7, 0, 0x1e, 0x1e
/* 00000950 40820008 */ bne lbl_00000958
/* 00000954 39600000 */ li r11, 0
lbl_00000958:
/* 00000958 2C0B0000 */ cmpwi r11, 0
/* 0000095C 4082001C */ bne lbl_00000978
/* 00000960 3CE00000 */ lis r7, analogInputs@ha
/* 00000964 38E70000 */ addi r7, r7, analogInputs@l
/* 00000968 A0E70008 */ lhz r7, 8(r7)
/* 0000096C 54E707BD */ rlwinm. r7, r7, 0, 0x1e, 0x1e
/* 00000970 40820008 */ bne lbl_00000978
/* 00000974 39400000 */ li r10, 0
lbl_00000978:
/* 00000978 2C0A0000 */ cmpwi r10, 0
/* 0000097C 4082001C */ bne lbl_00000998
/* 00000980 3CE00000 */ lis r7, analogInputs@ha
/* 00000984 38E70000 */ addi r7, r7, analogInputs@l
/* 00000988 A0E70012 */ lhz r7, 0x12(r7)
/* 0000098C 54E707BD */ rlwinm. r7, r7, 0, 0x1e, 0x1e
/* 00000990 40820008 */ bne lbl_00000998
/* 00000994 39200000 */ li r9, 0
lbl_00000998:
/* 00000998 2C090000 */ cmpwi r9, 0
/* 0000099C 4082001C */ bne lbl_000009B8
/* 000009A0 3CE00000 */ lis r7, analogInputs@ha
/* 000009A4 38E70000 */ addi r7, r7, analogInputs@l
/* 000009A8 A0E7001C */ lhz r7, 0x1c(r7)
/* 000009AC 54E707BD */ rlwinm. r7, r7, 0, 0x1e, 0x1e
/* 000009B0 40820008 */ bne lbl_000009B8
/* 000009B4 38A00000 */ li r5, 0
lbl_000009B8:
/* 000009B8 2C050000 */ cmpwi r5, 0
/* 000009BC 4082001C */ bne lbl_000009D8
/* 000009C0 3CA00000 */ lis r5, analogInputs@ha
/* 000009C4 38A50000 */ addi r5, r5, analogInputs@l
/* 000009C8 A0A50026 */ lhz r5, 0x26(r5)
/* 000009CC 54A507BD */ rlwinm. r5, r5, 0, 0x1e, 0x1e
/* 000009D0 40820008 */ bne lbl_000009D8
/* 000009D4 38800000 */ li r4, 0
lbl_000009D8:
/* 000009D8 2C040000 */ cmpwi r4, 0
/* 000009DC 41820008 */ beq lbl_000009E4
/* 000009E0 38600001 */ li r3, 1
lbl_000009E4:
/* 000009E4 2C030000 */ cmpwi r3, 0
/* 000009E8 40820190 */ bne lbl_00000B78
/* 000009EC 28060000 */ cmplwi r6, 0
/* 000009F0 38600000 */ li r3, 0
/* 000009F4 41820178 */ beq lbl_00000B6C
/* 000009F8 54C407FF */ clrlwi. r4, r6, 0x1f
/* 000009FC 38800001 */ li r4, 1
/* 00000A00 39230000 */ addi r9, r3, 0
/* 00000A04 38A40000 */ addi r5, r4, 0
/* 00000A08 39040000 */ addi r8, r4, 0
/* 00000A0C 41820040 */ beq lbl_00000A4C
/* 00000A10 3CE00000 */ lis r7, controllerInfo@ha
/* 00000A14 38E70000 */ addi r7, r7, controllerInfo@l
/* 00000A18 A0E70030 */ lhz r7, 0x30(r7)
/* 00000A1C 39440000 */ addi r10, r4, 0
/* 00000A20 54E707BD */ rlwinm. r7, r7, 0, 0x1e, 0x1e
/* 00000A24 4082001C */ bne lbl_00000A40
/* 00000A28 3CE00000 */ lis r7, analogInputs@ha
/* 00000A2C 38E70000 */ addi r7, r7, analogInputs@l
/* 00000A30 A0E70008 */ lhz r7, 8(r7)
/* 00000A34 54E707BD */ rlwinm. r7, r7, 0, 0x1e, 0x1e
/* 00000A38 40820008 */ bne lbl_00000A40
/* 00000A3C 7C6A1B78 */ mr r10, r3
lbl_00000A40:
/* 00000A40 2C0A0000 */ cmpwi r10, 0
/* 00000A44 41820008 */ beq lbl_00000A4C
/* 00000A48 39200001 */ li r9, 1
lbl_00000A4C:
/* 00000A4C 2C090000 */ cmpwi r9, 0
/* 00000A50 40820058 */ bne lbl_00000AA8
/* 00000A54 54C707BD */ rlwinm. r7, r6, 0, 0x1e, 0x1e
/* 00000A58 39200000 */ li r9, 0
/* 00000A5C 41820040 */ beq lbl_00000A9C
/* 00000A60 3CE00000 */ lis r7, controllerInfo@ha
/* 00000A64 38E70000 */ addi r7, r7, controllerInfo@l
/* 00000A68 A0E7006C */ lhz r7, 0x6c(r7)
/* 00000A6C 39400001 */ li r10, 1
/* 00000A70 54E707BD */ rlwinm. r7, r7, 0, 0x1e, 0x1e
/* 00000A74 4082001C */ bne lbl_00000A90
/* 00000A78 3CE00000 */ lis r7, analogInputs@ha
/* 00000A7C 38E70000 */ addi r7, r7, analogInputs@l
/* 00000A80 A0E70012 */ lhz r7, 0x12(r7)
/* 00000A84 54E707BD */ rlwinm. r7, r7, 0, 0x1e, 0x1e
/* 00000A88 40820008 */ bne lbl_00000A90
/* 00000A8C 7D2A4B78 */ mr r10, r9
lbl_00000A90:
/* 00000A90 2C0A0000 */ cmpwi r10, 0
/* 00000A94 41820008 */ beq lbl_00000A9C
/* 00000A98 39200001 */ li r9, 1
lbl_00000A9C:
/* 00000A9C 2C090000 */ cmpwi r9, 0
/* 00000AA0 40820008 */ bne lbl_00000AA8
/* 00000AA4 39000000 */ li r8, 0
lbl_00000AA8:
/* 00000AA8 2C080000 */ cmpwi r8, 0
/* 00000AAC 40820058 */ bne lbl_00000B04
/* 00000AB0 54C7077B */ rlwinm. r7, r6, 0, 0x1d, 0x1d
/* 00000AB4 39000000 */ li r8, 0
/* 00000AB8 41820040 */ beq lbl_00000AF8
/* 00000ABC 3CE00000 */ lis r7, controllerInfo@ha
/* 00000AC0 38E70000 */ addi r7, r7, controllerInfo@l
/* 00000AC4 A0E700A8 */ lhz r7, 0xa8(r7)
/* 00000AC8 39200001 */ li r9, 1
/* 00000ACC 54E707BD */ rlwinm. r7, r7, 0, 0x1e, 0x1e
/* 00000AD0 4082001C */ bne lbl_00000AEC
/* 00000AD4 3CE00000 */ lis r7, analogInputs@ha
/* 00000AD8 38E70000 */ addi r7, r7, analogInputs@l
/* 00000ADC A0E7001C */ lhz r7, 0x1c(r7)
/* 00000AE0 54E707BD */ rlwinm. r7, r7, 0, 0x1e, 0x1e
/* 00000AE4 40820008 */ bne lbl_00000AEC
/* 00000AE8 7D094378 */ mr r9, r8
lbl_00000AEC:
/* 00000AEC 2C090000 */ cmpwi r9, 0
/* 00000AF0 41820008 */ beq lbl_00000AF8
/* 00000AF4 39000001 */ li r8, 1
lbl_00000AF8:
/* 00000AF8 2C080000 */ cmpwi r8, 0
/* 00000AFC 40820008 */ bne lbl_00000B04
/* 00000B00 38A00000 */ li r5, 0
lbl_00000B04:
/* 00000B04 2C050000 */ cmpwi r5, 0
/* 00000B08 40820058 */ bne lbl_00000B60
/* 00000B0C 54C50739 */ rlwinm. r5, r6, 0, 0x1c, 0x1c
/* 00000B10 38C00000 */ li r6, 0
/* 00000B14 41820040 */ beq lbl_00000B54
/* 00000B18 3CA00000 */ lis r5, controllerInfo@ha
/* 00000B1C 38A50000 */ addi r5, r5, controllerInfo@l
/* 00000B20 A0A500E4 */ lhz r5, 0xe4(r5)
/* 00000B24 38E00001 */ li r7, 1
/* 00000B28 54A507BD */ rlwinm. r5, r5, 0, 0x1e, 0x1e
/* 00000B2C 4082001C */ bne lbl_00000B48
/* 00000B30 3CA00000 */ lis r5, analogInputs@ha
/* 00000B34 38A50000 */ addi r5, r5, analogInputs@l
/* 00000B38 A0A50026 */ lhz r5, 0x26(r5)
/* 00000B3C 54A507BD */ rlwinm. r5, r5, 0, 0x1e, 0x1e
/* 00000B40 40820008 */ bne lbl_00000B48
/* 00000B44 7CC73378 */ mr r7, r6
lbl_00000B48:
/* 00000B48 2C070000 */ cmpwi r7, 0
/* 00000B4C 41820008 */ beq lbl_00000B54
/* 00000B50 38C00001 */ li r6, 1
lbl_00000B54:
/* 00000B54 2C060000 */ cmpwi r6, 0
/* 00000B58 40820008 */ bne lbl_00000B60
/* 00000B5C 38800000 */ li r4, 0
lbl_00000B60:
/* 00000B60 2C040000 */ cmpwi r4, 0
/* 00000B64 41820008 */ beq lbl_00000B6C
/* 00000B68 38600001 */ li r3, 1
lbl_00000B6C:
/* 00000B6C 2C030000 */ cmpwi r3, 0
/* 00000B70 40820008 */ bne lbl_00000B78
/* 00000B74 38000000 */ li r0, 0
lbl_00000B78:
/* 00000B78 7C060378 */ mr r6, r0
/* 00000B7C 48000D84 */ b lbl_00001900
lbl_00000B80:
/* 00000B80 80C50004 */ lwz r6, 4(r5)
/* 00000B84 38000001 */ li r0, 1
/* 00000B88 38600000 */ li r3, 0
/* 00000B8C 28060000 */ cmplwi r6, 0
/* 00000B90 40820110 */ bne lbl_00000CA0
/* 00000B94 3C800000 */ lis r4, controllerInfo@ha
/* 00000B98 39040000 */ addi r8, r4, controllerInfo@l
/* 00000B9C A0E80030 */ lhz r7, 0x30(r8)
/* 00000BA0 7C040378 */ mr r4, r0
/* 00000BA4 7C050378 */ mr r5, r0
/* 00000BA8 54E70739 */ rlwinm. r7, r7, 0, 0x1c, 0x1c
/* 00000BAC 7C090378 */ mr r9, r0
/* 00000BB0 7C0A0378 */ mr r10, r0
/* 00000BB4 7C0B0378 */ mr r11, r0
/* 00000BB8 7C0C0378 */ mr r12, r0
/* 00000BBC 7C1F0378 */ mr r31, r0
/* 00000BC0 40820014 */ bne lbl_00000BD4
/* 00000BC4 A0E8006C */ lhz r7, 0x6c(r8)
/* 00000BC8 54E70739 */ rlwinm. r7, r7, 0, 0x1c, 0x1c
/* 00000BCC 40820008 */ bne lbl_00000BD4
/* 00000BD0 7C7F1B78 */ mr r31, r3
lbl_00000BD4:
/* 00000BD4 2C1F0000 */ cmpwi r31, 0
/* 00000BD8 4082001C */ bne lbl_00000BF4
/* 00000BDC 3CE00000 */ lis r7, controllerInfo@ha
/* 00000BE0 38E70000 */ addi r7, r7, controllerInfo@l
/* 00000BE4 A0E700A8 */ lhz r7, 0xa8(r7)
/* 00000BE8 54E70739 */ rlwinm. r7, r7, 0, 0x1c, 0x1c
/* 00000BEC 40820008 */ bne lbl_00000BF4
/* 00000BF0 39800000 */ li r12, 0
lbl_00000BF4:
/* 00000BF4 2C0C0000 */ cmpwi r12, 0
/* 00000BF8 4082001C */ bne lbl_00000C14
/* 00000BFC 3CE00000 */ lis r7, controllerInfo@ha
/* 00000C00 38E70000 */ addi r7, r7, controllerInfo@l
/* 00000C04 A0E700E4 */ lhz r7, 0xe4(r7)
/* 00000C08 54E70739 */ rlwinm. r7, r7, 0, 0x1c, 0x1c
/* 00000C0C 40820008 */ bne lbl_00000C14
/* 00000C10 39600000 */ li r11, 0
lbl_00000C14:
/* 00000C14 2C0B0000 */ cmpwi r11, 0
/* 00000C18 4082001C */ bne lbl_00000C34
/* 00000C1C 3CE00000 */ lis r7, analogInputs@ha
/* 00000C20 38E70000 */ addi r7, r7, analogInputs@l
/* 00000C24 A0E70008 */ lhz r7, 8(r7)
/* 00000C28 54E70739 */ rlwinm. r7, r7, 0, 0x1c, 0x1c
/* 00000C2C 40820008 */ bne lbl_00000C34
/* 00000C30 39400000 */ li r10, 0
lbl_00000C34:
/* 00000C34 2C0A0000 */ cmpwi r10, 0
/* 00000C38 4082001C */ bne lbl_00000C54
/* 00000C3C 3CE00000 */ lis r7, analogInputs@ha
/* 00000C40 38E70000 */ addi r7, r7, analogInputs@l
/* 00000C44 A0E70012 */ lhz r7, 0x12(r7)
/* 00000C48 54E70739 */ rlwinm. r7, r7, 0, 0x1c, 0x1c
/* 00000C4C 40820008 */ bne lbl_00000C54
/* 00000C50 39200000 */ li r9, 0
lbl_00000C54:
/* 00000C54 2C090000 */ cmpwi r9, 0
/* 00000C58 4082001C */ bne lbl_00000C74
/* 00000C5C 3CE00000 */ lis r7, analogInputs@ha
/* 00000C60 38E70000 */ addi r7, r7, analogInputs@l
/* 00000C64 A0E7001C */ lhz r7, 0x1c(r7)
/* 00000C68 54E70739 */ rlwinm. r7, r7, 0, 0x1c, 0x1c
/* 00000C6C 40820008 */ bne lbl_00000C74
/* 00000C70 38A00000 */ li r5, 0
lbl_00000C74:
/* 00000C74 2C050000 */ cmpwi r5, 0
/* 00000C78 4082001C */ bne lbl_00000C94
/* 00000C7C 3CA00000 */ lis r5, analogInputs@ha
/* 00000C80 38A50000 */ addi r5, r5, analogInputs@l
/* 00000C84 A0A50026 */ lhz r5, 0x26(r5)
/* 00000C88 54A50739 */ rlwinm. r5, r5, 0, 0x1c, 0x1c
/* 00000C8C 40820008 */ bne lbl_00000C94
/* 00000C90 38800000 */ li r4, 0
lbl_00000C94:
/* 00000C94 2C040000 */ cmpwi r4, 0
/* 00000C98 41820008 */ beq lbl_00000CA0
/* 00000C9C 38600001 */ li r3, 1
lbl_00000CA0:
/* 00000CA0 2C030000 */ cmpwi r3, 0
/* 00000CA4 40820190 */ bne lbl_00000E34
/* 00000CA8 28060000 */ cmplwi r6, 0
/* 00000CAC 38600000 */ li r3, 0
/* 00000CB0 41820178 */ beq lbl_00000E28
/* 00000CB4 54C407FF */ clrlwi. r4, r6, 0x1f
/* 00000CB8 38800001 */ li r4, 1
/* 00000CBC 39230000 */ addi r9, r3, 0
/* 00000CC0 38A40000 */ addi r5, r4, 0
/* 00000CC4 39040000 */ addi r8, r4, 0
/* 00000CC8 41820040 */ beq lbl_00000D08
/* 00000CCC 3CE00000 */ lis r7, controllerInfo@ha
/* 00000CD0 38E70000 */ addi r7, r7, controllerInfo@l
/* 00000CD4 A0E70030 */ lhz r7, 0x30(r7)
/* 00000CD8 39440000 */ addi r10, r4, 0
/* 00000CDC 54E70739 */ rlwinm. r7, r7, 0, 0x1c, 0x1c
/* 00000CE0 4082001C */ bne lbl_00000CFC
/* 00000CE4 3CE00000 */ lis r7, analogInputs@ha
/* 00000CE8 38E70000 */ addi r7, r7, analogInputs@l
/* 00000CEC A0E70008 */ lhz r7, 8(r7)
/* 00000CF0 54E70739 */ rlwinm. r7, r7, 0, 0x1c, 0x1c
/* 00000CF4 40820008 */ bne lbl_00000CFC
/* 00000CF8 7C6A1B78 */ mr r10, r3
lbl_00000CFC:
/* 00000CFC 2C0A0000 */ cmpwi r10, 0
/* 00000D00 41820008 */ beq lbl_00000D08
/* 00000D04 39200001 */ li r9, 1
lbl_00000D08:
/* 00000D08 2C090000 */ cmpwi r9, 0
/* 00000D0C 40820058 */ bne lbl_00000D64
/* 00000D10 54C707BD */ rlwinm. r7, r6, 0, 0x1e, 0x1e
/* 00000D14 39200000 */ li r9, 0
/* 00000D18 41820040 */ beq lbl_00000D58
/* 00000D1C 3CE00000 */ lis r7, controllerInfo@ha
/* 00000D20 38E70000 */ addi r7, r7, controllerInfo@l
/* 00000D24 A0E7006C */ lhz r7, 0x6c(r7)
/* 00000D28 39400001 */ li r10, 1
/* 00000D2C 54E70739 */ rlwinm. r7, r7, 0, 0x1c, 0x1c
/* 00000D30 4082001C */ bne lbl_00000D4C
/* 00000D34 3CE00000 */ lis r7, analogInputs@ha
/* 00000D38 38E70000 */ addi r7, r7, analogInputs@l
/* 00000D3C A0E70012 */ lhz r7, 0x12(r7)
/* 00000D40 54E70739 */ rlwinm. r7, r7, 0, 0x1c, 0x1c
/* 00000D44 40820008 */ bne lbl_00000D4C
/* 00000D48 7D2A4B78 */ mr r10, r9
lbl_00000D4C:
/* 00000D4C 2C0A0000 */ cmpwi r10, 0
/* 00000D50 41820008 */ beq lbl_00000D58
/* 00000D54 39200001 */ li r9, 1
lbl_00000D58:
/* 00000D58 2C090000 */ cmpwi r9, 0
/* 00000D5C 40820008 */ bne lbl_00000D64
/* 00000D60 39000000 */ li r8, 0
lbl_00000D64:
/* 00000D64 2C080000 */ cmpwi r8, 0
/* 00000D68 40820058 */ bne lbl_00000DC0
/* 00000D6C 54C7077B */ rlwinm. r7, r6, 0, 0x1d, 0x1d
/* 00000D70 39000000 */ li r8, 0
/* 00000D74 41820040 */ beq lbl_00000DB4
/* 00000D78 3CE00000 */ lis r7, controllerInfo@ha
/* 00000D7C 38E70000 */ addi r7, r7, controllerInfo@l
/* 00000D80 A0E700A8 */ lhz r7, 0xa8(r7)
/* 00000D84 39200001 */ li r9, 1
/* 00000D88 54E70739 */ rlwinm. r7, r7, 0, 0x1c, 0x1c
/* 00000D8C 4082001C */ bne lbl_00000DA8
/* 00000D90 3CE00000 */ lis r7, analogInputs@ha
/* 00000D94 38E70000 */ addi r7, r7, analogInputs@l
/* 00000D98 A0E7001C */ lhz r7, 0x1c(r7)
/* 00000D9C 54E70739 */ rlwinm. r7, r7, 0, 0x1c, 0x1c
/* 00000DA0 40820008 */ bne lbl_00000DA8
/* 00000DA4 7D094378 */ mr r9, r8
lbl_00000DA8:
/* 00000DA8 2C090000 */ cmpwi r9, 0
/* 00000DAC 41820008 */ beq lbl_00000DB4
/* 00000DB0 39000001 */ li r8, 1
lbl_00000DB4:
/* 00000DB4 2C080000 */ cmpwi r8, 0
/* 00000DB8 40820008 */ bne lbl_00000DC0
/* 00000DBC 38A00000 */ li r5, 0
lbl_00000DC0:
/* 00000DC0 2C050000 */ cmpwi r5, 0
/* 00000DC4 40820058 */ bne lbl_00000E1C
/* 00000DC8 54C50739 */ rlwinm. r5, r6, 0, 0x1c, 0x1c
/* 00000DCC 38C00000 */ li r6, 0
/* 00000DD0 41820040 */ beq lbl_00000E10
/* 00000DD4 3CA00000 */ lis r5, controllerInfo@ha
/* 00000DD8 38A50000 */ addi r5, r5, controllerInfo@l
/* 00000DDC A0A500E4 */ lhz r5, 0xe4(r5)
/* 00000DE0 38E00001 */ li r7, 1
/* 00000DE4 54A50739 */ rlwinm. r5, r5, 0, 0x1c, 0x1c
/* 00000DE8 4082001C */ bne lbl_00000E04
/* 00000DEC 3CA00000 */ lis r5, analogInputs@ha
/* 00000DF0 38A50000 */ addi r5, r5, analogInputs@l
/* 00000DF4 A0A50026 */ lhz r5, 0x26(r5)
/* 00000DF8 54A50739 */ rlwinm. r5, r5, 0, 0x1c, 0x1c
/* 00000DFC 40820008 */ bne lbl_00000E04
/* 00000E00 7CC73378 */ mr r7, r6
lbl_00000E04:
/* 00000E04 2C070000 */ cmpwi r7, 0
/* 00000E08 41820008 */ beq lbl_00000E10
/* 00000E0C 38C00001 */ li r6, 1
lbl_00000E10:
/* 00000E10 2C060000 */ cmpwi r6, 0
/* 00000E14 40820008 */ bne lbl_00000E1C
/* 00000E18 38800000 */ li r4, 0
lbl_00000E1C:
/* 00000E1C 2C040000 */ cmpwi r4, 0
/* 00000E20 41820008 */ beq lbl_00000E28
/* 00000E24 38600001 */ li r3, 1
lbl_00000E28:
/* 00000E28 2C030000 */ cmpwi r3, 0
/* 00000E2C 40820008 */ bne lbl_00000E34
/* 00000E30 38000000 */ li r0, 0
lbl_00000E34:
/* 00000E34 7C060378 */ mr r6, r0
/* 00000E38 48000AC8 */ b lbl_00001900
lbl_00000E3C:
/* 00000E3C 80C50004 */ lwz r6, 4(r5)
/* 00000E40 38000001 */ li r0, 1
/* 00000E44 38600000 */ li r3, 0
/* 00000E48 28060000 */ cmplwi r6, 0
/* 00000E4C 40820110 */ bne lbl_00000F5C
/* 00000E50 3C800000 */ lis r4, controllerInfo@ha
/* 00000E54 39040000 */ addi r8, r4, controllerInfo@l
/* 00000E58 A0E80030 */ lhz r7, 0x30(r8)
/* 00000E5C 7C040378 */ mr r4, r0
/* 00000E60 7C050378 */ mr r5, r0
/* 00000E64 54E7077B */ rlwinm. r7, r7, 0, 0x1d, 0x1d
/* 00000E68 7C090378 */ mr r9, r0
/* 00000E6C 7C0A0378 */ mr r10, r0
/* 00000E70 7C0B0378 */ mr r11, r0
/* 00000E74 7C0C0378 */ mr r12, r0
/* 00000E78 7C1F0378 */ mr r31, r0
/* 00000E7C 40820014 */ bne lbl_00000E90
/* 00000E80 A0E8006C */ lhz r7, 0x6c(r8)
/* 00000E84 54E7077B */ rlwinm. r7, r7, 0, 0x1d, 0x1d
/* 00000E88 40820008 */ bne lbl_00000E90
/* 00000E8C 7C7F1B78 */ mr r31, r3
lbl_00000E90:
/* 00000E90 2C1F0000 */ cmpwi r31, 0
/* 00000E94 4082001C */ bne lbl_00000EB0
/* 00000E98 3CE00000 */ lis r7, controllerInfo@ha
/* 00000E9C 38E70000 */ addi r7, r7, controllerInfo@l
/* 00000EA0 A0E700A8 */ lhz r7, 0xa8(r7)
/* 00000EA4 54E7077B */ rlwinm. r7, r7, 0, 0x1d, 0x1d
/* 00000EA8 40820008 */ bne lbl_00000EB0
/* 00000EAC 39800000 */ li r12, 0
lbl_00000EB0:
/* 00000EB0 2C0C0000 */ cmpwi r12, 0
/* 00000EB4 4082001C */ bne lbl_00000ED0
/* 00000EB8 3CE00000 */ lis r7, controllerInfo@ha
/* 00000EBC 38E70000 */ addi r7, r7, controllerInfo@l
/* 00000EC0 A0E700E4 */ lhz r7, 0xe4(r7)
/* 00000EC4 54E7077B */ rlwinm. r7, r7, 0, 0x1d, 0x1d
/* 00000EC8 40820008 */ bne lbl_00000ED0
/* 00000ECC 39600000 */ li r11, 0
lbl_00000ED0:
/* 00000ED0 2C0B0000 */ cmpwi r11, 0
/* 00000ED4 4082001C */ bne lbl_00000EF0
/* 00000ED8 3CE00000 */ lis r7, analogInputs@ha
/* 00000EDC 38E70000 */ addi r7, r7, analogInputs@l
/* 00000EE0 A0E70008 */ lhz r7, 8(r7)
/* 00000EE4 54E7077B */ rlwinm. r7, r7, 0, 0x1d, 0x1d
/* 00000EE8 40820008 */ bne lbl_00000EF0
/* 00000EEC 39400000 */ li r10, 0
lbl_00000EF0:
/* 00000EF0 2C0A0000 */ cmpwi r10, 0
/* 00000EF4 4082001C */ bne lbl_00000F10
/* 00000EF8 3CE00000 */ lis r7, analogInputs@ha
/* 00000EFC 38E70000 */ addi r7, r7, analogInputs@l
/* 00000F00 A0E70012 */ lhz r7, 0x12(r7)
/* 00000F04 54E7077B */ rlwinm. r7, r7, 0, 0x1d, 0x1d
/* 00000F08 40820008 */ bne lbl_00000F10
/* 00000F0C 39200000 */ li r9, 0
lbl_00000F10:
/* 00000F10 2C090000 */ cmpwi r9, 0
/* 00000F14 4082001C */ bne lbl_00000F30
/* 00000F18 3CE00000 */ lis r7, analogInputs@ha
/* 00000F1C 38E70000 */ addi r7, r7, analogInputs@l
/* 00000F20 A0E7001C */ lhz r7, 0x1c(r7)
/* 00000F24 54E7077B */ rlwinm. r7, r7, 0, 0x1d, 0x1d
/* 00000F28 40820008 */ bne lbl_00000F30
/* 00000F2C 38A00000 */ li r5, 0
lbl_00000F30:
/* 00000F30 2C050000 */ cmpwi r5, 0
/* 00000F34 4082001C */ bne lbl_00000F50
/* 00000F38 3CA00000 */ lis r5, analogInputs@ha
/* 00000F3C 38A50000 */ addi r5, r5, analogInputs@l
/* 00000F40 A0A50026 */ lhz r5, 0x26(r5)
/* 00000F44 54A5077B */ rlwinm. r5, r5, 0, 0x1d, 0x1d
/* 00000F48 40820008 */ bne lbl_00000F50
/* 00000F4C 38800000 */ li r4, 0
lbl_00000F50:
/* 00000F50 2C040000 */ cmpwi r4, 0
/* 00000F54 41820008 */ beq lbl_00000F5C
/* 00000F58 38600001 */ li r3, 1
lbl_00000F5C:
/* 00000F5C 2C030000 */ cmpwi r3, 0
/* 00000F60 40820190 */ bne lbl_000010F0
/* 00000F64 28060000 */ cmplwi r6, 0
/* 00000F68 38600000 */ li r3, 0
/* 00000F6C 41820178 */ beq lbl_000010E4
/* 00000F70 54C407FF */ clrlwi. r4, r6, 0x1f
/* 00000F74 38800001 */ li r4, 1
/* 00000F78 39230000 */ addi r9, r3, 0
/* 00000F7C 38A40000 */ addi r5, r4, 0
/* 00000F80 39040000 */ addi r8, r4, 0
/* 00000F84 41820040 */ beq lbl_00000FC4
/* 00000F88 3CE00000 */ lis r7, controllerInfo@ha
/* 00000F8C 38E70000 */ addi r7, r7, controllerInfo@l
/* 00000F90 A0E70030 */ lhz r7, 0x30(r7)
/* 00000F94 39440000 */ addi r10, r4, 0
/* 00000F98 54E7077B */ rlwinm. r7, r7, 0, 0x1d, 0x1d
/* 00000F9C 4082001C */ bne lbl_00000FB8
/* 00000FA0 3CE00000 */ lis r7, analogInputs@ha
/* 00000FA4 38E70000 */ addi r7, r7, analogInputs@l
/* 00000FA8 A0E70008 */ lhz r7, 8(r7)
/* 00000FAC 54E7077B */ rlwinm. r7, r7, 0, 0x1d, 0x1d
/* 00000FB0 40820008 */ bne lbl_00000FB8
/* 00000FB4 7C6A1B78 */ mr r10, r3
lbl_00000FB8:
/* 00000FB8 2C0A0000 */ cmpwi r10, 0
/* 00000FBC 41820008 */ beq lbl_00000FC4
/* 00000FC0 39200001 */ li r9, 1
lbl_00000FC4:
/* 00000FC4 2C090000 */ cmpwi r9, 0
/* 00000FC8 40820058 */ bne lbl_00001020
/* 00000FCC 54C707BD */ rlwinm. r7, r6, 0, 0x1e, 0x1e
/* 00000FD0 39200000 */ li r9, 0
/* 00000FD4 41820040 */ beq lbl_00001014
/* 00000FD8 3CE00000 */ lis r7, controllerInfo@ha
/* 00000FDC 38E70000 */ addi r7, r7, controllerInfo@l
/* 00000FE0 A0E7006C */ lhz r7, 0x6c(r7)
/* 00000FE4 39400001 */ li r10, 1
/* 00000FE8 54E7077B */ rlwinm. r7, r7, 0, 0x1d, 0x1d
/* 00000FEC 4082001C */ bne lbl_00001008
/* 00000FF0 3CE00000 */ lis r7, analogInputs@ha
/* 00000FF4 38E70000 */ addi r7, r7, analogInputs@l
/* 00000FF8 A0E70012 */ lhz r7, 0x12(r7)
/* 00000FFC 54E7077B */ rlwinm. r7, r7, 0, 0x1d, 0x1d
/* 00001000 40820008 */ bne lbl_00001008
/* 00001004 7D2A4B78 */ mr r10, r9
lbl_00001008:
/* 00001008 2C0A0000 */ cmpwi r10, 0
/* 0000100C 41820008 */ beq lbl_00001014
/* 00001010 39200001 */ li r9, 1
lbl_00001014:
/* 00001014 2C090000 */ cmpwi r9, 0
/* 00001018 40820008 */ bne lbl_00001020
/* 0000101C 39000000 */ li r8, 0
lbl_00001020:
/* 00001020 2C080000 */ cmpwi r8, 0
/* 00001024 40820058 */ bne lbl_0000107C
/* 00001028 54C7077B */ rlwinm. r7, r6, 0, 0x1d, 0x1d
/* 0000102C 39000000 */ li r8, 0
/* 00001030 41820040 */ beq lbl_00001070
/* 00001034 3CE00000 */ lis r7, controllerInfo@ha
/* 00001038 38E70000 */ addi r7, r7, controllerInfo@l
/* 0000103C A0E700A8 */ lhz r7, 0xa8(r7)
/* 00001040 39200001 */ li r9, 1
/* 00001044 54E7077B */ rlwinm. r7, r7, 0, 0x1d, 0x1d
/* 00001048 4082001C */ bne lbl_00001064
/* 0000104C 3CE00000 */ lis r7, analogInputs@ha
/* 00001050 38E70000 */ addi r7, r7, analogInputs@l
/* 00001054 A0E7001C */ lhz r7, 0x1c(r7)
/* 00001058 54E7077B */ rlwinm. r7, r7, 0, 0x1d, 0x1d
/* 0000105C 40820008 */ bne lbl_00001064
/* 00001060 7D094378 */ mr r9, r8
lbl_00001064:
/* 00001064 2C090000 */ cmpwi r9, 0
/* 00001068 41820008 */ beq lbl_00001070
/* 0000106C 39000001 */ li r8, 1
lbl_00001070:
/* 00001070 2C080000 */ cmpwi r8, 0
/* 00001074 40820008 */ bne lbl_0000107C
/* 00001078 38A00000 */ li r5, 0
lbl_0000107C:
/* 0000107C 2C050000 */ cmpwi r5, 0
/* 00001080 40820058 */ bne lbl_000010D8
/* 00001084 54C50739 */ rlwinm. r5, r6, 0, 0x1c, 0x1c
/* 00001088 38C00000 */ li r6, 0
/* 0000108C 41820040 */ beq lbl_000010CC
/* 00001090 3CA00000 */ lis r5, controllerInfo@ha
/* 00001094 38A50000 */ addi r5, r5, controllerInfo@l
/* 00001098 A0A500E4 */ lhz r5, 0xe4(r5)
/* 0000109C 38E00001 */ li r7, 1
/* 000010A0 54A5077B */ rlwinm. r5, r5, 0, 0x1d, 0x1d
/* 000010A4 4082001C */ bne lbl_000010C0
/* 000010A8 3CA00000 */ lis r5, analogInputs@ha
/* 000010AC 38A50000 */ addi r5, r5, analogInputs@l
/* 000010B0 A0A50026 */ lhz r5, 0x26(r5)
/* 000010B4 54A5077B */ rlwinm. r5, r5, 0, 0x1d, 0x1d
/* 000010B8 40820008 */ bne lbl_000010C0
/* 000010BC 7CC73378 */ mr r7, r6
lbl_000010C0:
/* 000010C0 2C070000 */ cmpwi r7, 0
/* 000010C4 41820008 */ beq lbl_000010CC
/* 000010C8 38C00001 */ li r6, 1
lbl_000010CC:
/* 000010CC 2C060000 */ cmpwi r6, 0
/* 000010D0 40820008 */ bne lbl_000010D8
/* 000010D4 38800000 */ li r4, 0
lbl_000010D8:
/* 000010D8 2C040000 */ cmpwi r4, 0
/* 000010DC 41820008 */ beq lbl_000010E4
/* 000010E0 38600001 */ li r3, 1
lbl_000010E4:
/* 000010E4 2C030000 */ cmpwi r3, 0
/* 000010E8 40820008 */ bne lbl_000010F0
/* 000010EC 38000000 */ li r0, 0
lbl_000010F0:
/* 000010F0 7C060378 */ mr r6, r0
/* 000010F4 4800080C */ b lbl_00001900
lbl_000010F8:
/* 000010F8 80650004 */ lwz r3, 4(r5)
/* 000010FC 38000001 */ li r0, 1
/* 00001100 38C00000 */ li r6, 0
/* 00001104 28030000 */ cmplwi r3, 0
/* 00001108 40820080 */ bne lbl_00001188
/* 0000110C 3C800000 */ lis r4, controllerInfo@ha
/* 00001110 38A40000 */ addi r5, r4, controllerInfo@l
/* 00001114 A0850018 */ lhz r4, 0x18(r5)
/* 00001118 7C070378 */ mr r7, r0
/* 0000111C 7C080378 */ mr r8, r0
/* 00001120 54840673 */ rlwinm. r4, r4, 0, 0x19, 0x19
/* 00001124 7C090378 */ mr r9, r0
/* 00001128 40820014 */ bne lbl_0000113C
/* 0000112C A0850054 */ lhz r4, 0x54(r5)
/* 00001130 54840673 */ rlwinm. r4, r4, 0, 0x19, 0x19
/* 00001134 40820008 */ bne lbl_0000113C
/* 00001138 7CC93378 */ mr r9, r6
lbl_0000113C:
/* 0000113C 2C090000 */ cmpwi r9, 0
/* 00001140 4082001C */ bne lbl_0000115C
/* 00001144 3C800000 */ lis r4, controllerInfo@ha
/* 00001148 38840000 */ addi r4, r4, controllerInfo@l
/* 0000114C A0840090 */ lhz r4, 0x90(r4)
/* 00001150 54840673 */ rlwinm. r4, r4, 0, 0x19, 0x19
/* 00001154 40820008 */ bne lbl_0000115C
/* 00001158 39000000 */ li r8, 0
lbl_0000115C:
/* 0000115C 2C080000 */ cmpwi r8, 0
/* 00001160 4082001C */ bne lbl_0000117C
/* 00001164 3C800000 */ lis r4, controllerInfo@ha
/* 00001168 38840000 */ addi r4, r4, controllerInfo@l
/* 0000116C A08400CC */ lhz r4, 0xcc(r4)
/* 00001170 54840673 */ rlwinm. r4, r4, 0, 0x19, 0x19
/* 00001174 40820008 */ bne lbl_0000117C
/* 00001178 38E00000 */ li r7, 0
lbl_0000117C:
/* 0000117C 2C070000 */ cmpwi r7, 0
/* 00001180 41820008 */ beq lbl_00001188
/* 00001184 38C00001 */ li r6, 1
lbl_00001188:
/* 00001188 2C060000 */ cmpwi r6, 0
/* 0000118C 40820100 */ bne lbl_0000128C
/* 00001190 28030000 */ cmplwi r3, 0
/* 00001194 38A00000 */ li r5, 0
/* 00001198 418200E8 */ beq lbl_00001280
/* 0000119C 546407FF */ clrlwi. r4, r3, 0x1f
/* 000011A0 38C00001 */ li r6, 1
/* 000011A4 38E60000 */ addi r7, r6, 0
/* 000011A8 39060000 */ addi r8, r6, 0
/* 000011AC 39250000 */ addi r9, r5, 0
/* 000011B0 4182001C */ beq lbl_000011CC
/* 000011B4 3C800000 */ lis r4, controllerInfo@ha
/* 000011B8 38840000 */ addi r4, r4, controllerInfo@l
/* 000011BC A0840018 */ lhz r4, 0x18(r4)
/* 000011C0 54840673 */ rlwinm. r4, r4, 0, 0x19, 0x19
/* 000011C4 41820008 */ beq lbl_000011CC
/* 000011C8 7CC93378 */ mr r9, r6
lbl_000011CC:
/* 000011CC 2C090000 */ cmpwi r9, 0
/* 000011D0 40820034 */ bne lbl_00001204
/* 000011D4 546407BD */ rlwinm. r4, r3, 0, 0x1e, 0x1e
/* 000011D8 39200000 */ li r9, 0
/* 000011DC 4182001C */ beq lbl_000011F8
/* 000011E0 3C800000 */ lis r4, controllerInfo@ha
/* 000011E4 38840000 */ addi r4, r4, controllerInfo@l
/* 000011E8 A0840054 */ lhz r4, 0x54(r4)
/* 000011EC 54840673 */ rlwinm. r4, r4, 0, 0x19, 0x19
/* 000011F0 41820008 */ beq lbl_000011F8
/* 000011F4 39200001 */ li r9, 1
lbl_000011F8:
/* 000011F8 2C090000 */ cmpwi r9, 0
/* 000011FC 40820008 */ bne lbl_00001204
/* 00001200 39000000 */ li r8, 0
lbl_00001204:
/* 00001204 2C080000 */ cmpwi r8, 0
/* 00001208 40820034 */ bne lbl_0000123C
/* 0000120C 5464077B */ rlwinm. r4, r3, 0, 0x1d, 0x1d
/* 00001210 39000000 */ li r8, 0
/* 00001214 4182001C */ beq lbl_00001230
/* 00001218 3C800000 */ lis r4, controllerInfo@ha
/* 0000121C 38840000 */ addi r4, r4, controllerInfo@l
/* 00001220 A0840090 */ lhz r4, 0x90(r4)
/* 00001224 54840673 */ rlwinm. r4, r4, 0, 0x19, 0x19
/* 00001228 41820008 */ beq lbl_00001230
/* 0000122C 39000001 */ li r8, 1
lbl_00001230:
/* 00001230 2C080000 */ cmpwi r8, 0
/* 00001234 40820008 */ bne lbl_0000123C
/* 00001238 38E00000 */ li r7, 0
lbl_0000123C:
/* 0000123C 2C070000 */ cmpwi r7, 0
/* 00001240 40820034 */ bne lbl_00001274
/* 00001244 54630739 */ rlwinm. r3, r3, 0, 0x1c, 0x1c
/* 00001248 38800000 */ li r4, 0
/* 0000124C 4182001C */ beq lbl_00001268
/* 00001250 3C600000 */ lis r3, controllerInfo@ha
/* 00001254 38630000 */ addi r3, r3, controllerInfo@l
/* 00001258 A06300CC */ lhz r3, 0xcc(r3)
/* 0000125C 54630673 */ rlwinm. r3, r3, 0, 0x19, 0x19
/* 00001260 41820008 */ beq lbl_00001268
/* 00001264 38800001 */ li r4, 1
lbl_00001268:
/* 00001268 2C040000 */ cmpwi r4, 0
/* 0000126C 40820008 */ bne lbl_00001274
/* 00001270 38C00000 */ li r6, 0
lbl_00001274:
/* 00001274 2C060000 */ cmpwi r6, 0
/* 00001278 41820008 */ beq lbl_00001280
/* 0000127C 38A00001 */ li r5, 1
lbl_00001280:
/* 00001280 2C050000 */ cmpwi r5, 0
/* 00001284 40820008 */ bne lbl_0000128C
/* 00001288 38000000 */ li r0, 0
lbl_0000128C:
/* 0000128C 7C060378 */ mr r6, r0
/* 00001290 48000670 */ b lbl_00001900
lbl_00001294:
/* 00001294 80650004 */ lwz r3, 4(r5)
/* 00001298 38000001 */ li r0, 1
/* 0000129C 38C00000 */ li r6, 0
/* 000012A0 28030000 */ cmplwi r3, 0
/* 000012A4 40820080 */ bne lbl_00001324
/* 000012A8 3C800000 */ lis r4, controllerInfo@ha
/* 000012AC 38A40000 */ addi r5, r4, controllerInfo@l
/* 000012B0 A0850018 */ lhz r4, 0x18(r5)
/* 000012B4 7C070378 */ mr r7, r0
/* 000012B8 7C080378 */ mr r8, r0
/* 000012BC 548406B5 */ rlwinm. r4, r4, 0, 0x1a, 0x1a
/* 000012C0 7C090378 */ mr r9, r0
/* 000012C4 40820014 */ bne lbl_000012D8
/* 000012C8 A0850054 */ lhz r4, 0x54(r5)
/* 000012CC 548406B5 */ rlwinm. r4, r4, 0, 0x1a, 0x1a
/* 000012D0 40820008 */ bne lbl_000012D8
/* 000012D4 7CC93378 */ mr r9, r6
lbl_000012D8:
/* 000012D8 2C090000 */ cmpwi r9, 0
/* 000012DC 4082001C */ bne lbl_000012F8
/* 000012E0 3C800000 */ lis r4, controllerInfo@ha
/* 000012E4 38840000 */ addi r4, r4, controllerInfo@l
/* 000012E8 A0840090 */ lhz r4, 0x90(r4)
/* 000012EC 548406B5 */ rlwinm. r4, r4, 0, 0x1a, 0x1a
/* 000012F0 40820008 */ bne lbl_000012F8
/* 000012F4 39000000 */ li r8, 0
lbl_000012F8:
/* 000012F8 2C080000 */ cmpwi r8, 0
/* 000012FC 4082001C */ bne lbl_00001318
/* 00001300 3C800000 */ lis r4, controllerInfo@ha
/* 00001304 38840000 */ addi r4, r4, controllerInfo@l
/* 00001308 A08400CC */ lhz r4, 0xcc(r4)
/* 0000130C 548406B5 */ rlwinm. r4, r4, 0, 0x1a, 0x1a
/* 00001310 40820008 */ bne lbl_00001318
/* 00001314 38E00000 */ li r7, 0
lbl_00001318:
/* 00001318 2C070000 */ cmpwi r7, 0
/* 0000131C 41820008 */ beq lbl_00001324
/* 00001320 38C00001 */ li r6, 1
lbl_00001324:
/* 00001324 2C060000 */ cmpwi r6, 0
/* 00001328 40820100 */ bne lbl_00001428
/* 0000132C 28030000 */ cmplwi r3, 0
/* 00001330 38A00000 */ li r5, 0
/* 00001334 418200E8 */ beq lbl_0000141C
/* 00001338 546407FF */ clrlwi. r4, r3, 0x1f
/* 0000133C 38C00001 */ li r6, 1
/* 00001340 38E60000 */ addi r7, r6, 0
/* 00001344 39060000 */ addi r8, r6, 0
/* 00001348 39250000 */ addi r9, r5, 0
/* 0000134C 4182001C */ beq lbl_00001368
/* 00001350 3C800000 */ lis r4, controllerInfo@ha
/* 00001354 38840000 */ addi r4, r4, controllerInfo@l
/* 00001358 A0840018 */ lhz r4, 0x18(r4)
/* 0000135C 548406B5 */ rlwinm. r4, r4, 0, 0x1a, 0x1a
/* 00001360 41820008 */ beq lbl_00001368
/* 00001364 7CC93378 */ mr r9, r6
lbl_00001368:
/* 00001368 2C090000 */ cmpwi r9, 0
/* 0000136C 40820034 */ bne lbl_000013A0
/* 00001370 546407BD */ rlwinm. r4, r3, 0, 0x1e, 0x1e
/* 00001374 39200000 */ li r9, 0
/* 00001378 4182001C */ beq lbl_00001394
/* 0000137C 3C800000 */ lis r4, controllerInfo@ha
/* 00001380 38840000 */ addi r4, r4, controllerInfo@l
/* 00001384 A0840054 */ lhz r4, 0x54(r4)
/* 00001388 548406B5 */ rlwinm. r4, r4, 0, 0x1a, 0x1a
/* 0000138C 41820008 */ beq lbl_00001394
/* 00001390 39200001 */ li r9, 1
lbl_00001394:
/* 00001394 2C090000 */ cmpwi r9, 0
/* 00001398 40820008 */ bne lbl_000013A0
/* 0000139C 39000000 */ li r8, 0
lbl_000013A0:
/* 000013A0 2C080000 */ cmpwi r8, 0
/* 000013A4 40820034 */ bne lbl_000013D8
/* 000013A8 5464077B */ rlwinm. r4, r3, 0, 0x1d, 0x1d
/* 000013AC 39000000 */ li r8, 0
/* 000013B0 4182001C */ beq lbl_000013CC
/* 000013B4 3C800000 */ lis r4, controllerInfo@ha
/* 000013B8 38840000 */ addi r4, r4, controllerInfo@l
/* 000013BC A0840090 */ lhz r4, 0x90(r4)
/* 000013C0 548406B5 */ rlwinm. r4, r4, 0, 0x1a, 0x1a
/* 000013C4 41820008 */ beq lbl_000013CC
/* 000013C8 39000001 */ li r8, 1
lbl_000013CC:
/* 000013CC 2C080000 */ cmpwi r8, 0
/* 000013D0 40820008 */ bne lbl_000013D8
/* 000013D4 38E00000 */ li r7, 0
lbl_000013D8:
/* 000013D8 2C070000 */ cmpwi r7, 0
/* 000013DC 40820034 */ bne lbl_00001410
/* 000013E0 54630739 */ rlwinm. r3, r3, 0, 0x1c, 0x1c
/* 000013E4 38800000 */ li r4, 0
/* 000013E8 4182001C */ beq lbl_00001404
/* 000013EC 3C600000 */ lis r3, controllerInfo@ha
/* 000013F0 38630000 */ addi r3, r3, controllerInfo@l
/* 000013F4 A06300CC */ lhz r3, 0xcc(r3)
/* 000013F8 546306B5 */ rlwinm. r3, r3, 0, 0x1a, 0x1a
/* 000013FC 41820008 */ beq lbl_00001404
/* 00001400 38800001 */ li r4, 1
lbl_00001404:
/* 00001404 2C040000 */ cmpwi r4, 0
/* 00001408 40820008 */ bne lbl_00001410
/* 0000140C 38C00000 */ li r6, 0
lbl_00001410:
/* 00001410 2C060000 */ cmpwi r6, 0
/* 00001414 41820008 */ beq lbl_0000141C
/* 00001418 38A00001 */ li r5, 1
lbl_0000141C:
/* 0000141C 2C050000 */ cmpwi r5, 0
/* 00001420 40820008 */ bne lbl_00001428
/* 00001424 38000000 */ li r0, 0
lbl_00001428:
/* 00001428 7C060378 */ mr r6, r0
/* 0000142C 480004D4 */ b lbl_00001900
lbl_00001430:
/* 00001430 80650004 */ lwz r3, 4(r5)
/* 00001434 38000001 */ li r0, 1
/* 00001438 38C00000 */ li r6, 0
/* 0000143C 28030000 */ cmplwi r3, 0
/* 00001440 40820080 */ bne lbl_000014C0
/* 00001444 3C800000 */ lis r4, controllerInfo@ha
/* 00001448 38A40000 */ addi r5, r4, controllerInfo@l
/* 0000144C A0850018 */ lhz r4, 0x18(r5)
/* 00001450 7C070378 */ mr r7, r0
/* 00001454 7C080378 */ mr r8, r0
/* 00001458 548405EF */ rlwinm. r4, r4, 0, 0x17, 0x17
/* 0000145C 7C090378 */ mr r9, r0
/* 00001460 40820014 */ bne lbl_00001474
/* 00001464 A0850054 */ lhz r4, 0x54(r5)
/* 00001468 548405EF */ rlwinm. r4, r4, 0, 0x17, 0x17
/* 0000146C 40820008 */ bne lbl_00001474
/* 00001470 7CC93378 */ mr r9, r6
lbl_00001474:
/* 00001474 2C090000 */ cmpwi r9, 0
/* 00001478 4082001C */ bne lbl_00001494
/* 0000147C 3C800000 */ lis r4, controllerInfo@ha
/* 00001480 38840000 */ addi r4, r4, controllerInfo@l
/* 00001484 A0840090 */ lhz r4, 0x90(r4)
/* 00001488 548405EF */ rlwinm. r4, r4, 0, 0x17, 0x17
/* 0000148C 40820008 */ bne lbl_00001494
/* 00001490 39000000 */ li r8, 0
lbl_00001494:
/* 00001494 2C080000 */ cmpwi r8, 0
/* 00001498 4082001C */ bne lbl_000014B4
/* 0000149C 3C800000 */ lis r4, controllerInfo@ha
/* 000014A0 38840000 */ addi r4, r4, controllerInfo@l
/* 000014A4 A08400CC */ lhz r4, 0xcc(r4)
/* 000014A8 548405EF */ rlwinm. r4, r4, 0, 0x17, 0x17
/* 000014AC 40820008 */ bne lbl_000014B4
/* 000014B0 38E00000 */ li r7, 0
lbl_000014B4:
/* 000014B4 2C070000 */ cmpwi r7, 0
/* 000014B8 41820008 */ beq lbl_000014C0
/* 000014BC 38C00001 */ li r6, 1
lbl_000014C0:
/* 000014C0 2C060000 */ cmpwi r6, 0
/* 000014C4 40820100 */ bne lbl_000015C4
/* 000014C8 28030000 */ cmplwi r3, 0
/* 000014CC 38A00000 */ li r5, 0
/* 000014D0 418200E8 */ beq lbl_000015B8
/* 000014D4 546407FF */ clrlwi. r4, r3, 0x1f
/* 000014D8 38C00001 */ li r6, 1
/* 000014DC 38E60000 */ addi r7, r6, 0
/* 000014E0 39060000 */ addi r8, r6, 0
/* 000014E4 39250000 */ addi r9, r5, 0
/* 000014E8 4182001C */ beq lbl_00001504
/* 000014EC 3C800000 */ lis r4, controllerInfo@ha
/* 000014F0 38840000 */ addi r4, r4, controllerInfo@l
/* 000014F4 A0840018 */ lhz r4, 0x18(r4)
/* 000014F8 548405EF */ rlwinm. r4, r4, 0, 0x17, 0x17
/* 000014FC 41820008 */ beq lbl_00001504
/* 00001500 7CC93378 */ mr r9, r6
lbl_00001504:
/* 00001504 2C090000 */ cmpwi r9, 0
/* 00001508 40820034 */ bne lbl_0000153C
/* 0000150C 546407BD */ rlwinm. r4, r3, 0, 0x1e, 0x1e
/* 00001510 39200000 */ li r9, 0
/* 00001514 4182001C */ beq lbl_00001530
/* 00001518 3C800000 */ lis r4, controllerInfo@ha
/* 0000151C 38840000 */ addi r4, r4, controllerInfo@l
/* 00001520 A0840054 */ lhz r4, 0x54(r4)
/* 00001524 548405EF */ rlwinm. r4, r4, 0, 0x17, 0x17
/* 00001528 41820008 */ beq lbl_00001530
/* 0000152C 39200001 */ li r9, 1
lbl_00001530:
/* 00001530 2C090000 */ cmpwi r9, 0
/* 00001534 40820008 */ bne lbl_0000153C
/* 00001538 39000000 */ li r8, 0
lbl_0000153C:
/* 0000153C 2C080000 */ cmpwi r8, 0
/* 00001540 40820034 */ bne lbl_00001574
/* 00001544 5464077B */ rlwinm. r4, r3, 0, 0x1d, 0x1d
/* 00001548 39000000 */ li r8, 0
/* 0000154C 4182001C */ beq lbl_00001568
/* 00001550 3C800000 */ lis r4, controllerInfo@ha
/* 00001554 38840000 */ addi r4, r4, controllerInfo@l
/* 00001558 A0840090 */ lhz r4, 0x90(r4)
/* 0000155C 548405EF */ rlwinm. r4, r4, 0, 0x17, 0x17
/* 00001560 41820008 */ beq lbl_00001568
/* 00001564 39000001 */ li r8, 1
lbl_00001568:
/* 00001568 2C080000 */ cmpwi r8, 0
/* 0000156C 40820008 */ bne lbl_00001574
/* 00001570 38E00000 */ li r7, 0
lbl_00001574:
/* 00001574 2C070000 */ cmpwi r7, 0
/* 00001578 40820034 */ bne lbl_000015AC
/* 0000157C 54630739 */ rlwinm. r3, r3, 0, 0x1c, 0x1c
/* 00001580 38800000 */ li r4, 0
/* 00001584 4182001C */ beq lbl_000015A0
/* 00001588 3C600000 */ lis r3, controllerInfo@ha
/* 0000158C 38630000 */ addi r3, r3, controllerInfo@l
/* 00001590 A06300CC */ lhz r3, 0xcc(r3)
/* 00001594 546305EF */ rlwinm. r3, r3, 0, 0x17, 0x17
/* 00001598 41820008 */ beq lbl_000015A0
/* 0000159C 38800001 */ li r4, 1
lbl_000015A0:
/* 000015A0 2C040000 */ cmpwi r4, 0
/* 000015A4 40820008 */ bne lbl_000015AC
/* 000015A8 38C00000 */ li r6, 0
lbl_000015AC:
/* 000015AC 2C060000 */ cmpwi r6, 0
/* 000015B0 41820008 */ beq lbl_000015B8
/* 000015B4 38A00001 */ li r5, 1
lbl_000015B8:
/* 000015B8 2C050000 */ cmpwi r5, 0
/* 000015BC 40820008 */ bne lbl_000015C4
/* 000015C0 38000000 */ li r0, 0
lbl_000015C4:
/* 000015C4 7C060378 */ mr r6, r0
/* 000015C8 48000338 */ b lbl_00001900
lbl_000015CC:
/* 000015CC 80650004 */ lwz r3, 4(r5)
/* 000015D0 38000001 */ li r0, 1
/* 000015D4 38C00000 */ li r6, 0
/* 000015D8 28030000 */ cmplwi r3, 0
/* 000015DC 40820080 */ bne lbl_0000165C
/* 000015E0 3C800000 */ lis r4, controllerInfo@ha
/* 000015E4 38A40000 */ addi r5, r4, controllerInfo@l
/* 000015E8 A0850018 */ lhz r4, 0x18(r5)
/* 000015EC 7C070378 */ mr r7, r0
/* 000015F0 7C080378 */ mr r8, r0
/* 000015F4 548405AD */ rlwinm. r4, r4, 0, 0x16, 0x16
/* 000015F8 7C090378 */ mr r9, r0
/* 000015FC 40820014 */ bne lbl_00001610
/* 00001600 A0850054 */ lhz r4, 0x54(r5)
/* 00001604 548405AD */ rlwinm. r4, r4, 0, 0x16, 0x16
/* 00001608 40820008 */ bne lbl_00001610
/* 0000160C 7CC93378 */ mr r9, r6
lbl_00001610:
/* 00001610 2C090000 */ cmpwi r9, 0
/* 00001614 4082001C */ bne lbl_00001630
/* 00001618 3C800000 */ lis r4, controllerInfo@ha
/* 0000161C 38840000 */ addi r4, r4, controllerInfo@l
/* 00001620 A0840090 */ lhz r4, 0x90(r4)
/* 00001624 548405AD */ rlwinm. r4, r4, 0, 0x16, 0x16
/* 00001628 40820008 */ bne lbl_00001630
/* 0000162C 39000000 */ li r8, 0
lbl_00001630:
/* 00001630 2C080000 */ cmpwi r8, 0
/* 00001634 4082001C */ bne lbl_00001650
/* 00001638 3C800000 */ lis r4, controllerInfo@ha
/* 0000163C 38840000 */ addi r4, r4, controllerInfo@l
/* 00001640 A08400CC */ lhz r4, 0xcc(r4)
/* 00001644 548405AD */ rlwinm. r4, r4, 0, 0x16, 0x16
/* 00001648 40820008 */ bne lbl_00001650
/* 0000164C 38E00000 */ li r7, 0
lbl_00001650:
/* 00001650 2C070000 */ cmpwi r7, 0
/* 00001654 41820008 */ beq lbl_0000165C
/* 00001658 38C00001 */ li r6, 1
lbl_0000165C:
/* 0000165C 2C060000 */ cmpwi r6, 0
/* 00001660 40820100 */ bne lbl_00001760
/* 00001664 28030000 */ cmplwi r3, 0
/* 00001668 38A00000 */ li r5, 0
/* 0000166C 418200E8 */ beq lbl_00001754
/* 00001670 546407FF */ clrlwi. r4, r3, 0x1f
/* 00001674 38C00001 */ li r6, 1
/* 00001678 38E60000 */ addi r7, r6, 0
/* 0000167C 39060000 */ addi r8, r6, 0
/* 00001680 39250000 */ addi r9, r5, 0
/* 00001684 4182001C */ beq lbl_000016A0
/* 00001688 3C800000 */ lis r4, controllerInfo@ha
/* 0000168C 38840000 */ addi r4, r4, controllerInfo@l
/* 00001690 A0840018 */ lhz r4, 0x18(r4)
/* 00001694 548405AD */ rlwinm. r4, r4, 0, 0x16, 0x16
/* 00001698 41820008 */ beq lbl_000016A0
/* 0000169C 7CC93378 */ mr r9, r6
lbl_000016A0:
/* 000016A0 2C090000 */ cmpwi r9, 0
/* 000016A4 40820034 */ bne lbl_000016D8
/* 000016A8 546407BD */ rlwinm. r4, r3, 0, 0x1e, 0x1e
/* 000016AC 39200000 */ li r9, 0
/* 000016B0 4182001C */ beq lbl_000016CC
/* 000016B4 3C800000 */ lis r4, controllerInfo@ha
/* 000016B8 38840000 */ addi r4, r4, controllerInfo@l
/* 000016BC A0840054 */ lhz r4, 0x54(r4)
/* 000016C0 548405AD */ rlwinm. r4, r4, 0, 0x16, 0x16
/* 000016C4 41820008 */ beq lbl_000016CC
/* 000016C8 39200001 */ li r9, 1
lbl_000016CC:
/* 000016CC 2C090000 */ cmpwi r9, 0
/* 000016D0 40820008 */ bne lbl_000016D8
/* 000016D4 39000000 */ li r8, 0
lbl_000016D8:
/* 000016D8 2C080000 */ cmpwi r8, 0
/* 000016DC 40820034 */ bne lbl_00001710
/* 000016E0 5464077B */ rlwinm. r4, r3, 0, 0x1d, 0x1d
/* 000016E4 39000000 */ li r8, 0
/* 000016E8 4182001C */ beq lbl_00001704
/* 000016EC 3C800000 */ lis r4, controllerInfo@ha
/* 000016F0 38840000 */ addi r4, r4, controllerInfo@l
/* 000016F4 A0840090 */ lhz r4, 0x90(r4)
/* 000016F8 548405AD */ rlwinm. r4, r4, 0, 0x16, 0x16
/* 000016FC 41820008 */ beq lbl_00001704
/* 00001700 39000001 */ li r8, 1
lbl_00001704:
/* 00001704 2C080000 */ cmpwi r8, 0
/* 00001708 40820008 */ bne lbl_00001710
/* 0000170C 38E00000 */ li r7, 0
lbl_00001710:
/* 00001710 2C070000 */ cmpwi r7, 0
/* 00001714 40820034 */ bne lbl_00001748
/* 00001718 54630739 */ rlwinm. r3, r3, 0, 0x1c, 0x1c
/* 0000171C 38800000 */ li r4, 0
/* 00001720 4182001C */ beq lbl_0000173C
/* 00001724 3C600000 */ lis r3, controllerInfo@ha
/* 00001728 38630000 */ addi r3, r3, controllerInfo@l
/* 0000172C A06300CC */ lhz r3, 0xcc(r3)
/* 00001730 546305AD */ rlwinm. r3, r3, 0, 0x16, 0x16
/* 00001734 41820008 */ beq lbl_0000173C
/* 00001738 38800001 */ li r4, 1
lbl_0000173C:
/* 0000173C 2C040000 */ cmpwi r4, 0
/* 00001740 40820008 */ bne lbl_00001748
/* 00001744 38C00000 */ li r6, 0
lbl_00001748:
/* 00001748 2C060000 */ cmpwi r6, 0
/* 0000174C 41820008 */ beq lbl_00001754
/* 00001750 38A00001 */ li r5, 1
lbl_00001754:
/* 00001754 2C050000 */ cmpwi r5, 0
/* 00001758 40820008 */ bne lbl_00001760
/* 0000175C 38000000 */ li r0, 0
lbl_00001760:
/* 00001760 7C060378 */ mr r6, r0
/* 00001764 4800019C */ b lbl_00001900
lbl_00001768:
/* 00001768 80650004 */ lwz r3, 4(r5)
/* 0000176C 38000001 */ li r0, 1
/* 00001770 38C00000 */ li r6, 0
/* 00001774 28030000 */ cmplwi r3, 0
/* 00001778 40820080 */ bne lbl_000017F8
/* 0000177C 3C800000 */ lis r4, controllerInfo@ha
/* 00001780 38A40000 */ addi r5, r4, controllerInfo@l
/* 00001784 A0850018 */ lhz r4, 0x18(r5)
/* 00001788 7C070378 */ mr r7, r0
/* 0000178C 7C080378 */ mr r8, r0
/* 00001790 5484056B */ rlwinm. r4, r4, 0, 0x15, 0x15
/* 00001794 7C090378 */ mr r9, r0
/* 00001798 40820014 */ bne lbl_000017AC
/* 0000179C A0850054 */ lhz r4, 0x54(r5)
/* 000017A0 5484056B */ rlwinm. r4, r4, 0, 0x15, 0x15
/* 000017A4 40820008 */ bne lbl_000017AC
/* 000017A8 7CC93378 */ mr r9, r6
lbl_000017AC:
/* 000017AC 2C090000 */ cmpwi r9, 0
/* 000017B0 4082001C */ bne lbl_000017CC
/* 000017B4 3C800000 */ lis r4, controllerInfo@ha
/* 000017B8 38840000 */ addi r4, r4, controllerInfo@l
/* 000017BC A0840090 */ lhz r4, 0x90(r4)
/* 000017C0 5484056B */ rlwinm. r4, r4, 0, 0x15, 0x15
/* 000017C4 40820008 */ bne lbl_000017CC
/* 000017C8 39000000 */ li r8, 0
lbl_000017CC:
/* 000017CC 2C080000 */ cmpwi r8, 0
/* 000017D0 4082001C */ bne lbl_000017EC
/* 000017D4 3C800000 */ lis r4, controllerInfo@ha
/* 000017D8 38840000 */ addi r4, r4, controllerInfo@l
/* 000017DC A08400CC */ lhz r4, 0xcc(r4)
/* 000017E0 5484056B */ rlwinm. r4, r4, 0, 0x15, 0x15
/* 000017E4 40820008 */ bne lbl_000017EC
/* 000017E8 38E00000 */ li r7, 0
lbl_000017EC:
/* 000017EC 2C070000 */ cmpwi r7, 0
/* 000017F0 41820008 */ beq lbl_000017F8
/* 000017F4 38C00001 */ li r6, 1
lbl_000017F8:
/* 000017F8 2C060000 */ cmpwi r6, 0
/* 000017FC 40820100 */ bne lbl_000018FC
/* 00001800 28030000 */ cmplwi r3, 0
/* 00001804 38A00000 */ li r5, 0
/* 00001808 418200E8 */ beq lbl_000018F0
/* 0000180C 546407FF */ clrlwi. r4, r3, 0x1f
/* 00001810 38C00001 */ li r6, 1
/* 00001814 38E60000 */ addi r7, r6, 0
/* 00001818 39060000 */ addi r8, r6, 0
/* 0000181C 39250000 */ addi r9, r5, 0
/* 00001820 4182001C */ beq lbl_0000183C
/* 00001824 3C800000 */ lis r4, controllerInfo@ha
/* 00001828 38840000 */ addi r4, r4, controllerInfo@l
/* 0000182C A0840018 */ lhz r4, 0x18(r4)
/* 00001830 5484056B */ rlwinm. r4, r4, 0, 0x15, 0x15
/* 00001834 41820008 */ beq lbl_0000183C
/* 00001838 7CC93378 */ mr r9, r6
lbl_0000183C:
/* 0000183C 2C090000 */ cmpwi r9, 0
/* 00001840 40820034 */ bne lbl_00001874
/* 00001844 546407BD */ rlwinm. r4, r3, 0, 0x1e, 0x1e
/* 00001848 39200000 */ li r9, 0
/* 0000184C 4182001C */ beq lbl_00001868
/* 00001850 3C800000 */ lis r4, controllerInfo@ha
/* 00001854 38840000 */ addi r4, r4, controllerInfo@l
/* 00001858 A0840054 */ lhz r4, 0x54(r4)
/* 0000185C 5484056B */ rlwinm. r4, r4, 0, 0x15, 0x15
/* 00001860 41820008 */ beq lbl_00001868
/* 00001864 39200001 */ li r9, 1
lbl_00001868:
/* 00001868 2C090000 */ cmpwi r9, 0
/* 0000186C 40820008 */ bne lbl_00001874
/* 00001870 39000000 */ li r8, 0
lbl_00001874:
/* 00001874 2C080000 */ cmpwi r8, 0
/* 00001878 40820034 */ bne lbl_000018AC
/* 0000187C 5464077B */ rlwinm. r4, r3, 0, 0x1d, 0x1d
/* 00001880 39000000 */ li r8, 0
/* 00001884 4182001C */ beq lbl_000018A0
/* 00001888 3C800000 */ lis r4, controllerInfo@ha
/* 0000188C 38840000 */ addi r4, r4, controllerInfo@l
/* 00001890 A0840090 */ lhz r4, 0x90(r4)
/* 00001894 5484056B */ rlwinm. r4, r4, 0, 0x15, 0x15
/* 00001898 41820008 */ beq lbl_000018A0
/* 0000189C 39000001 */ li r8, 1
lbl_000018A0:
/* 000018A0 2C080000 */ cmpwi r8, 0
/* 000018A4 40820008 */ bne lbl_000018AC
/* 000018A8 38E00000 */ li r7, 0
lbl_000018AC:
/* 000018AC 2C070000 */ cmpwi r7, 0
/* 000018B0 40820034 */ bne lbl_000018E4
/* 000018B4 54630739 */ rlwinm. r3, r3, 0, 0x1c, 0x1c
/* 000018B8 38800000 */ li r4, 0
/* 000018BC 4182001C */ beq lbl_000018D8
/* 000018C0 3C600000 */ lis r3, controllerInfo@ha
/* 000018C4 38630000 */ addi r3, r3, controllerInfo@l
/* 000018C8 A06300CC */ lhz r3, 0xcc(r3)
/* 000018CC 5463056B */ rlwinm. r3, r3, 0, 0x15, 0x15
/* 000018D0 41820008 */ beq lbl_000018D8
/* 000018D4 38800001 */ li r4, 1
lbl_000018D8:
/* 000018D8 2C040000 */ cmpwi r4, 0
/* 000018DC 40820008 */ bne lbl_000018E4
/* 000018E0 38C00000 */ li r6, 0
lbl_000018E4:
/* 000018E4 2C060000 */ cmpwi r6, 0
/* 000018E8 41820008 */ beq lbl_000018F0
/* 000018EC 38A00001 */ li r5, 1
lbl_000018F0:
/* 000018F0 2C050000 */ cmpwi r5, 0
/* 000018F4 40820008 */ bne lbl_000018FC
/* 000018F8 38000000 */ li r0, 0
lbl_000018FC:
/* 000018FC 7C060378 */ mr r6, r0
lbl_00001900:
/* 00001900 83E10014 */ lwz r31, 0x14(r1)
/* 00001904 7CC33378 */ mr r3, r6
/* 00001908 38210018 */ addi r1, r1, 0x18
/* 0000190C 4E800020 */ blr 
