get_poi_to_data:
; r0 - current start cluster
; r1 - position in file
; res: r2 - pointer to needed byte in memory
; brokes r4-r7, r15
test r0
je .zero
mov r7, r1
mov r6, r0
mov r4, [cluster_size]
.lp:
mov r15, r6
mov r5, [first_fat]
shl r6, 2
add r5, r6
mov r6, [, r5]

mov r5, r15
cmp r6, 0x0ffffff7
jge .ext
cmp r7, r4
jl .ext
sub r7, r4
jmp .lp
.ext:
cmp r4, r7
jg .ok
.zero:
xor r2, r2
jmp .ret
.ok:
sub r5, 2
mul r5, r4
mov r2, [data_area]
add r2, r5
add r2, r7
.ret:
ret
