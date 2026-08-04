# test_mode data segment 5 -- rodata continuation after a carved hole
.include "macros.inc"
.global lbl_00010280
.global lbl_00010298
.global lbl_000102B0
.global lbl_00010350
.global lbl_00010364
.global lbl_000103F4
.global lbl_000106B4
.global lbl_000109A8
.global lbl_00010BEC
.global lbl_00012330
.global lbl_00012C10
.global lbl_00012F7C
.global lbl_000130A4
.global lbl_000130B4
.global lbl_000130BC
.global lbl_000130C4
.global lbl_00013158
.global lbl_00013178
.global lbl_0001323C
.global lbl_0001324C
.global lbl_000138AC
.global lbl_000138B8
.global lbl_00013920
.global lbl_00013A1C
.global lbl_00014638
.global lbl_0001468C
.global lbl_0001469C
.global lbl_00014714
.global lbl_000147EC
.global lbl_00014810
.global lbl_000148A8
.global lbl_000148D8
.global lbl_000148E8
.global lbl_00014974
.global lbl_000155BC
.global lbl_000156F0
.global lbl_00015868
.global lbl_00015890
.global lbl_000159EC
.global lbl_10000000
.global lbl_10000004
.global lbl_10000008
.global lbl_10000040
.global lbl_1000006C
.global lbl_100000B4
.global lbl_100000B8
.global lbl_10000D5C
.global lbl_10000D60
.global lbl_10000D64
.global lbl_10000E00
.global lbl_10000F38
.global lbl_10000F58
.global lbl_10000F5C
.global lbl_10000F60
.global lbl_10000F70
.global lbl_10000FA8
.global lbl_10000FAC
.global lbl_10003BAC
.global lbl_10003BF8
.global lbl_10003BFC
.global lbl_10003C60
.global lbl_10003C80

.section .rodata
.balign 8
lbl_00010280:
    # 0x10280
    .4byte 0x3F800000
    .4byte 0xC61C4000
    .4byte 0x461C4000
    .4byte 0x469C4000
    .4byte 0x3E99999A
    .4byte 0x00000000
lbl_00010298:
    # 0x10298
    .4byte 0x43300000
    .4byte 0x00000000
    .4byte 0x3F19999A
    .4byte 0x3F99999A
    .4byte 0x3F000000

# 5

.section .data
.balign 8
lbl_000102B0:
    # 0x102B0
    .4byte _prolog + 0x1A0
    .4byte _prolog + 0x238
    .4byte _prolog + 0x9BC
    .4byte _prolog + 0x9DC
    .4byte _prolog + 0x6DC
    .4byte _prolog + 0x734
    .4byte _prolog + 0xF38
    .4byte _prolog + 0xFF4
    .4byte _prolog + 0x1E84
    .4byte _prolog + 0x1F78
    .4byte _prolog + 0x242C
    .4byte _prolog + 0x246C
    .4byte _prolog + 0x248C
    .4byte _prolog + 0x24C0
    .4byte _prolog + 0x24E0
    .4byte _prolog + 0x2594
    .4byte _prolog + 0x25B4
    .4byte _prolog + 0x26C0
    .4byte _prolog + 0x28C0
    .4byte _prolog + 0x2960
    .4byte _prolog + 0x36A4
    .4byte _prolog + 0x36E0
    .4byte u_replay_test_init
    .4byte u_replay_test_main
    .4byte _prolog + 0x3FE8
    .4byte _prolog + 0x40F4
    .4byte _prolog + 0x4F3C
    .4byte _prolog + 0x4FD4
    .4byte _prolog + 0x50F4
    .4byte _prolog + 0x69A0
    .4byte _prolog + 0x6AC8
    .4byte _prolog + 0x7648
    .4byte _prolog + 0x7A6C
    .4byte _prolog + 0x7E10
    .4byte _prolog + 0x7E4C
    .4byte _prolog + 0x80EC
    .4byte _prolog + 0x8280
    .4byte _prolog + 0x8A98
    .4byte _prolog + 0x8AEC
    .4byte 0x00000000
lbl_00010350:
    # 0x10350
    .asciz "TEST MODE LOADED\n"
    .balign 4
lbl_00010364:
    # 0x10364
    .asciz "TEST MODE PURGED\n"
    .balign 4
    .asciz "\nError: A called an unlinked function.\n"
    .asciz "Address:      Back Chain    LR Save\n"
    .balign 4
    .asciz "0x%08x:   0x%08x    0x%08x\n"
    .asciz "test_mode.c"
    .4byte 0x0A000000
lbl_000103F4:
    # 0x103F4
    .asciz "sub_mode: error %d in Test"
    .balign 4
lbl_00010410:
    # 0x10410
    .asciz "MODEL"
    .balign 4
lbl_00010418:
    # 0x10418
    .asciz "MODEL TEST"
    .balign 4
lbl_00010424:
    # 0x10424
    .asciz "nlObjPut TEST"
    .balign 4
lbl_00010434:
    # 0x10434
    .asciz "EFC MDL TEST"
    .balign 4
lbl_00010444:
    # 0x10444
    .asciz "PATTERN TEST"
    .balign 4
lbl_00010454:
    # 0x10454
    .asciz "PREREND TEST"
    .balign 4
lbl_00010464:
    # 0x10464
    .asciz "MOTION"
    .balign 4
lbl_0001046C:
    # 0x1046C
    .asciz "MOTION TEST"
lbl_00010478:
    # 0x10478
    .asciz "BITMAP"
    .balign 4
lbl_00010480:
    # 0x10480
    .asciz "BITMAP TEST"
lbl_0001048C:
    # 0x1048C
    .asciz "FONT TEST"
    .balign 4
lbl_00010498:
    # 0x10498
    .asciz "ROMFONT TEST"
    .balign 4
lbl_000104A8:
    # 0x104A8
    .asciz "PREVIEW TEST"
    .balign 4
lbl_000104B8:
    # 0x104B8
    .asciz "INPUT"
    .balign 4
lbl_000104C0:
    # 0x104C0
    .asciz "SOUND"
    .balign 4
lbl_000104C8:
    # 0x104C8
    .asciz "SOUND TEST"
    .balign 4
lbl_000104D4:
    # 0x104D4
    .asciz "REPLAY"
    .balign 4
lbl_000104DC:
    # 0x104DC
    .asciz "REPLAY TEST"
lbl_000104E8:
    # 0x104E8
    .4byte 0x45544300
lbl_000104EC:
    # 0x104EC
    .asciz "BLUR TEST"
    .balign 4
lbl_000104F8:
    # 0x104F8
    .asciz "SHADOW TEST"
lbl_00010504:
    # 0x10504
    .asciz "FOCUS TEST"
    .balign 4
lbl_00010510:
    # 0x10510
    .asciz "INDIRECT TEST"
    .balign 4
lbl_00010520:
    # 0x10520
    .asciz "DIP SWITCH"
    .balign 4
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000002
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000003
    .4byte lbl_00010410
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte lbl_00010418
    .4byte 0x0000007C
    .4byte 0x00000000
    .4byte lbl_00010424
    .4byte 0x0000006F
    .4byte 0x00000000
    .4byte lbl_00010434
    .4byte 0x0000007A
    .4byte 0x00000000
    .4byte lbl_00010444
    .4byte 0x0000007E
    .4byte 0x00000000
    .4byte lbl_00010454
    .4byte 0x00000082
    .4byte 0x00000003
    .4byte lbl_00010464
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte lbl_0001046C
    .4byte 0x00000077
    .4byte 0x00000003
    .4byte lbl_00010478
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte lbl_00010480
    .4byte 0x00000071
    .4byte 0x00000000
    .4byte lbl_0001048C
    .4byte 0x00000073
    .4byte 0x00000000
    .4byte lbl_00010498
    .4byte 0x00000080
    .4byte 0x00000000
    .4byte lbl_000104A8
    .4byte 0x00000084
    .4byte 0x00000003
    .4byte lbl_000104B8
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte lbl_000104B8
    .4byte 0x00000061
    .4byte 0x00000003
    .4byte lbl_000104C0
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte lbl_000104C8
    .4byte 0x00000065
    .4byte 0x00000003
    .4byte lbl_000104D4
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte lbl_000104DC
    .4byte 0x00000075
    .4byte 0x00000003
    .4byte lbl_000104E8
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte lbl_000104EC
    .4byte 0x00000067
    .4byte 0x00000000
    .4byte lbl_000104F8
    .4byte 0x00000069
    .4byte 0x00000000
    .4byte lbl_00010504
    .4byte 0x0000006B
    .4byte 0x00000000
    .4byte lbl_00010510
    .4byte 0x0000006D
    .4byte 0x00000000
    .4byte lbl_00010520
    .4byte 0x00000063
    .asciz "TEST MODE\n\n"
    .4byte 0x25730000
    .asciz "STAGE NUM: %3d"
    .balign 4
    .asciz "BACKGROUND: [%d]%s          "
    .balign 4
    .4byte 0x1C000000
lbl_000106B4:
    # 0x106B4
    .asciz "DIP DEST\n"
    .balign 4
    .4byte 0x204F4E00
    .4byte 0x4F464600
    .asciz "%-15s  %s"
    .balign 4
    .asciz "Input Test"
    .balign 4
    .asciz "PAD           [%d]\n"
    .4byte 0x4F4E0000
    .asciz "BUTTON_LEFT   %3s\n"
    .balign 4
    .asciz "BUTTON_RIGHT  %3s\n"
    .balign 4
    .asciz "BUTTON_DOWN   %3s\n"
    .balign 4
    .asciz "BUTTON_UP     %3s\n"
    .balign 4
    .asciz "TRIGGER_Z     %3s\n"
    .balign 4
    .asciz "TRIGGER_L     %3s\n"
    .balign 4
    .asciz "TRIGGER_R     %3s\n"
    .balign 4
    .asciz "BUTTON_A      %3s\n"
    .balign 4
    .asciz "BUTTON_B      %3s\n"
    .balign 4
    .asciz "BUTTON_X      %3s\n"
    .balign 4
    .asciz "BUTTON_Y      %3s\n"
    .balign 4
    .asciz "BUTTON_MENU   %3s\n"
    .balign 4
    .asciz "stickX       %4d\n"
    .balign 4
    .asciz "stickY       %4d\n"
    .balign 4
    .asciz "substickX    %4d\n"
    .balign 4
    .asciz "substickY    %4d\n"
    .balign 4
    .asciz "triggerLeft  %4d\n"
    .balign 4
    .asciz "triggerRight %4d\n"
    .balign 4
    .asciz "analogA      %4d\n"
    .balign 4
    .asciz "analogB      %4d\n"
    .balign 4
    .asciz "err          %4d\n"
    .balign 4
    .asciz "APINPUT\n"
    .balign 4
    .asciz "STICK_L       %3s\n"
    .balign 4
    .asciz "STICK_R       %3s\n"
    .balign 4
    .asciz "STICK_D       %3s\n"
    .balign 4
    .asciz "STICK_U       %3s\n"
    .balign 4
    .asciz "SUBSTICK_L    %3s\n"
    .balign 4
    .asciz "SUBSTICK_R    %3s\n"
    .balign 4
    .asciz "SUBSTICK_D    %3s\n"
    .balign 4
    .asciz "SUBSTICK_U    %3s\n"
    .balign 4
    .asciz "PAD CHANGE:\n"
    .balign 4
    .asciz "  TRIGGER_L\n"
    .balign 4
    .asciz "      and\n"
    .balign 4
    .asciz "    BUTTON_LEFT\n"
    .balign 4
    .asciz "        or\n"
    .asciz "    BUTTON_RIGHT\n"
    .balign 4
lbl_000109A8:
    # 0x109A8
    .4byte _prolog + 0x10C8
    .4byte _prolog + 0x1264
    .4byte _prolog + 0x15C4
    .4byte _prolog + 0x16E8
    .4byte _prolog + 0x1814
    .4byte _prolog + 0x190C
    .4byte _prolog + 0x1930
lbl_000109C4:
    # 0x109C4
    .asciz "MONAURAL"
    .balign 4
lbl_000109D0:
    # 0x109D0
    .asciz "STEREO  "
    .balign 4
    .4byte lbl_000109C4
    .4byte lbl_000109D0
lbl_000109E4:
    # 0x109E4
    .asciz "STOP"
    .balign 4
lbl_000109EC:
    # 0x109EC
    .4byte 0x52554E00
lbl_000109F0:
    # 0x109F0
    .asciz "PAUSE"
    .balign 4
lbl_000109F8:
    # 0x109F8
    .asciz "BUSY"
    .balign 4
    .4byte lbl_000109E4
    .4byte lbl_000109EC
    .4byte lbl_000109F0
    .4byte lbl_000109F8
    .asciz "PROJECT [ "
    .balign 4
    .4byte 0x25642000
    .4byte 0x5D0A0000
    .asciz "STACK %d [ "
    .asciz "%2d "
    .balign 4
    .4byte 0x5D0A0A00
    .asciz " RAM use:%08X\n"
    .balign 4
    .asciz "ARAM use:%08X / %08X\n"
    .balign 4
    .asciz "GRP :%2d %s\n"
    .balign 4
    .asciz "FX  :%3d %s\n"
    .balign 4
    .asciz "ICS :%2d\n"
    .balign 4
    .asciz "SONG:%2d\n"
    .balign 4
    .asciz "DVD :%2d %s\n"
    .balign 4
    .asciz "STRM:\n"
    .balign 4
    .asciz "OPTION:\n"
    .balign 4
    .asciz "vol:%3d\n"
    .balign 4
    .asciz "pan:%3d %3d\n"
    .balign 4
    .asciz "pit:%04X\n"
    .balign 4
    .asciz "dop:%04X\n"
    .balign 4
    .asciz "rev:%3d\n"
    .balign 4
    .asciz "cho:%3d\n"
    .balign 4
    .asciz "\nA:req B:off  Y:dest  X: effect sw"
    .balign 4
    .asciz "ctr:%3d\n"
    .balign 4
    .asciz "spd:%03X\n"
    .balign 4
    .asciz "TRUE"
    .balign 4
    .asciz "FALSE"
    .balign 4
    .asciz "OFF  :%s\n"
    .balign 4
    .asciz "output :%s\n"
    .asciz "se  vol:%3d\n"
    .balign 4
    .asciz "bgm vol:%3d\n"
    .balign 4
lbl_00010B90:
    # 0x10B90
    .asciz "GX_TF_RGBA8"
lbl_00010B9C:
    # 0x10B9C
    .asciz "GX_TF_I4"
    .balign 4
lbl_00010BA8:
    # 0x10BA8
    .asciz "GX_TF_I8"
    .balign 4
lbl_00010BB4:
    # 0x10BB4
    .asciz "GX_TF_IA4"
    .balign 4
lbl_00010BC0:
    # 0x10BC0
    .asciz "GX_TF_IA8"
    .balign 4
lbl_00010BCC:
    # 0x10BCC
    .asciz "GX_TF_RGB565"
    .balign 4
lbl_00010BDC:
    # 0x10BDC
    .asciz "GX_TF_RGB5A3"
    .balign 4
lbl_00010BEC:
    # 0x10BEC
    .4byte 0x00000006
    .4byte lbl_00010B90
    .4byte 0x00000000
    .4byte lbl_00010B9C
    .4byte 0x00000001
    .4byte lbl_00010BA8
    .4byte 0x00000002
    .4byte lbl_00010BB4
    .4byte 0x00000003
    .4byte lbl_00010BC0
    .4byte 0x00000004
    .4byte lbl_00010BCC
    .4byte 0x00000005
    .4byte lbl_00010BDC
    .asciz "BLUR TEST\n"
    .balign 4
    .asciz "FORMAT : %s\n"
    .balign 4
    .asciz "ALPHA  : %d\n"
    .balign 4
    .asciz "SHADOW TEST\n"
    .balign 4
lbl_00010C60:
    # 0x10C60
    .asciz "common"
    .balign 4
lbl_00010C68:
    # 0x10C68
    .asciz "init/common_p.lz"
    .balign 4
lbl_00010C7C:
    # 0x10C7C
    .asciz "init/common.lz"
    .balign 4
lbl_00010C8C:
    # 0x10C8C
    .asciz "face"
    .balign 4
lbl_00010C94:
    # 0x10C94
    .asciz "init/face_p.lz"
    .balign 4
lbl_00010CA4:
    # 0x10CA4
    .asciz "init/face.lz"
    .balign 4
lbl_00010CB4:
    # 0x10CB4
    .4byte 0x73656C00
lbl_00010CB8:
    # 0x10CB8
    .asciz "init/sel_p.lz"
    .balign 4
lbl_00010CC8:
    # 0x10CC8
    .asciz "init/sel.lz"
lbl_00010CD4:
    # 0x10CD4
    .asciz "chara"
    .balign 4
lbl_00010CDC:
    # 0x10CDC
    .asciz "init/chara_p.lz"
lbl_00010CEC:
    # 0x10CEC
    .asciz "init/chara.lz"
    .balign 4
lbl_00010CFC:
    # 0x10CFC
    .asciz "st001"
    .balign 4
lbl_00010D04:
    # 0x10D04
    .asciz "st001/st001_p.lz"
    .balign 4
lbl_00010D18:
    # 0x10D18
    .asciz "st001/st001.lz"
    .balign 4
lbl_00010D28:
    # 0x10D28
    .asciz "st002"
    .balign 4
lbl_00010D30:
    # 0x10D30
    .asciz "st002/st002_p.lz"
    .balign 4
lbl_00010D44:
    # 0x10D44
    .asciz "st002/st002.lz"
    .balign 4
lbl_00010D54:
    # 0x10D54
    .asciz "st003"
    .balign 4
lbl_00010D5C:
    # 0x10D5C
    .asciz "st003/st003_p.lz"
    .balign 4
lbl_00010D70:
    # 0x10D70
    .asciz "st003/st003.lz"
    .balign 4
lbl_00010D80:
    # 0x10D80
    .asciz "st004"
    .balign 4
lbl_00010D88:
    # 0x10D88
    .asciz "st004/st004_p.lz"
    .balign 4
lbl_00010D9C:
    # 0x10D9C
    .asciz "st004/st004.lz"
    .balign 4
lbl_00010DAC:
    # 0x10DAC
    .asciz "st005"
    .balign 4
lbl_00010DB4:
    # 0x10DB4
    .asciz "st005/st005_p.lz"
    .balign 4
lbl_00010DC8:
    # 0x10DC8
    .asciz "st005/st005.lz"
    .balign 4
lbl_00010DD8:
    # 0x10DD8
    .asciz "st006"
    .balign 4
lbl_00010DE0:
    # 0x10DE0
    .asciz "st006/st006_p.lz"
    .balign 4
lbl_00010DF4:
    # 0x10DF4
    .asciz "st006/st006.lz"
    .balign 4
lbl_00010E04:
    # 0x10E04
    .asciz "st007"
    .balign 4
lbl_00010E0C:
    # 0x10E0C
    .asciz "st007/st007_p.lz"
    .balign 4
lbl_00010E20:
    # 0x10E20
    .asciz "st007/st007.lz"
    .balign 4
lbl_00010E30:
    # 0x10E30
    .asciz "st008"
    .balign 4
lbl_00010E38:
    # 0x10E38
    .asciz "st008/st008_p.lz"
    .balign 4
lbl_00010E4C:
    # 0x10E4C
    .asciz "st008/st008.lz"
    .balign 4
lbl_00010E5C:
    # 0x10E5C
    .asciz "st009"
    .balign 4
lbl_00010E64:
    # 0x10E64
    .asciz "st009/st009_p.lz"
    .balign 4
lbl_00010E78:
    # 0x10E78
    .asciz "st009/st009.lz"
    .balign 4
lbl_00010E88:
    # 0x10E88
    .asciz "st010"
    .balign 4
lbl_00010E90:
    # 0x10E90
    .asciz "st010/st010_p.lz"
    .balign 4
lbl_00010EA4:
    # 0x10EA4
    .asciz "st010/st010.lz"
    .balign 4
lbl_00010EB4:
    # 0x10EB4
    .asciz "st011"
    .balign 4
lbl_00010EBC:
    # 0x10EBC
    .asciz "st011/st011_p.lz"
    .balign 4
lbl_00010ED0:
    # 0x10ED0
    .asciz "st011/st011.lz"
    .balign 4
lbl_00010EE0:
    # 0x10EE0
    .asciz "st012"
    .balign 4
lbl_00010EE8:
    # 0x10EE8
    .asciz "st012/st012_p.lz"
    .balign 4
lbl_00010EFC:
    # 0x10EFC
    .asciz "st012/st012.lz"
    .balign 4
lbl_00010F0C:
    # 0x10F0C
    .asciz "st013"
    .balign 4
lbl_00010F14:
    # 0x10F14
    .asciz "st013/st013_p.lz"
    .balign 4
lbl_00010F28:
    # 0x10F28
    .asciz "st013/st013.lz"
    .balign 4
lbl_00010F38:
    # 0x10F38
    .asciz "st014"
    .balign 4
lbl_00010F40:
    # 0x10F40
    .asciz "st014/st014_p.lz"
    .balign 4
lbl_00010F54:
    # 0x10F54
    .asciz "st014/st014.lz"
    .balign 4
lbl_00010F64:
    # 0x10F64
    .asciz "st015"
    .balign 4
lbl_00010F6C:
    # 0x10F6C
    .asciz "st015/st015_p.lz"
    .balign 4
lbl_00010F80:
    # 0x10F80
    .asciz "st015/st015.lz"
    .balign 4
lbl_00010F90:
    # 0x10F90
    .asciz "st016"
    .balign 4
lbl_00010F98:
    # 0x10F98
    .asciz "st016/st016_p.lz"
    .balign 4
lbl_00010FAC:
    # 0x10FAC
    .asciz "st016/st016.lz"
    .balign 4
lbl_00010FBC:
    # 0x10FBC
    .asciz "st017"
    .balign 4
lbl_00010FC4:
    # 0x10FC4
    .asciz "st017/st017_p.lz"
    .balign 4
lbl_00010FD8:
    # 0x10FD8
    .asciz "st017/st017.lz"
    .balign 4
lbl_00010FE8:
    # 0x10FE8
    .asciz "st018"
    .balign 4
lbl_00010FF0:
    # 0x10FF0
    .asciz "st018/st018_p.lz"
    .balign 4
lbl_00011004:
    # 0x11004
    .asciz "st018/st018.lz"
    .balign 4
lbl_00011014:
    # 0x11014
    .asciz "st019"
    .balign 4
lbl_0001101C:
    # 0x1101C
    .asciz "st019/st019_p.lz"
    .balign 4
lbl_00011030:
    # 0x11030
    .asciz "st019/st019.lz"
    .balign 4
lbl_00011040:
    # 0x11040
    .asciz "st020"
    .balign 4
lbl_00011048:
    # 0x11048
    .asciz "st020/st020_p.lz"
    .balign 4
lbl_0001105C:
    # 0x1105C
    .asciz "st020/st020.lz"
    .balign 4
lbl_0001106C:
    # 0x1106C
    .asciz "st021"
    .balign 4
lbl_00011074:
    # 0x11074
    .asciz "st021/st021_p.lz"
    .balign 4
lbl_00011088:
    # 0x11088
    .asciz "st021/st021.lz"
    .balign 4
lbl_00011098:
    # 0x11098
    .asciz "st022"
    .balign 4
lbl_000110A0:
    # 0x110A0
    .asciz "st022/st022_p.lz"
    .balign 4
lbl_000110B4:
    # 0x110B4
    .asciz "st022/st022.lz"
    .balign 4
lbl_000110C4:
    # 0x110C4
    .asciz "st023"
    .balign 4
lbl_000110CC:
    # 0x110CC
    .asciz "st023/st023_p.lz"
    .balign 4
lbl_000110E0:
    # 0x110E0
    .asciz "st023/st023.lz"
    .balign 4
lbl_000110F0:
    # 0x110F0
    .asciz "st024"
    .balign 4
lbl_000110F8:
    # 0x110F8
    .asciz "st024/st024_p.lz"
    .balign 4
lbl_0001110C:
    # 0x1110C
    .asciz "st024/st024.lz"
    .balign 4
lbl_0001111C:
    # 0x1111C
    .asciz "st025"
    .balign 4
lbl_00011124:
    # 0x11124
    .asciz "st025/st025_p.lz"
    .balign 4
lbl_00011138:
    # 0x11138
    .asciz "st025/st025.lz"
    .balign 4
lbl_00011148:
    # 0x11148
    .asciz "st026"
    .balign 4
lbl_00011150:
    # 0x11150
    .asciz "st026/st026_p.lz"
    .balign 4
lbl_00011164:
    # 0x11164
    .asciz "st026/st026.lz"
    .balign 4
lbl_00011174:
    # 0x11174
    .asciz "st027"
    .balign 4
lbl_0001117C:
    # 0x1117C
    .asciz "st027/st027_p.lz"
    .balign 4
lbl_00011190:
    # 0x11190
    .asciz "st027/st027.lz"
    .balign 4
lbl_000111A0:
    # 0x111A0
    .asciz "st028"
    .balign 4
lbl_000111A8:
    # 0x111A8
    .asciz "st028/st028_p.lz"
    .balign 4
lbl_000111BC:
    # 0x111BC
    .asciz "st028/st028.lz"
    .balign 4
lbl_000111CC:
    # 0x111CC
    .asciz "st029"
    .balign 4
lbl_000111D4:
    # 0x111D4
    .asciz "st029/st029_p.lz"
    .balign 4
lbl_000111E8:
    # 0x111E8
    .asciz "st029/st029.lz"
    .balign 4
lbl_000111F8:
    # 0x111F8
    .asciz "st030"
    .balign 4
lbl_00011200:
    # 0x11200
    .asciz "st030/st030_p.lz"
    .balign 4
lbl_00011214:
    # 0x11214
    .asciz "st030/st030.lz"
    .balign 4
lbl_00011224:
    # 0x11224
    .asciz "st031"
    .balign 4
lbl_0001122C:
    # 0x1122C
    .asciz "st031/st031_p.lz"
    .balign 4
lbl_00011240:
    # 0x11240
    .asciz "st031/st031.lz"
    .balign 4
lbl_00011250:
    # 0x11250
    .asciz "st032"
    .balign 4
lbl_00011258:
    # 0x11258
    .asciz "st032/st032_p.lz"
    .balign 4
lbl_0001126C:
    # 0x1126C
    .asciz "st032/st032.lz"
    .balign 4
lbl_0001127C:
    # 0x1127C
    .asciz "st033"
    .balign 4
lbl_00011284:
    # 0x11284
    .asciz "st033/st033_p.lz"
    .balign 4
lbl_00011298:
    # 0x11298
    .asciz "st033/st033.lz"
    .balign 4
lbl_000112A8:
    # 0x112A8
    .asciz "st034"
    .balign 4
lbl_000112B0:
    # 0x112B0
    .asciz "st034/st034_p.lz"
    .balign 4
lbl_000112C4:
    # 0x112C4
    .asciz "st034/st034.lz"
    .balign 4
lbl_000112D4:
    # 0x112D4
    .asciz "st035"
    .balign 4
lbl_000112DC:
    # 0x112DC
    .asciz "st035/st035_p.lz"
    .balign 4
lbl_000112F0:
    # 0x112F0
    .asciz "st035/st035.lz"
    .balign 4
lbl_00011300:
    # 0x11300
    .asciz "st036"
    .balign 4
lbl_00011308:
    # 0x11308
    .asciz "st036/st036_p.lz"
    .balign 4
lbl_0001131C:
    # 0x1131C
    .asciz "st036/st036.lz"
    .balign 4
lbl_0001132C:
    # 0x1132C
    .asciz "st037"
    .balign 4
lbl_00011334:
    # 0x11334
    .asciz "st037/st037_p.lz"
    .balign 4
lbl_00011348:
    # 0x11348
    .asciz "st037/st037.lz"
    .balign 4
lbl_00011358:
    # 0x11358
    .asciz "st038"
    .balign 4
lbl_00011360:
    # 0x11360
    .asciz "st038/st038_p.lz"
    .balign 4
lbl_00011374:
    # 0x11374
    .asciz "st038/st038.lz"
    .balign 4
lbl_00011384:
    # 0x11384
    .asciz "st049"
    .balign 4
lbl_0001138C:
    # 0x1138C
    .asciz "st049/st049_p.lz"
    .balign 4
lbl_000113A0:
    # 0x113A0
    .asciz "st049/st049.lz"
    .balign 4
lbl_000113B0:
    # 0x113B0
    .asciz "st040"
    .balign 4
lbl_000113B8:
    # 0x113B8
    .asciz "st040/st040_p.lz"
    .balign 4
lbl_000113CC:
    # 0x113CC
    .asciz "st040/st040.lz"
    .balign 4
lbl_000113DC:
    # 0x113DC
    .asciz "st041"
    .balign 4
lbl_000113E4:
    # 0x113E4
    .asciz "st041/st041_p.lz"
    .balign 4
lbl_000113F8:
    # 0x113F8
    .asciz "st041/st041.lz"
    .balign 4
lbl_00011408:
    # 0x11408
    .asciz "st042"
    .balign 4
lbl_00011410:
    # 0x11410
    .asciz "st042/st042_p.lz"
    .balign 4
lbl_00011424:
    # 0x11424
    .asciz "st042/st042.lz"
    .balign 4
lbl_00011434:
    # 0x11434
    .asciz "st043"
    .balign 4
lbl_0001143C:
    # 0x1143C
    .asciz "st043/st043_p.lz"
    .balign 4
lbl_00011450:
    # 0x11450
    .asciz "st043/st043.lz"
    .balign 4
lbl_00011460:
    # 0x11460
    .asciz "st044"
    .balign 4
lbl_00011468:
    # 0x11468
    .asciz "st044/st044_p.lz"
    .balign 4
lbl_0001147C:
    # 0x1147C
    .asciz "st044/st044.lz"
    .balign 4
lbl_0001148C:
    # 0x1148C
    .asciz "st045"
    .balign 4
lbl_00011494:
    # 0x11494
    .asciz "st045/st045_p.lz"
    .balign 4
lbl_000114A8:
    # 0x114A8
    .asciz "st045/st045.lz"
    .balign 4
lbl_000114B8:
    # 0x114B8
    .asciz "st046"
    .balign 4
lbl_000114C0:
    # 0x114C0
    .asciz "st046/st046_p.lz"
    .balign 4
lbl_000114D4:
    # 0x114D4
    .asciz "st046/st046.lz"
    .balign 4
lbl_000114E4:
    # 0x114E4
    .asciz "st047"
    .balign 4
lbl_000114EC:
    # 0x114EC
    .asciz "st047/st047_p.lz"
    .balign 4
lbl_00011500:
    # 0x11500
    .asciz "st047/st047.lz"
    .balign 4
lbl_00011510:
    # 0x11510
    .asciz "st048"
    .balign 4
lbl_00011518:
    # 0x11518
    .asciz "st048/st048_p.lz"
    .balign 4
lbl_0001152C:
    # 0x1152C
    .asciz "st048/st048.lz"
    .balign 4
lbl_0001153C:
    # 0x1153C
    .asciz "st050"
    .balign 4
lbl_00011544:
    # 0x11544
    .asciz "st050/st050_p.lz"
    .balign 4
lbl_00011558:
    # 0x11558
    .asciz "st050/st050.lz"
    .balign 4
lbl_00011568:
    # 0x11568
    .asciz "st051"
    .balign 4
lbl_00011570:
    # 0x11570
    .asciz "st051/st051_p.lz"
    .balign 4
lbl_00011584:
    # 0x11584
    .asciz "st051/st051.lz"
    .balign 4
lbl_00011594:
    # 0x11594
    .asciz "st052"
    .balign 4
lbl_0001159C:
    # 0x1159C
    .asciz "st052/st052_p.lz"
    .balign 4
lbl_000115B0:
    # 0x115B0
    .asciz "st052/st052.lz"
    .balign 4
lbl_000115C0:
    # 0x115C0
    .asciz "st053"
    .balign 4
lbl_000115C8:
    # 0x115C8
    .asciz "st053/st053_p.lz"
    .balign 4
lbl_000115DC:
    # 0x115DC
    .asciz "st053/st053.lz"
    .balign 4
lbl_000115EC:
    # 0x115EC
    .asciz "st054"
    .balign 4
lbl_000115F4:
    # 0x115F4
    .asciz "st054/st054_p.lz"
    .balign 4
lbl_00011608:
    # 0x11608
    .asciz "st054/st054.lz"
    .balign 4
lbl_00011618:
    # 0x11618
    .asciz "st055"
    .balign 4
lbl_00011620:
    # 0x11620
    .asciz "st055/st055_p.lz"
    .balign 4
lbl_00011634:
    # 0x11634
    .asciz "st055/st055.lz"
    .balign 4
lbl_00011644:
    # 0x11644
    .asciz "st056"
    .balign 4
lbl_0001164C:
    # 0x1164C
    .asciz "st056/st056_p.lz"
    .balign 4
lbl_00011660:
    # 0x11660
    .asciz "st056/st056.lz"
    .balign 4
lbl_00011670:
    # 0x11670
    .asciz "st057"
    .balign 4
lbl_00011678:
    # 0x11678
    .asciz "st057/st057_p.lz"
    .balign 4
lbl_0001168C:
    # 0x1168C
    .asciz "st057/st057.lz"
    .balign 4
lbl_0001169C:
    # 0x1169C
    .asciz "st058"
    .balign 4
lbl_000116A4:
    # 0x116A4
    .asciz "st058/st058_p.lz"
    .balign 4
lbl_000116B8:
    # 0x116B8
    .asciz "st058/st058.lz"
    .balign 4
lbl_000116C8:
    # 0x116C8
    .asciz "st059"
    .balign 4
lbl_000116D0:
    # 0x116D0
    .asciz "st059/st059_p.lz"
    .balign 4
lbl_000116E4:
    # 0x116E4
    .asciz "st059/st059.lz"
    .balign 4
lbl_000116F4:
    # 0x116F4
    .asciz "st060"
    .balign 4
lbl_000116FC:
    # 0x116FC
    .asciz "st060/st060_p.lz"
    .balign 4
lbl_00011710:
    # 0x11710
    .asciz "st060/st060.lz"
    .balign 4
lbl_00011720:
    # 0x11720
    .asciz "st061"
    .balign 4
lbl_00011728:
    # 0x11728
    .asciz "st061/st061_p.lz"
    .balign 4
lbl_0001173C:
    # 0x1173C
    .asciz "st061/st061.lz"
    .balign 4
lbl_0001174C:
    # 0x1174C
    .asciz "st062"
    .balign 4
lbl_00011754:
    # 0x11754
    .asciz "st062/st062_p.lz"
    .balign 4
lbl_00011768:
    # 0x11768
    .asciz "st062/st062.lz"
    .balign 4
lbl_00011778:
    # 0x11778
    .asciz "st063"
    .balign 4
lbl_00011780:
    # 0x11780
    .asciz "st063/st063_p.lz"
    .balign 4
lbl_00011794:
    # 0x11794
    .asciz "st063/st063.lz"
    .balign 4
lbl_000117A4:
    # 0x117A4
    .asciz "st064"
    .balign 4
lbl_000117AC:
    # 0x117AC
    .asciz "st064/st064_p.lz"
    .balign 4
lbl_000117C0:
    # 0x117C0
    .asciz "st064/st064.lz"
    .balign 4
lbl_000117D0:
    # 0x117D0
    .asciz "st065"
    .balign 4
lbl_000117D8:
    # 0x117D8
    .asciz "st065/st065_p.lz"
    .balign 4
lbl_000117EC:
    # 0x117EC
    .asciz "st065/st065.lz"
    .balign 4
lbl_000117FC:
    # 0x117FC
    .asciz "st066"
    .balign 4
lbl_00011804:
    # 0x11804
    .asciz "st066/st066_p.lz"
    .balign 4
lbl_00011818:
    # 0x11818
    .asciz "st066/st066.lz"
    .balign 4
lbl_00011828:
    # 0x11828
    .asciz "st067"
    .balign 4
lbl_00011830:
    # 0x11830
    .asciz "st067/st067_p.lz"
    .balign 4
lbl_00011844:
    # 0x11844
    .asciz "st067/st067.lz"
    .balign 4
lbl_00011854:
    # 0x11854
    .asciz "st068"
    .balign 4
lbl_0001185C:
    # 0x1185C
    .asciz "st068/st068_p.lz"
    .balign 4
lbl_00011870:
    # 0x11870
    .asciz "st068/st068.lz"
    .balign 4
lbl_00011880:
    # 0x11880
    .asciz "st069"
    .balign 4
lbl_00011888:
    # 0x11888
    .asciz "st069/st069_p.lz"
    .balign 4
lbl_0001189C:
    # 0x1189C
    .asciz "st069/st069.lz"
    .balign 4
lbl_000118AC:
    # 0x118AC
    .asciz "st070"
    .balign 4
lbl_000118B4:
    # 0x118B4
    .asciz "st070/st070_p.lz"
    .balign 4
lbl_000118C8:
    # 0x118C8
    .asciz "st070/st070.lz"
    .balign 4
lbl_000118D8:
    # 0x118D8
    .asciz "st071"
    .balign 4
lbl_000118E0:
    # 0x118E0
    .asciz "st071/st071_p.lz"
    .balign 4
lbl_000118F4:
    # 0x118F4
    .asciz "st071/st071.lz"
    .balign 4
lbl_00011904:
    # 0x11904
    .asciz "st072"
    .balign 4
lbl_0001190C:
    # 0x1190C
    .asciz "st072/st072_p.lz"
    .balign 4
lbl_00011920:
    # 0x11920
    .asciz "st072/st072.lz"
    .balign 4
lbl_00011930:
    # 0x11930
    .asciz "st073"
    .balign 4
lbl_00011938:
    # 0x11938
    .asciz "st073/st073_p.lz"
    .balign 4
lbl_0001194C:
    # 0x1194C
    .asciz "st073/st073.lz"
    .balign 4
lbl_0001195C:
    # 0x1195C
    .asciz "st074"
    .balign 4
lbl_00011964:
    # 0x11964
    .asciz "st074/st074_p.lz"
    .balign 4
lbl_00011978:
    # 0x11978
    .asciz "st074/st074.lz"
    .balign 4
lbl_00011988:
    # 0x11988
    .asciz "st075"
    .balign 4
lbl_00011990:
    # 0x11990
    .asciz "st075/st075_p.lz"
    .balign 4
lbl_000119A4:
    # 0x119A4
    .asciz "st075/st075.lz"
    .balign 4
lbl_000119B4:
    # 0x119B4
    .asciz "st076"
    .balign 4
lbl_000119BC:
    # 0x119BC
    .asciz "st076/st076_p.lz"
    .balign 4
lbl_000119D0:
    # 0x119D0
    .asciz "st076/st076.lz"
    .balign 4
lbl_000119E0:
    # 0x119E0
    .asciz "st077"
    .balign 4
lbl_000119E8:
    # 0x119E8
    .asciz "st077/st077_p.lz"
    .balign 4
lbl_000119FC:
    # 0x119FC
    .asciz "st077/st077.lz"
    .balign 4
lbl_00011A0C:
    # 0x11A0C
    .asciz "st078"
    .balign 4
lbl_00011A14:
    # 0x11A14
    .asciz "st078/st078_p.lz"
    .balign 4
lbl_00011A28:
    # 0x11A28
    .asciz "st078/st078.lz"
    .balign 4
lbl_00011A38:
    # 0x11A38
    .asciz "st079"
    .balign 4
lbl_00011A40:
    # 0x11A40
    .asciz "st079/st079_p.lz"
    .balign 4
lbl_00011A54:
    # 0x11A54
    .asciz "st079/st079.lz"
    .balign 4
lbl_00011A64:
    # 0x11A64
    .asciz "st080"
    .balign 4
lbl_00011A6C:
    # 0x11A6C
    .asciz "st080/st080_p.lz"
    .balign 4
lbl_00011A80:
    # 0x11A80
    .asciz "st080/st080.lz"
    .balign 4
lbl_00011A90:
    # 0x11A90
    .asciz "st081"
    .balign 4
lbl_00011A98:
    # 0x11A98
    .asciz "st081/st081_p.lz"
    .balign 4
lbl_00011AAC:
    # 0x11AAC
    .asciz "st081/st081.lz"
    .balign 4
lbl_00011ABC:
    # 0x11ABC
    .asciz "st082"
    .balign 4
lbl_00011AC4:
    # 0x11AC4
    .asciz "st082/st082_p.lz"
    .balign 4
lbl_00011AD8:
    # 0x11AD8
    .asciz "st082/st082.lz"
    .balign 4
lbl_00011AE8:
    # 0x11AE8
    .asciz "st083"
    .balign 4
lbl_00011AF0:
    # 0x11AF0
    .asciz "st083/st083_p.lz"
    .balign 4
lbl_00011B04:
    # 0x11B04
    .asciz "st083/st083.lz"
    .balign 4
lbl_00011B14:
    # 0x11B14
    .asciz "st084"
    .balign 4
lbl_00011B1C:
    # 0x11B1C
    .asciz "st084/st084_p.lz"
    .balign 4
lbl_00011B30:
    # 0x11B30
    .asciz "st084/st084.lz"
    .balign 4
lbl_00011B40:
    # 0x11B40
    .asciz "st085"
    .balign 4
lbl_00011B48:
    # 0x11B48
    .asciz "st085/st085_p.lz"
    .balign 4
lbl_00011B5C:
    # 0x11B5C
    .asciz "st085/st085.lz"
    .balign 4
lbl_00011B6C:
    # 0x11B6C
    .asciz "st086"
    .balign 4
lbl_00011B74:
    # 0x11B74
    .asciz "st086/st086_p.lz"
    .balign 4
lbl_00011B88:
    # 0x11B88
    .asciz "st086/st086.lz"
    .balign 4
lbl_00011B98:
    # 0x11B98
    .asciz "st087"
    .balign 4
lbl_00011BA0:
    # 0x11BA0
    .asciz "st087/st087_p.lz"
    .balign 4
lbl_00011BB4:
    # 0x11BB4
    .asciz "st087/st087.lz"
    .balign 4
lbl_00011BC4:
    # 0x11BC4
    .asciz "st088"
    .balign 4
lbl_00011BCC:
    # 0x11BCC
    .asciz "st088/st088_p.lz"
    .balign 4
lbl_00011BE0:
    # 0x11BE0
    .asciz "st088/st088.lz"
    .balign 4
lbl_00011BF0:
    # 0x11BF0
    .asciz "st089"
    .balign 4
lbl_00011BF8:
    # 0x11BF8
    .asciz "st089/st089_p.lz"
    .balign 4
lbl_00011C0C:
    # 0x11C0C
    .asciz "st089/st089.lz"
    .balign 4
lbl_00011C1C:
    # 0x11C1C
    .asciz "st090"
    .balign 4
lbl_00011C24:
    # 0x11C24
    .asciz "st090/st090_p.lz"
    .balign 4
lbl_00011C38:
    # 0x11C38
    .asciz "st090/st090.lz"
    .balign 4
lbl_00011C48:
    # 0x11C48
    .asciz "st091"
    .balign 4
lbl_00011C50:
    # 0x11C50
    .asciz "st091/st091_p.lz"
    .balign 4
lbl_00011C64:
    # 0x11C64
    .asciz "st091/st091.lz"
    .balign 4
lbl_00011C74:
    # 0x11C74
    .asciz "st092"
    .balign 4
lbl_00011C7C:
    # 0x11C7C
    .asciz "st092/st092_p.lz"
    .balign 4
lbl_00011C90:
    # 0x11C90
    .asciz "st092/st092.lz"
    .balign 4
lbl_00011CA0:
    # 0x11CA0
    .asciz "st093"
    .balign 4
lbl_00011CA8:
    # 0x11CA8
    .asciz "st093/st093_p.lz"
    .balign 4
lbl_00011CBC:
    # 0x11CBC
    .asciz "st093/st093.lz"
    .balign 4
lbl_00011CCC:
    # 0x11CCC
    .asciz "st094"
    .balign 4
lbl_00011CD4:
    # 0x11CD4
    .asciz "st094/st094_p.lz"
    .balign 4
lbl_00011CE8:
    # 0x11CE8
    .asciz "st094/st094.lz"
    .balign 4
lbl_00011CF8:
    # 0x11CF8
    .asciz "st095"
    .balign 4
lbl_00011D00:
    # 0x11D00
    .asciz "st095/st095_p.lz"
    .balign 4
lbl_00011D14:
    # 0x11D14
    .asciz "st095/st095.lz"
    .balign 4
lbl_00011D24:
    # 0x11D24
    .asciz "st096"
    .balign 4
lbl_00011D2C:
    # 0x11D2C
    .asciz "st096/st096_p.lz"
    .balign 4
lbl_00011D40:
    # 0x11D40
    .asciz "st096/st096.lz"
    .balign 4
lbl_00011D50:
    # 0x11D50
    .asciz "st097"
    .balign 4
lbl_00011D58:
    # 0x11D58
    .asciz "st097/st097_p.lz"
    .balign 4
lbl_00011D6C:
    # 0x11D6C
    .asciz "st097/st097.lz"
    .balign 4
lbl_00011D7C:
    # 0x11D7C
    .asciz "st098"
    .balign 4
lbl_00011D84:
    # 0x11D84
    .asciz "st098/st098_p.lz"
    .balign 4
lbl_00011D98:
    # 0x11D98
    .asciz "st098/st098.lz"
    .balign 4
lbl_00011DA8:
    # 0x11DA8
    .asciz "st099"
    .balign 4
lbl_00011DB0:
    # 0x11DB0
    .asciz "st099/st099_p.lz"
    .balign 4
lbl_00011DC4:
    # 0x11DC4
    .asciz "st099/st099.lz"
    .balign 4
lbl_00011DD4:
    # 0x11DD4
    .asciz "st100"
    .balign 4
lbl_00011DDC:
    # 0x11DDC
    .asciz "st100/st100_p.lz"
    .balign 4
lbl_00011DF0:
    # 0x11DF0
    .asciz "st100/st100.lz"
    .balign 4
lbl_00011E00:
    # 0x11E00
    .asciz "st101"
    .balign 4
lbl_00011E08:
    # 0x11E08
    .asciz "st101/st101_p.lz"
    .balign 4
lbl_00011E1C:
    # 0x11E1C
    .asciz "st101/st101.lz"
    .balign 4
lbl_00011E2C:
    # 0x11E2C
    .asciz "st102"
    .balign 4
lbl_00011E34:
    # 0x11E34
    .asciz "st102/st102_p.lz"
    .balign 4
lbl_00011E48:
    # 0x11E48
    .asciz "st102/st102.lz"
    .balign 4
lbl_00011E58:
    # 0x11E58
    .asciz "st103"
    .balign 4
lbl_00011E60:
    # 0x11E60
    .asciz "st103/st103_p.lz"
    .balign 4
lbl_00011E74:
    # 0x11E74
    .asciz "st103/st103.lz"
    .balign 4
lbl_00011E84:
    # 0x11E84
    .asciz "st104"
    .balign 4
lbl_00011E8C:
    # 0x11E8C
    .asciz "st104/st104_p.lz"
    .balign 4
lbl_00011EA0:
    # 0x11EA0
    .asciz "st104/st104.lz"
    .balign 4
lbl_00011EB0:
    # 0x11EB0
    .asciz "st105"
    .balign 4
lbl_00011EB8:
    # 0x11EB8
    .asciz "st105/st105_p.lz"
    .balign 4
lbl_00011ECC:
    # 0x11ECC
    .asciz "st105/st105.lz"
    .balign 4
lbl_00011EDC:
    # 0x11EDC
    .asciz "st106"
    .balign 4
lbl_00011EE4:
    # 0x11EE4
    .asciz "st106/st106_p.lz"
    .balign 4
lbl_00011EF8:
    # 0x11EF8
    .asciz "st106/st106.lz"
    .balign 4
lbl_00011F08:
    # 0x11F08
    .asciz "st107"
    .balign 4
lbl_00011F10:
    # 0x11F10
    .asciz "st107/st107_p.lz"
    .balign 4
lbl_00011F24:
    # 0x11F24
    .asciz "st107/st107.lz"
    .balign 4
lbl_00011F34:
    # 0x11F34
    .asciz "st108"
    .balign 4
lbl_00011F3C:
    # 0x11F3C
    .asciz "st108/st108_p.lz"
    .balign 4
lbl_00011F50:
    # 0x11F50
    .asciz "st108/st108.lz"
    .balign 4
lbl_00011F60:
    # 0x11F60
    .asciz "st109"
    .balign 4
lbl_00011F68:
    # 0x11F68
    .asciz "st109/st109_p.lz"
    .balign 4
lbl_00011F7C:
    # 0x11F7C
    .asciz "st109/st109.lz"
    .balign 4
lbl_00011F8C:
    # 0x11F8C
    .asciz "st110"
    .balign 4
lbl_00011F94:
    # 0x11F94
    .asciz "st110/st110_p.lz"
    .balign 4
lbl_00011FA8:
    # 0x11FA8
    .asciz "st110/st110.lz"
    .balign 4
lbl_00011FB8:
    # 0x11FB8
    .asciz "st121"
    .balign 4
lbl_00011FC0:
    # 0x11FC0
    .asciz "st121/st121_p.lz"
    .balign 4
lbl_00011FD4:
    # 0x11FD4
    .asciz "st121/st121.lz"
    .balign 4
lbl_00011FE4:
    # 0x11FE4
    .asciz "st122"
    .balign 4
lbl_00011FEC:
    # 0x11FEC
    .asciz "st122/st122_p.lz"
    .balign 4
lbl_00012000:
    # 0x12000
    .asciz "st122/st122.lz"
    .balign 4
lbl_00012010:
    # 0x12010
    .asciz "st123"
    .balign 4
lbl_00012018:
    # 0x12018
    .asciz "st123/st123_p.lz"
    .balign 4
lbl_0001202C:
    # 0x1202C
    .asciz "st123/st123.lz"
    .balign 4
lbl_0001203C:
    # 0x1203C
    .asciz "st124"
    .balign 4
lbl_00012044:
    # 0x12044
    .asciz "st124/st124_p.lz"
    .balign 4
lbl_00012058:
    # 0x12058
    .asciz "st124/st124.lz"
    .balign 4
lbl_00012068:
    # 0x12068
    .asciz "st125"
    .balign 4
lbl_00012070:
    # 0x12070
    .asciz "st125/st125_p.lz"
    .balign 4
lbl_00012084:
    # 0x12084
    .asciz "st125/st125.lz"
    .balign 4
lbl_00012094:
    # 0x12094
    .asciz "st126"
    .balign 4
lbl_0001209C:
    # 0x1209C
    .asciz "st126/st126_p.lz"
    .balign 4
lbl_000120B0:
    # 0x120B0
    .asciz "st126/st126.lz"
    .balign 4
lbl_000120C0:
    # 0x120C0
    .asciz "st127"
    .balign 4
lbl_000120C8:
    # 0x120C8
    .asciz "st127/st127_p.lz"
    .balign 4
lbl_000120DC:
    # 0x120DC
    .asciz "st127/st127.lz"
    .balign 4
lbl_000120EC:
    # 0x120EC
    .asciz "st128"
    .balign 4
lbl_000120F4:
    # 0x120F4
    .asciz "st128/st128_p.lz"
    .balign 4
lbl_00012108:
    # 0x12108
    .asciz "st128/st128.lz"
    .balign 4
lbl_00012118:
    # 0x12118
    .asciz "st129"
    .balign 4
lbl_00012120:
    # 0x12120
    .asciz "st129/st129_p.lz"
    .balign 4
lbl_00012134:
    # 0x12134
    .asciz "st129/st129.lz"
    .balign 4
lbl_00012144:
    # 0x12144
    .asciz "st130"
    .balign 4
lbl_0001214C:
    # 0x1214C
    .asciz "st130/st130_p.lz"
    .balign 4
lbl_00012160:
    # 0x12160
    .asciz "st130/st130.lz"
    .balign 4
lbl_00012170:
    # 0x12170
    .asciz "st134"
    .balign 4
lbl_00012178:
    # 0x12178
    .asciz "st134/st134_p.lz"
    .balign 4
lbl_0001218C:
    # 0x1218C
    .asciz "st134/st134.lz"
    .balign 4
lbl_0001219C:
    # 0x1219C
    .asciz "bg_a"
    .balign 4
lbl_000121A4:
    # 0x121A4
    .asciz "bg/bg_a_p.lz"
    .balign 4
lbl_000121B4:
    # 0x121B4
    .asciz "bg/bg_a.lz"
    .balign 4
lbl_000121C0:
    # 0x121C0
    .asciz "bg_b"
    .balign 4
lbl_000121C8:
    # 0x121C8
    .asciz "bg/bg_b_p.lz"
    .balign 4
lbl_000121D8:
    # 0x121D8
    .asciz "bg/bg_b.lz"
    .balign 4
lbl_000121E4:
    # 0x121E4
    .asciz "bg_c"
    .balign 4
lbl_000121EC:
    # 0x121EC
    .asciz "bg/bg_c_p.lz"
    .balign 4
lbl_000121FC:
    # 0x121FC
    .asciz "bg/bg_c.lz"
    .balign 4
lbl_00012208:
    # 0x12208
    .asciz "bg_d"
    .balign 4
lbl_00012210:
    # 0x12210
    .asciz "bg/bg_d_p.lz"
    .balign 4
lbl_00012220:
    # 0x12220
    .asciz "bg/bg_d.lz"
    .balign 4
lbl_0001222C:
    # 0x1222C
    .asciz "bg_e"
    .balign 4
lbl_00012234:
    # 0x12234
    .asciz "bg/bg_e_p.lz"
    .balign 4
lbl_00012244:
    # 0x12244
    .asciz "bg/bg_e.lz"
    .balign 4
lbl_00012250:
    # 0x12250
    .asciz "bg_f"
    .balign 4
lbl_00012258:
    # 0x12258
    .asciz "bg/bg_f_p.lz"
    .balign 4
lbl_00012268:
    # 0x12268
    .asciz "bg/bg_f.lz"
    .balign 4
lbl_00012274:
    # 0x12274
    .asciz "bg_g"
    .balign 4
lbl_0001227C:
    # 0x1227C
    .asciz "bg/bg_g_p.lz"
    .balign 4
lbl_0001228C:
    # 0x1228C
    .asciz "bg/bg_g.lz"
    .balign 4
lbl_00012298:
    # 0x12298
    .asciz "bg_h"
    .balign 4
lbl_000122A0:
    # 0x122A0
    .asciz "bg/bg_h_p.lz"
    .balign 4
lbl_000122B0:
    # 0x122B0
    .asciz "bg/bg_h.lz"
    .balign 4
lbl_000122BC:
    # 0x122BC
    .asciz "bg_i"
    .balign 4
lbl_000122C4:
    # 0x122C4
    .asciz "bg/bg_i_p.lz"
    .balign 4
lbl_000122D4:
    # 0x122D4
    .asciz "bg/bg_i.lz"
    .balign 4
lbl_000122E0:
    # 0x122E0
    .asciz "bg_j"
    .balign 4
lbl_000122E8:
    # 0x122E8
    .asciz "bg/bg_j_p.lz"
    .balign 4
lbl_000122F8:
    # 0x122F8
    .asciz "bg/bg_j.lz"
    .balign 4
lbl_00012304:
    # 0x12304
    .asciz "minitest"
    .balign 4
lbl_00012310:
    # 0x12310
    .asciz "init/minit_p.lz"
lbl_00012320:
    # 0x12320
    .asciz "init/minit.lz"
    .balign 4
lbl_00012330:
    # 0x12330
    .4byte lbl_00010C60
    .4byte lbl_00010C68
    .4byte lbl_00010C7C
    .4byte lbl_00010C8C
    .4byte lbl_00010C94
    .4byte lbl_00010CA4
    .4byte lbl_00010CB4
    .4byte lbl_00010CB8
    .4byte lbl_00010CC8
    .4byte lbl_00010CD4
    .4byte lbl_00010CDC
    .4byte lbl_00010CEC
    .4byte lbl_00010CFC
    .4byte lbl_00010D04
    .4byte lbl_00010D18
    .4byte lbl_00010D28
    .4byte lbl_00010D30
    .4byte lbl_00010D44
    .4byte lbl_00010D54
    .4byte lbl_00010D5C
    .4byte lbl_00010D70
    .4byte lbl_00010D80
    .4byte lbl_00010D88
    .4byte lbl_00010D9C
    .4byte lbl_00010DAC
    .4byte lbl_00010DB4
    .4byte lbl_00010DC8
    .4byte lbl_00010DD8
    .4byte lbl_00010DE0
    .4byte lbl_00010DF4
    .4byte lbl_00010E04
    .4byte lbl_00010E0C
    .4byte lbl_00010E20
    .4byte lbl_00010E30
    .4byte lbl_00010E38
    .4byte lbl_00010E4C
    .4byte lbl_00010E5C
    .4byte lbl_00010E64
    .4byte lbl_00010E78
    .4byte lbl_00010E88
    .4byte lbl_00010E90
    .4byte lbl_00010EA4
    .4byte lbl_00010EB4
    .4byte lbl_00010EBC
    .4byte lbl_00010ED0
    .4byte lbl_00010EE0
    .4byte lbl_00010EE8
    .4byte lbl_00010EFC
    .4byte lbl_00010F0C
    .4byte lbl_00010F14
    .4byte lbl_00010F28
    .4byte lbl_00010F38
    .4byte lbl_00010F40
    .4byte lbl_00010F54
    .4byte lbl_00010F64
    .4byte lbl_00010F6C
    .4byte lbl_00010F80
    .4byte lbl_00010F90
    .4byte lbl_00010F98
    .4byte lbl_00010FAC
    .4byte lbl_00010FBC
    .4byte lbl_00010FC4
    .4byte lbl_00010FD8
    .4byte lbl_00010FE8
    .4byte lbl_00010FF0
    .4byte lbl_00011004
    .4byte lbl_00011014
    .4byte lbl_0001101C
    .4byte lbl_00011030
    .4byte lbl_00011040
    .4byte lbl_00011048
    .4byte lbl_0001105C
    .4byte lbl_0001106C
    .4byte lbl_00011074
    .4byte lbl_00011088
    .4byte lbl_00011098
    .4byte lbl_000110A0
    .4byte lbl_000110B4
    .4byte lbl_000110C4
    .4byte lbl_000110CC
    .4byte lbl_000110E0
    .4byte lbl_000110F0
    .4byte lbl_000110F8
    .4byte lbl_0001110C
    .4byte lbl_0001111C
    .4byte lbl_00011124
    .4byte lbl_00011138
    .4byte lbl_00011148
    .4byte lbl_00011150
    .4byte lbl_00011164
    .4byte lbl_00011174
    .4byte lbl_0001117C
    .4byte lbl_00011190
    .4byte lbl_000111A0
    .4byte lbl_000111A8
    .4byte lbl_000111BC
    .4byte lbl_000111CC
    .4byte lbl_000111D4
    .4byte lbl_000111E8
    .4byte lbl_000111F8
    .4byte lbl_00011200
    .4byte lbl_00011214
    .4byte lbl_00011224
    .4byte lbl_0001122C
    .4byte lbl_00011240
    .4byte lbl_00011250
    .4byte lbl_00011258
    .4byte lbl_0001126C
    .4byte lbl_0001127C
    .4byte lbl_00011284
    .4byte lbl_00011298
    .4byte lbl_000112A8
    .4byte lbl_000112B0
    .4byte lbl_000112C4
    .4byte lbl_000112D4
    .4byte lbl_000112DC
    .4byte lbl_000112F0
    .4byte lbl_00011300
    .4byte lbl_00011308
    .4byte lbl_0001131C
    .4byte lbl_0001132C
    .4byte lbl_00011334
    .4byte lbl_00011348
    .4byte lbl_00011358
    .4byte lbl_00011360
    .4byte lbl_00011374
    .4byte lbl_00011384
    .4byte lbl_0001138C
    .4byte lbl_000113A0
    .4byte lbl_000113B0
    .4byte lbl_000113B8
    .4byte lbl_000113CC
    .4byte lbl_000113DC
    .4byte lbl_000113E4
    .4byte lbl_000113F8
    .4byte lbl_00011408
    .4byte lbl_00011410
    .4byte lbl_00011424
    .4byte lbl_00011434
    .4byte lbl_0001143C
    .4byte lbl_00011450
    .4byte lbl_00011460
    .4byte lbl_00011468
    .4byte lbl_0001147C
    .4byte lbl_0001148C
    .4byte lbl_00011494
    .4byte lbl_000114A8
    .4byte lbl_000114B8
    .4byte lbl_000114C0
    .4byte lbl_000114D4
    .4byte lbl_000114E4
    .4byte lbl_000114EC
    .4byte lbl_00011500
    .4byte lbl_00011510
    .4byte lbl_00011518
    .4byte lbl_0001152C
    .4byte lbl_00011384
    .4byte lbl_0001138C
    .4byte lbl_000113A0
    .4byte lbl_0001153C
    .4byte lbl_00011544
    .4byte lbl_00011558
    .4byte lbl_00011568
    .4byte lbl_00011570
    .4byte lbl_00011584
    .4byte lbl_00011594
    .4byte lbl_0001159C
    .4byte lbl_000115B0
    .4byte lbl_000115C0
    .4byte lbl_000115C8
    .4byte lbl_000115DC
    .4byte lbl_000115EC
    .4byte lbl_000115F4
    .4byte lbl_00011608
    .4byte lbl_00011618
    .4byte lbl_00011620
    .4byte lbl_00011634
    .4byte lbl_00011644
    .4byte lbl_0001164C
    .4byte lbl_00011660
    .4byte lbl_00011670
    .4byte lbl_00011678
    .4byte lbl_0001168C
    .4byte lbl_0001169C
    .4byte lbl_000116A4
    .4byte lbl_000116B8
    .4byte lbl_000116C8
    .4byte lbl_000116D0
    .4byte lbl_000116E4
    .4byte lbl_000116F4
    .4byte lbl_000116FC
    .4byte lbl_00011710
    .4byte lbl_00011720
    .4byte lbl_00011728
    .4byte lbl_0001173C
    .4byte lbl_0001174C
    .4byte lbl_00011754
    .4byte lbl_00011768
    .4byte lbl_00011778
    .4byte lbl_00011780
    .4byte lbl_00011794
    .4byte lbl_000117A4
    .4byte lbl_000117AC
    .4byte lbl_000117C0
    .4byte lbl_000117D0
    .4byte lbl_000117D8
    .4byte lbl_000117EC
    .4byte lbl_000117FC
    .4byte lbl_00011804
    .4byte lbl_00011818
    .4byte lbl_00011828
    .4byte lbl_00011830
    .4byte lbl_00011844
    .4byte lbl_00011854
    .4byte lbl_0001185C
    .4byte lbl_00011870
    .4byte lbl_00011880
    .4byte lbl_00011888
    .4byte lbl_0001189C
    .4byte lbl_000118AC
    .4byte lbl_000118B4
    .4byte lbl_000118C8
    .4byte lbl_000118D8
    .4byte lbl_000118E0
    .4byte lbl_000118F4
    .4byte lbl_00011904
    .4byte lbl_0001190C
    .4byte lbl_00011920
    .4byte lbl_00011930
    .4byte lbl_00011938
    .4byte lbl_0001194C
    .4byte lbl_0001195C
    .4byte lbl_00011964
    .4byte lbl_00011978
    .4byte lbl_00011988
    .4byte lbl_00011990
    .4byte lbl_000119A4
    .4byte lbl_000119B4
    .4byte lbl_000119BC
    .4byte lbl_000119D0
    .4byte lbl_000119E0
    .4byte lbl_000119E8
    .4byte lbl_000119FC
    .4byte lbl_00011A0C
    .4byte lbl_00011A14
    .4byte lbl_00011A28
    .4byte lbl_00011A38
    .4byte lbl_00011A40
    .4byte lbl_00011A54
    .4byte lbl_00011A64
    .4byte lbl_00011A6C
    .4byte lbl_00011A80
    .4byte lbl_00011A90
    .4byte lbl_00011A98
    .4byte lbl_00011AAC
    .4byte lbl_00011ABC
    .4byte lbl_00011AC4
    .4byte lbl_00011AD8
    .4byte lbl_00011AE8
    .4byte lbl_00011AF0
    .4byte lbl_00011B04
    .4byte lbl_00011B14
    .4byte lbl_00011B1C
    .4byte lbl_00011B30
    .4byte lbl_00011B40
    .4byte lbl_00011B48
    .4byte lbl_00011B5C
    .4byte lbl_00011B6C
    .4byte lbl_00011B74
    .4byte lbl_00011B88
    .4byte lbl_00011B98
    .4byte lbl_00011BA0
    .4byte lbl_00011BB4
    .4byte lbl_00011BC4
    .4byte lbl_00011BCC
    .4byte lbl_00011BE0
    .4byte lbl_00011BF0
    .4byte lbl_00011BF8
    .4byte lbl_00011C0C
    .4byte lbl_00011C1C
    .4byte lbl_00011C24
    .4byte lbl_00011C38
    .4byte lbl_00011C48
    .4byte lbl_00011C50
    .4byte lbl_00011C64
    .4byte lbl_00011C74
    .4byte lbl_00011C7C
    .4byte lbl_00011C90
    .4byte lbl_00011CA0
    .4byte lbl_00011CA8
    .4byte lbl_00011CBC
    .4byte lbl_00011CCC
    .4byte lbl_00011CD4
    .4byte lbl_00011CE8
    .4byte lbl_00011CF8
    .4byte lbl_00011D00
    .4byte lbl_00011D14
    .4byte lbl_00011D24
    .4byte lbl_00011D2C
    .4byte lbl_00011D40
    .4byte lbl_00011D50
    .4byte lbl_00011D58
    .4byte lbl_00011D6C
    .4byte lbl_00011D7C
    .4byte lbl_00011D84
    .4byte lbl_00011D98
    .4byte lbl_00011DA8
    .4byte lbl_00011DB0
    .4byte lbl_00011DC4
    .4byte lbl_00011DD4
    .4byte lbl_00011DDC
    .4byte lbl_00011DF0
    .4byte lbl_00011E00
    .4byte lbl_00011E08
    .4byte lbl_00011E1C
    .4byte lbl_00011E2C
    .4byte lbl_00011E34
    .4byte lbl_00011E48
    .4byte lbl_00011E58
    .4byte lbl_00011E60
    .4byte lbl_00011E74
    .4byte lbl_00011E84
    .4byte lbl_00011E8C
    .4byte lbl_00011EA0
    .4byte lbl_00011EB0
    .4byte lbl_00011EB8
    .4byte lbl_00011ECC
    .4byte lbl_00011EDC
    .4byte lbl_00011EE4
    .4byte lbl_00011EF8
    .4byte lbl_00011F08
    .4byte lbl_00011F10
    .4byte lbl_00011F24
    .4byte lbl_00011F34
    .4byte lbl_00011F3C
    .4byte lbl_00011F50
    .4byte lbl_00011F60
    .4byte lbl_00011F68
    .4byte lbl_00011F7C
    .4byte lbl_00011F8C
    .4byte lbl_00011F94
    .4byte lbl_00011FA8
    .4byte lbl_00011FB8
    .4byte lbl_00011FC0
    .4byte lbl_00011FD4
    .4byte lbl_00011FE4
    .4byte lbl_00011FEC
    .4byte lbl_00012000
    .4byte lbl_00012010
    .4byte lbl_00012018
    .4byte lbl_0001202C
    .4byte lbl_0001203C
    .4byte lbl_00012044
    .4byte lbl_00012058
    .4byte lbl_00012068
    .4byte lbl_00012070
    .4byte lbl_00012084
    .4byte lbl_00012094
    .4byte lbl_0001209C
    .4byte lbl_000120B0
    .4byte lbl_000120C0
    .4byte lbl_000120C8
    .4byte lbl_000120DC
    .4byte lbl_000120EC
    .4byte lbl_000120F4
    .4byte lbl_00012108
    .4byte lbl_00012118
    .4byte lbl_00012120
    .4byte lbl_00012134
    .4byte lbl_00012144
    .4byte lbl_0001214C
    .4byte lbl_00012160
    .4byte lbl_00012170
    .4byte lbl_00012178
    .4byte lbl_0001218C
    .4byte lbl_0001219C
    .4byte lbl_000121A4
    .4byte lbl_000121B4
    .4byte lbl_000121C0
    .4byte lbl_000121C8
    .4byte lbl_000121D8
    .4byte lbl_000121E4
    .4byte lbl_000121EC
    .4byte lbl_000121FC
    .4byte lbl_00012208
    .4byte lbl_00012210
    .4byte lbl_00012220
    .4byte lbl_0001222C
    .4byte lbl_00012234
    .4byte lbl_00012244
    .4byte lbl_00012250
    .4byte lbl_00012258
    .4byte lbl_00012268
    .4byte lbl_00012274
    .4byte lbl_0001227C
    .4byte lbl_0001228C
    .4byte lbl_00012298
    .4byte lbl_000122A0
    .4byte lbl_000122B0
    .4byte lbl_000122BC
    .4byte lbl_000122C4
    .4byte lbl_000122D4
    .4byte lbl_000122E0
    .4byte lbl_000122E8
    .4byte lbl_000122F8
    .4byte lbl_00012304
    .4byte lbl_00012310
    .4byte lbl_00012320
    .asciz "Category      :%s\n"
    .balign 4
    .asciz "no data\n"
    .balign 4
    .asciz "name          :%s\n"
    .balign 4
    .asciz "size          :%d\n"
    .balign 4
lbl_000129D8:
    # 0x129D8
    .asciz "category   : %s\n"
    .balign 4
lbl_000129EC:
    # 0x129EC
    .asciz "ID         : %3d\n      name : bmp_%s\n      size : %3d x %3d\n\n"
    .balign 4
lbl_00012A2C:
    # 0x12A2C
    .asciz "base red   : %3d\n"
    .balign 4
lbl_00012A40:
    # 0x12A40
    .asciz "base green : %3d\n"
    .balign 4
lbl_00012A54:
    # 0x12A54
    .asciz "base blue  : %3d\n"
    .balign 4
lbl_00012A68:
    # 0x12A68
    .asciz "ofs  red   : %3d\n"
    .balign 4
lbl_00012A7C:
    # 0x12A7C
    .asciz "ofs  green : %3d\n"
    .balign 4
lbl_00012A90:
    # 0x12A90
    .asciz "ofs  blue  : %3d\n"
    .balign 4
lbl_00012AA4:
    # 0x12AA4
    .asciz "base zang  : %04hX\n"
lbl_00012AB8:
    # 0x12AB8
    .asciz "trnsl      : %4.2f\n"
lbl_00012ACC:
    # 0x12ACC
    .asciz "zm_x       : %4.1f\n"
lbl_00012AE0:
    # 0x12AE0
    .asciz "zm_y       : %4.1f\n"
lbl_00012AF4:
    # 0x12AF4
    .asciz "texture u0 : %4.3f\n"
lbl_00012B08:
    # 0x12B08
    .asciz "texture v0 : %4.3f\n"
lbl_00012B1C:
    # 0x12B1C
    .asciz "texture u1 : %4.3f\n"
lbl_00012B30:
    # 0x12B30
    .asciz "texture v1 : %4.3f\n"
    .4byte 0x00000001
    .4byte lbl_000129D8
    .4byte lbl_1000007C
    .4byte 0x00000002
    .4byte lbl_000129EC
    .4byte lbl_10000080
    .4byte 0x00000004
    .4byte lbl_00012A2C
    .4byte lbl_10000088
    .4byte 0x00000004
    .4byte lbl_00012A40
    .4byte lbl_10000089
    .4byte 0x00000004
    .4byte lbl_00012A54
    .4byte lbl_1000008A
    .4byte 0x00000004
    .4byte lbl_00012A68
    .4byte lbl_1000008B
    .4byte 0x00000004
    .4byte lbl_00012A7C
    .4byte lbl_1000008C
    .4byte 0x00000004
    .4byte lbl_00012A90
    .4byte lbl_1000008D
    .4byte 0x00000005
    .4byte lbl_00012AA4
    .4byte lbl_1000008E
    .4byte 0x00000006
    .4byte lbl_00012AB8
    .4byte lbl_10000090
    .4byte 0x00000007
    .4byte lbl_00012ACC
    .4byte lbl_10000094
    .4byte 0x00000007
    .4byte lbl_00012AE0
    .4byte lbl_10000098
    .4byte 0x00000008
    .4byte lbl_00012AF4
    .4byte lbl_100000A0
    .4byte 0x00000008
    .4byte lbl_00012B08
    .4byte lbl_100000A4
    .4byte 0x00000008
    .4byte lbl_00012B1C
    .4byte lbl_100000A8
    .4byte 0x00000008
    .4byte lbl_00012B30
    .4byte lbl_100000AC
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
lbl_00012C10:
    # 0x12C10
    .4byte _prolog + 0x30CC
    .4byte _prolog + 0x2B00
    .4byte _prolog + 0x2BF0
    .4byte _prolog + 0x30CC
    .4byte _prolog + 0x2CE0
    .4byte _prolog + 0x2DBC
    .4byte _prolog + 0x2E70
    .4byte _prolog + 0x2F58
    .4byte _prolog + 0x3018
    .4byte 0xFFFFFFFF
    .4byte 0x1C200000
    .4byte 0x2B000000
lbl_00012C40:
    # 0x12C40
    .asciz "HELLO, WORLD"
    .balign 4
lbl_00012C50:
    # 0x12C50
    .4byte 0x48454C4C
    .4byte 0x4F2C2057
    .4byte 0x4F524C44
    .4byte 0x0A181616
    .4byte 0x16190A17
    .4byte 0x20202017
    .4byte 0x0A1A1616
    .4byte 0x161B0000
lbl_00012C70:
    # 0x12C70
    .4byte 0x00000000
    .4byte lbl_00012C40
    .4byte 0x00000001
    .4byte lbl_00012C40
    .4byte 0x00000002
    .4byte lbl_00012C50
    .4byte 0x00000009
    .4byte lbl_00012C40
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
lbl_00012C98:
    # 0x12C98
    .asciz "h/OOMOJI a/ABCDEFG HIJKLMN\nOPQRSTU VWXYZ\nk/KOMOJI a/abcdefg hijklmn\nopqrstu vwxyz\n0123456789"
    .balign 4
lbl_00012CF8:
    # 0x12CF8
    .asciz "h/OOMOJI a/ABCDEFG HIJKLMN\nOPQRSTU VWXYZ\nk/KOMOJI a/abcdefg hijklmn\nopqrstu vwxyz\n0123456789\np/BOTANN_A/ANNDO/LE/GENZAI/JIBUNN/KOME/BUTTON_+/"
    .balign 4
lbl_00012D88:
    # 0x12D88
    .asciz "p/BOTANN_A/BUTTON_+/"
    .balign 4
lbl_00012DA0:
    # 0x12DA0
    .4byte 0x000000B0
    .4byte lbl_00012C98
    .4byte 0x000000B1
    .4byte lbl_00012CF8
    .4byte 0x000000B2
    .4byte lbl_00012D88
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
lbl_00012DC0:
    # 0x12DC0
    .4byte 0x01021008
    .4byte 0x05000000
lbl_00012DC8:
    # 0x12DC8
    .4byte 0x00000015
    .4byte lbl_00012DC0
    .4byte 0x00000016
    .4byte lbl_00012DC0
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
lbl_00012DE0:
    # 0x12DE0
    .asciz "0123456789"
    .balign 4
lbl_00012DEC:
    # 0x12DEC
    .asciz "0123"
    .balign 4
lbl_00012DF4:
    # 0x12DF4
    .4byte 0x30000000
lbl_00012DF8:
    # 0x12DF8
    .asciz "12345"
    .balign 4
lbl_00012E00:
    # 0x12E00
    .4byte 0x0000001B
    .4byte lbl_00012DE0
    .4byte 0x0000001C
    .4byte lbl_00012C40
    .4byte 0x0000001D
    .4byte lbl_00012DEC
    .4byte 0x0000001E
    .4byte lbl_00012DF4
    .4byte 0x0000001F
    .4byte lbl_00012DF8
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
lbl_00012E30:
    # 0x12E30
    .asciz "01234567"
    .balign 4
lbl_00012E3C:
    # 0x12E3C
    .4byte 0x00000034
    .4byte lbl_00012DE0
    .4byte 0x00000035
    .4byte lbl_00012DE0
    .4byte 0x00000036
    .4byte lbl_00012DE0
    .4byte 0x00000037
    .4byte lbl_00012E30
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
lbl_00012E64:
    # 0x12E64
    .asciz "HELLO, WORLD\nABC DEF"
    .balign 4
lbl_00012E7C:
    # 0x12E7C
    .4byte 0x0000005F
    .4byte lbl_00012C40
    .4byte 0x00000060
    .4byte lbl_00012C40
    .4byte 0x00000061
    .4byte lbl_00012C40
    .4byte 0x00000062
    .4byte lbl_00012E64
    .4byte 0x00000063
    .4byte lbl_00012E64
    .4byte 0x00000064
    .4byte lbl_00012C40
    .4byte 0x0000005E
    .4byte lbl_00012DE0
    .4byte 0x00000065
    .4byte lbl_00012DE0
    .4byte 0x00000066
    .4byte lbl_00012DE0
    .4byte 0x0000005D
    .4byte lbl_00012E30
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
lbl_00012ED4:
    # 0x12ED4
    .asciz "COMMON"
    .balign 4
lbl_00012EDC:
    # 0x12EDC
    .asciz "COMMON(JIS)"
lbl_00012EE8:
    # 0x12EE8
    .asciz "COMMON(ICON)"
    .balign 4
lbl_00012EF8:
    # 0x12EF8
    .asciz "RANKING"
lbl_00012F00:
    # 0x12F00
    .asciz "SELECTER"
    .balign 4
lbl_00012F0C:
    # 0x12F0C
    .asciz "MAIN GAME"
    .balign 4
    .4byte lbl_00012C70
    .4byte lbl_00012ED4
    .4byte 0x00000000
    .4byte lbl_00012DA0
    .4byte lbl_00012EDC
    .4byte 0x00000000
    .4byte lbl_00012DC8
    .4byte lbl_00012EE8
    .4byte 0x00000000
    .4byte lbl_00012E00
    .4byte lbl_00012EF8
    .4byte 0x00000003
    .4byte lbl_00012E3C
    .4byte lbl_00012F00
    .4byte 0x00000004
    .4byte lbl_00012E7C
    .4byte lbl_00012F0C
    .4byte 0x00000005
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .asciz "%18s *"
    .balign 4
    .asciz "%18s"
    .balign 4
lbl_00012F7C:
    # 0x12F7C
    .4byte 0x0000001A
    .4byte 0x40000000
    .4byte 0x41700000
    .4byte 0x3DCCCCCD
    .4byte 0x00000004
    .4byte 0x00000002
    .4byte 0x00000015
    .4byte 0x40000000
    .4byte 0x41700000
    .4byte 0x3DCCCCCD
    .4byte 0x00000005
    .4byte 0x00000003
    .4byte 0x0000001B
    .4byte 0x3F800000
    .4byte 0x41000000
    .4byte 0x3D4CCCCD
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000016
    .4byte 0x3F800000
    .4byte 0x41000000
    .4byte 0x3D4CCCCD
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000018
    .4byte 0x40A00000
    .4byte 0x428C0000
    .4byte 0x3D4CCCCD
    .4byte 0x00000006
    .4byte 0x00000000
    .4byte 0x00000013
    .4byte 0x40A00000
    .4byte 0x428C0000
    .4byte 0x3D4CCCCD
    .4byte 0x00000007
    .4byte 0x00000000
    .4byte 0x00000017
    .4byte 0x40000000
    .4byte 0x41200000
    .4byte 0x3D4CCCCD
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000012
    .4byte 0x40000000
    .4byte 0x41200000
    .4byte 0x3D4CCCCD
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0001303C:
    # 0x1303C
    .asciz "High Level"
    .balign 4
lbl_00013048:
    # 0x13048
    .asciz "Middle Level"
    .balign 4
lbl_00013058:
    # 0x13058
    .asciz "Low Level"
    .balign 4
lbl_00013064:
    # 0x13064
    .asciz "More Low Level"
    .balign 4
    .4byte lbl_0001303C
    .4byte lbl_00013048
    .4byte lbl_00013058
    .4byte lbl_00013064
lbl_00013084:
    # 0x13084
    .4byte 0x41504500
lbl_00013088:
    # 0x13088
    .4byte 0x47414C00
lbl_0001308C:
    # 0x1308C
    .4byte 0x4B494400
lbl_00013090:
    # 0x13090
    .4byte 0x474F5200
    .4byte lbl_00013084
    .4byte lbl_00013088
    .4byte lbl_0001308C
    .4byte lbl_00013090
lbl_000130A4:
    # 0x130A4
    .asciz "red(default)"
    .balign 4
lbl_000130B4:
    # 0x130B4
    .asciz "blue"
    .balign 4
lbl_000130BC:
    # 0x130BC
    .asciz "yellow"
    .balign 4
lbl_000130C4:
    # 0x130C4
    .asciz "green"
    .balign 4
    .4byte 0x2A000000
    .asciz "[%3d/%3d] %-25s  %3d/%3d\n"
    .balign 4
    .asciz "[%3d/%3d] %s\n"
    .balign 4
    .asciz "[%3d/  4] %s\n"
    .balign 4
    .asciz "[%3d/%3d] %s LOD\n"
    .balign 4
    .asciz "[%6.2f ] MOTION SPEED\n"
    .balign 4
    .asciz "[%3d/%3d] %-20s  %7.3f  %7.3f%\n"
lbl_00013158:
    # 0x13158
    .4byte _prolog + 0x4644
    .4byte _prolog + 0x4930
    .4byte _prolog + 0x4A1C
    .4byte _prolog + 0x4BD0
    .4byte _prolog + 0x4B50
    .4byte _prolog + 0x4C20
    .4byte _prolog + 0x4CCC
    .4byte _prolog + 0x4DEC
lbl_00013178:
    # 0x13178
    .4byte _prolog + 0x42F8
    .4byte _prolog + 0x4328
    .4byte _prolog + 0x4354
    .4byte _prolog + 0x437C
    .4byte _prolog + 0x4398
    .4byte _prolog + 0x43BC
    .4byte _prolog + 0x43D0
    .4byte _prolog + 0x4420
lbl_00013198:
    # 0x13198
    .asciz "Material Change"
lbl_000131A8:
    # 0x131A8
    .asciz "Material Freeze"
lbl_000131B8:
    # 0x131B8
    .asciz "Blend"
    .balign 4
lbl_000131C0:
    # 0x131C0
    .asciz "Texture Only"
    .balign 4
lbl_000131D0:
    # 0x131D0
    .asciz "Constant"
    .balign 4
lbl_000131DC:
    # 0x131DC
    .asciz "Gouraud"
lbl_000131E4:
    # 0x131E4
    .asciz "Double Side"
lbl_000131F0:
    # 0x131F0
    .asciz "Single Side"
lbl_000131FC:
    # 0x131FC
    .asciz "Fog Disable"
lbl_00013208:
    # 0x13208
    .asciz "Fog Enable"
    .balign 4
    .4byte lbl_00013198
    .4byte lbl_000131A8
    .4byte lbl_000131B8
    .4byte lbl_000131C0
    .4byte lbl_000131D0
    .4byte lbl_000131DC
    .4byte lbl_000131E4
    .4byte lbl_000131F0
    .4byte lbl_000131FC
    .4byte lbl_00013208
lbl_0001323C:
    # 0x1323C
    .asciz "boy_h/boy_h.tpl"
lbl_0001324C:
    # 0x1324C
    .asciz "boy_kao.gcm"
    .asciz "Effective Model Test\n"
    .balign 4
    .4byte 0x2D3E2000
    .4byte 0x20202000
lbl_00013278:
    # 0x13278
    .asciz "Normal"
    .balign 4
lbl_00013280:
    # 0x13280
    .asciz "All Disp"
    .balign 4
lbl_0001328C:
    # 0x1328C
    .asciz "Cat Next"
    .balign 4
lbl_00013298:
    # 0x13298
    .asciz "Cat Prev"
    .balign 4
lbl_000132A4:
    # 0x132A4
    .asciz "Load"
    .balign 4
    .4byte lbl_00013278
    .4byte lbl_00013280
    .4byte lbl_0001328C
    .4byte lbl_00013298
    .4byte lbl_000132A4
lbl_000132C0:
    # 0x132C0
    .asciz "init"
    .balign 4
lbl_000132C8:
    # 0x132C8
    .4byte 0x62670000
lbl_000132CC:
    # 0x132CC
    .asciz "bg_jun"
    .balign 4
lbl_000132D4:
    # 0x132D4
    .asciz "bg_wat"
    .balign 4
lbl_000132DC:
    # 0x132DC
    .asciz "bg_nig"
    .balign 4
lbl_000132E4:
    # 0x132E4
    .asciz "bg_sun"
    .balign 4
lbl_000132EC:
    # 0x132EC
    .asciz "bg_spa"
    .balign 4
lbl_000132F4:
    # 0x132F4
    .asciz "bg_snd"
    .balign 4
lbl_000132FC:
    # 0x132FC
    .asciz "bg_ice"
    .balign 4
lbl_00013304:
    # 0x13304
    .asciz "bg_stm"
    .balign 4
lbl_0001330C:
    # 0x1330C
    .asciz "bg_bns"
    .balign 4
lbl_00013314:
    # 0x13314
    .asciz "st131"
    .balign 4
lbl_0001331C:
    # 0x1331C
    .asciz "st132"
    .balign 4
lbl_00013324:
    # 0x13324
    .asciz "st133"
    .balign 4
lbl_0001332C:
    # 0x1332C
    .asciz "st135"
    .balign 4
lbl_00013334:
    # 0x13334
    .asciz "st136"
    .balign 4
lbl_0001333C:
    # 0x1333C
    .asciz "st137"
    .balign 4
lbl_00013344:
    # 0x13344
    .asciz "st138"
    .balign 4
lbl_0001334C:
    # 0x1334C
    .asciz "st139"
    .balign 4
lbl_00013354:
    # 0x13354
    .asciz "st140"
    .balign 4
lbl_0001335C:
    # 0x1335C
    .asciz "st141"
    .balign 4
lbl_00013364:
    # 0x13364
    .asciz "st142"
    .balign 4
lbl_0001336C:
    # 0x1336C
    .asciz "st143"
    .balign 4
lbl_00013374:
    # 0x13374
    .asciz "st144"
    .balign 4
lbl_0001337C:
    # 0x1337C
    .asciz "st145"
    .balign 4
lbl_00013384:
    # 0x13384
    .asciz "st146"
    .balign 4
lbl_0001338C:
    # 0x1338C
    .asciz "st147"
    .balign 4
lbl_00013394:
    # 0x13394
    .asciz "st148"
    .balign 4
lbl_0001339C:
    # 0x1339C
    .asciz "st149"
    .balign 4
lbl_000133A4:
    # 0x133A4
    .asciz "st150"
    .balign 4
lbl_000133AC:
    # 0x133AC
    .asciz "st151"
    .balign 4
lbl_000133B4:
    # 0x133B4
    .asciz "st152"
    .balign 4
lbl_000133BC:
    # 0x133BC
    .asciz "st153"
    .balign 4
lbl_000133C4:
    # 0x133C4
    .asciz "st154"
    .balign 4
lbl_000133CC:
    # 0x133CC
    .asciz "st155"
    .balign 4
lbl_000133D4:
    # 0x133D4
    .asciz "st156"
    .balign 4
lbl_000133DC:
    # 0x133DC
    .asciz "st157"
    .balign 4
lbl_000133E4:
    # 0x133E4
    .asciz "st158"
    .balign 4
lbl_000133EC:
    # 0x133EC
    .asciz "st159"
    .balign 4
lbl_000133F4:
    # 0x133F4
    .asciz "st160"
    .balign 4
lbl_000133FC:
    # 0x133FC
    .asciz "st161"
    .balign 4
lbl_00013404:
    # 0x13404
    .asciz "st162"
    .balign 4
lbl_0001340C:
    # 0x1340C
    .asciz "st163"
    .balign 4
lbl_00013414:
    # 0x13414
    .asciz "st164"
    .balign 4
lbl_0001341C:
    # 0x1341C
    .asciz "st165"
    .balign 4
lbl_00013424:
    # 0x13424
    .asciz "st166"
    .balign 4
lbl_0001342C:
    # 0x1342C
    .asciz "st167"
    .balign 4
lbl_00013434:
    # 0x13434
    .asciz "st168"
    .balign 4
lbl_0001343C:
    # 0x1343C
    .asciz "st169"
    .balign 4
lbl_00013444:
    # 0x13444
    .asciz "st170"
    .balign 4
lbl_0001344C:
    # 0x1344C
    .asciz "st171"
    .balign 4
lbl_00013454:
    # 0x13454
    .asciz "st172"
    .balign 4
lbl_0001345C:
    # 0x1345C
    .asciz "st173"
    .balign 4
lbl_00013464:
    # 0x13464
    .asciz "st174"
    .balign 4
lbl_0001346C:
    # 0x1346C
    .asciz "st175"
    .balign 4
lbl_00013474:
    # 0x13474
    .asciz "st176"
    .balign 4
lbl_0001347C:
    # 0x1347C
    .asciz "st177"
    .balign 4
lbl_00013484:
    # 0x13484
    .asciz "st178"
    .balign 4
lbl_0001348C:
    # 0x1348C
    .asciz "st179"
    .balign 4
lbl_00013494:
    # 0x13494
    .asciz "st180"
    .balign 4
lbl_0001349C:
    # 0x1349C
    .asciz "st181"
    .balign 4
lbl_000134A4:
    # 0x134A4
    .asciz "st182"
    .balign 4
lbl_000134AC:
    # 0x134AC
    .asciz "st183"
    .balign 4
lbl_000134B4:
    # 0x134B4
    .asciz "st184"
    .balign 4
lbl_000134BC:
    # 0x134BC
    .asciz "st185"
    .balign 4
lbl_000134C4:
    # 0x134C4
    .asciz "st186"
    .balign 4
lbl_000134CC:
    # 0x134CC
    .asciz "st187"
    .balign 4
lbl_000134D4:
    # 0x134D4
    .asciz "st188"
    .balign 4
lbl_000134DC:
    # 0x134DC
    .asciz "st189"
    .balign 4
lbl_000134E4:
    # 0x134E4
    .asciz "st190"
    .balign 4
lbl_000134EC:
    # 0x134EC
    .asciz "st191"
    .balign 4
lbl_000134F4:
    # 0x134F4
    .asciz "st192"
    .balign 4
lbl_000134FC:
    # 0x134FC
    .asciz "st193"
    .balign 4
lbl_00013504:
    # 0x13504
    .asciz "st194"
    .balign 4
lbl_0001350C:
    # 0x1350C
    .asciz "st195"
    .balign 4
lbl_00013514:
    # 0x13514
    .asciz "st196"
    .balign 4
lbl_0001351C:
    # 0x1351C
    .asciz "st197"
    .balign 4
lbl_00013524:
    # 0x13524
    .asciz "st198"
    .balign 4
lbl_0001352C:
    # 0x1352C
    .asciz "st199"
    .balign 4
lbl_00013534:
    # 0x13534
    .asciz "st200"
    .balign 4
lbl_0001353C:
    # 0x1353C
    .asciz "boy_h"
    .balign 4
lbl_00013544:
    # 0x13544
    .asciz "boy_l"
    .balign 4
lbl_0001354C:
    # 0x1354C
    .asciz "gal_h"
    .balign 4
lbl_00013554:
    # 0x13554
    .asciz "gal_l"
    .balign 4
lbl_0001355C:
    # 0x1355C
    .asciz "kid_h"
    .balign 4
lbl_00013564:
    # 0x13564
    .asciz "kid_l"
    .balign 4
lbl_0001356C:
    # 0x1356C
    .asciz "m_race"
    .balign 4
lbl_00013574:
    # 0x13574
    .asciz "m_fight"
lbl_0001357C:
    # 0x1357C
    .asciz "m_pilot"
lbl_00013584:
    # 0x13584
    .asciz "m_bowl"
    .balign 4
lbl_0001358C:
    # 0x1358C
    .asciz "m_golf"
    .balign 4
lbl_00013594:
    # 0x13594
    .asciz "m_bill"
    .balign 4
lbl_0001359C:
    # 0x1359C
    .asciz "test"
    .balign 4
    .4byte lbl_000132C0
    .4byte lbl_00010C60
    .4byte lbl_000132C0
    .4byte lbl_00010CD4
    .4byte lbl_000132C8
    .4byte lbl_000132CC
    .4byte lbl_000132C8
    .4byte lbl_000132D4
    .4byte lbl_000132C8
    .4byte lbl_000132DC
    .4byte lbl_000132C8
    .4byte lbl_000132E4
    .4byte lbl_000132C8
    .4byte lbl_000132EC
    .4byte lbl_000132C8
    .4byte lbl_000132F4
    .4byte lbl_000132C8
    .4byte lbl_000132FC
    .4byte lbl_000132C8
    .4byte lbl_00013304
    .4byte lbl_000132C8
    .4byte lbl_0001330C
    .4byte lbl_00013314
    .4byte lbl_00013314
    .4byte lbl_0001331C
    .4byte lbl_0001331C
    .4byte lbl_00013324
    .4byte lbl_00013324
    .4byte lbl_00012170
    .4byte lbl_00012170
    .4byte lbl_0001332C
    .4byte lbl_0001332C
    .4byte lbl_00013334
    .4byte lbl_00013334
    .4byte lbl_0001333C
    .4byte lbl_0001333C
    .4byte lbl_00013344
    .4byte lbl_00013344
    .4byte lbl_0001334C
    .4byte lbl_0001334C
    .4byte lbl_00013354
    .4byte lbl_00013354
    .4byte lbl_0001335C
    .4byte lbl_0001335C
    .4byte lbl_00013364
    .4byte lbl_00013364
    .4byte lbl_0001336C
    .4byte lbl_0001336C
    .4byte lbl_00013374
    .4byte lbl_00013374
    .4byte lbl_0001337C
    .4byte lbl_0001337C
    .4byte lbl_00013384
    .4byte lbl_00013384
    .4byte lbl_0001338C
    .4byte lbl_0001338C
    .4byte lbl_00013394
    .4byte lbl_00013394
    .4byte lbl_0001339C
    .4byte lbl_0001339C
    .4byte lbl_000133A4
    .4byte lbl_000133A4
    .4byte lbl_000133AC
    .4byte lbl_000133AC
    .4byte lbl_000133B4
    .4byte lbl_000133B4
    .4byte lbl_000133BC
    .4byte lbl_000133BC
    .4byte lbl_000133C4
    .4byte lbl_000133C4
    .4byte lbl_000133CC
    .4byte lbl_000133CC
    .4byte lbl_000133D4
    .4byte lbl_000133D4
    .4byte lbl_000133DC
    .4byte lbl_000133DC
    .4byte lbl_000133E4
    .4byte lbl_000133E4
    .4byte lbl_000133EC
    .4byte lbl_000133EC
    .4byte lbl_000133F4
    .4byte lbl_000133F4
    .4byte lbl_000133FC
    .4byte lbl_000133FC
    .4byte lbl_00013404
    .4byte lbl_00013404
    .4byte lbl_0001340C
    .4byte lbl_0001340C
    .4byte lbl_00013414
    .4byte lbl_00013414
    .4byte lbl_0001341C
    .4byte lbl_0001341C
    .4byte lbl_00013424
    .4byte lbl_00013424
    .4byte lbl_0001342C
    .4byte lbl_0001342C
    .4byte lbl_00013434
    .4byte lbl_00013434
    .4byte lbl_0001343C
    .4byte lbl_0001343C
    .4byte lbl_00013444
    .4byte lbl_00013444
    .4byte lbl_0001344C
    .4byte lbl_0001344C
    .4byte lbl_00013454
    .4byte lbl_00013454
    .4byte lbl_0001345C
    .4byte lbl_0001345C
    .4byte lbl_00013464
    .4byte lbl_00013464
    .4byte lbl_0001346C
    .4byte lbl_0001346C
    .4byte lbl_00013474
    .4byte lbl_00013474
    .4byte lbl_0001347C
    .4byte lbl_0001347C
    .4byte lbl_00013484
    .4byte lbl_00013484
    .4byte lbl_0001348C
    .4byte lbl_0001348C
    .4byte lbl_00013494
    .4byte lbl_00013494
    .4byte lbl_0001349C
    .4byte lbl_0001349C
    .4byte lbl_000134A4
    .4byte lbl_000134A4
    .4byte lbl_000134AC
    .4byte lbl_000134AC
    .4byte lbl_000134B4
    .4byte lbl_000134B4
    .4byte lbl_000134BC
    .4byte lbl_000134BC
    .4byte lbl_000134C4
    .4byte lbl_000134C4
    .4byte lbl_000134CC
    .4byte lbl_000134CC
    .4byte lbl_000134D4
    .4byte lbl_000134D4
    .4byte lbl_000134DC
    .4byte lbl_000134DC
    .4byte lbl_00013494
    .4byte lbl_000134E4
    .4byte lbl_000134EC
    .4byte lbl_000134EC
    .4byte lbl_000134F4
    .4byte lbl_000134F4
    .4byte lbl_000134FC
    .4byte lbl_000134FC
    .4byte lbl_00013504
    .4byte lbl_00013504
    .4byte lbl_0001350C
    .4byte lbl_0001350C
    .4byte lbl_00013514
    .4byte lbl_00013514
    .4byte lbl_0001351C
    .4byte lbl_0001351C
    .4byte lbl_00013524
    .4byte lbl_00013524
    .4byte lbl_0001352C
    .4byte lbl_0001352C
    .4byte lbl_00013534
    .4byte lbl_00013534
    .4byte lbl_0001353C
    .4byte lbl_0001353C
    .4byte lbl_00013544
    .4byte lbl_00013544
    .4byte lbl_0001354C
    .4byte lbl_0001354C
    .4byte lbl_00013554
    .4byte lbl_00013554
    .4byte lbl_0001355C
    .4byte lbl_0001355C
    .4byte lbl_00013564
    .4byte lbl_00013564
    .4byte lbl_000132C0
    .4byte lbl_0001356C
    .4byte lbl_000132C0
    .4byte lbl_00013574
    .4byte lbl_000132C0
    .4byte lbl_0001357C
    .4byte lbl_000132C0
    .4byte lbl_00013584
    .4byte lbl_000132C0
    .4byte lbl_0001358C
    .4byte lbl_000132C0
    .4byte lbl_00013594
    .4byte lbl_000132C0
    .4byte lbl_0001359C
    .4byte 0x25730A00
    .asciz ".tpl"
    .balign 4
    .asciz ".gma"
    .balign 4
    .4byte 0x2E2E0000
lbl_000138AC:
    # 0x138AC
    .asciz "%s/%s.tpl"
    .balign 4
lbl_000138B8:
    # 0x138B8
    .asciz "%s/%s.gma"
    .balign 4
    .asciz "Category [%s] Please Load"
    .balign 4
    .asciz "Category [%s] no data\n"
    .balign 4
    .asciz "Category [%s] %d/%d"
    .asciz "name: %s\nrad: %f\n"
    .balign 4
lbl_00013920:
    # 0x13920
    .asciz "Time: %d\n"
    .balign 4
lbl_0001392C:
    # 0x1392C
    .asciz "stage"
    .balign 4
lbl_00013934:
    # 0x13934
    .asciz "minigame"
    .balign 4
    .4byte lbl_00010C60
    .4byte lbl_000132C8
    .4byte lbl_0001392C
    .4byte lbl_00010CD4
    .4byte lbl_00013934
    .4byte lbl_0001359C
lbl_00013958:
    # 0x13958
    .asciz "commend"
lbl_00013960:
    # 0x13960
    .asciz "roll"
    .balign 4
lbl_00013968:
    # 0x13968
    .asciz "pattern"
lbl_00013970:
    # 0x13970
    .asciz "bg_rac"
    .balign 4
lbl_00013978:
    # 0x13978
    .asciz "bg_fig"
    .balign 4
lbl_00013980:
    # 0x13980
    .asciz "bg_pil"
    .balign 4
lbl_00013988:
    # 0x13988
    .asciz "bg_gol"
    .balign 4
lbl_00013990:
    # 0x13990
    .asciz "bg_bow"
    .balign 4
lbl_00013998:
    # 0x13998
    .asciz "bg_bil"
    .balign 4
lbl_000139A0:
    # 0x139A0
    .asciz "bg_mst"
    .balign 4
lbl_000139A8:
    # 0x139A8
    .asciz "bg_ending"
    .balign 4
lbl_000139B4:
    # 0x139B4
    .asciz "st039"
    .balign 4
lbl_000139BC:
    # 0x139BC
    .asciz "st111"
    .balign 4
lbl_000139C4:
    # 0x139C4
    .asciz "st112"
    .balign 4
lbl_000139CC:
    # 0x139CC
    .asciz "st113"
    .balign 4
lbl_000139D4:
    # 0x139D4
    .asciz "st114"
    .balign 4
lbl_000139DC:
    # 0x139DC
    .asciz "st115"
    .balign 4
lbl_000139E4:
    # 0x139E4
    .asciz "st116"
    .balign 4
lbl_000139EC:
    # 0x139EC
    .asciz "st117"
    .balign 4
lbl_000139F4:
    # 0x139F4
    .asciz "st118"
    .balign 4
lbl_000139FC:
    # 0x139FC
    .asciz "st119"
    .balign 4
lbl_00013A04:
    # 0x13A04
    .asciz "st120"
    .balign 4
lbl_00013A0C:
    # 0x13A0C
    .asciz "gor_h"
    .balign 4
lbl_00013A14:
    # 0x13A14
    .asciz "gor_l"
    .balign 4
lbl_00013A1C:
    # 0x13A1C
    .4byte 0x00000000
    .4byte lbl_000132C0
    .4byte lbl_00010C60
    .4byte 0x00000000
    .4byte lbl_000132C0
    .4byte lbl_00013958
    .4byte 0x00000000
    .4byte lbl_000132C0
    .4byte lbl_00013960
    .4byte 0x00000000
    .4byte lbl_000132C0
    .4byte lbl_00013968
    .4byte 0x00000001
    .4byte lbl_000132C8
    .4byte lbl_000132CC
    .4byte 0x00000001
    .4byte lbl_000132C8
    .4byte lbl_000132D4
    .4byte 0x00000001
    .4byte lbl_000132C8
    .4byte lbl_000132DC
    .4byte 0x00000001
    .4byte lbl_000132C8
    .4byte lbl_000132E4
    .4byte 0x00000001
    .4byte lbl_000132C8
    .4byte lbl_000132EC
    .4byte 0x00000001
    .4byte lbl_000132C8
    .4byte lbl_000132F4
    .4byte 0x00000001
    .4byte lbl_000132C8
    .4byte lbl_000132FC
    .4byte 0x00000001
    .4byte lbl_000132C8
    .4byte lbl_00013304
    .4byte 0x00000001
    .4byte lbl_000132C8
    .4byte lbl_0001330C
    .4byte 0x00000001
    .4byte lbl_000132C8
    .4byte lbl_00013970
    .4byte 0x00000001
    .4byte lbl_000132C8
    .4byte lbl_00013978
    .4byte 0x00000001
    .4byte lbl_000132C8
    .4byte lbl_00013980
    .4byte 0x00000001
    .4byte lbl_000132C8
    .4byte lbl_00013988
    .4byte 0x00000001
    .4byte lbl_000132C8
    .4byte lbl_00013990
    .4byte 0x00000001
    .4byte lbl_000132C8
    .4byte lbl_00013998
    .4byte 0x00000001
    .4byte lbl_000132C8
    .4byte lbl_000139A0
    .4byte 0x00000001
    .4byte lbl_000132C8
    .4byte lbl_000139A8
    .4byte 0x00000002
    .4byte lbl_00010CFC
    .4byte lbl_00010CFC
    .4byte 0x00000002
    .4byte lbl_00010D28
    .4byte lbl_00010D28
    .4byte 0x00000002
    .4byte lbl_00010D54
    .4byte lbl_00010D54
    .4byte 0x00000002
    .4byte lbl_00010D80
    .4byte lbl_00010D80
    .4byte 0x00000002
    .4byte lbl_00010DAC
    .4byte lbl_00010DAC
    .4byte 0x00000002
    .4byte lbl_00010DD8
    .4byte lbl_00010DD8
    .4byte 0x00000002
    .4byte lbl_00010E04
    .4byte lbl_00010E04
    .4byte 0x00000002
    .4byte lbl_00010E30
    .4byte lbl_00010E30
    .4byte 0x00000002
    .4byte lbl_00010E5C
    .4byte lbl_00010E5C
    .4byte 0x00000002
    .4byte lbl_00010E88
    .4byte lbl_00010E88
    .4byte 0x00000002
    .4byte lbl_00010EB4
    .4byte lbl_00010EB4
    .4byte 0x00000002
    .4byte lbl_00010EE0
    .4byte lbl_00010EE0
    .4byte 0x00000002
    .4byte lbl_00010F0C
    .4byte lbl_00010F0C
    .4byte 0x00000002
    .4byte lbl_00010F38
    .4byte lbl_00010F38
    .4byte 0x00000002
    .4byte lbl_00010F64
    .4byte lbl_00010F64
    .4byte 0x00000002
    .4byte lbl_00010F90
    .4byte lbl_00010F90
    .4byte 0x00000002
    .4byte lbl_00010FBC
    .4byte lbl_00010FBC
    .4byte 0x00000002
    .4byte lbl_00010FE8
    .4byte lbl_00010FE8
    .4byte 0x00000002
    .4byte lbl_00011014
    .4byte lbl_00011014
    .4byte 0x00000002
    .4byte lbl_00011040
    .4byte lbl_00011040
    .4byte 0x00000002
    .4byte lbl_0001106C
    .4byte lbl_0001106C
    .4byte 0x00000002
    .4byte lbl_00011098
    .4byte lbl_00011098
    .4byte 0x00000002
    .4byte lbl_000110C4
    .4byte lbl_000110C4
    .4byte 0x00000002
    .4byte lbl_000110F0
    .4byte lbl_000110F0
    .4byte 0x00000002
    .4byte lbl_0001111C
    .4byte lbl_0001111C
    .4byte 0x00000002
    .4byte lbl_00011148
    .4byte lbl_00011148
    .4byte 0x00000002
    .4byte lbl_00011174
    .4byte lbl_00011174
    .4byte 0x00000002
    .4byte lbl_000111A0
    .4byte lbl_000111A0
    .4byte 0x00000002
    .4byte lbl_000111CC
    .4byte lbl_000111CC
    .4byte 0x00000002
    .4byte lbl_000111F8
    .4byte lbl_000111F8
    .4byte 0x00000002
    .4byte lbl_00011224
    .4byte lbl_00011224
    .4byte 0x00000002
    .4byte lbl_00011250
    .4byte lbl_00011250
    .4byte 0x00000002
    .4byte lbl_0001127C
    .4byte lbl_0001127C
    .4byte 0x00000002
    .4byte lbl_000112A8
    .4byte lbl_000112A8
    .4byte 0x00000002
    .4byte lbl_000112D4
    .4byte lbl_000112D4
    .4byte 0x00000002
    .4byte lbl_00011300
    .4byte lbl_00011300
    .4byte 0x00000002
    .4byte lbl_0001132C
    .4byte lbl_0001132C
    .4byte 0x00000002
    .4byte lbl_00011358
    .4byte lbl_00011358
    .4byte 0x00000002
    .4byte lbl_000139B4
    .4byte lbl_000139B4
    .4byte 0x00000002
    .4byte lbl_000113B0
    .4byte lbl_000113B0
    .4byte 0x00000002
    .4byte lbl_000113DC
    .4byte lbl_000113DC
    .4byte 0x00000002
    .4byte lbl_00011408
    .4byte lbl_00011408
    .4byte 0x00000002
    .4byte lbl_00011434
    .4byte lbl_00011434
    .4byte 0x00000002
    .4byte lbl_00011460
    .4byte lbl_00011460
    .4byte 0x00000002
    .4byte lbl_0001148C
    .4byte lbl_0001148C
    .4byte 0x00000002
    .4byte lbl_000114B8
    .4byte lbl_000114B8
    .4byte 0x00000002
    .4byte lbl_000114E4
    .4byte lbl_000114E4
    .4byte 0x00000002
    .4byte lbl_00011510
    .4byte lbl_00011510
    .4byte 0x00000002
    .4byte lbl_00011384
    .4byte lbl_00011384
    .4byte 0x00000002
    .4byte lbl_0001153C
    .4byte lbl_0001153C
    .4byte 0x00000002
    .4byte lbl_00011568
    .4byte lbl_00011568
    .4byte 0x00000002
    .4byte lbl_00011594
    .4byte lbl_00011594
    .4byte 0x00000002
    .4byte lbl_000115C0
    .4byte lbl_000115C0
    .4byte 0x00000002
    .4byte lbl_000115EC
    .4byte lbl_000115EC
    .4byte 0x00000002
    .4byte lbl_00011618
    .4byte lbl_00011618
    .4byte 0x00000002
    .4byte lbl_00011644
    .4byte lbl_00011644
    .4byte 0x00000002
    .4byte lbl_00011670
    .4byte lbl_00011670
    .4byte 0x00000002
    .4byte lbl_0001169C
    .4byte lbl_0001169C
    .4byte 0x00000002
    .4byte lbl_000116C8
    .4byte lbl_000116C8
    .4byte 0x00000002
    .4byte lbl_000116F4
    .4byte lbl_000116F4
    .4byte 0x00000002
    .4byte lbl_00011720
    .4byte lbl_00011720
    .4byte 0x00000002
    .4byte lbl_0001174C
    .4byte lbl_0001174C
    .4byte 0x00000002
    .4byte lbl_00011778
    .4byte lbl_00011778
    .4byte 0x00000002
    .4byte lbl_000117A4
    .4byte lbl_000117A4
    .4byte 0x00000002
    .4byte lbl_000117D0
    .4byte lbl_000117D0
    .4byte 0x00000002
    .4byte lbl_000117FC
    .4byte lbl_000117FC
    .4byte 0x00000002
    .4byte lbl_00011828
    .4byte lbl_00011828
    .4byte 0x00000002
    .4byte lbl_00011854
    .4byte lbl_00011854
    .4byte 0x00000002
    .4byte lbl_00011880
    .4byte lbl_00011880
    .4byte 0x00000002
    .4byte lbl_000118AC
    .4byte lbl_000118AC
    .4byte 0x00000002
    .4byte lbl_000118D8
    .4byte lbl_000118D8
    .4byte 0x00000002
    .4byte lbl_00011904
    .4byte lbl_00011904
    .4byte 0x00000002
    .4byte lbl_00011930
    .4byte lbl_00011930
    .4byte 0x00000002
    .4byte lbl_0001195C
    .4byte lbl_0001195C
    .4byte 0x00000002
    .4byte lbl_00011988
    .4byte lbl_00011988
    .4byte 0x00000002
    .4byte lbl_000119B4
    .4byte lbl_000119B4
    .4byte 0x00000002
    .4byte lbl_000119E0
    .4byte lbl_000119E0
    .4byte 0x00000002
    .4byte lbl_00011A0C
    .4byte lbl_00011A0C
    .4byte 0x00000002
    .4byte lbl_00011A38
    .4byte lbl_00011A38
    .4byte 0x00000002
    .4byte lbl_00011A64
    .4byte lbl_00011A64
    .4byte 0x00000002
    .4byte lbl_00011A90
    .4byte lbl_00011A90
    .4byte 0x00000002
    .4byte lbl_00011ABC
    .4byte lbl_00011ABC
    .4byte 0x00000002
    .4byte lbl_00011AE8
    .4byte lbl_00011AE8
    .4byte 0x00000002
    .4byte lbl_00011B14
    .4byte lbl_00011B14
    .4byte 0x00000002
    .4byte lbl_00011B40
    .4byte lbl_00011B40
    .4byte 0x00000002
    .4byte lbl_00011B6C
    .4byte lbl_00011B6C
    .4byte 0x00000002
    .4byte lbl_00011B98
    .4byte lbl_00011B98
    .4byte 0x00000002
    .4byte lbl_00011BC4
    .4byte lbl_00011BC4
    .4byte 0x00000002
    .4byte lbl_00011BF0
    .4byte lbl_00011BF0
    .4byte 0x00000002
    .4byte lbl_00011C1C
    .4byte lbl_00011C1C
    .4byte 0x00000002
    .4byte lbl_00011C48
    .4byte lbl_00011C48
    .4byte 0x00000002
    .4byte lbl_00011C74
    .4byte lbl_00011C74
    .4byte 0x00000002
    .4byte lbl_00011CA0
    .4byte lbl_00011CA0
    .4byte 0x00000002
    .4byte lbl_00011CCC
    .4byte lbl_00011CCC
    .4byte 0x00000002
    .4byte lbl_00011CF8
    .4byte lbl_00011CF8
    .4byte 0x00000002
    .4byte lbl_00011D24
    .4byte lbl_00011D24
    .4byte 0x00000002
    .4byte lbl_00011D50
    .4byte lbl_00011D50
    .4byte 0x00000002
    .4byte lbl_00011D7C
    .4byte lbl_00011D7C
    .4byte 0x00000002
    .4byte lbl_00011DA8
    .4byte lbl_00011DA8
    .4byte 0x00000002
    .4byte lbl_00011DD4
    .4byte lbl_00011DD4
    .4byte 0x00000002
    .4byte lbl_00011E00
    .4byte lbl_00011E00
    .4byte 0x00000002
    .4byte lbl_00011E2C
    .4byte lbl_00011E2C
    .4byte 0x00000002
    .4byte lbl_00011E58
    .4byte lbl_00011E58
    .4byte 0x00000002
    .4byte lbl_00011E84
    .4byte lbl_00011E84
    .4byte 0x00000002
    .4byte lbl_00011EB0
    .4byte lbl_00011EB0
    .4byte 0x00000002
    .4byte lbl_00011EDC
    .4byte lbl_00011EDC
    .4byte 0x00000002
    .4byte lbl_00011F08
    .4byte lbl_00011F08
    .4byte 0x00000002
    .4byte lbl_00011F34
    .4byte lbl_00011F34
    .4byte 0x00000002
    .4byte lbl_00011F60
    .4byte lbl_00011F60
    .4byte 0x00000002
    .4byte lbl_00011F8C
    .4byte lbl_00011F8C
    .4byte 0x00000002
    .4byte lbl_000139BC
    .4byte lbl_000139BC
    .4byte 0x00000002
    .4byte lbl_000139C4
    .4byte lbl_000139C4
    .4byte 0x00000002
    .4byte lbl_000139CC
    .4byte lbl_000139CC
    .4byte 0x00000002
    .4byte lbl_000139D4
    .4byte lbl_000139D4
    .4byte 0x00000002
    .4byte lbl_000139DC
    .4byte lbl_000139DC
    .4byte 0x00000002
    .4byte lbl_000139E4
    .4byte lbl_000139E4
    .4byte 0x00000002
    .4byte lbl_000139EC
    .4byte lbl_000139EC
    .4byte 0x00000002
    .4byte lbl_000139F4
    .4byte lbl_000139F4
    .4byte 0x00000002
    .4byte lbl_000139FC
    .4byte lbl_000139FC
    .4byte 0x00000002
    .4byte lbl_00013A04
    .4byte lbl_00013A04
    .4byte 0x00000002
    .4byte lbl_00011FB8
    .4byte lbl_00011FB8
    .4byte 0x00000002
    .4byte lbl_00011FE4
    .4byte lbl_00011FE4
    .4byte 0x00000002
    .4byte lbl_00012010
    .4byte lbl_00012010
    .4byte 0x00000002
    .4byte lbl_0001203C
    .4byte lbl_0001203C
    .4byte 0x00000002
    .4byte lbl_00012068
    .4byte lbl_00012068
    .4byte 0x00000002
    .4byte lbl_00012094
    .4byte lbl_00012094
    .4byte 0x00000002
    .4byte lbl_000120C0
    .4byte lbl_000120C0
    .4byte 0x00000002
    .4byte lbl_000120EC
    .4byte lbl_000120EC
    .4byte 0x00000002
    .4byte lbl_00012118
    .4byte lbl_00012118
    .4byte 0x00000002
    .4byte lbl_00012144
    .4byte lbl_00012144
    .4byte 0x00000002
    .4byte lbl_00013314
    .4byte lbl_00013314
    .4byte 0x00000002
    .4byte lbl_0001331C
    .4byte lbl_0001331C
    .4byte 0x00000002
    .4byte lbl_00013324
    .4byte lbl_00013324
    .4byte 0x00000002
    .4byte lbl_00012170
    .4byte lbl_00012170
    .4byte 0x00000002
    .4byte lbl_0001332C
    .4byte lbl_0001332C
    .4byte 0x00000002
    .4byte lbl_00013334
    .4byte lbl_00013334
    .4byte 0x00000002
    .4byte lbl_0001333C
    .4byte lbl_0001333C
    .4byte 0x00000002
    .4byte lbl_00013344
    .4byte lbl_00013344
    .4byte 0x00000002
    .4byte lbl_0001334C
    .4byte lbl_0001334C
    .4byte 0x00000002
    .4byte lbl_00013354
    .4byte lbl_00013354
    .4byte 0x00000002
    .4byte lbl_0001335C
    .4byte lbl_0001335C
    .4byte 0x00000002
    .4byte lbl_00013364
    .4byte lbl_00013364
    .4byte 0x00000002
    .4byte lbl_0001336C
    .4byte lbl_0001336C
    .4byte 0x00000002
    .4byte lbl_00013374
    .4byte lbl_00013374
    .4byte 0x00000002
    .4byte lbl_0001337C
    .4byte lbl_0001337C
    .4byte 0x00000002
    .4byte lbl_00013384
    .4byte lbl_00013384
    .4byte 0x00000002
    .4byte lbl_0001338C
    .4byte lbl_0001338C
    .4byte 0x00000002
    .4byte lbl_00013394
    .4byte lbl_00013394
    .4byte 0x00000002
    .4byte lbl_0001339C
    .4byte lbl_0001339C
    .4byte 0x00000002
    .4byte lbl_000133A4
    .4byte lbl_000133A4
    .4byte 0x00000002
    .4byte lbl_000133AC
    .4byte lbl_000133AC
    .4byte 0x00000002
    .4byte lbl_000133B4
    .4byte lbl_000133B4
    .4byte 0x00000002
    .4byte lbl_000133BC
    .4byte lbl_000133BC
    .4byte 0x00000002
    .4byte lbl_000133C4
    .4byte lbl_000133C4
    .4byte 0x00000002
    .4byte lbl_000133CC
    .4byte lbl_000133CC
    .4byte 0x00000002
    .4byte lbl_000133D4
    .4byte lbl_000133D4
    .4byte 0x00000002
    .4byte lbl_000133DC
    .4byte lbl_000133DC
    .4byte 0x00000002
    .4byte lbl_000133E4
    .4byte lbl_000133E4
    .4byte 0x00000002
    .4byte lbl_000133EC
    .4byte lbl_000133EC
    .4byte 0x00000002
    .4byte lbl_000133F4
    .4byte lbl_000133F4
    .4byte 0x00000002
    .4byte lbl_000133FC
    .4byte lbl_000133FC
    .4byte 0x00000002
    .4byte lbl_00013404
    .4byte lbl_00013404
    .4byte 0x00000002
    .4byte lbl_0001340C
    .4byte lbl_0001340C
    .4byte 0x00000002
    .4byte lbl_00013414
    .4byte lbl_00013414
    .4byte 0x00000002
    .4byte lbl_0001341C
    .4byte lbl_0001341C
    .4byte 0x00000002
    .4byte lbl_00013424
    .4byte lbl_00013424
    .4byte 0x00000002
    .4byte lbl_0001342C
    .4byte lbl_0001342C
    .4byte 0x00000002
    .4byte lbl_00013434
    .4byte lbl_00013434
    .4byte 0x00000002
    .4byte lbl_0001343C
    .4byte lbl_0001343C
    .4byte 0x00000002
    .4byte lbl_00013444
    .4byte lbl_00013444
    .4byte 0x00000002
    .4byte lbl_0001344C
    .4byte lbl_0001344C
    .4byte 0x00000002
    .4byte lbl_00013454
    .4byte lbl_00013454
    .4byte 0x00000002
    .4byte lbl_0001345C
    .4byte lbl_0001345C
    .4byte 0x00000002
    .4byte lbl_00013464
    .4byte lbl_00013464
    .4byte 0x00000002
    .4byte lbl_0001346C
    .4byte lbl_0001346C
    .4byte 0x00000002
    .4byte lbl_00013474
    .4byte lbl_00013474
    .4byte 0x00000002
    .4byte lbl_0001347C
    .4byte lbl_0001347C
    .4byte 0x00000002
    .4byte lbl_00013484
    .4byte lbl_00013484
    .4byte 0x00000002
    .4byte lbl_0001348C
    .4byte lbl_0001348C
    .4byte 0x00000002
    .4byte lbl_00013494
    .4byte lbl_00013494
    .4byte 0x00000002
    .4byte lbl_0001349C
    .4byte lbl_0001349C
    .4byte 0x00000002
    .4byte lbl_000134A4
    .4byte lbl_000134A4
    .4byte 0x00000002
    .4byte lbl_000134AC
    .4byte lbl_000134AC
    .4byte 0x00000002
    .4byte lbl_000134B4
    .4byte lbl_000134B4
    .4byte 0x00000002
    .4byte lbl_000134BC
    .4byte lbl_000134BC
    .4byte 0x00000002
    .4byte lbl_000134C4
    .4byte lbl_000134C4
    .4byte 0x00000002
    .4byte lbl_000134CC
    .4byte lbl_000134CC
    .4byte 0x00000002
    .4byte lbl_000134D4
    .4byte lbl_000134D4
    .4byte 0x00000002
    .4byte lbl_000134DC
    .4byte lbl_000134DC
    .4byte 0x00000002
    .4byte lbl_00013494
    .4byte lbl_000134E4
    .4byte 0x00000002
    .4byte lbl_000134EC
    .4byte lbl_000134EC
    .4byte 0x00000002
    .4byte lbl_000134F4
    .4byte lbl_000134F4
    .4byte 0x00000002
    .4byte lbl_000134FC
    .4byte lbl_000134FC
    .4byte 0x00000002
    .4byte lbl_00013504
    .4byte lbl_00013504
    .4byte 0x00000002
    .4byte lbl_0001350C
    .4byte lbl_0001350C
    .4byte 0x00000002
    .4byte lbl_00013514
    .4byte lbl_00013514
    .4byte 0x00000002
    .4byte lbl_0001351C
    .4byte lbl_0001351C
    .4byte 0x00000002
    .4byte lbl_00013524
    .4byte lbl_00013524
    .4byte 0x00000002
    .4byte lbl_0001352C
    .4byte lbl_0001352C
    .4byte 0x00000002
    .4byte lbl_00013534
    .4byte lbl_00013534
    .4byte 0x00000003
    .4byte lbl_0001353C
    .4byte lbl_0001353C
    .4byte 0x00000003
    .4byte lbl_00013544
    .4byte lbl_00013544
    .4byte 0x00000003
    .4byte lbl_0001354C
    .4byte lbl_0001354C
    .4byte 0x00000003
    .4byte lbl_00013554
    .4byte lbl_00013554
    .4byte 0x00000003
    .4byte lbl_0001355C
    .4byte lbl_0001355C
    .4byte 0x00000003
    .4byte lbl_00013564
    .4byte lbl_00013564
    .4byte 0x00000003
    .4byte lbl_00013A0C
    .4byte lbl_00013A0C
    .4byte 0x00000003
    .4byte lbl_00013A14
    .4byte lbl_00013A14
    .4byte 0x00000004
    .4byte lbl_000132C0
    .4byte lbl_0001356C
    .4byte 0x00000004
    .4byte lbl_000132C0
    .4byte lbl_00013574
    .4byte 0x00000004
    .4byte lbl_000132C0
    .4byte lbl_0001357C
    .4byte 0x00000004
    .4byte lbl_000132C0
    .4byte lbl_00013584
    .4byte 0x00000004
    .4byte lbl_000132C0
    .4byte lbl_0001358C
    .4byte 0x00000004
    .4byte lbl_000132C0
    .4byte lbl_00013594
    .4byte 0x00000005
    .4byte lbl_000132C0
    .4byte lbl_0001359C
    .asciz "[ Category ]"
    .balign 4
    .asciz "A    : Select\n"
    .balign 4
    .asciz "B    : Cancel\n"
    .balign 4
    .4byte 0x5041441E
    .4byte 0x1F3A2043
    .asciz "ategory Select\n"
    .asciz "B    : Category Select\n"
    .4byte 0x5041441D
    .4byte 0x1C3A204D
    .asciz "odel Select"
    .asciz "Z  : "
    .balign 4
    .asciz "Fix Scale"
    .balign 4
    .asciz "Z  : Variable Scale"
    .asciz "    All Disp Mode\n"
    .balign 4
    .asciz "X+A: Normal Mode"
    .balign 4
    .asciz "X+A: All Disp Mode"
    .balign 4
    .4byte 0x252D3873
    .4byte 0x1C000000
    .asciz "%-8s"
    .balign 4
    .4byte 0x1E000000
    .4byte 0x1F000000
    .asciz " no data."
    .balign 4
    .asciz " [%d/%d] %-8s"
    .balign 4
lbl_00014638:
    # 0x14638
    .asciz "rad: %-3.6f     "
    .balign 4
    .asciz "cannot OSAlloc\n"
    .asciz "pattern.tpl"
    .asciz "pattern.gma"
    .asciz "speed: "
    .4byte 0x25640000
    .asciz "%s * %2d\n"
    .balign 4
lbl_0001468C:
    # 0x1468C
    .asciz "ROMFONT TEST\n"
    .balign 4
lbl_0001469C:
    # 0x1469C
    .asciz "code: %04X\n"
lbl_000146A8:
    # 0x146A8
    .asciz "COMPETITION"
lbl_000146B4:
    # 0x146B4
    .asciz "COMPETITION ICON"
    .balign 4
lbl_000146C8:
    # 0x146C8
    .asciz "PRACTICE"
    .balign 4
lbl_000146D4:
    # 0x146D4
    .asciz "RACE REGULAR"
    .balign 4
lbl_000146E4:
    # 0x146E4
    .asciz "RECE BIG"
    .balign 4
lbl_000146F0:
    # 0x146F0
    .asciz "FIGHT"
    .balign 4
lbl_000146F8:
    # 0x146F8
    .asciz "FIGHT ICON"
    .balign 4
lbl_00014704:
    # 0x14704
    .asciz "BANNER"
    .balign 4
lbl_0001470C:
    # 0x1470C
    .asciz "UNDER"
    .balign 4
lbl_00014714:
    # 0x14714
    .4byte lbl_000146A8
    .4byte 0x00C00084
    .4byte 0x00000000
    .4byte lbl_000146B4
    .4byte 0x0026001A
    .4byte 0x00000000
    .4byte lbl_000146C8
    .4byte 0x00C000B2
    .4byte 0x00000000
    .4byte lbl_000146D4
    .4byte 0x00600044
    .4byte 0x00000000
    .4byte lbl_000146E4
    .4byte 0x00C8008C
    .4byte 0x00000000
    .4byte lbl_000146F0
    .4byte 0x00AC0078
    .4byte 0x00000000
    .4byte lbl_000146F8
    .4byte 0x003C002A
    .4byte 0x00000000
    .4byte lbl_00014704
    .4byte 0x00600020
    .4byte 0x00000000
    .4byte lbl_0001470C
    .4byte 0x008C008C
    .4byte 0x00000001
    .asciz "Cannot OSAlloc\n"
    .asciz "/p006/prj006/youske/preview/%dx%d/st%03d.gct"
    .balign 4
    .asciz "Cannot USBopen\n"
    .asciz "PRREND TEST"
    .asciz "[ %3dx%3d ] %s"
    .balign 4
lbl_000147EC:
    # 0x147EC
    .asciz "preview/%dx%d.tpl"
    .balign 4
    .asciz " [ %3d / 200 ]"
    .balign 4
lbl_00014810:
    # 0x14810
    .4byte _prolog + 0x8FE8
    .4byte _prolog + 0x9254
    .4byte _prolog + 0x9254
    .4byte _prolog + 0x9254
    .4byte _prolog + 0x8FF0
    .4byte _prolog + 0x9254
    .4byte _prolog + 0x8FF8
    .4byte _prolog + 0x9254
    .4byte _prolog + 0x9000
    .4byte _prolog + 0x9254
    .4byte _prolog + 0x9104
    .4byte _prolog + 0x9254
    .4byte _prolog + 0x912C
    .4byte _prolog + 0x9254
    .4byte _prolog + 0x9134
    .4byte _prolog + 0x9254
    .4byte _prolog + 0x913C
    .4byte _prolog + 0x9254
    .4byte _prolog + 0x91F0
    .4byte _prolog + 0x9254
    .4byte _prolog + 0x91F8
    .4byte _prolog + 0x9254
    .4byte _prolog + 0x9200
    .4byte _prolog + 0x9254
    .4byte _prolog + 0x9208
    .4byte _prolog + 0x9254
    .4byte _prolog + 0x9254
    .4byte _prolog + 0x9228
    .4byte _prolog + 0x9254
    .4byte _prolog + 0x9230
    .4byte _prolog + 0x9254
    .4byte _prolog + 0x9238
    .4byte _prolog + 0x9254
    .4byte _prolog + 0x9240
    .4byte _prolog + 0x9254
    .4byte _prolog + 0x9248
    .4byte _prolog + 0x9254
    .4byte _prolog + 0x9250
lbl_000148A8:
    # 0x148A8
    .asciz "FOCUS TEST\n"
    .asciz "MASK NUM:%d\n"
    .balign 4
    .asciz "BLUR    :%7.3f\n"
    .4byte 0x00000000
lbl_000148D8:
    # 0x148D8
    .asciz "takatest.tpl"
    .balign 4
lbl_000148E8:
    # 0x148E8
    .asciz "Move"
    .balign 4
lbl_000148F0:
    # 0x148F0
    .asciz "Suspend"
lbl_000148F8:
    # 0x148F8
    .asciz "Special"
lbl_00014900:
    # 0x14900
    .asciz "Drop"
    .balign 4
lbl_00014908:
    # 0x14908
    .asciz "Coli"
    .balign 4
lbl_00014910:
    # 0x14910
    .asciz "Goal"
    .balign 4
lbl_00014918:
    # 0x14918
    .asciz "Advertise"
    .balign 4
lbl_00014924:
    # 0x14924
    .asciz "Ending"
    .balign 4
lbl_0001492C:
    # 0x1492C
    .asciz "Selector"
    .balign 4
lbl_00014938:
    # 0x14938
    .asciz "Lose"
    .balign 4
lbl_00014940:
    # 0x14940
    .4byte 0x45746300
lbl_00014944:
    # 0x14944
    .asciz "Race&Fight"
    .balign 4
lbl_00014950:
    # 0x14950
    .asciz "Pilot"
    .balign 4
lbl_00014958:
    # 0x14958
    .asciz "Golf"
    .balign 4
lbl_00014960:
    # 0x14960
    .asciz "Bowling"
lbl_00014968:
    # 0x14968
    .asciz "Billiard"
    .balign 4
lbl_00014974:
    # 0x14974
    .4byte lbl_000148E8
    .4byte lbl_000148F0
    .4byte lbl_000148F8
    .4byte lbl_00014900
    .4byte lbl_00014908
    .4byte lbl_00014910
    .4byte lbl_00014918
    .4byte lbl_00014924
    .4byte lbl_0001492C
    .4byte lbl_00014938
    .4byte lbl_00014940
    .4byte lbl_00014944
    .4byte lbl_00014950
    .4byte lbl_00014958
    .4byte lbl_00014960
    .4byte lbl_00014968
    .4byte 0x00000000
lbl_000149B8:
    # 0x149B8
    .asciz "Very Snail"
    .balign 4
lbl_000149C4:
    # 0x149C4
    .asciz "Snail"
    .balign 4
lbl_000149CC:
    # 0x149CC
    .asciz "Very Slow"
    .balign 4
lbl_000149D8:
    # 0x149D8
    .asciz "More Slow"
    .balign 4
lbl_000149E4:
    # 0x149E4
    .asciz "Slow Walk"
    .balign 4
lbl_000149F0:
    # 0x149F0
    .asciz "Walk"
    .balign 4
lbl_000149F8:
    # 0x149F8
    .asciz "Speedy Walk"
lbl_00014A04:
    # 0x14A04
    .asciz "Fast Walk"
    .balign 4
lbl_00014A10:
    # 0x14A10
    .asciz "Harried Step"
    .balign 4
lbl_00014A20:
    # 0x14A20
    .4byte 0x52756E00
lbl_00014A24:
    # 0x14A24
    .asciz "Harried Run"
lbl_00014A30:
    # 0x14A30
    .asciz "Fast Run"
    .balign 4
lbl_00014A3C:
    # 0x14A3C
    .asciz "All One's Power"
lbl_00014A4C:
    # 0x14A4C
    .asciz "Back Step"
    .balign 4
lbl_00014A58:
    # 0x14A58
    .4byte lbl_000149B8
    .4byte lbl_000149C4
    .4byte lbl_000149CC
    .4byte lbl_000149D8
    .4byte lbl_000149E4
    .4byte lbl_000149F0
    .4byte lbl_000149F8
    .4byte lbl_00014A04
    .4byte lbl_00014A10
    .4byte lbl_00014A20
    .4byte lbl_00014A24
    .4byte lbl_00014A30
    .4byte lbl_00014A3C
    .4byte lbl_00014A4C
    .4byte 0x00000000
lbl_00014A94:
    # 0x14A94
    .asciz "Blink"
    .balign 4
lbl_00014A9C:
    # 0x14A9C
    .asciz "Looking"
lbl_00014AA4:
    # 0x14AA4
    .asciz "Appeal"
    .balign 4
lbl_00014AAC:
    # 0x14AAC
    .asciz "Sulk"
    .balign 4
lbl_00014AB4:
    # 0x14AB4
    .asciz "Sulk Sit"
    .balign 4
lbl_00014AC0:
    # 0x14AC0
    .asciz "Continue?"
    .balign 4
lbl_00014ACC:
    # 0x14ACC
    .4byte lbl_00014A94
    .4byte lbl_00014A9C
    .4byte lbl_00014AA4
    .4byte lbl_00014AAC
    .4byte lbl_00014AB4
    .4byte lbl_00014AC0
    .4byte 0x00000000
lbl_00014AE8:
    # 0x14AE8
    .asciz "Caution Front Stop"
    .balign 4
lbl_00014AFC:
    # 0x14AFC
    .asciz "Caution Front Walk"
    .balign 4
lbl_00014B10:
    # 0x14B10
    .asciz "Caution Front Run"
    .balign 4
lbl_00014B24:
    # 0x14B24
    .asciz "Caution Back  Stop"
    .balign 4
lbl_00014B38:
    # 0x14B38
    .asciz "Caution Back  Walk"
    .balign 4
lbl_00014B4C:
    # 0x14B4C
    .asciz "Caution Back  Run"
    .balign 4
lbl_00014B60:
    # 0x14B60
    .asciz "Caution Left  Stop"
    .balign 4
lbl_00014B74:
    # 0x14B74
    .asciz "Caution Left  Walk"
    .balign 4
lbl_00014B88:
    # 0x14B88
    .asciz "Caution Left  Run"
    .balign 4
lbl_00014B9C:
    # 0x14B9C
    .asciz "Caution Right Stop"
    .balign 4
lbl_00014BB0:
    # 0x14BB0
    .asciz "Caution Right Walk"
    .balign 4
lbl_00014BC4:
    # 0x14BC4
    .asciz "Caution Right Run"
    .balign 4
lbl_00014BD8:
    # 0x14BD8
    .asciz "Start"
    .balign 4
lbl_00014BE0:
    # 0x14BE0
    .asciz "Continue Accept"
lbl_00014BF0:
    # 0x14BF0
    .asciz "Name Entry"
    .balign 4
lbl_00014BFC:
    # 0x14BFC
    .asciz "Bonus Stage"
lbl_00014C08:
    # 0x14C08
    .asciz "Continue GiveUp"
lbl_00014C18:
    # 0x14C18
    .4byte lbl_00014AE8
    .4byte lbl_00014AFC
    .4byte lbl_00014B10
    .4byte lbl_00014B24
    .4byte lbl_00014B38
    .4byte lbl_00014B4C
    .4byte lbl_00014B60
    .4byte lbl_00014B74
    .4byte lbl_00014B88
    .4byte lbl_00014B9C
    .4byte lbl_00014BB0
    .4byte lbl_00014BC4
    .4byte lbl_00014BD8
    .4byte lbl_00014BE0
    .4byte lbl_00014BF0
    .4byte lbl_00014BFC
    .4byte lbl_00014C08
    .4byte 0x00000000
lbl_00014C60:
    # 0x14C60
    .asciz "Standard Drop"
    .balign 4
lbl_00014C70:
    # 0x14C70
    .4byte lbl_00014C60
    .4byte 0x00000000
lbl_00014C78:
    # 0x14C78
    .asciz "Slowly Hit"
    .balign 4
lbl_00014C84:
    # 0x14C84
    .asciz "Normal Hit"
    .balign 4
lbl_00014C90:
    # 0x14C90
    .asciz "Hispeed Hit"
lbl_00014C9C:
    # 0x14C9C
    .asciz "Crash"
    .balign 4
lbl_00014CA4:
    # 0x14CA4
    .4byte lbl_00014C78
    .4byte lbl_00014C84
    .4byte lbl_00014C90
    .4byte lbl_00014C9C
    .4byte 0x00000000
lbl_00014CB8:
    # 0x14CB8
    .asciz "Rank 1 Loop"
lbl_00014CC4:
    # 0x14CC4
    .asciz "Rank 1"
    .balign 4
lbl_00014CCC:
    # 0x14CCC
    .asciz "Rank 2 Loop"
lbl_00014CD8:
    # 0x14CD8
    .asciz "Rank 2"
    .balign 4
lbl_00014CE0:
    # 0x14CE0
    .asciz "Rank 3 Loop"
lbl_00014CEC:
    # 0x14CEC
    .asciz "Rank 3"
    .balign 4
lbl_00014CF4:
    # 0x14CF4
    .asciz "Rank 4 Loop"
lbl_00014D00:
    # 0x14D00
    .asciz "Rank 4"
    .balign 4
lbl_00014D08:
    # 0x14D08
    .asciz "Rank 5 Loop"
lbl_00014D14:
    # 0x14D14
    .asciz "Rank 5"
    .balign 4
lbl_00014D1C:
    # 0x14D1C
    .asciz "Warp Loop"
    .balign 4
lbl_00014D28:
    # 0x14D28
    .asciz "Warp"
    .balign 4
lbl_00014D30:
    # 0x14D30
    .asciz "No Miss Clear"
    .balign 4
lbl_00014D40:
    # 0x14D40
    .4byte lbl_00014CB8
    .4byte lbl_00014CC4
    .4byte lbl_00014CCC
    .4byte lbl_00014CD8
    .4byte lbl_00014CE0
    .4byte lbl_00014CEC
    .4byte lbl_00014CF4
    .4byte lbl_00014D00
    .4byte lbl_00014D08
    .4byte lbl_00014D14
    .4byte lbl_00014D1C
    .4byte lbl_00014D28
    .4byte lbl_00014D30
    .4byte 0x00000000
lbl_00014D78:
    # 0x14D78
    .asciz "BLUESKY 00"
    .balign 4
lbl_00014D84:
    # 0x14D84
    .asciz "NIGHT 00"
    .balign 4
lbl_00014D90:
    # 0x14D90
    .asciz "ICE SAMUI START"
lbl_00014DA0:
    # 0x14DA0
    .asciz "ICE SAMUI LOOP"
    .balign 4
lbl_00014DB0:
    # 0x14DB0
    .asciz "ICE SAMUI & SLIP"
    .balign 4
lbl_00014DC4:
    # 0x14DC4
    .asciz "ICE STOP"
    .balign 4
lbl_00014DD0:
    # 0x14DD0
    .asciz "SABAKU WALK 00"
    .balign 4
lbl_00014DE0:
    # 0x14DE0
    .asciz "SABAKU WALK 01"
    .balign 4
lbl_00014DF0:
    # 0x14DF0
    .asciz "SABAKU SIT"
    .balign 4
lbl_00014DFC:
    # 0x14DFC
    .asciz "DRF WALK START"
    .balign 4
lbl_00014E0C:
    # 0x14E0C
    .asciz "DRF STOP"
    .balign 4
lbl_00014E18:
    # 0x14E18
    .asciz "DRF BIKKURI"
lbl_00014E24:
    # 0x14E24
    .asciz "BALL RUN"
    .balign 4
lbl_00014E30:
    # 0x14E30
    .asciz "SPACE"
    .balign 4
lbl_00014E38:
    # 0x14E38
    .asciz "tmp 2"
    .balign 4
lbl_00014E40:
    # 0x14E40
    .asciz "tmp 3"
    .balign 4
lbl_00014E48:
    # 0x14E48
    .4byte lbl_00014D78
    .4byte lbl_00014D84
    .4byte lbl_00014D90
    .4byte lbl_00014DA0
    .4byte lbl_00014DB0
    .4byte lbl_00014DC4
    .4byte lbl_00014DD0
    .4byte lbl_00014DE0
    .4byte lbl_00014DF0
    .4byte lbl_00014DFC
    .4byte lbl_00014E0C
    .4byte lbl_00014E18
    .4byte lbl_00014E24
    .4byte lbl_00014E30
    .4byte lbl_00014E38
    .4byte lbl_00014E40
    .4byte 0x00000000
lbl_00014E8C:
    # 0x14E8C
    .asciz "Stand"
    .balign 4
lbl_00014E94:
    # 0x14E94
    .asciz "Decide"
    .balign 4
lbl_00014E9C:
    # 0x14E9C
    .asciz "Start chara on"
    .balign 4
lbl_00014EAC:
    # 0x14EAC
    .asciz "Start chara off"
lbl_00014EBC:
    # 0x14EBC
    .asciz "Select"
    .balign 4
lbl_00014EC4:
    # 0x14EC4
    .asciz "No select"
    .balign 4
lbl_00014ED0:
    # 0x14ED0
    .4byte lbl_00014E8C
    .4byte lbl_00014E94
    .4byte lbl_00014E9C
    .4byte lbl_00014EAC
    .4byte lbl_00014EBC
    .4byte lbl_00014EC4
    .4byte 0x00000000
lbl_00014EEC:
    # 0x14EEC
    .asciz "Bonus Failed"
    .balign 4
lbl_00014EFC:
    # 0x14EFC
    .asciz "Time Over"
    .balign 4
lbl_00014F08:
    # 0x14F08
    .asciz "Battle Lose"
lbl_00014F14:
    # 0x14F14
    .asciz "Battle Lose2"
    .balign 4
lbl_00014F24:
    # 0x14F24
    .4byte lbl_00014EEC
    .4byte lbl_00014EFC
    .4byte lbl_00014F08
    .4byte lbl_00014F14
    .4byte lbl_00014938
    .4byte lbl_00014938
    .4byte 0x00000000
lbl_00014F40:
    # 0x14F40
    .asciz "Winner"
    .balign 4
lbl_00014F48:
    # 0x14F48
    .4byte 0x326E6400
lbl_00014F4C:
    # 0x14F4C
    .4byte 0x33726400
lbl_00014F50:
    # 0x14F50
    .4byte 0x34746800
lbl_00014F54:
    # 0x14F54
    .asciz "Self Attack"
lbl_00014F60:
    # 0x14F60
    .asciz "Winner2"
lbl_00014F68:
    # 0x14F68
    .asciz "2nd2"
    .balign 4
lbl_00014F70:
    # 0x14F70
    .asciz "3rd2"
    .balign 4
lbl_00014F78:
    # 0x14F78
    .asciz "4th2"
    .balign 4
lbl_00014F80:
    # 0x14F80
    .asciz "reserve5"
    .balign 4
lbl_00014F8C:
    # 0x14F8C
    .asciz "reserve6"
    .balign 4
lbl_00014F98:
    # 0x14F98
    .asciz "reserve7"
    .balign 4
lbl_00014FA4:
    # 0x14FA4
    .asciz "reserve8"
    .balign 4
lbl_00014FB0:
    # 0x14FB0
    .asciz "reserve9"
    .balign 4
lbl_00014FBC:
    # 0x14FBC
    .4byte lbl_00014F40
    .4byte lbl_00014F48
    .4byte lbl_00014F4C
    .4byte lbl_00014F50
    .4byte lbl_00014F54
    .4byte lbl_00014F60
    .4byte lbl_00014F68
    .4byte lbl_00014F70
    .4byte lbl_00014F78
    .4byte 0x00000000
    .4byte lbl_00014F80
    .4byte lbl_00014F8C
    .4byte lbl_00014F98
    .4byte lbl_00014FA4
    .4byte lbl_00014FB0
    .4byte 0x00000000
lbl_00014FFC:
    # 0x14FFC
    .asciz "crouching"
    .balign 4
lbl_00015008:
    # 0x15008
    .asciz "banana slip"
lbl_00015014:
    # 0x15014
    .asciz "caught down"
lbl_00015020:
    # 0x15020
    .asciz "burned"
    .balign 4
lbl_00015028:
    # 0x15028
    .asciz "benumbed"
    .balign 4
lbl_00015034:
    # 0x15034
    .asciz "first"
    .balign 4
lbl_0001503C:
    # 0x1503C
    .asciz "get set!"
    .balign 4
lbl_00015048:
    # 0x15048
    .asciz "banana slip loop"
    .balign 4
lbl_0001505C:
    # 0x1505C
    .asciz "caught down loop"
    .balign 4
lbl_00015070:
    # 0x15070
    .asciz "reserve1"
    .balign 4
lbl_0001507C:
    # 0x1507C
    .asciz "reserve2"
    .balign 4
lbl_00015088:
    # 0x15088
    .asciz "reserve3"
    .balign 4
lbl_00015094:
    # 0x15094
    .asciz "reserve4"
    .balign 4
lbl_000150A0:
    # 0x150A0
    .4byte lbl_00014FFC
    .4byte lbl_00015008
    .4byte lbl_00015014
    .4byte lbl_00015020
    .4byte lbl_00015028
    .4byte lbl_00015034
    .4byte lbl_00014F48
    .4byte lbl_00014F4C
    .4byte lbl_00014F50
    .4byte lbl_0001503C
    .4byte lbl_00015048
    .4byte lbl_0001505C
    .4byte 0x00000000
    .4byte lbl_00015070
    .4byte lbl_0001507C
    .4byte lbl_00015088
    .4byte lbl_00015094
    .4byte lbl_00014F80
    .4byte lbl_00014F8C
    .4byte lbl_00014F98
    .4byte lbl_00014FA4
    .4byte 0x00000000
lbl_000150F8:
    # 0x150F8
    .asciz "flight-flight"
    .balign 4
lbl_00015108:
    # 0x15108
    .asciz "flight-in ball"
    .balign 4
lbl_00015118:
    # 0x15118
    .asciz "TORNADO-flight"
    .balign 4
lbl_00015128:
    # 0x15128
    .asciz "TORNADO-in ball"
lbl_00015138:
    # 0x15138
    .asciz "BOM hit-flight"
    .balign 4
lbl_00015148:
    # 0x15148
    .asciz "BOM hit-in ball"
lbl_00015158:
    # 0x15158
    .asciz "BOM_falldown"
    .balign 4
lbl_00015168:
    # 0x15168
    .asciz "BOM ball falldown"
    .balign 4
lbl_0001517C:
    # 0x1517C
    .asciz "flight-flight-L"
lbl_0001518C:
    # 0x1518C
    .asciz "flight-flight-R"
lbl_0001519C:
    # 0x1519C
    .asciz "reserve10"
    .balign 4
lbl_000151A8:
    # 0x151A8
    .asciz "reserve11"
    .balign 4
lbl_000151B4:
    # 0x151B4
    .asciz "reserve12"
    .balign 4
lbl_000151C0:
    # 0x151C0
    .asciz "reserve13"
    .balign 4
lbl_000151CC:
    # 0x151CC
    .asciz "reserve14"
    .balign 4
lbl_000151D8:
    # 0x151D8
    .asciz "reserve15"
    .balign 4
lbl_000151E4:
    # 0x151E4
    .asciz "reserve16"
    .balign 4
lbl_000151F0:
    # 0x151F0
    .4byte lbl_000150F8
    .4byte lbl_00015108
    .4byte lbl_00015118
    .4byte lbl_00015128
    .4byte lbl_00015138
    .4byte lbl_00015148
    .4byte lbl_00015158
    .4byte lbl_00015168
    .4byte lbl_0001517C
    .4byte lbl_0001518C
    .4byte 0x00000000
    .4byte lbl_00015070
    .4byte lbl_0001507C
    .4byte lbl_00015088
    .4byte lbl_00015094
    .4byte lbl_00014F80
    .4byte lbl_00014F8C
    .4byte lbl_00014F98
    .4byte lbl_00014FA4
    .4byte lbl_00014FB0
    .4byte lbl_0001519C
    .4byte lbl_000151A8
    .4byte lbl_000151B4
    .4byte lbl_000151C0
    .4byte lbl_000151CC
    .4byte lbl_000151D8
    .4byte lbl_000151E4
    .4byte 0x00000000
lbl_00015260:
    # 0x15260
    .asciz "standard"
    .balign 4
lbl_0001526C:
    # 0x1526C
    .asciz "for set"
lbl_00015274:
    # 0x15274
    .asciz "set angle"
    .balign 4
lbl_00015280:
    # 0x15280
    .asciz "for swing"
    .balign 4
lbl_0001528C:
    # 0x1528C
    .asciz "stance"
    .balign 4
lbl_00015294:
    # 0x15294
    .asciz "swing MAX"
    .balign 4
lbl_000152A0:
    # 0x152A0
    .asciz "swing"
    .balign 4
lbl_000152A8:
    # 0x152A8
    .asciz "swing MIN"
    .balign 4
lbl_000152B4:
    # 0x152B4
    .asciz "hole in one"
lbl_000152C0:
    # 0x152C0
    .asciz "bogey"
    .balign 4
lbl_000152C8:
    # 0x152C8
    .asciz "reserve17"
    .balign 4
lbl_000152D4:
    # 0x152D4
    .asciz "reserve18"
    .balign 4
lbl_000152E0:
    # 0x152E0
    .asciz "reserve19"
    .balign 4
lbl_000152EC:
    # 0x152EC
    .asciz "reserve20"
    .balign 4
lbl_000152F8:
    # 0x152F8
    .4byte lbl_00015260
    .4byte lbl_0001526C
    .4byte lbl_00015274
    .4byte lbl_00015280
    .4byte lbl_0001528C
    .4byte lbl_00015294
    .4byte lbl_000152A0
    .4byte lbl_000152A8
    .4byte lbl_000152B4
    .4byte lbl_000152C0
    .4byte 0x00000000
    .4byte lbl_00015070
    .4byte lbl_0001507C
    .4byte lbl_00015088
    .4byte lbl_00015094
    .4byte lbl_00014F80
    .4byte lbl_00014F8C
    .4byte lbl_00014F98
    .4byte lbl_00014FA4
    .4byte lbl_00014FB0
    .4byte lbl_0001519C
    .4byte lbl_000151A8
    .4byte lbl_000151B4
    .4byte lbl_000151C0
    .4byte lbl_000151CC
    .4byte lbl_000151D8
    .4byte lbl_000151E4
    .4byte lbl_000152C8
    .4byte lbl_000152D4
    .4byte lbl_000152E0
    .4byte lbl_000152EC
    .4byte 0x00000000
lbl_00015378:
    # 0x15378
    .asciz "Take Bowl"
    .balign 4
lbl_00015384:
    # 0x15384
    .asciz "Set Adjust1"
lbl_00015390:
    # 0x15390
    .asciz "Set Adjust2"
lbl_0001539C:
    # 0x1539C
    .asciz "Throw MAX"
    .balign 4
lbl_000153A8:
    # 0x153A8
    .asciz "Throw"
    .balign 4
lbl_000153B0:
    # 0x153B0
    .asciz "Throw MIN"
    .balign 4
lbl_000153BC:
    # 0x153BC
    .asciz "Take Bowl Run"
    .balign 4
lbl_000153CC:
    # 0x153CC
    .4byte lbl_00015378
    .4byte lbl_00015384
    .4byte lbl_00015390
    .4byte lbl_0001539C
    .4byte lbl_000153A8
    .4byte lbl_000153B0
    .4byte lbl_000153BC
    .4byte 0x00000000
    .4byte lbl_00015070
    .4byte lbl_0001507C
    .4byte lbl_00015088
    .4byte lbl_00015094
    .4byte lbl_00014F80
    .4byte lbl_00014F8C
    .4byte lbl_00014F98
    .4byte lbl_00014FA4
    .4byte lbl_00014FB0
    .4byte lbl_0001519C
    .4byte lbl_000151A8
    .4byte lbl_000151B4
    .4byte lbl_000151C0
    .4byte 0x00000000
lbl_00015424:
    # 0x15424
    .asciz "Shot MAX"
    .balign 4
lbl_00015430:
    # 0x15430
    .asciz "Shot"
    .balign 4
lbl_00015438:
    # 0x15438
    .asciz "Shot MIN"
    .balign 4
lbl_00015444:
    # 0x15444
    .4byte 0x53657400
lbl_00015448:
    # 0x15448
    .4byte lbl_00015424
    .4byte lbl_00015430
    .4byte lbl_00015438
    .4byte lbl_00015444
    .4byte 0x00000000
lbl_0001545C:
    # 0x1545C
    .asciz "EZ/on BANANA"
    .balign 4
lbl_0001546C:
    # 0x1546C
    .asciz "EZ/speak"
    .balign 4
lbl_00015478:
    # 0x15478
    .asciz "EZ/bye"
    .balign 4
lbl_00015480:
    # 0x15480
    .asciz "NR/flight"
    .balign 4
lbl_0001548C:
    # 0x1548C
    .asciz "NR/break ball"
    .balign 4
lbl_0001549C:
    # 0x1549C
    .asciz "NR/fly sky"
    .balign 4
lbl_000154A8:
    # 0x154A8
    .asciz "NR/fly speak"
    .balign 4
lbl_000154B8:
    # 0x154B8
    .asciz "NR/fly away"
lbl_000154C4:
    # 0x154C4
    .asciz "HD/look sky & loop"
    .balign 4
lbl_000154D8:
    # 0x154D8
    .asciz "HD/open door"
    .balign 4
lbl_000154E8:
    # 0x154E8
    .asciz "HD/no open"
    .balign 4
lbl_000154F4:
    # 0x154F4
    .asciz "HD/attack"
    .balign 4
lbl_00015500:
    # 0x15500
    .asciz "HD/blink"
    .balign 4
lbl_0001550C:
    # 0x1550C
    .asciz "HD/walk"
lbl_00015514:
    # 0x15514
    .asciz "HD/sulk"
lbl_0001551C:
    # 0x1551C
    .asciz "HD/eat BANANA"
    .balign 4
lbl_0001552C:
    # 0x1552C
    .asciz "HD/camera glance & loop"
lbl_00015544:
    # 0x15544
    .asciz "HD/camera interpolate"
    .balign 4
lbl_0001555C:
    # 0x1555C
    .asciz "MT/unknown"
    .balign 4
lbl_00015568:
    # 0x15568
    .4byte lbl_0001545C
    .4byte lbl_0001546C
    .4byte lbl_00015478
    .4byte lbl_00015480
    .4byte lbl_0001548C
    .4byte lbl_0001549C
    .4byte lbl_000154A8
    .4byte lbl_000154B8
    .4byte lbl_000154C4
    .4byte lbl_000154D8
    .4byte lbl_000154E8
    .4byte lbl_000154F4
    .4byte lbl_00015500
    .4byte lbl_0001550C
    .4byte lbl_00015514
    .4byte lbl_0001551C
    .4byte lbl_0001552C
    .4byte lbl_00015544
    .4byte 0x00000000
    .4byte lbl_0001555C
    .4byte 0x00000000
lbl_000155BC:
    # 0x155BC
    .4byte lbl_00014A58
    .4byte lbl_00014ACC
    .4byte lbl_00014C18
    .4byte lbl_00014C70
    .4byte lbl_00014CA4
    .4byte lbl_00014D40
    .4byte lbl_00014E48
    .4byte lbl_00015568
    .4byte lbl_00014ED0
    .4byte lbl_00014F24
    .4byte lbl_00014FBC
    .4byte lbl_000150A0
    .4byte lbl_000151F0
    .4byte lbl_000152F8
    .4byte lbl_000153CC
    .4byte lbl_00015448
lbl_000155FC:
    # 0x155FC
    .asciz "Smile Face"
    .balign 4
lbl_00015608:
    # 0x15608
    .asciz "Angry Face"
    .balign 4
lbl_00015614:
    # 0x15614
    .asciz "Afraid Face"
lbl_00015620:
    # 0x15620
    .asciz "Dissut"
    .balign 4
lbl_00015628:
    # 0x15628
    .asciz "Open Mouth"
    .balign 4
lbl_00015634:
    # 0x15634
    .4byte lbl_000155FC
    .4byte lbl_00015608
    .4byte lbl_00015614
    .4byte lbl_00015620
    .4byte lbl_00015628
    .4byte 0x00000000
lbl_0001564C:
    # 0x1564C
    .asciz "Hand Open"
    .balign 4
lbl_00015658:
    # 0x15658
    .4byte lbl_0001564C
    .4byte 0x00000000
lbl_00015660:
    # 0x15660
    .4byte lbl_0001564C
    .4byte 0x00000000
lbl_00015668:
    # 0x15668
    .asciz "Rotate"
    .balign 4
lbl_00015670:
    # 0x15670
    .4byte lbl_00015668
    .4byte 0x00000000
    .4byte lbl_00015634
    .4byte lbl_00015660
    .4byte lbl_00015658
    .4byte lbl_00015670
    .4byte lbl_00015670
lbl_0001568C:
    # 0x1568C
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x00000004
    .4byte 0x00000005
    .4byte 0x00000006
lbl_000156A0:
    # 0x156A0
    .4byte 0x00000002
lbl_000156A4:
    # 0x156A4
    .4byte 0x00000003
lbl_000156A8:
    # 0x156A8
    .4byte 0x00000007
    .4byte lbl_0001568C
    .4byte lbl_000156A0
    .4byte lbl_000156A4
    .4byte lbl_000156A8
    .4byte lbl_000156A8
lbl_000156C0:
    # 0x156C0
    .asciz "Change Chara"
    .balign 4
lbl_000156D0:
    # 0x156D0
    .asciz "Change Status"
    .balign 4
lbl_000156E0:
    # 0x156E0
    .asciz "Save"
    .balign 4
lbl_000156E8:
    # 0x156E8
    .asciz "Exit"
    .balign 4
lbl_000156F0:
    # 0x156F0
    .4byte _prolog + 0xE1F0
    .4byte lbl_000156C0
    .4byte _prolog + 0xF3A0
    .4byte lbl_000156D0
    .4byte _prolog + 0xF408
    .4byte lbl_000156E0
    .4byte _prolog + 0xF3C8
    .4byte lbl_000156E8
    .4byte 0x00000000
    .4byte 0x00000000
    .asciz "+%s+\n"
    .balign 4
    .asciz "|%s|\n"
    .balign 4
    .asciz ">%s<\n"
    .balign 4
    .asciz " %s\n"
    .balign 4
    .asciz "MOTION EDITOR"
    .balign 4
    .asciz "Use Pattern %d/%d\n"
    .balign 4
    .asciz "Save Memory %x\n"
    .asciz "     -- MENU --\n\n"
    .balign 4
    .4byte 0x2D3E2000
    .4byte 0x20202000
    .4byte 0x25730A00
    .4byte 0x204F4E00
    .4byte 0x4F464600
    .4byte 0x0A000000
    .4byte 0x2D3E0000
    .4byte 0x20200000
    .4byte 0x25336400
    .asciz "  %-10s"
    .asciz "Program Set"
    .asciz "  %-15s %3d"
    .asciz "--- Character Menu ---"
    .balign 4
    .asciz "ID : "
    .balign 4
    .4byte 0x25640000
    .asciz "Skeleton: "
    .balign 4
    .4byte 0x25730000
    .asciz "Model   : "
    .balign 4
    .asciz "Motion Frame: %d\n"
    .balign 4
    .asciz "--- Pattern Assign Menu ---\n"
    .balign 4
    .asciz " %-3s %-11s %-16s %-3s\n"
    .4byte 0x46720000
    .asciz "Part"
    .balign 4
    .asciz "Anim"
    .balign 4
    .4byte 0x4C760000
lbl_00015868:
    # 0x15868
    .asciz "Not Assign Patter\n  Press X button.\n"
    .balign 4
lbl_00015890:
    # 0x15890
    .asciz "Rotate: %d\n"
    .asciz "Pattern: %3d"
    .balign 4
    .asciz "--- Category Menu ---"
    .balign 4
    .asciz "Category      : "
    .balign 4
    .asciz "Status        : "
    .balign 4
    .asciz "Motion        : "
    .balign 4
    .asciz "Float         : "
    .balign 4
    .asciz "%0.2f"
    .balign 4
    .asciz "Int 1         : "
    .balign 4
    .asciz "Int 2 or Loop : "
    .balign 4
    .asciz "Interp        : "
    .balign 4
    .asciz "Speed         : "
    .balign 4
    .asciz "%0.4f"
    .balign 4
    .asciz "Face Dir      :   "
    .balign 4
    .asciz "Protect       : "
    .balign 4
    .asciz "Calc Interp   : "
    .balign 4
    .asciz "Rate Interp   : "
    .balign 4
    .asciz "Loop Motion   : "
    .balign 4
    .asciz " Pattern Assign"
    .4byte 0x00000000
lbl_000159EC:
    # 0x159EC
    .4byte _prolog + 0xEF00
    .4byte _prolog + 0xEF58
    .4byte _prolog + 0xEFD0
    .4byte _prolog + 0xF098
    .4byte _prolog + 0xF118
    .4byte _prolog + 0xF118
    .4byte _prolog + 0xF1A0
    .4byte _prolog + 0xF1F4
    .4byte _prolog + 0xF2A0
    .4byte _prolog + 0xF2C8
    .4byte _prolog + 0xF2F0
    .4byte _prolog + 0xF318
    .4byte _prolog + 0xF340
    .4byte _prolog + 0xF368
    .asciz "USER"
    .balign 4
    .asciz "ball"
    .balign 4
    .asciz "x:/des/motinfo_%02d%02d%02d%02d%02d.bin"
    .asciz "x:/des/motinfo_usb.bin"
    .balign 4
    .asciz "x:/des/motinfo.bin"
    .balign 4
    .asciz "y_suzuki"
    .balign 4
    .asciz "/p006/prj006/yoshi/motinfo_%02d%02d%02d%02d%02d.bin"
    .asciz "/p006/prj006/yoshi/motinfo.bin"
    .balign 4
    .asciz "/p006/prj006/mkb/motinfo.bin"

# 6

.section .bss
lbl_10000000:
    .skip 0x4
lbl_10000004:
    .skip 0x4
lbl_10000008:
    .skip 0x38
lbl_10000040:
    .skip 0x2C
lbl_1000006C:
    .skip 0x10
lbl_1000007C:
    .skip 0x4
lbl_10000080:
    .skip 0x8
lbl_10000088:
    .skip 0x1
lbl_10000089:
    .skip 0x1
lbl_1000008A:
    .skip 0x1
lbl_1000008B:
    .skip 0x1
lbl_1000008C:
    .skip 0x1
lbl_1000008D:
    .skip 0x1
lbl_1000008E:
    .skip 0x2
lbl_10000090:
    .skip 0x4
lbl_10000094:
    .skip 0x4
lbl_10000098:
    .skip 0x8
lbl_100000A0:
    .skip 0x4
lbl_100000A4:
    .skip 0x4
lbl_100000A8:
    .skip 0x4
lbl_100000AC:
    .skip 0x8
lbl_100000B4:
    .skip 0x4
lbl_100000B8:
    .skip 0xCA4
lbl_10000D5C:
    .skip 0x4
lbl_10000D60:
    .skip 0x4
lbl_10000D64:
    .skip 0x9C
lbl_10000E00:
    .skip 0x138
lbl_10000F38:
    .skip 0x20
lbl_10000F58:
    .skip 0x4
lbl_10000F5C:
    .skip 0x4
lbl_10000F60:
    .skip 0x10
lbl_10000F70:
    .skip 0x38
lbl_10000FA8:
    .skip 0x4
lbl_10000FAC:
    .skip 0x2C00
lbl_10003BAC:
    .skip 0x4C
lbl_10003BF8:
    .skip 0x4
lbl_10003BFC:
    .skip 0x64
lbl_10003C60:
    .skip 0x20
lbl_10003C80:
    .skip 0x46


