start_main:
	cls
	xor r0, r0 ; pointer to line
	mov r8, r0
main:
	call get_total_files
.main:
	call get_6_names
	call print_names
	.lpp:
		call reverse_line
	.lp:
		gkey
		cmp r15, 65
		je .up
		cmp r15, 66
		je .down
		cmp r15, 10
		jne .lp
	mul r0, 19
	movb r1, [r0+current_table+12]
	mov r0, [r0+current_table+15]
	cmp r1, 0x44
	jne .file
	cmp r0, 0
	jne .write
	mov r0, 2
.write:
	mov [cur_dir], r0
	jmp start_main
.file:
	call try_execute
	div r0, 19
	jmp start_main
.up:
	cmp r0, 0
	je .up_
	call reverse_line
	sub r0, 1
	jmp .lpp
.up_:
	cmp r8, 0
	je .lp
	sub r8, 1
	jmp .ret
.down:
	mov r7, [total_files_in_dir]
	sub r7, 1
	cmp r0, 5
	je .down_
	cmp r0, r7
	je .lp
	call reverse_line
	add r0, 1
	jmp .lpp
.down_:
	mov r9, r8
	add r9, 6
	cmp r7, r9
	jl .lp
	add r8, 1
.ret:
	call reverse_line
	jmp .main

include "get_menu_names.asm"
include "total_files.asm"
include "view.asm"
include "get_pointer.asm" ; uses r0-r2
include "try_execute.asm"

current_table:
times db 0 114
total_files_in_dir:
dd 0
