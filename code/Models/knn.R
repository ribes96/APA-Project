#Entrena un modelo de KNN
#df es un dataframe que contiene un dataset de training
#retorna un modelo de KNN
getKNN.model = function(df) {
    df$DIED = as.factor(df$DIED)
    ## WARNING: this takes some minutes
    knn.model <- train (
      DIED ~.,
      data = df,
      method='kknn',
      kknn.distance = 1, # distance = 1 significa distancia Manhattan
      trControl=trc)

      return(knn.model)
}

#calcula una lista de modelos de KNN
#dflist una lista de dataframes que ya están balanceados
#retorna una lista de modelos knn, que tiene el mismo tamaño que la lista de entrada
getSuper.knn = function(dflist) {
  models.list = lapply(dflist, getKNN.model)
  return(models.list)
}

