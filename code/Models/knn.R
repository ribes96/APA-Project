#Entrena un modelo de KNN

getKNN.model = function(df) {
    df$DIED = as.factor(df$DIED)
    ## WARNING: this takes some minutes
    knn.model <- train (
      DIED ~.,
      data = df,
      method='knn',
      trControl=trc)

      return(knn.model)
}


# Recibe una lista de dataframes que ya están balanceados, y retorna una lista de modelos knn, que tiene el mismo tamaño que la lista de entrada
getSuper.knn = function(dflist) {
  models.list = lapply(dflist, getKNN.model)
  return(models.list)
}

