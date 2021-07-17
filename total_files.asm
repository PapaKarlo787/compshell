get_total_files:
pushai
	mov r0, [cur_dir]
	xor r1, r1
	mov r3, r1
.lp:
	call get_poi_to_data
	cmp r2, 0
	je .ext
	add r1, 32
	movb r4, [r2+11]
	
	cmp r4, 15
	je .lp
	cmp r4, 0
	je .lp
	add r3, 1
	jmp .lp
.ext:
	mov [total_files_in_dir], r3
popai
ret
