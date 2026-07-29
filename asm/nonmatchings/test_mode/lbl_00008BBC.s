/* 00008BBC 7C0802A6 */ mflr r0
/* 00008BC0 3C600000 */ lis r3, modeCtrl@ha
/* 00008BC4 90010004 */ stw r0, 4(r1)
/* 00008BC8 38830000 */ addi r4, r3, modeCtrl@l
/* 00008BCC 3C600000 */ lis r3, lbl_10000000@ha
/* 00008BD0 9421FEC0 */ stwu r1, -0x140(r1)
/* 00008BD4 93E1013C */ stw r31, 0x13c(r1)
/* 00008BD8 93C10138 */ stw r30, 0x138(r1)
/* 00008BDC 3BC30000 */ addi r30, r3, lbl_10000000@l
/* 00008BE0 93A10134 */ stw r29, 0x134(r1)
/* 00008BE4 93810130 */ stw r28, 0x130(r1)
/* 00008BE8 3B840008 */ addi r28, r4, 8
/* 00008BEC 80040008 */ lwz r0, 8(r4)
/* 00008BF0 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00008BF4 40820220 */ bne lbl_00008E14
/* 00008BF8 3C600000 */ lis r3, controllerInfo@ha
/* 00008BFC 38A30000 */ addi r5, r3, controllerInfo@l
/* 00008C00 80640010 */ lwz r3, 0x10(r4)
/* 00008C04 A0C50030 */ lhz r6, 0x30(r5)
/* 00008C08 3BA40010 */ addi r29, r4, 0x10
/* 00008C0C 54C00739 */ rlwinm. r0, r6, 0, 0x1c, 0x1c
/* 00008C10 40820040 */ bne lbl_00008C50
/* 00008C14 3C800000 */ lis r4, analogInputs@ha
/* 00008C18 38840000 */ addi r4, r4, analogInputs@l
/* 00008C1C A0040008 */ lhz r0, 8(r4)
/* 00008C20 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 00008C24 4082002C */ bne lbl_00008C50
/* 00008C28 A0050000 */ lhz r0, 0(r5)
/* 00008C2C 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 00008C30 40820010 */ bne lbl_00008C40
/* 00008C34 A0040000 */ lhz r0, 0(r4)
/* 00008C38 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 00008C3C 41820020 */ beq lbl_00008C5C
lbl_00008C40:
/* 00008C40 3C800000 */ lis r4, analogInputs@ha
/* 00008C44 A0040000 */ lhz r0, analogInputs@l(r4)
/* 00008C48 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00008C4C 41820010 */ beq lbl_00008C5C
lbl_00008C50:
/* 00008C50 3463FFFF */ addic. r3, r3, -1
/* 00008C54 40800008 */ bge lbl_00008C5C
/* 00008C58 38600008 */ li r3, 8
lbl_00008C5C:
/* 00008C5C 54C0077B */ rlwinm. r0, r6, 0, 0x1d, 0x1d
/* 00008C60 40820044 */ bne lbl_00008CA4
/* 00008C64 3C800000 */ lis r4, analogInputs@ha
/* 00008C68 38A40000 */ addi r5, r4, analogInputs@l
/* 00008C6C A0050008 */ lhz r0, 8(r5)
/* 00008C70 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00008C74 40820030 */ bne lbl_00008CA4
/* 00008C78 3C800000 */ lis r4, controllerInfo@ha
/* 00008C7C A0040000 */ lhz r0, controllerInfo@l(r4)
/* 00008C80 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00008C84 40820010 */ bne lbl_00008C94
/* 00008C88 A0050000 */ lhz r0, 0(r5)
/* 00008C8C 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00008C90 41820024 */ beq lbl_00008CB4
lbl_00008C94:
/* 00008C94 3C800000 */ lis r4, analogInputs@ha
/* 00008C98 A0040000 */ lhz r0, analogInputs@l(r4)
/* 00008C9C 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00008CA0 41820014 */ beq lbl_00008CB4
lbl_00008CA4:
/* 00008CA4 38630001 */ addi r3, r3, 1
/* 00008CA8 28030009 */ cmplwi r3, 9
/* 00008CAC 41800008 */ blt lbl_00008CB4
/* 00008CB0 38600000 */ li r3, 0
lbl_00008CB4:
/* 00008CB4 3C800000 */ lis r4, controllerInfo@ha
/* 00008CB8 907D0000 */ stw r3, 0(r29)
/* 00008CBC 38640000 */ addi r3, r4, controllerInfo@l
/* 00008CC0 A0030018 */ lhz r0, 0x18(r3)
/* 00008CC4 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00008CC8 41820258 */ beq lbl_00008F20
/* 00008CCC 4BFF7491 */ bl create_sprite
/* 00008CD0 7C7F1B79 */ or. r31, r3, r3
/* 00008CD4 41820130 */ beq lbl_00008E04
/* 00008CD8 801D0000 */ lwz r0, 0(r29)
/* 00008CDC 3C800000 */ lis r4, lbl_00014714@ha
/* 00008CE0 3C600000 */ lis r3, lbl_000147EC@ha
/* 00008CE4 4CC63182 */ crclr 6
/* 00008CE8 1CA0000C */ mulli r5, r0, 0xc
/* 00008CEC 38040000 */ addi r0, r4, lbl_00014714@l
/* 00008CF0 7FA02A14 */ add r29, r0, r5
/* 00008CF4 38830000 */ addi r4, r3, lbl_000147EC@l
/* 00008CF8 A0BD0004 */ lhz r5, 4(r29)
/* 00008CFC A0DD0006 */ lhz r6, 6(r29)
/* 00008D00 3861000C */ addi r3, r1, 0xc
/* 00008D04 4BFF7459 */ bl sprintf
/* 00008D08 3C600000 */ lis r3, modeCtrl@ha
/* 00008D0C A0DD0004 */ lhz r6, 4(r29)
/* 00008D10 38630000 */ addi r3, r3, modeCtrl@l
/* 00008D14 A0FD0006 */ lhz r7, 6(r29)
/* 00008D18 80A30044 */ lwz r5, 0x44(r3)
/* 00008D1C 387E0D6C */ addi r3, r30, 0xd6c
/* 00008D20 3881000C */ addi r4, r1, 0xc
/* 00008D24 38A5FFFF */ addi r5, r5, -1
/* 00008D28 39000005 */ li r8, 5
/* 00008D2C 4BFF7431 */ bl preview_create_with_allocated_tex
/* 00008D30 381E0D6C */ addi r0, r30, 0xd6c
/* 00008D34 901F002C */ stw r0, 0x2c(r31)
/* 00008D38 3C600000 */ lis r3, lbl_0000FEC8@ha
/* 00008D3C 3C800000 */ lis r4, lbl_00010070@ha
/* 00008D40 A01D0004 */ lhz r0, 4(r29)
/* 00008D44 3D200000 */ lis r9, lbl_00010078@ha
/* 00008D48 C8230000 */ lfd f1, lbl_0000FEC8@l(r3)
/* 00008D4C 3CA00000 */ lis r5, lbl_00008ADC@ha
/* 00008D50 9001012C */ stw r0, 0x12c(r1)
/* 00008D54 3D604330 */ lis r11, 0x4330
/* 00008D58 C8440000 */ lfd f2, lbl_00010070@l(r4)
/* 00008D5C 91610128 */ stw r11, 0x128(r1)
/* 00008D60 3C600000 */ lis r3, lbl_00008B44@ha
/* 00008D64 3C800000 */ lis r4, lbl_00008B00@ha
/* 00008D68 C8010128 */ lfd f0, 0x128(r1)
/* 00008D6C 39490000 */ addi r10, r9, lbl_00010078@l
/* 00008D70 3D000000 */ lis r8, lbl_0000FEC8@ha
/* 00008D74 FC000828 */ fsub f0, f0, f1
/* 00008D78 38030000 */ addi r0, r3, lbl_00008B44@l
/* 00008D7C 3CE00000 */ lis r7, lbl_0000FEC8@ha
/* 00008D80 3CC00000 */ lis r6, lbl_0000FEC8@ha
/* 00008D84 FC020028 */ fsub f0, f2, f0
/* 00008D88 38A50000 */ addi r5, r5, lbl_00008ADC@l
/* 00008D8C 38840000 */ addi r4, r4, lbl_00008B00@l
/* 00008D90 FC000018 */ frsp f0, f0
/* 00008D94 D01F0004 */ stfs f0, 4(r31)
/* 00008D98 A13D0006 */ lhz r9, 6(r29)
/* 00008D9C C8280000 */ lfd f1, lbl_0000FEC8@l(r8)
/* 00008DA0 91210124 */ stw r9, 0x124(r1)
/* 00008DA4 C84A0000 */ lfd f2, 0(r10)
/* 00008DA8 91610120 */ stw r11, 0x120(r1)
/* 00008DAC C8010120 */ lfd f0, 0x120(r1)
/* 00008DB0 FC000828 */ fsub f0, f0, f1
/* 00008DB4 FC020028 */ fsub f0, f2, f0
/* 00008DB8 FC000018 */ frsp f0, f0
/* 00008DBC D01F0008 */ stfs f0, 8(r31)
/* 00008DC0 A07D0004 */ lhz r3, 4(r29)
/* 00008DC4 C8270000 */ lfd f1, lbl_0000FEC8@l(r7)
/* 00008DC8 9061011C */ stw r3, 0x11c(r1)
/* 00008DCC 91610118 */ stw r11, 0x118(r1)
/* 00008DD0 C8010118 */ lfd f0, 0x118(r1)
/* 00008DD4 EC000828 */ fsubs f0, f0, f1
/* 00008DD8 D01F0040 */ stfs f0, 0x40(r31)
/* 00008DDC A07D0006 */ lhz r3, 6(r29)
/* 00008DE0 C8260000 */ lfd f1, lbl_0000FEC8@l(r6)
/* 00008DE4 90610114 */ stw r3, 0x114(r1)
/* 00008DE8 91610110 */ stw r11, 0x110(r1)
/* 00008DEC C8010110 */ lfd f0, 0x110(r1)
/* 00008DF0 EC000828 */ fsubs f0, f0, f1
/* 00008DF4 D01F0044 */ stfs f0, 0x44(r31)
/* 00008DF8 90BF0034 */ stw r5, 0x34(r31)
/* 00008DFC 909F0038 */ stw r4, 0x38(r31)
/* 00008E00 901F0030 */ stw r0, 0x30(r31)
lbl_00008E04:
/* 00008E04 801C0000 */ lwz r0, 0(r28)
/* 00008E08 60000004 */ ori r0, r0, 4
/* 00008E0C 901C0000 */ stw r0, 0(r28)
/* 00008E10 48000110 */ b lbl_00008F20
lbl_00008E14:
/* 00008E14 3C600000 */ lis r3, controllerInfo@ha
/* 00008E18 80040044 */ lwz r0, 0x44(r4)
/* 00008E1C 38A30000 */ addi r5, r3, controllerInfo@l
/* 00008E20 A0C50030 */ lhz r6, 0x30(r5)
/* 00008E24 3BA40044 */ addi r29, r4, 0x44
/* 00008E28 7C1F0378 */ mr r31, r0
/* 00008E2C 54C307FF */ clrlwi. r3, r6, 0x1f
/* 00008E30 40820044 */ bne lbl_00008E74
/* 00008E34 3C600000 */ lis r3, analogInputs@ha
/* 00008E38 38830000 */ addi r4, r3, analogInputs@l
/* 00008E3C A0640008 */ lhz r3, 8(r4)
/* 00008E40 546307FF */ clrlwi. r3, r3, 0x1f
/* 00008E44 40820030 */ bne lbl_00008E74
/* 00008E48 A0650000 */ lhz r3, 0(r5)
/* 00008E4C 546307FF */ clrlwi. r3, r3, 0x1f
/* 00008E50 40820010 */ bne lbl_00008E60
/* 00008E54 A0640000 */ lhz r3, 0(r4)
/* 00008E58 546307FF */ clrlwi. r3, r3, 0x1f
/* 00008E5C 41820028 */ beq lbl_00008E84
lbl_00008E60:
/* 00008E60 3C600000 */ lis r3, analogInputs@ha
/* 00008E64 38630000 */ addi r3, r3, analogInputs@l
/* 00008E68 A0630000 */ lhz r3, 0(r3)
/* 00008E6C 546305AD */ rlwinm. r3, r3, 0, 0x16, 0x16
/* 00008E70 41820014 */ beq lbl_00008E84
lbl_00008E74:
/* 00008E74 3BFFFFFF */ addi r31, r31, -1
/* 00008E78 2C1F0001 */ cmpwi r31, 1
/* 00008E7C 40800008 */ bge lbl_00008E84
/* 00008E80 3BE000C8 */ li r31, 0xc8
lbl_00008E84:
/* 00008E84 54C307BD */ rlwinm. r3, r6, 0, 0x1e, 0x1e
/* 00008E88 4082004C */ bne lbl_00008ED4
/* 00008E8C 3C600000 */ lis r3, analogInputs@ha
/* 00008E90 38830000 */ addi r4, r3, analogInputs@l
/* 00008E94 A0640008 */ lhz r3, 8(r4)
/* 00008E98 546307BD */ rlwinm. r3, r3, 0, 0x1e, 0x1e
/* 00008E9C 40820038 */ bne lbl_00008ED4
/* 00008EA0 3C600000 */ lis r3, controllerInfo@ha
/* 00008EA4 38630000 */ addi r3, r3, controllerInfo@l
/* 00008EA8 A0630000 */ lhz r3, 0(r3)
/* 00008EAC 546307BD */ rlwinm. r3, r3, 0, 0x1e, 0x1e
/* 00008EB0 40820010 */ bne lbl_00008EC0
/* 00008EB4 A0640000 */ lhz r3, 0(r4)
/* 00008EB8 546307BD */ rlwinm. r3, r3, 0, 0x1e, 0x1e
/* 00008EBC 41820028 */ beq lbl_00008EE4
lbl_00008EC0:
/* 00008EC0 3C600000 */ lis r3, analogInputs@ha
/* 00008EC4 38630000 */ addi r3, r3, analogInputs@l
/* 00008EC8 A0630000 */ lhz r3, 0(r3)
/* 00008ECC 546305AD */ rlwinm. r3, r3, 0, 0x16, 0x16
/* 00008ED0 41820014 */ beq lbl_00008EE4
lbl_00008ED4:
/* 00008ED4 3BFF0001 */ addi r31, r31, 1
/* 00008ED8 2C1F00C8 */ cmpwi r31, 0xc8
/* 00008EDC 40810008 */ ble lbl_00008EE4
/* 00008EE0 3BE00001 */ li r31, 1
lbl_00008EE4:
/* 00008EE4 7C1F0000 */ cmpw r31, r0
/* 00008EE8 41820014 */ beq lbl_00008EFC
/* 00008EEC 387E0D6C */ addi r3, r30, 0xd6c
/* 00008EF0 389FFFFF */ addi r4, r31, -1
/* 00008EF4 4BFF7269 */ bl start_preview_image_read
/* 00008EF8 93FD0000 */ stw r31, 0(r29)
lbl_00008EFC:
/* 00008EFC 3C600000 */ lis r3, controllerInfo@ha
/* 00008F00 38630000 */ addi r3, r3, controllerInfo@l
/* 00008F04 A0030018 */ lhz r0, 0x18(r3)
/* 00008F08 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00008F0C 41820014 */ beq lbl_00008F20
/* 00008F10 4BFF724D */ bl destroy_all_sprites
/* 00008F14 801C0000 */ lwz r0, 0(r28)
/* 00008F18 540007B8 */ rlwinm r0, r0, 0, 0x1e, 0x1c
/* 00008F1C 901C0000 */ stw r0, 0(r28)
lbl_00008F20:
/* 00008F20 80010144 */ lwz r0, 0x144(r1)
/* 00008F24 83E1013C */ lwz r31, 0x13c(r1)
/* 00008F28 83C10138 */ lwz r30, 0x138(r1)
/* 00008F2C 7C0803A6 */ mtlr r0
/* 00008F30 83A10134 */ lwz r29, 0x134(r1)
/* 00008F34 83810130 */ lwz r28, 0x130(r1)
/* 00008F38 38210140 */ addi r1, r1, 0x140
/* 00008F3C 4E800020 */ blr 
