#Entrena un modelo de Naive Bayes
#df es un dataframe que contiene un dataset de training
#retorna un modelo de Naive Bayes
library(klaR)

getNB.model = function(df) {
    df$DIED = as.factor(df$DIED)
    ## WARNING: this takes some minutes
    NB.model <- train (
      DIED ~.,
      data = df,
      method='nb',
      trControl=trc)

      return(NB.model)
}
#calcula una lista de modelos de Naive Bayes
#dflist una lista de dataframes que ya están balanceados
#retorna una lista de modelos Naive Bayes, que tiene el mismo tamaño que la lista de entrada
getSuper.NB = function(dflist) {
  models.list = lapply(dflist, getNB.model)
  super.NB <<- models.list
  return(models.list)
}
