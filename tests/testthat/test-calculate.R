context("calculate")

df_t <- data.frame(matrix(0:10,nrow=11,ncol=5))
df_test <- tibble::as_tibble(df_t)
df_test_2 <- tibble::as_tibble(df_t)
names(df_test) <- c("sample_id","variable1","variable2","response","response1")
names(df_test_2) <- c("variable1","variable2","variable3","response","response1")
 
test_that("handling different inputs",{
  expect_silent(calculate(df_test,column = "response"))
  expect_silent(calculate(df_test,column = "response1"))
  expect_error(calculate(df_test_2))
  expect_error(calculate(df_test, column = response))
})


