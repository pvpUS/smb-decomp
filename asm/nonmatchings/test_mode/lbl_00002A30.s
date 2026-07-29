/* 00002A30 7C0802A6 */ mflr r0
/* 00002A34 3C800000 */ lis r4, lbl_0000FE78@ha
/* 00002A38 90010004 */ stw r0, 4(r1)
/* 00002A3C 3C600000 */ lis r3, debugFlags@ha
/* 00002A40 3CA00000 */ lis r5, lbl_10000000@ha
/* 00002A44 9421FFE8 */ stwu r1, -0x18(r1)
/* 00002A48 38840000 */ addi r4, r4, lbl_0000FE78@l
/* 00002A4C 93E10014 */ stw r31, 0x14(r1)
/* 00002A50 3BE50000 */ addi r31, r5, lbl_10000000@l
/* 00002A54 93C10010 */ stw r30, 0x10(r1)
/* 00002A58 93A1000C */ stw r29, 0xc(r1)
/* 00002A5C 80030000 */ lwz r0, debugFlags@l(r3)
/* 00002A60 3C600000 */ lis r3, lbl_000102B0@ha
/* 00002A64 38630000 */ addi r3, r3, lbl_000102B0@l
/* 00002A68 7000000A */ andi. r0, r0, 0xa
/* 00002A6C 40820730 */ bne lbl_0000319C
/* 00002A70 3CA00000 */ lis r5, controllerInfo@ha
/* 00002A74 38A50000 */ addi r5, r5, controllerInfo@l
/* 00002A78 A0050018 */ lhz r0, 0x18(r5)
/* 00002A7C 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00002A80 41820010 */ beq lbl_00002A90
/* 00002A84 801F00B0 */ lwz r0, 0xb0(r31)
/* 00002A88 68000001 */ xori r0, r0, 1
/* 00002A8C 901F00B0 */ stw r0, 0xb0(r31)
lbl_00002A90:
/* 00002A90 3CA00000 */ lis r5, controllerInfo@ha
/* 00002A94 38E50000 */ addi r7, r5, controllerInfo@l
/* 00002A98 A0070030 */ lhz r0, 0x30(r7)
/* 00002A9C 54050739 */ rlwinm. r5, r0, 0, 0x1c, 0x1c
/* 00002AA0 40820044 */ bne lbl_00002AE4
/* 00002AA4 3CA00000 */ lis r5, analogInputs@ha
/* 00002AA8 38C50000 */ addi r6, r5, analogInputs@l
/* 00002AAC A0A60008 */ lhz r5, 8(r6)
/* 00002AB0 54A50739 */ rlwinm. r5, r5, 0, 0x1c, 0x1c
/* 00002AB4 40820030 */ bne lbl_00002AE4
/* 00002AB8 A0A70000 */ lhz r5, 0(r7)
/* 00002ABC 54A50739 */ rlwinm. r5, r5, 0, 0x1c, 0x1c
/* 00002AC0 40820010 */ bne lbl_00002AD0
/* 00002AC4 A0A60000 */ lhz r5, 0(r6)
/* 00002AC8 54A50739 */ rlwinm. r5, r5, 0, 0x1c, 0x1c
/* 00002ACC 41820054 */ beq lbl_00002B20
lbl_00002AD0:
/* 00002AD0 3CA00000 */ lis r5, analogInputs@ha
/* 00002AD4 38A50000 */ addi r5, r5, analogInputs@l
/* 00002AD8 A0A50000 */ lhz r5, 0(r5)
/* 00002ADC 54A505AD */ rlwinm. r5, r5, 0, 0x16, 0x16
/* 00002AE0 41820040 */ beq lbl_00002B20
lbl_00002AE4:
/* 00002AE4 80BF0084 */ lwz r5, 0x84(r31)
/* 00002AE8 38FF0084 */ addi r7, r31, 0x84
/* 00002AEC 34A5FFFF */ addic. r5, r5, -1
/* 00002AF0 90BF0084 */ stw r5, 0x84(r31)
/* 00002AF4 4080002C */ bge lbl_00002B20
/* 00002AF8 38C32894 */ addi r6, r3, 0x2894
/* 00002AFC 39000000 */ li r8, 0
/* 00002B00 4800000C */ b lbl_00002B0C
lbl_00002B04:
/* 00002B04 38C6000C */ addi r6, r6, 0xc
/* 00002B08 39080001 */ addi r8, r8, 1
lbl_00002B0C:
/* 00002B0C 80A60000 */ lwz r5, 0(r6)
/* 00002B10 2C050000 */ cmpwi r5, 0
/* 00002B14 4082FFF0 */ bne lbl_00002B04
/* 00002B18 38A8FFFF */ addi r5, r8, -1
/* 00002B1C 90A70000 */ stw r5, 0(r7)
lbl_00002B20:
/* 00002B20 5405077B */ rlwinm. r5, r0, 0, 0x1d, 0x1d
/* 00002B24 4082004C */ bne lbl_00002B70
/* 00002B28 3CA00000 */ lis r5, analogInputs@ha
/* 00002B2C 38C50000 */ addi r6, r5, analogInputs@l
/* 00002B30 A0A60008 */ lhz r5, 8(r6)
/* 00002B34 54A5077B */ rlwinm. r5, r5, 0, 0x1d, 0x1d
/* 00002B38 40820038 */ bne lbl_00002B70
/* 00002B3C 3CA00000 */ lis r5, controllerInfo@ha
/* 00002B40 38A50000 */ addi r5, r5, controllerInfo@l
/* 00002B44 A0A50000 */ lhz r5, 0(r5)
/* 00002B48 54A5077B */ rlwinm. r5, r5, 0, 0x1d, 0x1d
/* 00002B4C 40820010 */ bne lbl_00002B5C
/* 00002B50 A0A60000 */ lhz r5, 0(r6)
/* 00002B54 54A5077B */ rlwinm. r5, r5, 0, 0x1d, 0x1d
/* 00002B58 41820048 */ beq lbl_00002BA0
lbl_00002B5C:
/* 00002B5C 3CA00000 */ lis r5, analogInputs@ha
/* 00002B60 38A50000 */ addi r5, r5, analogInputs@l
/* 00002B64 A0A50000 */ lhz r5, 0(r5)
/* 00002B68 54A505AD */ rlwinm. r5, r5, 0, 0x16, 0x16
/* 00002B6C 41820034 */ beq lbl_00002BA0
lbl_00002B70:
/* 00002B70 38DF0084 */ addi r6, r31, 0x84
/* 00002B74 80BF0084 */ lwz r5, 0x84(r31)
/* 00002B78 38A50001 */ addi r5, r5, 1
/* 00002B7C 90BF0084 */ stw r5, 0x84(r31)
/* 00002B80 80BF0084 */ lwz r5, 0x84(r31)
/* 00002B84 1CA5000C */ mulli r5, r5, 0xc
/* 00002B88 7CA32A14 */ add r5, r3, r5
/* 00002B8C 80A52894 */ lwz r5, 0x2894(r5)
/* 00002B90 2C050000 */ cmpwi r5, 0
/* 00002B94 4082000C */ bne lbl_00002BA0
/* 00002B98 38A00000 */ li r5, 0
/* 00002B9C 90A60000 */ stw r5, 0(r6)
lbl_00002BA0:
/* 00002BA0 80BF0084 */ lwz r5, 0x84(r31)
/* 00002BA4 1CA5000C */ mulli r5, r5, 0xc
/* 00002BA8 7FC32A14 */ add r30, r3, r5
/* 00002BAC 84DE2894 */ lwzu r6, 0x2894(r30)
/* 00002BB0 28060008 */ cmplwi r6, 8
/* 00002BB4 418105E8 */ bgt lbl_0000319C
/* 00002BB8 3C600000 */ lis r3, lbl_00012C10@ha
/* 00002BBC 38A30000 */ addi r5, r3, lbl_00012C10@l
/* 00002BC0 54C3103A */ slwi r3, r6, 2
/* 00002BC4 7C65182E */ lwzx r3, r5, r3
/* 00002BC8 7C6903A6 */ mtctr r3
/* 00002BCC 4E800420 */ bctr 
lbl_00002BD0:
/* 00002BD0 809E0008 */ lwz r4, 8(r30)
/* 00002BD4 540307FF */ clrlwi. r3, r0, 0x1f
/* 00002BD8 83A40000 */ lwz r29, 0(r4)
/* 00002BDC 4082004C */ bne lbl_00002C28
/* 00002BE0 3C600000 */ lis r3, analogInputs@ha
/* 00002BE4 38830000 */ addi r4, r3, analogInputs@l
/* 00002BE8 A0640008 */ lhz r3, 8(r4)
/* 00002BEC 546307FF */ clrlwi. r3, r3, 0x1f
/* 00002BF0 40820038 */ bne lbl_00002C28
/* 00002BF4 3C600000 */ lis r3, controllerInfo@ha
/* 00002BF8 38630000 */ addi r3, r3, controllerInfo@l
/* 00002BFC A0630000 */ lhz r3, 0(r3)
/* 00002C00 546307FF */ clrlwi. r3, r3, 0x1f
/* 00002C04 40820010 */ bne lbl_00002C14
/* 00002C08 A0640000 */ lhz r3, 0(r4)
/* 00002C0C 546307FF */ clrlwi. r3, r3, 0x1f
/* 00002C10 41820024 */ beq lbl_00002C34
lbl_00002C14:
/* 00002C14 3C600000 */ lis r3, analogInputs@ha
/* 00002C18 38630000 */ addi r3, r3, analogInputs@l
/* 00002C1C A0630000 */ lhz r3, 0(r3)
/* 00002C20 546305AD */ rlwinm. r3, r3, 0, 0x16, 0x16
/* 00002C24 41820010 */ beq lbl_00002C34
lbl_00002C28:
/* 00002C28 37BDFFFF */ addic. r29, r29, -1
/* 00002C2C 40800008 */ bge lbl_00002C34
/* 00002C30 3BA0000D */ li r29, 0xd
lbl_00002C34:
/* 00002C34 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00002C38 40820044 */ bne lbl_00002C7C
/* 00002C3C 3C600000 */ lis r3, analogInputs@ha
/* 00002C40 38830000 */ addi r4, r3, analogInputs@l
/* 00002C44 A0040008 */ lhz r0, 8(r4)
/* 00002C48 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00002C4C 40820030 */ bne lbl_00002C7C
/* 00002C50 3C600000 */ lis r3, controllerInfo@ha
/* 00002C54 A0030000 */ lhz r0, controllerInfo@l(r3)
/* 00002C58 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00002C5C 40820010 */ bne lbl_00002C6C
/* 00002C60 A0040000 */ lhz r0, 0(r4)
/* 00002C64 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00002C68 41820024 */ beq lbl_00002C8C
lbl_00002C6C:
/* 00002C6C 3C600000 */ lis r3, analogInputs@ha
/* 00002C70 A0030000 */ lhz r0, analogInputs@l(r3)
/* 00002C74 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00002C78 41820014 */ beq lbl_00002C8C
lbl_00002C7C:
/* 00002C7C 3BBD0001 */ addi r29, r29, 1
/* 00002C80 2C1D000E */ cmpwi r29, 0xe
/* 00002C84 41800008 */ blt lbl_00002C8C
/* 00002C88 3BA00000 */ li r29, 0
lbl_00002C8C:
/* 00002C8C 807F007C */ lwz r3, 0x7c(r31)
/* 00002C90 7C1D1800 */ cmpw r29, r3
/* 00002C94 41820508 */ beq lbl_0000319C
/* 00002C98 2C030000 */ cmpwi r3, 0
/* 00002C9C 41820008 */ beq lbl_00002CA4
/* 00002CA0 4BFFD4BD */ bl call_bitmap_free_group
lbl_00002CA4:
/* 00002CA4 7FA3EB78 */ mr r3, r29
/* 00002CA8 4BFFD4B5 */ bl call_bitmap_load_group
/* 00002CAC 807E0008 */ lwz r3, 8(r30)
/* 00002CB0 38000000 */ li r0, 0
/* 00002CB4 93A30000 */ stw r29, 0(r3)
/* 00002CB8 901F0080 */ stw r0, 0x80(r31)
/* 00002CBC 480004E0 */ b lbl_0000319C
lbl_00002CC0:
/* 00002CC0 80BF007C */ lwz r5, 0x7c(r31)
/* 00002CC4 3CC00000 */ lis r6, bitmapGroups@ha
/* 00002CC8 807E0008 */ lwz r3, 8(r30)
/* 00002CCC 540407FF */ clrlwi. r4, r0, 0x1f
/* 00002CD0 1CE50018 */ mulli r7, r5, 0x18
/* 00002CD4 80A30000 */ lwz r5, 0(r3)
/* 00002CD8 38C60000 */ addi r6, r6, bitmapGroups@l
/* 00002CDC 7C863A14 */ add r4, r6, r7
/* 00002CE0 4082004C */ bne lbl_00002D2C
/* 00002CE4 3CC00000 */ lis r6, analogInputs@ha
/* 00002CE8 38E60000 */ addi r7, r6, analogInputs@l
/* 00002CEC A0C70008 */ lhz r6, 8(r7)
/* 00002CF0 54C607FF */ clrlwi. r6, r6, 0x1f
/* 00002CF4 40820038 */ bne lbl_00002D2C
/* 00002CF8 3CC00000 */ lis r6, controllerInfo@ha
/* 00002CFC 38C60000 */ addi r6, r6, controllerInfo@l
/* 00002D00 A0C60000 */ lhz r6, 0(r6)
/* 00002D04 54C607FF */ clrlwi. r6, r6, 0x1f
/* 00002D08 40820010 */ bne lbl_00002D18
/* 00002D0C A0C70000 */ lhz r6, 0(r7)
/* 00002D10 54C607FF */ clrlwi. r6, r6, 0x1f
/* 00002D14 41820030 */ beq lbl_00002D44
lbl_00002D18:
/* 00002D18 3CC00000 */ lis r6, analogInputs@ha
/* 00002D1C 38C60000 */ addi r6, r6, analogInputs@l
/* 00002D20 A0C60000 */ lhz r6, 0(r6)
/* 00002D24 54C605AD */ rlwinm. r6, r6, 0, 0x16, 0x16
/* 00002D28 4182001C */ beq lbl_00002D44
lbl_00002D2C:
/* 00002D2C 34A5FFFF */ addic. r5, r5, -1
/* 00002D30 40800014 */ bge lbl_00002D44
/* 00002D34 80A40010 */ lwz r5, 0x10(r4)
/* 00002D38 80A50000 */ lwz r5, 0(r5)
/* 00002D3C 38A5FFFF */ addi r5, r5, -1
/* 00002D40 7CA50734 */ extsh r5, r5
lbl_00002D44:
/* 00002D44 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00002D48 40820044 */ bne lbl_00002D8C
/* 00002D4C 3CC00000 */ lis r6, analogInputs@ha
/* 00002D50 38E60000 */ addi r7, r6, analogInputs@l
/* 00002D54 A0070008 */ lhz r0, 8(r7)
/* 00002D58 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00002D5C 40820030 */ bne lbl_00002D8C
/* 00002D60 3CC00000 */ lis r6, controllerInfo@ha
/* 00002D64 A0060000 */ lhz r0, controllerInfo@l(r6)
/* 00002D68 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00002D6C 40820010 */ bne lbl_00002D7C
/* 00002D70 A0070000 */ lhz r0, 0(r7)
/* 00002D74 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00002D78 41820030 */ beq lbl_00002DA8
lbl_00002D7C:
/* 00002D7C 3CC00000 */ lis r6, analogInputs@ha
/* 00002D80 A0060000 */ lhz r0, analogInputs@l(r6)
/* 00002D84 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00002D88 41820020 */ beq lbl_00002DA8
lbl_00002D8C:
/* 00002D8C 80840010 */ lwz r4, 0x10(r4)
/* 00002D90 38A50001 */ addi r5, r5, 1
/* 00002D94 80840000 */ lwz r4, 0(r4)
/* 00002D98 3804FFFF */ addi r0, r4, -1
/* 00002D9C 7C050040 */ cmplw r5, r0
/* 00002DA0 40810008 */ ble lbl_00002DA8
/* 00002DA4 38A00000 */ li r5, 0
lbl_00002DA8:
/* 00002DA8 90A30000 */ stw r5, 0(r3)
/* 00002DAC 480003F0 */ b lbl_0000319C
lbl_00002DB0:
/* 00002DB0 3C600000 */ lis r3, controllerInfo@ha
/* 00002DB4 A0E30000 */ lhz r7, controllerInfo@l(r3)
/* 00002DB8 54E306B5 */ rlwinm. r3, r7, 0, 0x1a, 0x1a
/* 00002DBC 4182000C */ beq lbl_00002DC8
/* 00002DC0 38C0000A */ li r6, 0xa
/* 00002DC4 48000008 */ b lbl_00002DCC
lbl_00002DC8:
/* 00002DC8 38C00001 */ li r6, 1
lbl_00002DCC:
/* 00002DCC 807E0008 */ lwz r3, 8(r30)
/* 00002DD0 540407BD */ rlwinm. r4, r0, 0, 0x1e, 0x1e
/* 00002DD4 89030000 */ lbz r8, 0(r3)
/* 00002DD8 40820040 */ bne lbl_00002E18
/* 00002DDC 3C800000 */ lis r4, analogInputs@ha
/* 00002DE0 38A40000 */ addi r5, r4, analogInputs@l
/* 00002DE4 A0850008 */ lhz r4, 8(r5)
/* 00002DE8 548407BD */ rlwinm. r4, r4, 0, 0x1e, 0x1e
/* 00002DEC 4082002C */ bne lbl_00002E18
/* 00002DF0 54E407BD */ rlwinm. r4, r7, 0, 0x1e, 0x1e
/* 00002DF4 40820010 */ bne lbl_00002E04
/* 00002DF8 A0850000 */ lhz r4, 0(r5)
/* 00002DFC 548407BD */ rlwinm. r4, r4, 0, 0x1e, 0x1e
/* 00002E00 4182001C */ beq lbl_00002E1C
lbl_00002E04:
/* 00002E04 3C800000 */ lis r4, analogInputs@ha
/* 00002E08 38840000 */ addi r4, r4, analogInputs@l
/* 00002E0C A0840000 */ lhz r4, 0(r4)
/* 00002E10 548405AD */ rlwinm. r4, r4, 0, 0x16, 0x16
/* 00002E14 41820008 */ beq lbl_00002E1C
lbl_00002E18:
/* 00002E18 7D083214 */ add r8, r8, r6
lbl_00002E1C:
/* 00002E1C 540007FF */ clrlwi. r0, r0, 0x1f
/* 00002E20 4082003C */ bne lbl_00002E5C
/* 00002E24 3C800000 */ lis r4, analogInputs@ha
/* 00002E28 38840000 */ addi r4, r4, analogInputs@l
/* 00002E2C A0040008 */ lhz r0, 8(r4)
/* 00002E30 540007FF */ clrlwi. r0, r0, 0x1f
/* 00002E34 40820028 */ bne lbl_00002E5C
/* 00002E38 54E007FF */ clrlwi. r0, r7, 0x1f
/* 00002E3C 40820010 */ bne lbl_00002E4C
/* 00002E40 A0040000 */ lhz r0, 0(r4)
/* 00002E44 540007FF */ clrlwi. r0, r0, 0x1f
/* 00002E48 41820018 */ beq lbl_00002E60
lbl_00002E4C:
/* 00002E4C 3C800000 */ lis r4, analogInputs@ha
/* 00002E50 A0040000 */ lhz r0, analogInputs@l(r4)
/* 00002E54 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00002E58 41820008 */ beq lbl_00002E60
lbl_00002E5C:
/* 00002E5C 7D064050 */ subf r8, r6, r8
lbl_00002E60:
/* 00002E60 2C080000 */ cmpwi r8, 0
/* 00002E64 4080000C */ bge lbl_00002E70
/* 00002E68 38000000 */ li r0, 0
/* 00002E6C 48000018 */ b lbl_00002E84
lbl_00002E70:
/* 00002E70 2C0800FF */ cmpwi r8, 0xff
/* 00002E74 4081000C */ ble lbl_00002E80
/* 00002E78 380000FF */ li r0, 0xff
/* 00002E7C 48000008 */ b lbl_00002E84
lbl_00002E80:
/* 00002E80 7D004378 */ mr r0, r8
lbl_00002E84:
/* 00002E84 98030000 */ stb r0, 0(r3)
/* 00002E88 48000314 */ b lbl_0000319C
lbl_00002E8C:
/* 00002E8C 807E0008 */ lwz r3, 8(r30)
/* 00002E90 540407BD */ rlwinm. r4, r0, 0, 0x1e, 0x1e
/* 00002E94 A8830000 */ lha r4, 0(r3)
/* 00002E98 4082004C */ bne lbl_00002EE4
/* 00002E9C 3CA00000 */ lis r5, analogInputs@ha
/* 00002EA0 38C50000 */ addi r6, r5, analogInputs@l
/* 00002EA4 A0A60008 */ lhz r5, 8(r6)
/* 00002EA8 54A507BD */ rlwinm. r5, r5, 0, 0x1e, 0x1e
/* 00002EAC 40820038 */ bne lbl_00002EE4
/* 00002EB0 3CA00000 */ lis r5, controllerInfo@ha
/* 00002EB4 38A50000 */ addi r5, r5, controllerInfo@l
/* 00002EB8 A0A50000 */ lhz r5, 0(r5)
/* 00002EBC 54A507BD */ rlwinm. r5, r5, 0, 0x1e, 0x1e
/* 00002EC0 40820010 */ bne lbl_00002ED0
/* 00002EC4 A0A60000 */ lhz r5, 0(r6)
/* 00002EC8 54A507BD */ rlwinm. r5, r5, 0, 0x1e, 0x1e
/* 00002ECC 4182001C */ beq lbl_00002EE8
lbl_00002ED0:
/* 00002ED0 3CA00000 */ lis r5, analogInputs@ha
/* 00002ED4 38A50000 */ addi r5, r5, analogInputs@l
/* 00002ED8 A0A50000 */ lhz r5, 0(r5)
/* 00002EDC 54A505AD */ rlwinm. r5, r5, 0, 0x16, 0x16
/* 00002EE0 41820008 */ beq lbl_00002EE8
lbl_00002EE4:
/* 00002EE4 38840080 */ addi r4, r4, 0x80
lbl_00002EE8:
/* 00002EE8 540007FF */ clrlwi. r0, r0, 0x1f
/* 00002EEC 40820044 */ bne lbl_00002F30
/* 00002EF0 3CA00000 */ lis r5, analogInputs@ha
/* 00002EF4 38C50000 */ addi r6, r5, analogInputs@l
/* 00002EF8 A0060008 */ lhz r0, 8(r6)
/* 00002EFC 540007FF */ clrlwi. r0, r0, 0x1f
/* 00002F00 40820030 */ bne lbl_00002F30
/* 00002F04 3CA00000 */ lis r5, controllerInfo@ha
/* 00002F08 A0050000 */ lhz r0, controllerInfo@l(r5)
/* 00002F0C 540007FF */ clrlwi. r0, r0, 0x1f
/* 00002F10 40820010 */ bne lbl_00002F20
/* 00002F14 A0060000 */ lhz r0, 0(r6)
/* 00002F18 540007FF */ clrlwi. r0, r0, 0x1f
/* 00002F1C 41820018 */ beq lbl_00002F34
lbl_00002F20:
/* 00002F20 3CA00000 */ lis r5, analogInputs@ha
/* 00002F24 A0050000 */ lhz r0, analogInputs@l(r5)
/* 00002F28 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00002F2C 41820008 */ beq lbl_00002F34
lbl_00002F30:
/* 00002F30 3884FF80 */ addi r4, r4, -128
lbl_00002F34:
/* 00002F34 7C800734 */ extsh r0, r4
/* 00002F38 B0030000 */ sth r0, 0(r3)
/* 00002F3C 48000260 */ b lbl_0000319C
lbl_00002F40:
/* 00002F40 807E0008 */ lwz r3, 8(r30)
/* 00002F44 540507BD */ rlwinm. r5, r0, 0, 0x1e, 0x1e
/* 00002F48 C0230000 */ lfs f1, 0(r3)
/* 00002F4C 4082004C */ bne lbl_00002F98
/* 00002F50 3CA00000 */ lis r5, analogInputs@ha
/* 00002F54 38C50000 */ addi r6, r5, analogInputs@l
/* 00002F58 A0A60008 */ lhz r5, 8(r6)
/* 00002F5C 54A507BD */ rlwinm. r5, r5, 0, 0x1e, 0x1e
/* 00002F60 40820038 */ bne lbl_00002F98
/* 00002F64 3CA00000 */ lis r5, controllerInfo@ha
/* 00002F68 38A50000 */ addi r5, r5, controllerInfo@l
/* 00002F6C A0A50000 */ lhz r5, 0(r5)
/* 00002F70 54A507BD */ rlwinm. r5, r5, 0, 0x1e, 0x1e
/* 00002F74 40820010 */ bne lbl_00002F84
/* 00002F78 A0A60000 */ lhz r5, 0(r6)
/* 00002F7C 54A507BD */ rlwinm. r5, r5, 0, 0x1e, 0x1e
/* 00002F80 41820024 */ beq lbl_00002FA4
lbl_00002F84:
/* 00002F84 3CA00000 */ lis r5, analogInputs@ha
/* 00002F88 38A50000 */ addi r5, r5, analogInputs@l
/* 00002F8C A0A50000 */ lhz r5, 0(r5)
/* 00002F90 54A505AD */ rlwinm. r5, r5, 0, 0x16, 0x16
/* 00002F94 41820010 */ beq lbl_00002FA4
lbl_00002F98:
/* 00002F98 C80400C0 */ lfd f0, 0xc0(r4)
/* 00002F9C FC21002A */ fadd f1, f1, f0
/* 00002FA0 FC200818 */ frsp f1, f1
lbl_00002FA4:
/* 00002FA4 540007FF */ clrlwi. r0, r0, 0x1f
/* 00002FA8 40820044 */ bne lbl_00002FEC
/* 00002FAC 3CA00000 */ lis r5, analogInputs@ha
/* 00002FB0 38C50000 */ addi r6, r5, analogInputs@l
/* 00002FB4 A0060008 */ lhz r0, 8(r6)
/* 00002FB8 540007FF */ clrlwi. r0, r0, 0x1f
/* 00002FBC 40820030 */ bne lbl_00002FEC
/* 00002FC0 3CA00000 */ lis r5, controllerInfo@ha
/* 00002FC4 A0050000 */ lhz r0, controllerInfo@l(r5)
/* 00002FC8 540007FF */ clrlwi. r0, r0, 0x1f
/* 00002FCC 40820010 */ bne lbl_00002FDC
/* 00002FD0 A0060000 */ lhz r0, 0(r6)
/* 00002FD4 540007FF */ clrlwi. r0, r0, 0x1f
/* 00002FD8 41820020 */ beq lbl_00002FF8
lbl_00002FDC:
/* 00002FDC 3CA00000 */ lis r5, analogInputs@ha
/* 00002FE0 A0050000 */ lhz r0, analogInputs@l(r5)
/* 00002FE4 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00002FE8 41820010 */ beq lbl_00002FF8
lbl_00002FEC:
/* 00002FEC C80400C0 */ lfd f0, 0xc0(r4)
/* 00002FF0 FC210028 */ fsub f1, f1, f0
/* 00002FF4 FC200818 */ frsp f1, f1
lbl_00002FF8:
/* 00002FF8 C80400C8 */ lfd f0, 0xc8(r4)
/* 00002FFC FC010040 */ fcmpo cr0, f1, f0
/* 00003000 40800008 */ bge lbl_00003008
/* 00003004 48000018 */ b lbl_0000301C
lbl_00003008:
/* 00003008 C80400D0 */ lfd f0, 0xd0(r4)
/* 0000300C FC010040 */ fcmpo cr0, f1, f0
/* 00003010 40810008 */ ble lbl_00003018
/* 00003014 48000008 */ b lbl_0000301C
lbl_00003018:
/* 00003018 FC000890 */ fmr f0, f1
lbl_0000301C:
/* 0000301C FC000018 */ frsp f0, f0
/* 00003020 D0030000 */ stfs f0, 0(r3)
/* 00003024 48000178 */ b lbl_0000319C
lbl_00003028:
/* 00003028 807E0008 */ lwz r3, 8(r30)
/* 0000302C 540507BD */ rlwinm. r5, r0, 0, 0x1e, 0x1e
/* 00003030 C0230000 */ lfs f1, 0(r3)
/* 00003034 4082004C */ bne lbl_00003080
/* 00003038 3CA00000 */ lis r5, analogInputs@ha
/* 0000303C 38C50000 */ addi r6, r5, analogInputs@l
/* 00003040 A0A60008 */ lhz r5, 8(r6)
/* 00003044 54A507BD */ rlwinm. r5, r5, 0, 0x1e, 0x1e
/* 00003048 40820038 */ bne lbl_00003080
/* 0000304C 3CA00000 */ lis r5, controllerInfo@ha
/* 00003050 38A50000 */ addi r5, r5, controllerInfo@l
/* 00003054 A0A50000 */ lhz r5, 0(r5)
/* 00003058 54A507BD */ rlwinm. r5, r5, 0, 0x1e, 0x1e
/* 0000305C 40820010 */ bne lbl_0000306C
/* 00003060 A0A60000 */ lhz r5, 0(r6)
/* 00003064 54A507BD */ rlwinm. r5, r5, 0, 0x1e, 0x1e
/* 00003068 41820024 */ beq lbl_0000308C
lbl_0000306C:
/* 0000306C 3CA00000 */ lis r5, analogInputs@ha
/* 00003070 38A50000 */ addi r5, r5, analogInputs@l
/* 00003074 A0A50000 */ lhz r5, 0(r5)
/* 00003078 54A505AD */ rlwinm. r5, r5, 0, 0x16, 0x16
/* 0000307C 41820010 */ beq lbl_0000308C
lbl_00003080:
/* 00003080 C80400D8 */ lfd f0, 0xd8(r4)
/* 00003084 FC21002A */ fadd f1, f1, f0
/* 00003088 FC200818 */ frsp f1, f1
lbl_0000308C:
/* 0000308C 540007FF */ clrlwi. r0, r0, 0x1f
/* 00003090 40820044 */ bne lbl_000030D4
/* 00003094 3CA00000 */ lis r5, analogInputs@ha
/* 00003098 38C50000 */ addi r6, r5, analogInputs@l
/* 0000309C A0060008 */ lhz r0, 8(r6)
/* 000030A0 540007FF */ clrlwi. r0, r0, 0x1f
/* 000030A4 40820030 */ bne lbl_000030D4
/* 000030A8 3CA00000 */ lis r5, controllerInfo@ha
/* 000030AC A0050000 */ lhz r0, controllerInfo@l(r5)
/* 000030B0 540007FF */ clrlwi. r0, r0, 0x1f
/* 000030B4 40820010 */ bne lbl_000030C4
/* 000030B8 A0060000 */ lhz r0, 0(r6)
/* 000030BC 540007FF */ clrlwi. r0, r0, 0x1f
/* 000030C0 41820020 */ beq lbl_000030E0
lbl_000030C4:
/* 000030C4 3CA00000 */ lis r5, analogInputs@ha
/* 000030C8 A0050000 */ lhz r0, analogInputs@l(r5)
/* 000030CC 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 000030D0 41820010 */ beq lbl_000030E0
lbl_000030D4:
/* 000030D4 C80400D8 */ lfd f0, 0xd8(r4)
/* 000030D8 FC210028 */ fsub f1, f1, f0
/* 000030DC FC200818 */ frsp f1, f1
lbl_000030E0:
/* 000030E0 D0230000 */ stfs f1, 0(r3)
/* 000030E4 480000B8 */ b lbl_0000319C
lbl_000030E8:
/* 000030E8 807E0008 */ lwz r3, 8(r30)
/* 000030EC 540407BD */ rlwinm. r4, r0, 0, 0x1e, 0x1e
/* 000030F0 C0230000 */ lfs f1, 0(r3)
/* 000030F4 4082004C */ bne lbl_00003140
/* 000030F8 3C800000 */ lis r4, analogInputs@ha
/* 000030FC 38A40000 */ addi r5, r4, analogInputs@l
/* 00003100 A0850008 */ lhz r4, 8(r5)
/* 00003104 548407BD */ rlwinm. r4, r4, 0, 0x1e, 0x1e
/* 00003108 40820038 */ bne lbl_00003140
/* 0000310C 3C800000 */ lis r4, controllerInfo@ha
/* 00003110 38840000 */ addi r4, r4, controllerInfo@l
/* 00003114 A0840000 */ lhz r4, 0(r4)
/* 00003118 548407BD */ rlwinm. r4, r4, 0, 0x1e, 0x1e
/* 0000311C 40820010 */ bne lbl_0000312C
/* 00003120 A0850000 */ lhz r4, 0(r5)
/* 00003124 548407BD */ rlwinm. r4, r4, 0, 0x1e, 0x1e
/* 00003128 41820020 */ beq lbl_00003148
lbl_0000312C:
/* 0000312C 3C800000 */ lis r4, analogInputs@ha
/* 00003130 38840000 */ addi r4, r4, analogInputs@l
/* 00003134 A0840000 */ lhz r4, 0(r4)
/* 00003138 548405AD */ rlwinm. r4, r4, 0, 0x16, 0x16
/* 0000313C 4182000C */ beq lbl_00003148
lbl_00003140:
/* 00003140 C01F009C */ lfs f0, 0x9c(r31)
/* 00003144 EC21002A */ fadds f1, f1, f0
lbl_00003148:
/* 00003148 540007FF */ clrlwi. r0, r0, 0x1f
/* 0000314C 40820044 */ bne lbl_00003190
/* 00003150 3C800000 */ lis r4, analogInputs@ha
/* 00003154 38A40000 */ addi r5, r4, analogInputs@l
/* 00003158 A0050008 */ lhz r0, 8(r5)
/* 0000315C 540007FF */ clrlwi. r0, r0, 0x1f
/* 00003160 40820030 */ bne lbl_00003190
/* 00003164 3C800000 */ lis r4, controllerInfo@ha
/* 00003168 A0040000 */ lhz r0, controllerInfo@l(r4)
/* 0000316C 540007FF */ clrlwi. r0, r0, 0x1f
/* 00003170 40820010 */ bne lbl_00003180
/* 00003174 A0050000 */ lhz r0, 0(r5)
/* 00003178 540007FF */ clrlwi. r0, r0, 0x1f
/* 0000317C 4182001C */ beq lbl_00003198
lbl_00003180:
/* 00003180 3C800000 */ lis r4, analogInputs@ha
/* 00003184 A0040000 */ lhz r0, analogInputs@l(r4)
/* 00003188 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 0000318C 4182000C */ beq lbl_00003198
lbl_00003190:
/* 00003190 C01F009C */ lfs f0, 0x9c(r31)
/* 00003194 EC210028 */ fsubs f1, f1, f0
lbl_00003198:
/* 00003198 D0230000 */ stfs f1, 0(r3)
lbl_0000319C:
/* 0000319C 8001001C */ lwz r0, 0x1c(r1)
/* 000031A0 83E10014 */ lwz r31, 0x14(r1)
/* 000031A4 83C10010 */ lwz r30, 0x10(r1)
/* 000031A8 7C0803A6 */ mtlr r0
/* 000031AC 83A1000C */ lwz r29, 0xc(r1)
/* 000031B0 38210018 */ addi r1, r1, 0x18
/* 000031B4 4E800020 */ blr 
