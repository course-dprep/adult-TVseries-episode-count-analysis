#required packages
library(tidyverse)

#set directory
data_dir <- "../../data"  

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


filenames <- c(
  "title_basics",
  "title_ratings",
  "title_episodes"
)

# Download and save each file as CSV in data folder
for (i in 1:length(urls)) {
  download_data(urls[i], filenames[i])
}
