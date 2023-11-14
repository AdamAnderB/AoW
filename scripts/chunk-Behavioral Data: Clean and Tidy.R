## ----Behavioral Data: Clean and Tidy----
#clean combined OSF and Response data
behavioral_data$Participant.Private.ID<-
  as.factor(behavioral_data$Participant.Private.ID)
behavioral_data <-behavioral_data %>%
  mutate(image_incorrect= if_else(img_1_file == response_button_image,0,1),
         text_incorrect = if_else(response_button_text == "Yes",0,1))
