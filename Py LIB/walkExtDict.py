# -*- coding: gbk -*-

import os
'''
���������ļ��� ͳ�Ƹ����ļ�(β׺)����
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
