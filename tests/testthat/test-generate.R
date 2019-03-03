context("generate")

gap_df <- gapminder::gapminder %>%
  dplyr::filter(year == 2007 & continent %in% c("Africa"))

dummy_df <- data.frame(matrix(1:3, nrow = 3, ncol = 1))

test_that("shape",{

  # Testing shape output
  expect_equal(nrow(generate(x=dummy_df,n_samples=5)),15)
  expect_equal(ncol(generate(x=dummy_df,n_samples=5)),ncol(dummy_df)+1)
}
)

test_that("input",{

  # If dataframe is empty
  expect_error(generate(x=data.frame(matrix(nrow=0,ncol=0))))

  # If input integer for n_samples is negative
  expect_error(generate(x=gap_df,n_samples=-2))

  # If number of samples chosen to be zero
  expect_error(generate(x=gap_df,n_samples=0))

  # If number of samples chosen is too high
  expect_error(generate(x=gap_df,n_samples=1e10000))

  # If type is not bootstrapping
  expect_error(generate(x=gap_df, type="asdfasdf", n_samples=10))

})
