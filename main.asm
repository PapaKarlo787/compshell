start_main:
	xor r3, r3 ; pointer to line
	mov r8, r3
main:
	cls
	call get_total_files
.main:
	call get_6_names
	call print_names
	.lpp:
		call reverse_line
	.lp:
		gkey
		cmp r15, 72
		je .up
		cmp r15, 80
		je .down
		cmp r15, 127
		je .del
		cmp r15, 10
		jne .lp
	mul r3, 19
	movb r1, [r3+current_table+12]
	mov r2, [r3+current_table+15]
	call get_cluster
	cmp r1, 0x44
	jne .file
	test r0
	jne .set_dir
	mov r0, 2
.set_dir:
	mov [cur_dir], r0
	jmp start_main
.file:
	call try_execute
	jmp start_main
.up:
	test r3
	je .up_
	call reverse_line
	sub r3, 1
	jmp .lpp
.up_:
	test r8
	je .lp
	sub r8, 1
	jmp .ret
.down:
	mov r7, [total_files_in_dir]
	sub r7, 1
	cmp r3, 5
	je .down_
	cmp r3, r7
	je .lp
	call reverse_line
	add r3, 1
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

.del:
	mul r3, 19
	mov r2, [r3+current_table+15]
	call rem_rec
	jmp start_main


include "view/get_menu_names.asm"
include "view/total_files.asm"
include "view/view.asm"
include "get_pointer.asm" ; uses r0-r2
include "view/try_execute.asm"
include "del_cre/rem_dir.asm"

current_table:
times db 0 114
total_files_in_dir:
dd 0
