function addDiagramLegend(figure1)

bifurcationScatter = findobj(figure1,'type','scatter');
hold on
stableLegend = plot([0 0],[0 0],'-b',"DisplayName","Stable Solutions");
unstableLegend = plot([0 0],[0 0],':b',"DisplayName","Unstable Solutions");
hold off

if isempty(bifurcationScatter)
    legendDisplay = [stableLegend,unstableLegend];
else
    bifurcationScatter.DisplayName = "Bifurcations";
    legendDisplay = [stableLegend,unstableLegend,bifurcationScatter];
end

legend([stableLegend,unstableLegend,bifurcationScatter],"Location","best")

end