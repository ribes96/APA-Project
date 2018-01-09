#Entrena un modelo de KNN

getKNN.model = function(df) {
    df$DIED = as.factor(df$DIED)
    ## specify 10x10 CV
    # trc <- trainControl (
    #   method="repeatedcv",
    #   number=5,
    #   repeats=1,
    #   summaryFunction = f1
    #   )
    ## WARNING: this takes some minutes
    knn.model <- train (
      DIED ~.,
      data = df,
      method='knn',
      #TODO poner la métrica F1 score
      #metric = "Accuracy",
      #tuneGrid = expand.grid(.k = posK),
      trControl=trc)

      return(knn.model)
}


# Recibe una lista de dataframes que ya están balanceados, y retorna una lista de modelos knn, que tiene el mismo tamaño que la lista de entrada
getSuper.knn = function(dflist) {
  models.list = lapply(dflist, getKNN.model)
  return(models.list)
}

