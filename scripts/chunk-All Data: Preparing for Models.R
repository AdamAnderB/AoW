## ----All Data: Preparing for Models----
mem_data<-all_data_tidy%>%
  select(Participant.Private.ID,verb_type,talker,
         subject_img_file,target,Trial.Number,log_SUBTLWF_Obj,target_obj,time_elapsed)%>%
  mutate(Participant.Private.ID=as.factor(Participant.Private.ID))%>%
  left_join(tidy_quest_data)

gamm_data<-mem_data%>%
  mutate(Condition = paste(talker,verb_type,sep="."))
