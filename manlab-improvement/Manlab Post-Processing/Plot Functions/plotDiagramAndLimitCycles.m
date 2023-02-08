function plotDiagramAndLimitCycles(recastedDiagram)

plotNorm2Diagram(recastedDiagram);
diagramFigure = gcf;
diagramAxis = gca;

mainFigure = figure("Name","2-Norma Diagram and Limit Cycles");
mainDiagramAxis = copyobj(diagramAxis,mainFigure);
set(mainFigure,'Units','normalize','OuterPosition',[0 .07 1 .85])
set(mainDiagramAxis,'Units','normalize','OuterPosition',[0 .5 1 .5])
set(mainDiagramAxis,'xlim',[-6 0.1])
close(diagramFigure)
addDiagramLegend(mainDiagramAxis)


nLambda = 5;
lambdaMin = -5.5;
lambdaMax = -0.1;
lambdaPlot = linspace(lambdaMin,lambdaMax,nLambda);

hold(mainDiagramAxis,"on")
for iLambda = 1:nLambda
    lambdaValue = lambdaPlot(iLambda);
    plotLimitCycles(recastedDiagram,lambdaValue)
    limitCycleFigures{iLambda} = gcf;
    limitCycleAxes{iLambda} = copyobj(gca,mainFigure);
    close(limitCycleFigures{iLambda})
    set(limitCycleAxes{iLambda},"Position",[(iLambda-1)/nLambda 0 .2 .4])
    plot(mainDiagramAxis,[lambdaValue lambdaValue],...
        ylim(mainDiagramAxis),'--k')
end
hold(mainDiagramAxis,"off")

end