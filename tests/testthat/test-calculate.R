context("calculate")
library(dplyr)
df_t <- data.frame(matrix(0:10,nrow=9,ncol=5))
#`%>%` <- magrittr::`%>%`
df_t<- df_t %>% mutate(X1=c(1,1,1,2,2,2,3,3,3))
df_test <- tibble::as_tibble(df_t)
df_test_2 <- tibble::as_tibble(df_t)
names(df_test) <- c("sample_id","variable1","variable2","response","response1")

names(df_test_2) <- c("variable1","variable2","variable3","response","response1")

test_that("handling different inputs",{
  #get right resultes when having different inputs in column
  expect_silent(calculate(df_test,column = "response"))
  expect_silent(calculate(df_test,column = "response1"))

  #get error when the input datafrane doesn't have a column called sample_id
  expect_error(calculate(df_test_2,column = "response"))

})

test_that("handling column input",{
  #get error when column not specified
  expect_error(calculate(df_test))
  #get error when the input of column is not a string
  expect_error(calculate(df_test, column = 123))
  #get error when the input of column is not a column name in the dataframe
  expect_error(calculate(df_test,column = "response2"))
})

test_that("input is a dataframe",{
  expect_silent(calculate(df_test,column = "response"))
  expect_error(calculate("df_test",column = "response"))
})


test_that("output is correct",{
  expect_equal(calculate(df_test,column = "response")[["response"]][1],6,tolerance=1e-2)
  expect_equal(calculate(df_test,column = "response1")[["response1"]][2],7,tolerance=1e-2)
})



result<-calculate(df_test,column = "response")

test_that("shape is correct",{
  expect_equal(nrow(result),3)
  expect_equal(ncol(result),2)
})

test_that("type works",{
  expect_silent(calculate(df_test,column = "response",stat = "mean"))
  expect_error(calculate(df_test,column = "response",stat = "standarderror"))

})
