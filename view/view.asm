print_names:
	push r3
	push r14
	mov r3, [total_files_in_dir]
	test r3
	je .rt
	scur 0, 0
	mov r0, current_table
	mov r14, [total_files_in_dir]
	cmp r14, 6
	jle .start
	test r14
	je .rt
	mov r14, 6
.start:
	lprint r0
	add r0, 19
	loop .start
.rt:
	pop r14
	pop r3
	rect 0, 0, 47, 83
	rect 0, 47, 47, 65
ret

reverse_line:
	push r3
	mul r3, 84
	rpix r3, 84
	pop r3
ret
