library(ggplot2)

plot_receptors <- function (receptors) {
  p <- ggplot(data = receptors) +
    aes(x = Wls) +
    geom_path(aes(y = S),color = "blue",size =2) +
    geom_path(aes(y = Mel), color = "turquoise3",size =2) +
    geom_path(aes(y = M), color = "green", size = 2) +
    geom_path(aes(y = L), color = "red", size =2) +
    
    # Labels
    ylab("Sensitivity (normalized)") +
    xlab("Wavelength (nm)") +
    scale_y_continuous(breaks = FALSE) +
    
    # theme
    theme_bw() +  
    theme(text = element_text(size=14),
          strip.background =element_rect(fill="#01256e"),
          strip.text = element_text(colour = 'white'),
          axis.title.y = element_text(margin = margin(r = .25, unit = "in")),
          panel.grid.minor = element_blank(),
          panel.grid.major = element_blank()
    )
  return(p)
}

plot_lowhigh <- function(SPDs) {
  p <- ggplot(data = SPDs) +
    aes(x = Wls) +
    geom_path(aes(y = Mel_high), size = 1, alpha = .66, color = "red") +
    geom_path(aes(y = Mel_low), size = 1, alpha = .66, color = "black") +
    #  geom_path(aes(y = LMS_low, color = "a"), size =2, alpha = 0) +
    
    # Labels
    ylab("Radiometric Power") +
    xlab("Wavelength (nm)") +
    scale_y_continuous(breaks = FALSE) +
    scale_color_discrete(guide = "none") +
    
    # theme
    theme_bw() +  
    theme(text = element_text(size=14),
          strip.background =element_rect(fill="#01256e"),
          strip.text = element_text(colour = 'white'),
          axis.title.y = element_text(margin = margin(r = .25, unit = "in")),
          panel.grid.minor = element_blank(),
          panel.grid.major = element_blank()
    )
  return(p)
}

plot_lowflicker <- function(SPDs) {
  p <- ggplot(data = SPDs) +
    aes(x = Wls) +
    geom_path(aes(y = Mel_low), size = 1, alpha = .66, color = 1) +
    geom_path(aes(y = Mel_low_neg), size = 1, alpha = .33, color = 1) + 
    geom_path(aes(y = Mel_low_pos), size = 1, alpha = 1, color = 1) + 
    
    # Labels
    ylab("Radiometric Power") +
    xlab("Wavelength (nm)") +
    scale_y_continuous(breaks = FALSE) +
    
    # theme
    theme_bw() +  
    theme(text = element_text(size=14),
          strip.background =element_rect(fill="#01256e"),
          strip.text = element_text(colour = 'white'),
          axis.title.y = element_text(margin = margin(r = .25, unit = "in")),
          panel.grid.minor = element_blank(),
          panel.grid.major = element_blank()
    ) 
  return(p)
}