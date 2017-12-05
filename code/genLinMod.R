# General linear model

# Done 5/12/2017 After Lab


library(caret)

library(bnclassify)

df = thoraric.removed

n = nrow(df)
learn = sample(1:n, 2*n/3)
alll = 1:n
test = alll[-learn]

df = as.numeric(df)
df$DIED = as.factor(df$DIED)

## specify 10x10 CV
trc <- trainControl (method="repeatedcv", number=10, repeats=10)

## WARNING: this takes some minutes
model.10x10CV <- train (
  DIED ~.,
  data = df,
  subset=learn,
  method='glm',
  family = binomial(link = "logit"),
  metric = "Accuracy",
  #tuneGrid = expand.grid(.k = posK),
  trControl=trc)

mod.glm = glm(DIED ~ ., data = df, family = binomial(link = "logit"))


test_pred <- predict(mod.glm, newdata = df[test,], type = "response")

test_pred

p = exp(test_pred)/(1-exp(test_pred))
length(p[p>1 | p<0])
length(p[p>0.5 & p<1])

confusionMatrix(test_pred, df[test,]$DIED )
