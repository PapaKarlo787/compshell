get_poi_to_data:
; r0 - current start cluster
; r1 - position in file
; r2 - pointer to needed byte in memory
push r4
push r3
push r1
push r0
cmp r0, 0
je .zero
mov r4, [cluster_size]
.lp:
push r0
mov r3, [first_fat]
shl r0, 2
add r3, r0
mov r0, [r3]

pop r3
cmp r0, 0x0ffffff7
jge .ext
cmp r1, r4
jl .ext
sub r1, r4
jmp .lp
.ext:
cmp r4, r1
jg .ok
.zero:
xor r2, r2
jmp .ret
.ok:
sub r3, 2
mul r3, r4
mov r2, [data_area]
add r2, r3
add r2, r1
.ret:
pop r0
pop r1
pop r3
pop r4
ret
