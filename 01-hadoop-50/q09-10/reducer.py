import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':
    dic = {}
    top = 0
    for line in sys.stdin:
        key, date, val = line.split("\t")
        val = int(val)
        dic[val] = line
    for i in sorted (dic.keys()) :  
        if top < 7:
            print(dic[i],end = "") 
        top = top + 1

