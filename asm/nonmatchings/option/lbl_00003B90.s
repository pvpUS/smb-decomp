/* 00003B90 7C0802A6 */ mflr r0
/* 00003B94 3C800000 */ lis r4, g_recplayInfo@ha
/* 00003B98 90010004 */ stw r0, 4(r1)
/* 00003B9C 38840000 */ addi r4, r4, g_recplayInfo@l
/* 00003BA0 2C030001 */ cmpwi r3, 1
/* 00003BA4 9421FFE8 */ stwu r1, -0x18(r1)
/* 00003BA8 93E10014 */ stw r31, 0x14(r1)
/* 00003BAC 80040014 */ lwz r0, 0x14(r4)
/* 00003BB0 3C800000 */ lis r4, worldInfo@ha
/* 00003BB4 54053032 */ slwi r5, r0, 6
/* 00003BB8 38040000 */ addi r0, r4, worldInfo@l
/* 00003BBC 7FE02A14 */ add r31, r0, r5
/* 00003BC0 41820038 */ beq lbl_00003BF8
/* 00003BC4 40800054 */ bge lbl_00003C18
/* 00003BC8 2C030000 */ cmpwi r3, 0
/* 00003BCC 40800008 */ bge lbl_00003BD4
/* 00003BD0 48000048 */ b lbl_00003C18
lbl_00003BD4:
/* 00003BD4 38600000 */ li r3, 0
/* 00003BD8 4BFFC5D5 */ bl camera_set_state_all
/* 00003BDC 38000008 */ li r0, 8
/* 00003BE0 981F0008 */ stb r0, 8(r31)
/* 00003BE4 3C600000 */ lis r3, infoWork@ha
/* 00003BE8 84030000 */ lwzu r0, infoWork@l(r3)
/* 00003BEC 60000800 */ ori r0, r0, 0x800
/* 00003BF0 90030000 */ stw r0, 0(r3)
/* 00003BF4 48000024 */ b lbl_00003C18
lbl_00003BF8:
/* 00003BF8 3860002C */ li r3, 0x2c
/* 00003BFC 4BFFC5B1 */ bl camera_set_state_all
/* 00003C00 38000006 */ li r0, 6
/* 00003C04 981F0008 */ stb r0, 8(r31)
/* 00003C08 3C600000 */ lis r3, infoWork@ha
/* 00003C0C 84030000 */ lwzu r0, infoWork@l(r3)
/* 00003C10 54000566 */ rlwinm r0, r0, 0, 0x15, 0x13
/* 00003C14 90030000 */ stw r0, 0(r3)
lbl_00003C18:
/* 00003C18 8001001C */ lwz r0, 0x1c(r1)
/* 00003C1C 83E10014 */ lwz r31, 0x14(r1)
/* 00003C20 38210018 */ addi r1, r1, 0x18
/* 00003C24 7C0803A6 */ mtlr r0
/* 00003C28 4E800020 */ blr 
