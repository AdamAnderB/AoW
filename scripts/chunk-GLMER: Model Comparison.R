## ----GLMER: Model Comparison----
#time correction
# maximal model:(failed to converge)---
m2<-glmer(target~talker*verb_type+
            (talker|subject_img_file)+
            (verb_type|Participant.Private.ID),
          family="binomial",data=mem_data)
summary(m2)

# Near maximal mode:l (failed to converge)---
m3<-glmer(target~talker*verb_type+
            (talker||subject_img_file)+
            (verb_type||Participant.Private.ID),
          family="binomial",data=mem_data)
summary(m3)

#by item random effects removed first for first iteration
# parsimonious model (removing item random effects but keeps random slopes for verb type---singularity 
m4<-glmer(target~talker*verb_type+
            (1|subject_img_file)+
            (verb_type||Participant.Private.ID),
          family="binomial",data=mem_data)
summary(m4)

#by item and subject random effects removed for second iteration
# parsimonious model 2
m5<-glmer(target~talker*verb_type+
            (1|subject_img_file)+
            (1|Participant.Private.ID),
          family="binomial",data=mem_data)
summary(m5)
anova(m4,m5)
