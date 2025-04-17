#### Load library and diamonds dataset ####
library("tidyverse")
data <- diamonds
attach(data)

# View structure of the data
str(data)
summary(data)
head(data)
colSums(is.na(data)) # check for missing values

# Variable distributions
hist(carat)
barchart(cut)
barchart(color)
barchart(clarity)
hist(price)
