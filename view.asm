print_names:
	push r0
	push r14
	scur 0, 0
	mov r0, current_table
	mov r14, [total_files_in_dir]
	cmp r14, 6
	jle .start
	mov r14, 6
.start:
	lprint r0
	add r0, 19
	loop .start
	pop r14
	pop r0
ret

reverse_line:
	mul r0, 84
	rpix r0, 84
	div r0, 84
ret
