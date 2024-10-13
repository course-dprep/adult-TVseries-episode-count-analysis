# IMDB How many episodes should you make?
As television shows are a popular form of entertainment, understanding the factors that influence their success is essential for networks, producers, etc. This research explores the relationship between the number of episodes in a TV show and its average rating, while also examining whether this relationship varies between adult and non-adult titles. With this information, key stakeholders in the film industry can make more informed decisions about, for example, whether to allocate resources to extend an existing TV show or instead to initiate production on a new one.

## Research question
"To what extent does the number of a TV show's episodes impact its average rating, and does this differ between adult titles and non-adult titles?"

## Research motivation
The relationship between the number of episodes a TV show is set to have and its average rating is a crucial yet insufficiently studied area in the field of media research. Since competition among streaming platforms and TV networks is rising, uncovering and understanding any factor that may influence TV show rating is paramount for optimizing content. Moreover, as adult shows may benefit from having more episodes due to possibly having more complex or mature story lines, researching whether the effect of episode count on ratings differ for this genre offers additional value to this research. This study therefore aims to answer the question: "To what extent does the number of a TV show's episodes impact its average rating, and does this differ between adult titles and non-adult titles?" The insights gained from this research could assist streaming networks in making more informed decisions with regards to episode count when creating content. On top of that, the findings on how episode count affects viewer rating can help the academic community better understand the psychology behind the concept of liking, while helping economists design more accurate economic models when it comes to the media industry.

## Research method
A multiple linear regression will be the applied research method, with average show rating as the dependent variable. The independent variables will consist of the continuous variable "number of episodes", as well as the dummy variable "adult title" (with 1 for adult shows, 0 for non-adult shows). By including the interaction term episodesXadult, we can also assess a potential difference in effect between adult versus non-adult movies. This linear regression method effectively addresses the objective of this research as it quantifies the impact of episode count ratings while also allowing an interaction term to assess whether this effect differs for the adult genre.

## Results

After conducting the multiple linear regression on our data, the variable coefficients have been identified as listed below:

- Episode count: -0.0003077*
- Adult title: -0.2968*
- episodesXadult: 0.0003865

*significant at the 0.05 level

Using this data to answer the research question, we establish that the total number of episodes has a significant and negative effect on a TV show's average rating. Although ratings appear to be significantly and negatively affected when a movie is of the adult genre, a difference in effect size of episode count between adult and non-adult titles could not be established due to the insignificance of the episodesXadult variable. These findings suggest that networks should prioritize allocating their resources toward new productions rather than additional seasons, particularly if they are aiming for higher average ratings.

## Repository overview

- data
- gen
  - output
    - after_cleaning
    - before_cleaning
  - temp 
- src 
  - analysis
  - data-preparation
- .gitignore 
- LICENSE
- README.md
- makefile

## Dependencies

Make sure you have installed R and make correctly, you can follow the installation guides by clicking on these links:
-R and Rstudio: https://tilburgsciencehub.com/topics/computer-setup/software-installation/rstudio/r/ 
-make: https://tilburgsciencehub.com/topics/automation/automation-tools/makefiles/make/

For R the following packages are used:
```
install.packages("tidyverse")
install.packages("reshape2")
install.packages("kableExtra")
install.packages("gridExtra")
```
## Running instructions

Running the code with make

-First, fork the repository of this project
-Second, copy the url of the main page of the repository and run the following code in git bash.
```
git clone https://github.com/course-dprep/adult-TVseries-episode-count-analysis
```
-Then, make sure you're in the right working directory, in this case open git bash in the "adult-TVseries-episode-count-analysis" folder. When opened, run this command:
```
make
```
-Lastly, to clean the data of all raw and unnecessary data files that are created during the pipeline, run this code in git bash:

```
make clean
```

## Resources
#### IMDB datasets
https://datasets.imdbws.com/title.basics.tsv.gz  
https://datasets.imdbws.com/title.episode.tsv.gz  
https://datasets.imdbws.com/title.ratings.tsv.gz  

## About 
#### Authors
Team 7:  
- [Martijn Hendriks](https://github.com/MartijnHendriks),     e-mail: m.hendriks@tilburguniversity.edu  
- [Mauro de Kort](https://github.com/Maurodekort),            e-mail: m.dekort_3@tilburguniversity.edu  
- [Sem Niezink](https://github.com/semniezinktil),            e-mail: s.d.niezink@tilburguniversity.edu  
- [Ruben van der Thiel](https://github.com/rubenvanderthiel), e-mail: r.r.t.vdrthiel@tilburguniversity.edu  
