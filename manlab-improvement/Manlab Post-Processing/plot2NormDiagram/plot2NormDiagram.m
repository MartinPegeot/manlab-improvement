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
for iCurve = 1:nCurve
plot(lambda_Cell{iCurve},norm2_Cell{iCurve},strcat(drawtype_Array(iCurve),"b"))
end
scatter(lambdaBifurcation,norm2Bifurcation,'pentagramb')
hold off

end