/* 000037B0 7C0802A6 */ mflr r0
/* 000037B4 3C600000 */ lis r3, debugFlags@ha
/* 000037B8 90010004 */ stw r0, 4(r1)
/* 000037BC 3C800000 */ lis r4, lbl_10000000@ha
/* 000037C0 9421FFE0 */ stwu r1, -0x20(r1)
/* 000037C4 BF61000C */ stmw r27, 0xc(r1)
/* 000037C8 3BC40000 */ addi r30, r4, lbl_10000000@l
/* 000037CC 80030000 */ lwz r0, debugFlags@l(r3)
/* 000037D0 3C600000 */ lis r3, lbl_000102B0@ha
/* 000037D4 3BE30000 */ addi r31, r3, lbl_000102B0@l
/* 000037D8 7000000A */ andi. r0, r0, 0xa
/* 000037DC 4082025C */ bne lbl_00003A38
/* 000037E0 3C600000 */ lis r3, controllerInfo@ha
/* 000037E4 839E00B8 */ lwz r28, 0xb8(r30)
/* 000037E8 38830000 */ addi r4, r3, controllerInfo@l
/* 000037EC A0040030 */ lhz r0, 0x30(r4)
/* 000037F0 3BA40030 */ addi r29, r4, 0x30
/* 000037F4 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 000037F8 40820040 */ bne lbl_00003838
/* 000037FC 3C600000 */ lis r3, analogInputs@ha
/* 00003800 38630000 */ addi r3, r3, analogInputs@l
/* 00003804 A0030008 */ lhz r0, 8(r3)
/* 00003808 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 0000380C 4082002C */ bne lbl_00003838
/* 00003810 A0040000 */ lhz r0, 0(r4)
/* 00003814 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00003818 40820010 */ bne lbl_00003828
/* 0000381C A0030000 */ lhz r0, 0(r3)
/* 00003820 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00003824 41820064 */ beq lbl_00003888
lbl_00003828:
/* 00003828 3C600000 */ lis r3, analogInputs@ha
/* 0000382C A0030000 */ lhz r0, analogInputs@l(r3)
/* 00003830 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00003834 41820054 */ beq lbl_00003888
lbl_00003838:
/* 00003838 1C1C000C */ mulli r0, r28, 0xc
/* 0000383C 3B7F2C70 */ addi r27, r31, 0x2c70
/* 00003840 7C7B0214 */ add r3, r27, r0
/* 00003844 80630000 */ lwz r3, 0(r3)
/* 00003848 2C030000 */ cmpwi r3, 0
/* 0000384C 41820008 */ beq lbl_00003854
/* 00003850 4BFFC90D */ bl call_bitmap_free_group
lbl_00003854:
/* 00003854 3B9C0001 */ addi r28, r28, 1
/* 00003858 1C1C000C */ mulli r0, r28, 0xc
/* 0000385C 7C7F0214 */ add r3, r31, r0
/* 00003860 80032C68 */ lwz r0, 0x2c68(r3)
/* 00003864 28000000 */ cmplwi r0, 0
/* 00003868 40820008 */ bne lbl_00003870
/* 0000386C 3B800000 */ li r28, 0
lbl_00003870:
/* 00003870 1C1C000C */ mulli r0, r28, 0xc
/* 00003874 7C7B0214 */ add r3, r27, r0
/* 00003878 80630000 */ lwz r3, 0(r3)
/* 0000387C 2C030000 */ cmpwi r3, 0
/* 00003880 41820008 */ beq lbl_00003888
/* 00003884 4BFFC8D9 */ bl call_bitmap_load_group
lbl_00003888:
/* 00003888 A01D0000 */ lhz r0, 0(r29)
/* 0000388C 540007FF */ clrlwi. r0, r0, 0x1f
/* 00003890 40820044 */ bne lbl_000038D4
/* 00003894 3C600000 */ lis r3, analogInputs@ha
/* 00003898 38830000 */ addi r4, r3, analogInputs@l
/* 0000389C A0040008 */ lhz r0, 8(r4)
/* 000038A0 540007FF */ clrlwi. r0, r0, 0x1f
/* 000038A4 40820030 */ bne lbl_000038D4
/* 000038A8 3C600000 */ lis r3, controllerInfo@ha
/* 000038AC A0030000 */ lhz r0, controllerInfo@l(r3)
/* 000038B0 540007FF */ clrlwi. r0, r0, 0x1f
/* 000038B4 40820010 */ bne lbl_000038C4
/* 000038B8 A0040000 */ lhz r0, 0(r4)
/* 000038BC 540007FF */ clrlwi. r0, r0, 0x1f
/* 000038C0 41820074 */ beq lbl_00003934
lbl_000038C4:
/* 000038C4 3C600000 */ lis r3, analogInputs@ha
/* 000038C8 A0030000 */ lhz r0, analogInputs@l(r3)
/* 000038CC 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 000038D0 41820064 */ beq lbl_00003934
lbl_000038D4:
/* 000038D4 1C1C000C */ mulli r0, r28, 0xc
/* 000038D8 3B7F2C70 */ addi r27, r31, 0x2c70
/* 000038DC 7C7B0214 */ add r3, r27, r0
/* 000038E0 80630000 */ lwz r3, 0(r3)
/* 000038E4 2C030000 */ cmpwi r3, 0
/* 000038E8 41820008 */ beq lbl_000038F0
/* 000038EC 4BFFC871 */ bl call_bitmap_free_group
lbl_000038F0:
/* 000038F0 379CFFFF */ addic. r28, r28, -1
/* 000038F4 40800028 */ bge lbl_0000391C
/* 000038F8 387F2C68 */ addi r3, r31, 0x2c68
/* 000038FC 3B800000 */ li r28, 0
/* 00003900 4800000C */ b lbl_0000390C
lbl_00003904:
/* 00003904 3863000C */ addi r3, r3, 0xc
/* 00003908 3B9C0001 */ addi r28, r28, 1
lbl_0000390C:
/* 0000390C 80030000 */ lwz r0, 0(r3)
/* 00003910 28000000 */ cmplwi r0, 0
/* 00003914 4082FFF0 */ bne lbl_00003904
/* 00003918 3B9CFFFF */ addi r28, r28, -1
lbl_0000391C:
/* 0000391C 1C1C000C */ mulli r0, r28, 0xc
/* 00003920 7C7B0214 */ add r3, r27, r0
/* 00003924 80630000 */ lwz r3, 0(r3)
/* 00003928 2C030000 */ cmpwi r3, 0
/* 0000392C 41820008 */ beq lbl_00003934
/* 00003930 4BFFC82D */ bl call_bitmap_load_group
lbl_00003934:
/* 00003934 801E00B8 */ lwz r0, 0xb8(r30)
/* 00003938 7C1C0000 */ cmpw r28, r0
/* 0000393C 41820010 */ beq lbl_0000394C
/* 00003940 38000000 */ li r0, 0
/* 00003944 901E00B4 */ stw r0, 0xb4(r30)
/* 00003948 939E00B8 */ stw r28, 0xb8(r30)
lbl_0000394C:
/* 0000394C 801E00B8 */ lwz r0, 0xb8(r30)
/* 00003950 A0FD0000 */ lhz r7, 0(r29)
/* 00003954 1C60000C */ mulli r3, r0, 0xc
/* 00003958 809E00B4 */ lwz r4, 0xb4(r30)
/* 0000395C 7C7F1A14 */ add r3, r31, r3
/* 00003960 54E0077B */ rlwinm. r0, r7, 0, 0x1d, 0x1d
/* 00003964 80632C68 */ lwz r3, 0x2c68(r3)
/* 00003968 40820044 */ bne lbl_000039AC
/* 0000396C 3CA00000 */ lis r5, analogInputs@ha
/* 00003970 38C50000 */ addi r6, r5, analogInputs@l
/* 00003974 A0060008 */ lhz r0, 8(r6)
/* 00003978 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 0000397C 40820030 */ bne lbl_000039AC
/* 00003980 3CA00000 */ lis r5, controllerInfo@ha
/* 00003984 A0050000 */ lhz r0, controllerInfo@l(r5)
/* 00003988 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 0000398C 40820010 */ bne lbl_0000399C
/* 00003990 A0060000 */ lhz r0, 0(r6)
/* 00003994 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00003998 4182002C */ beq lbl_000039C4
lbl_0000399C:
/* 0000399C 3CA00000 */ lis r5, analogInputs@ha
/* 000039A0 A0050000 */ lhz r0, analogInputs@l(r5)
/* 000039A4 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 000039A8 4182001C */ beq lbl_000039C4
lbl_000039AC:
/* 000039AC 38840001 */ addi r4, r4, 1
/* 000039B0 54801838 */ slwi r0, r4, 3
/* 000039B4 7C03002E */ lwzx r0, r3, r0
/* 000039B8 2C00FFFF */ cmpwi r0, -1
/* 000039BC 40820008 */ bne lbl_000039C4
/* 000039C0 38800000 */ li r4, 0
lbl_000039C4:
/* 000039C4 54E00739 */ rlwinm. r0, r7, 0, 0x1c, 0x1c
/* 000039C8 40820044 */ bne lbl_00003A0C
/* 000039CC 3CA00000 */ lis r5, analogInputs@ha
/* 000039D0 38C50000 */ addi r6, r5, analogInputs@l
/* 000039D4 A0060008 */ lhz r0, 8(r6)
/* 000039D8 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 000039DC 40820030 */ bne lbl_00003A0C
/* 000039E0 3CA00000 */ lis r5, controllerInfo@ha
/* 000039E4 A0050000 */ lhz r0, controllerInfo@l(r5)
/* 000039E8 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 000039EC 40820010 */ bne lbl_000039FC
/* 000039F0 A0060000 */ lhz r0, 0(r6)
/* 000039F4 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 000039F8 4182003C */ beq lbl_00003A34
lbl_000039FC:
/* 000039FC 3CA00000 */ lis r5, analogInputs@ha
/* 00003A00 A0050000 */ lhz r0, analogInputs@l(r5)
/* 00003A04 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00003A08 4182002C */ beq lbl_00003A34
lbl_00003A0C:
/* 00003A0C 3484FFFF */ addic. r4, r4, -1
/* 00003A10 40800024 */ bge lbl_00003A34
/* 00003A14 38800000 */ li r4, 0
/* 00003A18 4800000C */ b lbl_00003A24
lbl_00003A1C:
/* 00003A1C 38630008 */ addi r3, r3, 8
/* 00003A20 38840001 */ addi r4, r4, 1
lbl_00003A24:
/* 00003A24 80030000 */ lwz r0, 0(r3)
/* 00003A28 2C00FFFF */ cmpwi r0, -1
/* 00003A2C 4082FFF0 */ bne lbl_00003A1C
/* 00003A30 3884FFFF */ addi r4, r4, -1
lbl_00003A34:
/* 00003A34 909E00B4 */ stw r4, 0xb4(r30)
lbl_00003A38:
/* 00003A38 BB61000C */ lmw r27, 0xc(r1)
/* 00003A3C 80010024 */ lwz r0, 0x24(r1)
/* 00003A40 38210020 */ addi r1, r1, 0x20
/* 00003A44 7C0803A6 */ mtlr r0
/* 00003A48 4E800020 */ blr 
