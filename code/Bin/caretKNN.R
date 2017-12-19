# KNN crossvalidation just using caret

intrain <- createDataPartition(y = thoraric$DIED, p= 0.7, list = FALSE)
training <- thoraric[intrain,]
testing <- thoraric[-intrain,]

training$DIED = as.factor(training$DIED)

library(caret)
trctrl <- trainControl(method = "repeatedcv", number = 10, repeats = 3)
knn_fit <- train(DIED ~., data = training, method = "knn",
                 trControl=trctrl,
                 metric = "Accuracy"
                 #preProcess = c("center", "scale"),
                 #tuneLength = 10)
)

# Se selecciona un k = 9

test_pred <- predict(knn_fit, newdata = testing)

confusionMatrix(test_pred, testing$DIED )

