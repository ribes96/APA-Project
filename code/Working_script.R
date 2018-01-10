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
# super.knn.model = getSuper.knn(train_data)
# super.glm.model = getSuper.glm(train_data)
# super.NB.model = getSuper.NB(train_data)

# results.list = lapply(super.knn.model, evaluateModel, data = test_data)


KNN.Result = function(train_data, test_data) {
  super.knn.model = getSuper.knn(train_data)
  predictions = evaluateSuperModel(
    superModel = super.knn.model,
    dframe = test_data
    )
  r = testSuperModel(predictions, test_data$DIED)
  return(r)
}

GLM.Result = function(train_data, test_data) {
  super.glm.model = getSuper.glm(train_data)
  predictions = evaluateSuperModel(
    superModel = super.glm.model,
    dframe = test_data
  )
  r = testSuperModel(predictions, test_data$DIED)
  return(r)
}

glm.res = GLM.Result(train_data, test_data)


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
