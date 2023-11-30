## ----Behavioral Data: Removing with IN Operator----
behavioral_data<-behavioral_data%>%
  filter(Participant.Private.ID %in% participant_agg$Participant.Private.ID &
           center_image %in% item_agg$center_image)%>%
  select(-c(text_incorrect,image_incorrect,response_button_text))
