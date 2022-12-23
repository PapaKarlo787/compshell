; r0 - pointer
; r1 - size
; r2 - pointer to name

create_dir:
	pushai
	mov r3, 32
	xor r1, r1
	xor r0, r0
	call create_rec
	popai
	ret

create_rec:
	pushai
	xor r1, r1
	mov r0, [cur_dir]
.lp:
	call get_poi_to_data
	test r2
	je .new_clus
	movb r4, [11, r2]
	test r4
	jne .lp
	mov [.rec_poi], r2
	jmp .start

.rec_poi:
	dd 0

.new_clus:
	call find_cluster
	
.start:	
	popai

	
	mov r4, [, r2]
	ret


find_cluster:
	
	ret
