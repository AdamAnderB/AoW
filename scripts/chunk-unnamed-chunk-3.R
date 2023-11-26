## ----unnamed-chunk-3----
############## Poretta model #############################
# m1_trim <- bam(IA_1_ELogit ~ Condition + s(Time, by = Condition) + # main effect Condition (NR, NNR, NNR, NNNR); smooth for time by each factor of condition
#             s(Trial_c) + s(log_SUBTLWF_Obj) + # smooth for trial order; smooth for log frequency of target object 
#             s(Time, Subject, bs = "fs", m = 1) + # smooth random slope for each participant by Time  
#             s(Time, target_obj, bs = "fs", m = 1) + # smooth random slope for Target object and Time 
#             s(Event, bs = "re"),   # smooth random intercept for Event 
#           data = DatCor_400_0_800, weights = 1/IA_1_wts,  # weight
#           AR.start = StartEvent, method = "ML", rho = 0.740431,  # method of Maximum Likelihood to estimate lambda the smoothing parameter (the penalty), Baysian approach rather than predictive mode 
#          subset = abs(scale(resid(m1))) < 2.5)
# no k set -> no expectation for the maximum wiggliness of the functions 
########################################################
any(is.na(eyetracking_dat))
View(eyetracking_dat)

library(bam)
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
                  family="binomial", data=eyetracking_dat, discrete=TRUE, method="fREML")
summary(mod1)
library(sjPlot)
plot_model(mod1, type = "pred", terms = c("talker", "time_elapsed_rounded"))

plot_model(mod1, type = "std", title = "Model Plot")
plot_model(mod1, type = "int", terms = c("talker", "verb_type"))
plot_model(mod1, type = "pr")

mod1


#without interaction
exp_gam_mod1 <- bam(target ~ experience_chinese_accent + 
              s(time_elapsed, by=talker_coded) + 
              verb_type_coded + 
              s(time_elapsed, by=verb_type_coded) +
              talker_coded:verb_type_coded + 
              s(time_elapsed, by=Condition)+
              s(log_SUBTLWF_Obj)+
              s(time_elapsed, Participant.Private.ID, bs="fs", m=1)+
              s(time_elapsed, subject_img_coded, bs="fs", m=1)+
              s(Event, bs="re"), 
                  family="binomial", data=eyetracking_dat, discrete=TRUE, method="fREML")
summary(exp_gam_mod1)

#with interaction
exp_gam_mod2 <- bam(target ~ experience
                  + te(time_elapsed, experience, by=verb_type_coded)
                  + s(time_elapsed, by=Condition) +
                  + s(Trial.Number) + s(log_SUBTLWF_Obj) +
                  + s(time_elapsed, Participant.Private.ID, bs="fs", m=1)
                  + s(time_elapsed, target_obj, bs="fs", m=1)
                  + s(event, bs = "re")
            ,data=gamm_data_accented,family="binomial",discrete=TRUE)
summary(mod4)
