/* 0000FA18 7C0802A6 */ mflr r0
/* 0000FA1C 3C800000 */ lis r4, lbl_10000170@ha
/* 0000FA20 90010004 */ stw r0, 4(r1)
/* 0000FA24 38000000 */ li r0, 0
/* 0000FA28 9421FF80 */ stwu r1, -0x80(r1)
/* 0000FA2C DBE10078 */ stfd f31, 0x78(r1)
/* 0000FA30 93E10074 */ stw r31, 0x74(r1)
/* 0000FA34 3BE40000 */ addi r31, r4, lbl_10000170@l
/* 0000FA38 3880FFFF */ li r4, -1
/* 0000FA3C 93C10070 */ stw r30, 0x70(r1)
/* 0000FA40 3BC30000 */ addi r30, r3, 0
/* 0000FA44 80BF000C */ lwz r5, 0xc(r31)
/* 0000FA48 2805003C */ cmplwi r5, 0x3c
/* 0000FA4C 7C002810 */ subfc r0, r0, r5
/* 0000FA50 7C040190 */ subfze r0, r4
/* 0000FA54 40800074 */ bge lbl_0000FAC8
/* 0000FA58 809E00FC */ lwz r4, 0xfc(r30)
/* 0000FA5C 3C600000 */ lis r3, globalAnimTimer@ha
/* 0000FA60 80040014 */ lwz r0, 0x14(r4)
/* 0000FA64 540004A0 */ rlwinm r0, r0, 0, 0x12, 0x10
/* 0000FA68 90040014 */ stw r0, 0x14(r4)
/* 0000FA6C C01E0008 */ lfs f0, 8(r30)
/* 0000FA70 D01E0014 */ stfs f0, 0x14(r30)
/* 0000FA74 80030000 */ lwz r0, globalAnimTimer@l(r3)
/* 0000FA78 5403502A */ slwi r3, r0, 0xa
/* 0000FA7C 4BFF0755 */ bl mathutil_sin
/* 0000FA80 3C600000 */ lis r3, (lbl_000264A8+0x20)@ha
/* 0000FA84 C8030000 */ lfd f0, (lbl_000264A8+0x20)@l(r3)
/* 0000FA88 FFE00072 */ fmul f31, f0, f1
/* 0000FA8C 4BFF9845 */ bl lbl_000092D0
/* 0000FA90 3C600000 */ lis r3, lbl_000264E0@ha
/* 0000FA94 C8030000 */ lfd f0, lbl_000264E0@l(r3)
/* 0000FA98 387E0000 */ addi r3, r30, 0
/* 0000FA9C 38810010 */ addi r4, r1, 0x10
/* 0000FAA0 FC00082A */ fadd f0, f0, f1
/* 0000FAA4 FC00F82A */ fadd f0, f0, f31
/* 0000FAA8 FC000018 */ frsp f0, f0
/* 0000FAAC D01E0008 */ stfs f0, 8(r30)
/* 0000FAB0 C03E0008 */ lfs f1, 8(r30)
/* 0000FAB4 C01E0014 */ lfs f0, 0x14(r30)
/* 0000FAB8 EC010028 */ fsubs f0, f1, f0
/* 0000FABC D01E0020 */ stfs f0, 0x20(r30)
/* 0000FAC0 4BFF0711 */ bl init_physball_from_ball
/* 0000FAC4 480000B0 */ b lbl_0000FB74
lbl_0000FAC8:
/* 0000FAC8 40820040 */ bne lbl_0000FB08
/* 0000FACC 80DE00FC */ lwz r6, 0xfc(r30)
/* 0000FAD0 3C600000 */ lis r3, cameraInfo@ha
/* 0000FAD4 38A30000 */ addi r5, r3, cameraInfo@l
/* 0000FAD8 80860014 */ lwz r4, 0x14(r6)
/* 0000FADC 38000008 */ li r0, 8
/* 0000FAE0 387E0000 */ addi r3, r30, 0
/* 0000FAE4 60844000 */ ori r4, r4, 0x4000
/* 0000FAE8 90860014 */ stw r4, 0x14(r6)
/* 0000FAEC 38810010 */ addi r4, r1, 0x10
/* 0000FAF0 80DE0094 */ lwz r6, 0x94(r30)
/* 0000FAF4 60C60040 */ ori r6, r6, 0x40
/* 0000FAF8 90DE0094 */ stw r6, 0x94(r30)
/* 0000FAFC 9805001F */ stb r0, 0x1f(r5)
/* 0000FB00 4BFF06D1 */ bl init_physball_from_ball
/* 0000FB04 48000070 */ b lbl_0000FB74
lbl_0000FB08:
/* 0000FB08 807E00FC */ lwz r3, 0xfc(r30)
/* 0000FB0C 38630060 */ addi r3, r3, 0x60
/* 0000FB10 4BFF06C1 */ bl mathutil_mtxA_from_quat
/* 0000FB14 38600800 */ li r3, 0x800
/* 0000FB18 4BFF06B9 */ bl mathutil_mtxA_rotate_y
/* 0000FB1C 807E00FC */ lwz r3, 0xfc(r30)
/* 0000FB20 38630060 */ addi r3, r3, 0x60
/* 0000FB24 4BFF06AD */ bl mathutil_mtxA_to_quat
/* 0000FB28 809E0094 */ lwz r4, 0x94(r30)
/* 0000FB2C 548005AD */ rlwinm. r0, r4, 0, 0x16, 0x16
/* 0000FB30 40820034 */ bne lbl_0000FB64
/* 0000FB34 807E00FC */ lwz r3, 0xfc(r30)
/* 0000FB38 80030014 */ lwz r0, 0x14(r3)
/* 0000FB3C 54000463 */ rlwinm. r0, r0, 0, 0x11, 0x11
/* 0000FB40 41820024 */ beq lbl_0000FB64
/* 0000FB44 3800FAFF */ li r0, -1281
/* 0000FB48 7C800038 */ and r0, r4, r0
/* 0000FB4C 901E0094 */ stw r0, 0x94(r30)
/* 0000FB50 38600126 */ li r3, 0x126
/* 0000FB54 801E0094 */ lwz r0, 0x94(r30)
/* 0000FB58 60000200 */ ori r0, r0, 0x200
/* 0000FB5C 901E0094 */ stw r0, 0x94(r30)
/* 0000FB60 4BFF0671 */ bl u_play_sound_0
lbl_0000FB64:
/* 0000FB64 387E0000 */ addi r3, r30, 0
/* 0000FB68 38810010 */ addi r4, r1, 0x10
/* 0000FB6C 38A00000 */ li r5, 0
/* 0000FB70 48000795 */ bl lbl_00010304
lbl_0000FB74:
/* 0000FB74 80BF000C */ lwz r5, 0xc(r31)
/* 0000FB78 387E0000 */ addi r3, r30, 0
/* 0000FB7C 38810010 */ addi r4, r1, 0x10
/* 0000FB80 38050001 */ addi r0, r5, 1
/* 0000FB84 901F000C */ stw r0, 0xc(r31)
/* 0000FB88 38A00000 */ li r5, 0
/* 0000FB8C 4BFF0645 */ bl handle_ball_rotational_kinematics
/* 0000FB90 387E0000 */ addi r3, r30, 0
/* 0000FB94 38810010 */ addi r4, r1, 0x10
/* 0000FB98 38A00000 */ li r5, 0
/* 0000FB9C 4BFF0635 */ bl update_ball_ape_transform
/* 0000FBA0 807E0080 */ lwz r3, 0x80(r30)
/* 0000FBA4 38030001 */ addi r0, r3, 1
/* 0000FBA8 901E0080 */ stw r0, 0x80(r30)
/* 0000FBAC 80010084 */ lwz r0, 0x84(r1)
/* 0000FBB0 CBE10078 */ lfd f31, 0x78(r1)
/* 0000FBB4 83E10074 */ lwz r31, 0x74(r1)
/* 0000FBB8 83C10070 */ lwz r30, 0x70(r1)
/* 0000FBBC 38210080 */ addi r1, r1, 0x80
/* 0000FBC0 7C0803A6 */ mtlr r0
/* 0000FBC4 4E800020 */ blr 
