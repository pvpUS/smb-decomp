/* 00008D34 7C0802A6 */ mflr r0
/* 00008D38 3C600000 */ lis r3, lbl_10000000@ha
/* 00008D3C 90010004 */ stw r0, 4(r1)
/* 00008D40 9421FFE0 */ stwu r1, -0x20(r1)
/* 00008D44 BF410008 */ stmw r26, 8(r1)
/* 00008D48 3B830000 */ addi r28, r3, lbl_10000000@l
/* 00008D4C 3C600000 */ lis r3, lbl_000260F0@ha
/* 00008D50 3BE30000 */ addi r31, r3, lbl_000260F0@l
/* 00008D54 A81C003C */ lha r0, 0x3c(r28)
/* 00008D58 B01C003A */ sth r0, 0x3a(r28)
/* 00008D5C 480001E9 */ bl lbl_00008F44
/* 00008D60 3C600000 */ lis r3, decodedStageLzPtr@ha
/* 00008D64 38630000 */ addi r3, r3, decodedStageLzPtr@l
/* 00008D68 80630000 */ lwz r3, 0(r3)
/* 00008D6C 80830088 */ lwz r4, 0x88(r3)
/* 00008D70 28040000 */ cmplwi r4, 0
/* 00008D74 4182003C */ beq lbl_00008DB0
/* 00008D78 80640000 */ lwz r3, 0(r4)
/* 00008D7C 80040004 */ lwz r0, 4(r4)
/* 00008D80 907C005C */ stw r3, 0x5c(r28)
/* 00008D84 901C0060 */ stw r0, 0x60(r28)
/* 00008D88 80040008 */ lwz r0, 8(r4)
/* 00008D8C 901C0064 */ stw r0, 0x64(r28)
/* 00008D90 48000A9D */ bl lbl_0000982C
/* 00008D94 5460063F */ clrlwi. r0, r3, 0x18
/* 00008D98 40820018 */ bne lbl_00008DB0
/* 00008D9C 4800791D */ bl lbl_000106B8
/* 00008DA0 48007A69 */ bl lbl_00010808
/* 00008DA4 387C005C */ addi r3, r28, 0x5c
/* 00008DA8 38830000 */ addi r4, r3, 0
/* 00008DAC 4BFF7425 */ bl mathutil_mtxA_tf_point
lbl_00008DB0:
/* 00008DB0 3C600000 */ lis r3, modeCtrl@ha
/* 00008DB4 38630000 */ addi r3, r3, modeCtrl@l
/* 00008DB8 80C3002C */ lwz r6, 0x2c(r3)
/* 00008DBC 3BC3002C */ addi r30, r3, 0x2c
/* 00008DC0 3C600000 */ lis r3, ballInfo@ha
/* 00008DC4 1CA601A4 */ mulli r5, r6, 0x1a4
/* 00008DC8 38E30000 */ addi r7, r3, ballInfo@l
/* 00008DCC 7C872A14 */ add r4, r7, r5
/* 00008DD0 3800001A */ li r0, 0x1a
/* 00008DD4 98040003 */ stb r0, 3(r4)
/* 00008DD8 38000000 */ li r0, 0
/* 00008DDC 3B8700FC */ addi r28, r7, 0xfc
/* 00008DE0 98040148 */ stb r0, 0x148(r4)
/* 00008DE4 3C600000 */ lis r3, cameraInfo@ha
/* 00008DE8 39430000 */ addi r10, r3, cameraInfo@l
/* 00008DEC 7C9C282E */ lwzx r4, r28, r5
/* 00008DF0 7CC50774 */ extsb r5, r6
/* 00008DF4 386A001F */ addi r3, r10, 0x1f
/* 00008DF8 98A400C0 */ stb r5, 0xc0(r4)
/* 00008DFC 39600002 */ li r11, 2
/* 00008E00 388A0026 */ addi r4, r10, 0x26
/* 00008E04 80DE0000 */ lwz r6, 0(r30)
/* 00008E08 38AA0024 */ addi r5, r10, 0x24
/* 00008E0C 39200009 */ li r9, 9
/* 00008E10 1D8601A4 */ mulli r12, r6, 0x1a4
/* 00008E14 7D076214 */ add r8, r7, r12
/* 00008E18 80E80094 */ lwz r7, 0x94(r8)
/* 00008E1C 38C0000B */ li r6, 0xb
/* 00008E20 3BA00000 */ li r29, 0
/* 00008E24 54E70734 */ rlwinm r7, r7, 0, 0x1c, 0x1a
/* 00008E28 90E80094 */ stw r7, 0x94(r8)
/* 00008E2C 80E80094 */ lwz r7, 0x94(r8)
/* 00008E30 60E74000 */ ori r7, r7, 0x4000
/* 00008E34 90E80094 */ stw r7, 0x94(r8)
/* 00008E38 7D1C602E */ lwzx r8, r28, r12
/* 00008E3C 80E80014 */ lwz r7, 0x14(r8)
/* 00008E40 54E706F2 */ rlwinm r7, r7, 0, 0x1b, 0x19
/* 00008E44 90E80014 */ stw r7, 0x14(r8)
/* 00008E48 837E0000 */ lwz r27, 0(r30)
/* 00008E4C 391B0003 */ addi r8, r27, 3
/* 00008E50 7D071670 */ srawi r7, r8, 2
/* 00008E54 1F5B0284 */ mulli r26, r27, 0x284
/* 00008E58 7CE70194 */ addze r7, r7
/* 00008E5C 7D63D1AE */ stbx r11, r3, r26
/* 00008E60 54E7103A */ slwi r7, r7, 2
/* 00008E64 7CE74010 */ subfc r7, r7, r8
/* 00008E68 1CE70284 */ mulli r7, r7, 0x284
/* 00008E6C 7F8A3A14 */ add r28, r10, r7
/* 00008E70 7D8AD214 */ add r12, r10, r26
/* 00008E74 817C0000 */ lwz r11, 0(r28)
/* 00008E78 815C0004 */ lwz r10, 4(r28)
/* 00008E7C 391B0001 */ addi r8, r27, 1
/* 00008E80 7D071670 */ srawi r7, r8, 2
/* 00008E84 916C0000 */ stw r11, 0(r12)
/* 00008E88 7CE70194 */ addze r7, r7
/* 00008E8C 54E7103A */ slwi r7, r7, 2
/* 00008E90 7CE74010 */ subfc r7, r7, r8
/* 00008E94 914C0004 */ stw r10, 4(r12)
/* 00008E98 1D070284 */ mulli r8, r7, 0x284
/* 00008E9C 80FC0008 */ lwz r7, 8(r28)
/* 00008EA0 90EC0008 */ stw r7, 8(r12)
/* 00008EA4 7C04D1AE */ stbx r0, r4, r26
/* 00008EA8 7C05D2AE */ lhax r0, r5, r26
/* 00008EAC 54000734 */ rlwinm r0, r0, 0, 0x1c, 0x1a
/* 00008EB0 7C05D32E */ sthx r0, r5, r26
/* 00008EB4 7D2341AE */ stbx r9, r3, r8
/* 00008EB8 7CC441AE */ stbx r6, r4, r8
/* 00008EBC 7C0542AE */ lhax r0, r5, r8
/* 00008EC0 60000010 */ ori r0, r0, 0x10
/* 00008EC4 7C05432E */ sthx r0, r5, r8
lbl_00008EC8:
/* 00008EC8 C03F0000 */ lfs f1, 0(r31)
/* 00008ECC 7FA3EB78 */ mr r3, r29
/* 00008ED0 FC400890 */ fmr f2, f1
/* 00008ED4 FC600890 */ fmr f3, f1
/* 00008ED8 FC800890 */ fmr f4, f1
/* 00008EDC 4BFF72F5 */ bl setup_camera_viewport
/* 00008EE0 3BBD0001 */ addi r29, r29, 1
/* 00008EE4 2C1D0004 */ cmpwi r29, 4
/* 00008EE8 4180FFE0 */ blt lbl_00008EC8
/* 00008EEC C03F0000 */ lfs f1, 0(r31)
/* 00008EF0 C07F0004 */ lfs f3, 4(r31)
/* 00008EF4 FC400890 */ fmr f2, f1
/* 00008EF8 807E0000 */ lwz r3, 0(r30)
/* 00008EFC FC801890 */ fmr f4, f3
/* 00008F00 4BFF72D1 */ bl setup_camera_viewport
/* 00008F04 807E0000 */ lwz r3, 0(r30)
/* 00008F08 C03F0008 */ lfs f1, 8(r31)
/* 00008F0C 38030001 */ addi r0, r3, 1
/* 00008F10 C05F0000 */ lfs f2, 0(r31)
/* 00008F14 7C031670 */ srawi r3, r0, 2
/* 00008F18 C07F000C */ lfs f3, 0xc(r31)
/* 00008F1C 7C630194 */ addze r3, r3
/* 00008F20 C09F0010 */ lfs f4, 0x10(r31)
/* 00008F24 5463103A */ slwi r3, r3, 2
/* 00008F28 7C630010 */ subfc r3, r3, r0
/* 00008F2C 4BFF72A5 */ bl setup_camera_viewport
/* 00008F30 BB410008 */ lmw r26, 8(r1)
/* 00008F34 80010024 */ lwz r0, 0x24(r1)
/* 00008F38 38210020 */ addi r1, r1, 0x20
/* 00008F3C 7C0803A6 */ mtlr r0
/* 00008F40 4E800020 */ blr 
