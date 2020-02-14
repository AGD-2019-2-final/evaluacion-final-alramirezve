import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    for line in sys.stdin:
        clave = ""
        valor = ""
        fecha = ""
        line = line.strip()
        splits = line.split("   ")
        clave= splits[0]
        fecha= splits[1]
        valor= splits[2]
        sys.stdout.write("{}\t{}\t{}\n".format(clave,fecha,valor))