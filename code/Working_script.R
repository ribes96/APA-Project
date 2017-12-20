source("dataPreprocessing.R")
source("superKNN.R")
source("sampling.R")
source("Models/knn.R")
source("preparation.R")
source("")
source("")

gg = generalSample(thoraric.removed)
test_data = gg$test
train_data = gg$train #train_data es una lista de dataframes

super.knn.model = getSuper.knn(train_data)
results.list = lapply(super.knn.model, evaluateModel, data = test_data)

i = 1
resOfI = lapply(results.list, function(l) l[[i]])
b = unlist(resOfI)
justT = b[b == TRUE]
ntrues = length(justT)
retVal = ntrues > length(results.list)/2



library(mlr)
algo = makeLearner("classif.kknn")
install.packages("kknn")
