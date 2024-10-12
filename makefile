all: analysis data-preparation

# Calls the Makefile in src/data-preparation
data-preparation:
	make -C src/data-preparation

# Calls the Makefile in src/analysis
analysis: data-preparation
	make -C src/analysis

# Clean target to remove generated files
clean:
	rm -rf gen/output/*.pdf gen/output/*.txt gen/temp/*.csv
	rm -rf gen/output/before_cleaning/*.pdf
	rm -rf gen/output/after_cleaning/*.pdf gen/output/after_cleaning/*.txt
	rm -rf data/*.csv


