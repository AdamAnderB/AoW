## ----GLMM: Main Model----
glmm1_1<-glmer(target~talker*verb_type+
            (talker|subject_img_file)+
            (verb_type|Participant.Private.ID)+
            (1|time_normalized),
          family="binomial",data=mem_data)
summary(glmm1_1)
