# General linear model

# Done 5/12/2017 After Lab

# TODO:
# -



library(caret)

library(bnclassify)

df = thoraric.removed

n = nrow(df)
learn = sample(1:n, 2*n/3)
alll = 1:n
test = alll[-learn]

#df = as.numeric(unlist(df))
df = as.data.frame(apply(df, MARGIN = c(1,2), FUN = as.numeric))
df$DIED = as.factor(df$DIED)


# Una métrica custom, que es F1 score
summaryStats <- function (data, lev = NULL, model = NULL) {
  cor <- sum(data$pred==data$obs)
  incor  <- sum(data$pred!=data$obs)
  out <- cor/(cor + incor)
  names(out) <- c("acc")
  out
}


## specify 10x10 CV
#trc <- trainControl (method="repeatedcv", number=10, repeats=10)

trc <- trainControl (method="repeatedcv", number=10, repeats=10, summaryFunction = summaryStats)

## WARNING: this takes some minutes
model.10x10CV <- train (
  DIED ~.,
  data = df,
  subset=learn,
  method='glm',
  family = binomial(link = "logit"),
  #metric = "Accuracy",
  metric = "acc",
  #tuneGrid = expand.grid(.k = posK),
  trControl=trc)

#mod.glm = glm(DIED ~ ., data = df[], family = binomial(link = "logit"))


#test_pred <- predict(mod.glm, newdata = df[test,], type = "response")
test_pred <- predict(model.10x10CV, newdata = df[test,], type = "raw")
train_pred <- predict(model.10x10CV, newdata = df[learn,], type = "raw")

# Prediction tiene la predicción hecha para cada uno de los testin
prediction = rep(TRUE, length(test_pred))
prediction[test_pred < 0.5] = FALSE

real_pred = df[test, 14]


test_pred

#p = exp(test_pred)/(1-exp(test_pred))
#length(p[p>1 | p<0])
#length(p[p>0.5 & p<1])

# TEST
confusionMatrix(test_pred, df[test,]$DIED )

# TRAIN
confusionMatrix(train_pred, df[learn,]$DIED )
