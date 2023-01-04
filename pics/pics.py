def read_int(f, n, start):
	res = 0
	f.seek(start)
	for i in range(n):
		res += f.read(1)[0] << (i*8)
	return res

fn = input()

with open(fn, "rb") as f:
	data_start = read_int(f, 4, 10)
	x = read_int(f, 4, 18)
	y = read_int(f, 4, 22)
	datalines = [0] * y
	if read_int(f, 2, 28) != 1:
		print ("wrong format")
	bytes_per_line = x >> 3
	bytes_per_line += (4 - bytes_per_line & 3) & 3
	print(bytes_per_line)
	f.seek(data_start)
	for i in range(y-1, -1, -1):
		datalines[i] = f.read(bytes_per_line)

data_res = [x, y]
yy = 0
while yy < y:
	for i in range(x):
		byte = 0
		for l in range(8):
			b = datalines[yy][i >> 3] if yy < len(datalines) else 0
			byte += ((b >> (7 - (i & 7))) & 1) << l
			yy += 1
		yy -= 8
		data_res.append(byte)
	yy += 8

with open(fn, "wb") as f:
	f.write(bytes(data_res))
