# Define variables
R = Rscript
SRC_DIR = src
DATA_PREP_DIR = $(SRC_DIR)/data-preparation
ANALYSIS_DIR = $(SRC_DIR)/analysis
TEMP_DIR = gen/temp
OUTPUT_BEFORE_CLEANING = gen/output/before_cleaning
OUTPUT_AFTER_CLEANING = gen/output/after_cleaning

# Default target: run the entire pipeline
all: $(OUTPUT_AFTER_CLEANING)/scatterplot_episodes_vs_rating.pdf $(OUTPUT_AFTER_CLEANING)/boxplot_rating_by_adult_content_with_episode_labels.pdf

# Rule to download the data
data: data/title_basics.csv data/title_ratings.csv data/title_episodes.csv

data/title_basics.csv data/title_ratings.csv data/title_episodes.csv: $(DATA_PREP_DIR)/download.R
	$(R) $(DATA_PREP_DIR)/download.R

# Rule for data exploration before cleaning
before_cleaning: $(ANALYSIS_DIR)/data\ exploration\ before\ cleaning.R data/title_basics.csv data/title_ratings.csv data/title_episodes.csv
	$(R) $(ANALYSIS_DIR)/data\ exploration\ before\ cleaning.R

# Rule to clean and merge the data
$(TEMP_DIR)/cleaned_merged_tvseries.csv: $(DATA_PREP_DIR)/clean\ and\ merge.R before_cleaning
	$(R) $(DATA_PREP_DIR)/clean\ and\ merge.R

# Rule to generate plots after cleaning
$(OUTPUT_AFTER_CLEANING)/scatterplot_episodes_vs_rating.pdf $(OUTPUT_AFTER_CLEANING)/boxplot_rating_by_adult_content_with_episode_labels.pdf: $(ANALYSIS_DIR)/data\ exploration\ after\ cleaning.R $(TEMP_DIR)/cleaned_merged_tvseries.csv
	Rscript $(ANALYSIS_DIR)/data\ exploration\ after\ cleaning.R

# Rule to perform linear regression after cleaning
$(OUTPUT_AFTER_CLEANING)/linear_regression_summary.txt: $(ANALYSIS_DIR)/linear_regression.R $(TEMP_DIR)/cleaned_merged_tvseries.csv
	Rscript $(ANALYSIS_DIR)/linear_regression.R


# Clean temporary and generated files
clean:
	rm -rf $(TEMP_DIR)/*.csv $(OUTPUT_BEFORE_CLEANING)/*.pdf $(OUTPUT_AFTER_CLEANING)/*.pdf $(OUTPUT_AFTER_CLEANING)/*.txt data/*.csv
