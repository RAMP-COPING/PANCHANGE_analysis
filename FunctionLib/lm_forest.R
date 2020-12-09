# Function to create forest plots with different grouping sets using formatted data
# KLPurves


lm.forest <- function(data,title){
  
  p = ggplot(data=data,
             aes(x =RowLabels,y = Estimate,
                 colour = Group)) +
    
    geom_point(size = 2,
               position = position_dodge(0.9)) +
    
    geom_hline(aes(fill=Group),
               yintercept =0, 
               linetype=2)  +
    
    xlab('Group') + 
    ylab("Estimate (95% Confidence Interval)")  +
    ggtitle(title) +
    
    geom_errorbar(aes(ymin = LowerBound,
                      ymax = UpperBound),
                  width = .5,
                  position = position_dodge(0.9))  + 
    
    facet_wrap(. ~ Categories,
               strip.position="left",nrow=5,scales = "free_y") +
    
    scale_colour_manual(values=COPINGpalette5) +
    
    theme(plot.title=element_text(size=40,face="bold"),
          axis.text.y=element_text(face="bold"),
          axis.text.x=element_text(face="bold"),
          axis.title.x=element_text(size=28,face="bold"),
          axis.title.y=element_blank(),
          strip.text.y = element_text(angle=180,face="bold",size=30),
          panel.background = element_blank(),
          strip.background = element_rect(fill = "light grey"),
          panel.border = element_rect(colour = "grey",fill = NA)) +
    coord_flip()
  return(p)
  
}