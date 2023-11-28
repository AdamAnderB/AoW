## ----GAMM: Main Model----
mod1 <- bam(target ~ talker_coded + 
              s(time_elapsed, by=talker_coded) + 
              verb_type_coded + 
              s(time_elapsed, by=verb_type_coded) +
              talker_coded:verb_type_coded + 
              s(time_elapsed, by=Condition)+
              s(log_SUBTLWF_Obj)+
              s(time_elapsed, Participant.Private.ID, bs="fs", m=1)+
              s(time_elapsed, subject_img_coded, bs="fs", m=1)+
              s(Event, bs="re"), 
                  family="binomial", data=gamm_data, discrete=TRUE, method="fREML")
summary(mod1)
