.model small
.stack 100h

.data
msg     db 80 dup('$')
len     db 0
spd     dw 0
pos     db 0
dir     db 1
randDist db 0  ; Variable to store random movement distance

msg1    db 'Enter text: $'
msg2    db 13,10,'Speed (1-5): $'

.code
start:
    mov ax, @data
    mov ds, ax

    mov ah, 09h
    lea dx, msg1
    int 21h

    mov msg, 79
    lea dx, msg
    mov ah, 0Ah
    int 21h
    mov bl, msg[1]
    mov len, bl

    mov ah, 09h
    lea dx, msg2
    int 21h

    mov ah, 01h
    int 21h
    sub al, '0'
    mov bl, 6
    sub bl, al
    mov al, bl
    mov cx, 200
    mul cl
    mov spd, ax

    mov pos, 0
    mov dir, 1

MainLoop:
    mov ah, 06h
    mov al, 0
    mov bh, 07
    mov cx, 0
    mov dx, 184Fh
    int 10h

    mov ah, 02h
    mov bh, 0
    mov dh, 10
    mov dl, pos
    int 10h

    mov ah, 0Eh
    lea si, msg+2
    mov cl, len
    mov ch, 0
PrintLoop:
    mov al, [si]
    int 10h
    inc si
    loop PrintLoop

    mov cx, spd
DelayLoop:
    nop
    loop DelayLoop

    mov ah, 01h
    int 16h
    jz MoveWord
    mov ah, 00h
    int 16h
    cmp al, 27
    je Exit

MoveWord:
    ; Generate random distance for movement
    mov ah, 2Ch       
    int 21h
    mov al, dl        
    and al, 0Fh       
    mov randDist, al 

    mov al, pos
    cmp dir, 1
    je MovingRight

    cmp al, 0
    je ReverseToRight
    sub al, randDist  
    mov pos, al
    jmp MainLoop

MovingRight:
    mov bl, len
    mov bh, 79
    sub bh, bl
    cmp al, bh
    je ReverseToLeft
    add al, randDist
    mov pos, al
    jmp MainLoop

ReverseToLeft:
    mov dir, 0
    jmp MainLoop

ReverseToRight:
    mov dir, 1
    jmp MainLoop

Exit:
    mov ax, 4C00h
    int 21h
end start
