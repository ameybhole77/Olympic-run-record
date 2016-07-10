# Load packages
library(dplyr)
library(data.table)
library(ggplot2)
library(clValid)

# Load the data
run_record <- read.table("/media/amey/1E02DDE102DDBDC9/Amey/Work/Data A/Assignments/Clustering/run_record.csv", quote="\"", comment.char="")

# Set random seed.
set.seed(1)

# Explore your data with str() and summary()
str(run_record)
summary(run_record)

# Cluster run_record using k-means 
run_km = kmeans(run_record , 5, nstart = 20)

# Plot the 100m as function of the marathon. Color using clusters
plot(run_record$marathon ,run_record$X100m , col = run_km$cluster  , xlab = "Marathon" , ylab = "100m")

# Calculate Dunn's index
dunn_km = dunn(clusters = run_km$cluster ,Data = run_record)
dunn_km



