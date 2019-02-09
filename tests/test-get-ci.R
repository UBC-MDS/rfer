library(testthat)

context("Get CI")

gap_df <- gapminder %>%
  filter(year == 2007 & continent %in% c("Africa")) %>%
  specify(response = lifeExp) %>%
  generate(reps = 30,type = "bootstrap") %>%
  calculate(stat = "mean")

test_that("basics",{
          
  expect_silent(get_ci(gap_df))
  
  expect_silent(get_ci(x=gap_df,level=0.9))
  
  expect_error(get_ci(gap_df,level=1.3))
  
  expect_error(get_ci(gap_df,level="large"))
  
  })