print_names:
	mov r15, [total_files_in_dir]
	test r15
	je .rt
	scur 1, 0
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
	rect 0, 0, 47, 83
	rect 0, 48, 47, 66
ret

reverse_line:
	mul r3, 84
	rpix r3, 84
	div r3, 84
ret
