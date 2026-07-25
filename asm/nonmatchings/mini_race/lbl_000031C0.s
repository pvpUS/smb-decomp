/* 000031C0 7C0802A6 */ mflr r0
/* 000031C4 90010004 */ stw r0, 4(r1)
/* 000031C8 9421FFD8 */ stwu r1, -0x28(r1)
/* 000031CC DBE10020 */ stfd f31, 0x20(r1)
/* 000031D0 FFE00890 */ fmr f31, f1
/* 000031D4 93E1001C */ stw r31, 0x1c(r1)
/* 000031D8 3BE40000 */ addi r31, r4, 0
/* 000031DC 93C10018 */ stw r30, 0x18(r1)
/* 000031E0 3BC30000 */ addi r30, r3, 0
/* 000031E4 80630000 */ lwz r3, 0(r3)
/* 000031E8 809E0004 */ lwz r4, 4(r30)
/* 000031EC 4BFFCF91 */ bl interpolate_keyframes
/* 000031F0 D03F0000 */ stfs f1, 0(r31)
/* 000031F4 FC20F890 */ fmr f1, f31
/* 000031F8 807E0008 */ lwz r3, 8(r30)
/* 000031FC 809E000C */ lwz r4, 0xc(r30)
/* 00003200 4BFFCF7D */ bl interpolate_keyframes
/* 00003204 D03F0004 */ stfs f1, 4(r31)
/* 00003208 FC20F890 */ fmr f1, f31
/* 0000320C 807E0010 */ lwz r3, 0x10(r30)
/* 00003210 809E0014 */ lwz r4, 0x14(r30)
/* 00003214 4BFFCF69 */ bl interpolate_keyframes
/* 00003218 D03F0008 */ stfs f1, 8(r31)
/* 0000321C 8001002C */ lwz r0, 0x2c(r1)
/* 00003220 CBE10020 */ lfd f31, 0x20(r1)
/* 00003224 83E1001C */ lwz r31, 0x1c(r1)
/* 00003228 7C0803A6 */ mtlr r0
/* 0000322C 83C10018 */ lwz r30, 0x18(r1)
/* 00003230 38210028 */ addi r1, r1, 0x28
/* 00003234 4E800020 */ blr 
