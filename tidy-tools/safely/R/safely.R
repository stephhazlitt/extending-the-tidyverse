#' Make a safe version of a function
#'
#' `safely()` wraps its input function, creating a new function that never
#' throws an error. Instead, it returns an object of class `safely` which
#' is a list with two components, `result` and `error`. One component is
#' always null
#'
#' @param .f a function to wrap
#' @export
#' @examples
#' safe_log <- safely(log)
#' safe_log(10)
#' safe_log("10")
safely <-  function(.f) {
  stopifnot(is.function(.f))

  function(...) {
    tryCatch({
      new_safely(result = .f(...))
    }, error = function(e) {
      new_safely(error = e)
    })
  }
}

new_safely <- function(result = NULL, error = NULL) {
  if (!xor(is.null(result), is.null(error))) {
    stop("One of `result` and `error` must be NULL", call. = FALSE)
  }

  structure(
    list(
      result = result,
      error = error
    ),
    class = "safely"
  )
}
