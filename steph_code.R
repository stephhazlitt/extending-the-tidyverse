## A useful building block is add_cols() -
## works like cbind() but can insert anywhere

add_cols <- function(x, y, where = 1) {
  if (where == 1) { # first col
    ...
  } else if (where > ncol(x)) { # last col
    ...
  } else {
    ... }
}

## My first attempt
add_cols <- function(x, y, where = 1) {
  if (where == 1) {
    cbind(x, y)
  } else if (where > ncol(x)) {
    cbind(y, x)
  } else {
    cbind(x[1:where], y, x[where:nrow(x)])
  }
}

## Actually correct
add_cols <- function(x, y, where = 1) {
  if (where == 1) {
    cbind(y, x)
  } else if (where > ncol(x)) {
    cbind(x, y)
  } else {
    lhs <- 1:(where - 1)
    cbind(x[lhs], y, x[-lhs])
  }
}


## purrr::map

library(purrr)
map_dbl(mtcars, mean)

c(-10,0,10, 100) %>% map(rnorm, n = 10)

OR 

df <- c(-10,0,10, 100)
map_dbl(df, rnorm, n = 10) ## errors as size of object is not same is object out

map(df, rnorm, n = 10) ## takes in 10 elements and outputs 100 in a list

iris %>%  map_int(dplyr::n_distinct)
iris %>%  map_int(function(x) length(unique(x)))
iris %>%  map_int(~ length(unique(.x)))

input <- list(1:10, sqrt(4), 5, "n")
map(input, log)

# safely() modifies a function so it never fails
input <- list(1:10, sqrt(4), 5, "n")
output <- map(input, safely(log))
View(output)

## A more useful example
urls <- c(
  "https://google.com",
  "https://en.wikipedia.org",
  "asdfasdasdkfjlda"
)
# Fails
contents <- map(urls, readLines, warn = FALSE)

# Always succeeds
contents <- urls %>%
  map(safely(readLines), warn = FALSE)
str(contents)
View(contents)

# transpose
contents_foo <- urls %>%
  map(safely(readLines), warn = FALSE) %>% 
  transpose()

what_worked <-  map_lgl(contents_foo$error, is.null)

not_ok <- urls[!ok]
ok <- urls[ok]


View(contents_foo)

## Your turn
library(stringr)
x <- c("bbaaab", "bbb", "bbaaba")
str_locate(x, "a+")

## APIs

x <- 1:6
attr(x, "max") <- 5
attr(x, "max")
attributes(x)

## safely exercise
library(purrr)
safe_log <- safely(log)

safe_log(10)
safe_log("a")


