/* 00007C54 7C0802A6 */ mflr r0
/* 00007C58 3C800000 */ lis r4, lbl_00011258@ha
/* 00007C5C 90010004 */ stw r0, 4(r1)
/* 00007C60 9421FFC8 */ stwu r1, -0x38(r1)
/* 00007C64 93E10034 */ stw r31, 0x34(r1)
/* 00007C68 3BE40000 */ addi r31, r4, lbl_00011258@l
/* 00007C6C 93C10030 */ stw r30, 0x30(r1)
/* 00007C70 7C7E1B78 */ mr r30, r3
/* 00007C74 389E001C */ addi r4, r30, 0x1c
/* 00007C78 80630004 */ lwz r3, 4(r3)
/* 00007C7C 801E0008 */ lwz r0, 8(r30)
/* 00007C80 907E0010 */ stw r3, 0x10(r30)
/* 00007C84 901E0014 */ stw r0, 0x14(r30)
/* 00007C88 801E000C */ lwz r0, 0xc(r30)
/* 00007C8C 901E0018 */ stw r0, 0x18(r30)
/* 00007C90 C0240000 */ lfs f1, 0(r4)
/* 00007C94 C0440004 */ lfs f2, 4(r4)
/* 00007C98 C0040008 */ lfs f0, 8(r4)
/* 00007C9C EC210072 */ fmuls f1, f1, f1
/* 00007CA0 EC2208BA */ fmadds f1, f2, f2, f1
/* 00007CA4 EC20083A */ fmadds f1, f0, f0, f1
/* 00007CA8 4BFF84B9 */ bl mathutil_sqrt
/* 00007CAC D03E00F8 */ stfs f1, 0xf8(r30)
/* 00007CB0 387E0030 */ addi r3, r30, 0x30
/* 00007CB4 389E00C8 */ addi r4, r30, 0xc8
/* 00007CB8 4BFF84A9 */ bl mathutil_mtx_copy
/* 00007CBC A81E002A */ lha r0, 0x2a(r30)
/* 00007CC0 5403083C */ slwi r3, r0, 1
/* 00007CC4 4BFF849D */ bl mathutil_sin
/* 00007CC8 C85F0040 */ lfd f2, 0x40(r31)
/* 00007CCC C01E001C */ lfs f0, 0x1c(r30)
/* 00007CD0 FC220072 */ fmul f1, f2, f1
/* 00007CD4 FC000828 */ fsub f0, f0, f1
/* 00007CD8 FC000018 */ frsp f0, f0
/* 00007CDC D01E001C */ stfs f0, 0x1c(r30)
/* 00007CE0 C03E0020 */ lfs f1, 0x20(r30)
/* 00007CE4 C01E006C */ lfs f0, 0x6c(r30)
/* 00007CE8 EC010028 */ fsubs f0, f1, f0
/* 00007CEC D01E0020 */ stfs f0, 0x20(r30)
/* 00007CF0 C03E0024 */ lfs f1, 0x24(r30)
/* 00007CF4 C81F0048 */ lfd f0, 0x48(r31)
/* 00007CF8 FC010040 */ fcmpo cr0, f1, f0
/* 00007CFC 4081000C */ ble lbl_00007D08
/* 00007D00 C01F0050 */ lfs f0, 0x50(r31)
/* 00007D04 D01E0024 */ stfs f0, 0x24(r30)
lbl_00007D08:
/* 00007D08 C03E001C */ lfs f1, 0x1c(r30)
/* 00007D0C C01E0004 */ lfs f0, 4(r30)
/* 00007D10 EC01002A */ fadds f0, f1, f0
/* 00007D14 D01E0004 */ stfs f0, 4(r30)
/* 00007D18 C03E0020 */ lfs f1, 0x20(r30)
/* 00007D1C C01E0008 */ lfs f0, 8(r30)
/* 00007D20 EC01002A */ fadds f0, f1, f0
/* 00007D24 D01E0008 */ stfs f0, 8(r30)
/* 00007D28 C03E0024 */ lfs f1, 0x24(r30)
/* 00007D2C C01E000C */ lfs f0, 0xc(r30)
/* 00007D30 EC01002A */ fadds f0, f1, f0
/* 00007D34 D01E000C */ stfs f0, 0xc(r30)
/* 00007D38 A87E0028 */ lha r3, 0x28(r30)
/* 00007D3C A81E0060 */ lha r0, 0x60(r30)
/* 00007D40 7C030214 */ add r0, r3, r0
/* 00007D44 B01E0028 */ sth r0, 0x28(r30)
/* 00007D48 A87E002A */ lha r3, 0x2a(r30)
/* 00007D4C A81E0062 */ lha r0, 0x62(r30)
/* 00007D50 7C030214 */ add r0, r3, r0
/* 00007D54 B01E002A */ sth r0, 0x2a(r30)
/* 00007D58 A87E002C */ lha r3, 0x2c(r30)
/* 00007D5C A81E0064 */ lha r0, 0x64(r30)
/* 00007D60 7C030214 */ add r0, r3, r0
/* 00007D64 B01E002C */ sth r0, 0x2c(r30)
/* 00007D68 A87E002C */ lha r3, 0x2c(r30)
/* 00007D6C 4BFF83F5 */ bl mathutil_mtxA_from_rotate_z
/* 00007D70 A87E002A */ lha r3, 0x2a(r30)
/* 00007D74 4BFF83ED */ bl mathutil_mtxA_rotate_y
/* 00007D78 A87E0028 */ lha r3, 0x28(r30)
/* 00007D7C 4BFF83E5 */ bl mathutil_mtxA_rotate_x
/* 00007D80 387E0098 */ addi r3, r30, 0x98
/* 00007D84 4BFF83DD */ bl mathutil_mtxA_to_quat
/* 00007D88 387E0004 */ addi r3, r30, 4
/* 00007D8C C0430000 */ lfs f2, 0(r3)
/* 00007D90 C0230004 */ lfs f1, 4(r3)
/* 00007D94 C0030008 */ lfs f0, 8(r3)
/* 00007D98 3C60E000 */ lis r3, 0xe000
/* 00007D9C D043000C */ stfs f2, 0xc(r3)
/* 00007DA0 D023001C */ stfs f1, 0x1c(r3)
/* 00007DA4 D003002C */ stfs f0, 0x2c(r3)
/* 00007DA8 387E0030 */ addi r3, r30, 0x30
/* 00007DAC 4BFF83B5 */ bl mathutil_mtxA_to_mtx
/* 00007DB0 387E00A8 */ addi r3, r30, 0xa8
/* 00007DB4 4BFF83AD */ bl mathutil_mtxA_to_quat
/* 00007DB8 7FC3F378 */ mr r3, r30
/* 00007DBC 48000529 */ bl lbl_000082E4
/* 00007DC0 2C030005 */ cmpwi r3, 5
/* 00007DC4 4182001C */ beq lbl_00007DE0
/* 00007DC8 2C03000F */ cmpwi r3, 0xf
/* 00007DCC 41820014 */ beq lbl_00007DE0
/* 00007DD0 2C030007 */ cmpwi r3, 7
/* 00007DD4 4182000C */ beq lbl_00007DE0
/* 00007DD8 2C03000A */ cmpwi r3, 0xa
/* 00007DDC 40820010 */ bne lbl_00007DEC
lbl_00007DE0:
/* 00007DE0 801E0094 */ lwz r0, 0x94(r30)
/* 00007DE4 60001000 */ ori r0, r0, 0x1000
/* 00007DE8 901E0094 */ stw r0, 0x94(r30)
lbl_00007DEC:
/* 00007DEC 807E00FC */ lwz r3, 0xfc(r30)
/* 00007DF0 80030024 */ lwz r0, 0x24(r3)
/* 00007DF4 2C00000A */ cmpwi r0, 0xa
/* 00007DF8 40820064 */ bne lbl_00007E5C
/* 00007DFC 801E0080 */ lwz r0, 0x80(r30)
/* 00007E00 5400073F */ clrlwi. r0, r0, 0x1c
/* 00007E04 40820058 */ bne lbl_00007E5C
/* 00007E08 807F0020 */ lwz r3, 0x20(r31)
/* 00007E0C 801F0024 */ lwz r0, 0x24(r31)
/* 00007E10 9061000C */ stw r3, 0xc(r1)
/* 00007E14 90010010 */ stw r0, 0x10(r1)
/* 00007E18 807F0028 */ lwz r3, 0x28(r31)
/* 00007E1C 801F002C */ lwz r0, 0x2c(r31)
/* 00007E20 90610014 */ stw r3, 0x14(r1)
/* 00007E24 90010018 */ stw r0, 0x18(r1)
/* 00007E28 807F0030 */ lwz r3, 0x30(r31)
/* 00007E2C 801F0034 */ lwz r0, 0x34(r31)
/* 00007E30 9061001C */ stw r3, 0x1c(r1)
/* 00007E34 90010020 */ stw r0, 0x20(r1)
/* 00007E38 807F0038 */ lwz r3, 0x38(r31)
/* 00007E3C 801F003C */ lwz r0, 0x3c(r31)
/* 00007E40 90610024 */ stw r3, 0x24(r1)
/* 00007E44 90010028 */ stw r0, 0x28(r1)
/* 00007E48 4BFF8319 */ bl rand
/* 00007E4C 546016FA */ rlwinm r0, r3, 2, 0x1b, 0x1d
/* 00007E50 3861000C */ addi r3, r1, 0xc
/* 00007E54 7C63002E */ lwzx r3, r3, r0
/* 00007E58 4BFF8309 */ bl u_play_sound_0
lbl_00007E5C:
/* 00007E5C 8001003C */ lwz r0, 0x3c(r1)
/* 00007E60 83E10034 */ lwz r31, 0x34(r1)
/* 00007E64 83C10030 */ lwz r30, 0x30(r1)
/* 00007E68 7C0803A6 */ mtlr r0
/* 00007E6C 38210038 */ addi r1, r1, 0x38
/* 00007E70 4E800020 */ blr 
