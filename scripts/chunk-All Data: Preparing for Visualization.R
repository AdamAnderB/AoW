## ----All Data: Preparing for Visualization----
all_data_tidy_viz <- all_data_tidy%>% 
  group_by(time_elapsed_rounded,verb_type, talker,Participant.Private.ID)%>%
  summarise(target_looks = mean(target), 
            comp_1_looks = mean(comp_1),
            comp_2_looks = mean(comp_2),
            dist_looks = mean(dist),
            target_n=n())%>%
  mutate(emp_logit =log((target_looks+(0.5/target_n))/
                          (1-(target_looks+(0.5/target_n)))))
