/* 00000E68 7C0802A6 */ mflr r0
/* 00000E6C 3C600000 */ lis r3, lbl_802F1C32@ha
/* 00000E70 90010004 */ stw r0, 4(r1)
/* 00000E74 9421FFF0 */ stwu r1, -0x10(r1)
/* 00000E78 93E1000C */ stw r31, 0xc(r1)
/* 00000E7C 88030000 */ lbz r0, lbl_802F1C32@l(r3)
/* 00000E80 3C600000 */ lis r3, lbl_10000000@ha
/* 00000E84 3BE30000 */ addi r31, r3, lbl_10000000@l
/* 00000E88 7C040774 */ extsb r4, r0
/* 00000E8C 1C040006 */ mulli r0, r4, 6
/* 00000E90 7C7F0214 */ add r3, r31, r0
/* 00000E94 88030A66 */ lbz r0, 0xa66(r3)
/* 00000E98 7C000775 */ extsb. r0, r0
/* 00000E9C 41820058 */ beq lbl_00000EF4
/* 00000EA0 881F000A */ lbz r0, 0xa(r31)
/* 00000EA4 2C000019 */ cmpwi r0, 0x19
/* 00000EA8 40820038 */ bne lbl_00000EE0
/* 00000EAC 20040001 */ subfic r0, r4, 1
/* 00000EB0 3C600000 */ lis r3, playerControllerIDs@ha
/* 00000EB4 5404103A */ slwi r4, r0, 2
/* 00000EB8 38030000 */ addi r0, r3, playerControllerIDs@l
/* 00000EBC 7C602214 */ add r3, r0, r4
/* 00000EC0 80830000 */ lwz r4, 0(r3)
/* 00000EC4 3C600000 */ lis r3, controllerInfo@ha
/* 00000EC8 38030000 */ addi r0, r3, controllerInfo@l
/* 00000ECC 1C64003C */ mulli r3, r4, 0x3c
/* 00000ED0 7C001A14 */ add r0, r0, r3
/* 00000ED4 3C7F0001 */ addis r3, r31, 1
/* 00000ED8 90039C88 */ stw r0, -0x6378(r3)
/* 00000EDC 48000044 */ b lbl_00000F20
lbl_00000EE0:
/* 00000EE0 480187AD */ bl lbl_0001968C
/* 00000EE4 3C7F0001 */ addis r3, r31, 1
/* 00000EE8 38039C8C */ addi r0, r3, -25460
/* 00000EEC 90039C88 */ stw r0, -0x6378(r3)
/* 00000EF0 48000030 */ b lbl_00000F20
lbl_00000EF4:
/* 00000EF4 3C600000 */ lis r3, playerControllerIDs@ha
/* 00000EF8 5484103A */ slwi r4, r4, 2
/* 00000EFC 38030000 */ addi r0, r3, playerControllerIDs@l
/* 00000F00 7C602214 */ add r3, r0, r4
/* 00000F04 80830000 */ lwz r4, 0(r3)
/* 00000F08 3C600000 */ lis r3, controllerInfo@ha
/* 00000F0C 38030000 */ addi r0, r3, controllerInfo@l
/* 00000F10 1C64003C */ mulli r3, r4, 0x3c
/* 00000F14 7C001A14 */ add r0, r0, r3
/* 00000F18 3C7F0001 */ addis r3, r31, 1
/* 00000F1C 90039C88 */ stw r0, -0x6378(r3)
lbl_00000F20:
/* 00000F20 80010014 */ lwz r0, 0x14(r1)
/* 00000F24 83E1000C */ lwz r31, 0xc(r1)
/* 00000F28 38210010 */ addi r1, r1, 0x10
/* 00000F2C 7C0803A6 */ mtlr r0
/* 00000F30 4E800020 */ blr 
