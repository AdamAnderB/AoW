## ----GLMER: Models----
m1_1<-glmer(target~talker*verb_type+
            (talker|subject_img_file)+
            (verb_type|Participant.Private.ID)+
            (1|time_normalized),
          family="binomial",data=mem_data)
#remove correlations
m1_2<-glmer(target~talker*verb_type+
            (talker||subject_img_file)+
            (verb_type||Participant.Private.ID)+
            (1|time_normalized),
          family="binomial",data=mem_data)
#remove timing random effect
m1_3<-glmer(target~talker*verb_type+
            (talker||subject_img_file)+
            (verb_type||Participant.Private.ID),
          family="binomial",data=mem_data)

anova(m1_2,m1_1)
anova(m1_3,m1_2)
#m2 is a more parsimonious and preferable model compared to m1_1 or m1_3 because of lower AIC and BIC
#as well as the anova coming up significant in comparison to simpler model m1_3.

#accent models
accent_mem_data<-mem_data%>%filter(talker == "NonNativeMale")
m2<-glmer(target~verb_type*experience_chinese+
            (1|subject_img_file)+
            (verb_type|Participant.Private.ID)+
            (1|time_normalized),
          family="binomial",data=accent_mem_data)
summary(m2)
