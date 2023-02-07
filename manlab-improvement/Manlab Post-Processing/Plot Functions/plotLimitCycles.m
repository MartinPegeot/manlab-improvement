function plotLimitCycles(recastedDiagram,lambdaValue)

segmentIndices = findSegmentIndices(recastedDiagram,lambdaValue);
Utime = computeLimiteCyclesHBM(recastedDiagram,segmentIndices);
drawtype_Array = recastedDiagram.drawtype_Array;

limitCycleFigure = figure("Name","Limit Cycles");
hold on
grid
axis square
nSegment = length(segmentIndices.iCell);
for iSegment = 1:nSegment
    iCell = segmentIndices.iCell(iSegment);
    x = Utime{iSegment}(:,1);
    xDot = Utime{iSegment}(:,2);
    plot(x,xDot,strcat(drawtype_Array(iCell),"b"))
end
hold off
xlabel("$x$","Interpreter","latex","FontSize",20)
ylabel("$\frac{dx}{dt}$","Interpreter","latex","FontSize",20)
title(strcat("\mu = ",num2str(lambdaValue)))

end