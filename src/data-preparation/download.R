# Load required packages
library(tidyverse)

# Set the correct path to the root 'data' directory
data_dir <- "../../data"  # Adjusted to store in the root data directory
if (!dir.exists(data_dir)) {
  dir.create(data_dir, recursive = TRUE)
}

# DOWNLOAD DATA

## Function to download data and save as CSV
download_data <- function(url, filename) {
  download.file(url = url, destfile = paste0(data_dir, "/", filename, ".csv"))
}

# URLs for the IMDb datasets
urls <- c(
  'https://datasets.imdbws.com/title.basics.tsv.gz',
  'https://datasets.imdbws.com/title.ratings.tsv.gz',
  'https://datasets.imdbws.com/title.episode.tsv.gz'
)

# Filenames for the CSV files
filenames <- c(
  "title_basics",
  "title_ratings",
  "title_episodes"
)

# Download and save each file as CSV in the root 'data' directory
for (i in 1:length(urls)) {
  download_data(urls[i], filenames[i])
}
