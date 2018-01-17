#Entrena un modelo lineal (GLM)
#df es un dataframe que contiene un dataset de training
#retorna un modelo de GLM
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

#calcula una lista de modelos de GLM
#dflist es una lista de dataframes que ya están balanceados
#retorna una lista de modelos GLM, que tiene el mismo tamaño que la lista de entrada
getSuper.glm = function(dflist) {
  models.list = lapply(dflist, getGLM.model)
  return(models.list)
}

