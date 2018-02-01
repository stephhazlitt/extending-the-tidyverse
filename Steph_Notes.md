Steph's Workshop Notes
================

Steph's notes from lecture component of the Extending the Tidyverse RStudio workshop (Jan 31 - Feb 1 2018)

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

**alfred** tool for Mac -- find and open projects quickly

Purrr
-----

Map always return a list, modify() always returns same object of the same shape type as used (df -&gt; df) Can also use map\_dfr or map\_dfc.

What should always be true about the output \* should always be a df \* ....

Side-Effects
------------

-   printing something
-   plotting something
-   saving something
-   changing environment e.g.
-   options()
-   env vars
-   setwd()
-   browser()
-   library()

Use print() in a pipe series to see the object on the fly but without messing with the pipe!

API Design
----------

-   optimize code for reading (readers) not writing, time reading code is much more than time writing code.
-   small problems, frictions -- add up to big pain points.
-   considering the pipe can lead to better APIs even if you are not using the pipe
-   avoid dots in function names

S3
--

&& use in if statements, scalar version of & (look up more on this later)

Changing the class of an object -&gt; "R lets you point a loaded gun at your foot, but you should never pull the trigger" --Hadley
