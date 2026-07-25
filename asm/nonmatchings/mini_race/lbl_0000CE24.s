/* 0000CE24 7C0802A6 */ mflr r0
/* 0000CE28 3CA08889 */ lis r5, 0x8889
/* 0000CE2C 90010004 */ stw r0, 4(r1)
/* 0000CE30 38E58889 */ addi r7, r5, -30583
/* 0000CE34 4CC63182 */ crclr 6
/* 0000CE38 3863008C */ addi r3, r3, 0x8c
/* 0000CE3C 9421FFE0 */ stwu r1, -0x20(r1)
/* 0000CE40 81040000 */ lwz r8, 0(r4)
/* 0000CE44 C0040004 */ lfs f0, 4(r4)
/* 0000CE48 7C074096 */ mulhw r0, r7, r8
/* 0000CE4C 7C804214 */ add r4, r0, r8
/* 0000CE50 7C802E70 */ srawi r0, r4, 5
/* 0000CE54 54050FFE */ srwi r5, r0, 0x1f
/* 0000CE58 7CC02A14 */ add r6, r0, r5
/* 0000CE5C 7C073096 */ mulhw r0, r7, r6
/* 0000CE60 7C003214 */ add r0, r0, r6
/* 0000CE64 7C0A2E70 */ srawi r10, r0, 5
/* 0000CE68 7C092E70 */ srawi r9, r0, 5
/* 0000CE6C 7C802E70 */ srawi r0, r4, 5
/* 0000CE70 54040FFE */ srwi r4, r0, 0x1f
/* 0000CE74 7C002214 */ add r0, r0, r4
/* 0000CE78 1C00003C */ mulli r0, r0, 0x3c
/* 0000CE7C 7C004050 */ subf r0, r0, r8
/* 0000CE80 6C008000 */ xoris r0, r0, 0x8000
/* 0000CE84 9001001C */ stw r0, 0x1c(r1)
/* 0000CE88 3C004330 */ lis r0, 0x4330
/* 0000CE8C 3C800000 */ lis r4, lbl_00013C70@ha
/* 0000CE90 90010018 */ stw r0, 0x18(r1)
/* 0000CE94 55200FFE */ srwi r0, r9, 0x1f
/* 0000CE98 C8440000 */ lfd f2, lbl_00013C70@l(r4)
/* 0000CE9C 7C090214 */ add r0, r9, r0
/* 0000CEA0 C8210018 */ lfd f1, 0x18(r1)
/* 0000CEA4 1D20003C */ mulli r9, r0, 0x3c
/* 0000CEA8 EC211028 */ fsubs f1, f1, f2
/* 0000CEAC 3CA00000 */ lis r5, lbl_00013D3C@ha
/* 0000CEB0 EC21002A */ fadds f1, f1, f0
/* 0000CEB4 C0450000 */ lfs f2, lbl_00013D3C@l(r5)
/* 0000CEB8 3C800000 */ lis r4, lbl_00013C78@ha
/* 0000CEBC C0040000 */ lfs f0, lbl_00013C78@l(r4)
/* 0000CEC0 55400FFE */ srwi r0, r10, 0x1f
/* 0000CEC4 EC220072 */ fmuls f1, f2, f1
/* 0000CEC8 3D001062 */ lis r8, 0x1062
/* 0000CECC 3C800000 */ lis r4, lbl_00015CB8@ha
/* 0000CED0 7CAA0214 */ add r5, r10, r0
/* 0000CED4 EC010024 */ fdivs f0, f1, f0
/* 0000CED8 3CE06666 */ lis r7, 0x6666
/* 0000CEDC 39084DD3 */ addi r8, r8, 0x4dd3
/* 0000CEE0 38076667 */ addi r0, r7, 0x6667
/* 0000CEE4 7CC93050 */ subf r6, r9, r6
/* 0000CEE8 FC00001E */ fctiwz f0, f0
/* 0000CEEC 38840000 */ addi r4, r4, lbl_00015CB8@l
/* 0000CEF0 D8010010 */ stfd f0, 0x10(r1)
/* 0000CEF4 81410014 */ lwz r10, 0x14(r1)
/* 0000CEF8 7CE85096 */ mulhw r7, r8, r10
/* 0000CEFC 7CE93670 */ srawi r9, r7, 6
/* 0000CF00 7CE73670 */ srawi r7, r7, 6
/* 0000CF04 54E80FFE */ srwi r8, r7, 0x1f
/* 0000CF08 7CE74214 */ add r7, r7, r8
/* 0000CF0C 1CE703E8 */ mulli r7, r7, 0x3e8
/* 0000CF10 7D475050 */ subf r10, r7, r10
/* 0000CF14 7C005096 */ mulhw r0, r0, r10
/* 0000CF18 55270FFE */ srwi r7, r9, 0x1f
/* 0000CF1C 7CE93A14 */ add r7, r9, r7
/* 0000CF20 7C001670 */ srawi r0, r0, 2
/* 0000CF24 7CC63A14 */ add r6, r6, r7
/* 0000CF28 54070FFE */ srwi r7, r0, 0x1f
/* 0000CF2C 7CE03A14 */ add r7, r0, r7
/* 0000CF30 4BFF324D */ bl sprintf
/* 0000CF34 80010024 */ lwz r0, 0x24(r1)
/* 0000CF38 38210020 */ addi r1, r1, 0x20
/* 0000CF3C 7C0803A6 */ mtlr r0
/* 0000CF40 4E800020 */ blr 
