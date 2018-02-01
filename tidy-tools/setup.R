# A polite helper for installing packages ---------------------------------

please_install <- function(pkgs, install_fun = install.packages) {
  if (length(pkgs) == 0) {
    return(invisible())
  }
  if (!interactive()) {
    stop("Please run in interactive session", call. = FALSE)
  }

  title <- paste0(
    "Ok to install these packges?\n",
    paste("* ", pkgs, collapse = "\n")
  )
  ok <- menu(c("Yes", "No"), title = title) == 1

  if (!ok) {
    return(invisible())
  }

  install_fun(pkgs)
}

# Do you have all the needed packages? ------------------------------------

tidytools <- c(
  "covr", "devtools", "rlang", "roxygen2", "shiny", "testthat",
  "purrr", "repurrrsive", "rstudioapi", "usethis"
)
have <- rownames(installed.packages())
needed <- setdiff(tidytools, have)

please_install(needed)


# lobstr ------------------------------------------------------------------
# I forgot that the lobstr package from github will also be useful


if (!"lobstr" %in% have) {
  please_install("hadley/lobstr", devtools::install_github)
}

# Do you have the latest testthat? ----------------------------------------
# It was update recently so if you've used it before you might
# have an old version

if (packageVersion("testthat") < "2.0.0") {
  please_install("testthat")
}

# Do you have development version of rlang? -------------------------------
# It makes tidy evaluation much nicer and will soon be available on CRAN.
# After this course, you can rvert to the CRAN version with
# install.packages("rlang")

if (packageVersion("rlang") < "0.1.6.9003") {
  please_install("tidyverse/rlang", devtools::install_github)
}

# Do you have the latest RStudio? ---------------------------------------

if (rstudioapi::getVersion() < "1.1.419") {
  cat("Please install RStudio from http://rstd.io/download-ide\n")
}
