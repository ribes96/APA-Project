# Runs a cross validation for a general model

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
  for (i in 1:nfolds) {
    data.train = data[,]
  }
  
}