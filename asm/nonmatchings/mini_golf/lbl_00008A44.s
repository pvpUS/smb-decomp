/* 00008A44 7C0802A6 */ mflr r0
/* 00008A48 3C600000 */ lis r3, lbl_10000000@ha
/* 00008A4C 90010004 */ stw r0, 4(r1)
/* 00008A50 38000002 */ li r0, 2
/* 00008A54 9421FFD0 */ stwu r1, -0x30(r1)
/* 00008A58 BEE1000C */ stmw r23, 0xc(r1)
/* 00008A5C 3B830000 */ addi r28, r3, lbl_10000000@l
/* 00008A60 3C600000 */ lis r3, modeCtrl@ha
/* 00008A64 38630000 */ addi r3, r3, modeCtrl@l
/* 00008A68 3B63002C */ addi r27, r3, 0x2c
/* 00008A6C 3BC00004 */ li r30, 4
/* 00008A70 901C0000 */ stw r0, 0(r28)
/* 00008A74 38000000 */ li r0, 0
/* 00008A78 981C00ED */ stb r0, 0xed(r28)
/* 00008A7C 8003002C */ lwz r0, 0x2c(r3)
/* 00008A80 3C600000 */ lis r3, ballInfo@ha
/* 00008A84 3BE30000 */ addi r31, r3, ballInfo@l
/* 00008A88 1C8001A4 */ mulli r4, r0, 0x1a4
/* 00008A8C 3B5F0003 */ addi r26, r31, 3
/* 00008A90 3B1F0094 */ addi r24, r31, 0x94
/* 00008A94 7FDA21AE */ stbx r30, r26, r4
/* 00008A98 7CB82214 */ add r5, r24, r4
/* 00008A9C 80050000 */ lwz r0, 0(r5)
/* 00008AA0 3C600000 */ lis r3, lbl_000260F0@ha
/* 00008AA4 3B3F00FC */ addi r25, r31, 0xfc
/* 00008AA8 60000010 */ ori r0, r0, 0x10
/* 00008AAC 90050000 */ stw r0, 0(r5)
/* 00008AB0 3BA30000 */ addi r29, r3, lbl_000260F0@l
/* 00008AB4 80050000 */ lwz r0, 0(r5)
/* 00008AB8 540004A0 */ rlwinm r0, r0, 0, 0x12, 0x10
/* 00008ABC 90050000 */ stw r0, 0(r5)
/* 00008AC0 7C79202E */ lwzx r3, r25, r4
/* 00008AC4 80030014 */ lwz r0, 0x14(r3)
/* 00008AC8 60000020 */ ori r0, r0, 0x20
/* 00008ACC 90030014 */ stw r0, 0x14(r3)
/* 00008AD0 801B0000 */ lwz r0, 0(r27)
/* 00008AD4 7C170774 */ extsb r23, r0
/* 00008AD8 4BFFF45D */ bl lbl_00007F34
/* 00008ADC 80BB0000 */ lwz r5, 0(r27)
/* 00008AE0 3C600000 */ lis r3, lbl_00026AF8@ha
/* 00008AE4 3800001A */ li r0, 0x1a
/* 00008AE8 1CC501A4 */ mulli r6, r5, 0x1a4
/* 00008AEC 7C1A31AE */ stbx r0, r26, r6
/* 00008AF0 1C850012 */ mulli r4, r5, 0x12
/* 00008AF4 A81C003A */ lha r0, 0x3a(r28)
/* 00008AF8 38630000 */ addi r3, r3, lbl_00026AF8@l
/* 00008AFC 7C632214 */ add r3, r3, r4
/* 00008B00 7C630214 */ add r3, r3, r0
/* 00008B04 88030000 */ lbz r0, 0(r3)
/* 00008B08 28000000 */ cmplwi r0, 0
/* 00008B0C 40820014 */ bne lbl_00008B20
/* 00008B10 7C7F3214 */ add r3, r31, r6
/* 00008B14 38000001 */ li r0, 1
/* 00008B18 98030148 */ stb r0, 0x148(r3)
/* 00008B1C 4800000C */ b lbl_00008B28
lbl_00008B20:
/* 00008B20 7C7F3214 */ add r3, r31, r6
/* 00008B24 9BC30148 */ stb r30, 0x148(r3)
lbl_00008B28:
/* 00008B28 7C99302E */ lwzx r4, r25, r6
/* 00008B2C 7CA00774 */ extsb r0, r5
/* 00008B30 3C600000 */ lis r3, cameraInfo@ha
/* 00008B34 980400C0 */ stb r0, 0xc0(r4)
/* 00008B38 39830000 */ addi r12, r3, cameraInfo@l
/* 00008B3C 1C170284 */ mulli r0, r23, 0x284
/* 00008B40 807B0000 */ lwz r3, 0(r27)
/* 00008B44 1D4301A4 */ mulli r10, r3, 0x1a4
/* 00008B48 7CF85214 */ add r7, r24, r10
/* 00008B4C 80870000 */ lwz r4, 0(r7)
/* 00008B50 386C001F */ addi r3, r12, 0x1f
/* 00008B54 38C00002 */ li r6, 2
/* 00008B58 54840734 */ rlwinm r4, r4, 0, 0x1c, 0x1a
/* 00008B5C 90870000 */ stw r4, 0(r7)
/* 00008B60 7F0C0214 */ add r24, r12, r0
/* 00008B64 388C0026 */ addi r4, r12, 0x26
/* 00008B68 80070000 */ lwz r0, 0(r7)
/* 00008B6C 39200000 */ li r9, 0
/* 00008B70 38AC0024 */ addi r5, r12, 0x24
/* 00008B74 60004000 */ ori r0, r0, 0x4000
/* 00008B78 90070000 */ stw r0, 0(r7)
/* 00008B7C 39000009 */ li r8, 9
/* 00008B80 3800000B */ li r0, 0xb
/* 00008B84 7D59502E */ lwzx r10, r25, r10
/* 00008B88 3AE00000 */ li r23, 0
/* 00008B8C 80EA0014 */ lwz r7, 0x14(r10)
/* 00008B90 54E706F2 */ rlwinm r7, r7, 0, 0x1b, 0x19
/* 00008B94 90EA0014 */ stw r7, 0x14(r10)
/* 00008B98 80FB0000 */ lwz r7, 0(r27)
/* 00008B9C 1F270284 */ mulli r25, r7, 0x284
/* 00008BA0 7CC3C9AE */ stbx r6, r3, r25
/* 00008BA4 38E70001 */ addi r7, r7, 1
/* 00008BA8 7CE61670 */ srawi r6, r7, 2
/* 00008BAC 81780000 */ lwz r11, 0(r24)
/* 00008BB0 7CC60194 */ addze r6, r6
/* 00008BB4 81580004 */ lwz r10, 4(r24)
/* 00008BB8 7D8CCA14 */ add r12, r12, r25
/* 00008BBC 54C6103A */ slwi r6, r6, 2
/* 00008BC0 916C0000 */ stw r11, 0(r12)
/* 00008BC4 7CC63810 */ subfc r6, r6, r7
/* 00008BC8 1CE60284 */ mulli r7, r6, 0x284
/* 00008BCC 914C0004 */ stw r10, 4(r12)
/* 00008BD0 80D80008 */ lwz r6, 8(r24)
/* 00008BD4 90CC0008 */ stw r6, 8(r12)
/* 00008BD8 7D24C9AE */ stbx r9, r4, r25
/* 00008BDC 7CC5CAAE */ lhax r6, r5, r25
/* 00008BE0 54C60734 */ rlwinm r6, r6, 0, 0x1c, 0x1a
/* 00008BE4 7CC5CB2E */ sthx r6, r5, r25
/* 00008BE8 7D0339AE */ stbx r8, r3, r7
/* 00008BEC 7C0439AE */ stbx r0, r4, r7
/* 00008BF0 7C053AAE */ lhax r0, r5, r7
/* 00008BF4 60000010 */ ori r0, r0, 0x10
/* 00008BF8 7C053B2E */ sthx r0, r5, r7
lbl_00008BFC:
/* 00008BFC C03D0000 */ lfs f1, 0(r29)
/* 00008C00 7EE3BB78 */ mr r3, r23
/* 00008C04 FC400890 */ fmr f2, f1
/* 00008C08 FC600890 */ fmr f3, f1
/* 00008C0C FC800890 */ fmr f4, f1
/* 00008C10 4BFF75C1 */ bl setup_camera_viewport
/* 00008C14 3AF70001 */ addi r23, r23, 1
/* 00008C18 2C170004 */ cmpwi r23, 4
/* 00008C1C 4180FFE0 */ blt lbl_00008BFC
/* 00008C20 C03D0000 */ lfs f1, 0(r29)
/* 00008C24 C07D0004 */ lfs f3, 4(r29)
/* 00008C28 FC400890 */ fmr f2, f1
/* 00008C2C 807B0000 */ lwz r3, 0(r27)
/* 00008C30 FC801890 */ fmr f4, f3
/* 00008C34 4BFF759D */ bl setup_camera_viewport
/* 00008C38 807B0000 */ lwz r3, 0(r27)
/* 00008C3C C03D0008 */ lfs f1, 8(r29)
/* 00008C40 38030001 */ addi r0, r3, 1
/* 00008C44 C05D0000 */ lfs f2, 0(r29)
/* 00008C48 7C031670 */ srawi r3, r0, 2
/* 00008C4C C07D000C */ lfs f3, 0xc(r29)
/* 00008C50 7C630194 */ addze r3, r3
/* 00008C54 C09D0010 */ lfs f4, 0x10(r29)
/* 00008C58 5463103A */ slwi r3, r3, 2
/* 00008C5C 7C630010 */ subfc r3, r3, r0
/* 00008C60 4BFF7571 */ bl setup_camera_viewport
/* 00008C64 BAE1000C */ lmw r23, 0xc(r1)
/* 00008C68 80010034 */ lwz r0, 0x34(r1)
/* 00008C6C 38210030 */ addi r1, r1, 0x30
/* 00008C70 7C0803A6 */ mtlr r0
/* 00008C74 4E800020 */ blr 
