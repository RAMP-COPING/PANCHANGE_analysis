# Function to create forest plots with different grouping sets using formatted data
# KLPurves

lm.forest <- function(data,title,pointsize=10,linesize=3,errorsize=3,
                      axistext=60,axistitle=80,legtitle=70,stripsize=50,
                      colourpal=COPINGpalette5,lowlim=-3,uplim=4,dodge=0.5)
  
  {

  p = ggplot(data=data,
             aes(x =RowLabels,y = Estimate,
                 colour = Group)) +
    
    geom_point(size = pointsize,
               position = position_dodge(dodge)) +
    
    geom_hline(yintercept =0,
               linetype=2,
               size = linesize)  +
    
    xlab('Group') +
    ylab("\nEstimate (95% Confidence Interval)")  +
    ggtitle(title) +
    
    geom_errorbar(aes(ymin = LowerBound,
                      ymax = UpperBound),
                  width = 1,
                  position = position_dodge(dodge),
                  size = errorsize)  +
    
    #facet_wrap(. ~ Categories,
    #           strip.position="left",nrow=6, scales="free_y") +
    
    facet_grid(. ~ Categories,  drop = TRUE) +
    
    scale_colour_manual(values=colourpal) +
    scale_y_continuous(limits=c(lowlim,uplim)) +
    
    theme(plot.title=element_blank(), #element_text(size=0,face="bold"),
          axis.text=element_text(face="bold",size=axistext,),
          legend.text=element_text(size=axistext,),
          legend.title=element_text(face="bold",size=legtitle,),
          legend.position = "none",
          axis.title.x=element_blank(), #element_text(size=axistitle,face="bold"),
          axis.title.y=element_blank(),
          strip.text.y = element_text(angle=180,face="bold",size=stripsize),
          panel.background = element_blank(),
          strip.background = element_rect(fill = "light grey"),
          panel.border = element_rect(colour = "grey",fill = NA)) +
    # guides(color = guide_legend(reverse = TRUE)) +
    coord_flip()
  return(p)
  
}





