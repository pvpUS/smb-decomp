/* 00004024 7C0802A6 */ mflr r0
/* 00004028 3C600000 */ lis r3, g_poolInfo@ha
/* 0000402C 90010004 */ stw r0, 4(r1)
/* 00004030 9421FFD8 */ stwu r1, -0x28(r1)
/* 00004034 BF21000C */ stmw r25, 0xc(r1)
/* 00004038 3BC30000 */ addi r30, r3, g_poolInfo@l
/* 0000403C 3C600000 */ lis r3, ballInfo@ha
/* 00004040 38030000 */ addi r0, r3, ballInfo@l
/* 00004044 3C600000 */ lis r3, lbl_000040EC@ha
/* 00004048 7C1D0378 */ mr r29, r0
/* 0000404C 3BE30000 */ addi r31, r3, lbl_000040EC@l
/* 00004050 3B600000 */ li r27, 0
/* 00004054 839E000C */ lwz r28, 0xc(r30)
/* 00004058 48000074 */ b lbl_000040CC
lbl_0000405C:
/* 0000405C 887C0000 */ lbz r3, 0(r28)
/* 00004060 7C600775 */ extsb. r0, r3
/* 00004064 4182005C */ beq lbl_000040C0
/* 00004068 7C600774 */ extsb r0, r3
/* 0000406C 2C000004 */ cmpwi r0, 4
/* 00004070 41820050 */ beq lbl_000040C0
/* 00004074 881D0148 */ lbz r0, 0x148(r29)
/* 00004078 28000002 */ cmplwi r0, 2
/* 0000407C 4182000C */ beq lbl_00004088
/* 00004080 28000003 */ cmplwi r0, 3
/* 00004084 4082003C */ bne lbl_000040C0
lbl_00004088:
/* 00004088 4BFFC0C5 */ bl mathutil_mtxA_from_mtxB
/* 0000408C 387D0004 */ addi r3, r29, 4
/* 00004090 4BFFC0BD */ bl ord_tbl_get_entry_for_pos
/* 00004094 3B230000 */ addi r25, r3, 0
/* 00004098 38600010 */ li r3, 0x10
/* 0000409C 4BFFC0B1 */ bl ord_tbl_alloc_node
/* 000040A0 7C7A1B78 */ mr r26, r3
/* 000040A4 93E30004 */ stw r31, 4(r3)
/* 000040A8 4BFFC0A5 */ bl peek_light_group
/* 000040AC 907A0008 */ stw r3, 8(r26)
/* 000040B0 38790000 */ addi r3, r25, 0
/* 000040B4 389A0000 */ addi r4, r26, 0
/* 000040B8 937A000C */ stw r27, 0xc(r26)
/* 000040BC 4BFFC091 */ bl ord_tbl_insert_node
lbl_000040C0:
/* 000040C0 3B7B0001 */ addi r27, r27, 1
/* 000040C4 3BBD01A4 */ addi r29, r29, 0x1a4
/* 000040C8 3B9C0001 */ addi r28, r28, 1
lbl_000040CC:
/* 000040CC 801E0008 */ lwz r0, 8(r30)
/* 000040D0 7C1B0000 */ cmpw r27, r0
/* 000040D4 4180FF88 */ blt lbl_0000405C
/* 000040D8 BB21000C */ lmw r25, 0xc(r1)
/* 000040DC 8001002C */ lwz r0, 0x2c(r1)
/* 000040E0 38210028 */ addi r1, r1, 0x28
/* 000040E4 7C0803A6 */ mtlr r0
/* 000040E8 4E800020 */ blr 
