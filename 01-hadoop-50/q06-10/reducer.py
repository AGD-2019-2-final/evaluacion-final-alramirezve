import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':
    curkey = None
    curMin = None
    curMax = None   
    for line in sys.stdin:
        key, val = line.split(",")
        val = float(val)
        if key == curkey:
            if curMax <= val:
                curMax = val
            if curMin >= val:
                curMin = val
        else:
            if curkey is not None:
                sys.stdout.write("{}\t{}\t{}\n".format(curkey,curMax,curMin))
            curkey = key
            curMin = val
            curMax = val
    sys.stdout.write("{}\t{}\t{}\n".format(curkey,curMax,curMin))