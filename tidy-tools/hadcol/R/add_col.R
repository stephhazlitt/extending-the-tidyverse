#' Add a column to a data frame
#'
#' Allows you to insert a new colum at arbitrary
#' position. Will replace existing variable with
#' the same name, if present.
#'
#' @param x A data frame
#' @param name Name of variable to create. If variable of that name
#'   already exists
#' @param value Values to insert.
#' @param where Position to insert. Use 1 to insert on LHS, or -1 to insert on
#'   RHS.
#' @seealso To add multiple columns, see [add_cols()].
#' @export
#' @examples
#' df <- data.frame(x = 1:5)
#' add_col(df, "y", runif(5))
#' add_col(df, "y", runif(5), where = 1)
#'
#' add_col(df, "x", 5:1)
add_col <- function(x, name, value, where = ncol(x) + 1) {
  if (name %in% names(x)) {
    x[[name]] <- value
    x
  } else {
    df <- setNames(data.frame(value), name)
    add_cols(x, df, where = where)
  }
}
