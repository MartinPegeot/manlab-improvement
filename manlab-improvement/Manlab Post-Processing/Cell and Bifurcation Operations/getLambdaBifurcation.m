function lambdaBifurcation = getLambdaBifurcation(Ustab,sys)

nBifurcation = size(Ustab,2);
for iBifurcation = 1:nBifurcation
    lambdaBifurcation(iBifurcation) = Ustab(sys.getcoord("lambda"));
end

end