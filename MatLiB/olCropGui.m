function olCropGui(img, dstDir, dstName)

%%
if ~exist(dstDir)
    mkdir(dstDir);
end

%%
[imcroped rect] = imcrop(img);
imcroped = imcroped;
if ~isempty(imcroped)
    imwrite(imcroped, dstName, 'bmp');
    movefile(dstName, dstDir,'f');
end

end