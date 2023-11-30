## ----experience calculations----
experience <- accent_mem_data %>%
  select(Participant.Private.ID, experience_chinese_accent) %>%
  unique() %>%
  mutate(experience = experience_chinese_accent*.3)%>%
  mutate(experience_1_corr= if_else(experience == 0, 1,experience))%>%
  mutate(log_experience = log(experience_1_corr))

#actual accent experience
mean(experience$experience_chinese_accent)
sd(experience$experience_chinese_accent)
#log chinese accent experience
mean(experience$log_experience)
sd(experience$log_experience)
