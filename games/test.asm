mcs
mov r0, r12
div r0, 1000
xor r11, r11
start:
add r11, r12
mcs
sub r11, r12
cmp r11, -1000
jg start

cls
add r0, 1
print r0
gkey
cmp r15, 28
je lab
xor r11, r11
jmp start

lab:

ret
