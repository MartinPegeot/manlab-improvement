function Utime = computeLimiteCyclesHBM(recastedDiagram,segmentIndices)

sys = recastedDiagram.sys;
Upp_Cell = recastedDiagram.Upp_Cell;
H = sys.parameters.H;
nHarmonicTerms = 2*H+1;
nMainVariables = sys.nz;
SAMPLING_FREQUENCY = sys.parameters.SAMPLING_FREQUENCY;
timeVector = transpose(linspace(0,1,SAMPLING_FREQUENCY));
cosVector = cos(2*pi*timeVector*(1:H));
sinVector = sin(2*pi*timeVector*(1:H));
harmonicComputationMatrix = [ones(SAMPLING_FREQUENCY,1) cosVector ...
    sinVector];

nSegment = length(segmentIndices.iCell);
Utime = cell(1,nSegment);

for iSegment = 1:nSegment
    iCell = segmentIndices.iCell(iSegment);
    iPoint = segmentIndices.iPoint(iSegment);
    U = Upp_Cell{iCell}(:,iPoint);
    Ureshaped = reshape(U(1:sys.neq-1),nHarmonicTerms,nMainVariables);
    Utime{iSegment} = harmonicComputationMatrix*Ureshaped;
end

end