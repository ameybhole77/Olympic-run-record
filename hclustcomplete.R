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

# Apply dist() to run_record_sc
run_dist = dist(run_record_sc )

# Apply hclust() to run_dist
run_complete = hclust(run_dist , method = "complete")

# Apply cutree() to run_complete
memb_complete = cutree(run_complete , k =5)

# Apply plot() on run_complete to draw the dendrogram
plot(run_complete)

# Apply rect.hclust() on run_complete to draw the boxes
rect.hclust(run_complete ,k =5, border = 2:6)

# table() the clusters memb_single and memb_complete.
table(memb_single , memb_complete )

# Dunn's index for complete-linkage
dunn_complete = dunn(cluster = memb_complete, Data = run_record_sc)
dunn_complete

# Compare k-means with single-linkage
table(run_km_sc$cluster,memb_single)

# Compare k-means with complete-linkage
table(run_km_sc$cluster ,memb_complete )