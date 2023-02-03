function sinHarmonic_Cell = getSinHarmonicCell(Upp_Cell,sys,iHarmonic)

sinHarmonic_Cell = cellfun(@(c) c(sys.getcoord('sin',1,iHarmonic),:),...
    Upp_Cell,"UniformOutput",false);

end