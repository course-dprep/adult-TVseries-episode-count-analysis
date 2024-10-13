
# Variables
DATA = ../../data
TEMP = ../../gen/temp
OUTPUT_BEFORE = ../../gen/output/before_cleaning
OUTPUT_AFTER = ../../gen/output/after_cleaning

# Default target for analysis
all: before_cleaning after_cleaning regression_analysis

# Target for before cleaning analysis
before_cleaning: $(OUTPUT_BEFORE)/plot_adult_content_classification.pdf $(OUTPUT_BEFORE)/plot_average_ratings_distribution.pdf $(OUTPUT_BEFORE)/plot_episode_distribution.pdf

# Create output directory if it doesn't exist
$(OUTPUT_BEFORE):
	R -e "dir.create('../../gen/output/before_cleaning', recursive = TRUE)"

# Generate before cleaning plots
$(OUTPUT_BEFORE)/plot_adult_content_classification.pdf $(OUTPUT_BEFORE)/plot_average_ratings_distribution.pdf $(OUTPUT_BEFORE)/plot_episode_distribution.pdf: $(DATA)/title_basics.csv $(DATA)/title_ratings.csv $(DATA)/title_episodes.csv | $(OUTPUT_BEFORE)
	R -e "dir.create('../../gen/output/before_cleaning', recursive = TRUE)"
	R --vanilla < data_exploration_before_cleaning.R

# Target for after cleaning analysis
after_cleaning: $(OUTPUT_AFTER)/scatterplot_episodes_vs_rating.pdf $(OUTPUT_AFTER)/boxplot_rating_by_adult_content_with_episode_labels.pdf

# Create output directory for after cleaning if it doesn't exist
$(OUTPUT_AFTER):
	R -e "dir.create('../../gen/output/after_cleaning', recursive = TRUE)"

# Generate after cleaning plots
$(OUTPUT_AFTER)/scatterplot_episodes_vs_rating.pdf $(OUTPUT_AFTER)/boxplot_rating_by_adult_content_with_episode_labels.pdf: $(TEMP)/cleaned_merged_tvseries.csv | $(OUTPUT_AFTER)
	R --vanilla < data_exploration_after_cleaning.R

# Target for performing linear regression analysis
regression_analysis: $(OUTPUT_AFTER)/linear_regression_summary.txt $(OUTPUT_AFTER)/linear_regression_coefficients.csv

# Perform the regression analysis and save results
$(OUTPUT_AFTER)/linear_regression_summary.txt $(OUTPUT_AFTER)/linear_regression_coefficients.csv: $(TEMP)/cleaned_merged_tvseries.csv | $(OUTPUT_AFTER)
	R --vanilla < linear_regression.R
