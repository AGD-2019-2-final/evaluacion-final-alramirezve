import sys
#
#  >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == '__main__':
    curkey = None
    curAm = None
    for line in sys.stdin:
        key, val = line.split("\t")
        val = int(val)
        if key == curkey:
            if curAm <= val:
                curAm = val
        else:
            if curkey is not None:
                sys.stdout.write("{}\t{}\n".format(curkey, curAm))
            curkey = key
            curAm = val
    sys.stdout.write("{}\t{}\n".format(curkey, curAm))