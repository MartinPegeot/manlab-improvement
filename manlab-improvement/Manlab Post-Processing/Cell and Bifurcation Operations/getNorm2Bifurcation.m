function norm2Bifurcation = getNorm2Bifurcation(Ustab,sys)

H = sys.H;
nBifurcation = size(Ustab,2);
norm2Bifurcation = zeros(1,nBifurcation);
for iHarmonic = 1:H
    cosHarmonic = Ustab(sys.getcoord("cos",1,iHarmonic),:);
    sinHarmonic = Ustab(sys.getcoord("sin",1,iHarmonic),:);
    norm2Bifurcation = norm2Bifurcation + cosHarmonic.^2 + sinHarmonic.^2;
end
norm2Bifurcation = sqrt(norm2Bifurcation);

end