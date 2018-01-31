Steph's Workshop Notes
================

Steph's notes from lecture component of the Extending the Tidyverse workshop (Jan 31 - Feb 1 2018)

Atomic Vectors
--------------

Types of atomic vectors: 1. logical 2. integer 3. double 4. character 5. complex 6. raw

Common properties of atomic vectors: - type - length - attributes

NAs
---

    NA == NA
    is.na()

Six types of things in \[\]?
----------------------------

1.  nothing (if you subset with nothing, you get everything)
2.  logical
3.  positive integers
4.  zero (prob no used often deliberately, but useful for making sure functions behave well)
5.  negative integers
6.  character

RStudio keyboard shortcuts
--------------------------

[Multiple cursers!](https://support.rstudio.com/hc/en-us/community/posts/206374508-Multiple-cursors) Alt & select adds multiple cursers. `datapasta` package for some more tricks & tips

Packages
--------

Do not use package.skeleton() Do use this: usethis:create\_package() control plus dot = finder window for functions!

``` r
rpony <- function(n) {
cat("!!!!!!!") ## useful trick to make sure you are seeing output from this function
  sample(ponies, n, replace = TRUE)
}
```

Testing
-------

Rewrite code to make it easily to read, or make it faster. With unit tests in place, can ensure you don't change/break function as you attempt to rewrite.

check\_where(0) stop, where must be btw 1 and ncol(df), invalid value for where check\_where(NA) where must be numeric check\_where(1:10) where must be a scalar value check\_where("a")

Functional Programming
----------------------

Use double \[\[\]\] for extracting single things, use single \[\] for multiple things

NA (default is logical, coerced into other categories) NA\_real\_ NA\_character\_ NA\_integer\_

``` r
typeof(NA)
typeof(NA_real_)
```