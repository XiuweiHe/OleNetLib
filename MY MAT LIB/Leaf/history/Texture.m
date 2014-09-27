%**************************************************************************
%���ڹ�����������������ȡ��d=1,��=0��,45��,90��,135�㹲�ĸ�����
%����ͼ��Ҷȼ���Ϊ256
%function : T=Texture(Image)
%Gray     : ����Ҷ�ͼ��
%T        : ���ذ�ά��������������
%G        : ���ػҶȹ�������
%**************************************************************************
function [Fe G] = Texture(OrignGray,SHOWFLAG,fileName)
Gray = OrignGray;
[M,N] = size(Gray);
dis = 1;
% %--------------------------------------------------------------------------
% %1.Ϊ�˼��ټ���������ԭʼͼ��Ҷȼ�ѹ������Gray������16��
% %--------------------------------------------------------------------------

T = [0,31,62,93,124,155,186,217,248,255];
for i =1:length(T)-1
    Gray(find(Gray(:,:) >= T(i) & Gray(:,:) < T(i+1))) = i-1;
end
Gray(find(Gray(:,:) >= T(i))) = i-1;
grayscale = i;

%--------------------------------------------------------------------------
%2.�����ĸ���������P,ȡ����Ϊdis���Ƕȷֱ�Ϊ0,45,90,135
%--------------------------------------------------------------------------

P = zeros(grayscale,grayscale,4);
for i = 1:M
    for j = 1:N
        if j<N-dis+1
            P(Gray(i,j)+1,Gray(i,j+dis)+1,1) = P(Gray(i,j)+1,Gray(i,j+dis)+1,1)+1;
        end
        if i>dis&j<N-dis+1
            P(Gray(i,j)+1,Gray(i-dis,j+dis)+1,2) = P(Gray(i,j)+1,Gray(i-dis,j+dis)+1,2)+1;
        end
        if i<M-dis+1
            P(Gray(i,j)+1,Gray(i+dis,j)+1,3) = P(Gray(i,j)+1,Gray(i+dis,j)+1,3)+1;
        end
        if i<M-dis+1&j<N-dis+1
            P(Gray(i,j)+1,Gray(i+dis,j+dis)+1,4) = P(Gray(i,j)+1,Gray(i+dis,j+dis)+1,4)+1;
        end
    end
end
%%---------------------------------------------------------
% 3.�Թ��������һ��
%%---------------------------------------------------------
for n = 1:4
    P(:,:,n) = P(:,:,n)/(sum(sum(P(:,:,n)))+1);
end
G = P;
%--------------------------------------------------------------------------
%4.�Թ�����������������ء����Ծء����4���������
%--------------------------------------------------------------------------
H = zeros(1,4);
E = H;
deltaX = H;  deltaY = H;
C = H;
M = H;
MV = H;
V = H;
for n = 1:4
    E(n) = sum(sum(P(:,:,n).^2)); %%����
    for i = 1:grayscale-1
        for j = 1:grayscale-1
            if P(i,j,n)~=0
                H(n) = -P(i,j,n)*log(P(i,j,n))+H(n); %%��
            end
            M(n) = P(i,j,n)/(1+(i-j)^2)+M(n);%%IDM��ضȣ�����־���
        end
    end
end

%--------------------------------------------------------------------------
%���������ء����Ծء���صľ�ֵ�ͱ�׼����Ϊ����16ά��������
%--------------------------------------------------------------------------
a1 = mean(E);
b1 = sqrt(cov(E));
a2 = mean(H);
b2 = sqrt(cov(H));
a3 = mean(M);
b3 = sqrt(cov(M));
a4 = mean(MV);
b4 = sqrt(cov(MV));
a5 = mean(V);
b5 = sqrt(cov(V));
Fe = [a1,a2,a3,a4,a5]';

if SHOWFLAG
    h = figure (1);
    set(h, 'Name','IMVL Debug Window','NumberTitle','off', 'position', get(0,'ScreenSize')); colormap(hot);
    subplot(1,2,1);
    imagesc(Gray);
    title(['original img',num2str(fileName)]);
    subplot(1,2,2);
    imshow(Gray);
    title(['original img',num2str(fileName)]);
    pause;
end


