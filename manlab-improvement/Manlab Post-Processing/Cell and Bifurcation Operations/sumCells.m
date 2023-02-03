function cellSum = sumCells (cell1,cell2)

nCell = length(cell1);
cellSum = cell(1,nCell);
for iCell = 1:nCell
    cellSum{iCell} = cell1{iCell} + cell2{iCell};
end

end