col_classes <- function(x) {
  map_chr(x, function(x) paste0(class(x), collapse = "\n"))
}
