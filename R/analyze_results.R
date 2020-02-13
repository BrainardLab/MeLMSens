library(tidyverse)

standard_error_median <- function(x){
  return(1.253 * sd(x, na.rm = TRUE) / sqrt(length(x)))
}

median_plus_sem <- function(x) {
  return(median(x)+standard_error_median(x))
}
median_minus_sem <- function(x) {
  return(median(x)-standard_error_median(x))
}


median_JNDs <- function (JNDs) {
  median_JNDs <- JNDs %>%
    group_by(participant, level) %>%
    summarise(median = median(JND),
              SEM = standard_error_median(JND),
              MminSEM = median_minus_sem(JND),
              MplusSEM = median_plus_sem(JND))
  return(median_JNDs)
}
