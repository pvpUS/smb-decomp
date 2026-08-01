# mini_golf data segment 1 -- rodata continuation after a carved hole
#
# RUN 14 re-carve.  The lbl_000264A8 TU constant pool is now emitted by
# src/mini_golf_41.c through pool +0x47 (0x264A8..0x264EF, 72 bytes):
#   lbl_0000F290  +0x00..+0x33  Vec{0,0,0}, Quaternion{0,0,0,1}, pad, 0.5,
#                               24.0, 0.0f                        (run 13)
#   lbl_0000F750  +0x34         -1.0e-8f                          (run 14)
#   lbl_0000FA18  +0x38         2.0  -- double, 8-aligned         (run 14)
#   lbl_0000FBC8  +0x40, +0x44  -1.0e-7f, 1.0f                    (run 14)
# so this object now starts at 0x264F0, and asm/mini_golf_pool_tail.s -- which
# supplied +0x34 while lbl_0000F750 still read it out of the pool -- is GONE.
#
# lbl_000264E0 is no longer defined here: those 8 bytes are lbl_0000FA18's 2.0.
# Its one remaining still-asm user, lbl_0000F7E8, was rewritten to
# (lbl_000264A8+0x38)@ha and @l -- byte-identical, gated GOLDEN in run 13.
#
# .balign 8 is a no-op here: 0x264F0 is already 8-aligned and the C object's
# .rodata is exactly 72 bytes, so the linker inserts no padding.
.include "macros.inc"
.global lbl_00026510

.section .rodata
.balign 8
    # 0x264F0
    .4byte 0x3DCCCCCD
    .4byte 0x3E99999A
    .4byte 0x3FB99999
    .4byte 0x9999999A
    .4byte 0x3FC63A1A
    .4byte 0x7C9CCD6F
    .4byte 0x3F747AE1
    .4byte 0x47AE147B
lbl_00026510:
