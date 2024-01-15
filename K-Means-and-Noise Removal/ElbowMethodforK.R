# Load the dataset or replace this line with your method of loading the dataset
titanicDF <- read.csv("path to your dataset/dataset_name.csv")
set.seed(123)
adults <- titanicDF
#print(adults)
numeric_columns <- adults[, sapply(adults, is.numeric)]
# Function to calculate total within-cluster sum of squares (WCSS)
calculate_wcss <- function(data, k) {
  wcss <- numeric(length = k)
  for (i in 1:k) {
    kmeans_result <- kmeans(data, centers = i)
    wcss[i] <- kmeans_result$tot.withinss
  }
  return(wcss)
}
# Use the elbow method to find the optimal number of clusters
max_k <- 150  # Set a maximum number of clusters to consider (This value can be modified)
wcss_values <- calculate_wcss(numeric_columns, max_k)
# Plot the elbow curve
plot(1:max_k, wcss_values, type = "b", pch = 19, frame = FALSE, 
     xlab = "Number of Clusters (k)", ylab = "WCSS",
     main = "Elbow Method to Find Optimal k")
# Chose inflection point as k.