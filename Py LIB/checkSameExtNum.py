# -*- coding: utf-8 -*-
import os

def main():
    postSet = set()
    log = []
    for root , perdir, files in os.walk(u"C:\\Users\\Administrator\\Pictures\\Google Talk"):
        for f in files:
            idx = f.rfind(u'.')
            print idx
            
            if idx != -1 and  idx < len(f):
                postSet.add(f[idx+1 : len(f)])
            else:
                log.append(f)
    output("postfix.txt", postSet)
    output("log.txt", log)

def output(filename, result):
    f = open(filename, "w")
    for line in result:
        f.write("%s\n" % (line))
    f.close()

if __name__ == '__main__':
    main()
