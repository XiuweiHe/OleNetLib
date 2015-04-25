function [ma] = olCvt01Matrix(vec, sz)

%%
ma = zeros(sz, 'single');
len = sz(2);
for i = 1 : len
    ma(vec(i), i) = 1;
end

end