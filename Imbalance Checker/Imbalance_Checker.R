titanicDF <- read.csv("path to your dataset/healthcare-dataset-stroke-data.csv")
set.seed(123)
# Create Vector of the target class.
x <- c(titanicDF$stroke)
# Frequency of all elements in vector
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
table(x)
# Get frequency of all values into data.frame
a=as.data.frame(table(x))
 s1= a[1,]['Freq']
 s2= a[2,]['Freq']
 # Check for the class imbalance.
 if(s1 != s2){
   print("Imbalanced class")
 }else {
   print("balanced dataset")
 }
 # Compute the difference in # of instances.
 d= (s1-s2)
#Print the difference in instances.
 print(d)
 
 
