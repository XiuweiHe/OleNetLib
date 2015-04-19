# -*- coding: utf-8 -*-

import os

rootDir = 'D:\\TEMP\\'
for dirName, subdirList, fileList in os.walk(rootDir):
    print('Folder: %s' % dirName)
    for fname in fileList:
        print('\t%s' % fname)
