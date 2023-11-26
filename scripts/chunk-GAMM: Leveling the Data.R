## ----GAMM: Leveling the Data----
gamm_data$Condition <- as.factor(gamm_data$Condition)
gamm_data$subject_img_coded <- as.numeric(factor(gamm_data$subject_img_file) ) -1
gamm_data$talker_coded <- as.numeric(factor(gamm_data$talker) ) -1 
# NativeMale = 0, NonNativeMale = 1
gamm_data$verb_type_coded <- as.numeric(factor(gamm_data$verb_type) ) -1
# Nonrestricting = 0, Restricting = 1
gamm_data$Participant.Private.ID <- as.factor(gamm_data$Participant.Private.ID)
gamm_data$Event <-as.factor(paste(gamm_data$Participant.Private.ID,gamm_data$Trial.Number,sep="."))
gamm_data$Event <- as.factor(gamm_data$Event)
gamm_data<-gamm_data%>%
  select(Event,Participant.Private.ID,Trial.Number,verb_type_coded,talker_coded,subject_img_coded,Condition,target,time_elapsed,log_SUBTLWF_Obj,experience_chinese_accent,Event)
