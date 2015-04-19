function patchs = olIm2Patch(img, sz, stride)

%%
blk_size = sz;
[M, N, K] = size(img);
patch_num = floor((M - blk_size(1)/2 )/stride) * floor((N - blk_size(2)/2 ) / stride);
patchs = zeros(sz(1), sz(2), size(img, 3), patch_num, 'single');

ind = 1;
for r = blk_size(1)/2+1 : stride : M - blk_size(1)/2 
    for c = blk_size(2)/2+1 : stride : N -blk_size(2)/2
        blk = img(...
            r-blk_size(1)/2 : r+blk_size(1)/2-1,...
            c-blk_size(2)/2 : c+blk_size(2)/2-1, ...
            :);
        patchs(:,:,:,ind) = blk;
        ind = ind + 1;
    end
end

end