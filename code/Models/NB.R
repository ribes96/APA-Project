


getNB.model = function(df) {
    ## specify 10x10 CV
    trc <- trainControl (method="repeatedcv", number=10, repeats=10)

    ## WARNING: this takes some minutes
    NB.model <- train (
      DIED ~.,
      data = df,
      subset=alll,
      method='manb',
      # TODO poner la accuracy F1 score
      metric = "Accuracy",
      #tuneGrid = expand.grid(.k = posK),
      trControl=trc)

      return(NB.model)
}
