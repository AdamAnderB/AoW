## ----Experimental Data: Clean and Tidy----
#response for quadrant data
experimental_cleaned <- task_data%>%
  filter(Participant.Private.ID %in% 
           filtered_quest_data$Participant.Private.ID)%>%
  select(talker,verb_type,center_image,
         image_1,image_2,image_3,image_4,
         Participant.Private.ID,Spreadsheet.Row,Trial.Number,
         Zone.Type,object_start,Response)%>%
  filter(Zone.Type == "response_button_image"|
           Zone.Type == "response_button_text" &  image_4 != "")%>%
  filter(verb_type == "Restricting" |verb_type == "NonRestricting")

experimental_tidy<-experimental_cleaned%>%
  pivot_wider(names_from = Zone.Type,values_from = Response)%>%
  mutate(subject_img_file=center_image)
