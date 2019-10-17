library(tidyverse)

predict_from_background_LMS <- function (thresholds_splatter) {
  predicted_JNDs <- thresholds_splatter %>%
    # Convert to wide-format: separate columns for high/low
    select(contrastNominal) %>%
    spread(key = level, value = contrastNominal) %>%
    
    # Calculate contrast predicted:
    # Equate for contrast nominal
    mutate(high = low) %>%
    gather(low,high,key='level',value='LMScontrastPredicted') %>%
    mutate(level=factor(level,levels=c('low','high'))) %>%
    right_join(thresholds_splatter) %>%
    
    # Calculate JND
    mutate(threshold_JND = LMScontrastPredicted * LMSBackgroundNominal)
  return(predicted_JNDs)
}