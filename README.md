# Custom ZX Spectrum +2A BIOS Project

This project implements a custom BIOS for the ZX Spectrum +2A, written in Z80 assembly language.

## Overview

The BIOS provides fundamental system initialization and character display functionality, including a complete ZX Spectrum-compatible character set. It's designed to be assembled using the z80asm assembler.

## Features

- System initialization
- Screen clearing and border color setting
- Complete ZX Spectrum character set implementation (space to ~, ASCII 32-126)
- Basic character printing routines

## File Structure

- `src/bios.asm`: Main BIOS source code
- `Makefile`: Build automation
- `bios.rom`: Assembled BIOS ROM file (generated)

## Building

To assemble the BIOS, ensure you have z80asm installed, then run:

    make

This will generate the `bios.rom` file.

To clean up build artifacts:

    make clean

## Usage

The assembled `bios.rom` file can be used with ZX Spectrum +2A emulators or potentially on real hardware. When run, it initializes the system and displays all available characters on the screen.

## Character Set

The BIOS includes a custom 8x8 pixel font covering the full printable ASCII range (32-126), including:

- Uppercase letters (A-Z)
- Lowercase letters (a-z)
- Digits (0-9)
- Punctuation and special characters

The character set is designed to match the ZX Spectrum's original font.

## Contributing

Contributions to improve or extend this BIOS are welcome. Please feel free to submit issues or pull requests.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgements

This project is inspired by the original ZX Spectrum +2A system and is intended for educational and hobby purposes.
