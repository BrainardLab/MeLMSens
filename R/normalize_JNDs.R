require(tidyverse)

normalize_JNDs <- function(data){
  data <- data %>%
    # Select only relevant columns
    select(participant, session, axis, level, threshold_JND) %>%
    
    # Convert to wide-format: separate columns for high/low
    spread(key = level, value = threshold_JND) %>%
    
    # Normalize by median of low_nominal across sessions per axis
    group_by(participant, axis) %>%
    mutate(high = high / median(low, na.rm = TRUE),
           low = low / median(low, na.rm = TRUE)) %>%
    
    # Convert back to tall: separate rows for high/low
    gather(low,high,key='level',value='JND') %>%
    mutate(level=factor(level,levels=c('low','high')))
  return(data)
}