library(caret)

df = thoraric.removed

n = nrow(df)
learn = sample(1:n, 2*n/3)
alll = 1:n
test = alll[-learn]
posK = c(1,2,3,5,7,10)

df$DIED = as.factor(df$DIED)

## specify 10x10 CV
trc <- trainControl (method="repeatedcv", number=n, repeats=10)

## WARNING: this takes some minutes
model.10x10CV <- train (
  DIED ~.,
  data = df,
  subset=alll,
  method='knn',
  metric = "Accuracy",
  tuneGrid = expand.grid(.k = posK),
  trControl=trc)


test_pred <- predict(model.10x10CV, newdata = df[test,])

test_pred

confusionMatrix(test_pred, df[test,]$DIED )
