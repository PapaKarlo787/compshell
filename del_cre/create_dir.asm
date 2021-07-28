create_dir:
cls
xor r0, r0
mov r14, 3
.zero_name:
	shl r14, 2
	mov [r14+name], r0
	shr r14, 2
loop .zero_name
get_name:

ret
name:
times db 0x00, 12
