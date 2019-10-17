library(ggplot2)

plot_JNDs <- function (JNDs, medianJNDs) {
  p <-  ggplot() +
    # Individual sessions
    geom_line(data = JNDs, aes(x = level, y = JND, group=session), alpha = .7) +
    
    # Participant median and SEM
    geom_point(data = medianJNDs, aes(x = level, y = median), size = 1) +
    geom_line(data = medianJNDs, aes(x = level, y = median, group = 1), size =1) +
    geom_linerange(data = medianJNDs, aes(x = level, ymin = MminSEM, ymax = MplusSEM), size = 1) +
    
    # Markup
    facet_grid(~ participant) +
    scale_y_continuous(breaks = seq(-1,7,1), limits = c(-1,5)) +
    geom_hline(yintercept = 1, linetype='solid') +
    geom_hline(yintercept = 4.5, linetype='dashed') +    
    ylab("Normalized Flicker Threshold") +
    xlab("Adaptation level") +
    theme_bw()
  return(p)
}