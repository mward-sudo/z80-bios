AS = z80asm
ASFLAGS = -l -m
TARGET = bios.bin

all: $(TARGET)

$(TARGET): src/bios.asm
	$(AS) $(ASFLAGS) -o $@ $<

clean:
	rm -f $(TARGET) *.lis *.map

.PHONY: all clean