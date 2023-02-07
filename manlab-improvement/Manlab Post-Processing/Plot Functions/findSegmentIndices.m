function segmentIndices = findSegmentIndices(recastedDiagram,lambdaValue)

sys = recastedDiagram.sys;
Upp_Cell = recastedDiagram.Upp_Cell;
lambda_Cell = getLambdaCell(Upp_Cell,sys);
nCell = length(Upp_Cell);
segmentIndices = struct("iCell",[],"iPoint",[]);

for iCell = 1:nCell
    nPoint = length(lambda_Cell{iCell});
    if nPoint == 1
        break
    end
    for iPoint = 2:nPoint
        isInThisSegment = (lambda_Cell{iCell}(iPoint)-lambdaValue)*...
            (lambda_Cell{iCell}(iPoint-1)-lambdaValue) <= 0;
        if isInThisSegment
            segmentIndices.iCell(end+1) = iCell;
            segmentIndices.iPoint(end+1) = iPoint;
        end
    end
end