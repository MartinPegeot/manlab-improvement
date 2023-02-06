function lambdaBifurcation = getLambdaBifurcation(Ustab,sys)

lambdaBifurcation = Ustab(sys.getcoord("lambda",1),:);

end