## ----Questionnaire: Tidy----
tidy_quest_data<-cleaned_quest_data%>%
  pivot_wider(names_from = Screen.Name, values_from = Response,values_fn = list)%>%
  rowwise()%>%
  mutate(across(c(accent_heard,other_languages_spoken), toString),
         across(where(is.character), tolower),
         across(c(chinese_study_duration,age,experience_chinese_accent), as.numeric),
         across(c(Participant.Private.ID), as.factor),
         speaks_L2 = if_else(other_languages_spoken == "english"|
                                         other_languages_spoken == "none"|
                                         other_languages_spoken == ""|
                                         other_languages_spoken == " ",0,1))
