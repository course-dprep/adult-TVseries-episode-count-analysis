#required packages
library(tidyverse)

input_dir <- "../../gen/temp"  
output_dir <- "../../gen/output/after_cleaning"  

#Load the merged dataset
merged_data <- read_csv(file.path(input_dir, "cleaned_merged_tvseries.csv"))


#basic linear regression
# We want to model how average rating is affected by the number of episodes and whether the title is adult content
linear_model <- lm(averageRating ~ episode_count + isAdult, data = merged_data)


sink(file = file.path(output_dir, "linear_regression_summary.txt"))
summary(linear_model)
sink()


