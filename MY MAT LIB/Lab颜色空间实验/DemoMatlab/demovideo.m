%%
FILEDIR = 'D:\Study\ͼ��\��Ҷ���\Ҷ����Ƶ\';
FILES = dir(fullfile(FILEDIR,'*.avi'));
FILENUM = size(FILES,1);
START = 1;
END = 99;
SHOWFLAG = 1;
WRITEFLAG = 0;
CUTFLAG = 0;

%%
for  i = START:END
    filename=FILES(i,1).name; 
    aviObj = mmreader([FILEDIR,filename]);
    
    flag =['Now Processing: ', filename ]; disp(flag);  
    leaf(aviObj);
    
    flag =['Estimated Parameter is: ']; disp(flag);
end
