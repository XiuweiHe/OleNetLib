function  olSaveSnapShot(aviObj, filename,i)

%%
DST_DIR = '.'; 

%%
img = read(aviObj, i);
imwrite(img, [filename, num2str(i), '.bmp'], 'bmp');

end

