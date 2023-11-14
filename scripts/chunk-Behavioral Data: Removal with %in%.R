## ----Behavioral Data: Removal with %in%----
#removal of remaining incorrect individual items
behavioral_data<-behavioral_data%>%
  filter(Participant.Private.ID %in% participant_agg$Participant.Private.ID &
           center_image %in% item_agg$center_image) 
           #image_incorrect == 0 & text_incorrect == 0)

behavioral_data <-behavioral_data%>%
  select(-c(text_incorrect,image_incorrect,response_button_text,
            pic_verification,target_obj,type))
