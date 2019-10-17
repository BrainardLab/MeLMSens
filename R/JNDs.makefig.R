library(tidyverse)
library(here)
source(here('R','load_data.R'))
source(here('R','clean_data.R'))
source(here('R','normalize_JNDs.R'))
source(here('R','analyze_results.R'))
source(here('R','results.plot.R'))

make_figure_JNDs <- function() {
  # load data
  results <- load_data()
  
  # clean
  results <- clean_data(results)
  
  # normalize JNDs
  JNDs <- normalize_JNDs(results)
  
  # filter
  JNDs <- filter(JNDs,axis == 'Melanopsin')
  
  # median JNDs
  medianJNDs <- median_JNDs(JNDs)

  # plot JNDs
  plot_JNDs(JNDs,medianJNDs)
  
  # save
  ggsave(here('figs','results.pdf'), width = 10, height = 5)
}