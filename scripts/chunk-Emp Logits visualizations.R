## ----Emp Logits visualizations----
viz<-ggplot(all_data_tidy_viz, 
                  aes(x=time_elapsed_rounded, y=emp_logit, 
                      linetype = verb_type, color= talker))
point_viz<-viz+geom_line()
line_viz<-viz+geom_smooth(method = "lm")
smooth_viz<-viz+geom_smooth()

point_viz+scale_x_continuous(limits = c(-400,800),breaks=seq(-400,800, 400))+
  scale_linetype_discrete(labels=c('Non-Restricting','Restricting'))+
  scale_color_manual(values=c("#007BC0", "#FDB515"),labels=c('Native','Non-Native'))+
  ylab("Average empirical logit looks to object")+
  xlab("Time (ms)")+
  theme(legend.position = c(.2, .7))+
  theme_minimal()+
  labs(title = "Online Replication (upper) vs. in person data (lower):",
              subtitle = "Lower visual is from Poretta et al's (2020)")+
  labs(color='Talker',
       linetype="Verb Type")+
  theme(legend.position = c(.2,.7),
        panel.grid.minor.x = element_blank(),
        panel.grid.minor.y = element_blank(),
        legend.key=element_blank())+
  guides(color = guide_legend(override.aes = list(fill = NA)),
         linetype = guide_legend(override.aes = list(fill = NA)))

line_viz+scale_x_continuous(limits = c(-400,800),breaks=seq(-400,800, 400))+
  scale_linetype_discrete(labels=c('Non-Restricting','Restricting'))+
  scale_color_manual(values=c("#007BC0", "#FDB515"),labels=c('Native','Non-Native'))+
  scale_fill_manual(values=c("#007BC0", "#FDB515"),labels=c('Native','Non-Native'))+
  ylab("Average empirical logit looks to object")+
  xlab("Time (ms)")+
  theme(legend.position = c(.2, .7))+
  theme_minimal()+
  labs(title = "Online Replication (upper) vs. in person data (lower):",
              subtitle = "Lower visual is from Poretta et al's (2020)")+
  labs(color='Talker',
       linetype="Verb Type")+
  theme(legend.position = c(.2,.7),
        panel.grid.minor.x = element_blank(),
        panel.grid.minor.y = element_blank(),
        legend.key=element_blank())+
  guides(color = guide_legend(override.aes = list(fill = NA)),
         linetype = guide_legend(override.aes = list(fill = NA)))

smooth_viz+scale_x_continuous(limits = c(-400,800),breaks=seq(-400,800, 400))+
  scale_linetype_discrete(labels=c('Non-Restricting','Restricting'))+
  scale_color_manual(values=c("#007BC0", "#FDB515"),labels=c('Native','Non-Native'))+
  scale_fill_manual(values=c("#007BC0", "#FDB515"),labels=c('Native','Non-Native'))+
  ylab("Average empirical logit looks to object")+
  xlab("Time (ms)")+
  theme(legend.position = c(.2, .7))+
  theme_minimal()+
  labs(title = "Online Replication (upper) vs. in person data (lower):",
              subtitle = "Lower visual is from Poretta et al's (2020)")+
  labs(color='Talker',
       linetype="Verb Type")+
  theme(legend.position = c(.2,.7),
        panel.grid.minor.x = element_blank(),
        panel.grid.minor.y = element_blank(),
        legend.key=element_blank())+
  guides(color = guide_legend(override.aes = list(fill = NA)),
         linetype = guide_legend(override.aes = list(fill = NA)))
ggsave(file.path(viz_path,"smooth_plot.pdf"), width = 8, height = 4)
