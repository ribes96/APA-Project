WriteConfMat = function(xx.res.xx) {
  t = a$ConfMatrix$table
  h = as.data.frame.array(t)
  colnames(h) = c("Real False", "Real True")
  rownames(h) = c("Predicted False", "Predicted True")
  stargazer(h)
  return(h)
}

showRes = function(xx.res.xx) {
  xx.res.xx$ConfMatrix$table
  
}

getKK = function(k.res) {
  # saca la k promedio (cantidad de vecinos)
  a = k.res$SuperModel
  # a es una lista
  total = 0
  for (i in 1:length(a)) {
    b = a[[i]]$bestTune$kmax
    total = total + b
  }
  total/length(a)
}

getDecay = function(glm.xx) {
  a = glm.xx$superModel
  total = 0
  for (i in 1:length(a)) {
    
  }
}
