xor r0, r0
main:
cls
mov r1, [data, , r0, 4]
mov [bitmap+3], r1
bitmap:
bmp 0, 0, cat1
add r0, 1
and r0, 15
delay 200
gkey
cmp r15, 28
jne main
ret

data:
dd cat1, cat2, cat3, cat4, cat5, cat6, cat7, cat8, cat9, cat10, cat11, cat12, cat13, cat14, cat15, cat16

cat1:
binclude "pics/cat/cat1.jpg.bmp"
cat2:
binclude "pics/cat/cat2.jpg.bmp"
cat3:
binclude "pics/cat/cat3.jpg.bmp"
cat4:
binclude "pics/cat/cat4.jpg.bmp"
cat5:
binclude "pics/cat/cat5.jpg.bmp"
cat6:
binclude "pics/cat/cat6.jpg.bmp"
cat7:
binclude "pics/cat/cat7.jpg.bmp"
cat8:
binclude "pics/cat/cat8.jpg.bmp"
cat9:
binclude "pics/cat/cat9.jpg.bmp"
cat10:
binclude "pics/cat/cat10.jpg.bmp"
cat11:
binclude "pics/cat/cat11.jpg.bmp"
cat12:
binclude "pics/cat/cat12.jpg.bmp"
cat13:
binclude "pics/cat/cat13.jpg.bmp"
cat14:
binclude "pics/cat/cat14.jpg.bmp"
cat15:
binclude "pics/cat/cat15.jpg.bmp"
cat16:
binclude "pics/cat/cat16.jpg.bmp"
