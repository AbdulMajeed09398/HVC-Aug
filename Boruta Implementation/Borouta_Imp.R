# using dataset from the UCI Machine Learning Repository (http://archive.ics.uci.edu/ml/) or Kaggle Repository
#reading a dataset. Please modify Line # 5 as per the path of data.
titanicDF <- read.csv("path to dataset/census-income-vfinal-fused.csv")
# Print data to check for analysis.
print(titanicDF)
#install.packages("Boruta"), if Boruta is not installed already on the system.
library(Boruta)
# Run Boruta Algorithm
set.seed(456)
# Main part of the Algorithm.
boruta <- Boruta(titanicDF$income~., data = titanicDF, doTrace = 2)
# If you wan to see the results in R console, keep the below lines
print(boruta)
plot(boruta)