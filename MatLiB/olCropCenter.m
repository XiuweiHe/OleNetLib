function output = olCropCenter(I, SZ)

%%
if ndims(I) > 2
    output(:,:,1) = crop_center(I(:,:,1), SZ);
    output(:,:,2) = crop_center(I(:,:,2), SZ);
    output(:,:,3) = crop_center(I(:,:,3), SZ);
else
    [M, N, ~] = size(I);
    if M < SZ || N < SZ
        scale_ratio = max(SZ/M, SZ/N);
        I = imresize(I, scale_ratio);
    end
    center_m = ceil(M/2);
    center_n = ceil(N/2);
    output = I( max(center_m - floor(SZ/2), 1) : min(center_m+floor(SZ/2), M), ...
        max(center_n-SZ/2,1) : min(center_n+floor(SZ/2), N));
    output = imresize(output, [SZ SZ]);
end
