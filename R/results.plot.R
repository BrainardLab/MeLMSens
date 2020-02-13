library(ggplot2)
source(here('R','analyze_results.R'))

plot_JNDs <- function (JNDs) {
  p <-  ggplot(data = JNDs) +
    aes(x = level, y = JND, group=session) +
    facet_grid(~ participant) +
  
    # Individual sessions
    geom_line(alpha = .7) +
    
    # Plot median for participant
    stat_summary(fun.y = median, geom = "point", aes(group=1), size =1) +
    stat_summary(fun.y = median, geom = "line", aes(group=1), size =1) +
    stat_summary(fun.y = median, fun.ymax = median_plus_sem, fun.ymin = median_minus_sem,
                 geom = "linerange", aes(group = 1), size =1) +
    
    # Markup
    scale_y_continuous(breaks = seq(-2,7,1), limits = c(-3,7)) +
    geom_hline(yintercept = 1, linetype='solid') +
    geom_hline(yintercept = 4.5, linetype='dashed') +    
    ylab("Normalized Flicker Threshold") +
    xlab("Adaptation level") +
    theme_bw()
  return(p)
}