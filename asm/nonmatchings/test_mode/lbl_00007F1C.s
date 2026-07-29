/* 00007F1C 3C600000 */ lis r3, controllerInfo@ha
/* 00007F20 38A30000 */ addi r5, r3, controllerInfo@l
/* 00007F24 A0C50030 */ lhz r6, 0x30(r5)
/* 00007F28 3C600000 */ lis r3, lbl_10000D60@ha
/* 00007F2C 38630000 */ addi r3, r3, lbl_10000D60@l
/* 00007F30 54C0077B */ rlwinm. r0, r6, 0, 0x1d, 0x1d
/* 00007F34 A0630000 */ lhz r3, 0(r3)
/* 00007F38 40820040 */ bne lbl_00007F78
/* 00007F3C 3C800000 */ lis r4, analogInputs@ha
/* 00007F40 38840000 */ addi r4, r4, analogInputs@l
/* 00007F44 A0040008 */ lhz r0, 8(r4)
/* 00007F48 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00007F4C 4082002C */ bne lbl_00007F78
/* 00007F50 A0050000 */ lhz r0, 0(r5)
/* 00007F54 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00007F58 40820010 */ bne lbl_00007F68
/* 00007F5C A0040000 */ lhz r0, 0(r4)
/* 00007F60 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00007F64 41820024 */ beq lbl_00007F88
lbl_00007F68:
/* 00007F68 3C800000 */ lis r4, analogInputs@ha
/* 00007F6C A0040000 */ lhz r0, analogInputs@l(r4)
/* 00007F70 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00007F74 41820014 */ beq lbl_00007F88
lbl_00007F78:
/* 00007F78 38630001 */ addi r3, r3, 1
/* 00007F7C 28030018 */ cmplwi r3, 0x18
/* 00007F80 41800008 */ blt lbl_00007F88
/* 00007F84 38600000 */ li r3, 0
lbl_00007F88:
/* 00007F88 54C00739 */ rlwinm. r0, r6, 0, 0x1c, 0x1c
/* 00007F8C 40820044 */ bne lbl_00007FD0
/* 00007F90 3C800000 */ lis r4, analogInputs@ha
/* 00007F94 38A40000 */ addi r5, r4, analogInputs@l
/* 00007F98 A0050008 */ lhz r0, 8(r5)
/* 00007F9C 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 00007FA0 40820030 */ bne lbl_00007FD0
/* 00007FA4 3C800000 */ lis r4, controllerInfo@ha
/* 00007FA8 A0040000 */ lhz r0, controllerInfo@l(r4)
/* 00007FAC 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 00007FB0 40820010 */ bne lbl_00007FC0
/* 00007FB4 A0050000 */ lhz r0, 0(r5)
/* 00007FB8 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 00007FBC 41820020 */ beq lbl_00007FDC
lbl_00007FC0:
/* 00007FC0 3C800000 */ lis r4, analogInputs@ha
/* 00007FC4 A0040000 */ lhz r0, analogInputs@l(r4)
/* 00007FC8 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00007FCC 41820010 */ beq lbl_00007FDC
lbl_00007FD0:
/* 00007FD0 3463FFFF */ addic. r3, r3, -1
/* 00007FD4 40800008 */ bge lbl_00007FDC
/* 00007FD8 38600017 */ li r3, 0x17
lbl_00007FDC:
/* 00007FDC 3C800000 */ lis r4, lbl_10000D60@ha
/* 00007FE0 B0640000 */ sth r3, lbl_10000D60@l(r4)
/* 00007FE4 4E800020 */ blr 
