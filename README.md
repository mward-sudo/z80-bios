# ZX Spectrum +2A BIOS

This project contains a basic BIOS (Basic Input/Output System) implementation for the ZX Spectrum +2A home computer.

## Overview

This BIOS is written in Z80 assembly language and provides fundamental system initialization and character display functionality. It's designed to be assembled using the z80asm assembler.

## Features

- System initialization
- Screen clearing and border color setting
- Complete character set implementation (space to ~, ASCII 32-126)
- Basic character printing routines

## File Structure

- `src/bios.asm`: Main BIOS source code

## Assembly

To assemble the BIOS, use z80asm:

```
make clean && make
```

Use the resulting `bios.rom` file with an emulator or on real hardware.

## Usage

This BIOS can be used as a starting point for ZX Spectrum +2A development or emulation projects. It initializes the system and displays all available characters on the screen.

## Character Set

The BIOS includes a custom 8x8 pixel font for:
- Uppercase letters (A-Z)
- Lowercase letters (a-z)
- Digits (0-9)
- Punctuation and special characters (space to ~)

The character set covers the full printable ASCII range (32-126), including all standard punctuation and symbol characters.

## Contributing

Contributions to improve or extend this BIOS are welcome. Please feel free to submit issues or pull requests.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgements

This project is inspired by the original ZX Spectrum +2A system and is intended for educational and hobby purposes.
