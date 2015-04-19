# -*- coding: gbk -*-

import os
'''
遍历整个文件夹 统计各种文件(尾缀)数量
'''
dict = {}
for d, fd, fl in os.walk("D:\\STUDY\\Python\\"):
    for f in fl:
        sufix = os.path.splitext(f)[1][1:]
        if sufix in dict:
            dict[sufix] += 1
        else:
            dict[sufix] = 1

for item in dict.items():
    print("%s %s" % item)
