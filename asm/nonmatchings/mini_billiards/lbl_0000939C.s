/* 0000939C 3C800000 */ lis r4, lbl_10000000@ha
/* 000093A0 38840000 */ addi r4, r4, lbl_10000000@l
/* 000093A4 3CA40001 */ addis r5, r4, 1
/* 000093A8 88E4000A */ lbz r7, 0xa(r4)
/* 000093AC 8805B338 */ lbz r0, -0x4cc8(r5)
/* 000093B0 7CE60774 */ extsb r6, r7
/* 000093B4 7C000774 */ extsb r0, r0
/* 000093B8 7C060000 */ cmpw r6, r0
/* 000093BC 41820018 */ beq lbl_000093D4
/* 000093C0 98E5B338 */ stb r7, -0x4cc8(r5)
/* 000093C4 38000000 */ li r0, 0
/* 000093C8 38600000 */ li r3, 0
/* 000093CC 98040016 */ stb r0, 0x16(r4)
/* 000093D0 4E800020 */ blr 
lbl_000093D4:
/* 000093D4 80040020 */ lwz r0, 0x20(r4)
/* 000093D8 2C00001E */ cmpwi r0, 0x1e
/* 000093DC 4080000C */ bge lbl_000093E8
/* 000093E0 38600000 */ li r3, 0
/* 000093E4 4E800020 */ blr 
lbl_000093E8:
/* 000093E8 88040A6C */ lbz r0, 0xa6c(r4)
/* 000093EC 7C000775 */ extsb. r0, r0
/* 000093F0 41820030 */ beq lbl_00009420
/* 000093F4 3C600000 */ lis r3, playerControllerIDs@ha
/* 000093F8 80030000 */ lwz r0, playerControllerIDs@l(r3)
/* 000093FC 3C600000 */ lis r3, controllerInfo@ha
/* 00009400 38630000 */ addi r3, r3, controllerInfo@l
/* 00009404 1C00003C */ mulli r0, r0, 0x3c
/* 00009408 7C630214 */ add r3, r3, r0
/* 0000940C A0030018 */ lhz r0, 0x18(r3)
/* 00009410 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00009414 41820124 */ beq lbl_00009538
/* 00009418 38600001 */ li r3, 1
/* 0000941C 4E800020 */ blr 
lbl_00009420:
/* 00009420 7C600774 */ extsb r0, r3
/* 00009424 2C000001 */ cmpwi r0, 1
/* 00009428 4182008C */ beq lbl_000094B4
/* 0000942C 40800010 */ bge lbl_0000943C
/* 00009430 2C000000 */ cmpwi r0, 0
/* 00009434 40800014 */ bge lbl_00009448
/* 00009438 48000100 */ b lbl_00009538
lbl_0000943C:
/* 0000943C 2C000003 */ cmpwi r0, 3
/* 00009440 408000F8 */ bge lbl_00009538
/* 00009444 480000B4 */ b lbl_000094F8
lbl_00009448:
/* 00009448 3C600000 */ lis r3, playerControllerIDs@ha
/* 0000944C 80030000 */ lwz r0, playerControllerIDs@l(r3)
/* 00009450 3C600000 */ lis r3, controllerInfo@ha
/* 00009454 38630000 */ addi r3, r3, controllerInfo@l
/* 00009458 1C00003C */ mulli r0, r0, 0x3c
/* 0000945C 38A30018 */ addi r5, r3, 0x18
/* 00009460 7C05022E */ lhzx r0, r5, r0
/* 00009464 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00009468 41820010 */ beq lbl_00009478
/* 0000946C 88040016 */ lbz r0, 0x16(r4)
/* 00009470 60000001 */ ori r0, r0, 1
/* 00009474 98040016 */ stb r0, 0x16(r4)
lbl_00009478:
/* 00009478 3C600000 */ lis r3, playerControllerIDs@ha
/* 0000947C 38630000 */ addi r3, r3, playerControllerIDs@l
/* 00009480 80030004 */ lwz r0, 4(r3)
/* 00009484 1C00003C */ mulli r0, r0, 0x3c
/* 00009488 7C05022E */ lhzx r0, r5, r0
/* 0000948C 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00009490 41820010 */ beq lbl_000094A0
/* 00009494 88040016 */ lbz r0, 0x16(r4)
/* 00009498 60000002 */ ori r0, r0, 2
/* 0000949C 98040016 */ stb r0, 0x16(r4)
lbl_000094A0:
/* 000094A0 88040016 */ lbz r0, 0x16(r4)
/* 000094A4 2C000003 */ cmpwi r0, 3
/* 000094A8 40820090 */ bne lbl_00009538
/* 000094AC 38600001 */ li r3, 1
/* 000094B0 4E800020 */ blr 
lbl_000094B4:
/* 000094B4 3C600000 */ lis r3, lbl_802F1C32@ha
/* 000094B8 88030000 */ lbz r0, lbl_802F1C32@l(r3)
/* 000094BC 3C600000 */ lis r3, playerControllerIDs@ha
/* 000094C0 3CA00000 */ lis r5, controllerInfo@ha
/* 000094C4 7C000774 */ extsb r0, r0
/* 000094C8 5404103A */ slwi r4, r0, 2
/* 000094CC 38030000 */ addi r0, r3, playerControllerIDs@l
/* 000094D0 7C602214 */ add r3, r0, r4
/* 000094D4 80030000 */ lwz r0, 0(r3)
/* 000094D8 38650000 */ addi r3, r5, controllerInfo@l
/* 000094DC 1C00003C */ mulli r0, r0, 0x3c
/* 000094E0 7C630214 */ add r3, r3, r0
/* 000094E4 A0030018 */ lhz r0, 0x18(r3)
/* 000094E8 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 000094EC 4182004C */ beq lbl_00009538
/* 000094F0 38600001 */ li r3, 1
/* 000094F4 4E800020 */ blr 
lbl_000094F8:
/* 000094F8 3C600000 */ lis r3, playerControllerIDs@ha
/* 000094FC 84030000 */ lwzu r0, playerControllerIDs@l(r3)
/* 00009500 3C800000 */ lis r4, controllerInfo@ha
/* 00009504 1C00003C */ mulli r0, r0, 0x3c
/* 00009508 38840000 */ addi r4, r4, controllerInfo@l
/* 0000950C 38840018 */ addi r4, r4, 0x18
/* 00009510 7C04022E */ lhzx r0, r4, r0
/* 00009514 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00009518 40820018 */ bne lbl_00009530
/* 0000951C 80030004 */ lwz r0, 4(r3)
/* 00009520 1C00003C */ mulli r0, r0, 0x3c
/* 00009524 7C04022E */ lhzx r0, r4, r0
/* 00009528 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 0000952C 4182000C */ beq lbl_00009538
lbl_00009530:
/* 00009530 38600001 */ li r3, 1
/* 00009534 4E800020 */ blr 
lbl_00009538:
/* 00009538 38600000 */ li r3, 0
/* 0000953C 4E800020 */ blr 
