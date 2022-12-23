get_6_names: ;uses r8 - start from
pushai
	mov r0, [cur_dir]
	cmp r0, 2
	je .nxtmain
	add r8, 1
.nxtmain:
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
	jne .skip
	mov [r9+current_table+15], r2
	mov r14, 3
.lp:
	mov r6, [r2]
	mov [r9+current_table], r6
	add r2, 4
	add r9, 4
	loop .lp
	and r6, 0x10000000 ; 5 bit in type flags byte
	jne .dir
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
.skip:
	sub r8, 1
.end:
	add r1, 32
	jmp .main_lp
.total_end:
popai
ret

;r2 - start of record
;r0 - start cluster
get_cluster:
	mov r15, r7
	movw r0, [r2+20]
	shl r0, 16
	movw r7, [r2+26]
	add r0, r7
	mov r7, r15
ret
