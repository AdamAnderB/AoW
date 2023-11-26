## ----unnamed-chunk-2----
eyetracking_dat<-gamm_data
eyetracking_dat <- transform(eyetracking_dat, 
                             Condition = ifelse(talker=="NativeMale" & verb_type == "NonRestricting",
                                                                 "Native.NonRestricting",
                                                ifelse(talker=="NativeMale" & verb_type == "Restricting",
                                                                       "Native.Restricting",
                                                       ifelse(talker=="NonNativeMale" & verb_type ==
                                                                "NonRestricting","NonNative.NonRestricting", "NonNative.Restricting"))))
eyetracking_dat$Condition <- as.factor(eyetracking_dat$Condition)




# UNUSED: turn categorical variables into factors with numeric values 
eyetracking_dat$subject_img_coded <- as.numeric( factor(eyetracking_dat$subject_img_file) ) -1
# levels(factor(eyetracking_dat$subject_img_file)) starts from 0
eyetracking_dat$talker_coded <- as.numeric( factor(eyetracking_dat$talker) ) -1 
# NativeMale = 0, NonNativeMale = 1
eyetracking_dat$verb_type_coded <- as.numeric( factor(eyetracking_dat$verb_type) ) -1
# Nonrestricting = 0, Restricting = 1
eyetracking_dat$Participant.Private.ID <- as.factor(eyetracking_dat$Participant.Private.ID)

# Event is a factor in Poretta et al.'s model 
eyetracking_dat$Event <-as.factor(paste(eyetracking_dat$Participant.Private.ID,eyetracking_dat$Trial.Number,sep="."))
eyetracking_dat$Event <- as.factor(eyetracking_dat$Event)
eyetracking_dat$experience_chinese_accent
eyetracking_dat<-eyetracking_dat%>%
  select(Event,Participant.Private.ID,Trial.Number,verb_type_coded,talker_coded,subject_img_coded,Condition,target,time_elapsed,log_SUBTLWF_Obj,experience_chinese_accent,Event)
# orthogonal contrast coding: does not change significnat of model coefficients
# contrasts(eyetracking_dat$Condition) <- matrix(c(-0.25, 0.75, -0.25, -0.25,
#                                                  -0.25, -0.25, 0.75, -0.25,
#                                                  -0.25, -0.25, -0.25, 0.75), ncol=3)
#contrasts(eyetracking_dat$Condition)
