"""RUN8: opcode-spine cross-reference for mini_race.

Fingerprint = opcode (mnemonic) sequence only.  Register numbers, displacements
and symbol names are dropped, so a DOL->REL port (float literals become pool
reads, registers renumbered) still lines up.

Indexes (a) every named DOL .text function from supermonkeyball.elf and
(b) every REL asm function in every module, and flags whether a DOL/REL hit is
backed by real C source in the tree (i.e. is a usable template).
"""
import os, re, glob, json, difflib, sys

SCRATCH = r'C:/tmp/smbm/_scratch_mini_race/run8'
ROOT = r'C:/tmp/smbm/mini_race'
MOD = 'mini_race'

# ---------- 1. DOL functions ----------
dol = {}
cur = None
for ln in open(os.path.join(SCRATCH, 'dol_text.dis'), errors='replace'):
    m = re.match(r'^[0-9a-f]{8} <(.+)>:', ln)
    if m:
        cur = m.group(1)
        dol[cur] = []
        continue
    m = re.match(r'^\s*[0-9a-f]+:\s+(?:[0-9a-f]{2} ){4}\s*(\S+)', ln)
    if m and cur is not None:
        dol[cur].append(m.group(1))
dol = {k: v for k, v in dol.items() if v}
print('DOL functions:', len(dol))

# ---------- 1b. which DOL names have real C source (usable templates) ----------
csrc = set()
asm_stub = set()
for f in glob.glob(os.path.join(ROOT, 'src/*.c')):
    t = open(f, errors='replace').read()
    for m in re.finditer(r'INCLUDE_ASM\([^,]+,\s*"?([A-Za-z0-9_/]+)"?\s*,\s*([A-Za-z0-9_]+)', t):
        asm_stub.add(m.group(2))
    for m in re.finditer(r'#include "\.\./asm/nonmatchings/([A-Za-z0-9_]+)/([A-Za-z0-9_]+)\.s"', t):
        asm_stub.add(m.group(2))

# ---------- 2. REL asm functions, all modules ----------
rel = {}
for d in sorted(glob.glob(os.path.join(ROOT, 'asm/nonmatchings/*'))):
    if not os.path.isdir(d):
        continue
    mod = os.path.basename(d)
    for f in sorted(glob.glob(os.path.join(d, '*.s'))):
        lbl = os.path.basename(f)[:-2]
        ops = re.findall(r'/\* [0-9A-F]{8} [0-9A-F]{8} \*/\s+(\S+)',
                         open(f, errors='replace').read())
        if ops:
            rel['%s/%s' % (mod, lbl)] = ops
print('REL asm functions:', len(rel))

# ---------- 3. targets ----------
rows = json.load(open(os.path.join(SCRATCH, 'recon5.json')))
targets = [(r['lbl'], r['n'], r['cat']) for r in rows]

cand = [('DOL:' + k, v) for k, v in dol.items()] + [('REL:' + k, v) for k, v in rel.items()]

THRESH = float(sys.argv[1]) if len(sys.argv) > 1 else 0.72
out = []
for lbl, n, cat in targets:
    ops = rel[MOD + '/' + lbl]
    best = []
    for name, cops in cand:
        if name == 'REL:%s/%s' % (MOD, lbl):
            continue
        if not (0.70 * len(ops) <= len(cops) <= 1.42 * len(ops)):
            continue
        sm = difflib.SequenceMatcher(None, ops, cops, autojunk=False)
        if sm.real_quick_ratio() < THRESH or sm.quick_ratio() < THRESH:
            continue
        r = sm.ratio()
        if r >= THRESH:
            best.append((r, name, len(cops)))
    best.sort(reverse=True)
    out.append((lbl, n, cat, best[:8]))
    if best:
        def tag(nm):
            base = nm.split('/')[-1]
            return '' if base in asm_stub else '*'
        print('%-16s %5d %-10s' % (lbl, n, cat),
              '  '.join('%.3f %s%s(%d)' % (r, nm, tag(nm), ln) for r, nm, ln in best[:5]))
    else:
        print('%-16s %5d %-10s  -' % (lbl, n, cat))
    sys.stdout.flush()

json.dump(out, open(os.path.join(SCRATCH, 'xref_spine.json'), 'w'), indent=1)
print('done  ("*" = candidate is real C in the tree, i.e. a usable template)')
