/* 00007A20 7C0802A6 */ mflr r0
/* 00007A24 3CA00000 */ lis r5, debugFlags@ha
/* 00007A28 90010004 */ stw r0, 4(r1)
/* 00007A2C 9421FF88 */ stwu r1, -0x78(r1)
/* 00007A30 93E10074 */ stw r31, 0x74(r1)
/* 00007A34 93C10070 */ stw r30, 0x70(r1)
/* 00007A38 3BC30000 */ addi r30, r3, 0
/* 00007A3C 93A1006C */ stw r29, 0x6c(r1)
/* 00007A40 93810068 */ stw r28, 0x68(r1)
/* 00007A44 3B840000 */ addi r28, r4, 0
/* 00007A48 80050000 */ lwz r0, debugFlags@l(r5)
/* 00007A4C 3CA00000 */ lis r5, lbl_0000C2C8@ha
/* 00007A50 3BE50000 */ addi r31, r5, lbl_0000C2C8@l
/* 00007A54 7000000A */ andi. r0, r0, 0xa
/* 00007A58 4082037C */ bne lbl_00007DD4
/* 00007A5C 807E0000 */ lwz r3, 0(r30)
/* 00007A60 801E0004 */ lwz r0, 4(r30)
/* 00007A64 9061001C */ stw r3, 0x1c(r1)
/* 00007A68 90010020 */ stw r0, 0x20(r1)
/* 00007A6C 801E0008 */ lwz r0, 8(r30)
/* 00007A70 90010024 */ stw r0, 0x24(r1)
/* 00007A74 807E000C */ lwz r3, 0xc(r30)
/* 00007A78 801E0010 */ lwz r0, 0x10(r30)
/* 00007A7C 90610010 */ stw r3, 0x10(r1)
/* 00007A80 90010014 */ stw r0, 0x14(r1)
/* 00007A84 801E0014 */ lwz r0, 0x14(r30)
/* 00007A88 90010018 */ stw r0, 0x18(r1)
/* 00007A8C C03E00AC */ lfs f1, 0xac(r30)
/* 00007A90 C01E000C */ lfs f0, 0xc(r30)
/* 00007A94 EC010028 */ fsubs f0, f1, f0
/* 00007A98 D0010028 */ stfs f0, 0x28(r1)
/* 00007A9C C03E00B0 */ lfs f1, 0xb0(r30)
/* 00007AA0 C01E0010 */ lfs f0, 0x10(r30)
/* 00007AA4 EC010028 */ fsubs f0, f1, f0
/* 00007AA8 D001002C */ stfs f0, 0x2c(r1)
/* 00007AAC C03E00B4 */ lfs f1, 0xb4(r30)
/* 00007AB0 C01E0014 */ lfs f0, 0x14(r30)
/* 00007AB4 EC010028 */ fsubs f0, f1, f0
/* 00007AB8 D0010030 */ stfs f0, 0x30(r1)
/* 00007ABC C0410030 */ lfs f2, 0x30(r1)
/* 00007AC0 C001002C */ lfs f0, 0x2c(r1)
/* 00007AC4 C0210028 */ lfs f1, 0x28(r1)
/* 00007AC8 EC210072 */ fmuls f1, f1, f1
/* 00007ACC EC20083A */ fmadds f1, f0, f0, f1
/* 00007AD0 EC2208BA */ fmadds f1, f2, f2, f1
/* 00007AD4 C01F0014 */ lfs f0, 0x14(r31)
/* 00007AD8 FC010040 */ fcmpo cr0, f1, f0
/* 00007ADC 40810030 */ ble lbl_00007B0C
/* 00007AE0 4BFF866D */ bl mathutil_rsqrt
/* 00007AE4 C0010028 */ lfs f0, 0x28(r1)
/* 00007AE8 EC000072 */ fmuls f0, f0, f1
/* 00007AEC D0010028 */ stfs f0, 0x28(r1)
/* 00007AF0 C001002C */ lfs f0, 0x2c(r1)
/* 00007AF4 EC000072 */ fmuls f0, f0, f1
/* 00007AF8 D001002C */ stfs f0, 0x2c(r1)
/* 00007AFC C0010030 */ lfs f0, 0x30(r1)
/* 00007B00 EC000072 */ fmuls f0, f0, f1
/* 00007B04 D0010030 */ stfs f0, 0x30(r1)
/* 00007B08 4800001C */ b lbl_00007B24
lbl_00007B0C:
/* 00007B0C C01F000C */ lfs f0, 0xc(r31)
/* 00007B10 D0010028 */ stfs f0, 0x28(r1)
/* 00007B14 C01F0008 */ lfs f0, 8(r31)
/* 00007B18 D001002C */ stfs f0, 0x2c(r1)
/* 00007B1C C01F0008 */ lfs f0, 8(r31)
/* 00007B20 D0010030 */ stfs f0, 0x30(r1)
lbl_00007B24:
/* 00007B24 C85F0018 */ lfd f2, 0x18(r31)
/* 00007B28 C0210028 */ lfs f1, 0x28(r1)
/* 00007B2C C01E000C */ lfs f0, 0xc(r30)
/* 00007B30 FC220072 */ fmul f1, f2, f1
/* 00007B34 FC01002A */ fadd f0, f1, f0
/* 00007B38 FC000018 */ frsp f0, f0
/* 00007B3C D0010028 */ stfs f0, 0x28(r1)
/* 00007B40 C85F0018 */ lfd f2, 0x18(r31)
/* 00007B44 C021002C */ lfs f1, 0x2c(r1)
/* 00007B48 C01E0010 */ lfs f0, 0x10(r30)
/* 00007B4C FC220072 */ fmul f1, f2, f1
/* 00007B50 FC01002A */ fadd f0, f1, f0
/* 00007B54 FC000018 */ frsp f0, f0
/* 00007B58 D001002C */ stfs f0, 0x2c(r1)
/* 00007B5C C85F0018 */ lfd f2, 0x18(r31)
/* 00007B60 C0210030 */ lfs f1, 0x30(r1)
/* 00007B64 C01E0014 */ lfs f0, 0x14(r30)
/* 00007B68 FC220072 */ fmul f1, f2, f1
/* 00007B6C FC01002A */ fadd f0, f1, f0
/* 00007B70 FC000018 */ frsp f0, f0
/* 00007B74 D0010030 */ stfs f0, 0x30(r1)
/* 00007B78 C01C0004 */ lfs f0, 4(r28)
/* 00007B7C D01E000C */ stfs f0, 0xc(r30)
/* 00007B80 C83F0000 */ lfd f1, 0(r31)
/* 00007B84 C01C0008 */ lfs f0, 8(r28)
/* 00007B88 FC01002A */ fadd f0, f1, f0
/* 00007B8C FC000018 */ frsp f0, f0
/* 00007B90 D01E0010 */ stfs f0, 0x10(r30)
/* 00007B94 C01C000C */ lfs f0, 0xc(r28)
/* 00007B98 D01E0014 */ stfs f0, 0x14(r30)
/* 00007B9C C03E000C */ lfs f1, 0xc(r30)
/* 00007BA0 C0010028 */ lfs f0, 0x28(r1)
/* 00007BA4 EC010028 */ fsubs f0, f1, f0
/* 00007BA8 D0010028 */ stfs f0, 0x28(r1)
/* 00007BAC C03E0010 */ lfs f1, 0x10(r30)
/* 00007BB0 C001002C */ lfs f0, 0x2c(r1)
/* 00007BB4 EC010028 */ fsubs f0, f1, f0
/* 00007BB8 D001002C */ stfs f0, 0x2c(r1)
/* 00007BBC C03E0014 */ lfs f1, 0x14(r30)
/* 00007BC0 C0010030 */ lfs f0, 0x30(r1)
/* 00007BC4 EC010028 */ fsubs f0, f1, f0
/* 00007BC8 D0010030 */ stfs f0, 0x30(r1)
/* 00007BCC C0010030 */ lfs f0, 0x30(r1)
/* 00007BD0 C0210028 */ lfs f1, 0x28(r1)
/* 00007BD4 EC210072 */ fmuls f1, f1, f1
/* 00007BD8 EC20083A */ fmadds f1, f0, f0, f1
/* 00007BDC 4BFF8571 */ bl mathutil_sqrt
/* 00007BE0 FC400890 */ fmr f2, f1
/* 00007BE4 C021002C */ lfs f1, 0x2c(r1)
/* 00007BE8 4BFF8565 */ bl mathutil_atan2
/* 00007BEC A89E010C */ lha r4, 0x10c(r30)
/* 00007BF0 2C040050 */ cmpwi r4, 0x50
/* 00007BF4 40800010 */ bge lbl_00007C04
/* 00007BF8 38040001 */ addi r0, r4, 1
/* 00007BFC B01E010C */ sth r0, 0x10c(r30)
/* 00007C00 4800000C */ b lbl_00007C0C
lbl_00007C04:
/* 00007C04 38000050 */ li r0, 0x50
/* 00007C08 B01E010C */ sth r0, 0x10c(r30)
lbl_00007C0C:
/* 00007C0C A81E001C */ lha r0, 0x1c(r30)
/* 00007C10 3C800000 */ lis r4, lbl_0000C2F0@ha
/* 00007C14 C8240000 */ lfd f1, lbl_0000C2F0@l(r4)
/* 00007C18 3CA00000 */ lis r5, lbl_0000C2F0@ha
/* 00007C1C 6C008000 */ xoris r0, r0, 0x8000
/* 00007C20 9001005C */ stw r0, 0x5c(r1)
/* 00007C24 3CE04330 */ lis r7, 0x4330
/* 00007C28 C8650000 */ lfd f3, lbl_0000C2F0@l(r5)
/* 00007C2C 3C800000 */ lis r4, lbl_0000C2F0@ha
/* 00007C30 90E10058 */ stw r7, 0x58(r1)
/* 00007C34 C85F0040 */ lfd f2, 0x40(r31)
/* 00007C38 3CA00000 */ lis r5, lbl_0000C2F0@ha
/* 00007C3C 90010064 */ stw r0, 0x64(r1)
/* 00007C40 7C600734 */ extsh r0, r3
/* 00007C44 C8010058 */ lfd f0, 0x58(r1)
/* 00007C48 90E10060 */ stw r7, 0x60(r1)
/* 00007C4C FC000828 */ fsub f0, f0, f1
/* 00007C50 A8DE001A */ lha r6, 0x1a(r30)
/* 00007C54 C8210060 */ lfd f1, 0x60(r1)
/* 00007C58 A87E010C */ lha r3, 0x10c(r30)
/* 00007C5C FC020032 */ fmul f0, f2, f0
/* 00007C60 7F861A14 */ add r28, r6, r3
/* 00007C64 FC211828 */ fsub f1, f1, f3
/* 00007C68 387E000C */ addi r3, r30, 0xc
/* 00007C6C FC010028 */ fsub f0, f1, f0
/* 00007C70 FC00001E */ fctiwz f0, f0
/* 00007C74 D8010050 */ stfd f0, 0x50(r1)
/* 00007C78 80C10054 */ lwz r6, 0x54(r1)
/* 00007C7C B0DE001C */ sth r6, 0x1c(r30)
/* 00007C80 A8DE00B8 */ lha r6, 0xb8(r30)
/* 00007C84 C8240000 */ lfd f1, lbl_0000C2F0@l(r4)
/* 00007C88 7C060050 */ subf r0, r6, r0
/* 00007C8C C85F0020 */ lfd f2, 0x20(r31)
/* 00007C90 6C008000 */ xoris r0, r0, 0x8000
/* 00007C94 C8650000 */ lfd f3, lbl_0000C2F0@l(r5)
/* 00007C98 90010044 */ stw r0, 0x44(r1)
/* 00007C9C 6CC08000 */ xoris r0, r6, 0x8000
/* 00007CA0 90E10040 */ stw r7, 0x40(r1)
/* 00007CA4 9001004C */ stw r0, 0x4c(r1)
/* 00007CA8 C8010040 */ lfd f0, 0x40(r1)
/* 00007CAC 90E10048 */ stw r7, 0x48(r1)
/* 00007CB0 FC000828 */ fsub f0, f0, f1
/* 00007CB4 C8210048 */ lfd f1, 0x48(r1)
/* 00007CB8 FC020032 */ fmul f0, f2, f0
/* 00007CBC FC211828 */ fsub f1, f1, f3
/* 00007CC0 FC01002A */ fadd f0, f1, f0
/* 00007CC4 FC00001E */ fctiwz f0, f0
/* 00007CC8 D8010038 */ stfd f0, 0x38(r1)
/* 00007CCC 83A1003C */ lwz r29, 0x3c(r1)
/* 00007CD0 B3BE00B8 */ sth r29, 0xb8(r30)
/* 00007CD4 4BFF8479 */ bl mathutil_mtxA_from_translate
/* 00007CD8 7F830734 */ extsh r3, r28
/* 00007CDC 4BFF8471 */ bl mathutil_mtxA_rotate_y
/* 00007CE0 7FA30734 */ extsh r3, r29
/* 00007CE4 4BFF8469 */ bl mathutil_mtxA_rotate_x
/* 00007CE8 C01F0008 */ lfs f0, 8(r31)
/* 00007CEC 38610028 */ addi r3, r1, 0x28
/* 00007CF0 389E00AC */ addi r4, r30, 0xac
/* 00007CF4 D0010028 */ stfs f0, 0x28(r1)
/* 00007CF8 C01F0008 */ lfs f0, 8(r31)
/* 00007CFC D001002C */ stfs f0, 0x2c(r1)
/* 00007D00 C01F0010 */ lfs f0, 0x10(r31)
/* 00007D04 D0010030 */ stfs f0, 0x30(r1)
/* 00007D08 4BFF8445 */ bl mathutil_mtxA_tf_point
/* 00007D0C A89E001A */ lha r4, 0x1a(r30)
/* 00007D10 3C7D0001 */ addis r3, r29, 1
/* 00007D14 3803F300 */ addi r0, r3, -3328
/* 00007D18 7C64E050 */ subf r3, r4, r28
/* 00007D1C B07E010C */ sth r3, 0x10c(r30)
/* 00007D20 387E000C */ addi r3, r30, 0xc
/* 00007D24 B39E001A */ sth r28, 0x1a(r30)
/* 00007D28 B01E0018 */ sth r0, 0x18(r30)
/* 00007D2C 4BFF8421 */ bl mathutil_mtxA_from_translate
/* 00007D30 A87E001A */ lha r3, 0x1a(r30)
/* 00007D34 4BFF8419 */ bl mathutil_mtxA_rotate_y
/* 00007D38 A87E0018 */ lha r3, 0x18(r30)
/* 00007D3C 4BFF8411 */ bl mathutil_mtxA_rotate_x
/* 00007D40 C01F0008 */ lfs f0, 8(r31)
/* 00007D44 D0010028 */ stfs f0, 0x28(r1)
/* 00007D48 C01F0008 */ lfs f0, 8(r31)
/* 00007D4C D001002C */ stfs f0, 0x2c(r1)
/* 00007D50 C01F000C */ lfs f0, 0xc(r31)
/* 00007D54 C03F0010 */ lfs f1, 0x10(r31)
/* 00007D58 EC210072 */ fmuls f1, f1, f1
/* 00007D5C EC20083A */ fmadds f1, f0, f0, f1
/* 00007D60 4BFF83ED */ bl mathutil_sqrt
/* 00007D64 D0210030 */ stfs f1, 0x30(r1)
/* 00007D68 389E0000 */ addi r4, r30, 0
/* 00007D6C 38610028 */ addi r3, r1, 0x28
/* 00007D70 4BFF83DD */ bl mathutil_mtxA_tf_point
/* 00007D74 C03E0000 */ lfs f1, 0(r30)
/* 00007D78 C001001C */ lfs f0, 0x1c(r1)
/* 00007D7C EC010028 */ fsubs f0, f1, f0
/* 00007D80 D01E0094 */ stfs f0, 0x94(r30)
/* 00007D84 C03E0004 */ lfs f1, 4(r30)
/* 00007D88 C0010020 */ lfs f0, 0x20(r1)
/* 00007D8C EC010028 */ fsubs f0, f1, f0
/* 00007D90 D01E0098 */ stfs f0, 0x98(r30)
/* 00007D94 C03E0008 */ lfs f1, 8(r30)
/* 00007D98 C0010024 */ lfs f0, 0x24(r1)
/* 00007D9C EC010028 */ fsubs f0, f1, f0
/* 00007DA0 D01E009C */ stfs f0, 0x9c(r30)
/* 00007DA4 C03E000C */ lfs f1, 0xc(r30)
/* 00007DA8 C0010010 */ lfs f0, 0x10(r1)
/* 00007DAC EC010028 */ fsubs f0, f1, f0
/* 00007DB0 D01E00A0 */ stfs f0, 0xa0(r30)
/* 00007DB4 C03E0010 */ lfs f1, 0x10(r30)
/* 00007DB8 C0010014 */ lfs f0, 0x14(r1)
/* 00007DBC EC010028 */ fsubs f0, f1, f0
/* 00007DC0 D01E00A4 */ stfs f0, 0xa4(r30)
/* 00007DC4 C03E0014 */ lfs f1, 0x14(r30)
/* 00007DC8 C0010018 */ lfs f0, 0x18(r1)
/* 00007DCC EC010028 */ fsubs f0, f1, f0
/* 00007DD0 D01E00A8 */ stfs f0, 0xa8(r30)
lbl_00007DD4:
/* 00007DD4 8001007C */ lwz r0, 0x7c(r1)
/* 00007DD8 83E10074 */ lwz r31, 0x74(r1)
/* 00007DDC 83C10070 */ lwz r30, 0x70(r1)
/* 00007DE0 7C0803A6 */ mtlr r0
/* 00007DE4 83A1006C */ lwz r29, 0x6c(r1)
/* 00007DE8 83810068 */ lwz r28, 0x68(r1)
/* 00007DEC 38210078 */ addi r1, r1, 0x78
/* 00007DF0 4E800020 */ blr 
