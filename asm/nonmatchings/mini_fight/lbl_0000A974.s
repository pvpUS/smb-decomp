/* 0000A974 7C0802A6 */ mflr r0
/* 0000A978 3C600000 */ lis r3, lbl_10017520@ha
/* 0000A97C 90010004 */ stw r0, 4(r1)
/* 0000A980 9421FFD8 */ stwu r1, -0x28(r1)
/* 0000A984 93E10024 */ stw r31, 0x24(r1)
/* 0000A988 3BE30000 */ addi r31, r3, lbl_10017520@l
/* 0000A98C 93C10020 */ stw r30, 0x20(r1)
/* 0000A990 93A1001C */ stw r29, 0x1c(r1)
/* 0000A994 480044ED */ bl lbl_0000EE80
/* 0000A998 48005599 */ bl lbl_0000FF30
/* 0000A99C 4BFFCB41 */ bl lbl_000074DC
/* 0000A9A0 4BFF58D1 */ bl lbl_00000270
/* 0000A9A4 480092C9 */ bl lbl_00013C6C
/* 0000A9A8 4800F195 */ bl lbl_00019B3C
/* 0000A9AC 4800FBA5 */ bl lbl_0001A550
/* 0000A9B0 3C600000 */ lis r3, lbl_10018CFC@ha
/* 0000A9B4 3BC30000 */ addi r30, r3, lbl_10018CFC@l
/* 0000A9B8 801E0000 */ lwz r0, 0(r30)
/* 0000A9BC 540007FF */ clrlwi. r0, r0, 0x1f
/* 0000A9C0 41820030 */ beq lbl_0000A9F0
/* 0000A9C4 3C600000 */ lis r3, stageHeap@ha
/* 0000A9C8 38630000 */ addi r3, r3, stageHeap@l
/* 0000A9CC 80630000 */ lwz r3, 0(r3)
/* 0000A9D0 4BFF5795 */ bl OSSetCurrentHeap
/* 0000A9D4 7C7D1B78 */ mr r29, r3
/* 0000A9D8 4BFF578D */ bl mini_commend_free_data
/* 0000A9DC 7FA3EB78 */ mr r3, r29
/* 0000A9E0 4BFF5785 */ bl OSSetCurrentHeap
/* 0000A9E4 801E0000 */ lwz r0, 0(r30)
/* 0000A9E8 5400003C */ rlwinm r0, r0, 0, 0, 0x1e
/* 0000A9EC 901E0000 */ stw r0, 0(r30)
lbl_0000A9F0:
/* 0000A9F0 4BFF5775 */ bl SoundGroupFree
/* 0000A9F4 3C600000 */ lis r3, stageHeap@ha
/* 0000A9F8 38630000 */ addi r3, r3, stageHeap@l
/* 0000A9FC 80630000 */ lwz r3, 0(r3)
/* 0000AA00 4BFF5765 */ bl OSSetCurrentHeap
/* 0000AA04 7C7D1B78 */ mr r29, r3
/* 0000AA08 4BFF575D */ bl u_free_minigame_graphics
/* 0000AA0C 7FA3EB78 */ mr r3, r29
/* 0000AA10 4BFF5755 */ bl OSSetCurrentHeap
/* 0000AA14 38600005 */ li r3, 5
/* 0000AA18 4BFF574D */ bl bitmap_free_group
/* 0000AA1C 38600009 */ li r3, 9
/* 0000AA20 4BFF5745 */ bl bitmap_free_group
/* 0000AA24 3C600000 */ lis r3, modeCtrl@ha
/* 0000AA28 881F0138 */ lbz r0, 0x138(r31)
/* 0000AA2C 38830000 */ addi r4, r3, modeCtrl@l
/* 0000AA30 3C600000 */ lis r3, g_poolInfo@ha
/* 0000AA34 90040024 */ stw r0, 0x24(r4)
/* 0000AA38 38630000 */ addi r3, r3, g_poolInfo@l
/* 0000AA3C 38C3000C */ addi r6, r3, 0xc
/* 0000AA40 881F013C */ lbz r0, 0x13c(r31)
/* 0000AA44 80A3000C */ lwz r5, 0xc(r3)
/* 0000AA48 3C600000 */ lis r3, playerCharacterSelection@ha
/* 0000AA4C 38830000 */ addi r4, r3, playerCharacterSelection@l
/* 0000AA50 98050000 */ stb r0, 0(r5)
/* 0000AA54 881F0140 */ lbz r0, 0x140(r31)
/* 0000AA58 90040000 */ stw r0, 0(r4)
/* 0000AA5C 881F013D */ lbz r0, 0x13d(r31)
/* 0000AA60 80660000 */ lwz r3, 0(r6)
/* 0000AA64 98030001 */ stb r0, 1(r3)
/* 0000AA68 881F0141 */ lbz r0, 0x141(r31)
/* 0000AA6C 90040004 */ stw r0, 4(r4)
/* 0000AA70 881F013E */ lbz r0, 0x13e(r31)
/* 0000AA74 80660000 */ lwz r3, 0(r6)
/* 0000AA78 98030002 */ stb r0, 2(r3)
/* 0000AA7C 881F0142 */ lbz r0, 0x142(r31)
/* 0000AA80 90040008 */ stw r0, 8(r4)
/* 0000AA84 881F013F */ lbz r0, 0x13f(r31)
/* 0000AA88 80660000 */ lwz r3, 0(r6)
/* 0000AA8C 98030003 */ stb r0, 3(r3)
/* 0000AA90 881F0143 */ lbz r0, 0x143(r31)
/* 0000AA94 9004000C */ stw r0, 0xc(r4)
/* 0000AA98 4BFF56CD */ bl event_finish_all
/* 0000AA9C 3C600000 */ lis r3, gfxBufferInfo@ha
/* 0000AAA0 38630000 */ addi r3, r3, gfxBufferInfo@l
/* 0000AAA4 80630000 */ lwz r3, 0(r3)
/* 0000AAA8 80630000 */ lwz r3, 0(r3)
/* 0000AAAC 4BFF56B9 */ bl VISetNextFrameBuffer
/* 0000AAB0 4BFF56B5 */ bl VIWaitForRetrace
/* 0000AAB4 8001002C */ lwz r0, 0x2c(r1)
/* 0000AAB8 83E10024 */ lwz r31, 0x24(r1)
/* 0000AABC 83C10020 */ lwz r30, 0x20(r1)
/* 0000AAC0 7C0803A6 */ mtlr r0
/* 0000AAC4 83A1001C */ lwz r29, 0x1c(r1)
/* 0000AAC8 38210028 */ addi r1, r1, 0x28
/* 0000AACC 4E800020 */ blr 
