# Recibe un dataframe que no está balanceado y retorna una lista de tamaño nbags, donde cada elemento es un dataframe con la misma proporción de TRUES y FALSES

# true index y falseIndex tienen TOODOS los posibles
getOneSubset = function(notused, data, trueI, falseI) {
  fI = sample(falseI, length(trueI))
  chosen = c(trueI, fI)
  randomSort.chosen = sample(chosen)
  retDF = data[randomSort.chosen,]
  return(retDF)
}

# para usar esto se supone que ya se ha separado en datos de test y de train
#retorna una lista de nbags elementos, que son los bags de train
getSample = function(df, nbags = 51) {
  trueIndex = which(df$DIED == TRUE)
  l = 1:nrow(df) %in% trueIndex
  alll = 1:nrow(df)
  falseIndex = alll[!l]
  g = 1:nbags
  df.list = lapply(g, getOneSubset, data = df, trueI = trueIndex, falseI = falseIndex)
  return(df.list)
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