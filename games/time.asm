start:
cls
gtm r0
print r0
delay 1000
gkey
cmp r15, 16
jne start
ret
