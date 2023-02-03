function cosHarmonic_Cell = getCosHarmonicCell(Upp_Cell,sys,iHarmonic)

cosHarmonic_Cell = cellfun(@(c) c(sys.getcoord('cos',1,iHarmonic),:),...
    Upp_Cell,"UniformOutput",false);

end