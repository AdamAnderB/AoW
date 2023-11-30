## ----GAMM: Main Model Comparison----
#mod1 <- bam(target ~ talker_coded + 
#              s(time_elapsed, by=talker_coded) + 
#              verb_type_coded + 
#              s(time_elapsed, by=verb_type_coded) +
#              talker_coded:verb_type_coded + 
#              s(time_elapsed, by=Condition)+
#              s(log_SUBTLWF_Obj)+
#              s(time_elapsed, Participant.Private.ID, bs="fs", m=1)+
#              s(time_elapsed, subject_img_coded, bs="fs", m=1)+
#              s(Event, bs="re"), 
#              family="binomial", data=gamm_data, discrete=TRUE, method="fREML")
# Reduced model 1: Remove random effects
#mod_reduced1 <- bam(target ~ talker_coded + 
#                    s(time_elapsed, by=talker_coded) + 
#                    verb_type_coded + 
#                    s(time_elapsed, by=verb_type_coded) +
#                    talker_coded:verb_type_coded + 
#                    s(time_elapsed, by=Condition)+
#                    s(log_SUBTLWF_Obj)+
#                    s(time_elapsed, Participant.Private.ID, bs="fs", m=1)+
#                    s(time_elapsed, subject_img_coded, bs="fs", m=1), 
#                    family="binomial", data=gamm_data, discrete=TRUE, method="fREML")
# Reduced model 2: Remove some fixed effects and interactions
#mod_reduced2 <- bam(target ~ talker_coded + 
#                    s(time_elapsed, by=talker_coded) + 
#                    verb_type_coded + 
#                    s(time_elapsed, by=verb_type_coded) +
#                    talker_coded:verb_type_coded + 
#                    s(time_elapsed, by=Condition)+
#                    s(log_SUBTLWF_Obj), 
#                    family="binomial", data=gamm_data, discrete=TRUE, method="fREML")
#summary(mod1)
#summary(mod_reduced1)
#summary(mod_reduced2)
# ANOVA for model comparison
#anova(mod_reduced1, mod1)
#anova(mod_reduced2, mod_reduced1)
