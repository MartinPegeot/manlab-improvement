function recastedDiagram = recastDiagramInformations(diagram,sys)
% Gives a recasted diagram structure keeping only the variables usefull for 
% post-processing and dividing the data at singular points (bifurcations 
% and discontinuity). This allows to plot clean figures with a reasonable
% number of graphical objects.

[Upp_Cell, X_Cell, Y_Cell, Ustab, Xstab, Ystab, drawtype_Array,...
    eigenValues_Cell, eigenVectors_Cell, eigenIndex_Cell, eigenValuesBifurcation, ...
    eigenVectorsBifurcation, nDiagram] = initiateDiagramRecasting(diagram);

for iDiagram = 2:nDiagram
    previousSection = diagram{iDiagram-1};
    currentSection = diagram{iDiagram};
    X = currentSection.X;
    Y = currentSection.Y;
    Upp = currentSection.Upp;
    eigenVectors = currentSection.Eigen_end.vectors;
    eigenValues = currentSection.Eigen_end.values;

    isContinuous = testContinuity(previousSection,currentSection);
    isBifurcating = testBifurcationPresence(currentSection);
    if isContinuous && ~isBifurcating
        X_Cell{end} = [X_Cell{end} ; X];
        Y_Cell{end} = [Y_Cell{end} ; Y];
        Upp_Cell{end} = [Upp_Cell{end} Upp];
        eigenVectors_Cell{end} = [eigenVectors_Cell{end} eigenVectors];
        eigenValues_Cell{end} = [eigenValues_Cell{end} eigenValues];
        nPoint = size(Upp_Cell{end},2);
        eigenIndex_Cell{end} = [eigenIndex_Cell{end} nPoint];
    elseif isBifurcating
        iBifurcation = currentSection.ind_change;
        Xstab(end+1) = currentSection.Xstab;
        Ystab(end+1) = currentSection.Ystab;
        Ustab(:,end+1) = currentSection.Ustab;
        X_Cell{end} = [X_Cell{end} ; X(1:iBifurcation-1) ; Xstab(end)];
        Y_Cell{end} = [Y_Cell{end} ; Y(1:iBifurcation-1) ; Ystab(end)];
        Upp_Cell{end} = [Upp_Cell{end} Upp(:,1:iBifurcation-1) Ustab(:,end)];
        X_Cell{end+1} = [Xstab(end) ; X(iBifurcation:end)];
        Y_Cell{end+1} = [Ystab(end) ; Y(iBifurcation:end)];
        Upp_Cell{end+1} = [Ustab(:,end) Upp(:,iBifurcation:end)];
        drawtype_Array(end+1) = currentSection.drawtype_end;
        eigenVectors_Cell{end+1} = eigenVectors;
        eigenValues_Cell{end+1} = eigenValues;
        nPoint = size(Upp_Cell{end},2);
        eigenIndex_Cell{end+1} = nPoint;
        eigenValuesBifurcation(end+1) = currentSection.Eigen.values;
        eigenVectorsBifurcation(:,end+1) = currentSection.Eigen.vectors;
    else
        X_Cell{end+1} = X;
        Y_Cell{end+1} = Y;
        Upp_Cell{end+1} = Upp;
        eigenVectors_Cell{end+1} = eigenVectors;
        eigenValues_Cell{end+1} = eigenValues;
        drawtype_Array(end+1) = diagram{iDiagram}.drawtype_end;
        nPoint = size(Upp_Cell{end},2);
        eigenIndex_Cell{end+1} = nPoint;
    end
end
nCurve = length(X_Cell);

recastedDiagram = struct("Upp_Cell",{Upp_Cell},"X_Cell",{X_Cell},...
    "Y_Cell",{Y_Cell},"Ustab",Ustab,"Xstab",Xstab,"Ystab",Ystab,...
    "eigenValues_Cell",{eigenValues_Cell},"eigenVectors_Cell",...
    {eigenVectors_Cell},"eigenIndex_Cell",{eigenIndex_Cell},...
    "eigenValuesBifurcation",eigenValuesBifurcation,...
    "eigenVectorsBifurcation",eigenVectorsBifurcation,"drawtype_Array",...
    drawtype_Array,"nCurve",nCurve,"sys",sys);
end

function [Upp_Cell, X_Cell, Y_Cell, Ustab, Xstab, Ystab, drawtype_Array,...
    eigenValues_Cell, eigenVectors_Cell, eigenIndex_Cell, eigenValuesBifurcation, ...
    eigenVectorsBifurcation, nDiagram] = initiateDiagramRecasting(diagram)

firstSection = diagram{1};
Upp = firstSection.Upp;
X = firstSection.X;
Y = firstSection.Y;
Ustab = [firstSection.Ustab];
Xstab = [firstSection.Xstab];
Ystab = [firstSection.Ystab];
drawtype_Array = [firstSection.drawtype_init];
eigenValues = firstSection.Eigen.values;
eigenVectors = firstSection.Eigen.vectors;
eigenValuesBifurcation = [];
eigenVectorsBifurcation = [];
nDiagram = length(diagram);

isBifurcating = testBifurcationPresence(firstSection);
if isBifurcating
    iBifurcation = firstSection.ind_change;
    X_Cell = {[X(1:iBifurcation-1) ; Xstab]};
    Y_Cell = {[Y(1:iBifurcation-1) ; Ystab]};
    Upp_Cell = {[Upp(:,1:iBifurcation-1) Ustab]};
    X_Cell{end+1} = [Xstab ; X(iBifurcation:end)];
    Y_Cell{end+1} = [Ystab ; Y(iBifurcation:end)];
    Upp_Cell{end+1} = [Ustab Upp(:,iBifurcation:end)];
    drawtype_Array(end+1) = firstSection.drawtype_end;
    eigenVectors_Cell{2} = eigenVectors;
    eigenValues_Cell{2} = eigenValues;
    eigenIndex_Cell{2} = size(Upp_Cell{end},2);
    eigenValuesBifurcation = [firstSection.Eigen.values];
    eigenVectorsBifurcation = [firstSection.Eigen.vectors];
else
    Upp_Cell = {Upp};
    X_Cell = {X};
    Y_Cell = {Y};
    eigenVectors_Cell{1} = eigenVectors;
    eigenValues_Cell{1} = eigenValues;
    eigenIndex_Cell{1} = size(Upp_Cell{end},2);
end

end


function isContinuous = testContinuity(previousSection,currentSection)

CONTINUITY_LIMIT = 1e-3;
X1 = previousSection.X(end);
Y1 = previousSection.Y(end);
X2 = currentSection.X(1);
Y2 = currentSection.Y(1);
isXContinuous = abs(X1-X2) < CONTINUITY_LIMIT;
isYContinuous = abs(Y1-Y2) < CONTINUITY_LIMIT;
isContinuous = isXContinuous & isYContinuous;

end

function isBifurcating = testBifurcationPresence(section)

isBifurcating = section.BifStatus ~= "nothing";

end