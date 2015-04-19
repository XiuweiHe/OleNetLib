function list = olSplitList(list, nfold)

%%
l = length(list);
while 1
    if mod(l, nfold) == 0
        break;
    end
    l = l + 1;
end

step = l/ nfold;
list_temp = cell(1, nfold);
for i = 1 : nfold
    list_temp{i} = list((i-1)*step+1 : min(length(list), (i-1)*step+step));
end
list = list_temp;