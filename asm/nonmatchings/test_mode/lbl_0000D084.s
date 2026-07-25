/* 0000D084 3C600000 */ lis r3, controllerInfo@ha
/* 0000D088 39030000 */ addi r8, r3, controllerInfo@l
/* 0000D08C A0080030 */ lhz r0, 0x30(r8)
/* 0000D090 3C600000 */ lis r3, lbl_10003BF8@ha
/* 0000D094 38830000 */ addi r4, r3, lbl_10003BF8@l
/* 0000D098 54060739 */ rlwinm. r6, r0, 0, 0x1c, 0x1c
/* 0000D09C 38E00000 */ li r7, 0
/* 0000D0A0 40820044 */ bne lbl_0000D0E4
/* 0000D0A4 3C600000 */ lis r3, analogInputs@ha
/* 0000D0A8 39230000 */ addi r9, r3, analogInputs@l
/* 0000D0AC A0690008 */ lhz r3, 8(r9)
/* 0000D0B0 54650739 */ rlwinm. r5, r3, 0, 0x1c, 0x1c
/* 0000D0B4 40820030 */ bne lbl_0000D0E4
/* 0000D0B8 A0A80000 */ lhz r5, 0(r8)
/* 0000D0BC 54A80739 */ rlwinm. r8, r5, 0, 0x1c, 0x1c
/* 0000D0C0 40820010 */ bne lbl_0000D0D0
/* 0000D0C4 A1090000 */ lhz r8, 0(r9)
/* 0000D0C8 55080739 */ rlwinm. r8, r8, 0, 0x1c, 0x1c
/* 0000D0CC 41820028 */ beq lbl_0000D0F4
lbl_0000D0D0:
/* 0000D0D0 3D000000 */ lis r8, analogInputs@ha
/* 0000D0D4 39080000 */ addi r8, r8, analogInputs@l
/* 0000D0D8 A1080000 */ lhz r8, 0(r8)
/* 0000D0DC 550805AD */ rlwinm. r8, r8, 0, 0x16, 0x16
/* 0000D0E0 41820014 */ beq lbl_0000D0F4
lbl_0000D0E4:
/* 0000D0E4 38600001 */ li r3, 1
/* 0000D0E8 90640050 */ stw r3, 0x50(r4)
/* 0000D0EC 38E0FFFF */ li r7, -1
/* 0000D0F0 480000F0 */ b lbl_0000D1E0
lbl_0000D0F4:
/* 0000D0F4 5408077B */ rlwinm. r8, r0, 0, 0x1d, 0x1d
/* 0000D0F8 4082003C */ bne lbl_0000D134
/* 0000D0FC 5468077B */ rlwinm. r8, r3, 0, 0x1d, 0x1d
/* 0000D100 40820034 */ bne lbl_0000D134
/* 0000D104 54A8077B */ rlwinm. r8, r5, 0, 0x1d, 0x1d
/* 0000D108 40820018 */ bne lbl_0000D120
/* 0000D10C 3D000000 */ lis r8, analogInputs@ha
/* 0000D110 39080000 */ addi r8, r8, analogInputs@l
/* 0000D114 A1080000 */ lhz r8, 0(r8)
/* 0000D118 5508077B */ rlwinm. r8, r8, 0, 0x1d, 0x1d
/* 0000D11C 41820028 */ beq lbl_0000D144
lbl_0000D120:
/* 0000D120 3D000000 */ lis r8, analogInputs@ha
/* 0000D124 39080000 */ addi r8, r8, analogInputs@l
/* 0000D128 A1080000 */ lhz r8, 0(r8)
/* 0000D12C 550805AD */ rlwinm. r8, r8, 0, 0x16, 0x16
/* 0000D130 41820014 */ beq lbl_0000D144
lbl_0000D134:
/* 0000D134 38600002 */ li r3, 2
/* 0000D138 90640050 */ stw r3, 0x50(r4)
/* 0000D13C 38E0FFFF */ li r7, -1
/* 0000D140 480000A0 */ b lbl_0000D1E0
lbl_0000D144:
/* 0000D144 540807FF */ clrlwi. r8, r0, 0x1f
/* 0000D148 4082003C */ bne lbl_0000D184
/* 0000D14C 546807FF */ clrlwi. r8, r3, 0x1f
/* 0000D150 40820034 */ bne lbl_0000D184
/* 0000D154 54A807FF */ clrlwi. r8, r5, 0x1f
/* 0000D158 40820018 */ bne lbl_0000D170
/* 0000D15C 3D000000 */ lis r8, analogInputs@ha
/* 0000D160 39080000 */ addi r8, r8, analogInputs@l
/* 0000D164 A1080000 */ lhz r8, 0(r8)
/* 0000D168 550807FF */ clrlwi. r8, r8, 0x1f
/* 0000D16C 41820028 */ beq lbl_0000D194
lbl_0000D170:
/* 0000D170 3D000000 */ lis r8, analogInputs@ha
/* 0000D174 39080000 */ addi r8, r8, analogInputs@l
/* 0000D178 A1080000 */ lhz r8, 0(r8)
/* 0000D17C 550805AD */ rlwinm. r8, r8, 0, 0x16, 0x16
/* 0000D180 41820014 */ beq lbl_0000D194
lbl_0000D184:
/* 0000D184 38600003 */ li r3, 3
/* 0000D188 90640050 */ stw r3, 0x50(r4)
/* 0000D18C 38E0FFFF */ li r7, -1
/* 0000D190 48000050 */ b lbl_0000D1E0
lbl_0000D194:
/* 0000D194 540807BD */ rlwinm. r8, r0, 0, 0x1e, 0x1e
/* 0000D198 4082003C */ bne lbl_0000D1D4
/* 0000D19C 546307BD */ rlwinm. r3, r3, 0, 0x1e, 0x1e
/* 0000D1A0 40820034 */ bne lbl_0000D1D4
/* 0000D1A4 54A307BD */ rlwinm. r3, r5, 0, 0x1e, 0x1e
/* 0000D1A8 40820018 */ bne lbl_0000D1C0
/* 0000D1AC 3C600000 */ lis r3, analogInputs@ha
/* 0000D1B0 38630000 */ addi r3, r3, analogInputs@l
/* 0000D1B4 A0630000 */ lhz r3, 0(r3)
/* 0000D1B8 546307BD */ rlwinm. r3, r3, 0, 0x1e, 0x1e
/* 0000D1BC 41820024 */ beq lbl_0000D1E0
lbl_0000D1C0:
/* 0000D1C0 3C600000 */ lis r3, analogInputs@ha
/* 0000D1C4 38630000 */ addi r3, r3, analogInputs@l
/* 0000D1C8 A0630000 */ lhz r3, 0(r3)
/* 0000D1CC 546305AD */ rlwinm. r3, r3, 0, 0x16, 0x16
/* 0000D1D0 41820010 */ beq lbl_0000D1E0
lbl_0000D1D4:
/* 0000D1D4 38600004 */ li r3, 4
/* 0000D1D8 90640050 */ stw r3, 0x50(r4)
/* 0000D1DC 38E0FFFF */ li r7, -1
lbl_0000D1E0:
/* 0000D1E0 2C07FFFF */ cmpwi r7, -1
/* 0000D1E4 40820014 */ bne lbl_0000D1F8
/* 0000D1E8 3800001E */ li r0, 0x1e
/* 0000D1EC 900400C4 */ stw r0, 0xc4(r4)
/* 0000D1F0 80640050 */ lwz r3, 0x50(r4)
/* 0000D1F4 4E800020 */ blr 
lbl_0000D1F8:
/* 0000D1F8 806400C4 */ lwz r3, 0xc4(r4)
/* 0000D1FC 3463FFFF */ addic. r3, r3, -1
/* 0000D200 906400C4 */ stw r3, 0xc4(r4)
/* 0000D204 4081000C */ ble lbl_0000D210
/* 0000D208 38600000 */ li r3, 0
/* 0000D20C 4E800020 */ blr 
lbl_0000D210:
/* 0000D210 2C060000 */ cmpwi r6, 0
/* 0000D214 4082004C */ bne lbl_0000D260
/* 0000D218 3C600000 */ lis r3, analogInputs@ha
/* 0000D21C 38A30000 */ addi r5, r3, analogInputs@l
/* 0000D220 A0650008 */ lhz r3, 8(r5)
/* 0000D224 54630739 */ rlwinm. r3, r3, 0, 0x1c, 0x1c
/* 0000D228 40820038 */ bne lbl_0000D260
/* 0000D22C 3C600000 */ lis r3, controllerInfo@ha
/* 0000D230 38630000 */ addi r3, r3, controllerInfo@l
/* 0000D234 A0630000 */ lhz r3, 0(r3)
/* 0000D238 54630739 */ rlwinm. r3, r3, 0, 0x1c, 0x1c
/* 0000D23C 40820010 */ bne lbl_0000D24C
/* 0000D240 A0650000 */ lhz r3, 0(r5)
/* 0000D244 54630739 */ rlwinm. r3, r3, 0, 0x1c, 0x1c
/* 0000D248 4182002C */ beq lbl_0000D274
lbl_0000D24C:
/* 0000D24C 3C600000 */ lis r3, analogInputs@ha
/* 0000D250 38630000 */ addi r3, r3, analogInputs@l
/* 0000D254 A0630000 */ lhz r3, 0(r3)
/* 0000D258 546305AD */ rlwinm. r3, r3, 0, 0x16, 0x16
/* 0000D25C 41820018 */ beq lbl_0000D274
lbl_0000D260:
/* 0000D260 80640050 */ lwz r3, 0x50(r4)
/* 0000D264 2C030001 */ cmpwi r3, 1
/* 0000D268 4082000C */ bne lbl_0000D274
/* 0000D26C 38E0FFFF */ li r7, -1
/* 0000D270 48000124 */ b lbl_0000D394
lbl_0000D274:
/* 0000D274 5403077B */ rlwinm. r3, r0, 0, 0x1d, 0x1d
/* 0000D278 4082004C */ bne lbl_0000D2C4
/* 0000D27C 3C600000 */ lis r3, analogInputs@ha
/* 0000D280 38A30000 */ addi r5, r3, analogInputs@l
/* 0000D284 A0650008 */ lhz r3, 8(r5)
/* 0000D288 5463077B */ rlwinm. r3, r3, 0, 0x1d, 0x1d
/* 0000D28C 40820038 */ bne lbl_0000D2C4
/* 0000D290 3C600000 */ lis r3, controllerInfo@ha
/* 0000D294 38630000 */ addi r3, r3, controllerInfo@l
/* 0000D298 A0630000 */ lhz r3, 0(r3)
/* 0000D29C 5463077B */ rlwinm. r3, r3, 0, 0x1d, 0x1d
/* 0000D2A0 40820010 */ bne lbl_0000D2B0
/* 0000D2A4 A0650000 */ lhz r3, 0(r5)
/* 0000D2A8 5463077B */ rlwinm. r3, r3, 0, 0x1d, 0x1d
/* 0000D2AC 4182002C */ beq lbl_0000D2D8
lbl_0000D2B0:
/* 0000D2B0 3C600000 */ lis r3, analogInputs@ha
/* 0000D2B4 38630000 */ addi r3, r3, analogInputs@l
/* 0000D2B8 A0630000 */ lhz r3, 0(r3)
/* 0000D2BC 546305AD */ rlwinm. r3, r3, 0, 0x16, 0x16
/* 0000D2C0 41820018 */ beq lbl_0000D2D8
lbl_0000D2C4:
/* 0000D2C4 80640050 */ lwz r3, 0x50(r4)
/* 0000D2C8 2C030002 */ cmpwi r3, 2
/* 0000D2CC 4082000C */ bne lbl_0000D2D8
/* 0000D2D0 38E0FFFF */ li r7, -1
/* 0000D2D4 480000C0 */ b lbl_0000D394
lbl_0000D2D8:
/* 0000D2D8 540307FF */ clrlwi. r3, r0, 0x1f
/* 0000D2DC 4082004C */ bne lbl_0000D328
/* 0000D2E0 3C600000 */ lis r3, analogInputs@ha
/* 0000D2E4 38A30000 */ addi r5, r3, analogInputs@l
/* 0000D2E8 A0650008 */ lhz r3, 8(r5)
/* 0000D2EC 546307FF */ clrlwi. r3, r3, 0x1f
/* 0000D2F0 40820038 */ bne lbl_0000D328
/* 0000D2F4 3C600000 */ lis r3, controllerInfo@ha
/* 0000D2F8 38630000 */ addi r3, r3, controllerInfo@l
/* 0000D2FC A0630000 */ lhz r3, 0(r3)
/* 0000D300 546307FF */ clrlwi. r3, r3, 0x1f
/* 0000D304 40820010 */ bne lbl_0000D314
/* 0000D308 A0650000 */ lhz r3, 0(r5)
/* 0000D30C 546307FF */ clrlwi. r3, r3, 0x1f
/* 0000D310 4182002C */ beq lbl_0000D33C
lbl_0000D314:
/* 0000D314 3C600000 */ lis r3, analogInputs@ha
/* 0000D318 38630000 */ addi r3, r3, analogInputs@l
/* 0000D31C A0630000 */ lhz r3, 0(r3)
/* 0000D320 546305AD */ rlwinm. r3, r3, 0, 0x16, 0x16
/* 0000D324 41820018 */ beq lbl_0000D33C
lbl_0000D328:
/* 0000D328 80640050 */ lwz r3, 0x50(r4)
/* 0000D32C 2C030003 */ cmpwi r3, 3
/* 0000D330 4082000C */ bne lbl_0000D33C
/* 0000D334 38E0FFFF */ li r7, -1
/* 0000D338 4800005C */ b lbl_0000D394
lbl_0000D33C:
/* 0000D33C 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 0000D340 40820044 */ bne lbl_0000D384
/* 0000D344 3C600000 */ lis r3, analogInputs@ha
/* 0000D348 38A30000 */ addi r5, r3, analogInputs@l
/* 0000D34C A0050008 */ lhz r0, 8(r5)
/* 0000D350 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 0000D354 40820030 */ bne lbl_0000D384
/* 0000D358 3C600000 */ lis r3, controllerInfo@ha
/* 0000D35C A0030000 */ lhz r0, controllerInfo@l(r3)
/* 0000D360 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 0000D364 40820010 */ bne lbl_0000D374
/* 0000D368 A0050000 */ lhz r0, 0(r5)
/* 0000D36C 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 0000D370 41820024 */ beq lbl_0000D394
lbl_0000D374:
/* 0000D374 3C600000 */ lis r3, analogInputs@ha
/* 0000D378 A0030000 */ lhz r0, analogInputs@l(r3)
/* 0000D37C 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 0000D380 41820014 */ beq lbl_0000D394
lbl_0000D384:
/* 0000D384 80040050 */ lwz r0, 0x50(r4)
/* 0000D388 2C000004 */ cmpwi r0, 4
/* 0000D38C 40820008 */ bne lbl_0000D394
/* 0000D390 38E0FFFF */ li r7, -1
lbl_0000D394:
/* 0000D394 2C07FFFF */ cmpwi r7, -1
/* 0000D398 40820014 */ bne lbl_0000D3AC
/* 0000D39C 38000004 */ li r0, 4
/* 0000D3A0 900400C4 */ stw r0, 0xc4(r4)
/* 0000D3A4 80640050 */ lwz r3, 0x50(r4)
/* 0000D3A8 4E800020 */ blr 
lbl_0000D3AC:
/* 0000D3AC 38000000 */ li r0, 0
/* 0000D3B0 90040050 */ stw r0, 0x50(r4)
/* 0000D3B4 38600000 */ li r3, 0
/* 0000D3B8 900400C4 */ stw r0, 0xc4(r4)
/* 0000D3BC 4E800020 */ blr 
