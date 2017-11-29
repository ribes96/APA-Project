library("caret")

knn = function(train, test, k) {
  library("class")
  #library("KODAMA")
  
  #TODO
}


test = thoraric.removed[1,-14]

train = thoraric.removed[-1,]
k.knn = as.integer(sqrt(nrow(train)))

#createFolds = function(dataFrame, number) {
#  sizeFold = nrow(dataFrame)/number
#  l = vector("list", number)
#  for (i in 0:number-1) {
#    fold = dataFrame[i*sizeFold+1:(i+1)*sizeFold,]
#    l[i+1] = fold
#  }
#  return(l)
#}

g = function(dataFrame) {
  solutions = dataFrame[,"DIED"]
  data = dataFrame[,-14]
  
  n = nrow(dataFrame)
  idx = createFolds(dataFrame, k = 4)
  s = 0
  preds = c()
  for (i in 1:n) {
   # data.train = data[-idx[[i]], ]
    #data.test = data[idx[[i]], ]
    #data.results = solutions[-idx[[i]]]
   
    data.train = data[-i,]
    data.test = data[i,]
    data.results = solutions[-i]
    
    pred = knn(train = data.train, test = data.test, cl = data.results, k = 3)
    preds[i] = as.logical(pred)
    if (as.logical(pred) != solutions[i]) s = s + 1
    print(pred)
    #print(paste0(mean(data.test[ idx[[i]] ] != as.logical(pred))))
  }
  print(s/nrow(dataFrame))
  confusionMatrix(preds,solutions)
}

#LOOCV
# To do n-fold-cross-validation
n = nrow(thoraric)

idx = createFolds(thoraric, k = n)

results.train = train[,"DIED"]
data.train = train[,-14] # 14 corresponds to row "DIED"

a = knn(data.train, test, results.train, k)a

