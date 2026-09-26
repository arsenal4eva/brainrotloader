ASM = nasm
SRC = boot.asm
BIN = boot.bin
QEMU = qemu-system-x86_64

all: $(BIN)

$(BIN): $(SRC)
		$(ASM) -f bin $(SRC) -o $(BIN)


run: $(BIN)
		$(QEMU) -drive format=raw,file=$(BIN)

clean:
		rm -f $(BIN)

.PHONY: all run clean
