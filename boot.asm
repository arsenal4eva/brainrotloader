org 0x7C00
bits 16

start:
    cli
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7C00
    sti

.game_loop:
    call clear_screen

    mov si, msg_title
    call print_string
    mov si, msg_prompt
    call print_string

.wait_key:
    mov ah, 0x00
    int 0x16       
    cmp al, '1'
    je .chosen_r
    cmp al, '2'
    je .chosen_p
    cmp al, '3'
    je .chosen_s
    jmp .wait_key

.chosen_r:
    mov byte [user_choice], 0
    jmp .bot_turn
.chosen_p:
    mov byte [user_choice], 1
    jmp .bot_turn
.chosen_s:
    mov byte [user_choice], 2

.bot_turn:
    mov ah, 0x00
    int 0x1A        
    mov ax, dx
    xor dx, dx
    mov cx, 3
    div cx          
    mov [bot_choice], dl

    mov si, msg_user
    call print_string
    mov al, [user_choice]
    call print_choice_name

    mov si, msg_bot
    call print_string
    mov al, [bot_choice]
    call print_choice_name

    mov al, [user_choice]
    mov bl, [bot_choice]
    cmp al, bl
    je .tie

    cmp al, 0
    je .check_r
    cmp al, 1
    je .check_p
    cmp al, 2
    je .check_s

.check_r:
    cmp bl, 2
    je .win
    jmp .lose
.check_p:
    cmp bl, 0
    je .win
    jmp .lose
.check_s:
    cmp bl, 1
    je .win
    jmp .lose

.win:
    mov si, msg_win
    jmp .show_result
.lose:
    mov si, msg_lose
    jmp .show_result
.tie:
    mov si, msg_tie

.show_result:
    call print_string

    mov si, msg_replay
    call print_string
    mov ah, 0x00
    int 0x16        
    jmp .game_loop


print_string:
    lodsb
    or al, al
    jz .done
    mov ah, 0x0E    
    int 0x10
    jmp print_string
.done:
    ret

clear_screen:
    mov ah, 0x00
    mov al, 0x03   
    int 0x10
    ret

print_choice_name:
    cmp al, 0
    je .p_r
    cmp al, 1
    je .p_p
    mov si, choice_s
    jmp .p_d
.p_r:
    mov si, choice_r
    jmp .p_d
.p_p:
    mov si, choice_p
.p_d:
    call print_string
    ret

msg_title   db 'BEAT TUNG TUNG TUNG IN RPS!', 13, 10, 0
msg_prompt  db 13, 10, 'Choose your move:', 13, 10, '1. Rock', 13, 10, '2. Paper', 13, 10, '3. Scissors', 13, 10, 13, 10, 'Enter choice (1-3): ', 0
msg_user    db 13, 10, 'You chose: ', 0
msg_bot     db 13, 10, 'Tung Tung Tung chose:  ', 0
msg_win     db 13, 10, 13, 10, ' YOU WIN! ', 13, 10, 0
msg_lose    db 13, 10, 13, 10, ' TUNG TUNG TUNG WINS! ', 13, 10, 0
msg_tie     db 13, 10, 13, 10, 'TIE', 13, 10, 0
msg_replay  db 13, 10, 13, 10, 'Press any key to play again...', 0

choice_r    db 'Rock', 0
choice_p    db 'Paper', 0
choice_s    db 'Scissors', 0

user_choice db 0
bot_choice  db 0

times 510-($-$$) db 0
dw 0xAA55













































    
