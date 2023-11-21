## ----unnamed-chunk-1----
time_start = -500
time_end = 900
time_bin_size<-400
actual_distance=.3
actual_screen=.5

viz<-all_data%>%
  mutate(time_elapsed=time_elapsed-object_start-200)%>%
  mutate(time_elapsed_rounded=time_bin_size*round((time_elapsed)/time_bin_size))%>%
  filter(time_elapsed_rounded>time_start &time_elapsed_rounded<time_end)%>%
  mutate(object_viewing = if_else(target == 1,"Target",
                                  if_else(comp_1 == 1,"Competitors",
                                          if_else(comp_2 == 1,"Competitors",
                                                  if_else(dist == 1,"Competitors","")))))
viz<-viz%>%
  mutate(time_elapsed_round_coded = 
           case_when(as.character(time_elapsed_rounded) == "-400"~"-400 \nSentence Onset",
                     as.character(time_elapsed_rounded) == "0"~"0 \nVerb Onset",
                     as.character(time_elapsed_rounded) == "400"~ "400 \nObject Onset",
                     as.character(time_elapsed_rounded) == "800"~"800 \nSelection of Visual Stimuli"))
viz%>%
  ggplot(aes(x=x_pred_normalised,y=y_pred_normalised,color = as.factor(object_viewing)))+
  stat_density_2d(geom = "raster",
  aes(fill = after_stat(density)),
  contour = FALSE)+
  #geom_point(alpha=.1,size=3)+
  #scale_fill_viridis_c(option="inferno")+
  scale_fill_gradient(low = "white", high = "#C41230")+
  annotate("rect", 
           xmin = center-actual_screen, xmax = center+actual_screen, 
           ymin = center-actual_screen, ymax = center+actual_screen
           ,alpha = 0, color= "white")+
  annotate("rect", 
           xmin = center-actual_screen, xmax = center-actual_distance, 
           ymin = center+actual_distance, ymax = center+actual_screen,
             alpha = 0, color= "white")+
  annotate("rect", 
           xmin = center+actual_distance, xmax = center+actual_screen, 
           ymin = center-actual_screen, ymax = center-actual_distance,
             alpha = 0, color= "white")+
  annotate("rect", 
           xmin = center-actual_screen, xmax = center-actual_distance, 
           ymin = center-actual_screen, ymax = center-actual_distance,
             alpha = 0, color= "white")+
  annotate("rect", 
           xmin = center+actual_screen, xmax = center+actual_distance, 
           ymin = center+actual_distance, ymax = center+actual_screen,
             alpha = 0, color= "white")+
  facet_grid(as.factor(object_viewing)~time_elapsed_round_coded)+
  theme_minimal()+
  theme(legend.position="none")+
  ylab("Screen height - Y axis")+
  xlab("Screen width - X axis")+
  scale_y_continuous(breaks =c(0,.5,1))+
  scale_x_continuous(breaks =c(0,.5,1))+
  theme(panel.spacing = unit(0, "cm"),
        axis.ticks.x=element_blank(),
        axis.ticks.y=element_blank(),
        panel.grid.minor = element_blank(),
        panel.grid.major = element_blank(),
        axis.text.x = element_text(face="bold", color="#C41230", 
                           size=14, angle=0),
        axis.text.y = element_text(face="bold", color="#C41230", 
                           size=14, angle=0))
ggsave(file.path(viz_path,"signal_noise.pdf"), width = 8, height = 4)
