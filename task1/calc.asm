org  0x100               ; .COM програма

section .data
    a db 5
    b db 3
    c db 2
    resultMsg db 'Result: $'

section .text
_start:
    ; Обчислення
    mov al, [b]         ; AL = 3
    sub al, [c]         ; AL = 1
    add al, [a]         ; AL = 6

    ; Зберігаємо результат для пізнішого використання
    mov bl, al

    ; Вивід повідомлення 'Result: '
    mov ah, 09h
    lea dx, resultMsg
    int 21h

    ; Вивід пробілу
    mov ah, 02h
    mov dl, ' '
    int 21h

    ; Перетворення числа 0..9 у ASCII
    mov al, bl
    add al, '0'          ; 6 + 48 = 54 = ASCII '6'

    ; Вивід цифри
    mov dl, al
    mov ah, 02h
    int 21h

    ; Перенесення рядка (CR + LF)
    mov dl, 13
    mov ah, 02h
    int 21h

    mov dl, 10
    mov ah, 02h
    int 21h

    ; Завершення
    mov ax, 4c00h
    int 21h