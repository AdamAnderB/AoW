## ----GAMM: Leveling the Data----
gamm_data <- gamm_data %>%
  mutate(
    Condition = as.factor(Condition),
    subject_img_coded = as.numeric(factor(subject_img_file)) - 1,
    talker_coded = as.numeric(factor(talker)) - 1,
    verb_type_coded = as.numeric(factor(verb_type)) - 1,
    Participant.Private.ID = as.factor(Participant.Private.ID),
    Event = as.factor(paste(
      Participant.Private.ID, Trial.Number, sep = ".")),
    experience_chinese = experience_chinese_accent)%>%
  select(Event,Participant.Private.ID,Trial.Number,verb_type_coded,
         talker_coded,subject_img_coded,Condition,target,time_elapsed,
         log_SUBTLWF_Obj,experience_chinese,Event)
gamm_data_accented<-gamm_data%>%filter(talker_coded == 1)
