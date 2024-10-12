DATA = ../../data
TEMP = ../../gen/temp
OUTPUT_BEFORE = ../../gen/output/before_cleaning
OUTPUT_AFTER = ../../gen/output/after_cleaning

# Default target for analysis
all: before_cleaning after_cleaning

# Target for before cleaning analysis (generate before cleaning plots)
before_cleaning: $(OUTPUT_BEFORE)/plot_adult_content_classification.pdf $(OUTPUT_BEFORE)/plot_average_ratings_distribution.pdf $(OUTPUT_BEFORE)/plot_episode_distribution.pdf

# Create output directory if it doesn't exist
$(OUTPUT_BEFORE):
	mkdir -p $(OUTPUT_BEFORE)

# Generate before cleaning plots
$(OUTPUT_BEFORE)/plot_adult_content_classification.pdf $(OUTPUT_BEFORE)/plot_average_ratings_distribution.pdf $(OUTPUT_BEFORE)/plot_episode_distribution.pdf: $(DATA)/title_basics.csv $(DATA)/title_ratings.csv $(DATA)/title_episodes.csv | $(OUTPUT_BEFORE)
	R --vanilla < data\ exploration\ before\ cleaning.R

# Target for after cleaning analysis (generate after cleaning plots)
after_cleaning: $(OUTPUT_AFTER)/scatterplot_episodes_vs_rating.pdf $(OUTPUT_AFTER)/boxplot_rating_by_adult_content_with_episode_labels.pdf

# Create output directory for after cleaning if it doesn't exist
$(OUTPUT_AFTER):
	mkdir -p $(OUTPUT_AFTER)

# Generate after cleaning plots
$(OUTPUT_AFTER)/scatterplot_episodes_vs_rating.pdf $(OUTPUT_AFTER)/boxplot_rating_by_adult_content_with_episode_labels.pdf: $(TEMP)/cleaned_merged_tvseries.csv | $(OUTPUT_AFTER)
	R --vanilla < data\ exploration\ after\ cleaning.R

