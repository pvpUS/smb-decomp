/* 00007778 3C600000 */ lis r3, g_poolInfo@ha
/* 0000777C 38630000 */ addi r3, r3, g_poolInfo@l
/* 00007780 8063000C */ lwz r3, 0xc(r3)
/* 00007784 88030000 */ lbz r0, 0(r3)
/* 00007788 7C000775 */ extsb. r0, r0
/* 0000778C 41820030 */ beq lbl_000077BC
/* 00007790 3C800000 */ lis r4, playerControllerIDs@ha
/* 00007794 80040000 */ lwz r0, playerControllerIDs@l(r4)
/* 00007798 3C800000 */ lis r4, controllerInfo@ha
/* 0000779C 38840000 */ addi r4, r4, controllerInfo@l
/* 000077A0 1C00003C */ mulli r0, r0, 0x3c
/* 000077A4 7C840214 */ add r4, r4, r0
/* 000077A8 A0040018 */ lhz r0, 0x18(r4)
/* 000077AC 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 000077B0 4182000C */ beq lbl_000077BC
/* 000077B4 38600001 */ li r3, 1
/* 000077B8 4E800020 */ blr 
lbl_000077BC:
/* 000077BC 88030001 */ lbz r0, 1(r3)
/* 000077C0 7C000775 */ extsb. r0, r0
/* 000077C4 41820034 */ beq lbl_000077F8
/* 000077C8 3C800000 */ lis r4, playerControllerIDs@ha
/* 000077CC 38840000 */ addi r4, r4, playerControllerIDs@l
/* 000077D0 80040004 */ lwz r0, 4(r4)
/* 000077D4 3C800000 */ lis r4, controllerInfo@ha
/* 000077D8 38840000 */ addi r4, r4, controllerInfo@l
/* 000077DC 1C00003C */ mulli r0, r0, 0x3c
/* 000077E0 7C840214 */ add r4, r4, r0
/* 000077E4 A0040018 */ lhz r0, 0x18(r4)
/* 000077E8 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 000077EC 4182000C */ beq lbl_000077F8
/* 000077F0 38600001 */ li r3, 1
/* 000077F4 4E800020 */ blr 
lbl_000077F8:
/* 000077F8 88030002 */ lbz r0, 2(r3)
/* 000077FC 7C000775 */ extsb. r0, r0
/* 00007800 41820034 */ beq lbl_00007834
/* 00007804 3C800000 */ lis r4, playerControllerIDs@ha
/* 00007808 38840000 */ addi r4, r4, playerControllerIDs@l
/* 0000780C 80040008 */ lwz r0, 8(r4)
/* 00007810 3C800000 */ lis r4, controllerInfo@ha
/* 00007814 38840000 */ addi r4, r4, controllerInfo@l
/* 00007818 1C00003C */ mulli r0, r0, 0x3c
/* 0000781C 7C840214 */ add r4, r4, r0
/* 00007820 A0040018 */ lhz r0, 0x18(r4)
/* 00007824 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00007828 4182000C */ beq lbl_00007834
/* 0000782C 38600001 */ li r3, 1
/* 00007830 4E800020 */ blr 
lbl_00007834:
/* 00007834 88030003 */ lbz r0, 3(r3)
/* 00007838 7C000775 */ extsb. r0, r0
/* 0000783C 41820034 */ beq lbl_00007870
/* 00007840 3C600000 */ lis r3, playerControllerIDs@ha
/* 00007844 38630000 */ addi r3, r3, playerControllerIDs@l
/* 00007848 8003000C */ lwz r0, 0xc(r3)
/* 0000784C 3C600000 */ lis r3, controllerInfo@ha
/* 00007850 38630000 */ addi r3, r3, controllerInfo@l
/* 00007854 1C00003C */ mulli r0, r0, 0x3c
/* 00007858 7C630214 */ add r3, r3, r0
/* 0000785C A0030018 */ lhz r0, 0x18(r3)
/* 00007860 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00007864 4182000C */ beq lbl_00007870
/* 00007868 38600001 */ li r3, 1
/* 0000786C 4E800020 */ blr 
lbl_00007870:
/* 00007870 38600000 */ li r3, 0
/* 00007874 4E800020 */ blr 
