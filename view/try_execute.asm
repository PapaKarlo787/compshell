try_execute:
pushai
xor r1, r1
.start:
	call get_poi_to_data
	je .ret
	mov r14, [cluster_size]
	shr r14, 9
.lp:
	add r1, 0x40000000
	mcp r1, r2
	sub r1, 0x40000000 - 512
	add r2, 512
	loop .lp
	jmp .start
.ret:
cmp r1, r2
je .ret_er
call 0x40000000
.ret_er:
popai
ret
