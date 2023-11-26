## ----GLMER: Selected Model----
selected_model<-glmer(target~talker*verb_type+
            (talker||subject_img_file)+
            (verb_type||Participant.Private.ID)+
            (1|time_normalized),
          family="binomial",data=mem_data)
