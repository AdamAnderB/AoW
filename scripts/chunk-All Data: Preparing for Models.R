## ----All Data: Preparing for Models----
participant_chinese_experience<-tidy_quest_data%>%
  select(Participant.Private.ID,experience_chinese_accent)

mem_data<-all_data_tidy%>%
  select(Participant.Private.ID,verb_type,talker,
         subject_img_file,target,Trial.Number,log_SUBTLWF_Obj,target_obj,time_elapsed)%>%
  mutate(Participant.Private.ID=as.factor(Participant.Private.ID))%>%
  left_join(participant_chinese_experience)
gamm_data<-mem_data%>%
  mutate(Condition = paste(talker,verb_type,sep="."))
