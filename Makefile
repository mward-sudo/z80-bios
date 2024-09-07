AS = z80asm
ASFLAGS = -l
TARGET = bios.rom

.PHONY: all clean $(TARGET)

all: $(TARGET)

$(TARGET): src/bios.asm
	$(AS) $(ASFLAGS) -o $@ $<

clean:
	rm -f $(TARGET) *.lis