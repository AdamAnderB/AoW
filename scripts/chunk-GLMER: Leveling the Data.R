## ----GLMER: Leveling the Data----
mem_data$verb_type<-as.factor(mem_data$verb_type)
mem_data$talker<-as.factor(mem_data$talker)
contrasts(mem_data$verb_type)
contrasts(mem_data$talker)
contrasts(mem_data$verb_type)<-c(-.5,.5)
contrasts(mem_data$talker)<-c(-.5,.5)
colnames(contrasts(mem_data$talker))<- c('native')
colnames(contrasts(mem_data$verb_type))<- c('nonrestricting')
