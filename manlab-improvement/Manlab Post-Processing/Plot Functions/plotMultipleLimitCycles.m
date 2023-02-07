function plotMultipleLimitCycles(recastedDiagram,lambdaGridInformations)

sys = recastedDiagram.sys;
Upp_Cell = recastedDiagram.Upp_Cell;
lambda_Cell = getLambdaCell(Upp_Cell,sys);
lambda_Array = cell2mat(lambda_Cell);

nLambda = lambdaGridInformations(end);
if length(lambdaGridInformations) == 1
    lambdaMin = min(lambda_Array);
    lambdaMax = max(lambda_Array);
else
    lambdaMin = lambdaGridInformations(1);
    lambdaMax = lambdaGridInformations(2);
end
lambdaPlot = linspace(lambdaMin,lambdaMax,nLambda);

limitCycleFigure = figure("Name","Multiple Limit Cycles");
colorOrder = dispcolorML(nLambda);

for iLambda = 1:nLambda
    displayColor = colorOrder(iLambda,:);
    limitCycleFigure = plotLimitCycles(recastedDiagram,...
    lambdaPlot(iLambda),limitCycleFigure,displayColor);
    hold on
    legendNames(iLambda) = plot(0,0,"Color",displayColor,"DisplayName",...
        strcat("\mu = ",num2str(lambdaPlot(iLambda))));
end
hold off
legend(legendNames)
title('')
axis square
grid on
end