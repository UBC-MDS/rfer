context("Get CI")

ex_num <- 5

df_t <- data.frame(matrix(0:10,nrow=11,ncol=2))
df_test <- tibble::as_tibble(df_t)
df_t2 <- data.frame(matrix(runif(20),nrow=20,ncol=3))
df_test_2 <- tibble::as_tibble(df_t2)
names(df_test) <- c("groups","stat")
names(df_test_2) <- c("col1","col2","col3")

op_get <- rfer::get_ci(df_test,column = "stat")

test_that("handling different inputs",{
  expect_error(rfer::get_ci(data=ex_num,column="num"))
  expect_error(rfer::get_ci(df_test))
  expect_error(rfer::get_ci(df_test,confidence_level=0.8))
  expect_error(rfer::get_ci(df_test_2))
  expect_error(rfer::get_ci(df_test,type="any"))
  expect_error(rfer::get_ci("df_test",type="any"))
})

test_that("column names",{
  expect_error(rfer::get_ci(df_test_2,confidence_level = 0.95))
  expect_error(rfer::get_ci(df_test_2,column="col4"))
  expect_silent(rfer::get_ci(df_test_2,column="col3"))
})

test_that("level can only be between 0 and 1",{
  expect_error(rfer::get_ci(df_test,column="stat",confidence_level=1.3))
  expect_error(rfer::get_ci(df_test,column="stat",confidence_level="aa"))
})

test_that("output is correct",{
  expect_equal(rfer::get_ci(df_test,column="stat",confidence_level=0.8)[["Lower_Bound"]][1],1,tolerance=1e-2)
  expect_equal(rfer::get_ci(df_test,column="stat",confidence_level=0.8)[["Upper_Bound"]][1],9,tolerance=1e-2)
})

test_that("shape is correct",{
  expect_equal(nrow(op_get),1)
  expect_equal(ncol(op_get),4)
})

test_that("type attribute works",{
  expect_silent(rfer::get_ci(df_test_2,column="col2",type="percentile"))
  expect_error(rfer::get_ci(df_test,column="stat",type="standarderror"))

})

test_that("point estimate is null",{
  expect_silent(rfer::get_ci(df_test,column="stat",point_estimate = 2))
  expect_silent(rfer::get_ci(df_test,column="stat",point_estimate = NULL))
  expect_equal(rfer::get_ci(df_test,column="stat",confidence_level=0.8)[["Point_Estimate"]][1],"N/A")
})
