import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
	for line in sys.stdin:
		amount = ""
		purpose = ""
		line = line.strip()
		splits = line.split(",")
		amount = splits[4]
		purpose = splits[3]
		sys.stdout.write("{}\t{}\n".format(purpose,amount))
