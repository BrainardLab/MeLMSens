library(tidyverse)
library(here)
source(here('R','load_data.R'))
source(here('R','clean_data.R'))
source(here('R','normalize_JNDs.R'))
source(here('R','analyze_results.R'))
source(here('R','results.plot.R'))

make_figures_JNDs <- function(){
  make_figure_JNDs_adapt()
  make_figure_JNDs_pulse()
}

make_figure_JNDs_adapt <- function() {
  # load data
  results <- load_adapt()
  
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
  ggsave(here('figs','adapt.results.pdf'), width = 10, height = 5)
}

make_figure_JNDs_pulse <- function() {
  # load data
  results <- load_pulse()
  
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
  ggsave(here('figs','pulse.results.pdf'), width = 10, height = 5)
}