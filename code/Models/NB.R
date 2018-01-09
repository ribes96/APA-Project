#Entrena un modelo de Naive Bayes


getNB.model = function(df) {
    ## specify 10x10 CV
    #trc <- trainControl (method="repeatedcv", number=10, repeats=10)

    ## WARNING: this takes some minutes
    NB.model <- train (
      DIED ~.,
      data = df,
      #subset=alll,
      method='manb',
      # TODO poner la accuracy F1 score
      #metric = "Accuracy",
      #tuneGrid = expand.grid(.k = posK),
      trControl=trc)

      return(NB.model)
}

# Recibe una lista de dataframes que ya están balanceados, y retorna una lista de modelos knn, que tiene el mismo tamaño que la lista de entrada
getSuper.NB = function(dflist) {
  models.list = lapply(dflist, getNB.model)
  return(models.list)
}
