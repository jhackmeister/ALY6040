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
ggplot(data, aes(x=carat)) + 
  geom_histogram(bins=10, fill = "cadetblue1", color = "black") + 
  labs(
    title = "Carat Distribution"
  ) +
  theme_minimal()
ggplot(data, aes(x=price)) + 
  geom_histogram(bins=10, fill = "coral", color = "black") + 
  labs(
    title = "Price Distribution"
  ) +
  theme_minimal()
barchart(cut)
barchart(color)
barchart(clarity)

