# library(testthat)
# library(tidyverse)
# library(gapminder)
# context("specify")
#
# gap_df <- gapminder %>%
#   filter(year == 2007 & continent %in% c("Africa")) %>%
#   specify(response = lifeExp)
#
#
# test_that("enough parameters",{
#
#   expect_error(specify(gap_df))
#
#   expect_silent(specify(gap_df,country,explanatory=None))
#
#   expect_error(specify(lifeExp,country))
#
#   expect_silent(specify(gap_df,lifeExp,country))
#
# })
#
# test_that("number of rows",{
#   expect_equal(nrow(specify(gap_df,lifeExp)[,1]),nrow(tibble(gap_df$lifeExp)))
# })
