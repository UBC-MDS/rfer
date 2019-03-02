# # library(testthat)
# # library(tidyverse)
# # library(gapminder)
# context("specify")
#
# sampledf <- data_frame(response=c(1,2,2,3,3,4), sample_id=c(1,1,1,2,2,2))
#
# test_that("basic",{
#
#   expect_silent(calculate(sampledf))
#
#   expect_error(calculate(sample_id))
#
#   expect_error(calculate(response))
#
# })
#
# test_that("shape",{
#
#   expect_equal(nrow(calculate(sampledf)),3)
#
#   expect_equal(ncol(calculate(sampledf)),2)
#
#
# })

