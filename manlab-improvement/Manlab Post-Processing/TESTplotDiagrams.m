%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Manlab should have been launched at least once for diagram to be       %
% correctly interpreted.                                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear

addpath(genpath(".."))
pathName = "C:\Users\SONSmanip_001\Documents\Scientifique\Thèse\" + ...
    "Programmation\Systèmes\Van der Pol 5\VdP5 Manlab\" + ...
    "Données Exportées\";
diagramName = "BD_nu=0.1_sigma=-1.5_beta=1_H=50.mat";
sysName = "sys_nu=0.1_sigma=-1.5_beta=1_H=50.mat";

diagram = load(strcat(pathName,"Diagrams\",diagramName)).Diagram;
sys = load(strcat(pathName,"SysODE\",sysName)).sys;

recastedDiagram = recastDiagramInformations(diagram,sys);

plotManlabDiagram(recastedDiagram)
plotNorm2Diagram(recastedDiagram)
plotEigenValues(recastedDiagram)
plotLimitCycles(recastedDiagram,-1)
