% Main function
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

% Secondary function
function diagramInformations = storeDiagramInformations(diagram)

CONTINUITY_LIMIT = 1e-3;
X_Cell = {0};
Y_Cell = {0};
Xstab = [];
Ystab = [];
drawtype_Array = [diagram{1}.drawtype_init];
nDiagram = length(diagram);


for iDiagram = 1:nDiagram
    X = diagram{iDiagram}.X;
    Y = diagram{iDiagram}.Y;
    isXContinuous = abs(X_Cell{end}(end)-X(1)) < CONTINUITY_LIMIT;
    isYContinuous = abs(Y_Cell{end}(end)-Y(1)) < CONTINUITY_LIMIT;
    isBifurcating = diagram{iDiagram}.Astab > 0;
    if isXContinuous & isYContinuous & ~isBifurcating
        X_Cell{end} = [X_Cell{end} ; X];
        Y_Cell{end} = [Y_Cell{end} ; Y];
    elseif isBifurcating
        iBifurcation = diagram{iDiagram}.ind_change;
        Xstab(end+1) = diagram{iDiagram}.Xstab;
        Ystab(end+1) = diagram{iDiagram}.Ystab;
        X_Cell{end} = [X_Cell{end} ; X(1:iBifurcation-1) ; Xstab(end)];
        Y_Cell{end} = [Y_Cell{end} ; Y(1:iBifurcation-1) ; Ystab(end)];
        X_Cell{end+1} = [Xstab(end) ; X(iBifurcation:end)];
        Y_Cell{end+1} = [Ystab(end) ; Y(iBifurcation:end)];
        drawtype_Array(end+1) = diagram{iDiagram}.drawtype_end;
    else
        X_Cell{end+1} = X;
        Y_Cell{end+1} = Y;
        drawtype_Array(end+1) = diagram{iDiagram}.drawtype_end;
    end
end
nCurve = length(X_Cell);

diagramInformations = struct("X_Cell",{X_Cell},"Y_Cell",{Y_Cell},...
    "drawtype_Array",drawtype_Array,"Xstab",Xstab,"Ystab",Ystab,...
    "nCurve",nCurve);
end