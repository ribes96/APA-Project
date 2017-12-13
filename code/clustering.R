# Hace k-means con k = 2 y muestra cuantos ha acertado
# Acierta bastante pero no sé si es por casualidad


library(stats)


df = thoraric.original

d = df$DIED
real.prop = length(d[d == T])/length(d)

a = within(df, rm(DIED))
clust = kmeans(a, centers = 2)
l = clust$cluster

clust.prop = length(l[l == 2])/length(l)

# No siempre la clase 2 es la mayoritaria
if (clust.prop >= 0.5) {
  l[l == 1] = TRUE
  l[l == 2] = FALSE
} else {
  l[l == 1] = FALSE
  l[l == 2] = TRUE
}


# El cluster 2 se corresponde con los True, con la mayoría

dat = cbind(d, l)


# real True and prediction False
rT.pT = 0

rT.pF = 0
rF.pT = 0
rF.pF = 0
for (i in 1:nrow(dat)) {
  if (dat[i,1] == 1 & dat[i,2] == 1) {
    rT.pT = rT.pT + 1 
  } else if (dat[i,1] == 1 & dat[i,2] == 0) {
    rT.pF = rT.pF + 1
  } else if (dat[i,1] == 0 & dat[i,2] == 1) {
    rF.pT = rF.pT + 1
  } else if (dat[i,1] == 0 & dat[i,2] == 0){
    rF.pF = rF.pF + 1
  } else {
    print("Algo está mal---------------")
    print(dat[i,1])
    print(dat[i,2])
  }
}

confMat = matrix(data = c(rT.pT, rT.pF, rF.pT, rF.pF), ncol = 2, dimnames = list(c("Predicted True", "Predicted False"), c("Real True","Real False")))

accuracy = (confMat[1,1] + confMat[2,2])/sum(confMat)


confMat
accuracy

