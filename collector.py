import argparse


if __name__ == "__main__":
	parser = argparse.ArgumentParser(description='bootloader collector')
	parser.add_argument("inf", help="input file")
	parser.add_argument("outf", help="output file")
	cmd = parser.parse_args()
	with open(cmd.inf, 'rb') as f:
		data = f.read()
	with open(cmd.outf, 'rb+') as f:
		f.seek(0)
		f.write(bytes([0x16, 0x3e, 0x00, 0x00, 0x00]))
		f.seek(0x3e)
		f.write(data)
