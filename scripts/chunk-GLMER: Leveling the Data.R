## ----GLMER: Leveling the Data----
mem_data$verb_type<-as.factor(mem_data$verb_type)
mem_data$talker<-as.factor(mem_data$talker)
contrasts(mem_data$verb_type)<-c(-.5,.5)
contrasts(mem_data$talker)<-c(-.5,.5)
colnames(contrasts(mem_data$talker))<- c('Native:')
rownames(contrasts(mem_data$talker))<-c("Native","NonNative")
colnames(contrasts(mem_data$verb_type))<- c('Restricting:')
rownames(contrasts(mem_data$verb_type))<-c("Non-Restricting","Restricting")
mem_data$experience_chinese<-mem_data$experience_chinese
mem_data$experience_chinese <- 
  (mem_data$experience_chinese - min(mem_data$experience_chinese)) / 
  (max(mem_data$experience_chinese) - min(mem_data$experience_chinese))
mem_data$time_normalized <- 
  (mem_data$time_elapsed - min(mem_data$time_elapsed)) / 
  (max(mem_data$time_elapsed) - min(mem_data$time_elapsed))
