# using dataset from the UCI Machine Learning Repository (http://archive.ics.uci.edu/ml/)
#reading a dataset.
titanicDF <- read.csv("path to your dataset/dataset_name.csv")
nrow(titanicDF)
unique(titanicDF$income)
#Analysis of the major & Minor classes, please modify the values inside comma based on unique values from line #: 07
class1<-nrow(titanicDF[titanicDF$income == " >50K",])
class2<-nrow(titanicDF[titanicDF$income == " <=50K",])
#print(class1)
#print(class2)
if (class1 > class2) {
  major <- class1
  minor <- class2
} else {
  major <- class2
  minor <- class1
}
# Identify # of samples required to balance the classes.
No_of_samples_required <- major-minor
print(No_of_samples_required)
# Loading synthetic dataset for augmentation purposes.
syntheticcDF <- read.csv("Path to your synthetic dataset/dataset_name.csv")
# Filtering data for augmentation.
library(dplyr)
# In this case, the value >50K is a minor class, and therefore, should be augmented.
a<-filter(syntheticcDF, syntheticcDF$income == '>50K')
print(a)
print(nrow(a))
# Selecting a sample of data, Please customize the sample size based on data (No_of_samples_required)
rand_df <- sample(a, size=12890)
# Preparing final datasets.
real_data<- titanicDF
synthetic_data <- rand_df
# if you want to verify the dimensions, uncomment the below lines.
#print (titanicDF)
#print (rand_df)
# Writing data to the file, and them merge it with the real data.
write.csv(synthetic_data,"SyntheicDataAdults.csv") 
# Simply add this data with your real data.
