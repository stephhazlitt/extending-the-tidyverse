#' cbind two data frames at arbitrary position
#'
#' A more flexible variant of [cbind()].
#'
#' @param x,y Data frames to combine
#' @param where Position of `y` relative to `x`.
#'   `where = 1` will insert `y` on the left,
#'   `where = ncol(x) + 1` will insert `y` on the
#'  right.
#' @return A data frame
#' @family xyz
#' @export
add_cols <- function(x, y, where = 1) {
  where <- check_where(where)

  if (where == 1) {
    cbind(y, x)
  } else if (where > ncol(x)) {
    cbind(x, y)
  } else {
    lhs <- 1:(where - 1)
    cbind(x[lhs], y, x[-lhs])
  }
}

check_where <- function(x) {
  if (length(x) != 1 || !is.numeric(x)) {
    stop("`where` must be a length one numeric vector.", call. = FALSE)
  }
  x <- as.integer(x)

  if (x == 0 || is.na(x)) {
    stop("`where` must not be zero or missing", call. = FALSE)
  } else {
    x
  }
}
