## ----GLMM: Accent Model Comparison----
#glmm2_1<-glmer(target~experience_chinese+
#            (1|subject_img_file)+
#            (verb_type|Participant.Private.ID)+
#            (1|time_normalized),
#          family="binomial",data=accent_mem_data)
##remove correlations
#glmm2_2<-glmer(target~experience_chinese+
#            (1|subject_img_file)+
#            (verb_type||Participant.Private.ID)+
#            (1|time_normalized),
#          family="binomial",data=accent_mem_data)
#remove timing random effect
#glmm2_3<-glmer(target~experience_chinese+
#            (1|subject_img_file)+
#            (verb_type||Participant.Private.ID),
#          family="binomial",data=accent_mem_data)
#summary(glmm2_1)
#summary(glmm2_2)
#summary(glmm2_3)
#anova(glmm2_2,glmm2_1)
#anova(glmm2_3,glmm2_2)
