function [ I2 ] = symmetry_img( I1, loop )
%%
%��ͼ�����Ҿ���Գ�
%loopΪ������ԳƵĴ���
%�õ��Ľ��Ϊ��Ӧ��ĻҶȲ�ֵС��T��ͼƬ

%%
T = 10;

%%
if loop==0
     I2 = I1;
else
    [M, N] = size(I1);
    X1 = floor(N/2);
    X2 = floor(N/2)+1;
    IL = I1(:, 1:X1);
    IR = I1(:, X2:X2+X1-1);    
    IL = symmetry_img( IL, loop-1);
    IR = symmetry_img( IR, loop-1 );
    IRf = fliplr(IR);
    Diff = abs(IL-IRf);
    mask = Diff<T;%�õ����Ƶĵ��Ӧ���ɰ�
    IL = mask .* IL;
    IR = fliplr(mask .* IRf);
    I2(:, 1:X1) = IL;
    I2(:, X2:X2+X1-1) = IR ;
    I2(:, N) = I1(N);
end

end

