try_execute:
pushai
xor r1, r1
.start:
	call get_poi_to_data
	test r2
	je .ret
	mov r14, [cluster_size]
	shr r14, 2
.lp:
	mov r3, [r2]
	mov [0x40000000+r1], r3
	add r1, 4
	add r2, 4
	loop .lp
	jmp .start
.ret:
cmp r1, r2
je .ret_er
call 0x40000000
.ret_er:
popai
ret
