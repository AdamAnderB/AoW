## ----GLMM: Accent Model----
glmm2_3<-glmer(target~verb_type*experience_chinese+
            (1|subject_img_file)+
            (1|Participant.Private.ID),
          family="binomial",data=accent_mem_data)
summary(glmm2_3)
