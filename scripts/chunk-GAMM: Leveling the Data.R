## ----GAMM: Leveling the Data----
# turn categorical variables into factors with numeric values 
gamm_data$subject_img_coded <- as.numeric(factor(gamm_data$subject_img_file)) -1
gamm_data$talker_coded <- as.numeric( factor(gamm_data$talker) ) -1 
gamm_data$verb_type_coded <- as.numeric( factor(gamm_data$verb_type) ) -1
gamm_data$Condition <- factor(gamm_data$Condition) 
gamm_data$event <- as.factor(paste(gamm_data$Trial.Number,gamm_data$talker_coded,sep="."))
gamm_data$Participant.Private.ID <- as.numeric( factor(gamm_data$Participant.Private.ID) ) -1
gamm_data$target_obj <- factor(gamm_data$target_obj) 
