# -*- coding: gbk -*-
import os
import sys
import time
import shutil

dst_dir = 'D:\\STUDY\[1] ͼ����\\STANDARD IMAGE DB\\Bovik 2013 �������۱�׼��LIVEmultidistortiondatabase\\Part 1\\te\\'
src_dir = 'D:\\TDDOWNLOAD\\QFile\\17789917\\FileRecv\\ȷ��\\���� (185) �½��ļ���\\'
rootDir = dst_dir;
i = 1;

src_files = os.listdir(src_dir)
#newDir = dst_dir + subDir + '\\' + str(j) + fileList(k)

for dirName, subdirList, fileList in os.walk(rootDir):
    for subDir in subdirList:       
        for j in range(len(src_files)):
            shutil.copy(src_dir+'\\'+src_files[j], dst_dir+'\\'+subDir+'\\'+subDir+src_files[j]);
            print subDir
  
