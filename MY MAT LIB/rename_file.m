clc;

%%
DIR = 'D:\STUDY\[1] ͼ����\�㷨��Ƶ����20130712��IMVL�棩(50���)\453 �ҳ�����\';
EXT = '.avi';
FILES = dir([DIR,'*',EXT]);
FILENUM = size(FILES,1);
START = 1;
END = FILENUM;

for  i = START:END
    filename = FILES(i,1).name;
    % FileName will be 'newName'.mp3.
    %   Rename the file: it will move the file, 
    %   rather than duplicate the file
    newName = ['453_00',num2str(i)];
    movefile([DIR,filename],[DIR,newName,EXT],'f');
end
