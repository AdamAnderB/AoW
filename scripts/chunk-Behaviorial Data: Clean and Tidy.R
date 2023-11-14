## ----Behaviorial Data: Clean and Tidy----
#participant and item removal (grouped) and individual trial removal
#combine data and filter out non experimental trials
behaviorial_data <- OSF_filt %>% 
  inner_join(experimental_tidy, by=c( "talker","verb_type","subject_img_file"))

#clean combined OSF and Response data
behaviorial_data$Participant.Private.ID<-as.factor(behaviorial_data$Participant.Private.ID)
behaviorial_data <-behaviorial_data %>%
  mutate(image_incorrect= if_else(img_1_file == response_button_image,0,1),
         text_incorrect = if_else(response_button_text == "Yes",0,1))
