function nPoint = countNumberOfPoints(cell1)

nCell = length(cell1);
nPoint = 0;
for iCell = 1:nCell
    nPoint = nPoint + size(cell1{iCell},2);
end

end