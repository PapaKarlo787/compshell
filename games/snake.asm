cls
mov r0, 2
mov r1, 40
mov r2, 0
call drop_apple
;play sound

start:
gkey
cmp r15, 75
je left
cmp r15, 72
je up
cmp r15, 77
je right
cmp r15, 80
je down
cmp r15, 28
je rt
jmp step

left:
cmp r0, 77
je step
jmp store_dir
up:
cmp r0, 80
je step
jmp store_dir
right:
cmp r0, 75
je step
jmp store_dir
down:
cmp r0, 72
je step

store_dir:
mov r0, r15

step:
mov r3, [heap+r1]
add r1, 4
mov r4, [heap+r1]
add r1, 4
cmp r0, 75
je draw_left
cmp r0, 72
je draw_up
cmp r0, 77
je draw_right

add r4, 2
jmp redraw
draw_left:
sub r3, 2
jmp redraw
draw_up:
sub r4, 2
jmp redraw
draw_right:
add r3, 2

redraw:
add r3, 84
mod r3, 84
add r4, 48
mod r4, 48
mov [heap+r1], r3
add r1, 4
mov [heap+r1], r4
sub r1, 4
bmp r3, r4, rt
ji check_apple
no_apple:
scol 0
mov r3, [heap+r2]
add r2, 4
mov r4, [heap+r2]
add r2, 4
bmp r3, r4, rt
scol 1
yes_apple:
mod r1, 8064
mod r2, 8064
delay 100
jmp start

check_apple:
cmp r3, r11
jne no_apple
cmp r4, r12
jne no_apple
call drop_apple
jmp yes_apple


drop_apple:
rnd
mod r13, 84
and r13, 0xfe
mov r11, r13

rnd
mod r13, 48
and r13, 0xfe
mov r12, r13

bmp r11, r12, rt
ji drop_apple
rtn:
ret


rt:
db 2, 1, 3, 3
sound:
dd 2
dw 1700, 1000, 900, 1000
lin:
db 32, 0
heap:
times dd 0 40
dd 4, 0
