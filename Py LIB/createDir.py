# -*- coding: gbk -*-
import os
import sys
import time

dir = 'D:\\STUDY\\[1] ͼ����\\STANDARD IMAGE DB\\Bovik 2013 �������۱�׼��LIVEmultidistortiondatabase\\Part 1\\'

for i in range( 1, 150):
    print i
    os.mkdir('D:\\STUDY\\[1] ͼ����\\STANDARD IMAGE DB\\Bovik 2013 �������۱�׼��LIVEmultidistortiondatabase\\Part 1\\te\\'+str(i));
    time.sleep(0.1)
