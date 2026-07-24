#!/usr/bin/env python3
"""Convert a GameCube .dol into a minimal big-endian PPC ELF suitable as a
diff.py `baseimg`. Sections are laid out at their true virtual addresses so
`objdump -j .text --start-address/--stop-address` disassembles correctly.
No symbol table is produced (diff.py takes addresses from the .map).
"""
import struct, sys

def u32(d, o):
    return struct.unpack('>I', d[o:o+4])[0]

def main(dol_path, elf_path):
    d = open(dol_path, 'rb').read()

    secs = []  # (addr, bytes)
    # 7 text sections
    for i in range(7):
        off, addr, size = u32(d, 0x00+4*i), u32(d, 0x48+4*i), u32(d, 0x90+4*i)
        if size:
            secs.append((addr, d[off:off+size]))
    # 11 data sections
    for i in range(11):
        off, addr, size = u32(d, 0x1C+4*i), u32(d, 0x64+4*i), u32(d, 0xAC+4*i)
        if size:
            secs.append((addr, d[off:off+size]))
    entry = u32(d, 0xE0)

    secs.sort(key=lambda s: s[0])

    # Merge address-contiguous sections into segments.
    segs = []  # [addr, bytearray]
    for addr, data in secs:
        if segs and addr == segs[-1][0] + len(segs[-1][1]):
            segs[-1][1].extend(data)
        else:
            segs.append([addr, bytearray(data)])

    # Name segments: the one containing `entry` is .text, rest .rodataN.
    names = []
    ro = 0
    for addr, data in segs:
        if addr <= entry < addr + len(data):
            names.append('.text')
        else:
            names.append('.rodata%d' % ro); ro += 1

    # Build section header string table: NULL name first.
    shstr = b'\x00'
    name_off = {}
    for n in ['.shstrtab'] + names:
        if n not in name_off:
            name_off[n] = len(shstr)
            shstr += n.encode() + b'\x00'

    EHSIZE, SHENT = 52, 40
    # Layout: [ehdr][seg datas...][shstrtab][pad->4][section headers]
    off = EHSIZE
    seg_offsets = []
    for addr, data in segs:
        seg_offsets.append(off)
        off += len(data)
    shstr_off = off
    off += len(shstr)
    off = (off + 3) & ~3
    shoff = off

    # section headers: [0]=NULL, [1..]=segments, [last]=.shstrtab
    nsh = 1 + len(segs) + 1
    shstrndx = nsh - 1

    out = bytearray()
    # ELF header (big-endian)
    out += b'\x7fELF'
    out += bytes([1, 2, 1, 0])   # 32-bit, MSB, version 1, sysv
    out += bytes(8)
    out += struct.pack('>HHIIIIIHHHHHH',
        2,            # e_type = EXEC
        20,           # e_machine = EM_PPC
        1,            # e_version
        entry,        # e_entry
        0,            # e_phoff
        shoff,        # e_shoff
        0,            # e_flags
        EHSIZE, 0, 0, # ehsize, phentsize, phnum
        SHENT, nsh, shstrndx)
    assert len(out) == EHSIZE

    for addr, data in segs:
        out += data
    out += shstr
    while len(out) < shoff:
        out += b'\x00'

    def shdr(name, typ, flags, addr, offset, size, align, entsize):
        return struct.pack('>IIIIIIIIII', name, typ, flags, addr, offset,
                           size, 0, 0, align, entsize)

    # [0] NULL
    out += shdr(0, 0, 0, 0, 0, 0, 0, 0)
    # segments
    for (addr, data), o, n in zip(segs, seg_offsets, names):
        flags = 0x6 if n == '.text' else 0x2   # ALLOC|EXECINSTR : ALLOC
        out += shdr(name_off[n], 1, flags, addr, o, len(data), 0x20, 0)
    # .shstrtab
    out += shdr(name_off['.shstrtab'], 3, 0, 0, shstr_off, len(shstr), 1, 0)

    open(elf_path, 'wb').write(out)
    print("wrote %s (%d bytes)" % (elf_path, len(out)))
    print("entry = %#x" % entry)
    for (addr, data), n in zip(segs, names):
        print("  %-10s addr=%#010x size=%#x" % (n, addr, len(data)))

if __name__ == '__main__':
    main(sys.argv[1], sys.argv[2])
