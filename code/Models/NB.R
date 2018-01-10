#Entrena un modelo de Naive Bayes
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

# Recibe una lista de dataframes que ya están balanceados, y retorna una lista de modelos knn, que tiene el mismo tamaño que la lista de entrada
getSuper.NB = function(dflist) {
  models.list = lapply(dflist, getNB.model)
  return(models.list)
}
