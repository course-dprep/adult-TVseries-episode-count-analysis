# Required packages
library(tidyverse)

# Relative paths
input_dir <- "../../gen/temp"  
output_dir <- "../../gen/output/after_cleaning"  

# Load the cleaned and merged dataset
tv_series_with_ratings <- read_csv(file.path(input_dir, "cleaned_merged_tvseries.csv"))

# Perform linear regression using the interaction column
model <- lm(averageRating ~ episode_count + isAdult + interaction_episode_isAdult, data = tv_series_with_ratings)

# Create a summary of the model
model_summary <- summary(model)

# Use capture.output to save the summary to a text file
summary_file <- file.path(output_dir, "linear_regression_summary.txt")
capture.output(model_summary, file = summary_file)

# Additionally, save a detailed coefficient table as a CSV file
coef_table <- as.data.frame(coef(model))
write_csv(coef_table, file.path(output_dir, "linear_regression_coefficients.csv"))

