/* 0000F940 7C0802A6 */ mflr r0
/* 0000F944 3C800000 */ lis r4, lbl_000101E0@ha
/* 0000F948 90010004 */ stw r0, 4(r1)
/* 0000F94C 3C600000 */ lis r3, lbl_10003BF8@ha
/* 0000F950 9421FFE0 */ stwu r1, -0x20(r1)
/* 0000F954 93E1001C */ stw r31, 0x1c(r1)
/* 0000F958 3BE30000 */ addi r31, r3, lbl_10003BF8@l
/* 0000F95C 93C10018 */ stw r30, 0x18(r1)
/* 0000F960 3BC40000 */ addi r30, r4, lbl_000101E0@l
/* 0000F964 93A10014 */ stw r29, 0x14(r1)
/* 0000F968 4BFF07F5 */ bl u_clear_buffers_2_and_5
/* 0000F96C 3C600000 */ lis r3, lbl_0000F6F0@ha
/* 0000F970 38630000 */ addi r3, r3, lbl_0000F6F0@l
/* 0000F974 38800000 */ li r4, 0
/* 0000F978 38A00005 */ li r5, 5
/* 0000F97C 4BFF07E1 */ bl thread_create
/* 0000F980 907F0000 */ stw r3, 0(r31)
/* 0000F984 38800000 */ li r4, 0
/* 0000F988 3C600000 */ lis r3, lbl_000156F0@ha
/* 0000F98C 909F0088 */ stw r4, 0x88(r31)
/* 0000F990 38C30000 */ addi r6, r3, lbl_000156F0@l
/* 0000F994 38600001 */ li r3, 1
/* 0000F998 909F008C */ stw r4, 0x8c(r31)
/* 0000F99C 3800FFFF */ li r0, -1
/* 0000F9A0 909F0078 */ stw r4, 0x78(r31)
/* 0000F9A4 909F006C */ stw r4, 0x6c(r31)
/* 0000F9A8 907F0068 */ stw r3, 0x68(r31)
/* 0000F9AC 901F0074 */ stw r0, 0x74(r31)
/* 0000F9B0 909F0004 */ stw r4, 4(r31)
/* 0000F9B4 909F0050 */ stw r4, 0x50(r31)
/* 0000F9B8 909F00A4 */ stw r4, 0xa4(r31)
/* 0000F9BC 909F00A8 */ stw r4, 0xa8(r31)
/* 0000F9C0 909F00BC */ stw r4, 0xbc(r31)
/* 0000F9C4 909F0010 */ stw r4, 0x10(r31)
/* 0000F9C8 909F0014 */ stw r4, 0x14(r31)
/* 0000F9CC 909F0018 */ stw r4, 0x18(r31)
/* 0000F9D0 909F001C */ stw r4, 0x1c(r31)
/* 0000F9D4 909F0020 */ stw r4, 0x20(r31)
/* 0000F9D8 909F0024 */ stw r4, 0x24(r31)
/* 0000F9DC 909F0028 */ stw r4, 0x28(r31)
/* 0000F9E0 909F002C */ stw r4, 0x2c(r31)
/* 0000F9E4 909F0030 */ stw r4, 0x30(r31)
/* 0000F9E8 909F0034 */ stw r4, 0x34(r31)
/* 0000F9EC 909F0038 */ stw r4, 0x38(r31)
/* 0000F9F0 909F003C */ stw r4, 0x3c(r31)
/* 0000F9F4 909F0040 */ stw r4, 0x40(r31)
/* 0000F9F8 909F0044 */ stw r4, 0x44(r31)
/* 0000F9FC 909F0048 */ stw r4, 0x48(r31)
/* 0000FA00 909F004C */ stw r4, 0x4c(r31)
/* 0000FA04 909F0060 */ stw r4, 0x60(r31)
/* 0000FA08 909F005C */ stw r4, 0x5c(r31)
/* 0000FA0C 909F0058 */ stw r4, 0x58(r31)
/* 0000FA10 909F0054 */ stw r4, 0x54(r31)
/* 0000FA14 909F0070 */ stw r4, 0x70(r31)
/* 0000FA18 48000014 */ b lbl_0000FA2C
lbl_0000FA1C:
/* 0000FA1C 807F0070 */ lwz r3, 0x70(r31)
/* 0000FA20 38C60008 */ addi r6, r6, 8
/* 0000FA24 38030001 */ addi r0, r3, 1
/* 0000FA28 901F0070 */ stw r0, 0x70(r31)
lbl_0000FA2C:
/* 0000FA2C 80060004 */ lwz r0, 4(r6)
/* 0000FA30 28000000 */ cmplwi r0, 0
/* 0000FA34 4082FFE8 */ bne lbl_0000FA1C
/* 0000FA38 4BFFE0F5 */ bl lbl_0000DB2C
/* 0000FA3C 38600003 */ li r3, 3
/* 0000FA40 4BFF071D */ bl camera_set_state_all
/* 0000FA44 3C600000 */ lis r3, currentCamera@ha
/* 0000FA48 C01E000C */ lfs f0, 0xc(r30)
/* 0000FA4C 38830000 */ addi r4, r3, currentCamera@l
/* 0000FA50 80640000 */ lwz r3, 0(r4)
/* 0000FA54 D0030000 */ stfs f0, 0(r3)
/* 0000FA58 C01E00C0 */ lfs f0, 0xc0(r30)
/* 0000FA5C 80640000 */ lwz r3, 0(r4)
/* 0000FA60 D0030004 */ stfs f0, 4(r3)
/* 0000FA64 C01E00C4 */ lfs f0, 0xc4(r30)
/* 0000FA68 80640000 */ lwz r3, 0(r4)
/* 0000FA6C D0030008 */ stfs f0, 8(r3)
/* 0000FA70 C01E000C */ lfs f0, 0xc(r30)
/* 0000FA74 80640000 */ lwz r3, 0(r4)
/* 0000FA78 D003000C */ stfs f0, 0xc(r3)
/* 0000FA7C C01E00C8 */ lfs f0, 0xc8(r30)
/* 0000FA80 80640000 */ lwz r3, 0(r4)
/* 0000FA84 D0030010 */ stfs f0, 0x10(r3)
/* 0000FA88 C01E000C */ lfs f0, 0xc(r30)
/* 0000FA8C 80640000 */ lwz r3, 0(r4)
/* 0000FA90 D0030014 */ stfs f0, 0x14(r3)
/* 0000FA94 4BFF06C9 */ bl u_something_with_skel_model_names
/* 0000FA98 3C600000 */ lis r3, motsklFileData@ha
/* 0000FA9C 3BA30000 */ addi r29, r3, motsklFileData@l
/* 0000FAA0 807D0000 */ lwz r3, 0(r29)
/* 0000FAA4 3C800000 */ lis r4, __OSCurrHeap@ha
/* 0000FAA8 38A40000 */ addi r5, r4, __OSCurrHeap@l
/* 0000FAAC 80830004 */ lwz r4, 4(r3)
/* 0000FAB0 80650000 */ lwz r3, 0(r5)
/* 0000FAB4 38040001 */ addi r0, r4, 1
/* 0000FAB8 5404103A */ slwi r4, r0, 2
/* 0000FABC 4BFF06A1 */ bl OSAllocFromHeap
/* 0000FAC0 38A00000 */ li r5, 0
/* 0000FAC4 907F0080 */ stw r3, 0x80(r31)
/* 0000FAC8 38C50000 */ addi r6, r5, 0
/* 0000FACC 38E50000 */ addi r7, r5, 0
/* 0000FAD0 48000024 */ b lbl_0000FAF4
lbl_0000FAD4:
/* 0000FAD4 80830000 */ lwz r4, 0(r3)
/* 0000FAD8 38060014 */ addi r0, r6, 0x14
/* 0000FADC 807F0080 */ lwz r3, 0x80(r31)
/* 0000FAE0 38C60018 */ addi r6, r6, 0x18
/* 0000FAE4 7C04002E */ lwzx r0, r4, r0
/* 0000FAE8 38A50001 */ addi r5, r5, 1
/* 0000FAEC 7C03392E */ stwx r0, r3, r7
/* 0000FAF0 38E70004 */ addi r7, r7, 4
lbl_0000FAF4:
/* 0000FAF4 807D0000 */ lwz r3, 0(r29)
/* 0000FAF8 80030004 */ lwz r0, 4(r3)
/* 0000FAFC 7C050040 */ cmplw r5, r0
/* 0000FB00 4180FFD4 */ blt lbl_0000FAD4
/* 0000FB04 809F0080 */ lwz r4, 0x80(r31)
/* 0000FB08 3C600000 */ lis r3, motsklFileData@ha
/* 0000FB0C 54A0103A */ slwi r0, r5, 2
/* 0000FB10 3BC00000 */ li r30, 0
/* 0000FB14 7FC4012E */ stwx r30, r4, r0
/* 0000FB18 3BA30000 */ addi r29, r3, motsklFileData@l
/* 0000FB1C 3C600000 */ lis r3, __OSCurrHeap@ha
/* 0000FB20 809D0000 */ lwz r4, 0(r29)
/* 0000FB24 38630000 */ addi r3, r3, __OSCurrHeap@l
/* 0000FB28 80630000 */ lwz r3, 0(r3)
/* 0000FB2C 8084000C */ lwz r4, 0xc(r4)
/* 0000FB30 38040001 */ addi r0, r4, 1
/* 0000FB34 5404103A */ slwi r4, r0, 2
/* 0000FB38 4BFF0625 */ bl OSAllocFromHeap
/* 0000FB3C 907F0084 */ stw r3, 0x84(r31)
/* 0000FB40 38BE0000 */ addi r5, r30, 0
/* 0000FB44 38DE0000 */ addi r6, r30, 0
/* 0000FB48 48000020 */ b lbl_0000FB68
lbl_0000FB4C:
/* 0000FB4C 80830008 */ lwz r4, 8(r3)
/* 0000FB50 3BDE0001 */ addi r30, r30, 1
/* 0000FB54 807F0084 */ lwz r3, 0x84(r31)
/* 0000FB58 7C04282E */ lwzx r0, r4, r5
/* 0000FB5C 38A5001C */ addi r5, r5, 0x1c
/* 0000FB60 7C03312E */ stwx r0, r3, r6
/* 0000FB64 38C60004 */ addi r6, r6, 4
lbl_0000FB68:
/* 0000FB68 807D0000 */ lwz r3, 0(r29)
/* 0000FB6C 8003000C */ lwz r0, 0xc(r3)
/* 0000FB70 7C1E0040 */ cmplw r30, r0
/* 0000FB74 4180FFD8 */ blt lbl_0000FB4C
/* 0000FB78 807F0084 */ lwz r3, 0x84(r31)
/* 0000FB7C 57C0103A */ slwi r0, r30, 2
/* 0000FB80 38800000 */ li r4, 0
/* 0000FB84 7C83012E */ stwx r4, r3, r0
/* 0000FB88 4BFFDE75 */ bl lbl_0000D9FC
/* 0000FB8C 80010024 */ lwz r0, 0x24(r1)
/* 0000FB90 83E1001C */ lwz r31, 0x1c(r1)
/* 0000FB94 83C10018 */ lwz r30, 0x18(r1)
/* 0000FB98 7C0803A6 */ mtlr r0
/* 0000FB9C 83A10014 */ lwz r29, 0x14(r1)
/* 0000FBA0 38210020 */ addi r1, r1, 0x20
/* 0000FBA4 4E800020 */ blr 
