/* 0001106C 7C0802A6 */ mflr r0
/* 00011070 2C040003 */ cmpwi r4, 3
/* 00011074 90010004 */ stw r0, 4(r1)
/* 00011078 3CC00000 */ lis r6, lbl_0001C348@ha
/* 0001107C 9421FFB8 */ stwu r1, -0x48(r1)
/* 00011080 DBE10040 */ stfd f31, 0x40(r1)
/* 00011084 93E1003C */ stw r31, 0x3c(r1)
/* 00011088 3BE60000 */ addi r31, r6, lbl_0001C348@l
/* 0001108C 93C10038 */ stw r30, 0x38(r1)
/* 00011090 93A10034 */ stw r29, 0x34(r1)
/* 00011094 7C7D1B78 */ mr r29, r3
/* 00011098 93810030 */ stw r28, 0x30(r1)
/* 0001109C 880300C0 */ lbz r0, 0xc0(r3)
/* 000110A0 3C600000 */ lis r3, ballInfo@ha
/* 000110A4 7C000774 */ extsb r0, r0
/* 000110A8 1CA001A4 */ mulli r5, r0, 0x1a4
/* 000110AC 38030000 */ addi r0, r3, ballInfo@l
/* 000110B0 7FC02A14 */ add r30, r0, r5
/* 000110B4 41820008 */ beq lbl_000110BC
/* 000110B8 48000010 */ b lbl_000110C8
lbl_000110BC:
/* 000110BC 7FA3EB78 */ mr r3, r29
/* 000110C0 4BFEF0A5 */ bl ape_destroy
/* 000110C4 48000188 */ b lbl_0001124C
lbl_000110C8:
/* 000110C8 3C600000 */ lis r3, debugFlags@ha
/* 000110CC 80030000 */ lwz r0, debugFlags@l(r3)
/* 000110D0 7000000A */ andi. r0, r0, 0xa
/* 000110D4 40820178 */ bne lbl_0001124C
/* 000110D8 387E0004 */ addi r3, r30, 4
/* 000110DC 38810010 */ addi r4, r1, 0x10
/* 000110E0 38A00000 */ li r5, 0
/* 000110E4 4BFEF081 */ bl raycast_stage_down
/* 000110E8 807D0014 */ lwz r3, 0x14(r29)
/* 000110EC 3800FFEC */ li r0, -20
/* 000110F0 7C600038 */ and r0, r3, r0
/* 000110F4 901D0014 */ stw r0, 0x14(r29)
/* 000110F8 80010010 */ lwz r0, 0x10(r1)
/* 000110FC 540007FF */ clrlwi. r0, r0, 0x1f
/* 00011100 40820024 */ bne lbl_00011124
/* 00011104 C03E0020 */ lfs f1, 0x20(r30)
/* 00011108 C01F00B0 */ lfs f0, 0xb0(r31)
/* 0001110C FC010040 */ fcmpo cr0, f1, f0
/* 00011110 40800014 */ bge lbl_00011124
/* 00011114 801D0014 */ lwz r0, 0x14(r29)
/* 00011118 60000002 */ ori r0, r0, 2
/* 0001111C 901D0014 */ stw r0, 0x14(r29)
/* 00011120 4800003C */ b lbl_0001115C
lbl_00011124:
/* 00011124 387E00B8 */ addi r3, r30, 0xb8
/* 00011128 C0230000 */ lfs f1, 0(r3)
/* 0001112C C0430004 */ lfs f2, 4(r3)
/* 00011130 C0030008 */ lfs f0, 8(r3)
/* 00011134 EC210072 */ fmuls f1, f1, f1
/* 00011138 EC2208BA */ fmadds f1, f2, f2, f1
/* 0001113C EC20083A */ fmadds f1, f0, f0, f1
/* 00011140 4BFEF025 */ bl mathutil_sqrt
/* 00011144 C01F00B4 */ lfs f0, 0xb4(r31)
/* 00011148 FC010040 */ fcmpo cr0, f1, f0
/* 0001114C 40800010 */ bge lbl_0001115C
/* 00011150 801D0014 */ lwz r0, 0x14(r29)
/* 00011154 60000001 */ ori r0, r0, 1
/* 00011158 901D0014 */ stw r0, 0x14(r29)
lbl_0001115C:
/* 0001115C 809E0094 */ lwz r4, 0x94(r30)
/* 00011160 7FA3EB78 */ mr r3, r29
/* 00011164 801D0014 */ lwz r0, 0x14(r29)
/* 00011168 548404E6 */ rlwinm r4, r4, 0, 0x13, 0x13
/* 0001116C 7CA400D0 */ neg r5, r4
/* 00011170 540007BE */ clrlwi r0, r0, 0x1e
/* 00011174 3085FFFF */ addic r4, r5, -1
/* 00011178 7C000034 */ cntlzw r0, r0
/* 0001117C 7F842910 */ subfe r28, r4, r5
/* 00011180 5400D97E */ srwi r0, r0, 5
/* 00011184 7F9C0378 */ or r28, r28, r0
/* 00011188 4BFEEFDD */ bl u_ball_something_with_ape_rotation
/* 0001118C 2C1C0000 */ cmpwi r28, 0
/* 00011190 41820014 */ beq lbl_000111A4
/* 00011194 7FA3EB78 */ mr r3, r29
/* 00011198 4BFEEFCD */ bl u_ball_something_with_walking_speed
/* 0001119C FFE00890 */ fmr f31, f1
/* 000111A0 48000028 */ b lbl_000111C8
lbl_000111A4:
/* 000111A4 C3FF001C */ lfs f31, 0x1c(r31)
/* 000111A8 387D0060 */ addi r3, r29, 0x60
/* 000111AC 4BFEEFB9 */ bl mathutil_mtxA_from_quat
/* 000111B0 4BFEEFB5 */ bl mathutil_mtxA_normalize_basis
/* 000111B4 801D0014 */ lwz r0, 0x14(r29)
/* 000111B8 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 000111BC 4182000C */ beq lbl_000111C8
/* 000111C0 7FA3EB78 */ mr r3, r29
/* 000111C4 4BFEEFA1 */ bl func_80037718
lbl_000111C8:
/* 000111C8 801E0094 */ lwz r0, 0x94(r30)
/* 000111CC 540006B5 */ rlwinm. r0, r0, 0, 0x1a, 0x1a
/* 000111D0 41820028 */ beq lbl_000111F8
/* 000111D4 387E001C */ addi r3, r30, 0x1c
/* 000111D8 C0230000 */ lfs f1, 0(r3)
/* 000111DC C0430004 */ lfs f2, 4(r3)
/* 000111E0 C0030008 */ lfs f0, 8(r3)
/* 000111E4 EC210072 */ fmuls f1, f1, f1
/* 000111E8 EC2208BA */ fmadds f1, f2, f2, f1
/* 000111EC EC20083A */ fmadds f1, f0, f0, f1
/* 000111F0 4BFEEF75 */ bl mathutil_sqrt
/* 000111F4 FFE00890 */ fmr f31, f1
lbl_000111F8:
/* 000111F8 7FA3EB78 */ mr r3, r29
/* 000111FC 4BFEEF69 */ bl check_ball_teeter
/* 00011200 387D0060 */ addi r3, r29, 0x60
/* 00011204 4BFEEF61 */ bl mathutil_mtxA_to_quat
/* 00011208 7FA3EB78 */ mr r3, r29
/* 0001120C FC20F890 */ fmr f1, f31
/* 00011210 48000061 */ bl lbl_00011270
/* 00011214 7FA3EB78 */ mr r3, r29
/* 00011218 4BFEEF4D */ bl ape_skel_anim_main
/* 0001121C 801D0014 */ lwz r0, 0x14(r29)
/* 00011220 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 00011224 4082000C */ bne lbl_00011230
/* 00011228 7FA3EB78 */ mr r3, r29
/* 0001122C 4BFEEF39 */ bl func_8003765C
lbl_00011230:
/* 00011230 387D0000 */ addi r3, r29, 0
/* 00011234 389E0104 */ addi r4, r30, 0x104
/* 00011238 4BFEEF2D */ bl ape_face_dir
/* 0001123C 38000000 */ li r0, 0
/* 00011240 901E0100 */ stw r0, 0x100(r30)
/* 00011244 C01F001C */ lfs f0, 0x1c(r31)
/* 00011248 D01E0110 */ stfs f0, 0x110(r30)
lbl_0001124C:
/* 0001124C 8001004C */ lwz r0, 0x4c(r1)
/* 00011250 CBE10040 */ lfd f31, 0x40(r1)
/* 00011254 83E1003C */ lwz r31, 0x3c(r1)
/* 00011258 7C0803A6 */ mtlr r0
/* 0001125C 83C10038 */ lwz r30, 0x38(r1)
/* 00011260 83A10034 */ lwz r29, 0x34(r1)
/* 00011264 83810030 */ lwz r28, 0x30(r1)
/* 00011268 38210048 */ addi r1, r1, 0x48
/* 0001126C 4E800020 */ blr 
