; r0 - current start cluster
remove_dir:
pushai
	xor r1, r1
.lp:
	call get_poi_to_data
	je .ext
	mov r3, r0
	call get_cluster
	cmp r0, r3
	je .nxt
	mov r0, r3
	call rem_rec
.nxt:
	add r1, 32
	jmp .lp
.ext:
	call remove_file
popai
ret

remove_file:
pushai
	xor r14, r14
.lp:
	shl r0, 2
	add r14, 1
	mov r1, [first_fat]
	add r1, r0
	push r1
	mov r0, [r1]
	cmp r0, 0xffffff7
	jge .rem
	test r0
	jne .lp
.rem:
	pop r0
	mzer r0, 4
	loop .rem
popai
ret

rem_rec:
pushai
	movb r3, [r2+11]
	test r3
	je .rt
	cmp r3, 15
	je .rt
	mov r5, r4
	mov r14, 3
	push 0x10202020
	push 0x20202020
	push 0x20202e2e
.check:
	cmp r4, r5
	jne .ok
	pop r5
	mov r4, [r2]
	add r2, 4
	loop .check
	jmp .rt
.ok:
	pop r5
	add r2, 4
	loop .ok
	sub r2, 12

	call get_cluster
	cmp r0, 2
	jle .end_del
	cmp r3, 16
	je .dir
	call remove_file
	jmp .end_del
.dir:
	call remove_dir
.end_del:
	mzer r2, 32
.rt:
popai
ret
