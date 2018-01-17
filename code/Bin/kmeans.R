library(MASS)
library (cclust)

clust = function(k, df) {
  maxiter = 100
  m = data.matrix(df)
  c = cclust(m,k,iter.max = maxiter, method="kmeans",dist="manhattan")
  t = cbind(c$cluster, m)
  colnames(t)[1] = "CLUST"
  m.2 = as.data.frame(t)
  r = split(m.2, m.2$CLUST)
  return(r)
}

a = clust(3,thoraric)
