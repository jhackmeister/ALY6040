library(arules)

# Load the Groceries dataset (comes with arules)
data("Groceries")

# View basic summary
summary(Groceries)

# How many items are in the dataset?
length(itemLabels(Groceries))

# View first few transactions
inspect(Groceries[1:5])

# Apply the Apriori algorithm to mine association rules
rules <- apriori(Groceries, 
                 parameter = list(supp = 0.01, conf = 0.2))

# Look at the top rules by lift
inspect(sort(rules, by="lift")[1:10])

# Optional: Filter for high-confidence rules involving 'whole milk'
milk_rules <- subset(rules, items %in% "whole milk")
inspect(sort(milk_rules, by="confidence")[1:5])
##############################################################

# install.packages("cluster")       # Uncomment if needed
# install.packages("factoextra")   # For clean visuals
library(cluster)
library(factoextra)

# Load dataset from UCI
wholesale <- read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/00292/Wholesale%20customers%20data.csv")

# Inspect the data
head(wholesale)
str(wholesale)

# Remove categorical columns
data <- wholesale[, 3:8]  # Columns: Fresh, Milk, Grocery, Frozen, Detergents_Paper, Delicassen
str(data)
# Scale the data (important!)
data_scaled <- scale(data)

# Use the elbow method to help decide how many clusters
fviz_nbclust(data_scaled, kmeans, method = "wss")

# Apply k-means clustering with 3 clusters
set.seed(123)
km <- kmeans(data_scaled, centers = 3, nstart = 25)

# Visualize the clusters
fviz_cluster(km, data = data_scaled)

# Look at how many customers in each group
km$size

# Add cluster labels back to original data
wholesale$Cluster <- factor(km$cluster)
head(wholesale)
