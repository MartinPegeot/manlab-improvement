function lambda_Cell = getLambdaCell(Upp_Cell,sys)

lambda_Cell = cellfun(@(c) c(sys.getcoord('lambda'),:),Upp_Cell,...
    "UniformOutput",false);

end