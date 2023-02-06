function plot2NormDiagram(recastedDiagram,sys)

Upp_Cell = recastedDiagram.Upp_Cell;
Ustab = recastedDiagram.Ustab;
drawtype_Array = recastedDiagram.drawtype_Array;
nCurve = recastedDiagram.nCurve;

lambda_Cell = getLambdaCell(Upp_Cell,sys);
norm2_Cell = getNorm2Cell(Upp_Cell,sys);

lambdaBifurcation = Ustab(sys.getcoord("lambda",1),:);
norm2Bifurcation = getNorm2Bifurcation(Ustab,sys);

figure("Name","2-Norm Diagram")
hold on
grid
for iCurve = 1:nCurve
plot(lambda_Cell{iCurve},norm2_Cell{iCurve},strcat(drawtype_Array(iCurve),"b"))
end
stableLegend = plot([0 0],[0 0],'-b',"DisplayName","Stable Solutions");
unstableLegend = plot([0 0],[0 0],':b',"DisplayName","Unstable Solutions");
bifurcationPlots = scatter(lambdaBifurcation,norm2Bifurcation,...
    "pentagramb","DisplayName","Bifurcations");
hold off
legend([stableLegend,unstableLegend,bifurcationPlots],"Location","best")

end