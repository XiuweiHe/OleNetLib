set_startup;

%%
FILEDIR = 'D:\STUDY\[1] ͼ����\��Ƶ�� 4.0\2000 ����ϼ�\~0006 ģ���쳣\����ģ��ԭ�� 10s';
FILEEXT = '.avi';
FILENUM = 99;
START = 1;
END = 99;
SHOWFLAG = 1;

%%
for i = START:END
    filename = make_name(FILEDIR, i, FILEEXT);
    aviObj = mmreader(filename);
    
    flag =['Now Processing: ', filename ]; disp(flag);
    stripe_main(aviObj, SHOWFLAG, i);
    flag =['Estimated Parameter is: ']; disp(flag);
end