sstart:
	play melody
	cls
	mov r14, 7
lps:
	rnd
	mod r13, 48
	mov r12, r13
	rnd
	mod r13, 84
	bmp r13, r12, pic
	loop lps
	
	gtm r0
	call printdate
	lprint num+2
start:
	gtm r0
	mov r1, r0
	mov r2, r0
	mov r3, r0
	mod r1, 60
	div r2, 60
	mod r2, 60
	div r3, 3600
	mod r3, 24
	je sstart

	scur 18, 2
	mov r4, r3
	call printnum
	lprint num+2
	lprint points
	mov r4, r2
	call printnum
	lprint num+2
	lprint points
	mov r4, r1
	call printnum
	lprint num+2
	

delay 500
gkey
cmp r15, 28
jne start
nplay
ret
printnum:
	mov r15, r4
	mod r15, 10
	add r15, 0x30
	movb [num+3], r15
	div r4, 10
	add r4, 0x30
	movb [num+2], r4
	ret

printdate:
	xor r1, r1
	div r0, 86400

lp:
	add r1, 1
	mov r2, r1
	mov r3, r1
	mov r4, r1
	mov r5, r1
	mul r2, 365
	add r3, 1
	div r3, 4
	add r4, 70
	div r4, 100
	add r5, 370
	div r5, 400

	add r2, r3
	sub r2, r4
	add r2, r5

	cmp r2, r0
	jle lp
	sub r1, 1

	mov r2, r1
	mov r3, r1
	mov r4, r1
	mov r5, r1

	mul r2, 365
	add r3, 1
	div r3, 4
	add r4, 69
	div r4, 100
	add r5, 369
	div r5, 400

	add r2, r3
	sub r2, r4
	add r2, r5

	sub r0, r2		; days
	add r1, 1970	; years

	mov r2, r1
	mov r3, r1
	mov r4, r1
	mod r2, 4
	jne small
	mod r3, 100
	je small
big:
	mov r2, 29
	jmp end
small:
	mod r4, 100
	je big
	mov r2, 28
end:
	xor r3, r3
; if m % 2 ==
lp2:
	add r3, 1
	mov r4, r3
	and r4, 1
	jne mbig
msmall:
	cmp r3, 8
	jge mmbig
mmsmall:
	cmp r3, 2
	je is_feb
	mov r4, 30
	jmp mend
is_feb:
	mov r4, r2
	jmp mend
mbig:
	cmp r3, 8
	jg mmsmall
mmbig:
	mov r4, 31
mend:
	cmp r0, r4
	jl mtend
	sub r0, r4
	jmp lp2
mtend:
	add r0, 1

; r1 - year
; r3 - month
; r0 - day

	scur 12, 3
	mov r2, r1
	mov r14, 4
	call lp3
	lprint num
	lprint slash
	mov r2, r3
	mov r1, r3
	mov r14, 4
	call lp3
	lprint num+2
	lprint slash
	mov r2, r0
	mov r1, r0
	mov r14, 4
lp3:
	mod r1, 10
	add r1, 0x30
	movb [num-1, r14], r1
	mov r1, r2
	div r1, 10
	mov r2, r1
	loop lp3
	ret

num:
db 0, 0, 0, 0, 0
points:
db ":", 0
slash:
db "/", 0
melody:
dd 195
dw 523, 428, 698, 428, 698, 214, 784, 214, 698, 214, 659, 214, 587, 428, 587, 428, 587, 428, 784, 428, 784, 214, 880, 214, 784, 214, 698, 214, 659, 428, 523, 428, 523, 428, 880, 428, 880, 214, 932, 214, 880, 214, 784, 214, 698, 428, 587, 428, 523, 214, 523, 214, 587, 428, 784, 428, 659, 428, 698, 857, 523, 428, 698, 428, 698, 214, 784, 214, 698, 214, 659, 214, 587, 428, 587, 428, 587, 428, 784, 428, 784, 214, 880, 214, 784, 214, 698, 214, 659, 428, 523, 428, 523, 428, 880, 428, 880, 214, 932, 214, 880, 214, 784, 214, 698, 428, 587, 428, 523, 214, 523, 214, 587, 428, 784, 428, 659, 428, 698, 857, 523, 428, 698, 428, 698, 428, 698, 428, 659, 857, 659, 428, 698, 428, 659, 428, 587, 428, 523, 857, 880, 428, 932, 428, 880, 428, 784, 428, 1047, 428, 523, 428, 523, 214, 523, 214, 587, 428, 784, 428, 659, 428, 698, 857, 523, 428, 698, 428, 698, 214, 784, 214, 698, 214, 659, 214, 587, 428, 587, 428, 587, 428, 784, 428, 784, 214, 880, 214, 784, 214, 698, 214, 659, 428, 523, 428, 523, 428, 880, 428, 880, 214, 932, 214, 880, 214, 784, 214, 698, 428, 587, 428, 523, 214, 523, 214, 587, 428, 784, 428, 659, 428, 698, 857, 523, 428, 698, 428, 698, 428, 698, 428, 659, 857, 659, 428, 698, 428, 659, 428, 587, 428, 523, 857, 880, 428, 932, 428, 880, 428, 784, 428, 1047, 428, 523, 428, 523, 214, 523, 214, 587, 428, 784, 428, 659, 428, 698, 857, 523, 428, 698, 428, 698, 214, 784, 214, 698, 214, 659, 214, 587, 428, 587, 428, 587, 428, 784, 428, 784, 214, 880, 214, 784, 214, 698, 214, 659, 428, 523, 428, 523, 428, 880, 428, 880, 214, 932, 214, 880, 214, 784, 214, 698, 428, 587, 428, 523, 214, 523, 214, 587, 428, 784, 428, 659, 428, 698, 857, 523, 428, 698, 428, 698, 214, 784, 214, 698, 214, 659, 214, 587, 428, 587, 428, 587, 428, 784, 428, 784, 214, 880, 214, 784, 214, 698, 214, 659, 428, 523, 428, 523, 428, 880, 428, 880, 214, 932, 214, 880, 214, 784, 214, 698, 428, 587, 428, 523, 214, 523, 214, 587, 428, 784, 428, 659, 428, 698, 857, 0, 428
pic:
db 9, 2
db 0, 128, 208, 250, 255, 250, 208, 128, 0
db 4, 6, 7, 63, 63, 63, 7, 6, 4
