context("test-col_write.R")

test_that("can write out two column data frame", {
  df <- data.frame(x = 1:2, y = 2:1)
  path <- tempfile()
  dir.create(path)

  col_write(df, path)

  files <- dir(path)
  expect_equal(files, c("x.txt", "y.txt"))

  x <- readLines(file.path(path, "x.txt"))
  expect_equal(x, as.character(df$x))
})
