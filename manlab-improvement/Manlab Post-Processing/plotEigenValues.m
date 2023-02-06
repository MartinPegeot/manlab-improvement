function plotEigenValues(recastedDiagram,sys)

eigenValues_Cell = recastedDiagram.eigenValues_Cell;
eigenIndex_Cell = recastedDiagram.eigenIndex_Cell;
eigenValuesBifurcation = recastedDiagram.eigenValuesBifurcation;
Upp_Cell = recastedDiagram.Upp_Cell;
lambda_Cell = getLambdaCell(Upp_Cell,sys);
Ustab = recastedDiagram.Ustab;
lambdaBifurcation = getLambdaBifurcation(Ustab,sys);

nCurve = recastedDiagram.nCurve;
drawtype_Array = recastedDiagram.drawtype_Array;


figure("Name","Eigen Values")
hold on
grid
for iCurve = 1:nCurve
    plot(lambda_Cell{iCurve}(eigenIndex_Cell{iCurve}),...
        real(eigenValues_Cell{iCurve}),strcat(drawtype_Array(iCurve),'b'))
end
stableLegend = plot([0 0],[0 0],'-b',"DisplayName","Stable Solutions");
unstableLegend = plot([0 0],[0 0],':b',"DisplayName","Unstable Solutions");
bifurcationPlots = plot(lambdaBifurcation,real(eigenValuesBifurcation),'pentagramb',"DisplayName",...
    "Bifurcations");
hold off
legend([stableLegend,unstableLegend,bifurcationPlots],"Location","best")


end