function cellSqrt = sqrtCell(cell1)

nCell = length(cell1);
for iCell = 1:nCell
    cellSqrt{iCell} = sqrt(cell1{iCell});
end

end