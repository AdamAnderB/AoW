## ----GLMM: Accent Model Comparison----
#glmm2_1<-glmer(target~verb_type*experience_chinese+
#            (1|subject_img_file)+
#            (subject_img_file|Participant.Private.ID),
#          family="binomial",data=accent_mem_data)
##remove correlations
#glmm2_2<-glmer(target~verb_type*experience_chinese+
#            (1|subject_img_file)+
#            (subject_img_file||Participant.Private.ID),
#          family="binomial",data=accent_mem_data)
##remove random effect
#glmm2_3<-glmer(target~verb_type*experience_chinese+
#            (1|subject_img_file)+
#            (1|Participant.Private.ID),
#          family="binomial",data=accent_mem_data)
#summary(glmm2_1)
#summary(glmm2_2)
#summary(glmm2_3)
#anova(glmm2_2,glmm2_1)
#anova(glmm2_3,glmm2_2)
