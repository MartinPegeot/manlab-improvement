function norm2_Cell = getNorm2Cell(Upp_Cell,sys)

H = sys.parameters.H;
cosHarmonic_Cell = getCosHarmonicCell(Upp_Cell,sys,1);
sinHarmonic_Cell = getSinHarmonicCell(Upp_Cell,sys,1);
norm2_Cell = sumCells(squareCell(cosHarmonic_Cell),...
        squareCell(sinHarmonic_Cell));

for iHarmonic=2:H
    cosHarmonic_Cell = getCosHarmonicCell(Upp_Cell,sys,iHarmonic);
    sinHarmonic_Cell = getSinHarmonicCell(Upp_Cell,sys,iHarmonic);
    additionalNormTerm = sumCells(squareCell(cosHarmonic_Cell),...
        squareCell(sinHarmonic_Cell));
    norm2_Cell = sumCells(norm2_Cell,additionalNormTerm);
end
norm2_Cell = sqrtCell(norm2_Cell);  

end