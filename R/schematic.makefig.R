library(tidyverse)
library(here)
library(readr)
source(here('R','schematic.plot.R'))

make_figs_silentsubstitution <- function() {
  make_fig_receptors()
  make_fig_lowhigh()
  make_fig_flickerlow()
}

make_fig_receptors <- function() {
  # Load
  receptors = read_csv(here('data','example','receptors.csv'),col_names = c("Wls","L","M","S","Mel"))
  
  # Plot
  p <- plot_receptors(receptors)
  
  # Save
  ggsave(here('figs','receptorfundamentals.pdf'), height = 8, width = 10, units = "in")
}

make_fig_lowhigh <- function() {
  # Load
  SPDs = read_csv(here('data','example','example.SPDs.csv'),
                  col_names = c("Wls",
                                "LMS_low","LMS_low_pos","LMS_low_neg",
                                "LMS_high","LMS_high_pos","LMS_high_neg",
                                "Mel_low","Mel_low_pos","Mel_low_neg",
                                "Mel_high","Mel_high_pos","Mel_high_neg"
                  ))
  
  # Plot
  p <- plot_lowhigh(SPDs)
  
  # Save
  ggsave(here('figs','mel.hilo.SPDs.pdf'), height = 8, width = 10, units = "in")
}

make_fig_flickerlow <- function() {
  # Load
  SPDs = read_csv(here('data','example','example.SPDs.csv'),
                  col_names = c("Wls",
                                "LMS_low","LMS_low_pos","LMS_low_neg",
                                "LMS_high","LMS_high_pos","LMS_high_neg",
                                "Mel_low","Mel_low_pos","Mel_low_neg",
                                "Mel_high","Mel_high_pos","Mel_high_neg"
                  ))
  
  # Plot
  p <- plot_lowflicker(SPDs)
  
  # Save
  ggsave(here('figs','mel-lo.flicker.SPDs.pdf'), height = 8, width = 10, units = "in")
}