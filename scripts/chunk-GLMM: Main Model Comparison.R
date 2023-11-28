## ----GLMM: Main Model Comparison----
#glmm1_1<-glmer(target~talker*verb_type+
#            (talker|subject_img_file)+
#            (verb_type|Participant.Private.ID)+
#            (1|time_normalized),
#          family="binomial",data=mem_data)
##remove correlations
#glmm1_2<-glmer(target~talker*verb_type+
#            (talker||subject_img_file)+
#            (verb_type||Participant.Private.ID)+
#            (1|time_normalized),
#          family="binomial",data=mem_data)
##remove timing random effect
#glmm1_3<-glmer(target~talker*verb_type+
#            (talker||subject_img_file)+
#            (verb_type||Participant.Private.ID),
#          family="binomial",data=mem_data)
#
#anova(glmm1_2,glmm1_1)
#anova(glmm1_3,glmm1_2)
#m2 is a more parsimonious and preferable model compared to m1_1 or m1_3 because of lower AIC and BIC
#as well as the anova coming up significant in comparison to simpler model m1_3.
#summary(glmm1_1)
#summary(glmm1_2)
#summary(glmm1_3)
#anova(glmm1_2,glmm1_1)
#anova(glmm1_3,glmm1_2)
