aa = lda(thoraric[c(1:16)], thoraric[,"DIED"])
negatives = thoraric[thoraric$DIED == F,]
mean.true = aa$means[2,]
mean.false = aa$means[1,]

subset(expr, cell_type == "hesc")

library(dplyr)    
filter(thoraric, thoraric$DIED==F)

gg = thoraric[,which(thoraric$DIED == T)]

