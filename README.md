# ZX Spectrum +2A Basic BIOS

This is a minimal BIOS for the ZX Spectrum +2A, designed to be used with the Fuse ZX Spectrum emulator.

## Building

To build the BIOS, you need `z80asm` installed. Then run:

```
make clean && make
```

This will produce `bios.rom`, which can be loaded into Fuse.

## Usage

1. Build the BIOS as described above.
2. Open Fuse and select "Machine" > "Select ROM".
3. Choose "ROM 0" and select the `bios.rom` file.
4. Restart the emulator or select "Machine" > "Reset".
5. You should see "HELLO WORLD" displayed in black text on a light gray background.

## Current Features

- Light gray border and background
- Custom uppercase alphabet (A-Z) font
- Basic text printing functionality

## Future Improvements

This is a basic implementation. Future versions may include:
- Keyboard input handling
- Lowercase and special characters support
- Cursor management and screen scrolling
- Basic I/O routines
- Sound capabilities
- Interrupt handling
- Memory management
- Simple command interpreter

## Contributing

Feel free to fork this project and submit pull requests for any improvements or additional features.
