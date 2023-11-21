## ----Questionnaire: Tidy----
tidy_quest_data<-cleaned_quest_data%>% 
  group_by(Participant.Private.ID,Screen.Name)%>%
  summarise_all(toString)%>%
  pivot_wider(names_from=Screen.Name,values_from=Response)%>%
  mutate(speaks_L2 =if_else(str_detect(other_languages_spoken,"German") &
                     !is.na(other_languages_spoken),1,0),
         across(c(chinese_study_duration,age,experience_chinese_accent),
                as.numeric),
         Participant.Private.ID = as.factor(Participant.Private.ID))%>%
  select(!other_languages_spoken)
