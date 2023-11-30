## ----GAMM: Accent Model----
mod2 <- bam(target ~ experience_chinese + 
              s(time_elapsed, by=verb_type_coded) +
              s(log_SUBTLWF_Obj)+
              s(time_elapsed, Participant.Private.ID, bs="fs", m=1)+
              s(time_elapsed, subject_img_coded, bs="fs", m=1)+
              s(Event, bs="re"), 
    family="binomial", data=gamm_data_accented, discrete=TRUE, method="fREML")
summary(mod2)
