#Entrena un modelo lineal

getGLM.model = function(df) {
    ## specify 10x10 CV

    #trc <- trainControl (method="repeatedcv", number=10, repeats=10)


    ## WARNING: this takes some minutes
    glm.model <- train (
      DIED ~.,
      data = df,
      #subset=learn,
      method='glm',
      family = binomial(link = "logit"),
      #TODO poner la métrica F1 score
      #metric = "Accuracy",
      #metric = "acc",
      #tuneGrid = expand.grid(.k = posK),
      trControl=trc)

      return(glm.model)
}

# Recibe una lista de dataframes que ya están balanceados, y retorna una lista de modelos knn, que tiene el mismo tamaño que la lista de entrada
getSuper.glm = function(dflist) {
  models.list = lapply(dflist, getGLM.model)
  return(models.list)
}

