function cellSquared = squareCell(cell1)

nCell = length(cell1);
cellSquared = cell(1,nCell);
for iCell = 1:nCell
    cellSquared{iCell} = cell1{iCell}.^2;
end

end