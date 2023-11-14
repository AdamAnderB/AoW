## ----ET Data: Time and Empirical Logits----
all_data<-all_data%>%
  mutate(time_elapsed=time_elapsed-object_start.y-200)%>%
  mutate(time_elapsed_rounded=50*round((time_elapsed)/50))

agg_data <- all_data %>% 
  group_by(time_elapsed_rounded,verb_type, talker)%>%
  summarise(target_looks = mean(target), 
            comp_1_looks = mean(comp_1),
            comp_2_looks = mean(comp_2),
            dist_looks = mean(dist),
            target_n=n()) 

agg_data<-agg_data%>%
  filter(time_elapsed_rounded>-400 & time_elapsed_rounded<800)

target_data<-agg_data%>%
  mutate(emp_logit =log((target_looks+(0.5/target_n))/
                          (1-(target_looks+(0.5/target_n)))))
