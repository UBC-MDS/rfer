context("specify")

iris_df <- tibble::as.tibble(iris)

test_that("enough parameters",{

  expect_error(specify(iris_df))

  expect_error(specify(iris_df,response="nothing"))

  expect_silent(specify(iris_df,response=Sepal.Width))

})

test_that("number of rows",{
  expect_equal(nrow(specify(iris_df,Sepal.Width)[,1]),nrow(tibble(iris_df$Sepal.Width)))
})
