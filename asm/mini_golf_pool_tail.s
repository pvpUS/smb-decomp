# Tail of the lbl_000264A8 TU constant pool.
#
# The pool 0x264A8..0x264E0 is ONE translation unit's compiler-generated
# .rodata, shared by lbl_0000F290, lbl_0000F750, lbl_0000FBC8, lbl_0000FCE0 and
# lbl_00010304 (each materialises the base and indexes off it).
# src/mini_golf_41.c (lbl_0000F290) emits the first 52 bytes -- Vec{0,0,0},
# Quaternion{0,0,0,1}, 4 bytes of alignment padding, 0.5, 24.0, 0.0f.
# The last 4 bytes belong to lbl_0000F750's constants (it reads pool +0x34) and
# cannot be emitted by mini_golf_41.c without changing lbl_0000F290's .text.
# They are supplied here until lbl_0000F750 is converted, at which point this
# object should be dropped and the pool re-carved.
#
# .balign 4, NOT 8: this lands at 0x264DC, which is 4-byte aligned only.
# .balign 8 would make the linker pad mini_golf_41.c's 52 bytes out to 56.
.include "macros.inc"

.section .rodata
.balign 4
    .4byte 0xB22BCC77
