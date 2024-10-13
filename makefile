all: analysis data-preparation

# Calls the Makefile in src/data-preparation
data-preparation:
	make -C src/data-preparation

# Calls the Makefile in src/analysis, which now includes regression analysis
analysis: data-preparation
	make -C src/analysis

# Clean target to remove generated files and folders
clean:
	R -e "unlink('data', recursive = TRUE)"
	R -e "unlink('gen', recursive = TRUE)"



