function plotManlabDiagram(recastedDiagram)

X_Cell = recastedDiagram.X_Cell;
Y_Cell = recastedDiagram.Y_Cell;
Xstab = recastedDiagram.Xstab;
Ystab = recastedDiagram.Ystab;
drawtype_Array = recastedDiagram.drawtype_Array;
nCurve = recastedDiagram.nCurve;

figure("Name","Manlab Diagram")
hold on
grid
for iCurve = 1:nCurve
plot(X_Cell{iCurve},Y_Cell{iCurve},strcat(drawtype_Array(iCurve),"b"))
end
stableLegend = plot([0 0],[0 0],'-b',"DisplayName","Stable Solutions");
unstableLegend = plot([0 0],[0 0],':b',"DisplayName","Unstable Solutions");
bifurcationPlots = scatter(Xstab,Ystab,"pentagramb","DisplayName",...
    "Bifurcations");
hold off
legend([stableLegend,unstableLegend,bifurcationPlots],"Location","best")

end