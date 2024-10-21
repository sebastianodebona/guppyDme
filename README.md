# Density Manipulation Experiment

This project analyzes the data from a Density Manipulation Experiment conducted in Trinidad in 2018, to study the effect of population density perturbations on dispersal and habitat use, using natural populations of guppies as a study system. The project constitutes part of Sebastiano De Bona's PhD thesis.

The analysis can be reproduced by cloning the project and going manually through the vignettes, in order; or by installing the package `guppyDme` and running `pkgdown::build_site()` to run all vignettes at once.

The output of the analyses can be seen here:

- [Link](https://sebastianodebona.github.io/guppyDme/)

## Do I have to install the package?

No! If you don't want to install the package, simply clone it and open the `.Rmd` files, in order, from the `vignettes/` folder. There you'll find everything you need to reproduce the analyses.

## How to install the package, if you want to

You can install the `guppyDme` package locally, by typing.

```
devtools::install_github("sebastianodebona/guppyDme")
```

## If the installation doesn't work?

You might require a preparation step, installing a list of required packages. Copy-paste the following code in R or RStudio and execute:

```
install.packages(c('car', 'devtools', 'FactoMineR', 'factoextra', 'ggplot2', 'ggpubr', 'here', 'knitr', 'lme4', 'lmerTest', 'lubridate', 'magrittr', 'mlogit', 'pkgdown', 'plyr', 'rmarkdown', 'roxygen2', 'rtf', 'scales', 'stargazer', 'tidyverse'))
```


## Data

The package comes with two datafiles attached: `DMEdata.Rda` and `DMEhabitat.Rda`.
