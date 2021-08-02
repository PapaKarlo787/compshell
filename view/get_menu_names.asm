get_6_names: ;uses r8 - start from
pushai
	mov r0, [cur_dir]
	xor r1, r1
	mov r9, r1
.main_lp:
	call get_poi_to_data
	je .total_end
	movb r4, [r2+11]
	test r4
	je .end
	cmp r4, 15
	je .end
	test r8
	jg .skip
	mov r3, r0
	call get_cluster
	cmp r3, r0
	je .remove_self
	mov r0, r3
	mov [r9+current_table+15], r2
	mov r14, 3
.lp:
	mov r6, [r2]
	mov [r9+current_table], r6
	add r2, 4
	add r9, 4
	loop .lp
	and r6, 0x20000000
	je .dir
	mov r6, 0x204620
	jmp .ndir
.dir:
	mov r6, 0x204420
.ndir:
	sub r9, 1
	mov [r9+current_table], r6
	add r9, 8
	cmp r9, 114
	je .total_end
	jmp .end
.remove_self:
	mov r10, [total_files_in_dir]
	sub r10, 1
	mov [total_files_in_dir], r10
	sub r3, 11
	jmp .end
.skip:
	sub r8, 1
.end:
	add r1, 32
	jmp .main_lp
.total_end:
popai
ret

;r2 - start of record
;r3 - start cluster
get_cluster:
	push r7
	movw r0, [r2+20]
	shl r0, 16
	movw r7, [r2+26]
	add r0, r7
	pop r7
ret
