context("specify")

test_df <- tibble::tibble(a = c(1,3,5,7,9), b = c(1,4,9,16,25), c=c(3,9,27,81,243))

test_that("Input parameters",{

  # if the input is not tibble
  expect_error(specify(1,"a"))

  # if the response is missing
  expect_error(specify(test_df,NULL))

  # if the reponse if not character
  expect_error(specify(test_df,response= 1))

  # if the response is not one of the columns
  expect_error(specify(test_df,response= "d"))

  # if the explantory type is not character
  expect_error(specify(test_df,response= "d",explantory = 2))

  expect_silent(specify(test_df, "a"))

  expect_silent(specify(test_df, "a","b"))

})

test_that("output shape",{

  # if the output
  expect_equal(nrow(specify(test_df,"a")),nrow(test_df))

  expect_equal(ncol(specify(test_df,"a")), 1)

})
