## ----GAMM: Accent Model comparison----
#mod2 <- bam(target ~ experience_chinese + 
#              s(time_elapsed, by=verb_type_coded) +
#              s(log_SUBTLWF_Obj)+
#              s(time_elapsed, Participant.Private.ID, bs="fs", m=1)+
#              s(time_elapsed, subject_img_coded, bs="fs", m=1)+
#              s(Event, bs="re"), 
#                  family="binomial", data=gamm_data_accented, discrete=TRUE, method="fREML")
#mod2_reduced1 <- bam(target ~ experience_chinese + 
#              s(time_elapsed, by=verb_type_coded) +
#              s(log_SUBTLWF_Obj)+
#              s(time_elapsed, Participant.Private.ID, bs="fs", m=1)+
#              s(time_elapsed, subject_img_coded, bs="fs", m=1),
#                  family="binomial", data=gamm_data_accented, discrete=TRUE, method="fREML")
#mod2_reduced2 <- bam(target ~ experience_chinese + 
#              s(time_elapsed, by=verb_type_coded) +
#              s(log_SUBTLWF_Obj),
#                  family="binomial", data=gamm_data_accented, discrete=TRUE, method="fREML")
#summary(mod2)
#summary(mod2_reduced1)
#summary(mod2_reduced2)
# ANOVA for model comparison
#anova(mod2_reduced1, mod2)
#anova(mod2_reduced2, mod2_reduced1)
