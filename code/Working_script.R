source("dataPreprocessing.R")
source("sampling.R")
source("Models/knn.R")
source("Models/glm.R")
source("Models/NB.R")
source("Models/RN.R")
source("preparation.R")

gg = generalSample(thoraric.removed)
test_data = gg$test
train_data = gg$train #train_data es una lista de dataframes

#Generar los super modelos
super.knn.model = getSuper.knn(train_data)
super.glm.model = getSuper.glm(train_data)
super.NB.model = getSuper.NB(train_data)

# i = 1
# resOfI = lapply(results.list, function(l) l[[i]])
# b = unlist(resOfI)
# justT = b[b == TRUE]
# ntrues = length(justT)
# retVal = ntrues > length(results.list)/2



# library(mlr)
# algo = makeLearner("classif.kknn")
# install.packages("kknn")

# i = 1
# evaluate_patient(i, results.list)

# fff = evaluateSuperModel(super.knn.model, test_data)
# fff
# test_data$DIED
# 
# hhh = data.frame(fff, test_data$DIED)
# colnames(hhh) = c("pred", "obs")
# f1(hhh)
# 
# nrow(test_data)
# 
# allfalses = rep(FALSE, 149)
# allfalses
# dfg = data.frame(allfalses, test_data$DIED)
# colnames(dfg) = c("pred", "obs")
# f1(dfg)
