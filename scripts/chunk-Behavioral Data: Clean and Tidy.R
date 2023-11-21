## ----Behavioral Data: Clean and Tidy----
behavioral_data <-behavioral_data %>%
  mutate(participant = as.factor(Participant.Private.ID),
         image_incorrect= if_else(img_1_file == response_button_image,0,1),
         text_incorrect = if_else(response_button_text == "Yes",0,1))
