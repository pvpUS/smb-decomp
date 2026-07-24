/* 00001C84 7C0802A6 */ mflr r0
/* 00001C88 3C600000 */ lis r3, lbl_10000000@ha
/* 00001C8C 90010004 */ stw r0, 4(r1)
/* 00001C90 9421FFE0 */ stwu r1, -0x20(r1)
/* 00001C94 93E1001C */ stw r31, 0x1c(r1)
/* 00001C98 93C10018 */ stw r30, 0x18(r1)
/* 00001C9C 3BC30000 */ addi r30, r3, lbl_10000000@l
/* 00001CA0 3C600000 */ lis r3, lbl_00010D58@ha
/* 00001CA4 93A10014 */ stw r29, 0x14(r1)
/* 00001CA8 801E0000 */ lwz r0, 0(r30)
/* 00001CAC C8230000 */ lfd f1, lbl_00010D58@l(r3)
/* 00001CB0 3C600000 */ lis r3, lbl_0000F020@ha
/* 00001CB4 6C008000 */ xoris r0, r0, 0x8000
/* 00001CB8 9001000C */ stw r0, 0xc(r1)
/* 00001CBC 3C004330 */ lis r0, 0x4330
/* 00001CC0 3BE30000 */ addi r31, r3, lbl_0000F020@l
/* 00001CC4 90010008 */ stw r0, 8(r1)
/* 00001CC8 C85F1E10 */ lfd f2, 0x1e10(r31)
/* 00001CCC C8010008 */ lfd f0, 8(r1)
/* 00001CD0 FC000828 */ fsub f0, f0, f1
/* 00001CD4 FC020000 */ fcmpu cr0, f2, f0
/* 00001CD8 40820024 */ bne lbl_00001CFC
/* 00001CDC 3C600000 */ lis r3, modeCtrl@ha
/* 00001CE0 38630000 */ addi r3, r3, modeCtrl@l
/* 00001CE4 80030024 */ lwz r0, 0x24(r3)
/* 00001CE8 2C000002 */ cmpwi r0, 2
/* 00001CEC 41800010 */ blt lbl_00001CFC
/* 00001CF0 3C600001 */ lis r3, 1
/* 00001CF4 3863D81E */ addi r3, r3, -10210
/* 00001CF8 4BFFE469 */ bl u_play_sound_0
lbl_00001CFC:
/* 00001CFC 3C600000 */ lis r3, currentBall@ha
/* 00001D00 C85F1E18 */ lfd f2, 0x1e18(r31)
/* 00001D04 38C30000 */ addi r6, r3, currentBall@l
/* 00001D08 80E60000 */ lwz r7, 0(r6)
/* 00001D0C 3C600000 */ lis r3, lbl_00010D58@ha
/* 00001D10 3C800000 */ lis r4, playerControllerIDs@ha
/* 00001D14 C8230000 */ lfd f1, lbl_00010D58@l(r3)
/* 00001D18 8807002E */ lbz r0, 0x2e(r7)
/* 00001D1C 3CA00000 */ lis r5, controllerInfo@ha
/* 00001D20 7C000774 */ extsb r0, r0
/* 00001D24 5403103A */ slwi r3, r0, 2
/* 00001D28 38040000 */ addi r0, r4, playerControllerIDs@l
/* 00001D2C 7C601A14 */ add r3, r0, r3
/* 00001D30 80630000 */ lwz r3, 0(r3)
/* 00001D34 38850000 */ addi r4, r5, controllerInfo@l
/* 00001D38 3C004330 */ lis r0, 0x4330
/* 00001D3C 1C63003C */ mulli r3, r3, 0x3c
/* 00001D40 7C641A14 */ add r3, r4, r3
/* 00001D44 88630002 */ lbz r3, 2(r3)
/* 00001D48 7C630774 */ extsb r3, r3
/* 00001D4C 6C638000 */ xoris r3, r3, 0x8000
/* 00001D50 9061000C */ stw r3, 0xc(r1)
/* 00001D54 90010008 */ stw r0, 8(r1)
/* 00001D58 C8010008 */ lfd f0, 8(r1)
/* 00001D5C FC000828 */ fsub f0, f0, f1
/* 00001D60 FC020032 */ fmul f0, f2, f0
/* 00001D64 FC000018 */ frsp f0, f0
/* 00001D68 D007001C */ stfs f0, 0x1c(r7)
/* 00001D6C 80660000 */ lwz r3, 0(r6)
/* 00001D70 C81F1E20 */ lfd f0, 0x1e20(r31)
/* 00001D74 C0430004 */ lfs f2, 4(r3)
/* 00001D78 FC020040 */ fcmpo cr0, f2, f0
/* 00001D7C 40810014 */ ble lbl_00001D90
/* 00001D80 C023001C */ lfs f1, 0x1c(r3)
/* 00001D84 C81F1DC0 */ lfd f0, 0x1dc0(r31)
/* 00001D88 FC010040 */ fcmpo cr0, f1, f0
/* 00001D8C 41810020 */ bgt lbl_00001DAC
lbl_00001D90:
/* 00001D90 C81F1E28 */ lfd f0, 0x1e28(r31)
/* 00001D94 FC020040 */ fcmpo cr0, f2, f0
/* 00001D98 4080001C */ bge lbl_00001DB4
/* 00001D9C C023001C */ lfs f1, 0x1c(r3)
/* 00001DA0 C81F1DC0 */ lfd f0, 0x1dc0(r31)
/* 00001DA4 FC010040 */ fcmpo cr0, f1, f0
/* 00001DA8 4080000C */ bge lbl_00001DB4
lbl_00001DAC:
/* 00001DAC C01F1C98 */ lfs f0, 0x1c98(r31)
/* 00001DB0 D003001C */ stfs f0, 0x1c(r3)
lbl_00001DB4:
/* 00001DB4 48005765 */ bl lbl_00007518
/* 00001DB8 3C600000 */ lis r3, currentBall@ha
/* 00001DBC 80830000 */ lwz r4, currentBall@l(r3)
/* 00001DC0 3C600000 */ lis r3, playerControllerIDs@ha
/* 00001DC4 3CA00000 */ lis r5, controllerInfo@ha
/* 00001DC8 8884002E */ lbz r4, 0x2e(r4)
/* 00001DCC 38030000 */ addi r0, r3, playerControllerIDs@l
/* 00001DD0 38A50000 */ addi r5, r5, controllerInfo@l
/* 00001DD4 7C830774 */ extsb r3, r4
/* 00001DD8 5463103A */ slwi r3, r3, 2
/* 00001DDC 7C601A14 */ add r3, r0, r3
/* 00001DE0 80030000 */ lwz r0, 0(r3)
/* 00001DE4 1C00003C */ mulli r0, r0, 0x3c
/* 00001DE8 7C650214 */ add r3, r5, r0
/* 00001DEC A0030018 */ lhz r0, 0x18(r3)
/* 00001DF0 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00001DF4 4182010C */ beq lbl_00001F00
/* 00001DF8 801E0000 */ lwz r0, 0(r30)
/* 00001DFC 3C600000 */ lis r3, lbl_00010D58@ha
/* 00001E00 C8430000 */ lfd f2, lbl_00010D58@l(r3)
/* 00001E04 6C008000 */ xoris r0, r0, 0x8000
/* 00001E08 C81F1E10 */ lfd f0, 0x1e10(r31)
/* 00001E0C 9001000C */ stw r0, 0xc(r1)
/* 00001E10 3C004330 */ lis r0, 0x4330
/* 00001E14 90010008 */ stw r0, 8(r1)
/* 00001E18 C8210008 */ lfd f1, 8(r1)
/* 00001E1C FC211028 */ fsub f1, f1, f2
/* 00001E20 FC010040 */ fcmpo cr0, f1, f0
/* 00001E24 40810024 */ ble lbl_00001E48
/* 00001E28 3C600000 */ lis r3, modeCtrl@ha
/* 00001E2C 38630000 */ addi r3, r3, modeCtrl@l
/* 00001E30 80030024 */ lwz r0, 0x24(r3)
/* 00001E34 2C000002 */ cmpwi r0, 2
/* 00001E38 41800010 */ blt lbl_00001E48
/* 00001E3C 3C600001 */ lis r3, 1
/* 00001E40 3863D81E */ addi r3, r3, -10210
/* 00001E44 4BFFE31D */ bl u_play_sound_0
lbl_00001E48:
/* 00001E48 3860011A */ li r3, 0x11a
/* 00001E4C 4BFFE315 */ bl u_play_sound_0
/* 00001E50 3C600000 */ lis r3, currentBall@ha
/* 00001E54 3BA30000 */ addi r29, r3, currentBall@l
/* 00001E58 807D0000 */ lwz r3, 0(r29)
/* 00001E5C 38800000 */ li r4, 0
/* 00001E60 38A00000 */ li r5, 0
/* 00001E64 8863002E */ lbz r3, 0x2e(r3)
/* 00001E68 7C630774 */ extsb r3, r3
/* 00001E6C 4BFFE2F5 */ bl SoundIcsReq
/* 00001E70 C01F1C98 */ lfs f0, 0x1c98(r31)
/* 00001E74 38000000 */ li r0, 0
/* 00001E78 807D0000 */ lwz r3, 0(r29)
/* 00001E7C 39200258 */ li r9, 0x258
/* 00001E80 3CC00000 */ lis r6, lbl_00014F20@ha
/* 00001E84 D003001C */ stfs f0, 0x1c(r3)
/* 00001E88 3C600000 */ lis r3, cameraInfo@ha
/* 00001E8C 38630000 */ addi r3, r3, cameraInfo@l
/* 00001E90 80FD0000 */ lwz r7, 0(r29)
/* 00001E94 39000008 */ li r8, 8
/* 00001E98 3CA00000 */ lis r5, lbl_00014F24@ha
/* 00001E9C B0070064 */ sth r0, 0x64(r7)
/* 00001EA0 38E60000 */ addi r7, r6, lbl_00014F20@l
/* 00001EA4 38C04125 */ li r6, 0x4125
/* 00001EA8 C01F1C98 */ lfs f0, 0x1c98(r31)
/* 00001EAC 3C800000 */ lis r4, currentCamera@ha
/* 00001EB0 38000003 */ li r0, 3
/* 00001EB4 D01E0160 */ stfs f0, 0x160(r30)
/* 00001EB8 39430284 */ addi r10, r3, 0x284
/* 00001EBC C01F1E30 */ lfs f0, 0x1e30(r31)
/* 00001EC0 D01E0164 */ stfs f0, 0x164(r30)
/* 00001EC4 913E0000 */ stw r9, 0(r30)
/* 00001EC8 91070000 */ stw r8, 0(r7)
/* 00001ECC 90C50000 */ stw r6, lbl_00014F24@l(r5)
/* 00001ED0 84A40000 */ lwzu r5, currentCamera@l(r4)
/* 00001ED4 90640000 */ stw r3, 0(r4)
/* 00001ED8 9803001F */ stb r0, 0x1f(r3)
/* 00001EDC 91440000 */ stw r10, 0(r4)
/* 00001EE0 394A0284 */ addi r10, r10, 0x284
/* 00001EE4 980302A3 */ stb r0, 0x2a3(r3)
/* 00001EE8 91440000 */ stw r10, 0(r4)
/* 00001EEC 980A001F */ stb r0, 0x1f(r10)
/* 00001EF0 394A0284 */ addi r10, r10, 0x284
/* 00001EF4 91440000 */ stw r10, 0(r4)
/* 00001EF8 980A001F */ stb r0, 0x1f(r10)
/* 00001EFC 90A40000 */ stw r5, 0(r4)
lbl_00001F00:
/* 00001F00 80010024 */ lwz r0, 0x24(r1)
/* 00001F04 83E1001C */ lwz r31, 0x1c(r1)
/* 00001F08 83C10018 */ lwz r30, 0x18(r1)
/* 00001F0C 7C0803A6 */ mtlr r0
/* 00001F10 83A10014 */ lwz r29, 0x14(r1)
/* 00001F14 38210020 */ addi r1, r1, 0x20
/* 00001F18 4E800020 */ blr 
