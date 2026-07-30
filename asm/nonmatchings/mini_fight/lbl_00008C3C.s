/* 00008C3C 9421FFC8 */ stwu r1, -0x38(r1)
/* 00008C40 3CE00000 */ lis r7, lbl_0001C108@ha
/* 00008C44 3C800000 */ lis r4, cameraInfo@ha
/* 00008C48 80030088 */ lwz r0, 0x88(r3)
/* 00008C4C 38E70000 */ addi r7, r7, lbl_0001C108@l
/* 00008C50 80C3008C */ lwz r6, 0x8c(r3)
/* 00008C54 3CA00000 */ lis r5, lbl_0001C138@ha
/* 00008C58 90010010 */ stw r0, 0x10(r1)
/* 00008C5C 3C004330 */ lis r0, 0x4330
/* 00008C60 90C10014 */ stw r6, 0x14(r1)
/* 00008C64 38C40000 */ addi r6, r4, cameraInfo@l
/* 00008C68 80830090 */ lwz r4, 0x90(r3)
/* 00008C6C 90810018 */ stw r4, 0x18(r1)
/* 00008C70 C0210010 */ lfs f1, 0x10(r1)
/* 00008C74 C80700A8 */ lfd f0, 0xa8(r7)
/* 00008C78 8083000C */ lwz r4, 0xc(r3)
/* 00008C7C FC010028 */ fsub f0, f1, f0
/* 00008C80 C90700B0 */ lfd f8, 0xb0(r7)
/* 00008C84 C0410014 */ lfs f2, 0x14(r1)
/* 00008C88 6C848000 */ xoris r4, r4, 0x8000
/* 00008C8C 90810034 */ stw r4, 0x34(r1)
/* 00008C90 FC624028 */ fsub f3, f2, f8
/* 00008C94 90010030 */ stw r0, 0x30(r1)
/* 00008C98 FCE04024 */ fdiv f7, f0, f8
/* 00008C9C C1610018 */ lfs f11, 0x18(r1)
/* 00008CA0 C8250000 */ lfd f1, lbl_0001C138@l(r5)
/* 00008CA4 C8010030 */ lfd f0, 0x30(r1)
/* 00008CA8 C84700C8 */ lfd f2, 0xc8(r7)
/* 00008CAC FCA01850 */ fneg f5, f3
/* 00008CB0 C0C60028 */ lfs f6, 0x28(r6)
/* 00008CB4 EC000828 */ fsubs f0, f0, f1
/* 00008CB8 C1460038 */ lfs f10, 0x38(r6)
/* 00008CBC FD205850 */ fneg f9, f11
/* 00008CC0 FCA54024 */ fdiv f5, f5, f8
/* 00008CC4 C086002C */ lfs f4, 0x2c(r6)
/* 00008CC8 C0230034 */ lfs f1, 0x34(r3)
/* 00008CCC 80830030 */ lwz r4, 0x30(r3)
/* 00008CD0 C86700C0 */ lfd f3, 0xc0(r7)
/* 00008CD4 FC020024 */ fdiv f0, f2, f0
/* 00008CD8 C0440014 */ lfs f2, 0x14(r4)
/* 00008CDC ED0A0272 */ fmuls f8, f10, f9
/* 00008CE0 FC852028 */ fsub f4, f5, f4
/* 00008CE4 FCC73028 */ fsub f6, f7, f6
/* 00008CE8 FC630232 */ fmul f3, f3, f8
/* 00008CEC FCA801B2 */ fmul f5, f8, f6
/* 00008CF0 FC880132 */ fmul f4, f8, f4
/* 00008CF4 FCA02818 */ frsp f5, f5
/* 00008CF8 FC631024 */ fdiv f3, f3, f2
/* 00008CFC FC000018 */ frsp f0, f0
/* 00008D00 EC250828 */ fsubs f1, f5, f1
/* 00008D04 FC802018 */ frsp f4, f4
/* 00008D08 FC601818 */ frsp f3, f3
/* 00008D0C EC200072 */ fmuls f1, f0, f1
/* 00008D10 D0230040 */ stfs f1, 0x40(r3)
/* 00008D14 C0230038 */ lfs f1, 0x38(r3)
/* 00008D18 EC240828 */ fsubs f1, f4, f1
/* 00008D1C EC200072 */ fmuls f1, f0, f1
/* 00008D20 D0230044 */ stfs f1, 0x44(r3)
/* 00008D24 C023003C */ lfs f1, 0x3c(r3)
/* 00008D28 EC2B0828 */ fsubs f1, f11, f1
/* 00008D2C EC200072 */ fmuls f1, f0, f1
/* 00008D30 D0230048 */ stfs f1, 0x48(r3)
/* 00008D34 C0430034 */ lfs f2, 0x34(r3)
/* 00008D38 C0230040 */ lfs f1, 0x40(r3)
/* 00008D3C EC22082A */ fadds f1, f2, f1
/* 00008D40 D0230034 */ stfs f1, 0x34(r3)
/* 00008D44 C0430038 */ lfs f2, 0x38(r3)
/* 00008D48 C0230044 */ lfs f1, 0x44(r3)
/* 00008D4C EC22082A */ fadds f1, f2, f1
/* 00008D50 D0230038 */ stfs f1, 0x38(r3)
/* 00008D54 C043003C */ lfs f2, 0x3c(r3)
/* 00008D58 C0230048 */ lfs f1, 0x48(r3)
/* 00008D5C EC22082A */ fadds f1, f2, f1
/* 00008D60 D023003C */ stfs f1, 0x3c(r3)
/* 00008D64 C0430024 */ lfs f2, 0x24(r3)
/* 00008D68 EC231028 */ fsubs f1, f3, f2
/* 00008D6C EC000072 */ fmuls f0, f0, f1
/* 00008D70 EC02002A */ fadds f0, f2, f0
/* 00008D74 D0030024 */ stfs f0, 0x24(r3)
/* 00008D78 C0030024 */ lfs f0, 0x24(r3)
/* 00008D7C D0030028 */ stfs f0, 0x28(r3)
/* 00008D80 C0030024 */ lfs f0, 0x24(r3)
/* 00008D84 D003002C */ stfs f0, 0x2c(r3)
/* 00008D88 A8830054 */ lha r4, 0x54(r3)
/* 00008D8C 7C803E70 */ srawi r0, r4, 7
/* 00008D90 7C002050 */ subf r0, r0, r4
/* 00008D94 B0030054 */ sth r0, 0x54(r3)
/* 00008D98 A883004C */ lha r4, 0x4c(r3)
/* 00008D9C A8030052 */ lha r0, 0x52(r3)
/* 00008DA0 7C040214 */ add r0, r4, r0
/* 00008DA4 B003004C */ sth r0, 0x4c(r3)
/* 00008DA8 A883004E */ lha r4, 0x4e(r3)
/* 00008DAC A8030054 */ lha r0, 0x54(r3)
/* 00008DB0 7C040214 */ add r0, r4, r0
/* 00008DB4 B003004E */ sth r0, 0x4e(r3)
/* 00008DB8 A8830050 */ lha r4, 0x50(r3)
/* 00008DBC A8030056 */ lha r0, 0x56(r3)
/* 00008DC0 7C040214 */ add r0, r4, r0
/* 00008DC4 B0030050 */ sth r0, 0x50(r3)
/* 00008DC8 38210038 */ addi r1, r1, 0x38
/* 00008DCC 4E800020 */ blr 
