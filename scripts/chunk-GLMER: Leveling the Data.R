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
mem_data <- mem_data %>%
  mutate(experience_chinese_normalized = 
           (experience_chinese - min(experience_chinese)) / 
           (max(experience_chinese) - min(experience_chinese)))
mem_data <- mem_data %>%
  mutate(time_normalized = 
           (time_elapsed - min(time_elapsed)) / 
           (max(time_elapsed) - min(time_elapsed)))
