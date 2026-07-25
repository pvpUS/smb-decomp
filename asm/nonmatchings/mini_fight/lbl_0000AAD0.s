/* 0000AAD0 7C0802A6 */ mflr r0
/* 0000AAD4 3C600000 */ lis r3, lbl_10017520@ha
/* 0000AAD8 90010004 */ stw r0, 4(r1)
/* 0000AADC 9421FFF0 */ stwu r1, -0x10(r1)
/* 0000AAE0 93E1000C */ stw r31, 0xc(r1)
/* 0000AAE4 3BE30000 */ addi r31, r3, lbl_10017520@l
/* 0000AAE8 3C600000 */ lis r3, lbl_0001CBE0@ha
/* 0000AAEC A09F0146 */ lhz r4, 0x146(r31)
/* 0000AAF0 38030000 */ addi r0, r3, lbl_0001CBE0@l
/* 0000AAF4 B09F0144 */ sth r4, 0x144(r31)
/* 0000AAF8 A07F0144 */ lhz r3, 0x144(r31)
/* 0000AAFC 5463103A */ slwi r3, r3, 2
/* 0000AB00 7C601A14 */ add r3, r0, r3
/* 0000AB04 81830000 */ lwz r12, 0(r3)
/* 0000AB08 7D8803A6 */ mtlr r12
/* 0000AB0C 4E800021 */ blrl 
/* 0000AB10 3C600000 */ lis r3, modeCtrl@ha
/* 0000AB14 38830000 */ addi r4, r3, modeCtrl@l
/* 0000AB18 38000000 */ li r0, 0
/* 0000AB1C 9004002C */ stw r0, 0x2c(r4)
/* 0000AB20 3C600000 */ lis r3, lbl_801EED98@ha
/* 0000AB24 80030000 */ lwz r0, lbl_801EED98@l(r3)
/* 0000AB28 540007FF */ clrlwi. r0, r0, 0x1f
/* 0000AB2C 41820008 */ beq lbl_0000AB34
/* 0000AB30 4800F8AD */ bl lbl_0001A3DC
lbl_0000AB34:
/* 0000AB34 3C600000 */ lis r3, debugFlags@ha
/* 0000AB38 80030000 */ lwz r0, debugFlags@l(r3)
/* 0000AB3C 7000000A */ andi. r0, r0, 0xa
/* 0000AB40 40820008 */ bne lbl_0000AB48
/* 0000AB44 4BFFA1D1 */ bl lbl_00004D14
lbl_0000AB48:
/* 0000AB48 48002451 */ bl lbl_0000CF98
/* 0000AB4C 3C600000 */ lis r3, debugFlags@ha
/* 0000AB50 80030000 */ lwz r0, debugFlags@l(r3)
/* 0000AB54 7000000A */ andi. r0, r0, 0xa
/* 0000AB58 40820008 */ bne lbl_0000AB60
/* 0000AB5C 4800E909 */ bl lbl_00019464
lbl_0000AB60:
/* 0000AB60 3C600000 */ lis r3, debugFlags@ha
/* 0000AB64 80030000 */ lwz r0, debugFlags@l(r3)
/* 0000AB68 7000000A */ andi. r0, r0, 0xa
/* 0000AB6C 40820008 */ bne lbl_0000AB74
/* 0000AB70 48006E2D */ bl lbl_0001199C
lbl_0000AB74:
/* 0000AB74 841F088C */ lwzu r0, 0x88c(r31)
/* 0000AB78 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 0000AB7C 41820018 */ beq lbl_0000AB94
/* 0000AB80 38600067 */ li r3, 0x67
/* 0000AB84 4BFF55E1 */ bl u_play_sound_0
/* 0000AB88 801F0000 */ lwz r0, 0(r31)
/* 0000AB8C 540007FA */ rlwinm r0, r0, 0, 0x1f, 0x1d
/* 0000AB90 901F0000 */ stw r0, 0(r31)
lbl_0000AB94:
/* 0000AB94 80010014 */ lwz r0, 0x14(r1)
/* 0000AB98 83E1000C */ lwz r31, 0xc(r1)
/* 0000AB9C 38210010 */ addi r1, r1, 0x10
/* 0000ABA0 7C0803A6 */ mtlr r0
/* 0000ABA4 4E800020 */ blr 
