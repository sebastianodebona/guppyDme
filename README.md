# Density Manipulation Experiment

This project analyzes the data from a Density Manipulation Experiment conducted in Trinidad in 2018, to study the effect of population density perturbations on dispersal and habitat use, using natural populations of guppies as a study system. The project constitutes part of Sebastiano De Bona's PhD thesis.

The analysis can be reproduced by cloning the project and going manually through the vignettes, in order; or by installing the package `guppyDME` and running `pkgdown::build_site()` to run all vignettes at once.

The output of the analyses can be seen here:

- [Link](https://)

## How to clone this project locally

If you have access to the GitHub repository, you can clone this project
remotely by opening a terminal and typing:

```
git clone 
```

## How to prepare your R for the analyses

A preparation step is required before the analyses, and it entails installing a list of required packages. Copy-paste the following code in R or RStudio and execute:

```
install.packages(c('car', 'devtools', 'FactoMineR', 'factoextra', 'ggplot2', 'ggpubr', 'here', 'knitr', 'lme4', 'lmerTest', 'lubridate', 'magrittr', 'mlogit', 'pkgdown', 'plyr', 'rmarkdown', 'roxygen2', 'rtf', 'scales', 'stargazer', 'tidyverse'))
```


# Data

The package comes with two datafiles attached: `DMEdata.Rda` and `DMEhabitat.Rda`.
