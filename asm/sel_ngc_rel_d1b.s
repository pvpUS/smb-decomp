# sel_ngc_rel data segment 1b -- the UNSIGNED int->float magic double
# (43300000 00000000) that lived at lbl_00011EC8.  PLACEHOLDER: delete
# this file from SOURCES and put the converted C object here instead;
# mwcc emits exactly these 8 bytes as that object's only .rodata.
.include "macros.inc"

.section .rodata
.balign 8
    .4byte 0x43300000
    .4byte 0x00000000
