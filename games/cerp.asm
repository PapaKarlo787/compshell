start:
	cls
	rnd
	mod r13, 3
	add r13, r13
	movb r0, [trg, r13]
	movb r1, [trg+1, r13]
	mov r14, 3000
lp:
	gkey
	rnd
	mod r13, 3
	add r13, r13
	movb r2, [trg, r13]
	movb r3, [trg+1, r13]
	add r0, r2
	add r1, r3
	shr r0, 1
	shr r1, 1
	point r0, r1
	loop lp
lp2:
	gkey
	je lp2
	ret

trg:
db 42, 0
db 70, 47
db 14, 47


