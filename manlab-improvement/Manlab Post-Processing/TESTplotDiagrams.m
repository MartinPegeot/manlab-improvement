%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Manlab should have been launched at least once for diagram to be       %
% correctly interpreted.                                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear

addpath(genpath(".."))
pathName = "C:\Users\SONSmanip_001\Documents\Scientifique\Thèse\" + ...
    "Programmation\Systèmes\Van der Pol 5\VdP5 Manlab\" + ...
    "Données Exportées\";
diagramName = "BD_nu=0.1_sigma=-1.5_beta=1_H=80.mat";
sysName = "sys_nu=0.1_sigma=-1.5_beta=1_H=80.mat";

diagram = load(strcat(pathName,"Diagrams\",diagramName)).Diagram;
sys = load(strcat(pathName,"SysODE\",sysName)).sys;

cuttedDiagram = {diagram{1:344}};

recastedDiagram = recastDiagramInformations(cuttedDiagram,sys);

plotDiagramAndLimitCycles(recastedDiagram)

% plotManlabDiagram(recastedDiagram)
% plotNorm2Diagram(recastedDiagram)
% plotEigenValues(recastedDiagram)
% plotLimitCycles(recastedDiagram,-1)
% plotMultipleLimitCycles(recastedDiagram,[-5.5,0,10]);
