function  olSaveSnapShot(aviObj, filename, ith)

%%
img = read(aviObj, ith);
imwrite(img, [filename, num2str(ith), '.bmp'], 'bmp');

end

