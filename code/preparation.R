#Funciones para evaluar los modelos



library(caret)
library(ROCR)

# Recibe un dataframe terminado de preprocesar y a proporción que se quiere usar para train y test, y...

#superModel es una lista de modelos
# instance es uno de los pacientes

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
  retVal = ntrues > length(results.list)/2
  return(retVal)
}



# retorna un vector de TRUE o FALSE, que es el resultado de la votación de los modelos para cada paciente
evaluateSuperModel = function(superModel, df) {
  results.list = lapply(superModel, evaluateModel, data = df)
  #results.list es una lista que contiene vectores de TRUE y FALSE
  # el elemento i de la lista contiene los resultados que ha dicho el
  # primero de los modelos.
  
  indices = 1:nrow(df)
  r = unlist(lapply(indices, evaluate_patient, resList = results.list))
  # r es el vector de resultados definitivos, uno para cada paciente
  return(r)
}

# f1 = function(data, lev = NULL, model = NULL) {
#   predicted = data$pred
#   real = data$obs
#   bothFalse = !predicted & !real
#   just.both.false = bothFalse[bothFalse == T]
#   rFpF = length(just.both.false)
#   
#   just.real.false = real[real == FALSE]
#   rF = length(just.real.false)
#   
#   just.pred.false = predicted[predicted == FALSE]
#   pF = length(just.pred.false)
#   
#   prec = rFpF / pF
#   recall = rFpF / rF
#   
#   metric = 2*prec*recall/(prec + recall)
#   out = metric
#   names(out) = "MAE"
#   out
# }



# getKNN.model = function(df) {
#   df$DIED = as.factor(df$DIED)
#   ## specify 10x10 CV
#   trc <- trainControl (method="repeatedcv", number=5, repeats=1, summaryFunction = f2)
#   ## WARNING: this takes some minutes
#   knn.model <- train (
#     DIED ~.,
#     data = df,
#     method='knn',
#     #TODO poner la métrica F1 score
#     metric = "MAE",
#     #tuneGrid = expand.grid(.k = posK),
#     trControl=trc)
#   
#   return(knn.model)
# }
# 





# superModel es una lista de modelos
testSuperModel = function(superModel, testData) {
  test_results = evaluateSuperModel(superModel, testData)
  real_results = testData$DIED
  
  ands = test_results & real_results
  just.ands = ands[ands == T]
  rTpT = length(just.ands)
  
  just.real.T = real_results[real_results == TRUE]
  rT = length(just.real.T)
  
  just.pred.T = test_results[test_results == T]
  pT = length(just.pred.T)
  
  prec = rTpT / pT
  recall = rTpT / rT
  
  f1 = 2*prec*recall/(prec + recall)
  
}

#f = function(df, Testprop = 1/3) {
#  testIndex = sample(1:nrow(df), floor(TestProp*nrow(df)))
#  df.test = df[testIndex,]
#  df.train = df[-testIndex,]
#  
#  trainSample = getSample(df.train)
#  superKNN = getSuper.knn(trainSample)
#}

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
  
  metric = 2*prec*recall/(prec + recall)
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