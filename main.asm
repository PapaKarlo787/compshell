start_main:
	xor r0, r0 ; pointer to line
	mov r8, r0
main:
	call get_total_files
.main:
	call get_6_names
	.lop:
		call print_names
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
	cmp r1, 0x44
	jne .file
	mov r0, [r0+current_table+15]
	mov [cur_dir], r0
	jmp start_main
.file:
	call try_execute
	div r0, 19
	jmp .lp
.up:
	call reverse_line
	cmp r0, 0
	je .up_
	sub r0, 1
	jmp .lop
.up_:
	cmp r8, 0
	je .lop
	sub r8, 1
	jmp .main
.down:
	call reverse_line
	cmp r0, 5
	je .down_
	add r0, 1
	jmp .lop
.down_:
	add r8, 1
	jmp .main



include "get_menu_names.asm"
include "total_files.asm"
include "view.asm"
include "get_pointer.asm" ; uses r0-r2

try_execute:

ret


current_table:
times db 0 114
el_in_tab:
db 0
total_files_in_dir:
dd 0
