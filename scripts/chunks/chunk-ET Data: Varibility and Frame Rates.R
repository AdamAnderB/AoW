## ----ET Data: Varibility and Frame Rates----
filter_median_hz_min<-0
filter_median_hz_max<-1000

participant_frame_rate<-all_data%>%
  group_by(Participant.Private.ID,subject_img_file,verb_type,talker)%>%
  summarize(count = n(),
            max_time = max(time_elapsed),
            frame_rate = count/max_time*1000)%>%
  ungroup()%>%
  group_by(Participant.Private.ID)%>%
  mutate(median_frame_rate = median(frame_rate),
         frame_rate_cats = case_when(median_frame_rate>=30~"high",
                                     median_frame_rate<30&median_frame_rate>=5~"medium",
                                     median_frame_rate<5~"low"),
         frame_rate_cats=as.factor(frame_rate_cats))%>%
  ungroup()%>%
  group_by(Participant.Private.ID)%>%
  filter(median_frame_rate>filter_median_hz_min & median_frame_rate<filter_median_hz_max)
overall_mean_rate<- mean(participant_frame_rate$frame_rate)
sd(participant_frame_rate$frame_rate)
library(ggExtra)
plotter<-participant_frame_rate%>%
  ggplot(aes(y=frame_rate,
                   x=fct_reorder(as.factor(Participant.Private.ID), median_frame_rate),
                   group=as.factor(Participant.Private.ID),color =frame_rate_cats))+
  geom_jitter(alpha=.3)+
  geom_violin()+
  geom_boxplot(alpha=.2)+
  geom_point(aes(y=median_frame_rate),color ="white")+
  geom_hline(yintercept = overall_mean_rate,linetype=3)+
  theme_minimal()+
  scale_color_manual(values = c("#009647","#FDB515","#EF3A47"))+
  theme(axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        panel.grid.major.x = element_blank(),
        legend.position = c(.1,.75),
        legend.direction="vertical",
        legend.title = element_blank())+
  xlab("Participants Ordered by Median Frame Rate")+
  ylab("Frame Rate (Hz)")

ggMarginal(plotter, groupColour = TRUE, groupFill = TRUE)
#ggsave(file.path(viz_path,"Participant_frame_rates.pdf"), width = 8, height = 4)
#frame rates across time
time_binning=400

binned_data<-all_data%>%
  mutate(time_elapsed=time_elapsed-object_start-200)%>% 
  mutate(time_elapsed_rounded=time_binning*round((time_elapsed)/time_binning))%>%
  filter(time_elapsed<2400&time_elapsed>-2400)

frame_rate_cats<-participant_frame_rate%>%
  select(frame_rate_cats,Participant.Private.ID,subject_img_file)%>%
  distinct(Participant.Private.ID,frame_rate_cats)

#across participants by item
agg_data_item <- binned_data%>% 
  group_by(time_elapsed_rounded,subject_img_file) %>%
  summarise(target_n=n()) 

#participant items by participants
agg_data_part <- binned_data%>% 
  group_by(time_elapsed_rounded,Participant.Private.ID)%>%
  summarise(target_n=n())%>%
  full_join(frame_rate_cats)

ggplot()+
  geom_vline(xintercept = -400,color="#007BC0")+
  geom_vline(xintercept = 800,color ="#007BC0")+
  geom_jitter(data=agg_data_part,aes(x=time_elapsed_rounded,
                                     y=target_n,
                                     color = frame_rate_cats),alpha=.2)+
  geom_boxplot(data=agg_data_part,aes(x=time_elapsed_rounded,
                                      y=target_n,
                                      alpha=.1,
                                      group =interaction(time_elapsed_rounded,frame_rate_cats),
                                      color=frame_rate_cats,
                                      fill=frame_rate_cats),
               alpha=.4)+
  geom_jitter(data=agg_data_item,aes(x=time_elapsed_rounded,
                                     y=target_n),
              alpha=.02,
              color = "grey")+
  geom_violin(data=agg_data_item,aes(x=time_elapsed_rounded,
                                     y=target_n,
                                     alpha=.1,
                                     group=time_elapsed_rounded),
              color = "grey",
              fill= "grey",alpha=.1)+
  scale_fill_manual(values = c("#009647","#FDB515","#EF3A47"))+
  scale_color_manual(values = c("#009647","#FDB515","#EF3A47"))+
  scale_x_continuous(limits = c(-2200,2400),breaks=seq(-2400,2400, 400))+
  theme_minimal()+
  theme(axis.ticks.x=element_blank(),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.y = element_blank(),
        legend.position = c(.8,.75),
        legend.direction="vertical",
        legend.title = element_blank())+
  xlab("Adjusted Time")+
  ylab("Total Looks Captured")
#ggsave(file.path(viz_path,"frame_rates_over_trial.pdf"), width = 8, height = 4)
