/* 00001BB4 7C0802A6 */ mflr r0
/* 00001BB8 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 00001BBC 90010004 */ stw r0, 4(r1)
/* 00001BC0 38830000 */ addi r4, r3, lbl_802F1FF0@l
/* 00001BC4 3CA00000 */ lis r5, currentBall@ha
/* 00001BC8 9421FFF0 */ stwu r1, -0x10(r1)
/* 00001BCC 93E1000C */ stw r31, 0xc(r1)
/* 00001BD0 80640000 */ lwz r3, 0(r4)
/* 00001BD4 83E50000 */ lwz r31, currentBall@l(r5)
/* 00001BD8 38030001 */ addi r0, r3, 1
/* 00001BDC 90040000 */ stw r0, 0(r4)
/* 00001BE0 80040000 */ lwz r0, 0(r4)
/* 00001BE4 2C000014 */ cmpwi r0, 0x14
/* 00001BE8 4082000C */ bne lbl_00001BF4
/* 00001BEC 480006ED */ bl lbl_000022D8
/* 00001BF0 4800007C */ b lbl_00001C6C
lbl_00001BF4:
/* 00001BF4 2C000050 */ cmpwi r0, 0x50
/* 00001BF8 40820034 */ bne lbl_00001C2C
/* 00001BFC 881F002E */ lbz r0, 0x2e(r31)
/* 00001C00 3C600000 */ lis r3, cameraInfo@ha
/* 00001C04 38630000 */ addi r3, r3, cameraInfo@l
/* 00001C08 7C000774 */ extsb r0, r0
/* 00001C0C 1C000284 */ mulli r0, r0, 0x284
/* 00001C10 7C630214 */ add r3, r3, r0
/* 00001C14 8803001F */ lbz r0, 0x1f(r3)
/* 00001C18 2C000007 */ cmpwi r0, 7
/* 00001C1C 40820050 */ bne lbl_00001C6C
/* 00001C20 38600122 */ li r3, 0x122
/* 00001C24 4BFFE529 */ bl u_play_sound_0
/* 00001C28 48000044 */ b lbl_00001C6C
lbl_00001C2C:
/* 00001C2C 2C000078 */ cmpwi r0, 0x78
/* 00001C30 4081003C */ ble lbl_00001C6C
/* 00001C34 3C600000 */ lis r3, modeCtrl@ha
/* 00001C38 38630000 */ addi r3, r3, modeCtrl@l
/* 00001C3C 8083002C */ lwz r4, 0x2c(r3)
/* 00001C40 3C600000 */ lis r3, lbl_80285A68@ha
/* 00001C44 38030000 */ addi r0, r3, lbl_80285A68@l
/* 00001C48 1C640006 */ mulli r3, r4, 6
/* 00001C4C 7C601A14 */ add r3, r0, r3
/* 00001C50 A8030000 */ lha r0, 0(r3)
/* 00001C54 2C000000 */ cmpwi r0, 0
/* 00001C58 41820014 */ beq lbl_00001C6C
/* 00001C5C 3C600000 */ lis r3, lbl_802F1FF4@ha
/* 00001C60 38000009 */ li r0, 9
/* 00001C64 B0030000 */ sth r0, lbl_802F1FF4@l(r3)
/* 00001C68 48000068 */ b lbl_00001CD0
lbl_00001C6C:
/* 00001C6C 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 00001C70 80C30000 */ lwz r6, lbl_802F1FF0@l(r3)
/* 00001C74 2C06003C */ cmpwi r6, 0x3c
/* 00001C78 40810058 */ ble lbl_00001CD0
/* 00001C7C 881F002E */ lbz r0, 0x2e(r31)
/* 00001C80 3C600000 */ lis r3, playerControllerIDs@ha
/* 00001C84 3CA00000 */ lis r5, controllerInfo@ha
/* 00001C88 7C000774 */ extsb r0, r0
/* 00001C8C 5404103A */ slwi r4, r0, 2
/* 00001C90 38030000 */ addi r0, r3, playerControllerIDs@l
/* 00001C94 7C602214 */ add r3, r0, r4
/* 00001C98 80030000 */ lwz r0, 0(r3)
/* 00001C9C 38650000 */ addi r3, r5, controllerInfo@l
/* 00001CA0 1C00003C */ mulli r0, r0, 0x3c
/* 00001CA4 7C630214 */ add r3, r3, r0
/* 00001CA8 A0030018 */ lhz r0, 0x18(r3)
/* 00001CAC 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00001CB0 4082000C */ bne lbl_00001CBC
/* 00001CB4 2C06021C */ cmpwi r6, 0x21c
/* 00001CB8 40810018 */ ble lbl_00001CD0
lbl_00001CBC:
/* 00001CBC 38600122 */ li r3, 0x122
/* 00001CC0 4BFFE48D */ bl SoundOffID
/* 00001CC4 3C600000 */ lis r3, lbl_802F1FF4@ha
/* 00001CC8 38000009 */ li r0, 9
/* 00001CCC B0030000 */ sth r0, lbl_802F1FF4@l(r3)
lbl_00001CD0:
/* 00001CD0 80010014 */ lwz r0, 0x14(r1)
/* 00001CD4 83E1000C */ lwz r31, 0xc(r1)
/* 00001CD8 38210010 */ addi r1, r1, 0x10
/* 00001CDC 7C0803A6 */ mtlr r0
/* 00001CE0 4E800020 */ blr 
