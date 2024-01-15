#Load dataset.
titanicDF <- read.csv("D:/Korea Stuff/Anonymization Related Papers/Optimized augmentation and feature selection Paper/Experiments/healthcare-dataset-stroke-data.csv")
set.seed(123)
#Missing Data Imputation with mean in Numerical columns.
# Mean calculation
# Create a vector. 
#x <- c(titanicDF$age)
# Find Mean.
#result.mean <- mean(x)
#print(result.mean)
library(imputeTS)
a= na_mean(titanicDF$age)
b= na_mean(titanicDF$hypertension)
c= na_mean(titanicDF$heart_disease)
d= na_mean(titanicDF$avg_glucose_level)
e= na_mean(titanicDF$bmi)
healthstudy <- cbind(a,b,c,d,e)
write.csv(healthstudy,'clean-numeric.csv')
plot(a)
# Similarity calculation for duplicates removal from data
library(dplyr)
row_cf <- function(x, y, df){
  sum(df[x,] == df[y,])/ncol(df)
}
res <- expand.grid(1:nrow(titanicDF), 1:nrow(titanicDF)) %>% 
  rename(row_1 = Var1, row_2 = Var2) %>% 
  rowwise() %>% 
  mutate(similarity = row_cf(row_1, row_2, titanicDF))
# Remove rows which are next to each other and have a score of 1.
# Mean computation with NAs
# Create a vector. 
x <- c(titanicDF$age,NA)
print(x)
# Find mean.
result.mean <-  mean(x)
print(result.mean)
# Find mean dropping NA values.
result.mean <-  mean(a,na.rm = TRUE)
print(result.mean)

# Imputing non-numerical values with minor values in the respective column.
#Counting unique values and their frequency
x=titanicDF$work_type
table(x)
# Get frequency of all values into data.frame
as.data.frame(table(x))
# Using rle() and sort()
rle(sort(x))
# Using tabulate()
tabulate(x)
# Using count() from plyr package
library('plyr')
count(x)
# Using vctrs package
library('vctrs')
vec_count(x)
vec_count(x, sort = "key")
# Using aggregate
aggregate(x, list(num=x), length)
sort(unique(x), decreasing=TRUE)

# Outliers analysis, If there are outliers, they will appear at the top of the graph.
library(ggplot2)
summary(titanicDF$age)
min(titanicDF$age)
max(titanicDF$age)
range(titanicDF$age)
######
boxplot.stats(titanicDF$age)$out
out <- boxplot.stats(titanicDF$age)$out
out_ind <- which(titanicDF$age %in% c(out))
print(out_ind)
#####
boxplot(titanicDF$age,
        ylab = "age")
boxplot(titanicDF$age, ylab = "age", main = "Age of the person enclosed in the dataset.")
mtext(paste("Outliers: ", paste(out, collapse = ", ")))
