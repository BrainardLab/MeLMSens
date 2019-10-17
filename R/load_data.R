load_data <- function() {
  require(tidyverse)
  JNDs <- read_csv(here('data','experimental','results.csv'), na = c("", "NA", "NaN")) %>%
    mutate(level = factor(level)) %>%
    mutate(axis = factor(axis))
  return(JNDs)
}