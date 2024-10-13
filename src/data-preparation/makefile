# Makefile in src/data-preparation

DATA = ../../data
TEMP = ../../gen/temp

# Default target for data preparation
all: $(DATA)/title_basics.csv $(DATA)/title_ratings.csv $(DATA)/title_episodes.csv $(TEMP)/cleaned_merged_tvseries.csv

# Target for downloading the data and saving as CSV
$(DATA)/title_basics.csv: download.R
	R -e "dir.create('../../data', recursive = TRUE)"
	R --vanilla < download.R

$(DATA)/title_ratings.csv: download.R
	R --vanilla < download.R

$(DATA)/title_episodes.csv: download.R
	R --vanilla < download.R

# Target for cleaning and merging the data
$(TEMP)/cleaned_merged_tvseries.csv: $(DATA)/title_basics.csv $(DATA)/title_ratings.csv $(DATA)/title_episodes.csv clean_and_merge.R
	R -e "dir.create('../../gen/temp', recursive = TRUE)"
	R --vanilla < clean_and_merge.R
