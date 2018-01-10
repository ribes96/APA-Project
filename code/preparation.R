#Funciones para evaluar los modelos y calcular resultados

library(caret)
library(ROCR)

# Recibe un dataframe terminado de preprocesar y a proporción que se quiere usar para train y test, y...
#retorna un vector de TRUE y FALSE, uno para cada paciente de data
evaluateModel = function(model, data) {
  result = predict(model, newdata = data)
  return(result)
}

#patient_index indica al paciente que evaluamos
#restList es una lista 51 elementos, cada uno la predicción de un submodelo para todos los pacientes testeados
evaluate_patient = function(patient_index, resList) {
  resOfI = lapply(resList, function(l) l[[patient_index]])
  #resOfI contiene todos los resultados predichos para el paciente i
  
  b = unlist(resOfI)
  justT = b[b == TRUE]
  ntrues = length(justT)
  retVal = ntrues > length(resList)/2
  return(retVal)
}



# retorna un vector de TRUE o FALSE, que es el resultado de la votación de los modelos para cada paciente
evaluateSuperModel = function(superModel, dframe) {
  results.list.patata = lapply(superModel, evaluateModel, data = dframe)
  #results.list es una lista que contiene vectores de TRUE y FALSE
  # el elemento i de la lista contiene los resultados que ha dicho el
  # primero de los modelos.
  
  indices = 1:nrow(dframe)
  r = unlist(lapply(indices, evaluate_patient, resList = results.list.patata))
  # r es el vector de resultados definitivos, uno para cada paciente
  return(r)
}


#Retorna la puntuación que obtiene el súper modelo con los datos pasados,
# que se entiende que serán los de test
testSuperModel = function(pred, obs) {
  # pred = evaluateSuperModel(superModel, data)
  # obs = data$DIED
  dframe = data.frame(pred, obs)
  score = f1(dframe)
  return(score)
}


#Recibe un dataframe que ya ha pasado el preprocesado, y retorna una lista con el dataframe de test y con todos los bags de training
generalSample = function(df, TestProp = 1/3) {
  testIndex = sample(1:nrow(df), floor(TestProp*nrow(df)))
  df.test = df[testIndex,]
  df.train = df[-testIndex,]
  
  trainSample = getSample(df.train)
  retList = list(trainSample, df.test)
  retList = setNames(retList, c("train","test"))
  #superKNN = getSuper.knn(trainSample)
  return(retList)
}

setWeight = function(w = 1){
  weight <<- w
}

f1 = function(data, lev = NULL, model = NULL) {
  predicted = data$pred
  real = data$obs
  bothFalse = !predicted & !real
  just.both.false = bothFalse[bothFalse == T]
  rFpF = length(just.both.false)
  
  just.real.false = real[real == FALSE]
  rF = length(just.real.false)
  
  just.pred.false = predicted[predicted == FALSE]
  pF = length(just.pred.false)
  
  prec = rFpF / pF
  recall = rFpF / rF
  
  metric = 2 * (weight^2) * prec * recall/((weight^2) * prec + recall)
  out = metric
  names(out) = c("F1")
  out
}

# Se usa el mismo trainControl para todos los modelos
# TODO poner repeats = 10
trc <- trainControl (
  method="repeatedcv",
  number=5,
  repeats=1,
  summaryFunction = f1
)


#Calcula todos los resultados y retorna un dataframe con estos
getResults = function(){
  knn.res.orig = KNN.Result(train_data.orig, test_data.orig)
  nb.res.orig = NB.Result(train_data.orig, test_data.orig)
  glm.res.orig = GLM.Result(train_data.orig, test_data.orig)
  rn.res.orig = RN.Result(train_data.orig, test_data.orig)
  rf.res.orig = RF.Result(train_data.orig, test_data.orig)
  
  knn.res.rem = KNN.Result(train_data.rem, test_data.rem)
  nb.res.rem = NB.Result(train_data.rem, test_data.rem)
  glm.res.rem = GLM.Result(train_data.rem, test_data.rem)
  rn.res.rem = RN.Result(train_data.rem, test_data.rem)
  rf.res.rem = RF.Result(train_data.rem, test_data.rem)
  
  #F1 score con todo false
  # n = length(thoraric.original$DIED)
  # false = rep(FALSE, n)
  # d = thoraric.original$DIED
  # allF = matrix(c(false, d), ncol = 2)
  # colnames(allF) = c("pred", "obs")
  # allFalse.orig = f1(data.frame(allF))
  
  results = matrix(c(knn.res.orig, nb.res.orig, glm.res.orig, rn.res.orig, rf.res.orig,
                     knn.res.rem, nb.res.rem, glm.res.rem, rn.res.rem, rf.res.rem),
                   ncol = 2)
  rownames(results) = c("K-nearest neighbours", "Naive Bayes", "Linear Model", 
                        "Neural Net", "Random Forest")
  colnames(results) = c("Original", "Removed")
  r = data.frame(results)
  return(r)
}
