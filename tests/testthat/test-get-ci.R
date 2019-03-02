library(testthat)

context("Get CI")

gap_df <- gapminder %>%
  filter(year == 2007 & continent %in% c("Africa")) %>%
  specify(response = lifeExp) %>%
  generate(reps = 30,type = "bootstrap") %>%
  calculate(stat = "mean")

dummy_df1 <- data.frame(matrix(1:10, nrow = 10, ncol = 2))

test_that("basics",{
  
  # No output expected when there a dataframe input        
  expect_silent(get_ci(gap_df))
  
  # No output expected when the level is between 0 and 1
  expect_silent(get_ci(x=gap_df,level=0.9))
  
  # Error when the level is above 1
  expect_error(get_ci(gap_df,level=1.3))
  
  # Expect error if wrong type input
  expect_error(get_ci(gap_df,level="large"))
  
  # Expect output df to have 1 row
  expect_equal(nrow(get_ci(dummy_df1)),1)
  
  # Expect output df to have 4 columns
  expect_equal(ncol(get_ci(dummy_df1)),4)
  
  ## Further tests: That values are actually confidence intervals, and point estimate is approximated correctly 
  
  })