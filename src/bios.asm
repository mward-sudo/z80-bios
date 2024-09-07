; Basic ZX Spectrum +2A BIOS
; Assembled with z80asm

    org 0x0000

start:
    di              ; Disable interrupts
    ld sp, 0xFFFF   ; Set stack pointer to top of memory
    
    ; Initialize screen
    ld hl, 0x4000   ; Start of screen memory
    ld de, 0x4001   ; Next byte of screen memory
    ld bc, 6911     ; Number of bytes to clear (6912 - 1)
    ld (hl), 0      ; Set first byte to 0 (black)
    ldir            ; Clear the rest of the screen

    ; Print a simple message
    ld hl, message
    ld de, 0x4000   ; Start of screen memory
    ld bc, 13       ; Length of message
    ldir            ; Copy message to screen

    ; Infinite loop
    jp $

message:
    db "Hello, World!"

    ; Pad to 16K
    ds 0x4000 - $, 0xFF