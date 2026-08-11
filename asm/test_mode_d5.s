# test_mode data segment 5 -- rodata continuation after a carved hole
.include "macros.inc"
.global lbl_00010280
.global lbl_00010298
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
.global lbl_1000007C
.global lbl_10000080
.global lbl_10000088
.global lbl_10000089
.global lbl_1000008A
.global lbl_1000008B
.global lbl_1000008C
.global lbl_1000008D
.global lbl_1000008E
.global lbl_10000090
.global lbl_10000094
.global lbl_10000098
.global lbl_100000A0
.global lbl_100000A4
.global lbl_100000A8
.global lbl_100000AC
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



