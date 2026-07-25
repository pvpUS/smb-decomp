/* 00024A40 7C0802A6 */ mflr r0
/* 00024A44 3C600000 */ lis r3, lbl_0002A9E8@ha
/* 00024A48 90010004 */ stw r0, 4(r1)
/* 00024A4C 9421FFA0 */ stwu r1, -0x60(r1)
/* 00024A50 93E1005C */ stw r31, 0x5c(r1)
/* 00024A54 3BE30000 */ addi r31, r3, lbl_0002A9E8@l
/* 00024A58 3C600000 */ lis r3, lbl_10000210@ha
/* 00024A5C 93C10058 */ stw r30, 0x58(r1)
/* 00024A60 93A10054 */ stw r29, 0x54(r1)
/* 00024A64 3BA30000 */ addi r29, r3, lbl_10000210@l
/* 00024A68 3C600000 */ lis r3, lbl_00026A38@ha
/* 00024A6C 93810050 */ stw r28, 0x50(r1)
/* 00024A70 3BC30000 */ addi r30, r3, lbl_00026A38@l
/* 00024A74 881F0000 */ lbz r0, 0(r31)
/* 00024A78 28000002 */ cmplwi r0, 2
/* 00024A7C 4182005C */ beq lbl_00024AD8
/* 00024A80 38000002 */ li r0, 2
/* 00024A84 981F0000 */ stb r0, 0(r31)
/* 00024A88 38000000 */ li r0, 0
/* 00024A8C 3C600000 */ lis r3, modeCtrl@ha
/* 00024A90 38630000 */ addi r3, r3, modeCtrl@l
/* 00024A94 901F0004 */ stw r0, 4(r31)
/* 00024A98 3883002C */ addi r4, r3, 0x2c
/* 00024A9C 8003002C */ lwz r0, 0x2c(r3)
/* 00024AA0 3C600000 */ lis r3, ballInfo@ha
/* 00024AA4 38630000 */ addi r3, r3, ballInfo@l
/* 00024AA8 1C0001A4 */ mulli r0, r0, 0x1a4
/* 00024AAC 38A300FC */ addi r5, r3, 0xfc
/* 00024AB0 7C65002E */ lwzx r3, r5, r0
/* 00024AB4 80030014 */ lwz r0, 0x14(r3)
/* 00024AB8 540004E2 */ rlwinm r0, r0, 0, 0x13, 0x11
/* 00024ABC 90030014 */ stw r0, 0x14(r3)
/* 00024AC0 80040000 */ lwz r0, 0(r4)
/* 00024AC4 1C0001A4 */ mulli r0, r0, 0x1a4
/* 00024AC8 7C65002E */ lwzx r3, r5, r0
/* 00024ACC 80030014 */ lwz r0, 0x14(r3)
/* 00024AD0 54000524 */ rlwinm r0, r0, 0, 0x14, 0x12
/* 00024AD4 90030014 */ stw r0, 0x14(r3)
lbl_00024AD8:
/* 00024AD8 801F0004 */ lwz r0, 4(r31)
/* 00024ADC 28000023 */ cmplwi r0, 0x23
/* 00024AE0 418102C8 */ bgt lbl_00024DA8
/* 00024AE4 3C600000 */ lis r3, modeCtrl@ha
/* 00024AE8 C03E000C */ lfs f1, 0xc(r30)
/* 00024AEC 38630000 */ addi r3, r3, modeCtrl@l
/* 00024AF0 8003002C */ lwz r0, 0x2c(r3)
/* 00024AF4 3C600000 */ lis r3, ballInfo@ha
/* 00024AF8 38630000 */ addi r3, r3, ballInfo@l
/* 00024AFC 1C0001A4 */ mulli r0, r0, 0x1a4
/* 00024B00 7C630214 */ add r3, r3, r0
/* 00024B04 806300FC */ lwz r3, 0xfc(r3)
/* 00024B08 3880000D */ li r4, 0xd
/* 00024B0C 38A00003 */ li r5, 3
/* 00024B10 38C00000 */ li r6, 0
/* 00024B14 4BFDB6BD */ bl new_ape_stat_motion
/* 00024B18 C03E0000 */ lfs f1, 0(r30)
/* 00024B1C C05E0004 */ lfs f2, 4(r30)
/* 00024B20 C07E0008 */ lfs f3, 8(r30)
/* 00024B24 4BFDB6AD */ bl mathutil_mtxA_from_translate_xyz
/* 00024B28 809F0004 */ lwz r4, 4(r31)
/* 00024B2C 28040012 */ cmplwi r4, 0x12
/* 00024B30 41810110 */ bgt lbl_00024C40
/* 00024B34 90810044 */ stw r4, 0x44(r1)
/* 00024B38 3F804330 */ lis r28, 0x4330
/* 00024B3C 3C600000 */ lis r3, lbl_00026A60@ha
/* 00024B40 C07E0030 */ lfs f3, 0x30(r30)
/* 00024B44 93810040 */ stw r28, 0x40(r1)
/* 00024B48 20040012 */ subfic r0, r4, 0x12
/* 00024B4C C8230000 */ lfd f1, lbl_00026A60@l(r3)
/* 00024B50 C8010040 */ lfd f0, 0x40(r1)
/* 00024B54 9001004C */ stw r0, 0x4c(r1)
/* 00024B58 EC000828 */ fsubs f0, f0, f1
/* 00024B5C C05E0034 */ lfs f2, 0x34(r30)
/* 00024B60 C03E000C */ lfs f1, 0xc(r30)
/* 00024B64 93810048 */ stw r28, 0x48(r1)
/* 00024B68 EC001824 */ fdivs f0, f0, f3
/* 00024B6C EC020032 */ fmuls f0, f2, f0
/* 00024B70 EC01002A */ fadds f0, f1, f0
/* 00024B74 FC00001E */ fctiwz f0, f0
/* 00024B78 D8010038 */ stfd f0, 0x38(r1)
/* 00024B7C 8061003C */ lwz r3, 0x3c(r1)
/* 00024B80 4BFDB651 */ bl mathutil_mtxA_rotate_z
/* 00024B84 801F0004 */ lwz r0, 4(r31)
/* 00024B88 3C600000 */ lis r3, lbl_00026A60@ha
/* 00024B8C C8230000 */ lfd f1, lbl_00026A60@l(r3)
/* 00024B90 9001002C */ stw r0, 0x2c(r1)
/* 00024B94 20000012 */ subfic r0, r0, 0x12
/* 00024B98 C07E0030 */ lfs f3, 0x30(r30)
/* 00024B9C 93810028 */ stw r28, 0x28(r1)
/* 00024BA0 C05E0038 */ lfs f2, 0x38(r30)
/* 00024BA4 C8010028 */ lfd f0, 0x28(r1)
/* 00024BA8 90010034 */ stw r0, 0x34(r1)
/* 00024BAC EC000828 */ fsubs f0, f0, f1
/* 00024BB0 C03E000C */ lfs f1, 0xc(r30)
/* 00024BB4 93810030 */ stw r28, 0x30(r1)
/* 00024BB8 EC001824 */ fdivs f0, f0, f3
/* 00024BBC EC020032 */ fmuls f0, f2, f0
/* 00024BC0 EC01002A */ fadds f0, f1, f0
/* 00024BC4 FC00001E */ fctiwz f0, f0
/* 00024BC8 D8010020 */ stfd f0, 0x20(r1)
/* 00024BCC 80610024 */ lwz r3, 0x24(r1)
/* 00024BD0 4BFDB601 */ bl mathutil_mtxA_rotate_y
/* 00024BD4 80BF0004 */ lwz r5, 4(r31)
/* 00024BD8 3C800000 */ lis r4, lbl_00026A60@ha
/* 00024BDC 3C600000 */ lis r3, lbl_00026A60@ha
/* 00024BE0 C8840000 */ lfd f4, lbl_00026A60@l(r4)
/* 00024BE4 20050012 */ subfic r0, r5, 0x12
/* 00024BE8 9001001C */ stw r0, 0x1c(r1)
/* 00024BEC C8230000 */ lfd f1, lbl_00026A60@l(r3)
/* 00024BF0 90A10014 */ stw r5, 0x14(r1)
/* 00024BF4 C07E0030 */ lfs f3, 0x30(r30)
/* 00024BF8 93810018 */ stw r28, 0x18(r1)
/* 00024BFC C0BE001C */ lfs f5, 0x1c(r30)
/* 00024C00 93810010 */ stw r28, 0x10(r1)
/* 00024C04 C8410018 */ lfd f2, 0x18(r1)
/* 00024C08 C8010010 */ lfd f0, 0x10(r1)
/* 00024C0C EC822028 */ fsubs f4, f2, f4
/* 00024C10 C05E003C */ lfs f2, 0x3c(r30)
/* 00024C14 EC000828 */ fsubs f0, f0, f1
/* 00024C18 EC241824 */ fdivs f1, f4, f3
/* 00024C1C EC001824 */ fdivs f0, f0, f3
/* 00024C20 EC250072 */ fmuls f1, f5, f1
/* 00024C24 EC020032 */ fmuls f0, f2, f0
/* 00024C28 EC01002A */ fadds f0, f1, f0
/* 00024C2C FC00001E */ fctiwz f0, f0
/* 00024C30 D8010008 */ stfd f0, 8(r1)
/* 00024C34 8061000C */ lwz r3, 0xc(r1)
/* 00024C38 4BFDB599 */ bl mathutil_mtxA_rotate_x
/* 00024C3C 48000148 */ b lbl_00024D84
lbl_00024C40:
/* 00024C40 20640023 */ subfic r3, r4, 0x23
/* 00024C44 C07E0024 */ lfs f3, 0x24(r30)
/* 00024C48 3804FFEF */ addi r0, r4, -17
/* 00024C4C 9061000C */ stw r3, 0xc(r1)
/* 00024C50 3F804330 */ lis r28, 0x4330
/* 00024C54 C0DE0034 */ lfs f6, 0x34(r30)
/* 00024C58 90010014 */ stw r0, 0x14(r1)
/* 00024C5C 3C800000 */ lis r4, lbl_00026A60@ha
/* 00024C60 3C600000 */ lis r3, lbl_00026A60@ha
/* 00024C64 C8A40000 */ lfd f5, lbl_00026A60@l(r4)
/* 00024C68 93810008 */ stw r28, 8(r1)
/* 00024C6C C8230000 */ lfd f1, lbl_00026A60@l(r3)
/* 00024C70 93810010 */ stw r28, 0x10(r1)
/* 00024C74 C8810008 */ lfd f4, 8(r1)
/* 00024C78 C8010010 */ lfd f0, 0x10(r1)
/* 00024C7C EC842828 */ fsubs f4, f4, f5
/* 00024C80 C05E0010 */ lfs f2, 0x10(r30)
/* 00024C84 EC000828 */ fsubs f0, f0, f1
/* 00024C88 EC241824 */ fdivs f1, f4, f3
/* 00024C8C EC001824 */ fdivs f0, f0, f3
/* 00024C90 EC260072 */ fmuls f1, f6, f1
/* 00024C94 EC020032 */ fmuls f0, f2, f0
/* 00024C98 EC01002A */ fadds f0, f1, f0
/* 00024C9C FC00001E */ fctiwz f0, f0
/* 00024CA0 D8010018 */ stfd f0, 0x18(r1)
/* 00024CA4 8061001C */ lwz r3, 0x1c(r1)
/* 00024CA8 4BFDB529 */ bl mathutil_mtxA_rotate_z
/* 00024CAC 80DF0004 */ lwz r6, 4(r31)
/* 00024CB0 3C800000 */ lis r4, lbl_00026A60@ha
/* 00024CB4 3C600000 */ lis r3, lbl_00026A60@ha
/* 00024CB8 C8840000 */ lfd f4, lbl_00026A60@l(r4)
/* 00024CBC 20A60023 */ subfic r5, r6, 0x23
/* 00024CC0 3806FFEF */ addi r0, r6, -17
/* 00024CC4 90A10024 */ stw r5, 0x24(r1)
/* 00024CC8 C8230000 */ lfd f1, lbl_00026A60@l(r3)
/* 00024CCC 9001002C */ stw r0, 0x2c(r1)
/* 00024CD0 C07E0024 */ lfs f3, 0x24(r30)
/* 00024CD4 93810020 */ stw r28, 0x20(r1)
/* 00024CD8 C0BE0038 */ lfs f5, 0x38(r30)
/* 00024CDC 93810028 */ stw r28, 0x28(r1)
/* 00024CE0 C8410020 */ lfd f2, 0x20(r1)
/* 00024CE4 C8010028 */ lfd f0, 0x28(r1)
/* 00024CE8 EC822028 */ fsubs f4, f2, f4
/* 00024CEC C05E0040 */ lfs f2, 0x40(r30)
/* 00024CF0 EC000828 */ fsubs f0, f0, f1
/* 00024CF4 EC241824 */ fdivs f1, f4, f3
/* 00024CF8 EC001824 */ fdivs f0, f0, f3
/* 00024CFC EC250072 */ fmuls f1, f5, f1
/* 00024D00 EC020032 */ fmuls f0, f2, f0
/* 00024D04 EC01002A */ fadds f0, f1, f0
/* 00024D08 FC00001E */ fctiwz f0, f0
/* 00024D0C D8010030 */ stfd f0, 0x30(r1)
/* 00024D10 80610034 */ lwz r3, 0x34(r1)
/* 00024D14 4BFDB4BD */ bl mathutil_mtxA_rotate_y
/* 00024D18 80DF0004 */ lwz r6, 4(r31)
/* 00024D1C 3C800000 */ lis r4, lbl_00026A60@ha
/* 00024D20 3C600000 */ lis r3, lbl_00026A60@ha
/* 00024D24 C8840000 */ lfd f4, lbl_00026A60@l(r4)
/* 00024D28 20A60023 */ subfic r5, r6, 0x23
/* 00024D2C 3806FFEF */ addi r0, r6, -17
/* 00024D30 90A1003C */ stw r5, 0x3c(r1)
/* 00024D34 C8230000 */ lfd f1, lbl_00026A60@l(r3)
/* 00024D38 90010044 */ stw r0, 0x44(r1)
/* 00024D3C C07E0024 */ lfs f3, 0x24(r30)
/* 00024D40 93810038 */ stw r28, 0x38(r1)
/* 00024D44 C0BE003C */ lfs f5, 0x3c(r30)
/* 00024D48 93810040 */ stw r28, 0x40(r1)
/* 00024D4C C8410038 */ lfd f2, 0x38(r1)
/* 00024D50 C8010040 */ lfd f0, 0x40(r1)
/* 00024D54 EC822028 */ fsubs f4, f2, f4
/* 00024D58 C05E0044 */ lfs f2, 0x44(r30)
/* 00024D5C EC000828 */ fsubs f0, f0, f1
/* 00024D60 EC241824 */ fdivs f1, f4, f3
/* 00024D64 EC001824 */ fdivs f0, f0, f3
/* 00024D68 EC250072 */ fmuls f1, f5, f1
/* 00024D6C EC020032 */ fmuls f0, f2, f0
/* 00024D70 EC01002A */ fadds f0, f1, f0
/* 00024D74 FC00001E */ fctiwz f0, f0
/* 00024D78 D8010048 */ stfd f0, 0x48(r1)
/* 00024D7C 8061004C */ lwz r3, 0x4c(r1)
/* 00024D80 4BFDB451 */ bl mathutil_mtxA_rotate_x
lbl_00024D84:
/* 00024D84 7FA3EB78 */ mr r3, r29
/* 00024D88 4BFDB449 */ bl mathutil_mtxA_to_mtx
/* 00024D8C 7FA3EB78 */ mr r3, r29
/* 00024D90 4BFE4C25 */ bl lbl_000099B4
/* 00024D94 809F0004 */ lwz r4, 4(r31)
/* 00024D98 38600000 */ li r3, 0
/* 00024D9C 38040001 */ addi r0, r4, 1
/* 00024DA0 901F0004 */ stw r0, 4(r31)
/* 00024DA4 480000AC */ b lbl_00024E50
lbl_00024DA8:
/* 00024DA8 3C600000 */ lis r3, modeCtrl@ha
/* 00024DAC C03E000C */ lfs f1, 0xc(r30)
/* 00024DB0 38630000 */ addi r3, r3, modeCtrl@l
/* 00024DB4 3B83002C */ addi r28, r3, 0x2c
/* 00024DB8 8003002C */ lwz r0, 0x2c(r3)
/* 00024DBC 3C600000 */ lis r3, ballInfo@ha
/* 00024DC0 38630000 */ addi r3, r3, ballInfo@l
/* 00024DC4 1C0001A4 */ mulli r0, r0, 0x1a4
/* 00024DC8 3BE300FC */ addi r31, r3, 0xfc
/* 00024DCC 7C7F002E */ lwzx r3, r31, r0
/* 00024DD0 3880000D */ li r4, 0xd
/* 00024DD4 38A00004 */ li r5, 4
/* 00024DD8 38C00000 */ li r6, 0
/* 00024DDC 4BFDB3F5 */ bl new_ape_stat_motion
/* 00024DE0 C03E0000 */ lfs f1, 0(r30)
/* 00024DE4 C05E0004 */ lfs f2, 4(r30)
/* 00024DE8 C07E0008 */ lfs f3, 8(r30)
/* 00024DEC 4BFDB3E5 */ bl mathutil_mtxA_from_translate_xyz
/* 00024DF0 3C600001 */ lis r3, 1
/* 00024DF4 38638000 */ addi r3, r3, -32768
/* 00024DF8 4BFDB3D9 */ bl mathutil_mtxA_rotate_z
/* 00024DFC 3860DC72 */ li r3, -9102
/* 00024E00 4BFDB3D1 */ bl mathutil_mtxA_rotate_y
/* 00024E04 3860B8E4 */ li r3, -18204
/* 00024E08 4BFDB3C9 */ bl mathutil_mtxA_rotate_x
/* 00024E0C 7FA3EB78 */ mr r3, r29
/* 00024E10 4BFDB3C1 */ bl mathutil_mtxA_to_mtx
/* 00024E14 7FA3EB78 */ mr r3, r29
/* 00024E18 4BFE4B9D */ bl lbl_000099B4
/* 00024E1C 801C0000 */ lwz r0, 0(r28)
/* 00024E20 38600001 */ li r3, 1
/* 00024E24 1C0001A4 */ mulli r0, r0, 0x1a4
/* 00024E28 7C9F002E */ lwzx r4, r31, r0
/* 00024E2C 80040014 */ lwz r0, 0x14(r4)
/* 00024E30 540004E2 */ rlwinm r0, r0, 0, 0x13, 0x11
/* 00024E34 90040014 */ stw r0, 0x14(r4)
/* 00024E38 801C0000 */ lwz r0, 0(r28)
/* 00024E3C 1C0001A4 */ mulli r0, r0, 0x1a4
/* 00024E40 7C9F002E */ lwzx r4, r31, r0
/* 00024E44 80040014 */ lwz r0, 0x14(r4)
/* 00024E48 54000524 */ rlwinm r0, r0, 0, 0x14, 0x12
/* 00024E4C 90040014 */ stw r0, 0x14(r4)
lbl_00024E50:
/* 00024E50 80010064 */ lwz r0, 0x64(r1)
/* 00024E54 83E1005C */ lwz r31, 0x5c(r1)
/* 00024E58 83C10058 */ lwz r30, 0x58(r1)
/* 00024E5C 7C0803A6 */ mtlr r0
/* 00024E60 83A10054 */ lwz r29, 0x54(r1)
/* 00024E64 83810050 */ lwz r28, 0x50(r1)
/* 00024E68 38210060 */ addi r1, r1, 0x60
/* 00024E6C 4E800020 */ blr 
