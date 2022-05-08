	xor r2, r2
	xor r3, r3
	xor r14, r14
	cls
	point r2, r3
start:
	gkey
	cmp r15, 28
	je exit
	gmice ; r0 - x; r1 - y; r15 - x_sign, r14 - y_sign
	je start
	btest r14, 3
	jne .cont
	scol 0
	point r2, r3
	scol 1
.cont:
	mov r0, r15
	mov r1, r15
	mov r14, r15
	shr r0, 8
	and r0, 255
	shr r1, 16
; check x
	test r0
	je .next
	and r15, 16
	call set_sign
	add r2, r15
.next:
; check y
	test r1
	je spoi
	mov r15, r14
	and r15, 32
	xor r15, 32
	call set_sign
	add r3, r15
spoi:
	cmp r2, 84
	jl .down
	mov r2, 83
.down:
	cmp r3, 48
	jl .left
	mov r3, 47
.left:
	cmp r2, 0
	jge .up
	mov r2, 0
.up:
	cmp r3, 0
	jge .end
	mov r3, 0
.end:
	and r14, 1
	point r2, r3
	jni start
	print r14
	delay 3000
	or r14, 2
	jmp start


set_sign:
	test r15
	je plus
	mov r15, -1
	ret
plus:
	mov r15, 1
exit:
	ret
