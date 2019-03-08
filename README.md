[![Build Status](https://travis-ci.org/UBC-MDS/rfer.svg?branch=master)](https://travis-ci.org/UBC-MDS/rfer)

# Rfer

The rfer package streamlines the process of reshuffling and bootstrapping of samples, calculating summary statistics and confidence intervals that assist in performing statistical inference. It does this using a combination of functions that are built with the emphasis on clear expressive code and using correct statistical grammar that explains the way the values are calculated and how the tests are evaluated in the process of inference.

With this package as the inspiration, rfer will have four main functions (specify,generate,calculate,get_ci) for the first iteration. These functions will, given a data frame and the specified response variable; calculate summary statistics and confidence intervals for the response variable. Further details follow in the description of the functions.

### Team

|Group Member |Github |
|-|-|
|Gabriel Bogo|[@GabrielBogo](https://github.com/GabrielBogo)|
|Yuwei Liu |[@liuyuwei169](https://github.com/liuyuwei169)|
|Weifeng (Davy) Guo |[@DavyGuo](https://github.com/DavyGuo)|
|Mohamad Makkaoui |[@makka3](https://github.com/makka3)|

## Installation instructions

1. To download (requires [devtools](https://cran.r-project.org/web/packages/devtools/index.html)):

`devtools::install_github("UBC-MDS/rfer",build_opts = c("--no-resave-data", "--no-manual"))`

2. To load into environment:

`library(rfer)`

## Examples

``` r

#Using the iris dataset

iris_width = specify(iris, response="Sepal.Width")
iris_resampled = generate(iris_width, n_samples=30, type="bootstrap")
width_mean = calculate(iris_resampled,column = "Sepal.Width", stat="mean")
width_ci = get_ci(width_mean,column="Sepal.Width",level=0.9)
```

``` r

#Using the mtcars dataset

mtcars %>%
  specify(response = "hp") %>%
  generate(n_samples = 10,type = "bootstrap") %>%
  calculate(column = "hp",stat="mean") %>%
  rfer::get_ci(column = "hp",confidence_level = 0.9,point_estimate = hp_point_estimate,type="percentile")
```

### Coverage
![coverage.png](coverage.png)
