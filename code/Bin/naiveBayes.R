#Naive Bayes with LOOCV

library("e1071")
library("class")


nb = function(dataFrame) {
  solutions = dataFrame[,"DIED"]
  data = dataFrame[,-14] # 14 corresponds to row "DIED"
  
  n = nrow(dataFrame)
  s = 0
  preds = c()
  for (i in 1:n) {
    
    data.train = data[-i,]
    data.test = data[i,]
    data.results = solutions[-i]
    model = naiveBayes(data.results ~ ., data.train)
    
    pred = predict(model,data.test)
    preds[i] = as.logical(pred)
    if (as.logical(pred) != solutions[i]) s = s + 1
    
  }
  print(s/nrow(dataFrame))
  confusionMatrix(preds,solutions)
}
