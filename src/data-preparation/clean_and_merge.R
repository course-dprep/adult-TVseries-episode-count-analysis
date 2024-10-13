#required packages
library(tidyverse)

#relative paths
input_dir <- "../../data"  
output_dir <- "../../gen/temp"  


# Load datasets from the data 
title_basics <- read_delim(file.path(input_dir, "title_basics.csv"), delim = '\t', na = '\\N')
title_ratings <- read_delim(file.path(input_dir, "title_ratings.csv"), delim = '\t', na = '\\N')
title_episodes <- read_delim(file.path(input_dir, "title_episodes.csv"), delim = '\t', na = '\\N')


# Cleaning and transformation

# Filter for TV series and select relevant columns
tvseries <- title_basics %>%
  filter(titleType == "tvSeries") %>%
  select(tconst, primaryTitle, isAdult) %>%
  drop_na()  

# Summarize episode counts and rename column for merging
episode_counts <- title_episodes %>%
  group_by(parentTconst) %>%
  summarise(episode_count = n()) %>%
  rename(tconst = parentTconst) %>%
  drop_na()  

# Filter ratings for titles with at least 25 votes
title_ratings_clean <- title_ratings %>%
  select(tconst, averageRating, numVotes) %>%
  filter(numVotes >= 25) %>%
  drop_na()  

# Merge datasets

# Merge TV series with episode counts
tvseries_with_episodes <- tvseries %>%
  inner_join(episode_counts, by = "tconst")

# Merge the resulting dataset with title ratings
tv_series_with_ratings <- tvseries_with_episodes %>%
  inner_join(title_ratings_clean, by = "tconst")

# Add interaction variable (episode_count * isAdult)
tv_series_with_ratings <- tv_series_with_ratings %>%
  mutate(interaction_episode_isAdult = episode_count * isAdult)

# Save the merged data to the temp directory
write_csv(tv_series_with_ratings, file.path(output_dir, "cleaned_merged_tvseries.csv"))
