/* 00010FD0 7C0802A6 */ mflr r0
/* 00010FD4 3CC00000 */ lis r6, lbl_0001CFD0@ha
/* 00010FD8 90010004 */ stw r0, 4(r1)
/* 00010FDC 9421FFB8 */ stwu r1, -0x48(r1)
/* 00010FE0 DBE10040 */ stfd f31, 0x40(r1)
/* 00010FE4 FFE00890 */ fmr f31, f1
/* 00010FE8 DBC10038 */ stfd f30, 0x38(r1)
/* 00010FEC 93E10034 */ stw r31, 0x34(r1)
/* 00010FF0 3BE30000 */ addi r31, r3, 0
/* 00010FF4 93C10030 */ stw r30, 0x30(r1)
/* 00010FF8 3BC40000 */ addi r30, r4, 0
/* 00010FFC 93A1002C */ stw r29, 0x2c(r1)
/* 00011000 3BA60000 */ addi r29, r6, lbl_0001CFD0@l
/* 00011004 93810028 */ stw r28, 0x28(r1)
/* 00011008 3B850000 */ addi r28, r5, 0
/* 0001100C 4BFEF129 */ bl mathutil_mtxA_from_mtxB
/* 00011010 C03E0000 */ lfs f1, 0(r30)
/* 00011014 C01F0000 */ lfs f0, 0(r31)
/* 00011018 EC010028 */ fsubs f0, f1, f0
/* 0001101C D0010018 */ stfs f0, 0x18(r1)
/* 00011020 C01D3778 */ lfs f0, 0x3778(r29)
/* 00011024 D001001C */ stfs f0, 0x1c(r1)
/* 00011028 C03E0008 */ lfs f1, 8(r30)
/* 0001102C C01F0008 */ lfs f0, 8(r31)
/* 00011030 EC010028 */ fsubs f0, f1, f0
/* 00011034 D0010020 */ stfs f0, 0x20(r1)
/* 00011038 C0010018 */ lfs f0, 0x18(r1)
/* 0001103C C0210020 */ lfs f1, 0x20(r1)
/* 00011040 EC400032 */ fmuls f2, f0, f0
/* 00011044 C01D3880 */ lfs f0, 0x3880(r29)
/* 00011048 EC210072 */ fmuls f1, f1, f1
/* 0001104C EC22082A */ fadds f1, f2, f1
/* 00011050 FC010040 */ fcmpo cr0, f1, f0
/* 00011054 40800008 */ bge lbl_0001105C
/* 00011058 FC200090 */ fmr f1, f0
lbl_0001105C:
/* 0001105C 4BFEF0D9 */ bl mathutil_rsqrt
/* 00011060 FFC00890 */ fmr f30, f1
/* 00011064 7FE3FB78 */ mr r3, r31
/* 00011068 4BFEF0CD */ bl mathutil_mtxA_translate
/* 0001106C C0210018 */ lfs f1, 0x18(r1)
/* 00011070 C0010020 */ lfs f0, 0x20(r1)
/* 00011074 EC2107B2 */ fmuls f1, f1, f30
/* 00011078 EC4007B2 */ fmuls f2, f0, f30
/* 0001107C 4BFEF0B9 */ bl mathutil_mtxA_rotate_y_sin_cos
/* 00011080 C03D3778 */ lfs f1, 0x3778(r29)
/* 00011084 C05D37A4 */ lfs f2, 0x37a4(r29)
/* 00011088 4BFEF0AD */ bl mathutil_mtxA_rotate_y_sin_cos
/* 0001108C C07F0008 */ lfs f3, 8(r31)
/* 00011090 C05E0008 */ lfs f2, 8(r30)
/* 00011094 C03F0000 */ lfs f1, 0(r31)
/* 00011098 C01E0000 */ lfs f0, 0(r30)
/* 0001109C EC431028 */ fsubs f2, f3, f2
/* 000110A0 EC210028 */ fsubs f1, f1, f0
/* 000110A4 EC210072 */ fmuls f1, f1, f1
/* 000110A8 EC2208BA */ fmadds f1, f2, f2, f1
/* 000110AC 4BFEF089 */ bl mathutil_sqrt
/* 000110B0 7F800774 */ extsb r0, r28
/* 000110B4 FC600890 */ fmr f3, f1
/* 000110B8 2C000001 */ cmpwi r0, 1
/* 000110BC 4082001C */ bne lbl_000110D8
/* 000110C0 C01D37A8 */ lfs f0, 0x37a8(r29)
/* 000110C4 FC030040 */ fcmpo cr0, f3, f0
/* 000110C8 4081000C */ ble lbl_000110D4
/* 000110CC EC630028 */ fsubs f3, f3, f0
/* 000110D0 48000008 */ b lbl_000110D8
lbl_000110D4:
/* 000110D4 3B800000 */ li r28, 0
lbl_000110D8:
/* 000110D8 C01D37B8 */ lfs f0, 0x37b8(r29)
/* 000110DC FC20F890 */ fmr f1, f31
/* 000110E0 FC40F890 */ fmr f2, f31
/* 000110E4 EFC000F2 */ fmuls f30, f0, f3
/* 000110E8 FC60F090 */ fmr f3, f30
/* 000110EC 4BFEF049 */ bl mathutil_mtxA_scale_xyz
/* 000110F0 3C600000 */ lis r3, mathutilData@ha
/* 000110F4 3BC30000 */ addi r30, r3, mathutilData@l
/* 000110F8 807E0000 */ lwz r3, 0(r30)
/* 000110FC 38800000 */ li r4, 0
/* 00011100 4BFEF035 */ bl GXLoadPosMtxImm
/* 00011104 807E0000 */ lwz r3, 0(r30)
/* 00011108 38800000 */ li r4, 0
/* 0001110C 4BFEF029 */ bl GXLoadNrmMtxImm
/* 00011110 3C600000 */ lis r3, minigameGma@ha
/* 00011114 3BE30000 */ addi r31, r3, minigameGma@l
/* 00011118 807F0000 */ lwz r3, 0(r31)
/* 0001111C 80630008 */ lwz r3, 8(r3)
/* 00011120 80630138 */ lwz r3, 0x138(r3)
/* 00011124 4BFEF011 */ bl avdisp_draw_model_unculled_sort_translucent
/* 00011128 C03D3778 */ lfs f1, 0x3778(r29)
/* 0001112C C07D37C0 */ lfs f3, 0x37c0(r29)
/* 00011130 FC400890 */ fmr f2, f1
/* 00011134 4BFEF001 */ bl mathutil_mtxA_translate_xyz
/* 00011138 C03D37A8 */ lfs f1, 0x37a8(r29)
/* 0001113C EC61F024 */ fdivs f3, f1, f30
/* 00011140 FC400890 */ fmr f2, f1
/* 00011144 4BFEEFF1 */ bl mathutil_mtxA_scale_xyz
/* 00011148 807E0000 */ lwz r3, 0(r30)
/* 0001114C 38800000 */ li r4, 0
/* 00011150 4BFEEFE5 */ bl GXLoadPosMtxImm
/* 00011154 807E0000 */ lwz r3, 0(r30)
/* 00011158 38800000 */ li r4, 0
/* 0001115C 4BFEEFD9 */ bl GXLoadNrmMtxImm
/* 00011160 7F800775 */ extsb. r0, r28
/* 00011164 40820018 */ bne lbl_0001117C
/* 00011168 807F0000 */ lwz r3, 0(r31)
/* 0001116C 80630008 */ lwz r3, 8(r3)
/* 00011170 80630128 */ lwz r3, 0x128(r3)
/* 00011174 4BFEEFC1 */ bl avdisp_draw_model_unculled_sort_translucent
/* 00011178 48000014 */ b lbl_0001118C
lbl_0001117C:
/* 0001117C 807F0000 */ lwz r3, 0(r31)
/* 00011180 80630008 */ lwz r3, 8(r3)
/* 00011184 80630130 */ lwz r3, 0x130(r3)
/* 00011188 4BFEEFAD */ bl avdisp_draw_model_unculled_sort_translucent
lbl_0001118C:
/* 0001118C 8001004C */ lwz r0, 0x4c(r1)
/* 00011190 CBE10040 */ lfd f31, 0x40(r1)
/* 00011194 CBC10038 */ lfd f30, 0x38(r1)
/* 00011198 7C0803A6 */ mtlr r0
/* 0001119C 83E10034 */ lwz r31, 0x34(r1)
/* 000111A0 83C10030 */ lwz r30, 0x30(r1)
/* 000111A4 83A1002C */ lwz r29, 0x2c(r1)
/* 000111A8 83810028 */ lwz r28, 0x28(r1)
/* 000111AC 38210048 */ addi r1, r1, 0x48
/* 000111B0 4E800020 */ blr 
