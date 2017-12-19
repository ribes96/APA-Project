# Recibe un dataframe que no está balanceado y retorna una lista de tamaño nbags, donde cada elemento es un dataframe con la misma proporción de TRUES y FALSES

# true index y falseIndex tienen TOODOS los posibles
getOneSubset = function(notused, data, trueI, falseI) {
  fI = sample(falseI, length(trueI))
  chosen = c(trueI, fI)
  randomSort.chosen = sample(chosen)
  retDF = data[randomSort.chosen,]
  return(retDF)
}

getSample = function(df, nbags = 51) {
  trueIndex = which(df$DIED == TRUE)
  l = 1:nrow(df) %in% trueIndex
  alll = 1:nrow(df)
  falseIndex = alll[!l]
  g = 1:nbags
  df.list = lapply(g, getOneSubset, data = df, trueI = trueIndex, falseI = falseIndex)
  return(df.list)
}