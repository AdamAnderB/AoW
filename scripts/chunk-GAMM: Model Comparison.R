## ----GAMM: Model Comparison----
#base model
mod1 <- bam(target ~ Condition
                  + s(time_elapsed, by=Condition) +
                  + s(Trial.Number) + s(log_SUBTLWF_Obj) +
                  + s(time_elapsed, Participant.Private.ID, bs="fs", m=1)
                  + s(time_elapsed, target_obj, bs="fs", m=1)
                  + s(event, bs = "re")
            ,data=gamm_data,family="binomial",discrete=TRUE)
summary(mod1)


#without interaction
mod3 <- bam(target ~ experience
                  + s(time_elapsed, by=Condition) +
                  + s(Trial.Number) + s(log_SUBTLWF_Obj) +
                  + s(time_elapsed, Participant.Private.ID, bs="fs", m=1)
                  + s(time_elapsed, target_obj, bs="fs", m=1)
                  + s(event, bs = "re")
            ,data=gamm_data_accented,family="binomial",discrete=TRUE)
summary(mod3)

#with interaction
mod4 <- bam(target ~ experience
                  + te(time_elapsed, experience, by=verb_type_coded)
                  + s(time_elapsed, by=Condition) +
                  + s(Trial.Number) + s(log_SUBTLWF_Obj) +
                  + s(time_elapsed, Participant.Private.ID, bs="fs", m=1)
                  + s(time_elapsed, target_obj, bs="fs", m=1)
                  + s(event, bs = "re")
            ,data=gamm_data_accented,family="binomial",discrete=TRUE)
summary(mod4)
