context("test-safely.R")

test_that("can only supply error or result", {
  expect_error(new_safely(1,2), "One of `result` and `error` must be NULL")
})

# test_that("it's ok for both to be null", {
#   obj <- new_safely(NULL, NULL)
#   expect_error(new_safely(1,2), "must be null")
# })
