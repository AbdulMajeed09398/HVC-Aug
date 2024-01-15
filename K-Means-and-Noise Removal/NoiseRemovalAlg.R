# Load the dataset or replace this line with your method of loading the dataset.
titanicDF <- read.csv("path to your dataset/dataset_name.csv")
set.seed(123)
adults <- titanicDF
# Assuming 'xyz' is your dataset with the 'cluster' column assigned
numeric_columns <- adults[, sapply(adults, is.numeric)]
# Please use Elbow method to find the optimal # of clusters first.
optimal_k <- 30  # Change this to the optimal number of clusters identified
kmeans_result <- kmeans(numeric_columns, centers = optimal_k)
adults$cluster <- kmeans_result$cluster
distances <- apply(numeric_columns, 1, function(x) min(sqrt(rowSums((x - kmeans_result$centers)^2))))
# Test 1: If data is large or well spread.
distances <- apply(numeric_columns, 1, function(x) min(sqrt(rowSums((x - kmeans_result$centers)^2))))
r<-10
norm<- (distances- min(distances))/(max(distances)- min(distances))
p<- (1- norm/r)
format(round(p, 2), nsmall = 2)
threshold_percentage <- 0.95  # Adjust this value based on your preference
# Calculate the probabilistic threshold based on the specified percentage
threshold <- quantile(p, prob = threshold_percentage / 1)
noisy_samples <- adults[p > threshold, ]
# if you wish to see the noisy samples, uncomment the below line.
#print(noisy_samples)
# Analyze the results, and add back the misclassified results, if any.
write.csv(noisy_samples, file = "noisy_samples.csv", row.names = FALSE)
cleaned_data <- adults[!(rownames(adults) %in% rownames(noisy_records)), ]
write.csv(cleaned_data, file = "cleaned_data_rc.csv", row.names = FALSE)


