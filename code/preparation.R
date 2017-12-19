
# Recibe un dataframe terminado de preprocesar y a proporción que se quiere usar para train y test, y...

#superModel es una lista de modelos
# instance es uno de los pacientes

#retorna un vector de TRUE y FALSE, uno para cada paciente de data
evaluateModel = function(model, data) {
  result = predict(model, newdata = data)
  return(result)
} 

# retorna TRUE o FALSE, que es el resultado de la votación de los modelos
evaluateSuperModel = function(superModel, df) {
  results.list = lapply(superModel, evaluateModel, data = df)
  #results.list es una lista que contiene vectores de TRUE y FALSE
  # el elemento i de la lista contiene los resultados que ha dicho el
  # primero de los modelos.
  
  #TODO convertir a un apply
  for (i in 1:nrow(df)) {
    resOfI = lapply(results.list, function(l) l[[i]])
    #resOfI contiene todos los resultados predichos para el paciente i
  }
}

# superModel es una lista de modelos
testSuperModel = function(superModel, testData) {
  
}

f = function(df, Testprop = 1/3) {
  testIndex = sample(1:nrow(df), floor(TestProp*nrow(df)))
  df.test = df[testIndex,]
  df.train = df[-testIndex,]
  
  trainSample = getSample(df.train)
  superKNN = getSuper.knn(trainSample)
}