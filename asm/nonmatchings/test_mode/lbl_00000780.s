/* 00000780 7C0802A6 */ mflr r0
/* 00000784 3C600000 */ lis r3, lbl_000106B4@ha
/* 00000788 90010004 */ stw r0, 4(r1)
/* 0000078C 4CC63182 */ crclr 6
/* 00000790 38630000 */ addi r3, r3, lbl_000106B4@l
/* 00000794 9421FFF8 */ stwu r1, -8(r1)
/* 00000798 4BFFF9C5 */ bl printf
/* 0000079C 8001000C */ lwz r0, 0xc(r1)
/* 000007A0 38210008 */ addi r1, r1, 8
/* 000007A4 7C0803A6 */ mtlr r0
/* 000007A8 4E800020 */ blr 
lbl_000007AC:
/* 000007AC 7C0802A6 */ mflr r0
/* 000007B0 3C600000 */ lis r3, debugFlags@ha
/* 000007B4 90010004 */ stw r0, 4(r1)
/* 000007B8 9421FFF8 */ stwu r1, -8(r1)
/* 000007BC 80030000 */ lwz r0, debugFlags@l(r3)
/* 000007C0 7000000A */ andi. r0, r0, 0xa
/* 000007C4 40820030 */ bne lbl_000007F4
/* 000007C8 4BFFF995 */ bl u_clear_buffers_2_and_5
/* 000007CC 3C600000 */ lis r3, lbl_10000004@ha
/* 000007D0 38000000 */ li r0, 0
/* 000007D4 90030000 */ stw r0, lbl_10000004@l(r3)
/* 000007D8 3CA00000 */ lis r5, lbl_00000780@ha
/* 000007DC 3C800000 */ lis r4, submodeFinishFunc@ha
/* 000007E0 38050000 */ addi r0, r5, lbl_00000780@l
/* 000007E4 90040000 */ stw r0, submodeFinishFunc@l(r4)
/* 000007E8 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 000007EC 38000064 */ li r0, 0x64
/* 000007F0 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
lbl_000007F4:
/* 000007F4 8001000C */ lwz r0, 0xc(r1)
/* 000007F8 38210008 */ addi r1, r1, 8
/* 000007FC 7C0803A6 */ mtlr r0
/* 00000800 4E800020 */ blr 
lbl_00000804:
/* 00000804 3C600000 */ lis r3, debugFlags@ha
/* 00000808 80030000 */ lwz r0, debugFlags@l(r3)
/* 0000080C 3C600000 */ lis r3, lbl_10000000@ha
/* 00000810 38630000 */ addi r3, r3, lbl_10000000@l
/* 00000814 7000000A */ andi. r0, r0, 0xa
/* 00000818 4C820020 */ bnelr 
/* 0000081C 3C800000 */ lis r4, controllerInfo@ha
/* 00000820 38A40000 */ addi r5, r4, controllerInfo@l
/* 00000824 A0C50030 */ lhz r6, 0x30(r5)
/* 00000828 54C00739 */ rlwinm. r0, r6, 0, 0x1c, 0x1c
/* 0000082C 40820040 */ bne lbl_0000086C
/* 00000830 3C800000 */ lis r4, analogInputs@ha
/* 00000834 38840000 */ addi r4, r4, analogInputs@l
/* 00000838 A0040008 */ lhz r0, 8(r4)
/* 0000083C 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 00000840 4082002C */ bne lbl_0000086C
/* 00000844 A0050000 */ lhz r0, 0(r5)
/* 00000848 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 0000084C 40820010 */ bne lbl_0000085C
/* 00000850 A0040000 */ lhz r0, 0(r4)
/* 00000854 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 00000858 41820038 */ beq lbl_00000890
lbl_0000085C:
/* 0000085C 3C800000 */ lis r4, analogInputs@ha
/* 00000860 A0040000 */ lhz r0, analogInputs@l(r4)
/* 00000864 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00000868 41820028 */ beq lbl_00000890
lbl_0000086C:
/* 0000086C 80830004 */ lwz r4, 4(r3)
/* 00000870 3404FFFF */ addic. r0, r4, -1
/* 00000874 90030004 */ stw r0, 4(r3)
/* 00000878 40800018 */ bge lbl_00000890
/* 0000087C 3C800000 */ lis r4, lbl_802F0980@ha
/* 00000880 38840000 */ addi r4, r4, lbl_802F0980@l
/* 00000884 80840000 */ lwz r4, 0(r4)
/* 00000888 3804FFFF */ addi r0, r4, -1
/* 0000088C 90030004 */ stw r0, 4(r3)
lbl_00000890:
/* 00000890 54C0077B */ rlwinm. r0, r6, 0, 0x1d, 0x1d
/* 00000894 40820044 */ bne lbl_000008D8
/* 00000898 3C800000 */ lis r4, analogInputs@ha
/* 0000089C 38A40000 */ addi r5, r4, analogInputs@l
/* 000008A0 A0050008 */ lhz r0, 8(r5)
/* 000008A4 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 000008A8 40820030 */ bne lbl_000008D8
/* 000008AC 3C800000 */ lis r4, controllerInfo@ha
/* 000008B0 A0040000 */ lhz r0, controllerInfo@l(r4)
/* 000008B4 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 000008B8 40820010 */ bne lbl_000008C8
/* 000008BC A0050000 */ lhz r0, 0(r5)
/* 000008C0 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 000008C4 41820038 */ beq lbl_000008FC
lbl_000008C8:
/* 000008C8 3C800000 */ lis r4, analogInputs@ha
/* 000008CC A0040000 */ lhz r0, analogInputs@l(r4)
/* 000008D0 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 000008D4 41820028 */ beq lbl_000008FC
lbl_000008D8:
/* 000008D8 80A30004 */ lwz r5, 4(r3)
/* 000008DC 3C800000 */ lis r4, lbl_802F0980@ha
/* 000008E0 38A50001 */ addi r5, r5, 1
/* 000008E4 90A30004 */ stw r5, 4(r3)
/* 000008E8 80040000 */ lwz r0, lbl_802F0980@l(r4)
/* 000008EC 7C050000 */ cmpw r5, r0
/* 000008F0 4180000C */ blt lbl_000008FC
/* 000008F4 38000000 */ li r0, 0
/* 000008F8 90030004 */ stw r0, 4(r3)
lbl_000008FC:
/* 000008FC 3C800000 */ lis r4, controllerInfo@ha
/* 00000900 38840000 */ addi r4, r4, controllerInfo@l
/* 00000904 A0040018 */ lhz r0, 0x18(r4)
/* 00000908 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 0000090C 4D820020 */ beqlr 
/* 00000910 3C800000 */ lis r4, dipSwitches@ha
/* 00000914 80030004 */ lwz r0, 4(r3)
/* 00000918 38A40000 */ addi r5, r4, dipSwitches@l
/* 0000091C 38600001 */ li r3, 1
/* 00000920 80850000 */ lwz r4, 0(r5)
/* 00000924 7C600030 */ slw r0, r3, r0
/* 00000928 7C800278 */ xor r0, r4, r0
/* 0000092C 90050000 */ stw r0, 0(r5)
/* 00000930 4E800020 */ blr 
