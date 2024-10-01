# Load required packages
library(tidyverse)

input_dir <- "../../gen/temp"  # Path to the cleaned merged data
output_dir <- "../../gen/output/after_cleaning"  # Path for the output directory after cleaning

# Load the merged dataset (use relative path)
merged_data <- read_csv(file.path(input_dir, "cleaned_merged_tvseries.csv"))

# Check the structure of the data to understand the variables
glimpse(merged_data)

# Perform basic linear regression
# We want to model how average rating is affected by the number of episodes and whether the title is adult content
linear_model <- lm(averageRating ~ episode_count + isAdult, data = merged_data)

# Output the summary of the model
if (!dir.exists(output_dir)) {
  dir.create(output_dir, recursive = TRUE)
}

sink(file = file.path(output_dir, "linear_regression_summary.txt"))
summary(linear_model)
sink()


