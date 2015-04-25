function oriVector = mapRandBack(randIdx, vector)

%%
nVector = length(vector);
oriVector = zeros(1, nVector);
for i = 1 : nVector 
    oriVector(randIdx(i)) = vector(i);   
end

end