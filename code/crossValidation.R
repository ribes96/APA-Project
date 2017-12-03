# Runs a cross validation for a general model


# I still have not tested this function
# It may not match with every possible model
custom.cv = function(df, model, nfolds, params) {
  # model is a function to be called with the elements of params as parameters
  # the data will be added to the params
  # params is a list
  # nfolds is the number of folds to be made
  
  fold.size = ceiling(nrow(df)/n)
  
  # Randomly sorts the rows
  dataFrame = df[sample(1:nrow(df)),]
  
  solutions = dataFrame[,"DIED"]
  data = dataFrame[,-14] # 14 corresponds to row "DIED"
  totalErrors = 0
  maxPosErrors = nrow(dataFrame)
  for (i in 1:nfolds) {
    if (i == nfolds)
      testIndex = fold.size*(i - 1) + 1:nrow(dataFrame)
    else
      testIndex = fold.size*(i - 1) + 1:fold.size*i
    # The last one may have less elements
    data.test = data[-testIndex,]
    data.train = data[testIndex,]
    data.results = solutions[-testIndex]
    
    pred = model(c(list(train = data.train, test = data.test, cl = data.results), params))
    
    pred.log = as.logical(pred)
    
    equality = pred.log == data.results
    
    nerrors = length(equality[equality == F])
    
    totalErrors = totalErrors + nerrors
  }
  return(totalErrors/maxPosErrors)
}