import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == '__main__':
	for line in sys.stdin:
		clave = ""
		valor = ""
		line = line.strip()
		splits = line.split(",")
		clave = splits[1]
		valor = splits[0]
		sys.stdout.write("{},{}\n".format(clave,valor))