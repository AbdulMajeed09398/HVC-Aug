# If time computation is desirable, uncomment the tictoc code.
#library(tictoc) 
#tic()
#reading a dataset. Please modify Line # 5 as per the path of data.
titanicDF <- read.csv("path to data/dataset_name.csv")
print(titanicDF)
nrow(titanicDF)
unique(titanicDF$stroke)
#specifying the parameters.
set.seed(123)
#Splitting data into training and test.
splitIndex <- sample(nrow(titanicDF), floor(0.65*nrow(titanicDF)))
training<- titanicDF[ splitIndex,]
test  <- titanicDF[-splitIndex,]
#Verifying the data splits.
print(nrow(training))
print(nrow(test))
#import the package
library(randomForest)
#Addressing NA value issues, if any.
row.has.na <- apply(training, 1, function(x){any(is.na(x))})
predictors_no_NA <- training[!row.has.na, ]
print(predictors_no_NA$stroke)
predictors_no_NA$stroke=as.factor(predictors_no_NA$stroke)
# Perform training:
rf_classifier = randomForest(predictors_no_NA$stroke~., data=predictors_no_NA, ntree=50, mtry=10)
# If you do not want to use dot in the above line.
#age+hours+fnlweight+edu+capitalgain+capitalloss+workclass+education+mstatus+occupation+relationship+race+gender+country
#Training Accuracy
accuracy_training = (rf_classifier$confusion[1,1] + rf_classifier$confusion[2,2])/
  (rf_classifier$confusion[1,1] + rf_classifier$confusion[2,2] + rf_classifier$confusion[2,1] + rf_classifier$confusion[1,2])
print(accuracy_training)
print(rf_classifier$confusion[1,1] + rf_classifier$confusion[2,2] + rf_classifier$confusion[2,1] + rf_classifier$confusion[1,2])
#predictions
y_pred = predict(rf_classifier, 
                 newdata = test)
#Making the confusion matrix table. 
#The number in [] bracket is the target variable. It needs modification as per dataset.
cm_rf = table(test[, 7], y_pred)
#Accuracy analysis from the confusion matrix.
test_accuracy = (cm_rf[1,1] + cm_rf[2,2])/
  (cm_rf[1,1] + cm_rf[2,2] + cm_rf[2,1] + cm_rf[1,2])
print(test_accuracy) 
#toc()
  