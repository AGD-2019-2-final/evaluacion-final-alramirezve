import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
	for line in sys.stdin:
		fecha = ""
		mes = ""
		line = line.strip()
		splits = line.split("   ")
		fecha= splits[1]
		fechaspl = fecha.split("-")
		mes = fechaspl[1]  
		sys.stdout.write("{}\t1\n".format(mes))