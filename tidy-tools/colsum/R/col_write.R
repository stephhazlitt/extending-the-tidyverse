#' @examples
#' df <- data.frame(x = 1, y = 2)
#' path <- tempdir()


col_write <- function(df, path = tempdir()) {
  file_name <- paste0(path, "/", names(df), ".txt")
  walk2(df, file_name, ~ writeLines(as.character(.x), .y))

  }
