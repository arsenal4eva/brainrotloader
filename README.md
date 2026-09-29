# brainrotloader

Bootsector program to play a game of rock paper scissors against a classic brainrot, Triple T


Makefile was to allow for faster compiling, running and testing, just use "make run" to launch bootloader in qemu.

Total size 512 bytes, standard bootloader size.\
Written all in assembly


# How to use

Go to terminal

git clone https://github.com/arsenal4eva/brainrotloader \
cd brainrotloader \
./run.sh

Or via make:

make run

This boots the prebuilt `boot.img` (512-byte bootsector, built from `boot.asm` with nasm) in QEMU.

Prerequisites:

- Qemu (`qemu-system-x86_64`)
- nasm (only needed to rebuild: `make all`)

# Files

- `boot.asm` - bootloader source
- `boot.img` - compiled bootable image
- `run.sh` - QEMU launch script
- `Makefile` - build with `make all`, run with `make run`, clean with `make clean`

# Releases

- [v1.0.0](https://github.com/arsenal4eva/brainrotloader/releases/tag/v1.0.0) - original release (`boot.zip`)
- [v2.0.0](https://github.com/arsenal4eva/brainrotloader/releases/tag/v2.0.0) - latest, contains `boot.img`, `run.sh`, `Makefile`




Learnt assembly here:
Credits to https://github.com/mschwartz/assembly-tutorial
