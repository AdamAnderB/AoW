## ----GLMM: Accent Model----
glmm2_1<-glmer(target~experience_chinese+
            (1|subject_img_file)+
            (verb_type|Participant.Private.ID)+
            (1|time_normalized),family="binomial",data=accent_mem_data)
summary(glmm2_1)
