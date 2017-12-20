# Recibe una lista de dataframes que ya están balanceados, y retorna una lista de modelos knn, que tiene el mismo tamaño que la lista de entrada

getSuper.knn = function(dflist) {
  models.list = lapply(dflist, getKNN.model)
  return(models.list)
}
