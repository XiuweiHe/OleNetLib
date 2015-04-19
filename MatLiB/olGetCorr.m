function  [ SROCC, KROCC, SPOCC ] = olGetCorr( a, b )

%%
SROCC1 = corr(a, b, 'type', 'Spearman');
KROCC1 = corr(a, b, 'type', 'kendall');
SPOCC1 = corr(a, b, 'type', 'Pearson');
SROCC = SROCC1;
KROCC = KROCC1;
SPOCC = SPOCC1;

end