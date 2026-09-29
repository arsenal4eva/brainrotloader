ASM = nasm
SRC = boot.asm
BIN = boot.bin
IMG = boot.img
QEMU = qemu-system-x86_64

all: $(BIN) $(IMG)

$(BIN): $(SRC)
	$(ASM) -f bin $(SRC) -o $(BIN)

$(IMG): $(SRC)
	$(ASM) -f bin $(SRC) -o $(IMG)

run: $(IMG)
	$(QEMU) -drive format=raw,file=$(IMG)

clean:
	rm -f $(BIN) $(IMG)

.PHONY: all run clean
