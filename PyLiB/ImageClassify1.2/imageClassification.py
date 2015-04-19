# -*- coding: gb18030 -*-
import Image
import string
import os.path
import os
import sys
import re
import shutil
import ConfigParser
import copy
#import time
#from pyExcelerator import *

reload(sys)
#print sys.setdefaultencoding('utf-8')
print 'Loading ...'


def mkdir(dst):
    dst = dst.strip()
    dst = dst.rstrip("\\")
    isExists = os.path.exists(dst)
    if not isExists:
        print dst + '\t' + 'has been created successfully'
        os.makedirs(dst)
        return dst
    else:
        print dst + '\t' + 'has been already exist'
        return dst


def GetFiles(dir, ext):
    allfiles = []
    needExtFilter = (ext != None)
    for root, dirs, files in os.walk(dir):
        for filespath in files:
            filepath = os.path.join(root, filespath)
            extension = os.path.splitext(filepath)[1][1:]
            if needExtFilter and extension in ext:
                allfiles.append(filepath)
            elif not needExtFilter:
                allfiles.append(filepath)
    return allfiles


#return information about filepath, mkdirpath,classification degree
def GetClassificationInfo(dir):
    chinese = []
    imagesize = []
    non_chinese = []
    num = []
    alphabet = []
    filepath = []
    dir2create = []
    nFolder = []
    folderpath = []
    maxnum = 0

    for i in dir:
        folderpath.append(os.path.split(i)[0])
        imagesize.append((Image.open(i)).size)
        allname = os.path.splitext(os.path.split(i)[1])[0]
        chinese.append(''.join(re.findall(r"[\x80-\xff]", allname)))
        number = filter(str.isdigit, allname)
        num.append(number)
        alphabet.append(filter(str.isalpha, allname))
    maxnum = max(maxnum, (int(number)))


    maxnumlen = len(str(maxnum))

    for i in num:
        for j in range(maxnumlen - len(i)):
            i = '0' + i
        non_chinese.append(i)

    dense = zip(folderpath, chinese, alphabet, non_chinese, imagesize, dir)
    dense.sort(key=lambda X: (X[0], X[1], X[2], X[3], X[4]))

    dir2create.append(os.path.splitext(dense[0][5])[0])
    filepath.append(dense[0][5])
    nFolder.append(0)
    for i in range(len(dense) - 1):
        filepath.append(dense[i + 1][5])
        if not ((cmp(dense[i][0], dense[i + 1][0]) == 0 ) and
                (cmp(dense[i][1], dense[i + 1][1]) == 0 ) and
                (cmp(dense[i][2], dense[i + 1][2]) == 0 ) and
                (cmp(int(dense[i][3]), (int(dense[i + 1][3]) - 1)) == 0 ) and
                (cmp(dense[i][4], dense[i + 1][4]) == 0 )):
            nFolder.append(i + 1)
            dir2create.append(os.path.splitext(dense[i + 1][5])[0])
    nFolder.append(i + 2)
    return (filepath, dir2create, nFolder)


def ClassifyFile(dir, ext, mode):
    allfiles = GetFiles(dir, ext)
    [files, dir2create, classifyInd] = GetClassificationInfo(allfiles)
    for i in range(len(classifyInd) - 1):
        mkdir(dir2create[i])
        j = classifyInd[i]
        while (j < classifyInd[i + 1]):
            if (cmp(mode, 'cut') == 0 ):
                shutil.move(files[j], dir2create[i])
            if (cmp(mode, 'copy') == 0 ):
                shutil.copy(files[j], dir2create[i])
            j = j + 1


if __name__ == "__main__":
    #get the .ini file information
    config = ConfigParser.ConfigParser()
    config.read("TestConfig.ini")
    mode = config.get('file_path', 'mode')
    src = config.get('file_path', 'src')
    ext = config.get('file_path', 'ext')
    #start = time.time()
    #src = 'C:/Users/litao/Desktop/test'
    #ext = 'bmp'
    #mode = 'copy'
    if(src.find('\\')):
		src = src.replace('\t', '\\t')
		src = src.replace('\r', '\\r')
		src = src.replace('\n', '\\n')
		src = src.replace('\a', '\\a')
		src = src.replace('\b', '\\b')
		src = src.replace('\e', '\\e')
		src = src.replace('\000', '\\000')
		src = src.replace('\v', '\\v')
		src = src.replace('\f', '\\f')
		src = src.replace('\oyy', '\\oyy')
		src = src.replace('\other', '\\other')
		src = src.replace('\\', '/')
		
    ClassifyFile(src, ext, mode)
    #end = time.time()
    #print end- start
    