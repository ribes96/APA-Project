library(randomForest)

#Entrena una random forest

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

# Recibe una lista de dataframes que ya están balanceados, y retorna una lista de modelos knn, que tiene el mismo tamaño que la lista de entrada
getSuper.rf = function(dflist) {
  models.list = lapply(dflist, getRF.model)
  return(models.list)
}
