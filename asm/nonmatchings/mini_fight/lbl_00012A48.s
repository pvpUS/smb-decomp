/* 00012A48 7C0802A6 */ mflr r0
/* 00012A4C 3CA00000 */ lis r5, lbl_10018900@ha
/* 00012A50 90010004 */ stw r0, 4(r1)
/* 00012A54 9421FFB8 */ stwu r1, -0x48(r1)
/* 00012A58 93E10044 */ stw r31, 0x44(r1)
/* 00012A5C 93C10040 */ stw r30, 0x40(r1)
/* 00012A60 3BC50000 */ addi r30, r5, lbl_10018900@l
/* 00012A64 93A1003C */ stw r29, 0x3c(r1)
/* 00012A68 3BA40000 */ addi r29, r4, 0
/* 00012A6C 93810038 */ stw r28, 0x38(r1)
/* 00012A70 7C7C1B78 */ mr r28, r3
/* 00012A74 A8030024 */ lha r0, 0x24(r3)
/* 00012A78 3C600000 */ lis r3, lbl_0001C430@ha
/* 00012A7C 3BE30000 */ addi r31, r3, lbl_0001C430@l
/* 00012A80 60000008 */ ori r0, r0, 8
/* 00012A84 B01C0024 */ sth r0, 0x24(r28)
/* 00012A88 38610010 */ addi r3, r1, 0x10
/* 00012A8C 4BFED6D9 */ bl get_curr_stage_fly_in_position
/* 00012A90 80810010 */ lwz r4, 0x10(r1)
/* 00012A94 3C600000 */ lis r3, decodedStageLzPtr@ha
/* 00012A98 80010014 */ lwz r0, 0x14(r1)
/* 00012A9C 38630000 */ addi r3, r3, decodedStageLzPtr@l
/* 00012AA0 909E0000 */ stw r4, 0(r30)
/* 00012AA4 901E0004 */ stw r0, 4(r30)
/* 00012AA8 80010018 */ lwz r0, 0x18(r1)
/* 00012AAC 901E0008 */ stw r0, 8(r30)
/* 00012AB0 C001001C */ lfs f0, 0x1c(r1)
/* 00012AB4 D01E000C */ stfs f0, 0xc(r30)
/* 00012AB8 C01F0018 */ lfs f0, 0x18(r31)
/* 00012ABC D0010020 */ stfs f0, 0x20(r1)
/* 00012AC0 C01F0018 */ lfs f0, 0x18(r31)
/* 00012AC4 D0010024 */ stfs f0, 0x24(r1)
/* 00012AC8 C01F0018 */ lfs f0, 0x18(r31)
/* 00012ACC D0010028 */ stfs f0, 0x28(r1)
/* 00012AD0 80630000 */ lwz r3, 0(r3)
/* 00012AD4 8003007C */ lwz r0, 0x7c(r3)
/* 00012AD8 80830010 */ lwz r4, 0x10(r3)
/* 00012ADC 2C000000 */ cmpwi r0, 0
/* 00012AE0 7C030378 */ mr r3, r0
/* 00012AE4 4081011C */ ble lbl_00012C00
/* 00012AE8 5460F0BF */ rlwinm. r0, r3, 0x1e, 2, 0x1f
/* 00012AEC 7C0903A6 */ mtctr r0
/* 00012AF0 418200D4 */ beq lbl_00012BC4
lbl_00012AF4:
/* 00012AF4 C0210020 */ lfs f1, 0x20(r1)
/* 00012AF8 C0040000 */ lfs f0, 0(r4)
/* 00012AFC EC01002A */ fadds f0, f1, f0
/* 00012B00 D0010020 */ stfs f0, 0x20(r1)
/* 00012B04 C0210024 */ lfs f1, 0x24(r1)
/* 00012B08 C0040004 */ lfs f0, 4(r4)
/* 00012B0C EC01002A */ fadds f0, f1, f0
/* 00012B10 D0010024 */ stfs f0, 0x24(r1)
/* 00012B14 C0040008 */ lfs f0, 8(r4)
/* 00012B18 C0210028 */ lfs f1, 0x28(r1)
/* 00012B1C EC01002A */ fadds f0, f1, f0
/* 00012B20 D0010028 */ stfs f0, 0x28(r1)
/* 00012B24 C0210020 */ lfs f1, 0x20(r1)
/* 00012B28 C0040014 */ lfs f0, 0x14(r4)
/* 00012B2C EC01002A */ fadds f0, f1, f0
/* 00012B30 D0010020 */ stfs f0, 0x20(r1)
/* 00012B34 C0210024 */ lfs f1, 0x24(r1)
/* 00012B38 C0040018 */ lfs f0, 0x18(r4)
/* 00012B3C EC01002A */ fadds f0, f1, f0
/* 00012B40 D0010024 */ stfs f0, 0x24(r1)
/* 00012B44 C004001C */ lfs f0, 0x1c(r4)
/* 00012B48 C0210028 */ lfs f1, 0x28(r1)
/* 00012B4C EC01002A */ fadds f0, f1, f0
/* 00012B50 D0010028 */ stfs f0, 0x28(r1)
/* 00012B54 C0210020 */ lfs f1, 0x20(r1)
/* 00012B58 C0040028 */ lfs f0, 0x28(r4)
/* 00012B5C EC01002A */ fadds f0, f1, f0
/* 00012B60 D0010020 */ stfs f0, 0x20(r1)
/* 00012B64 C0210024 */ lfs f1, 0x24(r1)
/* 00012B68 C004002C */ lfs f0, 0x2c(r4)
/* 00012B6C EC01002A */ fadds f0, f1, f0
/* 00012B70 D0010024 */ stfs f0, 0x24(r1)
/* 00012B74 C0040030 */ lfs f0, 0x30(r4)
/* 00012B78 C0210028 */ lfs f1, 0x28(r1)
/* 00012B7C EC01002A */ fadds f0, f1, f0
/* 00012B80 D0010028 */ stfs f0, 0x28(r1)
/* 00012B84 C0210020 */ lfs f1, 0x20(r1)
/* 00012B88 C004003C */ lfs f0, 0x3c(r4)
/* 00012B8C EC01002A */ fadds f0, f1, f0
/* 00012B90 D0010020 */ stfs f0, 0x20(r1)
/* 00012B94 C0210024 */ lfs f1, 0x24(r1)
/* 00012B98 C0040040 */ lfs f0, 0x40(r4)
/* 00012B9C EC01002A */ fadds f0, f1, f0
/* 00012BA0 D0010024 */ stfs f0, 0x24(r1)
/* 00012BA4 C0040044 */ lfs f0, 0x44(r4)
/* 00012BA8 38840050 */ addi r4, r4, 0x50
/* 00012BAC C0210028 */ lfs f1, 0x28(r1)
/* 00012BB0 EC01002A */ fadds f0, f1, f0
/* 00012BB4 D0010028 */ stfs f0, 0x28(r1)
/* 00012BB8 4200FF3C */ bdnz lbl_00012AF4
/* 00012BBC 70630003 */ andi. r3, r3, 3
/* 00012BC0 41820040 */ beq lbl_00012C00
lbl_00012BC4:
/* 00012BC4 7C6903A6 */ mtctr r3
lbl_00012BC8:
/* 00012BC8 C0210020 */ lfs f1, 0x20(r1)
/* 00012BCC C0040000 */ lfs f0, 0(r4)
/* 00012BD0 EC01002A */ fadds f0, f1, f0
/* 00012BD4 D0010020 */ stfs f0, 0x20(r1)
/* 00012BD8 C0210024 */ lfs f1, 0x24(r1)
/* 00012BDC C0040004 */ lfs f0, 4(r4)
/* 00012BE0 EC01002A */ fadds f0, f1, f0
/* 00012BE4 D0010024 */ stfs f0, 0x24(r1)
/* 00012BE8 C0040008 */ lfs f0, 8(r4)
/* 00012BEC 38840014 */ addi r4, r4, 0x14
/* 00012BF0 C0210028 */ lfs f1, 0x28(r1)
/* 00012BF4 EC01002A */ fadds f0, f1, f0
/* 00012BF8 D0010028 */ stfs f0, 0x28(r1)
/* 00012BFC 4200FFCC */ bdnz lbl_00012BC8
lbl_00012C00:
/* 00012C00 3C600000 */ lis r3, decodedStageLzPtr@ha
/* 00012C04 C07F0038 */ lfs f3, 0x38(r31)
/* 00012C08 80830000 */ lwz r4, decodedStageLzPtr@l(r3)
/* 00012C0C 3C600000 */ lis r3, lbl_0001C470@ha
/* 00012C10 C8430000 */ lfd f2, lbl_0001C470@l(r3)
/* 00012C14 3C004330 */ lis r0, 0x4330
/* 00012C18 8084007C */ lwz r4, 0x7c(r4)
/* 00012C1C C0010020 */ lfs f0, 0x20(r1)
/* 00012C20 38BC000C */ addi r5, r28, 0xc
/* 00012C24 6C838000 */ xoris r3, r4, 0x8000
/* 00012C28 90610034 */ stw r3, 0x34(r1)
/* 00012C2C 90010030 */ stw r0, 0x30(r1)
/* 00012C30 C8210030 */ lfd f1, 0x30(r1)
/* 00012C34 EC211028 */ fsubs f1, f1, f2
/* 00012C38 EC230824 */ fdivs f1, f3, f1
/* 00012C3C EC000072 */ fmuls f0, f0, f1
/* 00012C40 D01E0010 */ stfs f0, 0x10(r30)
/* 00012C44 C0010024 */ lfs f0, 0x24(r1)
/* 00012C48 EC000072 */ fmuls f0, f0, f1
/* 00012C4C D01E0014 */ stfs f0, 0x14(r30)
/* 00012C50 C0010028 */ lfs f0, 0x28(r1)
/* 00012C54 EC000072 */ fmuls f0, f0, f1
/* 00012C58 D01E0018 */ stfs f0, 0x18(r30)
/* 00012C5C 807C000C */ lwz r3, 0xc(r28)
/* 00012C60 801C0010 */ lwz r0, 0x10(r28)
/* 00012C64 907C0054 */ stw r3, 0x54(r28)
/* 00012C68 901C0058 */ stw r0, 0x58(r28)
/* 00012C6C 801C0014 */ lwz r0, 0x14(r28)
/* 00012C70 901C005C */ stw r0, 0x5c(r28)
/* 00012C74 C0BC0000 */ lfs f5, 0(r28)
/* 00012C78 C0450000 */ lfs f2, 0(r5)
/* 00012C7C C09C0004 */ lfs f4, 4(r28)
/* 00012C80 C0250004 */ lfs f1, 4(r5)
/* 00012C84 C07C0008 */ lfs f3, 8(r28)
/* 00012C88 C0050008 */ lfs f0, 8(r5)
/* 00012C8C ECA51028 */ fsubs f5, f5, f2
/* 00012C90 EC840828 */ fsubs f4, f4, f1
/* 00012C94 EC630028 */ fsubs f3, f3, f0
/* 00012C98 EC250172 */ fmuls f1, f5, f5
/* 00012C9C EC24093A */ fmadds f1, f4, f4, f1
/* 00012CA0 EC2308FA */ fmadds f1, f3, f3, f1
/* 00012CA4 4BFED4C1 */ bl mathutil_sqrt
/* 00012CA8 D03C0060 */ stfs f1, 0x60(r28)
/* 00012CAC 3C600000 */ lis r3, lbl_802F1EA2@ha
/* 00012CB0 38630000 */ addi r3, r3, lbl_802F1EA2@l
/* 00012CB4 A81C001A */ lha r0, 0x1a(r28)
/* 00012CB8 901C006C */ stw r0, 0x6c(r28)
/* 00012CBC A81C0018 */ lha r0, 0x18(r28)
/* 00012CC0 901C0068 */ stw r0, 0x68(r28)
/* 00012CC4 A81C001C */ lha r0, 0x1c(r28)
/* 00012CC8 901C0070 */ stw r0, 0x70(r28)
/* 00012CCC 809E0010 */ lwz r4, 0x10(r30)
/* 00012CD0 801E0014 */ lwz r0, 0x14(r30)
/* 00012CD4 909C0074 */ stw r4, 0x74(r28)
/* 00012CD8 901C0078 */ stw r0, 0x78(r28)
/* 00012CDC 801E0018 */ lwz r0, 0x18(r30)
/* 00012CE0 901C007C */ stw r0, 0x7c(r28)
/* 00012CE4 A8630000 */ lha r3, 0(r3)
/* 00012CE8 4BFED47D */ bl mathutil_mtxA_from_rotate_x
/* 00012CEC C01F0018 */ lfs f0, 0x18(r31)
/* 00012CF0 38610020 */ addi r3, r1, 0x20
/* 00012CF4 38830000 */ addi r4, r3, 0
/* 00012CF8 D0010020 */ stfs f0, 0x20(r1)
/* 00012CFC C01F0018 */ lfs f0, 0x18(r31)
/* 00012D00 D0010024 */ stfs f0, 0x24(r1)
/* 00012D04 C01F003C */ lfs f0, 0x3c(r31)
/* 00012D08 D0010028 */ stfs f0, 0x28(r1)
/* 00012D0C 4BFED459 */ bl mathutil_mtxA_tf_vec
/* 00012D10 387C0074 */ addi r3, r28, 0x74
/* 00012D14 4BFED451 */ bl mathutil_mtxA_from_translate
/* 00012D18 3C600000 */ lis r3, lbl_802F1EA0@ha
/* 00012D1C 38630000 */ addi r3, r3, lbl_802F1EA0@l
/* 00012D20 A0630000 */ lhz r3, 0(r3)
/* 00012D24 4BFED441 */ bl mathutil_mtxA_rotate_y
/* 00012D28 38610020 */ addi r3, r1, 0x20
/* 00012D2C 38830000 */ addi r4, r3, 0
/* 00012D30 4BFED435 */ bl mathutil_mtxA_tf_point
/* 00012D34 C03C0074 */ lfs f1, 0x74(r28)
/* 00012D38 C0010020 */ lfs f0, 0x20(r1)
/* 00012D3C EC010028 */ fsubs f0, f1, f0
/* 00012D40 D0010020 */ stfs f0, 0x20(r1)
/* 00012D44 C03C0078 */ lfs f1, 0x78(r28)
/* 00012D48 C0010024 */ lfs f0, 0x24(r1)
/* 00012D4C EC010028 */ fsubs f0, f1, f0
/* 00012D50 D0010024 */ stfs f0, 0x24(r1)
/* 00012D54 C03C007C */ lfs f1, 0x7c(r28)
/* 00012D58 C0010028 */ lfs f0, 0x28(r1)
/* 00012D5C EC010028 */ fsubs f0, f1, f0
/* 00012D60 D0010028 */ stfs f0, 0x28(r1)
/* 00012D64 C0210020 */ lfs f1, 0x20(r1)
/* 00012D68 C0410028 */ lfs f2, 0x28(r1)
/* 00012D6C 4BFED3F9 */ bl mathutil_atan2
/* 00012D70 38038000 */ addi r0, r3, -32768
/* 00012D74 7C030734 */ extsh r3, r0
/* 00012D78 3C030001 */ addis r0, r3, 1
/* 00012D7C 901C008C */ stw r0, 0x8c(r28)
/* 00012D80 C0010028 */ lfs f0, 0x28(r1)
/* 00012D84 C0210020 */ lfs f1, 0x20(r1)
/* 00012D88 EC210072 */ fmuls f1, f1, f1
/* 00012D8C EC20083A */ fmadds f1, f0, f0, f1
/* 00012D90 4BFED3D5 */ bl mathutil_sqrt
/* 00012D94 FC400890 */ fmr f2, f1
/* 00012D98 C0210024 */ lfs f1, 0x24(r1)
/* 00012D9C 4BFED3C9 */ bl mathutil_atan2
/* 00012DA0 7C600734 */ extsh r0, r3
/* 00012DA4 901C0088 */ stw r0, 0x88(r28)
/* 00012DA8 38600000 */ li r3, 0
/* 00012DAC 38000078 */ li r0, 0x78
/* 00012DB0 907C0090 */ stw r3, 0x90(r28)
/* 00012DB4 3BC00001 */ li r30, 1
/* 00012DB8 387C0000 */ addi r3, r28, 0
/* 00012DBC A8BC0024 */ lha r5, 0x24(r28)
/* 00012DC0 389D0000 */ addi r4, r29, 0
/* 00012DC4 60A50001 */ ori r5, r5, 1
/* 00012DC8 B0BC0024 */ sth r5, 0x24(r28)
/* 00012DCC B01C0050 */ sth r0, 0x50(r28)
/* 00012DD0 B01C0052 */ sth r0, 0x52(r28)
/* 00012DD4 9BDC0026 */ stb r30, 0x26(r28)
/* 00012DD8 48000029 */ bl lbl_00012E00
/* 00012DDC 9BDC001F */ stb r30, 0x1f(r28)
/* 00012DE0 8001004C */ lwz r0, 0x4c(r1)
/* 00012DE4 83E10044 */ lwz r31, 0x44(r1)
/* 00012DE8 83C10040 */ lwz r30, 0x40(r1)
/* 00012DEC 7C0803A6 */ mtlr r0
/* 00012DF0 83A1003C */ lwz r29, 0x3c(r1)
/* 00012DF4 83810038 */ lwz r28, 0x38(r1)
/* 00012DF8 38210048 */ addi r1, r1, 0x48
/* 00012DFC 4E800020 */ blr 
