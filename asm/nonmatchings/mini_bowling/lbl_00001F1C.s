/* 00001F1C 7C0802A6 */ mflr r0
/* 00001F20 3C600000 */ lis r3, lbl_10000000@ha
/* 00001F24 90010004 */ stw r0, 4(r1)
/* 00001F28 3C800000 */ lis r4, lbl_0000F020@ha
/* 00001F2C 9421FFE8 */ stwu r1, -0x18(r1)
/* 00001F30 93E10014 */ stw r31, 0x14(r1)
/* 00001F34 93C10010 */ stw r30, 0x10(r1)
/* 00001F38 3BC40000 */ addi r30, r4, lbl_0000F020@l
/* 00001F3C 93A1000C */ stw r29, 0xc(r1)
/* 00001F40 3BA30000 */ addi r29, r3, lbl_10000000@l
/* 00001F44 3C600000 */ lis r3, lbl_00014F20@ha
/* 00001F48 93810008 */ stw r28, 8(r1)
/* 00001F4C 3BE30000 */ addi r31, r3, lbl_00014F20@l
/* 00001F50 801D0000 */ lwz r0, 0(r29)
/* 00001F54 2C00012C */ cmpwi r0, 0x12c
/* 00001F58 40820008 */ bne lbl_00001F60
/* 00001F5C 4800C5B5 */ bl lbl_0000E510
lbl_00001F60:
/* 00001F60 C01D0160 */ lfs f0, 0x160(r29)
/* 00001F64 C05D0164 */ lfs f2, 0x164(r29)
/* 00001F68 EC00102A */ fadds f0, f0, f2
/* 00001F6C D01D0160 */ stfs f0, 0x160(r29)
/* 00001F70 C03D0160 */ lfs f1, 0x160(r29)
/* 00001F74 C81E1D28 */ lfd f0, 0x1d28(r30)
/* 00001F78 FC010040 */ fcmpo cr0, f1, f0
/* 00001F7C 4C411382 */ cror 2, 1, 2
/* 00001F80 40820018 */ bne lbl_00001F98
/* 00001F84 C03E1C9C */ lfs f1, 0x1c9c(r30)
/* 00001F88 FC001050 */ fneg f0, f2
/* 00001F8C D03D0160 */ stfs f1, 0x160(r29)
/* 00001F90 D01D0164 */ stfs f0, 0x164(r29)
/* 00001F94 48000024 */ b lbl_00001FB8
lbl_00001F98:
/* 00001F98 C81E1DC0 */ lfd f0, 0x1dc0(r30)
/* 00001F9C FC010040 */ fcmpo cr0, f1, f0
/* 00001FA0 4C401382 */ cror 2, 0, 2
/* 00001FA4 40820014 */ bne lbl_00001FB8
/* 00001FA8 C03E1C98 */ lfs f1, 0x1c98(r30)
/* 00001FAC FC001050 */ fneg f0, f2
/* 00001FB0 D03D0160 */ stfs f1, 0x160(r29)
/* 00001FB4 D01D0164 */ stfs f0, 0x164(r29)
lbl_00001FB8:
/* 00001FB8 C03D0160 */ lfs f1, 0x160(r29)
/* 00001FBC C81E1DC0 */ lfd f0, 0x1dc0(r30)
/* 00001FC0 FC010040 */ fcmpo cr0, f1, f0
/* 00001FC4 4C401382 */ cror 2, 0, 2
/* 00001FC8 40820010 */ bne lbl_00001FD8
/* 00001FCC 3C600104 */ lis r3, 0x104
/* 00001FD0 3863009D */ addi r3, r3, 0x9d
/* 00001FD4 4BFFE18D */ bl u_play_sound_0
lbl_00001FD8:
/* 00001FD8 C03D0160 */ lfs f1, 0x160(r29)
/* 00001FDC C81E1D28 */ lfd f0, 0x1d28(r30)
/* 00001FE0 FC010040 */ fcmpo cr0, f1, f0
/* 00001FE4 4C411382 */ cror 2, 1, 2
/* 00001FE8 40820010 */ bne lbl_00001FF8
/* 00001FEC 3C6000FC */ lis r3, 0xfc
/* 00001FF0 3863009E */ addi r3, r3, 0x9e
/* 00001FF4 4BFFE16D */ bl u_play_sound_0
lbl_00001FF8:
/* 00001FF8 C83E1E38 */ lfd f1, 0x1e38(r30)
/* 00001FFC 3C600000 */ lis r3, playerControllerIDs@ha
/* 00002000 C01D0160 */ lfs f0, 0x160(r29)
/* 00002004 3CA00000 */ lis r5, controllerInfo@ha
/* 00002008 38A50000 */ addi r5, r5, controllerInfo@l
/* 0000200C FC210032 */ fmul f1, f1, f0
/* 00002010 C81E1D28 */ lfd f0, 0x1d28(r30)
/* 00002014 3C800000 */ lis r4, currentBall@ha
/* 00002018 38030000 */ addi r0, r3, playerControllerIDs@l
/* 0000201C 3B850018 */ addi r28, r5, 0x18
/* 00002020 FC010028 */ fsub f0, f1, f0
/* 00002024 FC000018 */ frsp f0, f0
/* 00002028 D01D0168 */ stfs f0, 0x168(r29)
/* 0000202C 80640000 */ lwz r3, currentBall@l(r4)
/* 00002030 8863002E */ lbz r3, 0x2e(r3)
/* 00002034 7C630774 */ extsb r3, r3
/* 00002038 5463103A */ slwi r3, r3, 2
/* 0000203C 7C601A14 */ add r3, r0, r3
/* 00002040 80030000 */ lwz r0, 0(r3)
/* 00002044 1C00003C */ mulli r0, r0, 0x3c
/* 00002048 7C1C022E */ lhzx r0, r28, r0
/* 0000204C 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00002050 40820010 */ bne lbl_00002060
/* 00002054 801D0000 */ lwz r0, 0(r29)
/* 00002058 2C000000 */ cmpwi r0, 0
/* 0000205C 40800088 */ bge lbl_000020E4
lbl_00002060:
/* 00002060 3860006B */ li r3, 0x6b
/* 00002064 4BFFE0FD */ bl destroy_sprite_with_tag
/* 00002068 3860011A */ li r3, 0x11a
/* 0000206C 4BFFE0F5 */ bl u_play_sound_0
/* 00002070 C01E1C98 */ lfs f0, 0x1c98(r30)
/* 00002074 3C600000 */ lis r3, cameraInfo@ha
/* 00002078 38630000 */ addi r3, r3, cameraInfo@l
/* 0000207C D01D0160 */ stfs f0, 0x160(r29)
/* 00002080 38E0024C */ li r7, 0x24c
/* 00002084 38C00010 */ li r6, 0x10
/* 00002088 C01E1DFC */ lfs f0, 0x1dfc(r30)
/* 0000208C 38A04435 */ li r5, 0x4435
/* 00002090 3C800000 */ lis r4, currentCamera@ha
/* 00002094 D01D0164 */ stfs f0, 0x164(r29)
/* 00002098 38000004 */ li r0, 4
/* 0000209C 39030284 */ addi r8, r3, 0x284
/* 000020A0 C01E1C98 */ lfs f0, 0x1c98(r30)
/* 000020A4 D01D016C */ stfs f0, 0x16c(r29)
/* 000020A8 90FD0000 */ stw r7, 0(r29)
/* 000020AC 90DF0000 */ stw r6, 0(r31)
/* 000020B0 90BF0004 */ stw r5, 4(r31)
/* 000020B4 84A40000 */ lwzu r5, currentCamera@l(r4)
/* 000020B8 90640000 */ stw r3, 0(r4)
/* 000020BC 9803001F */ stb r0, 0x1f(r3)
/* 000020C0 91040000 */ stw r8, 0(r4)
/* 000020C4 39080284 */ addi r8, r8, 0x284
/* 000020C8 980302A3 */ stb r0, 0x2a3(r3)
/* 000020CC 91040000 */ stw r8, 0(r4)
/* 000020D0 9808001F */ stb r0, 0x1f(r8)
/* 000020D4 39080284 */ addi r8, r8, 0x284
/* 000020D8 91040000 */ stw r8, 0(r4)
/* 000020DC 9808001F */ stb r0, 0x1f(r8)
/* 000020E0 90A40000 */ stw r5, 0(r4)
lbl_000020E4:
/* 000020E4 3C600000 */ lis r3, currentBall@ha
/* 000020E8 80830000 */ lwz r4, currentBall@l(r3)
/* 000020EC 3C600000 */ lis r3, playerControllerIDs@ha
/* 000020F0 38030000 */ addi r0, r3, playerControllerIDs@l
/* 000020F4 8864002E */ lbz r3, 0x2e(r4)
/* 000020F8 7C630774 */ extsb r3, r3
/* 000020FC 5463103A */ slwi r3, r3, 2
/* 00002100 7C601A14 */ add r3, r0, r3
/* 00002104 80030000 */ lwz r0, 0(r3)
/* 00002108 1C00003C */ mulli r0, r0, 0x3c
/* 0000210C 7C1C022E */ lhzx r0, r28, r0
/* 00002110 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00002114 41820080 */ beq lbl_00002194
/* 00002118 3860006B */ li r3, 0x6b
/* 0000211C 4BFFE045 */ bl destroy_sprite_with_tag
/* 00002120 38600119 */ li r3, 0x119
/* 00002124 4BFFE03D */ bl u_play_sound_0
/* 00002128 C01E1C98 */ lfs f0, 0x1c98(r30)
/* 0000212C 3C600000 */ lis r3, cameraInfo@ha
/* 00002130 38E02710 */ li r7, 0x2710
/* 00002134 D01D0160 */ stfs f0, 0x160(r29)
/* 00002138 38C00004 */ li r6, 4
/* 0000213C 38A040A1 */ li r5, 0x40a1
/* 00002140 C01E1DFC */ lfs f0, 0x1dfc(r30)
/* 00002144 3C800000 */ lis r4, currentCamera@ha
/* 00002148 38630000 */ addi r3, r3, cameraInfo@l
/* 0000214C D01D0164 */ stfs f0, 0x164(r29)
/* 00002150 38000002 */ li r0, 2
/* 00002154 90FD0000 */ stw r7, 0(r29)
/* 00002158 38E30284 */ addi r7, r3, 0x284
/* 0000215C 90DF0000 */ stw r6, 0(r31)
/* 00002160 90BF0004 */ stw r5, 4(r31)
/* 00002164 84A40000 */ lwzu r5, currentCamera@l(r4)
/* 00002168 90640000 */ stw r3, 0(r4)
/* 0000216C 9803001F */ stb r0, 0x1f(r3)
/* 00002170 90E40000 */ stw r7, 0(r4)
/* 00002174 38E70284 */ addi r7, r7, 0x284
/* 00002178 980302A3 */ stb r0, 0x2a3(r3)
/* 0000217C 90E40000 */ stw r7, 0(r4)
/* 00002180 9807001F */ stb r0, 0x1f(r7)
/* 00002184 38E70284 */ addi r7, r7, 0x284
/* 00002188 90E40000 */ stw r7, 0(r4)
/* 0000218C 9807001F */ stb r0, 0x1f(r7)
/* 00002190 90A40000 */ stw r5, 0(r4)
lbl_00002194:
/* 00002194 8001001C */ lwz r0, 0x1c(r1)
/* 00002198 83E10014 */ lwz r31, 0x14(r1)
/* 0000219C 83C10010 */ lwz r30, 0x10(r1)
/* 000021A0 7C0803A6 */ mtlr r0
/* 000021A4 83A1000C */ lwz r29, 0xc(r1)
/* 000021A8 83810008 */ lwz r28, 8(r1)
/* 000021AC 38210018 */ addi r1, r1, 0x18
/* 000021B0 4E800020 */ blr 
