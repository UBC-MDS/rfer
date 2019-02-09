library(testthat)

context("generate")

gap_df <- gapminder %>%
  filter(year == 2007 & continent %in% c("Africa")) %>%
  specify(response = lifeExp)

test_that("shape",
   expect_equal(generate(x=gap_df ) )       
          )

  expect_error(generate(x=gap_df,))