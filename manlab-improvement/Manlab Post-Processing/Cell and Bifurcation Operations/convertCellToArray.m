function newArray = convertCellToArray(formerCell)

nCell = length(formerCell);
newArray = [];
for iCell = 1:nCell
    newArray = [newArray formerCell{iCell}];
end

end