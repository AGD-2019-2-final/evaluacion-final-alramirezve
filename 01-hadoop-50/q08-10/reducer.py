import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':
    curkey = None
    curSum = 0.0
    curNum = 0.0   
    for line in sys.stdin:
        key, val = line.split(",")
        val = float(val)
        if key == curkey:
            curSum = curSum + val
            curNum = curNum + 1
        else:
            if curkey is not None:
                sys.stdout.write("{}\t{}\t{}\n".format(curkey,curSum,curSum/curNum))
            curkey = key
            curSum = val
            curNum = 1
    sys.stdout.write("{}\t{}\t{}\n".format(curkey,curSum,curSum/curNum))