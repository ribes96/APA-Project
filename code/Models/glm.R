#Entrena un modelo lineal

getGLM.model = function(df) {
    df$DIED = as.factor(df$DIED)
    ## WARNING: this takes some minutes
    glm.model <- train (
      DIED ~.,
      data = df,
      method='glm',
      family = binomial(link = "logit"),
      trControl=trc)

      
    return(glm.model)
}

# Recibe una lista de dataframes que ya están balanceados, y retorna una lista de modelos knn, que tiene el mismo tamaño que la lista de entrada
getSuper.glm = function(dflist) {
  models.list = lapply(dflist, getGLM.model)
  return(models.list)
}

