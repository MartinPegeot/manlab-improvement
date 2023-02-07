function limitCycleFigure = plotLimitCycles(recastedDiagram,lambdaValue,...
    figureHandle,displayColor)

segmentIndices = findSegmentIndices(recastedDiagram,lambdaValue);
Utime = computeLimiteCyclesHBM(recastedDiagram,segmentIndices);
drawtype_Array = recastedDiagram.drawtype_Array;

if nargin == 2
    limitCycleFigure = figure("Name","Limit Cycles");
    displayColor = "b";
else
    limitCycleFigure = figureHandle;
end
hold on
nSegment = length(segmentIndices.iCell);
for iSegment = 1:nSegment
    iCell = segmentIndices.iCell(iSegment);
    x = Utime{iSegment}(:,1);
    xDot = Utime{iSegment}(:,2);
    plot(x,xDot,"LineStyle",drawtype_Array(iCell),"Color",displayColor)
end
hold off
grid
axis square
xlabel("$x$","Interpreter","latex","FontSize",20)
ylabel("$\frac{dx}{dt}$","Interpreter","latex","FontSize",20)
title(strcat("\mu = ",num2str(lambdaValue)))

end