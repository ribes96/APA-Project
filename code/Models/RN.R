#Entrena una red neuronal

getRN.model = function(df) {
  ## specify 10x10 CV
  
  #trc <- trainControl (method="repeatedcv", number=10, repeats=10)
  
  
  ## WARNING: this takes some minutes
  rn.model <- train (
    DIED ~.,
    data = df,
    #subset=learn,
    method='nnet',
    #TODO poner la métrica F1 score
    #metric = "Accuracy",
    #metric = "acc",
    #tuneGrid = expand.grid(.k = posK),
    trControl=trc)
  
  return(rn.model)
}

# Recibe una lista de dataframes que ya están balanceados, y retorna una lista de modelos knn, que tiene el mismo tamaño que la lista de entrada
getSuper.rn = function(dflist) {
  models.list = lapply(dflist, getRN.model)
  return(models.list)
}