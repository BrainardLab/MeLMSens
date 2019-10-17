require(tidyverse)

load_adapt <- function() {
  JNDs <- read_csv(here('data','experimental','adapt.results.csv'), na = c("", "NA", "NaN")) %>%
    mutate(level = factor(level)) %>%
    mutate(axis = factor(axis))
  return(JNDs)
}

load_pulse <- function() {
  JNDs <- read_csv(here('data','experimental','pulse.results.csv'), na = c("", "NA", "NaN")) %>%
    mutate(level = factor(level)) %>%
    mutate(axis = factor(axis))
  return(JNDs)
}