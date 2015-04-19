function olDelEmptyFolder(tarDir)

%%
fs = dir(tarDir) ;

for i = 3 : length(fs) % skip . and ..
    subf = [pth, fs(i).name];
    files = dir(subf);
    if( isempty(files) );
        display(['remove dir ', subf]);
        rmdir(subf);
    end
end

end