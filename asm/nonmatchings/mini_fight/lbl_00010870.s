/* 00010870 7C0802A6 */ mflr r0
/* 00010874 3C800000 */ lis r4, lbl_0001C348@ha
/* 00010878 90010004 */ stw r0, 4(r1)
/* 0001087C 9421FF88 */ stwu r1, -0x78(r1)
/* 00010880 93E10074 */ stw r31, 0x74(r1)
/* 00010884 3BE40000 */ addi r31, r4, lbl_0001C348@l
/* 00010888 93C10070 */ stw r30, 0x70(r1)
/* 0001088C 7C7E1B78 */ mr r30, r3
/* 00010890 C01F001C */ lfs f0, 0x1c(r31)
/* 00010894 D003001C */ stfs f0, 0x1c(r3)
/* 00010898 80030080 */ lwz r0, 0x80(r3)
/* 0001089C 5403482C */ slwi r3, r0, 9
/* 000108A0 4BFEF8C5 */ bl mathutil_sin
/* 000108A4 C01F0080 */ lfs f0, 0x80(r31)
/* 000108A8 387E0000 */ addi r3, r30, 0
/* 000108AC 38810010 */ addi r4, r1, 0x10
/* 000108B0 EC000072 */ fmuls f0, f0, f1
/* 000108B4 38A00001 */ li r5, 1
/* 000108B8 D01E0020 */ stfs f0, 0x20(r30)
/* 000108BC C01F001C */ lfs f0, 0x1c(r31)
/* 000108C0 D01E0024 */ stfs f0, 0x24(r30)
/* 000108C4 4BFEF8A1 */ bl handle_ball_linear_kinematics
/* 000108C8 387E0000 */ addi r3, r30, 0
/* 000108CC 38810010 */ addi r4, r1, 0x10
/* 000108D0 38A00001 */ li r5, 1
/* 000108D4 4BFEF891 */ bl handle_ball_rotational_kinematics
/* 000108D8 387E0000 */ addi r3, r30, 0
/* 000108DC 38810010 */ addi r4, r1, 0x10
/* 000108E0 38A00001 */ li r5, 1
/* 000108E4 4BFEF881 */ bl update_ball_ape_transform
/* 000108E8 807E0080 */ lwz r3, 0x80(r30)
/* 000108EC 38030001 */ addi r0, r3, 1
/* 000108F0 901E0080 */ stw r0, 0x80(r30)
/* 000108F4 8001007C */ lwz r0, 0x7c(r1)
/* 000108F8 83E10074 */ lwz r31, 0x74(r1)
/* 000108FC 83C10070 */ lwz r30, 0x70(r1)
/* 00010900 38210078 */ addi r1, r1, 0x78
/* 00010904 7C0803A6 */ mtlr r0
/* 00010908 4E800020 */ blr 
