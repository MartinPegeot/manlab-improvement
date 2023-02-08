function plotDiagramAndLimitCycles...
    (recastedDiagram)

plotNorm2Diagram(recastedDiagram);
diagramFigure = gcf;
diagramAxis = gca;

nLambda = 5;
lambdaMin = -5.5;
lambdaMax = -0.1;
lambdaPlot = linspace(lambdaMin,lambdaMax,nLambda);
for iLambda = 1:nLambda
    lambdaValue = lambdaPlot(iLambda);
    plotLimitCycles(recastedDiagram,...
        lambdaValue);
    limitCycleFigures{iLambda} = gcf;
    limitCycleAxes{iLambda} = gca;
end

mainFigure = figure("Name","2-Norma Diagram and Limit Cycles");
set(mainFigure,"Units","normalized","OuterPosition",[0 0.1 1 0.8])
mainLayout = tiledlayout(3,nLambda);

mainDiagramAxis = copyobj(diagramAxis,mainLayout);
close(diagramFigure)
mainDiagramAxis.Layout.Tile = 1:nLambda;
mainDiagramAxis.Layout.TileSpan = [2 nLambda];
set(mainDiagramAxis,'xlim',[-6 0.1])
mainYlim = ylim;
limitCycleLimits = [-mainYlim(end) mainYlim(end)];
hold(mainDiagramAxis,"on")
for iLambda = 1:nLambda
    mainLimitCycleAxes{iLambda} = copyobj(limitCycleAxes{iLambda},...
        mainLayout);
    mainLimitCycleAxes{iLambda}.Layout.Tile = 2*nLambda+iLambda;
    mainLimitCycleAxes{iLambda}.Layout.TileSpan = [1 1];
    xlim(mainLimitCycleAxes{iLambda},limitCycleLimits);
    ylim(mainLimitCycleAxes{iLambda},limitCycleLimits);
    close(limitCycleFigures{iLambda})
    lambdaValue = lambdaPlot(iLambda);
    plot(mainDiagramAxis,[lambdaValue lambdaValue],...
        ylim(mainDiagramAxis),'--k')
end
hold(mainDiagramAxis,"off")

end