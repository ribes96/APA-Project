#Funciones para todos los modelos que calculan el F1 de test

KNN.Result = function(train_data, test_data) {
  super.knn.model = getSuper.knn(train_data)
  predictions = evaluateSuperModel(
    superModel = super.knn.model,
    dframe = test_data
  )
  r = testSuperModel(predictions, test_data$DIED)
  conf = confusionMatrix(predictions, test_data$DIED)
  dat = list(r, conf)
  names(dat) = c("Error", "ConfMatrix")
  return(dat)
}

NB.Result = function(train_data, test_data) {
  super.nb.model = getSuper.NB(train_data)
  predictions = evaluateSuperModel(
    superModel = super.nb.model,
    dframe = test_data
  )
  r = testSuperModel(predictions, test_data$DIED)
  conf = confusionMatrix(predictions, test_data$DIED)
  dat = list(r, conf)
  names(dat) = c("Error", "ConfMatrix")
  return(dat)
}

GLM.Result = function(train_data, test_data) {
  super.glm.model = getSuper.glm(train_data)
  predictions = evaluateSuperModel(
    superModel = super.glm.model,
    dframe = test_data
  )
  r = testSuperModel(predictions, test_data$DIED)
  conf = confusionMatrix(predictions, test_data$DIED)
  dat = list(r, conf)
  names(dat) = c("Error", "ConfMatrix")
  return(dat)
}

RN.Result = function(train_data, test_data) {
  super.rn.model = getSuper.rn(train_data)
  predictions = evaluateSuperModel(
    superModel = super.rn.model,
    dframe = test_data
  )
  r = testSuperModel(predictions, test_data$DIED)
  conf = confusionMatrix(predictions, test_data$DIED)
  dat = list(r, conf)
  names(dat) = c("Error", "ConfMatrix")
  return(dat)
}

RF.Result = function(train_data, test_data) {
  super.rf.model = getSuper.rf(train_data)
  predictions = evaluateSuperModel(
    superModel = super.rf.model,
    dframe = test_data
  )
  r = testSuperModel(predictions, test_data$DIED)
  conf = confusionMatrix(predictions, test_data$DIED)
  dat = list(r, conf)
  names(dat) = c("Error", "ConfMatrix")
  return(dat)
}