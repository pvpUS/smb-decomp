/* 0000F11C 7C0802A6 */ mflr r0
/* 0000F120 90010004 */ stw r0, 4(r1)
/* 0000F124 9421FFD8 */ stwu r1, -0x28(r1)
/* 0000F128 DBE10020 */ stfd f31, 0x20(r1)
/* 0000F12C FFE00890 */ fmr f31, f1
/* 0000F130 93E1001C */ stw r31, 0x1c(r1)
/* 0000F134 3BE40000 */ addi r31, r4, 0
/* 0000F138 93C10018 */ stw r30, 0x18(r1)
/* 0000F13C 3BC30000 */ addi r30, r3, 0
/* 0000F140 80630018 */ lwz r3, 0x18(r3)
/* 0000F144 809E001C */ lwz r4, 0x1c(r30)
/* 0000F148 4BFF1089 */ bl interpolate_keyframes
/* 0000F14C D03F0000 */ stfs f1, 0(r31)
/* 0000F150 FC20F890 */ fmr f1, f31
/* 0000F154 807E0020 */ lwz r3, 0x20(r30)
/* 0000F158 809E0024 */ lwz r4, 0x24(r30)
/* 0000F15C 4BFF1075 */ bl interpolate_keyframes
/* 0000F160 D03F0004 */ stfs f1, 4(r31)
/* 0000F164 FC20F890 */ fmr f1, f31
/* 0000F168 807E0028 */ lwz r3, 0x28(r30)
/* 0000F16C 809E002C */ lwz r4, 0x2c(r30)
/* 0000F170 4BFF1061 */ bl interpolate_keyframes
/* 0000F174 D03F0008 */ stfs f1, 8(r31)
/* 0000F178 8001002C */ lwz r0, 0x2c(r1)
/* 0000F17C CBE10020 */ lfd f31, 0x20(r1)
/* 0000F180 83E1001C */ lwz r31, 0x1c(r1)
/* 0000F184 7C0803A6 */ mtlr r0
/* 0000F188 83C10018 */ lwz r30, 0x18(r1)
/* 0000F18C 38210028 */ addi r1, r1, 0x28
/* 0000F190 4E800020 */ blr 
