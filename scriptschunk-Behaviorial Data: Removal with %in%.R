## ----Behaviorial Data: Removal with %in%----
#removal of remaining incorrect individual items
behaviorial_data<-behaviorial_data%>%
  filter(Participant.Private.ID %in% participant_agg$Participant.Private.ID &
           center_image %in% item_agg$center_image) 
           #image_incorrect == 0 & text_incorrect == 0)

behaviorial_data <-behaviorial_data%>%
  select(-c(text_incorrect,image_incorrect,response_button_text,pic_verification,target_obj,type))
