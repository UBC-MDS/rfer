context("Get CI")

df_t <- data.frame(matrix(0:10,nrow=11,ncol=2))
df_test <- tibble::as_tibble(df_t)
df_test_2 <- tibble::as_tibble(df_t)
names(df_test) <- c("groups","stat")
names(df_test_2) <- c("groups","mean")

op_get <- get_ci(df_test)

test_that("handling different inputs",{
  expect_silent(get_ci(df_test))
  expect_silent(get_ci(df_test,confidence_level=0.8))
  expect_error(get_ci(df_test_2))
  expect_error(get_ci(df_test,type="any"))
})

test_that("level can only be between 0 and 1",{
  expect_error(get_ci(df_test,confidence_level=1.3))
  expect_error(get_ci(df_test,confidence_level="aa"))
})

test_that("output is correct",{
  expect_equal(get_ci(df_test,confidence_level=0.8)[["Lower_Bound"]][1],1,tolerance=1e-2)
  expect_equal(get_ci(df_test,confidence_level=0.8)[["Upper_Bound"]][1],9,tolerance=1e-2)
})

test_that("shape is correct",{
  expect_equal(nrow(op_get),1)
  expect_equal(ncol(op_get),4)
})

test_that("type attribute works",{
  expect_silent(get_ci(df_test,type="percentile"))
  expect_error(get_ci(df_test,type="standarderror"))
  
})

test_that("point estimate is null",{
  expect_error(get_ci(df_test,point_estimate = 2))
  expect_silent(get_ci(df_test,point_estimate=NULL))
})