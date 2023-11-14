## ----questionaire----
###participant removal by questionnaire
cleaned_quest_data<-task_data%>%
  filter(display=="questionairre",na.omit=TRUE)%>%
  select(Participant.Private.ID,Screen.Name,Response,Reaction.Time)%>%
  filter(Response != "",Reaction.Time!=0)%>%
  select(!Reaction.Time)

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
         
#visualize numeric variables
tidy_quest_data%>%
  keep(is.numeric) %>% 
  gather() %>% 
  ggplot(aes(value)) +
    facet_wrap(~ key, scales = "free") +
    geom_histogram()

#filtered data
filtered_quest_data<-tidy_quest_data%>%
  filter(age<=40 & age>=18 &   #1 removed due to being outside of age range (part:7492145)
         chinese_study_duration==0 & #none removed 
         speaks_L2==0,#2 participants removed that speak other languages
         language_disorder == "No") #none removed

#sanity check
#length(unique(task_data$Participant.Private.ID))
#length(unique(filtered_quest_data$Participant.Private.ID))
