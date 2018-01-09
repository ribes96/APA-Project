source("dataPreprocessing.R")
source("superKNN.R")
source("sampling.R")
source("Models/knn.R")
source("preparation.R")

gg = generalSample(thoraric.removed)
test_data = gg$test
train_data = gg$train #train_data es una lista de dataframes


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

