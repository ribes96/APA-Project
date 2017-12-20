

getKNN.model = function(df) {
    df$DIED = as.factor(df$DIED)
    ## specify 10x10 CV
    trc <- trainControl (method="repeatedcv", number=5, repeats=1)
    ## WARNING: this takes some minutes
    knn.model <- train (
      DIED ~.,
      data = df,
      method='knn',
      #TODO poner la métrica F1 score
      metric = "Accuracy",
      #tuneGrid = expand.grid(.k = posK),
      trControl=trc)

      return(knn.model)
}
