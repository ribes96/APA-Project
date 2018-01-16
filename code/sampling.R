#data es un dataframe que no estÃ¡ balanceado y retorna una lista de tamaÃ±o nbags, 
#donde cada elemento es un dataframe con la misma proporciÃ³n de TRUES y FALSES
#true index y falseIndex tienen TOODOS los posibles
getOneSubset = function(notused, data, trueI, falseI) {
  fI = sample(falseI, length(trueI))
  chosen = c(trueI, fI)
  randomSort.chosen = sample(chosen)
  retDF = data[randomSort.chosen,]
  return(retDF)
}

# para usar esto se supone que ya se ha separado en datos de test y de train
#df es un dataset de training
#nbags es el número de bags
#retorna una lista de #nbags elementos, que son los bags de train
getSample = function(df, nbags = 11) {
  trueIndex = which(df$DIED == TRUE)
  l = 1:nrow(df) %in% trueIndex
  alll = 1:nrow(df)
  falseIndex = alll[!l]
  g = 1:nbags
  df.list = lapply(g, getOneSubset, data = df, trueI = trueIndex, falseI = falseIndex)
  return(df.list)
}


#df es un dataframe que ya ha pasado el preprocesado
#TestProp es la proporción de datos de test que queremos
#retorna una lista con el dataframe de test y con todos los bags de training
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

#Generar samples de train y test
#df_orig es el dataframe que contiene todos los datos originales
#df_rem es el dataframe que contiene todos los datos depués de quitar variables como explicado en la documentación
#train_data[.orig, .rem] es una lista de dataframes para training
#test_data[.orig, .rem] es una lista de dataframes para testing
getSamples = function(df_orig, df_rem){
  sample.rem <<- generalSample(df_rem)
  test_data.rem <<- sample.rem$test
  train_data.rem <<- sample.rem$train 
  
  sample.orig <<- generalSample(df_orig)
  test_data.orig <<- sample.orig$test
  train_data.orig <<- sample.orig$train 
  
}
