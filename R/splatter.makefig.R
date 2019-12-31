library(tidyverse)
library(here)

source(here('R','clean_data.R'))
source(here('R','splatter.R'))
source(here('R','analyze_results.R'))
source(here('R','normalize_JNDs.R'))
source(here('R','results.plot.R'))

make_figure_splatter_threshold_background_adapt <- function () {
  thresholds_splatter <- read_csv(here('data','experimental','adapt.thresholds.splatter.csv'))
  
  # Clean
  thresholds_splatter <- thresholds_splatter %>%
    rename_participants() %>%
    group_by(participant, session, axis, level) %>%
    mutate(contrastNominal= contrastNominalFit) %>%
    select(LMSBackgroundNominal,LMSBackgroundMeasured,contrastNominal)
  
  JNDs <- predict_from_background_LMS(thresholds_splatter)
  
  JNDs <- normalize_JNDs(JNDs)
  
  medianJNDs <- median_JNDs(JNDs)
  
  plot_JNDs(JNDs,medianJNDs) +
    ylab("Predicted threshold (LMS JND, normalized") +
    ggtitle("Predicted threshold, if background LMS splatter is considered")
  
  ggsave(here('figs','adapt.backgroundLMS.threshold.splatter.pdf'), width = 10, height = 5)
}