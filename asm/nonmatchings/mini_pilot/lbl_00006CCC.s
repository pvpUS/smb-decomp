/* 00006CCC 3CA00000 */ lis r5, lbl_0000BE80@ha
/* 00006CD0 EC210132 */ fmuls f1, f1, f4
/* 00006CD4 38A50000 */ addi r5, r5, lbl_0000BE80@l
/* 00006CD8 C8850430 */ lfd f4, 0x430(r5)
/* 00006CDC C8050438 */ lfd f0, 0x438(r5)
/* 00006CE0 FC240072 */ fmul f1, f4, f1
/* 00006CE4 FC020028 */ fsub f0, f2, f0
/* 00006CE8 FC200818 */ frsp f1, f1
/* 00006CEC FC000072 */ fmul f0, f0, f1
/* 00006CF0 FC000018 */ frsp f0, f0
/* 00006CF4 D0030000 */ stfs f0, 0(r3)
/* 00006CF8 C8050440 */ lfd f0, 0x440(r5)
/* 00006CFC FC030028 */ fsub f0, f3, f0
/* 00006D00 FC000050 */ fneg f0, f0
/* 00006D04 FC000072 */ fmul f0, f0, f1
/* 00006D08 FC000018 */ frsp f0, f0
/* 00006D0C D0040000 */ stfs f0, 0(r4)
/* 00006D10 4E800020 */ blr 
