# Load packages
library(dplyr)
library(data.table)
library(ggplot2)
library(clValid)

# Load the data
run_record <- read.table("/media/amey/1E02DDE102DDBDC9/Amey/Work/Data A/Assignments/Clustering/run_record.csv", quote="\"", comment.char="")

# Set random seed.
set.seed(1)

# Explore data with str() and summary()
str(run_record)
summary(run_record)

# Standardize run_record, transform to a dataframe
run_record_sc = as.data.frame(scale(run_record))

# Cluster run_record_sc using k-means
run_km_sc = kmeans(run_record_sc , 5, nstart= 20)

# Plot records on 100m as function of the marathon. 
plot(run_record_sc$marathon ,run_record_sc$X100m , col = run_km_sc$cluster , xlab = "Marathon" , ylab = "100m")

# Compare the resulting clusters in a table
table(run_km$cluster , run_km_sc$cluster)

# Calculate Dunn's index
dunn_km_sc = dunn(clusters = run_km_sc$cluster ,Data = run_record_sc)
dunn_km_sc

# Compare k-means with single-linkage
table(run_km_sc$cluster,memb_single)

# Compare k-means with complete-linkage
table(run_km_sc$cluster ,memb_complete )