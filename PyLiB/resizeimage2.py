#!/usr/bin/env python
# -*- coding:utf-8 -*- 

'''
Arion ,2012-09-06
必须安装PIL库

批量修改文件中的图片为格式及大小
'''

import os, glob
import Image


path = raw_input("path:")
width =int(raw_input("the width U want:"))
imgslist = glob.glob(path+'/*.jpg')
format = raw_input("format:")
def small_img():
	for imgs in imgslist:
		imgspath, ext = os.path.splitext(imgs)
		img = Image.open(imgs)
		(x,y) = img.size
		small_img =img.resize((720,1024),Image.ANTIALIAS)
		small_img.save(imgs)
	print "done"

if __name__ == '__main__':
	small_img()

#D:/tenscenes/data/stilllife/
