get_6_names: ;uses r8 - start from
pushai
	mov r0, [cur_dir]
	xor r1, r1
	mov r3, r1
.main_lp:
	call get_poi_to_data
	cmp r2, 0
	je .total_end
	movb r4, [r2+11]
	cmp r4, 0
	je .end
	cmp r4, 15
	je .end
	cmp r8, 0
	jg .skip
	mov r14, 3
.lp:
	mov r6, [r2]
	mov [r3+current_table], r6
	add r2, 4
	add r3, 4
	loop .lp
	and r6, 0x20000000
	je .dir
	mov r6, 0x204620
	jmp .ndir
.dir:
	mov r6, 0x204420
.ndir:
	sub r3, 1
	mov [r3+current_table], r6
	movw r6, [r2+8]
	shl r6, 16
	movw r7, [r2+14]
	add r6, r7
	cmp r6, r0
	je .remove_self
	mov [r3+current_table+4], r6
	
	add r3, 8
	cmp r3, 114
	je .total_end
	jmp .end
.remove_self: 
	mov r10, [total_files_in_dir]
	sub r10, 1
	mov [total_files_in_dir], r10
	sub r3, 11
.skip:
	sub r8, 1
.end:
	add r1, 32
	jmp .main_lp
.total_end:
popai
ret
