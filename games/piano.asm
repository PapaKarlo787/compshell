; r11 - last note
; r7  - total notes in melody
start:
	nplay
	xor r10, r10
	mov r7, r10
	mov r11, r10
	cls
	lprint help_1
	scur 0, 1
	lprint help_2

.loop:
	gkey
	cmp r15, 28 ; enter
	je play_melody
	cmp r15, 57 ; space
	jne .loop
	cls
	mls
	
mus_lp:
	play mus
	gkey
	je mus_lp
	cmp r15, 57
	je start
	mov r14, 12
	xor r0, r0
	mov r2, 0x7f
	and r2, r15
.lp:
	movb r1, [note_keys+r0]
	cmp r15, r1
	je set_note
	cmp r2, r1
	je unset_note
	add r0, 1
	loop .lp

	cmp r15, 8
	jg mus_lp
	
set_octave:
	sub r15, 2
	mov r10, r15
	jmp mus_lp

unset_note:
	call select_note
	jne mus_lp
	xor r11, r11
	call update_melody
	jmp mus_lp

set_note:
	call select_note
	je mus_lp
	mov r11, r1
	call update_melody
	jmp mus_lp

select_note: ; r0 - note, r10 - octave; result in r1
	movb r2, [notes+r0]
	mov r1, 1
	shl r1, r10
	mul r1, r2
	cmp r1, r11
	ret

update_melody:
	movw r0, [mus+4]
	mov r13, r12
	mls
	sub r12, r13
	test r0
	jne .ne
	shl r12, 3
	div r12, 10
.ne:
	shl r12, 16
	add r0, r12
	shl r7, 2
	mov [melody+r7], r0
	shr r7, 2
	add r7, 1
	mov [m_size], r7
	mls
	movw [mus+4], r11
	play mus
	ret

play_melody:
	cls
	mov r14, [m_size]
	test r14
	je .err_exit
	xor r0, r0
.lp:
	movw r1, [melody+r0]
	movw r2, [melody+2+r0]
	movw [mus+4], r1
	cls
	scur 0, 2
	lprint help_3
	scur 18, 3
	print r1
	play mus
	delay r2
	add r0, 4
	gkey
	cmp r15, 28
	je start
	loop .lp

	jmp start
	
.err_exit:
	lprint err_1
	delay 1000
	jmp start

mus:
dd 1
dw 0, 0

notes:
db 33, 35, 37, 39, 41, 44, 46, 49, 52, 55, 58, 62

note_keys:
db 30, 44, 31, 45, 32, 33, 47, 34, 48, 35, 49, 36

help_1:
db "Start - Space", 0
help_2:
db "Play - Enter", 0
help_3:
db "Frequency:", 0
err_1:
db "No melody"

m_size:
dd 0
melody:


