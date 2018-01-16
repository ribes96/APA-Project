#Entrena una red neuronal
#df es un dataframe que contiene un dataset de training
#retorna un modelo de red neuronal
getRN.model = function(df) {
  df$DIED = as.factor(df$DIED)
  
  ## WARNING: this takes some minutes
  rn.model <- train (
    DIED ~.,
    data = df,
    method='nnet',
    trControl=trc)
  
  return(rn.model)
}

#calcula una lista de modelos de redes neuronales
#dflist es una lista de dataframes que ya están balanceados
#retorna una lista de modelos redes neuronales, que tiene el mismo tamaño que la lista de entrada
getSuper.rn = function(dflist) {
  models.list = lapply(dflist, getRN.model)
  return(models.list)
}
