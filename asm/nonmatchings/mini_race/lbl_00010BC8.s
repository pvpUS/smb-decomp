/* 00010BC8 7C0802A6 */ mflr r0
/* 00010BCC 2C040003 */ cmpwi r4, 3
/* 00010BD0 90010004 */ stw r0, 4(r1)
/* 00010BD4 3CC00000 */ lis r6, lbl_00013F28@ha
/* 00010BD8 9421FFB8 */ stwu r1, -0x48(r1)
/* 00010BDC DBE10040 */ stfd f31, 0x40(r1)
/* 00010BE0 93E1003C */ stw r31, 0x3c(r1)
/* 00010BE4 3BE60000 */ addi r31, r6, lbl_00013F28@l
/* 00010BE8 93C10038 */ stw r30, 0x38(r1)
/* 00010BEC 93A10034 */ stw r29, 0x34(r1)
/* 00010BF0 7C7D1B78 */ mr r29, r3
/* 00010BF4 93810030 */ stw r28, 0x30(r1)
/* 00010BF8 880300C0 */ lbz r0, 0xc0(r3)
/* 00010BFC 3C600000 */ lis r3, ballInfo@ha
/* 00010C00 7C000774 */ extsb r0, r0
/* 00010C04 1CA001A4 */ mulli r5, r0, 0x1a4
/* 00010C08 38030000 */ addi r0, r3, ballInfo@l
/* 00010C0C 7FC02A14 */ add r30, r0, r5
/* 00010C10 41820008 */ beq lbl_00010C18
/* 00010C14 48000010 */ b lbl_00010C24
lbl_00010C18:
/* 00010C18 7FA3EB78 */ mr r3, r29
/* 00010C1C 4BFEF561 */ bl ape_destroy
/* 00010C20 48000188 */ b lbl_00010DA8
lbl_00010C24:
/* 00010C24 3C600000 */ lis r3, debugFlags@ha
/* 00010C28 80030000 */ lwz r0, debugFlags@l(r3)
/* 00010C2C 7000000A */ andi. r0, r0, 0xa
/* 00010C30 40820178 */ bne lbl_00010DA8
/* 00010C34 387E0004 */ addi r3, r30, 4
/* 00010C38 38810010 */ addi r4, r1, 0x10
/* 00010C3C 38A00000 */ li r5, 0
/* 00010C40 4BFEF53D */ bl raycast_stage_down
/* 00010C44 807D0014 */ lwz r3, 0x14(r29)
/* 00010C48 3800FFEC */ li r0, -20
/* 00010C4C 7C600038 */ and r0, r3, r0
/* 00010C50 901D0014 */ stw r0, 0x14(r29)
/* 00010C54 80010010 */ lwz r0, 0x10(r1)
/* 00010C58 540007FF */ clrlwi. r0, r0, 0x1f
/* 00010C5C 40820024 */ bne lbl_00010C80
/* 00010C60 C03E0020 */ lfs f1, 0x20(r30)
/* 00010C64 C01F0000 */ lfs f0, 0(r31)
/* 00010C68 FC010040 */ fcmpo cr0, f1, f0
/* 00010C6C 40800014 */ bge lbl_00010C80
/* 00010C70 801D0014 */ lwz r0, 0x14(r29)
/* 00010C74 60000002 */ ori r0, r0, 2
/* 00010C78 901D0014 */ stw r0, 0x14(r29)
/* 00010C7C 4800003C */ b lbl_00010CB8
lbl_00010C80:
/* 00010C80 387E00B8 */ addi r3, r30, 0xb8
/* 00010C84 C0230000 */ lfs f1, 0(r3)
/* 00010C88 C0430004 */ lfs f2, 4(r3)
/* 00010C8C C0030008 */ lfs f0, 8(r3)
/* 00010C90 EC210072 */ fmuls f1, f1, f1
/* 00010C94 EC2208BA */ fmadds f1, f2, f2, f1
/* 00010C98 EC20083A */ fmadds f1, f0, f0, f1
/* 00010C9C 4BFEF4E1 */ bl mathutil_sqrt
/* 00010CA0 C01F0004 */ lfs f0, 4(r31)
/* 00010CA4 FC010040 */ fcmpo cr0, f1, f0
/* 00010CA8 40800010 */ bge lbl_00010CB8
/* 00010CAC 801D0014 */ lwz r0, 0x14(r29)
/* 00010CB0 60000001 */ ori r0, r0, 1
/* 00010CB4 901D0014 */ stw r0, 0x14(r29)
lbl_00010CB8:
/* 00010CB8 809E0094 */ lwz r4, 0x94(r30)
/* 00010CBC 7FA3EB78 */ mr r3, r29
/* 00010CC0 801D0014 */ lwz r0, 0x14(r29)
/* 00010CC4 548404E6 */ rlwinm r4, r4, 0, 0x13, 0x13
/* 00010CC8 7CA400D0 */ neg r5, r4
/* 00010CCC 540007BE */ clrlwi r0, r0, 0x1e
/* 00010CD0 3085FFFF */ addic r4, r5, -1
/* 00010CD4 7C000034 */ cntlzw r0, r0
/* 00010CD8 7F842910 */ subfe r28, r4, r5
/* 00010CDC 5400D97E */ srwi r0, r0, 5
/* 00010CE0 7F9C0378 */ or r28, r28, r0
/* 00010CE4 4BFEF499 */ bl u_ball_something_with_ape_rotation
/* 00010CE8 2C1C0000 */ cmpwi r28, 0
/* 00010CEC 41820014 */ beq lbl_00010D00
/* 00010CF0 7FA3EB78 */ mr r3, r29
/* 00010CF4 4BFEF489 */ bl u_ball_something_with_walking_speed
/* 00010CF8 FFE00890 */ fmr f31, f1
/* 00010CFC 48000028 */ b lbl_00010D24
lbl_00010D00:
/* 00010D00 C3FF0008 */ lfs f31, 8(r31)
/* 00010D04 387D0060 */ addi r3, r29, 0x60
/* 00010D08 4BFEF475 */ bl mathutil_mtxA_from_quat
/* 00010D0C 4BFEF471 */ bl mathutil_mtxA_normalize_basis
/* 00010D10 801D0014 */ lwz r0, 0x14(r29)
/* 00010D14 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00010D18 4182000C */ beq lbl_00010D24
/* 00010D1C 7FA3EB78 */ mr r3, r29
/* 00010D20 4BFEF45D */ bl func_80037718
lbl_00010D24:
/* 00010D24 801E0094 */ lwz r0, 0x94(r30)
/* 00010D28 540006B5 */ rlwinm. r0, r0, 0, 0x1a, 0x1a
/* 00010D2C 41820028 */ beq lbl_00010D54
/* 00010D30 387E001C */ addi r3, r30, 0x1c
/* 00010D34 C0230000 */ lfs f1, 0(r3)
/* 00010D38 C0430004 */ lfs f2, 4(r3)
/* 00010D3C C0030008 */ lfs f0, 8(r3)
/* 00010D40 EC210072 */ fmuls f1, f1, f1
/* 00010D44 EC2208BA */ fmadds f1, f2, f2, f1
/* 00010D48 EC20083A */ fmadds f1, f0, f0, f1
/* 00010D4C 4BFEF431 */ bl mathutil_sqrt
/* 00010D50 FFE00890 */ fmr f31, f1
lbl_00010D54:
/* 00010D54 7FA3EB78 */ mr r3, r29
/* 00010D58 4BFEF425 */ bl check_ball_teeter
/* 00010D5C 387D0060 */ addi r3, r29, 0x60
/* 00010D60 4BFEF41D */ bl mathutil_mtxA_to_quat
/* 00010D64 7FA3EB78 */ mr r3, r29
/* 00010D68 FC20F890 */ fmr f1, f31
/* 00010D6C 48000061 */ bl lbl_00010DCC
/* 00010D70 7FA3EB78 */ mr r3, r29
/* 00010D74 4BFEF409 */ bl ape_skel_anim_main
/* 00010D78 801D0014 */ lwz r0, 0x14(r29)
/* 00010D7C 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 00010D80 4082000C */ bne lbl_00010D8C
/* 00010D84 7FA3EB78 */ mr r3, r29
/* 00010D88 4BFEF3F5 */ bl func_8003765C
lbl_00010D8C:
/* 00010D8C 387D0000 */ addi r3, r29, 0
/* 00010D90 389E0104 */ addi r4, r30, 0x104
/* 00010D94 4BFEF3E9 */ bl ape_face_dir
/* 00010D98 38000000 */ li r0, 0
/* 00010D9C 901E0100 */ stw r0, 0x100(r30)
/* 00010DA0 C01F0008 */ lfs f0, 8(r31)
/* 00010DA4 D01E0110 */ stfs f0, 0x110(r30)
lbl_00010DA8:
/* 00010DA8 8001004C */ lwz r0, 0x4c(r1)
/* 00010DAC CBE10040 */ lfd f31, 0x40(r1)
/* 00010DB0 83E1003C */ lwz r31, 0x3c(r1)
/* 00010DB4 7C0803A6 */ mtlr r0
/* 00010DB8 83C10038 */ lwz r30, 0x38(r1)
/* 00010DBC 83A10034 */ lwz r29, 0x34(r1)
/* 00010DC0 83810030 */ lwz r28, 0x30(r1)
/* 00010DC4 38210048 */ addi r1, r1, 0x48
/* 00010DC8 4E800020 */ blr 
