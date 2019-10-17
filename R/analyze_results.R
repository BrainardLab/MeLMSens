library(tidyverse)

median_JNDs <- function (JNDs) {
  median_JNDs <- JNDs %>%
    group_by(participant, level) %>%
    summarise(median = median(JND),
              SEM = 1.253*sd(JND, na.rm=TRUE)/sqrt(length(JND)),
              MminSEM = median-SEM,
              MplusSEM = median+SEM)
  return(median_JNDs)
}