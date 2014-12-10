# -*- coding: gbk -*-
'''
Generate one file tree

@ author：   LJX
@ version：  0.9
@ how to use:
    use MATTREETAB to control the max file-tree-width
    use walkingDir to tell this script where to go
    use exclude_folder or exclude_ext to remove the folder or file you don't want

TODO:
    用正则表达式来控制想要排除的类型文件
    统计某个路径下面， 每一种类型（尾缀）的文件对应的数量， 剔除数量超过T的文件
'''


import os
import os.path

MATTREETAB = 4
walkingDir = 'D:\\STUDY\\[1] 图像处理\\测试\\TestProj4.62\\SDK\\'
tree_file_name="index_tree.txt"
tree_file = open(tree_file_name, "w")
exclude_folder = ('echo','$RECYCLE.BIN','实验室皮带机演示及相机驱动备份','游戏')
tuple_ext = ('.png', '.bmp', '.jpg', '.jpg2000', '.avi', '.tif', '.txtmp4', '.ini','.db', '.yuv','.amr','.gif',
             'crt','egg','','bak','.ttf','.ttc','.dll','')


def countLevelsOfDir(walkingDir):
    lenWalkingDir = len(walkingDir)
    i=1;
    while( 1 ):
        #print walkingDir
        walkingDir = os.path.split(walkingDir)[0]
        i = i+1
        if len(walkingDir)==3:
            level = i
            return level
            break

def makeTab(fp, range_start, range_end):
    for i in range(range_start, range_end):
            fp.write('\t')
            
def makeTabInConsole(range_start, range_end):
    for i in range(range_start, range_end):
            print '\t',


if __name__ == '__main__':

    if not os.path.isdir(walkingDir):
        print 'Check the Dir!'
        exit
        
    print walkingDir
    tree_file.write( walkingDir )
    initLevel = countLevelsOfDir(walkingDir)

        
    for root, dirs, files in os.walk(walkingDir):
        folderLevel = countLevelsOfDir(root)
        currentFolder = os.path.split(root)[-1];
        
        if folderLevel - initLevel < MATTREETAB:
            makeTabInConsole(initLevel, folderLevel)
            print currentFolder
            
            makeTab(tree_file, initLevel, folderLevel)
            tree_file.write(currentFolder)
            tree_file.write('\n')
       
            if (len(files) < 100): 
                for name in files:

                    ext = os.path.splitext(name)[-1].lower()
                    
                    fileLevel = folderLevel + 1;
                    if (ext not in tuple_ext) :
                        makeTabInConsole(initLevel, fileLevel)
                        print name
                        
                        makeTab(tree_file, initLevel, fileLevel)
                        tree_file.write( name )
                        tree_file.write('\n')
                for ex_dir in exclude_folder:
                    if ex_dir in dirs:
                        dirs.remove(ex_dir)
            else:
                makeTabInConsole(initLevel, fileLevel)
                print '[too many ' +ext+ ' files in  folder '+ currentFolder + ']\n'
                
                makeTab(tree_file, initLevel, folderLevel+1)
                tree_file.write('[too many ' +ext+ ' files in  folder '+ currentFolder + ']\n')
    
    print 'FINISH!'
    tree_file.close()
    print 'Already close the file.'
