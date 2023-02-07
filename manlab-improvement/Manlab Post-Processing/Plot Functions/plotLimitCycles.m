function plotLimitCycles(recastedDiagram,lambdaValue)

sys = recastedDiagram.sys;
H = sys.parameters.H;
nHarmonicTerms = 2*H+1;
nMainVariables = sys.nz;
Fs = sys.parameters.Fs;
timeVector = transpose(linspace(0,1,Fs));
cosVector = cos(2*pi*timeVector*(1:H));
sinVector = sin(2*pi*timeVector*(1:H));
harmonicComputationMatrix = [ones(Fs,1) cosVector sinVector];

Upp_Cell = recastedDiagram.Upp_Cell;
lambda_Cell = getLambdaCell(Upp_Cell,sys);
nCell = length(Upp_Cell);
segmentIndices = [];

for iCell = 1:nCell
    nPoint = length(lambda_Cell{iCell});
    if nPoint == 1
        break
    end
    for iPoint = 2:nPoint
        isInThisSegment = (lambda_Cell{iCell}(iPoint)-lambdaValue)*...
            (lambda_Cell{iCell}(iPoint-1)-lambdaValue) <= 0;
        if isInThisSegment
            segmentIndices(:,end+1) = [iCell ; iPoint];
        end
    end
end

nSegment = length(segmentIndices);
for iSegment = 1:nSegment
    iCell = segmentIndices(1,iSegment);
    iPoint = segmentIndices(2,iSegment);
    U = Upp_Cell{iCell}(:,iPoint);
    Ureshaped = reshape(U(1:sys.neq-1),nHarmonicTerms,nMainVariables);
    Utime{iSegment} = harmonicComputationMatrix*Ureshaped;
end

limitCycleFigure = figure("Name","Limit Cycles");
hold on
grid
axis square
for iSegment = 1:nSegment
    x = Utime{iSegment}(:,1);
    xDot = Utime{iSegment}(:,2);
    plot(x,xDot)
end
hold off
xlabel("$x$","Interpreter","latex","FontSize",20)
ylabel("$\frac{dx}{dt}$","Interpreter","latex","FontSize",20)
title(strcat("\mu = ",num2str(lambdaValue)))

end