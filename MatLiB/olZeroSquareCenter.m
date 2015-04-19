function Iout = olZeroSquareCenter( Iin, W )
%I0 is an input image
%R is half the length of black box.
%Function is in the center of the image shows a black box
%
%Authors: OleNet
%Copyright (C) 2014-12 OleNet
%All rights reserved.
%
%modified date: 2014-12-10

%%
[M, N, S] = size(I0);
CY = floor(M/2) + 1;
CX = floor(N/2) + 1;

halfW = floor(W/2);
Iout = Iin;
Iout( CY - halfW : CY + halfW, CX - halfW : CX + halfW, 1:S ) = 0;

end

