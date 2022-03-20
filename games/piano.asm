	xor r0, r0
start:
	gkey
	je start
	and r15, 128
	jne np
	test r0
	jne start
	play mus
	mov r0, 1
	jmp start
np:
	nplay
	xor r0, r0
	jmp start
mus:
dd 1
dw 1000, 0
