/* 000096B4 3C600000 */ lis r3, g_poolInfo@ha
/* 000096B8 38630000 */ addi r3, r3, g_poolInfo@l
/* 000096BC 8063000C */ lwz r3, 0xc(r3)
/* 000096C0 88030000 */ lbz r0, 0(r3)
/* 000096C4 7C000775 */ extsb. r0, r0
/* 000096C8 41820030 */ beq lbl_000096F8
/* 000096CC 3C800000 */ lis r4, playerControllerIDs@ha
/* 000096D0 80040000 */ lwz r0, playerControllerIDs@l(r4)
/* 000096D4 3C800000 */ lis r4, controllerInfo@ha
/* 000096D8 38840000 */ addi r4, r4, controllerInfo@l
/* 000096DC 1C00003C */ mulli r0, r0, 0x3c
/* 000096E0 7C840214 */ add r4, r4, r0
/* 000096E4 A0040018 */ lhz r0, 0x18(r4)
/* 000096E8 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 000096EC 4182000C */ beq lbl_000096F8
/* 000096F0 38600001 */ li r3, 1
/* 000096F4 4E800020 */ blr 
lbl_000096F8:
/* 000096F8 88030001 */ lbz r0, 1(r3)
/* 000096FC 7C000775 */ extsb. r0, r0
/* 00009700 41820034 */ beq lbl_00009734
/* 00009704 3C800000 */ lis r4, playerControllerIDs@ha
/* 00009708 38840000 */ addi r4, r4, playerControllerIDs@l
/* 0000970C 80040004 */ lwz r0, 4(r4)
/* 00009710 3C800000 */ lis r4, controllerInfo@ha
/* 00009714 38840000 */ addi r4, r4, controllerInfo@l
/* 00009718 1C00003C */ mulli r0, r0, 0x3c
/* 0000971C 7C840214 */ add r4, r4, r0
/* 00009720 A0040018 */ lhz r0, 0x18(r4)
/* 00009724 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00009728 4182000C */ beq lbl_00009734
/* 0000972C 38600001 */ li r3, 1
/* 00009730 4E800020 */ blr 
lbl_00009734:
/* 00009734 88030002 */ lbz r0, 2(r3)
/* 00009738 7C000775 */ extsb. r0, r0
/* 0000973C 41820034 */ beq lbl_00009770
/* 00009740 3C800000 */ lis r4, playerControllerIDs@ha
/* 00009744 38840000 */ addi r4, r4, playerControllerIDs@l
/* 00009748 80040008 */ lwz r0, 8(r4)
/* 0000974C 3C800000 */ lis r4, controllerInfo@ha
/* 00009750 38840000 */ addi r4, r4, controllerInfo@l
/* 00009754 1C00003C */ mulli r0, r0, 0x3c
/* 00009758 7C840214 */ add r4, r4, r0
/* 0000975C A0040018 */ lhz r0, 0x18(r4)
/* 00009760 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00009764 4182000C */ beq lbl_00009770
/* 00009768 38600001 */ li r3, 1
/* 0000976C 4E800020 */ blr 
lbl_00009770:
/* 00009770 88030003 */ lbz r0, 3(r3)
/* 00009774 7C000775 */ extsb. r0, r0
/* 00009778 41820034 */ beq lbl_000097AC
/* 0000977C 3C600000 */ lis r3, playerControllerIDs@ha
/* 00009780 38630000 */ addi r3, r3, playerControllerIDs@l
/* 00009784 8003000C */ lwz r0, 0xc(r3)
/* 00009788 3C600000 */ lis r3, controllerInfo@ha
/* 0000978C 38630000 */ addi r3, r3, controllerInfo@l
/* 00009790 1C00003C */ mulli r0, r0, 0x3c
/* 00009794 7C630214 */ add r3, r3, r0
/* 00009798 A0030018 */ lhz r0, 0x18(r3)
/* 0000979C 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 000097A0 4182000C */ beq lbl_000097AC
/* 000097A4 38600001 */ li r3, 1
/* 000097A8 4E800020 */ blr 
lbl_000097AC:
/* 000097AC 38600000 */ li r3, 0
/* 000097B0 4E800020 */ blr 
