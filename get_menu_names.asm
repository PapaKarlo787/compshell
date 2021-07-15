get_6_names: ;uses r8 - start from
pushai
	mov r3, [total_files_in_dir]
	cmp r3, 6
	jle .end_fixing
	add r8, 6
	cmp r3, r8
	jge .end_fixing
	sub r3, r8
	add r8, r3
.end_fixing:
	sub r8, 6
	mov [new_offset], r8
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

	add r3, 4
	add r2, 8
	movw r6, [r2]
	shl r6, 16
	add r2, 6
	movw r7, [r2]
	add r6, r7
	mov [r3+current_table], r6
	
	add r3, 4
	jmp .end
.skip:
	sub r8, 1
.end:
	add r1, 32
	jmp .main_lp
.total_end:

popai
mov r8, [new_offset]
ret
new_offset:
dd 0
