function plotDiagram(diagram)

diagramInformations = storeDiagramInformations(diagram);

X_Cell = diagramInformations.X_Cell;
Y_Cell = diagramInformations.Y_Cell;
Xstab = diagramInformations.Xstab;
Ystab = diagramInformations.Ystab;
drawtype_Array = diagramInformations.drawtype_Array;
nCurve = diagramInformations.nCurve;

figure("Name","Plot Test")
hold on
for iCurve = 1:nCurve
plot(X_Cell{iCurve},Y_Cell{iCurve},strcat(drawtype_Array(iCurve),"b"))
end
scatter(Xstab,Ystab,'pentagramb')
hold off

end