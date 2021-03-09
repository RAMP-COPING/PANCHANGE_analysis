# Function to create forest plots with different grouping sets using formatted data
# KLPurves


lm.forest <- function(data,title){
  
  p = ggplot(data=data,
             aes(x =RowLabels,y = Estimate,
                 colour = Group)) +
    
    geom_point(size = 10,
               position = position_dodge(0.9)) +
    
    geom_hline(aes(fill=Group),
               yintercept =0, 
               linetype=2,
               size = 3)  +
    
    xlab('Group') + 
    ylab("\nEstimate (95% Confidence Interval)")  +
    ggtitle(title) +
    
    geom_errorbar(aes(ymin = LowerBound,
                      ymax = UpperBound),
                  width = 1,
                  position = position_dodge(0.9),
                  size = 3)  + 
    
    facet_wrap(. ~ Categories,
               strip.position="left",nrow=6, scales="free_y") +
    
    scale_colour_manual(values=COPINGpalette5) +
    
    theme(plot.title=element_text(size=0,face="bold"),
          axis.text=element_text(face="bold",size=60,),
          legend.text=element_text(size=60,),
          legend.title=element_text(face="bold",size=70,),
          axis.title.x=element_text(size=80,face="bold"),
          axis.title.y=element_blank(),
          strip.text.y = element_text(angle=180,face="bold",size=50),
          panel.background = element_blank(),
          strip.background = element_rect(fill = "light grey"),
          panel.border = element_rect(colour = "grey",fill = NA)) +
    
    guides(color = guide_legend(reverse = TRUE)) +
    
    coord_flip()
  return(p)
  
}