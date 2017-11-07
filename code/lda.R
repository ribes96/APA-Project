ilibrary(MASS)
aa = lda(thoraric[c(1:16)], thoraric[,"DIED"])
negatives = thoraric[thoraric[,"DIED"] == F,]
mean.true = aa$means[2,]
mean.false = aa$means[1,]


library(dplyr)    
filter(thoraric, thoraric$DIED==F)

gg = thoraric[which(thoraric$DIED == T),]

