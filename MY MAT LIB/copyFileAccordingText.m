fid=fopen('D:\STUDY\[1] ͼ����\ģ���ȼ��\������־\20140618\�㷨���ģ��\diransi.txt');
C = textscan(fid, '%s %s %s');
A= [C{1,1}(:) C{1,2}(:) C{1,3}(:)];
l = length(A);
i=1
while i <= l
    dir = [A{i,1},' ',A{i,2}, ' ', A{i,3}]
    try 
        copyfile(dir,'D:\STUDY\[1] ͼ����\ģ���ȼ��\������־\20140618\�㷨���ģ��\');
    catch err
        
    end
    i = i + 1;
end
fclose(fid);