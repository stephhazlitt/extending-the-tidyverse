context("test-col_means.R")

test_that("handles empty data frames", {
  df <- data.frame(x = 1)

  expect_equal(col_means(df[0, , drop = FALSE]), data.frame(x = NaN))
  expect_equal(col_means(df[, 0, drop = FALSE]), data.frame())
})

test_that("preserves single column data frames", {
  df1 <- data.frame(x = c(1, 1))
  df2 <- data.frame(x = c(1, 1), y = "a")

  expect_equal(col_means(df1), data.frame(x = 1))
  expect_equal(col_means(df2), data.frame(x = 1))
})
