function patchCell = olIm2Patch(img, sz, stride)

%%
blk_size = sz;
[M, N, K] = size(img);
patch_num = floor((M - blk_size(1))/stride + 1) * floor((N - blk_size(2)) / stride +1);
patchCell = cell(patch_num, 1);

count = 1;
for r = 1 : stride : M
    for c = 1 : stride : N
        blk = img(...
            r : r+blk_size(1)-1,...
            c : c+blk_size(2)-1, ...
            :);
        patchCell{count,1} = blk;
        count = count + 1;
    end
end

% patchArray = cat(4, patchCell{:});
end