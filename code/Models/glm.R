
getGLM.model = function(df) {
    ## specify 10x10 CV

    trc <- trainControl (method="repeatedcv", number=10, repeats=10)


    ## WARNING: this takes some minutes
    glm.model <- train (
      DIED ~.,
      data = df,
      subset=learn,
      method='glm',
      family = binomial(link = "logit"),
      #TODO poner la métrica F1 score
      #metric = "Accuracy",
      metric = "acc",
      #tuneGrid = expand.grid(.k = posK),
      trControl=trc)

      return(glm.model)
}
