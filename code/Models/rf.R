library(randomForest)

#Entrena un random forest
#df es un dataframe que contiene un dataset de training
#retorna un modelo de random forest
getRF.model = function(df) {
  df$DIED = as.factor(df$DIED)
  
  ## WARNING: this takes some minutes
  rf.model <- train (
    DIED ~.,
    data = df,
    method='rf',
    trControl=trc)
  
  return(rf.model)
}

#calcula una lista de modelos de random forest 
#dflist es una lista de dataframes que ya están balanceados
#retorna una lista de modelos random forest, que tiene el mismo tamaño que la lista de entrada
getSuper.rf = function(dflist) {
  models.list = lapply(dflist, getRF.model)
  super.RF <<- models.list
  return(models.list)
}
