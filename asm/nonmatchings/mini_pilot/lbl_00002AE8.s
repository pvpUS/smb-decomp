/* 00002AE8 7C0802A6 */ mflr r0
/* 00002AEC 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 00002AF0 90010004 */ stw r0, 4(r1)
/* 00002AF4 38830000 */ addi r4, r3, lbl_802F1FF0@l
/* 00002AF8 3CA00000 */ lis r5, currentBall@ha
/* 00002AFC 9421FFF0 */ stwu r1, -0x10(r1)
/* 00002B00 93E1000C */ stw r31, 0xc(r1)
/* 00002B04 93C10008 */ stw r30, 8(r1)
/* 00002B08 80640000 */ lwz r3, 0(r4)
/* 00002B0C 83C50000 */ lwz r30, currentBall@l(r5)
/* 00002B10 38030001 */ addi r0, r3, 1
/* 00002B14 90040000 */ stw r0, 0(r4)
/* 00002B18 3C600000 */ lis r3, lbl_10000000@ha
/* 00002B1C 3BE30000 */ addi r31, r3, lbl_10000000@l
/* 00002B20 881E0003 */ lbz r0, 3(r30)
/* 00002B24 7C000775 */ extsb. r0, r0
/* 00002B28 4082002C */ bne lbl_00002B54
/* 00002B2C 38600002 */ li r3, 2
/* 00002B30 4BFFD61D */ bl event_suspend
/* 00002B34 3C600000 */ lis r3, stageInfo@ha
/* 00002B38 38630000 */ addi r3, r3, stageInfo@l
/* 00002B3C 8003001C */ lwz r0, 0x1c(r3)
/* 00002B40 60000001 */ ori r0, r0, 1
/* 00002B44 9003001C */ stw r0, 0x1c(r3)
/* 00002B48 A07F001E */ lhz r3, 0x1e(r31)
/* 00002B4C 38030001 */ addi r0, r3, 1
/* 00002B50 B01F001E */ sth r0, 0x1e(r31)
lbl_00002B54:
/* 00002B54 A0DF001E */ lhz r6, 0x1e(r31)
/* 00002B58 2806001E */ cmplwi r6, 0x1e
/* 00002B5C 40820024 */ bne lbl_00002B80
/* 00002B60 48006E45 */ bl lbl_000099A4
/* 00002B64 3860016A */ li r3, 0x16a
/* 00002B68 3880016B */ li r4, 0x16b
/* 00002B6C 4BFFD5E1 */ bl func_8002BFCC
/* 00002B70 38600000 */ li r3, 0
/* 00002B74 38800008 */ li r4, 8
/* 00002B78 4BFFD5D5 */ bl u_play_music
/* 00002B7C 48000080 */ b lbl_00002BFC
lbl_00002B80:
/* 00002B80 28060078 */ cmplwi r6, 0x78
/* 00002B84 40820010 */ bne lbl_00002B94
/* 00002B88 386001AF */ li r3, 0x1af
/* 00002B8C 4BFFD5C1 */ bl u_play_sound_0
/* 00002B90 4800006C */ b lbl_00002BFC
lbl_00002B94:
/* 00002B94 280600F0 */ cmplwi r6, 0xf0
/* 00002B98 40820014 */ bne lbl_00002BAC
/* 00002B9C 38600064 */ li r3, 0x64
/* 00002BA0 38800008 */ li r4, 8
/* 00002BA4 4BFFD5A9 */ bl u_play_music
/* 00002BA8 48000054 */ b lbl_00002BFC
lbl_00002BAC:
/* 00002BAC 40810050 */ ble lbl_00002BFC
/* 00002BB0 881E002E */ lbz r0, 0x2e(r30)
/* 00002BB4 3C600000 */ lis r3, playerControllerIDs@ha
/* 00002BB8 3CA00000 */ lis r5, controllerInfo@ha
/* 00002BBC 7C000774 */ extsb r0, r0
/* 00002BC0 5404103A */ slwi r4, r0, 2
/* 00002BC4 38030000 */ addi r0, r3, playerControllerIDs@l
/* 00002BC8 7C602214 */ add r3, r0, r4
/* 00002BCC 80030000 */ lwz r0, 0(r3)
/* 00002BD0 38650000 */ addi r3, r5, controllerInfo@l
/* 00002BD4 1C00003C */ mulli r0, r0, 0x3c
/* 00002BD8 7C630214 */ add r3, r3, r0
/* 00002BDC A0030018 */ lhz r0, 0x18(r3)
/* 00002BE0 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00002BE4 4082000C */ bne lbl_00002BF0
/* 00002BE8 280601A4 */ cmplwi r6, 0x1a4
/* 00002BEC 40810010 */ ble lbl_00002BFC
lbl_00002BF0:
/* 00002BF0 3C600000 */ lis r3, lbl_802F1FF4@ha
/* 00002BF4 38000000 */ li r0, 0
/* 00002BF8 B0030000 */ sth r0, lbl_802F1FF4@l(r3)
lbl_00002BFC:
/* 00002BFC 48001E19 */ bl lbl_00004A14
/* 00002C00 80010014 */ lwz r0, 0x14(r1)
/* 00002C04 83E1000C */ lwz r31, 0xc(r1)
/* 00002C08 83C10008 */ lwz r30, 8(r1)
/* 00002C0C 7C0803A6 */ mtlr r0
/* 00002C10 38210010 */ addi r1, r1, 0x10
/* 00002C14 4E800020 */ blr 
