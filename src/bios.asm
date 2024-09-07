; Basic ZX Spectrum +2A BIOS
; Assembled with z80asm

    org 0x0000

start:
    di              ; Disable interrupts
    ld sp, 0xFFFF   ; Set stack pointer to top of memory
    
    ; Set border color to light gray
    ld a, 7         ; 7 is the color code for white (light gray on ZX Spectrum)
    out (254), a    ; Output to port 254 to set border color

    ; Initialize screen
    ld hl, 0x4000   ; Start of screen memory
    ld de, 0x4001   ; Next byte of screen memory
    ld bc, 6911     ; Number of bytes to clear (6912 - 1)
    ld (hl), 0      ; Set first byte to 0 (black)
    ldir            ; Clear the rest of the screen

    ; Set attributes for entire screen to black on light gray
    ld hl, 0x5800   ; Start of attribute memory
    ld de, 0x5801   ; Next byte of attribute memory
    ld bc, 767      ; 768 attribute bytes - 1
    ld (hl), 0x38   ; White paper (0x38) + Black ink (0x00)
    ldir            ; Set attributes for the entire screen

    ; Print all available characters
    ld hl, 0x4000   ; Start of screen memory
    ld b, 26        ; Number of characters (A-Z)
    ld a, 65        ; ASCII code for 'A'

print_all_chars:
    push af
    push bc
    push hl
    call print_char
    pop hl
    inc l           ; Move to next column
    pop bc
    pop af
    inc a           ; Move to next character
    djnz print_all_chars

    ; Infinite loop
    halt
    jp $

; Print a string
; DE: Address of null-terminated string
; HL: Screen address to print to
print_string:
    ld a, (de)
    or a
    ret z           ; Return if null terminator
    call print_char
    inc de
    jr print_string

; Print a single character
; A: ASCII character to print
; HL: Screen address to print to
print_char:
    push bc
    push de
    push hl
    sub 65          ; Adjust ASCII value to match our character set (A = 0)
    jp m, char_done ; If it's below 'A', don't print anything
    cp 26
    jp p, char_done ; If it's above 'Z', don't print anything
    ld c, a
    ld b, 0
    push hl         ; Save screen address
    ld hl, char_set
    add hl, bc
    add hl, bc
    add hl, bc
    add hl, bc
    add hl, bc
    add hl, bc
    add hl, bc
    add hl, bc      ; HL = char_set + A * 8
    ex de, hl       ; DE now points to the character data
    pop hl          ; Restore screen address to HL
    ld b, 8         ; 8 rows per character
char_loop:
    ld a, (de)      ; Load character data
    ld (hl), a      ; Write to screen
    inc de          ; Next byte of character data
    inc h           ; Next screen row
    djnz char_loop
    ld a, h
    sub 8
    ld h, a         ; Reset H to starting row
char_done:
    pop hl
    inc l           ; Move to next column
    pop de
    pop bc
    ret

; Remove the test_msg as it's no longer needed
; test_msg:
;     db "HELLO WORLD", 0

char_set:
    ; Full uppercase alphabet (8x8 pixels, similar to ZX Spectrum +2A font)
    db 0x00, 0x3C, 0x42, 0x42, 0x7E, 0x42, 0x42, 0x00 ; A
    db 0x00, 0x7C, 0x42, 0x7C, 0x42, 0x42, 0x7C, 0x00 ; B
    db 0x00, 0x3C, 0x42, 0x40, 0x40, 0x42, 0x3C, 0x00 ; C
    db 0x00, 0x78, 0x44, 0x42, 0x42, 0x44, 0x78, 0x00 ; D
    db 0x00, 0x7E, 0x40, 0x7C, 0x40, 0x40, 0x7E, 0x00 ; E
    db 0x00, 0x7E, 0x40, 0x7C, 0x40, 0x40, 0x40, 0x00 ; F
    db 0x00, 0x3C, 0x42, 0x40, 0x4E, 0x42, 0x3C, 0x00 ; G
    db 0x00, 0x42, 0x42, 0x7E, 0x42, 0x42, 0x42, 0x00 ; H
    db 0x00, 0x3E, 0x08, 0x08, 0x08, 0x08, 0x3E, 0x00 ; I
    db 0x00, 0x0E, 0x04, 0x04, 0x04, 0x44, 0x38, 0x00 ; J
    db 0x00, 0x42, 0x44, 0x78, 0x44, 0x42, 0x42, 0x00 ; K
    db 0x00, 0x40, 0x40, 0x40, 0x40, 0x40, 0x7E, 0x00 ; L
    db 0x00, 0x42, 0x66, 0x5A, 0x42, 0x42, 0x42, 0x00 ; M
    db 0x00, 0x42, 0x62, 0x52, 0x4A, 0x46, 0x42, 0x00 ; N
    db 0x00, 0x3C, 0x42, 0x42, 0x42, 0x42, 0x3C, 0x00 ; O
    db 0x00, 0x7C, 0x42, 0x42, 0x7C, 0x40, 0x40, 0x00 ; P
    db 0x00, 0x3C, 0x42, 0x42, 0x52, 0x4A, 0x3C, 0x00 ; Q
    db 0x00, 0x7C, 0x42, 0x42, 0x7C, 0x44, 0x42, 0x00 ; R
    db 0x00, 0x3C, 0x40, 0x3C, 0x02, 0x42, 0x3C, 0x00 ; S
    db 0x00, 0x7F, 0x08, 0x08, 0x08, 0x08, 0x08, 0x00 ; T
    db 0x00, 0x42, 0x42, 0x42, 0x42, 0x42, 0x3C, 0x00 ; U
    db 0x00, 0x42, 0x42, 0x42, 0x42, 0x24, 0x18, 0x00 ; V
    db 0x00, 0x42, 0x42, 0x42, 0x42, 0x5A, 0x24, 0x00 ; W
    db 0x00, 0x42, 0x24, 0x18, 0x18, 0x24, 0x42, 0x00 ; X
    db 0x00, 0x41, 0x22, 0x14, 0x08, 0x08, 0x08, 0x00 ; Y
    db 0x00, 0x7E, 0x04, 0x08, 0x10, 0x20, 0x7E, 0x00 ; Z

    ; Pad to 16K
    ds 0x4000 - $, 0xFF